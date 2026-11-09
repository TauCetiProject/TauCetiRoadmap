module

public import Mathlib
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.FundamentalClass
public import TauCeti.Geometry.Manifold.Boundary.Charts
public import TauCeti.Geometry.Manifold.Boundary.InducedOrientation
public import TauCeti.Geometry.Manifold.Measure
public import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas
public import TauCeti.Geometry.Manifold.Orientation.Preserving
public import TauCeti.Geometry.Manifold.RegularValue

/-!
# Tangential bordism: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, relative smoothing of continuous maps from manifolds with corners into
compact boundaryless manifolds and Sard's theorem in unequal dimensions for sources without
boundary or on the Euclidean half-space (Layer 2, B1.6; Lee, Theorem 6.10), smooth oriented
three-manifold parallelization (Layer 8, B3.1) and the zero entries of the low unoriented and
oriented coefficient tables (Layer 8, B3.1): `ΩO_n = 0` for `n = 1, 3` and `ΩSO_n = 0` for
`1 ≤ n ≤ 3`, each stated as "every closed (oriented) smooth `n`-manifold is the (oriented)
boundary of a compact smooth `(n+1)`-manifold" on the pinned boundary charts and outward-first
boundary orientation. For boundaryless sources and no control of the homotopy the smoothing
statement is AlgebraicTopology 8.13's theorem; the statement here is over an arbitrary model
with corners and keeps the homotopy in a prescribed neighbourhood of the diagonal of the
target, which 8.13 does not state.
The finite quadratic Arf algebra consumed by Layer 1 is GeometricTopology Layer 4.3.1's and is
not stated here.
Parallelization uses native tangent bundles and a chosen native oriented atlas.
For B6.3 (Layer 10) it states Thom's realization theorems. For absolute classes, on the pinned
fundamental class `f_*[M]` of a closed homologically oriented smooth manifold: every class of
`Hₙ(X; ℤ)` with `n ≤ 6` is some `f_*[M]`, in each degree `n` one positive multiple `N • z` of
every class of every space is, and some class of degree seven of a compact space is not; and
every class of `Hₙ(X; ℤ/2)`, in every degree, is `f_*[M]₂` for the mod-2 fundamental class of a
closed smooth manifold, orientable or not, the class whose image in every local homology group
`Hₙ(M, M ∖ {x}; ℤ/2)` is nonzero (Hatcher, Theorem 3.26 and the definition after it, p.236).
For pairs `(X, A)` in degrees `n ≥ 1` it states the integral range `n ≤ 6`, the multiplicative
theorem and the mod-2 theorem on compact smooth manifolds with boundary carrying `∂M` into `A`, the
relative fundamental class in `Hₙ(M, ∂M)` being the class whose image in `Hₙ(M, M ∖ {x})`
generates at every interior point `x` (Hatcher, §3.3, p.253).

The other headline theorems are not statable at the pins:
- Sard's theorem in unequal dimensions for sources with corners carrying DifferentialGeometry
  5.5b's smooth face structure (B1.6): the pins have no face structure on a manifold with
  corners, and a bare model with corners need not admit one;
- parametric and relative transversality (B1.6): Mathlib has no transversality predicate for
  smooth maps between manifolds, and for their facewise forms the pins define the depth of a
  point (`ModelWithCorners.depth`) but no manifold structure on its level sets, the face strata;
- the geometric bordism groups `Ω^O_n(X,A)`, `Ω^SO_n(X,A)`, `Ω^Spin_n(X,A)`, the nonzero
  entries of their low tables (B3.1–B3.4), Thom's ring `ΩO_* ≃ F2[x_d]` (B4.6) and Wall's
  presentation of `ΩSO_*` (B6.2): Mathlib's `SingularManifold` has no bordism relation or
  quotient group, and a nonzero entry is a group isomorphism (generators and their
  independence) that only that quotient expresses;
