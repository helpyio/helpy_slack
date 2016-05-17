# Integrate your Helpy with Slack

[![Code Climate](https://codeclimate.com/github/scott/helpy_slack/badges/gpa.svg)](https://codeclimate.com/github/scott/helpy_slack)

This extension adds Slack notifications when new discussions are posted to your Helpy and adds a configuration panel in your Settings area.  You must have Helpy 0.9.2 updated master branch for this integration to work.

## Installation

Add this to your Gemfile:

```
gem 'helpy_slack', github: 'helpyio/helpy_slack', branch: 'master'
```

and then run:

```
bundle install
```

This gem gives you a couple options and all configuration happens inside of the Helpy admin through
a new settings panel.  You will have to configure your Slack room to support inbound webhooks and then
use the URL provided inside Helpy.  To do this, follow these steps:

1. Log into your Slack room.. You probably already are logged in, but make sure you have owner priviledges.

2. In the upper left, click on your room name, and choose "Apps & Integrations"

3. In the upper right, chooe "Build", and then "Something just for my team"

4. On the build a custom integration page, choose "Incoming Webhooks"

5. Select the Channel, although you can always change this later, and click "Add Incoming Webhooks Integration"

6. Grab the Webhook URL shown and add that into your Helpy > Admin > Settings > Slack Configuration

7. Done!  You should immediately begin receiving notifications in your Slack room when a new private
or public discussion is added on your Helpy.
