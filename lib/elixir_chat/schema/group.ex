defmodule Parabrew.Group do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "groups" do
    field :name, :string
    has_many :users, Parabrew.User
    has_many :messages, Parabrew.Message

    timestamps()
  end
end
