require_relative '../lib/marie_christmas'



describe "scrapper mairie " do
    it "should return an array of hash of mails and name of mairies in France" do
        expect(perform_scrapping_mairies()).not_to be_empty
    end
    it "should return an array" do
        expect(perform_scrapping_mairies()).to be_a_kind_of(Hash)
    end
end

