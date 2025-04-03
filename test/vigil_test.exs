defmodule VigilTest do
  use ExUnit.Case
  doctest Vigil

  test "greets the world" do
    assert Vigil.hello() == :world
  end
end
