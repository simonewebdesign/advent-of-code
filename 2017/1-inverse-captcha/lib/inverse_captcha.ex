defmodule InverseCaptcha do
  def produce(input) do
    sequence = input
    |> String.graphemes
    |> Enum.with_index

    Enum.reduce(sequence, [], fn tuple, acc ->
      to_intlist(sequence, tuple, acc)
    end)
    |> Enum.sum
  end

  def to_intlist(seq, {char, idx}, acc) do
    next_char = extract_next_char(seq, idx)

    if char == next_char do
      [ String.to_integer(char) | acc ]
    else
      acc
    end
  end

  def extract_next_char(seq, curr_idx) do
    result = Enum.find(seq, fn {_char, idx} ->
      idx == curr_idx + 1
    end)

    {next_char, _} =
      if result == nil do
        hd(seq)
      else
        result
      end

    next_char
  end
end
