require 'yaml'
require 'lib/connection'

CONNECTION = Connection.new(YAML::load_file('config/openblockchain.yml'))


CONNECTION.invoke
