class Headband < ApplicationRecord
  belongs_to :category
  has_many :cart_headbands
end
