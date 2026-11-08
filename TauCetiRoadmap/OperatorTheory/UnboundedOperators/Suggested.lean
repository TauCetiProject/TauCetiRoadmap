/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.AlgebraicTopology.Singular.LocalHomology.Orientation.Homological
import TauCeti.AlgebraicTopology.SimplicialComplex.CombinatorialManifold.Chart
import TauCeti.AlgebraicTopology.SimplicialComplex.CombinatorialManifold.ChartedSpace
import TauCeti.AlgebraicTopology.SimplicialComplex.Realization.CWComplex.EulerCharacteristic
import TauCeti.Topology.Triangulable.Basic

/-!
# Unbounded operators: target signatures

The roadmap is README.md; this file is not the roadmap. It states headline theorems
against the pinned APIs: maximal multiplication operators, Hilbert-basis cardinal
classification, the spectrum alternatives of a closed symmetric operator, the
closed-form representation, the existence of the Friedrichs extension, Nelson
essential self-adjointness and commutation of the closures' resolvents, the
nonclosable integration counterexample on `L²(ℝ)` with its zero adjoint domain, and
the surface topology of README §2.3a (chart-independence and invariance of the
manifold boundary, the boundary-component count, the boundary of a
combinatorial-manifold realization, Radó's theorem, and coherent orientations).

The unbounded spectral-integral, normal spectral, joint-PVM, spectral-type,
staircase-approximation and tensor spectral-calculus headlines cannot yet be stated
on their intended carriers: the pins have no normalized projection-valued-measure
carrier or unbounded spectral integral. The square-root form-domain identity and
real spectral restriction likewise require that integral and the supplier's Hilbert
complexification. Of the Friedrichs theorem only the existence of a self-adjoint
extension with the same lower bound is stated: its form-order extremality and the
form-domain identities need the form completion, which is not at the pins. The
singular-endpoint headlines need the minimal/maximal differential-operator
constructions. The analytic-perturbation spectral-branch and geometric
Nelson-counterexample headlines require the corresponding spectral-subspace and
translation-surface constructions described in the README. The resolvent points of
a partial operator are stated through the bounded two-sided inverse itself, not
through a library resolvent set. No planning prototype is imported here.
-/

open MeasureTheory

namespace TauCetiRoadmap.UnboundedOperators

/-! ## Layer 1: unbounded Borel calculus and spectral correspondences -/

/-- Every measurable scalar multiplier on an arbitrary measure space has a unique
maximal L² realization, with its pointwise action interpreted almost everywhere.
It is closed and densely defined; a real multiplier gives a self-adjoint operator. -/
theorem existsUnique_maximal_multiplier {X : Type*} [MeasurableSpace X]
    (μ : Measure X) (f : X → ℂ) (hf : Measurable f) :
    ∃! T : Lp ℂ 2 μ →ₗ.[ℂ] Lp ℂ 2 μ,
      (∀ x : Lp ℂ 2 μ, x ∈ T.domain ↔ MemLp (fun t => f t * x t) 2 μ) ∧
      (∀ x : T.domain, ∀ᵐ t ∂μ, (T x) t = f t * (x : Lp ℂ 2 μ) t) ∧
      Dense (T.domain : Set (Lp ℂ 2 μ)) ∧ T.IsClosed ∧
      ((∀ᵐ t ∂μ, star (f t) = f t) → IsSelfAdjoint T) := by
  sorry

/-! ## Layer 2: surface topology for the completed Nelson model (§2.3a) -/

section SurfaceTopology

open AbstractSimplicialComplex PreAbstractSimplicialComplex
open scoped Manifold

/-- Chart-independence of the manifold boundary for merely continuous half-space charts: a
point in the source of any chart of the atlas is an interior point exactly when that chart
sends it off the boundary hyperplane. -/
theorem isInteriorPoint_iff_of_mem_atlas {n : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
    {φ : OpenPartialHomeomorph M (EuclideanHalfSpace (n + 1))}
    (hφ : φ ∈ atlas (EuclideanHalfSpace (n + 1)) M) {y : M} (hy : y ∈ φ.source) :
    (𝓡∂ (n + 1)).IsInteriorPoint y ↔ 0 < (φ y).1 0 := by
  sorry

/-- Homeomorphisms of half-space-charted spaces preserve the manifold boundary, in every
dimension. -/
theorem image_boundary {n : ℕ} {M N : Type*} [TopologicalSpace M] [TopologicalSpace N]
    [ChartedSpace (EuclideanHalfSpace (n + 1)) M] [ChartedSpace (EuclideanHalfSpace (n + 1)) N]
    (e : M ≃ₜ N) : e '' (𝓡∂ (n + 1)).boundary M = (𝓡∂ (n + 1)).boundary N := by
  sorry

/-- The number of boundary components of a surface. -/
noncomputable def boundaryComponentCount (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] : ℕ :=
  Nat.card (ConnectedComponents ((𝓡∂ 2).boundary M))

/-- The boundary-component count is a homeomorphism invariant. -/
theorem boundaryComponentCount_congr {M N : Type*} [TopologicalSpace M] [TopologicalSpace N]
    [ChartedSpace (EuclideanHalfSpace 2) M] [ChartedSpace (EuclideanHalfSpace 2) N]
    (e : M ≃ₜ N) : boundaryComponentCount M = boundaryComponentCount N := by
  sorry

/-- A closed surface has no boundary components. -/
theorem boundaryComponentCount_eq_zero {M : Type*} [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] (h : (𝓡∂ 2).boundary M = ∅) :
    boundaryComponentCount M = 0 := by
  sorry

/-- A space charted on `ℝⁿ⁺¹` carries a half-space atlas with the same chart sources, obtained
by composing with a fixed homeomorphism of `ℝⁿ⁺¹` onto the open half-space; its manifold
boundary is empty. -/
theorem exists_halfSpace_chartedSpace_boundary_eq_empty {n : ℕ} (M : Type*)
    [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin (n + 1))) M] :
    ∃ c : ChartedSpace (EuclideanHalfSpace (n + 1)) M,
      (∀ x : M, (c.chartAt x).source = (chartAt (EuclideanSpace ℝ (Fin (n + 1))) x).source) ∧
      (letI := c; (𝓡∂ (n + 1)).boundary M = ∅) := by
  sorry

