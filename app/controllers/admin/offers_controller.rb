class Admin::OffersController < ApplicationController
  before_action :set_admin_offer,
    only: [:show, :edit, :update, :destroy, :disabled, :enabled]

  def index
    @admin_offers = Admin::Offer.all
  end

  def show
  end

  def new
    @admin_offer = Admin::Offer.new
  end

  def edit
  end

  def create
    @admin_offer = Admin::Offer.new(admin_offer_params)

    if @admin_offer.save
      redirect_to_index_on_success('created.')
    else
      render :new
    end
  end

  def update
    if @admin_offer.update(admin_offer_params)
      redirect_to_index_on_success('updated.')
    else
      render :edit
    end
  end

  def destroy
    @admin_offer.destroy
    redirect_to_index_on_success('destroyed.')
  end

  def disabled
    @admin_offer.disabled!

    respond_to :js
  end

  def enabled
    @admin_offer.enabled!

    respond_to :js
  end

  private

  def redirect_to_index_on_success(message_action)
    flash[:notice] = "Offer was successfully #{message_action}"
    redirect_to admin_offers_path
  end

  def set_admin_offer
    @admin_offer = Admin::Offer.find(params[:id] || params[:offer_id])
  end

  def admin_offer_params
    params.require(:admin_offer).permit(
      :advertiser_name, :url, :description, :start_at, :ends_at, :premium
    )
  end
end
