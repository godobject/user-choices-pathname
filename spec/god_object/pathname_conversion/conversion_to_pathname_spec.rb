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

require 'spec_helper'

module GodObject
  module PathnameConversion

    describe ConversionToPathname do
      let(:conversion) { ConversionToPathname.new(:pathname) }

      describe ".described_by" do
        it "should trigger when given the tag :pathname" do
          described_class.described_by?(:pathname).should be_true
        end
 
        it "should not be triggered by others tags" do
          described_class.described_by?(:string).should_not be_true
          described_class.described_by?(:integer).should_not be_true
        end
      end
 
      describe "#descrition" do
        it "should describe its conversion result" do
          conversion.description.should eql "a pathname"
        end
      end

      describe "#suitable?" do
        it "should accept a String" do
          conversion.suitable?('test').should be_true
        end

        it "should accept a String-like" do
          input = /abc/

          def input.to_str
            to_s
          end

          conversion.suitable?(input).should be_true
        end

        it "should accept an Array" do
          conversion.suitable?(['abc', 'def']).should be_true
        end

        it "should not accept an other types" do
          conversion.suitable?(123).should_not be_true
          conversion.suitable?(/abc/).should_not be_true
          conversion.suitable?(Object.new).should_not be_true
        end
      end

      describe "#covert" do
        it "should convert a String to Pathname" do
          input = 'relative/path/to/something'
  
          conversion.convert(input).should eql(
            Pathname.new('relative/path/to/something'))
        end
  
        it "should convert an Array of Strings to an Array of Pathnames" do
          input = ['/tmp', 'relative/fnord', '/path/to/something']
  
          conversion.convert(input).should eql [
            Pathname.new('/tmp'),
            Pathname.new('relative/fnord'),
            Pathname.new('/path/to/something')
          ]
        end
      end

    end

  end
end
