//
//  Plant.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 21.08.2021.
//

import Foundation

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
