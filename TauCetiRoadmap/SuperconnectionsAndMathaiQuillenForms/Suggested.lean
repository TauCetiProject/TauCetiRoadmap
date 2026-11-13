module

public import Mathlib
public import TauCeti.Algebra.Homology.DG.Algebra.Defs

/-!
# Superconnections and Mathai–Quillen forms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib, each with `sorry`,
together with the definitions their statements need, all with real bodies on native carriers.
The API around each target, the special cases and the Checks stay in the README.

Headlines stated, with their README targets:

* 1.1 `isSuperCommutative_exteriorAlgebra`;
  1.2 `superMatrixEquiv_mul` and `isSuperHomogeneous_superMatrixEquiv_tmul`;
  1.3 `superTrace_superMul_comm`;
* 2.1 `exists_superDGA_of_isDGAlgebra`; 2.2 `bianchi`; 2.3 `isClosed_superTrace_superPow`;
  2.4 `transgression`; 2.5 `trace_exp_sub_trace_exp`;
* 3.1 `berezin_map`; 3.2 `factorial_mul_pfaffian`, `pfaffian_sq` and
  `pfaffian_mul_mul_transpose`;
* 6.1 `isUnit_one_sub_of_skew`, `cayley_mem_unitaryGroup` and `grading_mul_cayley_mul_grading`.

The theorems `commute_ι_mul_ι_ι` and `commute_pairForm` are proved: the product over a set of
pairs in the definition of `skewFormDivPow` needs them. The instance `blockGradedAlgebra` is proved
with its decomposition `blockDecompose`, so that `superMatrixEquiv` is defined on Mathlib's graded
tensor product.

Not stated: README 3.3 (the Gaussian density has integral `1`), which is Mathlib's
`GaussianFourier.integral_rexp_neg_mul_sq_norm` at `b = 1/2`.
Not stated: Layers 4 and 5 (superconnections on ℤ/2-graded smooth bundles, their Chern character
forms and the character of `∇ + tX`, the Berezin integral along the fibres of a Euclidean bundle,
the Mathai–Quillen Euler and Thom forms and their localization). Tau Ceti has smooth
bundle-valued forms (`TauCeti.SmoothBundleForm`, with `TauCeti.SmoothBundleForm.wedgeWith`) and de
Rham cohomology (`TauCeti.deRhamCohomology`); the headlines lack, at the pins, the exterior
covariant derivative of a connection on `TauCeti.SmoothBundleForm`, the ℤ/2-graded algebra
`Ω(M, End E)` with its exponential, and the Berezin integral along the fibres of a vector bundle
with the fibre integration of forms; those are SmoothBundlesConnections' (B4.1) and
CharacteristicClasses' (C2, item 5). Not stated: README 6.2 (the invariant character forms on
Grassmannians and unitary groups), lacking the manifold structures of the space of self-adjoint
involutions of `ℂⁿ` and of `Matrix.unitaryGroup` at the pins. The algebraic Layers 1–3 and 6.1
are the local models of those statements and are stated in full.
-/

@[expose] public section

open Matrix
open scoped TensorProduct

namespace TauCetiRoadmap.SuperconnectionsAndMathaiQuillenForms

variable {R : Type*} [CommRing R] {A : Type*} [Ring A] [Algebra R A]

/-! ## Layer 1: superalgebras, supermatrices and the supertrace -/

/-- **1.1.** A `ZMod 2`-graded algebra is supercommutative when homogeneous elements of
parities `i` and `j` commute up to the Koszul sign `(-1) ^ (i * j)`. -/
def IsSuperCommutative (𝒜 : ZMod 2 → Submodule R A) : Prop :=
  ∀ (i j : ZMod 2) (a b : A), a ∈ 𝒜 i → b ∈ 𝒜 j →
    a * b = (-1 : R) ^ (i.val * j.val) • (b * a)

