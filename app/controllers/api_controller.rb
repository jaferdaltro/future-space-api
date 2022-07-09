class ApiController < ApplicationController
  class ForbiddenAccess < StandardError; end
  include SimpleError
  self.simple_error_partial = "simple_error"
end
