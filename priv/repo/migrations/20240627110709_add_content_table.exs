defmodule ElixirChat.Repo.Migrations.AddContentTable do
  use Ecto.Migration

  def change do
    create table(:contents) do
      add :name, :string
      add :locale, :string
      add :content, :string
    end
  end
end
