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

class Group < ActiveRecord::Base
belongs_to :phase
has_many :seededs

has_many :inscriptions, :through => :seededs
has_many :qualifies, :through => :seededs,  :source => :inscription, :conditions => "fixture == 'Q'"

end
