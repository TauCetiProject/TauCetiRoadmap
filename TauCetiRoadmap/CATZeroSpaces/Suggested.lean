import Mathlib
import TauCeti.Topology.MetricSpace.CATZero
import TauCeti.Analysis.GradientFlow.GeodesicConvex
import TauCeti.MeasureTheory.Measure.FrechetMean.Basic

/-!
# CAT(0) spaces: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here.

All statements are about Tau Ceti's CAT(0) predicate `TauCeti.IsCATZeroSpace X`: a geodesic
pseudometric space in which every metric midpoint satisfies the CN inequality of Bruhat and Tits.
The predicate does not include completeness; where a statement needs it, it is a hypothesis.
Where a statement asserts that two points are equal, the space is a metric space.

One definition is new: `IsGeodesicallyConvexSet`, a set containing every geodesic segment between
two of its points; its relation to Tau Ceti's `TauCeti.ConvexAlongGeodesics` is stated below,
and the README proves that on a strictly convex real normed space it is Mathlib's `Convex ℝ`.
The positive definite cone is stated with the affine-invariant distance of the roadmap
OperatorMonotoneFunctionsAndMatrixMeans, whose definitions `Mat`, `msqrt`,
`misqrt`, `opMean`, `wgm`, `frob` and `riemDist` are copied verbatim, each with a docstring naming
its owner. Its metric space structure is asserted to exist rather than defined, because building
one needs the triangle inequality of that roadmap, which is a theorem there.
-/

noncomputable section

open Set Metric MeasureTheory TauCeti
open scoped ENNReal ComplexOrder

namespace TauCetiRoadmap.CATZeroSpaces

/-! ## Layer 1: three definitions of CAT(0) -/

/-- 1.1 Midpoints. On a complete pseudometric space the following are equivalent: the space is
CAT(0); any two points `x, y` have a point `m` satisfying the CN inequality for every `z`; any two
points have, for every `ε > 0`, a point satisfying the CN inequality up to `ε`
(Bruhat–Tits; Sturm, Def 2.1, Remark 2.2, Prop 1.2). -/
theorem isCATZeroSpace_tfae {X : Type*} [PseudoMetricSpace X] [CompleteSpace X] :
    List.TFAE [IsCATZeroSpace X,
      ∀ x y : X, ∃ m : X, ∀ z : X,
        dist z m ^ 2 ≤ (dist z x ^ 2 + dist z y ^ 2) / 2 - dist x y ^ 2 / 4,
      ∀ x y : X, ∀ ε > 0, ∃ m : X, ∀ z : X,
        dist z m ^ 2 ≤ (dist z x ^ 2 + dist z y ^ 2) / 2 - dist x y ^ 2 / 4 + ε] := sorry

/-- 1.2 Comparison triangles. A geodesic pseudometric space is CAT(0) if and only if, for every
two geodesic segments `γ` from `x` to `y` and `σ` from `x` to `z` and every Euclidean comparison
triangle `x' y' z'` in the plane, the points at times `s` and `t` are no farther apart than their
comparison points. -/
theorem isCATZeroSpace_iff_comparison {X : Type*} [PseudoMetricSpace X] [IsGeodesicSpace X] :
    IsCATZeroSpace X ↔ ∀ ⦃x y z : X⦄ ⦃γ σ : ℝ → X⦄, IsGeodesicSegment γ x y →
      IsGeodesicSegment σ x z → ∀ x' y' z' : EuclideanSpace ℝ (Fin 2),
        dist x' y' = dist x y → dist x' z' = dist x z → dist y' z' = dist y z →
        ∀ s ∈ Icc (0 : ℝ) 1, ∀ t ∈ Icc (0 : ℝ) 1,
          dist (γ s) (σ t) ≤ dist (AffineMap.lineMap x' y' s) (AffineMap.lineMap x' z' t) :=
  sorry

