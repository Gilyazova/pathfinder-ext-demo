class CreateIdentityCards < ActiveRecord::Migration
  def change
    create_table :identity_cards do |t|
      t.references :extended_by
      t.string :extended_by_type

      t.timestamps

      t.references :person
    end
  end
end