/-- The interior of a half-space-charted space carries the Euclidean atlas whose charts are the
restricted charts of the space followed by the inclusion of the half-space. -/
theorem exists_euclidean_chartedSpace_interior {n : ℕ} (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace (n + 1)) M] :
    ∃ c : ChartedSpace (EuclideanSpace ℝ (Fin (n + 1))) ((𝓡∂ (n + 1)).interior M),
      ∀ x y : (𝓡∂ (n + 1)).interior M, y ∈ (c.chartAt x).source →
        c.chartAt x y = (𝓡∂ (n + 1)) (chartAt (EuclideanHalfSpace (n + 1)) (x : M) y) := by
  sorry

/-- The manifold boundary of the realization of a combinatorial `(n + 1)`-manifold, with Tau
Ceti's vertex-chart atlas, consists of the points supported on an `n`-face that lies in exactly
one `(n + 1)`-face. -/
theorem IsCombinatorialManifold.boundary_realization {ι : Type*} [DecidableEq ι]
    {K : AbstractSimplicialComplex ι} {n : ℕ}
    (h : IsCombinatorialManifold K.toPreAbstractSimplicialComplex (n + 1)) :
    letI := h.realizationChartedSpace
    (𝓡∂ (n + 1)).boundary (Realization K) =
      {x | ∃ τ ∈ K.toPreAbstractSimplicialComplex, τ.card = n + 1 ∧
        {σ : Finset ι | σ ∈ K.toPreAbstractSimplicialComplex ∧ τ ⊆ σ ∧ σ.card = n + 2}.ncard = 1 ∧
        (x : ι →₀ ℝ).support ⊆ τ} := by
  sorry

