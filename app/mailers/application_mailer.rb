class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  # default from: 'tetsuhiro.hayama@gmail.com'
  layout 'mailer'
end
