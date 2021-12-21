class Staff::StudentMembersController < Staff::Base

    def index
        @search_params = student_member_search_params
        @students = if @search_params.nil?
            current_staff.student_members.page(params[:page]).per(10)
        else
            @students = StudentMember.search(@search_params).page(params[:page]).per(10)
        end
    end

    def show
        @student = StudentMember.find(params[:id])
        @subjects = @student.subjects
    end

    private

        def student_member_search_params
            params.fetch(:search, {}).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :school_type)
        end

end
