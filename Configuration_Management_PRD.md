# Product Requirements Document (PRD)
## iOS App Configuration Management & CI/CD Enhancement

### Executive Summary
This PRD outlines the implementation of a comprehensive configuration management system for the iOS Tarot App, focusing on secure secret management, multi-environment support, and robust CI/CD pipeline integration. The solution will follow industry best practices for iOS development with Swift, Tuist, and GitHub Actions.

### 1. Problem Statement

#### Current Issues:
1. **Hardcoded API Keys**: OpenAI API key is directly embedded in the source code (`GPTApiClient.swift:22`), posing significant security risks
2. **Single Environment**: No separation between Development, Staging, and Production environments
3. **Secret Exposure**: `.cursor/mcp.json` file contains sensitive tokens but lacks proper protection in CI/CD
4. **Limited Build Configurations**: Current setup only supports basic Debug/Release without environment-specific configurations

#### Risks:
- API key exposure through source code analysis
- Potential security breaches if repository is compromised
- Difficulty managing different environments
- CI/CD pipeline vulnerabilities

### 2. Solution Overview

Based on industry research and best practices, we will implement a multi-layered configuration management system that:

1. **Separates environments** (Debug Local, Debug Staging, Release Staging, Release Production)
2. **Secures sensitive data** using `.xcconfig` files with environment variable injection
3. **Enhances CI/CD** with proper secret management through GitHub Actions
4. **Follows iOS standards** using Tuist for project generation and configuration management

### 3. Technical Requirements

#### 3.1 Build Configurations
Following iOS best practices, implement four build configurations:

| Configuration | Environment | Purpose | Compilation Flags |
|---------------|-------------|---------|-------------------|
| Debug Local | Development | Local development | `DEBUG`, `LOCAL` |
| Debug Staging | Staging | Internal testing | `DEBUG`, `STAGING` |
| Release Staging | Staging | Beta/TestFlight | `STAGING` |
| Release Production | Production | App Store | `PRODUCTION` |

#### 3.2 Configuration File Structure
```
TarotApp/
├── Configurations/
│   ├── Base.xcconfig
│   ├── Debug-Local.xcconfig
│   ├── Debug-Staging.xcconfig
│   ├── Release-Staging.xcconfig
│   ├── Release-Production.xcconfig
│   └── Local.xcconfig (gitignored)
├── Scripts/
│   ├── setup_env.sh
│   └── update_xcconfig.sh
└── .env files (gitignored)
    ├── .env.local
    ├── .env.staging
    └── .env.production
```

#### 3.3 Secret Management Strategy

**Local Development:**
- Use `.env` files for environment variables
- Generate `Local.xcconfig` files with script injection
- Keep actual secrets out of version control

**CI/CD:**
- Store secrets as GitHub Actions environment variables
- Inject secrets into `.xcconfig` files during build process
- Use placeholder values in committed configuration files

#### 3.4 Tuist Configuration Updates

Update `Project.swift` to support multiple configurations:

```swift
let settings = Settings.settings(
    base: [:],
    configurations: [
        .debug(
            name: "Debug Local",
            xcconfig: .relativeToRoot("TarotApp/Configurations/Debug-Local.xcconfig")
        ),
        .debug(
            name: "Debug Staging", 
            xcconfig: .relativeToRoot("TarotApp/Configurations/Debug-Staging.xcconfig")
        ),
        .release(
            name: "Release Staging",
            xcconfig: .relativeToRoot("TarotApp/Configurations/Release-Staging.xcconfig")
        ),
        .release(
            name: "Release Production",
            xcconfig: .relativeToRoot("TarotApp/Configurations/Release-Production.xcconfig")
        )
    ]
)
```

#### 3.5 Scheme Configuration

Create dedicated schemes for each environment:
- `Lunalit-Local` (Debug Local)
- `Lunalit-Staging` (Debug/Release Staging)
- `Lunalit-Production` (Release Production)

### 4. Implementation Plan

#### Phase 1: Configuration Setup (Week 1)
1. **Create configuration structure**
   - Set up `Configurations/` directory
   - Create base and environment-specific `.xcconfig` files
   - Implement placeholder system for secrets

