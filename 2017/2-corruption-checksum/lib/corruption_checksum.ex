defmodule CorruptionChecksum do

  @doc """
  Finds the smallest value.

  ## Examples

      iex> CorruptionChecksum.smallest_value [5, 1, 9, 5]
      1

      iex> CorruptionChecksum.smallest_value [7, 5, 3]
      3

      iex> CorruptionChecksum.smallest_value [2, 4, 6, 8]
      2
  """
  def smallest_value(list) do
    list
    |> Enum.sort
    |> hd
  end

  @doc """
  Finds the largest value.

  ## Examples

      iex> CorruptionChecksum.largest_value [5, 1, 9, 5]
      9

      iex> CorruptionChecksum.largest_value [7, 5, 3]
      7

      iex> CorruptionChecksum.largest_value [2, 4, 6, 8]
      8
  """
  def largest_value(list) do
    list
    |> Enum.sort(&>=/2)
    |> hd
  end

end
