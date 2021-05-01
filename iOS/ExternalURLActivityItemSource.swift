//
//  ExternalURLActivityItemSource.swift
//  NetNewsWire-iOS
//
//  Created by Rob Mathers on 2021-04-13.
//  Copyright © 2021 Ranchero Software. All rights reserved.
//

import UIKit

final class ExternalURLActivityItemSource: NSObject, UIActivityItemSource {
	
	private let url: URL
	private let subject: String?
	
	init(url: URL, subject: String?) {
		self.url = url
		self.subject = subject
	}
	
	func activityViewControllerPlaceholderItem(_ : UIActivityViewController) -> Any {
		return url
	}
	
	func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
		// TODO: this doesn't yet work, because it doesn't get called when UIActivity is setting up application activities
		if activityType == .copyArticleURL {
			return url
		}
		else {
			return nil
		}
	}
	
	func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
		return subject ?? ""
	}
	
}

