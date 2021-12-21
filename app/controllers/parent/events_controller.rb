class Parent::EventsController < Parent::Base

    def index
      @events = current_parent.events
      @events = @events.page(params[:page]).per(5)
    end

    def show 
      @event = Event.find(params[:id])
    end

end
