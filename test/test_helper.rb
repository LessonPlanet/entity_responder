require 'bundler/setup'
require 'minitest/autorun'

# Configure Rails
ENV["RAILS_ENV"] = "test"

require 'minitest/reporters'
Minitest::Reporters.use!

require 'active_model'
require 'action_controller'
require 'action_controller/test_case'
require 'responders'
require 'entity_responder'

Routes = ActionDispatch::Routing::RouteSet.new
Routes.draw do
  resources :resources
end

class ActiveSupport::TestCase
  setup do @routes = Routes end
  self.test_order = :random
end

class AppResponder < ActionController::Responder
  include Responders::EntityResponder
end

class ResourcesController < ActionController::Base
  include Routes.url_helpers
  self.responder = AppResponder
  before_filter :set_resource
  respond_to :json

  def action
    options = params.slice(:flash, :flash_now)
    flash[:success] = "Flash is set" if params[:set_flash]
    respond_with(@resource, options)
  end
  alias :show    :action
  alias :create  :action
  alias :update  :action
  alias :destroy :action 

  def set_resource
    @resource = Resource.new(params[:id].to_i)
  end
end

class Resource
  attr_accessor :id

  include ActiveModel::Conversion
  include ActiveModel::Validations

  def initialize(id)
    @id = id
  end

  def persisted?
    true
  end
end
