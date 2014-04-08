class CreateLinksUsers < ActiveRecord::Migration
  def change
    create_table :links_users do |t|
      t.references :link, :user
    end
  end
end
