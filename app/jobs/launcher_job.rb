# frozen_string_literal: true

class LauncherJob < ApplicationJob
  include Sidekiq::Job
  queue_as :default

  def perform(*_args)
    LauncherSaving.new(200, 100).call
  end
end
