class Staff::Base < ApplicationController
  
    before_action :login_required
    layout "staff"
    helper_method :current_staff

    private

      def current_staff
        if session[:staff_id]
          @current_staff ||=
            StaffMember.find_by(id: session[:staff_id])
        end
      end

      def login_required
        redirect_to staff_login_path unless current_staff
      end

      def login_as_staff(staff)
        session[:staff_id] = staff.id
      end
  
end