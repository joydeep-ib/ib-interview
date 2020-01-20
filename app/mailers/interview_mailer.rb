class InterviewMailer < ApplicationMailer
  default from: 'noreply@interviewbit.com',
          return_path: 'system@interviewbit.com'

  def interview(recipient)
    @account = recipient
    mail(to: recipient.email)

  end
end
