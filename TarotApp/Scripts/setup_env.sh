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

# Run initial configuration update for debug environment
echo "🔧 Setting up debug configuration..."
./Scripts/update_xcconfig.sh debug

echo ""
echo "✅ Environment setup complete!"
echo ""
echo "📋 Next steps:"
echo "   1. Edit .env.debug and add your OpenAI API key"
echo "   2. Run 'tuist generate' to regenerate the project"
echo "   3. Open the workspace and select the desired scheme"
echo ""
echo "💡 To switch environments, use:"
echo "   ./Scripts/update_xcconfig.sh [debug|staging|production]" 