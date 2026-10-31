import Mathlib

/-!
# Ordinary automorphic forms and modularity lifting: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for selected milestones; proving them
finishes neither a layer nor the roadmap.

The statements here are the Cohen–Macaulay punctured-spectrum connectedness and component
intersection theorems (§4.3), the complete-DVR numerical criterion (§4.20), and Washington's
distinct-prime class-group bound and stabilization in abelian cyclotomic towers (§5.9).
Their definitions use Mathlib's regular sequences, power-series quotients and class groups.

The Skinner–Wiles route itself (nearly ordinary Hecke algebras, pseudo-deformation rings,
pro-modularity, Theorem A and the irreducible-residual theorem) is ClassicalSerreModularity
§I.1's and is not stated here. The roadmap's other headline theorems require objects absent
from the pins: the quaternionic class sets and integral Hilbert Hecke realization of
Layer 1; the nearly ordinary automorphic representations, Hilbert Eisenstein series and
Hilbert Hida families of Layer 2; and the Hilbert newform Galois attachment. Without them,
Theorem B conditional on Hypothesis H (§5.3), the abelian preparation (§5.1a), the lifting
conditional on component support (§5.8) and the χ₂-good seed (§5.10) cannot be stated. The
EPW ordinary new quotient and family specialization objects needed for §§6.3–6.4, and the
Hilbert automorphic objects for solvable descent (§4.6a) and preparation (§6.14), are also
absent. Classical newforms alone do not supply these carriers or their selected ordinary
quotients.

Waldschmidt's p-adic unit-rank theorem (§3.38) requires the Iwasawa logarithm on
`PadicComplex`, which is absent at the pins. These arithmetic results are left without
signatures until their mathematical objects exist.
-/

namespace TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLifting

/-- A Noetherian local ring is Cohen–Macaulay when it has a regular sequence whose length
equals its Krull dimension. This expresses the hypothesis of §4.3 on Mathlib's ring carrier. -/
def IsCohenMacaulayLocal (A : Type*) [CommRing A]
    [IsNoetherianRing A] [IsLocalRing A] : Prop :=
  ∃ parameters : List A, RingTheory.Sequence.IsRegular A parameters ∧
    ringKrullDim A = parameters.length

/-- Skinner–Wiles Appendix A.1 (§4.3): cutting a Cohen–Macaulay local ring by at most
`d - 2` equations leaves a connected punctured spectrum. -/
theorem puncturedSpectrum_connected (A : Type*) [CommRing A]
    [IsNoetherianRing A] [IsLocalRing A]
    (hCM : IsCohenMacaulayLocal A) (d : ℕ) (hdim : ringKrullDim A = d)
    (f : List A) (hproper : Ideal.ofList f ≤ IsLocalRing.maximalIdeal A)
    (hcodim : f.length + 2 ≤ d) :
    IsConnected {x : PrimeSpectrum A |
      Ideal.ofList f ≤ x.asIdeal ∧ x.asIdeal ≠ IsLocalRing.maximalIdeal A} := by
  sorry

/-- Skinner–Wiles Appendix A.2 (§4.3): any nontrivial partition of the components of
`Spec(A/(f))` has two components meeting in a prime of dimension `d - length(f) - 1`.
Minimal primes over `(f)` represent the components. -/
theorem components_meet_in_large_dimension (A : Type*) [CommRing A]
    [IsNoetherianRing A] [IsLocalRing A]
    (hCM : IsCohenMacaulayLocal A) (d : ℕ) (hdim : ringKrullDim A = d)
    (f : List A) (hproper : Ideal.ofList f ≤ IsLocalRing.maximalIdeal A)
    (hcodim : f.length + 2 ≤ d)
    (C₁ C₂ : Set (Ideal A)) (hne₁ : C₁.Nonempty) (hne₂ : C₂.Nonempty)
    (hcover : (Ideal.ofList f).minimalPrimes = C₁ ∪ C₂) (hdisj : Disjoint C₁ C₂) :
    ∃ P₁ ∈ C₁, ∃ P₂ ∈ C₂, ∃ Q : Ideal A,
      Q.IsPrime ∧ P₁ ⊔ P₂ ≤ Q ∧
        ringKrullDim (A ⧸ Q) = ((d - f.length - 1 : ℕ) : WithBot ℕ∞) := by
  sorry

