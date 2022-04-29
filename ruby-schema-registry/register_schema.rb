require 'avro_turf'
require 'avro_turf/confluent_schema_registry'
schema_file = "#{ENV['SCHEMAS_PATH']}/#{ARGV[1]}"
subject_name = ARGV[0]
schema_registry_url = ENV['SCHEMA_REGISTRY_URL']
avro_client = AvroTurf::ConfluentSchemaRegistry.new(schema_registry_url)
logger = Logger.new($stdout)
data_hash = File.read(schema_file)
config = avro_client.subject_config() rescue avro_client.global_config
compatibility_level = config['compatibilityLevel']

logger.info "Current compatibility config: #{compatibility_level}"
avro_client.register(subject_name, data_hash)
