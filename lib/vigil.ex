defmodule Vigil do
  @moduledoc """
  Supervised Task
  """
  use Task, restart: :permanent

  def start_link(_) do
    Task.start_link(__MODULE__, :run, [1000])
  end

  def run(old_status \\ nil) do
    new_status =
      case Req.get("http://localhost:4999/probes/liveness", retry: false) do
        {:ok, %{status: 200}} -> :alive
        _ -> :dead
      end

    dbg("Current status: #{new_status}")

    if old_status == :dead && new_status == :alive do
      Process.sleep(5000)
      System.cmd("say", ["-r", "150", "It's alive!"])
      System.cmd("say", ["-r", "50", "It's alive!"])
    end

    Process.sleep(2000)
    run(new_status)
  end
end
