module

public import Mathlib

/-!
# General orthogonal polynomials: target signatures

This file states the headline theorems of the roadmap against the pinned Mathlib. `README.md` is
the definitive document and states every target; this file gives suggested forms, not an exhaustive
list. Tau Ceti at the pin has the completeness of polynomial systems under one exponential moment
(`TauCeti/Analysis/InnerProductSpace/PolynomialCompleteness.lean`), moment determinacy
(`TauCeti/Probability/Moments/Determinacy.lean`) and the generating function of the Hermite
polynomials (`TauCeti/RingTheory/Polynomial/Hermite/GeneratingFunction.lean`); the headline
statements need only Mathlib carriers, so the file imports only Mathlib.

The definitions below are roadmap-local copies of the definitions `README.md` pins.
The moments are Mathlib's `ProbabilityTheory.moment id n μ`. In Tau Ceti the
measure-dependent definitions live in the namespace `OrthogonalPolynomials`, and the purely
algebraic ones (`monicThreeTerm`, `corecursive`, `jacobiMatrix`, `imCentralDiff`,
`derivativeAction`, `IsSheffer`) in `Polynomial`. Theorems are stated with `sorry`.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral

open Polynomial MeasureTheory ProbabilityTheory Filter Topology Finset
open scoped ENNReal NNReal

/-! ## Layer 1: difference operators -/

/-- The backward difference `∇_h f(x) = f(x) − f(x − h)` (DLMF §18.1(i), with `h = 1`). The
forward difference is Mathlib's `fwdDiff h f`. -/
def bwdDiff {M G : Type*} [AddGroup M] [AddCommGroup G] (h : M) (f : M → G) : M → G :=
  fun x => f x - f (x - h)

/-- The central difference in the imaginary direction,
`δ_x f(z) = (f(z + i/2) − f(z − i/2))/i` (DLMF §18.1(i)). -/
def imCentralDiffFun (f : ℂ → ℂ) (z : ℂ) : ℂ :=
  (f (z + Complex.I / 2) - f (z - Complex.I / 2)) / Complex.I

/-- `δ_x` on complex polynomials. -/
def imCentralDiff (p : ℂ[X]) : ℂ[X] :=
  C Complex.I⁻¹ * (p.comp (X + C (Complex.I / 2)) - p.comp (X - C (Complex.I / 2)))

/-- Newton's formula for the iterated backward difference. -/
theorem bwdDiff_iter_eq_sum {M G : Type*} [AddCommGroup M] [AddCommGroup G] (h : M)
    (f : M → G) (n : ℕ) (x : M) :
    (bwdDiff h)^[n] f x =
      ∑ k ∈ range (n + 1), ((-1 : ℤ) ^ k * (n.choose k : ℤ)) • f (x - k • h) := by
  sorry

/-- `Δ [x]_{k+1} = (k + 1) [x]_k` for the falling factorial. -/
theorem fwdDiff_descPochhammer {R : Type*} [CommRing R] (k : ℕ) :
    fwdDiff 1 (fun x : R => (descPochhammer R (k + 1)).eval x) =
      fun x => ((k + 1 : ℕ) : R) * (descPochhammer R k).eval x := by
  sorry

/-- `∇ (x)_{k+1} = (k + 1) (x)_k` for the rising factorial. -/
theorem bwdDiff_ascPochhammer {R : Type*} [CommRing R] (k : ℕ) :
    bwdDiff 1 (fun x : R => (ascPochhammer R (k + 1)).eval x) =
      fun x => ((k + 1 : ℕ) : R) * (ascPochhammer R k).eval x := by
  sorry

/-- Summation by parts on `{0, …, N}`. -/
theorem sum_range_mul_fwdDiff {R : Type*} [CommRing R] (f g : ℕ → R) (N : ℕ) :
    ∑ x ∈ range (N + 1), f x * fwdDiff 1 g x =
      f (N + 1) * g (N + 1) - f 0 * g 0 - ∑ x ∈ range (N + 1), g (x + 1) * fwdDiff 1 f x := by
  sorry

/-- `δ_x` lowers the degree by one and multiplies the leading coefficient by the degree. -/
theorem imCentralDiff_natDegree_leadingCoeff (p : ℂ[X]) (hp : 0 < p.natDegree) :
    (imCentralDiff p).natDegree = p.natDegree - 1 ∧
      (imCentralDiff p).leadingCoeff = (p.natDegree : ℂ) * p.leadingCoeff := by
  sorry

/-- `δ_x` maps real polynomials to real polynomials. -/
theorem imCentralDiff_map_real (p : ℝ[X]) :
    ∃ q : ℝ[X], imCentralDiff (p.map (algebraMap ℝ ℂ)) = q.map (algebraMap ℝ ℂ) := by
  sorry

/-! ## Layer 2: orthogonality measures and orthogonal polynomials -/

/-- An orthogonality measure (DLMF 18.2.4_5): every moment is finite and the support is infinite. -/
structure IsOrthogonalityMeasure (μ : Measure ℝ) : Prop where
  integrable_pow : ∀ n : ℕ, Integrable (fun x : ℝ => x ^ n) μ
  support_infinite : μ.support.Infinite

/-- The moment pairing `⟨p, q⟩ = ∫ p(x) q(x) dμ(x)`. -/
def pairing (μ : Measure ℝ) (p q : ℝ[X]) : ℝ :=
  ∫ x, p.eval x * q.eval x ∂μ

/-- The monic orthogonal polynomials, by Gram–Schmidt applied to the monomials. -/
def monic (μ : Measure ℝ) : ℕ → ℝ[X]
  | n => X ^ n - ∑ k : Fin n,
      C (pairing μ (X ^ n) (monic μ k) / pairing μ (monic μ k) (monic μ k)) * monic μ k
