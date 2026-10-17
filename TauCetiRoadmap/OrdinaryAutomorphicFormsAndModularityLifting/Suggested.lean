import Mathlib

/-! # OrdinaryAutomorphicFormsAndModularityLifting: representative target signatures

README.md is the roadmap. This file records light definitions and theorem signatures
statable using the pinned APIs and is not exhaustive. It fixes the finite-set pairing and
unaveraged trace, Wiles' ordered pseudo-representations with their normalising element, the
eigenvalue labels in quotient-character recovery, and the numerical controls for dimension
bounds. The arithmetic towers, Galois deformation conditions and
automorphic carriers remain README targets.
-/

namespace TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLifting

/-! ## Layer 1: Ordinary projectors and definite Hecke comparison -/

section FiniteFunctions

variable {X Y Z R : Type*} [Fintype X] [Fintype Y] [Fintype Z]

/-- The field-valued coefficient formula for the stabilizer-weighted pairing of §1.4.
Perfectness requires the cast of every count to be nonzero. The arithmetic integral
pairing requires unit counts in the coefficient ring. -/
def quaternionicPairing [Field R] (c : X → ℕ) (f g : X → R) : R :=
  ∑ x, (c x : R)⁻¹ * f x * g x

/-- The trace in §1.5 sums a fibre without dividing by its cardinality. -/
def traceAlong [DecidableEq X] [AddCommMonoid R] (π : Y → X) (g : Y → R) : X → R :=
  fun x => ∑ y ∈ Finset.univ.filter (fun y => π y = x), g y

/-- Nondegeneracy of the finite function pairing under its precise field hypothesis.
This is the coefficient-level milestone underlying the arithmetic perfect pairing. -/
theorem quaternionicPairing_nondegenerate [Field R] (c : X → ℕ)
    (hc : ∀ x, (c x : R) ≠ 0) (f : X → R)
    (hf : ∀ g : X → R, quaternionicPairing c f g = 0) : f = 0 := by
  sorry

/-- Restriction and unaveraged trace are adjoint for the unweighted function pairing. -/
theorem sum_comp_mul_eq_sum_mul_traceAlong [DecidableEq X] [CommSemiring R]
    (π : Y → X) (f : X → R) (g : Y → R) :
    ∑ y, f (π y) * g y = ∑ x, f x * traceAlong π g x := by
  sorry

/-- Trace respects the direction of successive level maps. -/
theorem traceAlong_comp [DecidableEq X] [DecidableEq Y] [AddCommMonoid R]
    (π : Y → X) (κ : Z → Y) (g : Z → R) :
    traceAlong (π ∘ κ) g = traceAlong π (traceAlong κ g) := by
  sorry

/-- `quaternionicPairing_one_point`: a singleton of stabilizer order two has Gram coefficient one half. -/
example : quaternionicPairing (X := Unit) (R := ℚ) (fun _ => 2)
    (fun _ => 3) (fun _ => 4) = 6 := by
  norm_num [quaternionicPairing]

/-- The empty function space contributes zero, with no nonzero vector to detect. -/
example : quaternionicPairing (X := Fin 0) (R := ℚ) (fun _ => 1)
    (fun _ => 3) (fun _ => 4) = 0 := by
  simp [quaternionicPairing]

/-- Zero counts give a degenerate formula, not a perfect pairing. -/
example : quaternionicPairing (X := Unit) (R := ℚ) (fun _ => 0)
    (fun _ => 3) (fun _ => 4) = 0 := by
  simp [quaternionicPairing]

/-- Positive counts may still vanish after casting into a field of characteristic p. -/
example : quaternionicPairing (X := Unit) (R := ZMod 2) (fun _ => 2)
    (fun _ => 1) (fun _ => 1) = 0 := by
  simp only [quaternionicPairing, Fintype.sum_unique, ZMod.natCast_self, inv_zero,
    zero_mul]

