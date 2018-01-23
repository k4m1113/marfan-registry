module ReactWebpackRails
  module Install
    module MergeHelpers
      require 'generators/react_webpack_rails/package_merge'

      private

      def load_json(file)
        JSON.load(File.read(Rails.root.join(file)))
      end

      def merge_into_package(file, options = {})
        package_file = options.fetch(:package_file, 'package.json')
        copy_file file, "tmp/#{file}"

        extending = load_json("tmp/#{file}")
        base = load_json(package_file)

        merged = PackageMerge.new(base, extending).merge
        create_file package_file, JSON.pretty_generate(merged), force: options.fetch(:force, false)

        remove_file("tmp/#{file}")
      end
    end
  end
end
