module ApplicationHelper
    include HtmlBuilder

    def unchecked_notifications
        @notifications = current_parent.passive_notifications.where(checked: false)
    end

    def time_to_datetime(date)
        Date.today.strftime("%Y-%m-%d") + "T" + date.strftime("%H:%M")
    end

end
