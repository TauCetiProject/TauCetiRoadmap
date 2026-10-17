import Mathlib

/-!
# GlobalGaloisDeformations: representative target signatures

The roadmap is `README.md`. This file records representative signatures for global twisting
and scalar frame directions against the pinned Mathlib and Tau Ceti, and discriminating
`example`s; it is not exhaustive. Global deformation types, universal global rings,
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

/-! ## Layer R04.4: Restriction, twists and changes of problem -/

section Twist

variable {G : Type*} [Group G]
variable {A : Type*} [CommRing A] (n : ℕ)

/-- The matrix homomorphism of the twist `χ ⊗ ρ` (README 4.4, 4.9).
The coefficient and residual conditions are recorded in `twist_continuous` and `twist_reduce`. -/
def twist (χ : G →* Aˣ) (ρ : G →* GL (Fin n) A) : G →* GL (Fin n) A :=
  ((Matrix.GeneralLinearGroup.scalar (Fin n)).noncommCoprod (MonoidHom.id _)
    fun u M ↦ Matrix.GeneralLinearGroup.scalar_commute u M).comp (χ.prod ρ)

/-- The twist has matrices `χ(g) • ρ(g)`. -/
theorem twist_apply (χ : G →* Aˣ) (ρ : G →* GL (Fin n) A) (g : G) :
    (twist n χ ρ g : Matrix (Fin n) (Fin n) A) =
      ((χ g : Aˣ) : A) • (ρ g : Matrix (Fin n) (Fin n) A) := by
  show ((Matrix.GeneralLinearGroup.scalar (Fin n) (χ g) * ρ g : GL (Fin n) A) :
    Matrix (Fin n) (Fin n) A) = _
  simp [Matrix.GeneralLinearGroup.coe_scalar, Matrix.scalar_apply, Matrix.smul_eq_diagonal_mul]

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

/-! ## Convention examples -/

section Examples

variable {G : Type*} [Group G] [TopologicalSpace G] {k : Type*} [Field k]

/-- `twist_trivial`: the trivial character fixes each matrix homomorphism (README 4.4). -/
example (n : ℕ) {A : Type*} [CommRing A] (ρ : G →* GL (Fin n) A) :
    twist n (1 : G →* Aˣ) ρ = ρ := by
  ext g : 1
  show Matrix.GeneralLinearGroup.scalar (Fin n) 1 * ρ g = ρ g
  simp

/-- `fixedVar_p_divides_n`: in characteristic three, residue-one cube powers have no
nonzero dual-number direction (README 7.4). -/
example {R : Type*} [CommRing R] (a e : R) (h3 : (3 : R) = 0) (he : e ^ 2 = 0) :
    (1 + a * e) ^ 3 = 1 := by
  linear_combination (a * e) * h3 + (3 * a ^ 2 + a ^ 3 * e) * he

/-- `twDatum_residue_extension`: distinct nonzero eigenvalues over `𝔽₃` cannot have product one;
`X²+1` has no root in that field (README 5.1). -/
example : (∀ a b : ZMod 3, a ≠ 0 → b ≠ 0 → a ≠ b → a * b ≠ 1) ∧
    (∀ a : ZMod 3, a ^ 2 + 1 ≠ 0) ∧
    (1 : Matrix (Fin 2) (Fin 2) (ZMod 3)).det =
      (!![(0 : ZMod 3), -1; 1, 0]).det := by
  decide

/-- `isOfType_unramified_conjugate`: the strict conjugator changes Frobenius but keeps the
inertia matrix equal to one (README 7.1). -/
example :
    let ε : DualNumber (ZMod 3) := TrivSqZeroExt.inr 1
    let b : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; ε, 1]
    let bi : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; -ε, 1]
    b * !![1, 0; 0, -1] * bi = !![1, 0; 2 * ε, -1] ∧ b * 1 * bi = 1 := by
  let : DecidableEq (DualNumber (ZMod 3)) := inferInstanceAs (DecidableEq (ZMod 3 × ZMod 3))
  decide

