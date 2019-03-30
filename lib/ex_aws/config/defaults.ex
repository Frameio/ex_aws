defmodule ExAws.Config.Defaults do
  @moduledoc """
  Defaults for each service
  """

  @common %{
    access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
    secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role],
    http_client: ExAws.Request.Hackney,
    json_codec: Jason,
    retries: [
      max_attempts: 10,
      base_backoff_in_ms: 10,
      max_backoff_in_ms: 10_000
    ],
    normalize_path: true
  }

  @defaults %{
    cloudformation: %{
      scheme: "https://",
      host: {"$region", "cloudformation.$region.amazonaws.com"},
      region: "us-east-1",
      port: 443
    },
    kinesis: %{
      scheme: "https://",
      host: {"$region", "kinesis.$region.amazonaws.com"},
      region: "us-east-1",
      port: 443
    },
    firehose: %{
      scheme: "https://",
      host: {"$region", "firehose.$region.amazonaws.com"},
      region: "us-east-1",
      port: 443
    },
    translate: %{
      scheme: "https://",
      host: {"$region", "translate.$region.amazonaws.com"},
      region: "us-east-1",
      port: 443
    },
    states: %{
      scheme: "https://",
      host: {"$region", "states.$region.amazonaws.com"},
      region: "us-east-1",
      port: 443
    },
    dynamodb: %{
      scheme: "https://",
      host: {"$region", "dynamodb.$region.amazonaws.com"},
      region: "us-east-1",
      port: 443
    },
    dynamodb_streams: %{
      scheme: "https://",
      host: {"$region", "streams.dynamodb.$region.amazonaws.com"},
      region: "us-east-1",
      port: 443,
      service_override: :dynamodb
    },
    elastictranscoder: %{
      scheme: "https://",
      host: %{
        "us-east-1" => "elastictranscoder.us-east-1.amazonaws.com",
        "us-west-1" => "elastictranscoder.us-west-1.amazonaws.com",
        "us-west-2" => "elastictranscoder.us-west-2.amazonaws.com",
        "ap-south-1" => "elastictranscoder.ap-south-1.amazonaws.com",
        "ap-southeast-1" => "elastictranscoder.ap-southeast-1.amazonaws.com",
        "ap-southeast-2" => "elastictranscoder.ap-southeast-2.amazonaws.com",
        "ap-northeast-1" => "elastictranscoder.ap-northeast-1.amazonaws.com",
        "eu-west-1" => "elastictranscoder.eu-west-1.amazonaws.com",
      },
      region: "us-east-1"
    },
    lambda: %{
      host: {"$region", "lambda.$region.amazonaws.com"},
      scheme: "https://",
      region: "us-east-1",
      port: 443
    },
    s3: %{
      scheme: "https://",
      host: %{
        "ap-northeast-1" => "s3-ap-northeast-1.amazonaws.com",
        "ap-northeast-2" => "s3-ap-northeast-2.amazonaws.com",
        "ap-south-1" => "s3-ap-south-1.amazonaws.com",
        "ap-southeast-1" => "s3-ap-southeast-1.amazonaws.com",
        "ap-southeast-2" => "s3-ap-southeast-2.amazonaws.com",
        "ca-central-1" => "s3-ca-central-1.amazonaws.com",
        "eu-central-1" => "s3-eu-central-1.amazonaws.com",
        "eu-west-1" => "s3-eu-west-1.amazonaws.com",
        "eu-west-2" => "s3-eu-west-2.amazonaws.com",
        "sa-east-1" => "s3-sa-east-1.amazonaws.com",
        "us-east-1" => "s3.amazonaws.com",
        "us-east-2" => "s3-us-east-2.amazonaws.com",
        "us-gov-west-1" => "s3-us-gov-west-1.amazonaws.com",
        "us-west-1" => "s3-us-west-1.amazonaws.com",
        "us-west-2" => "s3-us-west-2.amazonaws.com",
      },
      region: "us-east-1"
    },
    sqs: %{
      scheme: "https://",
      host: {"$region", "sqs.$region.amazonaws.com"},
      region: "us-east-1",
      port: 443
    },
    sns: %{
      host: {"$region", "sns.$region.amazonaws.com"},
      scheme: "https://",
      region: "us-east-1",
      port: 443
    },
    ec2: %{
      scheme: "https://",
      host: {"$region", "ec2.$region.amazonaws.com"},
      region: "us-east-1",
      port: 443
    },
    rds: %{
      scheme: "https://",
      host: {"$region", "rds.$region.amazonaws.com"},
      region: "us-east-1",
      port: 443
    },
    kms: %{
      scheme: "https://",
      host: {"$region", "kms.$region.amazonaws.com"},
      region: "us-east-1",
      port: 443
    },
    sts: %{
      host: {"$region", "sts.$region.amazonaws.com"},
      scheme: "https://",
      region: "us-east-1",
      port: 443
    },
    route53: %{
      scheme: "https://",
      host: "route53.amazonaws.com",
      region: "us-east-1",
      port: 443
    },
    ses: %{
      scheme: "https://",
      host: {"$region", "email.$region.amazonaws.com"},
      region: "us-east-1",
      port: 443
    },
    monitoring: %{
      host: {"$region", "monitoring.$region.amazonaws.com"},
      scheme: "https://",
      region: "us-east-1",
      port: 443
    }
  }

  @doc """
  Retrieve the default configuration for a service.
  """
  def defaults(:dynamodb_streams) do
    %{service_override: :dynamodb}
    |> Map.merge(defaults(:dynamodb))
  end

  def defaults(:lex_runtime) do
    %{service_override: :lex}
    |> Map.merge(defaults(:lex))
  end

  def defaults(:lex_models) do
    %{service_override: :lex}
    |> Map.merge(defaults(:lex))
  end

  def defaults(:sagemaker_runtime) do
    %{service_override: :sagemaker}
    |> Map.merge(defaults(:sagemaker))
  end

  def defaults(:iot_data) do
    %{service_override: :iotdata}
    |> Map.merge(defaults(:iot))
  end

  def defaults(:"session.qldb") do
    %{service_override: :qldb}
    |> Map.merge(defaults(:qldb))
  end

  def defaults(_) do
    Map.merge(
      %{
        scheme: "https://",
        region: "us-east-1",
        port: 443
      },
      @common
    )
  end

  def get(service, region) do
    service
    |> defaults
    |> Map.put(:host, host(service, region))
  end

  @partitions [
    {~r/^(us|eu|ap|sa|ca)\-\w+\-\d+$/, "aws"},
    {~r/^cn\-\w+\-\d+$/, "aws-cn"},
    {~r/^us\-gov\-\w+\-\d+$/, "aws-us-gov"}
  ]

  def host(service, region) do
    partition =
      Enum.find(@partitions, fn {regex, _} ->
        Regex.run(regex, region)
      end)

    with {_, partition} <- partition do
      do_host(partition, service, region)
    end
  end

  defp service_map(:ses), do: "email"
  defp service_map(:sagemaker_runtime), do: "runtime.sagemaker"
  defp service_map(:lex_runtime), do: "runtime.lex"
  defp service_map(:lex_models), do: "models.lex"
  defp service_map(:dynamodb_streams), do: "streams.dynamodb"
  defp service_map(:iot_data), do: "data.iot"

  defp service_map(service) do
    service
    |> to_string
    |> String.replace("_", "-")
  end

  @external_resource "priv/endpoints.exs"

  @partition_data Code.eval_file("priv/endpoints.exs", File.cwd!())
                  |> elem(0)
                  |> Map.get("partitions")
                  |> Map.new(fn partition ->
                    {partition["partition"], partition}
                  end)

  defp do_host(partition, service_slug, region) do
    partition = @partition_data |> Map.fetch!(partition)
    partition_name = partition["partition"]

    service = service_map(service_slug)

    partition
    |> Map.fetch!("services")
    |> fetch_or(service, "#{service_slug} not found in partition #{partition_name}")
    |> case do
      %{"isRegionalized" => false} = data ->
        data
        |> Map.fetch!("endpoints")
        |> Map.values()
        |> List.first()

      data ->
        data
        |> Map.fetch!("endpoints")
        |> fetch_or(
          region,
          "#{service_slug} not supported in region #{region} for partition #{partition_name}"
        )
    end
    |> case do
      %{"hostname" => hostname} ->
        hostname

      _ ->
        dns_suffix = Map.fetch!(partition, "dnsSuffix")
        hostname = Map.fetch!(partition, "defaults") |> Map.fetch!("hostname")
        apply_defaults(hostname, service, region, dns_suffix)
    end
  end

  defp fetch_or(map, key, msg) do
    Map.get(map, key) || raise msg
  end

  def apply_defaults(hostname, service, region, dns_suffix) do
    hostname
    |> String.replace("{service}", service)
    |> String.replace("{region}", region)
    |> String.replace("{dnsSuffix}", dns_suffix)
  end
end
