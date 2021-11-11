class Staff::TextbooksController < Staff::Base

    def new
        @textbook = Textbook.new
    end

    def create
        @textbook = Textbook.new(textbook_params)
        if @textbook.save
            redirect_to staff_textbooks_path, notice: "テキストを登録しました"
        else
            render "new"
        end
    end

    def index
        @textbooks = Textbook.all.page(params[:page]).per(10)
    end

    private

        def textbook_params
            params.require(:textbook).permit(:name, :text_type, :subject_id)
        end

end