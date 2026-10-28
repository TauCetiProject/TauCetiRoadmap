# Native completion checks: AnalyticToricGeometry

This is a compiled acceptance check for the full-cone complex point, including the full line, and the two scheme-action comparison declarations in the [definitive README](README.md).
It uses the implemented Tau Ceti APIs directly and contains no admitted targets.

The block below was extracted verbatim to a Lean file and checked with
`lake env lean -DwarningAsError=true` at Tau Ceti
[`095e3aad63f6cb551d582b3e8e5b4da46cc872fe`](https://github.com/TauCetiProject/TauCeti/commit/095e3aad63f6cb551d582b3e8e5b4da46cc872fe),
with Lean 4.36.0-rc1 and Mathlib `2cabef97`. The axiom reports contain only
`propext`, `Classical.choice`, and `Quot.sound`.

This evidence is separate from the roadmap repository's historical Tau Ceti `a91d3aa` /
Lean 4.35.0-rc3 pin and from the target prototypes retained in `Suggested.lean`.

```lean
import TauCeti.Geometry.Toric.Analytic.Fan.Comparison.TorusAction

open Multiplicative
open TauCeti.Toric

namespace TauCetiRoadmap.AnalyticToricGeometry.NativeCompletion

/-- The dual semigroup of a full linear cone yields exactly one affine complex point.
This includes the full-line acceptance example. -/
noncomputable instance fullConePointUnique
    {N V : Type*} [AddCommGroup N] [AddCommGroup V] [Module ℝ V]
    {i : N →+ V} (hi : IsIntegralLattice i) :
    Unique (AffineSemigroupComplexPoint (dualSemigroup hi (⊤ : PointedCone ℝ V))) where
  default := default
  uniq x := by
    apply AffineSemigroupComplexPoint.ext
    intro s
    rw [Subsingleton.elim s 0, ofAdd_zero]
    simp only [← MonoidAlgebra.one_def, map_one]

#print axioms fullConePointUnique
#print axioms spec_map_smul_eq_lift_comp_affineToricSchemeAction
#print axioms Fan.AlgebraicComplexPoint.coe_smul

end TauCetiRoadmap.AnalyticToricGeometry.NativeCompletion
```