/-- When every vertex link is a combinatorial sphere, the realization has empty boundary. -/
theorem IsCombinatorialManifold.boundary_realization_eq_empty {ι : Type*} [DecidableEq ι]
    {K : AbstractSimplicialComplex ι} {n : ℕ}
    (h : IsCombinatorialManifold K.toPreAbstractSimplicialComplex (n + 1))
    (hs : ∀ v, IsCombinatorialSphere (link K.toPreAbstractSimplicialComplex {v}) n) :
    letI := h.realizationChartedSpace
    (𝓡∂ (n + 1)).boundary (Realization K) = ∅ := by
  sorry

/-- **Radó's theorem.** Every compact surface, with or without boundary, is homeomorphic to the
realization of a combinatorial surface on a finite vertex type. -/
theorem exists_combinatorialManifold_homeomorph (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M] [CompactSpace M] :
    ∃ (ι : Type) (_ : DecidableEq ι) (K : AbstractSimplicialComplex ι), Finite ι ∧
      IsCombinatorialManifold K.toPreAbstractSimplicialComplex 2 ∧
      Nonempty (Realization K ≃ₜ M) := by
  sorry

/-- Radó's theorem in the form of Tau Ceti's `IsTriangulable`. -/
theorem isTriangulable_of_compactSurface (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M] [CompactSpace M] :
    TauCeti.IsTriangulable.{0} M := by
  sorry

/-- A compact surface has finite CW type, so Tau Ceti's space-level Euler characteristic
`TauCeti.eulerChar` is defined on it. -/
theorem finiteCWType_of_compactSurface (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M] [CompactSpace M] :
    TauCeti.FiniteCWType M := by
  sorry

/-- A coherent orientation of the triangles of a simplicial complex. `sign a b c` is `1`
exactly when `(a, b, c)` lists the triangle `{a, b, c}` in its positive cyclic order; it is
alternating, normalized to `1` off triangles, and two triangles sharing an edge `{a, b}` induce
opposite directions on it. -/
structure CoherentOrientation {ι : Type*} [DecidableEq ι] (K : AbstractSimplicialComplex ι) where
  /-- The sign of an ordered triple of vertices. -/
  sign : ι → ι → ι → ℤˣ
  sign_swap_left : ∀ a b c, ({a, b, c} : Finset ι) ∈ K → ({a, b, c} : Finset ι).card = 3 →
    sign b a c = -sign a b c
  sign_swap_right : ∀ a b c, ({a, b, c} : Finset ι) ∈ K → ({a, b, c} : Finset ι).card = 3 →
    sign a c b = -sign a b c
  sign_eq_one : ∀ a b c, ¬ (({a, b, c} : Finset ι) ∈ K ∧ ({a, b, c} : Finset ι).card = 3) →
    sign a b c = 1
  coherent : ∀ a b c d, c ≠ d → ({a, b, c} : Finset ι) ∈ K → ({a, b, d} : Finset ι) ∈ K →
    ({a, b, c} : Finset ι).card = 3 → ({a, b, d} : Finset ι).card = 3 →
    sign a b d = -sign a b c

/-- Orientability of a combinatorial surface depends only on the homeomorphism type of its
realization. -/
theorem nonempty_coherentOrientation_iff_of_homeomorph {ι κ : Type*} [DecidableEq ι]
    [DecidableEq κ] {K : AbstractSimplicialComplex ι} {L : AbstractSimplicialComplex κ}
    (hK : IsCombinatorialManifold K.toPreAbstractSimplicialComplex 2)
    (hL : IsCombinatorialManifold L.toPreAbstractSimplicialComplex 2)
    (e : Realization K ≃ₜ Realization L) :
    Nonempty (CoherentOrientation K) ↔ Nonempty (CoherentOrientation L) := by
  sorry

/-- For a closed combinatorial surface, a coherent orientation exists exactly when the
realization, with Tau Ceti's sphere-link Euclidean atlas, has a homological orientation. -/
theorem nonempty_coherentOrientation_iff_nonempty_homologicalOrientation {ι : Type}
    [DecidableEq ι] {K : AbstractSimplicialComplex ι}
    (hs : ∀ v, IsCombinatorialSphere (link K.toPreAbstractSimplicialComplex {v}) 1) :
    letI := K.sphereLinkChartedSpace hs
    Nonempty (CoherentOrientation K) ↔
      Nonempty (TauCeti.HomologicalOrientation (Realization K) (EuclideanSpace ℝ (Fin 2)) 2) := by
  sorry

