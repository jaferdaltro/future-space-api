# frozen_string_literal: true

json.launchers do
  json.deep_format_keys!
  json.array! @loading_service.records do |launcher|
    json.call(launcher, :_id, :id, :url, :launch_library_id, :slug, :name, :net, :window_end, :window_start, :inhold,
              :tbdtime, :tbddate, :probability, :holdreason, :failreason, :hashtag, :webcast_live, :image, :infographic,
              :program, :status)
    json.launcher_status launcher.launcher_status
    json.launch_service_provider launcher.launch_service_provider
    json.rocket launcher.rocket
    json.mission launcher.mission
    json.pad launcher.pad
  end
end