/-- 1.3 Reshetnyak's quadruple inequality in a CAT(0) space (Sturm, Prop 2.4). -/
theorem IsCATZeroSpace.dist_sq_add_dist_sq_le {X : Type*} [PseudoMetricSpace X]
    [IsCATZeroSpace X] (x₁ x₂ x₃ x₄ : X) :
    dist x₁ x₃ ^ 2 + dist x₂ x₄ ^ 2 ≤
      dist x₂ x₃ ^ 2 + dist x₄ x₁ ^ 2 + 2 * dist x₁ x₂ * dist x₃ x₄ := sorry

/-- 1.3 Berg–Nikolaev: a geodesic pseudometric space is CAT(0) if and only if every four points
satisfy the quadrilateral inequality (Sato, Thm 1.1). -/
theorem isCATZeroSpace_iff_quadrilateral {X : Type*} [PseudoMetricSpace X] [IsGeodesicSpace X] :
    IsCATZeroSpace X ↔ ∀ w x y z : X,
      dist w y ^ 2 + dist x z ^ 2 ≤
        dist w x ^ 2 + dist x y ^ 2 + dist y z ^ 2 + dist z w ^ 2 := sorry

/-! ## Layer 2: geodesics -/

/-- 2.1 Busemann convexity: for geodesic segments `γ` from `x` to `y` and `σ` from `x'` to `y'`
in a CAT(0) space, `d(γ t, σ t) ≤ (1 - t) d(x, x') + t d(y, y')` for `t ∈ [0, 1]`
(Sturm, Cor 2.5). -/
theorem IsGeodesicSegment.dist_le_of_isCATZeroSpace {X : Type*} [PseudoMetricSpace X]
    [IsCATZeroSpace X] {γ σ : ℝ → X} {x y x' y' : X} (hγ : IsGeodesicSegment γ x y)
    (hσ : IsGeodesicSegment σ x' y') {t : ℝ} (ht : t ∈ Icc (0 : ℝ) 1) :
    dist (γ t) (σ t) ≤ (1 - t) * dist x x' + t * dist y y' := sorry

/-- 2.2 A nonempty CAT(0) space is contractible. -/
theorem IsCATZeroSpace.contractibleSpace {X : Type*} [PseudoMetricSpace X] [IsCATZeroSpace X]
    [Nonempty X] : ContractibleSpace X := sorry

/-! ## Layer 3: convex sets, minimizers, projections and barycenters -/

/-- 3.1 A set is *geodesically convex* when it contains, for any two of its points, every geodesic
segment joining them on the parameter interval `[0, 1]` (Sturm, Def 1.4). It is the effective
domain notion of Tau Ceti's `TauCeti.ConvexAlongGeodesics` (see
`isGeodesicallyConvexSet_iff_convexAlongGeodesics`), and on a strictly convex real normed space
it is Mathlib's `Convex ℝ` (README 3.1). -/
def IsGeodesicallyConvexSet {X : Type*} [PseudoMetricSpace X] (C : Set X) : Prop :=
  ∀ ⦃x⦄, x ∈ C → ∀ ⦃y⦄, y ∈ C → ∀ ⦃γ : ℝ → X⦄, IsGeodesicSegment γ x y →
    ∀ t ∈ Icc (0 : ℝ) 1, γ t ∈ C

/-- 3.1 A set is geodesically convex exactly when the energy that is `0` on it and `⊤` off it is
`0`-convex along geodesics in the sense of Tau Ceti. -/
theorem isGeodesicallyConvexSet_iff_convexAlongGeodesics {X : Type*} [PseudoMetricSpace X]
    (C : Set X) :
    IsGeodesicallyConvexSet C ↔ ConvexAlongGeodesics 0 (Cᶜ.indicator fun _ => (⊤ : EReal)) :=
  sorry

/-- 3.2 Variance inequality for minimizers: if `G` is midpoint `c`-strongly convex on a
geodesically convex set `F` of a geodesic space and `b ∈ F` minimizes `G` on `F`, then
`G b + c d(y, b)² ≤ G y` for every `y ∈ F`. -/
theorem IsMinOn.add_mul_dist_sq_le {X : Type*} [PseudoMetricSpace X] [IsGeodesicSpace X]
    {F : Set X} (hconv : IsGeodesicallyConvexSet F) {G : X → ℝ} {c : ℝ}
    (hmid : ∀ ⦃q⦄, q ∈ F → ∀ ⦃q'⦄, q' ∈ F → ∀ ⦃m⦄, m ∈ F → dist q m = dist q q' / 2 →
      dist m q' = dist q q' / 2 → G m ≤ G q / 2 + G q' / 2 - c / 4 * dist q q' ^ 2)
    {b : X} (hb : b ∈ F) (hmin : IsMinOn G F b) {y : X} (hy : y ∈ F) :
    G b + c * dist y b ^ 2 ≤ G y := sorry

