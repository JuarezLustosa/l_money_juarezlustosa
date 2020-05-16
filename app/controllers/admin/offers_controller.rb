class Admin::OffersController < ApplicationController
  before_action :set_admin_offer,
    only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @admin_offer.save
        format.html { redirect_to admin_offers_path, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @admin_offer }
      else
        format.html { render :new }
        format.json { render json: @admin_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_offer.update(admin_offer_params)
        format.html { redirect_to admin_offers_path, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_offer }
      else
        format.html { render :edit }
        format.json { render json: @admin_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_offer.destroy
    respond_to do |format|
      format.html { redirect_to admin_offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def disabled
    @admin_offer = Admin::Offer.find_by(id: params[:offer_id])
    @admin_offer.disabled!

    respond_to do |format|
      format.js
    end
  end

  def enabled
    @admin_offer = Admin::Offer.find_by(id: params[:offer_id])
    @admin_offer.enabled!

    respond_to do |format|
      format.js
    end
  end

  private
    def set_admin_offer
      @admin_offer = Admin::Offer.find(params[:id])
    end

    def admin_offer_params
      params.require(:admin_offer).permit(
        :advertiser_name, :url, :description, :start_at, :ends_at, :premium
      )
    end
end
