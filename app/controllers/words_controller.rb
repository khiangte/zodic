class WordsController < ApplicationController

  before_filter :authenticate_contributor!

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
        format.html { redirect_to(approve_path, :notice => 'Approved.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end

  def save_review
    @word = Word.find(params[:word]["id"])
    @word.active = params[:word]["active"]
    respond_to do |format|
      if @word.save
        format.html { redirect_to(approve_path, :notice => 'Approved.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end

  def contribute
    
  end

  def save
    @thumal = Word.new(params[:word])
    @thumal[:example].gsub! "\r\n","<br>"
    @thumal.active = false if @thumal.active.nil?
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
  def review
    @word = Word.find(params[:id])
  end

  def delete
    if @thumal = Word.find(params[:id])
      @thumal.destroy
    end
    respond_to do |format|
      format.html { redirect_to approve_path}
      format.xml  { head :ok}
    end
  end

  def list_unapproved
    redirect_to root_path if !session[:user_profile]["admin"]
    @unapproved = Word.where("active = ?",false)
  end
end
