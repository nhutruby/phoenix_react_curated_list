defmodule PhoenixReactCuratedListWeb.BlogController do
  use PhoenixReactCuratedListWeb, :controller

  alias PhoenixCuratedList.Blogs
  alias PhoenixCuratedList.Blogs.Blog
  require Logger
  def index(conn, _params) do
    blogs = Blogs.list_blogs()
    render(conn, "index.json", blogs: blogs)
  end

  def new(conn, _params) do
    changeset = Blogs.change_blog(%Blog{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"blog" => blog_params}) do
    with {:ok, %Blog{} = blog} <- Blogs.create_blog(blog_params) do
      blogs = Blogs.list_blogs()
      render(conn, "index.json", blogs: blogs)
    end
  end

  def show(conn, %{"id" => id}) do
    blog = Blogs.get_blog!(id)
    render(conn, "show.html", blog: blog)
  end

  def edit(conn, %{"id" => id}) do
    blog = Blogs.get_blog!(id)
    changeset = Blogs.change_blog(blog)
    render(conn, "edit.html", blog: blog, changeset: changeset)
  end

  def update(conn, %{"id" => id, "blog" => blog_params}) do
    blog = Blogs.get_blog!(id)

    with {:ok, %Blog{} = blog} <- Blogs.update_blog(blog, blog_params) do
      render(conn, "show.json", blog: blog)
    end
  end

  def delete(conn, %{"id" => id}) do
    blog = Blogs.get_blog!(id)
    {:ok, _blog} = Blogs.delete_blog(blog)

    blogs = Blogs.list_blogs()
    render conn, "index.json", blogs: blogs
  end
end
