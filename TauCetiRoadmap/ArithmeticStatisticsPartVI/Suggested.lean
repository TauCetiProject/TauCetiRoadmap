import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroup

/-!
# Arithmetic statistics, Part VI: representative target signatures

The accompanying README is the full specification, with source locators and exact
supplier contracts. This file records light definitions and selected milestones that
can be stated against the pinned libraries; it is not exhaustive. The two-Selmer
milestones use Tau Ceti's classical Selmer carrier. The plane-cubic transport carries
its positive-rank count as a hypothesis. Counts keep the specified cutoffs and
denominators; orbit weights, local masses, moduli, covering and arithmetic probability
constructions remain README targets.

Design choices made explicit here:
* a restricted Selmer set is cut out of an existing set by one local image per place;
  the empty family of places imposes no condition;
* the odd-component bound is the unnormalized count `S_m(k)`; the README divides it by
  `2 ^ (m - 1)` only for `m ≥ 1`;
* plane cubics are coefficient vectors in the ordinary monomial basis
  `x³, x²y, x²z, xy², xyz, xz², y³, y²z, yz², z³`, counted in an inclusive integral cube,
  with no `GL₃`, scalar or isomorphism quotient;
* the rank-one family is a predicate on integral short pairs `(A, B)`, with
  `Δ₀ = -4A³ - 27B²`; nonsplit reduction at seven is the test that `864B` is a
  nonsquare modulo seven, and good ordinary reduction at five is `#E(𝔽₅) ≢ 1 (mod 5)`.
-/

noncomputable section
open scoped BigOperators Topology Classical
open Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartVI

/-! ## Layer 4: Selmer averages and arithmetic applications -/

namespace Selmer

/-- The rational short Weierstrass curve of an integral pair (README Conventions). -/
def shortCurve (ab : ℤ × ℤ) : WeierstrassCurve.Affine ℚ :=
  ⟨0, 0, 0, ab.1, ab.2⟩

/-- Minimal nonsingular short pairs in a family below the strict height cutoff
(README §4.1, average over a height ordered family). -/
def shortPairSublevel (F : Set (ℤ × ℤ)) (X : ℝ) : Set (ℤ × ℤ) :=
  {ab | ab ∈ F ∧ -4 * ab.1 ^ 3 - 27 * ab.2 ^ 2 ≠ 0 ∧
    (∀ p : ℕ, p.Prime → ¬ ((p : ℤ) ^ 4 ∣ ab.1 ∧ (p : ℤ) ^ 6 ∣ ab.2)) ∧
    max (4 * |(ab.1 : ℝ)| ^ 3) (27 * (ab.2 : ℝ) ^ 2) < X}

