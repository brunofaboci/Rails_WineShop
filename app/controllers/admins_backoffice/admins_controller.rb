class AdminsBackoffice::AdminsController < AdminsBackofficeController
  def index
    @admins = Admin.all.page(params[:page])
  end

end
