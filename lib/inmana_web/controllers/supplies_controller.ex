defmodule InmanaWeb.SuppliesController do
  use InmanaWeb, :controller

  alias Inmana.Supply
  alias InmanaWeb.FallbackController

  # Define who is responsible for handle fallbacks
  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Inmana.create_supply(params) do
      conn
      |> put_status(:created)
      # Render a view calls "create.json" and pass the supply created by keyword argument
      # Keyword argument is a key value struct
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- Inmana.get_supply(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end
end
