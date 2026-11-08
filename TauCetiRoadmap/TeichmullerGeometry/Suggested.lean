import Mathlib
import TauCeti.Geometry.Manifold.Basic
import TauCeti.Geometry.Manifold.Orientation.Basic
import TauCeti.Geometry.Manifold.SmoothTriangulation.Basic
import TauCeti.Geometry.Diffeomorphism.Group
import TauCeti.Geometry.Diffeomorphism.Topology
import TauCeti.Geometry.Diffeomorphism.Diffeotopy.Path
import TauCeti.Geometry.Diffeomorphism.Disc
import TauCeti.Geometry.Diffeomorphism.Sphere
import TauCeti.Topology.Homotopy.Isotopy.Basic
import TauCeti.Topology.PL.Map
import TauCeti.Topology.Triangulable.Basic
import TauCeti.AlgebraicTopology.SimplicialComplex.CombinatorialManifold.Basic
import TauCeti.AlgebraicTopology.SimplicialComplex.Realization.PL

/-!
# Teichmüller geometry of closed surfaces: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable at the pins.

Stated here:

* the triangulation, PL and smoothing theory of compact surfaces (Layer 0, §0.0a–§0.0e): the local
  and half-plane PL approximation theorems, invariance of the boundary, PL structures and their
  transport, Radó's theorem, the two-dimensional Hauptvermutung, the Euler characteristic of a
  complex and of a compact surface, Epstein's theorem in its closed and boundary-relative forms,
  Whitehead compatibility of a PL structure with a smooth structure (read through Tau Ceti's
  `TauCeti.IsSmoothTriangulation`), the existence of compatible smoothings, their transport along
  diffeomorphisms, and isotopy of homeomorphisms to diffeomorphisms, absolute and relative to the
  boundary;
* the smooth based realization half of the Dehn–Nielsen–Baer theorem (Layer 5): every
  automorphism of the fundamental group of a closed orientable surface is induced by a
  basepoint-fixing diffeomorphism;
* the smooth Baer–Epstein kernel theorem (Layer 5): a diffeomorphism of a closed orientable
  surface that is homotopic to the identity is the final slice of a smooth diffeotopy, Tau Ceti's
  `TauCeti.Diffeotopy`;
* Smale's theorem on the disc (Layer 5): the group `Diff(D², ∂)` of Tau Ceti, with the weak
  Whitney topology, is contractible;
* Smale's theorem on the sphere (Layer 5): Tau Ceti's reference inclusion of `O(3)` into
  `Diff(S²)` is a homotopy equivalence, the full-group form of the deformation retraction of
  `Diff⁺(S²)` onto `SO(3)`;
* the smoothing of isotopies (Layer 5, §5.3a): diffeomorphisms of compact surfaces that are
  isotopic through homeomorphisms differ by a smooth diffeotopy;
* the projective model of the hyperbolic isometry group (Layer 4): Mathlib's action of
  `GL (Fin 2) ℝ` on `ℍ`, with negative-determinant matrices acting through complex conjugation,
  induces an isomorphism from `GL (Fin 2) ℝ` modulo its centre onto the isometry group of `ℍ`.

Not statable at the pins:

* the Teichmüller space `Teich(Σ)` and its complex structure of dimension `3g − 3` (Layers 1, 2),
  the Fenchel–Nielsen homeomorphism `Teich(Σ) ≃ (0,∞)^(3g−3) × ℝ^(3g−3)` and the completeness of
  the Teichmüller metric (Layer 7), the Nielsen realization theorem and the fixed-locus dimension
  formula (Layer 8), and the open dense loci of Layers 8–11: no carrier for the marked quotient of
  the integrable almost-complex structures by `Diff₀⁺(Σ)` exists at the pins;
* the full Dehn–Nielsen–Baer isomorphism `Mod±(Σ) ≃ Out(π₁ Σ)` (Layer 5): the pinned Tau Ceti
  has the topological group `TauCeti.Diff` with `Diffeomorph.weakWhitneyTopology`, so `π₀ Diff(Σ)`
  is `ZerothHomotopy` of it, but neither a group structure on that `ZerothHomotopy` nor an outer
  automorphism group `Out` of a group exists at the pins, and the comparison map needs the change of
  basepoint along a path; the two halves of the theorem are stated separately above;
