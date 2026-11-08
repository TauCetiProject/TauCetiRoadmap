import Mathlib
import TauCeti.Geometry.Manifold.Basic
import TauCeti.Geometry.Manifold.Orientation.Basic
import TauCeti.Geometry.Diffeomorphism.Group
import TauCeti.Geometry.Diffeomorphism.Topology
import TauCeti.Geometry.Diffeomorphism.Diffeotopy.Path
import TauCeti.Geometry.Diffeomorphism.Sphere
import TauCeti.Topology.Homotopy.Isotopy.Basic
import TauCeti.Topology.PL.Map
import TauCeti.AlgebraicTopology.SimplicialComplex.CombinatorialManifold.Basic
import TauCeti.AlgebraicTopology.SimplicialComplex.Realization.PL
import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType
import TauCeti.Topology.Covering.LocalPower
import TauCeti.Analysis.Sobolev.WeakDeriv.Basic

/-!
# Teichmüller geometry of closed surfaces: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable at the pins.

Stated here:

* the PL theory of compact surfaces (Layer 0, §0.0a–§0.0d): the open and half-plane PL
  approximation theorems, invariance of the boundary, PL structures and their transport, and
  Epstein's theorem in its closed and boundary-relative forms;
* the topological classification of compact surfaces (§0.0f): polygon schemas realized as
  quotients of the closed unit disc, the standard surfaces and their models, the boundary count
  and orientability of a surface, the Euler characteristic of the models, existence and
  uniqueness of the standard model, the complete invariant and the genus, the Euler
  characteristic being Tau Ceti's `TauCeti.eulerChar` throughout;
* branched covers of surfaces, locally power maps in Tau Ceti's sense `TauCeti.IsLocalPowerAt`,
  their degree, and the topological Riemann–Hurwitz formula (§0.0g);
* the topological and PL mapping class groups with the PL comparison (§0.0h), and the mapping
  class groups of the sphere and the torus, through `O(3)` and `GL₂(ℤ)` (§5.4a);
* the projective model of the hyperbolic isometry group (Layer 4): Mathlib's action of
  `GL (Fin 2) ℝ` on `ℍ`, with negative-determinant matrices acting through complex conjugation,
  induces an isomorphism from `GL (Fin 2) ℝ` modulo its centre onto the isometry group of `ℍ`;
* the Dehn–Nielsen–Baer theorem (Layer 5): the mapping class group of a closed orientable surface
  of genus at least one is the outer automorphism group of its fundamental group, with its smooth
  based realization half, every automorphism of `π₁` of a closed orientable surface being induced
  by a basepoint-fixing diffeomorphism, stated separately;
* the smooth Baer–Epstein kernel theorem (Layer 5): a diffeomorphism of a closed surface that is
  homotopic to the identity is the final slice of a smooth diffeotopy, Tau Ceti's
  `TauCeti.Diffeotopy`;
* the measurable Riemann mapping theorem (Layer 7): existence and uniqueness of the normalized
  `W^{1,2}_loc` homeomorphism of `ℂ` solving the Beltrami equation `f_z̄ = μ f_z` for
  `‖μ‖_∞ < 1`, with Tau Ceti's weak derivatives `TauCeti.HasWeakFDerivOn`;
* the Nielsen realization theorem in its lifting form (Layer 8): a finite subgroup of the mapping
  class group of a closed orientable surface lifts isomorphically to a finite group of
  diffeomorphisms.

Stated in the README only: the compact relative form of the PL approximation theorem (§0.0a) and
the curve, arc and PL isotopy theorems of §0.0d. They are steps of the proofs of Epstein's
theorem and of `MappingClassGroupPL.toTop_bijective`, which are stated here; read in barycentric
coordinates, as `PLStructure.IsPLHomeomorph` reads maps, they are statable, and they are not
headlines.

Not statable at the pins:

* the Teichmüller space `Teich(Σ)` and its complex structure of dimension `3g − 3` (Layers 1, 2),
  the Fenchel–Nielsen homeomorphism `Teich(Σ) ≃ (0,∞)^(3g−3) × ℝ^(3g−3)` and the completeness of
  the Teichmüller metric (Layer 7), the fixed-point form of the Nielsen realization theorem (a
  finite subgroup of `Mod±(Σ)` fixes a point of `Teich(Σ)`) and the fixed-locus dimension
  formula (Layer 8), and the open dense loci of Layers 8–11, the arithmetic locus of Layer 9
  among them: no carrier for the marked quotient of the integrable almost-complex structures by
  `Diff₀⁺(Σ)` exists at the pins;
* the marked holonomy comparison with discrete faithful representations of Euler number `2 − 2g`
  (Layers 4, 6): there is no Euler number of a surface-group representation at the pins;
* the orientations of a combinatorial surface and its orientation double cover (§0.0c): the pins
  have no coherent orientation of the triangles of an abstract simplicial complex, so
  `Surface.IsOrientable` is stated through smooth orientations, which the orientation comparison
  of §0.0e identifies with the coherent ones.
-/

namespace TauCetiRoadmap.TeichmullerGeometry

open scoped Manifold ContDiff UpperHalfPlane TauCeti.DiffeomorphWeakWhitney Topology

open Topology

