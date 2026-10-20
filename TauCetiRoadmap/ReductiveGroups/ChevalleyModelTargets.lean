import TauCeti.LinearAlgebra.RootSystem.SimplyConnectedRootDatum.LieAlgebra.Chevalley
import TauCeti.Algebra.Lie.UniversalEnveloping.Kostant.RootSubgroup.Scheme.ToralClosure.Points
import TauCeti.Algebra.Lie.UniversalEnveloping.Kostant.RootSubgroup.Scheme.ToralClosure.Flat

/-!
# Nonexhaustive integral model construction targets

The complete general-root-datum contract is
ReductiveGroups README9A/9B; this companion exposes its simply connected point
specialization. No implementation or proof is claimed. The single admitted data
family below is the actual finite representation/lattice construction, not an
arbitrary group carrier. Its defining equations, integral frame, full-weight
span, highest lines and change-of-choice comparisons must be proved as specified
in README9A.1c/5 and9B before the construction is implemented. This record itself
only packages the native constructor operands. In particular it is not a
certificate that arbitrary packaged operands realize a root datum.
-/
namespace TauCetiRoadmap.ReductiveGroups.ChevalleyModels
open TauCeti
open TauCeti.UniversalEnvelopingAlgebra

/-- Actual operands of native Kostant toral closure; no private Group field. -/
structure SCRealizationInput (t : DynkinType) (ht : t.Valid) where
  V : Type
  [addV : AddCommGroup V]
  [moduleV : Module ℚ V]
  e : Fin t.numRoots → t.lieAlgebra ht
  h : Fin t.rank → t.lieAlgebra ht
  rho : _root_.UniversalEnvelopingAlgebra ℚ (t.lieAlgebra ht) →ₐ[ℚ] Module.End ℚ V
  lattice : AddSubgroup V
  stable : ∀ u ∈ kostantForm e h, ∀ m ∈ lattice, rho u m ∈ lattice
  nilpotent : ∀ i, IsNilpotent (rho (_root_.UniversalEnvelopingAlgebra.ι ℚ (e i)))
  dimension : ℕ
  basis : Module.Basis (Fin dimension) ℤ lattice
  weight : Fin dimension → Fin t.rank → ℤ
  weightVector : ∀ x, IsCartanWeightVector h rho (weight x) ((basis x : lattice) : V)
  rootWeight : ∀ i j, ⁅h j, e i⁆ =
    (((t.simplyConnectedRootDatum ht).root i j : ℤ) : ℚ) • e i
  weightsGenerate : Submodule.span ℤ (Set.range weight) = ⊤

attribute [instance] SCRealizationInput.addV SCRealizationInput.moduleV

/-- Future whole-family construction from the named normalized Geck frame and
fundamental highest modules, retaining the actual t/validity inputs. -/
noncomputable def canonicalSCInput : (t : DynkinType) → (ht : t.Valid) →
    SCRealizationInput t ht := by sorry

noncomputable def coordinate (t : DynkinType) (ht : t.Valid) : CommHopfAlgCat ℤ :=
  let D := canonicalSCInput t ht
  CommHopfAlgCat.quotient (GeneralLinear.coordinateHopfAlgebra ℤ D.dimension)
    (kostantToralDefiningIdeal D.e D.h D.rho D.lattice D.stable D.nilpotent D.basis D.weight)

/-- Native GL-subgroup presentation of the same quotient-Hopf points.
The actual convolution/scheme equivalences in ToralClosure.Points must be
retained; this is not a subgroup defined by pointwise generator closure. -/
noncomputable abbrev Points (t : DynkinType) (ht : t.Valid) (A : Type) [CommRing A] :=
  let D := canonicalSCInput t ht
  kostantToralPointsSubgroup D.e D.h D.rho D.lattice D.stable D.nilpotent D.basis D.weight A

noncomputable abbrev rootPoint (t : DynkinType) (ht : t.Valid) (A : Type) [CommRing A]
    (i : Fin t.numRoots) : Multiplicative A →* Points t ht A :=
  let D := canonicalSCInput t ht
  kostantToralRootSubgroupPoints D.e D.h D.rho D.lattice D.stable D.nilpotent D.basis D.weight i A

noncomputable abbrev torusPoint (t : DynkinType) (ht : t.Valid) (A : Type) [CommRing A] :
    (Fin t.rank → Aˣ) →* Points t ht A :=
  let D := canonicalSCInput t ht
  kostantToralWeightTorusPoints D.e D.h D.rho D.lattice D.stable D.nilpotent D.basis D.weight A

/-- Concrete specialization of the native pinning equation, retaining its
weight-vector/root-eigenvalue obligations in canonicalSCInput. -/
theorem torusPoint_conj_rootPoint (t : DynkinType) (ht : t.Valid) (A : Type) [CommRing A]
    (s : Fin t.rank → Aˣ) (α : Fin t.numRoots) (u : A) :
    torusPoint t ht A s * rootPoint t ht A α (.ofAdd u) * (torusPoint t ht A s)⁻¹ =
      rootPoint t ht A α (.ofAdd
        ((∏ i, ((s i : Aˣ) ^ ((t.simplyConnectedRootDatum ht).root α i) : Aˣ) : A) * u)) := by
  sorry

end TauCetiRoadmap.ReductiveGroups.ChevalleyModels
