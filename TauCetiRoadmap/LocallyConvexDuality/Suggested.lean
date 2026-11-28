module

public import Mathlib.Algebra.Algebra.Bilinear
public import Mathlib.Analysis.LocallyConvex.AbsConvex
public import Mathlib.Analysis.LocallyConvex.Barrelled
public import Mathlib.Analysis.LocallyConvex.Montel
public import Mathlib.Analysis.LocallyConvex.Polar
public import Mathlib.Analysis.LocallyConvex.WeakDual
public import Mathlib.Analysis.LocallyConvex.WithSeminorms
public import Mathlib.LinearAlgebra.DFinsupp
public import Mathlib.LinearAlgebra.Prod
public import Mathlib.LinearAlgebra.TensorProduct.Basic
public import Mathlib.Topology.Algebra.Module.Spaces.UniformConvergenceCLM
public import Mathlib.Topology.Algebra.Module.Spaces.WeakDual
public import Mathlib.Topology.GDelta.Basic

/-!
# Locally convex spaces, duality and inductive limits: suggested statements

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and each with `sorry`, the definitions the
README introduces and its headline theorems. The README's other targets (equivalent forms of a
definition, permanence properties, corollaries and Checks) are stated there in prose.

Names are the README's, without the namespace prefixes (`LinearMap.`, `WeakDual.`,
`UniformConvergenceCLM.`, `ContinuousLinearMap.`) that the README suggests for Tau Ceti.

Conventions (README, Conventions): `𝕜` is `ℝ` or `ℂ` (`[RCLike 𝕜]`, `open scoped ComplexOrder`); a
topological vector space is `[IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]`; locally convex is
Mathlib's `PolynormableSpace 𝕜 E`; bounded is `Bornology.IsVonNBounded 𝕜`; Hausdorffness is always
an explicit `[T2Space E]`. A Fréchet space is the bundle of hypotheses `[UniformSpace E]
[IsUniformAddGroup E] [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E] [CompleteSpace E] [T2Space E]
[(𝓤 E).IsCountablyGenerated]`; without `PolynormableSpace` it is an F-space.

Two points where this file differs in form from the README, with the same meaning:

* The README defines `IsFinalLocallyConvex` by equality with Tau Ceti's
  `TauCeti.finalLocallyConvexTopology`. That module is not in the Tau Ceti revision this
  repository pins, so the predicate is stated here by the equivalent seminorm criterion
  (`TauCeti.FinalLocallyConvexTopology.continuous_seminorm_iff`), for a locally convex target.
  For the same reason the locally convex direct sum topology is written out as an infimum.
* The injective tensor product of README §5.1 is stated as a topology on `E ⊗[𝕜] F`; the README
  asks for a type synonym and its completion.

Not stated here: README §5.2 (the nuclear spaces of AutomorphicSpectralTheory §0.11 and the
locally convex projective seminorms of NoncommutativeGeometry N1 are not available at the pin in
the form the statement needs), the acyclicity of the quotient sequence in README §6.5, and the
sections of the README that consist of permanence properties.
-/

set_option autoImplicit false

@[expose] public noncomputable section

namespace TauCetiRoadmap.LocallyConvexDuality

open Bornology Filter Topology Uniformity Set
open scoped ComplexOrder TensorProduct Pointwise

universe u

variable {𝕜 : Type*} [RCLike 𝕜]

/-! ## Layer 0: dual pairs and polar topologies -/

section Pairing

variable {E F : Type*} [AddCommGroup E] [Module 𝕜 E] [AddCommGroup F] [Module 𝕜 F]

/-- The weak topology `σ(E, F)` of a pairing, as a topology on `E` (README §0.1). -/
@[instance_reducible]
def weakTopology (B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜) : TopologicalSpace E :=
  WeakBilin.instTopologicalSpace B

/-- The polar topology of a pairing `B` and a family `𝔖` of subsets of `F`: uniform convergence on
the members of `𝔖` (README §0.2). -/
@[instance_reducible]
def polarTopology (B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜) (𝔖 : Set (Set F)) : TopologicalSpace E :=
  TopologicalSpace.induced (fun x => UniformOnFun.ofFun 𝔖 (fun y => B x y)) inferInstance

/-- A polar topology is a vector topology exactly when the members of the family are weakly
bounded (README §0.2). -/
theorem continuousSMul_polarTopology_iff (B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜) (𝔖 : Set (Set F)) :
    @ContinuousSMul 𝕜 E _ _ (polarTopology B 𝔖) ↔
      ∀ S ∈ 𝔖, ∀ x : E, BddAbove ((fun y => ‖B x y‖) '' S) := by
  sorry

/-- The polar topology of the finite sets is the weak topology (README §0.2). -/
theorem polarTopology_finite (B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜) :
    polarTopology B {S : Set F | S.Finite} = weakTopology B := by
  sorry

/-- **The bipolar theorem for a pairing** (README §0.1): the bipolar of `s` is the
`σ(E, F)`-closed absolutely convex hull of `insert 0 s`. -/
theorem flip_polar_polar (B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜) (s : Set E) :
    B.flip.polar (B.polar s) =
      @closure E (weakTopology B) (absConvexHull 𝕜 (insert (0 : E) s)) := by
  sorry

/-- The family of absolutely convex `σ(F, E)`-compact subsets of `F`. -/
def mackeyFamily (B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜) : Set (Set F) :=
  {K | AbsConvex 𝕜 K ∧ IsCompact (X := WeakBilin B.flip) K}

/-- The Mackey topology `τ(E, F)` (README §0.5). -/
@[instance_reducible]
def mackeyTopology (B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜) : TopologicalSpace E :=
  polarTopology B (mackeyFamily B)

/-- **The Mackey–Arens theorem** (README §0.5). A locally convex vector topology on `E` has exactly
the functionals `B · y` as continuous linear functionals if and only if it lies between the weak
and the Mackey topology. In Lean's order a finer topology is smaller. -/
theorem mackey_arens [TopologicalSpace E] [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]
    [PolynormableSpace 𝕜 E] (B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜) :
    (∀ f : E →ₗ[𝕜] 𝕜, Continuous f ↔ f ∈ Set.range B.flip) ↔
      mackeyTopology B ≤ ‹TopologicalSpace E› ∧ ‹TopologicalSpace E› ≤ weakTopology B := by
  sorry

end Pairing

section AlaogluMackey

