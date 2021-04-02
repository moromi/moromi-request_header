require 'spec_helper'

describe Moromi::RequestHeader::Default do
  describe '::header_names' do
    subject { Moromi::RequestHeader::Default.header_names(app_name: app_name) }

    let(:app_name) { 'moromi' }

    it 'returns property and header name mapping' do
      expected = {
        token: 'X-Moromi-Token',
        bundle_identifier: 'X-Moromi-Bundle-Identifier',
        bundle_version_string: 'X-Moromi-Bundle-Version-String',
        bundle_version: 'X-Moromi-Bundle-Version',
        platform: 'X-Moromi-Platform',
        os: 'X-Moromi-Os',
        os_version: 'X-Moromi-Os-Version',
        device_model: 'X-Moromi-Device-Model',
        device_uuid: 'X-Moromi-Device-Uuid',
        seconds_from_gmt: 'X-Moromi-Seconds-From-Gmt',
        language_code: 'X-Moromi-Language-Code',
        region_code: 'X-Moromi-Region-Code'
      }

      expect(subject).to eq expected
    end
  end

  describe '::header_name' do
    subject { Moromi::RequestHeader::Default.header_name(property, app_name: app_name) }

    let(:property) {}
    let(:app_name) { 'moromi' }

    context 'when property exists' do
      let(:property) { :token }
      it { expect(subject).to eq 'X-Moromi-Token' }
    end

    context 'when property not exists' do
      let(:property) { :not_found }
      it { expect(subject).to be_nil }
    end
  end

  describe '#create' do
    subject { Moromi::RequestHeader::Default.create(app_name: app_name, args: args) }

    let(:app_name) { 'moromi' }
    let(:args) do
      {
        token: 'Token',
        bundle_identifier: 'com.example.moromi.HttpHeader',
        bundle_version_string: '1.0.0',
        bundle_version: '1',
        platform: 'ios',
        os: 'ios',
        os_version: '10.2',
        device_model: 'iPhone8,1',
        device_uuid: 'd6d7ab34-38f8-4c30-ae4c-02632025c338',
        seconds_from_gmt: '32400',
        language_code: 'ja',
        region_code: 'JP'
      }
    end

    it { expect(subject).to be_instance_of Moromi::RequestHeader::Default }
    it { expect(subject.token).to eq 'Token' }
    it { expect(subject.bundle_identifier).to eq 'com.example.moromi.HttpHeader' }
    it { expect(subject.bundle_version_string).to eq '1.0.0' }
    it { expect(subject.bundle_version).to eq '1' }
    it { expect(subject.platform).to eq 'ios' }
    it { expect(subject.os).to eq 'ios' }
    it { expect(subject.os_version).to eq '10.2' }
    it { expect(subject.device_model).to eq 'iPhone8,1' }
    it { expect(subject.device_uuid).to eq 'd6d7ab34-38f8-4c30-ae4c-02632025c338' }
    it { expect(subject.seconds_from_gmt).to eq '32400' }
    it { expect(subject.language_code).to eq 'ja' }
    it { expect(subject.region_code).to eq 'JP' }
  end


  describe '#initialize' do
    subject { Moromi::RequestHeader::Default.new(headers: headers, app_name: app_name) }

    let(:headers) do
      {
        'X-Moromi-Token' => 'Token',
        'X-Moromi-Bundle-Identifier' => 'com.example.moromi.HttpHeader',
        'X-Moromi-Bundle-Version-String' => '1.0.0',
        'X-Moromi-Bundle-Version' => '1',
        'X-Moromi-Platform' => 'ios',
        'X-Moromi-Os' => 'ios',
        'X-Moromi-Os-Version' => '10.2',
        'X-Moromi-Device-Model' => 'iPhone8,1',
        'X-Moromi-Device-Uuid' => 'd6d7ab34-38f8-4c30-ae4c-02632025c338',
        'X-Moromi-Seconds-From-Gmt' => '32400',
        'X-Moromi-Language-Code' => 'ja',
        'X-Moromi-Region-Code' => 'JP'
      }
    end

    let(:app_name) { 'moromi' }

    it { expect(subject).to be_instance_of Moromi::RequestHeader::Default }
    it { expect(subject.token).to eq 'Token' }
    it { expect(subject.bundle_identifier).to eq 'com.example.moromi.HttpHeader' }
    it { expect(subject.bundle_version_string).to eq '1.0.0' }
    it { expect(subject.bundle_version).to eq '1' }
    it { expect(subject.platform).to eq 'ios' }
    it { expect(subject.os).to eq 'ios' }
    it { expect(subject.os_version).to eq '10.2' }
    it { expect(subject.device_model).to eq 'iPhone8,1' }
    it { expect(subject.device_uuid).to eq 'd6d7ab34-38f8-4c30-ae4c-02632025c338' }
    it { expect(subject.seconds_from_gmt).to eq '32400' }
    it { expect(subject.language_code).to eq 'ja' }
    it { expect(subject.region_code).to eq 'JP' }
  end

  describe '#to_hash' do
    subject { Moromi::RequestHeader::Default.new(headers: headers, app_name: app_name).to_hash }

    let(:headers) do
      {
        'X-Moromi-Token' => 'Token',
        'X-Moromi-Bundle-Identifier' => 'com.example.moromi.HttpHeader',
        'X-Moromi-Bundle-Version-String' => '1.0.0',
        'X-Moromi-Bundle-Version' => '1',
        'X-Moromi-Platform' => 'ios',
        'X-Moromi-Os' => 'ios',
        'X-Moromi-Os-Version' => '10.2',
        'X-Moromi-Device-Model' => 'iPhone8,1',
        'X-Moromi-Device-Uuid' => 'd6d7ab34-38f8-4c30-ae4c-02632025c338',
        'X-Moromi-Seconds-From-Gmt' => '32400',
        'X-Moromi-Language-Code' => 'ja',
        'X-Moromi-Region-Code' => 'JP'
      }
    end

    let(:app_name) { 'moromi' }

    it { expect(subject).to eq headers }
  end
end
