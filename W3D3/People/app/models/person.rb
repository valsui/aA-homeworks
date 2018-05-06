class Person < ApplicationRecord
  validates :name, presence: true

  belongs_to :residents,
  primary_key: :id,
  foreign_key: :house_id,
  class_name: :House
  optional: true
end
