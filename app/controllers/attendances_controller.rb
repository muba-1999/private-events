class AttendancesController < ApplicationController

    def new
        @event = Event.find(params[:id])
    end

    def create
        @event = Event.find(params[:id])
        @event.attendees << current_user
        flash[:notice] = "Registration was successfull"
        redirect_to root_path
    end

    def destroy
        @event = Event.find(params[:id])
        @event.attendees.delete(current_user)
        flash[:notice] = "you have cancelled your registration"
        redirect_to root_path
    end
end
