# These overrides add Slack configuration to the settings panel
# See https://guides.spreecommerce.com/developer/view.html

Deface::Override.new(
  :virtual_path  => "admin/settings",
  :insert_bottom => "[data-hook='admin_settings_grid']",
  :name          => "slack_grid_item",
  :text => "
    <div class='settings-grid-row row'>
      <%= content_tag :div, nil, class: 'col-md-2 hidden-xs hidden-sm' %>
      <%= settings_item('envelope', 'Slack', 'Enable Slack for your account') %>
    </div>
    "
  )

Deface::Override.new(
  :virtual_path  => "admin/settings",
  :insert_bottom => "[data-hook='admin_settings_menu']",
  :name          => "slack_settings_menu",
  :text => "<%= settings_menu_item('cloud', 'Slack') %>"
  )

Deface::Override.new(
  :virtual_path  => "admin/settings",
  :insert_before => "div.submit-section",
  :name          => "slack_panel",
  :text => "
    <div class='settings-section slack' data-hook='admin_settings_slack'>
      <%= f.text_field 'slack.post_url', value: AppSettings['slack.post_url'], label: 'Post URL' %>
    </div>
    "
  )
