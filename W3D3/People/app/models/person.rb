class Person < ApplicationRecord
  validates :address, presence: true
end
