//
//  Specification.swift
//
//  Created by Reinier Melian Massip on 1/29/20.
//

public protocol Specification {
	associatedtype T
	func isSatisfied(item: T) -> Bool
}

public class AndSpecification<T,
	SpecA: Specification,
	SpecB: Specification>: Specification
	where SpecA.T == SpecB.T, T == SpecA.T {
	private let firstSpec: SpecA
	private let seconSpec: SpecB

    public init(_ first: SpecA, _ second: SpecB) {
		firstSpec = first
		seconSpec = second
	}

    public func isSatisfied(item: T) -> Bool {
		return firstSpec.isSatisfied(item: item) && seconSpec.isSatisfied(item: item)
	}
}

public class OrSpecification<T,
	SpecA: Specification,
	SpecB: Specification>: Specification
	where SpecA.T == SpecB.T, T == SpecA.T {
	private let firstSpec: SpecA
	private let secondSpec: SpecB

    public init(_ first: SpecA, _ second: SpecB) {
		firstSpec = first
		secondSpec = second
	}

    public func isSatisfied(item: T) -> Bool {
		return firstSpec.isSatisfied(item: item) || secondSpec.isSatisfied(item: item)
	}
}
