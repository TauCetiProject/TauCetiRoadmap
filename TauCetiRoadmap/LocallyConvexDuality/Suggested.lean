module

public import Mathlib

/-!
# Locally convex duality: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib, each with `sorry`,
together with the few definitions their statements need. The API of each definition and the Checks
stay in the README.

Every carrier is Mathlib's: a topological `𝕜`-vector space `E` over `[RCLike 𝕜]` with
`[IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]`, local convexity as `PolynormableSpace 𝕜 E`,
von Neumann boundedness `Bornology.IsVonNBounded`, Mathlib's `BarrelledSpace`, the strong dual
`StrongDual 𝕜 E` with its topology of uniform convergence on bounded sets, `WeakDual`, `WeakBilin`
and `UniformOnFun`.

Headline theorems stated here:

* README 0.1, `barrelledSpace_iff`: Mathlib's `BarrelledSpace` (lower semicontinuous seminorms are
  continuous) is Bourbaki's definition (every barrel is a neighbourhood of `0`).
* README 1.2, `bornologicalSpace_of_firstCountableTopology`: a metrizable space is bornological.
* README 1.3, `bornologicalSpace_iff_continuous`: Mackey's characterisation, a space is bornological
  iff every bounded linear map to a locally convex space is continuous.
* README 1.4, `barrelledSpace_of_bornologicalSpace`: a complete bornological locally convex space is
  barrelled.
* README 2.2, `mackey_arens`: the topologies compatible with a pairing are those between the weak
  and the Mackey topology.
* README 2.3, `mackeyTopology_eq_of_barrelledSpace` and `mackeyTopology_eq_of_bornologicalSpace`:
  barrelled and bornological locally convex spaces carry their Mackey topology.
* README 3.1, `completeSpace_iff`: Grothendieck's completeness theorem.
* README 3.2, `completeSpace_strongDual`: the strong dual of a bornological space is complete.
* README 4.2, `dfSpace_strongDual`: the strong dual of a Fréchet space is a (DF)-space.
* README 4.3, `DFSpace.continuous_of_continuousOn`: on a (DF)-space, a linear map continuous on
  bounded sets is continuous.
* README 4.4, `DFSpace.completeSpace_strongDual` and `DFSpace.firstCountableTopology_strongDual`:
  the strong dual of a (DF)-space is complete and metrizable.

Not stated here: README 5.1–5.4, the injective tensor product, nuclear spaces and Grothendieck's
characterisation of nuclearity by `E ⊗̂π F = E ⊗̂ε F`, lacking NoncommutativeGeometry N1's
completed projective tensor product of locally convex spaces and BanachSpaceTheory B4's nuclear
operators between Banach spaces. README 0.2, 0.3, 1.5, 2.4, 3.3, 3.4 and 4.5 are not headlines and
are kept in the README.
-/

public section

namespace TauCetiRoadmap.LocallyConvexDuality

open Bornology Filter Topology
open scoped ComplexOrder

universe u

variable {𝕜 : Type*} [RCLike 𝕜]

/-! ## Layer 0: barrels and barrelled spaces -/

section Barrel

variable {E : Type*} [AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E]

variable (𝕜) in
/-- A barrel: a closed, absolutely convex, absorbent subset (Bourbaki 1950, §2, p. 6). -/
def IsBarrel (T : Set E) : Prop :=
  IsClosed T ∧ AbsConvex 𝕜 T ∧ Absorbent 𝕜 T

/-- **Barrelled spaces** (README 0.1). Mathlib's `BarrelledSpace`, in which every lower
semicontinuous seminorm is continuous, is Bourbaki's definition: every barrel is a neighbourhood
of `0` (Bourbaki 1950, §2, p. 6). -/
theorem barrelledSpace_iff [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E] :
    BarrelledSpace 𝕜 E ↔ ∀ T : Set E, IsBarrel 𝕜 T → T ∈ 𝓝 (0 : E) := by
  sorry

end Barrel

/-! ## Layer 1: bornological spaces -/

section Bornological

variable {E : Type u} [AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E]

variable (𝕜) in
/-- A bornivore: an absolutely convex subset absorbing every von Neumann bounded subset
(Bourbaki 1950, §4, p. 10). -/
def IsBornivore (A : Set E) : Prop :=
  AbsConvex 𝕜 A ∧ ∀ s : Set E, IsVonNBounded 𝕜 s → Absorbs 𝕜 A s

variable (𝕜 E) in
/-- A bornological space: every bornivore is a neighbourhood of `0` (Bourbaki 1950, §4,
p. 10). -/
class BornologicalSpace : Prop where
  /-- Every bornivore is a neighbourhood of `0`. -/
  mem_nhds_zero : ∀ A : Set E, IsBornivore 𝕜 A → A ∈ 𝓝 (0 : E)

