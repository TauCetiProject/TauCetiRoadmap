import Mathlib

/-!
# Four-dimensional Seiberg–Witten theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, as its acceptance test.

The headline theorems are:

* **Compactness** (README §5.4, with the bound of §5.2): for a closed oriented Riemannian
  four-manifold with a Spinᶜ structure and a smooth self-dual perturbation `η`, the solutions of the
  perturbed Seiberg–Witten equations modulo gauge form a compact space, and every solution satisfies
  `|ψ|² ≤ max(0, sup(2√2|η| − Scal))`.
* **Structure of the moduli space** (§§3.3, 3.5, 6.3): if `b₂⁺ ≥ 1`, for generic parameters the
  moduli space is a compact smooth manifold of dimension `(⟨l², [X]⟩ − 2χ − 3σ)/4`, empty when this
  is negative.
* **Invariance** (§§8.2–8.3): the integral alternating forms `SW^r` on `H₁(X; ℤ)/torsion` do not
  depend on the metric or the perturbation when `b₂⁺ > 1`, and are constant on each chamber when
  `b₂⁺ = 1`.
* **Wall crossing** (§10.3): for `b₂⁺ = 1`, `d ≥ 0`, `0 ≤ r ≤ min(b₁, d)` and `r ≡ d ≡ b₁ mod 2`,
  the jump `SW^r_+(λ) − SW^r_−(λ)` is `⟨ν_T(λ) u^k/k!, [T]_h⟩` on the Picard torus, with
  `k = (b₁ − r)/2`; outside this range both invariants vanish and the formula is not asserted.

None of them is statable at the pins, so this file declares nothing. Each needs Spinᶜ structures on
a smooth four-manifold (principal lifts of the oriented frame bundle with their spinor bundles and
determinant line), Spinᶜ connections and the Spinᶜ Dirac operator on sections, Sobolev completions
of spaces of sections over a compact manifold, and the action of the gauge group `X → U(1)` on
configurations, none of which exists in Mathlib or Tau Ceti at the pins. The structure theorem
further needs the first Chern class of a complex line bundle on a manifold and the signature of a
closed oriented four-manifold; the invariance and wall-crossing theorems further need the moduli
space as a manifold with a fundamental class, the universal line bundle over the configuration
space, homology orientations and `b₂⁺` of a manifold; the wall-crossing formula further needs the
Dirac family over the Picard torus and its index in `K⁰` with its Segre classes.

The pointwise algebra used by the first layers is proved in Tau Ceti and is not restated here: the
group `CliffordAlgebra.spinCGroup` and its half-spin representations
`CliffordAlgebra.spinCGroupHalfSpinRep`, the Clifford map `TauCeti.SeibergWitten.cliffordRestriction`
and its adjoint, the quadratic endomorphism `TauCeti.SeibergWitten.quadraticEnd` with its trace,
self-adjointness, phase invariance and real derivative, and the quadratic two-form
`TauCeti.SeibergWitten.quadraticTwoForm`.
-/

namespace TauCetiRoadmap.SeibergWittenTheory

end TauCetiRoadmap.SeibergWittenTheory
