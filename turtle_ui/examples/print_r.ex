defmodule TurtleUI.Examples.PrintR do
  @moduledoc """
  Print R

  Based on: https://github.com/sunjay/turtle/blob/master/examples/sample_logo_programs/print_R.txt
  """
  import TurtleUI

  def run do
    forward(200)

    repeat 3 do
      right(90)
      forward(100)
    end

    left(315)
    backward(125)
  end
end
