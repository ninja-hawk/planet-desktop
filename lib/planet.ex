defmodule Planet do
  @app Mix.Project.config()[:app]
  def config_dir() do
    Path.join([Desktop.OS.home(), ".config", "planet"])
  end

  def start(:normal, []) do
    {:ok, sup} = Supervisor.start_link([Planet.Repo], name: __MODULE__, strategy: :one_for_one)
    {:ok, _} = Supervisor.start_child(sup, PlanetWeb.Sup)

    {:ok, _} =
      Supervisor.start_child(sup, {
        Desktop.Window,
        [
          app: @app,
          id: PlanetWindow,
          title: "PlanetApp",
          size: {600, 500},
          url: &PlanetWeb.Endpoint.url/0
        ]
      })
  end
end
