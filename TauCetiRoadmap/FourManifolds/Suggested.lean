import Mathlib
import TauCeti.Geometry.Manifold.LocallyFlat.Annulus
import TauCeti.KnotTheory.Slice.Freedman

/-!
# Four-dimensional manifolds, intersection forms and elliptic examples: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the
pinned Mathlib and Tau Ceti, those headline statements of the roadmap that are
statable there: the two end theorems of Layer 3 on their pinned carriers, namely
the dimension-four annulus theorem `TauCeti.AnnulusConjecture 3` and Freedman's
theorem `TauCeti.FreedmanSliceTheorem` that a knot whose knot group has perfect
commutator subgroup, equivalently with Alexander polynomial one, is topologically
slice; the smoothness of the explicit projective models (the
elliptic quartic K3 surface and the Enriques K3 cover) on their punctured affine
cones, and the absence of fixed points of the Enriques involution on its
projective common zero set; and the existence of a smooth manifold homeomorphic
but not diffeomorphic to Euclidean four-space.

Not statable at the pins, and therefore not stated here:
* Freedman's classification of closed simply connected topological four-manifolds
  and the homotopy classification by intersection forms: the missing inputs are
  the manifold fundamental class and its intersection pairing, and the
  Kirby–Siebenmann invariant. The singular cup product alone does not supply
  these manifold constructions.
* Donaldson's theorem that a definite intersection form of a closed simply
  connected smooth oriented four-manifold is diagonal: it needs the same intersection
  form, as a manifold invariant; the ASD moduli space is proof machinery, not
  an additional carrier needed in that theorem statement.
* Rokhlin's theorem `16 ∣ σ(M)` for closed smooth Spin four-manifolds: there is no
  Spin structure on a manifold and no signature of a manifold.
* The degree-two Pontryagin square `H²(−;ℤ/2) → H⁴(−;ℤ/4)`: it is a construction
  on cochains (cup-one products) that the pinned libraries lack, so it is a README
  target rather than a declaration here.
* The diffeomorphism `E(2) ≅ K3`, the elliptic-surface classification and the
  Enriques quotient geometry: the projective zero sets are statable, but their
  induced smooth atlases, elliptic fibrations and fiber sums are not supplied.
* All-base ASD compactification and obstruction gluing: the Sobolev connection
  quotient, deformation complex and Uhlenbeck compactification are missing.
* Spinᶜ existence and the four-dimensional bundle classifications: the frame
  lifts, determinant bundles and characteristic-class Postnikov maps are missing.
* The disk-embedding theorem with geometric duals, controlled disk embedding,
  controlled five-dimensional product theorem and dimension-four normal surgery:
  the framed generic-immersion, grope, control and normal-map carriers are missing.
* The general presentation-realization theorem: the native fundamental group exists,
  as does `PresentedGroup`, but the oriented manifold structure and its
  comparison with the boundary orientation are not supplied.
* Nonrecognition of a fixed connected sum of copies of S² × S²: the finite
  manifold-triangulation input type, its realization and the connected-sum
  comparison are missing.
The detailed Casson-handle realization of the exotic four-space requires
additional carriers; the existence headline itself needs only native manifolds.
-/

namespace TauCetiRoadmap.FourManifolds

open scoped Manifold ContDiff

noncomputable section

/-! ## Layer 3: Topological surgery, realization and classification -/

/-- The four-dimensional annulus theorem (Quinn): two locally flat three-spheres in
`ℝ⁴`, the second inside the open region bounded by the first, cobound a closed region
that is the image of an embedding of `S³ × [0, 1]` with the two spheres as its ends.
This is the pinned statement `TauCeti.AnnulusConjecture 3`; the README proves it in
§3.6 from the controlled five-dimensional product theorem (Freedman–Quinn, §7.8). -/
theorem annulusTheorem_four : TauCeti.AnnulusConjecture 3 := by
  sorry

/-- Freedman's theorem: a smooth knot in the unit three-sphere whose knot group has perfect
commutator subgroup, equivalently whose Alexander polynomial is one, bounds a locally flat
disc in the closed unit four-ball. This is the pinned statement
`TauCeti.FreedmanSliceTheorem`; the README proves it in §3.6 by the normal filling of the
zero surgery, `ℤ[ℤ]`-homology surgery and the marked contractible ball theorem
(Freedman–Quinn, Theorem 11.7B). -/
theorem freedmanSliceTheorem : TauCeti.FreedmanSliceTheorem := by
  sorry

/-! ## Layer 7: Elliptic surfaces, K3 and boundary Spin data -/

