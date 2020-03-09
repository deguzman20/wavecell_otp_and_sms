require 'httparty'

module WavecellOtpAndSms
  class SendOtp
    include HTTParty
    attr_accessor :destination, :country_code, :product_name

    # Initialize OTP parameters
    def initialize(options = {})
      @destination = options[:destination]
      @country_code = options[:country_code]
      @product_name = options[:product_name]
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
        parameters = {
          destination: destination,
          country_code: country_code,
          product_name: product_name
        }
        query_string = parameters.to_a.map { |x| "#{x[0]}=#{x[1]}" }.join("&")
        url = "https://api.wavecell.com/otp/v1/#{sub_account}" + "?#{query_string}"
        HTTParty.post(url.to_str,
        :body => parameters.to_json,
        :headers => {
          "Content-Type" => "application/json",
          "Authorization" => "Bearer #{api_key}"
        })
      end

  end
end