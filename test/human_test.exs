defmodule HumanTest do 
  use ExUnit.Case
  doctest Human 
 
  test "has a mark" do
    human = Human.new()
    human = Human.add_mark(human, "X")  
    assert Human.get_mark(human) == "X"
  end 
end
