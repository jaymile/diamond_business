class Event < ApplicationRecord
  # has_one_attached :picture
  has_many :attendances, dependent: :delete_all
  belongs_to :admin, class_name: "User"

  # before_save :send_mail_validation, if: :will_save_change_to_is_validate?
  
  validates :duration, 
    presence: true,
    numericality: { greater_than_or_equal_to: 5 }

  validates :title,
    presence: true,
    length: { in: 5..140}
  validates :description,
    presence: true,
    length: { in: 20..1000}
  validates :price,
    presence: true,
    :inclusion => 1..1000
  validates :location,
    presence: true
  validate :start_date_cannot_be_in_the_past


  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if
      !start_date.blank? and start_date < Date.today
  end

  def send_mail_validation
      EventMailer.email_validation(self).deliver_now
  end
end
