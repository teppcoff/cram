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
        total_point = 0
        score_sheets.each { |sheet| total_point += sheet.total_point }
        ( total_point / score_sheets.count ).round(1)
    end

    def calculate_highest_total_point
        highest_total_point = 0
        score_sheets.each { |sheet| highest_total_point = sheet.total_point if sheet.total_point > highest_total_point }
        highest_total_point
    end

    def calculate_lowest_total_point
        lowest_total_point = 1000
        score_sheets.each { |sheet| lowest_total_point = sheet.total_point if sheet.total_point < lowest_total_point }
        lowest_total_point
    end

    def scores_list_of(subject)
        scores_list = Array.new
        score_sheets.each do |sheet|
            sheet.scores.each do |score|
                scores_list.push(score.point) if score.subject_id == subject
            end
        end
        scores_list
    end

    def calculate_average_point_of(subject)
        ( scores_list_of(subject).sum / (scores_list_of(subject).length) ).round(1)
    end

    def calculate_highest_point_of(subject)
        scores_list_of(subject).max
    end

    def calculate_lowest_point_of(subject)
        scores_list_of(subject).min
    end

    def subjects_of_examination
        subjects_list = Array.new
        score_sheets.each do |sheet|
            sheet.scores.each { |score| subjects_list << score.subject }
        end 
        subjects_list.uniq
    end

end