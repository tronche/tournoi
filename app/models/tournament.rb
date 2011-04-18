# == Schema Information
# Schema version: 20110415201238
#
# Table name: tournaments
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  description  :text
#  game         :string(255)
#  support      :string(255)
#  conf         :string(255)
#  status       :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  participants :integer
#

class Tournament < ActiveRecord::Base
attr_accessible :name, :description, :game, :support, :conf, :participants, :status

has_many :phases, :dependent => :destroy
has_many :leagues, :dependent => :destroy
	
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
validates_numericality_of :participants, :only_integer => true

before_save :verify

#--- Etats


def set_inscription(etat)
  self.status = etat
end

def verify
  # si status est nil on le met a 0
  self.status||= "0"

  unless self.status > 1
	if self.plein? 
		set_inscription(1)
	else
		set_inscription(0)
	end
  end
end

def return_status
  # Quels Etats
   output = case status
   when 0 then 'Inscription Ouvertes'
   when 1 then 'Tournoi Plein, Reservistes'
   when 2 then 'Clos, Choix des equipes'
   when 2 then 'Tournoi Demarre'
   when 3 then 'Tournoi Clos'
   else 'Status Inconnu'
   end
   output   
end

# Le nombre de joueurs demandé est il requis ??
def plein?
	   self.inscriptions.count >= self.participants
end

# Le tournoi est il encore ouvert aux inscriptions ??
def open?
	   self.status < 2
end

# Est on en phase de choix des équipes ??
def choix?
	   self.status == 2
end

end