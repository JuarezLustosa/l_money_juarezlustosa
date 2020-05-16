class HomeController < BaseController
  def index
    @offers = Admin::Offer.premium_order.enabled
  end
end
