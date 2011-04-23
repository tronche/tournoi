# == Schema Information
# Schema version: 20110415201238
#
# Table name: seededs
#
#  id             :integer         not null, primary key
#  inscription_id :integer
#  group_id       :integer
#  status         :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Seeded < ActiveRecord::Base
belongs_to :group
belongs_to :inscription
end