decreasing_by exact k.isLt

/-- A system of polynomials orthogonal with respect to `μ` (DLMF 18.2.1–18.2.4_5). -/
structure IsOrthogonal (μ : Measure ℝ) (p : ℕ → ℝ[X]) : Prop where
  natDegree_eq : ∀ n, (p n).natDegree = n
  ne_zero : ∀ n, p n ≠ 0
  pairing_eq_zero : ∀ m n, m ≠ n → pairing μ (p m) (p n) = 0

/-- `h_n` (DLMF 18.2.5). -/
def normSq (μ : Measure ℝ) (p : ℕ → ℝ[X]) (n : ℕ) : ℝ :=
  pairing μ (p n) (p n)

/-- `h̃_n` (DLMF 18.2.6). -/
def normSqX (μ : Measure ℝ) (p : ℕ → ℝ[X]) (n : ℕ) : ℝ :=
  ∫ x, x * (p n).eval x ^ 2 ∂μ

/-- The coefficient `k̃̃_n` two below the leading one (DLMF 18.2.7); `0` in degree `< 2`. -/
def subNextCoeff (q : ℝ[X]) : ℝ :=
  if q.natDegree < 2 then 0 else q.coeff (q.natDegree - 2)

/-- The orthonormal polynomials with positive leading coefficient. -/
def orthonormal (μ : Measure ℝ) (n : ℕ) : ℝ[X] :=
  C (Real.sqrt (normSq μ (monic μ) n))⁻¹ * monic μ n

/-- A weight on a measurable set gives an orthogonality measure (DLMF 18.2.1_5). -/
theorem isOrthogonalityMeasure_withDensity {s : Set ℝ} (hs : MeasurableSet s) {w : ℝ → ℝ}
    (hw : Measurable w) (hw0 : ∀ x ∈ s, 0 ≤ w x) (hpos : 0 < ∫ x in s, w x)
    (hmom : ∀ n : ℕ, IntegrableOn (fun x => |x| ^ n * w x) s) :
    IsOrthogonalityMeasure ((volume.restrict s).withDensity fun x => ENNReal.ofReal (w x)) := by
  sorry

/-- Weights on a countably infinite set (DLMF 18.2.2, 18.2.4). -/
theorem isOrthogonalityMeasure_sum_dirac {X : Set ℝ} (hX : X.Infinite) (w : ℝ → ℝ≥0)
    (hw : ∀ x ∈ X, 0 < w x) (hmom : ∀ n : ℕ, Summable fun x : X => |(x : ℝ)| ^ n * w x) :
    IsOrthogonalityMeasure (Measure.sum fun x : X => (w x : ℝ≥0∞) • Measure.dirac (x : ℝ)) := by
  sorry

/-- `⟨q, q⟩ > 0` for every nonzero polynomial `q` (DLMF §18.2(i)). -/
theorem pairing_self_pos {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) {q : ℝ[X]} (hq : q ≠ 0) :
    0 < pairing μ q q := by
  sorry

/-- `monic μ n` is monic of degree `n`, for every `μ` and `n`. -/
theorem monic_monic (μ : Measure ℝ) (n : ℕ) :
    (monic μ n).Monic ∧ (monic μ n).natDegree = n := by
  sorry

/-- `monic μ n` is orthogonal to every polynomial of lower degree (DLMF §18.2(iii)). -/
theorem pairing_monic_eq_zero {μ : Measure ℝ} (hint : ∀ n : ℕ, Integrable (fun x : ℝ => x ^ n) μ)
    {n : ℕ} (hn : (n : ℕ∞) < μ.support.encard) {q : ℝ[X]} (hq : q.natDegree < n) :
    pairing μ (monic μ n) q = 0 := by
  sorry

/-- Uniqueness: a monic polynomial of degree `n` orthogonal to all lower degrees is `monic μ n`. -/
theorem eq_monic {μ : Measure ℝ} (hint : ∀ n : ℕ, Integrable (fun x : ℝ => x ^ n) μ) {n : ℕ}
    (hn : (n : ℕ∞) < μ.support.encard) {p : ℝ[X]} (hp : p.Monic) (hdeg : p.natDegree = n)
    (horth : ∀ q : ℝ[X], q.natDegree < n → pairing μ p q = 0) : p = monic μ n := by
  sorry

/-- On a support of `N + 1` points the next monic polynomial vanishes on the support. -/
theorem eval_monic_eq_zero_of_mem_support {μ : Measure ℝ}
    (hint : ∀ n : ℕ, Integrable (fun x : ℝ => x ^ n) μ) {N : ℕ}
    (hN : μ.support.encard = N + 1) {x : ℝ} (hx : x ∈ μ.support) :
    (monic μ (N + 1)).eval x = 0 := by
  sorry

/-- Orthogonal systems are the nonzero multiples of the monic ones (DLMF §18.2(iii)). -/
theorem isOrthogonal_iff {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) (p : ℕ → ℝ[X]) :
    IsOrthogonal μ p ↔ ∀ n, ∃ c : ℝ, c ≠ 0 ∧ p n = C c * monic μ n := by
  sorry

/-- The orthonormal standardization: `h_n = 1` and `k_n > 0` (DLMF §18.2(iii)). -/
theorem orthonormal_spec {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) :
    IsOrthogonal μ (orthonormal μ) ∧ (∀ n, normSq μ (orthonormal μ) n = 1) ∧
      ∀ n, 0 < (orthonormal μ n).leadingCoeff := by
  sorry

