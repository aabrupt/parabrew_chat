defmodule ParabrewWeb.PageController do
  use ParabrewWeb, :controller
  import ParabrewWeb.Auth

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def signup(conn, _params) do
    if logged_in?(conn) do
      redirect(conn, to: ~p"/app")
    end

    render(conn, :signup)
  end
end
