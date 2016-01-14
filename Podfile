# remove source line below before going live with the tutorials
source 'https://hub.jazz.net/git/oper2000/imf-client-sdk-specs-inhouse.git'
use_frameworks!
pod 'IBMMobileFirstPlatformFoundation'
post_install do |installer_representation|
    workDir = Dir.pwd
    debugXcconfigFilename = "#{workDir}/Pods/Target Support Files/Pods/Pods.debug.xcconfig"
    xcconfig = File.read(debugXcconfigFilename)
    newXcconfig = xcconfig.gsub(/HEADER_SEARCH_PATHS = .*/, "HEADER_SEARCH_PATHS = ")
    File.open(debugXcconfigFilename, "w") { |file| file << newXcconfig }

    releaseXcconfigFilename = "#{workDir}/Pods/Target Support Files/Pods/Pods.release.xcconfig"
    xcconfig = File.read(releaseXcconfigFilename)
    newXcconfig = xcconfig.gsub(/HEADER_SEARCH_PATHS = .*/, "HEADER_SEARCH_PATHS = ")
    File.open(releaseXcconfigFilename, "w") { |file| file << newXcconfig }
end
 