/-- The finite orthogonal expansion of a polynomial. -/
theorem eq_sum_pairing {μ : Measure ℝ} {p : ℕ → ℝ[X]} (hμ : IsOrthogonalityMeasure μ)
    (hp : IsOrthogonal μ p) (q : ℝ[X]) :
    q = ∑ k ∈ range (q.natDegree + 1), C (pairing μ q (p k) / normSq μ p k) * p k := by
  sorry

/-! ## Layer 3: recurrence relations -/

/-- The monic polynomials of a three-term recurrence (DLMF 18.2.11_5): `p₀ = 1`, `p₁ = X − α₀`,
`p_{n+2} = (X − α_{n+1}) p_{n+1} − β_{n+1} p_n`. -/
def monicThreeTerm {R : Type*} [CommRing R] (α β : ℕ → R) : ℕ → R[X]
  | 0 => 1
  | 1 => X - C (α 0)
  | n + 2 => (X - C (α (n + 1))) * monicThreeTerm α β (n + 1) - C (β (n + 1)) * monicThreeTerm α β n

/-- `a_n = k_n / k_{n+1}` (DLMF 18.2.11). -/
def recA (p : ℕ → ℝ[X]) (n : ℕ) : ℝ :=
  (p n).leadingCoeff / (p (n + 1)).leadingCoeff

/-- `b_n = h̃_n / h_n` (DLMF 18.2.11). -/
def recB (μ : Measure ℝ) (p : ℕ → ℝ[X]) (n : ℕ) : ℝ :=
  normSqX μ p n / normSq μ p n

/-- `c_n = a_{n−1} h_n / h_{n−1}` for `n ≥ 1`, and `c₀ = 0` (DLMF 18.2.11). -/
def recC (μ : Measure ℝ) (p : ℕ → ℝ[X]) (n : ℕ) : ℝ :=
  if n = 0 then 0 else recA p (n - 1) * normSq μ p n / normSq μ p (n - 1)

/-- The monic recurrence coefficient `α_n = b_n` (DLMF 18.2.11_4). -/
def alpha (μ : Measure ℝ) (n : ℕ) : ℝ := recB μ (monic μ) n

/-- The monic recurrence coefficient `β_n = h_n / h_{n−1}` for `n ≥ 1`, and `β₀ = 0`
(DLMF 18.2.11_4). -/
def beta (μ : Measure ℝ) (n : ℕ) : ℝ :=
  if n = 0 then 0 else normSq μ (monic μ) n / normSq μ (monic μ) (n - 1)

/-- The truncated Jacobi matrix `J_n` (DLMF 18.2.18). -/
def jacobiMatrix {R : Type*} [CommRing R] (a b c : ℕ → R) (n : ℕ) : Matrix (Fin n) (Fin n) R :=
  Matrix.of fun i j =>
    if (j : ℕ) = i then b i else if (j : ℕ) = i + 1 then a i else if (i : ℕ) = j + 1 then c i
    else 0

/-- The recurrence polynomials are monic of degree `n` over a nontrivial ring. -/
theorem monicThreeTerm_monic {R : Type*} [CommRing R] [Nontrivial R] (α β : ℕ → R) (n : ℕ) :
    (monicThreeTerm α β n).Monic ∧ (monicThreeTerm α β n).natDegree = n := by
  sorry

/-- The second form of the recurrence (DLMF 18.2.10), in the `n = 0` and `n + 1` cases. -/
theorem X_mul_eq_recurrence {μ : Measure ℝ} {p : ℕ → ℝ[X]} (hμ : IsOrthogonalityMeasure μ)
    (hp : IsOrthogonal μ p) (n : ℕ) :
    X * p 0 = C (recA p 0) * p 1 + C (recB μ p 0) * p 0 ∧
      X * p (n + 1) = C (recA p (n + 1)) * p (n + 2) + C (recB μ p (n + 1)) * p (n + 1) +
        C (recC μ p (n + 1)) * p n := by
  sorry

/-- The coefficient forms of `b_n` (DLMF 18.2.11). -/
theorem recB_eq_coeff {μ : Measure ℝ} {p : ℕ → ℝ[X]} (hμ : IsOrthogonalityMeasure μ)
    (hp : IsOrthogonal μ p) (n : ℕ) :
    recB μ p n = (p n).nextCoeff / (p n).leadingCoeff -
      (p (n + 1)).nextCoeff / (p (n + 1)).leadingCoeff := by
  sorry

/-- DLMF 18.2.11_1, with the sign corrected: `Σ_{j≤n} b_j = −k̃_{n+1}/k_{n+1}`. -/
theorem sum_recB {μ : Measure ℝ} {p : ℕ → ℝ[X]} (hμ : IsOrthogonalityMeasure μ)
    (hp : IsOrthogonal μ p) (n : ℕ) :
    ∑ j ∈ range (n + 1), recB μ p j = -((p (n + 1)).nextCoeff / (p (n + 1)).leadingCoeff) := by
  sorry

/-- DLMF 18.2.11_2: `a_{n−1} c_n > 0`. -/
theorem recA_mul_recC_pos {μ : Measure ℝ} {p : ℕ → ℝ[X]} (hμ : IsOrthogonalityMeasure μ)
    (hp : IsOrthogonal μ p) (n : ℕ) : 0 < recA p n * recC μ p (n + 1) := by
  sorry

/-- The monic polynomials satisfy the monic recurrence (DLMF 18.2.11_5–18.2.11_6). -/
theorem monic_eq_monicThreeTerm {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) :
    monic μ = monicThreeTerm (alpha μ) (beta μ) ∧ ∀ n, 0 < beta μ (n + 1) := by
  sorry

