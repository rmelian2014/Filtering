//
//  Filter.swift
//
//  Created by Reinier Melian Massip on 1/29/20.
//

protocol Filter {
	associatedtype T
	func filter<Spec: Specification>(_ items: [T], _ spec: Spec) -> [T]
		where Spec.T == T
}

class FilterImpl<T>: Filter {

	func filter<Spec: Specification>(_ items: [T], _ spec: Spec) -> [T]
		where Spec.T == T {
		return items.filter({ spec.isSatisfied(item: $0)})
	}
}
