//
//  Unit.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 25.08.2021.
//

import Foundation

enum Unit {
	case percent
	case degrees
}

extension Unit {
	var label: String {
		switch self {
		case .percent:
			return "%"
		case .degrees:
			return "°"
		}
	}
}
