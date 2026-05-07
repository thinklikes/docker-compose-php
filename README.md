# docker-compose-php
```docker compose up -d web mysql redis```
## Consul KV 初始化 (Consul KV Initialization)

您可以透過以下方式匯入位面配置 (Realms Configuration)：

1. 將 `.env` 格式的配置檔案放入 `realms/` 目錄（例如 `realms/dev.env`）。
2. 執行以下指令將內容匯入至 Consul：

```bash
docker exec -i consul consul kv put DB/DEV - < realms/dev.env
```

> **Note**: `realms/` 目錄已加入 `.gitignore`，不會被提交至 Git 倉庫。
