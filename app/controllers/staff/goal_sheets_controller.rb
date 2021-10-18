class Staff::GoalSheetsController < Staff::Base

    def new
        @goal_sheet = GoalSheet.new
    end
    
    def create
        @goal_sheet = GoalSheet.new(goal_sheet_params)
        if @goal_sheet.save
            redirect_to staff_goal_sheets_path, notice: "登録しました"
        else
            render "new"
        end
    end

    def index
        @goal_sheets = current_staff.goal_sheets
    end

    def show
        @goal_sheet = GoalSheet.find(params[:id])
    end

    private

        def goal_sheet_params
            params.require(:goal_sheet).permit(:name, :number_of_lessons)
        end

end
