class Parent::EventsController < Parent::Base

    def index
      # ページネーションのために子供のイベントを配列に入れている(他に良い方法が見つからなかった)
      students = current_parent.student_members
      events = Array.new
      students.each { |student| events.push(student.events) }
      events.flatten! 
      @events = Kaminari.paginate_array(events).page(params[:page]).per(10)
    end

    def show 
      @event = Event.find(params[:id])
    end

end
