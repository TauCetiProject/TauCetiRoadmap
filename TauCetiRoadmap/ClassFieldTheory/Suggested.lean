import Mathlib
import TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RayClassField
import TauCeti.NumberTheory.ClassFieldTheory.Global.AdmissibleModulus.Basic
import TauCeti.NumberTheory.ClassFieldTheory.Local.ArtinMap
import TauCeti.NumberTheory.ClassFieldTheory.Local.Reciprocity
import TauCeti.NumberTheory.LocalField.FiniteExtension.IntermediateField
import TauCeti.NumberTheory.LocalField.Herbrand.Basic
import TauCeti.NumberTheory.LocalField.UnitFiltration.Basic
import TauCeti.RingTheory.DedekindDomain.Discriminant.Basic

/-!
# Class field theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It gives suggested forms of the
roadmap's open headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, and
the one simple definition they need, `localAbsoluteUpperRamificationGroup`; it is not an
exhaustive checklist.

Tau Ceti proves the following headline results at the pin, in
`TauCeti/NumberTheory/ClassFieldTheory/` and `TauCeti/RepresentationTheory/Homological/`, so none
of them is restated here; the roadmap consumes them under Tau Ceti's names
(README Exact supplier contracts):

* Tate's theorem and the abstract Artin map of a class formation, the Tate–Nakayama theorem, and
  the theorem of Nakayama and Rim, `Rep.projective_of_isZero_res` (Layers 0–4);
* the local invariant `invMap`, local Tate duality and Tate's local Euler-characteristic formula
  `eulerCharacteristic_mixed` (Layer 5);
* the local class formation, finite local reciprocity, and `cd_ℓ G_K = scd_ℓ G_K = 2` for a
  nonarchimedean local field of characteristic zero,
  `cohomologicalDimensionAt_absoluteGaloisGroup_eq_two` and
  `strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two` (Layer 6);
* the absolute local Artin map, its cyclotomic normalization, the conductor in the upper
  numbering, `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot`, and the equality of
  the conductor exponent of the fixed field of `ker χ` with the Artin conductor exponent of `χ`,
  `conductorExponent_fixedField_ker` (Layer 7);
* local existence and the local class-field correspondence in characteristic zero and in the
  prime-to-residue-characteristic range, `localAbelianExistence`,
  `localAbelianExistence_primeToResidueCharacteristic` (Layer 8);
* the local Weil group with its topology, the Weil transfer along a chosen embedding into `Kˢ`,
  and, in characteristic zero, Weil reciprocity `localWeilArtinEquiv : Kˣ ≃ₜ* W_K^ab` with its
  compatibility `localWeilArtinEquiv_compat` with the absolute local Artin map (Layer 9);
* the Albert–Brauer–Hasse–Noether sequence, `brLocalization_injective`, `range_brLocalization`
  and `exists_br_of_sum_eq_zero` (Layer 10);
* global Artin reciprocity `globalArtinMap` with its Frobenius law, global existence
  `globalAbelianExistence` and the global class-field correspondence (Layers 11 and 12);
* the cyclic Hasse norm theorem `cyclicHasseNorm`, the Hilbert, narrow Hilbert, ray and ring class
  fields, and the Kronecker–Weber theorem `kroneckerWeber` (Layer 13);
* Hilbert reciprocity `hilbertProductFormula` (Layer 14).

The open headline theorems stated below are:

* the cyclotomic normalization at a unit for every finite `ℚ_p`-algebra structure, the form that
  `LocalGaloisGroups` consumes, and finite and absolute unit-filtration reciprocity (Layer 7);
* the principal ideal theorem in the Hilbert class field, and the global conductor–discriminant
  formula, with the discriminant the product and the conductor the lcm of the conductors of the
  characters (Layer 13).

All open headline theorems are statable at the pins. The absolute upper group needed for
absolute unit-filtration reciprocity is the intersection of the inverse images of the native
finite upper groups, on the native absolute Galois group; its simple definition is below.
-/

namespace TauCetiRoadmap.ClassFieldTheory

open IsDedekindDomain NumberField TauCeti TauCeti.ClassFieldTheory TauCeti.GlobalNumberFields
open scoped ValuativeRel