- every Spin entry of the low tables (B3.1–B3.4), `ΩSpin_3 = 0` included: the pins have no
  Spin structure on a manifold;
- the Pontryagin–Thom isomorphism `Ω^ξ_n(X,A) ≃ π_n(Mξ ∧ Σ∞(X/A))` (B5.4c) and the stable
  framed isomorphism (B5.5): there are no Thom spectra or stable homotopy groups of spectra;
- `H*(MO;F2)`, the Steenrod algebras and Adams convergence (B4.1–B4.8): there are no Steenrod
  operations on singular cohomology;
- the ABS genus and its Dirac comparison (B3.0), Rokhlin-type consequences (B3.4) and the
  transfer kernel `ker(ΩSpin_n → KO_n) = im(ΩSpin_(n−8)(BPSp3) → ΩSpin_n)` (B6.6): there is
  no `KO` spectrum;
- the unoriented/oriented projective-transfer image theorems (B6.5): there are no geometric
  bordism groups or associated-family transfer maps;
- the Cayley-plane theorems (B3.6–B3.9): the compact Albert algebra is not at the pins.
-/

public section

namespace TauCetiRoadmap.TangentialBordism

open scoped Manifold ContDiff

universe u

/-! ## Layer 2: cycles, structures and collared geometry -/

