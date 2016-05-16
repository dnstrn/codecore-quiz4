class Company < ActiveRecord::Base
  has_many :products, dependent: :nullify

  validates :name, presence: true

end
