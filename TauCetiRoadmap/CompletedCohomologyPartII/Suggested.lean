module

public import Mathlib

/-!
# Completed cohomology, homology and arithmetic towers, Part II: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, and is not an
exhaustive list of its targets.

The headline theorems are the finite projective completed chain model with its derived
coinvariant recovery of every finite level (README §§4.2–4.4); finite generation, bounded
torsion and admissibility of completed homology and cohomology, with the Iwasawa-torsion
theorem for semisimple congruence towers (README §§5.1, 5.2, 5.4 and 5.7); the completed
Hochschild–Serre spectral sequence (README §6.1); and the semilocal topological product
decomposition of the completed Hecke algebra (README §8.11).

Only the last is statable at the pins, and it is stated below on native carriers: compatible
sections, maximal spectra and localizations. Each algebraic local factor carries Mathlib's
localization topology `Localization.ringTopology`, which here is the quotient topology from the
compatible-sections ring.

The others are not statable: they need the coherent arithmetic local-system and support tower
(README Layers 0–1), its derived completed object and integral admissible category (Layer 2),
continuous integral duality and completed homology (Layer 3), and the lifted finite-cell model
and completed coefficient tensors (Layer 4), none of which exists at the pinned revisions. For
the same reason the completed descent and derived locally analytic recovery (Layer 6), the
completed support and Iwasawa–Poincaré duality statements (Layer 7), and the Shimura and étale
comparisons and residual localization of the arithmetic tower (Layer 8) have no signatures
here. Generic derived categories and continuous cohomology do not supply these arithmetic
objects. README §8.15 also needs the compatible finite equivariant derived Hecke-image diagram
and its action on all homology groups; no abstract nilpotent quotient is substituted for that
diagram.
-/

@[expose] public section

open CategoryTheory CategoryTheory.Limits

namespace TauCetiRoadmap.CompletedCohomologyPartII

universe u v

variable {J : Type u} [SmallCategory J]

/-! ## Layer 8: Shimura, Galois and Hecke adapters -/

/-- The native ring of compatible finite Hecke-image coordinates (README §8.10).
Its topology is inherited from the product of the discrete coordinate rings. -/
abbrev completedHecke (F : J ⥤ CommRingCat.{v}) : Subring (∀ j, F.obj j) :=
  RingCat.sectionsSubring (F ⋙ forget₂ CommRingCat RingCat)

/-- Semilocal decomposition of the finite-image inverse limit (README §8.11).
Radical kernels over one finite residual base identify all algebraic maximal ideals
and residue fields. The canonical map to the product of algebraic localizations is a
homeomorphism when each factor carries Mathlib's `Localization.ringTopology`; since each
localization map is surjective here, that is the quotient topology. The factors are compact
Hausdorff local topological rings. The index may be any small cofiltered category. -/
theorem completedHecke_decomposition [IsCofiltered J]
    (F : J ⥤ CommRingCat.{v}) [∀ j, Finite (F.obj j)]
    [∀ j, TopologicalSpace (F.obj j)] [∀ j, DiscreteTopology (F.obj j)]
    (j₀ : J) (A₀ : CommRingCat.{v}) [Finite A₀]
    (q : F ⟶ (Functor.const J).obj A₀)
    (hs : ∀ {i j} (g : i ⟶ j), Function.Surjective (F.map g).hom)
    (hq : ∀ j, Function.Surjective (q.app j).hom)
    (hr : ∀ j, RingHom.ker (q.app j).hom ≤ Ideal.jacobson (⊥ : Ideal (F.obj j))) :
    let q₀ : completedHecke F →+* A₀ := (q.app j₀).hom.comp
      ((Pi.evalRingHom (fun j => F.obj j) j₀).comp (completedHecke F).subtype)
    Function.Surjective q₀ ∧
    RingHom.ker q₀ ≤ Ideal.jacobson (⊥ : Ideal (completedHecke F)) ∧
    Finite (MaximalSpectrum (completedHecke F)) ∧
    (∃ labels : MaximalSpectrum A₀ ≃ MaximalSpectrum (completedHecke F),
      ∀ m, (labels m).asIdeal = m.asIdeal.comap q₀ ∧
        Nonempty ((completedHecke F ⧸ (labels m).asIdeal) ≃+* (A₀ ⧸ m.asIdeal))) ∧
    (∀ m : MaximalSpectrum (completedHecke F),
      IsOpen (m.asIdeal : Set (completedHecke F)) ∧
      Finite (completedHecke F ⧸ m.asIdeal)) ∧
    ∃ e : completedHecke F ≃+*
        (∀ m : MaximalSpectrum (completedHecke F), Localization.AtPrime m.asIdeal),
      Continuous e ∧ Continuous e.symm ∧
      (∀ x m, e x m = algebraMap (completedHecke F) (Localization.AtPrime m.asIdeal) x) ∧
      ∀ m : MaximalSpectrum (completedHecke F),
        CompactSpace (Localization.AtPrime m.asIdeal) ∧
        T2Space (Localization.AtPrime m.asIdeal) := by
  sorry

end TauCetiRoadmap.CompletedCohomologyPartII
