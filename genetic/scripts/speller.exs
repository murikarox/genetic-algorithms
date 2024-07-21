defmodule Speller do
  @behaviour Problem
  alias Types.Chromosome

  @word "pneumonoultramicroscopicsilicovolcanoconiosis"

  def genotype() do
    genes =
      Stream.repeatedly(fn -> Enum.random(?a..?z) end)
      |> Enum.take(String.length(@word))

    %Chromosome{genes: genes, size: String.length(@word)}
  end

  def fitness_function(chromosome) do
    target = @word
    guess = List.to_string(chromosome.genes)
    String.jaro_distance(target, guess)
  end

  def terminate?([best | _]) do
    best.fitness == 1
  end
end

solution = Genetic.run(Speller)

IO.write("\n")
IO.inspect(solution)
