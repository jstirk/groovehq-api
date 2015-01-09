module Groovehq
  BASE_URL = "https://api.groovehq.com/v1"

module_function

  def auth_token
    @@auth_token
  end

  def auth_token=(token)
    @@auth_token = token
  end

end

require "groovehq/version"
require "groovehq/ticket"
