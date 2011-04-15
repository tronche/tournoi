class RenameTablePlayers < ActiveRecord::Migration
    def self.up
        rename_table :players, :inscriptions
    end 
    def self.down
        rename_table :players, :inscriptions
    end
 end
