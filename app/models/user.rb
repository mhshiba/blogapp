class User < ApplicationRecord
  validates :first_name, :last_name, :street, :city, :postcode, :country, presence: true

  has_many :posts

  def full_address
    "#{street} - #{city} - #{postcode} - #{country}"
  end
end
