class ParticipationController < ApplicationController
    def index 
        @participants = Attendance.where(event_id: params[:event_id])
        puts @participants
        @event = Event.find(params[:event_id])
      end
      
      def new
        @event = Event.new
        
        ##to display amount on page
        @amount = Event.find(params[:event_id]).price
      end

end
