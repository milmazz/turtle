defmodule TurtleUI.Examples.Spiral do
  @moduledoc """
  Spiral
  """

  import TurtleUI

  def run(size, angle) do
    spiral(size, angle)

    :ok
  end

  defp spiral(size, _angle) when size > 100, do: :stop
  defp spiral(size, angle) do
    forward size
    right angle
    spiral(size + 2, angle)
  end
end
