import XCTest
import Dependencies
@testable import Lunalit

final class EnvironmentManagerTests: XCTestCase {

    func testEnvironmentManagerTestValue() {
        // Test the test implementation
        let env = EnvironmentManager.testValue
        
        XCTAssertEqual(env.environment, .debug)
        XCTAssertEqual(env.openAIAPIKey, "test-api-key")
        XCTAssertEqual(env.apiBaseURL, "https://api.openai.com/v1/")
        XCTAssertTrue(env.isDebugMode)
        XCTAssertTrue(env.allowsTestFeatures)
        XCTAssertFalse(env.analyticsEnabled)
        XCTAssertFalse(env.crashReportingEnabled)
    }
    
    func testEnvironmentInfo() {
        // Test environment info generation
        let env = EnvironmentManager.testValue
        let info = env.getEnvironmentInfo()
        
        XCTAssertEqual(info["environment"] as? String, "Debug")
        XCTAssertEqual(info["isDebugMode"] as? Bool, true)
        XCTAssertEqual(info["allowsTestFeatures"] as? Bool, true)
        XCTAssertEqual(info["analyticsEnabled"] as? Bool, false)
        XCTAssertEqual(info["crashReportingEnabled"] as? Bool, false)
        XCTAssertEqual(info["apiBaseURL"] as? String, "https://api.openai.com/v1/")
        XCTAssertEqual(info["hasValidAPIKey"] as? Bool, true)
    }
    
    func testDependencyAccess() {
        // Test that dependency values work correctly
        withDependencies {
            $0.environmentManager = .testValue
        } operation: {
            @Dependency(\.environmentManager) var envManager
            
            XCTAssertEqual(envManager.environment, .debug)
            XCTAssertEqual(envManager.openAIAPIKey, "test-api-key")
            XCTAssertEqual(envManager.apiBaseURL, "https://api.openai.com/v1/")
        }
    }
    
    func testCompilationFlags() {
        // This test verifies our build configurations are set up correctly
        #if DEBUG
        XCTAssertTrue(true, "DEBUG flag is set correctly")
        #else
        XCTFail("DEBUG flag should be set in test builds")
        #endif
        
        #if STAGING
        XCTFail("STAGING flag should not be set in test builds")
        #endif
        
        #if PRODUCTION
        XCTFail("PRODUCTION flag should not be set in test builds")
        #endif
    }
} 