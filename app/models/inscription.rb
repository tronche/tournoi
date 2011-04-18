# == Schema Information
# Schema version: 20110415201238
#
# Table name: inscriptions
#
#  id            :integer         not null, primary key
#  pseudo        :string(255)
#  status        :string(255)
#  tournament_id :integer
#  user_id       :integer
#  team_id       :boolean
#  created_at    :datetime
#  updated_at    :datetime
#

class Inscription < ActiveRecord::Base
attr_accessible :tournament_id, :team_id

belongs_to :tournament
belongs_to :user
belongs_to :team

has_many :groups, :through => :statuses

validates :user_id, :presence => true
validates :tournament_id, :presence => true

before_create :set_status_user
after_create :set_status_tournoi
after_destroy :set_status_tournoi

#--- Etats 

def set_status_user
  if tournament.plein?
	self.status = 1
  else
	self.status = 0
  end
end

def set_status_tournoi
  tournament.verify
  tournament.save!  
end

end
