require 'rubygems'
require 'nokogiri'
require 'open-uri'

 

def find_symbol(page)
    symbol_array=[]
    page.xpath('//a[@class="link-secondary"]').each do |nodes|
       symbol_array << nodes.text
    end
    return symbol_array
end

def find_price(page)
    price_array=[]
     page.xpath('//a[@class="price"]').each do |nodes|
     price_array << nodes.text 
     end
     return price_array
end


def create_array_of_hash(price,symbol)
    final_array = []
        for i in 0..price.size
    final_array << {symbol[i] => price[i] }
    end
    return final_array
end




def coinmarketcap_scraper()
    page =Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

create_array_of_hash(find_price(page),find_symbol(page))
end



coinmarketcap_scraper



