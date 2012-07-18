class AutorizationGrant < ActiveRecord::Migration
  def change
    create_table OAuth::AuthorizationGrant.table_name do |t|
      t.string :code, :length => 1024, :null => false
      t.string :granted_for, :length => 10240, :null => false
      t.boolean :used, :default => false, :null => false
      t.timestamps
    end

    add_index OAuth::AuthorizationGrant.table_name, :code, :unique => true
  end
end
