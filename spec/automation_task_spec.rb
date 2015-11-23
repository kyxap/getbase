require 'spec_helper'

describe 'Automation Task' do

=begin
    Points to focus on:
                        create an optimal solution
    it should be possible to run the solution in CI
    it should bootstrap itself (install dependencies).
        "Write an automated test in your language and framework of choice which does the following:

  1. Log into the Web version of Base.
  2. Create a new Lead.
  3. Check that its Lead status is "New"
  4. Go into Settings / Leads / Lead statuses and change the name of the "New" status to a different name.
  5. Go back to the Lead to check if the name change is reflected.

  Publish the code as a GitHub repo or a private repo on BitBucket."
=end

  before :all do
    @login_page = LoginPage.new(@browser)
    @user_login = 'rkukharuk@gmail.com'
    @user_pass = 'getbase'
    @lead_name = rand(36**10).to_s(36)
    @lead_def_name = 'New'
  end

  it 'Check that the status can be changed of already created Leads too' do
    puts '1. Log into the Web version of Base.'
    @sales_page = @login_page.login_to_the_app @user_login, @user_pass
    @leads_page = @sales_page.top_bar.select_leads_tab

    puts '  a) Delete all Leads if exist'
    unless  @leads_page.no_leads_text?
      @leads_page.delete_all_leads
    end

    puts '2. Create a new Lead with random name'
    @leads_page.create_new_lead_req_fields_only @lead_name

    puts '3. Check that its Lead status is "New"'
    #@leads_page.lead_status?
    expect(@leads_page.lead_status).to eql(@lead_def_name)

    puts '4. Go into Settings / Leads / Lead statuses and change the name of the "New" status to a different name.'
    @settings_page = @leads_page.top_bar_settings.open_settings_page
    @settings_page.change_lead_status(@lead_name)

    puts '5. Go back to the Lead to check if the name change is reflected.'
    @leads_page.top_bar.select_leads_tab #is it correct?
    @leads_page.select_created_lead(@lead_name)
    expect(@leads_page.lead_status).to eql(@lead_name)

    #TODO: insert into after all
    puts '  a). Set Leads status back'
    @leads_page.top_bar_settings.open_settings_page
    @settings_page.change_lead_status(@lead_def_name)
  end

  # after :all do
  #   puts '  a). Set Leads status back'
  #   @leads_page.top_bar_settings.open_settings_page
  #   @settings_page.change_lead_status(@lead_def_name)
  # end

end
