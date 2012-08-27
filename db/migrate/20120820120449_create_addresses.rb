class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :owner
      t.string :owner_type
      #
      # Регион (КЛАДР)
      #
      t.string :region_id, :length => 12
      #
      # Город или район (КЛАДР)
      #
      t.string :district_id, :length => 12
      #
      # Населенный пункт (КЛАДР)
      #
      t.string :city_id, :length => 12
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
      t.integer :type_id

      t.timestamps
    end

    add_index :addresses, :owner_id
    add_index :addresses, :owner_type
  end
end