/-- **1.1.** The exterior algebra, graded by the parity of the degree (Mathlib's
`CliffordAlgebra.evenOdd` of the zero quadratic form), is supercommutative. -/
theorem isSuperCommutative_exteriorAlgebra (M : Type*) [AddCommGroup M] [Module R M] :
    IsSuperCommutative (CliffordAlgebra.evenOdd (0 : QuadraticForm R M)) := by
  sorry

/-- **1.1.** The parity involution `a₀ + a₁ ↦ a₀ - a₁` of a `ZMod 2`-graded algebra. -/
noncomputable def parityInv (𝒜 : ZMod 2 → Submodule R A) [GradedAlgebra 𝒜] (a : A) : A :=
  (DirectSum.decompose 𝒜 a 0 : A) - (DirectSum.decompose 𝒜 a 1 : A)

/-- **1.1.** The `k`-th power of the parity involution, for `k : ZMod 2`. -/
noncomputable def parityPow (𝒜 : ZMod 2 → Submodule R A) [GradedAlgebra 𝒜] (k : ZMod 2)
    (a : A) : A :=
  if k = 0 then a else parityInv 𝒜 a

/-- **1.2.** The parity of a basis vector of `R^(m|n)`: `0` on `m`, `1` on `n`. -/
def sPar {m n : Type*} : m ⊕ n → ZMod 2 :=
  Sum.elim (fun _ => 0) (fun _ => 1)

variable {m n : Type*}

variable (R m n) in
/-- **1.2.** The block-parity grading of `Matrix (m ⊕ n) (m ⊕ n) R`, the grading of
`End(R^(m|n))`: the part of parity `i` consists of the matrices vanishing off the entries `(k, l)`
with `|k| + |l| = i`. -/
def blockGrading (i : ZMod 2) : Submodule R (Matrix (m ⊕ n) (m ⊕ n) R) where
  carrier := {X | ∀ k l, sPar k + sPar l ≠ i → X k l = 0}
  zero_mem' := fun _ _ _ => rfl
  add_mem' := fun hX hY k l h => by simp [hX k l h, hY k l h]
  smul_mem' := fun c X hX k l h => by simp [hX k l h]

/-- **1.2.** The block of parity `i` of a matrix: its entries `(k, l)` with `|k| + |l| = i`. -/
def blockPart (i : ZMod 2) (X : Matrix (m ⊕ n) (m ⊕ n) R) : Matrix (m ⊕ n) (m ⊕ n) R :=
  fun k l => if sPar k + sPar l = i then X k l else 0

/-- **1.2.** The block of parity `i` lies in `blockGrading R m n i`. -/
theorem blockPart_mem (i : ZMod 2) (X : Matrix (m ⊕ n) (m ⊕ n) R) :
    blockPart i X ∈ blockGrading R m n i := fun _ _ h => by simp [blockPart, h]

/-- **1.2.** A matrix is the sum of its two blocks. -/
theorem blockPart_zero_add_blockPart_one (X : Matrix (m ⊕ n) (m ⊕ n) R) :
    blockPart 0 X + blockPart 1 X = X := by
  have h01 : ∀ a : ZMod 2, a = 0 ∨ a = 1 := by decide
  ext k l
  simp only [blockPart, Matrix.add_apply]
  rcases h01 (sPar k + sPar l) with h | h <;> simp [h]

/-- **1.2.** The blocks of a matrix of block parity `i`. -/
theorem blockPart_of_mem {i j : ZMod 2} {X : Matrix (m ⊕ n) (m ⊕ n) R}
    (hX : X ∈ blockGrading R m n i) : blockPart j X = if i = j then X else 0 := by
  by_cases hij : i = j
  · subst hij
    rw [ite_eq_left rfl]
    ext k l
    simp only [blockPart]
    split_ifs with hk
    · rfl
    · exact (hX k l hk).symm
  · rw [ite_eq_right hij]
    ext k l
    simp only [blockPart, Matrix.zero_apply]
    split_ifs with hk
    · exact hX k l (by rw [hk]; exact fun h => hij h.symm)
    · rfl

