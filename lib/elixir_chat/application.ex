defmodule Parabrew.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ParabrewWeb.Telemetry,
      Parabrew.Repo,
      {DNSCluster, query: Application.get_env(:elixir_chat, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Parabrew.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Parabrew.Finch},
      # Start a worker by calling: Parabrew.Worker.start_link(arg)
      # {Parabrew.Worker, arg},
      # Start to serve requests, typically the last entry
      ParabrewWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Parabrew.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ParabrewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
