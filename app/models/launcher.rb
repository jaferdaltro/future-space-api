# frozen_string_literal: true

class Launcher < ApplicationRecord
  include NameSearchable
  include Paginatable

  has_one :launch_service_provider, dependent: :destroy
  has_one :launcher_status, dependent: :destroy
  has_one :rocket, dependent: :destroy
  has_one :pad, dependent: :destroy
  has_one :mission, dependent: :destroy
  enum status: { draft: 1, trash: 2, published: 3 }
end
