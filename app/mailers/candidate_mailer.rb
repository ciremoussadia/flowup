class CandidateMailer < ApplicationMailer
  def subscription(candidate)
    @candidate = candidate

    mail to: candidate.email, subject: 'Inscription Flow Up'
  end
end
