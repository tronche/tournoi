class Changecolumndemerde < ActiveRecord::Migration
  def self.up
  change_column :phases, :status, :integer
  end

  def self.down
  end
end
