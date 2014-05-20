class AboutController < ApplicationController
	def about_zodic
		@word_count = Word.where("active = ?", true).count
		@contributor_count = Word.count('user', :distinct => true)
		puts controller_name
	end

	def thlukna
	end 
end