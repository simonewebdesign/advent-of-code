defmodule InverseCaptchaTest do
  use ExUnit.Case

  test "1122 produces 3" do
    assert InverseCaptcha.produce("1122") == 3
  end

  test "1111 produces 4" do
    assert InverseCaptcha.produce("1111") == 4
  end

  test "1234 produces 0" do
    assert InverseCaptcha.produce("1234") == 0
  end

  test "91212129 produces 9" do
    assert InverseCaptcha.produce("91212129") == 9
  end

  describe "extract_next_char/2" do
    test "returns the next char in the sequence" do
      assert InverseCaptcha.extract_next_char([{"a", 0}, {"b", 1}], 0) == "b"
    end

    test "when the index is last, returns the first char" do
      assert InverseCaptcha.extract_next_char([{"a", 0}, {"b", 1}], 1) == "a"
    end
  end
end
