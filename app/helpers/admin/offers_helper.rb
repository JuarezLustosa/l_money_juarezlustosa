module Admin::OffersHelper
  def status_color(offer)
    offer.enabled? ? 'is-success' : 'is-warning'
  end

  def switch_path_status(offer)
    case offer.status
    when 'enabled'
      admin_offer_disabled_path(offer)
    when 'disabled'
      admin_offer_enabled_path(offer)
    end
  end
end