/-! ## Layer 0: PL approximation, PL structures and Epstein's theorems -/

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
to preserve both as well; this is the boundary chart case of the PL approximation of surface
homeomorphisms (§0.0a). -/
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
homotopic relative to the boundary are isotopic relative to the boundary (§0.0d). Epstein 1966,
Theorem 6.3, p. 99, concludes an isotopy from a homotopy of pairs `(M, ∂M) → (M, ∂M)`; when the
homeomorphism is the identity on `∂M` and the homotopy is constant there, the isotopies
constructed in its proof, pp. 99–101, fix `∂M`, which is the form stated here. Without the
relative hypothesis the statement is false on the disc. -/
theorem isotopicRel_of_homotopicRel (f g : M ≃ₜ N)
    (h : ContinuousMap.HomotopicRel (f : C(M, N)) (g : C(M, N)) ((𝓡∂ 2).boundary M)) :
    ∃ F : ContinuousMap.HomotopyRel (f : C(M, N)) (g : C(M, N)) ((𝓡∂ 2).boundary M),
      ∀ t, Topology.IsEmbedding fun x => F (t, x) := by
  sorry

end Epstein

/-! ## Layer 0: the classification of compact surfaces (§0.0f) -/

/-- A side of a polygon schema: an edge letter `i`, read against the counterclockwise direction
when `inv` holds, which is glued to the other sides carrying the same letter; or a free side, left
unglued, which becomes part of the boundary of the realization (§0.0f). -/
inductive SchemaSide
  | edge (i : ℕ) (inv : Bool)
  | free

/-- The point at parameter `t ∈ [0, 1]` of the `j`-th of `m` equal arcs into which the unit circle
is cut, the arcs following each other counterclockwise from `1` (§0.0f). -/
noncomputable def schemaPoint (m j : ℕ) (t : ℝ) : ℂ :=
  Complex.exp (2 * Real.pi * Complex.I * ((j + t) / m))

/-- The gluing relation of a polygon schema `w` on the closed unit disc: the point at parameter `t`
of a side carrying the letter `i` is related to the point of another side carrying `i` at
parameter `t` when the two flags agree and at parameter `1 - t` when they differ, so that the
arrows of the letter match (§0.0f). -/
def schemaGluing (w : List SchemaSide) (x y : Metric.closedBall (0 : ℂ) 1) : Prop :=
  ∃ (j j' : Fin w.length) (i : ℕ) (ε ε' : Bool) (t : ℝ), j ≠ j' ∧ t ∈ Set.Icc (0 : ℝ) 1 ∧
    w.get j = .edge i ε ∧ w.get j' = .edge i ε' ∧
    (x : ℂ) = schemaPoint w.length j t ∧
    (y : ℂ) = schemaPoint w.length j' (if ε = ε' then t else 1 - t)

/-- The **realization of a polygon schema**: the closed unit disc modulo the equivalence relation
generated by the side gluings (§0.0f). -/
def schemaRealization (w : List SchemaSide) : Type :=
  Quotient (Relation.EqvGen.setoid (schemaGluing w))

instance (w : List SchemaSide) : TopologicalSpace (schemaRealization w) :=
  inferInstanceAs (TopologicalSpace (Quotient _))

instance (w : List SchemaSide) : CompactSpace (schemaRealization w) :=
  inferInstanceAs (CompactSpace (Quotient _))

/-- The **standard surfaces**: the orientable surface of genus `g` with `b` boundary circles, and
the nonorientable surface with `k ≥ 1` crosscaps and `b` boundary circles (§0.0f). -/
inductive StandardSurface
  | orientable (g b : ℕ)
  | nonorientable (k : ℕ) (hk : 0 < k) (b : ℕ)

namespace StandardSurface

/-- The `b` hole blocks `cⱼ hⱼ cⱼ⁻¹`, with `hⱼ` a free side, the letters `cⱼ` numbered from `n`
(§0.0f). -/
def holeWord (n b : ℕ) : List SchemaSide :=
  (List.range b).flatMap fun j => [.edge (n + j) false, .free, .edge (n + j) true]

/-- The canonical word of a standard surface: `a a⁻¹` for the sphere; otherwise the handle blocks
`aᵢ bᵢ aᵢ⁻¹ bᵢ⁻¹`, respectively the crosscap blocks `aᵢ aᵢ`, followed by the hole blocks
(§0.0f). -/
def word : StandardSurface → List SchemaSide
  | .orientable 0 0 => [.edge 0 false, .edge 0 true]
  | .orientable g b =>
      ((List.range g).flatMap fun i =>
        [.edge (2 * i) false, .edge (2 * i + 1) false, .edge (2 * i) true,
          .edge (2 * i + 1) true]) ++ holeWord (2 * g) b
  | .nonorientable k _ b =>
      ((List.range k).flatMap fun i => [.edge i false, .edge i false]) ++ holeWord k b

/-- The **model** of a standard surface: the realization of its canonical word (§0.0f). -/
def model (S : StandardSurface) : Type := schemaRealization S.word

instance (S : StandardSurface) : TopologicalSpace S.model :=
  inferInstanceAs (TopologicalSpace (schemaRealization _))

instance (S : StandardSurface) : CompactSpace S.model :=
  inferInstanceAs (CompactSpace (schemaRealization _))

