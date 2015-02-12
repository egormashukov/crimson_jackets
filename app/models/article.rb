class Article < ActiveRecord::Base
  before_create :make_rate
  scope :order_rate, -> { order('rate DESC') }
  scope :rate_more_than, ->(num) { where('rate >= ?', num) }
  scope :rate_less_than, ->(num) { where('rate <= ?', num) }
  scope :by_rate, ->(rate) { where(rate: rate) }

  def self.filter(params)
    return by_rate(params[:rate]) if params[:rate].present?
    return filter_rate_date(params) if params[:rate_min].present? && params[:rate_max].present?
    order_rate.first(10)
  end

  private

  def make_rate
    self.rate = rand(0..5)
  end

  class << self
    def filter_rate_date(params)
      articles = rate_more_than(params[:rate_min]).rate_less_than(params[:rate_max])
      return articles unless params[:created_at].present?
      articles.where(created_at: db_format_day(params[:created_at]))
    end

    def db_format_day(which)
      date = DateTime.parse(which)
      date..date.end_of_day
    end
  end
end
