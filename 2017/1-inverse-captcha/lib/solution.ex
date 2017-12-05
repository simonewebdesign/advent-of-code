defmodule Solution do
  def run do
    "input"
    |> File.read!
    |> InverseCaptcha.produce
    |> IO.puts
  end
end
