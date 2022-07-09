json.launchers do
  json.deep_format_keys!(value = true)
  json.array! @loading_service.records do |launcher|
    json.(launcher, :id, :name, :url, :launch_library_id, :slug, :net, :window_end, :window_start,
          :inhold, :tbdtime, :tbddate, :probability, :holdreason, :failreason, :hashtag, :webcast_live,
          :image,  :infographic, :program)
    json.status launcher.status
    json.launch_service_provider launcher.launch_service_provider
    json.rocket launcher.rocket
    json.mission launcher.mission
    json.pad launcher.pad
  end
end
