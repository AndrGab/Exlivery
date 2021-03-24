defmodule Exlivery.Users.UserTest do

  use ExUnit.Case
  alias Exlivery.Users.User
  import Exlivery.Factory

describe "build/5" do
  test "when all params are valid, returns the user" do
   response =
    User.build(
      "Andre",
      "and@email.com",
      "1234567",
      23,
      "Rua 01, 9999"
    )
    expected_response = {:ok, build(:user)}

    assert response == expected_response
  end
  test "when there are invalid params, returns an error" do
    response =
     User.build(
       "Andre",
       "andrgab@gmail.com",
       "12345678",
       15,
       "Rua Londrina, 1021"
     )
     expected_response = {:error, "User is underage or CPF is not a string"}

     assert response == expected_response
   end
end
end
