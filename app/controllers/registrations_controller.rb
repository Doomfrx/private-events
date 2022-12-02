class RegistrationsController < ApplicationController

    before_action :set_event

    def index
        @event = Event.find(params[:event_id])
        @registrations = @event.registrations
    end

    def new 
        @event = Event.find(params[:event_id])
        @registration = @event.registrations.new
    end

    def create 
        @registration = @event.registrations.new(registration_params)
        @registration.user = current_user

        if @registration.save
            redirect_to event_registrations_url(@event),
             notice: "Thanks for attending"
        else
            render :new
        end
    end

    def destroy
        @registration = current_user.registrations.find(params[:id])
        @registration.destroy
        redirect_to edit_user_registration_path, notice: "Cancelled"
    end

    private
        def registration_params
            params.require(:registration).permit(:how_heard)
        end

        def set_event
            @event = Event.find(params[:event_id])
        end
end
