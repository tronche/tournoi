class Changeuneconnerie < ActiveRecord::Migration
    def self.up
        rename_column :seededs, :status, :fixture
    end 
    def self.down
        rename_column :seededs, :fixture, :status
    end
 end
