class Event < ApplicationRecord

    validates :title, presence: true
    validates :starts_at, presence: true
    validates :ends_at, presence: true

    enum event_type: { ordinary_type: 1, reservation_type: 2 }
    
    belongs_to :student_member, optional: true
    belongs_to :staff_member
    belongs_to :subject
    belongs_to :period
    has_one :parent_member, through: :student_member

    def duplicate
        copied_event_param = self.attributes

        if copied_event_param["repeat_count"] == 1 && self.save
            return "finish!"
        elsif copied_event_param["repeat_count"] > 1 && self.save
            copied_event_param["repeat_count"] -= 1
            copied_event_param["starts_at"] = custom_parse(copied_event_param["starts_at"])
            copied_event_param["ends_at"] = custom_parse(copied_event_param["ends_at"])
            create_next_event(copied_event_param)
        end
    end

    def create_next_event(copied_event_param)
        @event = Event.new(copied_event_param)
        @event.duplicate
    end

    def custom_parse(value)
        value.since(7.days)
    end

end
