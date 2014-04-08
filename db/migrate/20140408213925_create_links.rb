class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link_url
      t.string :title
      t.integer :tally

      t.timestamps
    end
  end
end