* the marked holonomy comparison with discrete faithful representations of Euler number `2 − 2g`
  (Layers 4, 6): there is no Euler number of a surface-group representation at the pins;
* the finiteness of arithmetic lattices of fixed signature (Layer 9): there is no arithmetic
  Fuchsian group at the pins;
* the genus of a closed surface: Mathlib and Tau Ceti have no genus, so statements indexed by `g`
  are not statable; the two Layer 5 theorems below are stated for every closed orientable surface,
  which is their true generality;
* the orientations of a combinatorial surface and its orientation double cover (§0.0c): the pins
  have no coherent orientation of the triangles of an abstract simplicial complex;
* the compact and relative PL approximation theorems and isotopy to a PL homeomorphism (§0.0a,
  §0.0b), the curve and arc isotopy theorems and PL isotopy (§0.0d): the pins have Tau Ceti's
  `IsPLOn` for maps of vector spaces and the existence statement `PLHomeomorphic` for complexes,
  but no predicate saying that a prescribed map between realizations is piecewise linear, and no
  piecewise-linear embedded curve or arc in a triangulated surface.
-/

namespace TauCetiRoadmap.TeichmullerGeometry

open scoped Manifold ContDiff UpperHalfPlane TauCeti.DiffeomorphWeakWhitney Topology

/-! ## Layer 0: triangulations, PL structures and smoothings of compact surfaces -/

/-- **PL approximation in the plane, open form.** A homeomorphism `f` between open subsets of the
plane is approximated by a homeomorphism `g` with the same source and target, piecewise linear in
both directions, within the error `φ`. The error need not be continuous: it is asked only to be
bounded below by a positive constant near each point of the source (§0.0a). -/
theorem exists_pl_approximation_open
    (f : OpenPartialHomeomorph (EuclideanSpace ℝ (Fin 2)) (EuclideanSpace ℝ (Fin 2)))
    (φ : EuclideanSpace ℝ (Fin 2) → ℝ)
    (hφ : ∀ x ∈ f.source, ∃ c : ℝ, 0 < c ∧ ∀ᶠ y in 𝓝[f.source] x, c ≤ φ y) :
    ∃ g : OpenPartialHomeomorph (EuclideanSpace ℝ (Fin 2)) (EuclideanSpace ℝ (Fin 2)),
      g.source = f.source ∧ g.target = f.target ∧
      TauCeti.IsPLOn g g.source ∧ TauCeti.IsPLOn g.symm g.target ∧
      ∀ x ∈ f.source, dist (f x) (g x) < φ x := by
  sorry

/-- **PL approximation in the plane, half-plane form.** If `f` preserves the closed half-plane
`0 ≤ x 0` and its boundary line, the approximation of `exists_pl_approximation_open` can be chosen
to preserve both as well; this is the boundary chart case of Radó's theorem (§0.0a). -/
theorem exists_pl_approximation_halfPlane
    (f : OpenPartialHomeomorph (EuclideanSpace ℝ (Fin 2)) (EuclideanSpace ℝ (Fin 2)))
    (hH : f '' (f.source ∩ {x | 0 ≤ x 0}) = f.target ∩ {x | 0 ≤ x 0})
    (hB : f '' (f.source ∩ {x | x 0 = 0}) = f.target ∩ {x | x 0 = 0})
    (φ : EuclideanSpace ℝ (Fin 2) → ℝ)
    (hφ : ∀ x ∈ f.source, ∃ c : ℝ, 0 < c ∧ ∀ᶠ y in 𝓝[f.source] x, c ≤ φ y) :
    ∃ g : OpenPartialHomeomorph (EuclideanSpace ℝ (Fin 2)) (EuclideanSpace ℝ (Fin 2)),
      g.source = f.source ∧ g.target = f.target ∧
      TauCeti.IsPLOn g g.source ∧ TauCeti.IsPLOn g.symm g.target ∧
      g '' (g.source ∩ {x | 0 ≤ x 0}) = g.target ∩ {x | 0 ≤ x 0} ∧
      g '' (g.source ∩ {x | x 0 = 0}) = g.target ∩ {x | x 0 = 0} ∧
      ∀ x ∈ f.source, dist (f x) (g x) < φ x := by
  sorry

section Boundary

variable {M N : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M]
  [TopologicalSpace N] [ChartedSpace (EuclideanHalfSpace 2) N]

