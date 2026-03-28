# Задание 2. Интеграция с CI/CD и удалённым хранением состояния

## Backend
Все параметры задаются через terraform init для того чтобы не хранить секреты в коде

```bash
terraform init -input=false \
            -backend-config="bucket=${STATE_BUCKET}" \
            -backend-config="key=task2/${{ inputs.environment }}/terraform.tfstate" \
            -backend-config="region=${STATE_REGION}" \
            -backend-config="endpoint=${STATE_ENDPOINT}" \
            -backend-config="access_key=${STATE_ACCESS_KEY_ID}" \
            -backend-config="secret_key=${STATE_SECRET_ACCESS_KEY}" \
            -backend-config="use_path_style=true" \
            -backend-config="skip_region_validation=true" \
            -backend-config="skip_credentials_validation=true" \
            -backend-config="skip_requesting_account_id=true"
```

## CI/CD
[CI/CD](../.github/workflows/terraform.yaml)

Созданы dev/stage/prod Environments. В каждом 6 секретов:
- STATE_ACCESS_KEY
- STATE_BUCKET
- STATE_ENDPOINT
- STATE_REGION
- STATE_SECRET_KEY
- YC_TOKEN

### При pull_request и push выполняются следуюшие команды:
- Настройка backend с использованием секретов GitHub
- terraform validate
- terraform plan -no-color -var="yc_token=${YC_TOKEN}" -var-file=${{ matrix.env }}.tfvars
### Ручной запуск
- Запуск через workflow_dispatch
- Выбирается окружение dev/stage/prod
