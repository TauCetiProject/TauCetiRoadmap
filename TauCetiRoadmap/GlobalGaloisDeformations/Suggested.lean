import Mathlib
import TauCeti.RepresentationTheory.CharacterTwist

/-!
# GlobalGaloisDeformations: representative target signatures

The roadmap is `README.md`. This file records representative signatures for global twisting
and scalar frame directions, together with the formal-torus truncation relation, against the
pinned Mathlib and Tau Ceti, and proved tests of the local definitions; it is not exhaustive. Global deformation types, universal global rings,
Taylor–Wiles data and the finite-level patching systems use the coefficient categories and
arithmetic suppliers named in the README.

LocalGaloisDeformationRings §§F.1.1–F.1.10, F.2.1–F.2.11 and F.3.1–F.3.2 supply the generic
lifts, strict-class functors, representability and local-condition interface. Layer F
specializes the complete-local coproduct, relative presentation algebra
and continuous framed matrix ring of DeformationAndDerivedPatchingAlgebra §1.12 and §§2.1–2.7.
The twisting signatures here take matrix homomorphisms directly; continuity and preservation
of reduction are explicit hypotheses of their compatibility theorems.
-/

namespace TauCetiRoadmap.GlobalGaloisDeformations

open Matrix

/-! ## Layer R04.3: Global presentations -/

/-- The cokernel of the diagonal scalar map `k → k^m`: the degree-zero frame directions of the
framed complex in rank one (README 3.6). -/
abbrev scalarFrameCokernel (k : Type*) [Field k] (m : ℕ) : Type _ :=
  (Fin m → k) ⧸ LinearMap.range (LinearMap.pi fun _ : Fin m ↦ (LinearMap.id : k →ₗ[k] k))

/-- Nonempty rank-one framing sets leave one fewer scalar frame direction than frames
(README 3.6, `relTangent_count_rank_one`). The dimension identity is in the integers. -/
theorem scalarFrameCokernel_finrank (k : Type*) [Field k] (m : ℕ) (hm : 0 < m) :
    (Module.finrank k (scalarFrameCokernel k m) : ℤ) = (m : ℤ) - 1 := by
  sorry

/-! ## Layer R04.4: Restriction, twists and changes of problem -/

section Twist

variable {G : Type*} [Group G]
variable {A : Type*} [CommRing A] (n : ℕ)

/-- The matrix homomorphism of the twist `χ ⊗ ρ` (README 4.4, 4.9).
The coefficient and residual conditions are recorded in `twist_continuous` and `twist_reduce`. -/
def twist (χ : G →* Aˣ) (ρ : G →* GL (Fin n) A) : G →* GL (Fin n) A :=
  ((Matrix.GeneralLinearGroup.scalar (Fin n)).noncommCoprod (MonoidHom.id _)
    fun u M ↦ Matrix.GeneralLinearGroup.scalar_commute u M).comp (χ.prod ρ)

/-- Twisting matrix homomorphisms by a character is bijective, with inverse given by the
inverse character (README 4.4). -/
theorem twist_bijective (χ : G →* Aˣ) : Function.Bijective (twist n χ) := by
  sorry

/-- Twisting in rank `n` multiplies the determinant by the `n`-th power of the character
(README 4.4 and 4.9). -/
theorem det_twist (χ : G →* Aˣ) (ρ : G →* GL (Fin n) A) (g : G) :
    (twist n χ ρ g : Matrix (Fin n) (Fin n) A).det =
      ((χ g : Aˣ) : A) ^ n * (ρ g : Matrix (Fin n) (Fin n) A).det := by
  sorry

/-- The twist has matrices `χ(g) • ρ(g)`. -/
theorem twist_apply (χ : G →* Aˣ) (ρ : G →* GL (Fin n) A) (g : G) :
    (twist n χ ρ g : Matrix (Fin n) (Fin n) A) =
      ((χ g : Aˣ) : A) • (ρ g : Matrix (Fin n) (Fin n) A) := by
  show ((Matrix.GeneralLinearGroup.scalar (Fin n) (χ g) * ρ g : GL (Fin n) A) :
    Matrix (Fin n) (Fin n) A) = _
  simp [Matrix.GeneralLinearGroup.coe_scalar, Matrix.scalar_apply, Matrix.smul_eq_diagonal_mul]

/-- On the standard module, the matrix twist gives the library character twist (README 4.4). -/
theorem twist_charTwist (χ : G →* Aˣ) (ρ : G →* GL (Fin n) A) :
    (Units.coeHom (Module.End A (Fin n → A))).comp
        (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp (twist n χ ρ)) =
      Representation.charTwist χ
        ((Units.coeHom (Module.End A (Fin n → A))).comp
          (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp ρ)) := by
  apply MonoidHom.ext
  intro g
  apply LinearMap.ext
  intro v
  change (twist n χ ρ g : Matrix (Fin n) (Fin n) A) *ᵥ v =
    ((χ g : Aˣ) : A) • ((ρ g : Matrix (Fin n) (Fin n) A) *ᵥ v)
  rw [twist_apply, Matrix.smul_mulVec]

