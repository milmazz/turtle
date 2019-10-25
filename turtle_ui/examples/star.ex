defmodule TurtleUI.Examples.Star do
  @moduledoc """
  Star

  Based on: https://github.com/buckle2000/turtle-playback/blob/master/script
  """

  import TurtleUI

  def run do
    repeat 36 do
      fd(200)
      rt(-170)
    end
  end
end
