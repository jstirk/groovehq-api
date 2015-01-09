require 'json'
require 'httparty'

module Groovehq
  class Ticket
    URL = "#{Groovehq::BASE_URL}/tickets"

    ATTRIBUTES = [
      :body,
      :from_email,
      :from_name,
      :to_email,
      :to_name,
      :tags,
    ]

    attr_accessor *ATTRIBUTES

    def initialize(attributes={})
      attributes.each do |key, value|
        self.send("#{key}=", value) if self.respond_to?("#{key}=")
      end
    end

    def to_json
      hash = {
        :from => hash_or_string_for(:from),
        :to => hash_or_string_for(:to),
        :body => body,
      }
      hash[:tags] = tags unless tags.nil?
      hash.to_json
    end

    def save
      HTTParty.post(URL,
                    :body => to_json,
                    :headers => headers
                   ).parsed_response
    end

    def from_first_name
      from_name.split(/\s/).first unless from_name.nil?
    end

    def from_last_name
      from_name.split(/\s/)[1..-1].join(' ') unless from_name.nil?
    end

    def to_first_name
      to_name.split(/\s/).first unless to_name.nil?
    end

    def to_last_name
      to_name.split(/\s/)[1..-1].join(' ') unless to_name.nil?
    end

  private

    def headers
      {
        'Authorization' => "Bearer #{Groovehq.auth_token}"
      }
    end

    def hash_or_string_for(attr)
      if self.send("#{attr}_first_name").nil?
        self.send("#{attr}_email")
      else
        {
          :email => self.send("#{attr}_email"),
          :first_name => self.send("#{attr}_first_name"),
          :last_name => self.send("#{attr}_last_name")
        }
      end
    end

  end
end
