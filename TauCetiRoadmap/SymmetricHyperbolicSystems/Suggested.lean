module

public import Mathlib

/-!
# Linear symmetric hyperbolic systems: target signatures

The roadmap is `README.md`; this file is not the roadmap. These are suggested forms, not an
exhaustive checklist: the README is the definitive specification, and every API bullet and every
Check lives there. This file states the definitions the headline theorems need and the headline
theorems themselves, each with `sorry`, against the pinned Mathlib.

The unknown takes values in `ℝᴺ = Fin N → ℝ`, the coefficients are matrices
`Matrix (Fin N) (Fin N) ℝ` acting by `*ᵥ`, and every energy quantity is written with the dot
product `⬝ᵥ`. Mathlib has no default norm on `Matrix`, so matrix-valued functions are
differentiated and bounded entrywise, through `Matrix.of.symm`.

Definitions: the entrywise derivatives `matDt`, `matDx` of a matrix-valued function; the
structure `LinearSystem` of coefficients, its left-hand side `LinearSystem.apply`, the predicates
`IsSymmetricHyperbolic` and `IsClassicalSolution` (§1.2); grid points, the discrete norm, forward
difference quotients and the multilinear interpolant (Layer 3); one step and the iterates of
Friedrichs' scheme (§4.1); the inverse square root of `A⁰` and the normalized system (§7.2).

Headline theorems: continuous partial derivatives give `C¹` (§1.1); the domain of dependence,
uniqueness, the integrated energy identity and the energy estimate (§2.2, §2.3); the discrete
Sobolev inequality (§3.2); the Lipschitz bound for the interpolant (§3.3); the positive-weights
lemma and the one-step energy inequality (§4.2); existence for `A⁰ = 1` and convergence of the
scheme (§6.2, §6.3); derivative bounds for the square root (§7.1); normalization (§7.2); and
existence for general `A⁰` (§7.3).
-/

@[expose] public section

open Set Filter Topology Function MeasureTheory Matrix
open scoped ContDiff MatrixOrder

namespace TauCetiRoadmap.SymmetricHyperbolicSystems

/-! ## Layer 1: systems and classical solutions -/

section Layer1

/-- **Continuous partial derivatives give `C¹`** (§1.1). On an open subset of a Euclidean space,
a function whose partial derivatives along the standard basis exist everywhere and are continuous
is `C¹`, and its derivative is assembled from the partial derivatives. -/
theorem contDiffOn_one_of_hasDerivAt_single {ι : Type*} [Fintype ι] [DecidableEq ι]
    {G : Type*} [NormedAddCommGroup G] [NormedSpace ℝ G]
    {s : Set (EuclideanSpace ℝ ι)} (hs : IsOpen s) {f : EuclideanSpace ℝ ι → G}
    {g : ι → EuclideanSpace ℝ ι → G}
    (hf : ∀ x ∈ s, ∀ i, HasDerivAt (fun r : ℝ => f (x + r • EuclideanSpace.single i (1 : ℝ)))
      (g i x) 0)
    (hg : ∀ i, ContinuousOn (g i) s) :
    ContDiffOn ℝ 1 f s ∧ ∀ x ∈ s, ∀ i, fderiv ℝ f x (EuclideanSpace.single i 1) = g i x := by
  sorry

end Layer1

variable {n N : ℕ}

/-- The entrywise time derivative of a matrix-valued function on `ℝ × ℝⁿ`. -/
noncomputable def matDt (M : ℝ → EuclideanSpace ℝ (Fin n) → Matrix (Fin N) (Fin N) ℝ) (t : ℝ)
    (x : EuclideanSpace ℝ (Fin n)) : Matrix (Fin N) (Fin N) ℝ :=
  Matrix.of (deriv (fun s => Matrix.of.symm (M s x)) t)

/-- The entrywise partial derivative in `xⱼ` of a matrix-valued function on `ℝ × ℝⁿ`. -/
noncomputable def matDx (M : ℝ → EuclideanSpace ℝ (Fin n) → Matrix (Fin N) (Fin N) ℝ)
    (j : Fin n) (t : ℝ) (x : EuclideanSpace ℝ (Fin n)) : Matrix (Fin N) (Fin N) ℝ :=
  Matrix.of (fderiv ℝ (fun y => Matrix.of.symm (M t y)) x (EuclideanSpace.single j 1))

