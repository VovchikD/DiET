# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ''
      t.string :password_digest,    null: false, default: ''
      t.string :auth_token
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end
    add_index :users, :email,                unique: true
    add_index :users, :auth_token,           unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