/-- **Invariance of the boundary.** A homeomorphism of topological surfaces carries the manifold
boundary onto the manifold boundary, so the boundary does not depend on the chart that tests a
point (§0.0b). -/
theorem image_boundary (e : M ≃ₜ N) : e '' (𝓡∂ 2).boundary M = (𝓡∂ 2).boundary N := by
  sorry

end Boundary

open Classical in
/-- A **PL structure** on a space `M`: a triangulation of `M` by a finite combinatorial surface,
that is, a finite abstract simplicial complex each vertex link of which is a combinatorial circle
or a combinatorial arc (Tau Ceti's `IsCombinatorialManifold` in dimension two), together with a
homeomorphism from its realization onto `M` (§0.0b). The homeomorphism is part of the data: two
PL structures with the same complex differ by their comparison homeomorphism, which need not be
piecewise linear. -/
structure PLStructure (M : Type*) [TopologicalSpace M] where
  /-- The vertex type of the triangulating complex. -/
  ι : Type
  /-- The triangulation has finitely many vertices. -/
  finite_ι : Finite ι
  /-- The triangulating complex. -/
  K : AbstractSimplicialComplex ι
  /-- The complex is a combinatorial surface, possibly with boundary. -/
  isCombinatorialManifold : K.toPreAbstractSimplicialComplex.IsCombinatorialManifold 2
  /-- The triangulation homeomorphism. -/
  e : AbstractSimplicialComplex.Realization K ≃ₜ M

/-- Transport of a PL structure along a homeomorphism (§0.0b). -/
noncomputable def PLStructure.map {M N : Type*} [TopologicalSpace M] [TopologicalSpace N]
    (s : PLStructure M) (f : M ≃ₜ N) : PLStructure N where
  ι := s.ι
  finite_ι := s.finite_ι
  K := s.K
  isCombinatorialManifold := s.isCombinatorialManifold
  e := s.e.trans f

section Rado

variable (M : Type*) [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]
  [CompactSpace M]

/-- **Radó's theorem.** Every compact topological surface, with or without boundary, has a PL
structure; the README asks in addition that the boundary edges of the triangulation realize the
manifold boundary (§0.0b). -/
theorem PLStructure.nonempty_of_compactSurface : Nonempty (PLStructure M) := by
  sorry

/-- **Radó's theorem** in the form of Tau Ceti's `IsTriangulable` (§0.0b). -/
theorem isTriangulable_of_compactSurface : TauCeti.IsTriangulable.{0} M := by
  sorry

end Rado

/-- **The two-dimensional Hauptvermutung.** The triangulating complexes of PL structures on
homeomorphic spaces are PL homeomorphic, in Tau Ceti's sense `PLHomeomorphic` (§0.0b). -/
theorem PLStructure.plHomeomorphic {M N : Type*} [TopologicalSpace M] [TopologicalSpace N]
    (s : PLStructure M) (t : PLStructure N) (h : Nonempty (M ≃ₜ N)) :
    s.K.toPreAbstractSimplicialComplex.PLHomeomorphic t.K.toPreAbstractSimplicialComplex := by
  sorry

/-- The **Euler characteristic of an abstract simplicial complex**: the alternating count of its
faces, a face with `k + 1` vertices counted with sign `(-1) ^ k`. A complex with infinitely many
faces is assigned `0` (§0.0c). -/
noncomputable def simplicialEulerChar {ι : Type*} (K : AbstractSimplicialComplex ι) : ℤ :=
  ∑ᶠ σ ∈ K.faces, (-1 : ℤ) ^ (σ.card + 1)

/-- The **Euler characteristic of a compact surface**, read off a PL structure chosen by Radó's
theorem; a space with no PL structure is assigned `0`. That the value does not depend on the
choice is `Surface.eulerChar_eq` (§0.0c). -/
noncomputable def Surface.eulerChar (M : Type*) [TopologicalSpace M] : ℤ := by
  classical
  exact if h : Nonempty (PLStructure M) then simplicialEulerChar h.some.K else 0

/-- Every PL structure computes the Euler characteristic: subdivision invariance and the
Hauptvermutung (§0.0c). -/
theorem Surface.eulerChar_eq {M : Type*} [TopologicalSpace M] (s : PLStructure M) :
    Surface.eulerChar M = simplicialEulerChar s.K := by
  sorry

/-- The Euler characteristic is a homeomorphism invariant (§0.0c). -/
theorem Surface.eulerChar_congr {M N : Type*} [TopologicalSpace M] [TopologicalSpace N]
    (f : M ≃ₜ N) : Surface.eulerChar M = Surface.eulerChar N := by
  sorry

/-- The round sphere has Euler characteristic `2`, computed on the boundary of a tetrahedron
(§0.0c). -/
theorem Surface.eulerChar_sphere :
    Surface.eulerChar (Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1) = 2 := by
  sorry

section Epstein

variable {M N : Type*} [TopologicalSpace M] [TopologicalSpace N]
  [ChartedSpace (EuclideanHalfSpace 2) M] [ChartedSpace (EuclideanHalfSpace 2) N]
  [T2Space M] [T2Space N] [CompactSpace M]

/-- **Epstein's theorem, closed form.** Homotopic homeomorphisms between closed surfaces are
isotopic (Epstein 1966, Theorem 6.4; §0.0d). -/
theorem isotopic_of_homotopic_closedSurface (hclosed : (𝓡∂ 2).boundary M = ∅) (f g : M ≃ₜ N)
    (h : ContinuousMap.Homotopic (f : C(M, N)) (g : C(M, N))) :
    TauCeti.Isotopic (f : C(M, N)) (g : C(M, N)) := by
  sorry

/-- **Epstein's theorem, relative form.** Homeomorphisms between compact surfaces that are
homotopic relative to the boundary are isotopic relative to the boundary (Epstein 1966,
Theorem 6.3; §0.0d). Without the relative hypothesis the statement is false on the disc. -/
theorem isotopicRel_of_homotopicRel (f g : M ≃ₜ N)
    (h : ContinuousMap.HomotopicRel (f : C(M, N)) (g : C(M, N)) ((𝓡∂ 2).boundary M)) :
    ∃ F : ContinuousMap.HomotopyRel (f : C(M, N)) (g : C(M, N)) ((𝓡∂ 2).boundary M),
      ∀ t, Topology.IsEmbedding fun x => F (t, x) := by
  sorry

end Epstein

/-- A PL structure `s` on a smooth surface `M` is **compatible** with the smooth structure when it
differs by a piecewise-linear homeomorphism from a smooth triangulation of `M` in Whitehead's
sense (Tau Ceti's `TauCeti.IsSmoothTriangulation`): in barycentric coordinates `s.e.symm ∘ g` is
the restriction of a map that is piecewise linear on the realization of the complex of `g`.
Equivalently, some linear subdivision of the complex of `s` is a smooth triangulation (§0.0e). -/
def PLStructure.IsCompatible {M : Type*} [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] (s : PLStructure M) : Prop :=
  ∃ (κ : Type) (L : AbstractSimplicialComplex κ)
    (g : AbstractSimplicialComplex.Realization L ≃ₜ M),
    TauCeti.IsSmoothTriangulation (𝓡∂ 2) ∞ g ∧
      ∃ F : (κ → ℝ) → (s.ι → ℝ),
        TauCeti.IsPLOn F
          (Set.range fun y : AbstractSimplicialComplex.Realization L => ⇑(y : κ →₀ ℝ)) ∧
        ∀ y : AbstractSimplicialComplex.Realization L,
          F ⇑(y : κ →₀ ℝ) = ⇑(s.e.symm (g y) : s.ι →₀ ℝ)

/-- **Existence of compatible smoothings.** Every PL structure on a space is compatible with some
smooth structure on it, constructed by rounding the corners of the triangulation (§0.0e). -/
theorem PLStructure.exists_smoothing {M : Type*} [TopologicalSpace M] (s : PLStructure M) :
    ∃ σ : ChartedSpace (EuclideanHalfSpace 2) M,
      letI := σ; IsManifold (𝓡∂ 2) ∞ M ∧ s.IsCompatible := by
  sorry

/-- Compatibility is transported along diffeomorphisms (§0.0e). -/
theorem PLStructure.IsCompatible.map_diffeomorph {M N : Type*}
    [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [IsManifold (𝓡∂ 2) ∞ M]
    [TopologicalSpace N] [ChartedSpace (EuclideanHalfSpace 2) N] [IsManifold (𝓡∂ 2) ∞ N]
    {s : PLStructure M} (hs : s.IsCompatible) (Φ : M ≃ₘ⟮𝓡∂ 2, 𝓡∂ 2⟯ N) :
    (s.map Φ.toHomeomorph).IsCompatible := by
  sorry

section Smooth

variable {M N : Type*}
  [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [IsManifold (𝓡∂ 2) ∞ M]
  [T2Space M] [CompactSpace M]
  [TopologicalSpace N] [ChartedSpace (EuclideanHalfSpace 2) N] [IsManifold (𝓡∂ 2) ∞ N]
  [T2Space N] [CompactSpace N]

/-- **Isotopy to a diffeomorphism.** Every homeomorphism between compact smooth surfaces is
isotopic to a diffeomorphism. With `M = N` carrying two smooth structures and `f` the identity,
this is the uniqueness of smooth structures up to a diffeomorphism isotopic to the identity
(§0.0e). -/
theorem exists_isotopic_diffeomorph (f : M ≃ₜ N) :
    ∃ φ : M ≃ₘ⟮𝓡∂ 2, 𝓡∂ 2⟯ N, TauCeti.Isotopic (f : C(M, N)) (φ.toHomeomorph : C(M, N)) := by
  sorry

/-- **Isotopy to a diffeomorphism relative to the boundary.** A self-homeomorphism of a compact
smooth surface fixing the boundary pointwise is isotopic relative to the boundary to a
diffeomorphism fixing the boundary pointwise (§0.0e). -/
theorem exists_isotopicRel_diffeomorph (f : M ≃ₜ M)
    (hf : Set.EqOn f id ((𝓡∂ 2).boundary M)) :
    ∃ φ : M ≃ₘ⟮𝓡∂ 2, 𝓡∂ 2⟯ M, Set.EqOn φ id ((𝓡∂ 2).boundary M) ∧
      ∃ F : ContinuousMap.HomotopyRel (f : C(M, M)) (φ.toHomeomorph : C(M, M))
          ((𝓡∂ 2).boundary M), ∀ t, Topology.IsEmbedding fun x => F (t, x) := by
  sorry

end Smooth

/-! ## Layer 5: mapping classes, automorphisms and stabilizers -/

/-- **Dehn–Nielsen realization, smooth and based.** Let `S` be a smooth closed connected orientable
surface. Every automorphism `α` of `π₁(S, x₀)` is induced by a diffeomorphism `f` of `S` fixing
`x₀`. This is the surjectivity of `Mod±(S, x₀) → Aut(π₁(S, x₀))`: for genus at least two it is
the Douady–Earle realization of the outer class composed with point pushing for the inner part
(Layer 5.2), for the torus every automorphism of `ℤ²` is a matrix of `GL₂(ℤ)` realized by the
induced linear diffeomorphism of `ℝ²/ℤ²` fixing the origin, and for the sphere `π₁` is trivial
(Farb–Margalit, *A Primer on Mapping Class Groups*, Chapter 8, for the outer version). -/
theorem exists_diffeomorph_mapOfEq_eq
    {S : Type*} [TopologicalSpace S] [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S]
    [IsManifold (𝓡 2) ∞ S] [TauCeti.Orientable (𝓡 2) S]
    (hS : TauCeti.IsClosedConnectedSurface S) (x₀ : S)
    (α : FundamentalGroup S x₀ ≃* FundamentalGroup S x₀) :
    ∃ (f : Diffeomorph (𝓡 2) (𝓡 2) S S ∞) (hf : f x₀ = x₀),
      FundamentalGroup.mapOfEq (f.toHomeomorph : C(S, S)) hf = α.toMonoidHom := by
  sorry

/-- **The smooth Baer–Epstein kernel theorem.** A diffeomorphism of a smooth closed connected
orientable surface that is homotopic to the identity through continuous maps is the final slice
of a smooth diffeotopy, that is, it is smoothly isotopic to the identity. This is the injectivity
of `Mod±(S) → Out(π₁ S)` (Layer 5.4): Epstein's theorem `isotopic_of_homotopic_closedSurface`
gives a topological isotopy, and `smoothIsotopic_of_isotopic` (Layer 5.3a) makes it smooth. -/
theorem baer_epstein_smooth
    {S : Type*} [TopologicalSpace S] [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S]
    [IsManifold (𝓡 2) ∞ S] [TauCeti.Orientable (𝓡 2) S]
    (hS : TauCeti.IsClosedConnectedSurface S)
    (f : TauCeti.Diff (𝓡 2) S ∞)
    (hf : ContinuousMap.Homotopic (f.toHomeomorph : C(S, S)) (ContinuousMap.id S)) :
    ∃ Φ : TauCeti.Diffeotopy (𝓡 2) ∞ S, Φ.final = f := by
  sorry

/-- **Smale's theorem on the disc.** The group `Diff(D², ∂)` of smooth self-diffeomorphisms of the
closed unit disc fixing the boundary circle pointwise, with the weak Whitney topology, is
contractible (Smale, *Diffeomorphisms of the 2-sphere*, Proc. AMS 10 (1959), Theorem B, for the
diffeomorphisms that are the identity near the boundary; Layer 5.3 passes from "near the boundary"
to "on the boundary"). Its path-connectedness, `π₀ Diff(D², ∂) = 0`, is the disc input of the
Alexander method used by the kernel theorem. -/
theorem contractibleSpace_discDiff_two : ContractibleSpace (TauCeti.DiscDiff 2) := by
  sorry

/-- **Smale's theorem on the sphere.** The reference inclusion `O(3) → Diff(S²)` of Tau Ceti,
`TauCeti.continuousOrthogonalToDiffSphere 2 ∞`, is a homotopy equivalence for the weak Whitney
topology on `Diff(S²)`. Smale proves that `Diff⁺(S²)` deformation retracts onto `SO(3)` (Smale,
*Diffeomorphisms of the 2-sphere*, Proc. AMS 10 (1959), Theorem A, with the retraction of
Theorem 6); a reflection of `O(3)` carries that retraction to the other component, which gives the
full-group form stated here (Layer 5.3). In particular `π₀ Diff(S²) = ℤ/2`. -/
theorem exists_homotopyEquiv_orthogonalToDiffSphere_two :
    ∃ e : ContinuousMap.HomotopyEquiv (Matrix.orthogonalGroup (Fin 3) ℝ)
      (TauCeti.Diff (𝓡 2) (Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1) ∞),
      e.toFun = TauCeti.continuousOrthogonalToDiffSphere 2 ∞ := by
  sorry

/-- **Smoothing isotopies.** Two diffeomorphisms between compact smooth surfaces, with or without
boundary and orientable or not, that are isotopic through homeomorphisms differ by a smooth
diffeotopy: `ψ = φ ∘ Φ.final`. The proof reduces to diffeomorphisms uniformly close to the identity
and finishes on the triangles of a smooth triangulation with Smale's disc theorem (Layer 5.3a). -/
theorem smoothIsotopic_of_isotopic {M N : Type*}
    [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [IsManifold (𝓡∂ 2) ∞ M]
    [T2Space M] [CompactSpace M]
    [TopologicalSpace N] [ChartedSpace (EuclideanHalfSpace 2) N] [IsManifold (𝓡∂ 2) ∞ N]
    [T2Space N] [CompactSpace N]
    (φ ψ : M ≃ₘ⟮𝓡∂ 2, 𝓡∂ 2⟯ N)
    (h : TauCeti.Isotopic (φ.toHomeomorph : C(M, N)) (ψ.toHomeomorph : C(M, N))) :
    ∃ Φ : TauCeti.Diffeotopy (𝓡∂ 2) ∞ M, ∀ x, ψ x = φ (Φ.final x) := by
  sorry

/-! ## Layer 4: the projective model of `Isom(ℍ)` -/

/-- **The isometry group of the hyperbolic plane is `PGL₂(ℝ)`.** Mathlib's action of
`GL (Fin 2) ℝ` on the upper half-plane (Möbius transformations for positive determinant, their
composition with complex conjugation for negative determinant) is by isometries of the hyperbolic
distance; every isometry of `ℍ` arises; and its kernel is the centre, the nonzero scalar
matrices. Together: an isomorphism `GL(2, ℝ)/Z ≃* Isom(ℍ)` compatible with the action. -/
theorem exists_mulEquiv_isometryEquiv_glAction :
    ∃ e : (GL (Fin 2) ℝ ⧸ Subgroup.center (GL (Fin 2) ℝ)) ≃* (ℍ ≃ᵢ ℍ),
      ∀ (g : GL (Fin 2) ℝ) (z : ℍ), e (QuotientGroup.mk g) z = g • z := by
  sorry

end TauCetiRoadmap.TeichmullerGeometry
