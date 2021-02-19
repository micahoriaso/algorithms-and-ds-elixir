defmodule Stack do

  defstruct size: 0, stack: []

  def new do
    %__MODULE__{}
  end
  def push(%__MODULE__{size: size, stack: stack_list} = stack, element) do
    %{stack | size: size + 1, stack: [element | stack_list]}
  end
  def pop(%__MODULE__{size: size, stack: [head | tail]} = stack) do
    case stack.size do
      0 -> {:error, "Stack is empty"}
      _ -> {head, %{stack | size: size - 1, stack: tail }}

    end
  end

  def peek(%__MODULE__{size: _size, stack: [head | _tail]}) do
    head
  end

  def peek(%__MODULE__{size: _size, stack: []}) do
    {:error, "Stack is empty"}
  end
  def size(%__MODULE__{size: size, stack: _stack}) do
    size
  end
end
