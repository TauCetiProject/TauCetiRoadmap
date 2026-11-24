/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.Geometry.Manifold.Foliation.Leaf

/-!
# Holonomy groupoids and C*-algebras of foliations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, each with `sorry`, the
headline theorems of Layer Fo1 and the pseudogroup facts behind Fo2.3 that are statable against
the pinned Mathlib and Tau Ceti, together with the definitions they need: leafwise paths of Tau
Ceti's `TauCeti.Foliation` (the curves of `TauCeti.Foliation.JoinedByTangentCurve`), transversals
as smooth embeddings complementary to the leaves, slidings of a leafwise path between two
transversals, whose endpoint germs (Mathlib's `Filter.Germ`) are the holonomy germs, the holonomy
pseudogroup of a transversal as a Mathlib `StructureGroupoid`, quasi-analyticity, and the flat
shift of Fo2.3 and Fo6.4.

Headline theorems of the README that are not statable at the pins, and the carrier each lacks:

* Fo1.1: foliation charts and good covers start from the flat charts of DifferentialGeometry 4.3
  (`Distribution.exists_flatChart`), which are not at the pin.
* Fo1.3: holonomy groups as homomorphisms on the fundamental group of a leaf need the manifold
  structure of leaves of DifferentialGeometry 4.4; `TauCeti.Foliation.leaf` is a subset of `M`.
* Fo2–Fo3: there is no topological or Lie groupoid carrier (LieGroupoidsPoisson §G0.0, §G0.2), no
  bibundle or Morita equivalence of Lie groupoids (§G3.5) and no integration `Σ(A)` (§G5.4).
* Fo4: there is no half-density bundle on a groupoid, no groupoid convolution algebra and no
  groupoid C*-algebra (OperatorAlgebraDynamics D5).
* Fo5: there are no imprimitivity bimodules with their compact operators (HilbertModules H3) and
  no Kasparov stabilization (HilbertModules H4).
* Fo6: the computations are statements about the algebras of Fo4–Fo5; the rotation algebra is
  NoncommutativeGeometry N6's.
* Fo7: the traces are those of TracesOnCStarAlgebras Tr1 on the algebras of Fo4–Fo5.

The leafwise paths here are single curves, `C¹` on `[0, 1]`; a concatenation of two of them is
again one after reparametrizing both to be constant near their ends (README, Conventions).
-/

@[expose] public section

noncomputable section

open Set Filter Topology
open scoped Manifold ContDiff

namespace TauCetiRoadmap.FoliationCStarAlgebras

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) ((∞ : ℕ∞ω) + 1) M]
  {p : ℕ} (F : TauCeti.Foliation 𝓘(ℝ, E) ∞ M p)

/-! ## Layer Fo1: holonomy -/

/-- A leafwise path of `F` (README, Conventions): a curve `C¹` on `[0, 1]` whose velocity within
`[0, 1]` lies in the tangent space of `F` throughout, as in
`TauCeti.Foliation.JoinedByTangentCurve`. -/
def IsLeafwisePath (γ : ℝ → M) : Prop :=
  ContMDiffOn 𝓘(ℝ, ℝ) 𝓘(ℝ, E) 1 γ (Icc 0 1) ∧
    ∀ t ∈ Icc (0 : ℝ) 1,
      TauCeti.Manifold.curveVelocityWithin 𝓘(ℝ, E) γ (Icc 0 1) t ∈ F.distribution (γ t)

/-- `ι` is a transversal of `F` (README, Conventions and Fo1.1): a smooth embedding of a manifold
`N` whose tangent spaces are complements of the tangent spaces of the leaves,
`T_{ι z} M = dι (T_z N) ⊕ F_{ι z}`. -/
structure IsTransversal (G : Type*) [NormedAddCommGroup G] [NormedSpace ℝ G] {N : Type*}
    [TopologicalSpace N] [ChartedSpace G N] (ι : N → M) : Prop where
  isSmoothEmbedding : Manifold.IsSmoothEmbedding 𝓘(ℝ, G) 𝓘(ℝ, E) ∞ ι
  isCompl : ∀ z : N,
    IsCompl (LinearMap.range (mfderiv 𝓘(ℝ, G) 𝓘(ℝ, E) ι z).toLinearMap) (F.distribution (ι z))

