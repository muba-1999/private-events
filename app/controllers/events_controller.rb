class EventsController < ApplicationController
    def index
        @events = Event.all.order("created_at DESC")
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :date, :location)
    end
end
