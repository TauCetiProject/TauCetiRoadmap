module

public import Mathlib
public import TauCeti.RingTheory.Affinoid.PowerBounded
public import TauCeti.AlgebraicGeometry.Rigid.Affinoid.Site
public import TauCeti.RingTheory.Japanese

/-!
# Rigid analytic geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, on the pinned carriers: the
affinoid predicate `TauCeti.IsAffinoidAlgebra`, the supremum seminorm `TauCeti.supSeminorm`, the
Japanese-ring predicate `TauCeti.Ring.IsJapanese`, the poset `TauCeti.AffinoidSubdomain` of
affinoid subdomains of `Sp A` with its presheaf of coordinate algebras
`TauCeti.AffinoidSubdomain.presheaf` and its weak G-topology
`TauCeti.AffinoidSubdomain.weakGTopology`. No definition is made here.

Stated below, because the pinned Tau Ceti does not prove them: finiteness of normalisation for
affinoid domains (§1.2: an affinoid domain is Japanese, in every characteristic); the Banach
function algebra theorem of §2.2 (on a reduced affinoid algebra every complete algebra norm is
bounded by a multiple of the supremum seminorm; the reverse bound is the pinned
`TauCeti.IsAffinoidAlgebra.supSeminorm_le_norm`); and Tate's acyclicity theorem in its sheaf form
(Layer 5: the presheaf of coordinate algebras is a sheaf for the weak affinoid G-topology). The
higher Čech vanishing and the module form of Tate acyclicity stay README targets.

Kiehl's almost noetherianity of presentation rings and its noetherian corollary for discretely
valued `K` are AdicSpacesPartIII R3.6's (*almost-noetherian-integral-affinoid-modules*); §2.3
cites them and states nothing in their place.

Proved by the pinned Tau Ceti, so not restated: the algebraic theorems of Layers 0–1 and the
supremum theorems of Layers 1–2 that the README cites by their pinned names (weak stability of
complete and perfect fields, the residue norm of a presentation, quotients and finite extensions,
restricted series over an affinoid with their universal property, quotient topologies,
independence of presentation and equivalence of complete norms, noetherianity, the Jacobson
property, Noether normalisation in the Krull dimension, finite maximal residue fields, the
height formula for affinoid domains and its componentwise form, the strict-polyradius criterion,
the closed-embedding theorem for finite injective maps, boundedness and maximum modulus of the
supremum seminorm, its power multiplicativity and nilradical kernel, the uniform value-group
exponent, the power-bounded and topologically nilpotent characterisations, the reduced-quotient
criterion for a ring of definition and presentation-ring integrality), the classical points of
`Spa(A,A°)` of §8.2, and the numerical slope predicates, decomposition and projector of §7.2
under `TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean`.

Not statable at the pins, so stated nowhere in this file: the category of rigid spaces with its
gluing and the Kiehl-proper composition law (§§6.2–6.3), which need a rigid-space carrier; the
quasi-Stein theorem (§7.3), Kiehl's proper mapping theorem with its base-change and
formal-functions statements (§§7.4–7.5) and proper GAGA (§8.4), which need rigid spaces, coherent
sheaves on them and rigid analytification; rigid analytification itself (§8.1), which needs the
rigid category; and the rigid–adic equivalence (§8.3), which needs the rigid category and the
functor to adic spaces. These are README targets with their intended signatures.
-/

namespace TauCetiRoadmap.RigidAnalyticGeometry

noncomputable section

@[expose] public section

open Topology

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-! ## Layer 1: affinoid algebras and their topology -/

section Normalisation

variable {A : Type*} [CommRing A] [IsDomain A] [Algebra K A]

/-- Finiteness of normalisation (§§0.2 and 1.2; BGR 6.1.2 through 5.3.1 and 3.5.3): an
affinoid domain is Japanese, that is, its integral closure in every finite extension of its
fraction field is a finite module, inseparable extensions included. An affinoid domain is finite
over a Tate algebra, and the Tate algebra is Japanese by the weak stability of its Gauss fraction
field; `TauCeti.Ring.IsJapanese.of_finite` transfers the property. The zero-variable case is a
finite extension of `K`, a field, which is Japanese trivially. -/
theorem isJapanese_of_isAffinoidAlgebra (hA : TauCeti.IsAffinoidAlgebra K A) :
    TauCeti.Ring.IsJapanese A := by
  sorry

end Normalisation

/-! ## Layer 2: supremum seminorm, reduction and integral models -/

section BanachFunctionAlgebra

variable {A : Type*} [NormedCommRing A] [NormedAlgebra K A] [IsUltrametricDist A] [CompleteSpace A]

/-- Banach function algebra theorem (BGR §6.2.4): on a reduced affinoid algebra, every complete
ultrametric algebra norm is bounded by a constant multiple of the supremum seminorm, so the two
are equivalent. The reverse inequality `|f|sup ≤ ‖f‖` holds for every affinoid algebra and is the
pinned `TauCeti.IsAffinoidAlgebra.supSeminorm_le_norm`. Reducedness is necessary: in
`K⟨T⟩/(T²)` with its quotient norm, `T` has norm one and supremum seminorm zero. -/
theorem banachFunctionAlgebra [IsReduced A] (hA : TauCeti.IsAffinoidAlgebra K A) :
    ∃ C : ℝ, 0 < C ∧ ∀ f : A, ‖f‖ ≤ C * TauCeti.supSeminorm K f := by
  sorry

end BanachFunctionAlgebra

/-! ## Layer 5: Čech comparison and acyclicity -/

section Acyclicity

open CategoryTheory in
/-- Tate's acyclicity theorem, sheaf form (Layer 5; BGR 8.2.1/1, Kiehl-AB Hilfssatz 1.3): the
presheaf of coordinate algebras on the affinoid subdomains of `Sp A` is a sheaf for the
Grothendieck topology of the weak affinoid G-topology, whose covers are the families of affinoid
subdomains with a finite affinoid subcover. For the Laurent cover of the unit disc this is the
exactness of `0 → K⟨T⟩ → K⟨T/ϖ⟩ × K⟨ϖ/T⟩ → K⟨T/ϖ, ϖ/T⟩`; for `A = 0` the empty cover of the
empty subdomain forces its coordinate algebra to be the zero ring. The vanishing of the higher
Čech cohomology and the module form are README targets. -/
theorem isSheaf_affinoidSubdomain_presheaf (A : Type*) [CommRing A] [Algebra K A]
    [Fact (TauCeti.IsAffinoidAlgebra K A)] :
    Presheaf.IsSheaf
      (TauCeti.AffinoidSubdomain.weakGTopology (K := K) (A := A)).grothendieckTopology
      (TauCeti.AffinoidSubdomain.presheaf (K := K) (A := A)) := by
  sorry

end Acyclicity

end

end

end TauCetiRoadmap.RigidAnalyticGeometry
