
require "spec_helper"

RSpec.describe WavecellOtpAndSms do
  before do
    WavecellOtpAndSms.configure do |config|
      config.api_key = ''
      config.sub_account = ''
    end

    @sms_config = WavecellOtpAndSms::SendSms.new(
      source: '',
      destination: '',
      text: '',
      encoding: ''
    )

    @otp_config = WavecellOtpAndSms::SendOtp.new(
      destination: '',
      country_code: '',
      product_name: ''
    )

    it "has a version" do
      expect(WavecellOtpAndSms::VERSION).not_to be nil
    end

    describe 'configure method' do
      it 'will has a configuration method' do
        config = WavecellOtpAndSms.configuration
        expect(config.api_key).to eq ''
        expect(config.sub_account).to eq ''
      end
    end

    describe 'initializing' do
      it 'will set payment details' do
        expect(@sms_config.source).to eq 'srouce'
        expect(@sms_config.destination).to eq 'mobile_number'
        expect(@sms_config.text).to eq 'Hello World! This is a test.'
        expect(@sms_config.encoding).to eq 'AUTO'
      end
    end

    describe 'sending the sms' do
      it 'will generate the wavecell url' do
        expect(@sms_config.pay).to include 'source=srouce'
        expect(@sms_config.pay).to include 'destination=mobile_number'
        expect(@sms_config.pay).to include 'text=Hello World! This is a test.'
        expect(@sms_config.pay).to include 'encoding=AUTO'
      end
    end

    describe 'initializing' do
      it 'will set payment details' do
        expect(@otp_config.destination).to eq 'srouce'
        expect(@otp_config.country_code).to eq 'mobile_number'
        expect(@otp_config.product_name).to eq 'Hello World! This is a test.'
      end
    end

  end
end