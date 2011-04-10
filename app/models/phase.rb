class Phase < ActiveRecord::Base
	attr_accessible :name,:status,:description,:participants,:qualifies,:parent_phase_ids
	has_and_belongs_to_many :parent_phases,:autosave => "true", :class_name => "Phase", :join_table => "parent_phases", :foreign_key => "main_phase_id", :association_foreign_key => "parent_phase_id"
	
	default_scope :order => 'phases.created_at DESC'
	
  def type_setter=(type_name)
    self[:type]=type_name
  end


end
