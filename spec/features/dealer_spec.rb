require 'spec_helper'


describe "Dealers" do
  context "index" do
    fixtures :dealer
    before(:each) do
      visit '/'
    end
    it "will have page name" do
      page.should have_content 'Federal Firearms License Directory'
      page.should have_content 'Made by Dustin Zeisler | Fork on Github'
    end
    it "should return result on map", js:true do
      fill_in('address', :with => dealer(:one).city)
      click_on('submit')
      find('.loc-name')
    end
  end
  context "find_near" do
    fixtures :dealer
    it "find nearest" do
      visit "/dealers/near/#{dealer(:one).lat},#{dealer(:one).lng}"
      page.should have_selector('tr', :minimum => 2) #head and one row of data
    end
  end

  context "directory" do
     it "server checks for cookie and displays button to find nearest dealer", js:true do
      cookie_string = '45.532988599999996%2C-122.68938999999997'
      browser = Capybara.current_session.driver.browser
      visit '/directory/'
      browser.manage.add_cookie name: "coordinates", value: cookie_string
      visit '/directory/'
      page.should have_selector('.server')
    end
  end
end