/-- A linear first-order system `A⁰ ∂ₜu + ∑ⱼ Aʲ ∂ⱼu + B u` on `ℝ × ℝⁿ` for an unknown in `ℝᴺ`
(§1.2). The source term and the initial value are not part of the system. -/
structure LinearSystem (n N : ℕ) where
  /-- the coefficient of `∂ₜu` -/
  A0 : ℝ → EuclideanSpace ℝ (Fin n) → Matrix (Fin N) (Fin N) ℝ
  /-- the coefficient of `∂ⱼu` -/
  A : Fin n → ℝ → EuclideanSpace ℝ (Fin n) → Matrix (Fin N) (Fin N) ℝ
  /-- the zeroth-order coefficient -/
  B : ℝ → EuclideanSpace ℝ (Fin n) → Matrix (Fin N) (Fin N) ℝ

namespace LinearSystem

/-- The left-hand side `A⁰ ∂ₜu + ∑ⱼ Aʲ ∂ⱼu + B u` at `(t, x)`, with
`∂ₜu (t, x) = deriv (fun s => u s x) t` and `∂ⱼu (t, x) = fderiv ℝ (u t) x eⱼ` (§1.2). -/
noncomputable def apply (S : LinearSystem n N) (u : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ)
    (t : ℝ) (x : EuclideanSpace ℝ (Fin n)) : Fin N → ℝ :=
  S.A0 t x *ᵥ deriv (fun s => u s x) t +
    (∑ j, S.A j t x *ᵥ fderiv ℝ (u t) x (EuclideanSpace.single j 1)) + S.B t x *ᵥ u t x

/-- **Symmetric hyperbolic with constant `lam`** (§1.2): `lam > 0` and, at every point, `A⁰` and
every `Aʲ` are symmetric and `lam |ξ|² ≤ ξ ⬝ᵥ A⁰ ξ`. -/
def IsSymmetricHyperbolic (S : LinearSystem n N) (lam : ℝ) : Prop :=
  0 < lam ∧ ∀ t x, (S.A0 t x).IsSymm ∧ (∀ j, (S.A j t x).IsSymm) ∧
    ∀ ξ : Fin N → ℝ, lam * (ξ ⬝ᵥ ξ) ≤ ξ ⬝ᵥ (S.A0 t x *ᵥ ξ)

/-- **Classical solution on `[0, T]`** (§1.2): `u` is `C¹` on the closed slab `[0, T] × ℝⁿ` and
satisfies `L u = F` on the open slab. The initial condition is stated separately. -/
def IsClassicalSolution (S : LinearSystem n N) (F : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ)
    (T : ℝ) (u : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ) : Prop :=
  ContDiffOn ℝ 1 (uncurry u) (Icc 0 T ×ˢ univ) ∧ ∀ t ∈ Ioo 0 T, ∀ x, S.apply u t x = F t x

end LinearSystem

open LinearSystem

/-! ## Layer 2: the energy method -/

section Layer2

/-- **Domain of dependence** (§2.2). Let `c ≥ 0` be a propagation speed. A classical solution
whose initial value vanishes on the ball `B(x₀, R)` and whose source vanishes on the open cone
`‖x − x₀‖ < R − c t` vanishes on that cone. -/
theorem eq_zero_of_isClassicalSolution_of_cone {S : LinearSystem n N} {lam : ℝ}
    (hS : S.IsSymmetricHyperbolic lam)
    (hA0 : ContDiff ℝ 1 fun p : ℝ × EuclideanSpace ℝ (Fin n) => Matrix.of.symm (S.A0 p.1 p.2))
    (hA : ∀ j, ContDiff ℝ 1 fun p : ℝ × EuclideanSpace ℝ (Fin n) =>
      Matrix.of.symm (S.A j p.1 p.2))
    (hB : Continuous fun p : ℝ × EuclideanSpace ℝ (Fin n) => Matrix.of.symm (S.B p.1 p.2))
    {c : ℝ} (hc0 : 0 ≤ c)
    (hc : ∀ t x (w : EuclideanSpace ℝ (Fin n)), ‖w‖ ≤ 1 → ∀ ξ : Fin N → ℝ,
      |ξ ⬝ᵥ ((∑ j, w j • S.A j t x) *ᵥ ξ)| ≤ c * (ξ ⬝ᵥ (S.A0 t x *ᵥ ξ)))
    {F u : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ} {T : ℝ}
    (hu : S.IsClassicalSolution F T u) {x₀ : EuclideanSpace ℝ (Fin n)} {R : ℝ}
    (h0 : ∀ x, dist x x₀ < R → u 0 x = 0)
    (hF : ∀ t ∈ Icc 0 T, ∀ x, dist x x₀ < R - c * t → F t x = 0) :
    ∀ t ∈ Icc 0 T, ∀ x, dist x x₀ < R - c * t → u t x = 0 := by
  sorry