2. **Update Tuist configuration**
   - Modify `Project.swift` with new build configurations
   - Create appropriate schemes for each environment
   - Test project generation

3. **Environment management**
   - Create setup scripts for local development
   - Implement `.env` file structure
   - Create configuration injection scripts

#### Phase 2: Secret Management (Week 2)
1. **Refactor API client**
   - Remove hardcoded API keys from source code
   - Implement environment-based configuration reading
   - Create `EnvironmentManager` for accessing configuration values

2. **Local development setup**
   - Create development environment setup documentation
   - Implement local secret management workflow
   - Test configuration injection process

#### Phase 3: CI/CD Enhancement (Week 3)
1. **GitHub Actions updates**
   - Configure environment secrets in GitHub repository
   - Update workflow to inject secrets during build
   - Implement different workflows for different environments

2. **Security improvements**
   - Update `.gitignore` to exclude sensitive files
   - Implement pre-commit hooks for secret detection
   - Document security practices

#### Phase 4: Testing & Documentation (Week 4)
1. **Comprehensive testing**
   - Test all build configurations
   - Verify secret injection in CI/CD
   - Validate App Store submission process

2. **Documentation**
   - Create developer setup guide
   - Document CI/CD configuration
   - Create troubleshooting guide

### 5. Configuration File Examples

#### 5.1 Base.xcconfig
```
// Base configuration for all environments
PRODUCT_NAME = Lunalit
MARKETING_VERSION = 1.0.0
CURRENT_PROJECT_VERSION = 1
SWIFT_VERSION = 5.0
IPHONEOS_DEPLOYMENT_TARGET = 17.0

// Compilation conditions base
OTHER_SWIFT_FLAGS = $(inherited)
```

#### 5.2 Debug-Local.xcconfig
```
#include "Base.xcconfig"

// Bundle identifier
PRODUCT_BUNDLE_IDENTIFIER = com.odanylenko.Lunalit.local

// App name
INFOPLIST_KEY_CFBundleDisplayName = Lunalit Local

// Compilation flags
OTHER_SWIFT_FLAGS = $(inherited) -DDEBUG -DLOCAL

// API Configuration (placeholders)
OPENAI_API_KEY = OPENAI_API_KEY_PLACEHOLDER
API_BASE_URL = https://api.openai.com/v1/
```

#### 5.3 Release-Production.xcconfig
```
#include "Base.xcconfig"

// Bundle identifier
PRODUCT_BUNDLE_IDENTIFIER = com.odanylenko.Lunalit

// App name
INFOPLIST_KEY_CFBundleDisplayName = Lunalit

// Compilation flags
OTHER_SWIFT_FLAGS = $(inherited) -DPRODUCTION

// API Configuration (placeholders)
OPENAI_API_KEY = OPENAI_API_KEY_PLACEHOLDER
API_BASE_URL = https://api.openai.com/v1/
```

### 6. Environment Manager Implementation

```swift
public final class EnvironmentManager {
    public enum Environment: String {
        case local, staging, production
        
        var displayName: String {
            switch self {
            case .local: return "Local"
            case .staging: return "Staging"
            case .production: return "Production"
            }
        }
    }
    
    public static let shared = EnvironmentManager()
    
    public var environment: Environment {
        #if LOCAL
        return .local
        #elseif STAGING
        return .staging
        #elseif PRODUCTION
        return .production
        #else
        return .local
        #endif
    }
    
    public var openAIAPIKey: String {
        guard let apiKey = Bundle.main.infoDictionary?["OPENAI_API_KEY"] as? String,
              !apiKey.isEmpty,
              !apiKey.contains("PLACEHOLDER") else {
            fatalError("OpenAI API key not configured for \(environment.displayName) environment")
        }
        return apiKey
    }
    
    public var apiBaseURL: String {
        guard let baseURL = Bundle.main.infoDictionary?["API_BASE_URL"] as? String else {
            return "https://api.openai.com/v1/"
        }
        return baseURL
    }
}
```

### 7. CI/CD Configuration

