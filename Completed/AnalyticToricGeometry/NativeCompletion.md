# Native completion checks: AnalyticToricGeometry

This is a compiled acceptance check for the full-cone complex point, including the full line, and the two scheme-action comparison declarations in the [definitive README](README.md).
It uses the implemented Tau Ceti APIs directly and contains no admitted targets.

The block below was extracted verbatim to a Lean file and checked with
`lake env lean -DwarningAsError=true` at Tau Ceti
[`1c14e0ea516a73fe31c89c429c63b2f0bd51cee8`](https://github.com/TauCetiProject/TauCeti/commit/1c14e0ea516a73fe31c89c429c63b2f0bd51cee8),
with Lean 4.36.0-rc1 and Mathlib `2cabef97`. The axiom reports contain only
`propext`, `Classical.choice`, and `Quot.sound`.

This evidence is separate from the roadmap repository's historical Tau Ceti `a91d3aa` /
Lean 4.35.0-rc3 pin and from the target prototypes retained in `Suggested.lean`.

```lean
import TauCeti.Geometry.Toric.Analytic.Fan.Comparison.TorusAction
import TauCeti.Geometry.Toric.Algebraic.Fan.TorusAction.Action

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

/-- The internal action has exactly the underlying scheme morphism used by the comparison. -/
example {N : Type} {V : Type*} [AddCommGroup N] [AddCommGroup V] [Module ℝ V]
    {i : N →+ V} (Φ : Fan i) :
    (Fan.algebraicRealizationModObj Φ).smul.left = Φ.algebraicRealizationAction := by
  rw [Fan.algebraicRealizationModObj_smul, Fan.algebraicRealizationActionOver_left]

#print axioms fullConePointUnique
#print axioms specMap_smul_eq_lift_comp_affineToricSchemeAction
#print axioms Fan.AlgebraicComplexPoint.coe_smul
#check Fan.algebraicRealizationModObj_smul
#check Fan.algebraicRealizationActionOver_left

end TauCetiRoadmap.AnalyticToricGeometry.NativeCompletion
```
