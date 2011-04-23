# == Schema Information
# Schema version: 20110422135540
#
# Table name: tournaments
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  description  :text
#  game         :string(255)
#  support      :string(255)
#  conf         :string(255)
#  status       :integer(255)
#  created_at   :datetime
#  updated_at   :datetime
#  participants :integer
#

class Tournament < ActiveRecord::Base
attr_accessible :name, :description, :game, :support, :conf, :participants, :status

has_many :phases, :dependent => :destroy

has_many :inscriptions, :dependent => :destroy

has_many :users, :through => :inscriptions

validates :name, :presence => true,
				  :length   => { :maximum => 20 }
validates :description, :presence => true,
				  :length   => { :maximum => 30 }				   
validates_inclusion_of :game, :in => ['FIFA11','PES2011'],
				  :message   => 'Valeurs Possible : FIFA11 ou PES2011'
validates_inclusion_of :support, :in => ['xbox360','PS3'],
				  :message   => 'Valeurs Possible : xbox360 ou PS3'
validates_inclusion_of :conf, :in => ['FUMA','SEMA','AUTO'],
				  :message   => 'Valeurs Possible : FUMA, SEMA, AUTO'
validates_numericality_of :participants, :only_integer => true, :greater_than => 1

before_save :verify

#--- Etats
def return_status
  # Quels Etats
   output = case status
   when 0 then 'Inscription Ouvertes'
   when 1 then 'Tournoi Plein, Reservistes'
   when 2 then 'Clos, Choix des equipes'
   when 3 then 'Tournoi Demarre'
   when 4 then 'Tournoi Clos'
   else 'Status Inconnu'
   end
   output   
end

#-- Verifier les etats et le workflow
def verify
  # si status est nil on le met a 0
  self.status||= "0"

  unless self.status > 1
	if self.plein? 
		self.status=1
	else
		self.status=0
	end
  end
end

# Mettre a jour le status
def upstatus(etat)
  self.status = etat
  
  if status == 3
	if ! canstart? 
		return false
	end
  end

  self.save
  return true
end

# On démarre le tournoi pour de bon
def canstart?
	# Verification si pas déja demarré
    errors[:base] << "Tournoi deja demarre " if self.run?
	# Verification tous les joueurs ont une équipe
	errors[:base] << "Au moins 1 participant n'a pas d equipe " if self.inscriptions.titulaires.find(:all, :conditions => { :team_id => nil}).count > 0
	# Verification si autant d inscrit que de participants requis 
	errors[:base] << "Il faut #{participants} participants  " if self.inscriptions.titulaires.count != participants
   # Verification si au moins 1 phase
    errors[:base] << "Pas d etapes de definie " if self.phases.count < 1
	
	errors.empty?
end

# Le nombre de joueurs demandé est il requis ??
def plein?
	   self.inscriptions.count >= self.participants
end

# Le tournoi est il encore ouvert aux inscriptions ??
def open?
	   self.status < 2
end

# Le tournoi est il démarré
def run?
	   self.status == 3
end

# Est on en phase de choix des équipes ??
def choix?
	   self.status == 2
end

end