/-- Relative smoothing (B1.6): a continuous map `f` from a Hausdorff sigma-compact manifold
with corners to a compact boundaryless Hausdorff manifold `P`, smooth on an open neighbourhood
of a closed set `C`, is homotopic relative to `C` to a smooth map by a homotopy that stays in
any prescribed neighbourhood `D` of the diagonal of `P`: every pair `(F (t, x), f x)` lies in
`D`. Taking `D` to be all of `P × P` and `I` boundaryless gives AlgebraicTopology 8.13's
smoothing theorem; this statement adds sources with corners (Lee, Theorem 6.26, for sources with
boundary) and the control `D` of the homotopy, which the reduction of non-compact targets
through doubles uses. -/
theorem exists_contMDiff_homotopicRel
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
    [SigmaCompactSpace M]
    {E' H' P : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    [TopologicalSpace H'] (J : ModelWithCorners ℝ E' H')
    [TopologicalSpace P] [ChartedSpace H' P] [IsManifold J ∞ P] [T2Space P] [CompactSpace P]
    [BoundarylessManifold J P]
    (f : C(M, P)) {C U : Set M} (hC : IsClosed C) (hU : IsOpen U) (hCU : C ⊆ U)
    (hf : ContMDiffOn I J ∞ f U) {D : Set (P × P)} (hD : D ∈ nhdsSet (Set.diagonal P)) :
    ∃ g : C(M, P), ContMDiff I J ∞ g ∧
      ∃ F : f.HomotopyRel g C, ∀ t x, (F (t, x), f x) ∈ D := by
  sorry

/-- Sard's theorem in unequal dimensions for sources without boundary (B1.6; Lee, Theorem 6.10,
p.129): for a smooth map from a Lindelöf manifold without boundary, over any finite-dimensional
real model with corners, to a manifold over any finite-dimensional real model with corners, the
image of the points where the manifold derivative is not surjective is null in every extended
chart of the target. No relation between the two dimensions is assumed; the pinned
`TauCeti.isNullSet_image_criticalPoints` requires them equal. -/
theorem isNullSet_image_criticalPoints_of_boundaryless
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [BoundarylessManifold I M]
    [LindelofSpace M]
    {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    [MeasurableSpace E'] [BorelSpace E'] [TopologicalSpace H'] (J : ModelWithCorners ℝ E' H')
    [TopologicalSpace N] [ChartedSpace H' N] [IsManifold J ∞ N]
    {f : M → N} (hf : ContMDiff I J ∞ f) :
    TauCeti.IsNullSet J (f '' {x | ¬ TauCeti.IsRegularPoint I J f x}) := by
  sorry

/-- Sard's theorem in unequal dimensions for sources with boundary (B1.6; Lee, Theorem 6.10,
p.129): for a smooth map from a Lindelöf manifold modelled on the Euclidean half-space of
dimension `n ≥ 1` to a manifold over any finite-dimensional real model with corners, the image
of the points where the manifold derivative is not surjective, boundary points included, is
null in every extended chart of the target. The route splits the source into its interior and
the boundary manifold of `TauCeti.boundaryChartedSpace`. -/
theorem isNullSet_image_criticalPoints_halfSpace
    {n : ℕ} [NeZero n] {M : Type*} [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace n) M] [IsManifold (𝓡∂ n) ∞ M] [LindelofSpace M]
    {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    [MeasurableSpace E'] [BorelSpace E'] [TopologicalSpace H'] (J : ModelWithCorners ℝ E' H')
    [TopologicalSpace N] [ChartedSpace H' N] [IsManifold J ∞ N]
    {f : M → N} (hf : ContMDiff (𝓡∂ n) J ∞ f) :
    TauCeti.IsNullSet J (f '' {x | ¬ TauCeti.IsRegularPoint (𝓡∂ n) J f x}) := by
  sorry

/-! ## Layer 8: low geometric classifications and fillings -/

/-- Every Hausdorff second-countable smooth oriented three-manifold, allowing boundary,
has a positive tangent frame whose associated bundle map and inverse are smooth.
Positivity is measured in every chart of the chosen oriented atlas. No compactness or
connectedness hypothesis is imposed. -/
theorem orientedThreeManifold_parallelization
    (M : Type*) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanHalfSpace 3) M]
    [IsManifold (modelWithCornersEuclideanHalfSpace 3) ∞ M]
    (A : Set (OpenPartialHomeomorph M (EuclideanHalfSpace 3)))
    (hA : TauCeti.IsOrientedAtlas (modelWithCornersEuclideanHalfSpace 3) ∞ A) :
    ∃ b : (x : M) → Module.Basis (Fin 3) ℝ
        (TangentSpace (modelWithCornersEuclideanHalfSpace 3) x),
      (∀ e ∈ A, ∀ x ∈ e.source,
        0 < Matrix.det (fun i j : Fin 3 ↦
          WithLp.ofLp (mfderiv (modelWithCornersEuclideanHalfSpace 3)
            (modelWithCornersEuclideanHalfSpace 3) e x (b x j)) i)) ∧
      ContMDiff ((modelWithCornersEuclideanHalfSpace 3).prod 𝓘(ℝ, Fin 3 → ℝ))
        (modelWithCornersEuclideanHalfSpace 3).tangent ∞
        (fun p : M × (Fin 3 → ℝ) ↦
          (⟨p.1, (b p.1).equivFun.symm p.2⟩ :
            TangentBundle (modelWithCornersEuclideanHalfSpace 3) M)) ∧
      ContMDiff (modelWithCornersEuclideanHalfSpace 3).tangent
        ((modelWithCornersEuclideanHalfSpace 3).prod 𝓘(ℝ, Fin 3 → ℝ)) ∞
        (fun v : TangentBundle (modelWithCornersEuclideanHalfSpace 3) M ↦
          (v.proj, (b v.proj).equivFun v.2)) := by
  sorry

/-- `ΩSO_n = 0` for `1 ≤ n ≤ 3` (B3.1; for `n = 3` Rokhlin's theorem, Thom, Théorème IV.13,
p.81): every closed oriented smooth `n`-manifold is, by an orientation-preserving
diffeomorphism, the outward-first oriented boundary of a compact oriented smooth
`(n+1)`-manifold. The boundary carries Tau Ceti's boundary charts; its smooth-manifold
structure, which `TauCeti.isManifold_boundary` provides, is part of the conclusion. The
positive point (`n = 0`) and `CP²` (`n = 4`) do not bound. -/
theorem closedOrientedManifold_isOrientedBoundary (n : ℕ) (hn₁ : 1 ≤ n) (hn₃ : n ≤ 3)
    (M : Type u) [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞ M]
    (o : TauCeti.Manifold.Orientation 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) M (Fin n)) :
    ∃ (W : Type u) (_ : TopologicalSpace W) (_ : T2Space W) (_ : CompactSpace W)
      (_ : ChartedSpace (EuclideanHalfSpace (n + 1)) W) (_ : IsManifold (𝓡∂ (n + 1)) ∞ W)
      (_ : IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞ ↥((𝓡∂ (n + 1)).boundary W))
      (oW : TauCeti.Manifold.Orientation (𝓡∂ (n + 1)) W (Fin (n + 1)))
      (φ : ↥((𝓡∂ (n + 1)).boundary W) ≃ₘ^∞⟮𝓘(ℝ, EuclideanSpace ℝ (Fin n)),
          𝓘(ℝ, EuclideanSpace ℝ (Fin n))⟯ M),
      ∀ x, TauCeti.Manifold.Orientation.IsOrientationPreservingAt
        (TauCeti.boundaryOrientation oW) o φ x := by
  sorry

/-- `ΩO_n = 0` for `n = 1` and `n = 3` (B3.1; Thom, after Théorème IV.12, p.79): every
closed smooth `n`-manifold is diffeomorphic to the boundary of a compact smooth
`(n+1)`-manifold. A point (`n = 0`) and `RP²` (`n = 2`) do not bound. -/
theorem closedManifold_isBoundary (n : ℕ) (hn : n = 1 ∨ n = 3)
    (M : Type u) [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞ M] :
    ∃ (W : Type u) (_ : TopologicalSpace W) (_ : T2Space W) (_ : CompactSpace W)
      (_ : ChartedSpace (EuclideanHalfSpace (n + 1)) W) (_ : IsManifold (𝓡∂ (n + 1)) ∞ W),
      Nonempty (↥((𝓡∂ (n + 1)).boundary W) ≃ₘ^∞⟮𝓘(ℝ, EuclideanSpace ℝ (Fin n)),
          𝓘(ℝ, EuclideanSpace ℝ (Fin n))⟯ M) := by
  sorry

/-! ## Layer 10: realization and projective transfers -/

/-- Thom's integral realization in degrees at most six (B6.3 for `A = ∅`; Thom,
Théorème III.3, p.59, and Corollaire III.7, p.62, for finite polyhedra): for every topological
space `X` and every `n ≤ 6`, every class `z ∈ Hₙ(X; ℤ)` is the image `f_*[M]` of the fundamental
class of a closed smooth `n`-manifold `M` with a homological orientation under a continuous map
`f : M → X`. The manifold may be empty or disconnected: `0` is realized by the empty manifold and
`2 • [x] ∈ H₀(X; ℤ)` by two positive points. -/
theorem exists_mapFundamentalClass_eq (n : ℕ) (hn : n ≤ 6) (X : Type) [TopologicalSpace X]
    (z : ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj
      (ModuleCat.of ℤ (ULift.{0} ℤ))).obj (TopCat.of X)) :
    ∃ (M : Type) (_ : TopologicalSpace M) (_ : T2Space M) (_ : CompactSpace M)
      (_ : ChartedSpace (EuclideanSpace ℝ (Fin n)) M)
      (_ : IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞ M)
      (o : TauCeti.HomologicalOrientation M (EuclideanSpace ℝ (Fin n)) n) (f : C(M, X)),
      o.mapFundamentalClass finrank_euclideanSpace_fin f = z := by
  sorry

/-- Thom's multiplicative realization theorem (B6.3; Thom, Théorème III.4, p.59, for finite
polyhedra): in each degree `n` there is one positive integer `N`, independent of the space and of
the class, such that for every topological space `X` and every `z ∈ Hₙ(X; ℤ)` the multiple
`N • z` is `f_*[M]` for a closed smooth `n`-manifold `M` with a homological orientation and a
continuous `f : M → X`. In particular the orientation map is onto after tensoring with `ℚ`. -/
theorem exists_pos_forall_mapFundamentalClass_eq_nsmul (n : ℕ) :
    ∃ N : ℕ, 0 < N ∧ ∀ (X : Type) [TopologicalSpace X]
      (z : ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj
        (ModuleCat.of ℤ (ULift.{0} ℤ))).obj (TopCat.of X)),
      ∃ (M : Type) (_ : TopologicalSpace M) (_ : T2Space M) (_ : CompactSpace M)
        (_ : ChartedSpace (EuclideanSpace ℝ (Fin n)) M)
        (_ : IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞ M)
        (o : TauCeti.HomologicalOrientation M (EuclideanSpace ℝ (Fin n)) n) (f : C(M, X)),
        o.mapFundamentalClass finrank_euclideanSpace_fin f = N • z := by
  sorry

