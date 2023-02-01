class CreateChamas < ActiveRecord::Migration[7.0]
  def change
    create_table :chamas, id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
      t.string :name
      t.string :reg_no
      t.string :logo_url
      t.string :username
      t.integer :status, default: 0
      t.references :user, type: :uuid, foreign_key: {to_table: :users }

      t.timestamps
    end
  end
end
