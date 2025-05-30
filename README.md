# no-name-tarot
Tarot app

## MCP (Model Context Protocol) Setup

This project uses MCP for enhanced development capabilities. The configuration is located in `.cursor/mcp.json`.

### Prerequisites

1. **GitHub Personal Access Token**: Required for the GitHub MCP server
   - Go to [GitHub Settings > Tokens](https://github.com/settings/tokens)
   - Generate a new token with appropriate scopes:
     - `repo` - for repository access
     - `workflow` - for GitHub Actions (if needed)
     - `write:org` - for organization access (if needed)
   - Set the token as an environment variable:
     ```bash
     export GITHUB_TOKEN=your_token_here
     ```

2. **Docker**: Required for running the GitHub MCP server
   - Install Docker Desktop or Docker CLI
   - Ensure Docker is running

### MCP Servers Configured

- **XcodeBuildMCP**: For Xcode project management and building
- **GitHub**: For GitHub integration and repository operations

### Development Setup

1. Install dependencies:
   ```bash
   mise install
   ```

2. Generate Xcode project:
   ```bash
   cd TarotApp
   mise exec -- tuist generate
   ```

3. Run tests:
   ```bash
   xcodebuild test -scheme LunalitTests -destination 'platform=iOS Simulator,name=iPhone 15'
   ```

## GitHub Actions

The project includes a GitHub Actions workflow for continuous integration that:
- Builds the iOS app
- Runs unit tests
- Uses proper token authentication
- Handles code signing for CI environment
