class AdminsBackoffice::GrapeTypesController < AdminsBackofficeController
  before_action :set_grape_type, only: [:edit, :update, :destory]

  def index
    @grape_types = GrapeType.all.page(params[:page])
  end

  def edit
  end

  def new
    @grape_type = GrapeType.new
  end

  def create
    @grape_type = GrapeType.new(params_grape_type)
    if @grape_type.save
      redirect_to admins_backoffice_grape_types_path, notice: "Create Successfull!"
    else
      render :new
    end
  end

  def update
    if @grape_type.update(params_grape_type)
      redirect_to admins_backoffice_grape_types_path, notice: "Update Successfull!"
    else
      render :edit
    end
  end

  def destroy
    if @grape_type.destroy
      redirect_to admins_backoffice_grape_types_path, notice: "Destroy Successful!"
    else
      render :index
    end
  end
  
  private

  def set_grape_type
    @grape_type = GrapeType.find(params[:id])
  end

  def params_grape_type
    params.require(:grape_type).permit(:description)
  end
end
