class Student::EventsController < Student::Base

    def index
      @events = current_student.events
    end

    def show 
      @event = Event.find(params[:id])
    end

end
