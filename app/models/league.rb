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

class League < Phase
	attr_accessible :pointsvict,:pointsnul,:retour
	belongs_to :tournament
	
	validates_numericality_of :pointsvict, :only_integer => true
	validates_numericality_of :pointsnul, :only_integer => true
	validates_inclusion_of :retour, :in => [true, false] 
end
