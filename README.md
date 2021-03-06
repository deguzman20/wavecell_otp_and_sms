# Wavecell

Ruby gem wrapper for sending sms, generate OTP, verify OTP using wavecell.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wavecell_otp_and_sms'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wavecell_otp_and_sms

## Example

  ```ruby
    initializer.rb
    # Initiate Wavecell SMS configuration by putting sub account and api key
    WavecellOtpAndSms.configure do |config|
      config.api_key = 'api_key'
      config.sub_account = 'sub_account'
    end

    # Compose your message to be sent to users
    @sms_config = WavecellOtpAndSms::SendSms.new(
      source: 'Name of Source e.g ACME Inc.',
      destination: 'Mobile Number',
      text: 'Lorem Ipsum is simply dummy text',
      encoding: 'AUTO'
    )

    # Generate OTP
    @send_otp_config = WavecellOtpAndSms::SendOtp.new(
      destination: 'Mobile Number',
      country_code: 'PH',
      product_name: 'Lorem Ipsum'
    )

    # Verify using UID and verification
    @verify_otp_config = WavecellOtpAndSms::VerifyOtp.new(
      uid: '92849238423',
      code: '4454'
    )

    # Call .send to send the SMS
    @sms_config.send

  ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deguzman20/wavecell_otp_and_sms. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WavecellSms project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/deguzman20/wavecell_otp_with_sms/blob/master/CODE_OF_CONDUCT.md).
# wavecell_otp_and_sms
