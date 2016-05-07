Topic.class_eval do

  after_create :ping_slack

  protected

  def ping_slack
    notifier = Slack::Notifier.new 'https://hooks.slack.com/services/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'
    notifier.username = "HelpyBot"
    url = "#{AppSettings['settings.site_url']}#{Rails.application.routes.url_helpers.admin_ticket_path(self.id)}"
    notifier.ping "New Topic: <a href='#{url}'>#{self.name}</a> was just posted by #{self.user.name}"
  end

end
