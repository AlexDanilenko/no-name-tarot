# 🔐 Phase 4: Secrets Setup Guide

## Overview
This guide covers the **manual setup** required after Phase 3 (CI/CD Pipeline) implementation. You'll configure GitHub Repository Secrets to enable automated builds with secure API key management.

## 🎯 What You'll Set Up

### Required GitHub Repository Secrets

#### **API Secrets (Environment-Specific)**
| Secret Name | Environment | Description | Example Value |
|-------------|-------------|-------------|---------------|
| `OPENAI_API_KEY_STAGING` | Staging/TestFlight | OpenAI API key for staging | `sk-proj-...` |
| `OPENAI_API_KEY_PRODUCTION` | Production/App Store | OpenAI API key for production | `sk-proj-...` |
| `API_BASE_URL_STAGING` | Staging/TestFlight | API base URL for staging | `https://api.openai.com/v1/` |
| `API_BASE_URL_PRODUCTION` | Production/App Store | API base URL for production | `https://api.openai.com/v1/` |

#### **Apple App Store Connect Secrets**
| Secret Name | Description | How to Get |
|-------------|-------------|------------|
| `APP_STORE_CONNECT_API_KEY_ID` | API Key ID | App Store Connect > Users & Access > Integrations > App Store Connect API |
| `APP_STORE_CONNECT_ISSUER_ID` | Issuer ID | Same location as API Key ID |
| `APP_STORE_CONNECT_PRIVATE_KEY` | Private Key (.p8 file content) | Download from App Store Connect |

#### **Code Signing Secrets**
| Secret Name | Description | Usage |
|-------------|-------------|-------|
| `MATCH_PASSWORD` | Password for fastlane match | If using fastlane match for code signing |
| `FASTLANE_PASSWORD` | Apple ID password | For fastlane authentication |

---

## 📋 Step-by-Step Setup

### Step 1: Navigate to Repository Secrets
1. Go to your GitHub repository: `https://github.com/AlexDanilenko/no-name-tarot`
2. Click **Settings** tab
3. In the left sidebar, click **Secrets and variables** → **Actions**

### Step 2: Add API Secrets

#### Add Staging API Secrets
1. Click **New repository secret**
2. Name: `OPENAI_API_KEY_STAGING`
3. Secret: Your OpenAI API key for staging environment
4. Click **Add secret**

5. Click **New repository secret**
6. Name: `API_BASE_URL_STAGING`
7. Secret: `https://api.openai.com/v1/`
8. Click **Add secret**

#### Add Production API Secrets
1. Click **New repository secret**
2. Name: `OPENAI_API_KEY_PRODUCTION`
3. Secret: Your OpenAI API key for production environment
4. Click **Add secret**

5. Click **New repository secret**
6. Name: `API_BASE_URL_PRODUCTION`
7. Secret: `https://api.openai.com/v1/`
8. Click **Add secret**

### Step 3: Set Up App Store Connect API (Required for CI/CD)

#### Get App Store Connect API Credentials
1. Visit [App Store Connect](https://appstoreconnect.apple.com)
2. Go to **Users and Access** → **Integrations** → **App Store Connect API**
3. Click **Generate API Key** (if you don't have one)
4. Download the `.p8` file and note the **Key ID** and **Issuer ID**

#### Add App Store Connect Secrets
1. **API Key ID**:
   - Name: `APP_STORE_CONNECT_API_KEY_ID`
   - Secret: The Key ID from App Store Connect

2. **Issuer ID**:
   - Name: `APP_STORE_CONNECT_ISSUER_ID`
   - Secret: The Issuer ID from App Store Connect

3. **Private Key**:
   - Name: `APP_STORE_CONNECT_PRIVATE_KEY`
   - Secret: Open the `.p8` file in a text editor and copy the entire contents

### Step 4: Update Export Options (Required)

You need to update the plist files with your actual Team ID:

1. Edit `TarotApp/ExportOptions-Staging.plist`
2. Replace `YOUR_TEAM_ID` with your Apple Developer Team ID
3. Edit `TarotApp/ExportOptions-Production.plist`
4. Replace `YOUR_TEAM_ID` with your Apple Developer Team ID

---

## 🔧 Configuration Files to Update

### Update Team ID in Export Options
```bash
# Find your Team ID in Xcode or Apple Developer Portal
# Then update both files:
# TarotApp/ExportOptions-Staging.plist
# TarotApp/ExportOptions-Production.plist

# Replace:
<key>teamID</key>
<string>YOUR_TEAM_ID</string>

# With:
<key>teamID</key>
<string>ABC123DEF4</string>  # Your actual Team ID
```

---

## 🚀 Testing Your Setup

### Test Staging Build
1. Push to `develop` branch or create a tag with `-staging` suffix:
   ```bash
   git tag v1.0.0-staging
   git push origin v1.0.0-staging
   ```

2. Check GitHub Actions tab for `Staging Build & TestFlight Deploy` workflow

### Test Production Release
1. Create a production tag:
   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```

2. Check GitHub Actions tab for `Production Release & App Store Deploy` workflow

---

## 🔍 Troubleshooting

### Common Issues

#### 1. Missing Secrets Error
```
Error: Secret OPENAI_API_KEY_STAGING not found
```
**Solution**: Double-check secret names match exactly (case-sensitive)

#### 2. App Store Connect Authentication Failed
```
Error: Invalid API key
```
**Solution**: Verify API Key ID, Issuer ID, and Private Key are correct

#### 3. Code Signing Issues
```
Error: No matching provisioning profiles found
```
**Solution**: Set up proper provisioning profiles or implement fastlane match

### Verification Checklist

- [ ] All API secrets added to GitHub
- [ ] App Store Connect API credentials configured
- [ ] Team ID updated in export options
- [ ] Test workflow runs successfully
- [ ] Local development still works with `./Scripts/setup_env.sh`

---

## 🎉 What Happens After Setup

Once secrets are configured:

1. **Automatic Staging Builds**: Push to `develop` → TestFlight deployment
2. **Automatic Production Releases**: Create version tags → App Store deployment
3. **Secure Secret Management**: No secrets in code, all managed through GitHub
4. **Environment Separation**: Different API keys for staging vs production
5. **Local Development**: Still works with local `.env` files

---

## 🔗 Related Files

- **Workflows**: `.github/workflows/staging-build.yml`, `.github/workflows/production-release.yml`
- **Configs**: `TarotApp/Configurations/*.xcconfig`
- **Scripts**: `TarotApp/Scripts/setup_env.sh`, `TarotApp/Scripts/update_xcconfig.sh`
- **Export**: `TarotApp/ExportOptions-*.plist`

---

## 📞 Need Help?

If you encounter issues:
1. Check GitHub Actions logs for detailed error messages
2. Verify all secret names match the workflow files exactly
3. Ensure your Apple Developer account has proper permissions
4. Test local builds first with `tuist generate && tuist build` 