/-- **1.2.** The decomposition of a matrix into its two blocks. -/
def blockDecompose :
    Matrix (m ⊕ n) (m ⊕ n) R →+ DirectSum (ZMod 2) (fun i => blockGrading R m n i) where
  toFun X := DirectSum.of (fun i => blockGrading R m n i) 0 ⟨_, blockPart_mem 0 X⟩ +
    DirectSum.of (fun i => blockGrading R m n i) 1 ⟨_, blockPart_mem 1 X⟩
  map_zero' := by
    have h : ∀ i, (⟨blockPart i (0 : Matrix (m ⊕ n) (m ⊕ n) R), blockPart_mem i 0⟩ :
        blockGrading R m n i) = 0 := fun i => by
      ext k l; simp [blockPart]
    rw [h, h, map_zero, map_zero, add_zero]
  map_add' X Y := by
    have h : ∀ i, (⟨blockPart i (X + Y), blockPart_mem i (X + Y)⟩ : blockGrading R m n i) =
        ⟨blockPart i X, blockPart_mem i X⟩ + ⟨blockPart i Y, blockPart_mem i Y⟩ := fun i => by
      ext k l; simp only [blockPart, Submodule.coe_add, Matrix.add_apply]; split_ifs <;> simp
    rw [h, h, map_add, map_add]; abel

variable [Fintype m] [Fintype n] [DecidableEq m] [DecidableEq n]

/-- **1.2.** The product of `A ⊗̂ End(R^(m|n))`, written on matrices with entries in `A`: the
matrix `X` represents `∑ X k l ⊗ E k l`, and `(a ⊗ E k j) (b ⊗ E j l)` is
`(-1) ^ (|b| (|k| + |j|)) a b ⊗ E k l` (Convention 1). -/
noncomputable def superMul (𝒜 : ZMod 2 → Submodule R A) [GradedAlgebra 𝒜]
    (X Y : Matrix (m ⊕ n) (m ⊕ n) A) : Matrix (m ⊕ n) (m ⊕ n) A :=
  fun k l => ∑ j, X k j * parityPow 𝒜 (sPar k + sPar j) (Y j l)

/-- **1.2.** A supermatrix is homogeneous of parity `p` when its `(k, l)` entry has parity
`p + |k| + |l|`. -/
def IsSuperHomogeneous (𝒜 : ZMod 2 → Submodule R A) (p : ZMod 2)
    (X : Matrix (m ⊕ n) (m ⊕ n) A) : Prop :=
  ∀ k l, X k l ∈ 𝒜 (p + sPar k + sPar l)

/-- **1.2.** The block-parity grading makes `Matrix (m ⊕ n) (m ⊕ n) R` a `ZMod 2`-graded
algebra. -/
instance blockGradedAlgebra : GradedAlgebra (blockGrading R m n) where
  one_mem := fun k l h => by
    rcases eq_or_ne k l with rfl | hkl
    · exact absurd (by generalize sPar k = a; revert a; decide) h
    · exact Matrix.one_apply_ne hkl
  mul_mem := fun i j X Y hX hY k l h => by
    rw [Matrix.mul_apply]
    refine Finset.sum_eq_zero fun p _ => ?_
    by_cases h1 : sPar k + sPar p = i
    · have h2 : sPar p + sPar l ≠ j := fun h2 => h (by
        rw [← h1, ← h2]
        generalize sPar k = a; generalize sPar p = b; generalize sPar l = c
        revert a b c; decide)
      rw [hY p l h2, mul_zero]
    · rw [hX k p h1, zero_mul]
  decompose' := blockDecompose
  left_inv X := by
    simp [blockDecompose, blockPart_zero_add_blockPart_one]
  right_inv x := by
    induction x using DirectSum.induction_on with
    | zero => simp
    | of i y =>
      simp only [blockDecompose, AddMonoidHom.coe_mk, ZeroHom.coe_mk,
        DirectSum.coeAddMonoidHom_of]
      have h01 : ∀ a : ZMod 2, a = 0 ∨ a = 1 := by decide
      have hy : ∀ j, (⟨blockPart j (y : Matrix (m ⊕ n) (m ⊕ n) R),
          blockPart_mem j (y : Matrix (m ⊕ n) (m ⊕ n) R)⟩ : blockGrading R m n j) =
          if h : i = j then h ▸ y else 0 := fun j => by
        split_ifs with hij
        · subst hij
          exact Subtype.ext (by
            show blockPart i (y : Matrix (m ⊕ n) (m ⊕ n) R) = y
            rw [blockPart_of_mem y.2, ite_eq_left rfl])
        · exact Subtype.ext (by
            show blockPart j (y : Matrix (m ⊕ n) (m ⊕ n) R) = 0
            rw [blockPart_of_mem y.2, ite_eq_right hij])
      rw [hy, hy]
      rcases h01 i with rfl | rfl <;> simp
    | add x y hx hy => rw [map_add, map_add, hx, hy]

