require 'httparty'

module WavecellOtpAndSms
  class VerifyOtp
    include HTTParty
    attr_accessor :uid, :code

    # Initialize OTP parameters
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
        details = [uid, code]
        parameters = {
          uid: uid,
          code: code
        }
        query_string = parameters.to_a.map { |x| "#{x[0]}=#{x[1]}" }.join("&")
        url = "https://api.wavecell.com/otp/v1/#{sub_account}/#{uid}?code=#{code}"
        HTTParty.get(url.to_str,
        :body => parameters.to_json,
        :headers => {
          "Content-Type" => "application/json",
          "Authorization" => "Bearer #{api_key}"
        })
      end

  end
end