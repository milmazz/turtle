defmodule TurtleUI.Examples.Octagon do
  @moduledoc """
  An octagon
  """

  import TurtleUI

  def run do
    repeat 8 do
      forward 50
      right 45
    end
  end
end
