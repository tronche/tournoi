class CreatePhases < ActiveRecord::Migration
  def self.up
    create_table :phases do |t|
      t.string :name, :status, :type
	  t.text :description
	  t.integer :participants, :qualifies, :pointsvict, :pointsnul
	  t.boolean :retour
	  t.references :tournaments

      t.timestamps
    end
   add_index :phases, :tournaments_id
  end

  def self.down
    drop_table :phases
  end
end
