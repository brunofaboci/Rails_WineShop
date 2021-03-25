class Site::WelcomeController < SiteController
  def index
    @wines = Wine.all.page(params[:page])
  end
end
