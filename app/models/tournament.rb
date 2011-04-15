# == Schema Information
# Schema version: 20110415201238
#
# Table name: tournaments
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  description  :text
#  game         :string(255)
#  support      :string(255)
#  conf         :string(255)
#  status       :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  participants :integer
#

class Tournament < ActiveRecord::Base
attr_accessible :name, :description, :game, :support, :conf, :participants

has_many :phases, :dependent => :destroy
has_many :leagues, :dependent => :destroy
	
has_many :inscriptions, :dependent => :destroy
has_many :users, :through => :inscriptions

validates :name, :presence => true,
				  :length   => { :maximum => 20 }
validates :description, :presence => true,
				  :length   => { :maximum => 30 }				   
validates_inclusion_of :game, :in => ['FIFA11','PES2011'],
				  :message   => 'Valeurs Possible : FIFA11 ou PES2011'
validates_inclusion_of :support, :in => ['xbox360','PS3'],
				  :message   => 'Valeurs Possible : xbox360 ou PS3'
validates_inclusion_of :conf, :in => ['FUMA','SEMA','AUTO'],
				  :message   => 'Valeurs Possible : FUMA, SEMA, AUTO'
validates_numericality_of :participants, :only_integer => true

before_create :set_status

end

def set_status
  self.status = "Inscriptions Ouvertes"
end