/-- **1.2.** The `R`-linear equivalence between the super tensor product
`A ⊗̂ End(R^(m|n)) = 𝒜 ᵍ⊗[R] blockGrading R m n` and supermatrices, `a ᵍ⊗ₜ E k l ↦ a E k l`. -/
noncomputable def superMatrixEquiv (𝒜 : ZMod 2 → Submodule R A) [GradedAlgebra 𝒜] :
    (𝒜 ᵍ⊗[R] blockGrading R m n) ≃ₗ[R] Matrix (m ⊕ n) (m ⊕ n) A :=
  (GradedTensorProduct.of R 𝒜 (blockGrading R m n)).symm ≪≫ₗ
    (matrixEquivTensor (m ⊕ n) R A).symm.toLinearEquiv

/-- **1.2.** `superMatrixEquiv` carries the product of the graded tensor product to the
Koszul-signed product `superMul` of supermatrices. -/
theorem superMatrixEquiv_mul (𝒜 : ZMod 2 → Submodule R A) [GradedAlgebra 𝒜]
    (x y : 𝒜 ᵍ⊗[R] blockGrading R m n) :
    superMatrixEquiv 𝒜 (x * y) =
      superMul 𝒜 (superMatrixEquiv 𝒜 x) (superMatrixEquiv 𝒜 y) := by
  sorry

/-- **1.2.** `superMatrixEquiv` carries `a ᵍ⊗ₜ b`, with `a` of parity `i` and `b` of block parity
`j`, to a supermatrix of parity `i + j`. -/
theorem isSuperHomogeneous_superMatrixEquiv_tmul (𝒜 : ZMod 2 → Submodule R A) [GradedAlgebra 𝒜]
    {i j : ZMod 2} {a : A} (ha : a ∈ 𝒜 i) {b : Matrix (m ⊕ n) (m ⊕ n) R}
    (hb : b ∈ blockGrading R m n j) :
    IsSuperHomogeneous 𝒜 (i + j) (superMatrixEquiv 𝒜 (a ᵍ⊗ₜ[R] b)) := by
  sorry

/-- **1.3.** The supertrace `A ⊗̂ End(R^(m|n)) → A`, `a ⊗ u ↦ a str(u)`: the even diagonal
block minus the odd one. -/
def superTrace (X : Matrix (m ⊕ n) (m ⊕ n) A) : A :=
  ∑ i, X (Sum.inl i) (Sum.inl i) - ∑ j, X (Sum.inr j) (Sum.inr j)

