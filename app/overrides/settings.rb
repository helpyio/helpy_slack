# These overrides add Slack configuration to the settings panel
# See https://guides.spreecommerce.com/developer/view.html

# Grid menu integration
Deface::Override.new(
  :virtual_path  => "admin/settings/index",
  :insert_bottom => "[data-hook='admin_settings_grid']",
  :name          => "slack_grid_item",
  :text => "
    <%= settings_item('fa fa-slack', 'slack', 'Enable Slack for your account', admin_slack_settings_path) %>
    "
  )

# Left menu integration
Deface::Override.new(
  :virtual_path  => "admin/settings/index",
  :insert_bottom => "[data-hook='admin_settings_menu']",
  :name          => "slack_settings_menu",
  :text => "<%= settings_menu_item('fa fa-slack', 'slack', admin_slack_settings_path) %>"
  )
