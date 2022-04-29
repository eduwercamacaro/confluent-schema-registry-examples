require 'avro_turf'
require 'avro_turf/confluent_schema_registry'
schema_registry_url = ENV['SCHEMA_REGISTRY_URL']
subject_name = ARGV[0]
subject_config = ARGV[1]
puts subject_name
puts subject_config
avro_client = AvroTurf::ConfluentSchemaRegistry.new(schema_registry_url)
logger = Logger.new($stdout)
avro_client.update_subject_config(subject_name, compatibility: subject_config)
