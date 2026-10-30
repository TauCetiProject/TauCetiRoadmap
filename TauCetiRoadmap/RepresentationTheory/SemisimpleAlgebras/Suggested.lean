import Mathlib

/-!
# Semisimple algebras: target signatures

The roadmap is README.md; this file is not the roadmap. It states the headline theorems of the
roadmap against the pinned APIs: Skolem–Noether for a simple source in a finite-dimensional
central simple ambient algebra, and centralizer simplicity and the double-centralizer equality
for a simple subalgebra of that ambient algebra.

The semisimple block dictionary, Wedderburn uniqueness, density, central-simple tensor and
opposite theory, degree, Brauer operations, splitting fields, index, and real Brauer classification
are consumed results listed in README.md. The central-source versions of conjugacy and
centralizers are consumed as well, and so is the dimension product
dimₖ B · dimₖ Cₐ(B) = dimₖ A for a simple subalgebra B, which Tau Ceti proves from simplicity
of B ⊗ₖ Aᵒᵖ (`TauCeti.finrank_mul_finrank_centralizer_of_isSimpleRing_tensorProduct_mulOpposite`).
All three headlines are statable on native carriers; none requires an unavailable carrier or a
new definition.
-/

namespace TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras

universe u v w

/-! ## Layer 5: Skolem–Noether and the centralizer theorem -/

/-- Two algebra homomorphisms from a simple algebra into a finite-dimensional central simple
algebra are conjugate by a unit. No centrality or separability of the source is assumed.
Stacks, Brauer Groups, Theorem 6.1 (tag 074Q). -/
theorem skolemNoether {K : Type u} {A : Type v} {B : Type w}
    [Field K] [Ring A] [Ring B] [Algebra K A] [Algebra K B]
    [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A]
    [IsSimpleRing B] (f g : B →ₐ[K] A) :
    ∃ u : Aˣ, ∀ x : B, g x = (u : A) * f x * (↑u⁻¹ : A) := sorry

/-- The centralizer of a simple subalgebra of a finite-dimensional central simple algebra
is simple, without asserting centrality over the base field.
Stacks, Brauer Groups, Theorem 7.1(1) (tag 074T). -/
theorem centralizer_isSimpleRing {K : Type u} {A : Type v}
    [Field K] [Ring A] [Algebra K A]
    [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A]
    (B : Subalgebra K A) [IsSimpleRing B] :
    IsSimpleRing (Subalgebra.centralizer K (B : Set A)) := sorry

/-- Taking the centralizer twice recovers a simple subalgebra of a finite-dimensional
central simple algebra. Stacks, Brauer Groups, Theorem 7.1(3) (tag 074T). -/
theorem centralizer_centralizer {K : Type u} {A : Type v}
    [Field K] [Ring A] [Algebra K A]
    [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A]
    (B : Subalgebra K A) [IsSimpleRing B] :
    Subalgebra.centralizer K (Set.centralizer (B : Set A)) = B := sorry

end TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras
