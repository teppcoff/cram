class Staff::GoalSheetsController < Staff::Base

    def new
        @goal_sheet = GoalSheet.new
    end
    
    def create
        @goal_sheet = GoalSheet.new(goal_sheet_params)
        if @goal_sheet.save
            redirect_to staff_goal_sheets_path, notice: "登録しました"
            @goal_sheet.create_notification_goal_sheet!(current_staff)
        else
            render "new"
        end
    end

    def index
        @goal_sheets = current_staff.goal_sheets
    end

    def show
        @goal_sheet = GoalSheet.find(params[:id])
        @student = StudentMember.find(@goal_sheet.student_member_id)
        @subjects = @student.subjects
    end

    private

        def goal_sheet_params
            params.require(:goal_sheet).permit(:name, :number_of_lessons, :description, :staff_member_id, :student_member_id)
        end

end
