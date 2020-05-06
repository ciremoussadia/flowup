# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'support@flowup.sn'
  layout 'mailer'
end