/-- The Euler characteristic of a standard surface: `2 - 2g - b`, respectively `2 - k - b`
(§0.0f). -/
def eulerChar : StandardSurface → ℤ
  | .orientable g b => 2 - 2 * g - b
  | .nonorientable k _ b => 2 - k - b

/-- The genus of a standard surface: the number of handles, respectively of crosscaps (§0.0f). -/
def genus : StandardSurface → ℕ
  | .orientable g _ => g
  | .nonorientable k _ _ => k

/-- The number of boundary circles of a standard surface (§0.0f). -/
def boundaryCount : StandardSurface → ℕ
  | .orientable _ b => b
  | .nonorientable _ _ b => b

/-- The orientable family (§0.0f). -/
def IsOrientable : StandardSurface → Prop
  | .orientable _ _ => True
  | .nonorientable _ _ _ => False

end StandardSurface

/-- A topological surface is **orientable** when some PL structure has a coherent orientation
(§0.0c). Coherent orientations have no carrier at the pins, so this states the equivalent
condition of the orientation comparison of §0.0e: some smooth structure on `M`, compatible with its
topology, is orientable in Tau Ceti's sense (§0.0f). -/
def Surface.IsOrientable (M : Type*) [TopologicalSpace M] : Prop :=
  ∃ σ : ChartedSpace (EuclideanHalfSpace 2) M,
    @IsManifold _ _ _ _ _ _ _ (𝓡∂ 2) ∞ M _ σ ∧ @TauCeti.Orientable _ _ _ _ _ _ (𝓡∂ 2) M _ σ

/-- The number of boundary components of a topological surface (§0.0f). -/
noncomputable def Surface.boundaryComponentCount (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] : ℕ :=
  Nat.card (ConnectedComponents ((𝓡∂ 2).boundary M))

/-- Every standard model is a compact connected Hausdorff surface with `b` boundary circles,
orientable exactly in the orientable family (§0.0f). -/
theorem StandardSurface.isSurface_model (S : StandardSurface) :
    T2Space S.model ∧ ConnectedSpace S.model ∧
      ∃ σ : ChartedSpace (EuclideanHalfSpace 2) S.model,
        @Surface.boundaryComponentCount S.model _ σ = S.boundaryCount ∧
          (Surface.IsOrientable S.model ↔ S.IsOrientable) := by
  sorry

/-- The Euler characteristic of a standard model, Tau Ceti's `TauCeti.eulerChar`, is
`2 - 2g - b`, respectively `2 - k - b`, counted on the cell structure of its polygon (§0.0f). The
model has finite CW type by Radó's theorem and `TauCeti.IsTriangulable.finiteCWType`. -/
theorem StandardSurface.eulerChar_model (S : StandardSurface) [TauCeti.FiniteCWType S.model] :
    TauCeti.eulerChar S.model = S.eulerChar := by
  sorry

/-- **Uniqueness of the standard model.** Homeomorphic models are equal: Euler characteristic,
orientability and boundary count separate them (§0.0f). -/
theorem StandardSurface.homeomorph_unique {S T : StandardSurface}
    (h : Nonempty (S.model ≃ₜ T.model)) : S = T := by
  sorry

section Classification

variable {M N : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M]
  [T2Space M] [CompactSpace M] [ConnectedSpace M]
  [TopologicalSpace N] [ChartedSpace (EuclideanHalfSpace 2) N]
  [T2Space N] [CompactSpace N] [ConnectedSpace N]

/-- **The classification of compact surfaces.** Every compact connected surface, with or without
boundary, is homeomorphic to exactly one standard model: existence by Radó's theorem and the
reduction of polygon schemas to normal form, uniqueness by `StandardSurface.homeomorph_unique`
(§0.0f). -/
theorem classification_of_surfaces : ∃! S : StandardSurface, Nonempty (M ≃ₜ S.model) := by
  sorry

