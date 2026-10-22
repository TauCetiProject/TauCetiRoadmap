import Mathlib

/-!
# Prismatic cohomology, Part III: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

The stated results are the étale cohomological dimension bound of §6.7 and unique
p-divisibility of Picard groups of §6.27. Both use the Witt-vector presentation
`R = W(S)/(ξ)` of an integral perfectoid ring: `S` is perfect of characteristic `p`,
complete for `(ξ₀)`, and `ξ₁` is a unit (BS22 Theorem 3.10, p.32). This includes
perfectoid rings with p-torsion and imposes no finiteness or smoothness condition.
The statements use Mathlib's small étale site, sheaf cohomology and Picard group.

The étale comparison (§§6.4–6.6), logarithmic de Rham–Witt and nearby-cycle
comparisons (§§6.16, 6.20), syntomic Tate comparison and discreteness (§§6.26, 6.28),
and syntomic connectivity and rigidity (§6.31) are not stated: the pins do not
provide prismatic complexes, Breuil–Kisin twists, the Nygaard filtration or
syntomic complexes. The trace and Beilinson squares and the absolute curve
comparisons (§7.0) also need cyclotomic trace theories, derived de Rham complexes,
the period eigensection ring and coherent sheaves on the schematic curve.
Laurent realization (§7.8), the crystalline lattice equivalence (§7.22), and the
Breuil–Kisin full-faithfulness and comparison theorems (§§7.23–7.25) need the
prismatic site, F-crystal categories, crystalline period functors and Kisin
modules. The existing Tate module, de Rham period-ring carriers and adic
Frobenius quotient do not supply these objects or their comparison maps.
-/

namespace TauCetiRoadmap.PrismaticCohomologyPartIII

open CategoryTheory AlgebraicGeometry

universe u

/-- The native quotient carrier for a perfectoid presentation. The theorems impose
perfection, completeness and the distinguished-coordinate condition. -/
abbrev perfectoidQuotient (p : ℕ) [Fact p.Prime] (S : Type u) [CommRing S]
    (ξ : WittVector p S) :=
  WittVector p S ⧸ Ideal.span {ξ}

/-- §6.7 (BS22 Theorem 11.1, p.85): the algebraic generic fibre of any integral
perfectoid ring has F_p-étale cohomological dimension at most one. An abelian
sheaf killed by `p` is equivalently a sheaf of F_p-modules. -/
theorem etale_cohomology_vanishes_above_one (p : ℕ) [Fact p.Prime]
    (S : Type u) [CommRing S] [CharP S p] [PerfectRing S p]
    (ξ : WittVector p S) [IsAdicComplete (Ideal.span {ξ.coeff 0}) S]
    (hξ : IsUnit (ξ.coeff 1)) :
    let X := Spec (.of (Localization.Away (p : perfectoidQuotient p S ξ)))
    letI := HasExt.standard (Sheaf X.smallEtaleTopology AddCommGrpCat.{u + 1})
    ∀ (F : Sheaf X.smallEtaleTopology AddCommGrpCat.{u + 1}), p • 𝟙 F = 0 →
      ∀ i : ℕ, 1 < i → Subsingleton (F.H i) := by
  sorry

/-- §6.27 (BS22 Corollary 9.7, p.76): the Picard groups of an integral perfectoid
ring and its p-inverted localization are uniquely p-divisible. -/
theorem picard_unique_p_divisibility (p : ℕ) [Fact p.Prime]
    (S : Type u) [CommRing S] [CharP S p] [PerfectRing S p]
    (ξ : WittVector p S) [IsAdicComplete (Ideal.span {ξ.coeff 0}) S]
    (hξ : IsUnit (ξ.coeff 1)) :
    Function.Bijective (fun L : CommRing.Pic (perfectoidQuotient p S ξ) => L ^ p) ∧
      Function.Bijective (fun L : CommRing.Pic
        (Localization.Away (p : perfectoidQuotient p S ξ)) => L ^ p) := by
  sorry

end TauCetiRoadmap.PrismaticCohomologyPartIII