/-- **Uniqueness** (§2.3). With bounded `Aʲ`, two classical solutions with the same source and
the same initial value agree on `[0, T] × ℝⁿ`. -/
theorem eqOn_of_isClassicalSolution {S : LinearSystem n N} {lam : ℝ}
    (hS : S.IsSymmetricHyperbolic lam)
    (hA0 : ContDiff ℝ 1 fun p : ℝ × EuclideanSpace ℝ (Fin n) => Matrix.of.symm (S.A0 p.1 p.2))
    (hA : ∀ j, ContDiff ℝ 1 fun p : ℝ × EuclideanSpace ℝ (Fin n) =>
      Matrix.of.symm (S.A j p.1 p.2))
    (hB : Continuous fun p : ℝ × EuclideanSpace ℝ (Fin n) => Matrix.of.symm (S.B p.1 p.2))
    {M : ℝ} (hM : ∀ j t x (ξ : Fin N → ℝ), |ξ ⬝ᵥ (S.A j t x *ᵥ ξ)| ≤ M * (ξ ⬝ᵥ ξ))
    {F u v : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ} {T : ℝ}
    (hu : S.IsClassicalSolution F T u) (hv : S.IsClassicalSolution F T v) (h0 : u 0 = v 0) :
    ∀ t ∈ Icc 0 T, u t = v t := by
  sorry

/-- **The integrated energy identity** (§2.3), for a classical solution vanishing outside a
bounded set: the energy changes by the integral of `⟪K u, u⟫ + 2 ⟪F, u⟫`, where
`K = ∂ₜA⁰ + ∑ⱼ ∂ⱼAʲ − B − Bᵀ`. No bound on the `Aʲ` is assumed. -/
theorem integral_dotProduct_A0_sub_eq {S : LinearSystem n N} {lam : ℝ}
    (hS : S.IsSymmetricHyperbolic lam)
    (hA0 : ContDiff ℝ 1 fun p : ℝ × EuclideanSpace ℝ (Fin n) => Matrix.of.symm (S.A0 p.1 p.2))
    (hA : ∀ j, ContDiff ℝ 1 fun p : ℝ × EuclideanSpace ℝ (Fin n) =>
      Matrix.of.symm (S.A j p.1 p.2))
    (hB : Continuous fun p : ℝ × EuclideanSpace ℝ (Fin n) => Matrix.of.symm (S.B p.1 p.2))
    {F u : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ} {T : ℝ}
    (hu : S.IsClassicalSolution F T u) (hFc : ContinuousOn (uncurry F) (Icc 0 T ×ˢ univ))
    (hsupp : ∃ R, ∀ t ∈ Icc 0 T, ∀ x, R < ‖x‖ → u t x = 0) :
    ∀ t ∈ Icc 0 T, (∫ x, u t x ⬝ᵥ (S.A0 t x *ᵥ u t x)) - ∫ x, u 0 x ⬝ᵥ (S.A0 0 x *ᵥ u 0 x) =
      ∫ s in (0 : ℝ)..t, ∫ x,
        (u s x ⬝ᵥ ((matDt S.A0 s x + (∑ j, matDx (S.A j) j s x) - S.B s x - (S.B s x)ᵀ) *ᵥ
          u s x) + 2 * (F s x ⬝ᵥ u s x)) := by
  sorry