/-- `trace_singleton_two_preimages`: two source points in one fibre contribute their sum. -/
example : traceAlong (X := Unit) (Y := Fin 2) (fun _ => ())
    (R := ℚ) ![2, 3] () = 5 := by
  norm_num [traceAlong, Finset.sum_filter, Fin.sum_univ_two]

/-- `trace_empty_fibre`: a target point outside the image has trace zero. -/
example : traceAlong (X := Fin 2) (Y := Unit) (fun _ => 0)
    (R := ℚ) (fun _ => 7) 1 = 0 := by
  simp [traceAlong]

/-- `trace_empty_source`: an empty source has zero trace. -/
example : traceAlong (X := Unit) (Y := Fin 0) (fun _ => ())
    (R := ℚ) (fun _ => 7) () = 0 := by
  simp [traceAlong]

/-- Identity fibres recover the original finite function (`trace_identity`). -/
example [DecidableEq X] [AddCommMonoid R] (g : X → R) :
    traceAlong (id : X → X) g = g := by
  ext x
  simp [traceAlong, Finset.sum_filter]

/-- Unit stabilizers give the unweighted function pairing (`quaternionicPairing_free`). -/
example [Field R] (f g : X → R) :
    quaternionicPairing (fun _ => 1) f g = ∑ x, f x * g x := by
  simp [quaternionicPairing]

/-- Two free classes give the value 23. -/
example : quaternionicPairing (X := Fin 2) (R := ℚ) (fun _ => 1)
    ![2, 3] ![4, 5] = 23 := by
  norm_num [quaternionicPairing, Fin.sum_univ_two]

/-- A stabilizer ratio two gives arithmetic trace six and weighted contribution three. -/
example : (2 / 1 : ℚ) * 3 = 6 ∧ (2 : ℚ)⁻¹ * ((2 / 1) * 3) = 3 := by
  norm_num

/-- A central fibre of size two scales the central pairing by two. -/
example : quaternionicPairing (X := Fin 2) (R := ℚ) (fun _ => 1)
    (fun _ => 2) (fun _ => 3) = 2 * quaternionicPairing (X := Unit)
      (fun _ => 1) (fun _ => 2) (fun _ => 3) := by
  norm_num [quaternionicPairing, Fin.sum_univ_two]

end FiniteFunctions

/-- The unit and nilpotent parts have different ordinary limiting behaviour. -/
example : (2 : ZMod 25) ^ (5 * 4) = 1 ∧ (5 : ZMod 125) ^ 3 = 0 := by
  decide

/-- With m=0 the projector exponent vanishes, so a nilpotent is sent to one. -/
example (n : ℕ) : (5 : ZMod 125) ^ (5 ^ n * (5 ^ 0 - 1)) = 1 := by
  simp

/-- The Eisenstein congruence sign is distinguishable in odd characteristic. -/
example : (1 : ZMod 5) ≠ -1 := by
  decide

/-! ## Layer 2: Permissible localizations, duality and level maps -/

/-- The index exponent one at p=5 gives rank five, rather than rank one. -/
example : ((Polynomial.X + 1 : Polynomial ℤ) ^ 5 - 1).natDegree = 5 := by
  compute_degree!

/-- Ramanujan's congruences `τ(2) ≡ 1 + 2¹¹` and `τ(3) ≡ 1 + 3¹¹` modulo 691: the degree-one
analogue of the Frobenius trace condition of a permissible ideal, which does not by itself
impose the ordinary quotient eigenvalue. -/
example : (-24 : ZMod 691) = 1 + 2 ^ 11 ∧ (252 : ZMod 691) = 1 + 3 ^ 11 := by
  decide

/-- In the rank-five residue algebra of §2.8 the identity has algebra trace zero,
while the coefficient functional used for integral duality detects the top power. -/
example : Matrix.trace (1 : Matrix (Fin 5) (Fin 5) (ZMod 5)) = 0 ∧
    (Polynomial.X ^ 4 : Polynomial (ZMod 5)).coeff 4 = 1 := by
  constructor
  · simp only [Matrix.trace_one, Fintype.card_fin, ZMod.natCast_self]
  · simp

