class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #  after_create :welcome_send

         has_many :attendances, foreign_key: 'guest_id'
         has_many :events, foreign_key: 'admin_id'
         has_one :subscription, foreign_key: 'admin_id'

        #  validates :first_name,
        #    presence: true
        #  validates :last_name,
        #    presence: true
           
    #  def welcome_send
    #    UserMailer.welcome_email(self).deliver_now
    #  end      
end
