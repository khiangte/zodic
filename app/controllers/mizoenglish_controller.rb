class MizoenglishController < ApplicationController
	def mizo_english
	end

	def search
		@found = Mizoenglish.where('word = ?', params[:key_word]) || []
  	render :json => {:found => @found}
  end

  def autocomplete
  	@suggest = Mizoenglish.select("word").where("word LIKE ?", "#{params[:key_word]}%").limit(15) || []
  	x=[]
  	@suggest.each { |f| x << f[:word] }
  	render :json => {:sugg => x.uniq}
  end
end
