=begin
Pas réussi l'exercice, problème par rapport au HTML pas maîtrisé.
Code de Marina repris, analysé, remis en forme et (un tout petit peu) amélioré ( au niveau de la présentation en puts).
Prise de notes pour bien comprendre le code, et questions à lui poser.
=end

#Attention : ne pas oublier les require
require 'rubygems'
require 'nokogiri'   
require 'open-uri'

#obtenir un seul email à partir d'un url
def get_the_email_of_a_townhall_from_its_webpage(url)
    page = Nokogiri::HTML(open(url))
    scrap = page.xpath('//html/body/table/tr[3]/td/table/tr[1]/td[1]/table[4]/tr[2]/td/table/tr[4]/td[2]/p')
    scrap.each { |node| return node.text }
end

def get_all_the_urls_of_val_doise_townhalls(url)
    hash_name_mail = {}
    page = Nokogiri::HTML(open(url))
    scrap = page.xpath('//table/tr[2]/td/table/tr/td/p/a')
    scrap.each do |link| 
        name_ = link.text.split.each { |node| node.capitalize! }
        name_ = name_ * "-"
=begin
        Selection des différents url où aller chercher les emails
        - url = 'http://annuaire-des-mairies.com' + link['href'].slice!(1..-1) ==> .slice!(1..-1) enlève le dernier caractère de la string ??! Ici un espace.
            - Modification du .slice!(1..-1) par .gsub(" ","") un peu plus simple. Même effet
              url = 'http://annuaire-des-mairies.com' + link['href'].gsub(" ","")
                - Enfin, suppression du .gsub. La méthode fonctionne très bien sans !
=end
        url = 'http://annuaire-des-mairies.com' + link['href']
        #rappel de la première méthode après avoir défini les différents url source
        email = get_the_email_of_a_townhall_from_its_webpage(url)
        #stockage dans le hash de mes noms et emails
        hash_name_mail.store(name_, email)
    end
    #"puts hash_name_mail" code d'origine
    # modification ==> code d'origine, amélioré avec i : présentation améliorée des résultats.
   i = hash_name_mail.each do |nom, adresse|
        puts "Nom :      #{nom}"
        puts "Adresse : #{adresse}"
        puts ""
    end
end

get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")