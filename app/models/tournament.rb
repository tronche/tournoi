class Tournament < ActiveRecord::Base
	has_many :phases, :dependent => :destroy
	has_many :leagues, :dependent => :destroy
end
