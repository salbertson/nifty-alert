# NiftyAlert

The gem will let you report when something reaches a threshold, such as a job
queue, and will intelligently alert whoever or whatever is configured to
receive alerts.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nifty_alert'
```

Or install it yourself as:

    $ gem install nifty_alert

## Usage

Set up recipients, maybe in a Rails initializer. Recipients can be email
addresses or Slack channels.

```ruby
NiftyAlert.recipients = [
  "dude@example.com",
  "https://mycompany.slack.com/services/hooks/slackbot?token=123abc4567def&channel=%23dev"
]
```

Report whatever you would like to monitor, such as the number of jobs in your
queue, along with a threshold:

```ruby
class EmailJob
  def before(job)
    nifty_alert = NiftyAlert.new(:email)
    nifty_alert.report(Delayed::Job.count, 1_000)
  end

  ...
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/nifty_alert/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
