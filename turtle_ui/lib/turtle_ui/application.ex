defmodule TurtleUI.Application do
  @moduledoc """
  Starter application using the Scenic framework.
  """

  use Application

  def start(_type, _args) do
    # load the viewport configuration from config
    main_viewport_config = Application.get_env(:turtle_ui, :viewport)

    # start the application with the viewport
    children = [
      {Scenic, viewports: [main_viewport_config]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
