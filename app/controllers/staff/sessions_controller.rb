class Staff::SessionsController < Staff::Base

    skip_before_action :login_required, only: [:new, :create]

    def new
    end

    def create
        @staff = StaffMember.find_by(email: session_params[:email])
        if @staff&.authenticate(session_params[:password])
            session[:staff_id] = @staff.id
            redirect_to staff_root_path, notice: "ログインしました。ようこそ #{@staff.full_name} さん!"
        else
            flash.now[:danger] = "メールアドレスまたはパスワードが正しくありません"
            render "new" 
        end
    end

    def destroy
        reset_session
        redirect_to staff_login_path, notice: "ログアウトしました"
    end

    private

        def session_params
            params.require(:session).permit(:email, :password)
        end

end