/-- **The Alaoglu–Bourbaki theorem** (README §0.3): the polar of a neighbourhood of zero is
weak-star compact. No local convexity or norm is assumed. -/
theorem isCompact_polar_of_mem_nhds {𝕜 E : Type*} [NontriviallyNormedField 𝕜] [ProperSpace 𝕜]
    [AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E] [IsTopologicalAddGroup E]
    [ContinuousSMul 𝕜 E] {U : Set E} (hU : U ∈ 𝓝 (0 : E)) :
    IsCompact (StrongDual.toWeakDual '' StrongDual.polar 𝕜 U : Set (WeakDual 𝕜 E)) := by
  sorry

variable {E : Type*} [AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E]

/-- **Mackey's theorem** (README §0.4): in a locally convex space a set is bounded if and only if
every continuous linear functional is bounded on it. -/
theorem isVonNBounded_iff_forall_strongDual [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]
    [PolynormableSpace 𝕜 E] {s : Set E} :
    IsVonNBounded 𝕜 s ↔ ∀ f : StrongDual 𝕜 E, BddAbove ((fun x => ‖f x‖) '' s) := by
  sorry

end AlaogluMackey

/-! ## Layer 1: barrelled, quasi-barrelled, bornological and ultrabornological spaces -/

section Classes

variable {E : Type u} [AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E]

variable (𝕜) in
/-- A barrel: a closed, absolutely convex, absorbent set (README §1.1). -/
structure IsBarrel (T : Set E) : Prop where
  isClosed : IsClosed T
  absConvex : AbsConvex 𝕜 T
  absorbent : Absorbent 𝕜 T

/-- **Barrelled spaces** (README §1.1): Mathlib's `BarrelledSpace` is the condition that every
barrel is a neighbourhood of zero. -/
theorem barrelledSpace_iff_isBarrel [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E] :
    BarrelledSpace 𝕜 E ↔ ∀ T : Set E, IsBarrel 𝕜 T → T ∈ 𝓝 (0 : E) := by
  sorry

variable (𝕜 E) in
/-- A quasi-barrelled space: every lower semicontinuous seminorm that is bounded on bounded sets
is continuous (README §1.2). -/
class QuasiBarrelledSpace : Prop where
  continuous_of_lowerSemicontinuous : ∀ p : Seminorm 𝕜 E, LowerSemicontinuous p →
    (∀ s : Set E, IsVonNBounded 𝕜 s → BddAbove (p '' s)) → Continuous p

variable (𝕜 E) in
/-- A bornological space: every seminorm that is bounded on bounded sets is continuous
(README §1.3). -/
class BornologicalSpace : Prop where
  continuous_of_bddAbove : ∀ p : Seminorm 𝕜 E,
    (∀ s : Set E, IsVonNBounded 𝕜 s → BddAbove (p '' s)) → Continuous p

/-- The textbook form of bornological spaces (README §1.3): every absolutely convex set that
absorbs every bounded set is a neighbourhood of zero. -/
theorem bornologicalSpace_iff_absorbs [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]
    [PolynormableSpace 𝕜 E] :
    BornologicalSpace 𝕜 E ↔ ∀ A : Set E, AbsConvex 𝕜 A →
      (∀ s : Set E, IsVonNBounded 𝕜 s → Absorbs 𝕜 A s) → A ∈ 𝓝 (0 : E) := by
  sorry

/-- A first countable topological vector space is bornological (README §1.3). -/
theorem BornologicalSpace.of_firstCountableTopology [IsTopologicalAddGroup E]
    [ContinuousSMul 𝕜 E] [FirstCountableTopology E] : BornologicalSpace 𝕜 E := by
  sorry

/-- **Mackey's characterization** (README §1.3): a locally convex space is bornological if and
only if every linear map into a locally convex space that maps bounded sets to bounded sets is
continuous. The target ranges over the universe of `E`. -/
theorem bornologicalSpace_iff_continuous [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]
    [PolynormableSpace 𝕜 E] :
    BornologicalSpace 𝕜 E ↔
      ∀ (F : Type u) [AddCommGroup F] [Module 𝕜 F] [TopologicalSpace F]
        [IsTopologicalAddGroup F] [ContinuousSMul 𝕜 F] [PolynormableSpace 𝕜 F]
        (f : E →ₗ[𝕜] F), (∀ s : Set E, IsVonNBounded 𝕜 s → IsVonNBounded 𝕜 (f '' s)) →
          Continuous f := by
  sorry

variable (𝕜) in
/-- A Banach disk (README §1.4): an absolutely convex bounded set `B` whose gauge is a complete
norm on the span of `B`. The gauge is not named, so that no real structure on `E` is needed:
`gauge B x < ε` implies `x ∈ ε • B`, which implies `gauge B x ≤ ε`. Completeness is stated for
sequences of the span that are Cauchy for the gauge. -/
structure IsBanachDisk (B : Set E) : Prop where
  absConvex : AbsConvex 𝕜 B
  isVonNBounded : IsVonNBounded 𝕜 B
  eq_zero_of_forall_mem_smul : ∀ x : E, (∀ ε > (0 : ℝ), x ∈ (ε : 𝕜) • B) → x = 0
  complete : ∀ u : ℕ → E, (∀ n, u n ∈ Submodule.span 𝕜 B) →
    (∀ ε > (0 : ℝ), ∃ N, ∀ m ≥ N, ∀ n ≥ N, u m - u n ∈ (ε : 𝕜) • B) →
    ∃ x ∈ Submodule.span 𝕜 B, ∀ ε > (0 : ℝ), ∃ N, ∀ n ≥ N, u n - x ∈ (ε : 𝕜) • B

/-- **The Banach–Mackey theorem** (README §1.4): every barrel absorbs every Banach disk. -/
theorem IsBarrel.absorbs_of_isBanachDisk [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]
    {T B : Set E} (hT : IsBarrel 𝕜 T) (hB : IsBanachDisk 𝕜 B) : Absorbs 𝕜 T B := by
  sorry

variable (𝕜 E) in
/-- An ultrabornological space: a seminorm is continuous as soon as its composites with all
continuous linear maps from Banach spaces are (README §1.4). -/
class UltrabornologicalSpace : Prop where
  continuous_of_comp : ∀ p : Seminorm 𝕜 E,
    (∀ (X : Type u) [NormedAddCommGroup X] [NormedSpace 𝕜 X] [CompleteSpace X]
      (T : X →L[𝕜] E), Continuous (p ∘ T)) → Continuous p

/-- The textbook form of ultrabornological spaces (README §1.4). -/
theorem ultrabornologicalSpace_iff_absorbs [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]
    [PolynormableSpace 𝕜 E] [T2Space E] :
    UltrabornologicalSpace 𝕜 E ↔ ∀ A : Set E, AbsConvex 𝕜 A →
      (∀ B : Set E, IsBanachDisk 𝕜 B → Absorbs 𝕜 A B) → A ∈ 𝓝 (0 : E) := by
  sorry

