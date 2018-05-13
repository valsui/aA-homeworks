# == Schema Information
#
# Table name: corgis
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Corgi < ApplicationRecord
  validates :name, presence:true
  #
  # has_many :toys, as: :toyable
  include Toyable
end
