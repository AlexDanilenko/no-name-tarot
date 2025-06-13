#!/bin/bash

# Script to generate localization Swift files using xcstrings-tool CLI
# This outputs files directly to the project folder instead of build directory

set -e

# Configuration
XCSTRINGS_BASE_DIR="TarotApp/Resources"
OUTPUT_DIR="Sources/Generated/Localizations"
XCSTRINGS_TOOL_VERSION="1.2.0"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}🔄 Generating localization files...${NC}"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Check if xcstrings-tool is available
if ! command -v xcstrings-tool &> /dev/null; then
    echo -e "${RED}❌ xcstrings-tool not available.${NC}"
    echo "Please install xcstrings-tool using one of these methods:"
    echo "  1. Via mise (recommended for this project):"
    echo "     mise settings experimental=true"
    echo "     mise use spm:liamnichols/xcstrings-tool"
    echo "  2. Via Homebrew:"
    echo "     brew install liamnichols/xcstrings-tool/xcstrings-tool"
    echo "  3. Via mise install (if configured in .mise.toml):"
    echo "     mise install"
    exit 1
fi

echo -e "${GREEN}✅ Found xcstrings-tool version: $(xcstrings-tool --version)${NC}"

# Find all .xcstrings files
XCSTRINGS_FILES=$(find "$XCSTRINGS_BASE_DIR" -name "*.xcstrings" -type f)

if [ -z "$XCSTRINGS_FILES" ]; then
    echo -e "${RED}❌ Error: No .xcstrings files found in $XCSTRINGS_BASE_DIR${NC}"
    exit 1
fi

echo -e "${YELLOW}📁 Found .xcstrings files:${NC}"
echo "$XCSTRINGS_FILES" | sed 's/^/   - /'

# Generate the localization files for each .xcstrings file
for XCSTRINGS_FILE in $XCSTRINGS_FILES; do
    echo -e "${YELLOW}🏗️  Generating Swift files from $XCSTRINGS_FILE...${NC}"
    
    # Get the base name for output file naming
    BASE_NAME=$(basename "$XCSTRINGS_FILE" .xcstrings)
    OUTPUT_FILE="$OUTPUT_DIR/${BASE_NAME}.swift"
    
    # Use the CLI tool to generate files
    xcstrings-tool generate \
        "$XCSTRINGS_FILE" \
        --output "$OUTPUT_FILE" \
        --access-level internal
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}❌ Failed to generate localization files for $XCSTRINGS_FILE${NC}"
        exit 1
    fi
done

echo -e "${GREEN}✅ Successfully generated localization files in $OUTPUT_DIR${NC}"
echo -e "${GREEN}📁 Generated files:${NC}"
find "$OUTPUT_DIR" -name "*.swift" -exec basename {} \; | sed 's/^/   - /'

echo -e "${GREEN}🎉 Done!${NC}" 