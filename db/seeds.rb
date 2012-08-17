# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

RANDOM_SEED = 1234567
PERSON_COUNT = 23
PASSPORT_NUMBER = 7000
PASSPORT_SERIE = 900000

def create_person(i, rnd)
  first_names = ['Иван', 'Михаил', 'Виниамин', 'Георгий', 'Тихон', 'Петр', 'Василий', 'Роман', 'Евгений']
  last_names = ['Иванов', 'Сидоров', 'Петров', 'Емельянов', 'Фрунзе', 'Толстов', 'Яковлев', 'Романов', 'Фролов']
  middle_names = ['Иванович', 'Михайлович', 'Виниаминович', 'Георгиевич', 'Тихонович', 'Петрович', 'Васильевич', 'Романович', 'Евгеньевич']

  first_name = first_names[rnd.rand(first_names.size)]#.sample(random: rnd)#
  last_name = last_names[rnd.rand(last_names.size)]#.sample(rnd)#
  middle_name = middle_names[rnd.rand(middle_names.size)]#middle_names.sample(rnd)#
  birth_date = DateTime.new(rnd.rand(1950..1996), rnd.rand(11) + 1, rnd.rand(27) + 1)
  place_code = '770000000000'

  person = Person.create
  passport = RussianPassport.new(first_name: first_name,
      last_name: last_name,
      middle_name: middle_name,
      birth_date: birth_date,
      sex_id: 1,
      birth_place_code: place_code)

  passport.build_identity_card(person: person,
    number: (PASSPORT_NUMBER + 1).to_s,
    serie: (PASSPORT_SERIE + 1).to_s,
    type_id: 1,
    issue_date: DateTime.new(2001, 5, 11),
    issuer_code: '12345',
    issuer: 'Организация выдающая паспорта РФ',
    issue_place_code: place_code,
    reason_id: 2,
    state_id: 1,
    start_date: DateTime.new(2001, 5, 15)
  )

  passport.save

  f_passport = ForeignPassport.new(first_name: first_name,
    last_name: last_name,
    middle_name: middle_name,
    first_name_latin: I18n.transliterate(first_name),
    last_name_latin: I18n.transliterate(last_name),
    birth_date: birth_date,
    birth_place_code: place_code
  )

  f_passport.build_identity_card(person: person,
    number: (PASSPORT_NUMBER + 1).to_s,
    serie: (PASSPORT_SERIE + 1).to_s,
    type_id: 2,
    issue_date: DateTime.new(2011, 5, 11),
    issuer_code: '12345',
    issuer: 'Организация выдающая заграничные паспорта РФ',
    issue_place_code: place_code,
    reason_id: 2,
    state_id: 1,
    start_date: DateTime.new(20011, 5, 15)
  )
  f_passport.save
end

I18n.locale = :ru
rnd = Random.new(RANDOM_SEED)
PERSON_COUNT.times { |i| create_person(i, rnd) }

