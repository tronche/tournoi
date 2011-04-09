class CreateLienPhases < ActiveRecord::Migration
  def self.up
    create_table :lienphases do |t|
		t.column "father_phase_id", :integer
		t.column "actual_phase_id", :integer
		t.timestamps
    end
  end

  def self.down
    drop_table :lienphases
  end
end
