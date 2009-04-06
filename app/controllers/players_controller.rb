class PlayersController < ApplicationController
  before_filter :with_pass
  before_filter :with_player, :except => [:new, :create]
  def new
    @player = Player.new
    @staff = Player.new
    @staff.staff = true
  end
  def create
    if params[:crew][:title] != ''
      @crew = Crew.create(params[:crew])
      params[:player][:crew_id] = @crew.id
    end
    @player = Player.new(params[:player]) 
    @player.status = 1
    @player.save
    session[:player_id] = @player.id
    if params[:crew]
      add_crew(@player.crew)
    elsif !@player.staff
      update_crew(@player.crew)
    end
    redirect_to root_path
  end
  
  def destroy
    @player = Player.find(params[:id])
    @player.update_attribute(:status, 0)
    
    session[:player_id] = nil
    session[:passed] = nil
    unless @player.staff
      @player.crew.players.active.count > 0 ? nil : @player.crew.update_attribute(:status, 0)
      update_crew(@player.crew) if @player.crew.status == 1
    
      remove_crew(@player.crew) if @player.crew.status == 0
    end
    redirect_to root_path
  end
end
