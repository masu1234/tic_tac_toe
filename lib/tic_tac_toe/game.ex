defmodule TicTacToe.Game do
  use Agent
  import TicTacToe, only: [info: 1, debug: 2], warn: false

  @initial_grid [
    [:b, :b, :b],
    [:b, :b, :b],
    [:b, :b, :b]
  ]

  def start_link(_arg) do
    state = %{
      grid: @initial_grid
    }

    info("The game agent started.")

    Agent.start_link(fn -> state end, name: __MODULE__)
  end

  def get_grid, do: Agent.get(__MODULE__, & &1.grid)
end
