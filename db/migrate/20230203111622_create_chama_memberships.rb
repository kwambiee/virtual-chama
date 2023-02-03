class CreateChamaMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :chama_memberships do |t|
      t.belongs_to :chama
      t.belongs_to :user
      t.timestamps
    end
  end
end
