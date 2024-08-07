defmodule OneMax do
  @behaviour Problem
  alias Types.Chromosome

  @size 1000

  @impl true
  def genotype() do
    genes = for _ <- 1..@size, do: Enum.random(0..1)
    %Chromosome{genes: genes, size: length(genes)}
  end

  @impl true
  def fitness_function(chromosome) do
    Enum.sum(chromosome.genes)
  end

  @impl true
  def terminate?([best | _]) do
    best.fitness == @size
  end
end

solution = Genetic.run(OneMax)

IO.write("\n")
IO.inspect(solution)
