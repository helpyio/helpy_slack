Post.class_eval do

  after_create :ping_slack

#  protected

  def ping_slack
    return false unless self.kind == 'first' # Only ping for new topics

    # Actually fire the ping, split for private/public topics
    if self.topic.forum.private?
      send_ping(self) if AppSettings['slack.ping_private_topics'] == '1'
    else
      send_ping(self) if AppSettings['slack.ping_public_topics'] == '1'
    end
  end

  def send_ping(post)
    # Assemble message
    url = "#{AppSettings['settings.site_url']}#{Rails.application.routes.url_helpers.admin_ticket_path(post.topic.id)}"
    title = "New Topic started by #{post.topic.user.name}"
    message = {
      title: "<#{url}|#{post.topic.name}>",
      text: post.body,
      color: '#eee'
    }

    # Send Ping
    notifier = Slack::Notifier.new AppSettings['slack.post_url']
    notifier.username = "HelpyBot"
    notifier.ping title, attachments: [message], channel: AppSettings['slack.default_channel']
  end

end
