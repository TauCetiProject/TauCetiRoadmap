module

public import Mathlib

/-!
# Superconnections and Mathai–Quillen forms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib, each with `sorry`,
together with the definitions their statements need, all with real bodies on native carriers.
The API around each target, the special cases and the Checks stay in the README.

Headlines stated, with their README targets:

* 1.1 `isSuperCommutative_exteriorAlgebra`;
  1.2 `superMul_assoc` and `IsSuperHomogeneous.superMul`;
  1.3 `superTrace_superMul_comm`;
* 2.2 `bianchi`; 2.3 `superTrace_dMat` and `isClosed_superTrace_superPow`;
  2.4 `transgression`; 2.5 `trace_exp_sub_trace_exp`; 2.6 `hasDerivAt_exp_duhamel`;
* 3.1 `berezin_map`; 3.2 `pfaffian_sq` and `pfaffian_mul_mul_transpose`;
  3.3 `integral_gaussian_density`;
* 6.1 `isUnit_one_sub_of_skew`, `cayley_mem_unitaryGroup` and `grading_mul_cayley_mul_grading`.

Not stated: Layers 4 and 5 (superconnections on ℤ/2-graded smooth bundles, their Chern character
forms and the character of `∇ + tX`, the Berezin integral along the fibres of a Euclidean bundle,
the Mathai–Quillen Euler and Thom forms and their localization), lacking bundle-valued
differential forms on manifolds, the exterior covariant derivative and de Rham cohomology at the
pins: those carriers are DifferentialGeometry's (Layers 0, 1 and 6) and SmoothBundlesConnections'
(B3.3, B4.1). Not stated: README 6.2 (the invariant character forms on Grassmannians and unitary
groups), for the same reason. The algebraic Layers 1–3 and 6.1 are the local models of those
statements and are stated in full.
-/

@[expose] public section

open Matrix

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

variable {m n : Type*} [Fintype m] [Fintype n] [DecidableEq m] [DecidableEq n]

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

/-- **1.2.** The product `superMul` is associative. -/
theorem superMul_assoc (𝒜 : ZMod 2 → Submodule R A) [GradedAlgebra 𝒜]
    (X Y Z : Matrix (m ⊕ n) (m ⊕ n) A) :
    superMul 𝒜 (superMul 𝒜 X Y) Z = superMul 𝒜 X (superMul 𝒜 Y Z) := by
  sorry

/-- **1.2.** Parities add under `superMul`. -/
theorem IsSuperHomogeneous.superMul (𝒜 : ZMod 2 → Submodule R A) [GradedAlgebra 𝒜]
    {p q : ZMod 2} {X Y : Matrix (m ⊕ n) (m ⊕ n) A} (hX : IsSuperHomogeneous 𝒜 p X)
    (hY : IsSuperHomogeneous 𝒜 q Y) :
    IsSuperHomogeneous 𝒜 (p + q) (SuperconnectionsAndMathaiQuillenForms.superMul 𝒜 X Y) := by
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

/-- **2.1.** A supercommutative differential graded algebra: an odd `R`-linear differential
`d` with `d ∘ d = 0` and the graded Leibniz rule `d (a b) = d a b + σ(a) d b`, where `σ` is the
parity involution. -/
structure SuperDGA (𝒜 : ZMod 2 → Submodule R A) [GradedAlgebra 𝒜] where
  /-- The differential. -/
  d : A →ₗ[R] A
  /-- The differential is odd. -/
  d_mem : ∀ (i : ZMod 2) (a : A), a ∈ 𝒜 i → d a ∈ 𝒜 (i + 1)
  /-- The graded Leibniz rule. -/
  d_mul : ∀ a b : A, d (a * b) = d a * b + parityInv 𝒜 a * d b
  /-- The differential squares to zero. -/
  d_d : ∀ a : A, d (d a) = 0

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

/-- **2.3.** The supertrace commutes with the differential. -/
theorem superTrace_dMat (δ : SuperDGA 𝒜) (X : Matrix (m ⊕ n) (m ⊕ n) A) :
    superTrace (dMat δ X) = δ.d (superTrace X) := by
  sorry

/-- **2.3.** Quillen's closedness: on a supercommutative DGA every component `str (F ^ k)` of the
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

/-- **2.6.** Duhamel's formula in a Banach algebra:
`d/dt exp (A t) = ∫₀¹ exp (s A t) A'(t) exp ((1 - s) A t) ds`. -/
theorem hasDerivAt_exp_duhamel {𝔸 : Type*} [NormedRing 𝔸] [NormedAlgebra ℝ 𝔸] [CompleteSpace 𝔸]
    {F : ℝ → 𝔸} {F' : 𝔸} {t : ℝ} (hF : HasDerivAt F F' t) :
    HasDerivAt (fun s => NormedSpace.exp (F s))
      (∫ s in (0 : ℝ)..1, NormedSpace.exp (s • F t) * F' * NormedSpace.exp ((1 - s) • F t)) t := by
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

/-- **3.2.** The two-form `∑_(i<j) Σ i j eᵢ ∧ eⱼ` of a square matrix, which is `½ (·, Σ ·)` when
`Σ` is skew. -/
noncomputable def skewForm {n : ℕ} (S : Matrix (Fin n) (Fin n) R) :
    ExteriorAlgebra R (Fin n → R) :=
  ∑ i, ∑ j, if i < j then
    S i j • (ExteriorAlgebra.ι R (Pi.single i 1) * ExteriorAlgebra.ι R (Pi.single j 1)) else 0

/-- **3.2.** The Pfaffian of a `2r × 2r` matrix, as the Berezin integral of the exponential of
its two-form: only `ω ^ r / r!` reaches the top degree. -/
noncomputable def pfaffian [Algebra ℚ R] {r : ℕ} (S : Matrix (Fin (2 * r)) (Fin (2 * r)) R) : R :=
  algebraMap ℚ R (r.factorial : ℚ)⁻¹ * berezin (2 * r) (skewForm S ^ r)

/-- **3.2.** `Pf(Σ)² = det Σ` for skew `Σ`. -/
theorem pfaffian_sq [Algebra ℚ R] {r : ℕ} {S : Matrix (Fin (2 * r)) (Fin (2 * r)) R}
    (hS : Sᵀ = -S) : pfaffian S ^ 2 = S.det := by
  sorry

/-- **3.2.** `Pf(B Σ Bᵀ) = det B · Pf(Σ)` for skew `Σ`. -/
theorem pfaffian_mul_mul_transpose [Algebra ℚ R] {r : ℕ}
    (B : Matrix (Fin (2 * r)) (Fin (2 * r)) R) {S : Matrix (Fin (2 * r)) (Fin (2 * r)) R}
    (hS : Sᵀ = -S) : pfaffian (B * S * Bᵀ) = B.det * pfaffian S := by
  sorry

/-- **3.3.** The standard Gaussian density on `ℝʳ`, the fibre of the Mathai–Quillen Thom form,
has integral `1`: `∫ (2π)^(-r/2) exp(-|x|²/2) dx = 1`. -/
theorem integral_gaussian_density (r : ℕ) :
    ∫ x : EuclideanSpace ℝ (Fin r), (2 * Real.pi) ^ (-(r : ℝ) / 2) * Real.exp (-‖x‖ ^ 2 / 2) =
      1 := by
  sorry

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