/-- `polarized_symplectic_triple`: the standard `S₃` matrices preserve the symplectic pairing
with sign multiplier; its transpose forces multiplier `+1` at the central involution
(README 8.1). -/
example :
    let J : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, 1; -1, 0]
    let C : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, -1; 1, -1]
    let S : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, 1; 1, 0]
    J.det = 1 ∧ J.transpose = -J ∧ C.transpose * J * C = J ∧
      S.transpose * J * S = -J ∧ J ≠ J.transpose ∧
      (-J) * J = 1 := by
  decide

/-- `polarized_not_schur`: the distinct reciprocal characters and alternating pairing admit a
nonzero diagonal infinitesimal centralizer (README 8.1). -/
example :
    let J : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, 1; -1, 0]
    let D : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![2, 0; 0, 3]
    let X : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![1, 0; 0, -1]
    D ^ 4 = 1 ∧ D.transpose * J * D = J ∧ X * D = D * X ∧
      X.transpose * J + J * X = 0 ∧ X ≠ 0 := by
  decide

/-- `twSystem_cyclic_augmentation` and `presentation_obstruction_square`: the order-three
character relation has linear term `3z` and becomes a nonzero cube in characteristic three
(README 6.4, 3.7). -/
example :
    ((1 + Polynomial.X) ^ 3 - 1 : Polynomial ℤ) =
      3 * Polynomial.X + Polynomial.X ^ 2 * (3 + Polynomial.X) ∧
    ((1 + Polynomial.X) ^ 3 - 1 : Polynomial (ZMod 3)) = Polynomial.X ^ 3 := by
  constructor
  · ring
  · have h3 : (3 : Polynomial (ZMod 3)) = 0 := CharP.cast_eq_zero _ 3
    linear_combination (Polynomial.X + Polynomial.X ^ 2) * h3

/-- `dyadic_cyclic_four_fibre`: the order-two determinant fibre is a proper quotient of the
order-four character ring (README 6.6). -/
example :
    ((1 + Polynomial.X) ^ 4 - 1 : Polynomial ℤ) =
      ((1 + Polynomial.X) ^ 2 - 1) * ((1 + Polynomial.X) ^ 2 + 1) ∧
    ((1 + Polynomial.X) ^ 2 - 1 : Polynomial ℤ) = Polynomial.X * (2 + Polynomial.X) := by
  constructor <;> ring

/-- `dyadic_chunk_level`: order-four characters and the formal torus agree modulo the third
power of the maximal ideal (README 6.6). -/
example : ((1 + Polynomial.X) ^ 4 - 1 : Polynomial ℤ) ∈
    (Ideal.span {(2 : Polynomial ℤ), Polynomial.X}) ^ 3 := by
  sorry

/-- `twistFree_trace_unit`: an upper/lower unipotent product has nonzero trace, detecting a
nontrivial scalar twist in residue characteristic two (README 4.10). -/
example {K : Type*} [Field K] [CharP K 2] (ω : K) (hω : ω ≠ 0) (a : K) :
    let ωA : DualNumber K := TrivSqZeroExt.inl ω
    let M : Matrix (Fin 2) (Fin 2) (DualNumber K) :=
      !![1, 1; 0, 1] * !![1, 0; ωA, 1]
    M.trace = ωA ∧
      (((1 + TrivSqZeroExt.inr a : DualNumber K) • M).trace = M.trace ↔ a = 0) := by
  sorry

/-- `twistFree_A5`: a scalar twist of the identity matrix is conjugate to the identity only
when its first-order character value is trivial (README 4.10). -/
example (a : k) :
    (1 + TrivSqZeroExt.inr a : DualNumber k) •
      (1 : Matrix (Fin 2) (Fin 2) (DualNumber k)) = 1 ↔ a = 0 := by
  constructor
  · intro h
    have hs := congrArg (fun M : Matrix (Fin 2) (Fin 2) (DualNumber k) ↦
      TrivSqZeroExt.snd (M 0 0)) h
    simpa using hs
  · intro h
    subst h
    simp

/-- `trace_subring_S3`: strict first-order conjugation changes the three-cycle matrix while
preserving its trace (README 6.2). -/
example :
    let ε : DualNumber (ZMod 5) := TrivSqZeroExt.inr 1
    let C : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![0, -1; 1, -1]
    let b : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![1, ε; 0, 1]
    let bi : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![1, -ε; 0, 1]
    b * bi = 1 ∧ b * C * bi ≠ C ∧ (b * C * bi).trace = C.trace ∧ C.trace = -1 := by
  let : DecidableEq (DualNumber (ZMod 5)) := inferInstanceAs (DecidableEq (ZMod 5 × ZMod 5))
  decide

