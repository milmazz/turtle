defmodule TurtleUITest do
  use ExUnit.Case, async: true

  doctest TurtleUI

  describe "forward" do
    test "should move the turtle forward" do
      turtle = Turtle.new(pen_down?: false)
      state = %{turtle: turtle}
      assert {:reply, {0, 0}, ^state} = position(state)
      {:noreply, new_state} = forward(25, state)
      assert {:reply, {25.0, 0.0}, ^new_state} = position(new_state)

      {:noreply, new_state} = forward(-75, new_state)
      assert {:reply, {-50.0, 0.0}, ^new_state} = position(new_state)
    end
  end

  describe "backward" do
    test "should move the turtle backward" do
      turtle = Turtle.new(pen_down?: false)
      state = %{turtle: turtle}
      assert {:reply, {0, 0}, ^state} = position(state)
      {:noreply, new_state} = backward(25, state)
      assert {:reply, {-25.0, 0.0}, ^new_state} = position(new_state)

      {:noreply, new_state} = backward(-75, new_state)
      assert {:reply, {50.0, 0.0}, ^new_state} = position(new_state)
    end
  end

  describe "go_to" do
    test "should allow to move the turtle to an absolute position" do
      turtle = Turtle.new(pen_down?: false)
      state = %{turtle: turtle}
      assert {:reply, {0, 0}, ^state} = position(state)
      {:noreply, new_state} = go_to({25, 25}, state)
      assert {:reply, {25, 25}, ^new_state} = position(new_state)

      {:noreply, new_state} = go_to({-30.0, -75.0}, new_state)
      assert {:reply, {-30.0, -75.0}, ^new_state} = position(new_state)
    end
  end

  describe "left" do
    test "should allow to move the turtle to the left" do
      turtle = Turtle.new(pen_down?: false)
      state = %{turtle: turtle, graph: %{}}
      assert {:reply, 0, ^state} = heading(state)
      {:noreply, new_state, _} = left(22, state)
      assert {:reply, 22, ^new_state} = heading(new_state)

      {:noreply, new_state, _} = left(45, new_state)
      assert {:reply, 67, ^new_state} = heading(new_state)
    end
  end

  describe "right" do
    test "should allow to move the turtle to the right" do
      turtle = Turtle.new(pen_down?: false, angle: 22)
      state = %{turtle: turtle, graph: %{}}
      assert {:reply, 22, ^state} = heading(state)
      {:noreply, new_state, _} = right(45, state)
      assert {:reply, 337, ^new_state} = heading(new_state)
    end
  end

  describe "clear screen" do
    test "should allow to clear screen" do
      turtle = Turtle.new()
      initial_graph = TurtleUI.initial_graph()

      state = %{
        turtle: turtle,
        graph: initial_graph,
        vp: %{width: 700, height: 600},
        zoom_factor: 1,
        thickness: 5,
        next_uid: 1,
        primitive_ids: []
      }

      assert {:reply, {0, 0}, ^state} = position(state)
      {:noreply, new_state, _} = backward(25, state)
      assert {:reply, {-25.0, 0.0}, ^new_state} = position(new_state)
      assert {:noreply, result, _} = clear(new_state)

      assert Map.equal?(result.turtle, new_state.turtle)
      assert result.primitive_ids == [2]
    end
  end

  describe "reset" do
    test "should allow to reset" do
      turtle = Turtle.new()
      initial_graph = TurtleUI.initial_graph()

      state = %{
        turtle: turtle,
        graph: initial_graph,
        vp: %{width: 700, height: 600},
        zoom_factor: 1,
        thickness: 5,
        next_uid: 1,
        primitive_ids: []
      }

      assert {:reply, {0, 0}, ^state} = position(state)
      {:noreply, new_state, _} = backward(25, state)
      assert {:reply, {-25.0, 0.0}, ^new_state} = position(new_state)
      assert {:noreply, result, _} = new_state |> Map.put(:initial_state, state) |> reset()

      assert Map.equal?(result.turtle, turtle)
      assert result.primitive_ids == [1]
    end
  end

  ## Helpers
  defp position(state) do
    TurtleUI.handle_call(:position, nil, state)
  end

  def heading(state) do
    TurtleUI.handle_call(:heading, nil, state)
  end

  def forward(distance, state) do
    TurtleUI.handle_cast({:forward, distance}, state)
  end

  def backward(distance, state) do
    TurtleUI.handle_cast({:backward, distance}, state)
  end

  def go_to(vector, state) do
    TurtleUI.handle_cast({:go_to, vector}, state)
  end

  def left(angle, state) do
    TurtleUI.handle_cast({:left, angle}, state)
  end

  def right(angle, state) do
    TurtleUI.handle_cast({:right, angle}, state)
  end

  def clear(state) do
    TurtleUI.handle_cast(:clear, state)
  end

  def reset(state) do
    TurtleUI.handle_cast(:reset, state)
  end
end
