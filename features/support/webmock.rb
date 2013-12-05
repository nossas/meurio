require 'webmock/cucumber'
WebMock.disable_net_connect!(:allow_localhost => true)

Before('@webmock') do
  stub_request(:any, /.*http:\/\/brazilapi.herokuapp.com\/api.*/).to_return(body: '[{"cep":{"valid":true,"result":true,"data":{"id":"10769","cidade":"Rio de Janeiro","logradouro":"Carlos de Sá","bairro":"Catete","cep":"22220-020","tp_logradouro":"Travessa","cidade_sem_acento":"rio de janeiro","cidade_ibge":"3304557","uf":"rj"},"message":""}}]')
end
