# Native completion checks: AnalyticToricGeometry

The final source audit on 2026-10-30 verified the complete roadmap against normal-merged
Tau Ceti [`daa66339a578`](https://github.com/TauCetiProject/TauCeti/commit/daa66339a578b8c1c41c20b94839ca25444cc1e8).
The [combined closeout audit](../CloseoutAudit-20261030.md) records the 934-root build
(24,174 Lake jobs), sixteen successful warning-as-error acceptance probes and 128 axiom
reports, all using only `propext`, `Classical.choice` and `Quot.sound`. The source and nine
dependency pins remained unchanged. The earlier results below retain their original revisions.

This is a compiled acceptance check for the full-cone complex point, including the full line, and the two scheme-action comparison declarations in the [definitive README](README.md).
It uses the implemented Tau Ceti APIs directly and contains no admitted targets.

The block below was extracted verbatim and checked with
`lake env lean -DwarningAsError=true` on actual upstream Tau Ceti
[`302238ea98ea621d689041f67e935f0b4eb1285e`](https://github.com/TauCetiProject/TauCeti/commit/302238ea98ea621d689041f67e935f0b4eb1285e),
with Lean 4.36.0-rc1 and Mathlib `2cabef97`. Both source files of
[PR #22017](https://github.com/TauCetiProject/TauCeti/pull/22017) are byte-identical to their
reviewed head `1c14e0ea516a`. All 143 modules under `TauCeti/Geometry/Toric/` built on that
merged revision (8,063 Lake jobs). A separate broad API replay checked 17 declarations and nine
axiom reports; the block below adds three axiom reports. Every report contains only `propext`,
`Classical.choice`, and `Quot.sound`.

This evidence is separate from the roadmap repository's historical Tau Ceti `358314d4ab97` /
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
