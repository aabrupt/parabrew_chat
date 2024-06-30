defmodule ElixirChatWeb.MenuWeb do
  def get_menu(menu_id) when is_bitstring(menu_id) do
    case menu_id do
      "main" ->
        [
          {"Repository", "https://github.com/aabrupt", "fa-brands fa-github"},
          {"LinkedIn",
           "https://www.linkedin.com/in/ludvig-k%C3%A4llqvist-nygren-15558b2aa/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base%3BuRGnjJfLTrePL2%2FPmbW3Xg%3D%3D",
           "fa-brands fa-linkedin"}
        ]

      _ ->
        raise "Incorrect menu id: " <> menu_id
    end
  end
end