/-! ## Layer 7: the cyclotomic normalization and unit-filtration reciprocity -/

/-- **The cyclotomic normalization at a unit, for every finite `ℚ_p`-algebra structure.** Let `F`
be a nonarchimedean local field that is a finite `ℚ_p`-algebra, `u` a unit of its valuation ring,
and `σ ∈ G_F` a lift of `Art_F(u)`. Then `χ_cyc(σ) = N_{F/ℚ_p}(u)⁻¹`. Tau Ceti's
`localCyclotomicCharacter_artinMap_unit` proves this when the valuation of `F` extends that of
`ℚ_p` (`ValuativeExtension ℚ_[p] F`); the open content is that this is automatic. A unit of `ℤ_p`
is a root of unity times an element of `1 + pℤ_p`, which has an `ℓ^k`-th root for a prime `ℓ ≠ p`
and every `k`; the valuation of `F` is discrete, so it vanishes on `ℤ_pˣ`. It is nontrivial on
`ℚ_p` because `F/ℚ_p` is algebraic, so it restricts to a positive multiple of the `p`-adic
valuation. -/
theorem cyclotomicCharacter_artinMap (p : ℕ) [Fact p.Prime]
    (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (u : Fˣ) (_hu : ValuativeRel.valuation F (u : F) = 1)
    (σ : Field.absoluteGaloisGroup F)
    (_hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization F) = artinMap F u) :
    Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom
        (cyclotomicCharacter (AlgebraicClosure F) p σ.toRingEquiv)
      = (Units.map (Algebra.norm ℚ_[p] : F →* ℚ_[p]) u)⁻¹ :=
  sorry

