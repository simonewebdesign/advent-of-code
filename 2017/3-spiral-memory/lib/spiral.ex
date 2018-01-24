defmodule Spiral do
  def produce(number_of_squares) do
     initial_state = %{
       spiral: [ { 1, { 0, 0 } } ],
       direction: :right,
       did_row_once: false,
       row_length: 1,
     }

     limit = round(number_of_squares / 2 - 1 - 1 - 1 - 1)

     final_state = 1..limit
     |> Enum.reduce(initial_state, &reducer/2)

     final_state.spiral |> Enum.reverse()
  end

  def reducer(n, state) do

    { _, simple_state } = Map.pop(state, :spiral)
    IO.puts "Iteration ##{n}"
    IO.inspect simple_state, label: "STATE"

    %{spiral: [head|tail] = spiral,
      direction: dir,
      did_row_once: row_done,
      row_length: len,
    } = state

    { _counter, coordinates } = head

    # this code builds a row, by adding it to the spiral.
    # a row is nothing but a sequence of coords going to the same direction.
    IO.puts "-- Creating row #{n+1}"
    case row_done do
      true ->
        row = Enum.map(1..len, fn _ ->
          coords = go(dir, coordinates)
          { n+1, coords }
        end)

        %{
          spiral: row ++ spiral,
          direction: turn_left(dir),
          did_row_once: false,
          row_length: len+1,
        }

      false ->
        row = Enum.map(1..len, fn _ ->
          coords = go(dir, coordinates)
          { n+1, coords }
        end)

        %{
          spiral: row ++ spiral,
          direction: turn_left(dir),
          did_row_once: true,
          row_length: len,
        }
    end
  end

  def go(:left,  {x, y}), do: {x-1, y}
  def go(:right, {x, y}), do: {x+1, y}
  def go(:up,    {x, y}), do: {x, y+1}
  def go(:down,  {x, y}), do: {x, y-1}

  def turn_left(:left),  do: :down
  def turn_left(:right), do: :up
  def turn_left(:up),    do: :left
  def turn_left(:down),  do: :right

  # def number_of_steps_from(square_number) do
  #   case square_number do
  #     1 -> 0
  #     2 -> 0
  #     n ->
  #       0
  #   end
  # end

  # def transform(n) do
  #   coords = get_coords(n)
  #   { n, coords }
  # end

  # def get_coords(n) do
  #   case n do
  #     1  -> { 0 , 0 }
  #     2  -> { 1 , 0 }
  #     3  -> { 1 , 1 }
  #     4  -> { 0 , 1 }
  #     5  -> {-1 , 1 }
  #     6  -> {-1 , 0 }
  #     7  -> {-1 ,-1 }
  #     8  -> { 0 ,-1 }
  #     9  -> { 1 ,-1 }
  #     10 -> { 2 ,-1 }
  #     11 -> { 2 , 0 }
  #     12 -> { 2 , 1 }
  #     13 -> { 2 , 2 }
  #     14 -> { 1 , 2 }
  #     15 -> { 0 , 2 }
  #     16 -> {-1 , 2 }
  #     17 -> {-2 , 2 }
  #     18 -> {-2 , 1 }
  #     19 -> {-2 , 0 }
  #     20 -> {-2 ,-1 }
  #     21 -> {-2 ,-2 }
  #     22 -> {-1 ,-2 }
  #     23 -> { 0 ,-2 }
  #     24 -> { 1 ,-2 }
  #     25 -> { 2 ,-2 }
  #     n  ->
  #       { 0, 0 }
  #       # row = 1                       len = 1
  #       # row = 2                       len = 1
  #       # row = 3   4                   len = 2
  #       # row = 5   6                   len = 2
  #       # row = 7   8   9               len = 3
  #       # row = 10  11  12              len = 3
  #       # row = 13  14  15  16          len = 4
  #       # row = 17  18  19  20          len = 4
  #       # row = 21  22  23  24  25      len = 5
  #       # row = 26  27  28  29  30      len = 5
  #       # row = 31  32  33  34  35  36  len = 6
  #       # row = 37  38  39  40  41  42  len = 6

  #       # while x < len
  #       # in this row
  #       #   print as many items as the length
  #       #   when you're done, do it again
  #       #   when you're done again, increase the length and repeat

  #       #   in other words, if you did it once:
  #       #     do_it
  #       #     did_row_once = false

  #       #   else

  #       #     first:
  #       #       do_it
  #       #       set did_row_once = true

  #       #     then:
  #       #       do_it
  #       #       set did_row_once = false
  #       #       increase length +1
  #   end
  # end
end
