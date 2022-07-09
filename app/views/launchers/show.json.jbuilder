json.launcher do
  json.(@launcher, :_id, :name, :url, :launch_library_id, :slug, :net, :window_end, :window_start,
  :inhold, :tbdtime, :tbddate, :probability, :holdreason, :failreason, :hashtag, :webcast_live,
  :image,  :infographic, :program)
  json.status @launcher.status
  json.launch_service_provider @launcher.launch_service_provider
  json.rocket @launcher.rocket
  json.mission @launcher.mission
  json.pad @launcher.pad
end
