defmodule Parabrew.Content do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contents" do
    field :name, :string
    field :locale, :string
    field :content, :string
  end

  @doc false
  def changeset(content, attrs) do
    content
    |> cast(attrs, [:name, :locale, :content])
    |> validate_required([:name, :locale, :content])
  end

  def get_content(name) when is_bitstring(name) do
    locale = Gettext.get_locale(ParabrewWeb.Gettext)
    default_locale = Gettext.get_locale()

    content =
      Parabrew.Repo.get_by(
        Parabrew.Content,
        "SELECT * FROM contents WHERE name = ? AND locale = ?"
      )
  end
end
