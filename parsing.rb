require 'nokogiri'
require 'open-uri'

target_url = 'https://www.hospitalsafetygrade.org/all-hospitals'
web_page = URI.open(target_url)
html_document = Nokogiri::HTML(web_page)

html_document.css('#BlinkDBContent_849210 ul li a').each do |item|
  link_href = item['href']
  id_from_link = link_href.split('/').last
  hospital_name = item.text
  puts "Hospital ID: #{id_from_link} | Hospital Name: #{hospital_name}"
end
