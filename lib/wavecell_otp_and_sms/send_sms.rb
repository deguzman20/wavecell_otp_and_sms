require 'httparty'

module WavecellOtpAndSms
  class SendSms
    include HTTParty
    attr_accessor :source, :destination, :text, :encoding

    # Initialize SMS parameters to send message to api
    def initialize(options = {})
      @source = options[:source]
      @destination = options[:destination]
      @text = options[:text]
      @encoding = options[:encoding]
    end

    # Call this to generate url for the api calls
    def send
      generate_url
    end

    private
      # Construct API using the parameters and initial configuration
      def generate_url
        api_key = WavecellOtpAndSms.configuration.api_key
        sub_account = WavecellOtpAndSms.configuration.sub_account
        puts `curl -X POST https://api.wavecell.com/sms/v1/#{sub_account}/single -H "Authorization: Bearer #{api_key}" -H "Content-Type:  application/json" -d $'{ "source": "#{source}", "destination": "+63#{destination}", "text": "#{text}", "encoding": "#{encoding}" }'`
      end

  end
end