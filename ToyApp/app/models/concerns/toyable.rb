module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy_name(name)
    toy = Toy.find_or_create_by(name: name)
    toy.toyable = self
    toy.save
  end
end