/-- **The complete invariant.** Compact connected surfaces are homeomorphic exactly when they have
the same Euler characteristic (Tau Ceti's `TauCeti.eulerChar`), orientability and number of
boundary components (§0.0f). -/
theorem homeomorph_iff_invariants [TauCeti.FiniteCWType M] [TauCeti.FiniteCWType N] :
    Nonempty (M ≃ₜ N) ↔
      TauCeti.eulerChar M = TauCeti.eulerChar N ∧
        (Surface.IsOrientable M ↔ Surface.IsOrientable N) ∧
        Surface.boundaryComponentCount M = Surface.boundaryComponentCount N := by
  sorry

end Classification

/-- The **genus** of a compact surface: the genus of the standard model homeomorphic to it, `0`
for a space homeomorphic to none. It is the least genus of a standard model homeomorphic to `M`;
by `StandardSurface.homeomorph_unique` there is at most one such model (§0.0f). -/
noncomputable def Surface.genus (M : Type*) [TopologicalSpace M] : ℕ :=
  sInf {n | ∃ S : StandardSurface, S.genus = n ∧ Nonempty (M ≃ₜ S.model)}

/-- A closed connected orientable compact surface has Euler characteristic `2 - 2g`, `g` its
genus (§0.0f); so on closed orientable surfaces `Surface.genus` is the topological genus read off
`TauCeti.eulerChar`. -/
theorem Surface.eulerChar_eq_two_sub_two_mul_genus {M : Type*} [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M] [CompactSpace M] [ConnectedSpace M]
    [TauCeti.FiniteCWType M] (hb : (𝓡∂ 2).boundary M = ∅) (ho : Surface.IsOrientable M) :
    TauCeti.eulerChar M = 2 - 2 * (Surface.genus M : ℤ) := by
  sorry

/-! ## Layer 0: branched covers and the Riemann–Hurwitz formula (§0.0g) -/

section BranchedCover

variable {X Y : Type*} [TopologicalSpace X] [ChartedSpace (EuclideanHalfSpace 2) X]
  [TopologicalSpace Y] [ChartedSpace (EuclideanHalfSpace 2) Y]

/-- A **branched cover** of surfaces with marked interior values `B` and exponents `e`: a
continuous surjection with finite fibres, a covering map off `B`, carrying boundary to boundary as
a local homeomorphism, locally the power map `w ↦ w ^ e x` in topological charts at every interior
point (Tau Ceti's `TauCeti.IsLocalPowerAt`, whose exponent is positive and determined by `p` and
`x`), and with exponent one off `p⁻¹(B)` and on the boundary (§0.0g). -/
structure IsBranchedCover (p : X → Y) (B : Finset Y) (e : X → ℕ) : Prop where
  continuous : Continuous p
  surjective : Function.Surjective p
  finite_fibers : ∀ y, (p ⁻¹' {y}).Finite
  branch_values_interior : (B : Set Y) ⊆ (𝓡∂ 2).interior Y
  preimage_boundary : p ⁻¹' (𝓡∂ 2).boundary Y = (𝓡∂ 2).boundary X
  covering_off_branch : IsCoveringMap (((B : Set Y)ᶜ).restrictPreimage p)
  local_degree_one_off_branch : ∀ x, p x ∉ B → e x = 1
  local_power : ∀ x ∈ (𝓡∂ 2).interior X, TauCeti.IsLocalPowerAt p x (e x)
  boundary_unramified : IsLocalHomeomorphOn p ((𝓡∂ 2).boundary X)
  local_degree_one_boundary : ∀ x ∈ (𝓡∂ 2).boundary X, e x = 1

/-- **The degree.** Over compact connected surfaces the fibre count weighted by the exponents is a
positive constant (§0.0g). -/
theorem IsBranchedCover.exists_degree [T2Space X] [T2Space Y]
    [CompactSpace X] [CompactSpace Y] [ConnectedSpace X] [ConnectedSpace Y]
    {p : X → Y} {B : Finset Y} {e : X → ℕ} (hp : IsBranchedCover p B e) :
    ∃ d : ℕ, 0 < d ∧ ∀ y, ∑ x ∈ (hp.finite_fibers y).toFinset, e x = d := by
  sorry

/-- **The Riemann–Hurwitz formula** for a branched cover of degree `d` of compact connected
surfaces, for Tau Ceti's Euler characteristic `TauCeti.eulerChar`, proved by lifting a
triangulation of the base with the marked values among its vertices (§0.0g). The correction term
is a sum over the finite set `p⁻¹(B)`, a finite union of finite fibres. -/
theorem riemannHurwitz [T2Space X] [T2Space Y]
    [CompactSpace X] [CompactSpace Y] [ConnectedSpace X] [ConnectedSpace Y]
    [TauCeti.FiniteCWType X] [TauCeti.FiniteCWType Y]
    {p : X → Y} {B : Finset Y} {e : X → ℕ} (hp : IsBranchedCover p B e) (d : ℕ)
    (hd : ∀ y, ∑ x ∈ (hp.finite_fibers y).toFinset, e x = d) :
    TauCeti.eulerChar X = (d : ℤ) * TauCeti.eulerChar Y -
      ∑ᶠ x ∈ p ⁻¹' (B : Set Y), ((e x : ℤ) - 1) := by
  sorry

end BranchedCover

/-! ## Layer 0: mapping class groups of compact surfaces (§0.0h) -/

section MappingClassGroups

variable (M : Type*) [TopologicalSpace M]

/-- The homeomorphisms of `M` isotopic to the identity through embeddings (§0.0h). The subgroup
laws compose on the left: `F_t ∘ g` followed by `G_t` joins `f ∘ g` to the identity, and
`f⁻¹ ∘ F_t` joins the identity to `f⁻¹`. -/
def isotopicToIdSubgroup : Subgroup (M ≃ₜ M) where
  carrier := {f | TauCeti.Isotopic (f : C(M, M)) (ContinuousMap.id M)}
  one_mem' := TauCeti.Isotopic.refl _ IsEmbedding.id
  mul_mem' := by
    rintro f g ⟨F⟩ hg
    exact TauCeti.Isotopic.trans
      ⟨⟨F.toHomotopy.compContinuousMap (g : C(M, M)),
        fun t => (F.isEmbedding_apply t).comp g.isEmbedding⟩⟩ hg
  inv_mem' := by
    rintro f ⟨F⟩
    have h : TauCeti.Isotopic ((f.symm : C(M, M)).comp f) (f.symm : C(M, M)) :=
      ⟨⟨(ContinuousMap.Homotopy.refl (f.symm : C(M, M))).comp F.toHomotopy,
        fun t => f.symm.isEmbedding.comp (F.isEmbedding_apply t)⟩⟩
    have e : (f.symm : C(M, M)).comp f = ContinuousMap.id M := by ext; simp
    rw [e] at h
    exact h.symm

/-- Conjugation `h ∘ F_t ∘ h⁻¹` of an isotopy to the identity is one (§0.0h). -/
instance isotopicToIdSubgroup.normal : (isotopicToIdSubgroup M).Normal where
  conj_mem f := by
    rintro ⟨F⟩ h
    have e : (h : C(M, M)).comp ((ContinuousMap.id M).comp (h.symm : C(M, M))) =
        ContinuousMap.id M := by ext; simp
    have := TauCeti.Isotopic.of_isotopy
      (⟨(ContinuousMap.Homotopy.refl (h : C(M, M))).comp
        (F.toHomotopy.compContinuousMap (h.symm : C(M, M))),
        fun t => h.isEmbedding.comp ((F.isEmbedding_apply t).comp h.symm.isEmbedding)⟩ :
        TauCeti.Isotopy _ _)
    rw [e] at this
    exact this

/-- The **mapping class group**: homeomorphisms modulo isotopy (§0.0h). -/
abbrev MappingClassGroupFull : Type _ := (M ≃ₜ M) ⧸ isotopicToIdSubgroup M

variable {M}

/-- A self-homeomorphism is **piecewise linear** for a PL structure `s` when, in the barycentric
coordinates of `s`, it is the restriction of a map piecewise linear on the realization (§0.0h). -/
def PLStructure.IsPLHomeomorph (s : PLStructure M) (f : M ≃ₜ M) : Prop :=
  ∃ F : (s.ι → ℝ) → (s.ι → ℝ),
    TauCeti.IsPLOn F
      (Set.range fun y : AbstractSimplicialComplex.Realization s.K => ⇑(y : s.ι →₀ ℝ)) ∧
    ∀ y : AbstractSimplicialComplex.Realization s.K,
      F ⇑(y : s.ι →₀ ℝ) = ⇑(s.e.symm (f (s.e y)) : s.ι →₀ ℝ)

/-- The **PL homeomorphisms** of a PL structure: the self-homeomorphisms piecewise linear in both
directions, a subgroup because piecewise-linear maps compose (`TauCeti.IsPLOn.comp`). That a
piecewise-linear self-homeomorphism has a piecewise-linear inverse is a target of §0.0h (§0.0h). -/
def PLStructure.plHomeomorphSubgroup (s : PLStructure M) : Subgroup (M ≃ₜ M) where
  carrier := {f | s.IsPLHomeomorph f ∧ s.IsPLHomeomorph f.symm}
  one_mem' := ⟨⟨id, TauCeti.isPLOn_id _, fun y => by simp [Homeomorph.one_def]⟩,
    ⟨id, TauCeti.isPLOn_id _, fun y => by simp [Homeomorph.one_def]⟩⟩
  mul_mem' := by
    have key : ∀ f g : M ≃ₜ M, s.IsPLHomeomorph f → s.IsPLHomeomorph g →
        s.IsPLHomeomorph (g.trans f) := by
      rintro f g ⟨F, hF, hFf⟩ ⟨G, hG, hGg⟩
      refine ⟨F ∘ G, hF.comp hG ?_, fun y => ?_⟩
      · rintro _ ⟨y, rfl⟩
        exact ⟨s.e.symm (g (s.e y)), (hGg y).symm⟩
      · simp only [Function.comp_apply, hGg, hFf, Homeomorph.apply_symm_apply,
          Homeomorph.trans_apply]
    rintro f g ⟨hf, hf'⟩ ⟨hg, hg'⟩
    exact ⟨key f g hf hg, key g.symm f.symm hg' hf'⟩
  inv_mem' := fun h => ⟨h.2, h.1⟩

/-- Two homeomorphisms are **PL isotopic** when an isotopy through homeomorphisms joins them whose
level-preserving map of `[0, 1] × |K|` is piecewise linear in barycentric coordinates (§0.0h). -/
def PLStructure.IsPLIsotopic (s : PLStructure M) (f g : M ≃ₜ M) : Prop :=
  ∃ F : TauCeti.Isotopy (f : C(M, M)) (g : C(M, M)),
    (∀ t, Function.Surjective fun x => F (t, x)) ∧
      ∃ G : ℝ × (s.ι → ℝ) → (s.ι → ℝ),
        TauCeti.IsPLOn G (Set.Icc (0 : ℝ) 1 ×ˢ
          Set.range fun y : AbstractSimplicialComplex.Realization s.K => ⇑(y : s.ι →₀ ℝ)) ∧
        ∀ (t : unitInterval) (y : AbstractSimplicialComplex.Realization s.K),
          G ((t : ℝ), ⇑(y : s.ι →₀ ℝ)) = ⇑(s.e.symm (F (t, s.e y)) : s.ι →₀ ℝ)

/-- The normal subgroup of the PL homeomorphisms generated by those PL isotopic to the identity.
PL isotopies concatenate after rescaling time and conjugate by PL homeomorphisms, so its elements
are exactly the PL homeomorphisms PL isotopic to the identity, a target of §0.0h (§0.0h). -/
def PLStructure.plIsotopicToIdSubgroup (s : PLStructure M) :
    Subgroup s.plHomeomorphSubgroup :=
  Subgroup.normalClosure {f | s.IsPLIsotopic f 1}

/-- A normal closure is normal (§0.0h). -/
instance PLStructure.plIsotopicToIdSubgroup.normal (s : PLStructure M) :
    s.plIsotopicToIdSubgroup.Normal :=
  Subgroup.normalClosure_normal

/-- The **PL mapping class group**: PL homeomorphisms modulo PL isotopy (§0.0h). -/
abbrev MappingClassGroupPL (s : PLStructure M) : Type _ :=
  s.plHomeomorphSubgroup ⧸ s.plIsotopicToIdSubgroup

/-- The forgetful homomorphism from the PL to the topological mapping class group, which descends
because a PL isotopy is an isotopy (§0.0h). -/
def MappingClassGroupPL.toTop (s : PLStructure M) :
    MappingClassGroupPL s →* MappingClassGroupFull M :=
  QuotientGroup.map _ _ s.plHomeomorphSubgroup.subtype <| by
    refine Subgroup.normalClosure_le_normal ?_
    rintro f ⟨F, -, -⟩
    exact ⟨F⟩

/-- The PL and topological mapping class groups agree: surjective by isotopy to a PL homeomorphism
(§0.0b; Epstein 1966, Appendix, Theorem A4, p. 107), injective by PL isotopy (§0.0d; Epstein
1966, Theorems 6.3 and 6.4 a) in their piecewise-linear readings, pp. 99–101) (§0.0h). -/
theorem MappingClassGroupPL.toTop_bijective (s : PLStructure M) :
    Function.Bijective (MappingClassGroupPL.toTop s) := by
  sorry

end MappingClassGroups

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

/-- The inner automorphisms of a group form a normal subgroup of its automorphism group, since
`φ ∘ conj g ∘ φ⁻¹ = conj (φ g)` (§4.2). -/
instance innerAut_normal (G : Type*) [Group G] :
    (MulAut.conj : G →* MulAut G).range.Normal where
  conj_mem := by
    rintro _ ⟨g, rfl⟩ φ
    refine ⟨φ g, ?_⟩
    ext x
    simp [MulAut.conj_apply, mul_assoc]

/-- The **outer automorphism group** `Out(G) = Aut(G)/Inn(G)`: the automorphisms of `G` modulo
the inner ones, the range of `MulAut.conj` (§4.2). -/
abbrev OuterAut (G : Type*) [Group G] : Type _ :=
  MulAut G ⧸ (MulAut.conj : G →* MulAut G).range

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
surface, orientable or not, that is homotopic to the identity through continuous maps is the final
slice of a smooth diffeotopy, that is, it is smoothly isotopic to the identity (Layer 5.4):
Epstein's theorem `isotopic_of_homotopic_closedSurface` gives a topological isotopy, and
GeometricTopology's smoothing of isotopies (its Layer 11.2.1 item 5) makes it smooth, both read
through the `𝓡∂ 2` atlas of `S` of §0.0e. On an aspherical surface, of genus at least one, a
diffeomorphism inducing an inner automorphism of `π₁` is homotopic to the identity, so this gives
the injectivity of `Mod±(S) → Out(π₁ S)`; on `S²` the antipodal map induces the identity of the
trivial `π₁` without being homotopic to the identity, and that injectivity fails. -/
theorem baer_epstein_smooth
    {S : Type*} [TopologicalSpace S] [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S]
    [IsManifold (𝓡 2) ∞ S]
    (hS : TauCeti.IsClosedConnectedSurface S)
    (f : TauCeti.Diff (𝓡 2) S ∞)
    (hf : ContinuousMap.Homotopic (f.toHomeomorph : C(S, S)) (ContinuousMap.id S)) :
    ∃ Φ : TauCeti.Diffeotopy (𝓡 2) ∞ S, Φ.final = f := by
  sorry

/-- **The Dehn–Nielsen–Baer theorem.** For a compact connected orientable surface `S` without
boundary and of genus at least one, and a point `x₀`, the mapping class group of `S` (which is
`Mod±(S)` by Layer 3.1) is isomorphic to the outer automorphism group of `π₁(S, x₀)`, the class of
a homeomorphism fixing `x₀` going to the outer class of the automorphism it induces. Every class
has a representative fixing `x₀`, and the outer class does not depend on it, an isotopy moving the
base point along a loop changing the induced automorphism by an inner one. Surjectivity is the
realization of Layer 5.2 (`exists_diffeomorph_mapOfEq_eq`); injectivity is asphericity (Layer 5.1;
Hatcher, *Algebraic Topology*, Proposition 1B.9, p. 90) followed by Epstein's theorem
`isotopic_of_homotopic_closedSurface` (Farb–Margalit, *A Primer on Mapping Class Groups*,
Chapter 8; Layer 5.4). The genus hypothesis excludes `S²`, whose mapping class group has two
elements while the outer automorphism group of its trivial fundamental group is trivial. -/
theorem dehn_nielsen_baer {S : Type*} [TopologicalSpace S]
    [ChartedSpace (EuclideanHalfSpace 2) S] [T2Space S] [CompactSpace S] [ConnectedSpace S]
    (hb : (𝓡∂ 2).boundary S = ∅) (ho : Surface.IsOrientable S) (hg : 1 ≤ Surface.genus S)
    (x₀ : S) :
    ∃ e : MappingClassGroupFull S ≃* OuterAut (FundamentalGroup S x₀),
      ∀ (f : S ≃ₜ S) (hf : f x₀ = x₀) (α : MulAut (FundamentalGroup S x₀)),
        α.toMonoidHom = FundamentalGroup.mapOfEq (f : C(S, S)) hf →
          e (QuotientGroup.mk f) = QuotientGroup.mk α := by
  sorry

/-- **The mapping class group of the sphere** has two elements, the class of a reflection being
the nontrivial one. Stated for the homomorphism sending `r ∈ O(3)` to the class of its restriction
`TauCeti.orthogonalToDiffSphere 2 ∞ r`: it is surjective with kernel `SO(3)`, the matrices of
determinant one. By GeometricTopology's comparison of smooth and topological isotopy (its
Layer 11.2.1 items 2 and 5) the group is `π₀ Diff(S²)`, which Smale's theorem `Diff(S²) ≃ O(3)`
(its Layer 3.4) identifies with `π₀ O(3)` (Layer 5.4a). -/
theorem mcg_sphere_full :
    Function.Surjective (fun r : Matrix.orthogonalGroup (Fin 3) ℝ =>
      (QuotientGroup.mk (Diffeomorph.toHomeomorphHom (TauCeti.orthogonalToDiffSphere 2 ∞ r)) :
        MappingClassGroupFull (Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1))) ∧
    ∀ r : Matrix.orthogonalGroup (Fin 3) ℝ,
      (QuotientGroup.mk (Diffeomorph.toHomeomorphHom (TauCeti.orthogonalToDiffSphere 2 ∞ r)) :
        MappingClassGroupFull (Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1)) = 1 ↔
        (r : Matrix (Fin 3) (Fin 3) ℝ).det = 1 := by
  sorry

