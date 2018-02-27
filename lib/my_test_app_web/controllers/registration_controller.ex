defmodule MyTestAppWeb.RegistrationController do
  use MyTestAppWeb, :controller

  alias MyTestApp.Accounts
  alias MyTestApp.Accounts.User

  action_fallback MyTestAppWeb.FallbackController

  def sign_up(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.register_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render("success.json", user: user)
    end
  end
end
