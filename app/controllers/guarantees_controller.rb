class GuaranteesController < ApplicationController
  before_action :find_guarantee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  add_breadcrumb "Boletas de garantía", :root_path

  def search
    add_breadcrumb "Resultados busqueda", :search_guarantees_path

    if params[:search].present?
      @guarantees = Guarantee.search(params[:search])
    else
      @guarantees = Guarantee.all
    end
  end

  def index
    @guarantees = Guarantee.all
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachement; filename="boletas.xlsx"'
      }
    end
    @guarantees = Guarantee.paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def new
    add_breadcrumb "Nuevo", :new_guarantee_path
    @guarantee = current_user.guarantees.build
  end

  def create
    @guarantee = current_user.guarantees.build(guarantee_params)

    if @guarantee.save
      redirect_to @guarantee, notice: "Boleta de garantia creada correctamente"
    else
      render 'new'
    end
  end

  def edit
    add_breadcrumb "Detalles", :edit_guarantee_path
  end

  def update
    if @guarantee.update(guarantee_params)
      redirect_to @guarantee, notice: "Boleta actualizada correctamente"
    else
      render 'edit'
    end
  end

  def destroy
    @guarantee.destroy
    redirect_to root_path
  end

  private

  def guarantee_params
    params.require(:guarantee).permit(:correlative, :income_number, :income_date, :income_applicant, :borrower_name, :borrower_id, :guarantee_number, :bank_name, :value_guarantee, :currency_guarantee, :due_date, :bail, :detail, :bip, :email, :observation, :state, :devolution_number, :devolution_return, :devolution_date, :sectorialist_devolution, :technical_unit)
  end

  def find_guarantee
    @guarantee = Guarantee.find(params[:id])
  end
end
