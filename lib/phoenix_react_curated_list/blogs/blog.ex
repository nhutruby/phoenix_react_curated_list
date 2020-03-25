defmodule PhoenixCuratedList.Blogs.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :author, :string
    field :image, :string
    field :link, :string
    field :subtitle, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :subtitle, :image, :link, :author])
    |> validate_required([:title, :subtitle, :image, :link, :author])
  end
end
