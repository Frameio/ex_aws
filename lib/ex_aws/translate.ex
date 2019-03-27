defmodule ExAws.Translate do
  @namespace "AWSShineFrontendService_20170701"

  def translate_text(text, target_language_code, source_language_code \\ "en") do
    request(:translate_text, %{
      "SourceLanguageCode" => source_language_code,
      "TargetLanguageCode" => target_language_code,
      "Text" => text
    })
  end

  defp request(action, data, opts \\ %{}) do
    operation =
      action
      |> Atom.to_string()
      |> Macro.camelize()

    ExAws.Operation.JSON.new(:translate, Map.merge(%{
      data: data,
      headers: [
        {"x-amz-target", "#{@namespace}.#{operation}"},
        {"content-type", "application/x-amz-json-1.1"}
      ]
    }, opts))
  end
end
