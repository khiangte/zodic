class WordsController < ApplicationController

  before_filter :authenticate_contributor!, :except => [:request_def, :get_contributor]

  def index
    @words = Word.find(:all, :order => 'word')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @words }
    end
  end

  def update
    @word = Word.find(params[:word][:id])

    respond_to do |format|
      if @word.update_attributes(params[:word])
        format.html { redirect_to(list_requests_path, :notice => 'Updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end

  def self_update
    @word = Word.find(params[:word][:id])

    respond_to do |format|
      if @word.update_attributes(params[:word])
        format.html { redirect_to(contribute_path, :notice => 'Updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end

  def save_review
    @word = Word.find(params[:word]["id"])
    @word.update_attributes(params[:word])
    @word.active = params[:active]
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
    @thumal.active = session[:user_profile]["admin"]
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

  def req_contribute
    @word = Word.find(params[:id])
  end

  def review
    @word = Word.find(params[:id])
  end

  def delete
    back_path = request.referer
    if @thumal = Word.find(params[:id])
      @thumal.destroy
    end
    respond_to do |format|
      format.html { redirect_to back_path}
      format.xml  { head :ok}
    end
  end

  def list_unapproved
    redirect_to root_path if !session[:user_profile]["admin"]
    @unapproved = Word.where("active = ?",false)
  end

  def requests_list
    @requests_list = Word.where("thumal = ?", "requested")
  end

  def request_def
    word = Word.new
    word[:word] = params[:key_word]
    word.thumal = "requested"
    word.meaning = "requested"
    if word.save
      render :json => {:success => true}
    else
      render :json => {:success => false}
    end
  end

  def get_contributor
    contributor = User.find_by_email(Word.find(params[:id])[:user])
    contributions = Word.where("user = ? and active = 1", contributor.nil? ? User.first : contributor[:email]).count
    render :json => {:success => true, :message => "<i><b>" + contributor.user_name + "</b>, " + contributions.to_s + " contributions.</i>"}
  end

  #export words to text file
  def export_mizo_english
    redirect_to root_path if !session[:user_profile]["admin"]
    file = File.new("public/mizoenglish.txt","w")
    words = Word.all
    words.each do |w|
      file.puts(w.word + " :: " + w.thumal + " :: " + w.pos.to_s + " :: " + w.meaning.to_s + " :: " + w.example.to_s + " :: " + w.user.to_s)
    end
    file.close

    render :json => {:success => true}
  end

  #export eng-mizo to  text file
  def export_english_mizo
    redirect_to root_path if !session[:user_profile]["admin"]
    file = File.new("public/englishmizo.txt","w")
    words = Mizoenglish.all
    words.each do |w|
      file.puts(w.word + " :: " + w.definition.to_s)
    end
    file.close
  end
end
