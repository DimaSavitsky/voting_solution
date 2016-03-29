require 'logger'
require 'net/http'

class Connection

  def deploy
    to_send = '
      {
        "type": "GOLANG",
        "chaincodeID":{
            "path":"github.com/openblockchain/obc-peer/openchain/example/chaincode/chaincode_example02"
        },
        "ctorMsg": {
            "function":"init",
            "args":["a", "100", "b", "200"]
        }
      }'
    request('/devops/deploy', to_send)
  end


  def invoke
    to_send = '
      {
        "chaincodeSpec": {
          "type": "GOLANG",
          "chaincodeID": {
            "name": "' + id + '"
          },
          "ctorMsg": {
            "function": "invoke",
            "args": ["b", "a", "10"]
          }
        }
      }'

    request('/devops/invoke', to_send)
  end

  def query
    to_send = '
      {
        "chaincodeSpec":{
            "type": "GOLANG",
            "chaincodeID":{
                "name":"' + id + '"
            },
            "ctorMsg":{
                "function":"query",
                "args":["a"]
            },
            "secureContext": "jim"
        }
      }'

    request('/devops/query', to_send)
  end

  private

  attr_reader :uri, :id, :logger

  def initialize(config)
    @id = config['blockchain_id']
    @uri = URI config['blockchain_api_url']
    @logger = Logger.new(STDOUT)
  end

  def request(action, to_send)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(action, initheader = {'Content-Type' =>'application/json'})
    request.body = to_send
    resp = http.request(request)

    logger.info resp.body
  rescue => e
    logger.error e.message
  end

end
