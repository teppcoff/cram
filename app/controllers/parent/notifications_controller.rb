class Parent::NotificationsController < Parent::Base

    def index
        @notifications = current_parent.passive_notifications.page(params[:page]).per(10)
        @notifications.where(checked: false).each do |notification|
          notification.update(checked: true)
        end
    end

end