/-- A space is an orientable surface when it is homeomorphic to the realization of a coherently
orientable combinatorial surface. -/
def IsOrientableSurface (M : Type*) [TopologicalSpace M] : Prop :=
  ∃ (ι : Type) (_ : DecidableEq ι) (K : AbstractSimplicialComplex ι),
    IsCombinatorialManifold K.toPreAbstractSimplicialComplex 2 ∧
      Nonempty (CoherentOrientation K) ∧ Nonempty (Realization K ≃ₜ M)

/-- Orientability is read off any one triangulation. -/
theorem isOrientableSurface_iff {ι : Type} [DecidableEq ι] {K : AbstractSimplicialComplex ι}
    (hK : IsCombinatorialManifold K.toPreAbstractSimplicialComplex 2) {M : Type*}
    [TopologicalSpace M] (e : Realization K ≃ₜ M) :
    IsOrientableSurface M ↔ Nonempty (CoherentOrientation K) := by
  sorry

/-- Orientability is a homeomorphism invariant. -/
theorem IsOrientableSurface.congr {M N : Type*} [TopologicalSpace M] [TopologicalSpace N]
    (e : M ≃ₜ N) : IsOrientableSurface M ↔ IsOrientableSurface N := by
  sorry

end SurfaceTopology

/-! ## Layer 4: symmetric operators, deficiency and boundary data -/

