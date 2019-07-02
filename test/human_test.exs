defmodule HumanTest do 
  use ExUnit.Case
  doctest Human 
  import ExUnit.CaptureIO
 
  test "has a mark" do
    human = Human.new()
    |> Human.add_mark("X")  
    assert Human.get_mark(human) == "X"
  end 

  test "selects a move" do 
    human = Human.new()
    |> Human.add_mark("O")
    result = capture_io("2", fn->
      IO.write Human.get_move(human)
    end) 
    assert String.to_integer(String.last(result)) == 2
  end 
end