/-! ## Layer 3: Nearly ordinary deformations and Galois–Hecke interfaces -/

section PseudoRep

/-- Wiles' ordered two-dimensional pseudo-representation of §3.7, normalised by an element
`z` (a complex conjugation). For a representation with `ρ z = diag(1, −1)` and
`ρ σ = (a_σ b_σ; c_σ d_σ)` the data are `a`, `d` and `x σ τ = b_σ c_τ`. The coefficient ring
has `2` invertible. Traces and determinants are compared with pseudocharacters through
TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants. For fixed `z`, the trace recovers
all three ordered functions because `2` is invertible. -/
structure PseudoRep (G A : Type*) [Group G] [TopologicalSpace G] [CommRing A]
    [TopologicalSpace A] [Invertible (2 : A)] (z : G) where
  /-- The upper-left entry. -/
  a : G → A
  /-- The lower-right entry. -/
  d : G → A
  /-- The product of the upper-right entry at the first argument and the lower-left entry
  at the second. -/
  x : G → G → A
  continuous_a : Continuous a
  continuous_d : Continuous d
  continuous_x : Continuous fun p : G × G => x p.1 p.2
  a_mul : ∀ σ τ, a (σ * τ) = a σ * a τ + x σ τ
  d_mul : ∀ σ τ, d (σ * τ) = d σ * d τ + x τ σ
  x_mul_x : ∀ σ τ α β, x σ τ * x α β = x σ β * x α τ
  x_mul_mul : ∀ σ τ α β, x (σ * τ) (α * β) =
    a σ * a β * x τ α + a β * d τ * x σ α + a σ * d α * x τ β + d τ * d α * x σ β
  a_one : a 1 = 1
  d_one : d 1 = 1
  a_z : a z = 1
  d_z : d z = -1
  x_one_left : ∀ σ, x 1 σ = 0
  x_one_right : ∀ σ, x σ 1 = 0
  x_z_left : ∀ σ, x z σ = 0
  x_z_right : ∀ σ, x σ z = 0

namespace PseudoRep

variable {G A : Type*} [Group G] [TopologicalSpace G] [CommRing A] [TopologicalSpace A]
  [Invertible (2 : A)] {z : G}

/-- The trace `a + d` of a pseudo-representation. -/
def trace (ρ : PseudoRep G A z) (σ : G) : A := ρ.a σ + ρ.d σ

/-- The determinant `a(σ)d(σ) − x(σ, σ)` of a pseudo-representation. -/
def det (ρ : PseudoRep G A z) (σ : G) : A := ρ.a σ * ρ.d σ - ρ.x σ σ

/-- The fixed normalizing element recovers the ordered functions from the trace. -/
theorem trace_recovery (ρ : PseudoRep G A z) (σ τ : G) :
    2 * ρ.a σ = ρ.trace σ + ρ.trace (z * σ) ∧
    2 * ρ.d σ = ρ.trace σ - ρ.trace (z * σ) ∧
    ρ.x σ τ = ρ.a (σ * τ) - ρ.a σ * ρ.a τ := by
  simp only [trace, ρ.a_mul, ρ.d_mul, ρ.a_z, ρ.d_z, ρ.x_z_left, ρ.x_z_right]
  constructor
  · ring
  constructor <;> ring

