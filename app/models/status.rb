# == Schema Information
# Schema version: 20110415201238
#
# Table name: statuses
#
#  id             :integer         not null, primary key
#  inscription_id :integer
#  group_id       :integer
#  status         :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Status < ActiveRecord::Base
belongs_to :group
belongs_to :player
end
