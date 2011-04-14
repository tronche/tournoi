class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
	t.column "pseudo", :string
	t.column "status", :string
	t.column "tournament_id", :integer
	t.column "user_id", :integer
	t.column "team_id", :boolean
    t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end	
