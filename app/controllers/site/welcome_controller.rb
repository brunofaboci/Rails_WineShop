class Site::WelcomeController < SiteController
  def index
    @wines = Wine.all.page(params[:page]).per(3)
  end
end
