class AddStatusToChamaMemberships < ActiveRecord::Migration[7.0]
  def change
    add_column :chama_memberships, :status, :integer, default: 0
  end
end