/-- A sliding of the leafwise path `γ` from the transversal `ι₀` to the transversal `ι₁` over `U`
(README, Fo1.2): `U` is an open neighbourhood of `z₀`, and `Γ` is a family of leafwise paths,
continuous on `U × [0, 1]`, with `Γ z` running from `ι₀ z` to `ι₁ (h z)` and `Γ z₀ = γ` on
`[0, 1]`. The germ of `h` at `z₀` is the holonomy germ of `γ`. -/
structure IsSliding {N₀ N₁ : Type*} [TopologicalSpace N₀] (ι₀ : N₀ → M) (ι₁ : N₁ → M)
    (γ : ℝ → M) (z₀ : N₀) (U : Set N₀) (Γ : N₀ → ℝ → M) (h : N₀ → N₁) : Prop where
  isOpen : IsOpen U
  mem : z₀ ∈ U
  continuousOn : ContinuousOn (fun w : N₀ × ℝ ↦ Γ w.1 w.2) (U ×ˢ Icc 0 1)
  isLeafwisePath : ∀ z ∈ U, IsLeafwisePath F (Γ z)
  apply_zero : ∀ z ∈ U, Γ z 0 = ι₀ z
  apply_one : ∀ z ∈ U, Γ z 1 = ι₁ (h z)
  eqOn : EqOn (Γ z₀) γ (Icc 0 1)

variable [FiniteDimensional ℝ E] [T2Space M] [SecondCountableTopology M]
  {G₀ G₁ : Type*} [NormedAddCommGroup G₀] [NormedSpace ℝ G₀] [NormedAddCommGroup G₁]
  [NormedSpace ℝ G₁] {N₀ N₁ : Type*} [TopologicalSpace N₀] [ChartedSpace G₀ N₀]
  [TopologicalSpace N₁] [ChartedSpace G₁ N₁]

/-- **Holonomy germs exist** (README, Fo1.2; Kordyukov, p. 8): a leafwise path between two
transversals has a sliding, with a smooth endpoint map. -/
theorem exists_isSliding [IsManifold 𝓘(ℝ, G₀) ∞ N₀] [IsManifold 𝓘(ℝ, G₁) ∞ N₁]
    {ι₀ : N₀ → M} {ι₁ : N₁ → M} (hι₀ : IsTransversal F G₀ ι₀) (hι₁ : IsTransversal F G₁ ι₁)
    {γ : ℝ → M} (hγ : IsLeafwisePath F γ) {z₀ : N₀} {z₁ : N₁} (h₀ : γ 0 = ι₀ z₀)
    (h₁ : γ 1 = ι₁ z₁) :
    ∃ (U : Set N₀) (Γ : N₀ → ℝ → M) (h : N₀ → N₁),
      IsSliding F ι₀ ι₁ γ z₀ U Γ h ∧ h z₀ = z₁ ∧ ContMDiffOn 𝓘(ℝ, G₀) 𝓘(ℝ, G₁) ∞ h U := by
  sorry

