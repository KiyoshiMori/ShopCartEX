defmodule CartApiWeb.PageController do
  use CartApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
