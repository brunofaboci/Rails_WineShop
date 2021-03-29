class AdminsBackoffice::WinesController < AdminsBackofficeController
  before_action :set_wine, only: [:edit, :update, :destory]

  def index
    @wines = Wine.all.page(params[:page]).per(5)
  end

  def edit
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(params_wine)
    @wine.admin = current_admin
    
    if @wine.save
      redirect_to admins_backoffice_wines_path, notice: "Create Successfull!"
    else
      render :new
    end
  end

  def update
    if @wine.update(params_wine)
      redirect_to admins_backoffice_wines_path, notice: "Update Successfull!"
    else
      render :edit
    end
  end

  def destroy
    if @wine.destroy
      redirect_to admins_backoffice_wines_path, notice: "Destroy Successful!"
    else
      render :index
    end
  end
  
  private

  def set_wine
    @wine = Wine.find(params[:id])
  end

  def params_wine
    params.require(:wine).permit(:description, :type_id, :grape_type_id, :country_id, :price, :amount, :url_img)
  end

end
