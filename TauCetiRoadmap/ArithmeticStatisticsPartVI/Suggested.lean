import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroup

/-!
# Arithmetic statistics, Part VI: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; these statements suggest Lean forms for its headline theorems.

The statements cover mean two-Selmer size three in positive-mass large families and
finite-congruence families, the upper second moment fifteen, the Mordell–Weil rank
bounds three halves, seven sixths and twenty-one twentieths, and positive rational
solubility of plane cubics from a positive-rank count. The two-Selmer carrier is Tau
Ceti's classical descent group, with every finite completion and the real completion.
Large-family hypotheses use actual closures of minimal short pairs in `PadicInt`.

Two hyperelliptic consequences are stated directly on coefficient models: bounded
odd-degree points disappear in the iterated height/genus limit, and a positive lower
proportion of everywhere locally soluble models have no odd-degree point. The point
predicate includes both the affine chart and the points at infinity of the smooth
even-degree double cover. Finite extensions are subfields of `AlgebraicClosure ℚ`.

The three-, four- and five-Selmer means and the nonlifting theorem need the missing
higher Selmer groups and the map from four-Selmer to two-Selmer. Sha averages need the
elliptic Sha carrier and its comparison with explicit descent; generic continuous
cohomology alone does not provide that comparison. The hyperelliptic Selmer averages,
order-k sets, parity and Picard-torsor conclusions need the unpointed Jacobian degree
torsors, their localizations and Selmer sets. The function-field and rigidified Picard
APIs do not supply those objects. Their admissible-family extensions are also omitted.
The marked genus-one average needs the rational quartic-orbit/covering dictionary.

Simultaneous algebraic and analytic rank, p-parity, the root-balanced rank bounds and
the numerical full-family mixtures need the specified modular comparison data,
including marked classical and quaternionic Jacobian factors and compatible Galois
realizations. Newform analytic ranks exist, but this geometric comparison is not
available at the pins. Mathlib's uncontinued elliptic Dirichlet series cannot replace it.
-/

noncomputable section
open scoped BigOperators Topology Classical
open Filter MeasureTheory

namespace TauCetiRoadmap.ArithmeticStatisticsPartVI
namespace Selmer

/-- The nonsingular integral short pairs minimal under fourth/sixth-power scaling. -/
def minimalShortPairs : Set (ℤ × ℤ) :=
  {ab | -4 * ab.1 ^ 3 - 27 * ab.2 ^ 2 ≠ 0 ∧
    ∀ p : ℕ, p.Prime → ¬ ((p : ℤ) ^ 4 ∣ ab.1 ∧ (p : ℤ) ^ 6 ∣ ab.2)}

/-- The actual p-adic closure of the minimal pairs in a family. -/
def localPairClosure (F : Set (ℤ × ℤ)) (p : ℕ) [Fact p.Prime] :
    Set (PadicInt p × PadicInt p) :=
  closure ((fun ab : ℤ × ℤ => ((ab.1 : PadicInt p), (ab.2 : PadicInt p))) ''
    (F ∩ minimalShortPairs))

/-- Additive Haar probability measure on the compact coefficient lattice. -/
def pairHaar (p : ℕ) [Fact p.Prime] : @Measure (PadicInt p × PadicInt p) (borel _) := by
  letI : MeasurableSpace (PadicInt p × PadicInt p) := borel _
  letI : BorelSpace (PadicInt p × PadicInt p) := ⟨rfl⟩
  exact Measure.addHaarMeasure ⟨⟨Set.univ, isCompact_univ⟩, by simp⟩

/-- Positive-mass large families, with real signs, null local boundaries and the
large-prime square-discriminant condition (README §§4.8–4.10). -/
def IsLargeFamily (F : Set (ℤ × ℤ)) : Prop :=
  (∃ signs : Set Bool, signs.Nonempty ∧ ∀ ab ∈ minimalShortPairs,
    ab ∈ F ↔ decide (0 < -4 * ab.1 ^ 3 - 27 * ab.2 ^ 2) ∈ signs ∧
      ∀ (p : ℕ) (hp : p.Prime),
        letI : Fact p.Prime := ⟨hp⟩
        ((ab.1 : PadicInt p), (ab.2 : PadicInt p)) ∈ localPairClosure F p) ∧
  (∀ (p : ℕ) (hp : p.Prime),
    letI : Fact p.Prime := ⟨hp⟩
    pairHaar p (frontier (localPairClosure F p)) = 0 ∧
      0 < pairHaar p (localPairClosure F p)) ∧
  ∃ P : ℕ, ∀ (p : ℕ) (hp : p.Prime), P < p →
    letI : Fact p.Prime := ⟨hp⟩
    ∀ ab : PadicInt p × PadicInt p,
      ¬ (p : PadicInt p) ^ 2 ∣ (-4 * ab.1 ^ 3 - 27 * ab.2 ^ 2) →
        ab ∈ localPairClosure F p