/-- An ultrabornological space is bornological (README §1.4). -/
theorem UltrabornologicalSpace.bornologicalSpace [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]
    [UltrabornologicalSpace 𝕜 E] : BornologicalSpace 𝕜 E := by
  sorry

/-- An ultrabornological space is barrelled (README §1.4). -/
theorem UltrabornologicalSpace.barrelledSpace [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]
    [UltrabornologicalSpace 𝕜 E] : BarrelledSpace 𝕜 E := by
  sorry

/-- A sequentially complete Hausdorff bornological locally convex space is ultrabornological
(README §1.4); in particular so is every Fréchet space. -/
theorem UltrabornologicalSpace.of_bornologicalSpace {E : Type u} [AddCommGroup E] [Module 𝕜 E]
    [UniformSpace E] [IsUniformAddGroup E] [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E]
    [T2Space E] [BornologicalSpace 𝕜 E]
    (hE : ∀ u : ℕ → E, CauchySeq u → ∃ x, Tendsto u atTop (𝓝 x)) :
    UltrabornologicalSpace 𝕜 E := by
  sorry

/-- A quasi-barrelled locally convex space carries its Mackey topology (README §1.5). -/
theorem mackeyTopology_eq_of_quasiBarrelledSpace [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]
    [PolynormableSpace 𝕜 E] [QuasiBarrelledSpace 𝕜 E] :
    mackeyTopology (topDualPairing 𝕜 E).flip = ‹TopologicalSpace E› := by
  sorry

end Classes

/-! ## Layer 2: spaces of linear maps and the strong dual -/

section Maps

variable {E : Type u} [AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E]
  [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]

/-- **Completeness of `L_𝔖(E, F)` for bornological `E`** (README §2.4). -/
theorem completeSpace_of_bornologicalSpace [BornologicalSpace 𝕜 E]
    {F : Type*} [AddCommGroup F] [Module 𝕜 F] [UniformSpace F] [IsUniformAddGroup F]
    [ContinuousSMul 𝕜 F] [PolynormableSpace 𝕜 F] [T2Space F] [CompleteSpace F]
    {𝔖 : Set (Set E)} (h𝔖 : ∀ S ∈ 𝔖, IsVonNBounded 𝕜 S) (hcover : ⋃₀ 𝔖 = univ)
    (hseq : ∀ u : ℕ → E, Tendsto u atTop (𝓝 0) → ∃ S ∈ 𝔖, range u ⊆ S) :
    CompleteSpace (UniformConvergenceCLM (RingHom.id 𝕜) F 𝔖) := by
  sorry

/-- **Quasi-completeness of `L_𝔖(E, F)` for barrelled `E`** (README §2.4). -/
theorem quasiCompleteSpace_of_barrelledSpace [BarrelledSpace 𝕜 E]
    {F : Type*} [AddCommGroup F] [Module 𝕜 F] [UniformSpace F] [IsUniformAddGroup F]
    [ContinuousSMul 𝕜 F] [PolynormableSpace 𝕜 F] [T2Space F] [QuasiCompleteSpace 𝕜 F]
    {𝔖 : Set (Set E)} (h𝔖 : ∀ S ∈ 𝔖, IsVonNBounded 𝕜 S) (hcover : ⋃₀ 𝔖 = univ) :
    QuasiCompleteSpace 𝕜 (UniformConvergenceCLM (RingHom.id 𝕜) F 𝔖) := by
  sorry

variable (𝕜 E) in
/-- A semi-reflexive space: every continuous linear functional on the strong dual is an
evaluation (README §2.6). -/
class SemireflexiveSpace : Prop where
  exists_eval : ∀ φ : StrongDual 𝕜 (StrongDual 𝕜 E), ∃ x : E, ∀ f : StrongDual 𝕜 E, φ f = f x

variable (𝕜 E) in
/-- A reflexive space: evaluation is an isomorphism of topological vector spaces onto the strong
bidual (README §2.6). -/
class ReflexiveSpace : Prop where
  exists_equiv : ∃ e : E ≃L[𝕜] StrongDual 𝕜 (StrongDual 𝕜 E),
    ∀ (x : E) (f : StrongDual 𝕜 E), e x f = f x

/-- A Hausdorff locally convex space is reflexive if and only if it is semi-reflexive and
barrelled (README §2.6). -/
theorem reflexiveSpace_iff [PolynormableSpace 𝕜 E] [T2Space E] :
    ReflexiveSpace 𝕜 E ↔ SemireflexiveSpace 𝕜 E ∧ BarrelledSpace 𝕜 E := by
  sorry

/-- A Hausdorff locally convex space is semi-reflexive if and only if its bounded sets are
relatively weakly compact (README §2.6). -/
theorem semireflexiveSpace_iff [PolynormableSpace 𝕜 E] [T2Space E] :
    SemireflexiveSpace 𝕜 E ↔ ∀ s : Set E, IsVonNBounded 𝕜 s →
      IsCompact (closure (toWeakSpace 𝕜 E '' s)) := by
  sorry

/-- A Montel space is reflexive (README §2.7). -/
theorem ReflexiveSpace.of_montelSpace [PolynormableSpace 𝕜 E] [T2Space E] [MontelSpace 𝕜 E]
    [BarrelledSpace 𝕜 E] : ReflexiveSpace 𝕜 E := by
  sorry

/-- The strong dual of a Montel space has the Heine–Borel property (README §2.7). -/
theorem montelSpace_strongDual [PolynormableSpace 𝕜 E] [T2Space E] [MontelSpace 𝕜 E]
    [BarrelledSpace 𝕜 E] : MontelSpace 𝕜 (StrongDual 𝕜 E) := by
  sorry

/-- The strong dual of a Montel space is barrelled (README §2.7). -/
theorem barrelledSpace_strongDual_of_montelSpace [PolynormableSpace 𝕜 E] [T2Space E]
    [MontelSpace 𝕜 E] [BarrelledSpace 𝕜 E] : BarrelledSpace 𝕜 (StrongDual 𝕜 E) := by
  sorry

