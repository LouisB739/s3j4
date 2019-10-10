require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_townhall_email(townhall_url)
    email_array= []
    page = Nokogiri::HTML(open(townhall_url))
    page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").each do |node|
        email_array << node.text 
        return email_array
    end
end



def get_townhall_names(townhall_url)
    page = Nokogiri::HTML(open(townhall_url))
    name_array = []
    page.xpath("/html/body/div/main/section[1]/div/div/div/h1").each do |node|
        name_array << node.text
        return name_array
    end
       
end



def get_townhall_urls(url)
    page = Nokogiri::HTML(open(url))
    nodeset = page.xpath('//a[@class="lientxt"]') 
    y = []  
    
  href=  nodeset.map {|element| element["href"]}

  href.each do | addresses | 
  addresse = addresses[1..-1]
  newurl = "http://annuaire-des-mairies.com/" + addresse
  y  << newurl
end
return y
end

def perform_scrapping_mairies()
    y = get_townhall_urls("https://www.annuaire-des-mairies.com/val-d-oise.html")
    x = []
    z = []
    final_array=[]
    y.each do | items |
        mail_list = get_townhall_email(items)
        name_list = get_townhall_names(items)
        final_array << {name_list => mail_list}

    end
    puts final_array

    return final_array
    
end

perform_scrapping_mairies






