module

public import Mathlib
public import TauCeti.Analysis.Calculus.Morse.Index
public import TauCeti.Geometry.Manifold.SmoothEmbedding.Concordance
public import TauCeti.Geometry.Manifold.SmoothEmbedding.SmoothAmbientIsotopy.Basic
public import TauCeti.KnotTheory.KnotGroup
public import TauCeti.KnotTheory.Slice.Basic

/-!
# Ribbon knots and ribbon concordance: target signatures

The roadmap is `README.md`. This file states the roadmap's headline theorems against the pinned
Mathlib and Tau Ceti, each with `sorry`, with only the definitions they need: the radial function
of a slice disc and the time function of a concordance, read on the plane, the two ribbon
conditions on them, and the ribbon immersions of the disc.

Headlines stated:

* README 0.1, `isRibbon_of_isRibbonImmersion`: a knot bounding a ribbon-immersed disc is ribbon;
* README 1.1, `isRibbon_iff_ribbonLE_unknot`: a knot is ribbon iff the unknot is ribbon
  concordant to it;
* README 1.2, `RibbonLE.trans`: ribbon concordance is transitive;
* README 1.3, `knotGroup_injective_of_isRibbonConcordance` and
  `knotGroup_surjective_of_isRibbonConcordance`: Gordon's lemma on the groups of the two ends;
* README 1.4, `exists_extension_of_isRibbonConcordance`: every `SO(N)`-representation of the
  group of the time-`0` end extends over the complement of a ribbon concordance;
* README 1.4, `RibbonLE.antisymm`: Agol's theorem, ribbon concordance is antisymmetric up to
  smooth ambient isotopy.

Not stated:

* README 1.5, Zemke's injectivity theorem and the monotonicity of the Seifert genus and of the
  degree of the Alexander polynomial, lacking HeegaardFloer 7.6's knot Floer homology with its
  link cobordism maps, GeometricTopology 4.3's Seifert genus and GeometricTopology 4.4's Alexander
  polynomial of a smooth circle embedding;
* README 2.1, Lisca's theorem, the plumbing bounded by a lens space, the branched double cover
  of a slice disc and the ribbon-immersed discs of the knots `K(p, q)`, lacking
  GeometricTopology 4.10's two-bridge knots as smooth circle embeddings, a plumbing of disc bundles
  as a four-manifold and a branched cover of the four-ball;
* README 2.1, Lisca's theorem that `L(p, q)` smoothly bounds a rational homology ball iff
  `p/q ∈ R`, lacking a manifold structure on the boundary of a manifold with boundary, in which
  `TauCeti.LensSpace` would be identified with the boundary of the ball.
-/

public section

noncomputable section

open Manifold Metric Module Set TauCeti
open scoped Manifold ContDiff

namespace TauCetiRoadmap.RibbonKnots

attribute [local instance] Complex.finrank_real_complex_fact

/-! ## Layer 0: ribbon discs -/

section Disc

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}
  [Fact (finrank ℝ E = n + 1)]

open scoped Classical in
/-- The squared radial function `z ↦ ‖Φ z‖²` of a map `Φ` from the closed unit disc of `ℂ` to the
closed unit ball of `E`, read on the plane: it is `0` outside the closed disc, where it is never
used, since the ribbon condition only looks at the open disc. -/
def radialFunction (Φ : closedBall (0 : ℂ) 1 → closedBall (0 : E) 1) : ℂ → ℝ :=
  fun z ↦ if h : z ∈ closedBall (0 : ℂ) 1 then ‖(Φ ⟨z, h⟩ : E)‖ ^ 2 else 0

/-- A **ribbon disc** for `K`: a smooth slice disc on whose interior the squared radial function is
Morse with no critical point of index `2`, that is, no local maximum (README 0.1). -/
structure IsRibbonDisc (K : SmoothCircleEmbedding (𝓡 n) (sphere (0 : E) 1))
    (Φ : closedBall (0 : ℂ) 1 → closedBall (0 : E) 1) : Prop where
  /-- The disc is a smooth slice disc for `K`. -/
  isSmoothSliceDisc : IsSmoothSliceDisc K Φ
  /-- The squared radial function has only nondegenerate critical points in the open disc. -/
  hasNondegenerateCriticalPointsOn : HasNondegenerateCriticalPointsOn (radialFunction Φ) (ball 0 1)
  /-- No critical point in the open disc has index `2`. -/
  morseIndex_ne_two : ∀ z ∈ ball (0 : ℂ) 1, fderiv ℝ (radialFunction Φ) z = 0 →
    morseIndex (radialFunction Φ) z ≠ 2