/-- The orthonormal recurrence (DLMF 18.2.11_8). -/
theorem X_mul_orthonormal {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) (n : ℕ) :
    X * orthonormal μ (n + 1) =
      C (Real.sqrt (beta μ (n + 2))) * orthonormal μ (n + 2) +
        C (alpha μ (n + 1)) * orthonormal μ (n + 1) +
        C (Real.sqrt (beta μ (n + 1))) * orthonormal μ n := by
  sorry

/-- The orthonormal polynomials are the Gram–Schmidt orthonormalization of the monomials in
`L²(μ)` (the construction of RandomMatrices §8.2). -/
theorem orthonormal_eq_gramSchmidtNormed {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ)
    (hmem : ∀ k : ℕ, MemLp (fun x : ℝ => x ^ k) 2 μ) (n : ℕ) :
    ((InnerProductSpace.gramSchmidtNormed ℝ (fun k : ℕ => (hmem k).toLp _) n : Lp ℝ 2 μ) :
        ℝ → ℝ) =ᵐ[μ] fun x => (orthonormal μ n).eval x := by
  sorry

/-- The characteristic polynomial of a tridiagonal matrix. -/
theorem charpoly_jacobiMatrix {R : Type*} [CommRing R] (a b c : ℕ → R) (n : ℕ) :
    (jacobiMatrix a b c n).charpoly = monicThreeTerm b (fun k => a (k - 1) * c k) n := by
  sorry

/-! ## Layer 4: the Christoffel–Darboux formula and kernels -/

/-- `K_n(x, y) = Σ_{ℓ ≤ n} p_ℓ(x) p_ℓ(y) / h_ℓ` (DLMF 18.2.12). -/
def cdKernel (μ : Measure ℝ) (p : ℕ → ℝ[X]) (n : ℕ) (x y : ℝ) : ℝ :=
  ∑ ℓ ∈ range (n + 1), (p ℓ).eval x * (p ℓ).eval y / normSq μ p ℓ

/-- The Poisson kernel (DLMF 18.2.41). -/
def poissonKernel (μ : Measure ℝ) (p : ℕ → ℝ[X]) (z : ℂ) (x y : ℝ) : ℂ :=
  ∑' n, (((p n).eval x * (p n).eval y / normSq μ p n : ℝ) : ℂ) * z ^ n

/-- DLMF 18.2.12. -/
theorem cdKernel_eq {μ : Measure ℝ} {p : ℕ → ℝ[X]} (hμ : IsOrthogonalityMeasure μ)
    (hp : IsOrthogonal μ p) (n : ℕ) {x y : ℝ} (hxy : x ≠ y) :
    cdKernel μ p n x y = (p n).leadingCoeff / (normSq μ p n * (p (n + 1)).leadingCoeff) *
      (((p (n + 1)).eval x * (p n).eval y - (p n).eval x * (p (n + 1)).eval y) / (x - y)) := by
  sorry

/-- DLMF 18.2.13. -/
theorem cdKernel_self {μ : Measure ℝ} {p : ℕ → ℝ[X]} (hμ : IsOrthogonalityMeasure μ)
    (hp : IsOrthogonal μ p) (n : ℕ) (x : ℝ) :
    cdKernel μ p n x x = (p n).leadingCoeff / (normSq μ p n * (p (n + 1)).leadingCoeff) *
      ((derivative (p (n + 1))).eval x * (p n).eval x -
        (derivative (p n)).eval x * (p (n + 1)).eval x) := by
  sorry

/-- DLMF 18.2.12_5, first case: reproduction of polynomials of degree `≤ n`. -/
theorem integral_mul_cdKernel_of_natDegree_le {μ : Measure ℝ} {p : ℕ → ℝ[X]}
    (hμ : IsOrthogonalityMeasure μ) (hp : IsOrthogonal μ p) {n : ℕ} {q : ℝ[X]}
    (hq : q.natDegree ≤ n) (x : ℝ) :
    ∫ y, q.eval y * cdKernel μ p n x y ∂μ = q.eval x := by
  sorry

/-- DLMF 18.2.12_5, second case: annihilation of `L²` functions orthogonal to `p₀, …, p_n`. -/
theorem integral_mul_cdKernel_of_orthogonal {μ : Measure ℝ} {p : ℕ → ℝ[X]}
    (hμ : IsOrthogonalityMeasure μ) (hp : IsOrthogonal μ p) {n : ℕ} {f : ℝ → ℝ}
    (hf : MemLp f 2 μ) (horth : ∀ ℓ ≤ n, ∫ y, f y * (p ℓ).eval y ∂μ = 0) (x : ℝ) :
    ∫ y, f y * cdKernel μ p n x y ∂μ = 0 := by
  sorry

/-- The reproducing property of the Poisson kernel. -/
theorem integral_poissonKernel_mul {μ : Measure ℝ} {p : ℕ → ℝ[X]}
    (hμ : IsOrthogonalityMeasure μ) (hp : IsOrthogonal μ p) (z : ℂ) (x : ℝ) (m : ℕ)
    (hsum : Summable fun n => ‖z‖ ^ n *
      ∫ y, |(p n).eval x * (p n).eval y * (p m).eval y| / normSq μ p n ∂μ) :
    ∫ y, poissonKernel μ p z x y * (((p m).eval y : ℝ) : ℂ) ∂μ =
      z ^ m * (((p m).eval x : ℝ) : ℂ) := by
  sorry

/-! ## Layer 5: zeros, Gauss quadrature and kernel polynomials -/

/-- The zeros of `monic μ n` in increasing order. -/
def zeros (μ : Measure ℝ) (n : ℕ) (i : Fin n) : ℝ :=
  ((monic μ n).roots.sort (· ≤ ·)).getD i 0

