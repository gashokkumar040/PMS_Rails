require 'faraday'
require 'faraday_middleware'

url = 'https://free.currencyconverterapi.com/api/v5/convert?q=btc_inr&compact=ultra'

conn = Faraday.new(url: url) do |faraday|
  faraday.adapter Faraday.default_adapter
  faraday.response :json
end

response = conn.get('search', type: 'user', q: 'tycho')
response.body