/-- Continuous characters and representations give a twist with continuous matrix entries. -/
theorem twist_continuous [TopologicalSpace G] [TopologicalSpace A] [IsTopologicalRing A]
    (χ : G →* Aˣ) (ρ : G →* GL (Fin n) A)
    (hc : Continuous fun g ↦ ((χ g : Aˣ) : A))
    (hρ : Continuous fun g ↦ (ρ g : Matrix (Fin n) (Fin n) A)) :
    Continuous fun g ↦ (twist n χ ρ g : Matrix (Fin n) (Fin n) A) := by
  have h : (fun g ↦ (twist n χ ρ g : Matrix (Fin n) (Fin n) A)) = fun g ↦
      Matrix.diagonal (fun _ ↦ ((χ g : Aˣ) : A)) * (ρ g : Matrix (Fin n) (Fin n) A) := by
    funext g
    rw [twist_apply, Matrix.smul_eq_diagonal_mul]
  rw [h]
  exact (Continuous.matrix_diagonal (continuous_pi fun _ ↦ hc)).matrix_mul hρ

/-- A residually trivial character preserves the residual representation. -/
theorem twist_reduce {k : Type*} [Field k] (π : A →+* k) (ρbar : G →* GL (Fin n) k)
    (χ : G →* Aˣ) (ρ : G →* GL (Fin n) A) (hχ : ∀ g, π (χ g) = 1)
    (hρ : (Matrix.GeneralLinearGroup.map π).comp ρ = ρbar) :
    (Matrix.GeneralLinearGroup.map π).comp (twist n χ ρ) = ρbar := by
  refine Eq.trans ?_ hρ
  ext g : 1
  show Matrix.GeneralLinearGroup.map π (Matrix.GeneralLinearGroup.scalar (Fin n) (χ g) *
    ρ g) = Matrix.GeneralLinearGroup.map π (ρ g)
  have h1 : Units.map (π : A →* k) (χ g) = 1 := Units.ext (by simp [hχ g])
  rw [map_mul, Matrix.GeneralLinearGroup.map_scalar]
  simp [h1]

/-- The trace step of the freeness argument: `tr (χ ⊗ ρ)(g) = χ(g) · tr ρ(g)`. -/
theorem trace_twist (χ : G →* Aˣ) (ρ : G →* GL (Fin n) A) (g : G) :
    (twist n χ ρ g : Matrix (Fin n) (Fin n) A).trace =
      ((χ g : Aˣ) : A) * (ρ g : Matrix (Fin n) (Fin n) A).trace := by
  rw [twist_apply, Matrix.trace_smul, smul_eq_mul]

end Twist

/-! ## Layer R04.4: Formal-torus truncation -/

/-- The `p^m`-torsion equation vanishes to order at least `m + 1` in the special-fibre
identity ideal, giving the truncation relation of README 4.5. -/
theorem diagonalizable_truncation_relation (p m : ℕ) (hp : p.Prime) :
    ((1 + Polynomial.X) ^ (p ^ m) - 1 : Polynomial ℤ) ∈
      (Ideal.span {(p : Polynomial ℤ), Polynomial.X}) ^ (m + 1) := by
  sorry

/-! ## Definition tests -/

section Examples

variable {G : Type*} [Group G] {k : Type*} [Field k]

/-- `twist_trivial`: the trivial character fixes each matrix homomorphism (README 4.4). -/
example (n : ℕ) {A : Type*} [CommRing A] (ρ : G →* GL (Fin n) A) :
    twist n (1 : G →* Aˣ) ρ = ρ := by
  ext g : 1
  show Matrix.GeneralLinearGroup.scalar (Fin n) 1 * ρ g = ρ g
  simp

/-- Rank-one framed complex: two frames leave one scalar frame direction, `k²/diag(k)`. -/
example : Module.finrank k (scalarFrameCokernel k 2) = 1 := by
  unfold scalarFrameCokernel
  have hi : Function.Injective
      (LinearMap.pi fun _ : Fin 2 ↦ (LinearMap.id : k →ₗ[k] k)) :=
    fun _ _ h ↦ congrFun h 0
  have hr := LinearMap.finrank_range_of_inj hi
  have hd := (LinearMap.range
    (LinearMap.pi fun _ : Fin 2 ↦ (LinearMap.id : k →ₗ[k] k))).finrank_quotient_add_finrank
  simp only [Module.finrank_self] at hr
  rw [hr, Module.finrank_fin_fun] at hd
  omega

/-- No frames: no frame directions, while every scalar stays in the kernel of the boundary. -/
example : Module.finrank k (scalarFrameCokernel k 0) = 0 := by
  unfold scalarFrameCokernel
  have hd := (LinearMap.range
    (LinearMap.pi fun _ : Fin 0 ↦ (LinearMap.id : k →ₗ[k] k))).finrank_quotient_add_finrank
  rw [Module.finrank_fin_fun] at hd
  omega

end Examples

/-!
Definitions specified in the README using the arithmetic and coefficient-category suppliers:
`DeformationType`, `TFramedDef`, `Rloc`, `locToGlobal`, `resRing`, `DiagGroup`, `RdetOnS`,
`detMap`, `twistAction`, `TaylorWilesDatum`, `IsCyclotomicAbsIrred`, `HasBigImage`,
`HasNonsolvableImage`, `KWDeformationData`, `TWSystem`, `DyadicPatchingDatum`,
`GlobalDeformationProblem`, `PolarizedDeformationProblem`.

LocalGaloisDeformationRings Layer F supplies `Lift`, `Def`, `ModDef`, `ModDefFramed`, `DetDef`,
`PseudoDefRing`, `univLift`, `DeformationProblem`, `TFramedLift`, `UnrestrictedTFramedDef`,
`IsSchur`, `PhiP`, `isSchur_baseChange`, `phiP_iff_fg`, and inertia-rigid deformation rings
at §§F.1.1–F.1.10, F.2.1–F.2.11, F.3.1–F.3.2 and F.4.12.
-/

end TauCetiRoadmap.GlobalGaloisDeformations
