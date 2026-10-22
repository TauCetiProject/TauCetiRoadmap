import Mathlib

/-!
# K-theory of schemes, localisation and operations: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These are suggested forms for selected headline theorems; proving them
finishes neither a layer nor the roadmap.

The statement below is the global strict-representative theorem of §1.6: on a qcqs
scheme with the resolution property, every perfect complex is represented in the
derived category by a bounded complex of finite locally free sheaves. The two
predicates express strict perfectness and the elementary local perfectness criterion
on Mathlib's complexes of module sheaves. The resolution property is written directly
as the finite locally free quotient condition, without introducing another predicate.

The enhanced perfect categories and complicial/Frobenius models needed for the other
Layer 1 comparisons and finite descent are absent at the pins (Mathlib 6b7abb3,
Tau Ceti a91d3aa). Layers 2–5 require scheme K/G spectra, their supported localisation
maps, spectral hypercohomology and coniveau towers; the Witt results also need the
enhanced perfect categories of Witt thickenings. Thus localisation, spectral descent,
Gersten exactness and Bloch's formula, Witt hyperdescent, and the projective-bundle,
Bass and blowup formulas have no signatures here. Layers 6–7 additionally require
special λ-ring structures, higher Adams operations, Chow/Chern carriers and their
comparison maps. Adams weight decompositions, Chern-character isomorphisms,
Riemann–Roch and excess intersection likewise remain mathematical targets in the
README without compiled statements here.
-/

namespace TauCetiRoadmap.SchemeKTheoryOperations

open CategoryTheory CategoryTheory.Limits

universe v u

/-- A globally bounded complex with finite locally free terms (README §1.1,
Thomason–Trobaugh, Definition 2.2.2). The bound is on terms, not cohomology. -/
def IsStrictlyPerfect (X : AlgebraicGeometry.Scheme.{u})
    (E : CochainComplex X.Modules ℤ) : Prop :=
  (∃ a b : ℤ, a ≤ b ∧ ∀ i : ℤ, i < a ∨ b < i → IsZero (E.X i)) ∧
  ∀ i : ℤ, SheafOfModules.IsLocallyFree (E.X i) ∧
    SheafOfModules.IsFiniteType (E.X i)

/-- Local quasi-isomorphism from strictly perfect complexes (README §1.3,
Stacks, Definition 20.49.1, tag 08CM, and Lemma 20.49.3, tag 0BCJ). -/
def IsPerfectComplex (X : AlgebraicGeometry.Scheme.{u})
    (E : CochainComplex X.Modules ℤ) : Prop :=
  ∀ x : X, ∃ U : X.Opens, x ∈ U ∧
    ∃ P : CochainComplex (U : AlgebraicGeometry.Scheme).Modules ℤ,
      IsStrictlyPerfect (U : AlgebraicGeometry.Scheme) P ∧
      ∃ f : P ⟶ ((AlgebraicGeometry.Scheme.Modules.restrictFunctor U.ι).mapHomologicalComplex
        (ComplexShape.up ℤ)).obj E, QuasiIso f

/-- On a qcqs scheme with the resolution property, every perfect complex has a
 globally bounded vector-bundle representative in the derived category (README §1.6,
 Stacks, Lemma 36.37.2, tag 0F8F). -/
theorem IsPerfectComplex.exists_strictlyPerfect (X : AlgebraicGeometry.Scheme.{u})
    [CompactSpace X] [QuasiSeparatedSpace X] [HasDerivedCategory.{v} X.Modules]
    (hres : ∀ M : X.Modules, SheafOfModules.IsQuasicoherent.{u} M →
      SheafOfModules.IsFiniteType.{u} M → ∃ V : X.Modules,
        SheafOfModules.IsLocallyFree.{u} V ∧ SheafOfModules.IsFiniteType.{u} V ∧
        ∃ f : V ⟶ M, Epi f)
    (E : CochainComplex X.Modules ℤ) (hE : IsPerfectComplex X E) :
    ∃ P : CochainComplex X.Modules ℤ, IsStrictlyPerfect X P ∧
      Nonempty (DerivedCategory.Q.obj P ≅ DerivedCategory.Q.obj E) := by
  sorry

end TauCetiRoadmap.SchemeKTheoryOperations