/-- **The energy estimate** (§2.3), for a classical solution vanishing outside a bounded set, with
`κ ≥ 0` bounding the quadratic form of `K = ∂ₜA⁰ + ∑ⱼ ∂ⱼAʲ − B − Bᵀ`. -/
theorem integral_dotProduct_A0_le {S : LinearSystem n N} {lam : ℝ}
    (hS : S.IsSymmetricHyperbolic lam)
    (hA0 : ContDiff ℝ 1 fun p : ℝ × EuclideanSpace ℝ (Fin n) => Matrix.of.symm (S.A0 p.1 p.2))
    (hA : ∀ j, ContDiff ℝ 1 fun p : ℝ × EuclideanSpace ℝ (Fin n) =>
      Matrix.of.symm (S.A j p.1 p.2))
    (hB : Continuous fun p : ℝ × EuclideanSpace ℝ (Fin n) => Matrix.of.symm (S.B p.1 p.2))
    {κ : ℝ} (hκ0 : 0 ≤ κ)
    (hκ : ∀ t x (ξ : Fin N → ℝ),
      ξ ⬝ᵥ ((matDt S.A0 t x + (∑ j, matDx (S.A j) j t x) - S.B t x - (S.B t x)ᵀ) *ᵥ ξ) ≤
        κ * (ξ ⬝ᵥ ξ))
    {F u : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ} {T : ℝ}
    (hu : S.IsClassicalSolution F T u) (hFc : ContinuousOn (uncurry F) (Icc 0 T ×ˢ univ))
    (hsupp : ∃ R, ∀ t ∈ Icc 0 T, ∀ x, R < ‖x‖ → u t x = 0) :
    ∀ t ∈ Icc 0 T, ∫ x, u t x ⬝ᵥ (S.A0 t x *ᵥ u t x) ≤
      Real.exp ((κ + 1) / lam * t) *
        (∫ x, u 0 x ⬝ᵥ (S.A0 0 x *ᵥ u 0 x) + ∫ s in (0 : ℝ)..t, ∫ x, F s x ⬝ᵥ F s x) := by
  sorry

end Layer2

/-! ## Layer 3: grid functions -/

section Layer3

/-- The grid point `h j ∈ ℝⁿ` of the lattice index `j`. -/
def gridPoint (h : ℝ) (j : Fin n → ℤ) : EuclideanSpace ℝ (Fin n) :=
  WithLp.toLp 2 fun i => h * (j i : ℝ)

/-- The squared discrete `L²` norm `hⁿ ∑ⱼ |v j|²`. It is used only for finitely supported `v`. -/
noncomputable def gridNormSq (h : ℝ) (v : (Fin n → ℤ) → Fin N → ℝ) : ℝ :=
  h ^ n * ∑' j, v j ⬝ᵥ v j

/-- The forward difference quotient `D₊ₖ v = h⁻¹ (v (· + eₖ) − v)`, through Mathlib's `fwdDiff`. -/
noncomputable def fwdQuot (h : ℝ) (k : Fin n) (v : (Fin n → ℤ) → Fin N → ℝ) :
    (Fin n → ℤ) → Fin N → ℝ :=
  h⁻¹ • fwdDiff (Pi.single k (1 : ℤ)) v

/-- The iterated forward difference quotient `D₊^α = ∏ₖ D₊ₖ^{αₖ}` of a multi-index `α`. -/
noncomputable def fwdQuotIter (h : ℝ) (α : Fin n → ℕ) (v : (Fin n → ℤ) → Fin N → ℝ) :
    (Fin n → ℤ) → Fin N → ℝ :=
  (List.finRange n).foldr (fun k w => (fwdQuot h k)^[α k] w) v

/-- **The discrete Sobolev inequality** (§3.2), with constant `1`: the value of a finitely
supported grid function at a point is controlled by the discrete norms of its mixed first
differences `D₊^{1_s} v`, `s ⊆ Fin n`. -/
theorem dotProduct_self_le_sum_gridNormSq {h : ℝ} (hh : 0 < h)
    {v : (Fin n → ℤ) → Fin N → ℝ} (hv : HasFiniteSupport v) (j : Fin n → ℤ) :
    v j ⬝ᵥ v j ≤ ∑ s : Finset (Fin n),
      gridNormSq h (fwdQuotIter h (fun k => if k ∈ s then 1 else 0) v) := by
  sorry

