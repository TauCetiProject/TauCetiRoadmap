import Mathlib

/-!
# Four-dimensional manifolds, intersection forms and elliptic examples: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the
pinned Mathlib and Tau Ceti, those headline statements of the roadmap that are
statable there: the smoothness of the explicit projective models (the Fermat and
elliptic quartic K3 surfaces and the Enriques K3 cover) on their punctured affine
cones, and the involution of the Enriques cover.

Not statable at the pins, and therefore not stated here:
* Freedman's classification of closed simply connected topological four-manifolds
  and the homotopy classification by intersection forms: there is no cup product on
  singular cohomology, no fundamental class of a closed oriented topological
  manifold, hence no intersection form of a four-manifold, and no
  Kirby–Siebenmann invariant.
* Donaldson's theorem that a definite intersection form of a closed simply
  connected smooth oriented four-manifold is diagonal: it needs the same intersection
  form, together with the moduli space of anti-self-dual SU(2) connections.
* Rokhlin's theorem `16 ∣ σ(M)` for closed smooth Spin four-manifolds: there is no
  Spin structure on a manifold and no signature of a manifold.
* The degree-two Pontryagin square `H²(−;ℤ/2) → H⁴(−;ℤ/4)`: it is a construction
  on cochains (cup-one products) that the pinned libraries lack, so it is a README
  target rather than a declaration here.
* The quartic and Enriques projective subtypes, the descended free involution and
  the diffeomorphism `E(2) ≅ K3`: they live on AffineMorseLefschetz A0's
  projective zero-locus carrier, which is not at the pins.
-/

namespace TauCetiRoadmap.FourManifolds

open scoped Manifold

noncomputable section

/-- The Fermat quartic `z₀⁴ + z₁⁴ + z₂⁴ + z₃⁴`. -/
def fermatQuarticPolynomial : MvPolynomial (Fin 4) ℂ :=
  ∑ i : Fin 4, MvPolynomial.X i ^ 4

/-- Evaluation of the Fermat quartic on the affine cone `ℂ⁴`. -/
def fermatQuarticMap (v : Fin 4 → ℂ) : ℂ :=
  MvPolynomial.eval v fermatQuarticPolynomial

/-- The derivative of the Fermat quartic is `Σᵢ 4 vᵢ³ dzᵢ`. -/
theorem fermatQuarticMap_fderiv (v : Fin 4 → ℂ) :
    fderiv ℂ fermatQuarticMap v =
      ∑ i : Fin 4, (4 * v i ^ 3) • ContinuousLinearMap.proj i := by
  sorry

/-- The Fermat quartic has no critical point on the punctured cone, so its
projective zero locus is a smooth quartic (K3) surface. -/
theorem fermatQuarticMap_fderiv_surjective (v : Fin 4 → ℂ) (hv : v ≠ 0) :
    Function.Surjective (fderiv ℂ fermatQuarticMap v) := by
  sorry

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

/-- The free involution negates precisely the first three homogeneous coordinates. -/
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

/-- The projective Enriques involution squares to the identity. -/
theorem enriquesProjectiveInvolution_involutive :
    Function.Involutive enriquesProjectiveInvolution := by
  sorry

end

end TauCetiRoadmap.FourManifolds
