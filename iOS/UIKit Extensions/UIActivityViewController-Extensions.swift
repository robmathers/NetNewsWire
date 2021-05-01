//
//  ShareArticleActivityViewController.swift
//  NetNewsWire-iOS
//
//  Created by Martin Hartl on 01/11/20.
//  Copyright © 2020 Ranchero Software. All rights reserved.
//

import UIKit

extension UIActivityViewController {
	convenience init(url: URL, title: String?, externalURL: URL?, applicationActivities: [UIActivity]?) {
		let itemSource = ArticleActivityItemSource(url: url, subject: title)
		let titleSource = TitleActivityItemSource(title: title)
		
		var activityItems = [titleSource, itemSource]
		
		if let externalURL = externalURL {
			activityItems.append(ExternalURLActivityItemSource(url: externalURL, subject: title))
		}
		
		self.init(activityItems: activityItems, applicationActivities: applicationActivities)
	}
}