/-- The multilinear interpolant of a grid function (§3.3): on the cell with lower corner `h j`,
a convex combination of the `2ⁿ` corner values with weights multilinear in the local
coordinates `θᵢ = xᵢ/h − ⌊xᵢ/h⌋`. -/
noncomputable def interp (h : ℝ) (v : (Fin n → ℤ) → Fin N → ℝ) (x : EuclideanSpace ℝ (Fin n)) :
    Fin N → ℝ :=
  ∑ s : Finset (Fin n),
    (∏ i, if i ∈ s then x i / h - ⌊x i / h⌋ else 1 - (x i / h - ⌊x i / h⌋)) •
      v (fun i => ⌊x i / h⌋ + if i ∈ s then 1 else 0)

/-- **Lipschitz bound for the interpolant** (§3.3): a bound `L` on the forward difference
quotients is a Lipschitz constant in each coordinate. -/
theorem norm_interp_sub_le {h : ℝ} (hh : 0 < h) {v : (Fin n → ℤ) → Fin N → ℝ} {L : ℝ}
    (hL : ∀ k j, ‖fwdQuot h k v j‖ ≤ L) (x y : EuclideanSpace ℝ (Fin n)) :
    ‖interp h v x - interp h v y‖ ≤ L * ∑ k, |x k - y k| := by
  sorry

end Layer3

/-! ## Layer 4: Friedrichs' scheme -/

section Layer4

/-- One step of **Friedrichs' scheme** at time `t`, mesh `h` and time step `k`, for `A⁰ = 1`
(§4.1); the field `A0` of `S` is not used. -/
noncomputable def friedrichsStep (S : LinearSystem n N) (h k t : ℝ)
    (F : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ) (v : (Fin n → ℤ) → Fin N → ℝ)
    (j : Fin n → ℤ) : Fin N → ℝ :=
  (∑ i, ((2 * n : ℝ)⁻¹ • (v (j + Pi.single i 1) + v (j - Pi.single i 1)) -
      (k / (2 * h)) •
        (S.A i t (gridPoint h j) *ᵥ (v (j + Pi.single i 1) - v (j - Pi.single i 1))))) +
    k • (F t (gridPoint h j) - S.B t (gridPoint h j) *ᵥ v j)

/-- The iterates `u^m` of Friedrichs' scheme, starting from the grid restriction of `u₀`, with
`u^{m+1}` computed at time `m k` (§4.1). -/
noncomputable def friedrichs (S : LinearSystem n N) (h k : ℝ)
    (F : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ) (u₀ : EuclideanSpace ℝ (Fin n) → Fin N → ℝ) :
    ℕ → (Fin n → ℤ) → Fin N → ℝ
  | 0 => fun j => u₀ (gridPoint h j)
  | m + 1 => friedrichsStep S h k (m * k) F (friedrichs S h k F u₀ m)

/-- **The positive-weights lemma** (§4.2). -/
theorem dotProduct_sum_mulVec_le {ι : Type*} (s : Finset ι) {W : ι → Matrix (Fin N) (Fin N) ℝ}
    (hW : ∀ i ∈ s, (W i).PosSemidef) (hsum : ∑ i ∈ s, W i = 1) (v : ι → Fin N → ℝ) :
    (∑ i ∈ s, W i *ᵥ v i) ⬝ᵥ (∑ i ∈ s, W i *ᵥ v i) ≤ ∑ i ∈ s, v i ⬝ᵥ (W i *ᵥ v i) := by
  sorry

