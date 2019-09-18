defmodule Turtle.Motion do
  @moduledoc """
  Motion for Turtle
  """

  alias Turtle.Vector

  @type distance :: number
  @type angle :: number

  @doc """
  Move the turtle forward by the given amount of distance.

  Move the turtle forward by the specified distance, in the direction the
  turtle is headed

  ## Examples

      iex> turtle = %{%Turtle{} | angle: 0}
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.position(turtle)
      {0, 0}
      iex> turtle = Turtle.Motion.forward(turtle, 25)
      %Turtle{angle: 0, pen_down?: true, x: 25.0, y: 0.0}
      iex> Turtle.Motion.position(turtle)
      {25.0, 0.0}
      iex> turtle = Turtle.Motion.forward(turtle, -75)
      %Turtle{angle: 0, pen_down?: true, x: -50.0, y: 0.0}
      iex> Turtle.Motion.position(turtle)
      {-50.0, 0.0}

  """
  @spec forward(Turtle.t(), distance()) :: Turtle.t()
  def forward(%Turtle{} = turtle, distance), do: go(turtle, distance)

  @doc """
  Move the turtle backward by the given amount of distance.

  Move the turtle backward by distance, opposite to the direction the turtle is
  headed. Do not change the turtle’s heading.

  ## Examples

      iex> turtle = %Turtle{}
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.position(turtle)
      {0, 0}
      iex> turtle = Turtle.Motion.backward(turtle, 30)
      %Turtle{angle: 0, pen_down?: true, x: -30.0, y: 0.0}
      iex> Turtle.Motion.position(turtle)
      {-30.0, 0.0}

  """
  @spec backward(Turtle.t(), distance()) :: Turtle.t()
  def backward(%Turtle{} = turtle, distance), do: go(turtle, -distance)

  @doc """
  Turn turtle right (clockwise) by the given angle degrees.

  ## Examples

      iex> turtle = Turtle.new(angle: 22)
      %Turtle{angle: 22, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.heading(turtle)
      22
      iex> turtle = Turtle.Motion.right(turtle, 45)
      %Turtle{angle: 337, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.heading(turtle)
      337

  """
  @spec right(Turtle.t(), angle()) :: Turtle.t()
  def right(%Turtle{angle: angle} = turtle, ang) do
    new_angle = angle - ang
    %{turtle | angle: Integer.mod(new_angle, 360)}
  end

  @doc """
  Turn turtle left (counterclockwise) by the given angle (degress)

  ## Examples

      iex> turtle = Turtle.new(angle: 22)
      %Turtle{angle: 22, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.heading(turtle)
      22
      iex> turtle = Turtle.Motion.left(turtle, 45)
      %Turtle{angle: 67, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.heading(turtle)
      67

  """
  @spec left(Turtle.t(), angle()) :: Turtle.t()
  def left(%Turtle{} = turtle, angle), do: right(turtle, -1 * angle)

  @doc """
  Move turtle to an absolute position. Do not change the turtle’s orientation

  ## Examples

      iex> turtle = %Turtle{}
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.position(turtle)
      {0, 0}
      iex> turtle = Turtle.Motion.go_to(turtle, 60, 30)
      %Turtle{angle: 0, pen_down?: true, x: 60, y: 30}
      iex> Turtle.Motion.position(turtle)
      {60, 30}

  """
  @spec go_to(Turtle.t(), number(), number()) :: Turtle.t()
  def go_to(%Turtle{} = turtle, x, y), do: %{turtle | x: x, y: y}

  @doc """
  Move turtle to an absolute position. Do not change the turtle’s orientation

  ## Examples

      iex> turtle = %Turtle{}
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.position(turtle)
      {0, 0}
      iex> Turtle.Motion.go_to(turtle, {20, 80})
      %Turtle{angle: 0, pen_down?: true, x: 20, y: 80}

  """
  @spec go_to(Turtle.t(), Vector.t()) :: Turtle.t()
  def go_to(%Turtle{} = turtle, {x, y}), do: go_to(turtle, x, y)

  @doc """
  Set the turtle's first coordinate to x, leave second coordinate unchanged.

  ## Examples

      iex> turtle = %Turtle{}
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.position(turtle)
      {0, 0}
      iex> Turtle.Motion.set_x(turtle, 10)
      %Turtle{angle: 0, pen_down?: true, x: 10, y: 0}

  """
  @spec set_x(Turtle.t(), number()) :: Turtle.t()
  def set_x(%Turtle{y: y} = turtle, x), do: go_to(turtle, x, y)

  @doc """
  Set the turtle's second coordinate to y, leave first coordinate unchanged.

  ## Examples

      iex> turtle = %Turtle{}
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.position(turtle)
      {0, 0}
      iex> Turtle.Motion.set_y(turtle, 10)
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 10}

  """
  @spec set_y(Turtle.t(), number()) :: Turtle.t()
  def set_y(%Turtle{x: x} = turtle, y), do: go_to(turtle, x, y)

  @doc """
  Set the orientation of the turtle to `to_angle`, given in degress

  In this scenario, 0 is to the right, 90 is up, 180 is left, and 270 is down.

  ## Examples

      iex> turtle = %Turtle{}
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.set_heading(turtle, 45)
      %Turtle{angle: 45, pen_down?: true, x: 0, y: 0}

  """
  @spec set_heading(Turtle.t(), number()) :: Turtle.t()
  def set_heading(%Turtle{} = turtle, to_angle) do
    %{turtle | angle: to_angle}
  end

  @doc """
  Move turtle to the origin

  Move the turtle to the origin (coordinates: {0, 0}) and set its heading to
  its start-orientation (90 degress)

  ## Examples

      iex> turtle = %Turtle{x: 3, y: 20, angle: 45}
      %Turtle{angle: 45, pen_down?: true, x: 3, y: 20}
      iex> Turtle.Motion.home(turtle)
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}

  """
  def home(%Turtle{} = turtle) do
    turtle
    |> go_to(0, 0)
    |> set_heading(0)
  end

  @doc """
  Returns the turtle's current position {x, y}, as a Vector 2D.

  ## Examples

      iex> Turtle.Motion.position(%Turtle{})
      {0, 0}

  """
  @spec position(Turtle.t()) :: Vector.t()
  def position(%Turtle{x: x, y: y}), do: {x, y}

  @doc """
  Returns the turtle's current heading

  ## Examples

      iex> turtle = %Turtle{}
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> turtle = Turtle.Motion.left(turtle, 67)
      %Turtle{angle: 67, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.heading(turtle)
      67

  """
  @spec heading(Turtle.t()) :: angle
  def heading(%Turtle{angle: angle}), do: angle

  @doc """
  Returns the turtle's x coordinate.

  ## Examples

      iex> turtle = %Turtle{}
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> turtle = Turtle.Motion.right(turtle, 90)
      %Turtle{angle: 270, pen_down?: true, x: 0, y: 0}
      iex> turtle = Turtle.Motion.forward(turtle, 60)
      %Turtle{angle: 270, pen_down?: true, x: 0.0, y: -60.0}
      iex> Turtle.Motion.x_cor(turtle)
      0.0

  """
  @spec x_cor(Turtle.t()) :: number()
  def x_cor(%Turtle{x: x}), do: x

  @doc """
  Returns the turtle's y coordinate.

  ## Examples

      iex> turtle = %Turtle{}
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> turtle = Turtle.Motion.forward(turtle, 60)
      %Turtle{angle: 0, pen_down?: true, x: 60.0, y: 0.0}
      iex> Turtle.Motion.y_cor(turtle)
      0.0

  """
  @spec y_cor(Turtle.t()) :: number()
  def y_cor(%Turtle{y: y}), do: y

  @doc """
  Return the angle of the line from the turtle's position to {x, y}.

  ## Examples

      iex> turtle = Turtle.new(x: 10, y: 10)
      %Turtle{angle: 0, pen_down?: true, x: 10, y: 10}
      iex> Turtle.Motion.towards(turtle, {0, 0})
      225.0

  """
  @spec towards(Turtle.t(), Vector.t() | Turtle.t()) :: number()
  def towards(%Turtle{} = turtle, %Turtle{x: x, y: y}) do
    towards(turtle, {x, y})
  end

  def towards(%Turtle{x: x, y: y}, vector) do
    {x1, y1} = Vector.sub(vector, {x, y})

    y1
    |> :math.atan2(x1)
    |> Kernel.*(180.0)
    |> Kernel./(:math.pi())
    |> fmod()
  end

  @doc """
  Return the angle of the line from the turtle's position to {x, y}.

  ## Examples

      iex> turtle = %Turtle{}
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> turtle = Turtle.Motion.go_to(turtle, 10, 10)
      %Turtle{angle: 0, pen_down?: true, x: 10, y: 10}
      iex> Turtle.Motion.towards(turtle, 0, 0)
      225.0

  """
  @spec towards(Turtle.t(), number(), number()) :: number()
  def towards(%Turtle{} = turtle, x, y), do: towards(turtle, {x, y})

  @doc """
  Return the distance from the turtle to {x,y} in turtle step units

  ## Examples

      iex> turtle = %Turtle{}
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.distance(turtle, {30, 40})
      50.0
      iex> pen = Turtle.new()
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> pen = Turtle.Motion.forward(pen, 77)
      %Turtle{angle: 0, pen_down?: true, x: 77.0, y: 0.0}
      iex> Turtle.Motion.distance(turtle, pen)
      77.0

  """
  @spec distance(Turtle.t(), Vector.t() | Turtle.t()) :: number()
  def distance(%Turtle{} = turtle, %Turtle{x: x, y: y}) do
    distance(turtle, {x, y})
  end

  def distance(turtle, vector) do
    turtle
    |> position()
    |> Vector.sub(vector)
    |> Vector.abs()
  end

  @doc """
  Return the distance from the turtle to {x,y} in turtle step units

  ## Examples

      iex> turtle = %Turtle{}
      %Turtle{angle: 0, pen_down?: true, x: 0, y: 0}
      iex> Turtle.Motion.distance(turtle, 30, 40)
      50.0

  """
  @spec distance(Turtle.t(), number(), number()) :: number()
  def distance(%Turtle{} = turtle, x, y), do: distance(turtle, {x, y})

  ## Helpers
  @spec radians(number()) :: number()
  def radians(degress), do: degress * :math.pi() / 180

  @spec degress(number()) :: number()
  def degress(radians), do: radians * 180 / :math.pi()

  @spec truncate(number(), number()) :: number()
  defp truncate(number, decimals \\ 2) do
    number
    |> :erlang.float_to_list(decimals: decimals)
    |> :erlang.list_to_float()
  end

  @spec go(Turtle.t(), number()) :: Turtle.t()
  defp go(%Turtle{angle: angle, x: x, y: y} = turtle, distance) do
    radians = radians(angle)
    dx = distance * :math.cos(radians)
    dy = distance * :math.sin(radians)

    %{turtle | x: truncate(x + dx), y: truncate(y + dy)}
  end

  defp fmod(number, fullcircle \\ 360)
  defp fmod(number, fullcircle) when number >= 0, do: :math.fmod(number, fullcircle)
  defp fmod(number, fullcircle), do: :math.fmod(fullcircle + number, fullcircle)
end
