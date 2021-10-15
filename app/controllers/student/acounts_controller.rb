class Student::AcountsController < Student::Base

    skip_before_action :login_required, only: [:new, :create]

    def new
        @student = StudentMember.new
    end
    
    def create
        @student = StudentMember.new(student_params)
        if @student.save
            redirect_to student_login_path, notice: "登録しました"
            #そのままログインする
        else
            render "new", notice: "登録に失敗しました"
        end
    end

    private

        def student_params
            params.require(:student_member).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :gender, :birthday,
            :school_type, :school_year, { subject_ids: [] }, :password, :password_confirmation)
        end

end
