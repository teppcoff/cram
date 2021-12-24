module ApplicationHelper
    include HtmlBuilder

    def unchecked_notifications
        @notifications = current_parent.passive_notifications.where(checked: false)
    end
end
