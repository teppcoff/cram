class Parent::SessionsController < Parent::Base

    skip_before_action :login_required, only: [:new, :create]

    def new
    end

    def create
        @parent = ParentMember.find_by(email: session_params[:email])
        if @parent&.authenticate(session_params[:password])
            session[:parent_id] = @parent.id
            redirect_to parent_login_path(current_parent), notice: "ログインしました" #show
        else
            render "new" 
        end
    end

    private

        def session_params
            params.require(:session).permit(:email, :password)
        end

end