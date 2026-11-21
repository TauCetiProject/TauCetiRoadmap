module

import Mathlib

/-!
# Modularity of elliptic curves over imaginary quadratic fields, Part II (all CM fields): target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti when their carriers exist there or can be
supplied by a few simple definitions. For this roadmap none can, so the file declares nothing.

The headline theorems and what each lacks at the pins:

* Theorem 2.5, modularity of every elliptic curve over a CM field not containing `ζ₅`, and
  Theorem 8.1, modularity of every elliptic curve over every CM field. Both assert an isobaric
  automorphic representation `π_E` of `GL₂(𝔸_K)` of weight zero and trivial central character
  whose attached `ℓ`-adic Galois representations realize the étale `H¹(E_K̄, Q̄_ℓ)` for every `ℓ` and
  every `ι : Q̄_ℓ ≅ ℂ`, with Frobenius-semisimple Weil–Deligne compatibility at every finite place
  away from `ℓ`, agreement of every finite local factor, the expected parameter at every complex
  place and `L(E/K, s) = L(π_E, s − 1/2)`. The elliptic-curve side exists at the pins: Tau Ceti's
  `WeierstrassCurve.tateModuleGaloisRepresentation` is the `ℤ_ℓ`-linear Galois action on the Tate
  module, dual to `H¹`, and Mathlib's `WeierstrassCurve.LSeries`, the Euler product of the local
  factors read on minimal models at the primes of `K`, is the left side `L(E/K, s)` of the
  `L`-function identity. Missing: automorphic representations of `GL₂` over a number field (Mathlib
  has `NumberField.AdeleRing` but no automorphic forms on `GL₂(𝔸_K)`), the Galois representations
  attached to them, Weil–Deligne representations and the local Langlands correspondence for `GL₂`,
  and the `L`-functions of automorphic representations of `GL₂(𝔸_K)` for a CM field `K` (Mathlib's
  `ModularForm.L` is that of a classical modular form, an object over `ℚ`).
* Theorem 6.2, the potentially Barsotti–Tate lifting theorem at five over CM fields with a
  protected place: a continuous `ρ : G_F → GL₂(Q̄₅)` with determinant `ε₅⁻¹`, potentially
  semistable above five with labelled Hodge–Tate weights `{0, 1}`, with `ρ̄` decomposed generic and
  absolutely irreducible on `G_{F(ζ₅)}`, and residually automorphic with matching types above five,
  is `r_ι(Π)` for a cuspidal weight-zero `Π` of `PGL₂(𝔸_F)`, provided either the projective field
  of `ρ̄` omits `ζ₅` in the exceptional case, or `ζ₅ ∈ F` and there is a nonempty set of places
  prime to five at which `ρ̄` has nontrivial unipotent inertia, `ρ` is unipotently ramified, the
  automorphic representation has Iwahori-fixed vectors, and both are unramified at the complex
  conjugate place. Missing: the automorphic carriers above together with
  potentially semistable `p`-adic representations of local Galois groups and their labelled
  Hodge–Tate weights, none of which exists at the pins.

The field-theoretic, finite-group and local statements of Layers 1 and 3 (CM-ness of cyclotomic
extensions of CM fields, the detection of the exceptional class of `H¹(SL₂(𝔽₅), ad⁰)` by an
order-five unipotent subgroup, the unipotent-inertia condition at a protected place) are
ingredients of these proofs, not headline theorems; they are specified in `README.md` with their
Checks.
-/

namespace TauCetiRoadmap.EllipticCurveModularityImaginaryQuadraticPartII

end TauCetiRoadmap.EllipticCurveModularityImaginaryQuadraticPartII
