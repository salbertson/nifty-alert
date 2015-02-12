# NiftyAlert

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nifty_alert'
```

Or install it yourself as:

    $ gem install nifty_alert

## Usage

Add this to an initializer:

```ruby
NiftyAlert.recipients = [
  "dude@example.com",
  "https://mycompany.slack.com/services/hooks/slackbot?token=123abc4567def&channel=%23dev"
]
```

Report when something reaches a threshold, such as your job queue:

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
