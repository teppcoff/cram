class Staff::ExaminationsController < Staff::Base
    
    def show
        @examination = Examination.find(params[:id])
        @subjects = @examination.subjects_of_examination
        @total_average_point = @examination.calculate_total_average
        @highest_total_point = @examination.calculate_highest_total_point
        @lowest_total_point = @examination.calculate_lowest_total_point
    end

end
