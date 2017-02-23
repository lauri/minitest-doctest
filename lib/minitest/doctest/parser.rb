module Minitest
  module Doctest
    class Parser
      attr_reader :source

      I = '>>'      # Input token
      O = '=>'      # Output token
      C = '\s*#\s*' # Comment line

      def initialize(source)
        @source = source
      end

      def parse
        blocks.map.with_index do |block, i|
          test_string(test_lines(block), i)
        end
      end

      def blocks
        regexp = /^(#{C}#{I}.*?)$(?!#{C}(?:#{I}|#{O}))/m
        @source.scan(regexp).flatten
      end

      def test_lines(block)
        block.lines.map do |line|
          case line
          when /#{I} (.*?)$/ then "_ = #{$1}"
          when /#{O} (nil)$/ then "assert_nil(_)"
          when /#{O} (.*?)$/ then "assert_equal(#{$1}, _)"
          end
        end
      end

      def test_string(lines, name)
        %{
          def test_#{name}
            #{lines.join($/)}
          end
        }
      end
    end
  end
end
