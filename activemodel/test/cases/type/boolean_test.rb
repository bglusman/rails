require "cases/helper"
require "active_model/type"

module ActiveModel
  module Type
    class BooleanTest < ActiveModel::TestCase
      def test_type_cast_boolean
        type = Type::Boolean.new
        assert type.cast("").nil?
        assert type.cast(nil).nil?

        assert type.cast(true)
        assert type.cast(1)
        assert type.cast("1")
        assert type.cast("t")
        assert type.cast("T")
        assert type.cast("true")
        assert type.cast("TRUE")
        assert type.cast("on")
        assert type.cast("ON")
        assert type.cast("y")
        assert type.cast("Y")
        assert type.cast("yes")
        assert type.cast("YES")
        assert type.cast(" ")
        assert type.cast("\u3000\r\n")
        assert type.cast("\u0000")
        assert type.cast("SOMETHING RANDOM")

        # explicitly check for false vs nil
        assert_equal false, type.cast(false)
        assert_equal false, type.cast(0)
        assert_equal false, type.cast("0")
        assert_equal false, type.cast("f")
        assert_equal false, type.cast("F")
        assert_equal false, type.cast("false")
        assert_equal false, type.cast("FALSE")
        assert_equal false, type.cast("off")
        assert_equal false, type.cast("OFF")
        assert_equal false, type.cast("n")
        assert_equal false, type.cast("N")
        assert_equal false, type.cast("no")
        assert_equal false, type.cast("NO")
      end
    end
  end
end
