FactoryGirl.define do
  factory :property do
    sequence(:address) { |number| "Property address #{number}" }
    unit_id '23'
    rent_amount '454'
    number_of_rooms '3'
    pet_friendly 'fale'
    occupied_or_not 'false'
    rent_deposit '500'
    begining_of_lease_date '12/32/2013'
    end_of_lease_date '12/33/2016'
    user
  end
end
