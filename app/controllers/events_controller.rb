class EventsController < ApplicationController

    before_action :authenticate_user!

    def index
        case params[:filter]
        when "past"
          @events = Event.past
        when "upcoming"
          @events = Event.upcoming
        else
            @events = Event.all
        end
    end

    def show
        @event = Event.find(params[:id])
    end
    
    def new     
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        @event.user_id = current_user.id
        if @event.save
            redirect_to root_path, notice: "Event Added"
        else
            render :new
        end
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
          redirect_to @event, notice: "Event successfully updated!"
        else
          render :edit
        end
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        redirect_to root_path, notice: "Event successfully deleted"
    end

    private
        def event_params
            params.require(:event).permit(:name, :date, :location, :description, :user_id)
        end
end