/-- The finite-sublevel average with its actual family denominator and value zero on
an empty sublevel (README §4.1, average over a height ordered family). -/
def shortPairAverage (F : Set (ℤ × ℤ)) (φ : ℤ × ℤ → ℝ) (X : ℝ) : ℝ :=
  (∑' ab : shortPairSublevel F X, φ ab.val) / (shortPairSublevel F X).ncard

/-- The classical two-Selmer cardinality, using Tau Ceti's local conditions at all
finite places and at the real place; singular pairs receive zero and are excluded
from every average (README §4.10, average Selmer size over all curves and congruence
families; EllipticCurves Layer 7 supplies finiteness). -/
def twoSelmerSize (ab : ℤ × ℤ) : ℕ := by
  classical
  letI : (shortCurve ab).IsCharNeTwoNF := ⟨rfl, rfl⟩
  exact if h : (shortCurve ab).IsElliptic then
    letI := h
    Nat.card ((shortCurve ab).selmerGroup₂ ℤ (fun _ : Unit => ℝ))
  else 0

/-- A ternary cubic in the ten ordinary monomial coefficients, ordered
`x³, x²y, x²z, xy², xyz, xz², y³, y²z, yz², z³`. -/
def ternaryCubicValue (c : Fin 10 → ℤ) (x : Fin 3 → ℚ) : ℚ :=
  c 0 * x 0 ^ 3 + c 1 * x 0 ^ 2 * x 1 + c 2 * x 0 ^ 2 * x 2 +
  c 3 * x 0 * x 1 ^ 2 + c 4 * x 0 * x 1 * x 2 + c 5 * x 0 * x 2 ^ 2 +
  c 6 * x 1 ^ 3 + c 7 * x 1 ^ 2 * x 2 + c 8 * x 1 * x 2 ^ 2 + c 9 * x 2 ^ 3

/-- The rank-one family of integral short pairs (README §4.22; Bhargava–Skinner,
arXiv:1401.0233, §2, pp. 3–4): `v₂(A) = 4`, `B ≡ 16 (mod 64)`, `-4A³ - 27B² = 256d` with `d`
positive, odd and squarefree, the discriminant prime to `195` and a square modulo `39`,
`7 ∣ d`, nonsplit reduction at seven and good ordinary reduction at five. -/
def RankOneFamily (A B : ℤ) : Prop :=
  (16 : ℤ) ∣ A ∧ ¬ (32 : ℤ) ∣ A ∧ B % 64 = 16 ∧
  ∃ d : ℤ, -4 * A ^ 3 - 27 * B ^ 2 = 256 * d ∧ 0 < d ∧ Odd d ∧ Squarefree d ∧
    IsCoprime (-4 * A ^ 3 - 27 * B ^ 2) 195 ∧
    IsSquare ((-4 * A ^ 3 - 27 * B ^ 2 : ℤ) : ZMod 39) ∧ (7 : ℤ) ∣ d ∧
    ¬ IsSquare ((864 * B : ℤ) : ZMod 7) ∧ (1 + ((Finset.univ : Finset (ZMod 5 × ZMod 5)).filter
      (fun p => p.2 ^ 2 = p.1 ^ 3 + (A : ZMod 5) * p.1 + (B : ZMod 5))).card) % 5 ≠ 1

/-! ### Headline milestones -/

/-- Mean two-Selmer size three in every nonempty family defined by finitely many
coefficient congruences (README §4.10, average Selmer size over all curves and
congruence families; Bhargava–Shankar, Theorems 1.1 and 1.3). -/
theorem average_twoSelmer_congruence (F : Set (ℤ × ℤ))
    (hcong : ∃ N : ℕ, 0 < N ∧ ∃ C : Set (ZMod N × ZMod N),
      F = {ab | ((ab.1 : ZMod N), (ab.2 : ZMod N)) ∈ C})
    (hne : ∃ X : ℝ, (shortPairSublevel F X).Nonempty) :
    Tendsto (shortPairAverage F (fun ab => (twoSelmerSize ab : ℝ)))
      atTop (nhds 3) := by sorry

/-- A mean two-Selmer size of three bounds the upper average Mordell–Weil rank by
three halves, expressed as eventual bounds for every positive error
(README §4.11, rank bound from the Selmer average; Bhargava–Shankar, Corollary 1.2). -/
theorem average_rank_le_of_twoSelmer_mean (F : Set (ℤ × ℤ))
    (hmean : Tendsto (shortPairAverage F (fun ab => (twoSelmerSize ab : ℝ)))
      atTop (nhds 3)) :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ X in atTop,
      shortPairAverage F (fun ab => (Module.finrank ℤ (shortCurve ab).Point : ℝ)) X ≤
        3 / 2 + ε := by sorry

/-- The three-Selmer mean bounds the upper average Mordell–Weil rank by seven
sixths in every nonempty finite-congruence family (README §4.14, average rank bound
from the 3 selmer average; Bhargava–Shankar, Corollary 2 and Theorem 3). -/
theorem average_rank_le_seven_sixths (F : Set (ℤ × ℤ))
    (hcong : ∃ N : ℕ, 0 < N ∧ ∃ C : Set (ZMod N × ZMod N),
      F = {ab | ((ab.1 : ZMod N), (ab.2 : ZMod N)) ∈ C})
    (hne : ∃ X : ℝ, (shortPairSublevel F X).Nonempty) :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ X in atTop,
      shortPairAverage F (fun ab => (Module.finrank ℤ (shortCurve ab).Point : ℝ)) X ≤
        7 / 6 + ε := by sorry

/-- The five-Selmer mean bounds the upper average Mordell–Weil rank by 21/20
and the lower proportion of rank at most one by 19/24 in nonempty finite-congruence
families (README §4.27, five basic bounds; Bhargava–Shankar, Proposition 38). -/
theorem fiveSelmer_basic_rank_bounds (F : Set (ℤ × ℤ))
    (hcong : ∃ N : ℕ, 0 < N ∧ ∃ C : Set (ZMod N × ZMod N),
      F = {ab | ((ab.1 : ZMod N), (ab.2 : ZMod N)) ∈ C})
    (hne : ∃ X : ℝ, (shortPairSublevel F X).Nonempty) :
    (∀ ε : ℝ, 0 < ε → ∀ᶠ X in atTop,
      shortPairAverage F (fun ab => (Module.finrank ℤ (shortCurve ab).Point : ℝ)) X ≤
        21 / 20 + ε) ∧
    (∀ ε : ℝ, 0 < ε → ∀ᶠ X in atTop,
      19 / 24 - ε ≤ shortPairAverage F (fun ab =>
        if Module.finrank ℤ (shortCurve ab).Point ≤ 1 then 1 else 0) X) := by sorry

/-- The rank-one coefficient family has a positive asymptotic curve count in the
minimal-short-pair height (README §4.22, rank one family properties;
Bhargava–Skinner, Lemma 15, with the stated dyadic convention). -/
theorem rankOneFamily_count_asymptotic :
    ∃ c : ℝ, 0 < c ∧ Tendsto (fun X : ℝ =>
      ((shortPairSublevel {ab | RankOneFamily ab.1 ab.2} X).ncard : ℝ) /
        X ^ (5 / 6 : ℝ)) atTop (nhds c) := by sorry

/-- Rational p-torsion is absent on a density-one set of minimal short curves for
every prime p (README §4.13, rational p torsion has density zero;
Bhargava–Kane–Lenstra–Poonen–Rains, Lemma 5.7). -/
theorem rational_p_torsion_density_zero (p : ℕ) (hp : p.Prime) :
    Tendsto (shortPairAverage Set.univ (fun ab =>
      if ∃ P : (shortCurve ab).Point, P ≠ 0 ∧ p • P = 0 then 1 else 0))
      atTop (nhds 0) := by sorry

/-- The marked two-Selmer factorial moment has upper average at most eight for
nonempty finite-congruence families (README §4.14, marked quartic factorial-moment
bound; Bhargava–Shankar–Swaminathan, Theorem 7.14 and removal of smoothing). -/
theorem markedQuartic_factorialMoment_le (F : Set (ℤ × ℤ))
    (hcong : ∃ N : ℕ, 0 < N ∧ ∃ C : Set (ZMod N × ZMod N),
      F = {ab | ((ab.1 : ZMod N), (ab.2 : ZMod N)) ∈ C})
    (hne : ∃ X : ℝ, (shortPairSublevel F X).Nonempty) :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ X in atTop,
      shortPairAverage F (fun ab =>
        ((twoSelmerSize ab : ℝ) - 1) * ((twoSelmerSize ab : ℝ) - 2)) X ≤ 8 + ε := by sorry

/-- The upper second moment of two-Selmer size is at most fifteen in every nonempty
family defined by finitely many coefficient congruences (README §4.14, second moment
of the 2-Selmer group; Bhargava–Shankar–Swaminathan, Theorem 1.1).
Eventual bounds for every positive error also exclude an infinite upper moment. -/
theorem secondMoment_twoSelmer_le (F : Set (ℤ × ℤ))
    (hcong : ∃ N : ℕ, 0 < N ∧ ∃ C : Set (ZMod N × ZMod N),
      F = {ab | ((ab.1 : ZMod N), (ab.2 : ZMod N)) ∈ C})
    (hne : ∃ X : ℝ, (shortPairSublevel F X).Nonempty) :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ X in atTop,
      shortPairAverage F (fun ab => (twoSelmerSize ab : ℝ) ^ 2) X ≤ 15 + ε := by sorry

/-- A positive lower count of minimal short pairs with infinitely many rational affine
points gives a positive proportion of ternary cubics with a nonzero rational zero
(README §4.24; Bhargava, arXiv:1402.1131, Theorem 2, p. 3). The input uses height `T⁶`
and count scale `T⁵`; the conclusion uses the inclusive coefficient cube. -/
theorem positive_plane_cubic_solubility
    (hpositiveRank : 0 < liminf (fun T : ℕ =>
      ({ab : ℤ × ℤ | -4 * ab.1 ^ 3 - 27 * ab.2 ^ 2 ≠ 0 ∧
        (∀ p : ℕ, p.Prime → ¬ ((p : ℤ) ^ 4 ∣ ab.1 ∧ (p : ℤ) ^ 6 ∣ ab.2)) ∧
        max (4 * |ab.1| ^ 3) (27 * ab.2 ^ 2) ≤ (T : ℤ) ^ 6 ∧
        Set.Infinite {xy : ℚ × ℚ |
          xy.2 ^ 2 = xy.1 ^ 3 + (ab.1 : ℚ) * xy.1 + (ab.2 : ℚ)}}.ncard : ℝ) /
      (T : ℝ) ^ 5) atTop) :
    0 < liminf (fun T : ℕ =>
      ({c : Fin 10 → ℤ | (∀ i, |c i| ≤ (T : ℤ)) ∧
        ∃ x : Fin 3 → ℚ, x ≠ 0 ∧ ternaryCubicValue c x = 0}.ncard : ℝ) /
      (((2 * T + 1) ^ 10 : ℕ) : ℝ)) atTop := by sorry

/-! ### Local Kummer indices and auxiliary targets -/

/-- Every nonempty finite-congruence family has a positive asymptotic denominator
in the minimal-short-pair height (README §4.8, count of curves in a large family;
Bhargava–Shankar, Theorem 3.17 and finite disjoint unions). -/
theorem shortPair_congruence_count_asymptotic (F : Set (ℤ × ℤ))
    (hcong : ∃ N : ℕ, 0 < N ∧ ∃ C : Set (ZMod N × ZMod N),
      F = {ab | ((ab.1 : ZMod N), (ab.2 : ZMod N)) ∈ C})
    (hne : ∃ X : ℝ, (shortPairSublevel F X).Nonempty) :
    ∃ c : ℝ, 0 < c ∧ Tendsto (fun X : ℝ =>
      ((shortPairSublevel F X).ncard : ℝ) / X ^ (5 / 6 : ℝ))
      atTop (nhds c) := by sorry

/-- A finite-index additive p-adic subgroup gives finite two-torsion and the exact
doubling index (README §4.6, two division quotient of a group with a finite index
zp subgroup; Bhargava–Shankar, Lemma 3.20 and the finite-index group calculation). -/
theorem two_division_finiteIndex (p : ℕ) [Fact p.Prime]
    {G : Type*} [AddCommGroup G] (U : AddSubgroup G) [U.FiniteIndex]
    (e : U ≃+ PadicInt p) :
    Finite (nsmulAddMonoidHom (α := G) 2).ker ∧
      (nsmulAddMonoidHom (α := G) 2).range.FiniteIndex ∧
      (nsmulAddMonoidHom (α := G) 2).range.index =
        (if p = 2 then 2 else 1) * Nat.card (nsmulAddMonoidHom (α := G) 2).ker := by sorry

/-- The doubling quotient of any elliptic curve over Q_p has the same size as its
two-torsion at odd primes and twice that size at two (README §4.6, local two descent
index; Bhargava–Shankar, Lemma 3.20). Both groups are finite. -/
theorem local_two_descent_index (p : ℕ) [Fact p.Prime]
    (E : WeierstrassCurve.Affine (Padic p)) [E.IsElliptic] :
    Finite (nsmulAddMonoidHom (α := E.Point) 2).ker ∧
      (nsmulAddMonoidHom (α := E.Point) 2).range.FiniteIndex ∧
      (nsmulAddMonoidHom (α := E.Point) 2).range.index =
        (if p = 2 then 2 else 1) * Nat.card (nsmulAddMonoidHom (α := E.Point) 2).ker := by sorry

/-- Over the reals, the doubling quotient has half as many elements as the finite
two-torsion group (README §4.6, archimedean Selmer ratio is one half). -/
theorem archimedean_two_descent_index (E : WeierstrassCurve.Affine ℝ) [E.IsElliptic] :
    Finite (nsmulAddMonoidHom (α := E.Point) 2).ker ∧
      (nsmulAddMonoidHom (α := E.Point) 2).range.FiniteIndex ∧
      2 * (nsmulAddMonoidHom (α := E.Point) 2).range.index =
        Nat.card (nsmulAddMonoidHom (α := E.Point) 2).ker := by sorry

/-- The first matrix of the soluble pencil with invariant `x⁴ - xy³ - y⁴`
(README §4.15, pencil local global weight). -/
def solublePencilA : Matrix (Fin 4) (Fin 4) ℤ :=
  !![0,0,0,1; 0,0,1,0; 0,1,0,0; 1,0,0,1]

/-- The second matrix of the soluble pencil with invariant `x⁴ - xy³ - y⁴`
(README §4.15, pencil local global weight). -/
def solublePencilB : Matrix (Fin 4) (Fin 4) ℤ :=
  !![0,0,1,0; 0,1,0,0; 1,0,0,1; 0,0,1,1]

/-- The determinant pencil has the specified quartic invariant. -/
example (x y : ℤ) : Matrix.det (x • solublePencilA - y • solublePencilB) =
    x ^ 4 - x * y ^ 3 - y ^ 4 := by
  simp [Matrix.det_succ_row_zero, Fin.sum_univ_succ, Fin.succAbove, Matrix.submatrix_apply,
    solublePencilA, solublePencilB]
  ring

/-- The first basis vector is a nonzero common zero of both quadratic forms. -/
example : (1 : ℤ) ≠ 0 ∧ solublePencilA 0 0 = 0 ∧ solublePencilB 0 0 = 0 := by
  decide

/-- Restrict an existing Selmer set by a specified local image at every place
(README §4.17, restricted Selmer set). -/
def restrictedSelmerSet {A V : Type*} {Q : V → Type*} (S : Set A)
    (loc : (v : V) → A → Q v) (I : (v : V) → Set (Q v)) : Set A :=
  {s | s ∈ S ∧ ∀ v, loc v s ∈ I v}

/-- No places: the restriction is the original set. -/
example (S : Set ℕ) : restrictedSelmerSet (Q := fun _ : Empty => ℕ) S
    (fun v : Empty => Empty.elim v) (fun v : Empty => Empty.elim v) = S := by
  ext s; simp [restrictedSelmerSet]

/-- The number `S_m(k)` of odd subsets of size at most `k` of `m` real components
(README §4.17, odd component bound; BGW, proof of Theorem 7, p. 34). -/
def oddComponentBound (m k : ℕ) : ℕ :=
  ∑ j ∈ (Finset.range (k + 1)).filter (fun j => Odd j), Nat.choose m j

/-- For every fixed cutoff, the odd-subset bound occupies a vanishing fraction of real
components (README §4.17, odd component bound; BGW (23), p. 34). -/
theorem component_bound_ratio_tendsto (k : ℕ) :
    Tendsto (fun m : ℕ => (oddComponentBound m k : ℝ) / 2 ^ (m - 1))
      atTop (nhds 0) := by sorry

/-- The odd-component image bound never exceeds the full local quotient
(README §4.17, odd component bound). -/
theorem component_bound_le (m k : ℕ) (hm : 0 < m) :
    oddComponentBound m k ≤ 2 ^ (m - 1) := by sorry

/-- Once the cutoff includes every component, the odd-subset bound is saturated
(README §4.17, odd component bound). -/
theorem component_bound_saturated (m k : ℕ) (hm : 0 < m) (hk : m ≤ k) :
    oddComponentBound m k = 2 ^ (m - 1) := by sorry

/-- Below the odd-degree saturation threshold, the component bound is strict
(README §4.17, odd component bound). -/
theorem component_bound_strict (m k : ℕ) (hm : 0 < m) (hk : Odd k) (hkm : k < m - 1) :
    oddComponentBound m k < 2 ^ (m - 1) := by sorry

/-- A single real component saturates the odd-subset bound at every positive cutoff
(README §4.17, odd component bound). -/
theorem component_bound_one (k : ℕ) (hk : 0 < k) : oddComponentBound 1 k = 1 := by sorry

/-- `(-208, 464)` lies in the family: `d = 117901 = 7·16843` and `#E(𝔽₅) = 7`.
Its integral model is `y² + y = x³ - 13x + 7`, of odd discriminant `117901`. -/
example : RankOneFamily (-208) 464 := by
  refine ⟨by norm_num, by norm_num, by norm_num, 117901, by norm_num, by norm_num,
    ⟨58950, by norm_num⟩, ?_, ?_, by decide, by norm_num, by decide, by decide⟩
  · rw [← Int.squarefree_natAbs, Nat.squarefree_iff_nodup_primeFactorsList (by norm_num)]
    simp [Nat.primeFactorsList_ofNat]
  · rw [Int.isCoprime_iff_gcd_eq_one]; norm_num

/-- `(-208, 656)` has split multiplicative reduction at seven. -/
example : ¬ RankOneFamily (-208) 656 := by
  rintro ⟨-, -, -, -, -, -, -, -, -, -, -, h, -⟩
  exact h (by decide)

end Selmer

/-! The remaining definitions of Layer 4 are README targets whose carriers are not at the
pins in the required form: the rational and local orbit weights and orbit counts, the
locally soluble sets `S(F)`, `S_p(F)`, `S_∞(F)`, the local and archimedean Selmer masses,
the general arithmetic-family averages, the extended upper and lower height
moments and densities, and the admissibility predicate for hyperelliptic congruence
families. -/

end TauCetiRoadmap.ArithmeticStatisticsPartVI
