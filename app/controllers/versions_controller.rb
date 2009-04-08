class VersionsController < ApplicationController
  def create
    @version = Version.create(params[:version])
    @message = Message.create :text => "добавлена версия \"#{@version.title}\"", 
                              :vis => 'update', 
                              :player_id => @current_player.id, 
                              :crew_id => @current_player.crew_id

    add_message(@message)
    add_version(@version)
    head 200
  end
  
  def destroy
    @version = Version.find(params[:id]).destroy
    @message = Message.create :text => "удалена версия \"#{@version.title}\"", :vis => 'update', :player_id => @current_player.id, :crew_id => @current_player.crew_id
    
    add_message(@message)
    remove_version(@version)

    head 200
  end
  
  def destroy_all
    
  end
  
  def check
    @version = Version.find(params[:id])
    @version.update_attribute :status, 'checked'
    @message = Message.create :text => "проверена версия \"#{@version.title}\"", :vis => 'update', :player_id => @current_player.id, :crew_id => @current_player.crew_id
    
    add_message(@message)
    update_version(@version)

    head 200
  end
  
  def suggest
    @version = Version.find(params[:version_id])
    render :juggernaut => {:type => :send_to_channels, :channels => ["crew-#{params[:crew_id]}"]} do |page|      
        page.insert_html :top, 'messages', show_message(Message.new(:vis => 'alert', :text => "Вам предложено отправляться на версию \"#{@version.title}\" #{link_to_remote('Согласиться', :url => agree_version_path(@version), :method => :put)}"))
    end
    render :juggernaut => {:type => :send_to_channels, :channels => ["staff"]} do |page|      
        page.insert_html :top, 'messages', show_message(Message.new(:vis => 'alert', :text => "Экипажу предложено отправиться на версию"))
    end
    head 200
  end
  
  def agree
    @version = Version.find(params[:id])
    @current_player.crew.version = @version
    @current_player.crew.location = @version.title
    @current_player.crew.save
    @message = Message.create :text => "отправились на версию \"#{@version.title}\"", :vis => 'update', :player_id => @current_player.id, :crew_id => @current_player.crew_id
    update_crew(@current_player.crew)
    add_message(@message)
    head 200
  end
  
  def go
    @version = Version.find(params[:id])
    @current_player.crew.version = @version
    @current_player.crew.location = @version.title
    @current_player.crew.save
    @message = Message.create :text => "отправились на версию \"#{@version.title}\"", :vis => 'update', :player_id => @current_player.id, :crew_id => @current_player.crew_id
    update_crew(@current_player.crew)
    add_message(@message)
    head 200
  end
end
