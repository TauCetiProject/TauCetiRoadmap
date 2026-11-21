import Mathlib

/-!
# The seesaw for theta chains: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about automorphic forms on unitary groups of Hermitian spaces over a
CM extension `E/F` of number fields: the groups `U(V)(𝔸_F)` of adelic points and their rational
quotients `[U(V)]`, the Weil representation and the theta functional of a unitary dual pair
(MetaplecticAutomorphicForms §§3.3, 5.6; ThetaKernelsForUnitaryDualPairs §4.4a), theta lifts, and
Bessel and Fourier–Jacobi periods (GanGrossPrasadUnitaryGroups §§1.2, 4.1). Neither Mathlib nor
Tau Ceti has these carriers at the pins. Mathlib has the adele ring `NumberField.AdeleRing`, CM
fields (`NumberField.IsCMField`), the unitary group `Matrix.unitaryGroup` of matrices over a star
ring and Schwartz functions on real vector spaces (`SchwartzMap`), but no unitary group of a
Hermitian space over a number field as an algebraic group with its adelic points, no Haar measure
on its rational quotient, no automorphic forms on it, no Schwartz–Bruhat functions on adelic
vector spaces, no Weil representation and no theta series.

* The unfolding of Bessel periods of theta lifts (6.2a–6.2d, 6.2): for Hermitian spaces
  `V = V_A ⊥ ⟨ζ⟩ ⊕ ℍ^ρ` and `W = W₀ ⊕ ℍ^ρ` with `U(V_A)`, `U(W₀)` anisotropic and Weil data with
  the same splitting characters, the Bessel period of the theta lift of a rapidly decreasing form
  on `[U(W)]` against a continuous automorphic form on `U(V_A)` is an integral over
  `R_J(𝔸)\U(W)(𝔸)` of Fourier–Jacobi periods, and a Fourier–Jacobi period of a theta lift is an
  integral of Bessel periods one hyperbolic plane down. It lacks the adelic unitary groups with
  their Haar measures, automorphic forms and rapid decay on them, the Weil representation and
  theta functional of a unitary pair, the mixed models, and the Bessel and Fourier–Jacobi periods.
* The seesaw identity (6.14): for `m ≥ 4` even, the data of the chain with the gap size `SizeGap`
  of the row gap and the hypotheses of the row steps, and Bessel–Poincaré series `P_u` nonzero on
  the new forms `M_u` for every word `u`, the top period kills the kernel of the descent,
  factors through the descent for every twisting tuple up to a root of unity, and equals
  `a_u·⟨V x, P_u(U_u φ)⟩` with
  `a_u ≠ 0`. It lacks, besides these, the data of the chain (ThetaChainsOnDefiniteUnitaryGroups
  Layers 2–3: definite unitary groups of the column spaces, levels at the bad places, twisting
  tuples, the step operators, the source lattices and the top period), the rows of the row tower
  and the descent with its section (RowTowerAndRallisIdentities §§5.3–5.6) and the Bessel–Poincaré
  series (BesselPoincareSeriesAndGramBounds §5.14), all spaces of automorphic forms on unitary
  groups.
* The rationality of the period pairing (6.15): under the hypotheses of the rational structure of
  the grid and of 6.14, the pairing takes values in `σ₀(𝕃)` on rational vectors, and either it
  vanishes or every seesaw ratio is a root of unity of the coefficient field `𝕃`. It lacks the
  rational structures of the spaces of forms of the chain and of the rows
  (ThetaChainsOnDefiniteUnitaryGroups §3.1, RowTowerAndRallisIdentities §5.8), besides the
  carriers of 6.14.

No specialisation of these statements is stated: the local laws 6.4–6.7 are statements about the
Weil representations of unitary pairs over local fields and their lattice models, which the pins
lack as well, and the finite computations in their Checks (the counts of pairs at the level prime
in 6.6, the index of a parahoric in 6.12) are instances, not headlines.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.SeesawForThetaChains

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.SeesawForThetaChains
