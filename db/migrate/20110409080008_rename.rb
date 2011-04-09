class Rename < ActiveRecord::Migration
  def self.up
  change_table :phases do |t|
	 t.rename :tournaments_id, :tournament_id
end
  end

  def self.down
  end
end
