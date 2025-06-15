//
//  NotificationsService.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 16.02.2025.
//

import Foundation
import UserNotifications
import Dependencies


struct NotificationsService {
    let request: () async -> Result<Bool, Error>
}


extension NotificationsService {
    
    static func live() -> NotificationsService {
        let center = UNUserNotificationCenter.current()

        return NotificationsService {
            do {
                return await .success(try center.requestAuthorization(options: [.alert, .badge, .sound]))
            } catch {
                return .failure(error)
            }
        }
    }
}

extension NotificationsService: DependencyKey {
    static var liveValue: NotificationsService {
        .live()
    }
}

extension DependencyValues {
    var notificationService: NotificationsService {
        get { self[NotificationsService.self] }
        set { self[NotificationsService.self] = newValue }
    }
}
