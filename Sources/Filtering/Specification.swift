//
//  Specification.swift
//
//  Created by Reinier Melian Massip on 1/29/20.
//

protocol Specification {
	associatedtype T
	func isSatisfied(item: T) -> Bool
}

class AndSpecification<T,
	SpecA: Specification,
	SpecB: Specification>: Specification
	where SpecA.T == SpecB.T, T == SpecA.T {
	private let firstSpec: SpecA
	private let seconSpec: SpecB

	init(_ first: SpecA, _ second: SpecB) {
		firstSpec = first
		seconSpec = second
	}

	func isSatisfied(item: T) -> Bool {
		return firstSpec.isSatisfied(item: item) && seconSpec.isSatisfied(item: item)
	}
}

class OrSpecification<T,
	SpecA: Specification,
	SpecB: Specification>: Specification
	where SpecA.T == SpecB.T, T == SpecA.T {
	private let firstSpec: SpecA
	private let secondSpec: SpecB

	init(_ first: SpecA, _ second: SpecB) {
		firstSpec = first
		secondSpec = second
	}

	func isSatisfied(item: T) -> Bool {
		return firstSpec.isSatisfied(item: item) || secondSpec.isSatisfied(item: item)
	}
}

protocol AssetSearchable: Asset {
    var searchableTexts: [String] { get }
}

class AssetContaintText: Specification {
	typealias T = AnyAsset

	private let text: String
	init(_ text: String) {
		self.text = text
	}

	func isSatisfied(item: T) -> Bool {
        guard !item.asset.searchableTexts.isEmpty else {
            return false
        }
        return !item.asset.searchableTexts.filter({ $0.contains(text) }).isEmpty
	}
}
