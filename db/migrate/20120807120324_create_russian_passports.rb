class CreateRussianPassports < ActiveRecord::Migration
  def change
    create_table :russian_passports do |t|
      t.string :first_name, :length => 256
      t.string :last_name, :length => 256
      t.string :middle_name, :length => 256
      t.datetime :birth_date
      t.string :birth_place_code
      t.integer :sex_id
      t.timestamps
    end
  end
end
