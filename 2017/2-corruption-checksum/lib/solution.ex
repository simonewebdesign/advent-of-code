defmodule Solution do
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

    Enum.max(list) - Enum.min(list)
  end
end
