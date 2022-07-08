class Launcher < ApplicationRecord
  has_one :launch_service_provider
  has_one :rocket
  has_one :pad
  enum status: { draft: 1, trash: 2, published: 3 }
end
