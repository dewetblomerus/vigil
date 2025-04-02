Mix.install([
  {:req, "~> 0.5"}
])

defmodule Runner do
  def run(old_status \\ nil) do
    new_status =
      case Req.get("http://localhost:4999/probes/liveness", retry: false) do
        {:ok, %{status: 200}} -> :alive
        _ -> :dead
      end

    dbg("Current status: #{new_status}")

    if old_status == :dead && new_status == :alive do
      System.cmd("say", ["-r", "150", "It's alive!"])
      System.cmd("say", ["-r", "50", "It's alive!"])
    end

    Process.sleep(2000)
    run(new_status)
  end
end

children = [
  {Task.Supervisor, name: Allow.TaskSupervisor}
]

Supervisor.start_link(children, strategy: :one_for_one)

Task.Supervisor.async(Allow.TaskSupervisor, fn ->
  dbg("Starting Vigil 🔭")
  Runner.run()
end)

Process.sleep(:infinity)
