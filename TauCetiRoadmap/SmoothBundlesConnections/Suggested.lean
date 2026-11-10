/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Geometry.Manifold.FiberBundle.Basic
import TauCeti.Topology.FiberBundle.Principal

/-!
# Smooth principal bundles, connections, and holonomy: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the few definitions on native carriers that those statements need. Principal bundles are
Tau Ceti's mixin `TauCeti.PrincipalBundle` on Mathlib's fibre-bundle data, smooth when
`TauCeti.ContMDiffFiberBundle` holds, with total space charted on the type copy
`TauCeti.ManifoldTotalSpace`.

Stated here (B1.4, B1.5 and B6.0–B6.1):

* the orbit space of a free proper smooth Lie-group action admits a smooth atlas for its
  quotient topology, of dimension `dim M - dim G`, making the projection a submersion;
* for such an action the orbits, with the right action `x · g = g⁻¹ • x`, form a smooth
  principal `G`-bundle over that orbit manifold whose charted total space is diffeomorphic to
  `M` by `⟨q, x⟩ ↦ x`; `G → G/H` for a closed subgroup `H` and the Hopf bundle are instances;
* Ehresmann's fibration theorem: the fibres of a proper surjective submersion onto a connected
  base form a smooth fibre bundle with model fibre one of them, whose charted total space is
  diffeomorphic to the source by `⟨b, p⟩ ↦ p`;
* every open cover of a finite-dimensional Hausdorff second-countable boundaryless smooth
  manifold has a locally finite refinement by a smooth good cover, finite when the manifold is
  compact;
* on a smooth good cover, each factor of Mathlib's native Čech complex of the locally constant
  real sheaf is a copy of `ℝ`, through the constant section given by the unit of the native
  constant-sheaf adjunction, exactly when the tuple intersection is nonempty;
* the sheaf of smooth real functions on a finite-dimensional Hausdorff second-countable smooth
  manifold is acyclic: its sheaf cohomology `Sheaf.H` vanishes in every positive degree.

The regular-fibre theorem of B1.0 is Tau Ceti's `TauCeti.exists_regularFiber_smoothEmbedding`
and is not restated.

Headline theorems of the README that are not statable at the pins, with the missing carrier:

* Ambrose–Singer and the holonomy reductions (B5.2): their statements need holonomy groups,
  built from horizontal lifts of a principal connection (B5.0); the pins have no horizontal-lift,
  parallel-transport or holonomy carrier. The connections, curvature and Atiyah sequence of B3–B4
  that they use are README constructions on pinned forms (`TauCeti.SmoothBundleForm`,
  `TauCeti.mextDeriv`, `TauCeti.bracketWedge`, `TauCeti.CurvatureForm`).
* The reconstruction of a connection from smooth parallel transport (B5.1): it needs the thin
  path groupoid and the transport functor, which are definitions of this roadmap.
* The flat-bundle dictionary with representations of `π₁(M)` (B5.2): it needs flat connections
  and their holonomy representations, hence the same holonomy carrier.
* The finite-rank Hilbert space `L²(E,h,μ)` of sections, its completeness and its isometry with
  `MeasureTheory.Lp` for the trivial bundle (B2): the pins have no normed or inner-product
  structure on measurable sections of a vector bundle; constructing it is a README target.
* The Čech–de Rham–singular comparison (B6.1): the headline is a specific comparison map, built
  from the Čech–de Rham double complex, and its agreement with integration over smooth chains,
  DifferentialGeometry 8.4's de Rham homomorphism, which the pins lack. De Rham cohomology is
  pinned (`TauCeti.deRhamCohomology`), but a bare isomorphism between it and native Čech
  cohomology would compare dimensions only.
