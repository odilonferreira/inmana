defmodule InmanaWeb.WelcomeController do
  use InmanaWeb, :controller

  alias Inmana.Welcomer

  def index(connexion, params) do
    params
    |> Welcomer.welcome()
    |> handle_response(connexion)
  end

  defp handle_response({:ok, message}, connexion) do
    connexion
    |> put_status(:ok)
    |> json(%{message: message})
  end

  defp handle_response({:error, message}, connexion) do
    connexion
    |> put_status(:bad_request)
    |> json(%{message: message})
  end
end
