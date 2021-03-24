defmodule Exlivery.Orders.ItemsTest do

  use ExUnit.Case
  alias Exlivery.Orders.Item

  import Exlivery.Factory

describe "build/4" do
  test "when all params are valid, returns an item" do
    response = Item.build("Pizza de bacon", :pizza, "25.0", 2)
    expected_response = {:ok, build(:item)}
    assert response == expected_response
  end
  test "when there is a invalid category, returns an error" do
    response = Item.build("Pizza de bacon", :pizzas, "25.0", 2)
    expected_response = {:error, "Quantity is zero or invalid category selected"}
    assert response == expected_response

   end
   test "when there is a invalid price, returns an error" do
    response = Item.build("Pizza de bacon", :pizza, "teste", 2)
    expected_response = {:error, "Invalid price"}
    assert response == expected_response

  end
  test "when there is a invalid quantity, returns an error" do
    response = Item.build("Pizza de bacon", :pizza, "25.0", 0)
    expected_response = {:error, "Quantity is zero or invalid category selected"}
    assert response == expected_response

  end
end
end