* The classification of principal circle bundles by `H²(M;ℤ)`, the Hopf normalization, rank-one
  Chern–Weil and the flat ambiguity (B6.2–B6.6): the pins have no first Chern class map into
  Tau Ceti's singular cohomology (an unnormalized bijection with `H²(M;ℤ)` would only compare
  cardinalities). The circle quotient of `S³` itself has a pinned carrier,
  `TauCeti.ComplexProjectiveSpace 1`; what blocks the Hopf normalization is the missing first
  Chern class map, not the base.
-/

namespace TauCetiRoadmap.SmoothBundlesConnections

open CategoryTheory
open scoped Manifold ContDiff

/-! ## Layer 1: Principal bundles and descent -/

/-- The orbit space of a free proper smooth action of a finite-dimensional real Lie group
on a finite-dimensional boundaryless smooth real manifold admits a smooth atlas of dimension
`finrank ℝ E - finrank ℝ EG`, with its quotient topology, for which the quotient projection
is a submersion. Both manifolds are Hausdorff and second countable; the source may be empty
(B1.4; Meinrenken, Theorem 1.21). -/
theorem exists_freeProperQuotient_isSubmersion
    {E EG H HG M G : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [NormedAddCommGroup EG] [NormedSpace ℝ EG] [FiniteDimensional ℝ EG]
    [TopologicalSpace H] [TopologicalSpace HG]
    (I : ModelWithCorners ℝ E H) (IG : ModelWithCorners ℝ EG HG)
    [I.Boundaryless] [IG.Boundaryless]
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [T2Space M] [SecondCountableTopology M]
    [TopologicalSpace G] [ChartedSpace HG G] [Group G] [LieGroup IG ∞ G]
    [T2Space G] [SecondCountableTopology G] [MulAction G M] [ProperSMul G M]
    (hsm : ContMDiff (IG.prod I) I ∞ (fun gx : G × M => gx.1 • gx.2))
    (hfree : ∀ (g : G) (x : M), g • x = x → g = 1) :
    ∃ _ : ChartedSpace (Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ)
        (MulAction.orbitRel.Quotient G M),
      IsManifold 𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ) ∞
        (MulAction.orbitRel.Quotient G M) ∧
      Manifold.IsSubmersion I
        𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ) ∞
        (Quotient.mk'' : M → MulAction.orbitRel.Quotient G M) := by
  sorry

/-- The fibre family of the orbit projection of a left action: over an orbit `q`, the orbit
itself as a subspace of `M` (B1.4). -/
abbrev orbitFiber (G M : Type*) [Group G] [MulAction G M]
    (q : MulAction.orbitRel.Quotient G M) : Type _ :=
  q.orbit