/-- **The one-step energy inequality** (§4.2), under the CFL condition
`n (k/h) |ξ ⬝ᵥ Aⁱ ξ| ≤ |ξ|²`, a Lipschitz bound `L` for the quadratic forms of the `Aⁱ` in `x`
and the bound `|B ξ| ≤ M |ξ|`. -/
theorem sqrt_gridNormSq_friedrichsStep_le [NeZero n] {S : LinearSystem n N}
    (hsymm : ∀ j t x, (S.A j t x).IsSymm) {h k t L M : ℝ} (hh : 0 < h) (hk : 0 < k)
    (hCFL : ∀ j x (ξ : Fin N → ℝ), n * (k / h) * |ξ ⬝ᵥ (S.A j t x *ᵥ ξ)| ≤ ξ ⬝ᵥ ξ)
    (hL : ∀ j x y (ξ : Fin N → ℝ),
      |ξ ⬝ᵥ ((S.A j t x - S.A j t y) *ᵥ ξ)| ≤ L * dist x y * (ξ ⬝ᵥ ξ))
    (hM : ∀ x (ξ : Fin N → ℝ), (S.B t x *ᵥ ξ) ⬝ᵥ (S.B t x *ᵥ ξ) ≤ M ^ 2 * (ξ ⬝ᵥ ξ)) (hM0 : 0 ≤ M)
    {F : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ} {v : (Fin n → ℤ) → Fin N → ℝ}
    (hv : HasFiniteSupport v) (hF : HasFiniteSupport fun j => F t (gridPoint h j)) :
    Real.sqrt (gridNormSq h (friedrichsStep S h k t F v)) ≤
      (1 + k * (n * L / 2 + M)) * Real.sqrt (gridNormSq h v) +
        k * Real.sqrt (gridNormSq h fun j => F t (gridPoint h j)) := by
  sorry

end Layer4

/-! ## Layer 6: passage to the limit for `A⁰ = 1` -/

section Layer6

/-- **Existence for `A⁰ = 1`** (§6.2): coefficients `C_b^∞`, smooth compactly supported data. -/
theorem exists_isClassicalSolution_of_A0_eq_one [NeZero n] {S : LinearSystem n N}
    (hA0 : ∀ t x, S.A0 t x = 1) (hsymm : ∀ j t x, (S.A j t x).IsSymm)
    (hAs : ∀ j, ContDiff ℝ ∞ fun p : ℝ × EuclideanSpace ℝ (Fin n) =>
      Matrix.of.symm (S.A j p.1 p.2))
    (hBs : ContDiff ℝ ∞ fun p : ℝ × EuclideanSpace ℝ (Fin n) => Matrix.of.symm (S.B p.1 p.2))
    (hbd : ∀ m : ℕ, ∃ C, ∀ p : ℝ × EuclideanSpace ℝ (Fin n),
      (∀ j, ‖iteratedFDeriv ℝ m (fun q : ℝ × EuclideanSpace ℝ (Fin n) =>
        Matrix.of.symm (S.A j q.1 q.2)) p‖ ≤ C) ∧
      ‖iteratedFDeriv ℝ m (fun q : ℝ × EuclideanSpace ℝ (Fin n) =>
        Matrix.of.symm (S.B q.1 q.2)) p‖ ≤ C)
    {u₀ : EuclideanSpace ℝ (Fin n) → Fin N → ℝ} (hu₀ : ContDiff ℝ ∞ u₀)
    (hu₀c : HasCompactSupport u₀) {F : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ}
    (hF : ContDiff ℝ ∞ (uncurry F)) (hFc : HasCompactSupport (uncurry F)) {T : ℝ} (hT : 0 < T) :
    ∃ u : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ, S.IsClassicalSolution F T u ∧ u 0 = u₀ ∧
      ∃ R, ∀ t ∈ Icc 0 T, ∀ x, R < ‖x‖ → u t x = 0 := by
  sorry

