import Mathlib
import TauCeti.Analysis.SpecialFunctions.Erf

/-!
# QSeriesPartitionsAndMockModularForms: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs, with only the
explicit definitions needed to state them.

The statable headlines are the analytic q-binomial and Euler identities, Ramanujan's
bilateral summation, Bailey's transformation, both Rogers–Ramanujan counting and
analytic identities, the quintuple product, rank/crank equidistribution, prime-power
partition congruences, the completed Lerch elliptic and full modular laws, the
identification of the third-order f with the rank specialization, the T and S
transformation laws of the completed third-order vector H₃ = F₃ − G₃, whose
correction is a period integral of three unary theta series along a vertical ray, the
weight-1/2 law of the root-of-unity rank completions F_(j/t) on a principal congruence
subgroup with one multiplier for all j, and the resulting mock modularity of the
rank-residue deviations Σ (N(r,t;n) − p(n)/t) q^(n−1/24).

The following full headlines are not statable at the pins:
* Layer 7's general signature-(r−1,1) theta transformations need the negative-cone
  and isotropic-boundary theta construction and its finite discriminant coordinates.
* Layer 8's Fourier and xi exact-sequence theorems need the half-integral-weight
  harmonic weak Maass and weakly holomorphic Weil-form spaces with all-cusp growth.
* Layer 9's arbitrary-pole Jacobi decomposition needs meromorphic Jacobi data,
  mixed Laurent–Taylor residues and the completed polar-kernel construction.
* The shadow, harmonicity and all-cusp growth assertions of Layers 6, 10 and 11
  (the torsion Lerch completions, the xi-images and cusp bounds of the third-, fifth-
  and seventh-order vectors, and the shadows and cusp growth of the root-of-unity rank
  completions and of the rank-residue deviations) need the
  half-integral-weight harmonic spaces, the xi operator and the cusp coordinates of
  Layer 8.
The fifth- and seventh-order T and S laws of §§10.6 and 10.8 use the same
vector-completion mechanism as the third-order laws stated here, with the thirteen
unilateral series of §10.3 and the twenty-six unary corrections of §§10.5 and 10.7 in
place of f, ω and the three third-order theta series; the third-order vector is the
acceptance test of that mechanism, and those larger vectors remain README targets.
These constructions remain README targets; no substitute statements are made for them.
-/

namespace TauCetiRoadmap.QSeriesPartitionsAndMockModularForms

open scoped BigOperators

noncomputable section

local notation3 "P[" a ", " q ", " n "]" =>
  (∏ j ∈ Finset.range n, (1 - a * q ^ j))

/-! ## Layer 2: basic hypergeometric series on their actual domains -/

/-- The q-binomial theorem converges absolutely on the open bidisc; Gasper (1.2.8). -/
theorem qBinomial (a q z : ℂ) (hq : ‖q‖ < 1) (hz : ‖z‖ < 1) :
    HasSum (fun n : ℕ => P[a, q, n] * z ^ n / P[q, q, n])
      ((∏' j : ℕ, (1 - a * z * q ^ j)) / (∏' j : ℕ, (1 - z * q ^ j))) ∧
    Summable (fun n : ℕ => ‖P[a, q, n] * z ^ n / P[q, q, n]‖) := by
  sorry

