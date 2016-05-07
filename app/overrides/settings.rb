# These overrides add Slack configuration to the settings panel
# See https://guides.spreecommerce.com/developer/view.html

# Grid menu integration
Deface::Override.new(
  :virtual_path  => "admin/settings",
  :insert_bottom => "[data-hook='admin_settings_grid']",
  :name          => "slack_grid_item",
  :text => "
    <%= settings_item('hash', 'slack', 'Enable Slack for your account') %>
    "
  )

# Left menu integration
Deface::Override.new(
  :virtual_path  => "admin/settings",
  :insert_bottom => "[data-hook='admin_settings_menu']",
  :name          => "slack_settings_menu",
  :text => "<%= settings_menu_item('hash', 'slack') %>"
  )

# Configuration Panel
Deface::Override.new(
  :virtual_path  => "admin/settings",
  :insert_before => "div.submit-section",
  :name          => "slack_panel",
  :text => "
    <div class='settings-section slack' data-hook='admin_settings_slack'>
      <%= f.text_field 'slack.post_url', value: AppSettings['slack.post_url'], label: 'Webhook URL' %>
      <%= f.text_field 'slack.default_channel', value: AppSettings['slack.default_channel'], label: 'Default Channel' %>
      <%= f.check_box 'slack.ping_private_topics', { checked: AppSettings['slack.ping_private_topics'] == '1', label: 'Post private topics to Slack' } %>
      <%= f.check_box 'slack.ping_public_topics', { checked: AppSettings['slack.ping_public_topics'] == '1', label: 'Post public topics to Slack' } %>
    </div>
    "
  )
