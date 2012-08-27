class CreatePersonRelations < ActiveRecord::Migration
  def change
    create_table :person_relations do |t|
      t.integer :type_id
      t.references :person
      t.references :children

      t.timestamps
    end
  end
end
