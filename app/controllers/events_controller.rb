class EventsController < ApplicationController
    before_action :set_event, only: [ :show, :edit, :update, :destroy ]
    before_action :authenticate_user!, except: [:index]

    def index
        @events = Event.all.order("created_at DESC")
    end

    def show
    end

    def new
        @event = current_user.created_events.build
    end

    def create
        @event = current_user.created_events.build(event_params)

        if @event.save
            redirect_to root_path, notice: "Event was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        if @event.update(@event)
            redirect_to event_url(@event), notice: "Event was successfully updated."
        else
            render :edit, status: :unprocessable_entity 
        end
    end

    def destroy
        @event.destroy
        redirect_to events_url, notice: "Event was successfully destroyed."
    end

    private

    def set_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :description, :date, :location)
    end
end
