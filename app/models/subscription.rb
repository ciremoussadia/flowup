class Subscription < ApplicationRecord
  validates_presence_of(
    :name,
    :address,
    :age,
    :tel,
    :email
  )

end 