/-- The rational short Weierstrass curve of an integral pair (README Conventions). -/
def shortCurve (ab : ℤ × ℤ) : WeierstrassCurve.Affine ℚ :=
  ⟨0, 0, 0, ab.1, ab.2⟩

/-- Minimal nonsingular short pairs in a family below the strict height cutoff
(README §4.1, average over a height ordered family). -/
def shortPairSublevel (F : Set (ℤ × ℤ)) (X : ℝ) : Set (ℤ × ℤ) :=
  {ab | ab ∈ F ∩ minimalShortPairs ∧
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

/-- Finite coefficient congruences with either real discriminant sign, allowing
finite unions with coupled residue and sign conditions and requiring a nonempty
minimal nonsingular family (README §§4.10, 4.14). -/
def IsFiniteCongruenceFamily (F : Set (ℤ × ℤ)) : Prop :=
  (∃ N : ℕ, 0 < N ∧ ∃ C : Set (Bool × (ZMod N × ZMod N)),
    ∀ ab ∈ minimalShortPairs, ab ∈ F ↔
      (decide (0 < -4 * ab.1 ^ 3 - 27 * ab.2 ^ 2),
        ((ab.1 : ZMod N), (ab.2 : ZMod N))) ∈ C) ∧
  ∃ X : ℝ, (shortPairSublevel F X).Nonempty

/-- Mean two-Selmer size three in every positive-mass large family
(README §4.10; Bhargava–Shankar, Theorem 3.1). -/
theorem average_twoSelmer_largeFamily (F : Set (ℤ × ℤ)) (hF : IsLargeFamily F) :
    Tendsto (shortPairAverage F (fun ab => (twoSelmerSize ab : ℝ)))
      atTop (nhds 3) := by
  sorry

/-- Mean two-Selmer size three in every nonempty family defined by finitely many
coefficient congruences (README §4.10, average Selmer size over all curves and
congruence families; Bhargava–Shankar, Theorems 1.1 and 1.3). -/
theorem average_twoSelmer_congruence (F : Set (ℤ × ℤ))
    (hF : IsFiniteCongruenceFamily F) :
    Tendsto (shortPairAverage F (fun ab => (twoSelmerSize ab : ℝ)))
      atTop (nhds 3) := by
  sorry

/-- A mean two-Selmer size of three bounds the upper average Mordell–Weil rank by
three halves, expressed as eventual bounds for every positive error
(README §4.11, rank bound from the Selmer average; Bhargava–Shankar, Corollary 1.2). -/
theorem average_rank_le_of_twoSelmer_mean (F : Set (ℤ × ℤ))
    (hmean : Tendsto (shortPairAverage F (fun ab => (twoSelmerSize ab : ℝ)))
      atTop (nhds 3)) :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ X in atTop,
      shortPairAverage F (fun ab => (Module.finrank ℤ (shortCurve ab).Point : ℝ)) X ≤
        3 / 2 + ε := by
  sorry

/-- The three-Selmer mean bounds the upper average Mordell–Weil rank by seven
sixths in every positive-mass large or nonempty finite-congruence family
(README §4.14, average rank bound from the 3 selmer average; Bhargava–Shankar,
Corollary 2 and Theorem 3). -/
theorem average_rank_le_seven_sixths (F : Set (ℤ × ℤ))
    (hF : IsLargeFamily F ∨ IsFiniteCongruenceFamily F) :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ X in atTop,
      shortPairAverage F (fun ab => (Module.finrank ℤ (shortCurve ab).Point : ℝ)) X ≤
        7 / 6 + ε := by
  sorry

/-- The five-Selmer mean bounds the upper average Mordell–Weil rank by 21/20
and the lower proportion of rank at most one by 19/24 in positive-mass large and
nonempty finite-congruence families (README §4.27, five basic bounds;
Bhargava–Shankar, Proposition 38). -/
theorem fiveSelmer_basic_rank_bounds (F : Set (ℤ × ℤ))
    (hF : IsLargeFamily F ∨ IsFiniteCongruenceFamily F) :
    (∀ ε : ℝ, 0 < ε → ∀ᶠ X in atTop,
      shortPairAverage F (fun ab => (Module.finrank ℤ (shortCurve ab).Point : ℝ)) X ≤
        21 / 20 + ε) ∧
    (∀ ε : ℝ, 0 < ε → ∀ᶠ X in atTop,
      19 / 24 - ε ≤ shortPairAverage F (fun ab =>
        if Module.finrank ℤ (shortCurve ab).Point ≤ 1 then 1 else 0) X) := by
  sorry

/-- The upper second moment of two-Selmer size is at most fifteen in every nonempty
family defined by finitely many coefficient congruences (README §4.14, second moment
of the 2-Selmer group; Bhargava–Shankar–Swaminathan, Theorem 1.1).
Eventual bounds for every positive error also exclude an infinite upper moment. -/
theorem secondMoment_twoSelmer_le (F : Set (ℤ × ℤ))
    (hF : IsFiniteCongruenceFamily F) :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ X in atTop,
      shortPairAverage F (fun ab => (twoSelmerSize ab : ℝ) ^ 2) X ≤ 15 + ε := by
  sorry

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
      (((2 * T + 1) ^ 10 : ℕ) : ℝ)) atTop := by
  sorry

