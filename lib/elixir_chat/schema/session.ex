defmodule Parabrew.Session do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "sessions" do
    field :token, :uuid, required: true
    belongs_to :user, Parabrew.User

    timestamps()
  end

  def changeset(session, params \\ %{}) do
    session
    |> cast(params, [:token, :user])
    |> validate_required([:token, :user])
  end
end
