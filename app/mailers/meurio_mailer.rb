class MeurioMailer < ActionMailer::Base
  default from: "Nossas Cidades <contato@meurio.org.br>"

  def you_earned_a_badge user, badge
    @user = user
    @user_url = user_url(@user)
    @badge = badge

    headers "X-SMTPAPI" => "{ \"category\": [\"meurio\", \"you_earned_a_badge\"] }"
    mail(to: "#{user.name} <#{user.email}>", subject: "Registramos a sua participação como uma conquista!", from: "Leonardo - Nossas Cidades <leonardo@nossascidades.org>")
  end
end
