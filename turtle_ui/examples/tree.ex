defmodule TurtleUI.Examples.Tree do
  @moduledoc """
  A tree using recursion

  Adapted from: https://goplay.space/
  """
  import TurtleUI

  def example do
    right(90)
    pen_up()
    backward(200)
    pen_down()
    run()
  end

  def run do
    branch(150, 0.7, 30, 5)
  end

  def branch(size, ratio, angle, iterations) do
    forward(size)

    if iterations > 0 do
      # rotate left and draw the child stem
      left(angle)
      branch(size * ratio, ratio, angle, iterations - 1)

      # rotate right and draw the child stem
      right(angle * 2)
      branch(size * ratio, ratio, angle, iterations - 1)

      # rotate back to the main stem position
      left(angle)
    end

    # walk to the start of the stem
    backward(size)
  end
end