/-- The right action `x · g = g⁻¹ • x` of `G` on an orbit of a left action, encoded as an action
of the opposite group: B1.2's conversion of a left action into a right one. -/
instance orbitFiber.rightAction (G M : Type*) [Group G] [MulAction G M]
    (q : MulAction.orbitRel.Quotient G M) : MulAction Gᵐᵒᵖ (orbitFiber G M q) :=
  MulAction.compHom _ (MulEquiv.inv' G).symm.toMonoidHom

/-- A free proper smooth action of a finite-dimensional real Lie group makes the orbit
projection a smooth principal bundle (B1.4; Meinrenken, Theorem 1.21). For some smooth atlas of
dimension `finrank ℝ E - finrank ℝ EG` on the orbit space, with its quotient topology, the
orbits `orbitFiber G M`, with the right action `x · g = g⁻¹ • x` of `orbitFiber.rightAction`,
carry a fibre-bundle structure with model fibre `G` that is a principal bundle with smooth
transition functions, and the charted total space `TauCeti.ManifoldTotalSpace G (orbitFiber G M)`
is diffeomorphic to `M` by `⟨q, x⟩ ↦ x`. The diffeomorphism forces the total-space topology to be
that of `M`. Both manifolds are Hausdorff and second countable; the source may be empty. -/
theorem exists_principalBundle_orbitFiber
    {E EG H HG M G : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [NormedAddCommGroup EG] [NormedSpace ℝ EG] [FiniteDimensional ℝ EG]
    [TopologicalSpace H] [TopologicalSpace HG]
    (I : ModelWithCorners ℝ E H) (IG : ModelWithCorners ℝ EG HG)
    [I.Boundaryless] [IG.Boundaryless]
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [T2Space M] [SecondCountableTopology M]
    [TopologicalSpace G] [ChartedSpace HG G] [Group G] [LieGroup IG ∞ G]
    [T2Space G] [SecondCountableTopology G] [MulAction G M] [ProperSMul G M]
    (hsm : ContMDiff (IG.prod I) I ∞ (fun gx : G × M => gx.1 • gx.2))
    (hfree : ∀ (g : G) (x : M), g • x = x → g = 1) :
    ∃ (_ : ChartedSpace (Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ)
          (MulAction.orbitRel.Quotient G M))
      (_ : TopologicalSpace (Bundle.TotalSpace G (orbitFiber G M)))
      (_ : FiberBundle G (orbitFiber G M)),
      IsManifold 𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ) ∞
          (MulAction.orbitRel.Quotient G M) ∧
        TauCeti.PrincipalBundle G (orbitFiber G M) ∧
        TauCeti.ContMDiffFiberBundle ∞ G (orbitFiber G M)
          𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ) IG ∧
        ∃ φ : Diffeomorph (𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ).prod IG) I
            (TauCeti.ManifoldTotalSpace G (orbitFiber G M)) M ∞,
          ∀ x, φ x = ((TauCeti.ManifoldTotalSpace.homeomorph G (orbitFiber G M)).symm x).2.1 := by
  sorry

