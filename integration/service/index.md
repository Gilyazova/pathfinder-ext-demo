---
layout: index
title: Универсальный сервис
---

Ниже представлен набор запросов, поддерживаемый Универсальным сервисом. Для ознакомления с требуемым форматом ответа, получаемого от внешней системы, необходимо выбрать соответствующий запрос в таблице. 

| Запросы | Назначение |
|:--------|:-----------|
| [GET /persons]({{site.baseurl}}/integration/service/get_persons.html) | Получение списка физических лиц |
| [GET /persons/:id]({{site.baseurl}}/integration/service/get_person__id.html) | Получение данных физического лица по его id |
| GET /persons/person_id/identity_cards | Получение документов удостоверяющих личность (ДУЛ) соответствующего физического лица |
| GET /persons/person_id/identity_cards/identity_card_id/adresses | Получение информации по адресам, связанным с указанным ДУЛ identity_card_id соответствующего физического лица |
| GET /persons/person_id/identity_cards/identity_card_id/photos | Получение фотографий из соответствующего ДУЛ identity_card_id |
| GET /photos/photo_id | Получение фотографии по ее photo_id
