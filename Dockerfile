FROM ruby:3.1.1

RUN gem install avro_turf table_print
ENV SCHEMAS_PATH=/schemas
ENV SCHEMA_REGISTRY_URL=http://127.0.0.1:8081

RUN apt-get update && apt-get install -y jq

COPY ./scripts /bin
COPY ./ruby-schema-registry /lib