# frozen_string_literal: true

class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    enable_extension "citext"

    add_column :users, :username, :citext, null: false, size: 35

    add_index :users, :username, unique: true
  end
end
