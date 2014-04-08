class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :score
      t.references :user, index: true
      t.references :link, index: true

      t.timestamps
    end
  end
end
