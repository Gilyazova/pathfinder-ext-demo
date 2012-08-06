class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name, :length => 256
      t.string :last_name, :length => 256
      t.string :middle_name, :length => 256
      t.integer :nationality
      t.timestamps
    end
  end
end
