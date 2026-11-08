module

public import Mathlib
public import TauCeti.GroupTheory.DoubleCoset.Map
public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Borel

/-!
# Hilbert modular varieties and quaternionic Shimura curves: target signatures

The roadmap is `README.md`; this file is not the roadmap and is not exhaustive. It states, against
the pinned Mathlib and Tau Ceti, the targets whose carriers are pinned: the lower-left and
last-row congruence levels of `GL₂` over a local ring, with their bottom-row reduction, their
quotient and their indices (§R18.5.16a, item 4), and the fibres of refinement maps between
double-coset spaces with the resulting class-number formulas (§R18.5.16b).

The roadmap's headline theorems are the Čerednik–Drinfeld uniformisation (§R18.5.15), the Ihara
lemma for Shimura curves with its integral saturation (§§R18.4.32–R18.4.33), the definite Ihara
lemma (§R18.3.8) and the paired torsion twists with local points (§§H6.2–H6.8), with their deep
inputs §§R18.5.7, R18.5.11, R18.5.12c, R18.4.29, R18.4.30 and H6.5. None of them is statable at
the pins: the required arithmetic-geometric carriers are absent. Each group of headlines and what
it lacks:

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
* The global Eichler-order statements, right ideal classes and Brandt matrices (R18.5.16a,
  R18.5.16c) require the completed order `∏_v R_v` inside the finite adelic points of a
  quaternion algebra and its locally principal right ideals; the pins supply orders, maximal
  orders and left orders, but not completed order lattices. Only their local level computations
  and the group-theoretic refinement fibres are stated below.
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

Fractional-ideal trace duality, unit-square quotients, matrix identities, abstract DVR
splittings, the local standard form of Eichler orders and the count of cyclic sublattices are
supporting infrastructure specified in the README.
-/

@[expose] public section

namespace TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

/-! ## R18.5.16a Congruence levels of `GL₂` over a local ring -/

section Levels

variable {A : Type*} [CommRing A]

/-- The level `K₀(I)`: the invertible `2 × 2` matrices over `A` whose lower-left entry lies in
`I`, defined as the preimage of the upper-triangular subgroup of `GL₂(A/I)`. -/
def levelZero (I : Ideal A) : Subgroup (GL (Fin 2) A) :=
  (TauCeti.GL2Borel (A ⧸ I)).comap (Matrix.GeneralLinearGroup.map (Ideal.Quotient.mk I))

/-- The level `K₁(I) ≤ K₀(I)`: the elements of `K₀(I)` whose lower-right entry is `1` modulo `I`,
defined as the preimage of the kernel of the lower-right diagonal character of the
upper-triangular subgroup of `GL₂(A/I)`. -/
def levelOne (I : Ideal A) : Subgroup (GL (Fin 2) A) :=
  ((((MonoidHom.snd _ _).comp (TauCeti.GL2Borel.diag (R := A ⧸ I))).ker).map
      (TauCeti.GL2Borel (A ⧸ I)).subtype).comap
    (Matrix.GeneralLinearGroup.map (Ideal.Quotient.mk I))

/-- Membership in `K₀(I)` is the condition on the lower-left entry. -/
theorem mem_levelZero_iff {I : Ideal A} {γ : GL (Fin 2) A} :
    γ ∈ levelZero I ↔ (γ : Matrix (Fin 2) (Fin 2) A) 1 0 ∈ I := by
  rw [levelZero, Subgroup.mem_comap, TauCeti.GL2Borel.mem_iff,
    Matrix.GeneralLinearGroup.map_apply, Ideal.Quotient.eq_zero_iff_mem]

/-- Membership in `K₁(I)` is the condition that the bottom row is `(0, 1)` modulo `I`. -/
theorem mem_levelOne_iff {I : Ideal A} {γ : GL (Fin 2) A} :
    γ ∈ levelOne I ↔
      (γ : Matrix (Fin 2) (Fin 2) A) 1 0 ∈ I ∧ (γ : Matrix (Fin 2) (Fin 2) A) 1 1 - 1 ∈ I := by
  rw [levelOne, Subgroup.mem_comap, Subgroup.mem_map]
  simp only [MonoidHom.mem_ker, MonoidHom.comp_apply, MonoidHom.coe_snd, Subgroup.subtype_apply]
  rw [← Ideal.Quotient.eq_zero_iff_mem, ← Ideal.Quotient.eq_zero_iff_mem, map_sub, map_one,
    sub_eq_zero, ← Matrix.GeneralLinearGroup.map_apply, ← Matrix.GeneralLinearGroup.map_apply]
  set g := Matrix.GeneralLinearGroup.map (Ideal.Quotient.mk I) γ
  constructor
  · rintro ⟨b, hb, hbg⟩
    rw [← hbg]
    refine ⟨TauCeti.GL2Borel.apply_one_zero b, ?_⟩
    rw [← TauCeti.GL2Borel.diag_snd_val, hb, Units.val_one]
  · rintro ⟨h10, h11⟩
    refine ⟨⟨g, TauCeti.GL2Borel.mem_iff.mpr h10⟩, ?_, rfl⟩
    ext
    rw [TauCeti.GL2Borel.diag_snd_val, Units.val_one]
    exact h11

