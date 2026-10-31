import Mathlib

/-!
# Prismatic cohomology, Part III: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

The stated results are the étale comparison for perfectoid rings of §6.3, the étale
cohomological dimension bound of §6.7 and unique p-divisibility of Picard groups of
§6.27. All three use the Witt-vector presentation `R = W(S)/(ξ)` of an integral
perfectoid ring: `S` is perfect of characteristic `p`, complete for `(ξ₀)`, and `ξ₁` is
a unit (BS22 Theorem 3.10, p.32). This includes perfectoid rings with p-torsion and
imposes no finiteness or smoothness condition. The statements use Mathlib's small
étale site, sheaf cohomology, Witt vectors and Picard group. The étale comparison
needs one definition, `wittFrobeniusMod`, the Frobenius of `W(T)/p^n` induced by
Mathlib's `WittVector.frobenius`; for `T = S[1/ξ₀]` this quotient is the coefficient
ring `W_n(S^♭[1/d])` of §6.3.

The étale comparison for general p-adic formal schemes (§§6.4–6.6), logarithmic de
Rham–Witt and nearby-cycle comparisons (§§6.16, 6.20), syntomic Tate comparison and
discreteness (§§6.26, 6.28), and syntomic connectivity and rigidity (§6.31) are not
stated: the pins do not provide prismatic complexes, Breuil–Kisin twists, the Nygaard
filtration or syntomic complexes. The trace and Beilinson squares and the absolute
curve comparisons (§7.0) also need cyclotomic trace theories, derived de Rham
complexes, the period eigensection ring and coherent sheaves on the schematic curve.
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

/-- The Frobenius of `W(T)/p^n` induced by the Witt-vector Frobenius `WittVector.frobenius`,
which fixes `p`. For `T` perfect of characteristic `p` this is the Artin–Schreier–Witt
Frobenius `F` of `W_n(T)`. -/
noncomputable def wittFrobeniusMod (p : ℕ) [Fact p.Prime] (T : Type u) [CommRing T] (n : ℕ) :
    WittVector p T ⧸ Ideal.span {(p : WittVector p T) ^ n} →+*
      WittVector p T ⧸ Ideal.span {(p : WittVector p T) ^ n} :=
  Ideal.Quotient.lift _ ((Ideal.Quotient.mk _).comp WittVector.frobenius) (by
    intro x hx
    obtain ⟨y, rfl⟩ := Ideal.mem_span_singleton.mp hx
    exact Ideal.Quotient.eq_zero_iff_mem.mpr
      (Ideal.mem_span_singleton.mpr ⟨WittVector.frobenius y, by simp [map_mul, map_pow]⟩))

/-- §6.3 (BS22 Theorem 9.1 for an affine perfectoid base, p.71, proof pp.72–73): for an
integral perfectoid ring `R = W(S)/(ξ)` with tilt `S` and `d = ξ₀`, the étale cohomology
of `Spec R[1/p]` with `Z/p^n` coefficients is the Artin–Schreier–Witt cohomology of
`W_n(S[1/d])`: `H^0` is the kernel and `H^1` the cokernel of `F − 1`, and the groups in
degrees at least two vanish. -/
theorem etale_comparison_perfectoid (p : ℕ) [Fact p.Prime]
    (S : Type u) [CommRing S] [CharP S p] [PerfectRing S p]
    (ξ : WittVector p S) [IsAdicComplete (Ideal.span {ξ.coeff 0}) S]
    (hξ : IsUnit (ξ.coeff 1)) (n : ℕ) :
    let X := Spec (.of (Localization.Away (p : perfectoidQuotient p S ξ)))
    letI := HasExt.standard (Sheaf X.smallEtaleTopology AddCommGrpCat.{u + 1})
    let Λ : Sheaf X.smallEtaleTopology AddCommGrpCat.{u + 1} :=
      (constantSheaf X.smallEtaleTopology AddCommGrpCat.{u + 1}).obj
        (.of (ULift.{u + 1} (ZMod (p ^ n))))
    let W := WittVector p (Localization.Away (ξ.coeff 0)) ⧸
      Ideal.span {(p : WittVector p (Localization.Away (ξ.coeff 0))) ^ n}
    let F : W →+ W :=
      (wittFrobeniusMod p (Localization.Away (ξ.coeff 0)) n).toAddMonoidHom - AddMonoidHom.id W
    Nonempty (Λ.H 0 ≃+ F.ker) ∧ Nonempty (Λ.H 1 ≃+ W ⧸ F.range) ∧
      ∀ i : ℕ, 2 ≤ i → Subsingleton (Λ.H i) := by
  sorry

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
