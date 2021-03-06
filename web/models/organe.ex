defmodule An.Organe do
  use An.Web, :model

  @types_map %{
    "API": "Assemblée parlementaire",
    "ASSEMBLEE": "Assemblée",
    "CJR": "Cour de justice de la République",
    "CMP": "Commission mixte paritaire",
    "CNPE": "",
    "CNPS": "",
    "COMNL": "",
    "COMPER": "",
    "COMSENAT": "",
    "COMSPSENAT": "",
    "CONFPT": "",
    "CONSTITU": "",
    "DELEG": "",
    "DELEGBUREAU": "",
    "DELEGSENAT": "",
    "GA": "Groupe d'amitié",
    "GE": "Groupe d'études",
    "GEVI": "",
    "GOUVERNEMENT": "",
    "GP": "Groupe parlementaire",
    "GROUPESENAT": "",
    "MINISTERE": "",
    "MISINFO": "",
    "MISINFOCOM": "",
    "MISINFOPRE": "",
    "OFFPAR": "",
    "ORGAINT": "",
    "ORGEXTPARL": "",
    "PARPOL": "Parti politique",
    "PRESREP": "",
    "SENAT": ""
  }

  @primary_key {:uid, :string, []}
  schema "organes" do
    field :type, :string
    field :code_type, :string
    field :libelle, :string
    field :raw_json, :map

    has_many :mandats, An.Mandat, foreign_key: :organe_uid
    has_many :deputes, through: [:mandats, :depute]

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:type, :code_type, :libelle])
    |> validate_required([:type, :code_type, :libelle])
  end
end
