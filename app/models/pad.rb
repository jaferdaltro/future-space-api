# frozen_string_literal: true

class Pad < ApplicationRecord
  belongs_to :launcher
  has_one :location, dependent: :destroy
end
