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

## 🔐 Secrets Setup (Required for CI/CD)

This project uses a **3-environment configuration system** (Debug, Staging, Production) with secure API key management using **GitHub Environment Secrets** for maximum security.

### 📋 Quick Setup Checklist

- [ ] Create GitHub Environments (staging, production)
- [ ] Add Environment-specific secrets  
- [ ] Update Team ID in export plists
- [ ] Test workflows

### 🚀 Step 1: Create GitHub Environments

Go to **Settings** → **Environments** in this repository:

1. Click **New environment** and create:
   ```
   staging
   production
   ```

2. Configure **production** environment protection:
   - ✅ **Required reviewers**: Add yourself
   - ✅ **Deployment branches**: Only `main` branch
   - This ensures production deployments require manual approval!

### 🔐 Step 2: Add Environment-Specific Secrets

#### **Staging Environment**
In the `staging` environment, add:
```bash
OPENAI_API_KEY = sk-proj-your-staging-api-key
API_BASE_URL = https://api.openai.com/v1/
```

#### **Production Environment**  
In the `production` environment, add:
```bash
OPENAI_API_KEY = sk-proj-your-production-api-key
API_BASE_URL = https://api.openai.com/v1/
```

#### **Repository Secrets** (shared across environments)
Add these at the repository level (**Settings** → **Secrets and variables** → **Actions**):
```bash
APP_STORE_CONNECT_API_KEY_ID = your-api-key-id
APP_STORE_CONNECT_ISSUER_ID = your-issuer-id  
APP_STORE_CONNECT_PRIVATE_KEY = -----BEGIN PRIVATE KEY-----
your-p8-file-contents-here
-----END PRIVATE KEY-----
```

### 🔧 Step 3: Update Team ID

Replace `YOUR_TEAM_ID` with your Apple Developer Team ID in:
- `TarotApp/ExportOptions-Staging.plist`
- `TarotApp/ExportOptions-Production.plist`

**Find your Team ID:**
- Xcode → Project Settings → Signing & Capabilities
- Or Apple Developer Portal → Membership

### 🏃‍♂️ Step 4: Local Development Setup

For local development with secrets:

```bash
cd TarotApp
./Scripts/setup_env.sh
```

This creates `.env` files for each environment. Add your API keys:

```bash
# Edit TarotApp/.env.debug
OPENAI_API_KEY=your-local-api-key
API_BASE_URL=https://api.openai.com/v1/
```

Then inject secrets into configuration:
```bash
./Scripts/update_xcconfig.sh debug
```

### 🧪 Step 5: Test Your Setup

#### Test Staging Build (Automatic)
```bash
git tag v1.0.0-staging
git push origin v1.0.0-staging
```
✅ Should deploy automatically to TestFlight using staging secrets

#### Test Production Release (Requires Approval)
```bash
git tag v1.0.0
git push origin v1.0.0
```
✅ Should wait for your approval, then deploy using production secrets

### 🎯 How Environment Secrets Work

| Environment | Bundle ID | Secrets Used | Approval Required |
|-------------|-----------|--------------|-------------------|
| **Debug** | `com.odanylenko.Lunalit.debug` | Local `.env` files | ❌ Manual builds |
| **Staging** | `com.odanylenko.Lunalit.staging` | `staging` environment secrets | ❌ Automatic |
| **Production** | `com.odanylenko.Lunalit` | `production` environment secrets | ✅ **Requires approval** |

### 🔐 Security Benefits

✅ **Environment Isolation**: Staging secrets separate from production  
✅ **Approval Workflows**: Production requires manual approval  
✅ **No File Writing**: Secrets injected as environment variables  
✅ **Automatic Redaction**: GitHub masks secrets in logs  
✅ **Clean Builds**: No temporary secret files created  

### 🔍 How It Works Under the Hood

1. **GitHub Actions** reads secrets from environment
2. **xcconfig files** automatically substitute `${OPENAI_API_KEY}` from environment variables
3. **Xcode build** receives values during compilation
4. **No cleanup needed** - no files created

Your existing xcconfig files already support this:
```bash
# In Release-Staging.xcconfig
OPENAI_API_KEY = ${OPENAI_API_KEY}
API_BASE_URL = ${API_BASE_URL:https://api.openai.com/v1/}
```

### 🔍 Troubleshooting

#### Missing Secrets Error
```
Error: Secret OPENAI_API_KEY not found
```
**Solution**: Check environment secrets are added to the correct environment (`staging` or `production`).

#### Environment Not Found
```
Error: Environment 'staging' not found
```
**Solution**: Create environments in **Settings** → **Environments**

#### Local Development Issues
```bash
# Reset local configuration
cd TarotApp
rm -f Configurations/Local.xcconfig
./Scripts/setup_env.sh
./Scripts/update_xcconfig.sh debug
```

### 📁 Configuration Files

The project uses these configuration files:

```
TarotApp/Configurations/
├── Base.xcconfig              # Shared settings
├── Debug.xcconfig             # Local development 
├── Release-Staging.xcconfig   # TestFlight builds
├── Release-Production.xcconfig # App Store builds
└── Local.xcconfig             # Generated secrets (gitignored)

TarotApp/Scripts/
├── setup_env.sh              # Creates .env files
└── update_xcconfig.sh         # Injects secrets

.github/workflows/
├── tests.yml                 # Test workflow
├── staging-build.yml         # TestFlight deployment (uses staging environment)
└── production-release.yml    # App Store deployment (uses production environment)
```

## GitHub Actions

The project includes multiple GitHub Actions workflows:

### **Continuous Integration**
- **tests.yml**: Builds the iOS app and runs unit tests
- Triggered on: PRs and pushes to main/develop

### **Staging Deployment** 
- **staging-build.yml**: Builds and deploys to TestFlight
- **Environment**: Uses `staging` environment secrets
- **Triggered on**: Push to `develop`, staging tags, merged PRs
- **Security**: Automatic deployment, no approval required

### **Production Release**
- **production-release.yml**: Builds and uploads to App Store Connect
- **Environment**: Uses `production` environment secrets  
- **Triggered on**: Version tags (`v1.0.0`), manual dispatch
- **Security**: **Requires manual approval** before deployment
- **Creates**: GitHub releases with automated release notes

All workflows use **clean environment variable injection** - no secret files are created or cleaned up.

---

**🎉 Setup Complete!** Once environment secrets are configured, you'll have:
- ✅ **Environment-based security**: Staging vs production isolation
- ✅ **Approval workflows**: Production deployments require approval
- ✅ **Clean secret injection**: No temporary files with secrets
- ✅ **Automated deployments**: Push code → automatic builds
- ✅ **Local development**: Still works with `.env` files