/-- `fixedDet_cyclic_four`: the scalar character coordinates have determinant-one equation
`x+y+xy=0`, allowing distinct reciprocal eigencharacters (README 4.8). -/
example {R : Type*} [CommRing R] (x y : R) :
    (!![1 + x, 0; 0, 1 + y]).det - 1 = x + y + x * y := by
  simp [Matrix.det_fin_two]
  ring

/-- `twist_no_root_p2`: even modulo four no element squares to the nontrivial quadratic unit;
a square root over the 2-adic integers would reduce to one here (README 4.4). -/
example : ∀ v : ZMod 4, v ^ 2 ≠ -1 := by
  decide

/-- `twist_not_fixed_det_odd`: a nontrivial residue-one scalar over the characteristic-three
dual numbers has nontrivial square (README 4.9). -/
example :
    let ε : DualNumber (ZMod 3) := TrivSqZeroExt.inr 1
    1 + ε ≠ 1 ∧ (1 + ε) ^ 2 ≠ 1 := by
  let : DecidableEq (DualNumber (ZMod 3)) := inferInstanceAs (DecidableEq (ZMod 3 × ZMod 3))
  decide

/-- `twist_map_not_injective_p2`: a nontrivial residue-one character value has square one over
the characteristic-two dual numbers (README 4.8). -/
example :
    let ε : DualNumber (ZMod 2) := TrivSqZeroExt.inr 1
    1 + ε ≠ 1 ∧ (1 + ε) ^ 2 = 1 := by
  let : DecidableEq (DualNumber (ZMod 2)) := inferInstanceAs (DecidableEq (ZMod 2 × ZMod 2))
  decide

/-- Rank three in residue characteristic two is trace split, but is excluded from the odd-prime
arithmetic comparison (README 3.6). -/
example : ¬ (2 : ℕ) ∣ 3 ∧ ¬ (2 : ℕ) > 2 := by
  decide

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

/-- One frame is killed by the scalar change. -/
example : Module.finrank k (scalarFrameCokernel k 1) = 0 := by
  unfold scalarFrameCokernel
  have hi : Function.Injective
      (LinearMap.pi fun _ : Fin 1 ↦ (LinearMap.id : k →ₗ[k] k)) :=
    fun _ _ h ↦ congrFun h 0
  have hr := LinearMap.finrank_range_of_inj hi
  have hd := (LinearMap.range
    (LinearMap.pi fun _ : Fin 1 ↦ (LinearMap.id : k →ₗ[k] k))).finrank_quotient_add_finrank
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

/-- For the mapping fibre of the identity between two-term identity complexes,
`d⁰(x) = (x,x)` and `d¹(a,b) = a-b`; replacing the minus by a plus fails in characteristic three. -/
example :
    let d₀ : ZMod 3 → ZMod 3 × ZMod 3 := fun x ↦ (x, x)
    let d₁ : ZMod 3 × ZMod 3 → ZMod 3 := fun x ↦ x.1 - x.2
    d₁ (d₀ 1) = 0 ∧ (d₀ 1).1 + (d₀ 1).2 = 2 := by
  decide

/-- A nonzero nilpotent direction survives in the coefficient algebra, while every map to a
reduced coefficient ring kills it (README 6.3). -/
example :
    let ε : DualNumber (ZMod 3) := ⟨0, 1⟩
    ε ≠ 0 ∧ ε ^ 2 = 0 := by
  change (TrivSqZeroExt.inr (1 : ZMod 3) : DualNumber (ZMod 3)) ≠ 0 ∧
    (TrivSqZeroExt.inr (1 : ZMod 3) : DualNumber (ZMod 3)) ^ 2 = 0
  constructor
  · intro h
    have hs := congrArg TrivSqZeroExt.snd h
    exact one_ne_zero hs
  · rw [pow_two, TrivSqZeroExt.inr_mul_inr]

