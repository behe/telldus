defmodule Telldus.Request do
  def get(path, map \\ %{}) do
    oauth = Application.get_env(:telldus, :oauth)
    consumer = {oauth[:consumer_key], oauth[:consumer_secret], :hmac_sha1}
    :oauth.get("http://api.telldus.com/json#{path}" |> to_char_list, to_params(map), consumer, oauth[:access_token], oauth[:access_token_secret])
    |> parse_response
  end

  def post(path, map) do
    oauth = Application.get_env(:telldus, :oauth)
    consumer = {oauth[:consumer_key], oauth[:consumer_secret], :hmac_sha1}
    :oauth.post("http://api.telldus.com/json#{path}" |> to_char_list, to_params(map), consumer, oauth[:access_token], oauth[:access_token_secret], [])
    |> parse_response
  end

  defp to_params(map) do
    map |> Enum.map(fn({key, value}) ->
      {to_string(key), value}
    end)
  end

  defp parse_response({:ok, {_, _, body}}), do: body |> Poison.decode!
  defp parse_response(response), do: response
end
