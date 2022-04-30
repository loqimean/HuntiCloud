class MonobankService::Base < BaseService
  CURRENCY_API = 'https://api.monobank.ua/bank/currency'.freeze

  attr_reader :currencies

  def initialize; end

  def currency_by(sell_currency_iso_code:, buy_currency_iso_code: 980)
    currencies.find do |hash|
      hash['currencyCodeA'] == sell_currency_iso_code &&
      hash['currencyCodeB'] == buy_currency_iso_code
    end
  end

  def currencies
    Rails.cache.fetch(CURRENCY_API, expires_in: 1.minutes) do
      JSON.parse(self.call(CURRENCY_API))
    end
  end
end
