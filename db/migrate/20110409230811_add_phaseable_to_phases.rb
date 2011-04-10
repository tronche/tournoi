class AddPhaseableToPhases < ActiveRecord::Migration
  def self.up
    add_column :phases, :phaseable_id, :integer
	add_column :phases, :phaseable_type, :string
  end

  def self.down
  end
end
