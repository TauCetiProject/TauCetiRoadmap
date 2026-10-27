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

Stated here (B6.0–B6.1):

* every open cover of a finite-dimensional Hausdorff second-countable boundaryless smooth
  manifold has a locally finite refinement by a smooth good cover, finite when the manifold is
  compact;
* on a smooth good cover, each factor of Mathlib's native Čech complex of the locally constant
  real sheaf is a copy of `ℝ`, through the constant section given by the unit of the native
  constant-sheaf adjunction, exactly when the tuple intersection is nonempty.

Headline theorems of the README that are not statable at the pins, with the missing carrier:

* Ehresmann's fibration theorem (B1.5): the pins have no manifold structure on a regular fibre
  `π⁻¹(b₀)` of a submersion, so a smooth trivialization with that model fibre cannot be stated.
* The free proper quotient theorem and `G → G/H` as a principal bundle (B1.4): the pins have no
  smooth manifold structure on the orbit space of a free proper smooth action.
* Connections, curvature, the Atiyah sequence, Ambrose–Singer and the holonomy reductions
  (B3–B5): the pins have no differential forms on manifolds and no exterior derivative on them
  (Mathlib's `extDeriv` acts on functions between normed spaces only).
* The flat-bundle dictionary with representations of `π₁(M)` (B5): it needs flat connections,
  hence the same form carrier.
* The finite-rank Hilbert space `L²(E,h,μ)` of sections, its completeness and its isometry with
  `MeasureTheory.Lp` for the trivial bundle (B2): the pins have no normed or inner-product
  structure on measurable sections of a vector bundle; constructing it is a README target.
* The classification of principal circle bundles by `H²(M;ℤ)`, the Hopf normalization, rank-one
  Chern–Weil and the flat ambiguity (B6.2–B6.6): the pins have no principal-bundle structure on
  bundle data and no first Chern class map into Tau Ceti's singular cohomology (an unnormalized
  bijection with `H²(M;ℤ)` would only compare cardinalities), no smooth structure on `ℂP¹` and
  no de Rham cohomology of manifolds.
-/

namespace TauCetiRoadmap.SmoothBundlesConnections

open CategoryTheory
open scoped Manifold ContDiff

/-! ## B6: Smooth good covers and Čech coordinates -/

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

end SmoothGoodCovers

end TauCetiRoadmap.SmoothBundlesConnections

