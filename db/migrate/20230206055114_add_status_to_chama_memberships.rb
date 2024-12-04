class AddStatusToChamaMemberships < ActiveRecord::Migration[7.0]
  def change
    add_column :chama_memberships, :status, :integer, default: 0
    add_index :chama_memberships, [:user_id, :chama_id], unique: true
  end
end
