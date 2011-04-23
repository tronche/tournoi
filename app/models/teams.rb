# == Schema Information
# Schema version: 20110422135540
#
# Table name: teams
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  stars      :decimal(2, 1)
#  logo       :string(255)
#  division   :string(255)
#  country    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Teams < ActiveRecord::Base
has_many :inscriptions
end
