module RatesHelper
  def rates_to_buttons(rates)
    raw rates.map { |r| link_to r.name, rate_path(id: r.id), class: 'btn-lg btn-info btn-primary' }.join(' ')
  end
end
