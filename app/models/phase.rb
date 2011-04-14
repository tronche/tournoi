# == Schema Information
# Schema version: 20110413181005
#
# Table name: phases
#
#  id            :integer         primary key
#  name          :string(255)
#  status        :string(255)
#  type          :string(255)
#  description   :text
#  participants  :integer
#  qualifies     :integer
#  pointsvict    :integer
#  pointsnul     :integer
#  retour        :boolean
#  tournament_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Phase < ActiveRecord::Base
	attr_accessible :name,:status,:description,:participants,:qualifies,:parent_phase_ids
	has_and_belongs_to_many :parent_phases,:autosave => "true", :class_name => "Phase", :join_table => "parent_phases", :foreign_key => "main_phase_id", :association_foreign_key => "parent_phase_id"
	has_many :groups
	default_scope :order => 'phases.created_at DESC'
	
  def type_setter=(type_name)
    self[:type]=type_name
  end


end
