=begin
	
Le CEO de get-email-corp a besoin encore de tes services. Il voudrait toutes les adresses email des mairies du Val d'Oise. 
Quelle coincidence, tu viens d'apprendre à le faire. Va sur cet annuaire des mairies et va récupérer les adresses emails des mairies du Val d'Oise.

    Tout d'abord, écris une méthode 

    get_the_email_of_a_townhal_from_its_webpage 

    qui, comme son nom l'indique, récupère l'adresse email à partir de l'url d'une mairie, par exemple celle de Vauréal
    
    Ensuite, écris une méthode 

    get_all_the_urls_of_val_doise_townhalls

    qui, comme son nom l'indique, récupère toutes les url de villes du Val d'Oise. C'est recommandé de le faire de cette page web
    

    Tu n'as plus qu'à recoller les méthodes ensemble et à toi la gloire
    

    BONUS : c'est quand même recommandé d'enregistrer les urls dans un hash propre du genre 

    { :name => "nomDeLaVille", :email=> "ville@machin.chose" } 
    pour que le CEO de get-email-corp ne soit pas trop perdu

=end
=begin
require 'rubygems'
require 'nokogiri' 
require 'open-uri'

html = open("http://en.wikipedia.org/").read

page = Nokogiri::HTML(open("http://en.wikipedia.org/"))   
puts page.class
=end
=begin

def get_the_email_of_a_townhal_from_its_webpage
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/60/abancourt.html"))

	emails = doc.xpath("/html/body") do |node|
		puts node.text
	end&

get_the_email_of_a_townhal_from_its_webpage
end


page = Nokogiri::HTML(open("index.html"))   
puts page.class   # => Nokogiri::HTML::Document

=end


=begin
	
rescue Exception => e
	
end
require 'rubygems'
require 'nokogiri' 

page = Nokogiri::HTML(open("//Roi Arthur — Wikipédia.html"))   
puts page.class   # => Nokogiri::HTML::Document




=end



require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def get_the_email_of_a_townhall_from_its_webpage(url = "http://annuaire-des-mairies.com/95/vaureal.html")
    page = Nokogiri::HTML(open(url))
    scrap = page.xpath('//html/body/table/tr[3]/td/table/tr[1]/td[1]/table[4]/tr[2]/td/table/tr[4]/td[2]/p')
    scrap.each do |node| 
    	puts node.text
     end
end
url="http://annuaire-des-mairies.com/95/vaureal.html"
get_the_email_of_a_townhall_from_its_webpage



