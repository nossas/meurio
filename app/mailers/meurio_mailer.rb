class MeurioMailer < ActionMailer::Base
  default from: "Meu Rio <contato@meurio.org.br>"

  def you_earned_a_badge user, badge
    @user = user
    @badge = badge
    
    headers "X-SMTPAPI" => "{ \"category\": [\"meurio\", \"you_earned_a_badge\"] }"
    mail(to: "#{user.name} <#{user.email}>", subject: "Parabéns! Você recebeu uma badge!")
  end
end