/-- **Metrizable spaces are bornological** (README 1.2; Mackey 1946, Theorem 10, p. 527, quoted
in Bourbaki 1950, §4, p. 11). -/
theorem bornologicalSpace_of_firstCountableTopology [IsTopologicalAddGroup E]
    [ContinuousSMul 𝕜 E] [FirstCountableTopology E] : BornologicalSpace 𝕜 E := by
  sorry

/-- **Mackey's characterisation** (README 1.3; Bourbaki 1950, §4, Théorème 3, p. 11): `E` is
bornological iff every linear map from `E` to a locally convex space that sends bounded sets to
bounded sets is continuous. The target ranges over the universe of `E`, which contains `E` with
the topology of its bornivores. -/
theorem bornologicalSpace_iff_continuous [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E] :
    BornologicalSpace 𝕜 E ↔
      ∀ (F : Type u) [AddCommGroup F] [Module 𝕜 F] [TopologicalSpace F]
        [IsTopologicalAddGroup F] [ContinuousSMul 𝕜 F] [PolynormableSpace 𝕜 F]
        (f : E →ₗ[𝕜] F), (∀ s : Set E, IsVonNBounded 𝕜 s → IsVonNBounded 𝕜 (f '' s)) →
          Continuous f := by
  sorry

/-- **Complete bornological spaces are barrelled** (README 1.4; Bourbaki 1950, §3, Théorème 2,
p. 8, and §4, p. 11). -/
theorem barrelledSpace_of_bornologicalSpace {E : Type*} [AddCommGroup E] [Module 𝕜 E]
    [UniformSpace E] [IsUniformAddGroup E] [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E]
    [T2Space E] [CompleteSpace E] [BornologicalSpace 𝕜 E] : BarrelledSpace 𝕜 E := by
  sorry

end Bornological

/-! ## Layer 2: dual pairs and the Mackey topology -/

section Mackey

variable {E F : Type*} [AddCommGroup E] [Module 𝕜 E] [AddCommGroup F] [Module 𝕜 F]

/-- The weak topology `σ(E, F)` of a pairing `B`, as a topology on `E`: the coarsest making every
`x ↦ B x y` continuous. -/
@[instance_reducible]
def weakTopology (B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜) : TopologicalSpace E :=
  TopologicalSpace.induced (fun x y => B x y) Pi.topologicalSpace

/-- The absolutely convex subsets of `F` that are compact for `σ(F, E)`. -/
def mackeyFamily (B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜) : Set (Set F) :=
  {K | AbsConvex 𝕜 K ∧ IsCompact (X := WeakBilin B.flip) K}

/-- The Mackey topology `τ(E, F)`: uniform convergence on the absolutely convex `σ(F, E)`-compact
subsets of `F` (Dieudonné–Schwartz 1949, §2, pp. 64–65). -/
@[instance_reducible]
def mackeyTopology (B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜) : TopologicalSpace E :=
  TopologicalSpace.induced (fun x => UniformOnFun.ofFun (mackeyFamily B) (fun y => B x y))
    inferInstance

/-- **The Mackey–Arens theorem** (README 2.2; Dieudonné–Schwartz 1949, §2, pp. 64–65; Mackey 1946;
Arens 1947). A locally convex topology on `E` has exactly the functionals `B · y` as continuous
linear forms iff it lies between `σ(E, F)` and `τ(E, F)`. In Lean's order a finer topology is
smaller. -/
theorem mackey_arens [TopologicalSpace E] [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]
    [PolynormableSpace 𝕜 E] (B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜) :
    (∀ f : E →ₗ[𝕜] 𝕜, Continuous f ↔ f ∈ Set.range B.flip) ↔
      mackeyTopology B ≤ ‹TopologicalSpace E› ∧ ‹TopologicalSpace E› ≤ weakTopology B := by
  sorry

/-- **Barrelled spaces carry the Mackey topology** (README 2.3; Bourbaki 1950, §2,
Proposition 2, p. 7). -/
theorem mackeyTopology_eq_of_barrelledSpace [TopologicalSpace E] [IsTopologicalAddGroup E]
    [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E] [BarrelledSpace 𝕜 E] :
    mackeyTopology (topDualPairing 𝕜 E).flip = ‹TopologicalSpace E› := by
  sorry

/-- **Bornological spaces carry the Mackey topology** (README 2.3; Bourbaki 1950, §4,
Proposition 5, p. 10). -/
theorem mackeyTopology_eq_of_bornologicalSpace [TopologicalSpace E] [IsTopologicalAddGroup E]
    [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E] [BornologicalSpace 𝕜 E] :
    mackeyTopology (topDualPairing 𝕜 E).flip = ‹TopologicalSpace E› := by
  sorry

end Mackey

/-! ## Layer 3: completeness and the strong dual -/

section Completeness

variable {E : Type*} [AddCommGroup E] [Module 𝕜 E]

