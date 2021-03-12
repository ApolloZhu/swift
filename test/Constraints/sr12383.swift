// RUN: %target-typecheck-verify-swift

protocol Protocol {
  associatedtype Index: Comparable
  subscript(bounds: Range<Index>) -> Int { get }
  // expected-note@+1 {{protocol requires subscript with type '(Wrapper<Base>.Index) -> Int' (aka '(Base.Index) -> Int'); do you want to add a stub?}}
  subscript(position: Index) -> Int { get } 
}

struct Wrapper<Base: Protocol>: Protocol { // expected-error {{type 'Wrapper<Base>' does not conform to protocol 'Protocol'}}
  typealias Index = Base.Index
  subscript(bounds: Range<Index>) -> Int { // expected-note {{candidate has non-matching type '<Base> (Range<Wrapper<Base>.Index>) -> Int' (aka '<Base> (Range<Base.Index>) -> Int')}}
    get { 1 }
  }
}
