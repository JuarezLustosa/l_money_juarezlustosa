class DateTimeOfferStatus
  attr_accessor :start_at, :ends_at, :current_time

  def self.call(start_at, ends_at)
    new(start_at, ends_at).call
  end

  def initialize(start_at, ends_at)
    @start_at = start_at
    @ends_at = ends_at
    @current_time = Time.current
  end

  def call
    return :enabled if ends_at.blank?

    enabled? ? :enabled : :disabled
  end

  private

  def enabled?
    current_time_after_start_at? && current_time_before_ends_at?
  end

  def current_time_after_start_at?
    current_time >= start_at
  end

  def current_time_before_ends_at?
    current_time <= ends_at
  end
end
