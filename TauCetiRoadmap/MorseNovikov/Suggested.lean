module

public import Mathlib
public import TauCeti.AlgebraicTopology.Singular.Relative

/-!
# Morse–Novikov homology and dynamical Reidemeister torsion: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
simple definitions needed to state them.

The headline theorems of the roadmap are:

* Hutchings' Theorem B (README §6.1): for an admissible pair `(α, g)` on a closed connected
  manifold `X` with `χ(X) = 0` and a connected regular abelian cover `X̃` on which `α` is exact,
  the torsion of the Novikov complex times the dynamical zeta function equals the cellular
  Reidemeister torsion of `X̃` in `Q(Nov(ℤ,H,N))/±e^H`, and Theorem A, the invariance of that
  product in the cohomology class. Not statable at the pins: the Novikov ring `Nov(R,H,N)`
  with its convolution (README §1.1), based torsion over total quotient rings (§4.6), the
  Novikov complex of a closed one-form (§3.1) and the zeta function (§5.4) have no carrier in
  the pinned libraries, and the smooth-form, flow and metric-dual carriers they are built on
  are targets of `TauCetiRoadmap.DifferentialGeometry`, not pinned declarations.
* The Novikov isomorphism (§3.3), the Novikov inequalities and the top-degree vanishing (§3.5):
  not statable, the Novikov complex and the completed cellular complex are missing.
* Integrality and the product formula of the dynamical zeta function (§5.4): not statable, the
  zeta function and the Novikov ring are missing.
* The vector-field Poincaré–Hopf theorem (§7.1): not statable, the index of a zero of a vector
  field (the vertical derivative of the section at a zero) has no pinned carrier, and a
  chart-level encoding would be an ad hoc stand-in.
* The circle, mapping-torus and zero-surgery calculations (§§6.6, 6.7, 6.9): not statable, they
  are values of the torsions and zeta functions above.
* The Lefschetz fixed-point formula for a smooth self-map of a closed manifold with
  nondegenerate fixed points (§6.7): statable, and stated below as
  `lefschetz_fixed_point_formula`, using Mathlib's `mfderiv` and `LinearMap.det` for the local
  signs and Tau Ceti's relative singular homology on `TopPair` for the traces.
-/

@[expose] public section

noncomputable section

open CategoryTheory
open scoped Manifold ContDiff

namespace TauCetiRoadmap.MorseNovikov

universe u

/-! ## Layer 6: dynamical torsion, bifurcations and geometric calculations -/

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  {M : Type u} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [I.Boundaryless] [CompactSpace M] [T2Space M]

/-- The determinant of `1 − df_x`, read in the chart at `x`. At a fixed point `x` of `f` the
charts at `x` and at `f x` coincide, so this is the determinant of `1 − df_x` as an
endomorphism of the tangent space `T_x M`; its sign is the Lefschetz sign of a nondegenerate
fixed point (Hutchings, Forum Math. 14 (2002), §1.1, p. 210). -/
def fixedPointDet (f : M → M) (x : M) : ℝ :=
  LinearMap.det (Sub.sub (1 : E →L[ℝ] E) (mfderiv I I f x)).toLinearMap

/-- The sign `sgn det(1 − df_x)` of a fixed point: `1` when the determinant is positive and
`-1` otherwise, so that at a nondegenerate fixed point it is the Lefschetz sign. -/
def fixedPointSign (f : M → M) (x : M) : ℤ :=
  if 0 < fixedPointDet I f x then 1 else -1

/-- The map induced by a continuous self-map of `M` on the rational singular homology of the
pair `(M, ∅)`, with the coefficient object `ULift ℚ` in the universe of `M`. -/
def rationalHomologyMap (f : C(M, M)) (i : ℕ) :=
  (TopPair.singularHomologyMap (TopPair.incl.map (TopCat.ofHom f))
    (ModuleCat.of ℚ (ULift.{u} ℚ)) i).hom

/-- **Lefschetz fixed-point formula** (README §6.7). For a smooth self-map `f` of a compact
Hausdorff boundaryless manifold `M` all of whose fixed points are nondegenerate, the sum of the
signs `sgn det(1 − df_x)` over the fixed points equals the alternating sum of the traces of
`f_*` on the rational singular homology of `M` in degrees `0` to `dim M`. The fixed set is
finite under these hypotheses, so the finite sum is the actual signed count (Hutchings, Forum
Math. 14 (2002), Example 1.9, p. 215, where the Lefschetz theorem for the iterates of the
monodromy is the mapping-torus case of Theorem B). -/
theorem lefschetz_fixed_point_formula (f : M → M) (hf : ContMDiff I I ∞ f)
    (hnd : ∀ x ∈ Function.fixedPoints f, fixedPointDet I f x ≠ 0) :
    ((∑ᶠ x ∈ Function.fixedPoints f, fixedPointSign I f x : ℤ) : ℚ) =
      ∑ i ∈ Finset.range (Module.finrank ℝ E + 1), (-1 : ℚ) ^ i *
        LinearMap.trace ℚ _ (rationalHomologyMap ⟨f, hf.continuous⟩ i) := by
  sorry

end TauCetiRoadmap.MorseNovikov