/-- `R04.4/diagonalizable-groups`, the case `p = 2`, `m = 1`: `(1 + X)² − 1 ∈ (2, X)²`. -/
example : ((1 + Polynomial.X) ^ 2 - 1 : Polynomial ℤ) ∈
    (Ideal.span {(2 : Polynomial ℤ), Polynomial.X}) ^ 2 := by
  have h2 : (2 : Polynomial ℤ) ∈ Ideal.span {(2 : Polynomial ℤ), Polynomial.X} :=
    Ideal.subset_span (by simp)
  have hX : (Polynomial.X : Polynomial ℤ) ∈ Ideal.span {(2 : Polynomial ℤ), Polynomial.X} :=
    Ideal.subset_span (by simp)
  have : ((1 + Polynomial.X) ^ 2 - 1 : Polynomial ℤ) =
      2 * Polynomial.X + Polynomial.X * Polynomial.X := by ring
  rw [this, pow_two]
  exact Ideal.add_mem _ (Ideal.mul_mem_mul h2 hX) (Ideal.mul_mem_mul hX hX)

/-- `R04.4/twisting-action`: twisting a rank-two lift by `c` multiplies determinants by `c²`. -/
example {R : Type*} [CommRing R] (c : R) (M : Matrix (Fin 2) (Fin 2) R) :
    (c • M).det = c ^ 2 * M.det := by
  simp

/-- `R04.4/twist-action-free`, the dihedral self-twist: in the induced basis, conjugation by
`diag(1, −1)` negates the image of an element outside the index-two subgroup ... -/
example {R : Type*} [CommRing R] (a : R) :
    !![1, 0; 0, -1] * !![0, a; 1, 0] * !![1, 0; 0, -1] = -!![(0 : R), a; 1, 0] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- ... and fixes the diagonal image of an element of the index-two subgroup. -/
example {R : Type*} [CommRing R] (x y : R) :
    !![1, 0; 0, -1] * !![x, 0; 0, y] * !![1, 0; 0, -1] = !![x, 0; 0, y] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- The induced self-twist conjugator reduces to the identity modulo two, but is nontrivial
modulo four; residue characteristic two is essential for a strict self-twist. -/
example :
    !![(1 : ZMod 2), 0; 0, -1] = 1 ∧
    !![(1 : ZMod 4), 0; 0, -1] ≠ 1 := by
  decide

/-- `R04.5/image-hypotheses`: the `S₃` representation over `𝔽₅` has a nonzero trace-zero sign line
`k·J` in its adjoint (`J = C − C²`): the three-cycle fixes `J` and the transposition negates it. -/
example :
    let C : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, -1; 1, -1]
    let S : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, 1; 1, 0]
    let J := C - C ^ 2
    J.trace = 0 ∧ J ≠ 0 ∧ C * J * C ^ 2 = J ∧ S * J * S = -J := by
  decide

/-- The sign line is proper in `ad⁰`: `diag(1, −1)` is not a multiple of `J`. -/
example :
    let C : Matrix (Fin 2) (Fin 2) (ZMod 5) := !![0, -1; 1, -1]
    !![(1 : ZMod 5), 0; 0, -1] ∉ Submodule.span (ZMod 5) {C - C ^ 2} := by
  intro C
  rw [Submodule.mem_span_singleton]
  decide

/-- `1, C, S, CS` span `M₂(𝔽₅)`: the residual representation is absolutely irreducible. -/
example : (!![(1 : ZMod 5), 0, 0, 1; 0, -1, 1, -1; 0, 1, 1, 0; -1, 0, -1, 1]).det ≠ 0 := by
  decide

/-- `R04.5/dyadic-linear-disjointness`: `R₄(X) = R₃(2X² − 1)` with `R₃ = 2X² − 1` is `T₄`. -/
example : (2 * (2 * Polynomial.X ^ 2 - 1) ^ 2 - 1 : Polynomial ℤ) =
    8 * Polynomial.X ^ 4 - 8 * Polynomial.X ^ 2 + 1 := by
  ring

/-- `R04.5/dyadic-taylor-wiles-primes`: scalars are trace-free in characteristic two. -/
example : (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)).trace = 0 := by
  decide

