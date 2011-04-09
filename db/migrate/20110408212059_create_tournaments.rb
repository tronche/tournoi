class CreateTournaments < ActiveRecord::Migration
  def self.up
    create_table :tournaments do |t|
		t.string :name
		t.text :description
		t.string :game
		t.string :support
		t.string :conf
		t.string :status

		t.timestamps
    end
  end

  def self.down
    drop_table :tournaments
  end
end
