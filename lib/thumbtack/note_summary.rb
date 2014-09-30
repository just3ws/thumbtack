# encoding: utf-8

module Thumbtack
  # Represents a note summary as returned from Notes#list.
  #
  # @api public
  # @see Notes#list
  class NoteSummary
    # The attributes for a NoteSummary
    #
    # @api private
    ATTRIBUTES = [
      :id,
      :title,
      :digest,
      :created_at,
      :updated_at,
      :length
    ].freeze

    # The identifier for the note
    #
    # @return [String]
    #
    # @api public
    attr_reader :id

    # The title of the note
    #
    # @return [String]
    #
    # @api public
    attr_reader :title

    # The time at which the note was created
    #
    # @return [DateTime]
    #
    # @api public
    def created_at
      Types::DateTime.from_note_parameter(@created_at)
    end

    # The time at which the note was last updated
    #
    # @return [DateTime]
    #
    # @api public
    def updated_at
      Types::DateTime.from_note_parameter(@updated_at)
    end

    # 20 character hexadecimal SHA1 hash of the note text
    #
    # @return [String]
    #
    # @api public
    attr_reader :digest

    # The length of the note text
    #
    # @return [Integer]
    #
    # @api public
    attr_reader :length

    # Creates a new NoteSummary from a Hash
    #
    # @param [Hash{#to_sym => Object}] hash
    #   NoteSummary attributes
    #
    # @return [NoteSummary]
    #
    # @api private
    # @see Client#get
    def self.from_hash(hash)
      new(HashToDigest.rename(hash))
    end

    # Initialize a NoteSummary
    #
    # @param [Hash] attrs
    #   NoteSummary attributes
    #
    # @api private
    def initialize(attrs = EMPTY_HASH)
      ATTRIBUTES.each do |attribute|
        instance_variable_set "@#{attribute}", attrs.fetch(attribute)
      end
    end
  end
end
