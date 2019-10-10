require 'rubygems'
require 'nokogiri'
require 'open-uri'


def depute_get_mail(url)
page = Nokogiri::HTML(open(url))
page.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl//ul/li[2]/a').each do |nodes|
    return nodes.text

end
end

def depute_get_name(url)
    page = Nokogiri::HTML(open(url))
    page.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[2]/h1').each do |nodes|
        surname_name = nodes.text.split
        clean_surname_name =  surname_name[1..-1]
        return clean_surname_name

end
end

def create_hash(url)
   hash = Hash.new
   name_surname = depute_get_name(url)
   hash["Prénom"] = name_surname[0]
   hash["Nom"] = name_surname[1..-1].join('')
   mail =  depute_get_mail(url)
   hash["mail"] = mail
   return hash

end

def get_depute_web_pages(url)
    page = Nokogiri::HTML(open(url))
    depute_web_page = []
    page.xpath("//*[@id='deputes-list']//@href").each do |nodes|
        depute_web_page << nodes     
    end
return depute_web_page
end





def perform(url)

list_deputes = get_depute_web_pages(url)
final_array = []

list_deputes.each do |items|
    newurl = "http://www2.assemblee-nationale.fr"+items
    begin
    final_hash = create_hash(newurl)    
    rescue
    end
    
    final_array.push(final_hash)
    puts final_hash
end
puts final_array
return final_array
end

perform("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")



