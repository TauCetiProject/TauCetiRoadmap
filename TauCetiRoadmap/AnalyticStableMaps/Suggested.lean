import Mathlib

/-!
# Analytic stable maps and their implicit atlases: target signatures

**This file is not the roadmap.** The definitive document is `README.md`. This file states
the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`,
and names the ones that are not statable at the pins together with the carrier each lacks.

The headline theorems are:

1. **Normalization** (§0.5): a nonconstant pseudoholomorphic map from a connected compact
   Riemann surface to an almost complex manifold factors as a simple pseudoholomorphic map
   composed with a finite holomorphic branched cover, uniquely up to biholomorphism, with
   `u_*[Σ] = d · v_*[Σ₀]` and `2 − 2g(Σ) = d(2 − 2g(Σ₀)) − R`.
2. **Stability** (§1.2): the automorphism group of a prestable map is finite exactly when
   every constant component is pointed stable.
3. **Generic regularity** (§2.9): for a residual set of smooth tame (or compatible) almost
   complex structures on a closed symplectic manifold, the unmarked smooth-simple moduli
   space of a fixed genus and class is a smooth oriented manifold of signed dimension
   `(m − 3)(2 − 2g) + 2⟨c₁, β⟩`.
4. **Compactness** (§3.7): for fixed `(g, n, β)` and a compact family of tame structures the
   coarse space of stable maps is compact Hausdorff with proper projection to the parameter
   space.
5. **Topological regularity** (§7.3): the regular locus of a thickened moduli space is open,
   a topological manifold of dimension `v + dim E`, and a topological submersion to the
   obstruction quotient (Pardon, Theorem B.1.1).
6. **The implicit atlas** (§9.1–§9.2): the thickening data form an oriented implicit atlas on
   the compact coarse space, giving the rational dual-Čech functional.

None of these is statable at the pins:

- Theorems 1–4 need a compact Riemann surface as the domain of a pseudoholomorphic map.
  The pinned `TauCeti.SmoothAlmostComplexStructure` has only the constant, negated and
  product constructors, so no complex one-manifold (not even `OnePoint ℂ`) carries an almost
  complex structure at the pin, and the pinned `IsPseudoholomorphic` cannot be applied to a
  map out of one.
- Theorems 2, 4, 5 and 6 need nodal curves and prestable families, which are
  ComplexCurveModuli's targets and are not in the pinned Tau Ceti.
- Theorems 3 and 5 need bundle-valued Sobolev spaces `W^{k,p}(Σ, u^*TX)`; the pinned
  `TauCeti.Wkp` is scalar and real-valued on open subsets of a Euclidean space.
- Theorem 5 and the arbitrary-target branch (§2.18–§2.22) need product almost complex
  structures on products of manifolds and weighted Sobolev spaces on punctured surfaces,
  neither of which is at the pin.
- Theorem 6 needs the implicit-atlas structure of ImplicitAtlases, a roadmap still in a
  pull request.

The node-matching subspace of §2.2 and the virtual dimension of §0.1 are README targets
with their Checks; they are not stated here as stand-ins for the headlines above.
-/

namespace TauCetiRoadmap.AnalyticStableMaps

-- No headline theorem is statable at the pins; see the module docstring and README.md.

end TauCetiRoadmap.AnalyticStableMaps
