defmodule Turtle do
  @moduledoc """
  Turtle graphics is a popular and fun way to learn programming.

  It was part of the original Logo programming language developed by Seymour
  Paper and Wally Feurzig in 1966.

  To give you an idea, imagine a robotic turtle starting at `{0, 0}` in the x-y
  plane. And after giving a command like `Turtle.forward(%Turtle{}, 15)`, it
  moves 15 pixels in the direction it is facing, drawing a line as it moves.
  Give it the command `Turtle.right(turtle, 15)`, and it rotates in-place 15
  degrees clockwise.

  By combining together these and similar commands, complex shapes and pictures
  can easily be drawn.
  """

  @type t :: %__MODULE__{
          x: number(),
          y: number(),
          angle: integer(),
          pen_down?: boolean(),
          pen_color: atom() | tuple(),
          pen_size: pos_integer(),
          visible: boolean()
        }
  defstruct x: 0,
            y: 0,
            angle: 0,
            pen_down?: true,
            pen_color: :black,
            pen_size: 1,
            visible: true

  alias __MODULE__.{Motion, Pen}

  @doc delegate_to: {Motion, :forward, 2}
  defdelegate forward(turtle, distance), to: Motion

  @doc delegate_to: {Motion, :forward, 2}
  defdelegate fd(turtle, distance), to: Motion, as: :forward

  @doc delegate_to: {Motion, :backward, 2}
  defdelegate back(turtle, distance), to: Motion, as: :backward

  @doc delegate_to: {Motion, :backward, 2}
  defdelegate bk(turtle, distance), to: Motion, as: :backward

  @doc delegate_to: {Motion, :backward, 2}
  defdelegate backward(turtle, distance), to: Motion

  @doc delegate_to: {Motion, :right, 2}
  defdelegate right(turtle, angle), to: Motion

  @doc delegate_to: {Motion, :right, 2}
  defdelegate rt(turtle, angle), to: Motion, as: :right

  @doc delegate_to: {Motion, :left, 2}
  defdelegate left(turtle, angle), to: Motion

  @doc delegate_to: {Motion, :left, 2}
  defdelegate lt(turtle, angle), to: Motion, as: :left

  @doc delegate_to: {Motion, :go_to, 3}
  defdelegate go_to(turtle, x, y), to: Motion

  @doc delegate_to: {Motion, :go_to, 2}
  defdelegate go_to(turtle, vector), to: Motion

  @doc delegate_to: {Motion, :go_to, 3}
  defdelegate setpos(turtle, x, y), to: Motion, as: :go_to

  @doc delegate_to: {Motion, :go_to, 2}
  defdelegate setposition(turtle, x, y), to: Motion, as: :go_to

  @doc delegate_to: {Motion, :set_x, 2}
  defdelegate set_x(turtle, x), to: Motion

  @doc delegate_to: {Motion, :set_y, 2}
  defdelegate set_y(turtle, y), to: Motion

  @doc delegate_to: {Motion, :set_heading, 2}
  defdelegate set_heading(turtle, to_angle), to: Motion

  @doc delegate_to: {Motion, :set_heading, 2}
  defdelegate seth(turtle, to_angle), to: Motion, as: :set_heading

  @doc delegate_to: {Motion, :home, 1}
  defdelegate home(turtle), to: Motion

  @doc delegate_to: {Motion, :home, 1}
  defdelegate reset(turtle), to: Motion, as: :home

  @doc delegate_to: {Motion, :position, 1}
  defdelegate position(turtle), to: Motion

  @doc delegate_to: {Motion, :heading, 1}
  defdelegate heading(turtle), to: Motion

  @doc delegate_to: {Motion, :x_cor, 1}
  defdelegate x_cor(turtle), to: Motion

  @doc delegate_to: {Motion, :y_cor, 1}
  defdelegate y_cor(turtle), to: Motion

  @doc delegate_to: {Motion, :towards, 2}
  defdelegate towards(turtle, vector), to: Motion

  @doc delegate_to: {Motion, :towards, 3}
  defdelegate towards(turtle, x, y), to: Motion

  @doc delegate_to: {Motion, :distance, 2}
  defdelegate distance(turle, vector), to: Motion

  @doc delegate_to: {Motion, :distance, 3}
  defdelegate distance(turtle, x, y), to: Motion

  @doc delegate_to: {Pen, :pen_up, 1}
  defdelegate pen_up(turtle), to: Pen

  @doc delegate_to: {Pen, :pen_down, 1}
  defdelegate pen_down(turtle), to: Pen

  @doc delegate_to: {Pen, :pen_down?, 1}
  defdelegate pen_down?(turtle), to: Pen

  @doc delegate_to: {Pen, :pen_up?, 1}
  defdelegate pen_up?(turtle), to: Pen

  @doc delegate_to: {Pen, :pen_size, 1}
  defdelegate pen_size(turtle), to: Pen

  @doc delegate_to: {Pen, :pen_size, 2}
  defdelegate pen_size(turtle, thickness), to: Pen

  @doc delegate_to: {Pen, :pen_color, 1}
  defdelegate pen_color(turtle), to: Pen

  @doc delegate_to: {Pen, :pen_color, 2}
  defdelegate pen_color(turtle, color), to: Pen

  @doc """
  Creates a new Turtle.
  """
  def new(opts \\ []) do
    struct(__MODULE__, opts)
  end

  @doc """
  Makes the turtle invisible.
  """
  def hide(%Turtle{} = turtle) do
    %{turtle | visible: false}
  end

  @doc """
  Makes the turtle visible.
  """
  def show(%Turtle{} = turtle) do
    %{turtle | visible: true}
  end

  @doc """
  Returns `true` is turtle is visible, otherwise `false`
  """
  def visible?(%Turtle{visible: visible}) do
    visible
  end
end
