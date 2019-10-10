require_relative '../lib/depute'

describe "scrapper des noms prénoms mails des députés" do
    it "should return an array of hash with names, surname and mails of all the deputes" do
        expect(create_hash("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719770")).not_to be_empty
    end
    it "should return an array of hash with names, surname and mails of all the deputes" do
        expect(create_hash("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719770")).to eq({"Prénom"=>"Florian", "Nom"=>"Bachelier", "mail"=>"florian.bachelier@assemblee-nationale.fr"})
    end
    it "should return an array" do
        expect(create_hash).to be_a_kind_of(Hash)
    end
end

describe "scrapper des noms prénoms mails des députés" do
    it "should return an array of hash with names, surname and mails of all the deputes" do
        expect(perform("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")).not_to be_empty
    end
    it "should return an array" do
        expect(perform("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")).to be_a_kind_of(Array)
    end
end

