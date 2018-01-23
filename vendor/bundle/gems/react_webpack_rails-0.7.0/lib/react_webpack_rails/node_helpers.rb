module ReactWebpackRails
  module NodeHelpers
    def node_uri(path = '')
      URI(Rails.application.config.rwr.node_server_host).merge(path)
    end
  end
end
