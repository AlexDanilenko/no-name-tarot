import Foundation
import TSCBasic
import TuistSupport

/// A task to generate Swift localization files from .xcstrings files
/// Run with: tuist generate-localizations
let task = Task(
    options: [
        .option("verbose", .flag, "Enable verbose output")
    ]
) { parser in
    
    let verbose = parser.get("verbose", as: Bool.self) ?? false
    
    print("🌍 Generating localization files...")
    
    // Configuration
    let xcstringsBaseDir = "TarotApp/Resources"
    let outputDir = "Sources/Generated/Localizations"
    
    // Create output directory
    let fileManager = FileManager.default
    let outputPath = AbsolutePath(outputDir, relativeTo: fileManager.currentDirectoryPath)
    
    do {
        try fileManager.createDirectory(atPath: outputPath.pathString, withIntermediateDirectories: true)
        
        // Check if xcstrings-tool is available
        let result = try Process.run(.init(
            args: ["which", "xcstrings-tool"],
            outputRedirection: .none
        ))
        
        if result.exitStatus != .terminated(code: 0) {
            print("❌ Error: xcstrings-tool not found")
            print("Please install it using:")
            print("  mise settings experimental=true")
            print("  mise use spm:liamnichols/xcstrings-tool")
            throw NSError(domain: "LocalizationTask", code: 1, userInfo: [NSLocalizedDescriptionKey: "xcstrings-tool not found"])
        }
        
        // Find .xcstrings files
        let xcstringsBasePath = AbsolutePath(xcstringsBaseDir, relativeTo: fileManager.currentDirectoryPath)
        let xcstringsFiles = try fileManager.contentsOfDirectory(atPath: xcstringsBasePath.pathString)
            .compactMap { filename -> String? in
                let fullPath = xcstringsBasePath.appending(component: filename).pathString
                return filename.hasSuffix(".xcstrings") ? fullPath : nil
            }
        
        // Also check subdirectories for .xcstrings files
        let subDirectories = ["Texts/Cards"]
        for subDir in subDirectories {
            let subDirPath = xcstringsBasePath.appending(components: subDir.components(separatedBy: "/"))
            if fileManager.fileExists(atPath: subDirPath.pathString) {
                let subFiles = try fileManager.contentsOfDirectory(atPath: subDirPath.pathString)
                    .compactMap { filename -> String? in
                        let fullPath = subDirPath.appending(component: filename).pathString
                        return filename.hasSuffix(".xcstrings") ? fullPath : nil
                    }
                xcstringsFiles.append(contentsOf: subFiles)
            }
        }
        
        if xcstringsFiles.isEmpty {
            print("❌ No .xcstrings files found in \(xcstringsBaseDir)")
            throw NSError(domain: "LocalizationTask", code: 1, userInfo: [NSLocalizedDescriptionKey: "No .xcstrings files found"])
        }
        
        if verbose {
            print("📁 Found .xcstrings files:")
            xcstringsFiles.forEach { print("   - \($0)") }
        }
        
        // Generate localization files
        for xcstringsFile in xcstringsFiles {
            let baseName = URL(fileURLWithPath: xcstringsFile).deletingPathExtension().lastPathComponent
            let outputFile = outputPath.appending(component: "\(baseName).swift").pathString
            
            if verbose {
                print("🏗️  Generating \(outputFile) from \(xcstringsFile)")
            }
            
            let generateResult = try Process.run(.init(
                args: [
                    "xcstrings-tool", "generate",
                    xcstringsFile,
                    "--output", outputFile,
                    "--access-level", "internal"
                ],
                outputRedirection: verbose ? .stream(stdout: TSCBasic.stdoutStream, stderr: TSCBasic.stderrStream) : .none
            ))
            
            if generateResult.exitStatus != .terminated(code: 0) {
                throw NSError(domain: "LocalizationTask", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to generate \(outputFile)"])
            }
        }
        
        print("✅ Successfully generated localization files in \(outputDir)")
        
        // List generated files
        let generatedFiles = try fileManager.contentsOfDirectory(atPath: outputPath.pathString)
            .filter { $0.hasSuffix(".swift") }
        
        print("📁 Generated files:")
        generatedFiles.forEach { print("   - \($0)") }
        
        print("🎉 Done!")
        
    } catch {
        print("❌ Error: \(error.localizedDescription)")
        throw error
    }
} 