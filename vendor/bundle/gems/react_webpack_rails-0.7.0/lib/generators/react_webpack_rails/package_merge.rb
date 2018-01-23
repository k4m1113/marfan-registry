class PackageMerge
  def initialize(base, extending)
    @base_package = base
    @extending = extending
  end

  def merge
    %w(dependencies devDependencies scripts).each do |key|
      base_package[key] = merge_and_sort_level(key)
    end
    base_package
  end

  private

  attr_accessor :base_package, :extending

  def merge_and_sort_level(key)
    base_package[key].merge(extending.fetch(key, {})).sort.to_h
  end
end
