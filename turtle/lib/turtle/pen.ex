defmodule Turtle.Pen do
  @moduledoc """
  Pencil controls
  """

  @doc """
  Pull the pen up, the turtle will *not* draw while moving

  ## Examples

      iex> t = Turtle.new()
      %Turtle{
        angle: 0,
        pen_color: :black,
        pen_down?: true,
        pen_size: 1,
        visible: true,
        x: 0,
        y: 0
      }
      iex> Turtle.Pen.pen_up?(t)
      false
      iex> t = Turtle.Pen.pen_up(t)
      %Turtle{
        angle: 0,
        pen_color: :black,
        pen_down?: false,
        pen_size: 1,
        visible: true,
        x: 0,
        y: 0
      }
      iex> Turtle.Pen.pen_up?(t)
      true

  """
  def pen_up(%Turtle{} = turtle) do
    %{turtle | pen_down?: false}
  end

  @doc """
  Pull the pen down, the turtle will draw while moving

  ## Examples

      iex> t = Turtle.new()
      %Turtle{
        angle: 0,
        pen_color: :black,
        pen_down?: true,
        pen_size: 1,
        visible: true,
        x: 0,
        y: 0
      }
      iex> t = Turtle.Pen.pen_up(t)
      %Turtle{
        angle: 0,
        pen_color: :black,
        pen_down?: false,
        pen_size: 1,
        visible: true,
        x: 0,
        y: 0
      }
      iex> Turtle.Pen.pen_down?(t)
      false
      iex> t = Turtle.Pen.pen_down(t)
      %Turtle{
        angle: 0,
        pen_color: :black,
        pen_down?: true,
        pen_size: 1,
        visible: true,
        x: 0,
        y: 0
      }
      iex> Turtle.Pen.pen_down?(t)
      true

  """
  def pen_down(%Turtle{} = turtle) do
    %{turtle | pen_down?: true}
  end

  @doc """
  Returns true if pen is down, `false` if it's up.

  ## Examples

      iex> t = Turtle.new()
      %Turtle{
        angle: 0,
        pen_color: :black,
        pen_down?: true,
        pen_size: 1,
        visible: true,
        x: 0,
        y: 0
      }
      iex> Turtle.Pen.pen_down?(t)
      true
      iex> t = Turtle.Pen.pen_up(t)
      %Turtle{
        angle: 0,
        pen_color: :black,
        pen_down?: false,
        pen_size: 1,
        visible: true,
        x: 0,
        y: 0
      }
      iex> Turtle.Pen.pen_down?(t)
      false

  """
  def pen_down?(%Turtle{pen_down?: pen_down}) do
    pen_down
  end

  @doc """
  Returns true if pen is up, `false` if it's down.

  ## Examples

      iex> t = Turtle.new()
      %Turtle{
        angle: 0,
        pen_color: :black,
        pen_down?: true,
        pen_size: 1,
        visible: true,
        x: 0,
        y: 0
      }
      iex> Turtle.Pen.pen_up?(t)
      false
      iex> t = Turtle.Pen.pen_up(t)
      %Turtle{
        angle: 0,
        pen_color: :black,
        pen_down?: false,
        pen_size: 1,
        visible: true,
        x: 0,
        y: 0
      }
      iex> Turtle.Pen.pen_up?(t)
      true

  """
  def pen_up?(%Turtle{pen_down?: pen_down}) do
    not pen_down
  end

  @doc """
  Sets the thickness of the pen to the given size

  Thickness is measured in pixels
  """
  def pen_size(%Turtle{} = turtle, thickness) when thickness > 0 do
    %{turtle | pen_size: thickness}
  end

  @doc """
  Returns the size or thickness of the pen

  Thickness is measured in pixels.
  """
  def pen_size(%Turtle{pen_size: thickness}) do
    thickness
  end

  @doc """
  Sets the pen color
  """
  def pen_color(%Turtle{} = turtle, color) do
    %{turtle | pen_color: color}
  end

  @doc """
  Gets the pen's color.
  """
  def pen_color(%Turtle{pen_color: pen_color}) do
    pen_color
  end
end
