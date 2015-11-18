class LoginPage
  include PageObject

  text_field :username, id: 'user_email'
  text_field :password, id: 'user_password'
  button :login, css: '.icon-lock'

  def login_to_the_app(login, pass)
    self.username = login
    self.password = pass
    self.login
  end
end
