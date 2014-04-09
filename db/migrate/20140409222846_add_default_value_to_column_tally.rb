class AddDefaultValueToColumnTally < ActiveRecord::Migration
  def change
    change_column :links, :tally, :integer, :default => 0
  end
end
