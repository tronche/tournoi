class Changeuntruc < ActiveRecord::Migration
  def self.up
  change_column :inscriptions, :team_id, :integer
  end

  def self.down
  end
end
