require 'avro_turf'
require 'avro_turf/confluent_schema_registry'
schema_registry_url = ENV['SCHEMA_REGISTRY_URL']
subject = ARGV[0]
version = ARGV[1]
version ||= 'latest'
avro_client = AvroTurf::ConfluentSchemaRegistry.new(schema_registry_url)
result = avro_client.subject_version(subject, version) rescue 'Not Found'
puts result.to_json