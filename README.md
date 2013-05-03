# Responders::EntityResponder

[![Build
Status](https://travis-ci.org/LessonPlanet/entity_responder.png)](https://travis-ci.org/LessonPlanet/entity_responder)

The default [Rails
Responder](http://api.rubyonrails.org/classes/ActionController/Responder.html)
returns `head :no_content` for PUT and DELETE requests for non-HTML
requests (JSON, XML, etc.).  Some APIs or the JS frameworks that consume
them would prefer that the responses from those operations include the
entity in the same way that a POST request to create an entity does.

Per [RFC 2616 Section
9.7](http://tools.ietf.org/html/rfc2616#section-9.7) either way of
responding is valid:

> A successful response SHOULD be 200 (OK) if the response includes an
> entity describing the status, 202 (Accepted) if the action has not
> yet been enacted, or 204 (No Content) if the action has been
> enacted but the response does not include an entity.

This Responder takes the former approach and returns a 200 response and
the serialized version of the resource for PUT and DELETE requests.

## Installation

Add this line to your application's Gemfile:

    gem 'entity_responder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install entity_responder

## Usage

Add `Responders::EntityResponder` to your responder chain:

```ruby
class AppResponder < Responder
  include Responders::EntityResponder
end

class MyController < ApplicationController
  self.responder = AppResponder
end
```

Or use it with
[plataformatec/responders](https://github.com/plataformatec/responders):

```ruby
class MyController < ApplicationController
  responders Responders::EntityResponder
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
