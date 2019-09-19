defmodule AuctionsystemWeb.PageController do
  use AuctionsystemWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
