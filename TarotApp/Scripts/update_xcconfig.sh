#!/bin/bash

# update_xcconfig.sh
# Updates xcconfig files with environment-specific secrets

set -e

# Function to display usage
usage() {
    echo "Usage: $0 [debug|staging|production]"
    echo "Updates the xcconfig files with environment-specific secrets"
    exit 1
}

# Check if environment parameter is provided
if [ $# -eq 0 ]; then
    usage
fi

ENVIRONMENT="$1"
SCRIPT_DIR="$(dirname "$0")"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
CONFIG_DIR="$PROJECT_DIR/Configurations"

echo "🔧 Updating configuration for $ENVIRONMENT environment..."

# Validate environment parameter
case "$ENVIRONMENT" in
    debug|staging|production)
        ;;
    *)
        echo "❌ Error: Invalid environment '$ENVIRONMENT'"
        usage
        ;;
esac

# Set source files based on environment
case "$ENVIRONMENT" in
    debug)
        ENV_FILE="$PROJECT_DIR/.env.debug"
        XCCONFIG_FILE="$CONFIG_DIR/Debug.xcconfig"
        ;;
    staging)
        ENV_FILE="$PROJECT_DIR/.env.staging"
        XCCONFIG_FILE="$CONFIG_DIR/Release-Staging.xcconfig"
        ;;
    production)
        ENV_FILE="$PROJECT_DIR/.env.production"
        XCCONFIG_FILE="$CONFIG_DIR/Release-Production.xcconfig"
        ;;
esac

# Load environment variables from .env file or environment
if [ -f "$ENV_FILE" ]; then
    echo "📄 Loading variables from $ENV_FILE"
    # Export variables from .env file
    export $(grep -v '^#' "$ENV_FILE" | xargs)
elif [ -n "$OPENAI_API_KEY" ]; then
    echo "📄 Using environment variables from shell/CI"
else
    echo "❌ Error: No environment file found at $ENV_FILE and no OPENAI_API_KEY in environment"
    echo "💡 Run ./Scripts/setup_env.sh first to create environment files"
    exit 1
fi

# Validate required environment variables
if [ -z "$OPENAI_API_KEY" ] || [ "$OPENAI_API_KEY" = "your_openai_api_key_here" ]; then
    echo "❌ Error: OPENAI_API_KEY is not set or still contains placeholder value"
    echo "💡 Please edit $ENV_FILE and set your actual OpenAI API key"
    exit 1
fi

# Default API_BASE_URL if not set
if [ -z "$API_BASE_URL" ]; then
    API_BASE_URL="https://api.openai.com/v1/"
fi

# Create Local.xcconfig file with actual secrets
LOCAL_CONFIG="$CONFIG_DIR/Local.xcconfig"

echo "🔐 Creating local configuration with secrets..."

cat > "$LOCAL_CONFIG" << EOF
// Local.xcconfig
// Generated configuration with actual secrets
// This file is auto-generated and should NOT be committed to version control

// API Configuration with actual values
OPENAI_API_KEY = $OPENAI_API_KEY
API_BASE_URL = $API_BASE_URL

// Generation info
XCCONFIG_GENERATED_AT = $(date '+%Y-%m-%d %H:%M:%S')
XCCONFIG_ENVIRONMENT = $ENVIRONMENT
EOF

# Update the target xcconfig file to include Local.xcconfig
if ! grep -q "Local.xcconfig" "$XCCONFIG_FILE"; then
    # Add include statement for Local.xcconfig at the end
    echo "" >> "$XCCONFIG_FILE"
    echo "#include \"Local.xcconfig\"" >> "$XCCONFIG_FILE"
    echo "✅ Added Local.xcconfig include to $(basename "$XCCONFIG_FILE")"
else
    echo "ℹ️  Local.xcconfig already included in $(basename "$XCCONFIG_FILE")"
fi

echo "✅ Configuration updated successfully for $ENVIRONMENT environment"
echo "🔐 Secrets injected into $LOCAL_CONFIG"

# Remind about security
if [ "$ENVIRONMENT" = "debug" ] && [ -f "$ENV_FILE" ]; then
    echo ""
    echo "🔒 Security reminder:"
    echo "   - $ENV_FILE and Local.xcconfig contain sensitive data"
    echo "   - These files should be in .gitignore"
    echo "   - Never commit actual API keys to version control"
fi 