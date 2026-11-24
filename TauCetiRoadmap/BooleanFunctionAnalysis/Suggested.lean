import Mathlib

/-!
# Fourier analysis of Boolean functions: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets, API lists and Checks are not
restated.

The cube is the additive group `ι → ZMod 2` for a finite type `ι`, functions on it are real
valued, and averages over the cube are Mathlib's `Finset.expect`, written `𝔼 x, f x`.
-/

noncomputable section

open Finset
open scoped BigOperators

namespace TauCetiRoadmap.BooleanFunctionAnalysis

variable {ι : Type*}

/-! ## Layer 1: the Walsh expansion -/

/-- 1.1 The Walsh character of a finite set `S` of coordinates: `x ↦ ∏ i ∈ S, (-1) ^ x i`. -/
def walsh (S : Finset ι) (x : ι → ZMod 2) : ℝ :=
  ∏ i ∈ S, (-1 : ℝ) ^ (x i).val

/-- 1.1 The Walsh characters are exactly the real additive characters of the cube: every
additive character of `ι → ZMod 2` with values in `ℝ`, for finite `ι`, is `walsh S` for exactly
one `S`. -/
theorem existsUnique_walsh_eq_addChar [Finite ι] (ψ : AddChar (ι → ZMod 2) ℝ) :
    ∃! S : Finset ι, ⇑ψ = walsh S := by
  sorry

variable [Fintype ι] [DecidableEq ι]

/-- 1.2 The Fourier coefficient of `f` at `S`: the average of `f` against the Walsh character
of `S`. -/
def walshCoeff (f : (ι → ZMod 2) → ℝ) (S : Finset ι) : ℝ :=
  𝔼 x, f x * walsh S x

/-- 1.2 The Walsh expansion: every real function on the cube is the sum of its Fourier
coefficients times the Walsh characters. -/
theorem sum_walshCoeff_mul_walsh (f : (ι → ZMod 2) → ℝ) (x : ι → ZMod 2) :
    ∑ S, walshCoeff f S * walsh S x = f x := by
  sorry

/-- 1.3 Plancherel's identity: the average of a product is the sum of the products of the
Fourier coefficients. -/
theorem expect_mul_eq_sum_walshCoeff (f g : (ι → ZMod 2) → ℝ) :
    𝔼 x, f x * g x = ∑ S, walshCoeff f S * walshCoeff g S := by
  sorry

/-- 1.3 The variance of a function on the cube for the uniform probability measure. -/
def variance (f : (ι → ZMod 2) → ℝ) : ℝ :=
  𝔼 x, (f x - 𝔼 y, f y) ^ 2

/-- 1.3 The `p`-norm of a function on the cube for the uniform probability measure. -/
def cubeNorm (p : ℝ) (f : (ι → ZMod 2) → ℝ) : ℝ :=
  (𝔼 x, |f x| ^ p) ^ p⁻¹

/-- 1.4 The Fourier coefficients of the normalized convolution `x ↦ 𝔼 y, f y * g (x - y)` are
the products of the Fourier coefficients. -/
theorem walshCoeff_convolution (f g : (ι → ZMod 2) → ℝ) (S : Finset ι) :
    walshCoeff (fun x => 𝔼 y, f y * g (x - y)) S = walshCoeff f S * walshCoeff g S := by
  sorry

/-! ## Layer 2: influences and the edge boundary -/

/-- 2.1 The influence of coordinate `i` on `f`: the mean square of half the change of `f` when
coordinate `i` is flipped. For a function with values `±1` it is the probability that flipping
coordinate `i` changes the value. -/
def influence (i : ι) (f : (ι → ZMod 2) → ℝ) : ℝ :=
  𝔼 x, ((f x - f (x + Pi.single i 1)) / 2) ^ 2

/-- 2.1 The total influence: the sum of the influences of all coordinates. -/
def totalInfluence (f : (ι → ZMod 2) → ℝ) : ℝ :=
  ∑ i, influence i f

/-- 2.2 The influence of `i` is the Fourier weight on the sets containing `i`. -/
theorem influence_eq_sum_sq_walshCoeff (i : ι) (f : (ι → ZMod 2) → ℝ) :
    influence i f = ∑ S with i ∈ S, walshCoeff f S ^ 2 := by
  sorry

/-- 2.2 The total influence is the Fourier weight counted with the size of the set. -/
theorem totalInfluence_eq_sum_card_mul_sq (f : (ι → ZMod 2) → ℝ) :
    totalInfluence f = ∑ S, (S.card : ℝ) * walshCoeff f S ^ 2 := by
  sorry

