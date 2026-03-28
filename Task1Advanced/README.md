# Задание 1. Модульная инфраструктура для нескольких сред

## Модуль создает:
- Загрузочный диск из образа ubuntu 22.04 LTS
- VM YandexCloud
- Сетевой интерфейс
- NAT для внешнего доступа

## Входные параметры
- disk_name - имя загрузочного диска
- disk_type - тип диска
- disk_size - размер диска (Gb)
- vm_name - имя виртуальной машины
- zone - зона размещения
- cores - количество ядер
- memory - RAM (Gb)
- subnet_id - ID подсети
- nat - флаг для внешнего IP
- ssh_user - имя пользователя SSH
- ssh_user - публичный ключ SSH

## Выходы
- instance_id - ID созданной виртуальной машины
- instance_name - Имя виртуальной машины
- disk_id - ID подключённого диска (если создан)
- internal_ip_address - внутренний IP

## Пример запуска для dev
``` bash
cd Task1Advanced/envs/dev
terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```