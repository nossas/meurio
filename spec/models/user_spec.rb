require 'spec_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should allow_value("email@addresse.foo").for(:email) }
  it { should_not allow_value("foo").for(:email) }
  it { should allow_value("(21) 99999999").for(:phone) }
  it { should allow_value("(21) 999999999").for(:phone) }
  it { should_not allow_value("(21) 9999999").for(:phone) }
  it { should allow_value("99999-999").for(:home_postcode) }
  it { should_not allow_value("99999999").for(:home_postcode) }

  describe "#fetch_address" do
    context "when the postcode is valid" do
      before do
        stub_request(:get, "http://brazilapi.herokuapp.com/api?cep=").
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
          to_return(:status => 200, :body => '[{"cep":{"valid":true,"result":true,"data":{"id":"19451","cidade":"Rio de Janeiro","logradouro":"Dona Mariana","bairro":"Botafogo","cep":"22280-020","tp_logradouro":"Rua","cidade_sem_acento":"rio de janeiro","cidade_ibge":"3304557","uf":"rj"},"message":""}}]', :headers => {})
      end

      it "should update user attributes" do
        subject.should_receive(:update_attributes).with({home_city: "Rio de Janeiro", home_address_street: "Rua Dona Mariana", home_address_district: "Botafogo", home_state: "rj"})
        subject.fetch_address
      end
    end

    context "when the postcode is invalid" do
      before do
        stub_request(:get, "http://brazilapi.herokuapp.com/api?cep=").
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
          to_return(:status => 200, :body => '[{"cep":{"valid":false}}]', :headers => {})        
      end

      it "should not update user attributes" do
        subject.should_not_receive(:update_attributes)
        subject.fetch_address
      end
    end
  end
end
