#!/bin/bash

# setup_env.sh
# Initial environment setup script for local development

set -e

echo "🚀 Setting up Tarot App development environment..."

# Create environment files directory if it doesn't exist
ENV_DIR="$(dirname "$0")/../"
cd "$ENV_DIR"

# Create .env files for each environment if they don't exist
echo "📝 Creating environment configuration files..."

if [ ! -f ".env.debug" ]; then
    cat > ".env.debug" << EOF
# Debug Environment Configuration
# Replace with your actual OpenAI API key for development
OPENAI_API_KEY=your_openai_api_key_here
API_BASE_URL=https://api.openai.com/v1/
EOF
    echo "✅ Created .env.debug"
else
    echo "ℹ️  .env.debug already exists"
fi

if [ ! -f ".env.staging" ]; then
    cat > ".env.staging" << EOF
# Staging Environment Configuration
# This will be used for TestFlight builds
OPENAI_API_KEY=your_staging_openai_api_key_here
API_BASE_URL=https://api.openai.com/v1/
EOF
    echo "✅ Created .env.staging"
else
    echo "ℹ️  .env.staging already exists"
fi

if [ ! -f ".env.production" ]; then
    cat > ".env.production" << EOF
# Production Environment Configuration
# This will be used for App Store builds
OPENAI_API_KEY=your_production_openai_api_key_here
API_BASE_URL=https://api.openai.com/v1/
EOF
    echo "✅ Created .env.production"
else
    echo "ℹ️  .env.production already exists"
fi

# Function to export environment variables from .env file
export_env_vars() {
    local env_file="$1"
    local env_name="$2"
    
    if [ -f "$env_file" ]; then
        echo "🔧 Loading environment variables from $env_file..."
        
        # Load and export variables (excluding comments and empty lines)
        while IFS= read -r line || [ -n "$line" ]; do
            # Skip comments and empty lines
            if [[ ! "$line" =~ ^[[:space:]]*# ]] && [[ -n "${line// }" ]]; then
                # Extract key=value and export
                if [[ "$line" == *"="* ]]; then
                    export "$line"
                    echo "   ✅ Exported: $(echo "$line" | cut -d'=' -f1)"
                fi
            fi
        done < "$env_file"
        
        echo "🌍 Environment variables for $env_name are now active in this shell session"
        echo "💡 You can now run 'tuist generate' and build your project"
    else
        echo "❌ Environment file $env_file not found"
        return 1
    fi
}

# Check if environment parameter is provided
if [ $# -eq 0 ]; then
    # Default to debug environment
    ENVIRONMENT="debug"
    echo "🎯 No environment specified, defaulting to debug"
else
    ENVIRONMENT="$1"
fi

# Validate environment parameter
case "$ENVIRONMENT" in
    debug|staging|production)
        ENV_FILE=".env.$ENVIRONMENT"
        echo "🎯 Setting up $ENVIRONMENT environment..."
        export_env_vars "$ENV_FILE" "$ENVIRONMENT"
        ;;
    *)
        echo "❌ Error: Invalid environment '$ENVIRONMENT'"
        echo "Usage: $0 [debug|staging|production]"
        exit 1
        ;;
esac

echo ""
echo "✅ Environment setup complete!"
echo ""
echo "📋 Next steps:"
echo "   1. If this is your first time, edit .env.$ENVIRONMENT and add your OpenAI API key"
echo "   2. Run 'tuist generate' to regenerate the project"
echo "   3. Open the workspace and build - environment variables are now loaded!"
echo ""
echo "🔄 To switch environments, run:"
echo "   source ./Scripts/setup_env.sh [debug|staging|production]"
echo ""
echo "💡 Important: Run this script with 'source' to export variables to your current shell:"
echo "   source ./Scripts/setup_env.sh debug"