/-- The realization range is sharp (B6.3; Thom, Théorème III.9 and the example after it,
pp.62–63): some compact space `X` has a class `z ∈ H₇(X; ℤ)` that is `f_*[M]` for no closed
smooth `7`-manifold `M`, no homological orientation of `M` and no continuous `f : M → X`. Thom's
witness is a class of `H₇(L × L; ℤ)` for the lens space `L = S⁷/C₃`, detected by the mod-3
operation `P¹β`. -/
theorem exists_not_mapFundamentalClass_eq_seven :
    ∃ (X : Type) (_ : TopologicalSpace X) (_ : CompactSpace X)
      (z : ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) 7).obj
        (ModuleCat.of ℤ (ULift.{0} ℤ))).obj (TopCat.of X)),
      ∀ (M : Type) [TopologicalSpace M] [T2Space M] [CompactSpace M]
        [ChartedSpace (EuclideanSpace ℝ (Fin 7)) M]
        [IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin 7)) ∞ M]
        (o : TauCeti.HomologicalOrientation M (EuclideanSpace ℝ (Fin 7)) 7) (f : C(M, X)),
        o.mapFundamentalClass finrank_euclideanSpace_fin f ≠ z := by
  sorry

/-- Thom's mod-2 realization theorem (B6.3 for `A = ∅`; Thom, Théorème III.2, p.59, for finite
polyhedra): for every topological space `X` and every `n`, every class `z ∈ Hₙ(X; ℤ/2)` is
`f_*[M]₂` for a closed smooth `n`-manifold `M`, orientable or not, and a continuous `f : M → X`.
The mod-2 fundamental class `[M]₂` is the class `μ ∈ Hₙ(M; ℤ/2)` whose image in every local
homology group `Hₙ(M, M ∖ {x}; ℤ/2)` is nonzero (Hatcher, §3.3, Theorem 3.26 and the definition
after it, p.236); every closed `M` has exactly one, by the pinned
`TauCeti.existsUnique_singularHomology_localHomologyRestriction_eq_of_invariant` with
coefficients `ℤ/2`. The identity of `RP²` realizes `[RP²]₂ ≠ 0`, although `H₂(RP²; ℤ) = 0`. -/
theorem exists_modTwoFundamentalClass_map_eq (n : ℕ) (X : Type) [TopologicalSpace X]
    (z : ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj
      (ModuleCat.of ℤ (ZMod 2))).obj (TopCat.of X)) :
    ∃ (M : Type) (_ : TopologicalSpace M) (_ : T2Space M) (_ : CompactSpace M)
      (_ : ChartedSpace (EuclideanSpace ℝ (Fin n)) M)
      (_ : IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞ M)
      (μ : ((TopCat.toSSet.obj (TopCat.of M)).homology (ModuleCat.of ℤ (ZMod 2)) n :
        ModuleCat.{0} ℤ)) (f : C(M, X)),
      (∀ x : M, TauCeti.localHomologyRestriction (ModuleCat.of ℤ (ZMod 2))
          (Set.subset_univ {x}) n
          (((TopPair.ofSubset ((Set.univ : Set (TopCat.of M))ᶜ)).singularHomologyπ
            (C := ModuleCat.{0} ℤ) (ModuleCat.of ℤ (ZMod 2)) n).hom μ) ≠ 0) ∧
      (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj
        (ModuleCat.of ℤ (ZMod 2))).map (TopCat.ofHom f)).hom μ = z := by
  sorry