/-- **1.3.** The supertrace is a graded trace: on a supercommutative algebra,
`str (X Y) = (-1) ^ (p q) str (Y X)` for `X` of parity `p` and `Y` of parity `q`; equivalently it
vanishes on supercommutators. -/
theorem superTrace_superMul_comm (𝒜 : ZMod 2 → Submodule R A) [GradedAlgebra 𝒜]
    (h𝒜 : IsSuperCommutative 𝒜) {p q : ZMod 2} {X Y : Matrix (m ⊕ n) (m ⊕ n) A}
    (hX : IsSuperHomogeneous 𝒜 p X) (hY : IsSuperHomogeneous 𝒜 q Y) :
    superTrace (superMul 𝒜 X Y) = (-1 : R) ^ (p.val * q.val) • superTrace (superMul 𝒜 Y X) := by
  sorry

/-! ## Layer 2: superconnections in Quillen's algebraic model -/

/-- **2.1.** A differential graded superalgebra, the `ZMod 2`-graded notion of a differential graded
algebra: an odd `R`-linear differential `d` with `d ∘ d = 0` and the graded Leibniz rule
`d (a b) = d a b + σ(a) d b`, where `σ` is the parity involution. -/
structure SuperDGA (𝒜 : ZMod 2 → Submodule R A) [GradedAlgebra 𝒜] where
  /-- The differential. -/
  d : A →ₗ[R] A
  /-- The differential is odd. -/
  d_mem : ∀ (i : ZMod 2) (a : A), a ∈ 𝒜 i → d a ∈ 𝒜 (i + 1)
  /-- The graded Leibniz rule. -/
  d_mul : ∀ a b : A, d (a * b) = d a * b + parityInv 𝒜 a * d b
  /-- The differential squares to zero. -/
  d_d : ∀ a : A, d (d a) = 0

/-- **2.1.** The parity regrading `i ↦ ⨆_(p ≡ i mod 2) 𝒜 p` of a `ℤ`-grading. -/
def parityGrading (𝒜 : ℤ → Submodule R A) (i : ZMod 2) : Submodule R A :=
  ⨆ (p : ℤ) (_ : (p : ZMod 2) = i), 𝒜 p

/-- **2.1.** A `ℤ`-graded differential graded algebra in Tau Ceti's sense is a differential graded
superalgebra on its parity regrading, with the same differential. -/
theorem exists_superDGA_of_isDGAlgebra {𝒜 : ℤ → Submodule R A} [GradedAlgebra 𝒜]
    [GradedAlgebra (parityGrading 𝒜)] {d : A →ₗ[R] A} (h : TauCeti.IsDGAlgebra 𝒜 d) :
    ∃ δ : SuperDGA (parityGrading 𝒜), δ.d = d := by
  sorry

variable {𝒜 : ZMod 2 → Submodule R A} [GradedAlgebra 𝒜]

/-- **2.1.** The differential `d ⊗ 1` of `A ⊗̂ End(R^(m|n))`, entrywise. -/
def dMat (δ : SuperDGA 𝒜) (X : Matrix (m ⊕ n) (m ⊕ n) A) : Matrix (m ⊕ n) (m ⊕ n) A :=
  X.map δ.d

/-- **2.1.** The supercommutator `[X, Y] = X Y - (-1) ^ (p q) Y X` of supermatrices of parities
`p` and `q`. -/
noncomputable def superComm (𝒜 : ZMod 2 → Submodule R A) [GradedAlgebra 𝒜] (p q : ZMod 2)
    (X Y : Matrix (m ⊕ n) (m ⊕ n) A) : Matrix (m ⊕ n) (m ⊕ n) A :=
  superMul 𝒜 X Y - (-1 : R) ^ (p.val * q.val) • superMul 𝒜 Y X

/-- **2.2.** The curvature `𝔸² = dΘ + Θ²` of the superconnection `𝔸 = d + Θ` on the trivial
super bundle `A ⊗ R^(m|n)`, for an odd supermatrix of forms `Θ`. -/
noncomputable def curvature (δ : SuperDGA 𝒜) (Θ : Matrix (m ⊕ n) (m ⊕ n) A) :
    Matrix (m ⊕ n) (m ⊕ n) A :=
  dMat δ Θ + superMul 𝒜 Θ Θ