/-- 2.3 The Poincaré inequality on the cube with its equality case: the variance is at most the
total influence, with equality exactly for the functions of degree at most one. -/
theorem variance_le_totalInfluence (f : (ι → ZMod 2) → ℝ) :
    variance f ≤ totalInfluence f ∧
      (variance f = totalInfluence f ↔ ∀ S : Finset ι, 2 ≤ S.card → walshCoeff f S = 0) := by
  sorry

/-- 2.4 The edge-isoperimetric inequality of the cube. For `f` with values `±1` and `α` the
density of the set where `f = -1`, the total influence is at least `2 α log₂ (1 / α)`. -/
theorem two_mul_density_mul_logb_le_totalInfluence (f : (ι → ZMod 2) → ℝ)
    (hf : ∀ x, f x = 1 ∨ f x = -1) :
    2 * (𝔼 x, (1 - f x) / 2) * Real.logb 2 (𝔼 x, (1 - f x) / 2)⁻¹ ≤ totalInfluence f := by
  sorry

/-! ## Layer 3: the noise operator -/

/-- 3.1 The noise operator `T_ρ`: the kernel is the product over the coordinates of
`(1 + ρ) / 2` where `x` and `y` agree and `(1 - ρ) / 2` where they differ. -/
def noise (ρ : ℝ) (f : (ι → ZMod 2) → ℝ) (x : ι → ZMod 2) : ℝ :=
  ∑ y, (∏ i, (1 + ρ * (-1) ^ (x i + y i).val) / 2) * f y

/-- 3.2 The noise operator multiplies the Fourier coefficient at `S` by `ρ ^ |S|`, for every
real `ρ`. -/
theorem walshCoeff_noise (ρ : ℝ) (f : (ι → ZMod 2) → ℝ) (S : Finset ι) :
    walshCoeff (noise ρ f) S = ρ ^ S.card * walshCoeff f S := by
  sorry

/-- 3.3 The noise stability of `f` at `ρ`: the average of `f` times `T_ρ f`. -/
def noiseStability (ρ : ℝ) (f : (ι → ZMod 2) → ℝ) : ℝ :=
  𝔼 x, f x * noise ρ f x

/-- 3.3 The Fourier formula for noise stability. -/
theorem noiseStability_eq_sum (ρ : ℝ) (f : (ι → ZMod 2) → ℝ) :
    noiseStability ρ f = ∑ S, ρ ^ S.card * walshCoeff f S ^ 2 := by
  sorry

/-- 3.4 Among the functions with values `±1` and mean zero, and for `0 < ρ < 1`, the noise
stability is at most `ρ`, with equality exactly for the coordinate characters and their
negatives. -/
theorem noiseStability_le_of_expect_eq_zero {ρ : ℝ} (hρ₀ : 0 < ρ) (hρ₁ : ρ < 1)
    (f : (ι → ZMod 2) → ℝ) (hf : ∀ x, f x = 1 ∨ f x = -1) (hmean : 𝔼 x, f x = 0) :
    noiseStability ρ f ≤ ρ ∧
      (noiseStability ρ f = ρ ↔ ∃ i : ι, f = walsh {i} ∨ f = -walsh {i}) := by
  sorry

/-! ## Layer 4: hypercontractivity -/

/-- 4.2 The hypercontractive inequality of Bonami: for `1 ≤ p ≤ q`, `1 < q` and
`ρ ^ 2 ≤ (p - 1) / (q - 1)` the noise operator `T_ρ` is a contraction from the `p`-norm to the
`q`-norm. -/
theorem cubeNorm_noise_le {p q ρ : ℝ} (hp : 1 ≤ p) (hpq : p ≤ q) (hq : 1 < q)
    (hρ : ρ ^ 2 * (q - 1) ≤ p - 1) (f : (ι → ZMod 2) → ℝ) :
    cubeNorm q (noise ρ f) ≤ cubeNorm p f := by
  sorry

/-- 4.3 Moments of functions of degree at most `k`: for `q ≥ 2` the `q`-norm is at most
`(q - 1) ^ (k / 2)` times the `2`-norm. -/
theorem cubeNorm_le_of_degree_le {q : ℝ} (hq : 2 ≤ q) (k : ℕ) (f : (ι → ZMod 2) → ℝ)
    (hf : ∀ S : Finset ι, k < S.card → walshCoeff f S = 0) :
    cubeNorm q f ≤ (q - 1) ^ ((k : ℝ) / 2) * cubeNorm 2 f := by
  sorry

