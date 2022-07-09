class LaunchersController < ApiController
  before_action :set_launcher, only: %i(show update destroy)

  # GET /launchers/:launchId: Obter a informação somente de um launch da base de dados
  def show; end

  # GET /launchers: Listar os launchers da base de dados de maneira paginada
  def index
    @loading_service = LauncherLoading.new(Launcher.all, searchable_params)
    @loading_service.call
  end

  # PUT /launchers/:launchId: Será responsável por receber atualizações realizadas
  def update
    @launcher.attributes = launcher_params
   save_launcher
  end

  # DELETE /launchers/:launchId: Remover o launch da base
  def destroy
    @launcher.destroy!
  rescue
    render_errors(fields: @launcher.errors.messages)
  end

  private

  def set_launcher
    @launcher = Launcher.find(params[:id])
  end

  def searchable_params
    params.permit({ seach: :name }, { order: {} }, :page, :length)
  end

  def save_launcher
    @launcher.save!
    render :show
  end


  def launcher_params
    return {} unless params.has_key?(:launcher)
    params.require(:launcher).permit(:id, :name, :url, :launch_library_id, :slug, :net, :window_end, :window_start,
      :inhold, :tbdtime, :tbddate, :probability, :holdreason, :failreason, :hashtag, :webcast_live,
      :image,  :infographic, :program)

  end
end
