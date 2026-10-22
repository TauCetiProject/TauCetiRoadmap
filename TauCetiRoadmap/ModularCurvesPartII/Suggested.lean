import Mathlib
import TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Composite
import TauCeti.NumberTheory.ModularForms.QExpansion.Basic

/-!
# Modular curves, Part II: headline theorem statements

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`; these statements are acceptance targets for the results named below.

The statements expressible at the pins are Serre's local regular-invariants criterion
in its equivalent principal-inertia form (§0.2), perfection of the full weight-two
Hecke first-coefficient pairing over ℂ (§7.6), the congruence subgroup property of
SL₂(ℤ[1/p]) (§15.3), the two principal-level Ihara kernel bounds (§§15.6, 15.10), and
congruence invariance of ordinary characters (§15.9), and compact Ihara injectivity
in its parabolic-character formulation (§15.7). The three definitions below
supply the actual operator image, its coefficient pairing and congruence characters.

The geometric headline statements are deferred here because their objects are absent
from the pinned libraries:

* Lattice and modular uniformization, cusp fields and connected fixed-pairing or paired
  twisted curves (Layers 1, 3–6, 8 and 10) need complex scheme analytification, the marked
  torus family and the algebraic modular curves with their compactifications.
* Generalized-curve contraction and integral level stacks, coarse curves and their
  base-change theorems (Layers 0 and 2–5), together with the geometric correspondences
  (Layer 9), need generalized elliptic curves, polygon families and moduli stacks.
* The differential/Hecke dictionary (Layer 7), bad fibres and their degeneration data
  (Layers 11–12), and modular Jacobian functoriality and integral differential duality
  (Layer 13) need those modular families, their relative Jacobians, integral models and
  dualizing sheaves. The rational geometric realization of the pairing in §7.6 also
  needs the differential space on X₀(N) and its rational Tate chart.
* The Shimura isomorphism and rank-two Hecke freeness (Layer 14), the geometric
  cohomology and saturation formulation of Ihara (§15.7), Shimura's dimension theorem
  for A_f (Layer 16),
  and Eichler–Shimura, modular monodromy and Taylor–Wiles freeness/augmentation
  (Layer 17) need the actual modular cohomology, Hecke actions, abelian quotients and
  auxiliary covers. Abstract cohomology and abelian-variety carriers alone do not
  define these objects.
-/

namespace TauCetiRoadmap.ModularCurvesPartII

noncomputable section

open IsLocalRing

/-- Serre's regular-invariants criterion in its equivalent principal-inertia form
(README §0.2). The action fixes the residue field, its order is invertible there,
and the regular local ring is finite over its fixed subring; mixed characteristic
is included. -/
theorem regularInvariants_iff_principalInertia
    (A G : Type*) [CommRing A] [IsRegularLocalRing A]
    [Group G] [Fintype G] [MulSemiringAction G A]
    [Module.Finite (FixedPoints.subring A G) A]
    (htame : IsUnit (Fintype.card G : ResidueField A))
    (hresidue : ∀ (g : G) (a : A), residue A (g • a) = residue A a) :
    IsRegularLocalRing (FixedPoints.subring A G) ↔
      Subgroup.closure {g : G | (Ideal.span (Set.range fun a : A => g • a - a)).IsPrincipal} = ⊤ := by
  sorry

/-! ## The full weight-two Hecke pairing -/

open HeckeRing.GL2

local notation "S₂(" N ")" =>
  cuspFormCharSpace (N := N) (2 : ℤ) (1 : (ZMod N)ˣ →* ℂˣ)

/-- The full complex Hecke image on weight-two trivial-character cusp forms, generated
by every positive-index operator, including the bad-prime blocks (README §7.5). -/
def analyticFullHeckeAlgebra (N : ℕ) [NeZero N] :
    Subalgebra ℂ (Module.End ℂ S₂(N)) :=
  Algebra.adjoin ℂ (Set.range fun n : ℕ+ =>
    heckeRingHomCuspCharSpace 2 (1 : (ZMod N)ˣ →* ℂˣ)
      (heckeTCompositeGamma0 N n))

/-- The complex first-coefficient pairing `β(T,f)=a₁(Tf)`, on the full operator image
and the whole weight-two trivial-character cusp space (README §7.5). -/
def firstCoefficientHeckePairing (N : ℕ) [NeZero N] :
    analyticFullHeckeAlgebra N →ₗ[ℂ] S₂(N) →ₗ[ℂ] ℂ :=
  ((LinearMap.llcomp ℂ S₂(N) S₂(N) ℂ)
    ((CuspForm.qExpansionCoeffₗ (by norm_num) (TauCeti.one_mem_strictPeriods_Gamma1_map N)
      2 1).comp (cuspFormCharSpace (N := N) 2 (1 : (ZMod N)ˣ →* ℂˣ)).subtype)).comp
    (analyticFullHeckeAlgebra N).val.toLinearMap

/-- The full Hecke first-coefficient pairing is perfect over `ℂ`, identifying each
space with the other's dual (README §7.6). -/
theorem perfectHeckePairing (N : ℕ) [NeZero N] :
    (firstCoefficientHeckePairing N).IsPerfPair := by
  sorry

/-! ## Congruence subgroups and Ihara's theorem -/

/-- Every finite-index subgroup of SL₂(ℤ[1/p]) contains a principal congruence
subgroup of positive level prime to p (README §15.3). The coefficient ring is any
Mathlib realization of ℤ[1/p]; reduction is the native quotient by the ideal (m). -/
theorem sArithmetic_congruenceSubgroupProperty (p : ℕ) (hp : p.Prime)
    (R : Type*) [CommRing R] [Algebra ℤ R] [IsLocalization.Away (p : ℤ) R]
    (H : Subgroup (Matrix.SpecialLinearGroup (Fin 2) R)) [H.FiniteIndex] :
    ∃ m : ℕ, 0 < m ∧ m.Coprime p ∧
      (Matrix.SpecialLinearGroup.map (Ideal.Quotient.mk (Ideal.span {(m : R)}))).ker ≤ H := by
  sorry

/-- Principal-level ordinary characters that vanish at a deeper principal level. -/
def IsCongruenceCharacter (N q : ℕ)
    (ψ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q)) : Prop :=
  ∃ M : ℕ, 0 < M ∧ N ∣ M ∧
    ∀ (g : CongruenceSubgroup.Gamma N), g.val ∈ CongruenceSubgroup.Gamma M →
      ψ (Additive.ofMul g) = 0

/-- An agreeing pair of ordinary characters under the two principal-level degeneracy
restrictions is congruence (README §15.6; CDT Lemma 4.6.2). The second leg is specified
by conjugation with `diag(p,1)`; the coefficient prime may equal p. -/
theorem iharaPrincipal_congruenceKernel (N p q : ℕ) (hN : 3 ≤ N)
    (hp : p.Prime) (hq : q.Prime) (hpN : ¬ p ∣ N)
    (c : ↥(CongruenceSubgroup.Gamma N ⊓ CongruenceSubgroup.Gamma0 p) →*
      CongruenceSubgroup.Gamma N)
    (hc : ∀ g, (c g).val.val.map (Int.castRingHom ℚ) =
      Matrix.diagonal ![(p : ℚ), 1] * g.val.val.map (Int.castRingHom ℚ) *
        Matrix.diagonal ![(p : ℚ)⁻¹, 1])
    (ψ φ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q))
    (hagree : ∀ g, ψ (Additive.ofMul ⟨g.val, g.property.1⟩) =
      φ (Additive.ofMul (c g))) :
    IsCongruenceCharacter N q ψ ∧ IsCongruenceCharacter N q φ := by
  sorry

/-- Compact Ihara injectivity in the character description of compact H¹
(README §15.7). For N ≥ 5, the parabolic elements of Γ₁(N) have trace 2;
killing them is exactly the condition that an ordinary character extends across
the cusps. Every coefficient prime is allowed, including primes dividing Np. -/
theorem compactIhara_characters (N p q : ℕ) (hN : 5 ≤ N)
    (hp : p.Prime) (hq : q.Prime) (hpN : ¬ p ∣ N)
    (c : ↥(CongruenceSubgroup.Gamma1 N ⊓ CongruenceSubgroup.Gamma0 p) →*
      CongruenceSubgroup.Gamma1 N)
    (hc : ∀ g, (c g).val.val.map (Int.castRingHom ℚ) =
      Matrix.diagonal ![(p : ℚ), 1] * g.val.val.map (Int.castRingHom ℚ) *
        Matrix.diagonal ![(p : ℚ)⁻¹, 1])
    (ψ φ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma1 N)) (ZMod q))
    (hψ : ∀ g : CongruenceSubgroup.Gamma1 N, g.val.val.trace = 2 →
      ψ (Additive.ofMul g) = 0)
    (hφ : ∀ g : CongruenceSubgroup.Gamma1 N, g.val.val.trace = 2 →
      φ (Additive.ofMul g) = 0)
    (hagree : ∀ g, ψ (Additive.ofMul ⟨g.val, g.property.1⟩) =
      φ (Additive.ofMul (c g))) :
    ψ = 0 ∧ φ = 0 := by
  sorry

/-- A character whose every ambient conjugation difference is congruence is itself
congruence (README §15.9; CDT Corollary 4.5.3). The ambient action factors through
`SL₂(ℤ/N)` because inner conjugations fix additive characters. -/
theorem congruenceClasses_invariant (N q : ℕ) (hN : 3 ≤ N) (hq : q.Prime)
    (ψ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q)) :
    letI : (CongruenceSubgroup.Gamma N).Normal := CongruenceSubgroup.Gamma_normal N
    (∀ g : Matrix.SpecialLinearGroup (Fin 2) ℤ, IsCongruenceCharacter N q
      (ψ.comp (MulAut.conjNormal g).toMonoidHom.toAdditive - ψ)) →
        IsCongruenceCharacter N q ψ := by
  sorry

/-- Agreement after restriction to `Γ(N) ∩ Γ₁(p)` still forces both ordinary
characters to be congruence (README §15.10; CDT Lemma 4.6.3), for every coefficient
prime, including primes dividing the intermediate covering degree. -/
theorem iharaPrincipalGamma1_congruenceKernel (N p q : ℕ) (hN : 3 ≤ N)
    (hp : p.Prime) (hq : q.Prime) (hpN : ¬ p ∣ N)
    (c : ↥(CongruenceSubgroup.Gamma N ⊓ CongruenceSubgroup.Gamma1 p) →*
      CongruenceSubgroup.Gamma N)
    (hc : ∀ g, (c g).val.val.map (Int.castRingHom ℚ) =
      Matrix.diagonal ![(p : ℚ), 1] * g.val.val.map (Int.castRingHom ℚ) *
        Matrix.diagonal ![(p : ℚ)⁻¹, 1])
    (ψ φ : AddMonoidHom (Additive (CongruenceSubgroup.Gamma N)) (ZMod q))
    (hagree : ∀ g, ψ (Additive.ofMul ⟨g.val, g.property.1⟩) =
      φ (Additive.ofMul (c g))) :
    IsCongruenceCharacter N q ψ ∧ IsCongruenceCharacter N q φ := by
  sorry

end

end TauCetiRoadmap.ModularCurvesPartII
