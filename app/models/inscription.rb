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
attr_accessible :tournament_id

belongs_to :tournament
belongs_to :user

has_many :groups, :through => :statuses

validates :user_id, :presence => true
validates :tournament_id, :presence => true



end
