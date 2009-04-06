class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])
    @message.player_id = @current_player.id
    @message.crew_id = @current_player.crew_id
    @message.save
    render :juggernaut do |page|
      page.insert_html :top, 'messages', show_message(@message)
    end
    head 200
  end
  
end