/-- The Christoffel numbers (DLMF 18.2.37). -/
def christoffelNumber (μ : Measure ℝ) (n : ℕ) (i : Fin n) : ℝ :=
  (∫ x, ((monic μ n /ₘ (X - C (zeros μ n i))).eval x) ∂μ) /
    (derivative (monic μ n)).eval (zeros μ n i)

/-- The `n`-point Gauss quadrature measure. -/
def gaussMeasure (μ : Measure ℝ) (n : ℕ) : Measure ℝ :=
  ∑ i : Fin n, ENNReal.ofReal (christoffelNumber μ n i) • Measure.dirac (zeros μ n i)

/-- The zeros are real and simple (DLMF 18.2.19). -/
theorem zeros_spec {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) (n : ℕ) :
    StrictMono (zeros μ n) ∧ (∀ i, (monic μ n).eval (zeros μ n i) = 0) ∧
      monic μ n = ∏ i, (X - C (zeros μ n i)) := by
  sorry

/-- For `μ` concentrated on `[a, b]` the zeros lie in `(a, b)` (DLMF §18.2(vi)). -/
theorem zeros_mem_Ioo {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) {a b : ℝ}
    (hab : ∀ᵐ x ∂μ, x ∈ Set.Icc a b) (n : ℕ) (i : Fin n) : zeros μ n i ∈ Set.Ioo a b := by
  sorry

/-- The zeros of `p_n` and `p_{n+1}` interlace. -/
theorem zeros_interlace {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) (n : ℕ) (i : Fin n) :
    zeros μ (n + 1) i.castSucc < zeros μ n i ∧ zeros μ n i < zeros μ (n + 1) i.succ := by
  sorry

/-- For `m < n`, between two zeros of `p_m` there is a zero of `p_n`. -/
theorem exists_zero_between {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) {m n : ℕ}
    (hmn : m < n) {i j : Fin m} (hij : i < j) :
    ∃ k : Fin n, zeros μ m i < zeros μ n k ∧ zeros μ n k < zeros μ m j := by
  sorry

/-- The discriminant of a split polynomial (auxiliary; DLMF 18.2.20). -/
theorem discr_eq_prod {K : Type*} [Field K] {n : ℕ} {c : K} (hc : c ≠ 0) (x : Fin n → K) :
    (C c * ∏ i, (X - C (x i))).discr =
      c ^ (2 * n - 2) * ∏ i, ∏ j ∈ Finset.Ioi i, (x i - x j) ^ 2 := by
  sorry

/-- The discriminant of `p_n` is positive (DLMF 18.2.20). -/
theorem discr_pos {μ : Measure ℝ} {p : ℕ → ℝ[X]} (hμ : IsOrthogonalityMeasure μ)
    (hp : IsOrthogonal μ p) (n : ℕ) : 0 < (p n).discr := by
  sorry

/-- Gauss quadrature: positive weights, exact in degree `≤ 2n − 1`. -/
theorem gauss_quadrature {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) (n : ℕ) :
    (∀ i, 0 < christoffelNumber μ n i) ∧
      ∀ q : ℝ[X], q.natDegree < 2 * n →
        ∫ x, q.eval x ∂μ = ∑ i, christoffelNumber μ n i * q.eval (zeros μ n i) := by
  sorry

/-- The Christoffel numbers are the reciprocals of the Christoffel function. -/
theorem christoffelNumber_eq {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) (n : ℕ)
    (i : Fin (n + 1)) :
    christoffelNumber μ (n + 1) i = (cdKernel μ (monic μ) n (zeros μ (n + 1) i)
      (zeros μ (n + 1) i))⁻¹ := by
  sorry

/-! ### Kernel polynomials (5.6) -/

/-- The kernel polynomial `q_n(·; y)` (DLMF 18.2.14). -/
def kernelPolynomial (μ : Measure ℝ) (p : ℕ → ℝ[X]) (y : ℝ) (n : ℕ) : ℝ[X] :=
  ∑ ℓ ∈ range (n + 1), C ((p ℓ).eval y / normSq μ p ℓ) * p ℓ

/-- Kernel polynomials are orthogonal for `|y − x| dμ(x)` when `y` lies to the right or to the
left of the support (DLMF 18.2.15). -/
theorem isOrthogonal_kernelPolynomial {μ : Measure ℝ} {p : ℕ → ℝ[X]}
    (hμ : IsOrthogonalityMeasure μ) (hp : IsOrthogonal μ p) {y : ℝ}
    (hy : (∀ᵐ x ∂μ, x ≤ y) ∨ ∀ᵐ x ∂μ, y ≤ x) :
    IsOrthogonalityMeasure (μ.withDensity fun x => ENNReal.ofReal |y - x|) ∧
      IsOrthogonal (μ.withDensity fun x => ENNReal.ofReal |y - x|) (kernelPolynomial μ p y) := by
  sorry

/-- DLMF 18.2.17. -/
theorem kernelPolynomial_mul_sub {μ : Measure ℝ} {p : ℕ → ℝ[X]} (hμ : IsOrthogonalityMeasure μ)
    (hp : IsOrthogonal μ p) (y : ℝ) (n : ℕ) :
    C ((p n).eval y) * p (n + 1) - C ((p (n + 1)).eval y) * p n =
      C (normSq μ p n * (p (n + 1)).leadingCoeff / (p n).leadingCoeff) * (X - C y) *
        kernelPolynomial μ p y n := by
  sorry

/-! ## Layer 6: symmetry and quadratic transformations -/

/-- DLMF 18.2.21. -/
theorem monic_comp_neg {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ)
    (heven : μ.map (fun x => -x) = μ) (n : ℕ) :
    (monic μ n).comp (-X) = (-1) ^ n * monic μ n := by
  sorry

