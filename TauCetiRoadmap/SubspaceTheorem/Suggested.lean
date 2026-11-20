import Mathlib
import TauCeti.MeasureTheory.Measure.Lebesgue.SimplexVolume.Basic
import TauCeti.NumberTheory.DiophantineApproximation.AlgebraicExponent
import TauCeti.NumberTheory.DiophantineApproximation.LinearFormExponent
import TauCeti.NumberTheory.DiophantineApproximation.Subspace.ApproxProd
import TauCeti.NumberTheory.DiophantineApproximation.Subspace.ApproximationDomain
import TauCeti.NumberTheory.Height.Affine
import TauCeti.NumberTheory.Height.MvPolynomial
import TauCeti.NumberTheory.UnitEquation.Nondegenerate
import TauCeti.RingTheory.MvPolynomial.WeightedIndex

/-!
# Roth's theorem and the Subspace Theorem over number fields: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few definitions their
statements need. The README carries every target, its API, its route and its checks.

The headline theorems stated here are: the classification of the absolute values over an infinite
place and their Galois conjugacy (Layer 0.1–0.2), Liouville's inequality over a number field (0.4),
Wirsing's three inequalities (1.2), Mahler's and Koksma's classifications with Mahler's theorem on
algebraically dependent numbers (1.3), the auxiliary polynomial of prescribed index at several
points (2.2), Roth's theorem over a number field with targets in a finite extension, its form with
targets at infinity and a constant, Ridout's theorem, Roth's theorem on the projective line,
Mahler's theorem on `(p/q)^k` and Roth's theorem with moving targets (3.2–3.5, 3.7), eventual properness of
the approximation span (4.3), the penultimate-minimum theorem (5.5) with the unit normalization it
rests on (5.1), the Subspace Theorem in its parametric, algebraic, affine, general-position and
subspace forms with its consistency with Layer 3 (6.1, 6.3–6.7), the exponents of an algebraic
number, Schmidt's two simultaneous-approximation theorems, the combinatorial transcendence criterion
and the complexity of algebraic irrationals (7.1–7.3), the `S`-unit equations, decomposable-form,
Thue, Thue–Mahler and hyperelliptic equations and the Corvaja–Zannier gcd bounds (8.1–8.6), and
Evertse's Theorem A for systems of inequalities (9.1). Evertse's lemma (4.4) and Roth's theorem as a
value of the irrationality exponent (3.3) are already Tau Ceti's at the pin (`NumberField.exists_evertse`,
`IsAlgebraic.irrationalityExponent_eq_two`) and are not restated.

Not statable at the pins: the counts of Davenport–Roth (3.6), of the interval form of the parametric
Subspace Theorem (6.1) and of normalized systems (9.5). The README fixes each of these counts and
thresholds only by the parameters it depends on, through Roth's parameter functions of 3.2 and the
chain length and ratio of 5.5, which it does not write out; a Lean statement would have to choose
them.

