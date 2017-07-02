class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_headbands, :dependent => :destroy
  has_one :order
end
