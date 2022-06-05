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
    begin
      Rails.cache.fetch(CURRENCY_API, expires_in: 1.minutes) do # resolve problem with no internet connection
        JSON.parse(self.call(CURRENCY_API))
      end
    rescue => exception
      [{"currencyCodeA"=>978, "currencyCodeB"=>980, "rateBuy"=>00, "rateSell"=>00},
      {"currencyCodeA"=>840, "currencyCodeB"=>980, "rateBuy"=>00, "rateSell"=>00}]
    end
  end
end
