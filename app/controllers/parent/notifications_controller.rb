class Parent::NotificationsController < Parent::Base

    def index
        @notifications = current_parent.passive_notifications
        @notifications.where(checked: false).each do |notification|
          notification.update(checked: true)
        end
      end

end
