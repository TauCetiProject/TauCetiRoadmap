import Mathlib

/-!
# Fractal geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need: iterated function systems with prescribed contraction ratios, their attractors and
Hutchinson operator, the two box-counting dimensions (built on Mathlib's covering numbers),
similarity systems and the open set condition. Every headline theorem of the README's summary
is statable at the pins and is stated here.
-/

open MeasureTheory Metric Set Filter TopologicalSpace
open scoped ENNReal NNReal Topology

namespace TauCetiRoadmap.FractalGeometry

/-! ## Layer 1: Iterated function systems -/

/-- 1.1: an iterated function system on a metric space `X` indexed by `ι`: a family of maps
`toFun i : X → X` together with a Lipschitz bound `ratio i ∈ (0, 1)` for each of them. -/
structure IFS (ι : Type*) (X : Type*) [MetricSpace X] where
  /-- The maps of the system. -/
  toFun : ι → X → X
  /-- The prescribed contraction ratios. -/
  ratio : ι → ℝ≥0
  /-- Every ratio is positive. -/
  ratio_pos : ∀ i, 0 < ratio i
  /-- Every ratio is less than one. -/
  ratio_lt_one : ∀ i, ratio i < 1
  /-- Each map is Lipschitz with its prescribed ratio. -/
  lipschitz : ∀ i, LipschitzWith (ratio i) (toFun i)

namespace IFS

variable {ι : Type*} {X : Type*} [MetricSpace X]

/-- 1.1: an iterated function system is used as the family of its maps. -/
instance : CoeFun (IFS ι X) fun _ => ι → X → X := ⟨IFS.toFun⟩

/-- 1.1: an attractor of `F` is a nonempty compact set `K` with `⋃ i, F i '' K = K`. -/
def IsAttractor (F : IFS ι X) (K : Set X) : Prop :=
  IsCompact K ∧ K.Nonempty ∧ ⋃ i, F i '' K = K

/-- 1.2: the Hutchinson operator `A ↦ ⋃ i, F i '' A` on nonempty compact sets, for a finite
nonempty index type. -/
def hutchinson [Finite ι] [Nonempty ι] (F : IFS ι X) (A : NonemptyCompacts X) :
    NonemptyCompacts X where
  carrier := ⋃ i, F i '' (A : Set X)
  isCompact' := isCompact_iUnion fun i => A.isCompact.image (F.lipschitz i).continuous
  nonempty' := ‹Nonempty ι›.elim fun i => Set.nonempty_iUnion.2 ⟨i, A.nonempty.image _⟩

/-- 1.2: the largest of the prescribed ratios (zero for an empty index type). -/
def maxRatio [Fintype ι] (F : IFS ι X) : ℝ≥0 := Finset.univ.sup F.ratio

/-- 1.2: the Hutchinson operator is Lipschitz for the Hausdorff metric, with constant the
largest ratio (Hutchinson 1981, 3.2(1)). -/
theorem lipschitzWith_hutchinson [Fintype ι] [Nonempty ι] (F : IFS ι X) :
    LipschitzWith F.maxRatio F.hutchinson := by
  sorry

/-- 1.3: a finite nonempty iterated function system on a nonempty complete metric space has
exactly one attractor (Hutchinson 1981, 3.1(3)(i) and 3.2(1)). -/
theorem existsUnique_isAttractor [CompleteSpace X] [Nonempty X] [Finite ι] [Nonempty ι]
    (F : IFS ι X) : ∃! K : Set X, F.IsAttractor K := by
  sorry

/-- 1.4: the coding map. On a nonempty complete space there is exactly one continuous map
`π : (ℕ → ι) → X` with `π ω = F (ω 0) (π (shift ω))`. -/
theorem existsUnique_codingMap [CompleteSpace X] [Nonempty X] [Finite ι] [TopologicalSpace ι]
    [DiscreteTopology ι] (F : IFS ι X) :
    ∃! π : (ℕ → ι) → X, Continuous π ∧ ∀ ω, π ω = F (ω 0) (π fun n => ω (n + 1)) := by
  sorry

/-- 1.4: a continuous solution of the coding equation maps the symbolic space onto the
attractor (Hutchinson 1981, 3.1(3)(vii)). -/
theorem range_codingMap [Finite ι] [TopologicalSpace ι] [DiscreteTopology ι] (F : IFS ι X)
    {K : Set X} (hK : F.IsAttractor K) {π : (ℕ → ι) → X} (hπ : Continuous π)
    (h : ∀ ω, π ω = F (ω 0) (π fun n => ω (n + 1))) : range π = K := by
  sorry

/-- 1.5: for a probability vector `p` there is exactly one Borel probability measure `μ` with
`μ = ∑ i, p i • μ.map (F i)` (Hutchinson 1981, 4.4(1); uniqueness among all Borel probability
measures). -/
theorem existsUnique_selfSimilarMeasure [CompleteSpace X] [Nonempty X] [MeasurableSpace X]
    [BorelSpace X] [Fintype ι] (F : IFS ι X) (p : ι → ℝ≥0∞) (hp : ∑ i, p i = 1) :
    ∃! μ : Measure X, IsProbabilityMeasure μ ∧ ∑ i, p i • μ.map (F i) = μ := by
  sorry

/-- 1.5: an invariant probability measure gives the attractor full mass
(Hutchinson 1981, 4.4(4)); the invariance equation forces the weights to sum to one. -/
theorem measure_attractor_eq_one [MeasurableSpace X] [BorelSpace X] [Fintype ι] (F : IFS ι X)
    {K : Set X} (hK : F.IsAttractor K) (p : ι → ℝ≥0∞) (μ : Measure X)
    [IsProbabilityMeasure μ] (hμ : ∑ i, p i • μ.map (F i) = μ) : μ K = 1 := by
  sorry

end IFS

/-! ## Layer 2: Box-counting dimensions -/

/-- 2.1: the upper box-counting dimension: the infimum of the exponents `d` such that the
covering number of `A` at radius `ε` is at most `ε ^ (-d)` for all small `ε`. -/
noncomputable def upperBoxDim {X : Type*} [PseudoEMetricSpace X] (A : Set X) : ℝ≥0∞ :=
  ⨅ (d : ℝ≥0) (_ : ∀ᶠ ε : ℝ≥0 in 𝓝[>] 0,
    (coveringNumber ε A : ℝ≥0∞) ≤ (ε : ℝ≥0∞)⁻¹ ^ (d : ℝ)), (d : ℝ≥0∞)

/-- 2.1: the lower box-counting dimension: the infimum of the exponents `d` such that the
covering number of `A` at radius `ε` is at most `ε ^ (-d)` for arbitrarily small `ε`. -/
noncomputable def lowerBoxDim {X : Type*} [PseudoEMetricSpace X] (A : Set X) : ℝ≥0∞ :=
  ⨅ (d : ℝ≥0) (_ : ∃ᶠ ε : ℝ≥0 in 𝓝[>] 0,
    (coveringNumber ε A : ℝ≥0∞) ≤ (ε : ℝ≥0∞)⁻¹ ^ (d : ℝ)), (d : ℝ≥0∞)

/-- 2.2: the Hausdorff dimension is at most the lower box-counting dimension
(Bishop and Peres, (1.2.3)). -/
theorem dimH_le_lowerBoxDim {X : Type*} [EMetricSpace X] (A : Set X) :
    dimH A ≤ lowerBoxDim A := by
  sorry

/-- 2.3: the countable compact set `{0} ∪ {1 / (n + 1)}` has box-counting dimension `1 / 2`
(Bishop and Peres, Example 1.1.4), while its Hausdorff dimension is zero. -/
theorem boxDim_harmonic :
    lowerBoxDim ({0} ∪ range fun n : ℕ => ((n : ℝ) + 1)⁻¹) = 2⁻¹ ∧
      upperBoxDim ({0} ∪ range fun n : ℕ => ((n : ℝ) + 1)⁻¹) = 2⁻¹ := by
  sorry

/-- 2.4: finite stability of the upper box-counting dimension. -/
theorem upperBoxDim_union {X : Type*} [PseudoEMetricSpace X] (A B : Set X) :
    upperBoxDim (A ∪ B) = max (upperBoxDim A) (upperBoxDim B) := by
  sorry

/-- 2.4: a map that is Hölder of exponent `r > 0` on `A` divides the upper box-counting
dimension by at most `r`. -/
theorem upperBoxDim_image_le {X Y : Type*} [PseudoEMetricSpace X] [PseudoEMetricSpace Y]
    {C r : ℝ≥0} {f : X → Y} {A : Set X} (h : HolderOnWith C r f A) (hr : 0 < r) :
    upperBoxDim (f '' A) ≤ upperBoxDim A / r := by
  sorry

/-! ## Layer 3: Lower bounds from measures -/

/-- 3.1: the mass distribution principle for balls centred on the set
(Bishop and Peres, Lemma 1.2.8). -/
theorem measure_le_mul_hausdorffMeasure {X : Type*} [MetricSpace X] [MeasurableSpace X]
    [BorelSpace X] (μ : Measure X) {E : Set X} {s : ℝ} (hs : 0 ≤ s) {C : ℝ≥0} (hC : C ≠ 0)
    {ε : ℝ} (hε : 0 < ε)
    (h : ∀ x ∈ E, ∀ r, 0 < r → r ≤ ε → μ (closedBall x r) ≤ C * ENNReal.ofReal r ^ s) :
    μ E ≤ C * μH[s] E := by
  sorry

/-- 3.2: Frostman's lemma for compact sets (Bishop and Peres, Lemma 3.1.1). -/
theorem exists_frostman_measure {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] {K : Set E} (hK : IsCompact K)
    {s : ℝ} (hs : 0 ≤ s) (h : μH[s] K ≠ 0) :
    ∃ μ : Measure E, IsFiniteMeasure μ ∧ μ K ≠ 0 ∧ μ Kᶜ = 0 ∧
      ∀ x r, μ (closedBall x r) ≤ ENNReal.ofReal r ^ s := by
  sorry

/-- 3.3: the energy criterion: a set charged by a Borel measure of finite `s`-energy, `s > 0`,
has infinite `s`-dimensional Hausdorff measure (Bishop and Peres, Theorem 3.4.2(ii)). -/
theorem hausdorffMeasure_eq_top_of_energy_ne_top {X : Type*} [MetricSpace X]
    [MeasurableSpace X] [BorelSpace X] (μ : Measure X) {A : Set X}
    (hA : μ A ≠ 0) {s : ℝ} (hs : 0 < s) (h : ∫⁻ x, ∫⁻ y, edist x y ^ (-s) ∂μ ∂μ ≠ ∞) :
    μH[s] A = ∞ := by
  sorry

/-! ## Layer 4: Self-similar sets -/

namespace IFS

variable {ι : Type*} {X : Type*} [MetricSpace X]

/-- 4.1: the maps are similarities with exactly the prescribed ratios. -/
def IsSimilarity (F : IFS ι X) : Prop :=
  ∀ i x y, dist (F i x) (F i y) = F.ratio i * dist x y

/-- 4.4: the open set condition: a nonempty open set mapped into itself by every map of the
system, with pairwise disjoint images (Hutchinson 1981, 5.2(1)). -/
def OpenSetCondition (F : IFS ι X) : Prop :=
  ∃ U : Set X, IsOpen U ∧ U.Nonempty ∧ (∀ i, F i '' U ⊆ U) ∧
    Pairwise fun i j => Disjoint (F i '' U) (F j '' U)

/-- 4.2: with no separation hypothesis, the upper box-counting dimension of the attractor is
at most the exponent `s` with `∑ i, ratio i ^ s = 1`. -/
theorem upperBoxDim_le [Fintype ι] (F : IFS ι X) {K : Set X} (hK : F.IsAttractor K) {s : ℝ}
    (hs : ∑ i, (F.ratio i : ℝ) ^ s = 1) : upperBoxDim K ≤ ENNReal.ofReal s := by
  sorry

/-- 4.2: with no separation hypothesis, the `s`-dimensional Hausdorff measure of the attractor
is at most the `s`-th power of its diameter (Hutchinson 1981, 5.1(4)(i)). -/
theorem hausdorffMeasure_le [MeasurableSpace X] [BorelSpace X] [Fintype ι] (F : IFS ι X)
    {K : Set X} (hK : F.IsAttractor K) {s : ℝ} (hs : ∑ i, (F.ratio i : ℝ) ^ s = 1) :
    μH[s] K ≤ ediam K ^ s := by
  sorry

/-- 4.3: for similarities whose images of the attractor are pairwise disjoint, the attractor
has positive `s`-dimensional Hausdorff measure, in every metric space. -/
theorem hausdorffMeasure_pos_of_disjoint [MeasurableSpace X] [BorelSpace X] [Fintype ι]
    (F : IFS ι X) (hF : F.IsSimilarity) {K : Set X} (hK : F.IsAttractor K)
    (hd : Pairwise fun i j => Disjoint (F i '' K) (F j '' K)) {s : ℝ}
    (hs : ∑ i, (F.ratio i : ℝ) ^ s = 1) : 0 < μH[s] K := by
  sorry

/-- 4.5: for similarities, once the attractor has positive `s`-dimensional Hausdorff measure,
the self-similar measure with weights `ratio i ^ s` is the normalized restriction of that
Hausdorff measure to the attractor (Hutchinson 1981, 5.3(1)(iii)); the invariance equation
forces `∑ i, ratio i ^ s = 1`. -/
theorem selfSimilarMeasure_eq_hausdorffMeasure [MeasurableSpace X] [BorelSpace X] [Fintype ι]
    (F : IFS ι X) (hF : F.IsSimilarity) {K : Set X} (hK : F.IsAttractor K) {s : ℝ}
    (h : μH[s] K ≠ 0) (μ : Measure X)
    [IsProbabilityMeasure μ] (hμ : ∑ i, (F.ratio i : ℝ≥0∞) ^ s • μ.map (F i) = μ) :
    μ = (μH[s] K)⁻¹ • (μH[s]).restrict K := by
  sorry

end IFS

/-- 4.4: the theorem of Moran and Hutchinson, measure part: for similarities of a
finite-dimensional real normed space satisfying the open set condition, the attractor has
positive `s`-dimensional Hausdorff measure (Hutchinson 1981, 5.3(1)(ii)). -/
theorem IFS.hausdorffMeasure_pos_of_openSetCondition {ι : Type*} [Fintype ι] {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E]
    [BorelSpace E] (F : IFS ι E) (hF : F.IsSimilarity) (hO : F.OpenSetCondition) {K : Set E}
    (hK : F.IsAttractor K) {s : ℝ} (hs : ∑ i, (F.ratio i : ℝ) ^ s = 1) : 0 < μH[s] K := by
  sorry

/-- 4.4: the theorem of Moran and Hutchinson, dimension part: under the open set condition
the Hausdorff dimension and both box-counting dimensions of the attractor equal the
similarity dimension (Bishop and Peres, Theorem 2.2.2). -/
theorem IFS.dimH_eq_of_openSetCondition {ι : Type*} [Fintype ι] {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] (F : IFS ι E)
    (hF : F.IsSimilarity) (hO : F.OpenSetCondition) {K : Set E} (hK : F.IsAttractor K) {s : ℝ}
    (hs : ∑ i, (F.ratio i : ℝ) ^ s = 1) :
    dimH K = ENNReal.ofReal s ∧ lowerBoxDim K = ENNReal.ofReal s ∧
      upperBoxDim K = ENNReal.ofReal s := by
  sorry

/-! ## Layer 5: Named sets and products -/

/-- 5.1: the middle-thirds Cantor set of Mathlib has Hausdorff dimension `log 2 / log 3`. -/
theorem dimH_cantorSet : dimH cantorSet = ENNReal.ofReal (Real.log 2 / Real.log 3) := by
  sorry

/-- 5.1: the symmetric Cantor set of ratio `c ∈ (0, 1/2]` has Hausdorff dimension
`log 2 / log (1 / c)`. -/
theorem dimH_symmetricCantor {c : ℝ} (h0 : 0 < c) (h1 : c ≤ 1 / 2) {K : Set ℝ}
    (hK : IsCompact K) (hne : K.Nonempty)
    (hinv : (fun x => c * x) '' K ∪ (fun x => c * x + (1 - c)) '' K = K) :
    dimH K = ENNReal.ofReal (Real.log 2 / Real.log c⁻¹) := by
  sorry

/-- 5.2: the Sierpiński simplex on `n + 1` affinely independent points of a real normed space
has Hausdorff dimension `log (n + 1) / log 2`; `n = 2` is the Sierpiński triangle. -/
theorem dimH_sierpinskiSimplex {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] {n : ℕ}
    (v : Fin (n + 1) → E) (hv : AffineIndependent ℝ v) {K : Set E} (hK : IsCompact K)
    (hne : K.Nonempty) (hinv : ⋃ i, (fun x => midpoint ℝ (v i) x) '' K = K) :
    dimH K = ENNReal.ofReal (Real.log (n + 1) / Real.log 2) := by
  sorry

/-- 5.3: a set of points of the unit cube whose base-`m` digit vectors are restricted to a set
`D` has Hausdorff dimension `log (card D) / log m` (Bishop and Peres, Example 1.3.4); the
Sierpiński carpet and the Menger sponge are instances. -/
theorem dimH_digitRestricted {n m : ℕ} (hm : 2 ≤ m) (D : Finset (Fin n → Fin m))
    {K : Set (Fin n → ℝ)} (hK : IsCompact K) (hne : K.Nonempty)
    (hinv : ⋃ d ∈ D, (fun x : Fin n → ℝ => (m : ℝ)⁻¹ • (x + fun j => ((d j : ℕ) : ℝ))) '' K
      = K) :
    dimH K = ENNReal.ofReal (Real.log D.card / Real.log m) := by
  sorry

/-- 5.4: the von Koch curve, the attractor of four similarities of ratio `1 / 3` of the
complex plane, has Hausdorff dimension `log 4 / log 3`. -/
theorem dimH_kochCurve {K : Set ℂ} (hK : IsCompact K) (hne : K.Nonempty)
    (hinv : (fun z : ℂ => z / 3) '' K
      ∪ (fun z : ℂ => (1 + Complex.exp (Real.pi / 3 * Complex.I) * z) / 3) '' K
      ∪ (fun z : ℂ => (1 + Complex.exp (Real.pi / 3 * Complex.I)
          + Complex.exp (-(Real.pi / 3 * Complex.I)) * z) / 3) '' K
      ∪ (fun z : ℂ => (2 + z) / 3) '' K = K) :
    dimH K = ENNReal.ofReal (Real.log 4 / Real.log 3) := by
  sorry

/-- 5.5: the upper product inequality, for arbitrary sets in metric spaces
(Bishop and Peres, (3.2.2)). -/
theorem dimH_prod_le {X Y : Type*} [EMetricSpace X] [EMetricSpace Y] (A : Set X) (B : Set Y) :
    dimH (A ×ˢ B) ≤ dimH A + upperBoxDim B := by
  sorry

/-- 5.5: Marstrand's lower product inequality for nonempty compact subsets of
finite-dimensional real normed spaces (Bishop and Peres, Theorem 3.2.1). -/
theorem add_dimH_le_dimH_prod {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    {A : Set E} {B : Set F} (hA : IsCompact A) (hB : IsCompact B) (hAne : A.Nonempty)
    (hBne : B.Nonempty) : dimH A + dimH B ≤ dimH (A ×ˢ B) := by
  sorry

end TauCetiRoadmap.FractalGeometry
