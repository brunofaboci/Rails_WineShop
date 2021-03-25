class AdminsBackoffice::CountriesController < AdminsBackofficeController
  before_action :set_country, only: [:edit, :update, :destory]

  def index
    @countries = Country.all.page(params[:page])
  end

  def edit
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(params_country)
    if @country.save
      redirect_to admins_backoffice_countries_path, notice: "Create Successfull!"
    else
      render :new
    end
  end

  def update
    if @country.update(params_country)
      redirect_to admins_backoffice_countries_path, notice: "Update Successfull!"
    else
      render :edit
    end
  end

  def destroy
    if @country.destroy
      redirect_to admins_backoffice_countries_path, notice: "Destroy Successful!"
    else
      render :index
    end
  end
  
  private

  def set_country
    @country = Country.find(params[:id])
  end

  def params_country
    params.require(:country).permit(:description)
  end

end
