require 'spec_helper'

describe OauthToken do
  let(:model) { OauthToken }

  describe 'ClassMethods' do
    let(:oauth_token) { FactoryGirl.build(:oauth_token) }

    describe '.new' do
      subject { oauth_token }
      its(:save) { should be_true }
    end

    describe '.find_or_create_with_omniauth' do
      subject { model.find_or_create_with_omniauth(auth) }
      let(:auth) { nil }

      context 'when user is exists' do
        before do
          oauth_token.save
        end

        let(:auth) { oauth_token }
        it 'returns a existing user' do
          should eql oauth_token
        end
      end

      context 'when user is not exists' do
        let(:auth) { { 'provider' => :twitter, 'uid' => Faker::Integer.random(8) } }
        it 'creates a new user' do
          subject.should eql model.last
        end
      end
    end
  end

  describe 'Validations' do
    describe :uid do
      it { should validate_presence_of(:uid) }
    end

    describe :provider do
      it { should validate_presence_of(:provider) }
    end
  end
end
