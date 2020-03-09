require 'httparty'

module WavecellOtpAndSms
  class VerifyOtp
    include HTTParty
    attr_accessor :uid, :code

    # Initialize Verification for OTP parameters
    def initialize(options = {})
      @uid = options[:uid]
      @code = options[:code]
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
        details = [destination, country_code, product_name]
        url = "https://api.wavecell.com/otp/v1/#{sub_account}/#{uid}?code=#{code}" + "?#{query_string}"
        HTTParty.post(url.to_str,
        :body => parameters.to_json,
        :headers => {
          "Content-Type" => "application/json",
          "Authorization" => "Bearer #{api_key}"
        })
      end

  end
end