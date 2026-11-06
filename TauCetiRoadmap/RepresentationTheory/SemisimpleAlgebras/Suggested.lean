import Mathlib
import TauCeti.Algebra.BrauerGroup.Group
import TauCeti.Algebra.CentralSimple.Splitting

/-!
# Semisimple algebras: target signatures

The roadmap is README.md; this file is not the roadmap. It states the headline theorem of the
roadmap against the pinned APIs: Skolem–Noether for a simple source in a finite-dimensional
central simple ambient algebra.

The semisimple block dictionary, Wedderburn uniqueness, density, central-simple tensor and
opposite theory, degree, Brauer operations, splitting fields, index, and real Brauer classification
are consumed results listed in README.md. The central-source versions of conjugacy and
centralizers are consumed as well. So is the centralizer theory of a simple subalgebra B of a
finite-dimensional central simple algebra A, which Tau Ceti proves from simplicity of
B ⊗ₖ Aᵒᵖ: the dimension product dimₖ B · dimₖ Cₐ(B) = dimₖ A
(`TauCeti.finrank_mul_finrank_centralizer_of_isSimpleRing_tensorProduct_mulOpposite`),
simplicity of Cₐ(B) (`Subalgebra.isSimpleRing_centralizer_of_isSimpleRing_tensorProduct`), and
the double centralizer Cₐ(Cₐ(B)) = B (`Subalgebra.centralizer_centralizer_of_isSimpleRing`).
The headline is statable on native carriers; it requires no unavailable carrier and no new
definition.

The file imports Tau Ceti's Brauer group law (`TauCeti.BrauerGroup.instCommGroup`) and re-exports
the splitting predicate `TauCeti.Algebra.IsSplittingField` into this namespace, because
QuadraticFormInvariants reads both through this module; neither is a new declaration.
-/

namespace TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras

export TauCeti.Algebra (IsSplittingField)

universe u v w

/-! ## Layer 5: Skolem-Noether and the centralizer theorem -/

/-- Two algebra homomorphisms from a simple algebra into a finite-dimensional central simple
algebra are conjugate by a unit. No centrality or separability of the source is assumed.
Stacks, Brauer Groups, Theorem 6.1 (tag 074Q). -/
theorem skolemNoether {K : Type u} {A : Type v} {B : Type w}
    [Field K] [Ring A] [Ring B] [Algebra K A] [Algebra K B]
    [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A]
    [IsSimpleRing B] (f g : B →ₐ[K] A) :
    ∃ u : Aˣ, ∀ x : B, g x = (u : A) * f x * (↑u⁻¹ : A) := sorry

end TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras
