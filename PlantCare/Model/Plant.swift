//
//  Plant.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 21.08.2021.
//

import Foundation

enum Status: String {
	case healthy = "Healthy"
	case deteriorating = "Deteriorating"
	case critical = "Critical"
	case dead = "Dead"
}

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

struct Plant: Hashable, Identifiable {
	var id: Int {
		name.hash
	}
	
	let name: String
	let location: String
	let status: Status
	let water: Vitals<Float>
	let light: Vitals<Float>
	let temperature: Vitals<Float>
	let imageName: String
}

struct ModelData {
	static var plants: [Plant] = [
		.init(
			name: "Aloe Vera",
			location: "Living Room",
			status: .healthy,
			water: .init(0.66, .percent, .healthy),
			light: .init(0.75, .percent, .healthy),
			temperature: .init(0.25, .degrees, .healthy),
			imageName: "AloeVera"
		),
		.init(
			name: "Orchid",
			location: "Living Room",
			status: .healthy,
			water: .init(0.25, .percent, .deteriorating),
			light: .init(0.73, .percent, .healthy),
			temperature: .init(0.243, .degrees, .healthy),
			imageName: "Orchid"
		),
		.init(
			name: "Succulent",
			location: "Guest Room",
			status: .deteriorating,
			water: .init(0.11, .percent, .critical),
			light: .init(0.90, .percent, .deteriorating),
			temperature: .init(0.433, .degrees, .healthy),
			imageName: "Succulent"
		),
	]
}
