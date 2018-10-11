require 'rubygems'
require 'open-uri'
require 'nokogiri'


def get_all_the_urls_of_val_doise_townhalls(url)
    linkgood = Array.new
    doc = Nokogiri::HTML(open(url))
    doc.css('//a[class="lientxt"]').each do |link|
      link_without_point = link['href']
     link_without_point = "http://annuaire-des-mairies.com#{link_without_point[1..-1]}"
      linkgood << link_without_point
    end
   linkgood
end

puts get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")
