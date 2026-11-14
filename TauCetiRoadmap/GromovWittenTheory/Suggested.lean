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
   Novikov-completed classes form a unital cohomological field theory over the Novikov ring
   `Λ_ω = TauCeti.NovikovSeries ℚ H₂(X; ℤ) ω`, and the quantum product `⋆` is associative,
   graded commutative and unital with the cup product as its `A = 0` term.
4. **Descendants** (§8.4–§8.6): the string, dilaton and divisor equations and the genus-zero
   topological recursion relation for ancestors.

None of these is statable at the pins:

- Theorems 1–4 need the moduli space of stable pseudoholomorphic maps with its retained-arrow
  groupoid and its rational dual-Čech virtual functional. These are the targets of
  AnalyticStableMaps (Layers 1–9) and ImplicitAtlases (Layer 4). The pinned Tau Ceti has the
  compact nodal domain as the gluing quotient `GluedCurve` of `FlagPairData`, and its
  `SmoothAlmostComplexStructure` accepts any smooth `J` with `J² = −1` on a native manifold,
  but it has no moduli space of stable pseudoholomorphic maps and no implicit atlas; what is
  missing is the stable-map moduli carrier, not the domain or the target.
- Theorems 1–4 need the cup product on Tau Ceti's Čech cohomology
  `TauCeti.Topology.cechCohomology`, by which the operations multiply the pulled-back test and
  insertion classes on the coarse stable-map space (README §0.4); the pinned Tau Ceti has the
  Čech groups and the pullback maps of fixed-family Čech complexes but no product on them.
- Theorems 1–4 need the coarse moduli space of stable pointed curves `M̄_(g,n)` with the
  weighted rational pairing of its retained-arrow groupoid, the targets of ComplexCurveModuli
  D5–D8 and Orbifolds O5, which are not in the pinned Tau Ceti.
- Theorem 3 also needs the Novikov ring, which the pinned Tau Ceti has as
  `TauCeti.NovikovSeries ℚ H N` with its grading `TauCeti.NovikovSeries.gradeBy`, and the
  completed state module of §0.2, which it has in basis coordinates as the completed module
  `TauCeti.NovikovModule` with its homogeneous pieces `TauCeti.NovikovModule.gradeBy`; what it
  lacks are the Gromov–Witten classes of the first item.
- Theorems 1, 2 and 4 need the rational Chern classes of a complex vector bundle and the
  first Chern class of a topological line bundle on a compact Hausdorff space, the targets of
  CharacteristicClasses C3, which are not in the pinned Tau Ceti.

The Novikov grading `deg q^A = 2c₁(A)` is Tau Ceti's `TauCeti.NovikovSeries.gradeBy` for the
degree map `2c₁`, whose first Chern class `c₁(TX, J)` is a CharacteristicClasses C3 carrier
missing at the pin, as in the last item. The completed state module is Tau Ceti's
`TauCeti.NovikovModule` in the coordinates of a homogeneous basis; its basis-free description, the
independence and closedness of the pieces `TauCeti.NovikovModule.gradeBy` over every ring for
every potential and degree function, and the convergent decomposition of each element of the state
module into homogeneous components are README targets of Layer 0 with their Checks, and nothing is
stated here as a stand-in for the headlines above.
-/

namespace TauCetiRoadmap.GromovWittenTheory

-- No headline theorem is statable at the pins; see the module docstring and README.md.

end TauCetiRoadmap.GromovWittenTheory
