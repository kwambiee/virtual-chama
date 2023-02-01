class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end