/-- **The upper-numbering theorem** (Neukirch, *Algebraic Number Theory*, V Theorem 6.2; Serre,
*Local Fields*, XV §2). For a finite abelian extension `L/K` of nonarchimedean local fields and
`n ≥ 0`, the norm residue isomorphism `Kˣ / N(Lˣ) ≃ Gal(L/K)^ab` maps the image of the unit group
`U_K^(n)` onto the image of the upper ramification group `G^n` (Serre's numbering,
`upperRamificationGroup`). At `n = 0` it says that the units go onto inertia. -/
theorem normResidue_map_unitFiltration
    (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (L : Type) [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L]
    [Algebra K L] [ValuativeExtension K L] [Module.Finite K L] [IsGalois K L]
    [IsMulCommutative (L ≃ₐ[K] L)] (n : ℕ) :
    (unitFiltration K n).map
        ((normResidue K L).toMonoidHom.comp (QuotientGroup.mk' (normGroup K L))) =
      (LocalFieldsRamification.upperRamificationGroup K L
          ⟨n, Nat.cast_mem_ramificationIndexDomain n⟩).map Abelianization.of :=
  sorry

/-- **The absolute upper ramification group of a local field.** For real `v ≥ -1`, an
absolute Galois automorphism belongs to `G_K^v` precisely when its restriction to every finite
Galois intermediate field belongs to its upper group, using the canonical extended valuation
(Serre, *Local Fields*, IV §3, Proposition 14). -/
noncomputable def localAbsoluteUpperRamificationGroup
    (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (v : LocalFieldsRamification.RamificationIndexDomain) : Subgroup (Field.absoluteGaloisGroup K) :=
  ⨅ M : FiniteGaloisIntermediateField K (AlgebraicClosure K),
    letI := finiteIntermediateFieldValuativeRel K (AlgebraicClosure K) M.toIntermediateField
    letI := finiteIntermediateFieldTopology K (AlgebraicClosure K) M.toIntermediateField
    letI := finiteIntermediateField_isNonarchimedeanLocalField K (AlgebraicClosure K)
      M.toIntermediateField
    letI := finiteIntermediateField_valuativeExtension K (AlgebraicClosure K) M.toIntermediateField
    (LocalFieldsRamification.upperRamificationGroup K M v).comap (AlgEquiv.restrictNormalHom M)

/-- **Absolute unit-filtration reciprocity.** For a nonarchimedean local field in either
characteristic, the closure of the image of the units of depth `n ≥ 0` under the arithmetic
Artin map is the image of the absolute upper ramification group at depth `n` in the topological
abelianization (Serre, *Local Fields*, XV §2, Theorem 2 and Corollary 3 to Theorem 1). -/
theorem closure_map_artinMap_unitFiltration_eq_upper
    (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (n : ℕ) :
    ((unitFiltration K n).map (artinMap K)).topologicalClosure =
      (localAbsoluteUpperRamificationGroup K ⟨n, Nat.cast_mem_ramificationIndexDomain n⟩).map
        (QuotientGroup.mk' (commutator (Field.absoluteGaloisGroup K)).topologicalClosure) :=
  sorry

/-! ## Layer 13: the principal ideal theorem and the global conductor–discriminant formula -/

/-- **The principal ideal theorem** (Artin–Tate, *Class Field Theory*, XIII; Neukirch, *Algebraic
Number Theory*, VI §7). Every ideal of `𝓞 K` becomes principal in the ring of integers of the
Hilbert class field of `K`. Tau Ceti's
`ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator` is the class-formation
form; this is its arithmetic reading on ideals. -/
theorem isPrincipal_map_hilbertClassField (K : Type) [Field K] [NumberField K]
    (I : Ideal (𝓞 K)) :
    (I.map (algebraMap (𝓞 K) (𝓞 (hilbertClassField K)))).IsPrincipal :=
  sorry

/-- **The conductor–discriminant formula, product half** (Milne, *Class Field Theory*, V
Theorem 3.27, with Remark 3.28 identifying the conductor of a character `ψ` with that of the fixed
field of its kernel). For a finite abelian extension `L/K` of number fields and a finite place `v`
of `K`, the multiplicity of `v` in the relative discriminant of `L/K` is the sum, over the
characters `ψ` of `Gal(L/K)`, of the multiplicities of `v` in the conductors of the fixed fields
of the kernels of `ψ`. -/
theorem count_relDiscr_eq_finsum_abelianConductor_exponent
    (K : Type) [Field K] [NumberField K] (L : Type) [Field L] [NumberField L] [Algebra K L]
    [IsAbelianGalois K L] (v : HeightOneSpectrum (𝓞 K)) :
    (UniqueFactorizationMonoid.normalizedFactors (relDiscr (𝓞 K) (𝓞 L))).count v.asIdeal =
      ∑ᶠ ψ : (L ≃ₐ[K] L) →* ℂˣ,
        (UniqueFactorizationMonoid.normalizedFactors
          (abelianConductor K (IntermediateField.fixedField ψ.ker)).finitePart).count v.asIdeal :=
  sorry

/-- **The conductor–discriminant formula, lcm half** (Milne, *Class Field Theory*, V Theorem 3.27
and Remark 3.28). For a finite abelian extension `L/K` of number fields, the multiplicity of every
finite place `v` in the conductor of `L/K` is the maximum, over the characters `ψ` of `Gal(L/K)`,
of its multiplicities in the conductors of the fixed fields of the kernels of `ψ`, and a real place
divides the conductor of `L/K` exactly when it divides one of them. -/
theorem abelianConductor_eq_lcm
    (K : Type) [Field K] [NumberField K] (L : Type) [Field L] [NumberField L] [Algebra K L]
    [IsAbelianGalois K L] :
    (∀ v : HeightOneSpectrum (𝓞 K),
      (UniqueFactorizationMonoid.normalizedFactors (abelianConductor K L).finitePart).count
          v.asIdeal =
        ⨆ ψ : (L ≃ₐ[K] L) →* ℂˣ,
          (UniqueFactorizationMonoid.normalizedFactors
            (abelianConductor K (IntermediateField.fixedField ψ.ker)).finitePart).count
              v.asIdeal) ∧
      ∀ w : {w : InfinitePlace K // w.IsReal},
        w ∈ (abelianConductor K L).infinitePart ↔
          ∃ ψ : (L ≃ₐ[K] L) →* ℂˣ,
            w ∈ (abelianConductor K (IntermediateField.fixedField ψ.ker)).infinitePart :=
  sorry

end TauCetiRoadmap.ClassFieldTheory
