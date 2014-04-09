class RenameColumnPasswordToPasswordDigest < ActiveRecord::Migration
  def change
    rename_column :users, :password, :password_digest
    remove_column :users, :password_confirmation
  end
end
