# Swagger Docker 環境構築

## コマンド

### 起動

```bash
docker-compose up -d
```

### 停止

```bash
docker-compose down
```

## はじめに

openapi.json ファイルを apis フォルダ直下に配置します
パスが確定している場合には`scripts/cloneSchema.sh`ファイル内のパスを設定してください

```bash
SCHEMA_FILE_PATH=""
```

実行完了すると、以下の表示がされます

```shell
スキーマを更新しました
コピー元ファイル： /Users/r-matsumoto/work/coresafety/CoreSafety-REST/backend/core_safety/coresafety/schema/openapi.json
```

## 起動するもの一覧

docker-compose.yml に設定を記載しています
立ち上げに不必要なものがあればコメントアウトしてください

### mock server

```yml
services:
  swagger-api:
    image: stoplight/prism:3
    container_name: "swagger-api"
    ports:
      - "8080:4010"
    command: mock -h 0.0.0.0 /openapi.json
    volumes:
      - ./apis/openapi.json:/openapi.json
```

8000 番で起動します

### swagger editor

```yml
services:
  swagger-editor:
    image: swaggerapi/swagger-editor
    container_name: "swagger-editor"
    ports:
      - "8001:8080"
```

8001 番で起動します

### swagger ui

```yml
services:
  swagger-ui:
    image: swaggerapi/swagger-ui
    container_name: "swagger-ui"
    ports:
      - "8002:8080"
    volumes:
      - ./apis/openapi.json:/openapi.json
    environment:
      SWAGGER_JSON: /openapi.json
```

8002 番で起動します