#### 7.1 GitHub Actions Secrets
Required secrets to be configured in GitHub repository settings:
- `OPENAI_API_KEY_LOCAL`
- `OPENAI_API_KEY_STAGING`
- `OPENAI_API_KEY_PRODUCTION`

#### 7.2 Updated GitHub Actions Workflow
```yaml
name: Build and Test

on:
  pull_request:
    branches: [ main, develop ]
  push:
    branches: [ main, develop ]

permissions:
  contents: read
  actions: read
  checks: write

jobs:
  test:
    name: Build and Test
    runs-on: macos-14
    
    env:
      GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      CI: 1
      IDESkipPackagePluginFingerprintValidation: YES
      IDESkipMacroFingerprintValidation: YES
    
    steps:
    - uses: actions/checkout@v4
    
    - uses: jdx/mise-action@v2
    
    - name: Select Xcode version
      run: sudo xcode-select -s /Applications/Xcode_16.1.app/Contents/Developer
      
    - name: Setup Environment Secrets
      working-directory: TarotApp
      run: |
        ./Scripts/update_xcconfig.sh staging
      env:
        OPENAI_API_KEY: ${{ secrets.OPENAI_API_KEY_STAGING }}
        
    - name: Build Application
      working-directory: TarotApp
      run: |
        tuist build -- -skipPackagePluginValidation -skipMacroValidation
        
    - name: Run Tests
      working-directory: TarotApp
      run: |
        tuist test -- -skipPackagePluginValidation -skipMacroValidation
```

### 8. Security Considerations

#### 8.1 Updated .gitignore
```gitignore
# Configuration files with secrets
**/*.local.xcconfig
**/Local.xcconfig
**/.env
**/.env.*

# MCP configuration with sensitive tokens
.cursor/mcp.json

# Environment setup files
**/Secrets.plist
**/secrets/
```

#### 8.2 Pre-commit Hooks
Implement git hooks to prevent accidental secret commits:
- Scan for API keys in committed files
- Validate `.xcconfig` files only contain placeholders
- Check for sensitive patterns in code

### 9. Developer Experience

#### 9.1 Setup Process
1. **Initial setup**: Run `./Scripts/setup_env.sh`
2. **Configure secrets**: Edit generated `.env.local` file
3. **Generate project**: Run `tuist generate`
4. **Switch environments**: Use scheme selector in Xcode

#### 9.2 Daily Workflow
1. **Start development**: Configuration automatically loaded
2. **Environment switching**: Select appropriate scheme
3. **Build variations**: All configurations available through Xcode UI

### 10. Success Criteria

#### 10.1 Security
- [ ] No API keys in source code
- [ ] All sensitive files properly ignored by Git
- [ ] CI/CD secrets properly injected
- [ ] Local development secrets isolated

#### 10.2 Functionality
- [ ] All four build configurations working
- [ ] Proper environment detection in app
- [ ] Successful builds in all environments
- [ ] App Store submission process validated

#### 10.3 Developer Experience
- [ ] Simple setup process for new developers
- [ ] Clear documentation for all processes
- [ ] Easy environment switching
- [ ] Minimal configuration overhead

### 11. Risk Mitigation

#### 11.1 Identified Risks
1. **Configuration complexity**: Mitigated by comprehensive documentation and automated scripts
2. **Secret exposure**: Mitigated by multiple layers of protection and validation
3. **CI/CD failures**: Mitigated by thorough testing and fallback procedures
4. **Developer onboarding**: Mitigated by automated setup scripts and clear documentation

#### 11.2 Rollback Plan
- Maintain current configuration during implementation
- Gradual migration approach
- Ability to revert to previous setup if issues arise

### 12. Future Considerations

1. **Advanced secret management**: Integration with services like AWS Secrets Manager or Azure Key Vault
2. **Dynamic configuration**: Runtime configuration updates without app rebuilds  
3. **A/B testing**: Framework for feature flags and testing variations
4. **Monitoring**: Integration with analytics for configuration tracking

This PRD provides a comprehensive roadmap for implementing secure, scalable configuration management for your iOS Tarot App while following industry best practices and ensuring smooth CI/CD operations. 