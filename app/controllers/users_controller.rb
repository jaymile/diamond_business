class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]
  
    def show
        @event = Event.all
      end
end
