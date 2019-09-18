defmodule TurtleUI.Examples.Circle do
  @moduledoc """
   Circles

   Based on: https://github.com/sunjay/turtle/blob/master/examples/circle.rs
  """
  import TurtleUI

  def run do
    for steps <- 1..3 do
      circle(steps)
    end

    :ok
  end

  defp circle(steps) do
    repeat 360 do
      # move forward by number of steps
      forward(steps)
      # rotate to the right (clockwise) by 1 degree
      right(1)
    end
  end
end
