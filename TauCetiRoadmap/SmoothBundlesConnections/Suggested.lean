/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Smooth principal bundles, connections, and holonomy: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the few definitions on native carriers that those statements need.

Stated here (B1.0, B1.4 and B6.0–B6.1):

* a regular fibre of a smooth map between finite-dimensional boundaryless real manifolds
  admits a smooth atlas with smooth embedding into the source and tangent image equal to the
  derivative kernel, without any Hausdorff hypothesis;
* the orbit space of a free proper smooth Lie-group action admits a smooth atlas for its
  quotient topology, of dimension `dim M - dim G`, making the projection a submersion;
* every open cover of a finite-dimensional Hausdorff second-countable boundaryless smooth
  manifold has a locally finite refinement by a smooth good cover, finite when the manifold is
  compact;
* on a smooth good cover, each factor of Mathlib's native Čech complex of the locally constant
  real sheaf is a copy of `ℝ`, through the constant section given by the unit of the native
  constant-sheaf adjunction, exactly when the tuple intersection is nonempty;
* the sheaf of smooth real functions on a finite-dimensional Hausdorff second-countable smooth
  manifold is acyclic: its sheaf cohomology `Sheaf.H` vanishes in every positive degree.

Headline theorems of the README that are not statable at the pins, with the missing carrier:

* Ehresmann's fibration theorem (B1.5): the regular-fibre atlas is quantified existentially below,
  but the smooth manifold-fibre bundle and its compatible local-trivialization carrier are
  constructions of B1.1 and B1.5; the pins' topological `FiberBundle` does not include those data.
* The principal-bundle consequence of the free proper quotient theorem and `G → G/H` as a
  principal bundle (B1.4): the pins have no smooth principal-bundle/local-trivialization carrier.
  The quotient atlas and submersion theorem itself is quantified existentially below.
* Connections, curvature, the Atiyah sequence, Ambrose–Singer and the holonomy reductions
  (B3–B5): the pins have no differential forms on manifolds and no exterior derivative on them
  (Mathlib's `extDeriv` acts on functions between normed spaces only).
* The reconstruction of a connection from smooth parallel transport (B5.1): it needs the thin
  path groupoid and the transport functor, which are definitions of this roadmap.
* The flat-bundle dictionary with representations of `π₁(M)` (B5.2): it needs flat connections,
  hence the same form carrier.
* The finite-rank Hilbert space `L²(E,h,μ)` of sections, its completeness and its isometry with
  `MeasureTheory.Lp` for the trivial bundle (B2): the pins have no normed or inner-product
  structure on measurable sections of a vector bundle; constructing it is a README target.
* The Čech–de Rham–singular comparison (B6.1): the pins lack the differential-form and de Rham
  cohomology carriers on manifolds, needed to state the normalized integration comparison.
* The classification of principal circle bundles by `H²(M;ℤ)`, the Hopf normalization, rank-one
  Chern–Weil and the flat ambiguity (B6.2–B6.6): the pins have no principal-bundle structure on
  bundle data and no first Chern class map into Tau Ceti's singular cohomology (an unnormalized
  bijection with `H²(M;ℤ)` would only compare cardinalities), no de Rham cohomology of manifolds,
  and the orbit manifold `ℂP¹ = S³/Circle` only through the existential atlas of the quotient
  theorem above, so the Hopf normalization has no fixed carrier to be stated on.
-/

namespace TauCetiRoadmap.SmoothBundlesConnections

open CategoryTheory
open scoped Manifold ContDiff

/-! ## Layer 1: Principal bundles and descent -/

/-- A regular fibre of a smooth map between finite-dimensional boundaryless real manifolds
admits a smooth atlas of dimension `finrank ℝ E - finrank ℝ F`. Its inclusion is a smooth
embedding, and its tangent image is the kernel of the derivative of the map. The fibre has
its subspace topology, may be empty, and needs no Hausdorff hypothesis (B1.0). -/
theorem exists_regularFiber_smoothEmbedding
    {E F H K X Y : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    [TopologicalSpace H] [TopologicalSpace K]
    (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ F K)
    [I.Boundaryless] [J.Boundaryless]
    [TopologicalSpace X] [ChartedSpace H X] [IsManifold I ∞ X]
    [TopologicalSpace Y] [ChartedSpace K Y] [IsManifold J ∞ Y]
    (f : X → Y) (c : Y) (hf : ContMDiff I J ∞ f)
    (hreg : ∀ x, f x = c → Function.Surjective (mfderiv I J f x)) :
    ∃ cs : ChartedSpace (Fin (Module.finrank ℝ E - Module.finrank ℝ F) → ℝ)
        {x : X // f x = c},
      letI := cs
      IsManifold 𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ F) → ℝ) ∞
        {x : X // f x = c} ∧
      Manifold.IsSmoothEmbedding
        𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ F) → ℝ) I ∞
        (Subtype.val : {x : X // f x = c} → X) ∧
      ∀ z : {x : X // f x = c},
        (mfderiv 𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ F) → ℝ) I
          Subtype.val z).range = (mfderiv I J f z.1).ker := by
  sorry

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
    ∃ cs : ChartedSpace (Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ)
        (MulAction.orbitRel.Quotient G M),
      letI := cs
      IsManifold 𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ) ∞
        (MulAction.orbitRel.Quotient G M) ∧
      Manifold.IsSubmersion I
        𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ) ∞
        (Quotient.mk'' : M → MulAction.orbitRel.Quotient G M) := by
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
`smoothSheafAddCommGroup` of smooth `ℝ`-valued functions vanishes in every positive degree. The
route is the fineness of this sheaf: smooth partitions of unity exist under these hypotheses. -/
theorem subsingleton_H_smoothSheafAddCommGroup [IsManifold I ∞ M] [FiniteDimensional ℝ E]
    [T2Space M] [SecondCountableTopology M] (n : ℕ) (hn : 0 < n) :
    Subsingleton ((smoothSheafAddCommGroup I 𝓘(ℝ, ℝ) M ℝ).H n) := by
  sorry

end SmoothGoodCovers

end TauCetiRoadmap.SmoothBundlesConnections

