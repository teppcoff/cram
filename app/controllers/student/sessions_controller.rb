class Student::SessionsController < Student::Base

    skip_before_action :login_required, only: [:new, :create]

    def new
    end

    def create
        @student = StudentMember.find_by(family_name_kana: session_params[:family_name_kana], given_name_kana: session_params[:given_name_kana])
        if @student&.authenticate(session_params[:password])
            session[:student_id] = @student.id
            redirect_to student_root_path, notice: "ログインしました"
        else
            render "new" 
        end
    end

    def destroy
        reset_session
        redirect_to student_login_path, notice: "ログアウトしました"
    end

    private

        def session_params
            params.require(:session).permit(:family_name_kana, :given_name_kana, :password)
        end

end
