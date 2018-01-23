module ReactWebpackRails
  module RWRViewHelpers
    class ImagePaths
      class << self
        attr_accessor :include
      end

      @include = ['*.gif', '*.jpg', '*.jpeg', '*.png']

      def self.fetch
        project_assets = {}
        env = Sprockets::Railtie.build_environment(::Rails.application)

        env.logical_paths do |logical_path, filename|
          next unless @include.any? { |wildcard| File.fnmatch(wildcard.to_s, logical_path) }

          assets_root = ::Rails.application.config.action_controller.asset_host.present? \
            ? ::Rails.application.config.action_controller.asset_host \
            : '/'

          project_assets[logical_path] = File.join(
            assets_root,
            ::Rails.application.config.assets.prefix,
            env.file_digest(filename) ? env[logical_path].digest_path : logical_path
          )
        end

        Dir.mkdir(::Rails.root.join('tmp', 'cache')) unless File.exists?(::Rails.root.join('tmp', 'cache'))
        open(::Rails.root.join('tmp', 'cache', 'assets-mapping.json'), 'w') do |file|
          file.write project_assets.to_json
        end

        return project_assets
      end
    end
  end
end
