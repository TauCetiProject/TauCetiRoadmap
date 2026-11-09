module

public import Mathlib
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
boundary orientation. For boundaryless sources the smoothing statement is
AlgebraicTopology 8.13's theorem, which this roadmap consumes; the statement here is over an
arbitrary model with corners, and the corner-source case is what this roadmap proves.
The finite quadratic Arf algebra consumed by Layer 1 is GeometricTopology Layer 4.3.1's and is
not stated here.
Parallelization uses native tangent bundles and a chosen native oriented atlas.

The other headline theorems are not statable at the pins:
- Sard's theorem in unequal dimensions for sources with corners carrying DifferentialGeometry
  5.5b's smooth face structure (B1.6): the pins have no face structure on a manifold with
  corners, and a bare model with corners need not admit one;
- parametric and relative transversality (B1.6): Mathlib has no transversality predicate for
  smooth maps between manifolds, and the pins have no face strata for their facewise forms;
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
- the integral realization range and its degree-seven counterexample (B6.3), and the
  unoriented/oriented projective-transfer image theorems (B6.5): there are no geometric
  bordism groups, bordism orientation maps or associated-family transfer maps;
- the Cayley-plane theorems (B3.6–B3.9): the compact Albert algebra is not at the pins.
-/

public section

namespace TauCetiRoadmap.TangentialBordism

open scoped Manifold ContDiff

universe u

/-! ## Layer 2: cycles, structures and collared geometry -/

/-- Relative smoothing (B1.6): a continuous map from a Hausdorff sigma-compact manifold with
corners to a compact boundaryless Hausdorff manifold, smooth on an open neighbourhood of a
closed set `C`, is homotopic relative to `C` to a smooth map. When `I` is boundaryless this
is AlgebraicTopology 8.13's smoothing theorem, consumed and not re-proved; the roadmap proves
the case of a source with corners (Lee, Theorem 6.26, for sources with boundary). -/
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
    (hf : ContMDiffOn I J ∞ f U) :
    ∃ g : C(M, P), ContMDiff I J ∞ g ∧ f.HomotopicRel g C := by
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

end TauCetiRoadmap.TangentialBordism

end
