defmodule Earmark.Interface do

  alias Earmark.Options

  @moduledoc """
    Exposes different transformations of the parsed markdown, suitable for

    - Easy transformation into text
    - Easy manipulation before further transformation

    As such eventually the transformation process shall be

    ```elixir
         ast = Earmark.Interface.html(some_markdown, optional_options)
         ast' = some_transformation(ast)
         output = Earmark.Renderer.html(ast')
    ```
  """

  @doc """
  Transforms markdown into an HTML rendering oriented AST
  """
  @spec html( String.t , Options.t ) :: any()
  def html(markdown, options \\ %Options{})

  def html(markdown, options) do
    {blocks, context} = Earmark.parse(markdown, options)
    case blocks do 
      [] -> {:ok, [], []}
      _  -> Earmark.Interface.Html.ast(blocks, context)
    end
  end
end