/-- **Ehresmann's fibration theorem** (B1.5; Kolář–Michor–Slovák, Lemma 9.2). The fibres
`π⁻¹(b)` of a proper surjective submersion `π : P → B` between finite-dimensional boundaryless
Hausdorff second-countable smooth real manifolds, with `B` connected, form a smooth fibre bundle
whose model fibre is the fibre over a chosen `b₀`, for some smooth atlas on that fibre of
dimension `finrank ℝ E - finrank ℝ EB`, and the charted total space is diffeomorphic to `P` by
`⟨b, p⟩ ↦ p`. The diffeomorphism forces the total-space topology to be that of `P`. -/
theorem exists_contMDiffFiberBundle_of_isProperMap
    {E EB H HB P B : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [NormedAddCommGroup EB] [NormedSpace ℝ EB] [FiniteDimensional ℝ EB]
    [TopologicalSpace H] [TopologicalSpace HB]
    (I : ModelWithCorners ℝ E H) (IB : ModelWithCorners ℝ EB HB)
    [I.Boundaryless] [IB.Boundaryless]
    [TopologicalSpace P] [ChartedSpace H P] [IsManifold I ∞ P]
    [T2Space P] [SecondCountableTopology P]
    [TopologicalSpace B] [ChartedSpace HB B] [IsManifold IB ∞ B]
    [T2Space B] [SecondCountableTopology B] [ConnectedSpace B]
    (π : P → B) (hπ : Manifold.IsSubmersion I IB ∞ π) (hproper : IsProperMap π)
    (hsurj : Function.Surjective π) (b₀ : B) :
    ∃ (_ : ChartedSpace (Fin (Module.finrank ℝ E - Module.finrank ℝ EB) → ℝ)
          {p : P // π p = b₀})
      (_ : TopologicalSpace
          (Bundle.TotalSpace {p : P // π p = b₀} fun b : B => {p : P // π p = b}))
      (_ : FiberBundle {p : P // π p = b₀} fun b : B => {p : P // π p = b}),
      IsManifold 𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EB) → ℝ) ∞
          {p : P // π p = b₀} ∧
        TauCeti.ContMDiffFiberBundle ∞ {p : P // π p = b₀} (fun b : B => {p : P // π p = b}) IB
          𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EB) → ℝ) ∧
        ∃ φ : Diffeomorph (IB.prod 𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EB) → ℝ)) I
            (TauCeti.ManifoldTotalSpace {p : P // π p = b₀} fun b : B => {p : P // π p = b})
            P ∞,
          ∀ x, φ x = ((TauCeti.ManifoldTotalSpace.homeomorph _ _).symm x).2.1 := by
  sorry

/-! ## Layer 6: Smooth good covers and Čech coordinates -/

section SmoothGoodCovers

variable {E H M ι : Type} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  [TopologicalSpace M] [ChartedSpace H M]

/-- A smooth good cover (B6.0): a locally finite open cover such that every nonempty finite
intersection `W` carries a chosen centre and a smooth homotopy `ℝ × W → W` from the constant map
at the centre (time `0`) to the identity (time `1`) fixing the centre. -/
structure SmoothGoodCover where
  /-- The index type of the cover. -/
  Index : Type
  /-- The cover members. -/
  openSet : Index → TopologicalSpace.Opens M
  covers : ∀ x : M, ∃ i, x ∈ openSet i
  locallyFinite : LocallyFinite (fun i => (openSet i : Set M))
  /-- The chosen centre of a nonempty finite intersection. -/
  centre : ∀ (s : Finset Index), s.Nonempty →
    (Set.Nonempty ((s.inf openSet : TopologicalSpace.Opens M) : Set M)) →
      ↥(s.inf openSet)
  /-- The chosen smooth contraction of a nonempty finite intersection. -/
  contract : ∀ (s : Finset Index) (_hs : s.Nonempty)
    (_hW : Set.Nonempty ((s.inf openSet : TopologicalSpace.Opens M) : Set M)),
      ℝ × ↥(s.inf openSet) → ↥(s.inf openSet)
  smooth : ∀ s hs hW, ContMDiff ((𝓘(ℝ, ℝ)).prod I) I ∞ (contract s hs hW)
  at_zero : ∀ s hs hW x, contract s hs hW (0, x) = centre s hs hW
  at_one : ∀ s hs hW x, contract s hs hW (1, x) = x
  fixes_centre : ∀ s hs hW t,
    contract s hs hW (t, centre s hs hW) = centre s hs hW

/-- Existence of smooth good covers refining a given open cover (B6.0). The route uses strongly convex neighbourhoods of a chosen
Riemannian metric and contracts each finite intersection along minimizing geodesics. -/
theorem exists_smoothGoodCover_refining [IsManifold I ∞ M] [FiniteDimensional ℝ E] [T2Space M]
    [SecondCountableTopology M] [I.Boundaryless]
    (U : ι → TopologicalSpace.Opens M) (hU : ∀ x : M, ∃ i, x ∈ U i) :
    ∃ C : SmoothGoodCover I (M := M), ∀ a, ∃ i, C.openSet a ≤ U i := by
  sorry

/-- On a compact manifold every open cover has a finite smooth good refinement (B6.0). -/
theorem exists_finite_smoothGoodCover_refining [IsManifold I ∞ M] [FiniteDimensional ℝ E]
    [T2Space M] [CompactSpace M] [I.Boundaryless]
    (U : ι → TopologicalSpace.Opens M) (hU : ∀ x : M, ∃ i, x ∈ U i) :
    ∃ C : SmoothGoodCover I (M := M), Finite C.Index ∧ ∀ a, ∃ i, C.openSet a ≤ U i := by
  sorry

/-- The open intersection indexed by an ordered Čech tuple, repetitions allowed. -/
noncomputable def cechIntersection (C : SmoothGoodCover I (M := M)) {p : ℕ}
    (i : Fin (p + 1) → C.Index) : TopologicalSpace.Opens M := by
  classical
  exact (Finset.univ.image i).inf C.openSet

/-- The locally constant real sheaf: Mathlib's constant sheaf with value `ℝ` on the site of
opens. Its sections on `∅` are zero, unlike those of the constant presheaf. -/
noncomputable def locallyConstantRealSheaf :
    TopCat.Sheaf (ModuleCat ℝ) (TopCat.of M) :=
  (CategoryTheory.constantSheaf (Opens.grothendieckTopology (TopCat.of M)) (ModuleCat ℝ)).obj
    (ModuleCat.of ℝ ℝ)

/-- The constant section on the factor of Mathlib's native Čech complex
`CategoryTheory.cechComplexFunctor` indexed by the tuple `i`: the unit of
`CategoryTheory.constantSheafAdj` at `ℝ`, followed by restriction from the whole space to the
categorical product of the cover members `C.openSet (i j)`. -/
noncomputable def cechTupleConstantSection (C : SmoothGoodCover I (M := M)) {p : ℕ}
    (i : Fin (p + 1) → C.Index) :
    ModuleCat.of ℝ ℝ ⟶ (locallyConstantRealSheaf (M := M)).presheaf.obj
      (Opposite.op (∏ᶜ fun j : Fin (p + 1) => C.openSet (i j))) :=
  (CategoryTheory.constantSheafAdj
      (Opens.grothendieckTopology (TopCat.of M)) (ModuleCat ℝ)
      (CategoryTheory.Limits.isTerminalTop : CategoryTheory.Limits.IsTerminal
        (⊤ : TopologicalSpace.Opens M))).unit.app (ModuleCat.of ℝ ℝ) ≫
    (locallyConstantRealSheaf (M := M)).presheaf.map
      ((CategoryTheory.Limits.isTerminalTop : CategoryTheory.Limits.IsTerminal
        (⊤ : TopologicalSpace.Opens M)).from (∏ᶜ fun j : Fin (p + 1) => C.openSet (i j))).op

/-- Čech coordinates on a good cover (B6.1): the constant section is a bijection from `ℝ` onto the
sections of the locally constant real sheaf over the tuple intersection exactly when that
intersection is nonempty. A nonempty intersection is contractible, hence connected, so its locally
constant sections are constants; the empty intersection carries only the zero section. Since the
native Čech differential is the alternating sum of restrictions and the unit commutes with
restriction, this identifies the native complex degreewise with real cochains supported on the
nonempty intersections, with the differential `δc(i) = Σ_j (-1)^j c(i ∘ j.succAbove)` on nonempty
target intersections. -/
theorem cechTupleConstantSection_bijective_iff (C : SmoothGoodCover I (M := M)) {p : ℕ}
    (i : Fin (p + 1) → C.Index) :
    Function.Bijective (cechTupleConstantSection I C i).hom ↔
      (cechIntersection I C i : Set M).Nonempty := by
  sorry

/-- Acyclicity of the sheaf of smooth real functions (B6.1): on a finite-dimensional Hausdorff
second-countable smooth manifold, Mathlib's sheaf cohomology `Sheaf.H` of the native sheaf
`smoothSheafAddCommGroup` of smooth `ℝ`-valued functions vanishes in every positive degree.
`Sheaf.H` is an `Ext` group in the sheaf category. The route is that this sheaf is soft (a smooth
function near a closed set agrees there with a global one, by smooth bump functions), and that a
soft sheaf on a paracompact Hausdorff space has no higher `Sheaf.H`, by dimension shifting along
an embedding into an injective, hence flasque, sheaf (Demailly, Chapter IV, (4.12) and (4.15),
pp. 204–205). -/
theorem subsingleton_H_smoothSheafAddCommGroup [IsManifold I ∞ M] [FiniteDimensional ℝ E]
    [T2Space M] [SecondCountableTopology M] (n : ℕ) (hn : 0 < n) :
    Subsingleton ((smoothSheafAddCommGroup I 𝓘(ℝ, ℝ) M ℝ).H n) := by
  sorry

end SmoothGoodCovers

end TauCetiRoadmap.SmoothBundlesConnections

