module EnvelopeFormulaHelper
  def options_with_data(collection)
    collection.map do |record|
      data_attributes = {}

      [:daily_expences, :funds_for_expensive_purchase, :funds_for_others,
      :funds_for_self_development, :investment_funds, :savings].each do |field|
        data_attributes.merge!(field => record.send(field))
      end

      [record.name, record.id, { data: data_attributes }]
    end
  end
end
