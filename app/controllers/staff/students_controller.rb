class Staff::StudentsController < Staff::Base

    def index
        @students = current_staff.student_members
    end

    def show
        @student = StudentMember.find(params[:id])
        @subjects = @student.subjects
    end

end
