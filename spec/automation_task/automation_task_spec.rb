require 'spec_helper'

describe 'Automation Task' do

  before(:all) do
    @login_page = LoginPage.new(@browser)
    @topbar_page = TopbarPage.new(@browser)
    @leads_page = LeadsPage.new(@browser)
    @userlogin = 'rkukharuk@gmail.com'
    @userpass = 'getbase'
  end

  it 'Log into the Web version of Base' do
    @login_page.login_to_the_app(@userlogin, @userpass)
    expect(@browser.url).to include('sales')
  end

  describe 'New Lead' do
    it 'Go to Leads tab' do
      @topbar_page.leads_element.click()
      expect(@browser.url).to include('leads')
    end

    it 'Click new lead' do
      @leads_page.newLead_element.click()
      expect(@browser.url).to include('new')
    end
    # it 'Create New Lead' do
    #   newLeadLastName = 'some111'
    #   @leads_page.newLead_element
    #   @leads_page.lastName = newLeadLastName
    #   @leads_page.save
    #   #@leads_page.create_new_lead_req_fields_only(newLeadLastName)
    #
    #   expect(@browser.element(:xpath, '//*[@class="detail-title"][contains(text(),' + newLeadLastName + ')]'))
    #       .to be_visible
    # end
  end

end
