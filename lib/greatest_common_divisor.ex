defmodule Gcd do
  @moduledoc """
  Calculates the greatest common divisor between two numbers.
  """

  @doc """
  ## Examples

      iex> Gcd.start(20, 40)
      20

      iex> Gcd.start(24, 18)
      6

      iex> Gcd.start(35, 19)
      1

  `start` is agnostic to order of arguments:

      iex> Gcd.start(19, 35)
      1

      iex> Gcd.start(119, 544)
      17

      iex> Gcd.start(123094823475043873204, 54423432048)
      4

      iex> Gcd.start(2166, 6099)
      57

  """
  def start(a, b) do
    {largest, smallest} = get_largest(a, b)

    case remainder = rem(largest, smallest) do
      0 -> smallest
      _ -> start(smallest, remainder)
    end
  end

  defp get_largest(a, b) when a > b, do: {a, b}
  defp get_largest(a, b), do: {b, a}
end
