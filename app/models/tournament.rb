class Tournament < ActiveRecord::Base
	has_many :phases, :dependent => :destroy

end
