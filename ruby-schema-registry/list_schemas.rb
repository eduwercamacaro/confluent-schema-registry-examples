require 'avro_turf'
require 'avro_turf/confluent_schema_registry'
require 'table_print'
schema_registry_url = ENV['SCHEMA_REGISTRY_URL']
avro_client = AvroTurf::ConfluentSchemaRegistry.new(schema_registry_url)
logger = Logger.new($stdout)
config = avro_client.global_config
SchemaDetail = Struct.new(:subject_name, :compatibility, :versions)

subjects = avro_client.subjects

schema_details = []
subjects.each do |subject|
    subject_name =  subject.to_s
    subject_config = avro_client.subject_config(subject_name) rescue config
    subject_compatibility_level = subject_config['compatibilityLevel']
    versions = avro_client.subject_versions(subject_name).reverse().map do |subject_version|
        subject_version
    end
    schema_details << SchemaDetail.new(subject_name, subject_compatibility_level, versions)
end
tp schema_details, :subject_name, :compatibility, {:versions => {:width => 1200, :display_name => 'registered Versions '}}