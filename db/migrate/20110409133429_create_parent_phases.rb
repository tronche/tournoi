class CreateParentPhases < ActiveRecord::Migration
  def self.up
    create_table "parent_phases", :force => true, :id => false do |t|
		t.column "parent_phase_id", :integer
		t.column "main_phase_id", :integer
		t.timestamps
    end
  end

  def self.down
    drop_table :parent_phases
  end
end
