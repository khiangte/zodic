class Word < ActiveRecord::Base
	validates :word, :thumal, :meaning, :presence => true
	validates_uniqueness_of :word, :scope => :meaning
end
