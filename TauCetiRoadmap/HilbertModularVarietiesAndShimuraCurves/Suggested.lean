import Mathlib
import TauCeti.RingTheory.IntegralOrder.Maximal

/-!
# Hilbert modular varieties and quaternionic Shimura curves: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This module is reserved for headline theorem statements against the pinned
Mathlib and Tau Ceti.

The order and class-set targets whose carriers are pinned are stated below: Eichler orders and
their local standard form, and the count of cyclic sublattices behind the Eichler unit indices
and the Brandt neighbour count (§§R18.5.16a, R18.5.16c), and the fibres of class-set refinement
maps (§R18.5.16b).

No other headline theorem is stated here: the required arithmetic-geometric carriers are absent
from the pins. In particular:

* The Hilbert moduli comparison and Deligne–Pappas representability, flatness and determinant
  theorems (H1–H2) require relative abelian schemes with ordered real-multiplication
  polarizations and their PEL and DP moduli functors. Abelian varieties over fields alone do
  not provide these objects.
* The arithmetic polarization quotient, Hecke isogenies and full-level torsors (H3–H4)
  require those moduli functors, quotient stacks and their actual level actions. The modular
  comparison, cusp and Hodge-bundle theorems (H5) also require canonical Hilbert models.
* The paired torsion twists, geometrically irreducible components and real and finite local
  points (H6.2–H6.8) require the paired Hilbert torsion moduli and its universal family;
  even the elliptic variant requires paired torsion moduli and finite étale descent.
* The Hilbert centre and type comparisons (H0) and the canonical quaternionic
  curve and PEL bridge (R18.1) require Shimura data and canonical-model carriers.
* Drinfeld representability, formal arithmetic quotients, Čerednik–Drinfeld uniformisation
  and its level tower (R18.5.5, R18.5.7, R18.5.11, R18.5.12a–R18.5.12c, R18.5.13, R18.5.15, R18.5.21) require
  special formal quaternionic modules, the formal Drinfeld curve and its rigid generic fibre.
  Basic PEL uniformisation also requires the auxiliary integral PEL moduli, its framed
  polarized isogeny quotient and its Weil descent datum. The set of nonrational projective
  points does not supply these spaces. The graph and
  monodromy comparisons (R18.5.17–R18.5.18) require their semistable models and Jacobians.
* The global Eichler-order statements, right ideal classes, left-order stabilizers and Brandt
  matrices (R18.5.16a, R18.5.16c) require the completed order `∏_v R_v` inside the finite
  adelic points of a quaternion algebra and its locally principal right ideals. The pins
  supply orders, maximal orders and left orders, but not completed order lattices.
* The integral quaternionic model tower, Hodge line, p-divisible group and Kodaira–Spencer
  comparisons (R18.2) require the canonical curves, their integral models and structured
  relative p-divisible groups.
* The definite Ihara lemma over arbitrary totally real fields (R18.3.8–R18.3.9), finite-level
  Jacquet–Langlands realization and auxiliary-level theorems (R18.3) require adelic
  quaternionic form modules with their coefficient, level and Hecke actions. Generic
  double-coset quotients and Hecke operators do not supply these arithmetic modules.
* The residual and integral Ihara lemmas (R18.4.32–R18.4.33), automorphic and Galois–Hecke
  comparisons (R18.4.25, R18.3.29, R18.4.27) and coefficient purity (R18.4.34–R18.4.36)
  require the canonical curves' étale coefficient cohomology, geometric degeneracy maps,
  automorphic eigenspaces and PEL projectors. Twisted singular cohomology alone does not
  provide these objects. The intervening patching theorems require these cohomology modules
  and their local-type deformation data.

Fractional-ideal trace duality, unit-square quotients, matrix identities and abstract DVR
splittings are supporting infrastructure. They do not state the moduli, uniformisation or
Ihara theorems, and no auxiliary definitions are needed without those statements.
-/

namespace TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

open TauCeti.IntegralOrder

/-! ## R18.5.16a Eichler orders and the local lattice count -/

section Eichler

variable {R : Type*} (F : Type*) {E : Type*} [CommRing R] [CommRing F] [Ring E]
  [Algebra R F] [Algebra F E] [Algebra R E] [IsScalarTower R F E]

/-- An Eichler order: an `R`-subalgebra of `E` that is the intersection of two, not
necessarily distinct, maximal `R`-orders in `E`. -/
def IsEichlerOrder (Λ : Subalgebra R E) : Prop :=
  ∃ Λ₁ Λ₂ : Subalgebra R E, IsMaximalOrder F Λ₁ ∧ IsMaximalOrder F Λ₂ ∧ Λ = Λ₁ ⊓ Λ₂

end Eichler

