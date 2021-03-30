class Site::WelcomeController < SiteController
  def index
    @wines = Wine.all.order(:id).reverse_order.page(params[:page]).per(3)
  end
end
