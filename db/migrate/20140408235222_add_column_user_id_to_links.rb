class AddColumnUserIdToLinks < ActiveRecord::Migration
  def change
    add_column :links, :user_id, references: :user
  end
end