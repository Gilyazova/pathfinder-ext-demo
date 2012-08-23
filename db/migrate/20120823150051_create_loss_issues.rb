class CreateLossIssues < ActiveRecord::Migration
  def change
    create_table :loss_issues do |t|
      t.references :identity_card
      
      t.datetime :loss_date
      t.datetime :issue_date
      t.string :region_id
      t.string :loss_info
      t.string :issuer

      t.timestamps
    end
  end
end
