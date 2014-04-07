class Word < ActiveRecord::Base
	validates :word, :thumal, :meaning, :presence => true
	
end