/-- Thom's integral realization on pairs in degrees `1 ≤ n ≤ 6` (B6.3; Thom, Théorème III.3,
p.59, and Corollaire III.7, p.62, for `A = ∅` and finite polyhedra): for every topological space
`X`, every subset `A ⊆ X` and every `z ∈ Hₙ(X, A; ℤ)` there are a compact smooth `n`-manifold
`M` with boundary, a relative fundamental class `μ` of `M` and a continuous `f : M → X` carrying
the boundary `∂M` into `A` with `f_* μ = z`. The class `μ` lies in
`Hₙ(M, M ∖ int M; ℤ) = Hₙ(M, ∂M; ℤ)`; it is a relative fundamental class when its image in the
local homology group `Hₙ(M, M ∖ {x}; ℤ)` generates that group at every interior point `x`
(Hatcher, §3.3, p.253). Such a class exists exactly when `M` is orientable, and it is then
`[M, ∂M]` for the orientation of the interior that it determines. Degree zero is
`exists_mapFundamentalClass_eq` followed by the surjection `H₀(X; ℤ) → H₀(X, A; ℤ)`. -/
theorem exists_relFundamentalClass_map_eq (n : ℕ) [NeZero n] (hn : n ≤ 6)
    (X : Type) [TopologicalSpace X] (A : Set X)
    (z : (TopPair.ofSubset (X := TopCat.of X) A).singularHomology (C := ModuleCat.{0} ℤ)
      (ModuleCat.of ℤ (ULift.{0} ℤ)) n) :
    ∃ (M : Type) (_ : TopologicalSpace M) (_ : T2Space M) (_ : CompactSpace M)
      (_ : ChartedSpace (EuclideanHalfSpace n) M) (_ : IsManifold (𝓡∂ n) ∞ M)
      (μ : (TauCeti.localHomology (ModuleCat.of ℤ (ULift.{0} ℤ)) ((𝓡∂ n).interior M) n :
        ModuleCat.{0} ℤ))
      (f : C(M, X)) (hf : Set.MapsTo f ((𝓡∂ n).interior M)ᶜ A),
      (∀ x (hx : x ∈ (𝓡∂ n).interior M), Submodule.span ℤ
          {TauCeti.localHomologyRestriction (ModuleCat.of ℤ (ULift.{0} ℤ))
            (Set.singleton_subset_iff.2 hx) n μ} = ⊤) ∧
      (TopPair.singularHomologyMap (C := ModuleCat.{0} ℤ)
        (TopPair.ofSubsetMap (TopCat.ofHom f) hf) (ModuleCat.of ℤ (ULift.{0} ℤ)) n).hom μ = z := by
  sorry

