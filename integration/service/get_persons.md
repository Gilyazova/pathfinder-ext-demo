---
layout: index
title: GET /persons
---

## Список параметров запроса
| Параметр | Обязательность | Наименование | Описание формата данных |
|:---------|:---------------|:-------------|:------------------------|
| basic[first_name] | Нет | Имя физ.лица | |
| basic[last_name] | Нет | Фамилия физ.лица | |
| basic[middle_name] | Нет | Отчество физ.лица | |
| basic[birth_date] | Нет | Дата рождения | |
| basic[birth_date_since] | Нет | Дата рождения с | |
| basic[birth_date_to] | Нет | Дата рождения по | |

## Пример запроса (поиск физических лиц по фамилии)

`GET https://ex_system/persons.xml?basic[last_name]=%D0%98%D0%B2%D0%B0%D0%BD%D0%BE%B2`

## Структура ответа

{% highlight xml %}
<?xml version="1.0"?>
<persons>
    <pages>
        <current_page>…</current_page>
        <total_pages>…</total_pages>
         <total_objects>…</total_objects>
     </pages>
  <person>
      <id>…</id>
  </person>
  <person>
    <id>…</id>
  </person>
</persons>
{% endhighlight %}

Параметры ответа:
Параметр
Обязательность
Описание
Описание формата данных
<current_page>
Да
Текущая страница

<total_pages>
Да
Общее количество страниц

<total_objects>
Да
Количество найденных лиц

<id>
Нет
Идентификатор лица

