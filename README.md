## Общее описание выполненных задач в рамках checkpoint 5

Работа была выполнена на основании checkpoint 2, где еще не были внедрены 
celery, flower-celery, nginx и redis.
Были созданы все необходимые для работы сервиса сущности.
Организованы роуминги внутри кластера через ClasterIP.
Организованы роуминги для внешнего подключения к контейнеру кластера через контролер nginx и ingress.
Организовано общее хранилище PVC для нескольких контейнеров.
Проброшена веб-камера ноутбука в кластер.

## Запуск проекта

Для запуска и сборки проекта прошу выполните:

```bash
make all
```

В случае сбоя, а он может быть (проблемы с сетью), прошу повторно запустить обозначенную команду и сборка продолжится с того места, где
оборвалась в прошлый раз. Если долго грузится, перезапустите - все проблемы от домашней сети.
Прошу заметить, что если весь Makefile выполнен успешно, то при повторном запуске команды
сборка начнется заново. Рекомендуется перед повторной сборкой выполнить:

```bash
minikube delete
```

После чего необходимо перезапустить терминал.

## Результат

В результате выполнения кода на странице по адресу http://backend.info/video_feed/ будет видно изображение с видеокамеры, а
по адресу http://backend.info/video_demo/ увидите плеер, но видео воспроизводится не будет, так как на checkpoint2 оно еще не
было прокинуто.

## Возможные ситуации

Есть один шаг, что выполнялся в документации, но все работало без него. Прошу выполнить, если туннель не будет создан автоматически:

```bash
kubectl get ingress
```

Прошу вставить IP, полученное с прошлой команды в следующую (192.168.49.2 - показано для примера):

```bash
echo "192.168.49.2 backend.info" | sudo tee -a /etc/hosts
```

Возможно потребуется прокидывание minikube тунеля:
```bash
minikube tunnel    
```