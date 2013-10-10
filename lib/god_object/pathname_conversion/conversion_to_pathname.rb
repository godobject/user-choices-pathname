# encoding: UTF-8
=begin
Copyright GodObject Team <dev@godobject.net>, 2009-2013

This file is part of Pathname for user-choices.

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
=end

module GodObject
  module PathnameConversion

    # This class adds the type :pathname to user-choices.
    class ConversionToPathname < UserChoices::Conversion

      # Decides through which tag this conversion is triggered.
      #
      # The Pathname conversion is triggered by :pathname.
      #
      # @param [Symbol] conversion_tag a type tag used in a choice definition
      # @return [true, false] true, if the conversion should be triggered by
      #   the given tag, false otherwise
      def self.described_by?(conversion_tag)
        conversion_tag == :pathname
      end

      # Describes the conversion.
      #
      # @return [String] a description
      def description
        "a pathname"
      end

      # Answers if given value is suitable to be converted.
      #
      # For Pathname conversion it needs to be a String-like or Enumerable.
      #
      # @param [Object] actual 
      # @return [true, false] true if the given value is suitable, false
      #   otherwise 
      def suitable?(actual)
        actual.respond_to?(:to_str) || actual.kind_of?(Enumerable)
      end

      # Converts the value to Pathname.
      #
      # @param [String, Array] value a path
      # @return [Pathname, Array<Pathname>] the value as Pathname or, if an
      #   Enumerable was converted, an Array of Pathnames
      def convert(value)
        case value
          when Array
            pathnames = []

            value.each {|path| pathnames << Pathname.new(path) }

            pathnames
          else
            Pathname.new(value)
        end
      end

    end

  end
end