/-- A knot is **ribbon** when it bounds a ribbon disc (README 0.1). -/
def IsRibbon (K : SmoothCircleEmbedding (𝓡 n) (sphere (0 : E) 1)) : Prop :=
  ∃ Φ : closedBall (0 : ℂ) 1 → closedBall (0 : E) 1, IsRibbonDisc K Φ

variable (n) in
/-- A **ribbon immersion** of the closed unit disc of `ℂ` in the unit sphere of `E` (README 0.1):
a smooth immersion whose double points form finitely many pairs of arcs, the injective paths
`α i` in the open disc and `β i` meeting the boundary circle exactly at their endpoints, with
pairwise disjoint images, `g` identifying `α i t` with `β i t` and no other pair of points. The
dimension `n` of the sphere is explicit, since `g` does not determine it. -/
structure IsRibbonImmersion (g : closedBall (0 : ℂ) 1 → sphere (0 : E) 1) : Prop where
  /-- The map is a smooth immersion of manifolds, the disc with its half-space charts. -/
  isImmersion : IsImmersion (𝓡∂ 2) (𝓡 n) ∞ g
  /-- The double points of `g` form finitely many pairs of arcs `α i`, `β i`. -/
  exists_arcs : ∃ (m : ℕ) (α β : Fin m → C(unitInterval, closedBall (0 : ℂ) 1)),
    (∀ i, Function.Injective (α i)) ∧ (∀ i, Function.Injective (β i)) ∧
    (∀ i t, (α i t : ℂ) ∈ ball (0 : ℂ) 1) ∧
    (∀ i t, (β i t : ℂ) ∈ sphere (0 : ℂ) 1 ↔ t = 0 ∨ t = 1) ∧
    (∀ i j, Disjoint (range (α i)) (range (β j))) ∧
    Pairwise (fun i j ↦ Disjoint (range (α i)) (range (α j))) ∧
    Pairwise (fun i j ↦ Disjoint (range (β i)) (range (β j))) ∧
    (∀ i t, g (α i t) = g (β i t)) ∧
    ∀ z w, z ≠ w → g z = g w →
      ∃ i t, (z = α i t ∧ w = β i t) ∨ (z = β i t ∧ w = α i t)

/-- A knot bounding a ribbon-immersed disc is ribbon: push the interior of the disc radially into
the ball, deeper along the interior arcs (README 0.1, after Lisca 2007, §1 and §9). -/
theorem isRibbon_of_isRibbonImmersion {K : SmoothCircleEmbedding (𝓡 n) (sphere (0 : E) 1)}
    {g : closedBall (0 : ℂ) 1 → sphere (0 : E) 1} (hg : IsRibbonImmersion n g)
    (hK : ∀ z : Circle, g (Set.inclusion sphere_subset_closedBall z) = K z) : IsRibbon K := by
  sorry

end Disc

/-! ## Layer 1: ribbon concordance -/

section Concordance

/-- The knots of this layer: smooth circle embeddings in the unit sphere `S³` of `ℝ⁴`. -/
abbrev Knot : Type :=
  SmoothCircleEmbedding (𝓡 3) (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)

variable {K₀ K₁ K₂ : Knot}

/-- The time function `(s, t) ↦ pr₂ (F (exp (i s), t))` of a concordance `F` from `K₀` to `K₁`,
read on the plane through the covering `s ↦ exp (i s)` of the circle (README 1.1). -/
def timeFunction (F : SmoothEmbedding.Concordance K₀ K₁) : ℝ × ℝ → ℝ :=
  fun p ↦ (F (Circle.exp p.1, p.2)).2

/-- A **ribbon concordance** from `K₀` (time `0`) to `K₁` (time `1`): on the open slab the time
function is Morse with no critical point of index `2`, that is, no local maximum (README 1.1). -/
structure IsRibbonConcordance (F : SmoothEmbedding.Concordance K₀ K₁) : Prop where
  /-- The time function has only nondegenerate critical points on the open slab. -/
  hasNondegenerateCriticalPointsOn :
    HasNondegenerateCriticalPointsOn (timeFunction F) {p | p.2 ∈ Ioo 0 1}
  /-- No critical point on the open slab has index `2`. -/
  morseIndex_ne_two : ∀ p : ℝ × ℝ, p.2 ∈ Ioo 0 1 → fderiv ℝ (timeFunction F) p = 0 →
    morseIndex (timeFunction F) p ≠ 2