/-- 3.2 Existence of minimizers: a lower semicontinuous function that is midpoint `c`-strongly
convex with `c > 0` on a nonempty complete geodesically convex set of a geodesic space attains its
infimum there (Sturm, Prop 1.7); it is automatically bounded below on the set. -/
theorem exists_isMinOn_of_midpoint {X : Type*} [PseudoMetricSpace X] [IsGeodesicSpace X]
    {F : Set X} (hF : IsComplete F) (hne : F.Nonempty) (hconv : IsGeodesicallyConvexSet F)
    {G : X → ℝ} (hG : LowerSemicontinuousOn G F) {c : ℝ} (hc : 0 < c)
    (hmid : ∀ ⦃q⦄, q ∈ F → ∀ ⦃q'⦄, q' ∈ F → ∀ ⦃m⦄, m ∈ F → dist q m = dist q q' / 2 →
      dist m q' = dist q q' / 2 → G m ≤ G q / 2 + G q' / 2 - c / 4 * dist q q' ^ 2) :
    ∃ b ∈ F, IsMinOn G F b := sorry

/-- 3.3 Nearest-point projection: in a CAT(0) metric space, every point has exactly one nearest
point in a nonempty complete geodesically convex set (Sturm, Prop 2.6 (i)). -/
theorem existsUnique_nearest {X : Type*} [MetricSpace X] [IsCATZeroSpace X] {C : Set X}
    (hC : IsComplete C) (hne : C.Nonempty) (hconv : IsGeodesicallyConvexSet C) (y : X) :
    ∃! p, p ∈ C ∧ ∀ q ∈ C, dist y p ≤ dist y q := sorry

/-- 3.3 The Pythagoras inequality: if `p` is a nearest point to `y` in a geodesically convex set
`C` of a CAT(0) space, then `d(y, p)² + d(p, q)² ≤ d(y, q)²` for every `q ∈ C`
(Sturm, Prop 2.6 (ii)). -/
theorem dist_sq_add_dist_sq_le_of_nearest {X : Type*} [PseudoMetricSpace X] [IsCATZeroSpace X]
    {C : Set X} (hconv : IsGeodesicallyConvexSet C) {y p : X} (hp : p ∈ C)
    (hmin : ∀ q ∈ C, dist y p ≤ dist y q) {q : X} (hq : q ∈ C) :
    dist y p ^ 2 + dist p q ^ 2 ≤ dist y q ^ 2 := sorry

/-- 3.4 Barycenters in complete CAT(0) spaces, which need not be proper: a finite measure whose
quadratic Fréchet functional is finite at one point has a quadratic Fréchet barycenter `b`, and
`F(b) + μ(X) d(z, b)² ≤ F(z)` for every `z` (Sturm, Prop 4.3 and Prop 4.4). -/
theorem exists_isFrechetBarycenter_two {X : Type*} [PseudoMetricSpace X] [CompleteSpace X]
    [IsCATZeroSpace X] [MeasurableSpace X] [OpensMeasurableSpace X] (μ : Measure X)
    [IsFiniteMeasure μ] {x₀ : X} (hx₀ : frechetPower 2 μ x₀ ≠ ∞) :
    ∃ b : X, IsFrechetBarycenter 2 μ b ∧
      ∀ z : X, frechetPower 2 μ b + μ univ * edist z b ^ 2 ≤ frechetPower 2 μ z := sorry

