class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
	t.column "name", :string
	t.column "email", :string
	t.column "image", :string
	t.column "encrypted_password", :string
	t.column "salt", :string
	t.column "admin", :boolean
     t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end	