/-- A relative complete intersection is a power-series algebra over the coefficient ring
modulo a regular sequence, with an algebra isomorphism to the given ring (§4.20). -/
def IsRelativeCompleteIntersection (C A : Type*) [CommRing C] [CommRing A]
    [Algebra C A] : Prop :=
  ∃ (n : ℕ) (f : List (MvPowerSeries (Fin n) C)),
    RingTheory.Sequence.IsRegular (MvPowerSeries (Fin n) C) f ∧
    Nonempty ((MvPowerSeries (Fin n) C ⧸ Ideal.ofList f) ≃ₐ[C] A)

/-- De Smit–Rubin–Schoof Criterion I (§4.20), over any complete DVR: the cotangent length
dominates the congruence length, with equality precisely for an isomorphism of complete
intersections. The source need not be finite over the DVR; the target is finite flat. The
lengths are taken in `ℕ∞`: the congruence length is finite because `η ≠ ⊥`, and an infinite
cotangent length makes the inequality hold and both sides of the equivalence false, so no
finiteness hypothesis on the cotangent space is needed. -/
theorem numerical_completeIntersection_criterion (C R T : Type*)
    [CommRing C] [IsDomain C] [IsDiscreteValuationRing C]
    [IsAdicComplete (IsLocalRing.maximalIdeal C) C]
    [CommRing R] [IsNoetherianRing R] [IsLocalRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] [Algebra C R]
    [CommRing T] [IsNoetherianRing T] [IsLocalRing T]
    [IsAdicComplete (IsLocalRing.maximalIdeal T) T] [Algebra C T]
    [Module.Finite C T] [Module.Flat C T]
    (r : R →ₐ[C] T) (hr : Function.Surjective r)
    (ε : R →ₐ[C] C) (δ : T →ₐ[C] C) (hcompat : δ.comp r = ε)
    (hη : Ideal.map δ.toRingHom (Submodule.annihilator (RingHom.ker δ)) ≠ ⊥) :
    let η := Ideal.map δ.toRingHom (Submodule.annihilator (RingHom.ker δ))
    Module.length C (C ⧸ η) ≤ Module.length C (RingHom.ker ε).Cotangent ∧
      (Module.length C (RingHom.ker ε).Cotangent = Module.length C (C ⧸ η) ↔
        Function.Bijective r ∧ IsRelativeCompleteIntersection C R ∧
          IsRelativeCompleteIntersection C T) := by
  sorry

open scoped NumberField

/-- The order of the p-primary subgroup of the ideal class group of a number field (§5.9). -/
noncomputable def pPrimaryClassNumber (p : ℕ) (K : Type*) [Field K] [NumberField K] : ℕ :=
  Nat.card (CommGroup.primaryComponent (ClassGroup (𝓞 K)) p)

/-- Washington's distinct-prime theorem (§5.9): p-primary class-group orders are bounded
and eventually constant along any nested tower of degree-`ℓ^n` extensions of an abelian
number field inside `K(μ_{ℓ^∞})`. The cyclotomic embeddings express containment in
`K(μ_{ℓ^∞})`; the degree and step conditions express the layers and their inclusions. For
odd `ℓ` such a tower is the cyclotomic `ℤ_ℓ`-extension's layers; for `ℓ = 2` other towers
are admitted and reduced to the cyclotomic layers over `K(i)`. -/
theorem cyclotomic_classGroup_primary_stabilizes (K : Type*) [Field K] [NumberField K]
    [IsAbelianGalois ℚ K] (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (hpℓ : p ≠ ℓ)
    (L : ℕ → Type*) [∀ n, Field (L n)] [∀ n, NumberField (L n)]
    [∀ n, Algebra K (L n)] (hdegree : ∀ n, Module.finrank K (L n) = ℓ ^ n)
    (hcyclotomic : ∀ n, ∃ m, Nonempty (L n →ₐ[K] CyclotomicField (ℓ ^ m) K))
    (hstep : ∀ n, Nonempty (L n →ₐ[K] L (n + 1))) :
    (∃ B : ℕ, ∀ n, pPrimaryClassNumber p (L n) ≤ B) ∧
      ∃ n₀ : ℕ, ∀ n ≥ n₀, pPrimaryClassNumber p (L n) = pPrimaryClassNumber p (L n₀) := by
  sorry

end TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLifting
