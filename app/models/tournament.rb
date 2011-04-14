# == Schema Information
# Schema version: 20110413181005
#
# Table name: tournaments
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  game        :string(255)
#  support     :string(255)
#  conf        :string(255)
#  status      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Tournament < ActiveRecord::Base
	has_many :phases, :dependent => :destroy
	has_many :players, :dependent => :destroy
	has_many :leagues, :dependent => :destroy
end
