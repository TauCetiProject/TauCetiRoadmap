import TauCeti.RepresentationTheory.Induction.FiniteDimensional.Basic
import Mathlib

/-!
# Reductive algebraic groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The three synchronized models, prerequisite order, examples, and references
are in `README.md`.

The declarations below are two native signature examples only: the global-sections Hopf
instance and the group object on `Spec`. They do not prototype the anti-equivalence,
the `Γ(Spec A) ≃ A` and `Spec Γ(G) ≃ G` identifications, or the third model. Those complete
Layer 0 targets, including the Yoneda component convention, are specified in `README.md`.
Mathlib's `hopfSpec.fullyFaithful` and `essImage_hopfSpec` and Tau Ceti's point functors are
the interfaces to consume. The finite-dimensional induction example remains a specialization,
not the general coefficient-ring adapter.
-/

open CategoryTheory AlgebraicGeometry CommRingCat Scheme Opposite Spec

namespace TauCetiRoadmap.ReductiveGroups

universe u

variable (R : Type u) [CommRing R]

/-- Native global-section Hopf structure of an affine group scheme over Spec R. -/
noncomputable abbrev globalSectionsHopfAlgebra (G : Scheme.{u})
    [G.Over (Spec (CommRingCat.of R))]
    [GrpObj (G.asOver (Spec (CommRingCat.of R)))] [IsAffine G] :
    HopfAlgebra R Γ(G, ⊤) :=
  AlgebraicGeometry.instHopfAlgebraCarrierObjOppositeOpensCarrierCarrierCommRingCatPresheafOpOpensTopOfGrpObjOverSchemeSpecAsOverOfIsAffine
    (R := CommRingCat.of R)

/-- Native group object on Spec of a commutative Hopf algebra. -/
noncomputable abbrev specGroupObject (A : Type u) [CommRing A] [HopfAlgebra R A] :
    GrpObj ((Spec (CommRingCat.of A)).asOver (Spec (CommRingCat.of R))) := inferInstance

end TauCetiRoadmap.ReductiveGroups

universe u₁ v₁ w₁

namespace TauCetiRoadmap.ReductiveGroups.FiniteHC

variable {k : Type u₁} {G : Type v₁} {L : Type w₁}
variable [Field k] [Group G] [Group L]

/-- Finite-group induction of the inflated L-module along P ≤ G. -/
noncomputable def indFromProjectedLevi (P : Subgroup G) [P.FiniteIndex]
    (π : P →* L) (M : FDRep k L) : FDRep k G :=
  TauCeti.indFDRep (FDRep.of (M.ρ.comp π))

/-- Its dimension is the subgroup index times the dimension of the Levi module. -/
theorem finrank_indFromProjectedLevi (P : Subgroup G) [P.FiniteIndex]
    (π : P →* L) (M : FDRep k L) :
    Module.finrank k (indFromProjectedLevi P π M) = P.index * Module.finrank k M := by
  change Module.finrank k (TauCeti.indFDRep (FDRep.of (M.ρ.comp π))) = _
  exact TauCeti.finrank_indFDRep (A := FDRep.of (M.ρ.comp π))

end TauCetiRoadmap.ReductiveGroups.FiniteHC
