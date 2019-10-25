defmodule TurtleUI.Examples.Flower do
  @moduledoc """
  A Flower
  """

  import TurtleUI

  def run do
    flower()
  end

  defp square do
    repeat 4 do
      forward(100)
      right(90)
    end
  end

  defp flower do
    repeat 36 do
      right(10)
      square()
    end
  end
end
