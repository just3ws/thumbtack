# encoding: utf-8

module Thumbtack
  module Types
    # Internal: Handles validation of Integer types as the values supported by
    # the Pinboard API.
    class Integer < Identity
      # The minimum allowable integer.
      MIN = 0
      # The maximum allowable integer.
      MAX = 2**32

      # Validate something is a valid integer parameter.
      #
      # value - An integer to validate.
      #
      # Returns nothing.
      # Raises Types::ValidationError if the value is not between 0 and 2^32.
      def self.validate(value)
        unless value >= MIN && value <= MAX
          fail ValidationError, "#{value} must be in range 0..2^32"
        end
        self
      end
    end
  end
end