/-- A continuous matrix representation normalized at `z` supplies Wiles' ordered data. -/
def ofRep [IsTopologicalRing A] (z : G)
    (ρ : G →* Matrix (Fin 2) (Fin 2) A) (hρ : Continuous ρ)
    (hz : ρ z = !![1, 0; 0, -1]) : PseudoRep G A z where
  a σ := ρ σ 0 0
  d σ := ρ σ 1 1
  x σ τ := ρ σ 0 1 * ρ τ 1 0
  continuous_a := by fun_prop
  continuous_d := by fun_prop
  continuous_x := by fun_prop
  a_mul σ τ := by simp [Matrix.mul_apply, Fin.sum_univ_two]
  d_mul σ τ := by simp [Matrix.mul_apply, Fin.sum_univ_two, mul_comm, add_comm]
  x_mul_x σ τ α β := by ring
  x_mul_mul σ τ α β := by
    simp only [map_mul, Matrix.mul_apply, Fin.sum_univ_two]
    ring
  a_one := by simp
  d_one := by simp
  a_z := by simp [hz]
  d_z := by simp [hz]
  x_one_left σ := by simp
  x_one_right σ := by simp
  x_z_left σ := by simp [hz]
  x_z_right σ := by simp [hz]

end PseudoRep

/-- The residual pseudo-representation `{1, χ, 0}` of `1 ⊕ χ`; every nonsplit `ρ_c` has it,
so the pseudo-deformation ring forgets the extension class (§3.7, `pseudoRep_residual`). -/
def PseudoRep.residual {G A : Type*} [Group G] [TopologicalSpace G] [CommRing A] [TopologicalSpace A]
    [Invertible (2 : A)] (z : G) (χ : G →* A) (hχ : Continuous χ) (hz : χ z = -1) :
    PseudoRep G A z where
  a _ := 1
  d := χ
  x _ _ := 0
  continuous_a := continuous_const
  continuous_d := hχ
  continuous_x := continuous_const
  a_mul _ _ := by simp
  d_mul _ _ := by simp
  x_mul_x _ _ _ _ := by simp
  x_mul_mul _ _ _ _ := by simp
  a_one := rfl
  d_one := map_one χ
  a_z := rfl
  d_z := hz
  x_one_left _ := rfl
  x_one_right _ := rfl
  x_z_left _ := rfl
  x_z_right _ := rfl

/-- At the normalising element the trace is `0` and the determinant is `−1`, as for
`diag(1, −1)`. -/
example {G A : Type*} [Group G] [TopologicalSpace G] [CommRing A] [TopologicalSpace A]
    [Invertible (2 : A)] (z : G) (ρ : PseudoRep G A z) :
    ρ.trace z = 0 ∧ ρ.det z = -1 := by
  simp [PseudoRep.trace, PseudoRep.det, ρ.a_z, ρ.d_z, ρ.x_z_left]

/-- The identity has trace two and determinant one for every ordered pseudo-representation. -/
example {G A : Type*} [Group G] [TopologicalSpace G] [CommRing A] [TopologicalSpace A]
    [Invertible (2 : A)] (z : G) (ρ : PseudoRep G A z) :
    ρ.trace 1 = 2 ∧ ρ.det 1 = 1 := by
  norm_num [PseudoRep.trace, PseudoRep.det, ρ.a_one, ρ.d_one, ρ.x_one_left]

/-- The diagonal residual value retains both the trace and the character determinant. -/
example {G A : Type*} [Group G] [TopologicalSpace G] [CommRing A] [TopologicalSpace A]
    [Invertible (2 : A)] (z : G) (χ : G →* A) (hχ : Continuous χ)
    (hz : χ z = -1) (σ : G) :
    (PseudoRep.residual z χ hχ hz).trace σ = 1 + χ σ ∧
      (PseudoRep.residual z χ hχ hz).det σ = χ σ := by
  simp [PseudoRep.residual, PseudoRep.trace, PseudoRep.det]