/-- `RibbonLE K₀ K₁`: there is a ribbon concordance from `K₀` to `K₁`. Agol writes `K₁ ≥ K₀`
(README 1.1). -/
def RibbonLE (K₀ K₁ : Knot) : Prop :=
  ∃ F : SmoothEmbedding.Concordance K₀ K₁, IsRibbonConcordance F

attribute [local instance] TauCeti.finrank_euclideanSpace_fin_succ_fact in
/-- A knot is ribbon iff the unknot is ribbon concordant to it: remove a small disc around the
lowest minimum of the radial function, or cap the unknot end with a flat disc (README 1.1). -/
theorem isRibbon_iff_ribbonLE_unknot (K : Knot) : IsRibbon K ↔ RibbonLE unknot K := by
  sorry

/-- Ribbon concordance is transitive: stacking two ribbon concordances gives one (README 1.2). -/
theorem RibbonLE.trans (h₀₁ : RibbonLE K₀ K₁) (h₁₂ : RibbonLE K₁ K₂) : RibbonLE K₀ K₂ := by
  sorry

/-- The unit sphere `S³` of `ℝ⁴`. -/
abbrev S3 : Type := sphere (0 : EuclideanSpace ℝ (Fin 4)) 1

/-- The complement of a concordance `F` in the slab `S³ × [0, 1]` (README 1.3). -/
def trackComplement (F : SmoothEmbedding.Concordance K₀ K₁) :
    Set (S3 × ℝ) :=
  {p | p ∉ range F ∧ p.2 ∈ Icc 0 1}

/-- **Gordon's lemma, first half** (README 1.3): for a ribbon concordance `F` from `K₀` to `K₁`,
the inclusion `x ↦ (x, 0)` of the complement of `K₀` into the complement of `F` in the slab
induces an injection of fundamental groups. -/
theorem knotGroup_injective_of_isRibbonConcordance {F : SmoothEmbedding.Concordance K₀ K₁}
    (hF : IsRibbonConcordance F) (i : C(((range K₀)ᶜ : Set S3), trackComplement F))
    (hi : ∀ x, (i x : S3 × ℝ) = ((x : S3), 0))
    (x : ((range K₀)ᶜ : Set S3)) :
    Function.Injective (FundamentalGroup.map i x : K₀.KnotGroup x →* _) := by
  sorry

/-- **Gordon's lemma, second half** (README 1.3): for a ribbon concordance `F` from `K₀` to `K₁`,
the inclusion `x ↦ (x, 1)` of the complement of `K₁` into the complement of `F` in the slab
induces a surjection of fundamental groups. -/
theorem knotGroup_surjective_of_isRibbonConcordance {F : SmoothEmbedding.Concordance K₀ K₁}
    (hF : IsRibbonConcordance F) (i : C(((range K₁)ᶜ : Set S3), trackComplement F))
    (hi : ∀ x, (i x : S3 × ℝ) = ((x : S3), 1))
    (x : ((range K₁)ᶜ : Set S3)) :
    Function.Surjective (FundamentalGroup.map i x : K₁.KnotGroup x →* _) := by
  sorry

/-- For a ribbon concordance `F` from `K₀` to `K₁`, every `SO(N)`-representation of the knot
group of `K₀` extends over the complement of `F` in the slab (README 1.4, after Daemi, Lidman,
Vela-Vick and Wong, Proposition 2.1). -/
theorem exists_extension_of_isRibbonConcordance {F : SmoothEmbedding.Concordance K₀ K₁}
    (hF : IsRibbonConcordance F) (i : C(((range K₀)ᶜ : Set S3), trackComplement F))
    (hi : ∀ x, (i x : S3 × ℝ) = ((x : S3), 0)) (x : ((range K₀)ᶜ : Set S3)) (N : ℕ)
    (ρ : K₀.KnotGroup x →* Matrix.specialOrthogonalGroup (Fin N) ℝ) :
    ∃ ρ' : FundamentalGroup (trackComplement F) (i x) →* Matrix.specialOrthogonalGroup (Fin N) ℝ,
      ρ'.comp (FundamentalGroup.map i x) = ρ := by
  sorry

/-- **Agol's theorem** (README 1.4): ribbon concordance is antisymmetric up to smooth ambient
isotopy, so it is a partial order on isotopy classes of knots. -/
theorem RibbonLE.antisymm (h₀₁ : RibbonLE K₀ K₁) (h₁₀ : RibbonLE K₁ K₀) :
    SmoothEmbedding.SmoothAmbientIsotopic K₀ K₁ := by
  sorry

end Concordance

end TauCetiRoadmap.RibbonKnots
