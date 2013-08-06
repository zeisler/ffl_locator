require 'spec_helper'


describe "Dealers" do
  context "find_near" do
    fixtures :dealer
    it "find nearest" do
      visit "/dealers/near/#{dealer(:one).lat},#{dealer(:one).lng}"
      page.should have_selector('tr', :minimum => 2) #head and one row of data
    end
  end

  context "index" do
     it "server checks for cookie and displays button to find nearest dealer", js:true do
      cookie_string = '45.532988599999996%2C-122.68938999999997'
      browser = Capybara.current_session.driver.browser
      visit '/dealers/'
      browser.manage.add_cookie name: "coordinates", value: cookie_string
      visit '/dealers/'
      page.should have_selector('.server')
    end
  end
end
