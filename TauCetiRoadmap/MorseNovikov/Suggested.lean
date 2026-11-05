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
* The circle, mapping-torus and zero-surgery calculations (§§6.6, 6.7, 6.9): not statable, they
  are values of the torsions and zeta functions above.
* The Lefschetz fixed-point formula for a smooth self-map of a closed manifold with
  nondegenerate fixed points (§6.7): statable, and stated below as
  `lefschetz_fixed_point_formula`, using Mathlib's `mfderiv` and `LinearMap.det` for the local
  signs and Tau Ceti's relative singular homology on `TopPair` for the traces.
* The vector-field Poincaré–Hopf theorem (§7.1): statable, and stated below as
  `poincare_hopf`, with the local index of a nondegenerate zero read through Mathlib's
  derivative of the vector field as a section of the tangent bundle (`mfderiv I I.tangent`),
  projected to the fibre, and the Euler characteristic as the alternating sum of the ranks of
  Tau Ceti's rational singular homology.
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
finite under these hypotheses, so the finite sum is the actual signed count. The simplicial
Lefschetz theorem and the Hopf trace formula are Hatcher, Algebraic Topology, §2.C,
Theorem 2C.3, p. 179, and the trace formula in its proof, p. 181; Hutchings, Forum Math. 14
(2002), Example 1.9, p. 215, uses the Lefschetz theorem for the iterates of the monodromy as
the content of its mapping-torus formula. -/
theorem lefschetz_fixed_point_formula (f : M → M) (hf : ContMDiff I I ∞ f)
    (hnd : ∀ x ∈ Function.fixedPoints f, fixedPointDet I f x ≠ 0) :
    ((∑ᶠ x ∈ Function.fixedPoints f, fixedPointSign I f x : ℤ) : ℚ) =
      ∑ i ∈ Finset.range (Module.finrank ℝ E + 1), (-1 : ℚ) ^ i *
        LinearMap.trace ℚ _ (rationalHomologyMap ⟨f, hf.continuous⟩ i) := by
  sorry

/-! ## Layer 7: Euler structures and coherent lift normalization -/

/-- The determinant of the vertical derivative of a vector field `v` at `p`: the derivative of
the section `x ↦ (x, v x)` of the tangent bundle at `p`, read in the tangent-bundle chart at
`(p, v p)`, whose second component is the derivative of `v` in the chart at `p`, projected to
the fibre. At a zero `p` of `v` this is the determinant of the linearisation `dv_p` of `v` on
`T_p M`, which does not depend on the chart because at a zero the linearisation transforms by
conjugation under a change of chart (README §7.1). -/
def zeroDet (v : (x : M) → TangentSpace I x) (p : M) : ℝ :=
  LinearMap.det ((ContinuousLinearMap.snd ℝ E E).comp
    (mfderiv I I.tangent (fun x ↦ (v x : TangentBundle I M)) p)).toLinearMap

/-- The local index of a zero of a vector field: `1` when `zeroDet` is positive and `-1`
otherwise, so that at a nondegenerate zero it is `sgn det(dv_p)`, the Poincaré–Hopf index
(Hutchings, Forum Math. 14 (2002), Appendix B, p. 241, the sign of a nondegenerate zero). -/
def zeroSign (v : (x : M) → TangentSpace I x) (p : M) : ℤ :=
  if 0 < zeroDet I v p then 1 else -1

variable (M) in
/-- The rational Betti number of `M` in degree `i`: the dimension over `ℚ` of the singular
homology of the pair `(M, ∅)` with coefficients in `ULift ℚ`. -/
def rationalBetti (i : ℕ) : ℕ :=
  Module.finrank ℚ (((TopPair.incl.obj (TopCat.of M)).singularHomology
    (ModuleCat.of ℚ (ULift.{u} ℚ)) i : ModuleCat ℚ))

/-- **Poincaré–Hopf theorem** (README §7.1). For a smooth vector field `v` on a compact
Hausdorff boundaryless manifold `M`, orientable or not, all of whose zeros are nondegenerate,
the sum of the local indices `sgn det(dv_p)` over the zeros equals the Euler characteristic of
`M`, the alternating sum of the rational Betti numbers in degrees `0` to `dim M`. The zero set
is finite under these hypotheses (a nondegenerate zero is isolated), so the finite sum is the
actual signed count. No hypothesis `χ(M) = 0` enters. -/
theorem poincare_hopf (v : (x : M) → TangentSpace I x)
    (hv : ContMDiff I I.tangent ∞ (fun x ↦ (v x : TangentBundle I M)))
    (hnd : ∀ p, v p = 0 → zeroDet I v p ≠ 0) :
    ((∑ᶠ p ∈ {p | v p = 0}, zeroSign I v p : ℤ) : ℚ) =
      ∑ i ∈ Finset.range (Module.finrank ℝ E + 1), (-1 : ℚ) ^ i * (rationalBetti M i : ℚ) := by
  sorry

end TauCetiRoadmap.MorseNovikov
