import Mathlib
import TauCeti.NumberTheory.Chebotarev.FrobeniusPrimeSet
import TauCeti.NumberTheory.NumberField.FiniteGaloisIntermediateField

/-!
# Global Galois deformations: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

The dyadic twisting freeness theorem of §4.10 is stated on Mathlib's matrix groups and
local residue fields. The matrix twist has a real body. The freeness statement is algebraic:
it applies to all local coefficient rings with finite residue field of characteristic two,
so in particular to every complete Noetherian coefficient object of the roadmap.
The shared Chebotarev selection theorem of §5.6 uses native finite Galois subextensions,
Frobenius prime sets and residue degrees. Its detection and padding hypotheses are explicit;
Selmer-theoretic applications supply the cohomology spaces and localization maps.

The representability, tangent and obstruction comparisons, presentations and dimension bounds
(§§3.4, 3.6–3.8, 7.2–7.4, 8.2–8.4), ring-level restriction and twisting (§§4.2–4.4),
Taylor–Wiles diamond quotients and generator counts (§§5.4–5.5, 5.8, 8.5), odd and dyadic
finite-level systems (§§6.2–6.4, 6.6), and ACC presentation (§8.7) require the coefficient
categories, local deformation problems, global deformation rings and framed Selmer complexes
specified by the README's suppliers. These objects are absent at the pins. The formal quotient
and determinant torsor (§§4.6–4.7, 4.11) also require formal group actions and torsors on complete
local affine functors. The dyadic Kummer disjointness and auxiliary-prime theorems (§§5.3,
5.7, 8.6) require restricted-ramification cohomology, its field-cutting and localization
maps, and the residual-image interfaces; the polarized branch additionally requires the CHT
group. The Hecke–Galois comparison and point construction (§§6.7–6.8) require unframed
representing rings and continuous determinant laws. These headline signatures await those
objects; Mathlib's ring and matrix carriers alone do not state them.
-/

namespace TauCetiRoadmap.GlobalGaloisDeformations

open Matrix IsDedekindDomain
open NumberField.Chebotarev
open scoped NumberField

/-- The matrix representation obtained by twisting by a character (§§4.4, 4.10). -/
def twist {G : Type*} [Group G] {A : Type*} [CommRing A] (n : ℕ)
    (χ : G →* Aˣ) (ρ : G →* GL (Fin n) A) : G →* GL (Fin n) A :=
  ((Matrix.GeneralLinearGroup.scalar (Fin n)).noncommCoprod (MonoidHom.id _)
    fun u M ↦ Matrix.GeneralLinearGroup.scalar_commute u M).comp (χ.prod ρ)

/-- Dyadic twisting has trivial stabilizers when the residual rank-two image is nonsolvable
(§4.10; Khare–Wintenberger, Lemma 5.1, pp. 46–47). A residually trivial character whose twist
is strictly conjugate to the original representation must be trivial. -/
theorem character_eq_one_of_dyadic_self_twist
    {G : Type*} [Group G] {A : Type*} [CommRing A] [IsLocalRing A]
    [Finite (IsLocalRing.ResidueField A)] [CharP (IsLocalRing.ResidueField A) 2]
    (ρ : G →* GL (Fin 2) A)
    (himage : ¬ Group.IsSolvable
      (((Matrix.GeneralLinearGroup.map (IsLocalRing.residue A)).comp ρ).range))
    (χ : G →* Aˣ) (hχ : ∀ g, IsLocalRing.residue A (χ g) = 1)
    (U : GL (Fin 2) A) (hU : Matrix.GeneralLinearGroup.map (IsLocalRing.residue A) U = 1)
    (hconj : ∀ g, twist 2 χ ρ g = U * ρ g * U⁻¹) :
    χ = 1 := by
  sorry

/-- Shared Chebotarev selection for Selmer detection (§5.6): detecting Frobenius classes and
an admissible padding class give exactly `q` admissible primes outside any finite avoidance set,
all of absolute residue degree one, whose joint localization is injective. -/
theorem exists_primes_jointly_injective
    {F : Type*} [Field F] [NumberField F]
    {k H : Type*} [Field k] [AddCommGroup H] [Module k H] [FiniteDimensional k H]
    {M : HeightOneSpectrum (𝓞 F) → Type*}
    [∀ v, AddCommGroup (M v)] [∀ v, Module k (M v)]
    (loc : ∀ v, H →ₗ[k] M v) (admissible : Set (HeightOneSpectrum (𝓞 F)))
    (detect : ∀ c : H, c ≠ 0 →
      ∃ (L : FiniteGaloisIntermediateField F (AlgebraicClosure F))
        (C : ConjClasses (L ≃ₐ[F] L)) (E : Finset (HeightOneSpectrum (𝓞 F))),
        ∀ v ∈ frobeniusPrimeSet F L C, v ∉ E → v ∈ admissible ∧ loc v c ≠ 0)
    (padding : ∃ (L : FiniteGaloisIntermediateField F (AlgebraicClosure F))
      (C : ConjClasses (L ≃ₐ[F] L)) (E : Finset (HeightOneSpectrum (𝓞 F))),
      ∀ v ∈ frobeniusPrimeSet F L C, v ∉ E → v ∈ admissible)
    (B : Finset (HeightOneSpectrum (𝓞 F))) (q : ℕ) (hq : Module.finrank k H ≤ q) :
    ∃ Q : Finset (HeightOneSpectrum (𝓞 F)), Q.card = q ∧ Disjoint Q B ∧
      (∀ v ∈ Q, v ∈ admissible ∧ v.asIdeal.inertiaDeg ℤ = 1) ∧
      Function.Injective (fun c : H ↦ fun v : Q ↦ loc v.1 c) := by
  sorry

end TauCetiRoadmap.GlobalGaloisDeformations
