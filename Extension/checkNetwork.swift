//
//  checkNetwork.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 20/09/2022.
//

import Foundation
import CDAlertView
import SystemConfiguration

extension LoadingViewController{
    func isInternetAvailable() -> Bool
    {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
    
    func noConnectionAlert() {
        if !isInternetAvailable() {
            let alert = CDAlertView(title: "Warning", message: "The Internet is not available", type: .error)
            alert.show()
        }
    }
}