variable (𝕜 E) in
/-- A (DF)-space (README §2.8): a fundamental sequence of bounded sets, and every countable
intersection of closed absolutely convex neighbourhoods of zero that absorbs every bounded set is
a neighbourhood of zero. -/
class DFSpace : Prop where
  exists_fundamental : ∃ B : ℕ → Set E, (∀ n, IsVonNBounded 𝕜 (B n)) ∧
    ∀ s : Set E, IsVonNBounded 𝕜 s → ∃ n, s ⊆ B n
  iInter_mem_nhds : ∀ U : ℕ → Set E,
    (∀ n, U n ∈ 𝓝 (0 : E) ∧ AbsConvex 𝕜 (U n) ∧ IsClosed (U n)) →
    (∀ s : Set E, IsVonNBounded 𝕜 s → Absorbs 𝕜 (⋂ n, U n) s) → (⋂ n, U n) ∈ 𝓝 (0 : E)

/-- The strong dual of a metrizable locally convex space is a (DF)-space (README §2.8). -/
theorem DFSpace.strongDual_of_firstCountable [PolynormableSpace 𝕜 E]
    [FirstCountableTopology E] : DFSpace 𝕜 (StrongDual 𝕜 E) := by
  sorry

/-- On a (DF)-space a linear map that is continuous on bounded sets is continuous
(README §2.8). -/
theorem DFSpace.continuous_of_continuousOn [PolynormableSpace 𝕜 E] [DFSpace 𝕜 E]
    {G : Type*} [AddCommGroup G] [Module 𝕜 G] [TopologicalSpace G] [IsTopologicalAddGroup G]
    [ContinuousSMul 𝕜 G] [PolynormableSpace 𝕜 G] (f : E →ₗ[𝕜] G)
    (hf : ∀ s : Set E, IsVonNBounded 𝕜 s → ContinuousOn f s) : Continuous f := by
  sorry

/-- The strong dual of a Hausdorff (DF)-space is complete (README §2.8). -/
theorem DFSpace.completeSpace_strongDual [PolynormableSpace 𝕜 E] [T2Space E] [DFSpace 𝕜 E] :
    CompleteSpace (StrongDual 𝕜 E) := by
  sorry

/-- The strong dual of a (DF)-space is first countable (README §2.8). -/
theorem DFSpace.firstCountableTopology_strongDual [DFSpace 𝕜 E] :
    FirstCountableTopology (StrongDual 𝕜 E) := by
  sorry

end Maps

section Completeness

/-- **Grothendieck's completeness theorem** (README §2.5). A Hausdorff locally convex space is
complete if and only if every linear functional on its dual that is weak-star continuous on each
equicontinuous set is the evaluation at a point. -/
theorem completeSpace_iff_forall_weakStarContinuousOn {E : Type*} [AddCommGroup E] [Module 𝕜 E]
    [UniformSpace E] [IsUniformAddGroup E] [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E]
    [T2Space E] :
    CompleteSpace E ↔ ∀ φ : StrongDual 𝕜 E →ₗ[𝕜] 𝕜,
      (∀ A : Set (StrongDual 𝕜 E), Equicontinuous (fun a : A => ((a : StrongDual 𝕜 E) : E → 𝕜)) →
        ContinuousOn (fun f : WeakDual 𝕜 E => φ (WeakDual.toStrongDual f))
          (StrongDual.toWeakDual '' A)) →
      ∃ x : E, ∀ f : StrongDual 𝕜 E, φ f = f x := by
  sorry

end Completeness

/-! ## Layer 3: inductive limits and LF-spaces -/

section Final

variable {ι : Type*} {X : ι → Type*} [∀ i, AddCommGroup (X i)] [∀ i, Module 𝕜 (X i)]
  [∀ i, TopologicalSpace (X i)]
  {E : Type*} [AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E]

/-- The topology of `E` is the final locally convex topology of the linear maps `f i`
(README §3.1), stated by the seminorm criterion; `E` is assumed locally convex where this is
used. -/
structure IsFinalLocallyConvex (f : ∀ i, X i →ₗ[𝕜] E) : Prop where
  continuous : ∀ i, Continuous (f i)
  continuous_seminorm : ∀ p : Seminorm 𝕜 E, (∀ i, Continuous (p ∘ f i)) → Continuous p

/-- The universal property (README §3.1). -/
theorem IsFinalLocallyConvex.continuous_iff {f : ∀ i, X i →ₗ[𝕜] E} (hf : IsFinalLocallyConvex f)
    {G : Type*} [AddCommGroup G] [Module 𝕜 G] [TopologicalSpace G] [IsTopologicalAddGroup G]
    [ContinuousSMul 𝕜 G] [PolynormableSpace 𝕜 G] (g : E →ₗ[𝕜] G) :
    Continuous g ↔ ∀ i, Continuous (g ∘ f i) := by
  sorry

/-- The locally convex direct sum topology on `Π₀ i, X i` (README §3.2): the finest locally convex
vector topology making every `DFinsupp.lsingle i` continuous. -/
@[instance_reducible]
def directSumTopology (𝕜 : Type*) [RCLike 𝕜] {ι : Type*} [DecidableEq ι] (X : ι → Type*)
    [∀ i, AddCommGroup (X i)] [∀ i, Module 𝕜 (X i)] [∀ i, TopologicalSpace (X i)] :
    TopologicalSpace (Π₀ i, X i) :=
  sInf {t | (∀ i, @Continuous (X i) (Π₀ i, X i) _ t (DFinsupp.lsingle (R := 𝕜) i)) ∧
    @IsTopologicalAddGroup (Π₀ i, X i) t _ ∧ @ContinuousSMul 𝕜 (Π₀ i, X i) _ _ t ∧
    @PolynormableSpace 𝕜 (Π₀ i, X i) _ _ _ t}

/-- Bounded sets of a direct sum of Hausdorff locally convex spaces (README §3.2). -/
theorem isVonNBounded_directSum_iff [DecidableEq ι] [∀ i, IsTopologicalAddGroup (X i)]
    [∀ i, ContinuousSMul 𝕜 (X i)] [∀ i, PolynormableSpace 𝕜 (X i)] [∀ i, T2Space (X i)]
    {B : Set (Π₀ i, X i)} :
    @IsVonNBounded 𝕜 (Π₀ i, X i) _ _ _ (directSumTopology 𝕜 X) B ↔
      (∃ J : Finset ι, ∀ x ∈ B, ∀ i ∉ J, x i = 0) ∧
        ∀ i, IsVonNBounded 𝕜 ((fun x : Π₀ i, X i => x i) '' B) := by
  sorry

end Final

section Inductive

variable {X : ℕ → Type*} [∀ n, AddCommGroup (X n)] [∀ n, Module 𝕜 (X n)]
  [∀ n, TopologicalSpace (X n)]
  {E : Type*} [AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E]

