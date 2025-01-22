# The official Elasticsearch Docker image
FROM docker.elastic.co/elasticsearch/elasticsearch:sha256-fece07406ca82f04df4f321b9a17500c48c0123d7e09895cc3f8ecb30c18946f

# Copy our config file over
COPY --chown=1000:0 config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

# Allow Elasticsearch to create `elasticsearch.keystore`
# to circumvent https://github.com/elastic/ansible-elasticsearch/issues/430
RUN chmod g+ws /usr/share/elasticsearch/config

USER 1000:0
