import Mathlib
import TauCeti.NumberTheory.NumberField.Global.Places.Basic
import TauCetiRoadmap.DiophantineApproximationAndTranscendence.Suggested

/-!
# Roth's theorem and the Subspace Theorem over number fields: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`, which numbers the milestones as Layer `n.m`. The declarations below suggest Lean forms
for particular milestones, so that contributors and reviewers converge on names and signatures;
discharging all of them finishes neither a layer nor the roadmap. `sorry` marks goals, not results.

Names are unqualified inside `TauCetiRoadmap.SubspaceTheorem`; in `TauCeti/` they take the
qualified names `README.md` pins (`NumberField.approxProd`, `Real.mahlerExponent_eq_of_isAlgebraic`,
…). The exponents, the Hasse derivative, the weighted index, the polynomial height, general
position, nondegenerate solutions and the subspace height are DiophantineApproximationAndTranscendence's
carriers, imported from its `Suggested.lean` and used directly; where Tau Ceti already holds the
same definition (`TauCeti.irrationalityExponent`, `MvPolynomial.hasseDeriv`,
`MvPolynomial.weightedIndex`, `MvPolynomial.logHeight`), the port consumes Tau Ceti's. The affine
height `Height.mulHeightAff x` is written out as `mulHeight (fun o : Option ι ↦ o.elim 1 x)`, its
definition. Successive minima over `K` (Layer 4.2) are stated against SuccessiveMinima's
`successiveMin` and live in the README only.

Every height is Mathlib's **relative** height over the fixed number field; the local factor at an
infinite place carries the exponent `InfinitePlace.mult`; a finite set of places is a pair of
**typed** finsets `Sinf`, `Sfin` (the README's `S∞`, `S₀`), and `S` for `S`-integers and `S`-units
is a `Finset (HeightOneSpectrum (𝓞 K))`. The README explains why each choice is forced; in
particular the Subspace Theorem over an untyped `Finset (AbsoluteValue K ℝ)` is false.
-/

noncomputable section

namespace TauCetiRoadmap.SubspaceTheorem

open Height NumberField Module Polynomial IsDedekindDomain Filter
open scoped ENNReal NNReal
open TauCetiRoadmap.DiophantineApproximationAndTranscendence.DiophantineApproximation
  (irrationalityExponent mahlerExponent algebraicApproximationExponent InGeneralPosition
    IsNondegenerateSolution IsNondegenerateHomogeneousSolution relativeSubspaceHeight)

/-- DAT's relative logarithmic height of a multivariate polynomial (Tau Ceti's
`MvPolynomial.logHeight`). -/
local notation "polyLogHeight" =>
  TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial.logHeight

/-- DAT's weighted index (Tau Ceti's `MvPolynomial.weightedIndex`). -/
local notation "weightedIndex" =>
  TauCetiRoadmap.DiophantineApproximationAndTranscendence.MvPolynomial.weightedIndex

/-! ## Layer 0: absolute values above a place and the `S`-adic dictionary -/

section PlacesOver

variable {K F : Type*} [Field K] [NumberField K] [Field F] [NumberField F] [Algebra K F]

/-- **Layer 0.1.** An absolute value of `F` over an infinite place of `K` is the absolute value of
an infinite place of `F`. -/
theorem isInfinitePlace_of_liesOver (v : InfinitePlace K) (w : AbsoluteValue F ℝ)
    [w.LiesOver v.1] : ∃ w' : InfinitePlace F, w'.1 = w :=
  sorry

/-- **Layer 0.1.** An absolute value of `F` over a finite place of `K` is a root of the absolute
value of a finite place of `F`; the README pins the exponent as `(e f)⁻¹`. It is `1` only when the
prime is unramified of inertia degree one, so `w` is in general **not** a `FinitePlace F`. -/
theorem exists_finitePlace_rpow_inv_eq_of_liesOver (v : FinitePlace K) (w : AbsoluteValue F ℝ)
    [w.LiesOver v.1] :
    ∃ (P : HeightOneSpectrum (𝓞 F)) (t : ℝ), 0 < t ∧ t ≤ 1 ∧
      ∀ y : F, w y = FinitePlace.mk P y ^ t :=
  sorry

/-- **Layer 0.1.** Above every place there is an absolute value, and only finitely many. -/
theorem finite_nonempty_setOf_liesOver (v : AbsoluteValue K ℝ)
    (hv : IsInfinitePlace v ∨ IsFinitePlace v) :
    {w : AbsoluteValue F ℝ | w.LiesOver v}.Finite ∧
      {w : AbsoluteValue F ℝ | w.LiesOver v}.Nonempty :=
  sorry

/-- **Layer 0.1.** An infinite place and a finite place never have the same underlying absolute
value. -/
theorem val_ne_finitePlace_val (v : InfinitePlace K) (u : FinitePlace K) : v.1 ≠ u.1 :=
  sorry

/-- **Layer 0.1** (`AbsoluteValue.nonarchRpow`). Every positive power of a nonarchimedean absolute
value is an absolute value. -/
theorem exists_rpow_of_isNonarchimedean {R : Type*} [Field R] (v : AbsoluteValue R ℝ)
    (hv : IsNonarchimedean ⇑v) {t : ℝ} (ht : 0 < t) :
    ∃ w : AbsoluteValue R ℝ, ∀ x, w x = v x ^ t :=
  sorry

/-- **Layer 0.1**, rejection test: for an archimedean absolute value only `t ≤ 1` works. -/
example : ¬ ∃ w : AbsoluteValue ℚ ℝ, ∀ x : ℚ, w x = |(x : ℝ)| ^ (2 : ℝ) :=
  sorry

