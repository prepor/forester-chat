class ChatController < ApplicationController
  before_filter :with_pass, :except => [:enter, :pass]
  before_filter :with_player, :except => [:enter, :pass]
  def index
    @messages = Message.find(:all, :limit => 50, :order => 'created_at DESC')
    @message = Message.new
    @crews = Crew.find(:all, :conditions => {:status => 1})

    @versions = Version.find(:all, :conditions => {:status => ['active', 'checked']})
  end
  
  def enter
    
  end
  
  def pass
    if params[:password] == ChatPass
      session[:passed] = true
      redirect_to root_path
    else
      flash[:error] = 'Неправильный пароль'
      session[:passed] = false
      redirect_to enter_chat_path
    end
  end
  

end