/-- **2.2.** The covariant derivative `[𝔸, X] = dX + [Θ, X]` of a supermatrix `X` of parity `p`. -/
noncomputable def covD (δ : SuperDGA 𝒜) (Θ : Matrix (m ⊕ n) (m ⊕ n) A) (p : ZMod 2)
    (X : Matrix (m ⊕ n) (m ⊕ n) A) : Matrix (m ⊕ n) (m ⊕ n) A :=
  dMat δ X + superComm 𝒜 1 p Θ X

/-- **2.3.** Powers for `superMul`. -/
noncomputable def superPow (𝒜 : ZMod 2 → Submodule R A) [GradedAlgebra 𝒜]
    (F : Matrix (m ⊕ n) (m ⊕ n) A) : ℕ → Matrix (m ⊕ n) (m ⊕ n) A
  | 0 => 1
  | k + 1 => superMul 𝒜 (superPow 𝒜 F k) F

/-- **2.2.** The Bianchi identity `[𝔸, 𝔸²] = 0` for an odd `Θ`. -/
theorem bianchi (δ : SuperDGA 𝒜) {Θ : Matrix (m ⊕ n) (m ⊕ n) A}
    (hΘ : IsSuperHomogeneous 𝒜 1 Θ) : covD δ Θ 0 (curvature δ Θ) = 0 := by
  sorry

/-- **2.3.** Quillen's closedness: on a supercommutative differential graded superalgebra every
component `str (F ^ k)` of the
Chern character of `𝔸 = d + Θ`, `F = 𝔸²`, is closed. -/
theorem isClosed_superTrace_superPow (δ : SuperDGA 𝒜) (h𝒜 : IsSuperCommutative 𝒜)
    {Θ : Matrix (m ⊕ n) (m ⊕ n) A} (hΘ : IsSuperHomogeneous 𝒜 1 Θ) (k : ℕ) :
    δ.d (superTrace (superPow 𝒜 (curvature δ Θ) k)) = 0 := by
  sorry

/-- **2.4.** The transgression formula. For an even derivation `∂` of `A` that preserves the
grading and commutes with `d` (the derivative along a parameter),
`∂ str (F ^ (k + 1)) = (k + 1) d str ((∂Θ) F ^ k)`, where `F` is the curvature of `d + Θ`. -/
theorem transgression (δ : SuperDGA 𝒜) (h𝒜 : IsSuperCommutative 𝒜) (D : A →ₗ[R] A)
    (hD_mul : ∀ a b : A, D (a * b) = D a * b + a * D b)
    (hD_mem : ∀ (i : ZMod 2) (a : A), a ∈ 𝒜 i → D a ∈ 𝒜 i)
    (hD_d : ∀ a : A, D (δ.d a) = δ.d (D a))
    {Θ : Matrix (m ⊕ n) (m ⊕ n) A} (hΘ : IsSuperHomogeneous 𝒜 1 Θ) (k : ℕ) :
    D (superTrace (superPow 𝒜 (curvature δ Θ) (k + 1))) =
      ((k + 1 : ℕ) : R) • δ.d (superTrace (superMul 𝒜 (Θ.map D) (superPow 𝒜 (curvature δ Θ) k)))
    := by
  sorry

/-- **2.5.** The degree-zero part of Quillen's character of `d + √t X`, `X = [[0, T*], [T, 0]]`:
`tr exp(-t T* T) - tr exp(-t T T*) = m - n` for every complex `n × m` matrix `T`. -/
theorem trace_exp_sub_trace_exp (T : Matrix n m ℂ) (t : ℂ) :
    trace (NormedSpace.exp (-(t • (Tᴴ * T)))) - trace (NormedSpace.exp (-(t • (T * Tᴴ)))) =
      (Fintype.card m : ℂ) - Fintype.card n := by
  sorry

