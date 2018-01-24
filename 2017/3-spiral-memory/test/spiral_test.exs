defmodule SpiralTest do
  use ExUnit.Case

  test "Data from square 1 is carried 0 steps, since it's at the access port." do
    assert Spiral.number_of_steps_from(1) == 0
  end

  # test "Data from square 12 is carried 3 steps, such as: down, left, left." do
  #   assert Spiral.number_of_steps_from(12) == 3
  # end

  # test "Data from square 23 is carried only 2 steps: up twice." do
  #   assert Spiral.number_of_steps_from(23) == 2
  # end

  # test "Data from square 1024 must be carried 31 steps." do
  #   assert Spiral.number_of_steps_from(1024) == 31
  # end


  test "produce produces a spiral-like data structure" do
    assert Spiral.produce(26) ==
      [ { 1  , { 0 , 0 } },
        { 2  , { 1 , 0 } },
        { 3  , { 1 , 1 } },
        { 4  , { 0 , 1 } },
        { 5  , {-1 , 1 } },
        { 6  , {-1 , 0 } },
        { 7  , {-1 ,-1 } },
        { 8  , { 0 ,-1 } },
        { 9  , { 1 ,-1 } },
        { 10 , { 2 ,-1 } },
        { 11 , { 2 , 0 } },
        { 12 , { 2 , 1 } },
        { 13 , { 2 , 2 } },
        { 14 , { 1 , 2 } },
        { 15 , { 0 , 2 } },
        { 16 , {-1 , 2 } },
        { 17 , {-2 , 2 } },
        { 18 , {-2 , 1 } },
        { 19 , {-2 , 0 } },
        { 20 , {-2 ,-1 } },
        { 21 , {-2 ,-2 } },
        { 22 , {-1 ,-2 } },
        { 23 , { 0 ,-2 } },
        { 24 , { 1 ,-2 } },
        { 25 , { 2 ,-2 } },
        { 26 , { 3 ,-2 } } ]
  end

  test "get_coords produces the right coordinates" do
    assert Spiral.get_coords(1)  == { 0 , 0 }
    assert Spiral.get_coords(2)  == { 1 , 0 }
    assert Spiral.get_coords(3)  == { 1 , 1 }
    assert Spiral.get_coords(4)  == { 0 , 1 }
    assert Spiral.get_coords(5)  == {-1 , 1 }
    assert Spiral.get_coords(6)  == {-1 , 0 }
    assert Spiral.get_coords(7)  == {-1 ,-1 }
    assert Spiral.get_coords(8)  == { 0 ,-1 }
    assert Spiral.get_coords(9)  == { 1 ,-1 }
    assert Spiral.get_coords(10) == { 2 ,-1 }
    assert Spiral.get_coords(11) == { 2 , 0 }
    assert Spiral.get_coords(12) == { 2 , 1 }
    assert Spiral.get_coords(13) == { 2 , 2 }
    assert Spiral.get_coords(14) == { 1 , 2 }
    assert Spiral.get_coords(15) == { 0 , 2 }
    assert Spiral.get_coords(16) == {-1 , 2 }
    assert Spiral.get_coords(17) == {-2 , 2 }
    assert Spiral.get_coords(18) == {-2 , 1 }
    assert Spiral.get_coords(19) == {-2 , 0 }
    assert Spiral.get_coords(20) == {-2 ,-1 }
    assert Spiral.get_coords(21) == {-2 ,-2 }
    assert Spiral.get_coords(22) == {-1 ,-2 }
    assert Spiral.get_coords(23) == { 0 ,-2 }
    assert Spiral.get_coords(24) == { 1 ,-2 }
    assert Spiral.get_coords(25) == { 2 ,-2 }
    assert Spiral.get_coords(26) == { 3 ,-2 }
  end

  # test "go_left returns next coords as if you were to go left" do
  #   assert Spiral.go_left({ 3, 5 }) == { 2, 5 }
  # end

  # test "go_right returns next coords as if you were to go right" do
  #   assert Spiral.go_right({ 3, 5 }) == { 4, 5 }
  # end

  # test "go_up returns next coords as if you were to go up" do
  #   assert Spiral.go_up({ 3, 5 }) == { 3, 6 }
  # end

  # test "go_down returns next coords as if you were to go down" do
  #   assert Spiral.go_down({ 3, 5 }) == { 3, 4 }
  # end
end
