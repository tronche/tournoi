class Changetypeofcolumn3 < ActiveRecord::Migration
  def self.up
  change_column :inscriptions, :status, :integer
  end

  def self.down
  end
end
