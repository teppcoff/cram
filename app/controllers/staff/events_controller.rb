class Staff::EventsController < Staff::Base

    def index
      @events = current_staff.events
    end

    def new
      @event = Event.new
    end

    def set_period
      # 時限を選択すると対応する開始・終了時刻が取得される
      period = Period.find(params[:period_id])
      @start_time = period.start_of_period.strftime("%H:%M")
      @end_time = period.end_of_period.strftime("%H:%M")
      @start_time = Date.today.strftime("%Y-%m-%d") + "T" + @start_time
      @end_time = Date.today.strftime("%Y-%m-%d") + "T" + @end_time
      respond_to do |format|
        format.js
      end
    end

    def create
      @event = Event.new(event_params)
      if @event.duplicate == "finish!"
        redirect_to staff_events_path, notice: "新たに予定を登録しました"
      else
        render "new"
      end
    end

    def show
      @event = Event.find(params[:id])
    end


    def edit
      @event = Event.find(params[:id])
    end

    def update
      @event = Event.find(params[:id])
      if @event.update(event_params)
          redirect_to staff_event_path(@event.id), notice: "予定を更新しました"
      else
          render "edit"
      end
    end

    def destroy
      @event = Event.find(params[:id])
      if @event.delete
        redirect_to staff_events_path, notice: "授業予定を削除しました"
      end
    end

    private

      def event_params
        params.require(:event).permit(:event_type, :title, :period_id, :starts_at, :ends_at,
        :staff_member_id, :student_member_id, :subject_id, :repeat_count)
      end

end
