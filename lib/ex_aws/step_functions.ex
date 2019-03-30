defmodule ExAws.StepFunctions do
  @namespace "AWSStepFunctions"
  @json_codec Application.get_env(:ex_aws, :json_codec) || Poison

  def start_execution(arn, name, input) do
    request(:start_execution, %{
      "input" => @json_codec.encode!(input),
      "name" => name,
      "stateMachineArn" => arn
    })
  end

  defp request(action, data, opts \\ %{}) do
    operation =
      action
      |> Atom.to_string()
      |> Macro.camelize()

    ExAws.Operation.JSON.new(:states, Map.merge(%{
      data: data,
      headers: [
        {"x-amz-target", "#{@namespace}.#{operation}"},
        {"content-type", "application/x-amz-json-1.0"}
      ]
    }, opts))
  end

end
