require_relative '../lib/coinmarketcap_scraper'



describe "scrapper coin marketcap " do
    it "should return an array of hash of all the crypto on coinmarketcap.com" do
        expect(coinmarketcap_scraper()).not_to be_empty   
    end
    it "should be an array of hash" do
        expect(coinmarketcap_scraper()).to be_a_kind_of(Array)
    end
    it "should include Bitcoin" do 
        expect(coinmarketcap_scraper()).to include("BTC")
    end

    it "should return the main cryptocurrencies" do
        expect(coinmarketcap_scraper().to_a.size.to_i).to be >1000
    end
end
	