/-- Base inversion gives the large-base binomial theorem on its actual radius domain. -/
theorem qBinomial_largeBase (a q z : ℂ) (hq : 1 < ‖q‖) (hz : ‖a * z / q‖ < 1) :
    HasSum (fun n : ℕ => P[a, q, n] * z ^ n / P[q, q, n])
      ((∏' j : ℕ, (1 - z / q * (q⁻¹) ^ j)) /
        (∏' j : ℕ, (1 - a * z / q * (q⁻¹) ^ j))) ∧
    Summable (fun n : ℕ => ‖P[a, q, n] * z ^ n / P[q, q, n]‖) := by
  sorry

/-- Euler's inverse series is a disc identity; the quadratically weighted series is entire in z. -/
theorem euler_qExponential (q z : ℂ) (hq : ‖q‖ < 1) :
    (‖z‖ < 1 →
      HasSum (fun n : ℕ => z ^ n / P[q, q, n])
        ((∏' j : ℕ, (1 - z * q ^ j))⁻¹) ∧
      Summable (fun n : ℕ => ‖z ^ n / P[q, q, n]‖)) ∧
    HasSum (fun n : ℕ => q ^ (n * (n - 1) / 2) * z ^ n / P[q, q, n])
      (∏' j : ℕ, (1 + z * q ^ j)) ∧
    Summable (fun n : ℕ => ‖q ^ (n * (n - 1) / 2) * z ^ n / P[q, q, n]‖) := by
  sorry

/-- The 1-psi-1 summand uses a regular negative-index quotient, including b=0. -/
def ramanujanOnePsiOneTerm (a b q z : ℂ) (j : ℤ) : ℂ :=
  if 0 ≤ j then
    P[a, q, j.toNat] / P[b, q, j.toNat] * z ^ j
  else
    (∏ r ∈ Finset.range (-j).toNat, (b - q ^ (r + 1)) / (a - q ^ (r + 1))) * z ^ j

/-- Ramanujan's 1-psi-1 sum on its pole-free annulus; Gasper (2.1.9). -/
theorem ramanujanOnePsiOne_hasSum (a b q z : ℂ)
    (hq : ‖q‖ < 1) (hq0 : q ≠ 0) (ha : a ≠ 0)
    (hinner : ‖b / a‖ < ‖z‖) (houter : ‖z‖ < 1)
    (hpos : ∀ r : ℕ, 1 - b * q ^ r ≠ 0)
    (hneg : ∀ r : ℕ, a - q ^ (r + 1) ≠ 0) :
    let P : ℂ → ℂ := fun c => ∏' r : ℕ, (1 - c * q ^ r)
    HasSum (ramanujanOnePsiOneTerm a b q z)
      (P q * P (b / a) * P (a * z) * P (q / (a * z)) /
        (P b * P (q / a) * P z * P (b / (a * z)))) ∧
    Summable (fun j : ℤ => ‖ramanujanOnePsiOneTerm a b q z j‖) := by
  sorry

/-- A Bailey pair over a commutative ring includes its unit denominator domain. -/
noncomputable def baileyPair {K : Type*} [CommRing K]
    (a q : K) (α β : ℕ → K) : Prop :=
  (∀ n, IsUnit (P[q, q, n]) ∧ IsUnit (P[(a * q), q, n])) ∧
  ∀ n, β n = ∑ r ∈ Finset.range (n + 1),
    α r * Ring.inverse (P[q, q, (n - r)] * P[(a * q), q, (n + r)])

/-- The finite Bailey transformation preserves pairs over every commutative ring on the
original unit domain and the additional transformed-denominator unit domain; Andrews (2.4)-(2.6). -/
theorem baileyLemma_transform {K : Type*} [CommRing K]
    (a q : K) (α β : ℕ → K) (h : baileyPair a q α β) (ρ₁ ρ₂ : Kˣ)
    (hden : ∀ n : ℕ,
      IsUnit (P[(a * q * ((ρ₁⁻¹ : Kˣ) : K)), q, n]) ∧
      IsUnit (P[(a * q * ((ρ₂⁻¹ : Kˣ) : K)), q, n])) :
    let t := a * q * (((ρ₁ * ρ₂)⁻¹ : Kˣ) : K)
    let D := fun n => P[(a * q * ((ρ₁⁻¹ : Kˣ) : K)), q, n] *
      P[(a * q * ((ρ₂⁻¹ : Kˣ) : K)), q, n]
    baileyPair a q
      (fun n => P[(ρ₁ : K), q, n] * P[(ρ₂ : K), q, n] *
        t ^ n * α n * Ring.inverse (D n))
      (fun n => ∑ j ∈ Finset.range (n + 1),
        P[(ρ₁ : K), q, j] * P[(ρ₂ : K), q, j] *
          P[t, q, (n - j)] * t ^ j * β j *
          Ring.inverse (P[q, q, (n - j)] * D n)) := by
  sorry

/-! ## Layer 3: polynomial identities and partition-series adapters -/

/-- Increasingly sorted parts have pairwise gaps at least two, retaining multiplicities. -/
def IsGapTwo {n : ℕ} (p : Nat.Partition n) : Prop :=
  (p.parts.sort (· ≤ ·)).Pairwise (fun a b => a + 2 ≤ b)

/-- Every part has residue one or four modulo five. -/
def IsPlusMinusOneMod5 {n : ℕ} (p : Nat.Partition n) : Prop :=
  ∀ i ∈ p.parts, i % 5 = 1 ∨ i % 5 = 4

open scoped Classical in
/-- The first Rogers-Ramanujan counting theorem on native partitions, including size zero. -/
theorem rogersRamanujan_count (n : ℕ) :
    (Finset.univ.filter (fun p : Nat.Partition n => IsGapTwo p)).card =
      (Finset.univ.filter (fun p : Nat.Partition n => IsPlusMinusOneMod5 p)).card := by
  sorry


open scoped Classical in
/-- The second counting theorem requires minimum part two and residues two or three. -/
theorem rogersRamanujan_count_two (n : ℕ) :
    (Finset.univ.filter (fun p : Nat.Partition n =>
      IsGapTwo p ∧ ∀ i ∈ p.parts, 2 ≤ i)).card =
      (Finset.univ.filter (fun p : Nat.Partition n =>
        ∀ i ∈ p.parts, i % 5 = 2 ∨ i % 5 = 3)).card := by
  sorry

/-- Both Rogers-Ramanujan identities, with nonzero Euler-tail denominators on the disc. -/
theorem rogersRamanujan_hasSum (q : ℂ) (hq : ‖q‖ < 1) :
    HasSum (fun n : ℕ => q ^ (n * n) / P[q, q, n])
      ((∏' j : ℕ, ((1 - q ^ (5 * j + 1)) * (1 - q ^ (5 * j + 4))))⁻¹) ∧
    HasSum (fun n : ℕ => q ^ (n * n + n) / P[q, q, n])
      ((∏' j : ℕ, ((1 - q ^ (5 * j + 2)) * (1 - q ^ (5 * j + 3))))⁻¹) ∧
    Summable (fun n : ℕ => ‖q ^ (n * n) / P[q, q, n]‖) ∧
    Summable (fun n : ℕ => ‖q ^ (n * n + n) / P[q, q, n]‖) := by
  sorry

/-- The quintuple product with integer powers and absolute convergence; Gasper (2.2.10). -/
theorem quintupleProduct_hasSum (q z : ℂ)
    (hq : ‖q‖ < 1) (hq0 : q ≠ 0) (hz : z ≠ 0) :
    HasSum (fun n : ℤ => (-1 : ℂ) ^ n * q ^ (n * (3 * n - 1) / 2) *
      z ^ (3 * n) * (1 + z * q ^ n))
      ((∏' j : ℕ, (1 - q ^ (j + 1)) * (1 + z * q ^ j) * (1 + q / z * q ^ j)) *
        (∏' j : ℕ, (1 - q * z ^ 2 * (q ^ 2) ^ j) *
          (1 - q / z ^ 2 * (q ^ 2) ^ j))) ∧
    Summable (fun n : ℤ => ‖(-1 : ℂ) ^ n * q ^ (n * (3 * n - 1) / 2) *
      z ^ (3 * n) * (1 + z * q ^ n)‖) := by
  sorry

/-! ## Layer 4: rank, crank and arithmetic progressions -/

/-- Rank is the largest part minus the number of parts, with empty value zero. -/
def partitionRank {n : ℕ} (p : Nat.Partition n) : ℤ :=
  ((p.parts.toFinset.sup id : ℕ) : ℤ) - (p.parts.card : ℤ)

/-- Crank is the largest part when there are no ones, and otherwise counts parts
strictly greater than the number of ones minus that number; the empty value is zero. -/
def partitionCrank {n : ℕ} (p : Nat.Partition n) : ℤ :=
  let o := p.parts.count 1
  if o = 0 then ((p.parts.toFinset.sup id : ℕ) : ℤ)
  else ((p.parts.filter (fun j => o < j)).card : ℤ) - (o : ℤ)

/-- Residue counts are finite fibers of an integer statistic on native partitions. -/
noncomputable def partitionResidueCount
    (s : (n : ℕ) → Nat.Partition n → ℤ) (t : ℕ) (r : ZMod t) (n : ℕ) : ℕ :=
  (Finset.univ.filter (fun p : Nat.Partition n => (s n p : ZMod t) = r)).card

/-- The rank dissections yield equidistribution in the two Ramanujan progressions. -/
theorem rank_equidistribution_five_seven (n : ℕ) :
    (∀ r s : ZMod 5, partitionResidueCount (fun _ p => partitionRank p) 5 r (5 * n + 4) =
      partitionResidueCount (fun _ p => partitionRank p) 5 s (5 * n + 4)) ∧
    (∀ r s : ZMod 7, partitionResidueCount (fun _ p => partitionRank p) 7 r (7 * n + 5) =
      partitionResidueCount (fun _ p => partitionRank p) 7 s (7 * n + 5)) := by
  sorry

/-- Ordinary crank is equidistributed for all three specified prime progressions. -/
theorem crank_equidistribution_five_seven_eleven (ℓ d n : ℕ)
    (h : (ℓ = 5 ∧ d = 4) ∨ (ℓ = 7 ∧ d = 5) ∨ (ℓ = 11 ∧ d = 6))
    (r s : ZMod ℓ) :
    partitionResidueCount (fun _ p => partitionCrank p) ℓ r (ℓ * n + d) =
      partitionResidueCount (fun _ p => partitionCrank p) ℓ s (ℓ * n + d) := by
  sorry

/-- Prime-power partition congruences use any representative of the inverse of 24. -/
theorem partition_primePowerCongruences (ℓ r δ n : ℕ)
    (hℓ : ℓ = 5 ∨ ℓ = 7 ∨ ℓ = 11) (hr : 1 ≤ r)
    (hδ : δ < ℓ ^ r) (hcong : Nat.ModEq (ℓ ^ r) (24 * δ) 1) :
    (if ℓ = 7 then 7 ^ (r / 2 + 1) else ℓ ^ r) ∣
      Fintype.card (Nat.Partition (ℓ ^ r * n + δ)) := by
  sorry

/-! ## Layer 5: theta normalizations, error kernels and completed Lerch sums -/

/-- Zwegers' odd theta is the shifted native Jacobi theta with its half-integer phase. -/
def zwegersOddTheta (z τ : ℂ) : ℂ :=
  Complex.I * Complex.exp ((Real.pi : ℂ) * Complex.I * τ / 4 +
    (Real.pi : ℂ) * Complex.I * z) * jacobiTheta₂ (z + (τ + 1) / 2) τ

/-- The nonholomorphic correction is the half-integer series with E(x)=erf(sqrt(pi)*x). -/
def zwegersR (u τ : ℂ) : ℂ :=
  ∑' j : ℤ,
    let ν : ℝ := (j : ℝ) + 1 / 2
    (((if 0 < ν then 1 else -1 : ℝ) -
      TauCeti.Real.erf (Real.sqrt Real.pi *
        ((ν + u.im / τ.im) * Real.sqrt (2 * τ.im))) : ℝ) : ℂ) *
      (-1 : ℂ) ^ j * Complex.exp
        (-(Real.pi : ℂ) * Complex.I * (ν : ℂ) ^ 2 * τ -
          2 * (Real.pi : ℂ) * Complex.I * (ν : ℂ) * u)

/-- The meromorphic Lerch function uses Zwegers' theta normalization and bilateral summands. -/
def zwegersMu (u v τ : ℂ) : ℂ :=
  Complex.exp ((Real.pi : ℂ) * Complex.I * u) / zwegersOddTheta v τ *
    ∑' j : ℤ, (-1 : ℂ) ^ j * Complex.exp
      ((Real.pi : ℂ) * Complex.I * ((j : ℂ) ^ 2 + j) * τ +
        2 * (Real.pi : ℂ) * Complex.I * j * v) /
      (1 - Complex.exp (2 * (Real.pi : ℂ) * Complex.I * ((j : ℂ) * τ + u)))

/-- Adding i/2 times the correction completes the Lerch function off its polar divisors. -/
def zwegersMuHat (u v τ : ℂ) : ℂ :=
  zwegersMu u v τ + Complex.I / 2 * zwegersR (u - v) τ

/-- The completed Lerch function has the full joint integral elliptic law;
Zwegers, Theorem 1.11(1). -/
theorem zwegersMuHat_elliptic (u v τ : ℂ) (hτ : 0 < τ.im)
    (hu : ∀ a b : ℤ, u ≠ (a : ℂ) * τ + b)
    (hv : ∀ a b : ℤ, v ≠ (a : ℂ) * τ + b) (k l m n : ℤ) :
    zwegersMuHat (u + k * τ + l) (v + m * τ + n) τ =
      (-1 : ℂ) ^ (k + l + m + n) * Complex.exp
        ((Real.pi : ℂ) * Complex.I * ((k - m : ℤ) : ℂ) ^ 2 * τ +
          2 * (Real.pi : ℂ) * Complex.I * (k - m : ℤ) * (u - v)) *
        zwegersMuHat u v τ := by
  sorry

/-- The full SL(2,Z) law for the completed Lerch function, with the eta quotient
expressing the multiplier independently of square-root choices; Zwegers, Theorem 1.11(2). -/
theorem zwegersMuHat_modular (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ)
    (u v τ : ℂ) (hτ : 0 < τ.im)
    (hu : ∀ a b : ℤ, u ≠ (a : ℂ) * τ + b)
    (hv : ∀ a b : ℤ, v ≠ (a : ℂ) * τ + b) :
    let w : ℂ := (γ 1 0 : ℂ) * τ + (γ 1 1 : ℂ)
    let γτ : ℂ := ((γ 0 0 : ℂ) * τ + (γ 0 1 : ℂ)) / w
    zwegersMuHat (u / w) (v / w) γτ =
      w ^ 2 * (ModularForm.eta τ / ModularForm.eta γτ) ^ 3 *
        Complex.exp (-(Real.pi : ℂ) * Complex.I * (γ 1 0 : ℂ) * (u - v) ^ 2 / w) *
        zwegersMuHat u v τ := by
  sorry

/-! ## Layer 10: explicit third-, fifth- and seventh-order mock theta vectors -/

/-- Ramanujan's third-order f on the open unit disc, using its actual unilateral summands. -/
noncomputable def thirdOrderF (q : ℂ) : ℂ :=
  ∑' n : ℕ, q ^ (n * n) / P[(-q), q, n] ^ 2

/-- Specialization of the actual rank series at minus one gives the third-order f. -/
theorem thirdOrderF_rank (q : ℂ) (hq : ‖q‖ < 1) :
    HasSum (fun n : ℕ =>
      (∑ p : Nat.Partition n, (-1 : ℂ) ^ partitionRank p) * q ^ n) (thirdOrderF q) := by
  sorry

/-- Ramanujan's third-order ω on the open unit disc, with the squared odd products
`(q;q²)²_(n+1)`; Bringmann–Ono (2.1). -/
noncomputable def thirdOrderOmega (q : ℂ) : ℂ :=
  ∑' n : ℕ, q ^ (2 * n * n + 2 * n) / P[q, (q ^ 2), (n + 1)] ^ 2

/-- The alternating unary theta series g₀(τ) = Σ_(n∈ℤ) (−1)ⁿ (n+1/3) exp(3πi(n+1/3)²τ) of
weight 3/2; Bringmann–Ono (2.4). -/
noncomputable def thirdOrderG0 (τ : ℂ) : ℂ :=
  ∑' n : ℤ, (-1 : ℂ) ^ n * ((n : ℂ) + 1 / 3) *
    Complex.exp (3 * Real.pi * Complex.I * ((n : ℂ) + 1 / 3) ^ 2 * τ)

/-- The unary theta series g₁(τ) = −Σ_(n∈ℤ) (n+1/6) exp(3πi(n+1/6)²τ); Bringmann–Ono (2.4). -/
noncomputable def thirdOrderG1 (τ : ℂ) : ℂ :=
  -∑' n : ℤ, ((n : ℂ) + 1 / 6) *
    Complex.exp (3 * Real.pi * Complex.I * ((n : ℂ) + 1 / 6) ^ 2 * τ)

/-- The unary theta series g₂(τ) = Σ_(n∈ℤ) (n+1/3) exp(3πi(n+1/3)²τ); Bringmann–Ono (2.4). -/
noncomputable def thirdOrderG2 (τ : ℂ) : ℂ :=
  ∑' n : ℤ, ((n : ℂ) + 1 / 3) *
    Complex.exp (3 * Real.pi * Complex.I * ((n : ℂ) + 1 / 3) ^ 2 * τ)

/-- The holomorphic third-order vector F₃ = (q^(−1/24) f(q), 2q^(1/3) ω(q^(1/2)),
2q^(1/3) ω(−q^(1/2))), every fractional q-power meaning exp(2πirτ); Bringmann–Ono (2.2). -/
noncomputable def thirdOrderVector (τ : ℂ) : Fin 3 → ℂ :=
  ![Complex.exp (-(2 * Real.pi * Complex.I * τ) / 24) *
      thirdOrderF (Complex.exp (2 * Real.pi * Complex.I * τ)),
    2 * Complex.exp (2 * Real.pi * Complex.I * τ / 3) *
      thirdOrderOmega (Complex.exp (Real.pi * Complex.I * τ)),
    2 * Complex.exp (2 * Real.pi * Complex.I * τ / 3) *
      thirdOrderOmega (-Complex.exp (Real.pi * Complex.I * τ))]

/-- The period integral ∫_(−τ̄)^(i∞) g(z)/√(−i(z+τ)) dz along the vertical ray z = −τ̄ + it,
t > 0, on which −i(z+τ) = 2 Im τ + t is a positive real, so the root is the real one. -/
noncomputable def rayPeriod (g : ℂ → ℂ) (τ : ℂ) : ℂ :=
  ∫ t in Set.Ioi (0 : ℝ),
    Complex.I * g (-(starRingEnd ℂ) τ + Complex.I * t) / ((Real.sqrt (2 * τ.im + t) : ℝ) : ℂ)

/-- The nonholomorphic correction G₃ = 2i√3 ∫_(−τ̄)^(i∞) (g₁, g₀, −g₂)(z)/√(−i(z+τ)) dz;
Bringmann–Ono (2.3). -/
noncomputable def thirdOrderCorrection (τ : ℂ) : Fin 3 → ℂ :=
  ![2 * Complex.I * (Real.sqrt 3 : ℂ) * rayPeriod thirdOrderG1 τ,
    2 * Complex.I * (Real.sqrt 3 : ℂ) * rayPeriod thirdOrderG0 τ,
    -(2 * Complex.I * (Real.sqrt 3 : ℂ) * rayPeriod thirdOrderG2 τ)]

/-- The completed third-order vector H₃ = F₃ − G₃; Bringmann–Ono (2.5). -/
noncomputable def thirdOrderCompletion (τ : ℂ) : Fin 3 → ℂ :=
  thirdOrderVector τ - thirdOrderCorrection τ

/-- The translation law H₃(τ+1) = T₃ H₃(τ) with T₃ = [[ζ₂₄⁻¹,0,0],[0,0,ζ₃],[0,ζ₃,0]]:
the ω components are exchanged; Zwegers, as stated in Bringmann–Ono, Theorem 2.1. -/
theorem thirdOrderCompletion_T (τ : ℂ) (hτ : 0 < τ.im) :
    thirdOrderCompletion (τ + 1) =
      ![Complex.exp (-(2 * Real.pi * Complex.I) / 24) * thirdOrderCompletion τ 0,
        Complex.exp (2 * Real.pi * Complex.I / 3) * thirdOrderCompletion τ 2,
        Complex.exp (2 * Real.pi * Complex.I / 3) * thirdOrderCompletion τ 1] := by
  sorry

/-- The inversion law H₃(−1/τ) = √(−iτ) S₃ H₃(τ) with S₃ = [[0,1,0],[1,0,0],[0,0,−1]] and
the principal root, positive at τ = i; Zwegers, as stated in Bringmann–Ono, Theorem 2.1. -/
theorem thirdOrderCompletion_S (τ : ℂ) (hτ : 0 < τ.im) :
    thirdOrderCompletion (-1 / τ) =
      ![Complex.sqrt (-Complex.I * τ) * thirdOrderCompletion τ 1,
        Complex.sqrt (-Complex.I * τ) * thirdOrderCompletion τ 0,
        -(Complex.sqrt (-Complex.I * τ) * thirdOrderCompletion τ 2)] := by
  sorry

/-! ## Layer 11: rank specializations at every root of unity -/

/-- Dyson's rank generating function as the complex Durfee-square series
`R(w;q) = Σ_(n≥0) q^(n²)/((wq;q)ₙ (w⁻¹q;q)ₙ)`; Zagier, p. 986–17. -/
noncomputable def rankGenFun (w q : ℂ) : ℂ :=
  ∑' n : ℕ, q ^ (n * n) / (P[(w * q), q, n] * P[(w⁻¹ * q), q, n])

/-- The completed rank specialization at `ξ = e(α)`:
`F_α = q^(−1/24) R(ξ;q) − (D/2) q^(−1/6) (ξ⁻¹ R(τ+3α;3τ) − ξ R(−τ+3α;3τ))` with
`D = e^(−πiα) − e^(πiα)` and Zwegers' correction `R`; at `α = 1/2` it is the first component
of the completed third-order vector. -/
noncomputable def rankCompletion (α : ℚ) (τ : ℂ) : ℂ :=
  let ξ : ℂ := Complex.exp (2 * Real.pi * Complex.I * (α : ℂ))
  let D : ℂ := Complex.exp (-(Real.pi * Complex.I * (α : ℂ))) -
    Complex.exp (Real.pi * Complex.I * (α : ℂ))
  Complex.exp (-(2 * Real.pi * Complex.I * τ) / 24) *
      rankGenFun ξ (Complex.exp (2 * Real.pi * Complex.I * τ)) -
    D / 2 * Complex.exp (-(2 * Real.pi * Complex.I * τ) / 6) *
      (ξ⁻¹ * zwegersR (τ + 3 * (α : ℂ)) (3 * τ) - ξ * zwegersR (-τ + 3 * (α : ℂ)) (3 * τ))

/-- For every `t > 1` the completions `F_(j/t)`, `0 < j < t`, transform with weight 1/2 and one
common multiplier on a principal congruence subgroup, `F(γτ) = χ(γ) √(cτ+d) F(τ)` with the
principal root; Zagier, Theorem 7.1 (Bringmann–Ono). -/
theorem rankCompletion_modular (t : ℕ) (ht : 1 < t) :
    ∃ N : ℕ, 0 < N ∧ ∃ χ : Matrix.SpecialLinearGroup (Fin 2) ℤ → ℂ,
      ∀ γ ∈ CongruenceSubgroup.Gamma N, ∀ j : ℕ, 0 < j → j < t → ∀ τ : ℂ, 0 < τ.im →
        rankCompletion ((j : ℚ) / t)
            (((γ 0 0 : ℂ) * τ + (γ 0 1 : ℂ)) / ((γ 1 0 : ℂ) * τ + (γ 1 1 : ℂ))) =
          χ γ * Complex.sqrt ((γ 1 0 : ℂ) * τ + (γ 1 1 : ℂ)) *
            rankCompletion ((j : ℚ) / t) τ := by
  sorry

/-- Rank-residue deviations are mock modular: for `t > 0` and `r : ZMod t`, the series
`Σ_(n≥0) (N(r,t;n) − p(n)/t) q^(n−1/24)`, with `N(r,t;n)` the number of partitions of `n` of
rank `≡ r`, is the holomorphic part `(1/t) Σ_(0<j<t) ζ_t^(−rj) q^(−1/24) R(ζ_t^j;q)` of
`Φ = (1/t) Σ_(0<j<t) ζ_t^(−rj) F_(j/t)`, and `Φ` transforms with weight 1/2 and a scalar
multiplier on a principal congruence subgroup; Zagier, corollary of Theorem 7.1. -/
theorem rankResidueDeviation_mock (t : ℕ) (ht : 0 < t) (r : ZMod t) :
    let ζ : ℕ → ℂ := fun j =>
      Complex.exp (-(2 * Real.pi * Complex.I * ((r.val * j : ℕ) : ℂ) / t))
    let Φ : ℂ → ℂ := fun τ =>
      (1 / t : ℂ) * ∑ j ∈ Finset.Ioo 0 t, ζ j * rankCompletion ((j : ℚ) / t) τ
    (∀ τ : ℂ, 0 < τ.im →
      HasSum (fun n : ℕ =>
          ((partitionResidueCount (fun _ p => partitionRank p) t r n : ℂ) -
            (Fintype.card (Nat.Partition n) : ℂ) / t) *
            Complex.exp (2 * Real.pi * Complex.I * ((n : ℂ) - 1 / 24) * τ))
        ((1 / t : ℂ) * ∑ j ∈ Finset.Ioo 0 t, ζ j *
          (Complex.exp (-(2 * Real.pi * Complex.I * τ) / 24) *
            rankGenFun (Complex.exp (2 * Real.pi * Complex.I * (((j : ℚ) / t : ℚ) : ℂ)))
              (Complex.exp (2 * Real.pi * Complex.I * τ))))) ∧
    ∃ N : ℕ, 0 < N ∧ ∃ χ : Matrix.SpecialLinearGroup (Fin 2) ℤ → ℂ,
      ∀ γ ∈ CongruenceSubgroup.Gamma N, ∀ τ : ℂ, 0 < τ.im →
        Φ (((γ 0 0 : ℂ) * τ + (γ 0 1 : ℂ)) / ((γ 1 0 : ℂ) * τ + (γ 1 1 : ℂ))) =
          χ γ * Complex.sqrt ((γ 1 0 : ℂ) * τ + (γ 1 1 : ℂ)) * Φ τ := by
  sorry

end

end TauCetiRoadmap.QSeriesPartitionsAndMockModularForms
