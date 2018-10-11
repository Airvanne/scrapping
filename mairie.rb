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

#puts get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")

def get_the_email_of_val_doise_townhal_from_its_webpage(url)
    i = 0
    get_all_the_urls_of_val_doise_townhalls(url).each do

    doc = Nokogiri::HTML(open("#{get_all_the_urls_of_val_doise_townhalls(url)[i]}"))
    doc.css('//tbody/tr[@class="txt-primary tr-last"]/td')[7, 1].each do |email|
        #xpath('//tbody/tr[@class="txt-primary tr-last"][4]/td[2]')
        puts email.text
    end
    i += 1
  end
end

#puts get_all_the_urls_of_val_doise_townhalls(url)

#get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")
get_the_email_of_val_doise_townhal_from_its_webpage("http://annuaire-des-mairies.com/val-d-oise.html")

# def emails(url)
#     get_the_email_of_val_doise_townhal_from_its_webpage(get_all_the_urls_of_val_doise_townhalls(url))
# end
# emails("http://annuaire-des-mairies.com/val-d-oise.html")
