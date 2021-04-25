defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}

  def by_uuid(uuid) do
    case Repo.get(Supply, uuid) do
      nil -> {:error, %{result: "Supply not found", status: :not_found}}
      supply -> {:ok, supply}
    end
  end

  # Other way to make the code above
  # defp handle_insert({:ok, %Supply{}} = result), do: {:ok, result}
  # defp handle_insert(nill), do: {:error, %{result: "Supply not found", status: :not_found}}
end
