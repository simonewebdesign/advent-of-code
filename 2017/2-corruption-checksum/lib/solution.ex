defmodule Solution do
  alias CorruptionChecksum, as: C

  def run do
    "input"
    |> File.read!
    |> String.split("\n")
    |> Enum.map(&process_row/1)
    |> Enum.sum
    |> IO.puts
  end

  def process_row(row_str) do
    list = row_str
    |> String.split("\t")
    |> Enum.map(&String.to_integer/1)

    largest = C.largest_value(list)
    smallest = C.smallest_value(list)

    diff = largest - smallest
    diff
  end
end
