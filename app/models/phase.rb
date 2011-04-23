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

class Phase < ActiveRecord::Base
	attr_accessible :name,:description,:participants,:qualifies,:parent_phase_ids,:status
	has_and_belongs_to_many :parent_phases,:autosave => "true", :class_name => "Phase", :join_table => "parent_phases", :foreign_key => "main_phase_id", :association_foreign_key => "parent_phase_id"
	has_many :groups
	belongs_to :tournament
	default_scope :order => 'phases.created_at DESC'


validates :name, :presence => true,
				  :length   => { :maximum => 20 }
validates :description, :presence => true,
				  :length   => { :maximum => 30 }				   
validates_numericality_of :participants, :only_integer => true
validates_numericality_of :qualifies, :only_integer => true

validate :validate_number

before_create :initiate

#-- Scopes
scope :encours, :conditions => {:status => 1}

def initiate
self.status=0
end

def validate_number
  errors.add(:qualifies, "doit etre inferieur ou egal au nombre de participants") if qualifies > participants 
end


def canstart?
	# Status ??
	errors[:base] << "Phase deja démarree " if self.status >=1
	# Status ??
	errors[:base] << "Tournoi pas demarre " if ! tournament.run?
	# Verification que toutes les phases parentes sont terminées ou si y en a pas
	errors[:base] << "Phase parente pas terminée .." if parent_phases.count > 0 and parent_phases.encours.count > 0
	# Verification  qu'il y a assez de participants pending par rapport a ce qui est requis
	####A CHANGER a terme
    errors[:base] << "Pas assez de participants pour remplir cette phase #{self.my_seededs.count}" if participants > self.my_seededs.count

	errors.empty?
end

def start!
	#clean , suppression des groupes s'il y en a déja
	clean!
	
	#Appel aux méthodes Filles
	create_groups  
	
	# Finalement sauvegarde du status
	self.status=1
	self.save
end

def clean!
	groups.destroy_all
end

def my_seededs
		# on prends tous les qualifiés des phases parentes
		if parent_phases.any?
		collection_pending =[]
			parent_phases.each do |phase|
					phase.groups.each do |group|
						# on recupere directement les qualifies du group a travers une condition en through OU PAS
						collection_pending+= group.qualifies
					end
			end

		else
		# Si pas de phase parente = nil on prends les titulaires
			collection_pending = self.tournament.inscriptions.titulaires
		end		
		
		return collection_pending
	end
	
end
