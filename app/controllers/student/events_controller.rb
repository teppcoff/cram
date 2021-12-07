class Student::EventsController < Student::Base

    def index
      @events = Event.where(student_member_id: current_student.id).or(Event.where(student_member_id: nil))
    end

    def show 
      @event = Event.find(params[:id])
    end

    # 生徒が後から予約するタイプ(予約型)のeventのためのメソッド
    # eventのstudent_member_idのみ編集できるようになっている
    def edit
      @event = Event.find(params[:id])
    end

    def update
      @event = Event.find(params[:id])
      if @event.update(event_params)
          redirect_to student_event_path(@event.id), notice: "予定を完了しました"
      else
          render "edit"
      end
    end

    private

      def event_params
        params.require(:event).permit(:student_member_id)
      end

end
