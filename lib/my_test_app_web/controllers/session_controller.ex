defmodule MyTestAppWeb.SessionController do
  use MyTestAppWeb, :controller

  alias MyTestApp.Accounts.User

  action_fallback MyTestAppWeb.FallbackAPIController

  def sign_in(conn, %{"session" => %{"email" => email, "password" => pass}}) do
    with {:ok, user} <- User.find_and_confirm_password(email, pass),
         {:ok, jwt, _full_claims} <- Guardian.encode_and_sign(user, :api),
    do: render(conn, "sign_in.json", user: user, jwt: jwt)
  end
end
