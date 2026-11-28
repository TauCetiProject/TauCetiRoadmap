import Mathlib

/-!
# Local Galois deformation rings and their components, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable at the pins, each with
`sorry`.

Stated here:

* the irreducible crossing theorem (Layer 5, §5.3): in `O⟦x₀,…,x_{n+1}⟧` over a complete
  discrete valuation ring `O` with uniformiser `ϖ`, the element `x₀x₁ + ϖ^d u` is prime for every
  `d > 0` and every unit `u` (BHHMS23, Lemma 3.3.1).

Not statable at the pins, with what each lacks:

* the single-type presentation `R^{≤(3,0),τ}⟦X₁,…,X_{2f}⟧ ≅ (R/Σ_j I_j)⟦Y₁,…,Y₄⟧` with its
  Hodge-labelled prime kernels (§6.1), the component theorem (§6.2) and the reduced special
  fibres (§6.3): there is no framed local Galois deformation ring of a residual representation
  of `G_K` and no potentially crystalline quotient of fixed Hodge and inertial type at the pins;
  the transported ideals `I_j`, `P_{j,λ}` are defined through the comparison automorphism `ψ`,
  which is constructed from that quotient;
* the multiple-type presentation for a Serre weight and its `4^f` components (§7.3) and the
  integral component intersection `p ∈ (Q₁ ∩ Q₂) + P_{w̃,j,(3,0)}` (§7.5): besides the
  deformation rings, the Serre-weight set `W(ρ̄)`, the compact types `σ(τ)` of `GL₂(O_K)` and
  the transported prime `P_{w̃,j,(3,0)}` are missing;
* the weight–shape bijection `θ : W(ρ̄) → {t^(2,1), t^(1,2)}^f` (§4.3): Serre weights of
  `GL₂(𝔽_q)` and the reduction of `σ(τ)` are missing;
* the classification of semisimple residual representations with fixed tame inertia by monomial
  étale `φ`-modules (§3.6) and the descent of isomorphisms along the Kummer tower (§3.9): étale
  `φ`-modules over `k((v))` with coefficients and their contravariant Galois realization are
  missing, and so are the fundamental characters `ω_{f′}` and the genericity of a residual
  representation that §3.9 assumes.
-/

namespace TauCetiRoadmap.LocalGaloisDeformationRingsPartII

open MvPowerSeries

/-! ## Layer 5: Polynomial charts and effective comparison -/

/-- **Irreducible crossing** (BHHMS23, Lemma 3.3.1, p. 24). Let `O` be a complete discrete
valuation ring with uniformiser `ϖ`, and let `A = O⟦x₀,…,x_{n+1}⟧` (at least two variables).
For every `d > 0` and every unit `u` of `A`, the crossing element `x₀x₁ + ϖ^d u` is a prime
element of `A`. The source proves irreducibility; primality uses that `A` is a regular local
ring, hence factorial (Auslander–Buchsbaum), which neither Mathlib nor Tau Ceti proves for power
series in more than one variable over a discrete valuation ring. -/
theorem crossing_prime {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] {ϖ : O} (hϖ : Irreducible ϖ)
    (n : ℕ) {d : ℕ} (hd : 0 < d) (u : (MvPowerSeries (Fin (n + 2)) O)ˣ) :
    Prime (X 0 * X 1 + C (ϖ ^ d) * (u : MvPowerSeries (Fin (n + 2)) O)) := by
  sorry

end TauCetiRoadmap.LocalGaloisDeformationRingsPartII
