class Staff::DailySheetsController < Staff::Base

    def index
        @search_params = daily_sheet_search_params
        @daily_sheets = if @search_params.nil? 
            current_staff.daily_sheets.page(params[:page]).per(10)
        else
            DailySheet.search(@search_params).page(params[:page]).per(10)
        end
    end

    def new
        @daily_sheet = DailySheet.new
    end
    
    def create
        @daily_sheet = DailySheet.new(daily_sheet_params)
        if @daily_sheet.save
            redirect_to staff_daily_sheets_path, notice: "登録しました"
            @daily_sheet.create_notification_daily_sheet!(current_staff)
            # シートが新規作成されると通知が作成される
        else
            render "new"
        end
    end
    
    def show
        @daily_sheet = DailySheet.find(params[:id])
    end

    def edit
        @daily_sheet = DailySheet.find(params[:id])
    end

    def update
        @daily_sheet = DailySheet.find(params[:id])
        if @daily_sheet.update(daily_sheet_params)
            redirect_to staff_daily_sheet_path(@daily_sheet.id), notice: "シートを更新しました"
        else
            render "edit"
        end
    end

    def destroy
        @daily_sheet = DailySheet.find(params[:id])
        @daily_sheet.destroy
        redirect_to staff_daily_sheets_path, notice: "シートを削除しました"
    end

    private

        def daily_sheet_params
            params.require(:daily_sheet).permit(:study_date, :period, :message, :information, :participation, :student_member_id, :staff_member_id, :subject_id, :textbook_id)
        end

        def daily_sheet_search_params
            params.fetch(:search, {}).permit(:student_member_id)
        end
        
end
