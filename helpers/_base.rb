module Helpers
  module Base
    def setup(main_object)
      main_object.extend self
    end
  end
end
