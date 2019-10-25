defmodule TurtleUI.Examples.Pentagram do
  @moduledoc """
  A Pentagram
  """

  import TurtleUI

  def run do
    repeat 5 do
      forward(150)
      right(144)
    end
  end
end