/-- An inductive sequence with limit `E` (README, Conventions and §3.3). -/
structure IsInductiveSequence (T : ∀ n, X n →L[𝕜] X (n + 1)) (ι : ∀ n, X n →L[𝕜] E) : Prop where
  comp_eq : ∀ n, (ι (n + 1)).comp (T n) = ι n
  injective : ∀ n, Function.Injective (ι n)
  iUnion_range : ⋃ n, range (ι n) = univ
  isFinal : IsFinalLocallyConvex (fun n => (ι n : X n →ₗ[𝕜] E))

/-- Regularity of an inductive sequence (README §3.3). -/
def IsRegular (ι : ∀ n, X n →L[𝕜] E) : Prop :=
  ∀ B : Set E, IsVonNBounded 𝕜 B → ∃ n, ∃ A : Set (X n), IsVonNBounded 𝕜 A ∧ B = ι n '' A

variable {T : ∀ n, X n →L[𝕜] X (n + 1)} {ι : ∀ n, X n →L[𝕜] E}
  [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E]
  [∀ n, IsTopologicalAddGroup (X n)] [∀ n, ContinuousSMul 𝕜 (X n)]
  [∀ n, PolynormableSpace 𝕜 (X n)]

/-- A strict inductive limit induces on each step its own topology (README §3.4). -/
theorem IsInductiveSequence.isEmbedding_of_strict (h : IsInductiveSequence T ι)
    (hT : ∀ n, IsEmbedding (T n)) (n : ℕ) : IsEmbedding (ι n) := by
  sorry

/-- **Dieudonné–Schwartz** (README §3.4): in a strict inductive limit of Hausdorff spaces with
closed steps, a set is bounded if and only if it is the image of a bounded subset of a step. -/
theorem IsInductiveSequence.isVonNBounded_iff_of_strict [∀ n, T2Space (X n)]
    (h : IsInductiveSequence T ι) (hT : ∀ n, IsClosedEmbedding (T n)) {B : Set E} :
    IsVonNBounded 𝕜 B ↔ ∃ n, ∃ A : Set (X n), IsVonNBounded 𝕜 A ∧ B = ι n '' A := by
  sorry

/-- The steps of a strict inductive limit with closed steps are closed in the limit
(README §3.4). -/
theorem IsInductiveSequence.isClosedEmbedding_of_strict [∀ n, T2Space (X n)]
    (h : IsInductiveSequence T ι) (hT : ∀ n, IsClosedEmbedding (T n)) (n : ℕ) :
    IsClosedEmbedding (ι n) := by
  sorry

/-- The dual of an inductive limit is the projective limit of the duals (README §3.6): the
restriction map is an embedding of weak duals, with range the compatible families. -/
theorem IsInductiveSequence.isEmbedding_weakDual (h : IsInductiveSequence T ι) :
    IsEmbedding (fun (f : WeakDual 𝕜 E) (n : ℕ) =>
      StrongDual.toWeakDual ((WeakDual.toStrongDual f).comp (ι n))) ∧
    ∀ g : ∀ n, StrongDual 𝕜 (X n), (∀ n, (g (n + 1)).comp (T n) = g n) →
      ∃! f : StrongDual 𝕜 E, ∀ n, f.comp (ι n) = g n := by
  sorry

/-- The strong dual of an inductive limit is the projective limit of the strong duals exactly
when every bounded set lies in the closure of the image of a bounded subset of a step
(README §3.6). -/
theorem IsInductiveSequence.isEmbedding_strongDual_iff (h : IsInductiveSequence T ι) :
    IsEmbedding (fun (f : StrongDual 𝕜 E) (n : ℕ) => f.comp (ι n)) ↔
      ∀ B : Set E, IsVonNBounded 𝕜 B →
        ∃ n, ∃ A : Set (X n), IsVonNBounded 𝕜 A ∧ B ⊆ closure (ι n '' A) := by
  sorry

end Inductive

section Strict

/-- A strict inductive limit of a sequence of complete Hausdorff locally convex spaces is complete
(README §3.4). -/
theorem IsInductiveSequence.completeSpace_of_strict {X : ℕ → Type*} [∀ n, AddCommGroup (X n)]
    [∀ n, Module 𝕜 (X n)] [∀ n, UniformSpace (X n)] [∀ n, IsUniformAddGroup (X n)]
    [∀ n, ContinuousSMul 𝕜 (X n)] [∀ n, PolynormableSpace 𝕜 (X n)] [∀ n, T2Space (X n)]
    [∀ n, CompleteSpace (X n)]
    {E : Type*} [AddCommGroup E] [Module 𝕜 E] [UniformSpace E] [IsUniformAddGroup E]
    [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E]
    {T : ∀ n, X n →L[𝕜] X (n + 1)} {ι : ∀ n, X n →L[𝕜] E} (h : IsInductiveSequence T ι)
    (hT : ∀ n, IsEmbedding (T n)) : CompleteSpace E := by
  sorry

variable (𝕜) in
/-- An LF-space (README §3.5): a Hausdorff locally convex space with an inductive sequence of
Fréchet spaces. With `strict := true` the sequence is required to be strict. -/
def IsLFSpaceWith (strict : Prop) (E : Type u) [AddCommGroup E] [Module 𝕜 E]
    [TopologicalSpace E] : Prop :=
  T2Space E ∧ PolynormableSpace 𝕜 E ∧
    ∃ (X : ℕ → Type u) (_ : ∀ n, AddCommGroup (X n)) (_ : ∀ n, Module 𝕜 (X n))
      (_ : ∀ n, UniformSpace (X n)) (_ : ∀ n, IsUniformAddGroup (X n))
      (_ : ∀ n, ContinuousSMul 𝕜 (X n)) (_ : ∀ n, PolynormableSpace 𝕜 (X n))
      (_ : ∀ n, CompleteSpace (X n)) (_ : ∀ n, T2Space (X n))
      (_ : ∀ n, (𝓤 (X n)).IsCountablyGenerated)
      (T : ∀ n, X n →L[𝕜] X (n + 1)) (ι : ∀ n, X n →L[𝕜] E),
      IsInductiveSequence T ι ∧ (strict → ∀ n, IsEmbedding (T n))

variable (𝕜) in
/-- An LF-space (README §3.5). -/
def IsLFSpace (E : Type u) [AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E] : Prop :=
  IsLFSpaceWith 𝕜 False E

variable (𝕜) in
/-- A strict LF-space (README §3.5). -/
def IsStrictLFSpace (E : Type u) [AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E] : Prop :=
  IsLFSpaceWith 𝕜 True E

