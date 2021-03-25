class AdminsBackoffice::TypesController < AdminsBackofficeController
  before_action :set_type, only: [:edit, :update, :destory]

  def index
    @types = Type.all.page(params[:page])
  end

  def edit
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new(params_type)
    if @type.save
      redirect_to admins_backoffice_types_path, notice: "Create Successfull!"
    else
      render :new
    end
  end

  def update
    if @type.update(params_type)
      redirect_to admins_backoffice_types_path, notice: "Update Successfull!"
    else
      render :edit
    end
  end

  def destroy
    if @type.destroy
      redirect_to admins_backoffice_types_path, notice: "Destroy Successful!"
    else
      render :index
    end
  end
  
  private

  def set_type
    @type = Type.find(params[:id])
  end

  def params_type
    params.require(:type).permit(:description)
  end
  
end
