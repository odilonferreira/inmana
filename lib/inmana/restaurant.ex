defmodule Inmana.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Supply

  # Constant for primary keys
  @primary_key {:id, :binary_id, autogenerate: true}

  # Constant for required params of Restaurant module that Jason will encode for json
  @required_params [:email, :name]

  # Jason module that makes the only @required_params more id of Restaurant will encode
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "restaurants" do
    field :email, :string
    field :name, :string

    has_many :supplies, Supply

    timestamps()
  end

  # Special structure that will validate data and show errors
  # Other validation in https://hexdocs.pm/ecto/Ecto.html
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