/-- 3.4 Barycenters of weighted finite families are `1`-Lipschitz in the points: if `b`
minimizes `∑ wᵢ d(·, xᵢ)²` and `b'` minimizes `∑ wᵢ d(·, x'ᵢ)²` with weights `wᵢ ≥ 0`, then
`(∑ wᵢ) d(b, b') ≤ ∑ wᵢ d(xᵢ, x'ᵢ)`. -/
theorem sum_mul_dist_le_of_isMinOn {X ι : Type*} [PseudoMetricSpace X] [IsCATZeroSpace X]
    [Fintype ι] {w : ι → ℝ} (hw : ∀ i, 0 ≤ w i) (x x' : ι → X) {b b' : X}
    (hb : ∀ y, ∑ i, w i * dist b (x i) ^ 2 ≤ ∑ i, w i * dist y (x i) ^ 2)
    (hb' : ∀ y, ∑ i, w i * dist b' (x' i) ^ 2 ≤ ∑ i, w i * dist y (x' i) ^ 2) :
    (∑ i, w i) * dist b b' ≤ ∑ i, w i * dist (x i) (x' i) := sorry

/-! ## Layer 4: circumcenters and fixed points -/

/-- 4.1 A nonempty bounded set `S` of a complete CAT(0) metric space has exactly one
circumcenter: one point minimizing the radius `x ↦ sup_{a ∈ S} d(x, a)`. This is the center of the
smallest closed ball containing `S`, not Mathlib's `Affine.Simplex.circumcenter`. -/
theorem existsUnique_circumcenter {X : Type*} [MetricSpace X] [CompleteSpace X]
    [IsCATZeroSpace X] {S : Set X} (hne : S.Nonempty) (hb : Bornology.IsBounded S) :
    ∃! c : X, ∀ x : X, (⨆ a : S, dist c a) ≤ ⨆ a : S, dist x a := sorry

/-- 4.2 The Bruhat–Tits fixed point theorem: a group acting by isometries on a complete CAT(0)
metric space with a bounded orbit has a fixed point (Bruhat–Tits, Lemme 3.2.3). -/
theorem exists_forall_smul_eq_of_isBounded_orbit {X G : Type*} [MetricSpace X] [CompleteSpace X]
    [IsCATZeroSpace X] [Group G] [MulAction G X] [IsIsometricSMul G X] (x₀ : X)
    (hb : Bornology.IsBounded (range fun g : G => g • x₀)) : ∃ c : X, ∀ g : G, g • c = c :=
  sorry

/-! ## Layer 5: flatness -/

/-- 5.1 Flat rectangles: if `γ` runs from `x` to `u` and `η` from `y` to `v`, opposite sides are
equal, `d(x, y) = d(u, v)` and `d(x, u) = d(y, v)`, and both diagonals satisfy Pythagoras's
relation, then `d(γ s, η t)² = d(x, y)² + (s - t)² d(x, u)²` for all `s, t ∈ [0, 1]`. -/
theorem flat_rectangle {X : Type*} [PseudoMetricSpace X] [IsCATZeroSpace X] {x y u v : X}
    {γ η : ℝ → X} (hγ : IsGeodesicSegment γ x u) (hη : IsGeodesicSegment η y v)
    (hxy : dist x y = dist u v) (hxu : dist x u = dist y v)
    (hxv : dist x v ^ 2 = dist x y ^ 2 + dist x u ^ 2)
    (hyu : dist y u ^ 2 = dist x y ^ 2 + dist x u ^ 2) :
    ∀ s ∈ Icc (0 : ℝ) 1, ∀ t ∈ Icc (0 : ℝ) 1,
      dist (γ s) (η t) ^ 2 = dist x y ^ 2 + (s - t) ^ 2 * dist x u ^ 2 := sorry

