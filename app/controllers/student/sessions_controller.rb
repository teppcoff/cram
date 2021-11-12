class Student::SessionsController < Student::Base

    skip_before_action :login_required, only: [:new, :create]

    def new
    end

    def create
        @student = StudentMember.find_by(email: session_params[:email])
        if @student&.authenticate(session_params[:password])
            session[:student_id] = @student.id
            redirect_to student_root_path, notice: "ログインしました。ようこそ #{@student.full_name} さん!"
        else
            flash.now[:danger] = "メールアドレスまたはパスワードが正しくありません"
            render "new" 
        end
    end

    def destroy
        reset_session
        redirect_to student_login_path, notice: "ログアウトしました"
    end

    private

        def session_params
            params.require(:session).permit(:email, :password)
        end

end
