class Parent::EventsController < Parent::Base

  def index
    @students = current_parent.student_members
    @events = Array.new
    @students.each do |student|
      @events.push(student.events)
      @events.flatten!
    end
  end

  def show 
    @event = Event.find(params[:id])
  end

end