/-- **Convergence of Friedrichs' scheme** (§6.3): with a fixed mesh ratio `μ` satisfying the CFL
condition and `k = μ h`, the iterates converge to the solution uniformly at grid points of
`[0, T] × ℝⁿ` as `h → 0`. -/
theorem tendsto_friedrichs [NeZero n] {S : LinearSystem n N}
    (hA0 : ∀ t x, S.A0 t x = 1) (hsymm : ∀ j t x, (S.A j t x).IsSymm)
    (hAs : ∀ j, ContDiff ℝ ∞ fun p : ℝ × EuclideanSpace ℝ (Fin n) =>
      Matrix.of.symm (S.A j p.1 p.2))
    (hBs : ContDiff ℝ ∞ fun p : ℝ × EuclideanSpace ℝ (Fin n) => Matrix.of.symm (S.B p.1 p.2))
    (hbd : ∀ m : ℕ, ∃ C, ∀ p : ℝ × EuclideanSpace ℝ (Fin n),
      (∀ j, ‖iteratedFDeriv ℝ m (fun q : ℝ × EuclideanSpace ℝ (Fin n) =>
        Matrix.of.symm (S.A j q.1 q.2)) p‖ ≤ C) ∧
      ‖iteratedFDeriv ℝ m (fun q : ℝ × EuclideanSpace ℝ (Fin n) =>
        Matrix.of.symm (S.B q.1 q.2)) p‖ ≤ C)
    {μ : ℝ} (hμ : 0 < μ)
    (hCFL : ∀ j t x (ξ : Fin N → ℝ), n * μ * |ξ ⬝ᵥ (S.A j t x *ᵥ ξ)| ≤ ξ ⬝ᵥ ξ)
    {u₀ : EuclideanSpace ℝ (Fin n) → Fin N → ℝ} (hu₀ : ContDiff ℝ ∞ u₀)
    (hu₀c : HasCompactSupport u₀) {F : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ}
    (hF : ContDiff ℝ ∞ (uncurry F)) (hFc : HasCompactSupport (uncurry F)) {T : ℝ}
    {u : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ} (hu : S.IsClassicalSolution F T u)
    (hu0 : u 0 = u₀) :
    ∀ ε > 0, ∀ᶠ h in 𝓝[>] (0 : ℝ), ∀ (m : ℕ) (j : Fin n → ℤ), m * (μ * h) ≤ T →
      ‖friedrichs S h (μ * h) F u₀ m j - u (m * (μ * h)) (gridPoint h j)‖ ≤ ε := by
  sorry

end Layer6

/-! ## Layer 7: general `A⁰` -/

section Layer7

/-- **Derivative bounds for the square root** (§7.1): for a family of symmetric matrices with
`c |ξ|² ≤ ξ ⬝ᵥ A x ξ ≤ Lam |ξ|²`, `0 < c`, whose entries have bounded derivatives of order `≤ m`,
the entries of `CFC.sqrt (A x)` and of its inverse have bounded derivatives of order `≤ m`.
Smoothness itself is Tau Ceti's `Matrix.contDiffOn_sqrt` and `Matrix.contDiffOn_rpow`. -/
theorem exists_bound_iteratedFDeriv_sqrt_comp {X : Type*} [NormedAddCommGroup X]
    [NormedSpace ℝ X] {A : X → Matrix (Fin N) (Fin N) ℝ} {m : ℕ}
    (hA : ContDiff ℝ m fun x => Matrix.of.symm (A x)) (hsymm : ∀ x, (A x).IsSymm)
    {c Lam C : ℝ} (hc : 0 < c)
    (hpos : ∀ x (ξ : Fin N → ℝ), c * (ξ ⬝ᵥ ξ) ≤ ξ ⬝ᵥ (A x *ᵥ ξ))
    (hLam : ∀ x (ξ : Fin N → ℝ), ξ ⬝ᵥ (A x *ᵥ ξ) ≤ Lam * (ξ ⬝ᵥ ξ))
    (hC : ∀ i ≤ m, ∀ x, ‖iteratedFDeriv ℝ i (fun y => Matrix.of.symm (A y)) x‖ ≤ C) :
    ∃ C' : ℝ, ∀ i ≤ m, ∀ x,
      ‖iteratedFDeriv ℝ i (fun y => Matrix.of.symm (CFC.sqrt (A y))) x‖ ≤ C' ∧
      ‖iteratedFDeriv ℝ i (fun y => Matrix.of.symm ((CFC.sqrt (A y))⁻¹)) x‖ ≤ C' := by
  sorry

namespace LinearSystem

/-- The matrix `(A⁰)^{-1/2}` at `(t, x)` (§7.2). -/
noncomputable def invSqrtA0 (S : LinearSystem n N) (t : ℝ) (x : EuclideanSpace ℝ (Fin n)) :
    Matrix (Fin N) (Fin N) ℝ :=
  (CFC.sqrt (S.A0 t x))⁻¹

