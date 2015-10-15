module Responders
  module EntityResponder
    protected

    # This is the common behavior for formats associated with APIs, such as :xml and :json.
    def api_behavior
      raise MissingRenderer.new(format) unless has_renderer?

      if !get? && !post?
        display resource, :status => :ok, :location => api_location
      else
        super
      end
    end
  end
end
