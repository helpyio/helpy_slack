Topic.class_eval do

  after_create :ping_slack

  # protected

  def ping_slack
    notifier = Slack::Notifier.new 'https://hooks.slack.com/services/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'
    notifier.username = "HelpyBot"

    url = "#{AppSettings['settings.site_url']}#{Rails.application.routes.url_helpers.admin_ticket_path(self.id)}"
    message = {
      title: "<#{url}|#{self.name}>",
      text: self.posts.first.body,
      color: '#eee'
    }

    notifier.ping "New Topic started by #{self.user.name}", attachments: [message]
  end

end