/-- The **normalized system** (§7.2), obtained from `u = (A⁰)^{-1/2} v` and multiplication by
`(A⁰)^{-1/2}`: `A⁰' = 1`, `Aʲ' = P Aʲ P`, `B' = P (A⁰ ∂ₜP + ∑ⱼ Aʲ ∂ⱼP + B P)` with
`P = (A⁰)^{-1/2}`. -/
noncomputable def normalize (S : LinearSystem n N) : LinearSystem n N where
  A0 _ _ := 1
  A j t x := S.invSqrtA0 t x * S.A j t x * S.invSqrtA0 t x
  B t x := S.invSqrtA0 t x *
    (S.A0 t x * matDt S.invSqrtA0 t x + (∑ j, S.A j t x * matDx S.invSqrtA0 j t x) +
      S.B t x * S.invSqrtA0 t x)

end LinearSystem

/-- **Normalization** (§7.2): `u` solves `S` with source `F` exactly when `(A⁰)^{1/2} u` solves
the normalized system with source `(A⁰)^{-1/2} F`. -/
theorem isClassicalSolution_normalize_iff {S : LinearSystem n N} {lam : ℝ}
    (hS : S.IsSymmetricHyperbolic lam)
    (hA0 : ContDiff ℝ 1 fun p : ℝ × EuclideanSpace ℝ (Fin n) => Matrix.of.symm (S.A0 p.1 p.2))
    {F u : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ} {T : ℝ} :
    S.normalize.IsClassicalSolution (fun t x => S.invSqrtA0 t x *ᵥ F t x) T
        (fun t x => CFC.sqrt (S.A0 t x) *ᵥ u t x) ↔
      S.IsClassicalSolution F T u := by
  sorry

/-- **The Cauchy problem for a symmetric hyperbolic system** (§7.3): coefficients `C_b^∞`, smooth
compactly supported data. Uniqueness is `eqOn_of_isClassicalSolution`. -/
theorem exists_isClassicalSolution [NeZero n] {S : LinearSystem n N} {lam : ℝ}
    (hS : S.IsSymmetricHyperbolic lam)
    (hA0s : ContDiff ℝ ∞ fun p : ℝ × EuclideanSpace ℝ (Fin n) => Matrix.of.symm (S.A0 p.1 p.2))
    (hAs : ∀ j, ContDiff ℝ ∞ fun p : ℝ × EuclideanSpace ℝ (Fin n) =>
      Matrix.of.symm (S.A j p.1 p.2))
    (hBs : ContDiff ℝ ∞ fun p : ℝ × EuclideanSpace ℝ (Fin n) => Matrix.of.symm (S.B p.1 p.2))
    (hbd : ∀ m : ℕ, ∃ C, ∀ p : ℝ × EuclideanSpace ℝ (Fin n),
      ‖iteratedFDeriv ℝ m (fun q : ℝ × EuclideanSpace ℝ (Fin n) =>
        Matrix.of.symm (S.A0 q.1 q.2)) p‖ ≤ C ∧
      (∀ j, ‖iteratedFDeriv ℝ m (fun q : ℝ × EuclideanSpace ℝ (Fin n) =>
        Matrix.of.symm (S.A j q.1 q.2)) p‖ ≤ C) ∧
      ‖iteratedFDeriv ℝ m (fun q : ℝ × EuclideanSpace ℝ (Fin n) =>
        Matrix.of.symm (S.B q.1 q.2)) p‖ ≤ C)
    {u₀ : EuclideanSpace ℝ (Fin n) → Fin N → ℝ} (hu₀ : ContDiff ℝ ∞ u₀)
    (hu₀c : HasCompactSupport u₀) {F : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ}
    (hF : ContDiff ℝ ∞ (uncurry F)) (hFc : HasCompactSupport (uncurry F)) {T : ℝ} (hT : 0 < T) :
    ∃ u : ℝ → EuclideanSpace ℝ (Fin n) → Fin N → ℝ, S.IsClassicalSolution F T u ∧ u 0 = u₀ ∧
      ∃ R, ∀ t ∈ Icc 0 T, ∀ x, R < ‖x‖ → u t x = 0 := by
  sorry

end Layer7

end TauCetiRoadmap.SymmetricHyperbolicSystems
