class LeadsPage
  include PageObject

  a :newLead, id: 'leads-new'
  text_field :lastName, id: 'lead-last-name'
  button :save, css: '.save'

  def create_new_lead_req_fields_only(lastname)
    self.newLead_element
    #self.lastName = lastname
    self.save
  end

end