/-- An LF-space is ultrabornological (README §3.5). -/
theorem IsLFSpace.ultrabornologicalSpace {E : Type u} [AddCommGroup E] [Module 𝕜 E]
    [TopologicalSpace E] [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E] (hE : IsLFSpace 𝕜 E) :
    UltrabornologicalSpace 𝕜 E := by
  sorry

end Strict

/-! ## Layer 4: factorization, closed graph and open mapping theorems -/

section Factorization

/-- **Banach's theorem** (README §4.1): a continuous linear map from an F-space into a Hausdorff
topological vector space whose range is not meagre is surjective and open. -/
theorem isOpenMap_of_not_isMeagre_range {X Y : Type*} [AddCommGroup X] [Module 𝕜 X]
    [UniformSpace X] [IsUniformAddGroup X] [ContinuousSMul 𝕜 X] [CompleteSpace X] [T2Space X]
    [(𝓤 X).IsCountablyGenerated] [AddCommGroup Y] [Module 𝕜 Y] [TopologicalSpace Y]
    [IsTopologicalAddGroup Y] [ContinuousSMul 𝕜 Y] [T2Space Y] (u : X →L[𝕜] Y)
    (hu : ¬ IsMeagre (range u)) : Function.Surjective u ∧ IsOpenMap u := by
  sorry

/-- **Grothendieck's factorization theorem** (README §4.2). A linear map with sequentially closed
graph from an F-space into a Hausdorff topological vector space, whose range is covered by the
ranges of countably many continuous linear maps from F-spaces, has its range in one of them. -/
theorem exists_range_subset_of_isSeqClosed_graph {X F : Type*} {Y : ℕ → Type*}
    [AddCommGroup X] [Module 𝕜 X] [UniformSpace X] [IsUniformAddGroup X] [ContinuousSMul 𝕜 X]
    [CompleteSpace X] [T2Space X] [(𝓤 X).IsCountablyGenerated]
    [AddCommGroup F] [Module 𝕜 F] [TopologicalSpace F] [IsTopologicalAddGroup F]
    [ContinuousSMul 𝕜 F] [T2Space F]
    [∀ n, AddCommGroup (Y n)] [∀ n, Module 𝕜 (Y n)] [∀ n, UniformSpace (Y n)]
    [∀ n, IsUniformAddGroup (Y n)] [∀ n, ContinuousSMul 𝕜 (Y n)] [∀ n, CompleteSpace (Y n)]
    [∀ n, T2Space (Y n)] [∀ n, (𝓤 (Y n)).IsCountablyGenerated]
    (v : ∀ n, Y n →L[𝕜] F) (u : X →ₗ[𝕜] F)
    (hu : IsSeqClosed (u.graph : Set (X × F))) (hcover : range u ⊆ ⋃ n, range (v n)) :
    ∃ n, range u ⊆ range (v n) := by
  sorry

/-- The factorization in Grothendieck's theorem when the covering map is injective
(README §4.2). -/
theorem existsUnique_factorization_of_isSeqClosed_graph {X F Y : Type*}
    [AddCommGroup X] [Module 𝕜 X] [UniformSpace X] [IsUniformAddGroup X] [ContinuousSMul 𝕜 X]
    [CompleteSpace X] [T2Space X] [(𝓤 X).IsCountablyGenerated]
    [AddCommGroup F] [Module 𝕜 F] [TopologicalSpace F] [IsTopologicalAddGroup F]
    [ContinuousSMul 𝕜 F] [T2Space F]
    [AddCommGroup Y] [Module 𝕜 Y] [UniformSpace Y] [IsUniformAddGroup Y] [ContinuousSMul 𝕜 Y]
    [CompleteSpace Y] [T2Space Y] [(𝓤 Y).IsCountablyGenerated]
    (v : Y →L[𝕜] F) (hv : Function.Injective v) (u : X →ₗ[𝕜] F)
    (hu : IsSeqClosed (u.graph : Set (X × F))) (hrange : range u ⊆ range v) :
    ∃! w : X →L[𝕜] Y, ∀ x, v (w x) = u x := by
  sorry

variable {E F : Type u} {Y : ℕ → Type*}
  [AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E] [IsTopologicalAddGroup E]
  [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E]
  [AddCommGroup F] [Module 𝕜 F] [TopologicalSpace F] [IsTopologicalAddGroup F]
  [ContinuousSMul 𝕜 F] [PolynormableSpace 𝕜 F] [T2Space F]
  [∀ n, AddCommGroup (Y n)] [∀ n, Module 𝕜 (Y n)] [∀ n, UniformSpace (Y n)]
  [∀ n, IsUniformAddGroup (Y n)] [∀ n, ContinuousSMul 𝕜 (Y n)] [∀ n, PolynormableSpace 𝕜 (Y n)]
  [∀ n, CompleteSpace (Y n)] [∀ n, T2Space (Y n)] [∀ n, (𝓤 (Y n)).IsCountablyGenerated]

/-- **The closed graph theorem** (README §4.3): a linear map with sequentially closed graph from
an ultrabornological space into a Hausdorff locally convex space covered by a sequence of Fréchet
spaces is continuous. -/
theorem continuous_of_isSeqClosed_graph_of_ultrabornological [UltrabornologicalSpace 𝕜 E]
    (v : ∀ n, Y n →L[𝕜] F) (hv : ⋃ n, range (v n) = univ) (u : E →ₗ[𝕜] F)
    (hu : IsSeqClosed (u.graph : Set (E × F))) : Continuous u := by
  sorry

/-- **The open mapping theorem** (README §4.4): a continuous linear surjection from a Hausdorff
locally convex space covered by a sequence of Fréchet spaces onto a Hausdorff ultrabornological
space is open. -/
theorem isOpenMap_of_surjective_of_ultrabornological [T2Space E] [UltrabornologicalSpace 𝕜 E]
    (v : ∀ n, Y n →L[𝕜] F) (hv : ⋃ n, range (v n) = univ) (u : F →L[𝕜] E)
    (hu : Function.Surjective u) : IsOpenMap u := by
  sorry

/-- A continuous linear surjection between LF-spaces is open (README §4.4). -/
theorem isOpenMap_of_surjective_of_isLFSpace (hE : IsLFSpace 𝕜 E) (hF : IsLFSpace 𝕜 F)
    (u : F →L[𝕜] E) (hu : Function.Surjective u) : IsOpenMap u := by
  sorry

end Factorization

/-! ## Layer 5: the injective tensor product -/

section Injective

variable {E F : Type*} [AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E]
  [AddCommGroup F] [Module 𝕜 F] [TopologicalSpace F]