/-- The degree-(2g+2) polynomial in descending integral coefficients. -/
def hyperellipticPolynomial (g : ℕ) (a : Fin (2 * g + 3) → ℤ) : Polynomial ℚ :=
  ∑ i, Polynomial.C (a i : ℚ) * Polynomial.X ^ (2 * g + 2 - i.val)

/-- Smooth degree-(2g+2) models in the inclusive coefficient cube, each counted once. -/
def hyperellipticSublevel (g : ℕ) (F : Set (Fin (2 * g + 3) → ℤ)) (T : ℕ) :
    Set (Fin (2 * g + 3) → ℤ) :=
  {a | a ∈ F ∧ a 0 ≠ 0 ∧ (hyperellipticPolynomial g a).Separable ∧
    ∀ i, |a i| ≤ (T : ℤ)}

/-- Points of the even-degree double cover: the affine equation or a square leading
coefficient giving a point at infinity. -/
def hyperellipticHasPoint (g : ℕ) (a : Fin (2 * g + 3) → ℤ)
    (K : Type*) [Field K] : Prop :=
  (∃ x y : K, y ^ 2 = ∑ i, (a i : K) * x ^ (2 * g + 2 - i.val)) ∨
    IsSquare (a 0 : K)

/-- A point over a finite odd-degree extension of degree at most m; all extensions
embed in the chosen algebraic closure. -/
def hasOddDegreePoint (g : ℕ) (a : Fin (2 * g + 3) → ℤ) (m : ℕ) : Prop :=
  ∃ K : IntermediateField ℚ (AlgebraicClosure ℚ),
    FiniteDimensional ℚ K ∧ Odd (Module.finrank ℚ K) ∧
      Module.finrank ℚ K ≤ m ∧ hyperellipticHasPoint g a K

/-- Equation models with a point over the reals and over every p-adic completion. -/
def locallySolubleHyperelliptic (g : ℕ) : Set (Fin (2 * g + 3) → ℤ) :=
  {a | hyperellipticHasPoint g a ℝ ∧ ∀ (p : ℕ) (hp : p.Prime),
    letI : Fact p.Prime := ⟨hp⟩
    hyperellipticHasPoint g a (Padic p)}

/-- For fixed m, the lower proportion of smooth genus-g models without a point over
any odd-degree extension of degree at most m tends to one. Height tends to infinity
before genus (README §4.20; Bhargava–Gross–Wang, Corollary 8). -/
theorem small_odd_degree_points_disappear (m : ℕ) (hm : 0 < m) :
    Tendsto (fun g : ℕ => liminf (fun T : ℕ =>
      (({a ∈ hyperellipticSublevel g Set.univ T | ¬ hasOddDegreePoint g a m}.ncard : ℝ) /
        (hyperellipticSublevel g Set.univ T).ncard)) atTop) atTop (nhds 1) := by
  sorry

/-- A positive lower proportion of locally soluble genus-g models have no point over
any finite odd-degree extension (README §4.21, positive index two;
Bhargava–Gross–Wang, Theorems 1–2). -/
theorem positive_no_odd_degree_points (g : ℕ) (hg : 1 ≤ g) :
    0 < liminf (fun T : ℕ =>
      (({a ∈ hyperellipticSublevel g (locallySolubleHyperelliptic g) T |
        ∀ m : ℕ, ¬ hasOddDegreePoint g a m}.ncard : ℝ) /
        (hyperellipticSublevel g (locallySolubleHyperelliptic g) T).ncard)) atTop := by
  sorry

end Selmer
end TauCetiRoadmap.ArithmeticStatisticsPartVI
