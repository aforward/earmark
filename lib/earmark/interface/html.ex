defmodule Earmark.Interface.Html do

  alias Earmark.Block

  @type status     :: :ok | :error
  @type text_node  :: String.t
  @type node_name  :: String.t
  @type attr_name  :: String.t
  @type attr_value :: String.t
  @type node_attr  :: { attr_name, attr_value }
  @type node_attrs :: list(node_attr)
  @type ast_triple :: { node_name, node_attrs, ast_nodes }
  @type ast_node :: text_node | ast_triple
  @type ast_nodes :: list(ast_node)
  @moduledoc """
  Implements the transformation of the internal representation of parsed markdown
  to an external API, which is an easy renderable HTML oriented representation of
  the internal one.
  """

  @doc """
  The main entry into the API
  """
  @spec ast( Block.ts, Context.t ) :: {status, ast_nodes, Earmark.Message.ts}
  def ast(blocks, context) do 
    IO.inspect blocks
    with {transformed, context1} <- transform_blocks(blocks, context) do
      case context1.options.messages do 
        []     -> {:ok, transformed, []}
        errors -> {:error, transformed, errors}
      end
    end
  end

  defp transform_blocks(blocks, context) do 
  end
  

end
