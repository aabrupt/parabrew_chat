defmodule Parabrew.Message do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "messages" do
    field :content, :string

    belongs_to :author, Parabrew.User
    belongs_to :group, Parabrew.Group

    timestamps()
  end

  def changeset(message, params \\ %{}) do
    message
    |> cast(params, [:content, :author, :group])
    |> validate_required([:content, :author, :group])
  end
end
