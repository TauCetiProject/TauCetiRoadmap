module

public import Mathlib
public import TauCeti.Geometry.Symplectic.Cotangent.Bundle.Liouville

/-!
# Cotangent bundles and Lagrangian geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, with only the simple definitions those
statements need. At these pins it states no theorem: the headline theorems listed first are
proved by the pinned Tau Ceti, so the README cites them by name instead of restating them, and
those listed second are not statable.

Proved at the pins, and therefore not restated:

* C1: the Liouville form of `T*M`, `TauCeti.CotangentBundle.liouvilleForm`, with its chart
  formula `Σ pᵢ dqᵢ` (`TauCeti.CotangentBundle.inChartAt_liouvilleForm`) and its tautological
  property (`TauCeti.CotangentBundle.mpullback_liouvilleForm`); the canonical symplectic form
  `TauCeti.CotangentBundle.symplecticForm`, with the identity `ω = −dλ`
  (`TauCeti.CotangentBundle.symplecticForm_eq_neg_mextDeriv`), its expression
  `TauCeti.strongDualCotangentSymplecticForm` in every cotangent chart
  (`TauCeti.CotangentBundle.inChartAt_symplecticForm_apply`) and its symplecticity
  (`TauCeti.CotangentBundle.isSymplectic_symplecticForm`);
* C2: the Lagrangian embedding predicate
  `TauCeti.SmoothTwoForm.IsNondegenerate.IsLagrangianEmbedding`;
* C2.1: the realification `Matrix.realify`; `U(n)` is maximal compact in `GL(n, ℂ)`
  (`Matrix.GeneralLinearGroup.isCompact_unitarySubgroup`,
  `Matrix.GeneralLinearGroup.eq_unitarySubgroup_of_isCompact_of_le`); the realified `U(n)` is
  maximal compact in `Sp(2n, ℝ)` (`TauCeti.GLSymplectic.eq_inf_unitarySubgroup_of_isCompact_of_le`
  with `Matrix.GeneralLinearGroup.range_realify_comp_toUnits`); `GL(n, ℂ)` and `Sp(2n, ℝ)` are
  path connected (`TauCeti.instPathConnectedSpaceMatrixGeneralLinearGroup`,
  `Matrix.isPathConnected_symplecticGroup`);
* C4, the linear step: symplectic Witt extension for arbitrary subspaces of equal-dimensional
  symplectic vector spaces, `TauCeti.SymplecticForm.exists_isSymplectomorphism_extend_linearEquiv`.

Not statable at the pins, and therefore absent:

* the C3 generating-function symplectomorphisms, the C3.1 chain dictionary and the convex
  billiard map: there is no carrier for a symplectomorphism between open cotangent domains;
* the C4 relative Moser and neighborhood-germ theorems: there is no carrier for a
  symplectomorphism germ along a submanifold or for a symplectic bundle isomorphism over an
  embedding.

The three abbreviations below name the pinned cotangent bundle, its model with corners and its
canonical symplectic form; HamiltonianReduction R1 states its cotangent momentum theorem against
these names.
-/
noncomputable section
@[expose] public section
open scoped Manifold ContDiff
namespace TauCetiRoadmap.SymplecticGeometry
variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-! ## C1: Intrinsic cotangent phase space -/

/-- The cotangent bundle `T*M`: the pinned `TauCeti.CotangentBundle`, Mathlib's total space of
the bundle whose fibre at `x` is the space of continuous linear functionals on
`TangentSpace I x`. -/
abbrev Cotangent (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [ChartedSpace H M] := TauCeti.CotangentBundle I M

/-- The model with corners of `T*M`: the base model times the dual of the base model space. -/
abbrev cotangentModel := I.prod 𝓘(ℝ, E →L[ℝ] ℝ)

/-- The canonical symplectic form `ω = −dλ` of `T*M`: the pinned
`TauCeti.CotangentBundle.symplecticForm`, whose expression in every cotangent chart is
`TauCeti.strongDualCotangentSymplecticForm`, that is `Σ dqᵢ ∧ dpᵢ` (Cannas da Silva,
§§2.2–2.3). -/
abbrev canonicalForm : TauCeti.SmoothTwoForm (cotangentModel I) (Cotangent I M) :=
  TauCeti.CotangentBundle.symplecticForm I M

end TauCetiRoadmap.SymplecticGeometry
