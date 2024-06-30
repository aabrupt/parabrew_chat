defmodule ElixitChatWeb.GeneralComponents do
  @moduledoc """
  # General components
  General components for the application to use without requiring context.
  """
  use Phoenix.Component

  alias Phoenix.LiveView.JS

  import ElixirChatWeb.MenuWeb

  attr :menu_id, :string, required: true, doc: "The id of the menu to be used"
  attr :icon_href, :string, default: nil, doc: "The location of the icon link"
  attr :icon, :boolean, default: true, doc: "If the icon should be shown"

  def navbar(assigns) do
    ~H"""
    <nav>
      <ul class="w-full h-fit px-10 py-4 gap-10 flex justify-between text-white">
        <li
          :for={{name, href, icon} <- get_menu(@menu_id)}
          class="group bg-slate-800/20 rounded-lg px-5 py-2"
        >
          <a href={href}>
            <div class="flex items-center text-3xl">
              <i class={icon}></i>
              <div class="text-xl overflow-hidden pl-0 group-hover:pl-2 max-w-[0rem] group-hover:max-w-[10rem] [transition:max-width_300ms,padding_150ms]">
                <%= name %>
              </div>
            </div>
          </a>
        </li>
      </ul>
    </nav>
    """
  end

  attr :menu_id, :string, required: true, doc: "The id of the menu to be used"
  attr :icon_href, :string, default: nil, doc: "The location of the icon link"
  attr :icon, :boolean, default: true, doc: "If the icon should be shown"
  attr :cover, :boolean, default: false, doc: "If the menu should cover the entire screen"

  def side_nav(assigns) do
  end

  def footer(assigns) do
    ~H"""
    <footer>I am the footer</footer>
    """
  end

  def i18n(assigns) do
    ~H"""
    <div class="flex flex-col items-center text-[40px]">
      <i class="fa-solid fa-language"></i>
      <select
        class="py-0 px-5 pr-8 border-none cursor-pointer focus:outline-none focus:ring-0 bg-transparent text-xl capitalize"
        onchange="set_locale(this.value)"
      >
        <option
          :for={locale <- Gettext.known_locales(ElixirChatWeb.Gettext)}
          class="bg-gray-700 border-none focus-within:bg-sky-600 py-4 text-base capitalize"
          selected={locale == Gettext.get_locale(ElixirChatWeb.Gettext)}
          value={locale}
        >
          <%= locale %>
        </option>
      </select>
    </div>
    """
  end
end