/-- **Layer 0.2.** For `F/K` Galois the Galois group acts transitively on the absolute values
over a place. -/
theorem exists_algEquiv_comp_eq [IsGalois K F] (v : AbsoluteValue K ℝ)
    (hv : IsInfinitePlace v ∨ IsFinitePlace v) (w w' : AbsoluteValue F ℝ)
    [w.LiesOver v] [w'.LiesOver v] : ∃ σ : F ≃ₐ[K] F, ∀ y, w' y = w (σ y) :=
  sorry

end PlacesOver

section SAdic

variable {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι]

/-- **Layer 0.3.** The `S`-product formula. -/
theorem prod_pow_mult_mul_prod_eq_one (S : Finset (HeightOneSpectrum (𝓞 K))) {u : Kˣ}
    (hu : u ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K) :
    (∏ v : InfinitePlace K, v (u : K) ^ v.mult) * ∏ v ∈ S, FinitePlace.mk v (u : K) = 1 :=
  sorry

/-- **Layer 0.3.** After enlarging `S`, the height of every nonzero point is, after one scaling,
the product of its local sup norms over the infinite places and `S`. -/
theorem exists_finset_superset_forall_exists_mulHeight_eq
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    ∃ S' : Finset (HeightOneSpectrum (𝓞 K)), S ⊆ S' ∧
      ∀ x : ι → K, x ≠ 0 → ∃ c : K, c ≠ 0 ∧
        (∀ j, c * x j ∈ (S' : Set (HeightOneSpectrum (𝓞 K))).integer K) ∧
        mulHeight x = (∏ v : InfinitePlace K, (⨆ j, v (c * x j)) ^ v.mult) *
          ∏ v ∈ S', ⨆ j, FinitePlace.mk v (c * x j) :=
  sorry

/-- **Layer 0.4.** The fundamental identity: the truncated local factors over all places multiply
to the inverse height. -/
theorem prod_min_one_apply_eq_inv_mulHeight₁ {α : K} (hα : α ≠ 0) :
    (∏ v : InfinitePlace K, min 1 (v α) ^ v.mult) * ∏ᶠ v : FinitePlace K, min 1 (v α) =
      (mulHeight₁ α)⁻¹ :=
  sorry

/-- **Layer 0.4.** Liouville's inequality over a number field, with targets in a finite extension
measured by absolute values over the places. -/
theorem inv_le_prod_min_one_sub {F : Type*} [Field F] [NumberField F] [Algebra K F]
    (Sinf : Finset (InfinitePlace K)) (Sfin : Finset (FinitePlace K))
    (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v ∈ Sinf, (w v.1).LiesOver v.1) (hwFin : ∀ v ∈ Sfin, (w v.1).LiesOver v.1)
    {α : F} {β : K} (h : algebraMap K F β ≠ α) :
    (2 ^ finrank ℚ F * mulHeight₁ α * mulHeight₁ β ^ finrank K F)⁻¹ ≤
      (∏ v ∈ Sinf, min 1 (w v.1 (algebraMap K F β - α)) ^ v.mult) *
        ∏ v ∈ Sfin, min 1 (w v.1 (algebraMap K F β - α)) :=
  sorry

end SAdic

/-! ## Layer 1: approximation exponents -/

section Exponents

/-- **Layer 1.1.** -/
theorem liouvilleWith_inv {p ξ : ℝ} (hp : 1 < p) (hξ : ξ ≠ 0) (h : LiouvilleWith p ξ) :
    LiouvilleWith p ξ⁻¹ :=
  sorry

/-- **Layer 1.1.** Möbius invariance of the irrationality exponent. -/
theorem irrationalityExponent_mobius (ξ : ℝ) {a b c d : ℚ} (had : a * d - b * c ≠ 0)
    (hξ : (c : ℝ) * ξ + d ≠ 0) :
    irrationalityExponent (((a : ℝ) * ξ + b) / ((c : ℝ) * ξ + d)) = irrationalityExponent ξ :=
  sorry

/-- **Layer 1.1.** Northcott for integer polynomials of bounded degree. -/
theorem finite_setOf_natDegree_le_supNorm_le (n : ℕ) (B : ℝ) :
    {P : ℤ[X] | P.natDegree ≤ n ∧ P.supNorm ≤ B}.Finite :=
  sorry

/-- **Layer 1.1**, rejection test: Gelfond's constant `2 ^ deg` cannot be dropped. -/
example : ((2 * X + 1) * (X - 2) : ℤ[X]).supNorm = 3 ∧ (2 * X + 1 : ℤ[X]).supNorm = 2 ∧
    (X - 2 : ℤ[X]).supNorm = 2 :=
  sorry

/-- **Layer 1.2.** Liouville's bound: `w_n(ξ) ≤ D − 1` for `ξ` algebraic of degree `D`. -/
theorem mahlerExponent_le_of_isAlgebraic {ξ : ℝ} (hξ : IsAlgebraic ℚ ξ) (n : ℕ) :
    mahlerExponent n ξ ≤ (((minpoly ℚ ξ).natDegree - 1 : ℕ) : ℝ≥0∞) :=
  sorry

/-- **Layer 1.2.** Wirsing's third inequality. At `w_n = n` it reads `n ≤ w_n^*`. -/
theorem div_le_algebraicApproximationExponent {n : ℕ} {ξ : ℝ}
    (hξ : ¬ (IsAlgebraic ℚ ξ ∧ (minpoly ℚ ξ).natDegree ≤ n)) :
    mahlerExponent n ξ / (mahlerExponent n ξ - n + 1) ≤ algebraicApproximationExponent n ξ :=
  sorry

/-- **Layer 1.2.** Wirsing's second inequality. -/
theorem mahlerExponent_add_one_le_two_mul {n : ℕ} (hn : 1 ≤ n) {ξ : ℝ}
    (hξ : ¬ (IsAlgebraic ℚ ξ ∧ (minpoly ℚ ξ).natDegree ≤ n)) :
    mahlerExponent n ξ + 1 ≤ 2 * algebraicApproximationExponent n ξ :=
  sorry

/-- **Layer 1.3.** Mahler's invariant `w(ξ) = limsup w_n(ξ) / n`. -/
def mahlerInvariant (ξ : ℝ) : ℝ≥0∞ :=
  limsup (fun n : ℕ ↦ mahlerExponent n ξ / n) atTop

/-- **Layer 1.3.** Mahler's `A`-numbers. -/
def IsANumber (ξ : ℝ) : Prop := mahlerInvariant ξ = 0

/-- **Layer 1.3.** Mahler's `U`-numbers. -/
def IsUNumber (ξ : ℝ) : Prop := ∃ n, mahlerExponent n ξ = ⊤

/-- **Layer 1.3.** -/
theorem isANumber_iff (ξ : ℝ) : IsANumber ξ ↔ IsAlgebraic ℚ ξ :=
  sorry

/-- **Layer 1.3.** Liouville numbers are `U`-numbers. -/
theorem Liouville.isUNumber {ξ : ℝ} (h : Liouville ξ) : IsUNumber ξ :=
  sorry

end Exponents

/-! ## Layer 2: the auxiliary polynomial over a number field -/

section Auxiliary

/-- **Layer 2.1.** The volume `V_m(t)` of `{x ∈ [0, 1]^m | ∑ x j ≤ t}`. -/
def simplexVolume (m : ℕ) (t : ℝ) : ℝ :=
  (MeasureTheory.volume {x : Fin m → ℝ | (∀ j, x j ∈ Set.Icc (0 : ℝ) 1) ∧ ∑ j, x j ≤ t}).toReal

/-- **Layer 2.1.** The normalization check. -/
example {t : ℝ} (ht : 0 ≤ t) : simplexVolume 1 t = min 1 t :=
  sorry

/-- **Layer 2.1.** The tail, with no upper bound on `ε`. -/
theorem simplexVolume_tail_le (m : ℕ) {ε : ℝ} (hε : 0 ≤ ε) :
    simplexVolume m ((1 / 2 - ε) * m) ≤ Real.exp (-6 * m * ε ^ 2) :=
  sorry

/-- **Layer 2.1.** `sinh u ≤ u exp (u² / 6)`, sharp at second order. -/
theorem sinh_le_mul_exp_sq_div_six {u : ℝ} (hu : 0 ≤ u) :
    Real.sinh u ≤ u * Real.exp (u ^ 2 / 6) :=
  sorry

variable {K F : Type*} [Field K] [NumberField K] [Field F] [NumberField F] [Algebra K F]

/-- **Layer 2.2** (Bombieri–Gubler, Lemma 6.3.4). The auxiliary polynomial of prescribed index at
several points of `Fᵐ`, with coefficients in `K`, in relative logarithmic heights: the book's
absolute bound multiplied by `[K : ℚ]`, so `logHeight₁ (α k j)` (relative to `F`) is divided by
`[F : K]` and `log 2` carries the factor `[K : ℚ]`. -/
theorem exists_ne_zero_le_weightedIndex_logHeight_le {m N : ℕ} (α : Fin N → Fin m → F)
    (t : Fin N → ℝ) (ht : ∀ k, 0 < t k)
    (hV : (finrank K F : ℝ) * ∑ k, simplexVolume m (t k) < 1) {δ : ℝ} (hδ : 0 < δ) :
    ∃ D₀ : ℕ, ∀ d : Fin m → ℕ, (∀ j, D₀ ≤ d j) →
      ∃ P : MvPolynomial (Fin m) K, P ≠ 0 ∧ (∀ j, P.degreeOf j ≤ d j) ∧
        (∀ k, ENNReal.ofReal (t k) ≤
          weightedIndex d (α k) (MvPolynomial.map (algebraMap K F) P)) ∧
        polyLogHeight P ≤
          (finrank K F : ℝ) / (1 - (finrank K F : ℝ) * ∑ k, simplexVolume m (t k)) *
          ∑ k, ∑ j, simplexVolume m (t k) *
            (logHeight₁ (α k j) / finrank K F + finrank ℚ K * Real.log 2 + δ) * d j :=
  sorry

end Auxiliary

/-! ## Layer 3: Roth's theorem -/

section Roth

variable {K F : Type*} [Field K] [NumberField K] [Field F] [NumberField F] [Algebra K F]

/-- **Layer 3.1.** `(L, M)`-independent sequences of heights. -/
def IsHeightIndependent (L M : ℝ) {m : ℕ} (β : Fin m → K) : Prop :=
  (∀ h : 0 < m, L ≤ logHeight₁ (β ⟨0, h⟩)) ∧
    ∀ j : Fin m, ∀ hj : (j : ℕ) + 1 < m, M * logHeight₁ (β j) ≤ logHeight₁ (β ⟨j + 1, hj⟩)

/-- **Layer 3.1.** Every infinite set contains independent tuples of every length. -/
theorem exists_isHeightIndependent {X : Set K} (hX : X.Infinite) (L M : ℝ) (m : ℕ) :
    ∃ β : Fin m → K, Function.Injective β ∧ (∀ j, β j ∈ X) ∧ IsHeightIndependent L M β :=
  sorry

/-- **Layer 3.2** (Roth; Ridout; Lang; Bombieri–Gubler, Theorem 6.4.1). -/
theorem finite_setOf_prod_min_one_le (Sinf : Finset (InfinitePlace K))
    (Sfin : Finset (FinitePlace K)) (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v ∈ Sinf, (w v.1).LiesOver v.1) (hwFin : ∀ v ∈ Sfin, (w v.1).LiesOver v.1)
    (α : AbsoluteValue K ℝ → F) {κ : ℝ} (hκ : 2 < κ) :
    {β : K | (∏ v ∈ Sinf, min 1 (w v.1 (algebraMap K F β - α v.1)) ^ v.mult) *
        ∏ v ∈ Sfin, min 1 (w v.1 (algebraMap K F β - α v.1)) ≤ mulHeight₁ β ^ (-κ)}.Finite :=
  sorry

/-- **Layer 3.3.** The local factor at a target in `OnePoint F`: `min 1 (w (β − t))` at a finite
target and `(max 1 (w β))⁻¹` at `∞`. -/
def onePointApprox (w : AbsoluteValue F ℝ) (β : F) (t : OnePoint F) : ℝ :=
  OnePoint.rec (C := fun _ ↦ ℝ) (max 1 (w β))⁻¹ (fun a ↦ min 1 (w (β - a))) t

/-- **Layer 3.3.** Roth's theorem with targets at infinity and a constant. -/
theorem finite_setOf_prod_onePointApprox_le_const (Sinf : Finset (InfinitePlace K))
    (Sfin : Finset (FinitePlace K)) (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v ∈ Sinf, (w v.1).LiesOver v.1) (hwFin : ∀ v ∈ Sfin, (w v.1).LiesOver v.1)
    (α : AbsoluteValue K ℝ → OnePoint F) {κ : ℝ} (hκ : 2 < κ) (C : ℝ) :
    {β : K | (∏ v ∈ Sinf, onePointApprox (w v.1) (algebraMap K F β) (α v.1) ^ v.mult) *
        ∏ v ∈ Sfin, onePointApprox (w v.1) (algebraMap K F β) (α v.1) ≤
          C * mulHeight₁ β ^ (-κ)}.Finite :=
  sorry

/-- **Layer 3.3.** The finite places of `ℚ` are the `p`-adic norms, with exponent exactly `1`. -/
theorem Rat.exists_prime_padic_eq (v : FinitePlace ℚ) :
    ∃ p : ℕ, p.Prime ∧ ∀ x : ℚ, v x = (padicNorm p x : ℝ) :=
  sorry

/-- **Layer 3.3.** Roth's theorem as a value. -/
theorem irrationalityExponent_eq_two {α : ℝ} (hα : IsAlgebraic ℚ α) (hirr : Irrational α) :
    irrationalityExponent α = 2 :=
  sorry

/-- **Layer 3.3** (Ridout 1958). -/
theorem Rat.finite_setOf_ridout {α : ℝ} (hα : IsAlgebraic ℚ α) (S₁ S₂ : Finset ℕ)
    (hS₁ : ∀ p ∈ S₁, p.Prime) (hS₂ : ∀ p ∈ S₂, p.Prime) {ε : ℝ} (hε : 0 < ε) :
    {x : ℚ | |α - x| * (∏ p ∈ S₁, (padicNorm p x.num : ℝ)) * ∏ p ∈ S₂, (padicNorm p x.den : ℝ) ≤
      (max |(x.num : ℝ)| x.den) ^ (-2 - ε)}.Finite :=
  sorry

/-- **Layer 3.3**, rejection test: Roth's theorem is false at `κ = 2`. -/
example : ¬ {β : ℚ | min 1 |Real.sqrt 2 - 1 - β| ≤ mulHeight₁ β ^ (-2 : ℝ)}.Finite :=
  sorry

/-- **Layer 3.4.** The central quantity of the Subspace Theorem. -/
def approxProd {ι : Type*} [Fintype ι] (Sinf : Finset (InfinitePlace K))
    (Sfin : Finset (FinitePlace K)) (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (L : AbsoluteValue K ℝ → ι → Dual F (ι → F)) (x : ι → K) : ℝ :=
  (∏ v ∈ Sinf, (∏ i, w v.1 (L v.1 i fun j ↦ algebraMap K F (x j)) / ⨆ j, v (x j)) ^ v.mult) *
    ∏ v ∈ Sfin, ∏ i, w v.1 (L v.1 i fun j ↦ algebraMap K F (x j)) / ⨆ j, v (x j)

/-- **Layer 3.4.** `approxProd` is projective, because `w v` lies over `v`. -/
theorem approxProd_smul {ι : Type*} [Fintype ι] (Sinf : Finset (InfinitePlace K))
    (Sfin : Finset (FinitePlace K)) (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v ∈ Sinf, (w v.1).LiesOver v.1) (hwFin : ∀ v ∈ Sfin, (w v.1).LiesOver v.1)
    (L : AbsoluteValue K ℝ → ι → Dual F (ι → F)) {c : K} (hc : c ≠ 0) (x : ι → K) :
    approxProd Sinf Sfin w L (c • x) = approxProd Sinf Sfin w L x :=
  sorry

/-- **Layer 3.4.** Roth's theorem on the projective line, stated for any two-element index type
so that Layer 6.6 is an equation between theorems. -/
theorem exists_finset_submodule_of_approxProd_le_card_two {ι : Type*} [Fintype ι]
    (hι : Fintype.card ι = 2) (Sinf : Finset (InfinitePlace K)) (Sfin : Finset (FinitePlace K))
    (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v ∈ Sinf, (w v.1).LiesOver v.1) (hwFin : ∀ v ∈ Sfin, (w v.1).LiesOver v.1)
    (L : AbsoluteValue K ℝ → ι → Dual F (ι → F))
    (hLInf : ∀ v ∈ Sinf, LinearIndependent F (L v.1))
    (hLFin : ∀ v ∈ Sfin, LinearIndependent F (L v.1)) {ε : ℝ} (hε : 0 < ε) :
    ∃ T : Finset (Submodule K (ι → K)), (∀ W ∈ T, W ≠ ⊤) ∧
      ∀ x : ι → K, x ≠ 0 →
        approxProd Sinf Sfin w L x ≤ mulHeight x ^ (-(Fintype.card ι : ℝ) - ε) →
        ∃ W ∈ T, x ∈ W :=
  sorry

/-- **Layer 3.5** (Mahler 1957). -/
theorem Nat.eventually_exp_neg_lt_abs_sub_round {p q : ℕ} (hq : 2 ≤ q) (hpq : q < p)
    (hcop : p.Coprime q) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ k : ℕ in atTop,
      Real.exp (-ε * k) < |((p : ℝ) / q) ^ k - round (((p : ℝ) / q) ^ k)| :=
  sorry

/-- **Layer 3.7** (Vojta; Bombieri–Gubler, Theorem 6.5.2). Moving targets: only finitely many
indices carry a solution when the targets' heights are `o` of the approximants'. -/
theorem finite_setOf_prod_min_one_le_of_isLittleO (Sinf : Finset (InfinitePlace K))
    (Sfin : Finset (FinitePlace K)) (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v ∈ Sinf, (w v.1).LiesOver v.1) (hwFin : ∀ v ∈ Sfin, (w v.1).LiesOver v.1)
    (α : ℕ → AbsoluteValue K ℝ → F) (β : ℕ → K)
    (hαβ : (fun j ↦ 1 + ∑ v ∈ Sinf, logHeight₁ (α j v.1) + ∑ v ∈ Sfin, logHeight₁ (α j v.1))
      =o[atTop] fun j ↦ logHeight₁ (β j))
    {κ : ℝ} (hκ : 2 < κ) :
    {j | (∏ v ∈ Sinf, min 1 (w v.1 (algebraMap K F (β j) - α j v.1)) ^ v.mult) *
        ∏ v ∈ Sfin, min 1 (w v.1 (algebraMap K F (β j) - α j v.1)) ≤
          mulHeight₁ (β j) ^ (-κ)}.Finite :=
  sorry

end Roth

/-! ## Layer 4: parallelepipeds over a number field -/

section Parallelepiped

variable {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι]

/-- **Layer 4.1.** The approximation domain of level `Q`. -/
def approxDomain (Sfin : Finset (FinitePlace K)) (L : AbsoluteValue K ℝ → ι → Dual K (ι → K))
    (c : AbsoluteValue K ℝ → ι → ℝ) (Q : ℝ) : Set (ι → K) :=
  {x | (∀ (v : InfinitePlace K) (i : ι), v (L v.1 i x) ≤ Q ^ c v.1 i) ∧
    (∀ v ∈ Sfin, ∀ i : ι, v (L v.1 i x) ≤ Q ^ c v.1 i) ∧
    ∀ v : FinitePlace K, v ∉ Sfin → ∀ j : ι, v (x j) ≤ 1}

/-- **Layer 4.1.** The weight: the exponent of `Q` in the product of the local bounds. -/
def approxWeight (Sfin : Finset (FinitePlace K)) (c : AbsoluteValue K ℝ → ι → ℝ) : ℝ :=
  ∑ v : InfinitePlace K, v.mult * ∑ i, c v.1 i + ∑ v ∈ Sfin, ∑ i, c v.1 i

/-- **Layer 4.1.** The absolute weight, the same sum over `|c v i|`. -/
def approxAbsWeight (Sfin : Finset (FinitePlace K)) (c : AbsoluteValue K ℝ → ι → ℝ) : ℝ :=
  ∑ v : InfinitePlace K, v.mult * ∑ i, |c v.1 i| + ∑ v ∈ Sfin, ∑ i, |c v.1 i|

/-- **Layer 4.3.** The span `V(Q)` of the domain. -/
def approxSpan (Sfin : Finset (FinitePlace K)) (L : AbsoluteValue K ℝ → ι → Dual K (ι → K))
    (c : AbsoluteValue K ℝ → ι → ℝ) (Q : ℝ) : Submodule K (ι → K) :=
  Submodule.span K (approxDomain Sfin L c Q)

/-- **Layer 4.1.** The largest value of a finite place on `Kˣ` below a positive bound exists. -/
theorem FinitePlace.exists_floorValue (v : FinitePlace K) {t : ℝ} (ht : 0 < t) :
    ∃ a : Kˣ, v (a : K) ≤ t ∧ ∀ b : Kˣ, v (b : K) ≤ t → v (b : K) ≤ v (a : K) :=
  sorry

/-- **Layer 4.1**, the book's finite-place volume is only an inequality: at the `2`-adic place
of `ℚ`, with `L = id`, `c = 1`, `Q = 3/2`, the module is `ℤ`. -/
example (v : FinitePlace ℚ) (hv : ∀ x : ℚ, v x = (padicNorm 2 x : ℝ)) (x : ℚ) :
    (v x ≤ (3 / 2 : ℝ) ↔ v x ≤ 1) :=
  sorry

/-- **Layer 4.3.** Negative weight makes the span eventually proper. -/
theorem eventually_approxSpan_ne_top (Sfin : Finset (FinitePlace K))
    (L : AbsoluteValue K ℝ → ι → Dual K (ι → K))
    (hLInf : ∀ v : InfinitePlace K, LinearIndependent K (L v.1))
    (hLFin : ∀ v ∈ Sfin, LinearIndependent K (L v.1))
    (c : AbsoluteValue K ℝ → ι → ℝ) (hc : approxWeight Sfin c < 0) :
    ∀ᶠ Q in atTop, approxSpan Sfin L c Q ≠ ⊤ :=
  sorry

/-- **Layer 4.4.** Simultaneous approximation by `S₀`-integers, with a constant depending only on
`K`. -/
theorem exists_forall_apply_add_le :
    ∃ A : ℝ, ∀ (Sfin : Finset (FinitePlace K)) (γ : AbsoluteValue K ℝ → K), ∃ ξ : K,
      (∀ v : FinitePlace K, v ∉ Sfin → v ξ ≤ 1) ∧ (∀ v ∈ Sfin, v (ξ + γ v.1) ≤ 1) ∧
        ∀ v : InfinitePlace K, v (ξ + γ v.1) ≤ A :=
  sorry

/-- **Layer 4.4** (Evertse 1996; Bombieri–Gubler, Lemma 7.5.29), unweighted. The constant is
chosen before the places, the forms and the vectors. -/
theorem exists_evertse_unweighted (m : ℕ) :
    ∃ C : ℝ, ∀ (Sfin : Finset (FinitePlace K)) (L : AbsoluteValue K ℝ → Fin m → Dual K (Fin m → K))
      (x : Fin m → Fin m → K), LinearIndependent K x →
      ∀ μ : AbsoluteValue K ℝ → Fin m → ℝ, (∀ v, Monotone (μ v)) →
      (∀ (v : InfinitePlace K) (k j : Fin m), v (L v.1 k (x j)) ≤ μ v.1 j) →
      (∀ v ∈ Sfin, ∀ k j : Fin m, v (L v.1 k (x j)) ≤ μ v.1 j) →
      ∃ (ξ : Fin m → Fin m → K) (π : AbsoluteValue K ℝ → Equiv.Perm (Fin m)),
        (∀ j i, ∀ u : FinitePlace K, u ∉ Sfin → u (ξ j i) ≤ 1) ∧
        (∀ (v : InfinitePlace K) (i j : Fin m),
          v (L v.1 (π v.1 i) (x j + ∑ l ∈ Finset.univ.filter (· < j), ξ j l • x l)) ≤
            C * min (μ v.1 i) (μ v.1 j)) ∧
        ∀ v ∈ Sfin, ∀ i j : Fin m,
          v (L v.1 (π v.1 i) (x j + ∑ l ∈ Finset.univ.filter (· < j), ξ j l • x l)) ≤
            min (μ v.1 i) (μ v.1 j) :=
  sorry

end Parallelepiped

/-! ## Layers 5 and 6: the Subspace Theorem -/

section Subspace

variable {K F : Type*} [Field K] [NumberField K] [Field F] [NumberField F] [Algebra K F]
variable {ι : Type*} [Fintype ι]

/-- **Layer 5.1** (Bombieri–Gubler, Lemma 7.5.4). Unit normalization of an `S`-primitive point
(local sup norms `1` outside `S`), with a constant depending only on `K` and `S`, quantified before
the index type. Without the unit it is false: over `ℚ` with `S = {2}` the tuples `(2 ^ k)`. -/
theorem exists_forall_logHeightAff_smul_le (S : Finset (HeightOneSpectrum (𝓞 K))) :
    ∃ C : ℝ, ∀ (ι : Type) [Fintype ι] (x : ι → K), x ≠ 0 →
      (∀ v : HeightOneSpectrum (𝓞 K), v ∉ S → ⨆ j, FinitePlace.mk v (x j) = 1) →
      ∃ u ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K,
        Real.log (mulHeight fun o : Option ι ↦ o.elim 1 ((u : K) • x)) ≤ logHeight x + C :=
  sorry

/-- **Layer 6.1.** The parametric Subspace Theorem. -/
theorem exists_finset_submodule_forall_approxDomain_subset [Nontrivial ι]
    (Sfin : Finset (FinitePlace K)) (L : AbsoluteValue K ℝ → ι → Dual K (ι → K))
    (hLInf : ∀ v : InfinitePlace K, LinearIndependent K (L v.1))
    (hLFin : ∀ v ∈ Sfin, LinearIndependent K (L v.1))
    (c : AbsoluteValue K ℝ → ι → ℝ) (hc : approxWeight Sfin c < 0) :
    ∃ T : Finset (Submodule K (ι → K)), (∀ W ∈ T, W ≠ ⊤) ∧
      ∃ Q₀ : ℝ, ∀ Q ≥ Q₀, ∃ W ∈ T, approxDomain Sfin L c Q ⊆ W :=
  sorry

/-- **Layer 6.3** (Schmidt; Schlickewei; Evertse; Bombieri–Gubler, Theorem 7.2.2 and
Remark 7.2.3). The form consumers apply. `[Nontrivial ι]` is load-bearing. -/
theorem exists_finset_submodule_of_approxProd_le_extension [Nontrivial ι]
    (Sinf : Finset (InfinitePlace K)) (Sfin : Finset (FinitePlace K))
    (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v ∈ Sinf, (w v.1).LiesOver v.1) (hwFin : ∀ v ∈ Sfin, (w v.1).LiesOver v.1)
    (L : AbsoluteValue K ℝ → ι → Dual F (ι → F))
    (hLInf : ∀ v ∈ Sinf, LinearIndependent F (L v.1))
    (hLFin : ∀ v ∈ Sfin, LinearIndependent F (L v.1)) {ε : ℝ} (hε : 0 < ε) :
    ∃ T : Finset (Submodule K (ι → K)), (∀ W ∈ T, W ≠ ⊤) ∧
      ∀ x : ι → K, x ≠ 0 →
        approxProd Sinf Sfin w L x ≤ mulHeight x ^ (-(Fintype.card ι : ℝ) - ε) →
        ∃ W ∈ T, x ∈ W :=
  sorry

/-- **Layer 6.2**, rejection test: for a one-element index type the statement is false. -/
example : ¬ ∀ ε : ℝ, 0 < ε → ∃ T : Finset (Submodule ℚ (Unit → ℚ)), (∀ W ∈ T, W ≠ ⊤) ∧
    ∀ x : Unit → ℚ, x ≠ 0 → mulHeight x ≤ mulHeight x ^ (-(1 : ℝ) - ε) → ∃ W ∈ T, x ∈ W :=
  sorry

/-- **Layer 6.4.** The affine quantity. -/
def affineProd (S : Finset (HeightOneSpectrum (𝓞 K))) (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (L : AbsoluteValue K ℝ → ι → Dual F (ι → F)) (x : ι → K) : ℝ :=
  (∏ v : InfinitePlace K, (∏ i, w v.1 (L v.1 i fun j ↦ algebraMap K F (x j))) ^ v.mult) *
    ∏ v ∈ S, ∏ i, w (FinitePlace.mk v).1 (L (FinitePlace.mk v).1 i fun j ↦ algebraMap K F (x j))

/-- **Layer 6.4** (Bombieri–Gubler, Corollary 7.2.5). The form every application in Layer 8 uses. -/
theorem exists_finset_submodule_of_integer_of_affineProd_le [Nontrivial ι]
    (S : Finset (HeightOneSpectrum (𝓞 K))) (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v : InfinitePlace K, (w v.1).LiesOver v.1)
    (hwFin : ∀ v ∈ S, (w (FinitePlace.mk v).1).LiesOver (FinitePlace.mk v).1)
    (L : AbsoluteValue K ℝ → ι → Dual F (ι → F))
    (hLInf : ∀ v : InfinitePlace K, LinearIndependent F (L v.1))
    (hLFin : ∀ v ∈ S, LinearIndependent F (L (FinitePlace.mk v).1)) {ε : ℝ} (hε : 0 < ε) :
    ∃ T : Finset (Submodule K (ι → K)), (∀ W ∈ T, W ≠ ⊤) ∧
      ∀ x : ι → K, x ≠ 0 → (∀ j, x j ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) →
        affineProd S w L x ≤ mulHeight x ^ (-ε) → ∃ W ∈ T, x ∈ W :=
  sorry

/-- **Layer 6.4.** `FinitePlace.mk` is injective. -/
theorem FinitePlace.mk_injective : Function.Injective (FinitePlace.mk (K := K)) :=
  sorry

/-- **Layer 6.5.** General position: every subfamily of at most `card ι` forms is independent. -/
def IsGeneralPosition {κ : Type*} (L : κ → Dual F (ι → F)) (B : Finset κ) : Prop :=
  ∀ s ⊆ B, s.card ≤ Fintype.card ι → LinearIndependent F (fun k : s ↦ L k)

/-- **Layer 6.5.** For at least `card ι` forms this is DAT's `InGeneralPosition` of the
coefficient vectors. -/
theorem isGeneralPosition_iff_inGeneralPosition {κ : Type*} [Fintype κ] {n : ℕ}
    (L : κ → Dual F (Fin n → F)) (hκ : n ≤ Fintype.card κ) :
    IsGeneralPosition L Finset.univ ↔
      InGeneralPosition (fun k j ↦ L k (Pi.single j 1)) :=
  sorry

/-- **Layer 6.5.** Vojta's central quantity, over a finset of forms at each place. -/
def generalProd {κ : Type*} (Sinf : Finset (InfinitePlace K)) (Sfin : Finset (FinitePlace K))
    (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ) (B : AbsoluteValue K ℝ → Finset κ)
    (L : AbsoluteValue K ℝ → κ → Dual F (ι → F)) (x : ι → K) : ℝ :=
  (∏ v ∈ Sinf,
      (∏ k ∈ B v.1, w v.1 (L v.1 k fun j ↦ algebraMap K F (x j)) / ⨆ j, v (x j)) ^ v.mult) *
    ∏ v ∈ Sfin, ∏ k ∈ B v.1, w v.1 (L v.1 k fun j ↦ algebraMap K F (x j)) / ⨆ j, v (x j)

/-- **Layer 6.5** (Vojta; Bombieri–Gubler, Theorem 7.2.9). -/
theorem exists_finset_submodule_of_generalProd_le [Nontrivial ι] {κ : Type*} [Finite κ]
    (Sinf : Finset (InfinitePlace K)) (Sfin : Finset (FinitePlace K))
    (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v ∈ Sinf, (w v.1).LiesOver v.1) (hwFin : ∀ v ∈ Sfin, (w v.1).LiesOver v.1)
    (B : AbsoluteValue K ℝ → Finset κ) (L : AbsoluteValue K ℝ → κ → Dual F (ι → F))
    (hLInf : ∀ v ∈ Sinf, IsGeneralPosition (L v.1) (B v.1))
    (hLFin : ∀ v ∈ Sfin, IsGeneralPosition (L v.1) (B v.1)) {ε : ℝ} (hε : 0 < ε) :
    ∃ T : Finset (Submodule K (ι → K)), (∀ W ∈ T, W ≠ ⊤) ∧
      ∀ x : ι → K, x ≠ 0 →
        generalProd Sinf Sfin w B L x ≤ mulHeight x ^ (-(Fintype.card ι : ℝ) - ε) →
        ∃ W ∈ T, x ∈ W :=
  sorry

/-- **Layer 6.5.** With `card ι` forms at every place the two central quantities agree. -/
example (Sinf : Finset (InfinitePlace K)) (Sfin : Finset (FinitePlace K))
    (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ) (L : AbsoluteValue K ℝ → ι → Dual F (ι → F))
    (x : ι → K) :
    generalProd Sinf Sfin w (fun _ ↦ Finset.univ) L x = approxProd Sinf Sfin w L x :=
  rfl

/-- **Layer 6.6.** 3.4's statement, proved from 6.3. -/
theorem exists_finset_submodule_of_approxProd_le_card_two_of_extension (hι : Fintype.card ι = 2)
    (Sinf : Finset (InfinitePlace K)) (Sfin : Finset (FinitePlace K))
    (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v ∈ Sinf, (w v.1).LiesOver v.1) (hwFin : ∀ v ∈ Sfin, (w v.1).LiesOver v.1)
    (L : AbsoluteValue K ℝ → ι → Dual F (ι → F))
    (hLInf : ∀ v ∈ Sinf, LinearIndependent F (L v.1))
    (hLFin : ∀ v ∈ Sfin, LinearIndependent F (L v.1)) {ε : ℝ} (hε : 0 < ε) :
    ∃ T : Finset (Submodule K (ι → K)), (∀ W ∈ T, W ≠ ⊤) ∧
      ∀ x : ι → K, x ≠ 0 →
        approxProd Sinf Sfin w L x ≤ mulHeight x ^ (-(Fintype.card ι : ℝ) - ε) →
        ∃ W ∈ T, x ∈ W :=
  have : Nontrivial ι := Fintype.one_lt_card_iff_nontrivial.mp (by omega)
  exists_finset_submodule_of_approxProd_le_extension Sinf Sfin w hwInf hwFin L hLInf hLFin hε

/-- **Layer 6.6.** The consistency check is an equation between theorems. -/
example : @exists_finset_submodule_of_approxProd_le_card_two K F _ _ _ _ _ ι _ =
    @exists_finset_submodule_of_approxProd_le_card_two_of_extension K F _ _ _ _ _ ι _ :=
  rfl

end Subspace

/-! ## Layer 7: approximation of algebraic numbers, and transcendence -/

section Numbers

/-- **Layer 7.1** (Schmidt 1970). The exponents of a real algebraic number. -/
theorem mahlerExponent_eq_of_isAlgebraic {α : ℝ} (hα : IsAlgebraic ℚ α) (n : ℕ) :
    mahlerExponent n α = (min n ((minpoly ℚ α).natDegree - 1) : ℕ) ∧
      algebraicApproximationExponent n α = (min n ((minpoly ℚ α).natDegree - 1) : ℕ) :=
  sorry

/-- **Layer 7.1** (Schmidt 1970). Simultaneous approximation. -/
theorem finite_setOf_mul_prod_dist_lt {ι : Type*} [Fintype ι] {α : ι → ℝ}
    (hα : ∀ i, IsAlgebraic ℚ (α i)) (hind : LinearIndependent ℚ (fun o : Option ι ↦ o.elim 1 α))
    {ε : ℝ} (hε : 0 < ε) :
    {q : ℤ | 1 ≤ q ∧ ∃ p : ι → ℤ, (q : ℝ) ^ (1 + ε) * ∏ i, |(q : ℝ) * α i - p i| < 1}.Finite :=
  sorry

/-- **Layer 7.1** (Schmidt 1970). Small linear forms against the product of the coordinates. -/
theorem finite_setOf_prod_abs_mul_dist_lt {ι : Type*} [Fintype ι] {α : ι → ℝ}
    (hα : ∀ i, IsAlgebraic ℚ (α i)) (hind : LinearIndependent ℚ (fun o : Option ι ↦ o.elim 1 α))
    {ε : ℝ} (hε : 0 < ε) :
    {q : ι → ℤ | (∀ i, q i ≠ 0) ∧ ∃ p : ℤ,
      (∏ i, |(q i : ℝ)|) ^ (1 + ε) * |∑ i, α i * q i - p| < 1}.Finite :=
  sorry

/-- **Layer 7.2** (the README's `List.rpow`). The word `V ^ w`: `V` repeated `⌊w⌋` times, then its prefix of length
`⌈(w − ⌊w⌋) |V|⌉`. -/
def wordRpow {α : Type*} (V : List α) (w : ℝ) : List α :=
  (List.replicate ⌊w⌋₊ V).flatten ++ V.take ⌈(w - ⌊w⌋₊) * V.length⌉₊

/-- **Layer 7.2.** Condition `(∗)_w`. -/
def IsStammeringWith {α : Type*} (w : ℝ) (a : ℕ → α) : Prop :=
  ∃ (U V : ℕ → List α) (C : ℝ), StrictMono (fun k ↦ (V k).length) ∧
    (∀ k, ((U k).length : ℝ) ≤ C * (V k).length) ∧
    ∀ k, ∀ i < (U k ++ wordRpow (V k) w).length, (U k ++ wordRpow (V k) w)[i]? = some (a i)

/-- **Layer 7.2.** Stammering sequences. -/
def IsStammering {α : Type*} (a : ℕ → α) : Prop := ∃ w : ℝ, 1 < w ∧ IsStammeringWith w a

/-- **Layer 7.2** (Adamczewski–Bugeaud–Luca 2004). The combinatorial transcendence criterion. -/
theorem transcendental_ofDigits_of_isStammering {b : ℕ} (hb : 2 ≤ b) {a : ℕ → Fin b}
    (ha : IsStammering a) (hper : ¬ ∃ N p, 0 < p ∧ ∀ n ≥ N, a (n + p) = a n) :
    Transcendental ℚ (Real.ofDigits a) :=
  sorry

/-- **Layer 7.3** (the README's `Function.complexity`). The number of distinct factors of length
`n`. -/
def complexity {α : Type*} (a : ℕ → α) (n : ℕ) : ℕ :=
  Set.ncard (Set.range fun i : ℕ ↦ (List.range n).map fun k ↦ a (i + k))

/-- **Layer 7.3**, rejection test: the alphabet must be finite. -/
example : complexity (id : ℕ → ℕ) 1 = 0 :=
  sorry

/-- **Layer 7.3** (Adamczewski–Bugeaud 2007). The complexity of an algebraic irrational. -/
theorem tendsto_complexity_div_atTop {b : ℕ} (hb : 2 ≤ b) {a : ℕ → Fin b}
    (halg : IsAlgebraic ℚ (Real.ofDigits a)) (hirr : Irrational (Real.ofDigits a)) :
    Tendsto (fun n : ℕ ↦ (complexity a n : ℝ) / n) atTop atTop :=
  sorry

end Numbers

/-! ## Layer 8: unit equations and Diophantine equations -/

section Equations

variable {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι]

/-- **Layer 8.1** (Siegel; Mahler; Lang). -/
theorem finite_setOf_unit_add_unit_eq_one (S : Finset (HeightOneSpectrum (𝓞 K))) (a b : Kˣ) :
    {p : Kˣ × Kˣ | p.1 ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K ∧
      p.2 ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K ∧
      (a : K) * p.1 + (b : K) * p.2 = 1}.Finite :=
  sorry

/-- **Layer 8.2** (Evertse; van der Poorten–Schlickewei; Bombieri–Gubler, Theorem 7.4.2), with
DAT's `IsNondegenerateSolution`. -/
theorem finite_setOf_sum_unit_eq_one (S : Finset (HeightOneSpectrum (𝓞 K))) (a : ι → K) :
    {x : ι → Kˣ | (∀ i, x i ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K) ∧
      IsNondegenerateSolution a (fun i ↦ (x i : K))}.Finite :=
  sorry

/-- **Layer 8.2**, homogeneous form of Corollary 7.4.3: finitely many ratios. -/
theorem exists_finite_forall_exists_div_mem (S : Finset (HeightOneSpectrum (𝓞 K))) (a : ι → K)
    (i j : ι) :
    ∃ Φ : Set K, Φ.Finite ∧ ∀ x : ι → Kˣ,
      (∀ i, x i ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K) →
      IsNondegenerateHomogeneousSolution a (fun i ↦ (x i : K)) → (x i : K) / x j ∈ Φ :=
  sorry

open Classical in
/-- **Layer 8.4** (Thue; Mahler; Bombieri–Gubler 5.3.1). Thue's equation over `S`-integers: at
least three distinct roots, the point at infinity counting when `natDegree g < d`. -/
theorem finite_setOf_eval_homogenize_eq (S : Finset (HeightOneSpectrum (𝓞 K))) {g : K[X]}
    {d : ℕ} (hd : g.natDegree ≤ d)
    (hg : 3 ≤ (g.map (algebraMap K (AlgebraicClosure K))).roots.toFinset.card +
      if g.natDegree < d then 1 else 0)
    {m : K} (hm : m ≠ 0) :
    {p : K × K | p.1 ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K ∧
      p.2 ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K ∧
      MvPolynomial.eval ![p.1, p.2] (g.homogenize d) = m}.Finite :=
  sorry

open Classical in
/-- **Layer 8.5** (Siegel 1926; Bombieri–Gubler, Theorem 5.3.5). The hyperelliptic equation, with
three roots of odd multiplicity. -/
theorem finite_setOf_mul_sq_eq_eval (S : Finset (HeightOneSpectrum (𝓞 K))) {f : K[X]}
    (hf : 3 ≤ ((f.map (algebraMap K (AlgebraicClosure K))).roots.toFinset.filter fun r ↦
      Odd ((f.map (algebraMap K (AlgebraicClosure K))).rootMultiplicity r)).card)
    {b : K} (hb : b ≠ 0) :
    {p : K × K | p.1 ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K ∧
      p.2 ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K ∧ b * p.2 ^ 2 = f.eval p.1}.Finite :=
  sorry

/-- **Layer 8.6** (Bugeaud–Corvaja–Zannier 2003). -/
theorem Nat.finite_setOf_exp_le_gcd_pow_sub_one {a b : ℕ} (ha : 2 ≤ a) (hb : 2 ≤ b)
    (hab : ∀ m n : ℕ, a ^ m = b ^ n → m = 0 ∧ n = 0) {ε : ℝ} (hε : 0 < ε) :
    {n : ℕ | Real.exp (ε * n) ≤ (Nat.gcd (a ^ n - 1) (b ^ n - 1) : ℝ)}.Finite :=
  sorry

end Equations

end TauCetiRoadmap.SubspaceTheorem
