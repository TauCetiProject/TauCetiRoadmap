module

public import Mathlib
public import TauCeti.AlgebraicTopology.Singular.Relative
public import TauCeti.Geometry.Manifold.MFDeriv.FixedPoint

/-!
# Morse–Novikov homology and dynamical Reidemeister torsion: target signatures

The roadmap is README.md; this file is not the roadmap. It states, each with `sorry`, the
roadmap's headline theorems that are statable against the pinned Mathlib and Tau Ceti: the
nondegenerate Lefschetz fixed-point formula `lefschetz_fixed_point_formula` (README §6.5) and
the nondegenerate vector-field Poincaré–Hopf theorem `poincare_hopf` (README §7.3). Both are
universe-polymorphic in the manifold and its model and assume neither orientability,
connectedness nor second countability. Nondegeneracy of a fixed point is Tau Ceti's
`TauCeti.IsNondegenerateFixedPt`. The local signs `fixedPointDet`, `fixedPointSign`,
`zeroDet` and `zeroSign` are read through Mathlib's `mfderiv` and `LinearMap.det`; rational
singular homology is Tau Ceti's homology of the pair `(M, ∅)` with coefficient object
`ULift ℚ` in the universe of `M`, giving `rationalHomologyMap` and `rationalBetti`.

Several algebraic headlines are proved at the pinned Tau Ceti and are therefore not restated
here: Layer 1's completion `TauCeti.NovikovSeries`, its universal property
`TauCeti.NovikovSeries.completionPkg`, its functoriality `TauCeti.NovikovSeries.mapRingHom` and
its domain theorem `TauCeti.NovikovSeries.isDomain_of_fg`; Layer 4's based torsion
`HomologicalComplex.reidemeisterTorsion` with its basis-change law
`HomologicalComplex.reidemeisterTorsion_eq_mul_finprod_det_toMatrix`, its homology-basis form
`HomologicalComplex.reidemeisterTorsionWithHomology` and its componentwise form
`HomologicalComplex.componentwiseReidemeisterTorsion`; and Layer 5's integral product formula
`TauCeti.NovikovSeries.orbitZeta_eq_mapRingHom_eulerProduct` for the algebraic orbit zeta
function `TauCeti.NovikovSeries.orbitZeta`.

The remaining headlines are not statable at these pins. Layer 2's compactification and gluing
lack the cutoff trajectory spaces of a closed one-form on an abelian cover. Layer 3's comparison
of Novikov homology with completed cellular homology, its top-degree vanishing and Layer 4's
Novikov inequalities lack Novikov homology of a closed one-form: the pins have no complex built
from signed trajectory counts of a closed one-form on an abelian cover. Layer 5's flow zeta
function and cover-norm theorem lack the periodic-orbit data of a closed one-form: the deck
classes of the closed orbits of its negative dual flow and their return-map signs. Layer 6's
dynamical torsion invariance and its equality with cellular torsion lack both carriers, and the
mapping-torus formula for the flow zeta function lacks the periodic-orbit data. The cellular
torsion formulas for the mapping torus and the zero surgery lack a based cellular torsion of an
abelian cover of a finite CW complex: the pinned equivariant cellular chains
`TauCeti.cellularChainComplexRep` and the componentwise torsion
`HomologicalComplex.componentwiseReidemeisterTorsion` are not joined by a basis of lifted cells
and a scalar extension to the total quotient ring. The zero-surgery formula lacks, in addition,
the Alexander polynomial of a knot in the 3-sphere: the pinned `TauCeti.KnotTheory.alexander` is
defined on a Seifert matrix, and no pinned declaration produces a Seifert matrix from a smooth
knot `TauCeti.SmoothCircleEmbedding` (the pinned `TauCeti.BraidWord.seifertMatrix` is that of a
closed braid word). The continuous fixed-point-index form `Σ ind = L(f)` of §§5.2 and 6.4 lacks a
local fixed-point index of a continuous map. Layer 7's refined equality lacks both carriers of
Layer 6 and, in addition, the Euler-structure torsor. None is replaced by admitted data.
-/

@[expose] public section

noncomputable section
open CategoryTheory
open scoped Manifold ContDiff

namespace TauCetiRoadmap.MorseNovikov

universe u

/-! ## Layer 6 (§6.5): Lefschetz fixed-point formula -/

/-- The determinant of `1 − df_x`, with `df_x` read by `mfderiv` in the charts at `x` and
`f x`. At a fixed point these charts coincide, so this is the determinant of `1 − df_x` as an
endomorphism of `T_x M`; its sign is the Lefschetz sign of a nondegenerate fixed point
(Hutchings, Forum Math. 14 (2002), §1.1, p. 210). -/
def fixedPointDet {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] (f : M → M) (x : M) : ℝ :=
  LinearMap.det (Sub.sub (1 : E →L[ℝ] E) (mfderiv I I f x)).toLinearMap

/-- The sign `sgn det(1 − df_x)` of a fixed point: `1` when `fixedPointDet` is positive and
`-1` otherwise, so that at a nondegenerate fixed point it is the Lefschetz sign. -/
def fixedPointSign {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] (f : M → M) (x : M) : ℤ :=
  if 0 < fixedPointDet I f x then 1 else -1

/-- The map induced by a continuous self-map of `M` on the rational singular homology of the
pair `(M, ∅)`, with the coefficient object `ULift ℚ` in the universe of `M`. -/
def rationalHomologyMap {M : Type u} [TopologicalSpace M] (f : C(M, M)) (i : ℕ) :=
  (TopPair.singularHomologyMap (TopPair.incl.map (TopCat.ofHom f))
    (ModuleCat.of ℚ (ULift.{u} ℚ)) i).hom

/-- **Lefschetz fixed-point formula** (README §6.5). For a smooth self-map `f` of a compact
Hausdorff boundaryless manifold `M` all of whose fixed points are nondegenerate
(`TauCeti.IsNondegenerateFixedPt`: `1` is not an eigenvalue of `df_x`), the sum of the signs
`sgn det(1 − df_x)` over the fixed points equals the alternating sum of the traces of `f_*` on
the rational singular homology of `M` in degrees `0` to `dim M`. Neither orientability,
connectedness nor second countability is assumed. The fixed set is finite under these
hypotheses (`TauCeti.finite_fixedPoints_of_isNondegenerateFixedPt`), so the finite sum is the
actual signed count, and at each fixed point `det(1 − df_x) ≠ 0`. Hatcher, Algebraic Topology,
§2.C, Theorem 2C.3, p. 179, is the Lefschetz fixed-point theorem for retracts of finite
simplicial complexes, with the trace formula in its proof, p. 181; the index form `Σ ind = L(f)`
for compact Euclidean neighbourhood retracts is Dold, Lectures on Algebraic Topology,
Chapter VII, §6. Hutchings, Forum Math. 14 (2002), Example 1.9, pp. 215–216, takes the
Lefschetz theorem for the iterates of the monodromy as the content of its mapping-torus
formula. -/
theorem lefschetz_fixed_point_formula {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    [I.Boundaryless] {M : Type u} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [CompactSpace M] [T2Space M]
    (f : M → M) (hf : ContMDiff I I ∞ f)
    (hnd : ∀ x ∈ Function.fixedPoints f, TauCeti.IsNondegenerateFixedPt I f x) :
    ((∑ᶠ x ∈ Function.fixedPoints f, fixedPointSign I f x : ℤ) : ℚ) =
      ∑ i ∈ Finset.range (Module.finrank ℝ E + 1), (-1 : ℚ) ^ i *
        LinearMap.trace ℚ _ (rationalHomologyMap ⟨f, hf.continuous⟩ i) := by
  sorry

/-! ## Layer 7 (§7.3): Vector-field Poincaré–Hopf theorem -/

/-- The determinant of the vertical derivative of a vector field `v` at `p`: the derivative of
the section `x ↦ (x, v x)` of the tangent bundle at `p`, read in the tangent-bundle chart at
`(p, v p)` and projected to the fiber. At a zero `p` of `v` this is the determinant of the
linearisation `dv_p` on `T_p M`, which does not depend on the chart because at a zero the
linearisation transforms by conjugation under a change of chart (README §7.3). -/
def zeroDet {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    (v : (x : M) → TangentSpace I x) (p : M) : ℝ :=
  LinearMap.det ((ContinuousLinearMap.snd ℝ E E).comp
    (mfderiv I I.tangent (fun x ↦ (v x : TangentBundle I M)) p)).toLinearMap

/-- The local index of a zero of a vector field: `1` when `zeroDet` is positive and `-1`
otherwise, so that at a nondegenerate zero it is `sgn det(dv_p)`, the Poincaré–Hopf index
(Milnor, Topology from the Differentiable Viewpoint, §6: the index of a nondegenerate zero is
`+1` or `−1` according to the sign of the determinant of its derivative). -/
def zeroSign {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    (v : (x : M) → TangentSpace I x) (p : M) : ℤ :=
  if 0 < zeroDet I v p then 1 else -1

/-- The rational Betti number of `M` in degree `i`: the dimension over `ℚ` of the singular
homology of the pair `(M, ∅)` with coefficients in `ULift ℚ`. -/
def rationalBetti (M : Type u) [TopologicalSpace M] (i : ℕ) : ℕ :=
  Module.finrank ℚ (((TopPair.incl.obj (TopCat.of M)).singularHomology
    (ModuleCat.of ℚ (ULift.{u} ℚ)) i : ModuleCat ℚ))

/-- **Poincaré–Hopf theorem** (README §7.3). For a smooth vector field `v` on a compact
Hausdorff boundaryless manifold `M`, orientable or not, all of whose zeros are nondegenerate,
the sum of the local indices `sgn det(dv_p)` over the zeros equals the Euler characteristic of
`M`, the alternating sum of the rational Betti numbers in degrees `0` to `dim M`. The zero set
is finite under these hypotheses (a nondegenerate zero is isolated), so the finite sum is the
actual signed count. No connectedness, second-countability or `χ(M) = 0` hypothesis enters. -/
theorem poincare_hopf {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    [I.Boundaryless] {M : Type u} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [CompactSpace M] [T2Space M]
    (v : (x : M) → TangentSpace I x)
    (hv : ContMDiff I I.tangent ∞ (fun x ↦ (v x : TangentBundle I M)))
    (hnd : ∀ p, v p = 0 → zeroDet I v p ≠ 0) :
    ((∑ᶠ p ∈ {p | v p = 0}, zeroSign I v p : ℤ) : ℚ) =
      ∑ i ∈ Finset.range (Module.finrank ℝ E + 1), (-1 : ℚ) ^ i * (rationalBetti M i : ℚ) := by
  sorry

end TauCetiRoadmap.MorseNovikov
