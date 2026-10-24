import TauCetiRoadmap.ProfiniteCohomology.Suggested
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat

/-!
# PC11.U: compare the two actual canonical continuous-cohomology choices

The failed predecessor established equal coefficient carrier levels, not equality of
`continuousCohomology.{0,u,u}` and `continuousCohomology.{0,u,0}`. This file specifies the
missing producer on the actual homogeneous complexes and their cycles/boundaries presentations.
It does not redefine dimension or assert arbitrary coefficient-universe invariance.

All new `sorry` bodies below are honest construction/proof targets, with their maps fixed in
README PC11.U. They have not been compiled. In particular the canonical presentations must be
built from kernels/cokernels and their universal properties, never by another guessed `rfl`.
-/

set_option autoImplicit false

namespace TauCetiRoadmap.ProfiniteCohomology.UniverseComparison

open CategoryTheory

universe u

variable (G M : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
  [DistribMulAction G M] [ContinuousSMul G M]

/-- The actual canonical homogeneous complex at the shared extra parameter zero. -/
abbrev sharedCochains : CochainComplex (TopModuleCat.{u} ℤ) ℕ :=
  TopRep.homogeneousCochains.{0,u,0} (TauCeti.ofDiscreteModule ℤ G M)

/-- The actual canonical homogeneous complex at the native repeated extra parameter u. -/
abbrev nativeCochains : CochainComplex (TopModuleCat.{u} ℤ) ℕ :=
  TopRep.homogeneousCochains.{0,u,u} (TauCeti.ofDiscreteModule ℤ G M)

/-- The actual resolution objects before taking invariants, at the two observed choices. -/
abbrev nativeResolution (n : ℕ) :=
  TopRep.resolutionX.{0,u,u} (TauCeti.ofDiscreteModule ℤ G M) n

abbrev sharedResolution (n : ℕ) :=
  TopRep.resolutionX.{0,u,0} (TauCeti.ofDiscreteModule ℤ G M) n

/-- The concrete recursive continuous linear comparison. The next two equations fix
all nested evaluation values; it is not an arbitrary choice of a module isomorphism. -/
noncomputable def resolutionTermEquiv (n : ℕ) :
    (nativeResolution G M n).V ≃L[ℤ] (sharedResolution G M n).V := by
  sorry

/-- The coefficient carrier is unchanged in resolution degree zero. -/
theorem resolutionTermEquiv_zero (m : M) : resolutionTermEquiv G M 0 m = m := by
  sorry

/-- Forward postcomposition fixes the comparison on every nested function value. -/
theorem resolutionTermEquiv_succ (n : ℕ)
    (f : (nativeResolution G M (n + 1)).V) (g : G) :
    resolutionTermEquiv G M (n + 1) f g = resolutionTermEquiv G M n (f g) := by
  sorry

/-- The inverse postcomposes with the preceding inverse, retaining the same topology. -/
theorem resolutionTermEquiv_symm_succ (n : ℕ)
    (f : (sharedResolution G M (n + 1)).V) (g : G) :
    (resolutionTermEquiv G M (n + 1)).symm f g =
      (resolutionTermEquiv G M n).symm (f g) := by
  sorry

/-- The comparison is equivariant for the actual coinduced diagonal actions. -/
theorem resolutionTermEquiv_equivariant (n : ℕ) (g : G)
    (x : (nativeResolution G M n).V) :
    resolutionTermEquiv G M n ((nativeResolution G M n).ρ g x) =
      (sharedResolution G M n).ρ g (resolutionTermEquiv G M n x) := by
  sorry

/-- Recursively postcompose nested continuous maps with the preceding-degree comparison,
then restrict to invariant submodules. The inverse uses the inverse postcomposition.
The README fixes the value maps in every resolution degree before invariants are taken. -/
noncomputable def cochainTermIso (n : ℕ) :
    (nativeCochains G M).X n ≅ (sharedCochains G M).X n := by
  sorry

/-- On an actual invariant cochain, the degree component is the fixed resolution map. -/
theorem cochainTermIso_value (n : ℕ) (z : (nativeCochains G M).X n) :
    ((cochainTermIso G M n).hom z).val = resolutionTermEquiv G M (n + 1) z.val := by
  sorry

/-- Compatibility follows from the actual recursion d_(n+1)=const-C(G,d_n),
not from an unidentified quasi-isomorphism or a local-compactness exponential law. -/
theorem cochainTermIso_comm (i j : ℕ) (hij : i + 1 = j) :
    (cochainTermIso G M i).hom ≫ (sharedCochains G M).d i j =
      (nativeCochains G M).d i j ≫ (cochainTermIso G M j).hom := by
  sorry

/-- Assemble the concrete degree maps into an isomorphism of the actual complexes. -/
noncomputable def cochainUniverseIso : nativeCochains G M ≅ sharedCochains G M :=
  HomologicalComplex.Hom.isoOfComponents (cochainTermIso G M)
    (cochainTermIso_comm G M)

section CompatiblePairs

variable (H N : Type u) [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
  [AddCommGroup N] [TopologicalSpace N] [DiscreteTopology N]
  [DistribMulAction H N] [ContinuousSMul H N]
  (φ : H →ₜ* G) (f : M →ₗ[ℤ] N)
  (hf : ∀ (h : H) (m : M), f (φ h • m) = h • f m)

/-- Existing native compatible-pair map, with the repeated-parameter complexes fixed. -/
noncomputable def nativePairMap : nativeCochains G M ⟶ nativeCochains H N :=
  ContinuousCohomology.cochainsMap φ
    (TauCeti.ofDiscreteModulePair (φ : H →* G) f hf)

/-- The same native map at the fixed shared-parameter complexes. -/
noncomputable def sharedPairMap : sharedCochains G M ⟶ sharedCochains H N :=
  ContinuousCohomology.cochainsMap φ
    (TauCeti.ofDiscreteModulePair (φ : H →* G) f hf)

/-- Recursively precompose each group coordinate by φ and postcompose by f.
This one square includes equivariant coefficient maps and restrictions as specializations. -/
theorem cochainUniverseIso_naturality :
    nativePairMap G M H N φ f hf ≫ (cochainUniverseIso H N).hom =
      (cochainUniverseIso G M).hom ≫ sharedPairMap G M H N φ f hf := by
  sorry

end CompatiblePairs

/-- Use the actual short complex, whose degree-zero incoming differential is zero.
No quotient is taken by a closure of a boundary range. -/
noncomputable abbrev sharedModuleShort (n : ℕ) : ShortComplex (ModuleCat.{u} ℤ) :=
  ((sharedCochains G M).sc n).map (forget₂ (TopModuleCat.{u} ℤ) (ModuleCat.{u} ℤ))

/-- The kernel occurring in the native explicit ModuleCat homology data. -/
noncomputable abbrev commonCycles (n : ℕ) : ModuleCat.{u} ℤ :=
  (sharedModuleShort G M n).moduleCatLeftHomologyData.K

/-- Boundaries are the actual incoming differential restricted to that kernel. -/
noncomputable abbrev commonBoundaries (n : ℕ) : Submodule ℤ (commonCycles G M n) :=
  (sharedModuleShort G M n).moduleCatLeftHomologyData.f'.hom.range

/-- This local computational presentation is the existing ker/range quotient, not a
second public cohomology or dimension. Both canonical objects will map to this one quotient. -/
noncomputable abbrev commonQuotient (n : ℕ) : ModuleCat.{u} ℤ :=
  (sharedModuleShort G M n).moduleCatLeftHomologyData.H

/-- Identify the shared canonical cycles with their explicit kernel, preserving inclusion. -/
noncomputable def sharedCyclesEquiv (n : ℕ) :
    (sharedCochains G M).cycles n ≃ₗ[ℤ] commonCycles G M n := by
  sorry

/-- Identify native cycles via cochainUniverseIso and the same explicit shared kernel. -/
noncomputable def nativeCyclesEquiv (n : ℕ) :
    (nativeCochains G M).cycles n ≃ₗ[ℤ] commonCycles G M n := by
  sorry

/-- The native cycle map has the exact cochain component already constructed. -/
theorem nativeCyclesEquiv_inclusion (n : ℕ) (z : (nativeCochains G M).cycles n) :
    (sharedModuleShort G M n).moduleCatLeftHomologyData.i.hom
        (nativeCyclesEquiv G M n z) =
      (cochainUniverseIso G M).hom.f n ((nativeCochains G M).iCycles n z) := by
  sorry

/-- The shared cycle map preserves the actual inclusion into the same degree object. -/
theorem sharedCyclesEquiv_inclusion (n : ℕ) (z : (sharedCochains G M).cycles n) :
    (sharedModuleShort G M n).moduleCatLeftHomologyData.i.hom
        (sharedCyclesEquiv G M n z) =
      (sharedCochains G M).iCycles n z := by
  sorry

/-- The shared incoming differential lands in the exact explicit boundary range.
At n=0 its short-complex incoming map is zero, so the statement also fixes that branch. -/
theorem sharedCyclesEquiv_boundary (n : ℕ)
    (x : (sharedModuleShort G M n).X₁) :
    sharedCyclesEquiv G M n
        ((sharedCochains G M).toCycles ((ComplexShape.up ℕ).prev n) n x) =
      (sharedModuleShort G M n).moduleCatToCycles x := by
  sorry

/-- The native incoming differential is carried to the shared one on actual values.
The inverse chain map gives the reverse containment of boundary images. -/
theorem nativeCyclesEquiv_boundary (n : ℕ)
    (x : (nativeCochains G M).X ((ComplexShape.up ℕ).prev n)) :
    nativeCyclesEquiv G M n
        ((nativeCochains G M).toCycles ((ComplexShape.up ℕ).prev n) n x) =
      (sharedModuleShort G M n).moduleCatToCycles
        ((cochainUniverseIso G M).hom.f ((ComplexShape.up ℕ).prev n) x) := by
  sorry

/-- The actual small-parameter canonical homology, computed by explicit kernel/cokernel
homology data and its universal comparison, not presumed definitionally equal to it. -/
noncomputable def sharedCanonicalPresentation (n : ℕ) :
    continuousCohomology.{0,u,0} n (TauCeti.ofDiscreteModule ℤ G M) ≃ₗ[ℤ]
      commonQuotient G M n := by
  sorry

/-- The actual repeated-parameter canonical homology mapped to the very same quotient.
First use nativeCyclesEquiv and its boundary compatibility, then the same cokernel property. -/
noncomputable def nativeCanonicalPresentation (n : ℕ) :
    continuousCohomology.{0,u,u} n (TauCeti.ofDiscreteModule ℤ G M) ≃ₗ[ℤ]
      commonQuotient G M n := by
  sorry

/-- The shared presentation sends an actual canonical cycle class to its quotient class. -/
theorem sharedCanonicalPresentation_class (n : ℕ)
    (z : (sharedCochains G M).cycles n) :
    sharedCanonicalPresentation G M n ((sharedCochains G M).homologyπ n z) =
      (sharedModuleShort G M n).moduleCatLeftHomologyData.π.hom
        (sharedCyclesEquiv G M n z) := by
  sorry

/-- The native presentation sends the transported actual canonical cycle to the same class. -/
theorem nativeCanonicalPresentation_class (n : ℕ)
    (z : (nativeCochains G M).cycles n) :
    nativeCanonicalPresentation G M n ((nativeCochains G M).homologyπ n z) =
      (sharedModuleShort G M n).moduleCatLeftHomologyData.π.hom
        (nativeCyclesEquiv G M n z) := by
  sorry

/-- The required all-degree additive comparison is a concrete composite of the two
presentations. Its inverse is the opposite composite, with no chosen group shrinking. -/
noncomputable def canonicalCohomologyAddEquiv (n : ℕ) :
    continuousCohomology.{0,u,u} n (TauCeti.ofDiscreteModule ℤ G M) ≃+
      continuousCohomology.{0,u,0} n (TauCeti.ofDiscreteModule ℤ G M) :=
  ((nativeCanonicalPresentation G M n).trans
    (sharedCanonicalPresentation G M n).symm).toAddEquiv

/-- Vanishing is transferred through the actual additive equivalence in both directions. -/
theorem canonicalCohomology_subsingleton_iff (n : ℕ) :
    Subsingleton (continuousCohomology.{0,u,u} n (TauCeti.ofDiscreteModule ℤ G M)) ↔
      Subsingleton (continuousCohomology.{0,u,0} n (TauCeti.ofDiscreteModule ℤ G M)) := by
  let e := canonicalCohomologyAddEquiv G M n
  constructor
  · intro h
    letI := h
    exact ⟨fun x y => e.symm.injective (Subsingleton.elim _ _)⟩
  · intro h
    letI := h
    exact ⟨fun x y => e.injective (Subsingleton.elim _ _)⟩

end TauCetiRoadmap.ProfiniteCohomology.UniverseComparison
