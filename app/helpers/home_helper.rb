module HomeHelper
  def currency_iso_code_to_code(iso_code)
    case iso_code
    when 978
      :eur
    when 840
      :usd
    else
      'Unknown code'
    end
  end
end
