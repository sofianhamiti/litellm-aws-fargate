general_settings:
  store_prompts_in_spend_logs: true
  success_callback: ["posthog"]
  failure_callback: ["sentry"]
  master_key: os.environ/LITELLM_MASTER_KEY
  key_management_system: "aws_secret_manager"
  key_management_settings:
    hosted_keys: ["LITELLM_MASTER_KEY"]

# Define common model parameters
model_defaults: &model_defaults
  model: "bedrock/us.anthropic.claude-3-7-sonnet-20250219-v1:0"
  tpm: 20000
  rpm: 5

model_list:
  - model_name: "claude-3-7-balance"
    litellm_params:
      <<: *model_defaults
      aws_profile_name: "account1"

  - model_name: "claude-3-7-balance"
    litellm_params:
      <<: *model_defaults
      aws_profile_name: "account2"

  - model_name: "claude-3-7-balance"
    litellm_params:
      <<: *model_defaults
      aws_profile_name: "account3"

  - model_name: "claude-3-7-balance"
    litellm_params:
      <<: *model_defaults
      aws_profile_name: "account4"

  - model_name: "claude-3-7-balance"
    litellm_params:
      <<: *model_defaults
      aws_profile_name: "account5"

  # Add more accounts as needed
  # Example:
  # - model_name: "claude-3-7-balance"
  #   litellm_params:
  #     <<: *model_defaults
  #     aws_profile_name: "account6"

router_settings:
  routing_strategy: "least-busy"  # Changed from simple-shuffle
  health_check_interval: 30       # Reduced from 60
  timeout: 45                     # Increased from 30
  retries: 3                      # Increased from 2
  retry_after: 5                  # Added delay between retries
