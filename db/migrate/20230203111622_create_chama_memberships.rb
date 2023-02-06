class CreateChamaMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :chama_memberships, id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
      t.references :user, type: :uuid, foreign_key: {to_table: :users }
      t.references :chama, type: :uuid, foreign_key: {to_table: :chamas}
      t.timestamps
    end
  end
end
