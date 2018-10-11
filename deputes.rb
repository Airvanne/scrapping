require 'rubygems'
require 'open-uri'
require 'nokogiri'

def first_name(url)
    first_name = Array.new
    doc = Nokogiri::HTML(open(url))
    doc.xpath('//span[@class="list_nom"]').each do |name|
    first_name << name.text
    end
    first_name
end

#  def emails(url)
#     emails_array = Array.new
#     doc = Nokogiri::HTML(open(url))
#     doc.css('//]').each do |mail|
#     emails_array << mail.text
#     end
#     mail_array
# end
#
# def mix(url)
#     Hash[first_name(url).zip emails(url)]
# end

puts first_name("https://www.nosdeputes.fr/deputes")
#puts mix("https://www.nosdeputes.fr/deputes")
