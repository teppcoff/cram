class Parent::DailySheetsController < Parent::Base

    def index
        # 未読のデイリーシートの通知を取得
        # 通知はお知らせ一覧ページのトップで確認可能
        notifications = current_parent.passive_notifications
        notifications.each { |n| n.update(checked: true) }
        @daily_sheets = current_parent.daily_sheets
        @daily_sheets = @daily_sheets.page(params[:page]).per(5)
    end
    
    def show
        @daily_sheet = DailySheet.find(params[:id])
    end

end