/-- **Holonomy germs are unique** (README, Fo1.2): the endpoint maps of two slidings of the same
leafwise path have the same germ. -/
theorem germ_eq_of_isSliding {ι₀ : N₀ → M} {ι₁ : N₁ → M} (hι₁ : IsTransversal F G₁ ι₁)
    {γ : ℝ → M} {z₀ : N₀} {U U' : Set N₀} {Γ Γ' : N₀ → ℝ → M} {h h' : N₀ → N₁}
    (hs : IsSliding F ι₀ ι₁ γ z₀ U Γ h) (hs' : IsSliding F ι₀ ι₁ γ z₀ U' Γ' h') :
    (h : Germ (𝓝 z₀) N₁) = h' := by
  sorry

/-- **Leafwise homotopy invariance** (README, Fo1.2; Kordyukov, p. 8): leafwise paths joined by a
homotopy through leafwise paths with fixed ends have the same holonomy germ. -/
theorem germ_eq_of_homotopy {ι₀ : N₀ → M} {ι₁ : N₁ → M} (hι₁ : IsTransversal F G₁ ι₁)
    {H : ℝ → ℝ → M} (hH : ContinuousOn (fun w : ℝ × ℝ ↦ H w.1 w.2) (Icc 0 1 ×ˢ Icc 0 1))
    (hleaf : ∀ s ∈ Icc (0 : ℝ) 1, IsLeafwisePath F (H s))
    (hstart : ∀ s ∈ Icc (0 : ℝ) 1, H s 0 = H 0 0) (hend : ∀ s ∈ Icc (0 : ℝ) 1, H s 1 = H 0 1)
    {z₀ : N₀} {U U' : Set N₀} {Γ Γ' : N₀ → ℝ → M} {h h' : N₀ → N₁}
    (hs : IsSliding F ι₀ ι₁ (H 0) z₀ U Γ h) (hs' : IsSliding F ι₀ ι₁ (H 1) z₀ U' Γ' h') :
    (h : Germ (𝓝 z₀) N₁) = h' := by
  sorry

/-- The members of the holonomy pseudogroup of the transversal `ι` (README, Fo1.3; Kordyukov,
Definition 2.18, p. 10): the open partial homeomorphisms `e` of `N` that are, near every point of
their source, the endpoint map of a sliding of a leafwise path from `ι` to itself. -/
def holonomyMembers {N : Type*} [TopologicalSpace N] (ι : N → M) :
    Set (OpenPartialHomeomorph N N) :=
  {e | ∀ z ∈ e.source, ∃ (γ : ℝ → M) (U : Set N) (Γ : N → ℝ → M),
    U ⊆ e.source ∧ IsSliding F ι ι γ z U Γ e}

/-- **The holonomy pseudogroup** (README, Fo1.3): the holonomy members of a transversal are the
members of a structure groupoid. -/
theorem exists_structureGroupoid_holonomyMembers {G : Type*} [NormedAddCommGroup G]
    [NormedSpace ℝ G] {N : Type*} [TopologicalSpace N] [ChartedSpace G N]
    [IsManifold 𝓘(ℝ, G) ∞ N] {ι : N → M} (hι : IsTransversal F G ι) :
    ∃ P : StructureGroupoid N, P.members = holonomyMembers F ι := by
  sorry

/-! ## Layer Fo2: quasi-analyticity and the flat shift -/

/-- A set of open partial homeomorphisms is quasi-analytic at `x` (README, Conventions and Fo2.3):
each member that is the identity on an open subset `U` of its source with `x` in the closure of
`U` is the identity near `x`. -/
def IsQuasiAnalyticAt {X : Type*} [TopologicalSpace X] (S : Set (OpenPartialHomeomorph X X))
    (x : X) : Prop :=
  ∀ e ∈ S, x ∈ e.source → ∀ U : Set X, IsOpen U → U ⊆ e.source → x ∈ closure U →
    EqOn e id U → ∀ᶠ y in 𝓝 x, e y = y

/-- **Analytic holonomy is quasi-analytic** (README, Fo2.3): a set of open partial homeomorphisms
of a real normed space that are analytic on their sources is quasi-analytic at every point; by
Winkelnkemper's criterion, foliations with such holonomy have Hausdorff holonomy groupoids. -/
theorem isQuasiAnalyticAt_of_analyticOnNhd {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
    {S : Set (OpenPartialHomeomorph V V)} (hS : ∀ e ∈ S, AnalyticOnNhd ℝ e e.source) (x : V) :
    IsQuasiAnalyticAt S x := by
  sorry

/-- The flat shift (README, Fo2.3 and Fo6.4): the identity on `(-∞, 0]` and `u ↦ u + exp (-1/u)`
on `(0, ∞)`. -/
def flatShift (u : ℝ) : ℝ := u + expNegInvGlue u

/-- The flat shift is smooth (README, Fo2.3). -/
theorem contDiff_flatShift : ContDiff ℝ ∞ flatShift := by
  sorry

/-- The flat shift is strictly increasing (README, Fo2.3). -/
theorem strictMono_flatShift : StrictMono flatShift := by
  sorry

/-- The flat shift is surjective (README, Fo2.3). -/
theorem surjective_flatShift : Function.Surjective flatShift := by
  sorry

/-- The germ of the flat shift at every negative point is the identity germ (README, Fo2.3). -/
theorem germ_flatShift_eq_id_of_neg {u : ℝ} (hu : u < 0) :
    (flatShift : Germ (𝓝 u) ℝ) = (id : ℝ → ℝ) := by
  sorry

/-- The germ of the flat shift at `0` is not the identity germ (README, Fo2.3). -/
theorem germ_flatShift_ne_id : (flatShift : Germ (𝓝 (0 : ℝ)) ℝ) ≠ (id : ℝ → ℝ) := by
  sorry

/-! ## A computed holonomy germ -/

/-- **Holonomy of the lines of slope `θ`** (README, Fo1.2, Checks): on `ℝ × ℝ` foliated by the
lines of slope `θ`, the leaf segment from `(0, v₀)` to `(1, v₀ + θ)` slides from the axis
`{0} × ℝ` to the line `{1} × ℝ` with endpoint map `v ↦ v + θ`. -/
theorem isSliding_slope (θ : ℝ) (hn : (1 : ℕ∞ω) ≤ ∞) (v₀ : ℝ) :
    IsSliding (TauCeti.Foliation.ofSubmodule (Submodule.span ℝ {((1 : ℝ), θ)}) hn)
      (fun v : ℝ ↦ ((0 : ℝ), v)) (fun v : ℝ ↦ ((1 : ℝ), v)) (fun t ↦ (t, v₀ + θ * t)) v₀ univ
      (fun v t ↦ (t, v + θ * t)) (fun v ↦ v + θ) := by
  sorry

end TauCetiRoadmap.FoliationCStarAlgebras
