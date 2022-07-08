class Rocket < ApplicationRecord
  belongs_to :launcher
  has_one :configuration

end
