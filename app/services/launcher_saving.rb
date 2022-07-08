class LauncherSaving
  def initialize(limit, page) #limit=2000, page=100
    response = FetchLaunchData.new(limit, page).call
    list_data = response.deep_symbolize_keys
    @launchers_params = list_data[:results]
  end

  def call
    parse_and_save_data
  end

  private

  def parse_and_save_data
    @launchers_params.each do |launch|
      launcher_id = build_launcher(launch)
      build_launch_service_provider(launch, launcher_id)
      rocket_id = build_rocket(launch, launcher_id)
      build_configuration(launch, rocket_id)
      build_mission(launch, launcher_id)
      pad_id = build_pad(launch, launcher_id)
      build_location(launch, pad_id)
    end
  end

  def build_launcher(launch)
    launcher = Launcher.new do |key|
      key._id = launch[:id]
      key.url =launch[:url]
      key.launch_library_id= launch[:launch_library_id]
      key.slug = launch[:slug]
      key.name = launch[:name]
      key.net = launch[:net]
      key.window_end = launch[:window_end]
      key.window_start = launch[:window_start]
      key.inhold = launch[:inhold]
      key.tbdtime = launch[:tbdtime]
      key.tbddate = launch[:tbddate]
      key.probability = launch[:probability]
      key.holdreason = launch[:holdreason]
      key.failreason = launch[:failreason]
      key.hashtag = launch[:hashtag]
      key.webcast_live = launch[:webcast_live]
      key.image = launch[:image]
      key.infographic = launch[:infographic]
      key.program = launch[:program]
      key.imported_t = DateTime.now
      key.status = 1
    end
    if launcher.save
      puts "save launch with name #{launcher.name}"
      launcher.id
    else
      puts "not saved"
    end
  end

  def build_launch_service_provider(launch, launcher_id)
    lsp = LaunchServiceProvider.new do |key|
      key._id = launch[:launch_service_provider][:id]
      key.url = launch[:launch_service_provider][:url],
      key.name = launch[:launch_service_provider][:name],
      key.name = launch[:launch_service_provider][:type],
      key.launcher_id = launcher_id
    end
    if lsp.save
      puts "save Launche Service Provider with name #{lsp.name}"
    else
      puts "not saved"
    end
  end

  def build_rocket(launch, launcher_id)
    rocket = Rocket.new do |key|
      key._id = launch[:rocket][:id]
      key.launcher_id = launcher_id
    end
    if rocket.save
      puts "save Rocket with id #{rocket.id}"
      rocket.id
    else
      puts "not saved"
    end
  end

  def build_configuration(launch, rocket_id)
    configuration = Configuration.new do |key|
      key._id = launch[:rocket][:configuration][:id]
      key.launch_library_id = launch[:rocket][:configuration][:launch_library_id]
      key.url = launch[:rocket][:configuration][:url]
      key.name = launch[:rocket][:configuration][:name]
      key.family = launch[:rocket][:configuration][:family]
      key.full_name = launch[:rocket][:configuration][:full_name]
      key.variant = launch[:rocket][:configuration][:variant]
      key.rocket_id = rocket_id
    end
    if configuration.save
      puts "save configuration with name #{configuration.name}"
    else
      puts "not saved"
    end
  end

  def build_pad(launch, launcher_id)
    pad = Pad.new do |key|
      key._id = launch[:pad][:id]
      key.url = launch[:pad][:url]
      key.agency_id = launch[:pad][:agency_id]
      key.name = launch[:pad][:name]
      key.info_url = launch[:pad][:info_url]
      key.wiki_url = launch[:pad][:wiki_url]
      key.map_url = launch[:pad][:map_url]
      key.latitude = launch[:pad][:latitude]
      key.longitude = launch[:pad][:longitude]
      key.map_image = launch[:pad][:map_image]
      key.total_launch_count = launch[:pad][:total_launch_count]
      key.launcher_id = launcher_id
    end
    if pad.save
      puts "save pad with name #{pad.name}"
      pad.id
    else
      puts "not saved"
    end
  end

  def build_mission(launch, launcher_id)
    mission = Mission.new do |key|
      key._id = launch[:mission][:id]
      key.name = launch[:mission][:name]
      key.launcher_id = launcher_id
    end
    if mission.save
      puts "save mission with name #{mission.name}"
    else
      puts "not saved"
    end
  end

  def build_location(launch, pad_id)
    location = Location.new do |key|
      key._id = launch[:pad][:location][:id]
      key.name = launch[:pad][:location][:name]
      key.pad_id = pad_id
    end
    if location.save
      puts "save location with name #{location.name}"
    else
      puts "not saved"
    end
  end
end
