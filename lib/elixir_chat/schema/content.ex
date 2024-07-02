defmodule Parabrew.Content do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

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

    contents =
      Parabrew.Repo.all(
        from c in Parabrew.Content,
          where: c.name == ^name and (c.locale == ^locale or c.locale == ^default_locale)
      )

    if contents == nil || length(contents) == 0 do
      nil
    else
      default_idx =
        Enum.find_index(contents, fn content ->
          content.locale == default_locale
        end)

      if length(contents) == 2 do
        contents |> Enum.at(1 - default_idx)
      else
        contents |> Enum.at(default_idx)
      end
    end
  end
end
