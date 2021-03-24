defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      cpf = "00000000000"
      user = build(:user, cpf: cpf)
      Exlivery.start_agents()
      UserAgent.save(user)

      item1 = %{
        description: "Pizza de bacon",
        category: :pizza,
        quantity: 2,
        unity_price: Decimal.new("25.0")
      }

      item2 = %{
        description: "Pizza cereja",
        category: :pizza,
        quantity: 3,
        unity_price: Decimal.new("15.0")
      }

      {:ok, user_cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params are valid, saves the order", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: cpf, items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there is no user with given cpf, returns", %{
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: "00000", items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "User not found"}
      assert response == expected_response
    end

    test "when there are invalid items, returns error", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: cpf, items: [%{item1 | quantity: 0}, item2]}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid Items"}
      assert response == expected_response
    end

    test "when there is no items, returns error", %{
      user_cpf: cpf
    } do
      params = %{user_cpf: cpf, items: []}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid User or Items"}
      assert response == expected_response
    end
  end
end
