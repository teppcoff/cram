class Examination < ApplicationRecord

    validates :name, presence: true, length: { maximum: 20 }
    validates :academic_year, presence: true, numericality: { greater_than: 2000, less_than: 2100 }
    belongs_to :school
    has_many :score_sheets

    def perfect_score
        subjects_of_examination.count * 100
    end

    def number_of_takers
        score_sheets.count
    end

    def calculate_average_total_point
        summed_total_point = 0
        score_sheets.each { |sheet| summed_total_point += sheet.total_point }
        ( summed_total_point / score_sheets.count ).round(1)
    end

    def calculate_highest_total_point
        highest_total_point = 0
        score_sheets.each { |sheet| highest_total_point = sheet.total_point if sheet.total_point > highest_total_point }
        highest_total_point
    end

    def calculate_lowest_total_point
        lowest_total_point = 500
        score_sheets.each { |sheet| lowest_total_point = sheet.total_point if sheet.total_point < lowest_total_point }
        lowest_total_point
    end

    def calculate_average_point_of(subject)
        ( points_of(subject).sum / ( points_of(subject).length ) ).round(1)
    end

    def calculate_highest_point_of(subject)
        points_of(subject).max
    end

    def calculate_lowest_point_of(subject)
        points_of(subject).min
    end

    def points_of(subject)
        points_list = Array.new
        score_sheets.each do |sheet| 
            points_list << sheet.point_of(subject)
        end
        points_list
    end

    def subjects_of_examination
        subjects_list = Array.new
        score_sheets.each do |sheet|
            sheet.scores.each { |score| subjects_list << score.subject }
        end 
        subjects_list.uniq
    end

end
