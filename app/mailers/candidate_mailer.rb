class CandidateMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.candidate_mailer.subscription.subject
  #
  def subscription
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
