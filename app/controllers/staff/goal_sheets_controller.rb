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
        @search_params = goal_sheet_search_params
        @goal_sheets = if @search_params.nil? 
            current_staff.goal_sheets.page(params[:page]).per(10)
        else
            GoalSheet.search(@search_params).page(params[:page]).per(10)
        end
    end

    def show
        @goal_sheet = GoalSheet.find(params[:id])
        @student = StudentMember.find(@goal_sheet.student_member_id)
        @subjects = @student.subjects
    end

    def edit
        @goal_sheet = GoalSheet.find(params[:id])
    end

    def update
        @goal_sheet = GoalSheet.find(params[:id])
        if @goal_sheet.update(goal_sheet_params)
            redirect_to staff_goal_sheet_path(@goal_sheet.id), notice: "シートを更新しました"
        else
            render "edit"
        end
    end

    def destroy
        @goal_sheet = GoalSheet.find(params[:id])
        @goal_sheet.destroy
        redirect_to staff_goal_sheets_path, notice: "シートを削除しました"
    end

    private

        def goal_sheet_params
            params.require(:goal_sheet).permit(:name, :number_of_lessons, :description, :staff_member_id, :student_member_id)
        end

        def goal_sheet_search_params
            params.fetch(:search, {}).permit(:student_member_id)
        end

end
