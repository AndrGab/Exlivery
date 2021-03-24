defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "Andre",
      age: 23,
      email: "and@email.com",
      cpf: "1234567",
      address: "Rua 01, 9999"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de bacon",
      category: :pizza,
      quantity: 2,
      unity_price: Decimal.new("25.0")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua 01, 9999",
      items: build_list(2, :item),
      total_price: Decimal.new("100.00"),
      user_cpf: "1234567"
    }
  end
end
