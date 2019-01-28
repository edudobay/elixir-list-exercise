defmodule MyListTest do
  use ExUnit.Case
  doctest MyList

  test "empty list is empty" do
    assert MyList.empty?(MyList.empty)
  end

  test "singleton list is not empty" do
    assert not MyList.empty?(MyList.only(1))
  end

  test "list is equal to itself" do
    assert MyList.only(1) == MyList.only(1)
  end

  test "concat with empty returns same list" do
    assert MyList.concat(MyList.only(1), MyList.empty()) == MyList.only(1)
    assert MyList.concat(MyList.empty(), MyList.only(1)) == MyList.only(1)
  end

  test "concat two singleton lists gives list of two" do
    assert MyList.concat(MyList.only(1), MyList.only(2)) == MyList.only(1, 2)
  end

  test "concat singleton list with list of two" do
    assert MyList.concat(MyList.only(1), MyList.only(2, 3)) == MyList.only(1, 2, 3)
  end

  test "concat list of two with singleton list" do
    assert MyList.concat(MyList.only(1, 2), MyList.only(3)) == MyList.only(1, 2, 3)
  end

  test "concat big lists" do
    assert MyList.concat(
      MyList.build([6, 4, 8, 0]),
      MyList.build([5, 13, 57, 448, 1024])
    ) == MyList.build([6, 4, 8, 0, 5, 13, 57, 448, 1024])
  end
end
