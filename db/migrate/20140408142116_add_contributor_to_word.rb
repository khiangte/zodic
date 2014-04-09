class AddContributorToWord < ActiveRecord::Migration
    def self.up
  	add_column :words, :user, :string
  	add_column :words, :active, :boolean, :default => false
  end

  def self.down
 	remove_column :words, :user
  	remove_column :words, :active
  end
end
