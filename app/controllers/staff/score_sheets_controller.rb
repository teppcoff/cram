class Staff::ScoreSheetsController < Staff::Base

    def index
        @search_params = score_sheet_search_params
        @score_sheets = if score_sheet_search_params.nil?
            current_staff.score_sheets.page(params[:page]).per(10)
        else
            ScoreSheet.search(@search_params).page(params[:page]).per(10)
        end
    end

    def show
        @score_sheet = ScoreSheet.find(params[:id])
        @scores = @score_sheet.scores
    end

    private

        def score_sheet_search_params
            params.fetch(:search, {}).permit(:student_member_id)
        end

end
