Post.class_eval do

  after_create :ping_slack

  # protected

  def ping_slack
    notifier = Slack::Notifier.new AppSettings['slack.post_url']
    notifier.username = "HelpyBot"

    if self.kind == 'first' # Only ping Slack for new topics
      url = "#{AppSettings['settings.site_url']}#{Rails.application.routes.url_helpers.admin_ticket_path(self.topic.id)}"
      message = {
        title: "<#{url}|#{self.topic.name}>",
        text: self.body,
        color: '#eee'
      }

      notifier.ping "New Topic started by #{self.topic.user.name}",
        attachments: [message],
        channel: AppSettings['slack.default_channel']
    end
  end

end
