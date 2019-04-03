class Attendance < ApplicationRecord
    after_create :welcome_attendee_send

    validates :guest_id,
      presence: true
    validates :event_id,
      presence: true
    validates :stripe_customer_id,
      presence: true
      
    belongs_to :event
    belongs_to :guest, class_name: "User"
    
    def welcom_attendee_send
        AttendanceMailer.welcom_attendee(self).deliver_now
    end
end