/-- The **linear homeomorphism** of the torus `(ℝ/ℤ)²` induced by `A ∈ GL₂(ℤ)`: in the coordinates
of the two circle factors, `(x, y) ↦ (a x + b y, c x + d y)` for `A = [[a, b], [c, d]]`, with
inverse induced by `A⁻¹` (Layer 5.4a). -/
def torusLinearHomeomorph (A : GL (Fin 2) ℤ) :
    (AddCircle (1 : ℝ) × AddCircle (1 : ℝ)) ≃ₜ (AddCircle (1 : ℝ) × AddCircle (1 : ℝ)) where
  toFun p := ((A : Matrix (Fin 2) (Fin 2) ℤ) 0 0 • p.1 + (A : Matrix (Fin 2) (Fin 2) ℤ) 0 1 • p.2,
    (A : Matrix (Fin 2) (Fin 2) ℤ) 1 0 • p.1 + (A : Matrix (Fin 2) (Fin 2) ℤ) 1 1 • p.2)
  invFun p :=
    (((A⁻¹ : GL (Fin 2) ℤ) : Matrix (Fin 2) (Fin 2) ℤ) 0 0 • p.1 +
        ((A⁻¹ : GL (Fin 2) ℤ) : Matrix (Fin 2) (Fin 2) ℤ) 0 1 • p.2,
      ((A⁻¹ : GL (Fin 2) ℤ) : Matrix (Fin 2) (Fin 2) ℤ) 1 0 • p.1 +
        ((A⁻¹ : GL (Fin 2) ℤ) : Matrix (Fin 2) (Fin 2) ℤ) 1 1 • p.2)
  left_inv p := by
    have h : ((A⁻¹ : GL (Fin 2) ℤ) : Matrix (Fin 2) (Fin 2) ℤ) * (A : Matrix (Fin 2) (Fin 2) ℤ) =
        1 := A.inv_mul
    have e00 := congrFun (congrFun h 0) 0
    have e01 := congrFun (congrFun h 0) 1
    have e10 := congrFun (congrFun h 1) 0
    have e11 := congrFun (congrFun h 1) 1
    simp only [Matrix.mul_apply, Fin.sum_univ_two, Matrix.one_apply_eq, Matrix.one_apply_ne,
      ne_eq, not_false_eq_true, one_ne_zero, zero_ne_one] at e00 e01 e10 e11
    ext <;> simp only [smul_add, smul_smul]
    · rw [add_add_add_comm, ← add_smul, ← add_smul, e00, e01, one_smul, zero_smul, add_zero]
    · rw [add_add_add_comm, ← add_smul, ← add_smul, e10, e11, one_smul, zero_smul, zero_add]
  right_inv p := by
    have h : (A : Matrix (Fin 2) (Fin 2) ℤ) * ((A⁻¹ : GL (Fin 2) ℤ) : Matrix (Fin 2) (Fin 2) ℤ) =
        1 := A.mul_inv
    have e00 := congrFun (congrFun h 0) 0
    have e01 := congrFun (congrFun h 0) 1
    have e10 := congrFun (congrFun h 1) 0
    have e11 := congrFun (congrFun h 1) 1
    simp only [Matrix.mul_apply, Fin.sum_univ_two, Matrix.one_apply_eq, Matrix.one_apply_ne,
      ne_eq, not_false_eq_true, one_ne_zero, zero_ne_one] at e00 e01 e10 e11
    ext <;> simp only [smul_add, smul_smul]
    · rw [add_add_add_comm, ← add_smul, ← add_smul, e00, e01, one_smul, zero_smul, add_zero]
    · rw [add_add_add_comm, ← add_smul, ← add_smul, e10, e11, one_smul, zero_smul, zero_add]
  continuous_toFun := by fun_prop
  continuous_invFun := by fun_prop