/-- Thom's multiplicative realization theorem on pairs (B6.3; Thom, Théorème III.4, p.59, for
`A = ∅` and finite polyhedra): in each degree `n ≥ 1` there is one positive integer `N`,
independent of the pair and of the class, such that for every topological space `X`, every
`A ⊆ X` and every `z ∈ Hₙ(X, A; ℤ)` the multiple `N • z` is `f_* μ` for a compact smooth
`n`-manifold `M` with boundary, a relative fundamental class `μ ∈ Hₙ(M, ∂M; ℤ)` and a continuous
`f : M → X` carrying `∂M` into `A`, as in `exists_relFundamentalClass_map_eq`. -/
theorem exists_pos_forall_relFundamentalClass_map_eq_nsmul (n : ℕ) [NeZero n] :
    ∃ N : ℕ, 0 < N ∧ ∀ (X : Type) [TopologicalSpace X] (A : Set X)
      (z : (TopPair.ofSubset (X := TopCat.of X) A).singularHomology (C := ModuleCat.{0} ℤ)
        (ModuleCat.of ℤ (ULift.{0} ℤ)) n),
      ∃ (M : Type) (_ : TopologicalSpace M) (_ : T2Space M) (_ : CompactSpace M)
        (_ : ChartedSpace (EuclideanHalfSpace n) M) (_ : IsManifold (𝓡∂ n) ∞ M)
        (μ : (TauCeti.localHomology (ModuleCat.of ℤ (ULift.{0} ℤ)) ((𝓡∂ n).interior M) n :
          ModuleCat.{0} ℤ))
        (f : C(M, X)) (hf : Set.MapsTo f ((𝓡∂ n).interior M)ᶜ A),
        (∀ x (hx : x ∈ (𝓡∂ n).interior M), Submodule.span ℤ
            {TauCeti.localHomologyRestriction (ModuleCat.of ℤ (ULift.{0} ℤ))
              (Set.singleton_subset_iff.2 hx) n μ} = ⊤) ∧
        (TopPair.singularHomologyMap (C := ModuleCat.{0} ℤ)
          (TopPair.ofSubsetMap (TopCat.ofHom f) hf) (ModuleCat.of ℤ (ULift.{0} ℤ)) n).hom μ =
          N • z := by
  sorry

