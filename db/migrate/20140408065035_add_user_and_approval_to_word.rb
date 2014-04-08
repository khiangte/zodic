class AddUserAndApprovalToWord < ActiveRecord::Migration
  def self.up
  	add_column :words, :user, :integer
  	add_column :words, :active, :boolean, :default => false
  end

  def self.down
 	remove_column :words, :user
  	remove_column :wirds, :active
  end
end
