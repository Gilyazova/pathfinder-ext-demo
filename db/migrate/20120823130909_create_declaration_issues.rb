class CreateDeclarationIssues < ActiveRecord::Migration
  def change
    create_table :declaration_issues do |t|
      t.references :identity_card
      #
      # Предъявленный документ
      #
      t.references :source_identity_card

      t.string :number
      #
      # Дата
      #
      t.datetime :date
      #
      # Дата приема документов
      #
      t.datetime :document_receive_date

      t.timestamps
    end

    add_index :declaration_issues, :identity_card_id
  end
end
