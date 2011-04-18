class Teams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
	t.column "name", :string
	t.column "stars", :decimal, :precision => 2, :scale => 1 
	t.column "logo", :string
	t.column "division", :string
	t.column "country", :string
     t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end	

