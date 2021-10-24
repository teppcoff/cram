class Student::GoalSheetsController < Student::Base

    def index
        @goal_sheets = current_student.goal_sheets.page(params[:page]).per(10)
    end

    def show
        @goal_sheet = GoalSheet.find(params[:id])
        @student = StudentMember.find(@goal_sheet.student_member_id)
        @subjects = @student.subjects
    end

end
