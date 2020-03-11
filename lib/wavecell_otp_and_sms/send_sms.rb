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
        details = [source, destination, text, encoding]
        parameters = {
          source: source,
          destination: destination,
          text: text,
          encoding: encoding
        }
        query_string = parameters.to_a.map { |x| "#{x[0]}=#{x[1]}" }.join("&")
        url = "https://api.wavecell.com/sms/v1/#{sub_account}/single" + "?#{query_string}"
        HTTParty.post(url.to_str,
        :body => parameters.to_json,
        :headers => {
          "Content-Type" => "application/json",
          "Authorization" => "Bearer #{api_key}"
        })
      end

  end
end