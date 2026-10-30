import Mathlib

/-!
# Gromov–Witten theory of closed symplectic manifolds: target signatures

**This file is not the roadmap.** The definitive document is `README.md`. This file states
the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`,
and names the ones that are not statable at the pins together with the carrier each lacks.

The headline theorems are:

1. **The Gromov–Witten operations and the Kontsevich–Manin properties** (Layers 2–6): for a
   closed symplectic manifold `(X, ω)` with a tame almost complex structure, a class
   `A ∈ H₂(X; ℤ)` and `2g − 2 + n > 0`, the linear maps
   `I_(g,n,A) : H^*(X; ℚ)^(⊗n) → H^*(M̄_(g,n); ℚ)` defined by the weighted pairing against the
   stable-map virtual functional, independent of the tame structure along compact paths, and
   satisfying effectivity, covariance, grading, fundamental class, divisor, mapping to a point,
   splitting and genus reduction.
2. **The genus-one degree-zero normalization** (§3.4): `I_(1,1,0)(1) = χ(X) · 1`.
3. **The unital cohomological field theory and the quantum product** (§7.1–§7.2): the
   Novikov-completed classes form a unital cohomological field theory over
   `Nov(ℚ, H₂(X; ℤ), ω)`, and the quantum product `⋆` is associative, graded commutative
   and unital with the cup product as its degree-zero term.
4. **Descendants** (§8.4–§8.6): the string, dilaton and divisor equations and the genus-zero
   topological recursion relation for ancestors.

None of these is statable at the pins:

- Theorems 1–4 need the moduli space of stable pseudoholomorphic maps with its retained-arrow
  groupoid and its rational dual-Čech virtual functional. These are the targets of
  AnalyticStableMaps (Layers 1–9) and ImplicitAtlases (Layer 4). The pinned Tau Ceti has no
  compact nodal domain, no moduli space of stable maps and no implicit atlas; its
  `SmoothAlmostComplexStructure` accepts any smooth `J` with `J² = −1` on a native manifold,
  so what is missing is the nodal-domain and stable-map moduli carrier, not a smooth domain.
- Theorems 1–4 need the coarse moduli space of stable pointed curves `M̄_(g,n)` with the
  weighted rational pairing of its retained-arrow groupoid, the targets of ComplexCurveModuli
  D5–D8 and Orbifolds O5, which are not in the pinned Tau Ceti.
- Theorem 3 needs the period-controlled Novikov ring `Nov(ℚ, H, N)` of MorseNovikov N1 for an
  abelian group `H` with a homomorphism `N : H → ℝ`; the pinned Mathlib has `LaurentSeries`
  and `HahnSeries` over ordered groups, not this completion of a group ring by a real-valued
  period.
- Theorems 1, 2 and 4 need the rational Chern classes of a complex vector bundle and the
  first Chern class of a topological line bundle on a compact Hausdorff space, the targets of
  CharacteristicClasses C3, which are not in the pinned Tau Ceti.

The Chern grading `deg q^A = 2c₁(A)` and the finite-support grading of the uncompleted group
ring are README targets of Layer 0 with their Checks; they are not stated here as stand-ins
for the headlines above.
-/

namespace TauCetiRoadmap.GromovWittenTheory

-- No headline theorem is statable at the pins; see the module docstring and README.md.

end TauCetiRoadmap.GromovWittenTheory
