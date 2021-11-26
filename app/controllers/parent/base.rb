class Parent::Base < ApplicationController

    before_action :login_required
    layout "parent"
    helper_method :current_parent

    private

      def current_parent
        if session[:parent_id]
          @current_parent ||=
            ParentMember.find_by(id: session[:parent_id])
        end
      end

      def login_required
        redirect_to parent_login_path unless current_parent
      end
  
end