/-- `R04.5/taylor-wiles-inertia-action`: `Frob_v = diag(α, β)` acts on `E₁₂` by `α/β`. -/
example {K : Type*} [Field K] (α β : K) :
    !![α, 0; 0, β] * !![0, 1; 0, 0] * !![α⁻¹, 0; 0, β⁻¹] = (α * β⁻¹) • !![(0 : K), 1; 0, 0] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- `R04.5/chebotarev-selmer-selection`: independent coordinate localizations have zero joint
kernel ... -/
example : Function.Injective (fun x : Fin 2 → ZMod 3 ↦ (x 0, x 1)) := by
  intro x y h
  funext i
  fin_cases i
  · exact congrArg Prod.fst h
  · exact congrArg Prod.snd h

/-- ... while repeating one localization cannot kill a two-dimensional space. -/
example : ¬ Function.Injective (fun x : Fin 2 → ZMod 3 ↦ (x 0, x 0)) := by
  intro h
  have he := h (a₁ := fun _ ↦ 0) (a₂ := fun i ↦ if i = 0 then 0 else 1) (by simp)
  have bad := congrFun he 1
  norm_num at bad

/-- `R04.5/taylor-wiles-generator-count` and `R04.6/patching-numerology`, odd `p`:
`h + (4|S| − 1) − 3|S| = h + |S| − 1`. -/
example (h S : ℤ) : h + (4 * S - 1) - 3 * S = h + S - 1 := by
  ring

/-- `p = 2`: with `t = 2 − |S| + h`, `h + j + t − d = 2h + 1`. -/
example (h S : ℤ) : h + (4 * S - 1) + (2 - S + h) - 3 * S = 2 * h + 1 := by
  ring

/-- `R04.6/kw-deformation-data`: `3|S_f| + [F : ℚ] + 2[F : ℚ] = 3(|S_f| + [F : ℚ])`. -/
example (Sf d : ℕ) : 3 * Sf + d + 2 * d = 3 * (Sf + d) := by
  ring

/-- The CM example `ℚ(i)/ℚ`: `X² + 1` splits with distinct roots modulo five and has a repeated
root modulo two, exhibiting the primes used in README 8.1. -/
example :
    (Polynomial.X ^ 2 + 1 : Polynomial (ZMod 5)) =
      (Polynomial.X - 2) * (Polynomial.X + 2) ∧
    (Polynomial.X ^ 2 + 1 : Polynomial (ZMod 2)) = (Polynomial.X + 1) ^ 2 := by
  constructor
  · have h5 : (5 : Polynomial (ZMod 5)) = 0 := CharP.cast_eq_zero _ 5
    linear_combination h5
  · have h2 : (2 : Polynomial (ZMod 2)) = 0 := CharP.cast_eq_zero _ 2
    linear_combination -Polynomial.X * h2

/-- `G7/polarized-tangent-obstruction`: for `p = n = 3` the identity has trace `0`. -/
example : Matrix.trace (1 : Matrix (Fin 3) (Fin 3) (ZMod 3)) = 0 := by
  rw [Matrix.trace_one, Fintype.card_fin]
  decide

/-- `G7/enormous-taylor-wiles-presentation`: the count `qn − n²[F⁺ : ℚ]` is formed in `ℤ`. -/
example (q n f : ℤ) : -(n ^ 2 * f) + q * n = q * n - n ^ 2 * f := by
  ring

/-- `bigImage_GL2_F5`: the full general linear group contains the determinant-one subgroup
(README 5.2). -/
example : (Matrix.GeneralLinearGroup.det : GL (Fin 2) (ZMod 5) →* (ZMod 5)ˣ).ker ≤
    (⊤ : Subgroup (GL (Fin 2) (ZMod 5))) := le_top

/-- `bigImage_Borel_fails`: a lower transvection of determinant one witnesses failure of
containment in the upper triangular subgroup (README 5.2). -/
example :
    ∃ g : GL (Fin 2) (ZMod 5),
      Matrix.GeneralLinearGroup.det g = 1 ∧
      (g : Matrix (Fin 2) (Fin 2) (ZMod 5)) = !![1, 0; 1, 1] ∧
      (g : Matrix (Fin 2) (Fin 2) (ZMod 5)) 1 0 ≠ 0 := by
  sorry

