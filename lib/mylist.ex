defmodule MyList do

  defmacro empty, do: :"MyList.Nil"

  def only(x), do: {x, empty()}
  def only(x1, x2), do: {x1, only(x2)}
  def only(x1, x2, x3), do: {x1, only(x2, x3)}

  def build([x]), do: only(x)
  def build([x | xs]), do: {x, build(xs)}

  def empty?(empty()), do: true
  def empty?(_), do: false

  def concat(lhs, empty()), do: lhs
  def concat(empty(), rhs), do: rhs
  def concat({x, empty()}, xs), do: {x, xs}
  def concat({x, xs}, ys), do: concat(only(x), concat(xs, ys))
end
