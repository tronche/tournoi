class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
	t.column "player_id", :integer
	t.column "group_id", :integer
	t.column "status", :string

      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end	
