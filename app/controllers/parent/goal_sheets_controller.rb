class Parent::GoalSheetsController < Parent::Base

    def index
        students = current_parent.student_members
        goal_sheets = Array.new
        students.each { |student| goal_sheets.push(student.goal_sheets) }
        goal_sheets.flatten! 
        @goal_sheets = Kaminari.paginate_array(goal_sheets).page(params[:page]).per(10)
    end

    def show
        @goal_sheet = GoalSheet.find(params[:id])
        @student = StudentMember.find(@goal_sheet.student_member_id)
        @subjects = @student.subjects
    end

end