/-- 5.2 The flat strip theorem: two geodesic lines at bounded distance in a CAT(0) metric space
bound a flat strip: after a shift of parameter, `d(c s, c' (t + a))² = D² + (s - t)²`. -/
theorem flat_strip {X : Type*} [MetricSpace X] [IsCATZeroSpace X] {c c' : ℝ → X}
    (hc : Isometry c) (hc' : Isometry c') (hb : BddAbove (range fun t => dist (c t) (c' t))) :
    ∃ a D : ℝ, 0 ≤ D ∧ ∀ s t : ℝ, dist (c s) (c' (t + a)) ^ 2 = D ^ 2 + (s - t) ^ 2 := sorry

/-! ## Layer 6: examples -/

/-- 6.1 The `L²` product of two CAT(0) spaces is CAT(0) (Sturm, Lemma 3.9). -/
theorem isCATZeroSpace_withLp_prod {X Y : Type*} [PseudoMetricSpace X] [PseudoMetricSpace Y]
    [IsCATZeroSpace X] [IsCATZeroSpace Y] : IsCATZeroSpace (WithLp 2 (X × Y)) := sorry

/-- 6.2 A real normed space is CAT(0) if and only if its norm comes from an inner product
(Sturm, Prop 3.5 (ii)). -/
theorem isCATZeroSpace_iff_innerProductSpaceable {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] : IsCATZeroSpace E ↔ InnerProductSpaceable E := sorry

section CopiedOperatorMonotoneFunctionsAndMatrixMeans

/-- 6.3 (copied verbatim from OperatorMonotoneFunctionsAndMatrixMeans, Conventions) Complex
square matrices of size `n`. -/
abbrev Mat (n : ℕ) := Matrix (Fin n) (Fin n) ℂ

/-- 6.3 (copied verbatim from OperatorMonotoneFunctionsAndMatrixMeans, Conventions) The positive
square root of a Hermitian matrix through the functional calculus. -/
def msqrt {n : ℕ} (A : Mat n) : Mat n := cfc Real.sqrt A

/-- 6.3 (copied verbatim from OperatorMonotoneFunctionsAndMatrixMeans, Conventions) The inverse
positive square root of a Hermitian matrix through the functional calculus. -/
def misqrt {n : ℕ} (A : Mat n) : Mat n := cfc (fun x ↦ (Real.sqrt x)⁻¹) A

/-- 6.3 (copied verbatim from OperatorMonotoneFunctionsAndMatrixMeans 5.1) The operator mean
`A^{1/2} f(A^{-1/2} B A^{-1/2}) A^{1/2}`, meaningful for `A` positive definite. -/
def opMean {n : ℕ} (f : ℝ → ℝ) (A B : Mat n) : Mat n :=
  msqrt A * cfc f (misqrt A * B * misqrt A) * msqrt A

/-- 6.3 (copied verbatim from OperatorMonotoneFunctionsAndMatrixMeans 6.1) The weighted
geometric mean `A #_t B`. -/
def wgm {n : ℕ} (t : ℝ) (A B : Mat n) : Mat n := opMean (fun x ↦ x ^ t) A B

/-- 6.3 (copied verbatim from OperatorMonotoneFunctionsAndMatrixMeans 7.1) The Frobenius norm,
written out. -/
def frob {n : ℕ} (M : Mat n) : ℝ := Real.sqrt (∑ i, ∑ j, ‖M i j‖ ^ 2)

/-- 6.3 (copied verbatim from OperatorMonotoneFunctionsAndMatrixMeans 7.1) The affine-invariant
(trace) distance `‖log (A^{-1/2} B A^{-1/2})‖_F`. -/
def riemDist {n : ℕ} (A B : Mat n) : ℝ := frob (cfc Real.log (misqrt A * B * misqrt A))

end CopiedOperatorMonotoneFunctionsAndMatrixMeans

/-- 6.3 The cone of positive definite complex `n × n` matrices, with the affine-invariant
distance `riemDist`, is a complete CAT(0) metric space: it carries a metric space structure `m`
whose distance is `riemDist`, and with it the cone is complete and CAT(0). Completeness is stated
for the uniform structure of `m`: the subtype also inherits the entrywise uniform structure of
matrices, in which the cone is not complete when `n ≥ 1`. -/
theorem exists_metricSpace_posDef (n : ℕ) :
    ∃ m : MetricSpace {A : Mat n // A.PosDef},
      (∀ A B : {A : Mat n // A.PosDef}, dist A B = riemDist A.1 B.1) ∧
        @CompleteSpace {A : Mat n // A.PosDef} m.toUniformSpace ∧
          IsCATZeroSpace {A : Mat n // A.PosDef} := sorry

end TauCetiRoadmap.CATZeroSpaces