/-- Two invertible matrices lie in the same right coset of `K₀(I)` exactly when their bottom rows
agree modulo `I` up to a unit of `A/I`. No locality is needed. -/
theorem rightRel_levelZero_iff (I : Ideal A) (γ γ' : GL (Fin 2) A) :
    QuotientGroup.rightRel (levelZero I) γ γ' ↔
      ∃ u : (A ⧸ I)ˣ, ∀ j, Ideal.Quotient.mk I ((γ' : Matrix (Fin 2) (Fin 2) A) 1 j) =
        u * Ideal.Quotient.mk I ((γ : Matrix (Fin 2) (Fin 2) A) 1 j) := by
  sorry

/-- Over a local ring, the bottom row modulo `I` identifies the right cosets `K₁(I) γ` in
`GL₂(A)` with the unimodular rows of `(A/I)²`. -/
theorem exists_equiv_levelOne_rightCosets [IsLocalRing A] (I : Ideal A) :
    ∃ e : Quotient (QuotientGroup.rightRel (levelOne I)) ≃
        {v : Fin 2 → A ⧸ I // IsCoprime (v 0) (v 1)},
      ∀ γ : GL (Fin 2) A, (e (Quotient.mk _ γ) : Fin 2 → A ⧸ I) =
        fun j ↦ Ideal.Quotient.mk I ((γ : Matrix (Fin 2) (Fin 2) A) 1 j) := by
  sorry

/-- Over a local ring, the lower-right entry modulo `I` is a surjective homomorphism
`K₀(I) → (A/I)ˣ` with kernel `K₁(I)`; in particular `K₁(I)` is normal in `K₀(I)`. -/
theorem exists_levelZero_hom_ker_eq_levelOne [IsLocalRing A] (I : Ideal A) :
    ∃ f : levelZero I →* (A ⧸ I)ˣ, Function.Surjective f ∧
      f.ker = (levelOne I).subgroupOf (levelZero I) ∧
      ∀ γ : levelZero I, (f γ : A ⧸ I) =
        Ideal.Quotient.mk I (((γ : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) 1 1) := by
  sorry

/-- Over a local ring with finite quotient `A/I`, `I` proper, the index of `K₀(I)` is
`#(A/I)·(1 + 1/q)`, where `q` is the order of the residue field. -/
theorem card_residueField_mul_index_levelZero [IsLocalRing A] {I : Ideal A} (hI : I ≠ ⊤)
    [Finite (A ⧸ I)] :
    Nat.card (IsLocalRing.ResidueField A) * (levelZero I).index =
      Nat.card (A ⧸ I) * (Nat.card (IsLocalRing.ResidueField A) + 1) := by
  sorry

/-- Over a local ring with finite quotient `A/I`, `I` proper, the index of `K₁(I)` is
`#(A/I)²·(1 - 1/q²)`, where `q` is the order of the residue field. -/
theorem card_residueField_sq_mul_index_levelOne [IsLocalRing A] {I : Ideal A} (hI : I ≠ ⊤)
    [Finite (A ⧸ I)] :
    Nat.card (IsLocalRing.ResidueField A) ^ 2 * (levelOne I).index =
      Nat.card (A ⧸ I) ^ 2 * (Nat.card (IsLocalRing.ResidueField A) ^ 2 - 1) := by
  sorry

end Levels

section DVR

variable {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [Finite (IsLocalRing.ResidueField O)]

/-- Over a discrete valuation ring with residue field of order `q`, `[GL₂(O) : K₀(𝔪ᵉ)] =
q^(e-1) (q+1)` for `e ≥ 1`. -/
theorem index_levelZero_maximalIdeal_pow {e : ℕ} (he : 1 ≤ e) :
    (levelZero (IsLocalRing.maximalIdeal O ^ e)).index =
      Nat.card (IsLocalRing.ResidueField O) ^ (e - 1) *
        (Nat.card (IsLocalRing.ResidueField O) + 1) := by
  sorry

/-- Over a discrete valuation ring with residue field of order `q`, `[GL₂(O) : K₁(𝔪ᵉ)] =
q^(2e-2) (q²-1)` for `e ≥ 1`. -/
theorem index_levelOne_maximalIdeal_pow {e : ℕ} (he : 1 ≤ e) :
    (levelOne (IsLocalRing.maximalIdeal O ^ e)).index =
      Nat.card (IsLocalRing.ResidueField O) ^ (2 * e - 2) *
        (Nat.card (IsLocalRing.ResidueField O) ^ 2 - 1) := by
  sorry

end DVR

/-! ## R18.5.16b Class-set refinement fibres -/

section Refinement

variable {G : Type*} [Group G]

/-- The fibre of the refinement map `Γ\G/U' → Γ\G/U` over the class of `x` is the orbit set of
the stabilizer `Γ_x = U ∩ x⁻¹Γx` acting on `U/U'` by left multiplication, through
`Γ_x u U' ↦ Γ x u U'`. No topology or finiteness enters. -/
theorem exists_equiv_refinementFiber (Γ : Subgroup G) {U U' : Subgroup G} (hU : U' ≤ U)
    (x : G) :
    ∃ e : MulAction.orbitRel.Quotient ((Γ.comap (MulAut.conj x).toMonoidHom).subgroupOf U)
        (U ⧸ U'.subgroupOf U) ≃
      {q : DoubleCoset.Quotient (Γ : Set G) (U' : Set G) //
        DoubleCoset.quotientMapOfLERight Γ hU q = DoubleCoset.mk Γ U x},
      ∀ u : U, (e (Quotient.mk'' (u : U ⧸ U'.subgroupOf U))).1 =
        DoubleCoset.mk Γ U' (x * u) := by
  sorry

/-- Counting the refinement fibres: when `Γ\G/U` is finite and `[U : U']` is finite, the class
number at `U'` is the sum over the classes at `U` of the orbit counts of the stabilizers on
`U/U'`. -/
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