/-! ## Layer 3: the Berezin integral and the Pfaffian -/

/-- **3.1.** The Berezin integral on `Λ(Rⁿ)`: the coefficient of `e₀ ∧ ⋯ ∧ e_(n-1)` in the
top-degree component. -/
noncomputable def berezin (n : ℕ) : ExteriorAlgebra R (Fin n → R) →ₗ[R] R :=
  exteriorPower.alternatingMapLinearEquiv (Pi.basisFun R (Fin n)).det ∘ₗ
    DirectSum.component R ℕ (fun i => ⋀[R]^i (Fin n → R)) n ∘ₗ
    (DirectSum.decomposeLinearEquiv (fun i : ℕ => ⋀[R]^i (Fin n → R))).toLinearMap

/-- **3.1.** Change of variables: `∫_B (Λ f) x = det f · ∫_B x`. -/
theorem berezin_map {n : ℕ} (f : (Fin n → R) →ₗ[R] (Fin n → R))
    (x : ExteriorAlgebra R (Fin n → R)) :
    berezin n (ExteriorAlgebra.map f x) = LinearMap.det f * berezin n x := by
  sorry

section Pfaffian

variable {N : ℕ}

/-- **3.2.** The pairs `(i, j)` with `i < j` of `Fin N`. -/
def ijPairs (N : ℕ) : Finset (Fin N × Fin N) :=
  Finset.univ.filter fun p => p.1 < p.2

/-- **3.2.** The term `Σ i j eᵢ ∧ eⱼ` of the two-form of a matrix at the pair `(i, j)`. -/
noncomputable def pairForm (S : Matrix (Fin N) (Fin N) R) (p : Fin N × Fin N) :
    ExteriorAlgebra R (Fin N → R) :=
  S p.1 p.2 • (ExteriorAlgebra.ι R (Pi.single p.1 1) * ExteriorAlgebra.ι R (Pi.single p.2 1))

/-- **3.2.** In an exterior algebra a product of two generators commutes with every generator. -/
theorem commute_ι_mul_ι_ι {M : Type*} [AddCommGroup M] [Module R M] (x y z : M) :
    Commute (ExteriorAlgebra.ι R x * ExteriorAlgebra.ι R y) (ExteriorAlgebra.ι R z) := by
  have h : ∀ u v : M, ExteriorAlgebra.ι R u * ExteriorAlgebra.ι R v =
      -(ExteriorAlgebra.ι R v * ExteriorAlgebra.ι R u) := fun u v =>
    eq_neg_of_add_eq_zero_left (ExteriorAlgebra.ι_add_mul_swap u v)
  show _ * _ = _ * _
  rw [mul_assoc, h y z, mul_neg, ← mul_assoc, h x z, neg_mul, neg_neg, mul_assoc]

/-- **3.2.** The terms of a two-form commute. -/
theorem commute_pairForm (S : Matrix (Fin N) (Fin N) R) (p q : Fin N × Fin N) :
    Commute (pairForm S p) (pairForm S q) :=
  (((commute_ι_mul_ι_ι _ _ _).mul_right (commute_ι_mul_ι_ι _ _ _)).smul_left _).smul_right _

/-- **3.2.** The two-form `∑_(i<j) Σ i j eᵢ ∧ eⱼ` of a square matrix, which is `½ (·, Σ ·)` when
`Σ` is skew. -/
noncomputable def skewForm (S : Matrix (Fin N) (Fin N) R) : ExteriorAlgebra R (Fin N → R) :=
  ∑ p ∈ ijPairs N, pairForm S p

/-- **3.2.** The divided power `ω^[r]` of the two-form `ω` of `Σ`: the sum over the `r`-element
sets of pairs `i < j` of the products of their terms, which is `ω ^ r / r!` over a `ℚ`-algebra. -/
noncomputable def skewFormDivPow (S : Matrix (Fin N) (Fin N) R) (r : ℕ) :
    ExteriorAlgebra R (Fin N → R) :=
  ∑ s ∈ (ijPairs N).powersetCard r,
    s.noncommProd (pairForm S) (fun p _ q _ _ => commute_pairForm S p q)