/-- DLMF 18.2.22, in measure form. -/
theorem monic_even_odd {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ)
    (heven : μ.map (fun x => -x) = μ) (n : ℕ) :
    monic μ (2 * n) = (monic (μ.map fun x => x ^ 2) n).comp (X ^ 2) ∧
      monic μ (2 * n + 1) =
        X * (monic ((μ.withDensity fun x => ENNReal.ofReal (x ^ 2)).map fun x => x ^ 2) n).comp
          (X ^ 2) := by
  sorry

/-- DLMF 18.2.23, in measure form, for every even orthogonality measure. -/
theorem monic_even_odd_two_sq_sub_one {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ)
    (heven : μ.map (fun x => -x) = μ) (n : ℕ) :
    ∃ r s : ℝ[X],
      monic μ (2 * n) = r.comp (2 * X ^ 2 - 1) ∧ monic μ (2 * n + 1) = X * s.comp (2 * X ^ 2 - 1) ∧
      r = C (2 ^ n)⁻¹ * monic (μ.map fun x => 2 * x ^ 2 - 1) n ∧
      s = C (2 ^ n)⁻¹ *
        monic ((μ.withDensity fun x => ENNReal.ofReal (x ^ 2)).map fun x => 2 * x ^ 2 - 1) n := by
  sorry

/-! ## Layer 7: moments and Hankel determinants -/

/-- The Hankel determinant `Δ_n = det (m_(i+j))_{i,j<n}` of a sequence (DLMF 18.2.27); `Δ₀ = 1`.
It is ClassicalArithmeticCompletion §6.21's `D_n(a) = det (a_(i+j+1))_{i,j<n}` for
`a_(k+1) = m_k`. -/
def hankelDet (m : ℕ → ℝ) (n : ℕ) : ℝ :=
  (Matrix.of fun i j : Fin n => m (i.val + j.val)).det

/-- The determinant `Δ′_n` (DLMF 18.2.28); `Δ′₀ = 0`, `Δ′₁ = m₁`. -/
def hankelDet' (m : ℕ → ℝ) (n : ℕ) : ℝ :=
  if n = 0 then 0 else
    (Matrix.of fun i j : Fin n => m (if (j : ℕ) + 1 = n then i + n else i + j)).det

/-- The Hankel determinants of an orthogonality measure are positive. -/
theorem hankelDet_pos {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) (n : ℕ) :
    0 < hankelDet (moment id · μ) n := by
  sorry

/-- `h_n = Δ_{n+1}/Δ_n` for the monic polynomials. -/
theorem normSq_monic_eq {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) (n : ℕ) :
    normSq μ (monic μ) n = hankelDet (moment id · μ) (n + 1) / hankelDet (moment id · μ) n := by
  sorry

/-- DLMF 18.2.29. -/
theorem eval_monic_eq_det {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) (n : ℕ) (x : ℝ) :
    (monic μ (n + 1)).eval x = (Matrix.of fun i j : Fin (n + 2) =>
      if (i : ℕ) = n + 1 then x ^ (j : ℕ) else moment id (i + j) μ).det /
        hankelDet (moment id · μ) (n + 1) := by
  sorry

/-- DLMF 18.2.30. -/
theorem alpha_beta_eq_hankel {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) (n : ℕ) :
    alpha μ n = hankelDet' (moment id · μ) (n + 1) / hankelDet (moment id · μ) (n + 1) -
        hankelDet' (moment id · μ) n / hankelDet (moment id · μ) n ∧
      beta μ (n + 1) = hankelDet (moment id · μ) (n + 2) * hankelDet (moment id · μ) n /
        hankelDet (moment id · μ) (n + 1) ^ 2 := by
  sorry

/-! ## Layer 8: Favard's theorem, uniqueness and completeness -/

/-- Favard's theorem (DLMF §18.2(viii)). -/
theorem favard (α β : ℕ → ℝ) (hβ : ∀ n, 0 < β (n + 1)) :
    ∃ μ : Measure ℝ, IsProbabilityMeasure μ ∧ IsOrthogonalityMeasure μ ∧
      monic μ = monicThreeTerm α β := by
  sorry

/-- Hamburger's theorem: positive Hankel determinants characterize moment sequences of
measures with infinite support. -/
theorem exists_measure_iff_hankelDet_pos (m : ℕ → ℝ) :
    (∀ n, 0 < hankelDet m n) ↔
      ∃ μ : Measure ℝ, IsOrthogonalityMeasure μ ∧ ∀ k, moment id k μ = m k := by
  sorry

/-- Bounded recurrence coefficients: compact support and uniqueness. -/
theorem favard_bounded (α β : ℕ → ℝ) (hβ : ∀ n, 0 < β (n + 1)) {A B : ℝ}
    (hα : ∀ n, |α n| ≤ A) (hβB : ∀ n, β (n + 1) ≤ B ^ 2) (hB : 0 ≤ B) :
    ∃ μ : Measure ℝ, (IsProbabilityMeasure μ ∧ IsOrthogonalityMeasure μ ∧
        monic μ = monicThreeTerm α β ∧ ∀ᵐ x ∂μ, x ∈ Set.Icc (-(A + 2 * B)) (A + 2 * B)) ∧
      ∀ ν : Measure ℝ, IsProbabilityMeasure ν → IsOrthogonalityMeasure ν →
        monic ν = monicThreeTerm α β → ν = μ := by
  sorry

/-- Orthogonality on a bounded interval determines the measure up to a constant factor. -/
theorem eq_smul_of_monic_eq {μ ν : Measure ℝ} (hμ : IsOrthogonalityMeasure μ)
    (hν : IsOrthogonalityMeasure ν) {a b : ℝ} (hab : ∀ᵐ x ∂μ, x ∈ Set.Icc a b)
    (h : monic μ = monic ν) : ν = (ν Set.univ / μ Set.univ) • μ := by
  sorry

