defmodule MarkTest do
  use ExUnit.Case
  doctest Mark

  test "has a mark x for cross" do
    assert Mark.cross() == "X"
  end

  test "has a mark o for naught" do
    assert Mark.naught() == "O"
  end
end
