defmodule Queue do
  defstruct size: 0, queue: [], head: nil, tail: nil
  def new() do
    %__MODULE__{}
  end

  def enqueue(%__MODULE__{size: size, queue: queue}, element) when queue == [] do
    IO.puts(queue)
    %__MODULE__{size: size + 1, queue: [element | queue], head: element, tail: element}
  end
  def enqueue(%__MODULE__{size: size, queue: queue}, element) do
    %__MODULE__{size: size + 1, queue: [element | queue], head: List.last(queue), tail: element}
  end

  def dequeue(%__MODULE__{size: _size, queue: queue}) when queue == [] do
    {:error, "Queue is empty"}
  end
  def dequeue(%__MODULE__{size: size, queue: queue}) do
    reversed_queue = Enum.reverse(queue)
    [head | tail] = reversed_queue
    new_queue = Enum.reverse(tail)
    {head, %__MODULE__{size: size - 1, queue: new_queue, head: List.last(new_queue), tail: hd(new_queue)}}
  end

  def peek(%__MODULE__{size: _size, queue: queue }) when queue == [] do
    {:error, "Queue is empty"}
  end

  def peek(%__MODULE__{size: _size, queue: queue }) do
    List.last(queue)
  end

  def size(%__MODULE__{size: size, queue: _queue}) do
    size
  end
end
