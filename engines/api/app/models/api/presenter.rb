require 'delegate'

class Api::Presenter < SimpleDelegator

  def to_json(*args)
    as_json(*args).to_json
  end

end