/-- The matrix construction gives the actual matrix trace and determinant. -/
example {G A : Type*} [Group G] [TopologicalSpace G] [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [Invertible (2 : A)] (z : G)
    (ρ : G →* Matrix (Fin 2) (Fin 2) A) (hρ : Continuous ρ)
    (hz : ρ z = !![1, 0; 0, -1]) (σ : G) :
    (PseudoRep.ofRep z ρ hρ hz).trace σ = Matrix.trace (ρ σ) ∧
      (PseudoRep.ofRep z ρ hρ hz).det σ = Matrix.det (ρ σ) := by
  simp [PseudoRep.ofRep, PseudoRep.trace, PseudoRep.det, Matrix.trace,
    Matrix.diag, Fin.sum_univ_two, Matrix.det_fin_two]

/-- An invertible matrix with nonzero off-diagonal product gives trace three and determinant one. -/
example :
    let G := (Matrix (Fin 2) (Fin 2) ℚ)ˣ
    letI : TopologicalSpace G := ⊥
    let z : G := ⟨!![1, 0; 0, -1], !![1, 0; 0, -1],
      by ext i j; fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two],
      by ext i j; fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]⟩
    let σ : G := ⟨!![2, 1; 1, 1], !![1, -1; -1, 2],
      by ext i j; fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two],
      by ext i j; fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]⟩
    let P := PseudoRep.ofRep z (Units.coeHom _) (by fun_prop) rfl
    P.trace σ = 3 ∧ P.det σ = 1 ∧ P.x σ σ = 1 := by
  norm_num [PseudoRep.ofRep, PseudoRep.trace, PseudoRep.det]

end PseudoRep

/-- The t² coefficient of the square records the x₁ contribution in §3.8.
The same coefficients survive modulo t³, while the original diagonal has no t² term. -/
example :
    let M : Matrix (Fin 2) (Fin 2) (Polynomial (ZMod 5)) :=
      !![1, Polynomial.X; Polynomial.X, 1]
    ((M * M) 0 0).coeff 2 = 1 ∧ (M 0 0).coeff 2 = 0 ∧
      (M 0 1 * M 1 0).coeff 2 = 1 := by
  norm_num [Matrix.mul_apply, Fin.sum_univ_two, ← pow_two, Polynomial.coeff_one]

/-- The two involutions anticommute, giving the projective Klein-four control of §3.30. -/
example :
    let A : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![1, 0; 0, -1]
    let B : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, 1; 1, 0]
    A ^ 2 = 1 ∧ B ^ 2 = 1 ∧ A * B = -(B * A) ∧ A * B ≠ B * A := by
  decide

/-- Quotient recovery in the field coefficient case of §3.17: β labels the sub-character
and α labels the quotient. The complete-local-ring version requires β−α to be a unit. -/
theorem quotientCharacter_recovery {K : Type*} [Field K] (α β u v : K)
    (h : β - α ≠ 0) :
    (β - α)⁻¹ * (β * (u + v) - (β * u + α * v)) = v := by
  sorry

/-- The alternate eigenvalue labels in §2.5 give the other recovery formula. -/
example {K : Type*} [Field K] (α β u v : K) (h : β - α ≠ 0) :
    (β - α)⁻¹ * ((α * u + β * v) - α * (u + v)) = v := by
  rw [show (α * u + β * v) - α * (u + v) = (β - α) * v by ring,
    ← mul_assoc, inv_mul_cancel₀ h, one_mul]

/-- Multiplication by the eigenvalue difference gives four rather than the quotient one. -/
example : ((3 : ℚ) - 1) * (3 * (5 + 1) - (3 * 5 + 1 * 1)) = 4 := by
  norm_num

/-- Equal eigenvalues cannot be used for recovery. -/
example : ((1 : ℚ) - 1)⁻¹ * (1 * (5 + 1) - (1 * 5 + 1 * 1)) = 0 := by
  norm_num

/-- `pseudoRep_ofRep_identity`: the four-term ordered pseudo-representation identity is matrix multiplication. -/
example {R : Type*} [CommRing R] (aσ bσ bτ dτ cα dα aβ cβ : R) :
    (aσ * bτ + bσ * dτ) * (cα * aβ + dα * cβ) =
      aσ * aβ * (bτ * cα) + aβ * dτ * (bσ * cα) +
        aσ * dα * (bτ * cβ) + dτ * dα * (bσ * cβ) := by
  ring

