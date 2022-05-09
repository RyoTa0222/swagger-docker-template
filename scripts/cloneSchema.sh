#!/bin/sh

SCHEMA_FILE_PATH=""

cp $SCHEMA_FILE_PATH ./apis/openapi.json

echo "\033[32m スキーマを更新しました \033[m"
echo コピー元ファイル： $SCHEMA_FILE_PATH
