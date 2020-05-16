class Admin::OfferObserver < ActiveRecord::Observer

  def before_save(record)
    return if record.status_changed?

    record.status = DateTimeOfferStatus.call(record.start_at, record.ends_at)
  end
end