/-- The functional `f ⊗ g` on `E ⊗[𝕜] F`. -/
def tensorFunctional (f : StrongDual 𝕜 E) (g : StrongDual 𝕜 F) : E ⊗[𝕜] F →ₗ[𝕜] 𝕜 :=
  LinearMap.mul' 𝕜 𝕜 ∘ₗ TensorProduct.map (f : E →ₗ[𝕜] 𝕜) (g : F →ₗ[𝕜] 𝕜)

/-- The products of equicontinuous subsets of the two duals. -/
def equicontinuousRectangles (𝕜 E F : Type*) [RCLike 𝕜] [AddCommGroup E] [Module 𝕜 E]
    [TopologicalSpace E] [AddCommGroup F] [Module 𝕜 F] [TopologicalSpace F] :
    Set (Set (StrongDual 𝕜 E × StrongDual 𝕜 F)) :=
  {S | ∃ (A : Set (StrongDual 𝕜 E)) (B : Set (StrongDual 𝕜 F)),
    Equicontinuous (fun a : A => ((a : StrongDual 𝕜 E) : E → 𝕜)) ∧
    Equicontinuous (fun b : B => ((b : StrongDual 𝕜 F) : F → 𝕜)) ∧ S = A ×ˢ B}

/-- The injective topology on `E ⊗[𝕜] F` (README §5.1): uniform convergence on products of
equicontinuous subsets of the duals. -/
@[instance_reducible]
def injectiveTensorTopology (𝕜 E F : Type*) [RCLike 𝕜] [AddCommGroup E] [Module 𝕜 E]
    [TopologicalSpace E] [AddCommGroup F] [Module 𝕜 F] [TopologicalSpace F] :
    TopologicalSpace (E ⊗[𝕜] F) :=
  TopologicalSpace.induced
    (fun t => UniformOnFun.ofFun (equicontinuousRectangles 𝕜 E F)
      (fun fg : StrongDual 𝕜 E × StrongDual 𝕜 F => tensorFunctional fg.1 fg.2 t))
    inferInstance

/-- The injective topology of Hausdorff locally convex spaces is Hausdorff (README §5.1). -/
theorem t2Space_injectiveTensorTopology [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]
    [PolynormableSpace 𝕜 E] [T2Space E] [IsTopologicalAddGroup F] [ContinuousSMul 𝕜 F]
    [PolynormableSpace 𝕜 F] [T2Space F] :
    @T2Space (E ⊗[𝕜] F) (injectiveTensorTopology 𝕜 E F) := by
  sorry

/-- The injective tensor product respects subspaces (README §5.1): the tensor product of two
topological embeddings is a topological embedding for the injective topologies. -/
theorem isEmbedding_map_injectiveTensorTopology {E₁ F₁ : Type*} [AddCommGroup E₁] [Module 𝕜 E₁]
    [TopologicalSpace E₁] [AddCommGroup F₁] [Module 𝕜 F₁] [TopologicalSpace F₁]
    [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E] [T2Space E]
    [IsTopologicalAddGroup F] [ContinuousSMul 𝕜 F] [PolynormableSpace 𝕜 F] [T2Space F]
    [IsTopologicalAddGroup E₁] [ContinuousSMul 𝕜 E₁] [PolynormableSpace 𝕜 E₁] [T2Space E₁]
    [IsTopologicalAddGroup F₁] [ContinuousSMul 𝕜 F₁] [PolynormableSpace 𝕜 F₁] [T2Space F₁]
    (u : E₁ →L[𝕜] E) (v : F₁ →L[𝕜] F) (hu : IsEmbedding u) (hv : IsEmbedding v) :
    @IsEmbedding (E₁ ⊗[𝕜] F₁) (E ⊗[𝕜] F) (injectiveTensorTopology 𝕜 E₁ F₁)
      (injectiveTensorTopology 𝕜 E F) (TensorProduct.map (u : E₁ →ₗ[𝕜] E) (v : F₁ →ₗ[𝕜] F)) := by
  sorry

end Injective

/-! ## Layer 6: regularity of inductive limits -/

section Schwartz

variable (𝕜) in
/-- A Schwartz space in the sense of Grothendieck (README §6.1): every continuous seminorm has a
neighbourhood of zero that is precompact for it. -/
class SchwartzLocallyConvexSpace (E : Type*) [AddCommGroup E] [Module 𝕜 E]
    [TopologicalSpace E] : Prop where
  exists_precompact : ∀ p : Seminorm 𝕜 E, Continuous p → ∃ V ∈ 𝓝 (0 : E), ∀ ε > (0 : ℝ),
    ∃ t : Set E, t.Finite ∧ V ⊆ ⋃ x ∈ t, {y | p (y - x) < ε}

variable {E : Type*} [AddCommGroup E] [Module 𝕜 E] [UniformSpace E] [IsUniformAddGroup E]
  [ContinuousSMul 𝕜 E] [CompleteSpace E] [T2Space E] [(𝓤 E).IsCountablyGenerated]

/-- Compact subsets of a quotient of an F-space lift to compact sets (README §6.2). -/
theorem exists_isCompact_image_eq_of_quotient (L : Submodule 𝕜 E) (hL : IsClosed (L : Set E))
    {K : Set (E ⧸ L)} (hK : IsCompact K) : ∃ K' : Set E, IsCompact K' ∧ L.mkQ '' K' = K := by
  sorry

/-- Bounded subsets of a quotient of a Fréchet–Schwartz space lift to bounded sets
(README §6.2). -/
theorem exists_isVonNBounded_image_of_quotient [PolynormableSpace 𝕜 E]
    [SchwartzLocallyConvexSpace 𝕜 E] (L : Submodule 𝕜 E) (hL : IsClosed (L : Set E))
    {B : Set (E ⧸ L)} (hB : IsVonNBounded 𝕜 B) :
    ∃ A : Set E, IsCompact A ∧ B ⊆ L.mkQ '' A := by
  sorry

end Schwartz

section Regularity

variable {X : ℕ → Type*} [∀ n, AddCommGroup (X n)] [∀ n, Module 𝕜 (X n)]
  [∀ n, TopologicalSpace (X n)]
  {E : Type*} [AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E]

/-- The topology of step `m` on a subset `S` of the limit (README §6.3): the topology induced by
the inverse of `ι m`. It is meaningful when `S ⊆ range (ι m)` and `ι m` is injective. -/
@[instance_reducible]
def stepTopologyOn (ι : ∀ n, X n →L[𝕜] E) (m : ℕ) (S : Set E) : TopologicalSpace S :=
  TopologicalSpace.induced (fun s : S => Function.invFun (ι m) s.1) inferInstance

