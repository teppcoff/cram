class Parent::GoalSheetsController < Parent::Base

    def index
        @students = current_parent.student_members
    end

    def show
        @goal_sheet = GoalSheet.find(params[:id])
        @student = StudentMember.find(@goal_sheet.student_member_id)
        @subjects = @student.subjects
    end

end
