class Student::AcountsController < Student::Base

    skip_before_action :login_required, only: [:new, :set_school, :create]

    def new
        @student = StudentMember.new
    end
    
    def set_school
        # 学校を選択すると対応する学年1(小・中・高)が取得される
        school = School.find(params[:school_id])
        respond_to do |format|
          format.json { render json: { school_type: school.school_type } }
        end
    end

    def create
        student = StudentMember.new(student_params)
        if student.save
            login_as_student(student)
            redirect_to student_root_path, notice: "ようこそ、#{student.full_name}さん!"
        else
            render "new"
        end
    end

    def show
        @student = StudentMember.find(params[:id])
        @subjects = @student.subjects
    end

    def edit
        @student = StudentMember.find(params[:id])
    end

    def update
        @student = StudentMember.find(params[:id])
        if @student.update(student_params)
            redirect_to student_path(current_student.id), notice: "ユーザー情報を更新しました"
        else
            render "edit"
        end
    end

    def destroy
        @student = StudentMember.find(params[:id])
        @student.destroy
        redirect_to student_login_path, notice: "ユーザーを削除しました"
    end

    private

        def student_params
            params.require(:student_member).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :gender, :birthday,
            :school_id, :school_type, :school_year, { subject_ids: [] }, :email, :staff_member_id, :parent_member_id, :password, :password_confirmation)
        end

end
