# == Schema Information
# Schema version: 20110422135540
#
# Table name: inscriptions
#
#  id            :integer         not null, primary key
#  pseudo        :string(255)
#  status        :integer(255)
#  tournament_id :integer
#  user_id       :integer
#  team_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Inscription < ActiveRecord::Base
attr_accessible :tournament_id, :team_id

belongs_to :tournament
belongs_to :user
belongs_to :team

has_many :seededs
has_many :groups, :through => :seededs

before_create :set_status_user
after_create :set_status_tournoi
after_destroy :set_status_tournoi

validates :user_id, :presence => true
validates :tournament_id, :presence => true

scope :titulaires, :conditions => {:status=>1}

#--- Etats 

def return_status
  # Quels Etats
   output = case status
   when 0 then 'Reserviste'
   when 1 then 'Titulaire'
   when 3 then 'En jeu ..'
   else 'Status Inconnu'
   end
   output   
end

def set_status_user
  if tournament.plein?
	self.status = 0
  else
	self.status = 1
  end
end

def set_status_tournoi
  tournament.verify
  tournament.save!  
end

end