/-- **3.2.** The Pfaffian of a `2r × 2r` matrix over a commutative ring, as the Berezin integral of
the divided power `ω^[r]` of its two-form. -/
noncomputable def pfaffian {r : ℕ} (S : Matrix (Fin (2 * r)) (Fin (2 * r)) R) : R :=
  berezin (2 * r) (skewFormDivPow S r)

/-- **3.2.** `r! Pf(Σ) = ∫_B ω ^ r`; over a `ℚ`-algebra, `Pf(Σ) = (r!)⁻¹ ∫_B ω ^ r`. -/
theorem factorial_mul_pfaffian {r : ℕ} (S : Matrix (Fin (2 * r)) (Fin (2 * r)) R) :
    (r.factorial : R) * pfaffian S = berezin (2 * r) (skewForm S ^ r) := by
  sorry

/-- **3.2.** `Pf(Σ)² = det Σ` for an alternating `Σ` (`Σᵀ = -Σ` with zero diagonal). -/
theorem pfaffian_sq {r : ℕ} {S : Matrix (Fin (2 * r)) (Fin (2 * r)) R} (hS : Sᵀ = -S)
    (hd : ∀ i, S i i = 0) : pfaffian S ^ 2 = S.det := by
  sorry

/-- **3.2.** `Pf(B Σ Bᵀ) = det B · Pf(Σ)` for an alternating `Σ`. -/
theorem pfaffian_mul_mul_transpose {r : ℕ} (B : Matrix (Fin (2 * r)) (Fin (2 * r)) R)
    {S : Matrix (Fin (2 * r)) (Fin (2 * r)) R} (hS : Sᵀ = -S) (hd : ∀ i, S i i = 0) :
    pfaffian (B * S * Bᵀ) = B.det * pfaffian S := by
  sorry

end Pfaffian

/-! ## Layer 6: the Cayley transform of odd skew-adjoint endomorphisms -/

/-- **6.1.** The grading operator `ε = 1 ⊕ -1` of `ℂ^(m|n)`. -/
def grading : Matrix (m ⊕ n) (m ⊕ n) ℂ :=
  fromBlocks 1 0 0 (-1)

/-- **6.1.** The Cayley transform `(1 + X) (1 - X)⁻¹`. -/
noncomputable def cayley (X : Matrix (m ⊕ n) (m ⊕ n) ℂ) : Matrix (m ⊕ n) (m ⊕ n) ℂ :=
  (1 + X) * (1 - X)⁻¹

/-- **6.1.** `1 - X` is invertible for a skew-adjoint `X`. -/
theorem isUnit_one_sub_of_skew {X : Matrix (m ⊕ n) (m ⊕ n) ℂ} (hX : Xᴴ = -X) :
    IsUnit (1 - X) := by
  sorry

/-- **6.1.** The Cayley transform of a skew-adjoint `X` is unitary. -/
theorem cayley_mem_unitaryGroup {X : Matrix (m ⊕ n) (m ⊕ n) ℂ} (hX : Xᴴ = -X) :
    cayley X ∈ unitaryGroup (m ⊕ n) ℂ := by
  sorry

/-- **6.1.** For an odd skew-adjoint `X` (`ε X ε = -X`), `ε g ε = g⁻¹` where `g` is its Cayley
transform. -/
theorem grading_mul_cayley_mul_grading {X : Matrix (m ⊕ n) (m ⊕ n) ℂ} (hX : Xᴴ = -X)
    (hodd : grading * X * grading = -X) :
    grading * cayley X * grading = (cayley X)⁻¹ := by
  sorry

end TauCetiRoadmap.SuperconnectionsAndMathaiQuillenForms
