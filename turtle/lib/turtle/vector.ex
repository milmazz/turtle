defmodule Turtle.Vector do
  @moduledoc """
  2D Vector operations
  """

  @type t :: {number(), number()}

  @doc """
  Returns a new 2D Vector

  ## Examples

      iex> Turtle.Vector.new(1, 2)
      {1, 2}

  """
  @spec new(number(), number()) :: t()
  def new(x, y), do: {x, y}

  @doc """
  Returns the 2D point addition of `a` and `b`.

  ## Examples

      iex> a = Turtle.Vector.new(1, 2)
      {1, 2}
      iex> Turtle.Vector.add(a, a)
      {2, 4}

  """
  @spec add(t(), t()) :: t()
  def add({x0, y0}, {x1, y1}) do
    {x0 + x1, y0 + y1}
  end

  @doc """
  Returns the point subtraction of `a` and `b`.

  ## Examples

      iex> a = Turtle.Vector.new(1, 2)
      {1, 2}
      iex> Turtle.Vector.sub(a, a)
      {0, 0}

  """
  @spec sub(t(), t()) :: t()
  def sub({x0, y0}, {x1, y1}) do
    {x0 - x1, y0 - y1}
  end

  @doc """
  Returns the point negation

  ## Examples

      iex> a = Turtle.Vector.new(1, 2)
      {1, 2}
      iex> Turtle.Vector.neg(a)
      {-1, -2}

  """
  @spec neg(t()) :: t()
  def neg({x, y}) do
    {-x, -y}
  end

  @doc """
  Returns the point scalar multiplication

  ## Examples

      iex> a = Turtle.Vector.new(1, 2)
      {1, 2}
      iex> Turtle.Vector.mul(a, 2)
      {2, 4}

  """
  @spec mul(t(), number()) :: t()
  def mul({x, y}, a) when is_number(a) do
    {x * a, y * a}
  end

  @spec mul(t(), t()) :: number()
  def mul({x1, y1}, {x2, y2}) do
    x1 * x2 + y1 * y2
  end

  @doc """
  Returns the point scalar division

  ## Examples

      iex> a = Turtle.Vector.new(2, 4)
      {2, 4}
      iex> Turtle.Vector.div(a, 2)
      {1.0, 2.0}

  """
  @spec div(t(), number()) :: t()
  def div({x, y}, a) when is_number(a) do
    {x / a, y / a}
  end

  @doc """
  Return the absolute value of a vector

  ## Examples

      iex> v = Turtle.Vector.new(1, 2)
      {1, 2}
      iex> Turtle.Vector.abs(v)
      2.23606797749979

  """
  @spec abs(t()) :: number()
  def abs({x, y}) do
    :math.sqrt(x * x + y * y)
  end

  @doc """
  Rotate vector counterclockwise by angle
  """
  @spec rotate(t(), number()) :: t()
  def rotate({x, y}, angle) when is_number(angle) do
    {px, py} = {-y, x}
    angle = angle * :math.pi() / 180.0
    cos = :math.cos(angle)
    sin = :math.sin(angle)
    {x * cos + px * sin, y * cos + py * sin}
  end
end
