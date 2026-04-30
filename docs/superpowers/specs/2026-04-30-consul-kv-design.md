# Consul KV 服務整合設計

## 概述

在現有的 `docker-compose-php` 本地開發環境中新增 Consul KV 服務，用於集中式設定管理。PHP 應用程式（Laravel）在 controller 內透過 HTTP API 即時讀取 KV，並自行決定是否寫入 Cache。

## 架構

### 選用方案

**方案 A：單節點 Consul + 官方 image**

- 使用 `hashicorp/consul:1.19` 官方 image
- Server 模式，單節點 bootstrap
- 開啟 Web UI（port `8500`）
- 資料持久化至本機 volume
- 初始 KV 資料從本地 JSON 檔透過 HTTP API 匯入

### 新增目錄結構

```
docker-compose-php/
└── consul/
    ├── config/
    │   └── consul.json        # Consul server 設定檔
    ├── data/                  # 持久化資料目錄（不納入 git）
    ├── kv-init.json           # 初始 KV 資料（納入 git）
    └── init.sh                # 啟動後匯入 KV 的初始化腳本
```

## 元件說明

### docker-compose.yml 新增服務

```yaml
consul:
    image: hashicorp/consul:1.19
    container_name: consul
    ports:
        - "8500:8500"      # Web UI & HTTP API
        - "8600:8600/udp"  # DNS
    volumes:
        - ./consul/config:/consul/config:ro
        - ./consul/data:/consul/data
    command: >
        consul agent -server -bootstrap-expect=1
        -ui -client=0.0.0.0
        -config-dir=/consul/config
        -data-dir=/consul/data
    networks:
        - default
```

### consul/config/consul.json

Consul server 基本設定，包含 datacenter 名稱與日誌等級。

### consul/kv-init.json

以 JSON 陣列儲存初始 KV 資料，格式如下：

```json
[
  { "key": "APP/ENV",          "value": "local" },
  { "key": "APP/DEBUG",        "value": "true" },
  { "key": "FEATURE/NEW_UI",   "value": "false" }
]
```

key 命名規則：`<NAMESPACE>/<SETTING_NAME>`，使用大寫蛇式（UPPER_SNAKE_CASE）。

### consul/init.sh

Shell script，等待 Consul HTTP API 健康後，逐筆讀取 `kv-init.json` 並呼叫 `PUT /v1/kv/<key>` 寫入。可重複執行（冪等），適合重置開發資料。

## 資料流

```
init.sh
  └─ 等待 Consul 健康
  └─ 讀取 kv-init.json
  └─ HTTP PUT /v1/kv/<key> × N

Laravel Controller
  └─ HTTP GET http://consul:8500/v1/kv/<key>?raw
  └─ (可選) Cache::remember('consul.<key>', $ttl, fn)
```

## 連線資訊

| 項目 | 值 |
|------|----|
| 容器內 API 位址 | `http://consul:8500` |
| 宿主機 Web UI | `http://localhost:8500/ui` |
| KV 讀取端點 | `GET /v1/kv/<key>?raw` |
| KV 寫入端點 | `PUT /v1/kv/<key>` |

## 持久化策略

- `./consul/data/` 掛載為 Docker volume，容器重啟後資料保留
- `./consul/data/` 加入 `.gitignore`，不納入版本控制
- `kv-init.json` 納入 git，作為初始設定的單一來源

## 測試計畫

| 測試項目 | 方式 |
|----------|------|
| Consul 服務正常啟動 | `docker-compose up consul` 後檢查 log |
| Web UI 可存取 | 瀏覽器開啟 `http://localhost:8500/ui` |
| 初始 KV 匯入成功 | 執行 `init.sh` 後在 UI 確認 key 存在 |
| 容器重啟後資料保留 | `docker-compose restart consul` 後查詢 KV |
| Laravel 讀取 KV | Controller 呼叫 API 並回傳正確值 |
| 重複執行 init.sh 冪等 | 執行兩次 `init.sh`，資料不重複、不報錯 |
