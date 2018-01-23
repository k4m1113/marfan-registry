module ReactWebpackRails
  module Services
    class CamelizeKeys
      def call(data)
        case data.class.name
        when 'Array' then data.map { |element| call(element) }
        when 'Hash' then camelize_hash(data)
        else data
        end
      end

      def self.call(data)
        new.call(data)
      end

      private

      def camelize_hash(data)
        data.inject({}) do |hash, (key, value)|
          hash[key.to_s.camelize(:lower)] = call(value)
          hash
        end
      end
    end
  end
end
