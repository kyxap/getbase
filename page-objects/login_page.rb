class LoginPage
  include PageObject

  text_field :username, id: 'user_email'
  text_field :password, id: 'user_password'
  button :login, css: '.icon-lock'
  # text_field(:test, id: 'new')

  def login_to_the_app(login, pass)
    self.username = login
    self.password = pass
    self.login
    return SalesPage.new browser
  end
end
