defmodule TurtleUI do
  @moduledoc """
  Home Scene
  """
  use Scenic.Scene

  # import Scenic.Primitives, only: [line: 3, triangle: 3]
  import Scenic.Primitives, only: [line: 3]

  alias Scenic.{
    Graph,
    Primitive.Style.Paint.Color,
    ViewPort
  }

  require Logger

  @graph Graph.build(font: :roboto, font_size: 24, theme: :light)

  ## Client API
  # This macro is a just a convenience for those used to work with Logo :)
  defmacro repeat(number, opts) do
    quote do
      for _ <- 1..unquote(number), do: unquote(opts)

      :ok
    end
  end

  @doc """
  Move the turtle forward by the given amount of distance.

  ## Aliases

  * `fd/1`
  """
  def forward(distance) do
    GenServer.cast(__MODULE__, {:forward, distance})
  end

  @doc """
  Move the turtle forward by the given amount of distance.
  """
  def fd(distance) do
    GenServer.cast(__MODULE__, {:forward, distance})
  end

  @doc """
  Move the turtle backward by the given amount of distance.

  ## Aliases

  * `back/1`
  * `bk/1`
  """
  def backward(distance) do
    GenServer.cast(__MODULE__, {:backward, distance})
  end

  @doc """
  Move the turtle backward by the given amount of distance.
  """
  def back(distance) do
    GenServer.cast(__MODULE__, {:backward, distance})
  end

  @doc """
  Move the turtle backward by the given amount of distance.
  """
  def bk(distance) do
    GenServer.cast(__MODULE__, {:backward, distance})
  end

  @doc """
  Turn the turtle left(counterclockwise) by the given angle on degress

  ## Aliases

  * `lt/1`
  """
  def left(angle) do
    GenServer.cast(__MODULE__, {:left, angle})
  end

  @doc """
  Turn the turtle left(counterclockwise) by the given angle on degress
  """
  def lt(angle) do
    GenServer.cast(__MODULE__, {:left, angle})
  end

  @doc """
  Turn the turtle right(clockwise) by the given angle on degress

  ## Aliases

  * `rt/1`
  """
  def right(angle) do
    GenServer.cast(__MODULE__, {:right, angle})
  end

  @doc """
  Turn the turtle right(clockwise) by the given angle on degress
  """
  def rt(angle) do
    GenServer.cast(__MODULE__, {:right, angle})
  end

  @doc """
  Set the turtle's first coordinate to x, leave second coordinate unchanged.
  """
  def set_x(x) do
    GenServer.cast(__MODULE__, {:set_x, x})
  end

  @doc """
  Set the turtle's second coordinate to y, leave first coordinate unchanged.
  """
  def set_y(y) do
    GenServer.cast(__MODULE__, {:set_y, y})
  end

  @doc """
  Set the orientation of the turtle to `to_angle`, given in degress

  In this scenario, 0 is to the right, 90 is up, 180 is left, and 270 is down.
  """
  def set_heading(angle) do
    GenServer.cast(__MODULE__, {:set_heading, angle})
  end

  @doc """
  Move turtle to the origin

  Move the turtle to the origin (coordinates: {0, 0}) and set its heading to
  its start-orientation (90 degress)
  """
  def home do
    GenServer.cast(__MODULE__, :home)
  end

  @doc """
  Move turtle to an absolute position.

  Do not change the turtle's orientation
  """
  def go_to(point) do
    GenServer.cast(__MODULE__, {:go_to, point})
  end

  @doc """
  Move turtle to an absolute position.

  Do not change the turtle's orientation
  """
  def go_to(x, y) do
    GenServer.cast(__MODULE__, {:go_to, {x, y}})
  end

  @doc """
  Delete the turtle's drawings from the screen.

  This action do not move the turtle. State and position of the
  turtle as well as drawings of other turtles are not affected.
  """
  def cs do
    GenServer.cast(__MODULE__, :clear)
  end

  @doc """
  Delete the turtle's drawings from the screen.

  This action will re-center the turtle and set the state to its
  default values.
  """
  def reset do
    GenServer.cast(__MODULE__, :reset)
  end

  @doc """
  Undo the last turtle action

  Until reach the initial state.
  """
  def undo do
    GenServer.cast(__MODULE__, :undo)
  end

  @doc """
  Return the turtle's current position.
  """
  def position do
    GenServer.call(__MODULE__, :position)
  end

  @doc """
  Return the turtle's current heading.
  """
  def heading do
    GenServer.call(__MODULE__, :heading)
  end

  @doc """
  Returns the turtle's x coordinate.
  """
  def x_cor do
    GenServer.call(__MODULE__, :x_cor)
  end

  @doc """
  Returns the turtle's y coordinate.
  """
  def y_cor do
    GenServer.call(__MODULE__, :y_cor)
  end

  @doc """
  Returns the angle of the line from the turtle's position to the given {x, y}.
  """
  def towards(vector) do
    GenServer.call(__MODULE__, {:towards, vector})
  end

  @doc """
  Returns the angle of the line from the turtle's position to the given x, y.
  """
  def towards(x, y) do
    GenServer.call(__MODULE__, {:towards, {x, y}})
  end

  @doc """
  Return the distance from the turtle to {x, y} in turtle step units
  """
  def distance(vector) do
    GenServer.call(__MODULE__, {:distance, vector})
  end

  @doc """
  Return the distance from the turtle to x, y in turtle step units
  """
  def distance(x, y) do
    GenServer.call(__MODULE__, {:distance, {x, y}})
  end

  @doc """
  Returns the size or thickness of the pen.
  """
  def pen_size do
    GenServer.call(__MODULE__, :pen_size)
  end

  @doc """
  Returns the color of the pen.
  """
  def pen_color do
    GenServer.call(__MODULE__, :pen_color)
  end

  @doc """
  Pull the pen up, the turtle will **not** draw while moving.
  """
  def pen_up do
    GenServer.cast(__MODULE__, :pen_up)
  end

  @doc """
  Pull the pen down, the turtle will draw while moving.
  """
  def pen_down do
    GenServer.cast(__MODULE__, :pen_down)
  end

  @doc """
  Return `true` if the pen is down, `false` if it's up
  """
  def pen_down? do
    GenServer.call(__MODULE__, :pen_down?)
  end

  @doc """
  Sets the thickness of the pen to the given size

  Thickness is measured on pixels.
  """
  def pen_size(thickness) when thickness > 0 do
    GenServer.cast(__MODULE__, {:pen_size, thickness})
  end

  @doc """
  Sets the pen's color.
  """
  def pen_color(color) do
    GenServer.cast(__MODULE__, {:pen_color, color})
  end

  @doc false
  def initial_graph do
    @graph
  end

  ## Server
  def init(_, opts) do
    Process.register(self(), __MODULE__)

    state =
      opts
      |> initial_state()
      |> draw_turtle()

    {:ok, state, push: state.graph}
  end

  def handle_cast({move, value}, state)
      when move in [:forward, :backward, :go_to, :set_x, :set_y] do
    next_turtle = apply(Turtle, move, [state.turtle, value])

    if state.turtle.pen_down? do
      state = draw_turtle(state, next_turtle)

      {:noreply, state, push: state.graph}
    else
      new_state = %{state | turtle: next_turtle}

      {:noreply, new_state}
    end
  end

  def handle_cast({move, angle}, state) when move in [:left, :right, :set_heading] do
    next_turtle = apply(Turtle, move, [state.turtle, angle])
    # @TODO: Update triangle?
    # new_state = draw_turtle(state, next_turtle)
    new_state = %{state | turtle: next_turtle}

    {:noreply, new_state, push: state.graph}
  end

  def handle_cast(action, state) when action in [:pen_up, :pen_down] do
    next_turtle = apply(Turtle, action, [state.turtle])
    new_state = %{state | turtle: next_turtle}
    {:noreply, new_state, push: state.graph}
  end

  def handle_cast({:pen_size, thickness}, state) when thickness > 0 do
    next_turtle = apply(Turtle, :pen_size, [state.turtle, thickness])
    new_state = %{state | turtle: next_turtle}

    {:noreply, new_state, push: state.graph}
  end

  def handle_cast({:pen_color, color}, state) do
    if Color.verify(color) do
      next_turtle = apply(Turtle, :pen_color, [state.turtle, color])
      new_state = %{state | turtle: next_turtle}

      {:noreply, new_state, push: state.graph}
    else
      {:noreply, state}
    end
  end

  def handle_cast(:clear, state) do
    state = draw_turtle(%{state | graph: @graph, primitive_ids: []})
    {:noreply, state, push: state.graph}
  end

  def handle_cast(:home, state) do
    next_turtle = apply(Turtle, :home, [state.turtle])
    state = draw_turtle(state, next_turtle)

    {:noreply, state, push: state.graph}
  end

  def handle_cast(:reset, %{initial_state: state}) do
    state =
      state
      |> Map.put(:initial_state, state)
      |> draw_turtle()

    {:noreply, state, push: state.graph}
  end

  def handle_cast(:undo, %{primitive_ids: [_h | []]} = state) do
    {:noreply, state}
  end

  def handle_cast(:undo, %{primitive_ids: [h | t], graph: graph} = state) do
    graph = Graph.delete(graph, h)
    {:noreply, %{state | graph: graph, primitive_ids: t}, push: graph}
  end

  def handle_call({message, vector}, _, state) when message in [:distance, :towards] do
    {:reply, apply(Turtle, message, [state.turtle, vector]), state}
  end

  def handle_call(message, _, state)
      when message in [:heading, :x_cor, :y_cor, :position, :pen_size, :pen_color, :pen_down?] do
    {:reply, apply(Turtle, message, [state.turtle]), state}
  end

  ## Helpers
  defp draw_turtle(state) do
    # @TODO: Here we should take the current turtle position and draw a
    # triangle there based on its current heading, not just pointing to south.
    %{
      turtle: %{x: _x, y: _y},
      vp: %{width: _width, height: _height},
      thickness: _thickness,
      zoom_factor: _zoom_factor,
      graph: graph
    } = state

    # translate = {width / 2, height / 2}

    # triangle = {{x - thickness, y}, {x + thickness, y}, {x, y + thickness}}

    # graph =
    # triangle(graph, triangle,
    #  fill: :red,
    #  join: :round,
    #  translate: translate,
    #  scale: zoom_factor,
    #  id: state.next_uid
    # )

    %{
      state
      | graph: graph,
        next_uid: state.next_uid + 1,
        primitive_ids: [state.next_uid | state.primitive_ids]
    }
  end

  defp draw_turtle(
         state,
         %Turtle{
           x: x2,
           y: y2,
           pen_color: color,
           pen_size: size
         } = next_turtle
       ) do
    %{
      turtle: %{x: x1, y: y1},
      vp: %{width: width, height: height},
      zoom_factor: zoom_factor,
      graph: graph
    } = state

    translate = {width / 2, height / 2}

    graph =
      line(graph, {{x1, y1}, {x2, y2}},
        stroke: {size, color},
        translate: translate,
        scale: zoom_factor,
        id: state.next_uid
      )

    %{
      state
      | graph: graph,
        next_uid: state.next_uid + 1,
        primitive_ids: [state.next_uid | state.primitive_ids],
        turtle: next_turtle
    }
  end

  defp initial_state(opts) do
    {:ok, %ViewPort.Status{size: {width, height}}} = ViewPort.info(opts[:viewport])

    initial_state = %{
      turtle: Turtle.new(),
      graph: @graph,
      vp: %{width: width, height: height},
      zoom_factor: 1,
      thickness: 5,
      next_uid: 1,
      primitive_ids: []
    }

    Map.put(initial_state, :initial_state, initial_state)
  end
end