/-- **Grothendieck's completeness theorem** (README 3.1; Grothendieck 1950). A separated locally
convex space is complete iff every linear form on its dual that is weakly continuous on each
equicontinuous subset is the evaluation at a point. -/
theorem completeSpace_iff [UniformSpace E] [IsUniformAddGroup E] [ContinuousSMul 𝕜 E]
    [PolynormableSpace 𝕜 E] [T2Space E] :
    CompleteSpace E ↔ ∀ f : Module.Dual 𝕜 (StrongDual 𝕜 E),
      (∀ A : Set (StrongDual 𝕜 E), Equicontinuous (fun a : A => ((a : StrongDual 𝕜 E) : E → 𝕜)) →
        ContinuousOn (fun φ : WeakDual 𝕜 E => f φ.toStrongDual) (StrongDual.toWeakDual '' A)) →
      ∃ x : E, ∀ φ : StrongDual 𝕜 E, f φ = φ x := by
  sorry

/-- **The strong dual of a bornological space is complete** (README 3.2; Bourbaki 1950, §4,
corollary of Théorème 3, pp. 11–12). -/
theorem completeSpace_strongDual [TopologicalSpace E] [IsTopologicalAddGroup E]
    [ContinuousSMul 𝕜 E] [BornologicalSpace 𝕜 E] : CompleteSpace (StrongDual 𝕜 E) := by
  sorry

end Completeness

/-! ## Layer 4: (DF)-spaces -/

section DF

variable {E : Type*} [AddCommGroup E] [Module 𝕜 E]

variable (𝕜 E) in
/-- A (DF)-space (Grothendieck 1954): `E` has a fundamental sequence of bounded sets, and every
countable intersection of closed absolutely convex neighbourhoods of `0` that absorbs every bounded
set is a neighbourhood of `0`. -/
class DFSpace [TopologicalSpace E] : Prop where
  /-- A fundamental sequence of bounded sets. -/
  exists_fundamental : ∃ B : ℕ → Set E, (∀ n, IsVonNBounded 𝕜 (B n)) ∧
    ∀ s : Set E, IsVonNBounded 𝕜 s → ∃ n, s ⊆ B n
  /-- Countable bornivorous intersections of closed absolutely convex neighbourhoods. -/
  iInter_mem_nhds : ∀ U : ℕ → Set E,
    (∀ n, U n ∈ 𝓝 (0 : E) ∧ AbsConvex 𝕜 (U n) ∧ IsClosed (U n)) →
    (∀ s : Set E, IsVonNBounded 𝕜 s → Absorbs 𝕜 (⋂ n, U n) s) → (⋂ n, U n) ∈ 𝓝 (0 : E)

/-- **The strong dual of a Fréchet space is a (DF)-space** (README 4.2; Grothendieck 1954). -/
theorem dfSpace_strongDual [UniformSpace E] [IsUniformAddGroup E] [ContinuousSMul 𝕜 E]
    [PolynormableSpace 𝕜 E] [T2Space E] [CompleteSpace E] [FirstCountableTopology E] :
    DFSpace 𝕜 (StrongDual 𝕜 E) := by
  sorry

/-- **Continuity on bounded sets** (README 4.3; Grothendieck 1954): a linear map from a separated
locally convex (DF)-space to a locally convex space is continuous as soon as its restriction to
every bounded set is. -/
theorem DFSpace.continuous_of_continuousOn [TopologicalSpace E] [IsTopologicalAddGroup E]
    [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E] [T2Space E] [DFSpace 𝕜 E]
    {G : Type*} [AddCommGroup G] [Module 𝕜 G] [TopologicalSpace G] [IsTopologicalAddGroup G]
    [ContinuousSMul 𝕜 G] [PolynormableSpace 𝕜 G] (f : E →ₗ[𝕜] G)
    (hf : ∀ s : Set E, IsVonNBounded 𝕜 s → ContinuousOn f s) : Continuous f := by
  sorry

/-- **The strong dual of a (DF)-space is complete** (README 4.4; Grothendieck 1954). -/
theorem DFSpace.completeSpace_strongDual [TopologicalSpace E] [IsTopologicalAddGroup E]
    [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E] [T2Space E] [DFSpace 𝕜 E] :
    CompleteSpace (StrongDual 𝕜 E) := by
  sorry

/-- **The strong dual of a (DF)-space is metrizable** (README 4.4): the polars of a fundamental
sequence of bounded sets form a countable basis of neighbourhoods of `0`. -/
theorem DFSpace.firstCountableTopology_strongDual [TopologicalSpace E] [IsTopologicalAddGroup E]
    [ContinuousSMul 𝕜 E] [DFSpace 𝕜 E] : FirstCountableTopology (StrongDual 𝕜 E) := by
  sorry

end DF

end TauCetiRoadmap.LocallyConvexDuality
