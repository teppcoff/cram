class Staff::AcountsController < Staff::Base

    skip_before_action :login_required, only: [:new, :create]

        def new
            @staff = StaffMember.new
        end
        
        def create
            @staff = StaffMember.new(staff_params)
            if @staff.save
                redirect_to staff_login_path, notice: "登録しました"
                #そのままログインする
            else
                render "new"
            end
        end
    
        private
    
            def staff_params
                params.require(:staff_member).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :gender, :birthday,
                :email, :employment_status, :password, :password_confirmation)
            end
    
end
