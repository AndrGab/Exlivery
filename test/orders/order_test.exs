defmodule Exlivery.Orders.OrdersTest do

  use ExUnit.Case
  alias Exlivery.Orders.Order

  import Exlivery.Factory

describe "build/2" do
  test "when all params are valid, returns an item" do
     user = build(:user)
     items = build_list(2, :item)

    response = Order.build(user, items)
    expected_response = {:ok, build(:order)}
    assert response == expected_response
  end
  test "when user is invalid, returns an error" do
    user = "banana"
    items = build_list(2, :item)

   response = Order.build(user, items)
   expected_response = {:error, "Invalid User or Items"}
   assert response == expected_response
 end
 test "when item is invalid, returns an error" do
  user = build(:user)
  items = "banana"

 response = Order.build(user, items)
 expected_response = {:error, "Invalid User or Items"}
 assert response == expected_response
end
end
end