/-- Complete complex Hilbert spaces with specified Hilbert bases are unitarily
isomorphic exactly when the basis index cardinals agree, across universes. -/
theorem nonempty_linearIsometryEquiv_iff_lift_mk_eq
    {ι : Type u} {κ : Type v} {H K : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    (b : HilbertBasis ι ℂ H) (c : HilbertBasis κ ℂ K) :
    Nonempty (H ≃ₗᵢ[ℂ] K) ↔
      Cardinal.lift.{v} (Cardinal.mk ι) = Cardinal.lift.{u} (Cardinal.mk κ) := by
  sorry

/-- `z` is a resolvent point of the partial operator `S` when `zI − S` has a bounded
two-sided inverse: `R` takes values in the domain, `(zI − S)(R y) = y` for every `y`
(the graph condition), and `R((zI − S)x) = x` on the domain. -/
def IsResolventPoint {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (S : H →ₗ.[ℂ] H) (z : ℂ) : Prop :=
  ∃ R : H →L[ℂ] H, (∀ y : H, (R y, z • R y - y) ∈ S.graph) ∧
    ∀ x : S.domain, R (z • (x : H) - S x) = x

/-- Spectrum alternatives for a closed densely defined symmetric operator on a complex
Hilbert space: its resolvent set is empty, exactly the open lower half-plane, exactly
the open upper half-plane, or contains every nonreal point; and it is self-adjoint
exactly when every nonreal point is a resolvent point (Teschl, Theorem 2.18). -/
theorem resolventPoint_alternatives_of_isClosed_symmetric
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (S : H →ₗ.[ℂ] H) (hdense : Dense (S.domain : Set H)) (hclosed : S.IsClosed)
    (hsym : S.IsFormalAdjoint S) :
    ((∀ z : ℂ, ¬ IsResolventPoint S z) ∨
      ((∀ z : ℂ, z.im < 0 → IsResolventPoint S z) ∧
        ∀ z : ℂ, 0 ≤ z.im → ¬ IsResolventPoint S z) ∨
      ((∀ z : ℂ, 0 < z.im → IsResolventPoint S z) ∧
        ∀ z : ℂ, z.im ≤ 0 → ¬ IsResolventPoint S z) ∨
      (∀ z : ℂ, z.im ≠ 0 → IsResolventPoint S z)) ∧
    (IsSelfAdjoint S ↔ ∀ z : ℂ, z.im ≠ 0 → IsResolventPoint S z) := by
  sorry

/-- Friedrichs extension, existence part: a densely defined symmetric partial operator
bounded below by `γ` has a self-adjoint extension with the same lower bound
(Teschl, Theorem 2.12). The order is graph inclusion of partial operators. -/
theorem friedrichs_exists_selfAdjoint_extension
    {𝕜 H : Type*} [RCLike 𝕜] [NormedAddCommGroup H] [InnerProductSpace 𝕜 H]
    [CompleteSpace H] (S : H →ₗ.[𝕜] H) (hdense : Dense (S.domain : Set H))
    (hsym : S.IsFormalAdjoint S) (γ : ℝ)
    (hγ : ∀ x : S.domain, γ * ‖(x : H)‖ ^ 2 ≤ RCLike.re (inner 𝕜 (S x) (x : H))) :
    ∃ T : H →ₗ.[𝕜] H, IsSelfAdjoint T ∧ S ≤ T ∧
      ∀ x : T.domain, γ * ‖(x : H)‖ ^ 2 ≤ RCLike.re (inner 𝕜 (T x) (x : H)) := by
  sorry

/-- A bounded Hermitian form on a complete Hilbert form domain, with a continuous
injective dense inclusion and a positive shifted coercivity bound, represents a
unique self-adjoint partial operator. The graph specifies its domain and action
in the conjugate-linear-first convention; compactness is not assumed. -/
theorem existsUnique_selfAdjoint_of_closed_form
    {𝕜 H : Type*} [RCLike 𝕜] [NormedAddCommGroup H]
    [InnerProductSpace 𝕜 H] [CompleteSpace H]
    {V : Type*} [NormedAddCommGroup V] [InnerProductSpace 𝕜 V] [CompleteSpace V]
    (j : V →L[𝕜] H) (hj : Function.Injective j) (hdense : DenseRange j)
    (q : V →L⋆[𝕜] V →L[𝕜] 𝕜)
    (hHermitian : ∀ u v, q u v = star (q v u))
    (α c : ℝ) (hc : 0 < c)
    (hcoercive : ∀ u, c * ‖u‖ ^ 2 ≤ RCLike.re (q u u) + α * ‖j u‖ ^ 2) :
    ∃! A : H →ₗ.[𝕜] H, IsSelfAdjoint A ∧
      ∀ x h : H, (x, h) ∈ A.graph ↔
        ∃ u : V, j u = x ∧ ∀ v : V, q u v = inner 𝕜 h (j v) := by
  sorry

/-! ## Layer 5: cores, analytic vectors and perturbations -/

section IntegralCounterexample

/-! The UO-E01 counterexample of README §5.1: integration on the integrable classes of
`L²(ℝ)` is a densely defined partial operator with values in `ℂ` that is not closable,
whose graph closure is everything and whose Hilbert adjoint has domain `{0}`. The
normalized interval indicators that witness this are a README Check and are not restated
here. -/

abbrev L2 : Type := Lp ℂ 2 (volume : Measure ℝ)

/-- Integration exists as a partial operator whose domain is exactly the integrable
classes and whose action is the Bochner integral there. -/
theorem exists_integralOperator :
    ∃ I : L2 →ₗ.[ℂ] ℂ,
      (∀ f : L2, f ∈ I.domain ↔ Integrable (f : ℝ → ℂ) volume) ∧
      (∀ f : I.domain, I f = ∫ x : ℝ, (f : L2) x) := by
  sorry

/-- Density of the domain, the full graph closure, the zero adjoint domain and
non-closability of any such integration operator (Jones, Exercises 12.1.11(ii), 12.1.15). -/
theorem integralOperator_counterexample
    (I : L2 →ₗ.[ℂ] ℂ)
    (hdom : ∀ f : L2, f ∈ I.domain ↔ Integrable (f : ℝ → ℂ) volume)
    (hact : ∀ f : I.domain, I f = ∫ x : ℝ, (f : L2) x) :
    Dense (I.domain : Set L2) ∧
      I.graph.topologicalClosure = ⊤ ∧
      I.adjoint.domain = ⊥ ∧ ¬I.IsClosable := by
  sorry

end IntegralCounterexample

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]

/-- A common dense invariant domain inside the actual partial-operator domains.
Graph-core density is a further theorem; dense invariance alone does not assert it. -/
structure CommonInvariantDomain (k : ℕ) (H : Type*) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] where
  operators : Fin k → H →ₗ.[ℂ] H
  carrier : Submodule ℂ H
  dense : Dense (carrier : Set H)
  domain_le : ∀ i, carrier ≤ (operators i).domain
  invariant : ∀ i (x : carrier),
    operators i ⟨x.1, domain_le i x.2⟩ ∈ carrier

