# == Schema Information
# Schema version: 20110413181005
#
# Table name: groups
#
#  id         :integer         primary key
#  name       :string(255)
#  phase_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Groups < ActiveRecord::Base
belongs_to :phase
has_many :players, :through => :statuses
end
