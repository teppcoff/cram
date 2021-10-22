class Staff::EventsController < Staff::Base

  def index
    @events = current_staff.events
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to staff_events_path, notice: "新たに予定を登録しました"
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.delete
      redirect_to staff_events_path, notice: "授業予定を削除しました"
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :starts_at, :ends_at, :staff_member_id, :student_member_id)
    end

end
