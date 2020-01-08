class CreateAuthenticationTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :authentication_tokens do |t|
      t.string :body
      t.string :ip_address
      t.string :user_agent
      t.integer :device_type
      t.string :device_token
      t.datetime :last_used_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
