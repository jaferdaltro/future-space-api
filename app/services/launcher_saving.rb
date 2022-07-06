class LauncherSaving
  def initialize(limit, page) #limit=2000, page=100
    response = FetchLaunchData.new(limit, page).call
    list_data = response.deep_symbolize_keys
    @launchers_params = list_data[:results]
  end

  def call
    extract_data
  end

  private

  def extract_data
    @launcher_list = []
    @launchers_params.each do |launch|
      reject_status = launch.reject { |key| key == :status }
      reject_roket = reject_status.reject { |key| key == :rocket }
      reject_mission = reject_roket.reject { |key| key == :mission }
      reject_pad = reject_mission.reject { |key| key == :pad }
      reject_last = reject_pad.reject { |key| key == :last_updated }
      reject_launch = reject_last.reject { |key| key == :launch_service_provider }
      @launcher_list << reject_launch
    end
    @launcher_list

  end

  def build_launcher
  end
  def build_launch_service_provider
  end
  def build_configuration
  end
  def build_rocket
  end
  def build_pad
  end
  def build_mission
  end
  def build_location
  end
end
