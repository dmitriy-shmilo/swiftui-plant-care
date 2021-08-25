//
//  Vitals.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 25.08.2021.
//

import Foundation

struct Vitals<V>: Hashable
	where V: Hashable {

	let value: V
	let unit: Unit
	let status: Status
	
	init(_ value: V, _ unit: Unit, _ status: Status) {
		self.value = value
		self.status = status
		self.unit = unit
	}
}

extension Vitals where V == Float {
	func asFormattedString() -> String {
		switch unit {
		case .percent:
			return String(format: "%d %@", Int(value * 100), unit.label)
		case .degrees:
			// TODO: find a better way to represent temperature
			// this assumes temperature spans between 0 and 100 degrees,
			// and the resulting chart makes less sense
			return String(format: "%.1f %@", value * 100, unit.label)
		}
	}
}
