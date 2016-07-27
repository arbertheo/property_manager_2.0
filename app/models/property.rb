class Property < ActiveRecord::Base
  belongs_to :user
  has_many :notes

    validates :address, presence: true
    validates :unit_id, presence: true
    validates :rent_amount, presence: true
    validates :number_of_rooms, presence: true
    validates :pet_friendly,inclusion: { in: [true, false] }
    validates :occupied_or_not, inclusion: { in: [true, false] }
    validates :rent_deposit, presence: true
    validates :begining_of_lease_date, presence: true
    validates :end_of_lease_date,presence: true

end
