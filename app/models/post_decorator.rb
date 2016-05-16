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
    SlackJob.perform_later post
  end

end
