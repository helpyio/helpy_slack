class SlackJob < ActiveJob::Base
  
  def perform(post)
    # Assemble message
    url = "#{AppSettings['settings.site_url']}#{Rails.application.routes.url_helpers.admin_topic_path(post.topic.id)}"
    title = "New Topic started by #{post.topic.user.name}"
    message = {
      title: "<#{url}|#{post.topic.name}>",
      text: post.body,
      color: '#eee'
    }

    # Send Ping
    notifier = Slack::Notifier.new AppSettings['slack.post_url']
    notifier.ping title, attachments: [message], channel: AppSettings['slack.default_channel']
  end
end
