require 'rubygems'
require 'open-uri'
require 'nokogiri'

def currency(url)
    currency_array = Array.new
    doc = Nokogiri::HTML(open(url))
    doc.css('//a[class="currency-name-container link-secondary"]').each do |coin|
    currency_array << coin.text
    end
    currency_array
end

def price(url)
    price_array = Array.new
    doc = Nokogiri::HTML(open(url))
    doc.css('//a[class="price"]').each do |cours|
    price_array << cours.text
    end
    price_array
end

def mix(url)
    Hash[currency(url).zip price(url)]
end

puts mix("https://coinmarketcap.com/all/views/all/")
