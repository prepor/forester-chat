class CrewsController < ApplicationController
  
  def update_location
    @crew = Crew.find(params[:id])
    @crew.update_attribute :location, params[:location]
    @message = Message.create :text => "поменяли локацию на \"#{@crew.location}\"", :vis => 'update', :player_id => @current_player.id, :crew_id => @current_player.crew_id
    
    render :juggernaut do |page|
      page.replace_html "crew-#{@crew.id}", show_crew(@crew)
      page.insert_html :top, 'messages', show_message(@message)
    end
    head 200
  end
end