/-- `bigImage_S3_fails`: the six-element subgroup generated by the standard `S₃` matrices
cannot contain the 120-element determinant-one subgroup (README 5.2). -/
example :
    let C : GL (Fin 2) (ZMod 5) :=
      ⟨!![0, -1; 1, -1], !![-1, 1; -1, 0], by decide, by decide⟩
    let S : GL (Fin 2) (ZMod 5) :=
      ⟨!![0, 1; 1, 0], !![0, 1; 1, 0], by decide, by decide⟩
    let H := Subgroup.closure ({C, S} : Set (GL (Fin 2) (ZMod 5)))
    let SL := (Matrix.GeneralLinearGroup.det : GL (Fin 2) (ZMod 5) →* (ZMod 5)ˣ).ker
    Nat.card H = 6 ∧ Nat.card SL = 120 ∧ ¬ SL ≤ H := by
  sorry

/-- `framingVars_rational`: the two KW frames over `ℚ` leave seven coordinates after the
single common scalar normalization (README 6.2). -/
example : (4 * 2 - 1 : ℤ) = 7 ∧ (3 + 4 : ℤ) = 7 := by
  decide

/-- `local_TW_odd`: reciprocal inertia characters both ramify and satisfy the tame relation
at residue cardinality eleven (README preliminary rank-two construction). -/
example :
    let ε : DualNumber (ZMod 5) := TrivSqZeroExt.inr 1
    let Φ : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![1, 0; 0, -1]
    let T : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![1 + ε, 0; 0, 1 - ε]
    Φ * T * Φ = T ^ 11 ∧ T.det = 1 ∧ T 0 0 ≠ 1 ∧ T 1 1 ≠ 1 := by
  sorry

/-- `local_TW_dyadic`: distinct cubic residual eigenvalues allow equal reciprocal,
nontrivial inertia characters in characteristic two (README preliminary local construction). -/
example {K : Type*} [Field K] [CharP K 2] (ω : K) (hω : ω ^ 3 = 1) (hne : ω ≠ 1) :
    let w : DualNumber K := TrivSqZeroExt.inl ω
    let ε : DualNumber K := TrivSqZeroExt.inr 1
    let Φ : Matrix (Fin 2) (Fin 2) (DualNumber K) := !![w, 0; 0, w ^ 2]
    let T := (1 + ε) • (1 : Matrix (Fin 2) (Fin 2) (DualNumber K))
    ω ≠ ω ^ 2 ∧ Φ * T = T ^ 7 * Φ ∧ T.det = 1 ∧ T ≠ 1 := by
  sorry

/-- `local_TW_repeated_fails`: repeated Frobenius eigenvalues admit non-diagonalizable
first-order nilpotent inertia (README preliminary local construction). -/
example :
    let ε : DualNumber (ZMod 5) := TrivSqZeroExt.inr 1
    let T : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![1, ε; 0, 1]
    T ^ 11 = T ∧
      ¬ ∃ b : GL (Fin 2) (DualNumber (ZMod 5)), ∃ d : Fin 2 → DualNumber (ZMod 5),
        (b : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5))) * T *
          (b⁻¹ : GL (Fin 2) (DualNumber (ZMod 5))) = Matrix.diagonal d := by
  sorry

/-- `rankn_TW_independent_inertia`: unrestricted ACC lifts permit two ramified characters
with ramified determinant, excluded by either restrictive local condition (README 8.5). -/
example :
    let ε : DualNumber (ZMod 5) := TrivSqZeroExt.inr 1
    let Φ : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)) := !![1, 0; 0, -1]
    let T := (1 + ε) • (1 : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 5)))
    Φ * T * Φ = T ^ 11 ∧ T.det = 1 + 2 * ε ∧ T.det ≠ 1 ∧
      T 0 0 ≠ 1 ∧ T 1 1 ≠ 1 := by
  sorry

/-- `rankn_TW_reciprocity`: order-five character values differ from their inverses,
so changing reciprocity requires factorwise inversion (README 8.5). -/
example {K : Type*} [Field K] (ζ : K) (hζ : orderOf ζ = 5) : ζ ≠ ζ⁻¹ := by
  sorry

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