/-- 4.3 Moments of functions of degree at most `k`: for `1 ≤ p ≤ 2` the `2`-norm is at most
`exp ((2 / p - 1) k)` times the `p`-norm; for `p = 1` the factor is `exp k`. -/
theorem cubeNorm_two_le_of_degree_le {p : ℝ} (hp₁ : 1 ≤ p) (hp₂ : p ≤ 2) (k : ℕ)
    (f : (ι → ZMod 2) → ℝ) (hf : ∀ S : Finset ι, k < S.card → walshCoeff f S = 0) :
    cubeNorm 2 f ≤ Real.exp ((2 / p - 1) * k) * cubeNorm p f := by
  sorry

/-- 4.4 Small sets are noise sensitive: for `f` with values in `{-1, 0, 1}` and `0 ≤ ρ ≤ 1`, the
noise stability is at most the density of the support raised to the power `2 / (1 + ρ)`. -/
theorem noiseStability_le_rpow {ρ : ℝ} (hρ₀ : 0 ≤ ρ) (hρ₁ : ρ ≤ 1) (f : (ι → ZMod 2) → ℝ)
    (hf : ∀ x, f x = 0 ∨ f x = 1 ∨ f x = -1) :
    noiseStability ρ f ≤ (𝔼 x, |f x|) ^ (2 / (1 + ρ)) := by
  sorry

/-- 4.5 The level-`k` inequality: for `f` with values in `{0, 1}` and mean `α`, and
`1 ≤ k ≤ 2 log (1 / α)`, the Fourier weight on sets of size at most `k` is at most
`(2 e log (1 / α) / k) ^ k α ^ 2`. -/
theorem sum_sq_walshCoeff_le_of_card_le (f : (ι → ZMod 2) → ℝ) (hf : ∀ x, f x = 0 ∨ f x = 1)
    (k : ℕ) (hk : 1 ≤ k) (hkα : (k : ℝ) ≤ 2 * Real.log (𝔼 x, f x)⁻¹) :
    ∑ S with S.card ≤ k, walshCoeff f S ^ 2 ≤
      (2 * Real.exp 1 / k * Real.log (𝔼 x, f x)⁻¹) ^ k * (𝔼 x, f x) ^ 2 := by
  sorry

/-! ## Layer 5: coordinates of large influence -/

/-- 5.1 For `f` with values `±1` and `0 ≤ ρ ≤ 1`, the Fourier weight on the sets containing `i`,
damped by `ρ ^ (|S| - 1)`, is at most the influence of `i` raised to the power `2 / (1 + ρ)`. -/
theorem sum_pow_mul_sq_walshCoeff_le_influence_rpow {ρ : ℝ} (hρ₀ : 0 ≤ ρ) (hρ₁ : ρ ≤ 1)
    (f : (ι → ZMod 2) → ℝ) (hf : ∀ x, f x = 1 ∨ f x = -1) (i : ι) :
    ∑ S with i ∈ S, ρ ^ (S.card - 1) * walshCoeff f S ^ 2 ≤
      influence i f ^ (2 / (1 + ρ)) := by
  sorry

/-- 5.2 The Kahn–Kalai–Linial theorem in its edge-isoperimetric form: a nonconstant function
with values `±1` whose total influence is `r` times its variance has a coordinate of influence
at least `9 / r ^ 2 * 9 ^ (-r)`. -/
theorem exists_le_influence_of_totalInfluence (f : (ι → ZMod 2) → ℝ)
    (hf : ∀ x, f x = 1 ∨ f x = -1) (hvar : variance f ≠ 0) :
    ∃ i : ι, 9 / (totalInfluence f / variance f) ^ 2 *
      (9 : ℝ) ^ (-(totalInfluence f / variance f)) ≤ influence i f := by
  sorry

/-- 5.3 The Kahn–Kalai–Linial theorem: a function with values `±1` on a cube of dimension
`n ≥ 1` has a coordinate of influence at least `(1 / 5) Var[f] log n / n`. -/
theorem exists_log_div_le_influence [Nonempty ι] (f : (ι → ZMod 2) → ℝ)
    (hf : ∀ x, f x = 1 ∨ f x = -1) :
    ∃ i : ι, 1 / 5 * variance f * Real.log (Fintype.card ι) / Fintype.card ι ≤
      influence i f := by
  sorry

open scoped Classical in
/-- 5.4 The coordinates whose influence on `f` is at least `ε ^ 2 / (9 ^ k I[f] ^ 2)`, written
without division. -/
def influentialSet (ε : ℝ) (k : ℕ) (f : (ι → ZMod 2) → ℝ) : Finset ι :=
  {i | ε ^ 2 ≤ 9 ^ k * totalInfluence f ^ 2 * influence i f}

