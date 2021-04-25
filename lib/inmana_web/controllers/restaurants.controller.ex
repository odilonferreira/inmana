defmodule InmanaWeb.RestaurantsController do
  use InmanaWeb, :controller

  alias Inmana.Restaurant
  alias InmanaWeb.FallbackController

  # Define who is responsible for handle fallbacks
  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.create_restaurant(params) do
      conn
      |> put_status(:created)
      # Render a view calls "create.json" and pass the restaurant created by keyword argument
      # Keyword argument is a key value struct
      |> render("create.json", restaurant: restaurant)
    end
  end
end
