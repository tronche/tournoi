# == Schema Information
# Schema version: 20110413181005
#
# Table name: players
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

class Player < ActiveRecord::Base
belongs_to :tournament
has_many :groups, :through => :statuses
belongs_to :user
end
