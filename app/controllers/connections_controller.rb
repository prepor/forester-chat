class ConnectionsController < ApplicationController
  def create
    @player = Player.find(params[:client_id])
    @player.update_attribute :status, 1
    unless @player.staff
      @player.crew.players.active.count > 0 ? nil : @player.crew.update_attribute(:status, 1)
    end
    head 200
  end
  
  def destroy
    @player = Player.find(params[:client_id])
    @player.update_attribute :status, 0
    unless @player.staff
      @player.crew.players.active.count > 0 ? nil : @player.crew.update_attribute(:status, 0)
    end
    head 200
  end
  
end
