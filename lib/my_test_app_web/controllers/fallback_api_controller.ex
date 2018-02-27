defmodule MyTestAppWeb.FallbackAPIController do
  use MyTestAppWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(MyTestAppWeb.ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :login_failed}), do: login_failed(conn)
  def call(conn, {:error, :login_not_found}), do: login_failed(conn)

  defp login_failed(conn) do
    conn
    |> put_status(401)
    |> render(MyTestAppWeb.ErrorView, "error.json", status: :unauthorized,  message: "Authentication failed!")
  end
end
