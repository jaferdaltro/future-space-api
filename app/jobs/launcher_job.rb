class LauncherJob < ApplicationJob
  include Sidekiq::Job
  queue_as :default

  def perform(*args)
    LauncherSaving.new(200, 100).call
  end
end