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

def get_the_email_of_a_townhal_from_its_webpage
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/60/abancourt.html"))

	doc.elements.each("//html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td[1]/table[4]/tbody/tr[2]/td/table/tbody/tr[4]/td[2]/p/font") do |node|
		puts node.text
	end&

puts get_the_email_of_a_townhal_from_its_webpage
end