/-- `pseudoRep_det_of_rep`: the ordered determinant agrees with the matrix determinant. -/
example {R : Type*} [CommRing R] (a b c d : R) :
    a * d - b * c = Matrix.det (!![a, b; c, d] : Matrix (Fin 2) (Fin 2) R) := by
  simp [Matrix.det_fin_two]

/-- `pseudoRep_diagonal_conj`: a unit diagonal conjugation fixes both diagonal entries and `x`. -/
example {R : Type*} [CommRing R] (a b c d bτ cτ : R) (u : Rˣ) :
    (!![(u : R), 0; 0, 1] * !![a, b; c, d] * !![(↑(u⁻¹) : R), 0; 0, 1] :
      Matrix (Fin 2) (Fin 2) R) = !![a, ↑u * b; ↑(u⁻¹) * c, d] ∧
    (↑u * b) * (↑(u⁻¹) * cτ) = b * cτ ∧
    (↑u * bτ) * (↑(u⁻¹) * c) = bτ * c := by
  constructor
  · ext i j
    fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two, mul_assoc, mul_comm]
  · constructor
    · calc
        (↑u * b) * (↑(u⁻¹) * cτ) = ((u : R) * ↑(u⁻¹)) * (b * cτ) := by ring
        _ = b * cτ := by simp
    · calc
        (↑u * bτ) * (↑(u⁻¹) * c) = ((u : R) * ↑(u⁻¹)) * (bτ * c) := by ring
        _ = bτ * c := by simp

/-- A scalar twist multiplies determinant by the square of the character value. -/
example {K : Type*} [Field K] (a b c d ψ : K) :
    Matrix.det (!![ψ * a, ψ * b; ψ * c, ψ * d] : Matrix (Fin 2) (Fin 2) K) =
      ψ ^ 2 * Matrix.det (!![a, b; c, d] : Matrix (Fin 2) (Fin 2) K) := by
  simp [Matrix.det_fin_two]
  ring

/-- A quotient eigenvalue three twisted by two becomes six. -/
example : (2 : ℚ) * 3 = 6 ∧ (2 : ℚ) * 3 ≠ 3 / 2 := by
  norm_num

/-- CM and totally real quadratic extensions have different minus-unit ranks. -/
example (d : ℕ) (hd : 1 ≤ d) :
    (0 + d - 1) - (d + 0 - 1) = 0 ∧
      (2 * d + 0 - 1) - (d + 0 - 1) = d ∧ d / 2 < d := by
  omega

/-! ## Layer 4: Pro-modularity and localized R = T -/

/-- Reduction modulo (x) factors through the quotient killing x (§4.1). -/
example {k : Type*} [Field k] :
    ∃ θ : Polynomial k →+* Polynomial k,
      (Polynomial.evalRingHom (0 : Polynomial k)) =
        θ.comp (Polynomial.evalRingHom (0 : Polynomial k)) := by
  exact ⟨RingHom.id _, rfl⟩

/-- Reduction modulo (t,x) factors through the same quotient, then evaluation of t. -/
example {k : Type*} [Field k] :
    ∃ θ : Polynomial k →+* k,
      (Polynomial.evalRingHom (0 : k)).comp
        (Polynomial.evalRingHom (0 : Polynomial k)) =
        θ.comp (Polynomial.evalRingHom (0 : Polynomial k)) := by
  exact ⟨Polynomial.evalRingHom 0, rfl⟩

/-- Reduction modulo (t) retains x, so it cannot factor through the quotient killing x. -/
example {k : Type*} [Field k] :
    ¬ ∃ θ : Polynomial k →+* Polynomial k,
      Polynomial.mapRingHom (Polynomial.evalRingHom (0 : k)) =
        θ.comp (Polynomial.evalRingHom (0 : Polynomial k)) := by
  rintro ⟨θ, hθ⟩
  have h := DFunLike.congr_fun hθ (Polynomial.X : Polynomial (Polynomial k))
  simp at h

