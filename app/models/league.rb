class League < Phase
	attr_accessible :pointsvict,:pointsnul,:retour
	belongs_to :tournament

end