/-- 5.4 The junta theorem in spectral form: for `f` with values `±1`, `ε > 0` and `k`, the set
`J` of influential coordinates has at most `9 ^ k I[f] ^ 3 / ε ^ 2` elements, and the Fourier
weight of `f` on the sets of size at most `k` that are not contained in `J` is at most `ε`. -/
theorem sum_sq_walshCoeff_le_of_not_subset_influentialSet {ε : ℝ} (hε : 0 < ε) (k : ℕ)
    (f : (ι → ZMod 2) → ℝ) (hf : ∀ x, f x = 1 ∨ f x = -1) :
    ((influentialSet ε k f).card : ℝ) * ε ^ 2 ≤ 9 ^ k * totalInfluence f ^ 3 ∧
      ∑ S with S.card ≤ k ∧ ¬ S ⊆ influentialSet ε k f, walshCoeff f S ^ 2 ≤ ε := by
  sorry

open scoped Classical in
/-- 5.4 Friedgut's junta theorem: if moreover `I[f] ≤ ε k`, then `f` differs on at most a
fraction `2 ε` of the cube from a function with values `±1` that depends only on the
coordinates in `J`. -/
theorem exists_junta_dens_ne_le {ε : ℝ} (hε : 0 < ε) (k : ℕ) (f : (ι → ZMod 2) → ℝ)
    (hf : ∀ x, f x = 1 ∨ f x = -1) (hk : totalInfluence f ≤ ε * k) :
    ∃ h : (ι → ZMod 2) → ℝ, (∀ x, h x = 1 ∨ h x = -1) ∧
      (∀ x y, (∀ i ∈ influentialSet ε k f, x i = y i) → h x = h y) ∧
      (({x | f x ≠ h x} : Finset (ι → ZMod 2)).dens : ℝ) ≤ 2 * ε := by
  sorry

/-! ## Layer 6: linearity testing and Arrow's theorem -/

/-- 6.1 The triple correlation along the additive triples `(x, y, x + y)` is the sum of the
products of the Fourier coefficients. -/
theorem expect_mul_mul_add_eq_sum (f g h : (ι → ZMod 2) → ℝ) :
    𝔼 x, 𝔼 y, f x * g y * h (x + y) =
      ∑ S, walshCoeff f S * walshCoeff g S * walshCoeff h S := by
  sorry

open scoped Classical in
/-- 6.1 Soundness of the linearity test of Blum, Luby and Rubinfeld: a function with values `±1`
agrees with some Walsh character outside a set whose density is at most the density of the
pairs `(x, y)` with `f x * f y ≠ f (x + y)`. -/
theorem exists_walsh_dens_ne_le (f : (ι → ZMod 2) → ℝ) (hf : ∀ x, f x = 1 ∨ f x = -1) :
    ∃ S : Finset ι, ({x | f x ≠ walsh S x} : Finset (ι → ZMod 2)).dens ≤
      ({p | f p.1 * f p.2 ≠ f (p.1 + p.2)} :
        Finset ((ι → ZMod 2) × (ι → ZMod 2))).dens := by
  sorry

/-- 6.2 The triples `(x, y, z)` of points of the cube such that in no coordinate the three
entries are equal: the pairwise comparisons of `|ι|` voters who each rank three candidates. -/
def naeProfiles (ι : Type*) [Fintype ι] [DecidableEq ι] :
    Finset ((ι → ZMod 2) × (ι → ZMod 2) × (ι → ZMod 2)) :=
  {p | ∀ i, ¬(p.1 i = p.2.1 i ∧ p.2.1 i = p.2.2 i)}

open scoped Classical in
/-- 6.2 Kalai's formula: for `f` with values `±1`, the fraction of the profiles on which the three
values of `f` are not all equal is `3 / 4 - 3 / 4 * Stab_{-1/3}[f]`. -/
theorem card_filter_naeProfiles_div (f : (ι → ZMod 2) → ℝ) (hf : ∀ x, f x = 1 ∨ f x = -1) :
    ((naeProfiles ι).filter (fun p => ¬(f p.1 = f p.2.1 ∧ f p.2.1 = f p.2.2))).card /
        ((naeProfiles ι).card : ℝ) =
      3 / 4 - 3 / 4 * noiseStability (-1 / 3) f := by
  sorry

/-- 6.3 Arrow's theorem for three candidates and one pairwise rule: if `f` has values `±1` and
its three values are never all equal on a profile, then `f` is a coordinate character or the
negative of one. -/
theorem exists_eq_walsh_singleton_of_forall_naeProfiles (f : (ι → ZMod 2) → ℝ)
    (hf : ∀ x, f x = 1 ∨ f x = -1)
    (h : ∀ p ∈ naeProfiles ι, ¬(f p.1 = f p.2.1 ∧ f p.2.1 = f p.2.2)) :
    ∃ i : ι, f = walsh {i} ∨ f = -walsh {i} := by
  sorry

end TauCetiRoadmap.BooleanFunctionAnalysis
