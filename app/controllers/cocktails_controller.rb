class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_cocktail, only: [:show, :destroy]

  def index
    if params[:query].present?
      @cocktails = policy_scope(Cocktail).where("name ILIKE ?", "%#{params[:query]}%")
      authorize Cocktail
    else
      @cocktails = policy_scope(Cocktail)
      authorize Cocktail
    end
  end

  def show
    @dose = Dose.new
    @cocktail.doses = @cocktail.doses.includes(:ingredient)
  end

  def new
    @cocktail = Cocktail.new
    authorize @cocktail
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = current_user
    authorize @cocktail
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  protected

  def resource_not_found
    message = "The cocktail you are looking for could not be found"
    flash[:alert] = message
    redirect_to root_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
    authorize @cocktail
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
