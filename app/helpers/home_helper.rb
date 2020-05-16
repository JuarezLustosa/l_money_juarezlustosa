module HomeHelper
  def premium_badger(offer)
    if offer.premium?
      content_tag(:span, 'Premium', class: 'tag is-danger is-rounded topcorner')
    end
  end
end
