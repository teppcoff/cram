class Parent::ScoreSheetsController < Parent::Base

    def index
        score_sheets = current_parent.score_sheets
        @score_sheets = score_sheets.page(params[:page]).per(7)
    end

    def show
        @score_sheet = ScoreSheet.find(params[:id])
        @scores = @score_sheet.scores
    end

end
