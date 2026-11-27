import Mathlib

/-!
# Metrization theorems: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pin and is stated here.

Families of sets are of two kinds. An indexed family `f : ι → Set X` is used where Mathlib's
`LocallyFinite` is used. A base, an open cover or a refinement is a set of sets
`𝒮 : Set (Set X)`, and its local finiteness is that of the family `fun s : 𝒮 => (s : Set X)`.
Separation axioms are Mathlib's: `RegularSpace` carries no `T0Space`, `T3Space` is both, and
`ParacompactSpace` carries no Hausdorff axiom.
-/

open Function Set Filter Topology TopologicalSpace

namespace TauCetiRoadmap.MetrizationTheorems

variable {X : Type*} [TopologicalSpace X]

/-! ## Layer 1: discrete families and A. H. Stone's theorem -/

/-- 1.1: an indexed family of sets is *discrete* if every point has a neighbourhood meeting the
members of at most one index. -/
def IsDiscreteFamily {ι : Type*} (f : ι → Set X) : Prop :=
  ∀ x : X, ∃ U ∈ 𝓝 x, {i | (f i ∩ U).Nonempty}.Subsingleton

/-- 1.1: a set of sets is *σ-locally finite* if it is the union of a sequence of sets of sets,
each a locally finite family. -/
def IsSigmaLocallyFinite (𝒮 : Set (Set X)) : Prop :=
  ∃ b : ℕ → Set (Set X), 𝒮 = ⋃ n, b n ∧ ∀ n, LocallyFinite (fun s : b n => (s : Set X))

/-- 1.1: a set of sets is *σ-discrete* if it is the union of a sequence of sets of sets, each a
discrete family. -/
def IsSigmaDiscrete (𝒮 : Set (Set X)) : Prop :=
  ∃ b : ℕ → Set (Set X), 𝒮 = ⋃ n, b n ∧ ∀ n, IsDiscreteFamily (fun s : b n => (s : Set X))

/-- 1.2 (A. H. Stone): every open cover of a pseudometrizable space has an open refinement that
covers the space, is locally finite and is σ-discrete. -/
theorem exists_locallyFinite_isSigmaDiscrete_refinement [PseudoMetrizableSpace X] {ι : Type*}
    (u : ι → Set X) (hu : ∀ i, IsOpen (u i)) (hcov : ⋃ i, u i = univ) :
    ∃ 𝒱 : Set (Set X), (∀ V ∈ 𝒱, IsOpen V ∧ ∃ i, V ⊆ u i) ∧ ⋃₀ 𝒱 = univ ∧
      LocallyFinite (fun V : 𝒱 => (V : Set X)) ∧ IsSigmaDiscrete 𝒱 := by
  sorry

/-- 1.3: a pseudometrizable space has a σ-discrete base. -/
theorem exists_isTopologicalBasis_isSigmaDiscrete [PseudoMetrizableSpace X] :
    ∃ B : Set (Set X), IsTopologicalBasis B ∧ IsSigmaDiscrete B := by
  sorry

/-! ## Layer 2: regular spaces with σ-locally finite refinements or bases -/

/-- 2.1 (E. Michael): a regular space is paracompact if and only if every open cover has an open
refinement that covers the space and is σ-locally finite. -/
theorem paracompactSpace_iff_forall_isSigmaLocallyFinite_refinement [RegularSpace X] :
    ParacompactSpace X ↔ ∀ 𝒰 : Set (Set X), (∀ U ∈ 𝒰, IsOpen U) → ⋃₀ 𝒰 = univ →
      ∃ 𝒱 : Set (Set X), (∀ V ∈ 𝒱, IsOpen V ∧ ∃ U ∈ 𝒰, V ⊆ U) ∧ ⋃₀ 𝒱 = univ ∧
        IsSigmaLocallyFinite 𝒱 := by
  sorry

/-- 2.2 (R. H. Bing): in a regular space in which every open cover has an open refinement that
covers the space and is σ-discrete, every discrete family of closed sets has pairwise disjoint
open neighbourhoods. -/
theorem exists_pairwise_disjoint_open_of_isDiscreteFamily [RegularSpace X]
    (h : ∀ 𝒰 : Set (Set X), (∀ U ∈ 𝒰, IsOpen U) → ⋃₀ 𝒰 = univ →
      ∃ 𝒱 : Set (Set X), (∀ V ∈ 𝒱, IsOpen V ∧ ∃ U ∈ 𝒰, V ⊆ U) ∧ ⋃₀ 𝒱 = univ ∧
        IsSigmaDiscrete 𝒱)
    {ι : Type*} (F : ι → Set X) (hF : ∀ i, IsClosed (F i)) (hd : IsDiscreteFamily F) :
    ∃ U : ι → Set X, (∀ i, IsOpen (U i)) ∧ (∀ i, F i ⊆ U i) ∧ Pairwise (Disjoint on U) := by
  sorry

/-- 2.4: a regular space with a σ-locally finite base is pseudometrizable. -/
theorem pseudoMetrizableSpace_of_isTopologicalBasis_isSigmaLocallyFinite [RegularSpace X]
    {B : Set (Set X)} (hB : IsTopologicalBasis B) (hσ : IsSigmaLocallyFinite B) :
    PseudoMetrizableSpace X := by
  sorry

/-! ## Layer 3: the metrization theorems and a non-normal product -/

/-- 3.1 (Nagata–Smirnov and Bing): a space is metrizable if and only if it is T₃ and has a
σ-locally finite base, and if and only if it is T₃ and has a σ-discrete base. -/
theorem metrizableSpace_iff_isSigmaLocallyFinite_basis_and_isSigmaDiscrete_basis :
    (MetrizableSpace X ↔
        T3Space X ∧ ∃ B : Set (Set X), IsTopologicalBasis B ∧ IsSigmaLocallyFinite B) ∧
      (MetrizableSpace X ↔
        T3Space X ∧ ∃ B : Set (Set X), IsTopologicalBasis B ∧ IsSigmaDiscrete B) := by
  sorry

/-- 3.2: a space is *locally metrizable* if every point has an open neighbourhood that is
metrizable in the subspace topology. -/
def IsLocallyMetrizable (X : Type*) [TopologicalSpace X] : Prop :=
  ∀ x : X, ∃ U : Set X, IsOpen U ∧ x ∈ U ∧ MetrizableSpace U

/-- 3.2 (Smirnov's metrization theorem): a space is metrizable if and only if it is paracompact,
Hausdorff and locally metrizable. -/
theorem metrizableSpace_iff_paracompactSpace_t2Space_isLocallyMetrizable :
    MetrizableSpace X ↔ ParacompactSpace X ∧ T2Space X ∧ IsLocallyMetrizable X := by
  sorry

/-- 3.3 (A. H. Stone): the product of uncountably many copies of the discrete space `ℕ` is not
normal. -/
theorem not_normalSpace_pi_nat {ι : Type*} [Uncountable ι] : ¬ NormalSpace (ι → ℕ) := by
  sorry

end TauCetiRoadmap.MetrizationTheorems
