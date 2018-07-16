require 'faraday'

namespace :currency do
  desc "get btc_inr value from api and store it in db"
  task btc_inr: :environment do

    response = Faraday.get 'https://free.currencyconverterapi.com/api/v5/convert?q=btc_inr&compact=ultra'
    h = response.body

    # to conver JSON String to array
    a = JSON.parse(h)

    puts "#{a['BTC_INR']}"
    puts "#{response.body}"

    user = Currency.first
    user.update(btc_inr: a['BTC_INR'])
    puts Time.zone.now
    # user.update(btc_inr: 10)


  end
end


