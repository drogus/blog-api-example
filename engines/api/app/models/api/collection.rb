class Api::Collection < SimpleDelegator
  attr_reader :presenter_class

  def initialize(obj, presenter_class)
    super(obj)
    @presenter_class = presenter_class
  end

  def to_json(*args)
    map { |o| presenter_class.new(o) }.to_json
  end
end