/-- A smooth quartic seed containing the two specified disjoint coordinate lines. -/
def ellipticQuarticSeedPolynomial : MvPolynomial (Fin 4) ℂ :=
  MvPolynomial.X 0 ^ 3 * MvPolynomial.X 2 +
  MvPolynomial.X 2 ^ 3 * MvPolynomial.X 1 +
  MvPolynomial.X 1 ^ 3 * MvPolynomial.X 3 +
  MvPolynomial.X 3 ^ 3 * MvPolynomial.X 0

/-- Evaluation of the elliptic quartic seed on the affine cone `ℂ⁴`. -/
def ellipticQuarticSeedMap (v : Fin 4 → ℂ) : ℂ :=
  MvPolynomial.eval v ellipticQuarticSeedPolynomial

/-- The cyclic derivative equations exclude every nonzero cone critical point.
The README perturbs this seed within the two-line coefficient subspace to obtain
distinct ordinary nodes in the residual-cubic pencil. -/
theorem ellipticQuarticSeedMap_fderiv_surjective
    (v : Fin 4 → ℂ) (hv : v ≠ 0) :
    Function.Surjective (fderiv ℂ ellipticQuarticSeedMap v) := by
  sorry

/-- Three diagonal quadrics have Vandermonde coefficients tᵢ^j, tᵢ=i+1. -/
def enriquesQuadric (j : Fin 3) : MvPolynomial (Fin 6) ℂ :=
  ∑ i : Fin 6, ((i.val + 1 : ℂ) ^ j.val) • MvPolynomial.X i ^ 2

/-- The linear sign change negates precisely the first three coordinates. -/
def enriquesInvolutionLinear : (Fin 6 → ℂ) ≃ₗ[ℂ] (Fin 6 → ℂ) where
  toFun v i := if i.val < 3 then -v i else v i
  invFun v i := if i.val < 3 then -v i else v i
  left_inv := by intro v; funext i; dsimp; split_ifs <;> simp
  right_inv := by intro v; funext i; dsimp; split_ifs <;> simp
  map_add' := by intro v w; funext i; dsimp; split_ifs <;> simp_all [add_comm]
  map_smul' := by intro z v; funext i; dsimp; split_ifs <;> simp_all

/-- Its projective action uses the native functor on injective semilinear maps. -/
def enriquesProjectiveInvolution :
    Projectivization ℂ (Fin 6 → ℂ) → Projectivization ℂ (Fin 6 → ℂ) :=
  Projectivization.map enriquesInvolutionLinear.toLinearMap enriquesInvolutionLinear.injective

/-- Vandermonde minors certify smoothness on the punctured affine cone. -/
theorem enriquesQuadricJacobian_surjective (v : Fin 6 → ℂ) (hv : v ≠ 0)
    (hz : ∀ j : Fin 3, MvPolynomial.eval v (enriquesQuadric j) = 0) :
    Function.Surjective
      (fderiv ℂ (fun w : Fin 6 → ℂ => fun j : Fin 3 =>
        MvPolynomial.eval w (enriquesQuadric j)) v) := by
  sorry

/-- The common zero set of the three Enriques quadrics in native complex projective space.
Each equation vanishes on every vector of the represented line. -/
def enriquesZeroSet : Set (Projectivization ℂ (Fin 6 → ℂ)) :=
  {p | ∀ v ∈ p.submodule, ∀ j : Fin 3,
    MvPolynomial.eval v (enriquesQuadric j) = 0}

/-- The projective sign change has no fixed point on the Enriques K3 cover. -/
theorem enriquesProjectiveInvolution_no_fixed_point
    (p : Projectivization ℂ (Fin 6 → ℂ)) (hp : p ∈ enriquesZeroSet) :
    enriquesProjectiveInvolution p ≠ p := by
  sorry

/-! ## Layer 8: Presentation realization, nonrecognition and exotic four-space -/

/-- A smooth four-manifold exists that is homeomorphic, but not diffeomorphic,
to standard Euclidean four-space (Gompf, Theorem 1.2). -/
theorem exoticFourSpace_exists :
    ∃ (M : Type) (t : TopologicalSpace M) (c : @ChartedSpace
      (EuclideanSpace ℝ (Fin 4)) inferInstance M t),
      letI : TopologicalSpace M := t
      letI : ChartedSpace (EuclideanSpace ℝ (Fin 4)) M := c
      IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin 4)) ∞ M ∧
      Nonempty (M ≃ₜ EuclideanSpace ℝ (Fin 4)) ∧
      IsEmpty (Diffeomorph 𝓘(ℝ, EuclideanSpace ℝ (Fin 4))
        𝓘(ℝ, EuclideanSpace ℝ (Fin 4)) M
        (EuclideanSpace ℝ (Fin 4)) ∞) := by
  sorry

end

end TauCetiRoadmap.FourManifolds