/-- Thom's mod-2 realization theorem on pairs (B6.3; Thom, Théorème III.2, p.59, for `A = ∅`
and finite polyhedra): in every degree `n ≥ 1`, for every topological space `X`, every `A ⊆ X`
and every `z ∈ Hₙ(X, A; ℤ/2)` there are a compact smooth `n`-manifold `M` with boundary,
orientable or not, its relative mod-2 fundamental class `μ ∈ Hₙ(M, ∂M; ℤ/2)` and a continuous
`f : M → X` carrying `∂M` into `A` with `f_* μ = z`. The class `μ` is the one whose image in
`Hₙ(M, M ∖ {x}; ℤ/2)` is nonzero at every interior point `x` (Hatcher, §3.3, p.253, with
coefficients `ℤ/2`, for which every manifold is orientable). For the Möbius band `B` the
identity realizes the nonzero class of `H₂(B, ∂B; ℤ/2)`, which no compact orientable surface
realizes because `H₂(B, ∂B; ℤ) = 0`. -/
theorem exists_modTwoRelFundamentalClass_map_eq (n : ℕ) [NeZero n]
    (X : Type) [TopologicalSpace X] (A : Set X)
    (z : (TopPair.ofSubset (X := TopCat.of X) A).singularHomology (C := ModuleCat.{0} ℤ)
      (ModuleCat.of ℤ (ZMod 2)) n) :
    ∃ (M : Type) (_ : TopologicalSpace M) (_ : T2Space M) (_ : CompactSpace M)
      (_ : ChartedSpace (EuclideanHalfSpace n) M) (_ : IsManifold (𝓡∂ n) ∞ M)
      (μ : (TauCeti.localHomology (ModuleCat.of ℤ (ZMod 2)) ((𝓡∂ n).interior M) n :
        ModuleCat.{0} ℤ))
      (f : C(M, X)) (hf : Set.MapsTo f ((𝓡∂ n).interior M)ᶜ A),
      (∀ x (hx : x ∈ (𝓡∂ n).interior M), TauCeti.localHomologyRestriction
          (ModuleCat.of ℤ (ZMod 2)) (Set.singleton_subset_iff.2 hx) n μ ≠ 0) ∧
      (TopPair.singularHomologyMap (C := ModuleCat.{0} ℤ)
        (TopPair.ofSubsetMap (TopCat.ofHom f) hf) (ModuleCat.of ℤ (ZMod 2)) n).hom μ = z := by
  sorry

end TauCetiRoadmap.TangentialBordism

end
