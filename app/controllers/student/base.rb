class Student::Base < ApplicationController
  
    before_action :login_required
    layout "student"
    helper_method :current_student

    private

      def current_student
        if session[:student_id]
          @current_student ||=
            StudentMember.find_by(id: session[:student_id])
        end
      end

      def login_required
        redirect_to student_login_path unless current_student
      end
  
end