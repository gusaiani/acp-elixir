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

  @doc """
  The function below calculates the average number of times
  `E1`, basically the remainder calculation, is performed for `n`.

  This is question 6 of section 1.1.

  So T5 would be the average number of times for n = 5, which is
  calculated performing gcd on m=[1, 2, 3, 4, 5], *without* reordering.

  ## Examples

      iex> Gcd.t(5)
      2.6

  """
  def t(n) do
    Enum.reduce(1..n, 0, fn i, acc -> acc + unordered_start(i, n) end) / n
  end

  def unordered_start(m, n, times \\ 0)
  def unordered_start(m, n, times) do
    case remainder = rem(m, n) do
      0 -> times + 1
      _ -> unordered_start(n, remainder, times + 1)
    end
  end
end
