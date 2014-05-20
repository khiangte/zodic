# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Mizoenglish.delete_all

File.open("jf.def", "r").each_line do |line| 
	word = Mizoenglish.new
	temp = line.split(" : ")
	word.word = temp[0]
	word.definition = temp[1].strip
	word.save
end