/-- **The mapping class group of the torus** is `GL₂(ℤ)`: the map sending `A` to the class of its
linear homeomorphism `torusLinearHomeomorph A` is bijective, and it is a homomorphism because
`torusLinearHomeomorph (A * B) = torusLinearHomeomorph A * torusLinearHomeomorph B`. Its inverse
is the action on `π₁(T², 0) = ℤ²` in the basis of the two circle factors; injectivity and
surjectivity come from asphericity and Epstein's theorem `isotopic_of_homotopic_closedSurface`
(Layer 5.4a). -/
theorem mcg_torus_full :
    Function.Bijective (fun A : GL (Fin 2) ℤ =>
      (QuotientGroup.mk (torusLinearHomeomorph A) :
        MappingClassGroupFull (AddCircle (1 : ℝ) × AddCircle (1 : ℝ)))) := by
  sorry

/-! ## Layer 7: the measurable Riemann mapping theorem -/

open MeasureTheory in
/-- **The measurable Riemann mapping theorem.** For a measurable `μ : ℂ → ℂ` with `‖μ‖ ≤ k < 1`
almost everywhere there is exactly one homeomorphism `f` of `ℂ` fixing `0` and `1` that lies in
`W^{1,2}_loc` (a weak derivative `U`, Tau Ceti's `TauCeti.HasWeakFDerivOn` on the whole plane, with
locally square-integrable entries) and solves the Beltrami equation `f_z̄ = μ f_z` almost
everywhere, the weak Wirtinger derivatives being `f_z̄ = (f_x + i f_y)/2` and
`f_z = (f_x − i f_y)/2` with `f_x = U z 1` and `f_y = U z i` (Ahlfors–Bers 1960, Theorem 1;
Imayoshi–Taniguchi, §4.4; Layer 7.4). For constant `μ = a` it is
`z ↦ (z + a z̄)/(1 + a)`. -/
theorem measurable_riemann_mapping (μ : ℂ → ℂ) (hμ : AEStronglyMeasurable μ volume)
    (k : ℝ) (hk : k < 1) (hbound : ∀ᵐ z ∂volume, ‖μ z‖ ≤ k) :
    ∃! f : ℂ ≃ₜ ℂ, f 0 = 0 ∧ f 1 = 1 ∧
      ∃ U : ℂ → ℂ →L[ℝ] ℂ, TauCeti.HasWeakFDerivOn volume ⊤ f U ∧
        (∀ v : ℂ, ∀ K : Set ℂ, IsCompact K → MemLp (fun z => U z v) 2 (volume.restrict K)) ∧
        ∀ᵐ z ∂volume, (U z 1 + Complex.I * U z Complex.I) / 2 =
          μ z * ((U z 1 - Complex.I * U z Complex.I) / 2) := by
  sorry

