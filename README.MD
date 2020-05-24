Требования
Должно быть установленно ПО
- ansible
- terraform
- terraform-inventory

ключ id_rsa для доступа к дроплетам

Генерируем api_key на стороне digital-ocean и помещаем его в terraform.tfvars
Генерируем ssh_fingeprint из открытого ключа

ssh-keygen -E md5 -lf ~/.ssh/id_rsa.pub | awk '{print $2}'

Должно получиться такого вида

"61:af:d3:ca:20:2e:37:44:c3:c2:86:ce:0f:3e:86:c7"


Инициализируем  terraform

terraform init

Запускаем terraform apple -auto-approve

В результате у нас будет создано 2 дроплета, к одному из них подключен внешний волюм

Запускаем ansible
ansible-play -i inv playbook.yaml
В итоге у нас будет настроено 2 дроплета
На одному приложение tcg, на втором mysql
