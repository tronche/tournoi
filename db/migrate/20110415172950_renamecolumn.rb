class Renamecolumn < ActiveRecord::Migration
  def self.up
    rename_column :statuses, :player_id, :inscription_id
  end

  def self.down
    rename_column :statuses, :inscription_id, :player_id
  end
end
