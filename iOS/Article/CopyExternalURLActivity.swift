//
//  CopyExternalURLActivity.swift
//  NetNewsWire-iOS
//
//  Created by Rob Mathers on 2021-04-13.
//  Copyright © 2021 Ranchero Software. All rights reserved.
//

import UIKit
import MobileCoreServices

final class CopyExternalURLActivity: UIActivity {
	
	private var activityItems: [Any]?
	
	override var activityTitle: String? {
		NSLocalizedString("Copy External URL", comment: "Copy External URL")
	}
	
	override var activityType: UIActivity.ActivityType? {
		.copyExternalURL
	}
	
	override var activityImage: UIImage? {
		UIImage(systemName: "doc.on.doc", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))
	}
	
	override class var activityCategory: UIActivity.Category { .action }
	
	override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
		return activityItems.contains(where: { $0 is URL })
	}
	
	override func prepare(withActivityItems activityItems: [Any]) {
		self.activityItems = activityItems
	}
	
	override func perform() {
		guard let url = activityItems?.first(where: { $0 is URL }) as? URL else {
			activityDidFinish(false)
			return
		}
		UIPasteboard.general.url = url
	}
}

extension UIActivity.ActivityType {
	static let copyExternalURL = UIActivity.ActivityType(rawValue: "com.ranchero.NetNewsWire.copyExternalURL")
}
