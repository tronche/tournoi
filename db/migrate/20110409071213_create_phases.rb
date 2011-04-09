class CreatePhases < ActiveRecord::Migration
  def self.up
    create_table :phases do |t|
      t.string :name, :status
	  t.text :description
	  t.integer :participants, :qualifies
	  t.references :tournaments

      t.timestamps
    end
   add_index :phases, :tournaments_id
  end

  def self.down
    drop_table :phases
  end
end
