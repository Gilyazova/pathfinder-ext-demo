class CreateIdentityCards < ActiveRecord::Migration
  def change
    create_table :identity_cards do |t|
      t.references :extended_by
      t.string :extended_by_type

      t.string :serie
      t.string :number

      t.datetime :issue_date
      t.string :issuer_code
      t.string  :issuer

      t.string :issue_place_code

      t.integer :type_id
      t.integer :reason_id
      t.integer :state_id

      t.datetime :loss_date
      t.datetime :start_date
      t.datetime :finish_date

      t.timestamps

      t.references :person
    end
  end
end
