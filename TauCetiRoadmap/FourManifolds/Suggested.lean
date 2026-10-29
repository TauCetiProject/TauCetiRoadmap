import Mathlib

/-!
# Four-dimensional manifolds, intersection forms and elliptic examples: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the
pinned Mathlib and Tau Ceti, those headline statements of the roadmap that are
statable there: the smoothness of the explicit projective models (the Fermat and
elliptic quartic K3 surfaces and the Enriques K3 cover) on their punctured affine
cones, and the absence of fixed points of the Enriques involution on its
projective common zero set.

Not statable at the pins, and therefore not stated here:
* Freedman's classification of closed simply connected topological four-manifolds
  and the homotopy classification by intersection forms: the missing inputs are
  the manifold fundamental class and its intersection pairing, and the
  Kirby–Siebenmann invariant. The singular cup product alone does not supply
  these manifold constructions.
* Donaldson's theorem that a definite intersection form of a closed simply
  connected smooth oriented four-manifold is diagonal: it needs the same intersection
  form, together with the moduli space of anti-self-dual SU(2) connections.
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
* The exotic ℝ⁴ construction: its Casson-handle neighborhoods and their smooth
  comparison inside K3 and the hyperbolic model are missing.
-/

namespace TauCetiRoadmap.FourManifolds

open scoped Manifold

noncomputable section

/-! ## Layer 7: Elliptic surfaces, K3 and boundary Spin data -/

/-- The Fermat quartic `z₀⁴ + z₁⁴ + z₂⁴ + z₃⁴`. -/
def fermatQuarticPolynomial : MvPolynomial (Fin 4) ℂ :=
  ∑ i : Fin 4, MvPolynomial.X i ^ 4

/-- Evaluation of the Fermat quartic on the affine cone `ℂ⁴`. -/
def fermatQuarticMap (v : Fin 4 → ℂ) : ℂ :=
  MvPolynomial.eval v fermatQuarticPolynomial

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

end

end TauCetiRoadmap.FourManifolds
