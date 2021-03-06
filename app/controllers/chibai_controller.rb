class ChibaiController < ApplicationController
  def index
  end
  def search #search def
  	@found = Word.where('word = ? and active = 1', params[:key_word]) || []
  	render :json => {:found => @found}
  end

  def autocomplete
  	@suggest = Word.select("word").where("word LIKE ?", "#{params[:key_word]}%").limit(15) || []
  	x=[]
  	@suggest.each { |f| x << f[:word] }
  	render :json => {:sugg => x.uniq}
  end
end