/-- The auxiliary patching parameter vanishes at the identity matrix. -/
example : Matrix.trace (1 : Matrix (Fin 2) (Fin 2) ℚ) - 2 = 0 ∧
    Matrix.trace ((1 : Matrix (Fin 2) (Fin 2) ℚ) - 2) = -2 := by
  norm_num [Matrix.trace, Matrix.diag, Fin.sum_univ_two, Matrix.ofNat_apply]

/-- The patching map uses t=s²/(1+s); division needs the displayed nonvanishing. -/
example {K : Type*} [Field K] (s : K) (h : 1 + s ≠ 0) :
    (1 + s) + (1 + s)⁻¹ - 2 = s ^ 2 / (1 + s) := by
  rw [eq_div_iff h, sub_mul, add_mul, inv_mul_cancel₀ h]
  ring

/-- The identity augmentation has zero cotangent and congruence lengths. -/
example {C : Type*} [CommRing C] :
    let H := RingHom.ker (RingHom.id C)
    let η := ((RingHom.ker (RingHom.id C)).annihilator).map (RingHom.id C)
    Module.length C (H ⧸ (H • (⊤ : Submodule C H))) = 0 ∧
      Module.length C (C ⧸ η) = 0 := by
  have hid : RingHom.ker (RingHom.id C) = ⊥ := by ext x; simp
  dsimp only
  rw [hid, Submodule.annihilator_bot, Ideal.map_id]
  constructor <;> exact Module.length_eq_zero

/-- At s=−1 the inverse-of-zero convention destroys the rational identity. -/
example : ((1 + (-1 : ℚ)) + (1 + (-1 : ℚ))⁻¹ - 2) ≠
    (-1 : ℚ) ^ 2 / (1 + (-1 : ℚ)) := by
  norm_num

/-- The minimal-level good-pair bound alone does not imply the general Σ estimate. -/
example : 2 + 2 * 1 + 7 * 0 < 40 / 2 ∧ 40 - 7 * 4 - 1 < 40 / 2 + 1 := by
  decide

/-- The stronger general-level hypothesis gives the component dimension needed in §4.17. -/
example (d t m u : ℕ) (hmu : m ≤ u) (h : 2 + 2 * t + 7 * u < d / 2) :
    d / 2 + 1 ≤ d - 2 * t - 3 * m - 4 * u := by
  omega

/-! ## Layer 5: Ordinary modularity lifting -/

/-- For a totally real quadratic extension the required half-rank inequality has the
stated numerical consequence; its p-adic transcendence input is separate. -/
example (d r : ℕ) (hr : d ≤ 2 * r) : d - r ≤ d / 2 := by
  omega

/-- The stronger base-change degree choice implies the irreducible good-pair bounds. -/
example (dL dv t m s : ℕ) (hs : t + m ≤ s)
    (h1 : 2 + 7 * s < dL / 2) (h2 : 2 + 7 * s < dv) :
    2 + 2 * t + 7 * m < dL / 2 ∧ 2 + 2 * t + 7 * m < dv := by
  omega

/-! ## Layer 6: Classical interpolation and ordinary lift constructions -/

/-- The Eisenstein index at X₀(11) is numerator(10/12)=5. -/
example : (11 - 1) / Nat.gcd (11 - 1) 12 = 5 := by
  decide

/-- The residual characters at five are distinguished on inertia. -/
example : (2 : ZMod 5) ^ 2 ≠ 1 ∧ (2 : ZMod 5) ^ 4 = 1 := by
  decide

/-- Trivial nebentypus in the X₀(11) branch occurs at weights congruent to two modulo four. -/
example (k : ℕ) (hk : 2 ≤ k) : 4 ∣ k - 2 ↔ k % 4 = 2 := by
  omega