/-! ## Layer 8: finite actions -/

/-- **The Nielsen realization theorem, lifting form.** For a smooth closed connected orientable
surface `S`, every finite subgroup `F` of the mapping class group `MappingClassGroupFull S`, which
is `Mod±(S)` by Layer 3.1, lifts isomorphically to a finite group of diffeomorphisms: some finite
subgroup `H` of `Diff(S)` is carried bijectively onto `F` by the quotient map. For genus at least
two `H` is the group of isometries, representing `F`, of the hyperbolic metric at a point of
`Teich(S)` fixed by `F` (Kerckhoff, *The Nielsen realization problem*, Ann. of Math. 117 (1983),
Theorem 1; Layers 8.2, 5.6 and 0.5); for the sphere and the torus the lifts are orthogonal and
linear maps (Layer 5.4a). -/
theorem nielsen_realization
    {S : Type*} [TopologicalSpace S] [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S]
    [IsManifold (𝓡 2) ∞ S] [TauCeti.Orientable (𝓡 2) S]
    (hS : TauCeti.IsClosedConnectedSurface S)
    (F : Subgroup (MappingClassGroupFull S)) [Finite F] :
    ∃ H : Subgroup (TauCeti.Diff (𝓡 2) S ∞), Finite H ∧
      Set.BijOn (fun h : TauCeti.Diff (𝓡 2) S ∞ =>
          (QuotientGroup.mk (Diffeomorph.toHomeomorphHom h) : MappingClassGroupFull S))
        (H : Set (TauCeti.Diff (𝓡 2) S ∞)) (F : Set (MappingClassGroupFull S)) := by
  sorry

end TauCetiRoadmap.TeichmullerGeometry
