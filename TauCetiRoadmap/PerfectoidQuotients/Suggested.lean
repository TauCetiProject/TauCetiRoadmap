import Mathlib

/-!
# Perfectoid quotients: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

The bound-one theorem for p-power torsion in principal Witt-vector quotients
(§0.3, BMS2 Proposition 4.19(3)) is stated on Mathlib's actual Witt vectors
and quotient rings, over arbitrary perfect characteristic-p coefficient rings.
It needs no auxiliary definitions.

The other integral-perfectoid headlines in Layer 0, including perfectoid Tor
independence, Fontaine base change and generators, torsion removal, perfectoid
completion of root closures, completed ring operations and the fixed-field model
comparison, need PerfectoidSpaces' common `IsIntegralPerfectoid` predicate,
which is absent at the pins. Complete étale δ-extension additionally needs the
δ-ring carrier and derived completion; the cotangent conclusions need the full
cotangent complex. The finite-Witt Frobenius-surjectivity equivalences need the
length-reducing finite Frobenius and finite Fontaine maps.

Layer 1's relative prismatic covers and modulo-p ind-syntomic André refinement
need the missing prism, prismatic-cohomology and integral-perfectoid carriers.
Its almost faithfully flat root extensions and functorial almost absolutely
integrally closed extensions also need perfectoid fields, analytic perfectoid
pairs, and the almost module category with its saturation functor. Layer 2's
headline comparison of the radical quotient with universal perfectoidization
needs the missing semiperfectoid carrier and its universal perfectoidization.
These statements remain in the README until their prerequisite objects exist.
-/

namespace TauCetiRoadmap.PerfectoidQuotients

namespace Witt

variable (p : ℕ) [Fact p.Prime]
variable {k : Type*} [CommRing k] [CharP k p] [PerfectRing k p]

/-- BMS2 Proposition 4.19(3), §0.3: all p-power torsion in `W(k)/(ξ)` is
killed by p when Witt coordinate one of ξ is a unit. -/
theorem witt_principal_quotient_p_torsion (ξ : WittVector p k)
    (hξ : IsUnit (ξ.coeff 1)) (n : ℕ)
    (x : WittVector p k ⧸ Ideal.span {ξ})
    (hx : (p : WittVector p k ⧸ Ideal.span {ξ}) ^ n * x = 0) :
    (p : WittVector p k ⧸ Ideal.span {ξ}) * x = 0 := by
  sorry

end Witt

end TauCetiRoadmap.PerfectoidQuotients
