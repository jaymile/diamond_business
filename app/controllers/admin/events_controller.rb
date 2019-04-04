class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  
  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Evenements modifié!"
      redirect_to admin_events_path
    else
      flash[:error] = "Quelque chose ne s'est pas passé comme prévu..."
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:primary] = "Cet utilisateur a bien été supprimé."
      redirect_to admin_events_path
      return
    else
    end
  end

  private

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :is_validate)
  end
end  

