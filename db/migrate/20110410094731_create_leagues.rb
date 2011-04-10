class CreateLeagues < ActiveRecord::Migration
  def self.up
    create_table :leagues do |t|
	t.column "pointsvict", :integer
	t.column "pointsnul", :integer
	t.column "retour", :boolean
     t.timestamps
    end
  end

  def self.down
    drop_table :leagues
  end
end	
