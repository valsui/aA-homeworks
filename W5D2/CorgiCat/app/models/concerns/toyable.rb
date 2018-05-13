module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    #name is the name of the toy
    self.toys.find_or_create_by(name: name)
  end
end
