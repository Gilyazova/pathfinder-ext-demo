class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      #
      # Регион (КЛАДР)
      #
      t.string :region_id, :length => 12
      #
      # Город или район (КЛАДР)
      #
      t.string :city_id, :length => 12
      #
      # Населенный пункт (КЛАДР)
      #
      t.string :place_id, :length => 12
      #
      # Улица (КЛАДР)
      #
      t.string :street_id, :length => 12
      t.integer :house
      t.integer :building
      t.integer :flat
      #
      # Тип адреса
      #
      t.integer :type
      #
      # Источник
      #
      t.string :uri
      #
      # Дата создания
      #
      t.datetime :create_date
      #
      # Дата обновления
      #
      t.datetime :update_date

      t.timestamps
    end
  end
end
