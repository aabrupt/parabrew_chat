defmodule ParabrewWeb.Auth do
  use ParabrewWeb, :controller

  @spec logged_in?(Plug.Conn.t()) :: boolean()
  def logged_in?(conn) when is_struct(conn) do
    cookies = fetch_cookies(conn)
    auth_token = cookies |> Map.get(:authentication_token)

    if is_nil(auth_token) do
      false
    else
      Parabrew.Session.authenticate(auth_token)
    end
  end
end