/-- Completeness under one exponential moment (DLMF 18.2.24–18.2.25), for `𝕜 = ℝ` or `ℂ`. -/
theorem hasSum_orthonormal_expansion {𝕜 : Type*} [RCLike 𝕜] {μ : Measure ℝ}
    (hμ : IsOrthogonalityMeasure μ)
    (hexp : ∃ a : ℝ, 0 < a ∧ Integrable (fun x => Real.exp (a * |x|)) μ) (f : Lp 𝕜 2 μ) :
    ∃ g : ℕ → Lp 𝕜 2 μ,
      (∀ n, (g n : ℝ → 𝕜) =ᵐ[μ] fun x => algebraMap ℝ 𝕜 ((orthonormal μ n).eval x)) ∧
      HasSum (fun n =>
        (∫ x, algebraMap ℝ 𝕜 ((orthonormal μ n).eval x) * (f : ℝ → 𝕜) x ∂μ) • g n) f := by
  sorry

/-! ## Layer 9: associated polynomials, continued fractions and Markov's theorem -/

/-- The corecursive polynomials `p_n^{(0)}` (DLMF 18.2.32): `p₀ = 0`, `p₁ = 1`. -/
def corecursive {R : Type*} [CommRing R] (α β : ℕ → R) : ℕ → R[X]
  | 0 => 0
  | 1 => 1
  | n + 2 => (X - C (α (n + 1))) * corecursive α β (n + 1) - C (β (n + 1)) * corecursive α β n

/-- The J-fraction `1/(z − α₀ − β₁/(z − α₁ − ⋯))` (DLMF 18.2.34); its `n`-th approximant
`F_n(z)` (DLMF 18.2.35) is `(jFraction α β z).convs' n`. -/
def jFraction (α β : ℕ → ℂ) (z : ℂ) : GenContFract ℂ :=
  ⟨0, Stream'.Seq.ofStream fun k => if k = 0 then ⟨1, z - α 0⟩ else ⟨-β k, z - α k⟩⟩

/-- The zeros of the associated polynomials `q_j^{(k)}` lie in `(a, b)` when `μ` is concentrated
on `[a, b]`; so the tails of the J-fraction do not vanish off `[a, b]`. -/
theorem associated_roots_mem_Ioo {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) {a b : ℝ}
    (hab : ∀ᵐ x ∂μ, x ∈ Set.Icc a b) (k j : ℕ) {x : ℂ}
    (hx : aeval x (monicThreeTerm (fun i => alpha μ (i + k)) (fun i => beta μ (i + k)) j) = 0) :
    x.im = 0 ∧ x.re ∈ Set.Ioo a b := by
  sorry

/-- DLMF 18.2.33. -/
theorem aeval_associated {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) (n : ℕ) {z : ℂ}
    (hz : ∀ᵐ x : ℝ ∂μ, (x : ℂ) ≠ z) :
    aeval z (monicThreeTerm (fun k => alpha μ (k + 1)) (fun k => beta μ (k + 1)) n) =
      (moment id 0 μ : ℂ)⁻¹ * ∫ x : ℝ,
        (aeval z (monic μ (n + 1)) - (((monic μ (n + 1)).eval x : ℝ) : ℂ)) / (z - (x : ℂ)) ∂μ := by
  sorry

/-- DLMF 18.2.36. -/
theorem convs'_jFraction {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) {a b : ℝ}
    (hab : ∀ᵐ x ∂μ, x ∈ Set.Icc a b) (n : ℕ) {z : ℂ} (hz : ∀ t ∈ Set.Icc a b, (t : ℂ) ≠ z) :
    (jFraction (fun k => alpha μ k) (fun k => beta μ k) z).convs' (n + 1) =
        aeval z (corecursive (alpha μ) (beta μ) (n + 1)) / aeval z (monic μ (n + 1)) ∧
      aeval z (corecursive (alpha μ) (beta μ) (n + 1)) / aeval z (monic μ (n + 1)) =
        (moment id 0 μ : ℂ)⁻¹ *
          ∑ i, (christoffelNumber μ (n + 1) i : ℂ) / (z - zeros μ (n + 1) i) := by
  sorry