/-- Bounded retractivity (README §6.3). -/
def IsBoundedlyRetractive (ι : ∀ n, X n →L[𝕜] E) : Prop :=
  ∀ B : Set E, IsVonNBounded 𝕜 B →
    ∃ n, B ⊆ range (ι n) ∧ stepTopologyOn ι n B = instTopologicalSpaceSubtype

/-- Sequential retractivity (README §6.3). -/
def IsSequentiallyRetractive (ι : ∀ n, X n →L[𝕜] E) : Prop :=
  ∀ u : ℕ → E, Tendsto u atTop (𝓝 0) →
    ∃ n, ∃ v : ℕ → X n, (∀ k, ι n (v k) = u k) ∧ Tendsto v atTop (𝓝 0)

/-- Retakh's condition (M) (README §6.3). -/
def RetakhCondition (T : ∀ n, X n →L[𝕜] X (n + 1)) (ι : ∀ n, X n →L[𝕜] E) : Prop :=
  ∃ U : ∀ n, Set (X n), (∀ n, U n ∈ 𝓝 (0 : X n)) ∧ (∀ n, AbsConvex 𝕜 (U n)) ∧
    (∀ n, T n '' U n ⊆ U (n + 1)) ∧
    ∀ n, ∃ m ≥ n, ∀ k ≥ m, stepTopologyOn ι k (ι n '' U n) = stepTopologyOn ι m (ι n '' U n)

/-- The map `x ↦ x - shift x` on the direct sum of the steps (README §6.4). -/
def directSumDifference (T : ∀ n, X n →L[𝕜] X (n + 1)) : (Π₀ n, X n) →ₗ[𝕜] Π₀ n, X n :=
  LinearMap.id -
    DFinsupp.lsum ℕ (fun n => (DFinsupp.lsingle (n + 1)).comp (T n : X n →ₗ[𝕜] X (n + 1)))

/-- Acyclic inductive sequences in the sense of Palamodov (README §6.4): the difference map is a
topological embedding of the locally convex direct sum. -/
def IsAcyclic (T : ∀ n, X n →L[𝕜] X (n + 1)) : Prop :=
  @IsEmbedding _ _ (directSumTopology 𝕜 X) (directSumTopology 𝕜 X) (directSumDifference T)

/-- A limit subspace (README §6.5): the subspace topology of `L` is the final locally convex
topology of the maps from its intersections with the steps. -/
def IsLimitSubspace (ι : ∀ n, X n →L[𝕜] E) (L : Submodule 𝕜 E) : Prop :=
  IsFinalLocallyConvex (fun n =>
    ((ι n : X n →ₗ[𝕜] E).restrict (p := L.comap (ι n : X n →ₗ[𝕜] E)) (q := L)
      (fun _ hx => hx)))

end Regularity

section Acyclic

variable {X : ℕ → Type*} [∀ n, AddCommGroup (X n)] [∀ n, Module 𝕜 (X n)]
  [∀ n, UniformSpace (X n)] [∀ n, IsUniformAddGroup (X n)] [∀ n, ContinuousSMul 𝕜 (X n)]
  [∀ n, PolynormableSpace 𝕜 (X n)] [∀ n, CompleteSpace (X n)] [∀ n, T2Space (X n)]
  [∀ n, (𝓤 (X n)).IsCountablyGenerated]
  {E : Type*} [AddCommGroup E] [Module 𝕜 E] [UniformSpace E] [IsUniformAddGroup E]
  [ContinuousSMul 𝕜 E] [PolynormableSpace 𝕜 E] [T2Space E]
  {T : ∀ n, X n →L[𝕜] X (n + 1)} {ι : ∀ n, X n →L[𝕜] E}

/-- **Palamodov–Retakh** (README §6.4): an inductive sequence of Fréchet spaces with Hausdorff
limit is acyclic if and only if it satisfies condition (M). -/
theorem IsInductiveSequence.isAcyclic_iff_retakhCondition (h : IsInductiveSequence T ι) :
    IsAcyclic T ↔ RetakhCondition T ι := by
  sorry

/-- **Wengenroth** (README §6.4): an inductive sequence of Fréchet spaces with Hausdorff limit is
acyclic if and only if it is boundedly retractive, if and only if it is sequentially
retractive. -/
theorem IsInductiveSequence.isAcyclic_tfae (h : IsInductiveSequence T ι) :
    List.TFAE [IsAcyclic T, IsBoundedlyRetractive (𝕜 := 𝕜) ι, IsSequentiallyRetractive ι] := by
  sorry

/-- An acyclic LF-space is regular (README §6.4). -/
theorem IsInductiveSequence.isRegular_of_isAcyclic (h : IsInductiveSequence T ι)
    (hT : IsAcyclic T) : IsRegular (𝕜 := 𝕜) ι := by
  sorry

/-- An acyclic LF-space is complete (README §6.4). -/
theorem IsInductiveSequence.completeSpace_of_isAcyclic (h : IsInductiveSequence T ι)
    (hT : IsAcyclic T) : CompleteSpace E := by
  sorry

/-- A strict inductive sequence of Fréchet spaces is acyclic (README §6.4). -/
theorem IsInductiveSequence.isAcyclic_of_strict (h : IsInductiveSequence T ι)
    (hT : ∀ n, IsEmbedding (T n)) : IsAcyclic T := by
  sorry

/-- **Limit subspaces of strict LF-spaces with Fréchet–Schwartz steps** (README §6.5): a closed
subspace is a limit subspace if and only if the quotient map lifts bounded sets. -/
theorem IsInductiveSequence.isLimitSubspace_iff_lifts_bounded
    [∀ n, SchwartzLocallyConvexSpace 𝕜 (X n)] (h : IsInductiveSequence T ι)
    (hT : ∀ n, IsEmbedding (T n)) (L : Submodule 𝕜 E) (hL : IsClosed (L : Set E)) :
    IsLimitSubspace ι L ↔
      ∀ B : Set (E ⧸ L), IsVonNBounded 𝕜 B →
        ∃ A : Set E, IsVonNBounded 𝕜 A ∧ B ⊆ L.mkQ '' A := by
  sorry

/-- A closed subspace of an LF-space is a limit subspace if and only if it is ultrabornological
for the subspace topology (README §6.5). -/
theorem IsInductiveSequence.isLimitSubspace_iff_ultrabornological (h : IsInductiveSequence T ι)
    (L : Submodule 𝕜 E) (hL : IsClosed (L : Set E)) :
    IsLimitSubspace ι L ↔ UltrabornologicalSpace 𝕜 L := by
  sorry

end Acyclic

end TauCetiRoadmap.LocallyConvexDuality
