class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
    @dose = Dose.new
    authorize @dose
  end

  def create
    @dose = @cocktail.doses.new(dose_params)
    authorize @dose
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit( :ingredient_id, :description)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
    authorize @cocktail
  end

end