/-- Markov's theorem (DLMF 18.2.38). -/
theorem markov {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) {a b : ℝ}
    (hab : ∀ᵐ x ∂μ, x ∈ Set.Icc a b) :
    TendstoLocallyUniformlyOn
      (fun n z => (jFraction (fun k => alpha μ k) (fun k => beta μ k) z).convs' n)
      (fun z => (moment id 0 μ : ℂ)⁻¹ * ∫ x : ℝ, (z - (x : ℂ))⁻¹ ∂μ) atTop
      {z : ℂ | ∀ t ∈ Set.Icc a b, (t : ℂ) ≠ z} := by
  sorry

/-! ## Layer 10: structure relations, Sheffer polynomials and monotonic weights -/

/-- The distributional Pearson equation `D(π μ) = τ μ`: `∫ π q′ dμ = −∫ τ q dμ` for every
polynomial `q`. -/
def IsSemiclassical (μ : Measure ℝ) (π τ : ℝ[X]) : Prop :=
  π ≠ 0 ∧ ∀ q : ℝ[X], ∫ x, (π * derivative q).eval x ∂μ = -∫ x, (τ * q).eval x ∂μ

/-- The structure relation (DLMF 18.2.44), with `d = deg π` and `s = max (deg τ) (d − 1)`. -/
theorem structure_relation {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) {π τ : ℝ[X]}
    (h : IsSemiclassical μ π τ) (n : ℕ) :
    ∃ c : ℕ → ℝ, π * derivative (monic μ n) =
      ∑ j ∈ Finset.Icc (n - max τ.natDegree (π.natDegree - 1)) (n + π.natDegree - 1),
        C (c j) * monic μ j := by
  sorry

/-- The lowering and raising forms (DLMF 18.2.42–18.2.43). -/
theorem lowering_raising {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ) {π τ : ℝ[X]}
    (h : IsSemiclassical μ π τ) (n : ℕ) :
    (∃ R S : ℝ[X], R.natDegree ≤ max π.natDegree τ.natDegree ∧
        S.natDegree ≤ max π.natDegree τ.natDegree ∧
        π * derivative (monic μ (n + 1)) = R * monic μ (n + 1) + S * monic μ n) ∧
      ∃ R S : ℝ[X], R.natDegree ≤ max π.natDegree τ.natDegree ∧
        S.natDegree ≤ max π.natDegree τ.natDegree ∧
        π * derivative (monic μ n) = R * monic μ n + S * monic μ (n + 1) := by
  sorry

/-- The operator `v(D) = Σ_k v_k Dᵏ` on polynomials, for a formal power series `v`. -/
def derivativeAction {R : Type*} [CommRing R] (v : PowerSeries R) (p : R[X]) : R[X] :=
  ∑ k ∈ range (p.natDegree + 1), C (PowerSeries.coeff k v) * derivative^[k] p

/-- Sheffer polynomials with `c_n = 1` (DLMF 18.2.45): `f(t) exp(x u(t)) = Σ p_n(x) tⁿ/n!`. -/
def IsSheffer {R : Type*} [CommRing R] [Algebra ℚ R] (p : ℕ → R[X]) (f u : PowerSeries R) :
    Prop :=
  PowerSeries.constantCoeff f = 1 ∧ PowerSeries.constantCoeff u = 0 ∧
    PowerSeries.coeff 1 u = 1 ∧ (∀ n, (p n).natDegree = n) ∧
    PowerSeries.mk (fun n => ((n.factorial : ℚ)⁻¹ • p n)) =
      PowerSeries.map Polynomial.C f *
        (PowerSeries.exp R[X]).subst (PowerSeries.C (X : R[X]) * PowerSeries.map Polynomial.C u)

/-- DLMF 18.2.45 ⟺ 18.2.46. -/
theorem isSheffer_iff {R : Type*} [CommRing R] [Algebra ℚ R] [Nontrivial R] (p : ℕ → R[X])
    (u : PowerSeries R) (hu0 : PowerSeries.constantCoeff u = 0)
    (hu1 : IsUnit (PowerSeries.coeff 1 u)) (hu1' : PowerSeries.coeff 1 u = 1) :
    (∃ f, IsSheffer p f u) ↔
      p 0 = 1 ∧ (∀ n, (p n).natDegree = n) ∧
        ∀ n, derivativeAction (PowerSeries.substInvOfIsUnit u hu1) (p (n + 1)) =
          ((n + 1 : ℕ) : R) • p n := by
  sorry

/-- The Bernoulli polynomials are Sheffer (Appell) polynomials, with `u(t) = t`. -/
theorem isSheffer_bernoulli :
    IsSheffer (fun n => Polynomial.bernoulli n)
      (PowerSeries.mk fun n => (bernoulli n : ℚ) / n.factorial) PowerSeries.X := by
  sorry

/-- The Bernoulli polynomials are not orthogonal for any orthogonality measure. -/
theorem not_isOrthogonal_bernoulli :
    ¬ ∃ μ : Measure ℝ, IsOrthogonalityMeasure μ ∧
      IsOrthogonal μ (fun n => (Polynomial.bernoulli n).map (algebraMap ℚ ℝ)) := by
  sorry

/-- Monotonic weights (DLMF §18.2(xii), Szegő, Theorem 7.2): a nondecreasing weight on an
interval `s` with greatest point `b`. -/
theorem sqrt_weight_mul_abs_le {s : Set ℝ} (hs : s.OrdConnected) {b : ℝ} (hb : IsGreatest s b)
    {w : ℝ → ℝ} (hw : MonotoneOn w s) (hw0 : ∀ x ∈ s, 0 ≤ w x) (hwm : Measurable w)
    (hμ : IsOrthogonalityMeasure ((volume.restrict s).withDensity fun x => ENNReal.ofReal (w x)))
    {p : ℕ → ℝ[X]}
    (hp : IsOrthogonal ((volume.restrict s).withDensity fun x => ENNReal.ofReal (w x)) p)
    (n : ℕ) {x : ℝ} (hx : x ∈ s) :
    Real.sqrt (w x) * |(p n).eval x| ≤ Real.sqrt (w b) * |(p n).eval b| := by
  sorry

/-- The mirror form: a nonincreasing weight on an interval `s` with least point `a`. -/
theorem sqrt_weight_mul_abs_le_of_antitoneOn {s : Set ℝ} (hs : s.OrdConnected) {a : ℝ}
    (ha : IsLeast s a) {w : ℝ → ℝ} (hw : AntitoneOn w s) (hw0 : ∀ x ∈ s, 0 ≤ w x)
    (hwm : Measurable w)
    (hμ : IsOrthogonalityMeasure ((volume.restrict s).withDensity fun x => ENNReal.ofReal (w x)))
    {p : ℕ → ℝ[X]}
    (hp : IsOrthogonal ((volume.restrict s).withDensity fun x => ENNReal.ofReal (w x)) p)
    (n : ℕ) {x : ℝ} (hx : x ∈ s) :
    Real.sqrt (w x) * |(p n).eval x| ≤ Real.sqrt (w a) * |(p n).eval a| := by
  sorry

end TauCetiRoadmap.SpecialFunctionsOrthogonalPolynomialsGeneral