/-- The action on the common domain is determined by the actual operators. -/
def CommonInvariantDomain.action {k : ℕ} (D : CommonInvariantDomain k H)
    (i : Fin k) : D.carrier →ₗ[ℂ] D.carrier :=
  ((D.operators i).toFun.comp (Submodule.inclusion (D.domain_le i))).codRestrict
    D.carrier (fun x => D.invariant i x)

/-- Ordered application: `[i,j]` means A_i(A_j(x)); every intermediate stays in the
invariant domain and the derived action is the actual partial operator. -/
def CommonInvariantDomain.applyWord {k : ℕ} (D : CommonInvariantDomain k H)
    (w : List (Fin k)) (x : D.carrier) : D.carrier :=
  w.foldr (fun i y => D.action i y) x

/-- The restriction to the common domain has the original operator's action. -/
def CommonInvariantDomain.restricted {k : ℕ} (D : CommonInvariantDomain k H)
    (i : Fin k) : H →ₗ.[ℂ] H :=
  ⟨D.carrier, D.carrier.subtype.comp (D.action i)⟩

/-- The quantitative hypothesis uses actual ordered words, operators, and vector.
UO-E03 requires this for every vector in the common dense invariant domain. -/
structure MixedWordAnalyticBound {k : ℕ} (D : CommonInvariantDomain k H)
    (x : D.carrier) (C R : ℝ) where
  C_pos : 0 < C
  R_pos : 0 < R
  bound : ∀ w : List (Fin k),
    ‖(D.applyWord w x : H)‖ ≤ C * R ^ w.length * (Nat.factorial w.length : ℝ)

/-- A dense invariant domain of analytic vectors for symmetric operators makes
all their restrictions essentially self-adjoint. Constants may depend on the vector. -/
theorem nelson_essential_selfAdjoint [CompleteSpace H] {k : ℕ}
    (D : CommonInvariantDomain k H)
    (hsym : ∀ i, (D.restricted i).IsFormalAdjoint (D.restricted i))
    (hbound : ∀ x : D.carrier, ∃ C R : ℝ, MixedWordAnalyticBound D x C R) :
    ∀ i, IsSelfAdjoint (D.restricted i).closure := by
  sorry

/-- Commuting symmetric restrictions with a common mixed-word analytic bound
have commuting bounded resolvents at every pair of nonreal parameters.
Each graph identity specifies an inverse of zI minus the corresponding closure;
self-adjointness makes the nonreal shifts injective, so these right inverses
are also left inverses. This is the resolvent formulation of strong commutation. -/
theorem nelson_resolvent_commute [CompleteSpace H] {k : ℕ}
    (D : CommonInvariantDomain k H)
    (hsym : ∀ i, (D.restricted i).IsFormalAdjoint (D.restricted i))
    (hcomm : ∀ i j, Commute (D.action i) (D.action j))
    (hbound : ∀ x : D.carrier, ∃ C R : ℝ, MixedWordAnalyticBound D x C R)
    (i j : Fin k) (z w : ℂ) (hz : z.im ≠ 0) (hw : w.im ≠ 0) :
    ∃ R S : H →L[ℂ] H,
      (∀ x : H, (R x, z • R x - x) ∈ (D.restricted i).closure.graph) ∧
      (∀ x : H, (S x, w • S x - x) ∈ (D.restricted j).closure.graph) ∧
      Commute R S := by
  sorry

end TauCetiRoadmap.UnboundedOperators
