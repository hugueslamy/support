class IncidentMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def created(incident)
    @incident = incident
    mail(to: @incident.requestor_email, subject: t('incident_mailer.created.subject'))
  end
  
  def new_comment(incident)
    @incident = incident
    mail(to: @incident.requestor_email, subject: t('incident_mailer.new_comment.subject'))
  end
  
  def updated(incident)
    @incident = incident
    mail(to: @incident.requestor_email, subject: t('incident_mailer.updated.subject'))
  end
  
end
