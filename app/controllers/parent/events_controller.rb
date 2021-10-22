class Parent::EventsController < Parent::Base

  def index
    @students = current_parent.student_members
    @students.each do |s|
      @events = s.events
    end
  end

  def show 
    @event = Event.find(params[:id])
  end

end