/-- Higher-weight trivial-character forms new at five cannot have a unit square eigenvalue. -/
example (k : ℕ) (hk : 3 ≤ k) : 5 ∣ 5 ^ (k - 2) := by
  exact dvd_pow_self 5 (by omega)

/-- Even weight and odd p make the two inertia characters distinct. -/
example (p k : ℕ) (hp : Odd p) (hk : Even k) (hk2 : 2 ≤ k) :
    ¬ (p - 1) ∣ (k - 1) := by
  intro h
  have h1 : Even (p - 1) := by
    obtain ⟨a, rfl⟩ := hp
    exact ⟨a, by omega⟩
  have h2 : Odd (k - 1) := by
    obtain ⟨b, rfl⟩ := hk
    exact ⟨b - 1, by omega⟩
  exact (Nat.not_even_iff_odd.mpr h2) (even_iff_two_dvd.mpr (h1.two_dvd.trans h))

/-- The odd quadratic character of discriminant −23 is trivial at three. -/
example : ((-23 : ℤ) : ZMod 3) = 1 := by
  decide

/-!
The README also specifies the heavier definitions: nearly ordinary automorphic
representations; permissible Eisenstein ideals and weight algebras; reducible and
irreducible deformation data, deformation rings and permissible extensions; local
ramification types; universal pseudo-deformations;
pseudo-to-deformation maps; deformation Iwasawa algebra structures; Hida family and integral
Hecke Galois representations; Hecke pseudo-representations; augmented and minimal Hecke
rings and modules; pro-modular primes; good pairs, nice primes and their properties;
Hypothesis H; and the new-quotient classical Hida representation refinements.
The heavier API names include `stabiliserCount`, `heckeAdjoint`, `IsVGoodLine`,
`IsNearlyOrdinary`, `IsOrdinary`, `IsPermissible`, `centralDeterminant`,
`permissibleLambdaAlgebra`, `admissibleClasses`, `residualExtension`, `IsOfType`,
`universalRing`, `IsPermissibleExtension`, `DeformationDatum.baseChange`,
`RamificationType`, `pseudoToDeformation`, `deformationLambdaAlgebra`,
`pseudoLambdaAlgebra`, `hidaGaloisRep`, `heckePseudoRep`, `pseudoToHecke`,
`deformationLevel`, `deformationHeckeRing`, `minimalHeckeRing`, `deformationHeckeModule`,
`IsProModular`, `IsProModularComponent`, `IsGoodPair`, `IsNiceDeformation`, `IsNiceFor`,
`PropertyP1`, `PropertyP2`, `HypothesisH`, `IsOfIrreducibleType`, `irreducibleUniversalRing`,
`heckeGaloisRep`, `IsPermissibleIrr`, `levelOfDatum`, `heckeOfDatum`, `heckeModuleOfDatum`,
`heckeMinOfDatum`, `IsGoodPairIrr`, `IsNiceIrr`, `PropertyP`, and `hidaFamilyRep`.
Section 1.4 also specifies `quaternionicPairing_central_scaling`,
`quaternionicPairing_free`, `quaternionicPairing_hecke_adjoint` and
`quaternionicPairing_perfect` on the arithmetic class sets. Section 1.5 specifies
`traceAlong_id`, mirrored by the identity-fibre example `trace_identity`. Section 3.7 specifies
`PseudoRep.ofRep_conj_diagonal`, `PseudoRep.trace_isPseudocharacter`,
`pseudoRep_det_of_rep` and `pseudoRep_diagonal_conj` for the representation and
pseudocharacter comparisons. The identity, free-pairing, two-point, stabilizer-ratio,
determinant, diagonal-conjugation and identity-augmentation Checks have coefficient-level examples above. The arithmetic
central-character and pseudocharacter comparisons remain README targets. Local tangent
conditions, the determinant–flag spectrum comparison, arithmetic patching, localized R=T,
Skinner–Wiles lifting and single-coefficient solvable descent likewise require
arithmetic carriers beyond these finite-function definitions.
-/

end TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLifting
