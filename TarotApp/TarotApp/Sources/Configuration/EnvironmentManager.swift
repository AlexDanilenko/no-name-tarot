import Foundation
import Dependencies

/// Manages environment-specific configuration for the app
public struct EnvironmentManager {
    
    /// Available build environments
    public enum Environment: String, CaseIterable {
        case debug = "Debug"
        case staging = "Staging" 
        case production = "Production"
        
        /// Human-readable display name for the environment
        public var displayName: String {
            switch self {
            case .debug: return "Debug"
            case .staging: return "Staging"
            case .production: return "Production"
            }
        }
        
        /// Color representation for UI (if needed)
        public var debugColor: String {
            switch self {
            case .debug: return "🟢"
            case .staging: return "🟡" 
            case .production: return "🔴"
            }
        }
    }
    
    // MARK: - Dependency Interface
    public var environment: Environment
    public var openAIAPIKey: String
    public var apiBaseURL: String
    public var isDebugMode: Bool
    public var allowsTestFeatures: Bool
    public var analyticsEnabled: Bool
    public var crashReportingEnabled: Bool
    public var getEnvironmentInfo: () -> [String: Any]
    public var printEnvironmentInfo: () -> Void
}

// MARK: - Live Implementation
extension EnvironmentManager {
    public static let liveValue = Self(
        environment: {
            #if DEBUG
            return .debug
            #elseif STAGING
            return .staging
            #elseif PRODUCTION
            return .production
            #else
            return .debug // Default fallback
            #endif
        }(),
        openAIAPIKey: {
            guard let apiKey = Bundle.main.infoDictionary?["OPENAI_API_KEY"] as? String,
                  !apiKey.isEmpty,
                  !apiKey.contains("PLACEHOLDER") else {
                let currentEnv: Environment = {
                    #if DEBUG
                    return .debug
                    #elseif STAGING
                    return .staging
                    #elseif PRODUCTION
                    return .production
                    #else
                    return .debug
                    #endif
                }()
                fatalError("🚨 OpenAI API key not configured for \(currentEnv.displayName) environment. Please run setup script and configure your API key.")
            }
            return apiKey
        }(),
        apiBaseURL: {
            guard let baseURL = Bundle.main.infoDictionary?["API_BASE_URL"] as? String,
                  !baseURL.isEmpty else {
                return "https://api.openai.com/v1/" // Default fallback
            }
            return baseURL
        }(),
        isDebugMode: {
            #if DEBUG
            return true
            #else
            return false
            #endif
        }(),
        allowsTestFeatures: {
            #if DEBUG || STAGING
            return true
            #else
            return false
            #endif
        }(),
        analyticsEnabled: {
            #if PRODUCTION
            return true
            #else
            return false // Disable analytics in debug and staging
            #endif
        }(),
        crashReportingEnabled: {
            #if PRODUCTION || STAGING
            return true
            #else
            return false // Disable crash reporting in debug
            #endif
        }(),
        getEnvironmentInfo: {
            let currentEnv: Environment = {
                #if DEBUG
                return .debug
                #elseif STAGING
                return .staging
                #elseif PRODUCTION
                return .production
                #else
                return .debug
                #endif
            }()
            
            let isDebug: Bool = {
                #if DEBUG
                return true
                #else
                return false
                #endif
            }()
            
            let allowsTest: Bool = {
                #if DEBUG || STAGING
                return true
                #else
                return false
                #endif
            }()
            
            let analytics: Bool = {
                #if PRODUCTION
                return true
                #else
                return false
                #endif
            }()
            
            let crashReporting: Bool = {
                #if PRODUCTION || STAGING
                return true
                #else
                return false
                #endif
            }()
            
            let apiURL = Bundle.main.infoDictionary?["API_BASE_URL"] as? String ?? "https://api.openai.com/v1/"
            let hasValidKey = (Bundle.main.infoDictionary?["OPENAI_API_KEY"] as? String)
                .map { !$0.isEmpty && !$0.contains("PLACEHOLDER") } ?? false
            
            return [
                "environment": currentEnv.displayName,
                "isDebugMode": isDebug,
                "allowsTestFeatures": allowsTest,
                "analyticsEnabled": analytics,
                "crashReportingEnabled": crashReporting,
                "apiBaseURL": apiURL,
                "hasValidAPIKey": hasValidKey,
                "bundleIdentifier": Bundle.main.bundleIdentifier ?? "Unknown",
                "appVersion": Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown",
                "buildNumber": Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown"
            ]
        },
        printEnvironmentInfo: {
            #if DEBUG
            let currentEnv: Environment = {
                #if DEBUG
                return .debug
                #elseif STAGING
                return .staging
                #elseif PRODUCTION
                return .production
                #else
                return .debug
                #endif
            }()
            
            let isDebug: Bool = {
                #if DEBUG
                return true
                #else
                return false
                #endif
            }()
            
            let allowsTest: Bool = {
                #if DEBUG || STAGING
                return true
                #else
                return false
                #endif
            }()
            
            let analytics: Bool = {
                #if PRODUCTION
                return true
                #else
                return false
                #endif
            }()
            
            let crashReporting: Bool = {
                #if PRODUCTION || STAGING
                return true
                #else
                return false
                #endif
            }()
            
            let apiURL = Bundle.main.infoDictionary?["API_BASE_URL"] as? String ?? "https://api.openai.com/v1/"
            let hasValidKey = (Bundle.main.infoDictionary?["OPENAI_API_KEY"] as? String)
                .map { !$0.isEmpty && !$0.contains("PLACEHOLDER") } ?? false
            
            print("🔧 Environment Manager Configuration:")
            print("   Environment: \(currentEnv.debugColor) \(currentEnv.displayName)")
            print("   Debug Mode: \(isDebug)")
            print("   Test Features: \(allowsTest)")
            print("   Analytics: \(analytics)")
            print("   Crash Reporting: \(crashReporting)")
            print("   API Base URL: \(apiURL)")
            print("   Valid API Key: \(hasValidKey)")
            print("   Bundle ID: \(Bundle.main.bundleIdentifier ?? "Unknown")")
            #endif
        }
    )
}

// MARK: - Test Implementation
extension EnvironmentManager {
    public static let testValue = Self(
        environment: .debug,
        openAIAPIKey: "test-api-key",
        apiBaseURL: "https://api.openai.com/v1/",
        isDebugMode: true,
        allowsTestFeatures: true,
        analyticsEnabled: false,
        crashReportingEnabled: false,
        getEnvironmentInfo: {
            return [
                "environment": "Debug",
                "isDebugMode": true,
                "allowsTestFeatures": true,
                "analyticsEnabled": false,
                "crashReportingEnabled": false,
                "apiBaseURL": "https://api.openai.com/v1/",
                "hasValidAPIKey": true,
                "bundleIdentifier": "com.test.app",
                "appVersion": "1.0.0",
                "buildNumber": "1"
            ]
        },
        printEnvironmentInfo: {}
    )
}

// MARK: - Dependency Registration
private enum EnvironmentManagerKey: DependencyKey {
    static let liveValue = EnvironmentManager.liveValue
    static let testValue = EnvironmentManager.testValue
}

extension DependencyValues {
    public var environmentManager: EnvironmentManager {
        get { self[EnvironmentManagerKey.self] }
        set { self[EnvironmentManagerKey.self] = newValue }
    }
    
}