Heights are Mathlib's heights relative to the fixed number field; the local factor at an infinite
place carries the exponent `InfinitePlace.mult`; a finite set of places is a pair of typed finsets
`Sinf`, `Sfin` (the README's `S∞`, `S₀`), and `S` for `S`-integers and `S`-units is a
`Finset (HeightOneSpectrum (𝓞 K))`.
-/

noncomputable section

namespace TauCetiRoadmap.SubspaceTheorem

open Height NumberField Module Polynomial IsDedekindDomain Filter
open scoped ENNReal NNReal
open TauCeti (mahlerExponent algebraicApproximationExponent simplexVolume IsNondegenerateSolution
  IsNondegenerateHomogeneousSolution)

/-! ## Layer 0: absolute values above a place and the `S`-adic dictionary -/

section PlacesOver

variable {K F : Type*} [Field K] [NumberField K] [Field F] [NumberField F] [Algebra K F]

/-- **Layer 0.1** (Bombieri–Gubler §1.3). An absolute value of `F` lying over an infinite place of
`K` is the absolute value of an infinite place of `F`. -/
theorem isInfinitePlace_of_liesOver (v : InfinitePlace K) (w : AbsoluteValue F ℝ)
    [w.LiesOver v.1] : ∃ w' : InfinitePlace F, w'.1 = w :=
  sorry

/-- **Layer 0.2** (Bombieri–Gubler, Corollaries 1.3.2 and 1.3.5). For `F/K` Galois the Galois group
acts transitively on the absolute values over a place, infinite or finite. -/
theorem exists_algEquiv_comp_eq [IsGalois K F] (v : AbsoluteValue K ℝ)
    (hv : IsInfinitePlace v ∨ IsFinitePlace v) (w w' : AbsoluteValue F ℝ)
    [w.LiesOver v] [w'.LiesOver v] : ∃ σ : F ≃ₐ[K] F, ∀ y, w' y = w (σ y) :=
  sorry

/-- **Layer 0.4** (Bombieri–Gubler (1.8), Theorems 1.5.21 and 2.8.21). Liouville's inequality over
a number field, with targets in a finite extension measured by absolute values over the places. -/
theorem inv_le_prod_min_one_sub (Sinf : Finset (InfinitePlace K)) (Sfin : Finset (FinitePlace K))
    (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v ∈ Sinf, (w v.1).LiesOver v.1) (hwFin : ∀ v ∈ Sfin, (w v.1).LiesOver v.1)
    {α : F} {β : K} (h : algebraMap K F β ≠ α) :
    (2 ^ finrank ℚ F * mulHeight₁ α * mulHeight₁ β ^ finrank K F)⁻¹ ≤
      (∏ v ∈ Sinf, min 1 (w v.1 (algebraMap K F β - α)) ^ v.mult) *
        ∏ v ∈ Sfin, min 1 (w v.1 (algebraMap K F β - α)) :=
  sorry

end PlacesOver

/-! ## Layer 1: approximation exponents -/

section Exponents

/-- **Layer 1.2** (Wirsing 1961). Wirsing's first inequality, `w_n − n + 1 ≤ w_n*`. -/
theorem mahlerExponent_add_one_le_add {n : ℕ} (hn : 1 ≤ n) {ξ : ℝ}
    (hξ : ¬ (IsAlgebraic ℚ ξ ∧ (minpoly ℚ ξ).natDegree ≤ n)) :
    mahlerExponent n ξ + 1 ≤ algebraicApproximationExponent n ξ + n :=
  sorry

/-- **Layer 1.2** (Wirsing 1961). Wirsing's second inequality, `(w_n + 1) / 2 ≤ w_n*`. -/
theorem mahlerExponent_add_one_le_two_mul {n : ℕ} (hn : 1 ≤ n) {ξ : ℝ}
    (hξ : ¬ (IsAlgebraic ℚ ξ ∧ (minpoly ℚ ξ).natDegree ≤ n)) :
    mahlerExponent n ξ + 1 ≤ 2 * algebraicApproximationExponent n ξ :=
  sorry

/-- **Layer 1.2** (Wirsing 1961). Wirsing's third inequality. At `w_n = n` it reads `n ≤ w_n*`. -/
theorem div_le_algebraicApproximationExponent {n : ℕ} {ξ : ℝ}
    (hξ : ¬ (IsAlgebraic ℚ ξ ∧ (minpoly ℚ ξ).natDegree ≤ n)) :
    mahlerExponent n ξ / (mahlerExponent n ξ - n + 1) ≤ algebraicApproximationExponent n ξ :=
  sorry

/-- **Layer 1.3** (Mahler 1932). Mahler's invariant `w(ξ) = limsup w_n(ξ) / n`. -/
def mahlerInvariant (ξ : ℝ) : ℝ≥0∞ :=
  limsup (fun n : ℕ ↦ mahlerExponent n ξ / n) atTop

/-- **Layer 1.3.** Mahler's `A`-numbers: `w(ξ) = 0`. -/
def IsANumber (ξ : ℝ) : Prop := mahlerInvariant ξ = 0

/-- **Layer 1.3.** Mahler's `S`-numbers: `0 < w(ξ) < ∞`. -/
def IsSNumber (ξ : ℝ) : Prop := 0 < mahlerInvariant ξ ∧ mahlerInvariant ξ < ⊤

/-- **Layer 1.3.** Mahler's `T`-numbers: `w(ξ) = ∞` with every `w_n(ξ)` finite. -/
def IsTNumber (ξ : ℝ) : Prop := mahlerInvariant ξ = ⊤ ∧ ∀ n, mahlerExponent n ξ ≠ ⊤

/-- **Layer 1.3.** Mahler's `U`-numbers: some `w_n(ξ)` is infinite. -/
def IsUNumber (ξ : ℝ) : Prop := ∃ n, mahlerExponent n ξ = ⊤

/-- **Layer 1.3** (Koksma 1939). Koksma's invariant `w*(ξ) = limsup w_n*(ξ) / n`. -/
def koksmaInvariant (ξ : ℝ) : ℝ≥0∞ :=
  limsup (fun n : ℕ ↦ algebraicApproximationExponent n ξ / n) atTop

/-- **Layer 1.3.** Koksma's `A*`-numbers: `w*(ξ) = 0`. -/
def IsAStarNumber (ξ : ℝ) : Prop := koksmaInvariant ξ = 0

/-- **Layer 1.3.** Koksma's `S*`-numbers: `0 < w*(ξ) < ∞`. -/
def IsSStarNumber (ξ : ℝ) : Prop := 0 < koksmaInvariant ξ ∧ koksmaInvariant ξ < ⊤

/-- **Layer 1.3.** Koksma's `T*`-numbers: `w*(ξ) = ∞` with every `w_n*(ξ)` finite. -/
def IsTStarNumber (ξ : ℝ) : Prop :=
  koksmaInvariant ξ = ⊤ ∧ ∀ n, algebraicApproximationExponent n ξ ≠ ⊤

/-- **Layer 1.3.** Koksma's `U*`-numbers: some `w_n*(ξ)` is infinite. -/
def IsUStarNumber (ξ : ℝ) : Prop := ∃ n, algebraicApproximationExponent n ξ = ⊤

/-- **Layer 1.3** (Mahler 1932). The `A`-numbers are exactly the real algebraic numbers. -/
theorem isANumber_iff (ξ : ℝ) : IsANumber ξ ↔ IsAlgebraic ℚ ξ :=
  sorry

/-- **Layer 1.3** (Koksma 1939; Wirsing 1961). Mahler's and Koksma's classifications coincide
class by class. -/
theorem mahlerClasses_iff_koksmaClasses (ξ : ℝ) :
    (IsANumber ξ ↔ IsAStarNumber ξ) ∧ (IsSNumber ξ ↔ IsSStarNumber ξ) ∧
      (IsTNumber ξ ↔ IsTStarNumber ξ) ∧ (IsUNumber ξ ↔ IsUStarNumber ξ) :=
  sorry

/-- **Layer 1.3** (Mahler 1932). Two algebraically dependent transcendental numbers lie in the same
class. -/
theorem mahlerClasses_iff_of_not_algebraicIndependent {ξ η : ℝ} (hξ : Transcendental ℚ ξ)
    (hη : Transcendental ℚ η) (hdep : ¬ AlgebraicIndependent ℚ ![ξ, η]) :
    (IsSNumber ξ ↔ IsSNumber η) ∧ (IsTNumber ξ ↔ IsTNumber η) ∧ (IsUNumber ξ ↔ IsUNumber η) :=
  sorry

end Exponents

/-! ## Layer 2: the auxiliary polynomial over a number field -/

section Auxiliary

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
          MvPolynomial.weightedIndex d (α k) (MvPolynomial.map (algebraMap K F) P)) ∧
        MvPolynomial.logHeight P ≤
          (finrank K F : ℝ) / (1 - (finrank K F : ℝ) * ∑ k, simplexVolume m (t k)) *
          ∑ k, ∑ j, simplexVolume m (t k) *
            (logHeight₁ (α k j) / finrank K F + finrank ℚ K * Real.log 2 + δ) * d j :=
  sorry

end Auxiliary

/-! ## Layer 3: Roth's theorem -/

section Roth

variable {K F : Type*} [Field K] [NumberField K] [Field F] [NumberField F] [Algebra K F]

/-- **Layer 3.2** (Roth; Ridout; Lang; Bombieri–Gubler, Theorem 6.4.1). Roth's theorem over a
number field, with a finite set of places and targets in a finite extension. -/
theorem finite_setOf_prod_min_one_le (Sinf : Finset (InfinitePlace K))
    (Sfin : Finset (FinitePlace K)) (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v ∈ Sinf, (w v.1).LiesOver v.1) (hwFin : ∀ v ∈ Sfin, (w v.1).LiesOver v.1)
    (α : AbsoluteValue K ℝ → F) {κ : ℝ} (hκ : 2 < κ) :
    {β : K | (∏ v ∈ Sinf, min 1 (w v.1 (algebraMap K F β - α v.1)) ^ v.mult) *
        ∏ v ∈ Sfin, min 1 (w v.1 (algebraMap K F β - α v.1)) ≤ mulHeight₁ β ^ (-κ)}.Finite :=
  sorry

/-- **Layer 3.3** (Bombieri–Gubler 6.2.5). The local factor at a target in `OnePoint F`:
`min 1 (w (β − t))` at a finite target and `(max 1 (w β))⁻¹` at `∞`. -/
def onePointApprox (w : AbsoluteValue F ℝ) (β : F) (t : OnePoint F) : ℝ :=
  OnePoint.rec (C := fun _ ↦ ℝ) (max 1 (w β))⁻¹ (fun a ↦ min 1 (w (β - a))) t

/-- **Layer 3.3** (Bombieri–Gubler 6.2.5). Roth's theorem with targets at infinity and a constant. -/
theorem finite_setOf_prod_onePointApprox_le_const (Sinf : Finset (InfinitePlace K))
    (Sfin : Finset (FinitePlace K)) (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v ∈ Sinf, (w v.1).LiesOver v.1) (hwFin : ∀ v ∈ Sfin, (w v.1).LiesOver v.1)
    (α : AbsoluteValue K ℝ → OnePoint F) {κ : ℝ} (hκ : 2 < κ) (C : ℝ) :
    {β : K | (∏ v ∈ Sinf, onePointApprox (w v.1) (algebraMap K F β) (α v.1) ^ v.mult) *
        ∏ v ∈ Sfin, onePointApprox (w v.1) (algebraMap K F β) (α v.1) ≤
          C * mulHeight₁ β ^ (-κ)}.Finite :=
  sorry

/-- **Layer 3.3** (Ridout 1958). -/
theorem finite_setOf_ridout {α : ℝ} (hα : IsAlgebraic ℚ α) (S₁ S₂ : Finset ℕ)
    (hS₁ : ∀ p ∈ S₁, p.Prime) (hS₂ : ∀ p ∈ S₂, p.Prime) {ε : ℝ} (hε : 0 < ε) :
    {x : ℚ | |α - x| * (∏ p ∈ S₁, (padicNorm p x.num : ℝ)) * ∏ p ∈ S₂, (padicNorm p x.den : ℝ) ≤
      (max |(x.num : ℝ)| x.den) ^ (-2 - ε)}.Finite :=
  sorry

/-- **Layer 3.4** (Bombieri–Gubler, Example 7.2.7). Roth's theorem on the projective line, stated
for any two-element index type so that Layer 6.6 is an equation between theorems. -/
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

/-- **Layer 3.5** (Mahler 1957; Bombieri–Gubler 6.2.7). The distance from `(p/q)^k` to the nearest
integer eventually exceeds `exp (−ε k)`. -/
theorem eventually_exp_neg_lt_abs_sub_round {p q : ℕ} (hq : 2 ≤ q) (hpq : q < p)
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

/-- **Layer 4.1** (Bombieri–Gubler 7.5.6). The weight of a system of exponents: the exponent of `Q`
in the product of the local bounds of an approximation domain. -/
def approxWeight (Sfin : Finset (FinitePlace K)) (c : AbsoluteValue K ℝ → ι → ℝ) : ℝ :=
  ∑ v : InfinitePlace K, v.mult * ∑ i, c v.1 i + ∑ v ∈ Sfin, ∑ i, c v.1 i

/-- **Layer 4.3** (Bombieri–Gubler, Definition 7.5.11). The span `V(Q)` of the approximation
domain of level `Q`. -/
def approxSpan (Sfin : Finset (FinitePlace K)) (L : AbsoluteValue K ℝ → ι → Dual K (ι → K))
    (c : AbsoluteValue K ℝ → ι → ℝ) (Q : ℝ) : Submodule K (ι → K) :=
  Submodule.span K (TauCeti.NumberField.approxDomain Sfin L c Q)

/-- **Layer 4.3** (Bombieri–Gubler, Lemma 7.5.12). Negative weight makes the span eventually
proper. -/
theorem eventually_approxSpan_ne_top (Sfin : Finset (FinitePlace K))
    (L : AbsoluteValue K ℝ → ι → Dual K (ι → K))
    (hLInf : ∀ v : InfinitePlace K, LinearIndependent K (L v.1))
    (hLFin : ∀ v ∈ Sfin, LinearIndependent K (L v.1))
    (c : AbsoluteValue K ℝ → ι → ℝ) (hc : approxWeight Sfin c < 0) :
    ∀ᶠ Q in atTop, approxSpan Sfin L c Q ≠ ⊤ :=
  sorry

end Parallelepiped

/-! ## Layer 5: the Subspace machinery -/

section Machinery

variable {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι]

/-- **Layer 5.1** (Bombieri–Gubler, Lemma 7.5.4). Unit normalization of an `S`-primitive point
(local sup norms `1` outside `S`), with a constant depending only on `K` and `S`, quantified before
the index type. Without the unit it is false: over `ℚ` with `S = {2}` the tuples `(2 ^ k)`. -/
theorem exists_forall_logHeightAff_smul_le (S : Finset (HeightOneSpectrum (𝓞 K))) :
    ∃ C : ℝ, ∀ (ι : Type) [Fintype ι] (x : ι → K), x ≠ 0 →
      (∀ v : HeightOneSpectrum (𝓞 K), v ∉ S → ⨆ j, FinitePlace.mk v (x j) = 1) →
      ∃ u ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K,
        Real.log (mulHeightAff ((u : K) • x)) ≤ logHeight x + C :=
  sorry

/-- **Layer 5.5** (Bombieri–Gubler, Theorem 7.5.13). The penultimate-minimum theorem: for exponents
of negative weight, the spans `V(Q)` at levels `Q ≥ 1` that are hyperplanes are finitely many. -/
theorem finite_setOf_approxSpan (Sfin : Finset (FinitePlace K))
    (L : AbsoluteValue K ℝ → ι → Dual K (ι → K))
    (hLInf : ∀ v : InfinitePlace K, LinearIndependent K (L v.1))
    (hLFin : ∀ v ∈ Sfin, LinearIndependent K (L v.1))
    (c : AbsoluteValue K ℝ → ι → ℝ) (hc : approxWeight Sfin c < 0) :
    {W : Submodule K (ι → K) | ∃ Q : ℝ, 1 ≤ Q ∧ approxSpan Sfin L c Q = W ∧
      finrank K W = Fintype.card ι - 1}.Finite :=
  sorry

end Machinery

/-! ## Layer 6: the Subspace Theorem -/

section Subspace

variable {K F : Type*} [Field K] [NumberField K] [Field F] [NumberField F] [Algebra K F]
variable {ι : Type*} [Fintype ι]

/-- **Layer 6.1** (Bombieri–Gubler 7.5.30–7.5.32; Evertse–Schlickewei 2002). The parametric
Subspace Theorem: for exponents of negative weight, the approximation domains of all large levels lie
in finitely many proper subspaces. -/
theorem exists_finset_submodule_forall_approxDomain_subset
    (Sfin : Finset (FinitePlace K)) (L : AbsoluteValue K ℝ → ι → Dual K (ι → K))
    (hLInf : ∀ v : InfinitePlace K, LinearIndependent K (L v.1))
    (hLFin : ∀ v ∈ Sfin, LinearIndependent K (L v.1))
    (c : AbsoluteValue K ℝ → ι → ℝ) (hc : approxWeight Sfin c < 0) :
    ∃ T : Finset (Submodule K (ι → K)), (∀ W ∈ T, W ≠ ⊤) ∧
      ∃ Q₀ : ℝ, ∀ Q ≥ Q₀, ∃ W ∈ T, TauCeti.NumberField.approxDomain Sfin L c Q ⊆ W :=
  sorry

/-- **Layer 6.3** (Schmidt; Schlickewei; Evertse; Bombieri–Gubler, Theorem 7.2.2 and
Remark 7.2.3). The Subspace Theorem with algebraic coefficients, the form consumers apply.
`[Nontrivial ι]` is load-bearing. -/
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

/-- **Layer 6.4** (Bombieri–Gubler, Corollary 7.2.5). The affine quantity: the product of the values
of the forms at the infinite places and the places of `S`, with no local denominators. -/
def affineProd (S : Finset (HeightOneSpectrum (𝓞 K))) (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (L : AbsoluteValue K ℝ → ι → Dual F (ι → F)) (x : ι → K) : ℝ :=
  (∏ v : InfinitePlace K, (∏ i, w v.1 (L v.1 i fun j ↦ algebraMap K F (x j))) ^ v.mult) *
    ∏ v ∈ S, ∏ i, w (FinitePlace.mk v).1 (L (FinitePlace.mk v).1 i fun j ↦ algebraMap K F (x j))

/-- **Layer 6.4** (Bombieri–Gubler, Corollary 7.2.5 and Theorem 7.2.6). The affine Subspace
Theorem for `S`-integral points, the form every application in Layer 8 uses. -/
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

/-- **Layer 6.5** (Vojta 1987; Bombieri–Gubler, Definition 7.2.8). General position: every
subfamily of at most `card ι` forms in `B` is linearly independent. -/
def IsGeneralPosition {κ : Type*} (L : κ → Dual F (ι → F)) (B : Finset κ) : Prop :=
  ∀ s ⊆ B, s.card ≤ Fintype.card ι → LinearIndependent F (fun k : s ↦ L k)

/-- **Layer 6.5** (Vojta 1987). The central quantity of the Subspace Theorem in general position,
over a finset of forms at each place. -/
def generalProd {κ : Type*} (Sinf : Finset (InfinitePlace K)) (Sfin : Finset (FinitePlace K))
    (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ) (B : AbsoluteValue K ℝ → Finset κ)
    (L : AbsoluteValue K ℝ → κ → Dual F (ι → F)) (x : ι → K) : ℝ :=
  (∏ v ∈ Sinf,
      (∏ k ∈ B v.1, w v.1 (L v.1 k fun j ↦ algebraMap K F (x j)) / ⨆ j, v (x j)) ^ v.mult) *
    ∏ v ∈ Sfin, ∏ k ∈ B v.1, w v.1 (L v.1 k fun j ↦ algebraMap K F (x j)) / ⨆ j, v (x j)

/-- **Layer 6.5** (Vojta 1987; Bombieri–Gubler, Theorem 7.2.9). The Subspace Theorem for forms in
general position. -/
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

/-- **Layer 6.7** (derived from Bombieri–Gubler, Theorem 7.2.2). The Subspace Theorem on a
subspace `U` of dimension at least two, for forms whose restrictions to the `K`-points of `U` are
linearly independent over `F`. -/
theorem exists_finset_submodule_lt_of_generalProd_le {κ : Type*} [Fintype κ]
    (U : Submodule K (ι → K)) (hU : 2 ≤ finrank K U)
    (Sinf : Finset (InfinitePlace K)) (Sfin : Finset (FinitePlace K))
    (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v ∈ Sinf, (w v.1).LiesOver v.1) (hwFin : ∀ v ∈ Sfin, (w v.1).LiesOver v.1)
    (L : AbsoluteValue K ℝ → κ → Dual F (ι → F))
    (hLInf : ∀ v ∈ Sinf, LinearIndependent F
      fun k : κ ↦ fun u : U ↦ L v.1 k fun j ↦ algebraMap K F ((u : ι → K) j))
    (hLFin : ∀ v ∈ Sfin, LinearIndependent F
      fun k : κ ↦ fun u : U ↦ L v.1 k fun j ↦ algebraMap K F ((u : ι → K) j))
    {ε : ℝ} (hε : 0 < ε) :
    ∃ T : Finset (Submodule K (ι → K)), (∀ W ∈ T, W < U) ∧
      ∀ x ∈ U, x ≠ 0 →
        generalProd Sinf Sfin w (fun _ ↦ Finset.univ) L x ≤
          mulHeight x ^ (-(finrank K U : ℝ) - ε) →
        ∃ W ∈ T, x ∈ W :=
  sorry

end Subspace

/-! ## Layer 7: approximation of algebraic numbers, and transcendence -/

section Numbers

/-- **Layer 7.1** (Schmidt 1970; Bombieri–Gubler, Remark 7.3.4). The exponents of a real algebraic
number of degree `D`: `w_n = w_n* = min n (D − 1)`. -/
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

/-- **Layer 7.2.** The word `V ^ w`: `V` repeated `⌊w⌋` times, then its prefix of length
`⌈(w − ⌊w⌋) |V|⌉`. -/
def wordRpow {α : Type*} (V : List α) (w : ℝ) : List α :=
  (List.replicate ⌊w⌋₊ V).flatten ++ V.take ⌈(w - ⌊w⌋₊) * V.length⌉₊

/-- **Layer 7.2** (Adamczewski–Bugeaud 2007). Condition `(∗)_w`: infinitely many prefixes
`U ++ V ^ w` with `|V|` strictly increasing and `|U|` at most a constant times `|V|`. -/
def IsStammeringWith {α : Type*} (w : ℝ) (a : ℕ → α) : Prop :=
  ∃ (U V : ℕ → List α) (C : ℝ), StrictMono (fun k ↦ (V k).length) ∧
    (∀ k, ((U k).length : ℝ) ≤ C * (V k).length) ∧
    ∀ k, ∀ i < (U k ++ wordRpow (V k) w).length, (U k ++ wordRpow (V k) w)[i]? = some (a i)

/-- **Layer 7.2.** Stammering sequences: `(∗)_w` for some `w > 1`. -/
def IsStammering {α : Type*} (a : ℕ → α) : Prop := ∃ w : ℝ, 1 < w ∧ IsStammeringWith w a

/-- **Layer 7.2** (Adamczewski–Bugeaud–Luca 2004; Adamczewski–Bugeaud 2007). The combinatorial
transcendence criterion. -/
theorem transcendental_ofDigits_of_isStammering {b : ℕ} (hb : 2 ≤ b) {a : ℕ → Fin b}
    (ha : IsStammering a) (hper : ¬ ∃ N p, 0 < p ∧ ∀ n ≥ N, a (n + p) = a n) :
    Transcendental ℚ (Real.ofDigits a) :=
  sorry

/-- **Layer 7.3** (Morse–Hedlund 1938). The complexity: the number of distinct factors of
length `n`. -/
def complexity {α : Type*} (a : ℕ → α) (n : ℕ) : ℕ :=
  Set.ncard (Set.range fun i : ℕ ↦ (List.range n).map fun k ↦ a (i + k))

/-- **Layer 7.3** (Adamczewski–Bugeaud 2007, Theorem 1). The complexity of an algebraic
irrational. -/
theorem tendsto_complexity_div_atTop {b : ℕ} (hb : 2 ≤ b) {a : ℕ → Fin b}
    (halg : IsAlgebraic ℚ (Real.ofDigits a)) (hirr : Irrational (Real.ofDigits a)) :
    Tendsto (fun n : ℕ ↦ (complexity a n : ℝ) / n) atTop atTop :=
  sorry

end Numbers

/-! ## Layer 8: unit equations and Diophantine equations -/

section Equations

variable {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι]

/-- **Layer 8.1** (Siegel; Mahler; Lang). The unit equation in two variables. -/
theorem finite_setOf_unit_add_unit_eq_one (S : Finset (HeightOneSpectrum (𝓞 K))) (a b : Kˣ) :
    {p : Kˣ × Kˣ | p.1 ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K ∧
      p.2 ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K ∧
      (a : K) * p.1 + (b : K) * p.2 = 1}.Finite :=
  sorry

/-- **Layer 8.2** (Evertse; van der Poorten–Schlickewei; Bombieri–Gubler, Theorem 7.4.2), with Tau
Ceti's `TauCeti.IsNondegenerateSolution`. -/
theorem finite_setOf_sum_unit_eq_one (S : Finset (HeightOneSpectrum (𝓞 K))) (a : ι → K) :
    {x : ι → Kˣ | (∀ i, x i ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K) ∧
      IsNondegenerateSolution a (fun i ↦ (x i : K))}.Finite :=
  sorry

/-- **Layer 8.2** (Bombieri–Gubler, Corollary 7.4.3), homogeneous form: finitely many ratios. -/
theorem exists_finite_forall_exists_div_mem (S : Finset (HeightOneSpectrum (𝓞 K))) (a : ι → K)
    (i j : ι) :
    ∃ Φ : Set K, Φ.Finite ∧ ∀ x : ι → Kˣ,
      (∀ i, x i ∈ (S : Set (HeightOneSpectrum (𝓞 K))).unit K) →
      IsNondegenerateHomogeneousSolution a (fun i ↦ (x i : K)) → (x i : K) / x j ∈ Φ :=
  sorry

/-- **Layer 8.3** (Győry–Papp; Evertse–Győry, Ch. 9). Two indices are triangle-adjacent when some
form of the family is a combination of their two forms with nonzero coefficients. -/
def TriangleAdj {κ V : Type*} [AddCommGroup V] [Module K V] (l : κ → Dual K V) (j j' : κ) :
    Prop :=
  ∃ k : κ, ∃ a b : K, a ≠ 0 ∧ b ≠ 0 ∧ l k = a • l j + b • l j'

/-- **Layer 8.3.** A family of forms is triangularly connected when every two indices are joined by
a chain of triangle adjacencies. -/
def IsTriangularlyConnected {κ V : Type*} [AddCommGroup V] [Module K V] (l : κ → Dual K V) :
    Prop :=
  ∀ j j' : κ, Relation.ReflTransGen (TriangleAdj l) j j'

/-- **Layer 8.3** (Győry–Papp; Evertse–Győry, Ch. 9). A triangularly connected decomposable form
with trivial common kernel takes a nonzero value at only finitely many `S`-integral points. -/
theorem finite_setOf_mul_prod_eq (S : Finset (HeightOneSpectrum (𝓞 K))) {κ : Type*} [Fintype κ]
    (l : κ → Dual K (ι → K)) (hl : IsTriangularlyConnected l)
    (hker : ⨅ j, LinearMap.ker (l j) = ⊥) (c : K) (e : κ → ℕ) (he : ∀ j, e j ≠ 0) {m : K}
    (hm : m ≠ 0) :
    {x : ι → K | (∀ j, x j ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) ∧
      c * ∏ j, l j x ^ e j = m}.Finite :=
  sorry

open Classical in
/-- **Layer 8.4** (Thue 1909; Mahler 1933; Bombieri–Gubler 5.3.1). Thue's equation over
`S`-integers: at least three distinct roots, the point at infinity counting when
`natDegree g < d`. -/
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
/-- **Layer 8.4** (Mahler 1933; Bombieri–Gubler 5.3.2). Thue–Mahler over `ℤ`: finitely many
coprime `x, y` and exponents `z` with `|G(x, y)| = ∏ p_k ^ z_k`. -/
theorem finite_setOf_natAbs_eval_homogenize_eq_prod_pow {g : ℤ[X]} {d : ℕ} (hd : g.natDegree ≤ d)
    (hg : 3 ≤ (g.map (algebraMap ℤ ℂ)).roots.toFinset.card + if g.natDegree < d then 1 else 0)
    {s : ℕ} (p : Fin s → ℕ) (hp : ∀ k, (p k).Prime) :
    {xyz : ℤ × ℤ × (Fin s → ℕ) | IsCoprime xyz.1 xyz.2.1 ∧
      (MvPolynomial.eval ![xyz.1, xyz.2.1] (g.homogenize d)).natAbs =
        ∏ k, p k ^ xyz.2.2 k}.Finite :=
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

/-- **Layer 8.6** (Corvaja–Zannier 2003, 2005; Bombieri–Gubler, Theorem 7.4.10). Pairs of
`P`-units whose shifts have a large gcd are bounded or lie on finitely many curves
`u ^ a * v ^ b = 1`. -/
theorem exists_forall_of_rpow_le_gcd_sub_one (P : Finset ℕ) (hP : ∀ p ∈ P, p.Prime) {ε : ℝ}
    (hε : 0 < ε) :
    ∃ (R : ℝ) (E : Finset (ℤ × ℤ)), (0, 0) ∉ E ∧ ∀ u v : ℤ, u ≠ 0 → v ≠ 0 →
      (∀ p : ℕ, p.Prime → (p : ℤ) ∣ u → p ∈ P) → (∀ p : ℕ, p.Prime → (p : ℤ) ∣ v → p ∈ P) →
      ((max |u| |v| : ℤ) : ℝ) ^ ε ≤ Int.gcd (u - 1) (v - 1) →
      ((max |u| |v| : ℤ) : ℝ) ≤ R ∨ ∃ ab ∈ E, (u : ℚ) ^ ab.1 * (v : ℚ) ^ ab.2 = 1 :=
  sorry

/-- **Layer 8.6** (Bugeaud–Corvaja–Zannier 2003; Bombieri–Gubler, Corollary 7.4.11). For
multiplicatively independent `a, b ≥ 2`, `gcd (a ^ n − 1, b ^ n − 1) < exp (ε n)` for all large
`n`. -/
theorem finite_setOf_exp_le_gcd_pow_sub_one {a b : ℕ} (ha : 2 ≤ a) (hb : 2 ≤ b)
    (hab : ∀ m n : ℕ, a ^ m = b ^ n → m = 0 ∧ n = 0) {ε : ℝ} (hε : 0 < ε) :
    {n : ℕ | Real.exp (ε * n) ≤ (Nat.gcd (a ^ n - 1) (b ^ n - 1) : ℝ)}.Finite :=
  sorry

end Equations

/-! ## Layer 9: counting subspaces -/

section Counting

variable {K F : Type*} [Field K] [NumberField K] [Field F] [NumberField F] [Algebra K F]
variable {ι : Type*} [Fintype ι]

/-- **Layer 9.1** (Evertse 2010, Theorem A). A system of inequalities of negative weight, with
local values `w p (L p i x) ^ mult p ≤ C p * H_aff(x) ^ c p i` at the infinite places and the places
of `S`, has its nonzero `S`-integral solutions in finitely many proper subspaces. -/
theorem exists_finset_submodule_of_systemWeight_neg [Nontrivial ι]
    (S : Finset (HeightOneSpectrum (𝓞 K))) (w : AbsoluteValue K ℝ → AbsoluteValue F ℝ)
    (hwInf : ∀ v : InfinitePlace K, (w v.1).LiesOver v.1)
    (hwFin : ∀ v ∈ S, (w (FinitePlace.mk v).1).LiesOver (FinitePlace.mk v).1)
    (L : AbsoluteValue K ℝ → ι → Dual F (ι → F))
    (hLInf : ∀ v : InfinitePlace K, LinearIndependent F (L v.1))
    (hLFin : ∀ v ∈ S, LinearIndependent F (L (FinitePlace.mk v).1))
    (C : AbsoluteValue K ℝ → ℝ) (c : AbsoluteValue K ℝ → ι → ℝ)
    (hc : ∑ v : InfinitePlace K, ∑ i, c v.1 i + ∑ v ∈ S, ∑ i, c (FinitePlace.mk v).1 i < 0) :
    ∃ T : Finset (Submodule K (ι → K)), (∀ W ∈ T, W ≠ ⊤) ∧
      ∀ x : ι → K, x ≠ 0 → (∀ j, x j ∈ (S : Set (HeightOneSpectrum (𝓞 K))).integer K) →
        (∀ (v : InfinitePlace K) (i : ι),
          w v.1 (L v.1 i fun j ↦ algebraMap K F (x j)) ^ v.mult ≤
            C v.1 * mulHeightAff x ^ c v.1 i) →
        (∀ v ∈ S, ∀ i : ι,
          w (FinitePlace.mk v).1 (L (FinitePlace.mk v).1 i fun j ↦ algebraMap K F (x j)) ≤
            C (FinitePlace.mk v).1 * mulHeightAff x ^ c (FinitePlace.mk v).1 i) →
        ∃ W ∈ T, x ∈ W :=
  sorry

end Counting

end TauCetiRoadmap.SubspaceTheorem
