# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :load_player
  helper_method :staff?
  # protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  def load_player
    if session[:player_id]
      begin
        @current_player = Player.find(session[:player_id])
      rescue
        session[:player_id] = nil
        session[:passed] = nil
        redirect_to root_path
      end
    end      
  end
  
  def staff?
    @current_player.staff
  end
  
  def with_pass
    redirect_to enter_chat_path unless session[:passed]
  end
  
  def with_player
    redirect_to new_player_path unless session[:player_id]
  end
  
  def add_message(message)
    render :juggernaut do |page|
      page.insert_html :top, 'messages', show_message(message)
    end
  end
  
  def update_crew(crew)
    render :juggernaut do |page|
      page.replace "crew-#{crew.id}", show_crew(crew)
      page.replace "crews-selector-#{crew.id}", "<option id=\"crews-selector-#{crew.id}\" value=\"#{crew.id}\">#{crew.title}</option>"
    end
  end
  
  def add_crew(crew)
    render :juggernaut do |page|
      page.insert_html :top, "crews", show_crew(crew)
      page.insert_html :top, "crews-selector", "<option id=\"crews-selector-#{crew.id}\" value=\"#{crew.id}\">#{crew.title}</option>"
    end
  end
  
  def remove_crew(crew)
    render :juggernaut do |page|
      page.remove "crew-#{crew.id}"
      page.remove "crews-selector-#{crew.id}"
    end
  end
  
  def update_version(version)
    render :juggernaut do |page|
      page.replace "version-#{version.id}", show_version(version)
      page.replace "versions-selector-#{version.id}", "<option id=\"versions-selector-#{version.id}\" value=\"#{version.id}\">#{version.title}</option>"
    end
  end
  
  def add_version(version)
    render :juggernaut do |page|
      page.insert_html :top, 'versions', show_version(version)
      page.insert_html :top, 'versions-selector', "<option id=\"versions-selector-#{version.id}\" value=\"#{version.id}\">#{version.title}</option>"
    end
  end
  
  def remove_version(version)
    render :juggernaut do |page|
      page.remove "version-#{version.id}"   
      page.remove "versions-selector-#{version.id}"  
    end
  end
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
