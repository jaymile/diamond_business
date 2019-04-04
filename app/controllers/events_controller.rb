class EventsController < ApplicationController
    before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

    def index
        @events = Event.all
    end

    def new
        @Event.new
    end

    def show
        @event = Event.find(params[:id])   
        @attendances = Attendance.all
    end
    
      def edit
        @event = Event.find(params[:id])
      end

      def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
          flash[:success] = "Ton événement a bien été modifié !"
          redirect_to event_path(@event.id)
        else
          render :edit 
        end
    end

    def create
        @event = Event.new(
        start_date: params[:start_date], 
        title: params[:title],
        description: params[:description],
        duration: params[:duration],
        price: params[:price],
        location: params[:location],
        admin_id: current_user.id)
        @event.picture.attach(params[:picture])
        puts @event.price.class
        puts @event.duration.class
        if @event.save
          flash[:success] = "Event créé ! "
          redirect_to event_path(@event.id)
        else
        end
    end
    
      def destroy
        @event = Event.find(params[:id])
        if @event.destroy
          flash[:primary] = "Ton événement a bien été supprimé."
          redirect_to root_path
          return
        else
        end
      end
    
      private
    
      def event_params
        params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :picture)
      end
    
end