/-- Local standard form of Eichler orders: over a discrete valuation ring `O` with fraction
field `K`, an `O`-subalgebra of `M₂(K)` is an Eichler order exactly when, after conjugation by
some `g ∈ GL₂(K)`, it is the standard order of some level `𝔪ᵉ`, the integral matrices whose
lower-left entry lies in `𝔪ᵉ`. -/
theorem isEichlerOrder_iff_conj_standard {O K : Type*} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [Field K] [Algebra O K] [IsFractionRing O K]
    (Λ : Subalgebra O (Matrix (Fin 2) (Fin 2) K)) :
    IsEichlerOrder K Λ ↔ ∃ (g : GL (Fin 2) K) (e : ℕ), ∀ X : Matrix (Fin 2) (Fin 2) K,
      X ∈ Λ ↔
        ((∀ i j, ((g⁻¹ : GL (Fin 2) K) * X * (g : Matrix (Fin 2) (Fin 2) K)) i j ∈
            (algebraMap O K).range) ∧
          ((g⁻¹ : GL (Fin 2) K) * X * (g : Matrix (Fin 2) (Fin 2) K)) 1 0 ∈
            Submodule.map (Algebra.linearMap O K) (IsLocalRing.maximalIdeal O ^ e)) := by
  sorry

/-- Over a discrete valuation ring `O` with finite residue field of cardinality `q`, the
sublattices `L ⊆ O²` with cyclic quotient `O²/L ≅ O/𝔪ᵗ`, `t ≥ 1`, number `q^(t-1) (q+1)`. They
are the cosets of the standard Eichler unit group of level `𝔪ᵗ` in `GL₂(O)`; at `t = 1` they
are the Brandt neighbours. -/
theorem card_cyclicQuotient_submodule {O : Type*} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [Finite (IsLocalRing.ResidueField O)] {t : ℕ} (ht : 1 ≤ t) :
    Nat.card {L : Submodule O (Fin 2 → O) //
        Nonempty (((Fin 2 → O) ⧸ L) ≃ₗ[O] (O ⧸ IsLocalRing.maximalIdeal O ^ t))} =
      Nat.card (IsLocalRing.ResidueField O) ^ (t - 1) *
        (Nat.card (IsLocalRing.ResidueField O) + 1) := by
  sorry

/-! ## R18.5.16b Class-set refinement fibres -/

section Refinement

variable {G : Type*} [Group G]

/-- The fibre of the refinement map `Γ\G/U' → Γ\G/U` over the class of `x` is the orbit set
of the stabilizer `U ∩ x⁻¹Γx` acting on `U/U'` by left multiplication, through
`u ↦ Γ x u U'`. -/
theorem exists_equiv_refinementFiber (Γ : Subgroup G) {U U' : Subgroup G} (hU : U' ≤ U)
    (x : G) :
    ∃ e : MulAction.orbitRel.Quotient ((Γ.comap (MulAut.conj x).toMonoidHom).subgroupOf U)
        (U ⧸ U'.subgroupOf U) ≃
      {q : DoubleCoset.Quotient (Γ : Set G) (U' : Set G) //
        ∃ g : G, DoubleCoset.mk Γ U' g = q ∧ DoubleCoset.mk Γ U g = DoubleCoset.mk Γ U x},
      ∀ u : U, (e (Quotient.mk'' (u : U ⧸ U'.subgroupOf U))).1 = DoubleCoset.mk Γ U' (x * u) := by
  sorry

/-- Counting the refinement fibres: for finite `Γ\G/U` and finite `[U : U']`, the class number
at `U'` is the sum over the classes at `U` of the orbit counts of the stabilizers on `U/U'`. -/
theorem card_doubleCoset_eq_sum_card_orbits (Γ : Subgroup G) {U U' : Subgroup G} (hU : U' ≤ U)
    [Finite (DoubleCoset.Quotient (Γ : Set G) (U : Set G))] [(U'.subgroupOf U).FiniteIndex] :
    Nat.card (DoubleCoset.Quotient (Γ : Set G) (U' : Set G)) =
      ∑ᶠ q : DoubleCoset.Quotient (Γ : Set G) (U : Set G),
        Nat.card (MulAction.orbitRel.Quotient
          ((Γ.comap (MulAut.conj (Quotient.out q)).toMonoidHom).subgroupOf U)
          (U ⧸ U'.subgroupOf U)) := by
  sorry

/-- When every stabilizer `U ∩ x⁻¹Γx` lies in the normal core of `U'` in `U`, refinement
multiplies the class number by the index `[U : U']`. -/
theorem card_doubleCoset_eq_relIndex_mul (Γ : Subgroup G) {U U' : Subgroup G} (hU : U' ≤ U)
    (h : ∀ x : G,
      (Γ.comap (MulAut.conj x).toMonoidHom).subgroupOf U ≤ (U'.subgroupOf U).normalCore) :
    Nat.card (DoubleCoset.Quotient (Γ : Set G) (U' : Set G)) =
      U'.relIndex U * Nat.card (DoubleCoset.Quotient (Γ : Set G) (U : Set G)) := by
  sorry

end Refinement

end TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves
