class Subscription < ApplicationRecord
    after_create :welcome_attendee_send

  validates :guest_id,
    presence: true
  validates :stripe_customer_id,
    presence: true

  belongs_to :guest, class_name: "User"

  def welcome_attendee_send
      AttendanceMailer.welcome_attendee(self).deliver_now
  end
end
