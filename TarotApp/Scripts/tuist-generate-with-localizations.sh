#!/bin/bash

# Wrapper script that generates localizations then runs tuist generate
# This ensures localizations are always up-to-date before project generation

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}🚀 Starting Tuist project generation with localizations...${NC}"

# Step 1: Generate localizations
echo -e "${YELLOW}📝 Step 1: Generating localizations...${NC}"
chmod +x Scripts/generate-localizations.sh
./Scripts/generate-localizations.sh

# Step 2: Run tuist generate with all passed arguments
echo -e "${YELLOW}🏗️  Step 2: Generating Xcode project...${NC}"
tuist generate "$@"

echo -e "${GREEN}🎉 Complete! Project generated with fresh localizations.${NC}" 