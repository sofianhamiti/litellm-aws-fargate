FROM ghcr.io/berriai/litellm:litellm_stable_release_branch-v1.65.0-stable

# Install curl for health checks
RUN apk add --no-cache curl

# Set this if you want to debug your application
# ENV LITELLM_LOG=DEBUG

# Expose the port
EXPOSE 4000

# Copy the litellm config
RUN mkdir -p /app/config
COPY ./litellm_config_load_balance.yaml /app/config/litellm_config.yaml

# Copy the AWS CLI config
RUN mkdir -p /root/.aws
COPY ./config /root/.aws

# Create a startup script
COPY ./entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint to our startup script
ENTRYPOINT ["/app/entrypoint.sh"]