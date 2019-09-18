defmodule TurtleUI.Examples.SierpinskiTriangle do
  @moduledoc """
  Draw a fractal triangle

  ## Examples
  
      iex> pen_up
      :ok
      iex> go_to -300, 250
      :ok
      iex> pen_down
      :ok
      iex> TurtleUI.Examples.SierpinskiTriangle.run(500, 7)

  Reference:
  Bitwise: A Life in Code by David Auerbach
  """

  import TurtleUI

  def run(length, depth) do
    sierpinski_triangle(length, depth)

    :ok
  end

  def sierpinski_triangle(length, depth) when depth > 0 do
    repeat 3 do
      sierpinski_triangle(length / 2, depth - 1)
      forward(length)
      right(120)
    end
  end

  def sierpinski_triangle(_, _), do: :stop
end
