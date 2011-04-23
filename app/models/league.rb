# == Schema Information
# Schema version: 20110422135540
#
# Table name: phases
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  status        :integer(255)
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
	validates_numericality_of :pointsvict, :only_integer => true
	validates_numericality_of :pointsnul, :only_integer => true
	validates_inclusion_of :retour, :in => [true, false] 

	#On crée des groupes
	def create_groups
		# Creation du group
		league_group=groups.create(:name => "Championnat unique")
	 
		# On repartis les gens s'il y en a ( logiquement oui )
		if my_seededs.any?
			my_seededs.each do |toseed|
				league_group.inscriptions << toseed
			end
		else
		#nobody ..
		end
	 
	end

end
