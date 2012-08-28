class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :owner
      t.string :owner_type
      t.references :person

      t.string :description

      t.timestamps
    end
  end
end
