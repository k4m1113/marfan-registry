require 'net/http'

module ReactWebpackRails
  class NodeIntegrationRunner
    include NodeHelpers

    def initialize(integration_name, payload)
      @integration_name = integration_name
      @payload = payload
    end

    def run
      response = Net::HTTP.start(node_uri.host, node_uri.port) do |http|
        http.request(request)
      end
      if response.code.to_i >= 500
        fail Errors::NodeFailure, response.body
      else
        response.body.force_encoding('utf-8')
      end
    end

    private

    attr_reader :integration_name, :payload

    def data_hash
      { integrationName: integration_name, payload: payload }
    end

    def request
      request = Net::HTTP::Post.new(node_uri('run'))
      request.body = data_hash.to_json
      request
    end
  end
end
