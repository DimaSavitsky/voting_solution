require 'logger'
require 'net/http'

class Connection


  def invoke
    res = Net::HTTP.post_form(uri + '/devops/invoke',
      {
        chaincodeSpec: {
          type: "GOLANG",
          chaincodeID: {
              name: "#{id}"
            },
          ctorMsg: {
            function: 'invoke',
            args: ['b', 'a', '10']
          }
        }
      }
    )
    logger.info res
  rescue => e
    logger.error e.message
  end

  private

  attr_reader :uri, :id, :logger

  def initialize(config)
    @id = config['blockchain_id']
    @uri = URI config['blockchain_api_url']
    @logger = Logger.new(STDOUT)
  end

end


'{"chaincodeSpec":{"type": "GOLANG","chaincodeID":{"name":"e58eb9f63a3434fd50d35b24897a88a0d7375a82021bacfc4e8299ddbaa6af7bfb7fe03df53b842ba6b512b16c3550e2c8f4537493408a3e6e8bd8eb19fc7523"},"ctorMsg":{ "function":"invoke","args":["a", "b", "10"]} }}'
