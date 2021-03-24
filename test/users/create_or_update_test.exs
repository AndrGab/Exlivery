defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Andre",
        age: 23,
        email: "and@email.com",
        cpf: "1234567",
        address: "Rua 01, 9999"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated sucessfully"}

      assert response == expected_response
    end

    test "where there are invalid params, returns an error" do
      params = %{
        name: "Andre",
        age: 15,
        email: "and@email.com",
        cpf: "1234567",
        address: "Rua 01, 9999"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "User is underage or CPF is not a string"}

      assert response == expected_response
    end
  end
end
