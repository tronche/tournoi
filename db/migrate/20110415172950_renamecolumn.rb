class Renamecolumn < ActiveRecord::Migration
  def self.up
     change_column :tournaments, :status, :integer
  end

  def self.down
  end
end
