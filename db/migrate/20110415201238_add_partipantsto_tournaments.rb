class AddPartipantstoTournaments < ActiveRecord::Migration
  def self.up
    add_column :tournaments, :participants, :integer
  end

  def self.down
  end
end