class WordsController < ApplicationController
  def index
    @words = Word.find(:all, :order => 'word')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @words }
    end
  end

  def update
    @word = Word.find(params[:id])

    respond_to do |format|
      if @word.update_attributes(params[:word])
        format.html { redirect_to(@word, :notice => 'Word was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end

  def contribute
    @thumal = Word.new
    puts "init word"
  end

  def save
    @thumal = Word.new(params[:word])
    @thumal[:example].gsub! "\r\n","<br>"
    respond_to do |format|
      if @thumal.save
        format.html {redirect_to(contribute_path(:id => @thumal.id), :notice => 'Your contribution has been saved!')}
      else
        format.html {redirect_to(contribute_path, :alert => 'You must fill in the fields!')}
      end
    end
  end

  def view
    @thumal = Word.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @nothing = true
  end

  def change
    @word = Word.find(params[:id])
  end

  def delete
    if @thumal = Word.find(params[:id])
      @thumal.destroy
    end

    respond_to do |format|
      format.html { redirect_to(root_path)}
      format.xml  { head :ok}
    end
  end
end
