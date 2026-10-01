import Mathlib
import TauCeti.Algebra.MonoidAlgebra.Exactness
import TauCeti.NumberTheory.LocalField.AbsoluteRamificationIndex
import TauCeti.RepresentationTheory.Homological.ContCohomology.Inflation.Basic
import TauCeti.Topology.Algebra.Group.Profinite.Free.Basic
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Prescription
import TauCetiRoadmap.ProfiniteCohomology.Suggested
import TauCetiRoadmap.ProfiniteProPGroups.Suggested
import TauCetiRoadmap.LocalFieldsRamification.Suggested
import TauCetiRoadmap.ClassFieldTheory.Suggested

set_option autoImplicit false

/-!
# Local Galois groups of p-adic fields: target signatures

**This file is not the roadmap and it is not exhaustive.** The definitive specification is
`README.md`. These declarations pin central names and useful Lean forms; proving every item here
does not by itself complete a layer.

The file consumes the four final supplier namespaces directly. It deliberately has no
`LocalFieldInputs`, `ProPOps`, or `ProPRankInputs`: those records obscured which theorem supplied
each arithmetic fact and created a cycle between the old roadmaps. The only new carriers below
are genuine objects owned here: the specialization `G_K(p)`, the group of `p`-power roots of
unity, the local cyclotomic character and its descent, and the completed multiplicative module
`A(L)` with its integral `ℤ_p[Gal(L/K)]`-structure.

Five Tau Ceti modules are imported directly, because what they supply is landed at this
repository's pin: the twisted coefficients `TauCeti.ZModTwist` with the prescription property
`TauCeti.HasPrescriptionProperty` of a continuous character, the explicit degree-one inflation
`TauCeti.ContCohomology.explicitInfl1` with its exactness, the free profinite group
`TauCeti.freeProfiniteGroup`, `TauCeti.FinitePadicExtension`, and the augmentation
`TauCeti.MonoidAlgebra.augmentation` of a group algebra, whose kernel is the augmentation ideal.
-/

namespace TauCetiRoadmap.LocalGaloisGroups

universe u

open ValuativeRel
open scoped Classical TensorProduct TauCetiRoadmap.ProfiniteProPGroups CategoryTheory

/-- `p ≠ 0` for a prime `p`: the hypothesis `[NeZero p]` of the chosen-root dictionary
`muNRepIsoTrivialFp`, of ClassFieldTheory's `muNRepToTateDual`, and of the finiteness of `μ_p`,
at a prime. -/
local instance neZero_of_fact_prime (p : ℕ) [Fact p.Prime] : NeZero p :=
  ⟨(Fact.out : p.Prime).ne_zero⟩

/-! ## Layer 0: arithmetic carriers -/

/-- The maximal pro-`p` quotient `G_K(p)` of the absolute Galois group of `K`. This is a reducible
specialization of the supplier's carrier, not a second construction. -/
abbrev absoluteGaloisGroupProP (p : ℕ) (K : Type u) [Field K] : Type u :=
  ProfiniteProPGroups.maximalProPQuotient p (Field.absoluteGaloisGroup K)

/-- The `p`-power roots of unity of `K`, as an honest **subgroup of `Kˣ`**: Mathlib's `p`-primary
component, whose elements are the units killed by some power of `p`. Closure under multiplication
and inverse is part of the object rather than a lemma proved afterwards, and membership is a unit
equation, so no element of the carrier can fail to be invertible.

⚠ This is deliberately not a subtype of `K`. `{x : K // ∃ n, x ^ p ^ n = 1}` is closed under
multiplication but carries no inverse and no group structure, so `q(K)` computed from it would be
the cardinality of a bare type rather than the order of a group. -/
abbrev pPowerRootsOfUnity (p : ℕ) (K : Type u) [Field K] : Subgroup Kˣ :=
  CommGroup.primaryComponent Kˣ p

theorem mem_pPowerRootsOfUnity {p : ℕ} {K : Type u} [Field K] {x : Kˣ} :
    x ∈ pPowerRootsOfUnity p K ↔ ∃ n : ℕ, x ^ p ^ n = 1 :=
  CommGroup.mem_primaryComponent

/-- The `p`-power roots of unity are the union of the finite levels `μ_{p^n}(K)`, which is the
form in which the tower and finite-extension lemmas of Layer 0 are proved. -/
theorem pPowerRootsOfUnity_eq_iSup (p : ℕ) (K : Type u) [Field K] :
    pPowerRootsOfUnity p K = ⨆ n : ℕ, rootsOfUnity (p ^ n) K :=
  sorry

/-- **Layer 0, finiteness.** A `p`-adic field has only finitely many `p`-power roots of unity.
This theorem is a **prerequisite of the invariant below**, not a corollary of it: it is what
licenses reading the invariant off a cardinality. -/
theorem finite_pPowerRootsOfUnity (p : ℕ) [Fact p.Prime] (K : Type u) [Field K]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    Finite ↥(pPowerRootsOfUnity p K) :=
  sorry

/-- The `p`-power roots of unity form a cyclic group, so the invariant below is also the order of
a single primitive root. -/
theorem isCyclic_pPowerRootsOfUnity (p : ℕ) [Fact p.Prime] (K : Type u) [Field K]
    (_h : Finite ↥(pPowerRootsOfUnity p K)) :
    IsCyclic ↥(pPowerRootsOfUnity p K) :=
  sorry

/-- The local roots-of-unity invariant `q(K)`: the order of the finite group
`pPowerRootsOfUnity p K`.

⚠ The finiteness proof is an **argument**, exactly as it is for the supplier's
`ProfiniteProPGroups.topologicalGeneratorRankNat`. `Nat.card` is total: on an infinite group it
returns `0`, and `0` is also the supplier's meaningful torsion-free value of `demushkinQ`, so an
ungated accessor would let `q(K) = 0` be *derived* for `K = ℚ_p(μ_{p^∞})` and then read as that
value. Nothing in this roadmap applies the accessor before `finite_pPowerRootsOfUnity`. -/
noncomputable def localRootOfUnityOrder (p : ℕ) (K : Type u) [Field K]
    (_h : Finite ↥(pPowerRootsOfUnity p K)) : ℕ :=
  Nat.card ↥(pPowerRootsOfUnity p K)

theorem localRootOfUnityOrder_isPow (p : ℕ) [Fact p.Prime] (K : Type u) [Field K]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    ∃ n : ℕ, localRootOfUnityOrder p K (finite_pPowerRootsOfUnity p K) = p ^ n :=
  sorry

/-- `q(K)` is positive for a `p`-adic field; in particular it is never the supplier's torsion-free
value `0`. -/
theorem localRootOfUnityOrder_pos (p : ℕ) [Fact p.Prime] (K : Type u) [Field K]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    0 < localRootOfUnityOrder p K (finite_pPowerRootsOfUnity p K) :=
  sorry

theorem primitiveRoot_iff_dvd_localRootOfUnityOrder (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    (∃ ζ : K, IsPrimitiveRoot ζ p) ↔
      p ∣ localRootOfUnityOrder p K (finite_pPowerRootsOfUnity p K) :=
  sorry

/-- `q(K) = 2` forces `p = 2`, because `q(K)` is a power of `p`. This is the theorem that lets the
dyadic branch predicates of Layer 6 be stated at the literal prime `2`. -/
theorem prime_eq_two_of_localRootOfUnityOrder_eq_two (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (_hq : localRootOfUnityOrder p K (finite_pPowerRootsOfUnity p K) = 2) :
    p = 2 :=
  sorry

/-- **The fourth-roots criterion.** At `p = 2` the group of `2`-power roots of unity always
contains `-1`, so `q(K) ≠ 2` says exactly that `K` contains a primitive fourth root of unity.
This is the equation behind the `q = 2` branch of the dyadic classification, and it is a theorem
rather than a line in a prose table. -/
theorem localRootOfUnityOrder_ne_two_iff (K : Type u) [Field K]
    [Algebra ℚ_[2] K] [Module.Finite ℚ_[2] K] :
    localRootOfUnityOrder 2 K (finite_pPowerRootsOfUnity 2 K) ≠ 2 ↔
      ∃ ζ : K, IsPrimitiveRoot ζ 4 :=
  sorry

/-- The `p`-adic cyclotomic character of the local absolute Galois group: Mathlib's
`cyclotomicCharacter` on `AlgebraicClosure K`, restricted along `AlgEquiv.toRingEquiv`. This is a
**definition with a body**, so no second cyclotomic normalization can be introduced by accident.
Tau Ceti's `TauCeti.localCyclotomicCharacter`
(`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/CyclotomicCharacter.lean`), with the same values;
stated here because the pinned Tau Ceti revision predates it; replaced by the import when the pin
moves. -/
noncomputable def localCyclotomicCharacter (p : ℕ) [Fact p.Prime] (K : Type u) [Field K] :
    Field.absoluteGaloisGroup K →* ℤ_[p]ˣ :=
  MonoidHom.mk' (fun σ => cyclotomicCharacter (AlgebraicClosure K) p σ.toRingEquiv)
    (fun _σ _τ => map_mul (cyclotomicCharacter (AlgebraicClosure K) p) _ _)

@[simp]
theorem localCyclotomicCharacter_apply (p : ℕ) [Fact p.Prime] (K : Type u) [Field K]
    (σ : Field.absoluteGaloisGroup K) :
    localCyclotomicCharacter p K σ = cyclotomicCharacter (AlgebraicClosure K) p σ.toRingEquiv :=
  rfl

theorem localCyclotomicCharacter_continuous (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] :
    Continuous (localCyclotomicCharacter p K) :=
  sorry

/-- The cyclotomic character as a continuous homomorphism. Tau Ceti's twisted coefficients
`TauCeti.ZModTwist` and its prescription property `TauCeti.HasPrescriptionProperty` take a character
in this bundled form. -/
noncomputable abbrev continuousLocalCyclotomicCharacter (p : ℕ) [Fact p.Prime] (K : Type u)
    [Field K] : Field.absoluteGaloisGroup K →ₜ* ℤ_[p]ˣ :=
  ⟨localCyclotomicCharacter p K, localCyclotomicCharacter_continuous p K⟩

/-! ### The cyclotomic character of `G_{ℚ_p}` is surjective -/

/-- **Layer 0, the `p`-power cyclotomic polynomials are irreducible over `ℚ_p`**, for every prime
`p` and every level. `Φ_{p^{n+1}}(X + 1)` is Eisenstein at `(p)` over `ℤ_p`: Mathlib's
`cyclotomic_prime_pow_comp_X_add_one_isEisensteinAt` is the statement over `ℤ`, read in `ℤ_[p]`
coefficientwise, and `(p)` is the maximal ideal of `ℤ_p` (`PadicInt.maximalIdeal_eq_span_p`). So
it is irreducible over `ℤ_p` (`Polynomial.IsEisensteinAt.irreducible`, a monic polynomial being
primitive), hence over `ℚ_p` by Gauss's lemma
(`Polynomial.Monic.irreducible_iff_irreducible_map_fraction_map`, with `PadicInt.isFractionRing`),
and `X ↦ X + 1` is a ring automorphism of `ℚ_p[X]`. This is the input of
`surjective_localCyclotomicCharacter_ratPadic` and of
`localCyclotomicCharacter_artinMap_padic_uniformizer`. -/
theorem irreducible_cyclotomic_prime_pow_ratPadic (p : ℕ) [Fact p.Prime] (n : ℕ) :
    Irreducible (Polynomial.cyclotomic (p ^ (n + 1)) ℚ_[p]) :=
  sorry

/-- **Layer 0, the cyclotomic character of `G_{ℚ_p}` modulo `p^n` is onto `(ℤ/p^n)ˣ`.** Restriction
`G_{ℚ_p} ↠ Gal(ℚ_p(μ_{p^n})/ℚ_p)` (`AlgEquiv.restrictNormalHom_surjective`), followed by
`IsCyclotomicExtension.autEquivPow`, which is an isomorphism onto `(ℤ/p^n)ˣ` because `Φ_{p^n}` is
irreducible (`irreducible_cyclotomic_prime_pow_ratPadic`), is the reduced character
(`IsPrimitiveRoot.autToPow_eq_modularCyclotomicCharacter`, `cyclotomicCharacter.toZModPow`). -/
theorem surjective_toZModPow_localCyclotomicCharacter_ratPadic (p : ℕ) [Fact p.Prime] (n : ℕ) :
    Function.Surjective fun σ : Field.absoluteGaloisGroup ℚ_[p] =>
      Units.map (PadicInt.toZModPow n : ℤ_[p] →+* ZMod (p ^ n)).toMonoidHom
        (localCyclotomicCharacter p ℚ_[p] σ) :=
  sorry

/-- **Layer 0, the cyclotomic character of `G_{ℚ_p}` is surjective.** Its image is compact, hence
closed, and it maps onto every `(ℤ/p^n)ˣ`
(`surjective_toZModPow_localCyclotomicCharacter_ratPadic`), so it is dense
(`PadicInt.ext_of_toZModPow`), hence all of `ℤ_pˣ`.
⚠ The statement is at `ℚ_p` only. Over `ℚ₂(i)` the image is `1 + 4ℤ₂`; the image for a general
`K` is `range_localCyclotomicCharacter`. -/
theorem surjective_localCyclotomicCharacter_ratPadic (p : ℕ) [Fact p.Prime] :
    Function.Surjective (localCyclotomicCharacter p ℚ_[p]) :=
  sorry

/-- The range form of `surjective_localCyclotomicCharacter_ratPadic`, a closed proof. -/
theorem range_localCyclotomicCharacter_ratPadic (p : ℕ) [Fact p.Prime] :
    (localCyclotomicCharacter p ℚ_[p]).range = ⊤ :=
  MonoidHom.range_eq_top.mpr (surjective_localCyclotomicCharacter_ratPadic p)

/-- **Layer 5, the prescription property of the cyclotomic character, from Kummer theory**, for any
field in which `p` is invertible, as Tau Ceti's `TauCeti.HasPrescriptionProperty`: for `i ≥ 1` every
class of `H¹(G_K, I(χ_cyc)/p)` lifts to `H¹(G_K, I(χ_cyc)/pⁱ)`. A primitive `pⁱ`-th root of unity
`ζ` of the separable closure identifies `I(χ_cyc)/pⁱ` with `μ_{pⁱ}` as a Galois module, `x ↦ ζ ^ x`
(`cyclotomicCharacter.spec`), and `ζ ^ p ^ (i - 1)` does the same at level `1`, so the reduction
`I(χ_cyc)/pⁱ → I(χ_cyc)/p` becomes the `p ^ (i - 1)`-th power map `μ_{pⁱ} → μ_p`. Through Tau
Ceti's Kummer isomorphism `TauCeti.kummerIsoTransport` at both levels, read on
`Field.absoluteGaloisGroup K` through `TauCeti.absoluteGaloisGroupRestrictEquiv`, that map sends the
Kummer class of `a ∈ Kˣ` computed by a root `α` (`TauCeti.kummerMap_eq_kummerCocycleClass`) to the
Kummer class computed by the root `α ^ p ^ (i - 1)`, which is the Kummer class of `a` at level `p`;
and every class at level `p` is a Kummer class (`TauCeti.kummerMap_surjective`). So the reduction on
`H¹` is onto, as `Kˣ/(Kˣ)^{pⁱ} → Kˣ/(Kˣ)^p` is. Neither local duality nor reciprocity is used. -/
theorem continuousLocalCyclotomicCharacter_hasPrescriptionProperty (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] (_hp : (p : K) ≠ 0) :
    TauCeti.HasPrescriptionProperty (continuousLocalCyclotomicCharacter p K) :=
  sorry

/-- **Layer 5, the image of the cyclotomic character is a reciprocity computation.** The image is
the closed subgroup generated by the values of `χ_cyc` on the reciprocity image of `Kˣ`, because
`ClassFieldTheory.artinMap` has dense image, `χ_cyc` is continuous and `G_K` is compact. The two
evaluation theorems below — at a unit and at a uniformizer — then compute those generators.

⚠ **The uniformizer value is not redundant.** `K(μ_{p^n})/K` need **not** be totally ramified, so
the image is *not* generated by the unit norms alone: for `p = 3` and `K = ℚ_3(√3)` one has
`K(μ_3) = K(√-1)`, which is unramified over `K`, and `χ_cyc(G_K)` is all of `ℤ_3ˣ` while the unit
norms `a² - 3b²` fill only the index-two subgroup `1 + 3ℤ_3`. The same phenomenon occurs with
`μ_p ⊆ K`: over `K' = ℚ_3(μ_3)`, a diagonal cubic subfield of the compositum of the ramified
extension `K'(ζ_9)` with the unramified cubic extension has `K(μ_9)/K` unramified. -/
theorem range_localCyclotomicCharacter (p : ℕ) [Fact p.Prime]
    (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    (localCyclotomicCharacter p K).range
      = (Subgroup.closure {c : ℤ_[p]ˣ | ∃ (x : Kˣ) (σ : Field.absoluteGaloisGroup K),
          (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization K)
              = ClassFieldTheory.artinMap K x ∧
            localCyclotomicCharacter p K σ = c}).topologicalClosure :=
  sorry

/-- **Layer 0, the cyclotomic character of `G_K` is that of `G_{ℚ_p}`, restricted** along a
`ℚ_p`-embedding `ι : K → ℚ_pˢ`. `ClassFieldTheory.absoluteGaloisGroupExtend ℚ_[p] K ι` realizes
`G_K` as the open subgroup `TauCeti.galoisSubgroup ℚ_[p] K ι` of `G_{ℚ_p}`, of index `[K : ℚ_p]`
(`TauCeti.galoisSubgroup_index`), and both characters are read off the action on the same
`p`-power roots of unity (`cyclotomicCharacter.spec`, with
`TauCeti.galoisSubgroupEquiv_apply_separableClosureRingEquiv`). This is the comparison
`G_K ≤ G_{ℚ_p}` that the odd-degree dyadic image uses. -/
theorem localCyclotomicCharacter_absoluteGaloisGroupExtend (p : ℕ) [Fact p.Prime]
    [IsNonarchimedeanLocalField ℚ_[p]] (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (ι : K →ₐ[ℚ_[p]] SeparableClosure ℚ_[p]) (σ : Field.absoluteGaloisGroup K) :
    localCyclotomicCharacter p ℚ_[p] (ClassFieldTheory.absoluteGaloisGroupExtend ℚ_[p] K ι σ) =
      localCyclotomicCharacter p K σ :=
  sorry

/-- **Layer 0, the cyclotomic image of `G_K` inside that of `G_{ℚ_p}`, of index dividing
`[K : ℚ_p]`.** Choose a `ℚ_p`-embedding `ι` of `K` into `ℚ_pˢ` (`IsSepClosed.lift`). By
`localCyclotomicCharacter_absoluteGaloisGroupExtend` the image of `G_K` is the image of the open
subgroup `TauCeti.galoisSubgroup ℚ_[p] K ι`, of index `[K : ℚ_p]` (`TauCeti.galoisSubgroup_index`),
and the image of a subgroup of index `m` has index dividing `m` in the image of the group
(`Subgroup.index_map_dvd`). -/
theorem range_localCyclotomicCharacter_le_ratPadic (p : ℕ) [Fact p.Prime]
    [IsNonarchimedeanLocalField ℚ_[p]] (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    (localCyclotomicCharacter p K).range ≤ (localCyclotomicCharacter p ℚ_[p]).range ∧
      (localCyclotomicCharacter p K).range.relIndex (localCyclotomicCharacter p ℚ_[p]).range ∣
        Module.finrank ℚ_[p] K :=
  sorry

/-! ### Closed checks on the arithmetic supplier contract

These statements add no new interface. They apply the exact final supplier declarations so that
renaming or changing a carrier breaks this file rather than silently creating a replacement. -/

section SupplierChecks

variable (p : ℕ) [Fact p.Prime] (K : Type u) [Field K]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [Algebra ℚ_[p] K] [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]

/-- ⚠ The right-hand side is the supplier's own, `#𝓀[K] ^ v_K(n)`, and the nonvanishing proof
`(n : K) ≠ 0` is an **argument** of the theorem rather than a side condition, because
`natCastValuation` takes it. Restating the last factor as the cardinality of `𝒪[K]/(n)` would be
a second expression for the same number and would stop this check from breaking on a supplier
change, which is the only reason it is here. -/
example (n : ℕ) (hn : n ≠ 0) (hnK : (n : K) ≠ 0) :
    Nat.card (Kˣ ⧸ (powMonoidHom n : Kˣ →* Kˣ).range)
      = n * Nat.card (rootsOfUnity n K)
        * Nat.card 𝓀[K] ^ LocalFieldsRamification.natCastValuation K n hnK :=
  LocalFieldsRamification.card_powerClasses_mixed K p n hn hnK

end SupplierChecks

/-! ### Closed checks on the class-field supplier contract

⚠ **Universe 0.** Class Field Theory pins every cohomological object to universe `0` on
purpose — Mathlib's `tateCohomology` needs the group and the coefficient ring `ℤ` in one
universe — so `ClassFieldTheory.H`, `muNRep`, `kummerEquiv_mixed` and `h2MuEquivZMod_mixed`
take a `Type`, and these checks bind their own `F : Type` rather than this file's `K : Type u`.
The restriction is the supplier's, and it is why the arithmetic statements of this roadmap that
do not touch class field theory stay at `Type u`. -/

section ClassFieldSupplierChecks

variable (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
  [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]
  [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]

noncomputable example (n : ℕ) (hn : n ≠ 0) :
    Additive (Fˣ ⧸ (powMonoidHom n : Fˣ →* Fˣ).range) ≃+
      ClassFieldTheory.H n F 1 (ClassFieldTheory.muNRep n F) :=
  ClassFieldTheory.kummerEquiv_mixed p F n hn

example (n : ℕ) (hn : n ≠ 0) :
    Nonempty (ClassFieldTheory.H n F 2 (ClassFieldTheory.muNRep n F) ≃+ ZMod n) :=
  ClassFieldTheory.h2MuEquivZMod_mixed p F n hn

/-- **The cyclotomic/reciprocity comparison, as a closed proof.** For a unit `u` and any
`σ ∈ G_F` whose class is `Art_F(u)`, the cyclotomic character of `σ` is `N_{F/ℚ_p}(u)⁻¹`. This
theorem ties four separate conventions together — Mathlib's `cyclotomicCharacter`, the supplier's
arithmetic-Frobenius `artinMap`, the field norm, and the inverse — and it is a **named theorem
with a supplier proof**, so a change of normalization in any one of them breaks this file instead
of silently changing the marked relator of Layer 6. `ClassFieldTheory.cyclotomicCharacter_artinMap`
is proved in that roadmap's Layer 11, from global reciprocity over `ℚ`, so this theorem, and every
statement here that consumes it, depends on `ClassFieldTheory` Layers 10 and 11. -/
theorem localCyclotomicCharacter_artinMap_unit (u : Fˣ)
    (hu : ValuativeRel.valuation F (u : F) = 1) (σ : Field.absoluteGaloisGroup F)
    (hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization F)
      = ClassFieldTheory.artinMap F u) :
    Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom (localCyclotomicCharacter p F σ)
      = (Units.map (Algebra.norm ℚ_[p] : F →* ℚ_[p]) u)⁻¹ :=
  ClassFieldTheory.cyclotomicCharacter_artinMap p F u hu σ hσ

/-- The `ℚ_p` specialization, again as a closed proof. Together with the theorem above this pins
the sign of the exponent: with the geometric normalization the right-hand side would be `u`.
`ClassFieldTheory.cyclotomicCharacter_artinMap_padic` is proved in that roadmap's Layer 11, from
global reciprocity over `ℚ`, so this theorem depends on `ClassFieldTheory` Layers 10 and 11. -/
theorem localCyclotomicCharacter_artinMap_padic [IsNonarchimedeanLocalField ℚ_[p]] (u : ℤ_[p]ˣ)
    (σ : Field.absoluteGaloisGroup ℚ_[p])
    (hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization ℚ_[p])
      = ClassFieldTheory.artinMap ℚ_[p] (Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom u)) :
    localCyclotomicCharacter p ℚ_[p] σ = u⁻¹ :=
  ClassFieldTheory.cyclotomicCharacter_artinMap_padic p u σ hσ

/-- **The value at the uniformizer `p` of `ℚ_p`**: `χ_cyc(Art_{ℚ_p}(p)) = 1`. For every `n`, `p`
is the norm of `1 - ζ` from `ℚ_p(ζ)`, `ζ` a primitive `p^n`-th root of unity: Mathlib's
`IsPrimitiveRoot.norm_sub_one_of_prime_ne_two` and `IsPrimitiveRoot.norm_sub_one_two`, whose
hypothesis `Irreducible (cyclotomic (p ^ n) ℚ_[p])` is `irreducible_cyclotomic_prime_pow_ratPadic`.
So `p` lies in the norm group of `ℚ_p(μ_{p^n})`, which the finite Artin map kills
(`ClassFieldTheory.normResidue`), and the finite map is the restriction of the absolute one
(`ClassFieldTheory.artinMap_restrict`). A lift `σ` of `Art_{ℚ_p}(p)` therefore fixes `μ_{p^n}` for
every `n`, so `χ_cyc(σ) ≡ 1 mod p^n` by `cyclotomicCharacter.spec`, and `χ_cyc(σ) = 1` by
`PadicInt.ext_of_toZModPow`. It consumes no cyclotomic normalization of the Artin map on units, so
it does not depend on `ClassFieldTheory` Layers 10 and 11. -/
theorem localCyclotomicCharacter_artinMap_padic_uniformizer [IsNonarchimedeanLocalField ℚ_[p]]
    (σ : Field.absoluteGaloisGroup ℚ_[p])
    (_hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization ℚ_[p])
      = ClassFieldTheory.artinMap ℚ_[p]
          (Units.mk0 (p : ℚ_[p]) (Nat.cast_ne_zero.mpr (Fact.out : p.Prime).ne_zero))) :
    localCyclotomicCharacter p ℚ_[p] σ = 1 :=
  sorry

/-- **The uniformizer half of the comparison**, and the second generator of the orientation image.
For a uniformizer `π` of `F` with residue degree `f = f(F/ℚ_p)`,
`χ_cyc(Art_F(π)) · N_{F/ℚ_p}(π) = p^f`.

Its inputs are three. Write `N_{F/ℚ_p}(π) = u · p^f` with `u ∈ ℤ_pˣ`. Norm functoriality
`ClassFieldTheory.artinMap_norm` over `ℚ_p` makes the image of a lift of `Art_F(π)` under
`ClassFieldTheory.absoluteGaloisGroupExtend` a lift of `Art_{ℚ_p}(u) · Art_{ℚ_p}(p)^f`, and the
cyclotomic character is read through that map
(`localCyclotomicCharacter_absoluteGaloisGroupExtend`);
`localCyclotomicCharacter_artinMap_padic` gives `u⁻¹` on the first factor and
`localCyclotomicCharacter_artinMap_padic_uniformizer` gives `1` on the second. Through
`localCyclotomicCharacter_artinMap_padic` it depends on `ClassFieldTheory` Layers 10 and 11.

⚠ This theorem is **not** a consequence of the unit case. See the counterexample in
`range_localCyclotomicCharacter`: `K(μ_{p^n})/K` need not be totally ramified, so `Kˣ` is not
`𝒪[K]ˣ · N(K(μ_{p^n})ˣ)` and the unit norms do not exhaust the image. -/
theorem localCyclotomicCharacter_artinMap_uniformizer [IsNonarchimedeanLocalField ℚ_[p]]
    [ValuativeExtension ℚ_[p] F] (π : 𝒪[F]) (_hπ : Irreducible π) (hπ0 : (π : F) ≠ 0)
    (σ : Field.absoluteGaloisGroup F)
    (_hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization F)
      = ClassFieldTheory.artinMap F (Units.mk0 (π : F) hπ0)) :
    algebraMap ℤ_[p] ℚ_[p] (localCyclotomicCharacter p F σ : ℤ_[p])
        * Algebra.norm ℚ_[p] (π : F)
      = (p : ℚ_[p]) ^ LocalFieldsRamification.inertiaDegree ℚ_[p] F :=
  sorry

end ClassFieldSupplierChecks

/-! ## Layers 1 and 2: cohomology and inflation -/

/-! ### Layer 1: the chosen-root dictionary

A primitive `n`-th root of unity `ζ ∈ F` identifies `μ_n` with the trivial module `ℤ/n`, and the
Kummer pairing of ClassFieldTheory with the multiplication pairing of ProfiniteProPGroups; at
`n = p` this is `μ_p ≅ 𝔽_p`. Both statements need only a field containing `ζ`: no valuation or
topology of `F`, and no primality of `n`, enters them. -/

section ChosenRootDictionary

variable (n : ℕ) [NeZero n] (F : Type) [Field F]

/-- **Layer 1, the chosen-root coefficient dictionary** `μ_n ≅ ℤ/n`, `ζ ^ x ↦ x`, as a
construction; at `n = p` it is `μ_p ≅ 𝔽_p`. Its underlying map is ClassFieldTheory's coordinate
`ClassFieldTheory.muNRepEquivZMod ζ` of `μ_n(Fˢ)`, followed by Tau Ceti's identification
`TauCeti.trivialFpEquiv` of the carrier of `trivialFp` with `ZMod n`; the defining equation is
`trivialFpEquiv_muNRepIsoTrivialFp_hom_apply`. Both directions are morphisms of coefficient
objects because `G_F` fixes `μ_n(Fˢ)` pointwise when `ζ ∈ F` (`ClassFieldTheory.muNRep_ρ_eq_self`)
and acts trivially on `ℤ/n` (`TauCeti.trivialFp_ρ_apply_apply`), and both are continuous because
both carriers are discrete. At `n = p` this is the identification
`ClassFieldTheory.h2FpEquivZMod_of_mu` takes as its hypothesis. -/
noncomputable def muNRepIsoTrivialFp (ζ : F) (hζ : IsPrimitiveRoot ζ n) :
    ClassFieldTheory.muNRep n F ≅
      ProfiniteProPGroups.trivialFp n (Field.absoluteGaloisGroup F) :=
  let e : (ClassFieldTheory.muNRep n F).V ≃+
      (ProfiniteProPGroups.trivialFp n (Field.absoluteGaloisGroup F)).V :=
    (ClassFieldTheory.muNRepEquivZMod ζ hζ).trans
      (TauCeti.trivialFpEquiv n (Field.absoluteGaloisGroup F)).symm.toAddEquiv
  { hom := CategoryTheory.ConcreteCategory.ofHom (C := ClassFieldTheory.GalRep n F)
      ({ toContinuousLinearMap :=
          ⟨e.toAddMonoidHom.toZModLinearMap n, continuous_of_discreteTopology⟩
         isIntertwining' := fun g => by
          refine ContinuousLinearMap.ext fun x => ?_
          simp [ClassFieldTheory.muNRep_ρ_eq_self ζ hζ g x] } :
        ContIntertwiningMap (ClassFieldTheory.muNRep n F).ρ
          (ProfiniteProPGroups.trivialFp n (Field.absoluteGaloisGroup F)).ρ)
    inv := CategoryTheory.ConcreteCategory.ofHom (C := ClassFieldTheory.GalRep n F)
      ({ toContinuousLinearMap :=
          ⟨e.symm.toAddMonoidHom.toZModLinearMap n, continuous_of_discreteTopology⟩
         isIntertwining' := fun g => by
          refine ContinuousLinearMap.ext fun y => ?_
          simp [ClassFieldTheory.muNRep_ρ_eq_self ζ hζ g] } :
        ContIntertwiningMap (ProfiniteProPGroups.trivialFp n (Field.absoluteGaloisGroup F)).ρ
          (ClassFieldTheory.muNRep n F).ρ)
    hom_inv_id := by
      ext x
      exact e.symm_apply_apply x
    inv_hom_id := by
      ext y
      exact e.apply_symm_apply y }

/-- **The dictionary is the coordinate `ζ ^ x ↦ x`**: read in `ZMod n` through Tau Ceti's
`trivialFpEquiv`, it is `ClassFieldTheory.muNRepEquivZMod ζ`. A closed proof. -/
theorem trivialFpEquiv_muNRepIsoTrivialFp_hom_apply (ζ : F) (hζ : IsPrimitiveRoot ζ n)
    (x : (ClassFieldTheory.muNRep n F).V) :
    TauCeti.trivialFpEquiv n (Field.absoluteGaloisGroup F) ((muNRepIsoTrivialFp n F ζ hζ).hom x) =
      ClassFieldTheory.muNRepEquivZMod ζ hζ x :=
  (TauCeti.trivialFpEquiv n (Field.absoluteGaloisGroup F)).apply_symm_apply
    (ClassFieldTheory.muNRepEquivZMod ζ hζ x)

/-- **The dictionary carries the Kummer pairing to multiplication.** ClassFieldTheory's
`kummerCupPairing ζ` is `(x, y) ↦ log_ζ(x) · y` (`ClassFieldTheory.kummerCupPairing_bil`), and
`log_ζ(log_ζ(x) · y) = log_ζ(x) · log_ζ(y)` is the multiplication of `ℤ/n`, which is
ProfiniteProPGroups' `fpPairing` (`ProfiniteProPGroups.fpPairing_bil`). This is the compatibility
hypothesis of `ProfiniteCohomology.cup_coeffMap` that carries the Kummer cup square on
`H¹(G_F, μ_p)` to the cup square `cupFp` on `H¹(G_F, 𝔽_p)`. A closed proof. -/
theorem muNRepIsoTrivialFp_hom_kummerCupPairing (ζ : F) (hζ : IsPrimitiveRoot ζ n)
    (x y : (ClassFieldTheory.muNRep n F).V) :
    (muNRepIsoTrivialFp n F ζ hζ).hom ((ClassFieldTheory.kummerCupPairing ζ hζ).bil x y) =
      (ProfiniteProPGroups.fpPairing n (Field.absoluteGaloisGroup F)).bil
        ((muNRepIsoTrivialFp n F ζ hζ).hom x) ((muNRepIsoTrivialFp n F ζ hζ).hom y) := by
  apply (TauCeti.trivialFpEquiv n (Field.absoluteGaloisGroup F)).injective
  rw [ProfiniteProPGroups.fpPairing_bil, trivialFpEquiv_muNRepIsoTrivialFp_hom_apply,
    trivialFpEquiv_muNRepIsoTrivialFp_hom_apply, trivialFpEquiv_muNRepIsoTrivialFp_hom_apply,
    ClassFieldTheory.kummerCupPairing_bil, ZMod.map_smul, smul_eq_mul]

end ChosenRootDictionary

/-! ### Layer 1: local cohomology with trivial coefficients

Stated at `Type`, as the class-field suppliers are, with Tau Ceti's
`TauCeti.FinitePadicExtension F p` carrying the finite `ℚ_p`-structure of `F`. -/

section LocalCohomologyTrivialFp

variable (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
  [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]
  [TauCeti.FinitePadicExtension F p]

/-- **Layer 1, `H²(G_F, 𝔽_p) ≃ 𝔽_p` when `μ_p ⊆ F`**: `ClassFieldTheory.h2FpEquivZMod_of_mu` at the
trivial module, through the chosen-root dictionary `muNRepIsoTrivialFp`. A closed proof, so the
supplier's coefficient hypothesis is checked against `ProfiniteProPGroups.trivialFp`. -/
theorem nonempty_cohomFp_two_addEquiv_of_mu (ζ : F) (hζ : IsPrimitiveRoot ζ p) :
    Nonempty (ProfiniteProPGroups.cohomFp p (Field.absoluteGaloisGroup F) 2 ≃+ ZMod p) :=
  ClassFieldTheory.h2FpEquivZMod_of_mu p F ζ hζ _ ⟨muNRepIsoTrivialFp p F ζ hζ⟩

/-- **Layer 1, `dim H¹(G_F, 𝔽_p) = N + 2` when `μ_p ⊆ F`, by Kummer theory alone.** The dictionary
`muNRepIsoTrivialFp` identifies `H¹(G_F, 𝔽_p)` with `H¹(G_F, μ_p)`, which
`ClassFieldTheory.kummerEquiv_mixed` at `n = p` identifies with `Fˣ/(Fˣ)^p`. Its order is
`p · #μ_p(F) · #𝓀[F] ^ v_F(p)` (`LocalFieldsRamification.card_powerClasses_mixed` at `n = p`), and
`#μ_p(F) = p` (`IsPrimitiveRoot.card_rootsOfUnity`) while `#𝓀[F] ^ v_F(p) = p ^ (e · f) = p ^ N`
(`LocalFieldsRamification.absoluteRamificationIndex_eq_natCastValuation`, `card_residueField`,
`ramificationIndex_mul_inertiaDegree`); so the order is `p ^ (N + 2)`. At `p = 2` the count is
`LocalFieldsRamification.card_squareClasses_dyadic`. The Euler characteristic is not used. -/
theorem finrank_cohomFp_one_of_mu (_hmu : ∃ ζ : F, IsPrimitiveRoot ζ p) :
    Module.finrank (ZMod p) (ProfiniteProPGroups.cohomFp p (Field.absoluteGaloisGroup F) 1)
      = Module.finrank ℚ_[p] F + 2 :=
  sorry

/-- **Layer 1, `dim H¹(G_F, 𝔽_p) = N + 1` when `μ_p ⊄ F`**, from the general formula
`finrank_cohomFp_one` and the vanishing of `H²(G_F, 𝔽_p)`, which is dual to `H⁰(G_F, μ_p) = 0`. -/
theorem finrank_cohomFp_one_of_not_mu (_hmu : ¬ ∃ ζ : F, IsPrimitiveRoot ζ p) :
    Module.finrank (ZMod p) (ProfiniteProPGroups.cohomFp p (Field.absoluteGaloisGroup F) 1)
      = Module.finrank ℚ_[p] F + 1 :=
  sorry

/-- **Layer 1, the Euler-characteristic formula** `dim H¹ = 1 + dim H² + N` for `𝔽_p`:
`ClassFieldTheory.eulerCharacteristic_finrank_fp` at the trivial module, with `dim H⁰ = 1`. It is
the route to `finrank_cohomFp_one_of_not_mu`; when `μ_p ⊆ F` it agrees with
`finrank_cohomFp_one_of_mu`, since `H²` is then one-dimensional. -/
theorem finrank_cohomFp_one :
    Module.finrank (ZMod p) (ProfiniteProPGroups.cohomFp p (Field.absoluteGaloisGroup F) 1)
      = 1 + Module.finrank (ZMod p) (ProfiniteProPGroups.cohomFp p (Field.absoluteGaloisGroup F) 2)
        + Module.finrank ℚ_[p] F :=
  sorry

/-- **Layer 1, the cup square on `H¹(G_F, 𝔽_p)` is nondegenerate on the left when `μ_p ⊆ F`**, from
local duality at `A = μ_p` and `(i, j) = (1, 1)`. A closed proof, in five steps.

1. The chosen-root dictionary `muNRepIsoTrivialFp ζ` carries `a ≠ 0` to a class `x ≠ 0` of
   `H¹(G_F, μ_p)`: coefficient maps along an isomorphism are inverse to each other
   (`TauCeti.ContinuousCohomology.coeffMap_comp`, `TauCeti.ContinuousCohomology.coeffMap_id`).
2. `ClassFieldTheory.muNRepToTateDual ζ : μ_p → Hom(μ_p, μ_p)` is bijective
   (`ClassFieldTheory.bijective_muNRepToTateDual`), so it has an inverse morphism, and the image
   `x'` of `x` in `H¹(G_F, Hom(μ_p, μ_p))` is nonzero.
3. The first half of `ClassFieldTheory.tateDualityPairing_perfect_mixed`, with an invariant
   `tr : H²(G_F, μ_p) ≃ ℤ/p` from `ClassFieldTheory.h2MuEquivZMod_mixed`, gives `y` with
   `⟨x', y⟩ ≠ 0`.
4. `ClassFieldTheory.tateDualityPairing_muNRepToTateDual` identifies `⟨x', y⟩` with the Hilbert
   pairing `ClassFieldTheory.localSymbol (kummerCupPairing ζ) tr x y`, which is `tr` of the cup of
   `x` and `y` along `kummerCupPairing ζ`; so that cup is nonzero.
5. `ProfiniteCohomology.cup_coeffMap`, at the compatibility
   `muNRepIsoTrivialFp_hom_kummerCupPairing`, carries that cup to `cupFp a b` for `b` the image of
   `y`, and the dictionary is injective on `H²`. -/
theorem cupFp_left_nondegenerate_of_mu (hmu : ∃ ζ : F, IsPrimitiveRoot ζ p) :
    ∀ a : ProfiniteProPGroups.cohomFp p (Field.absoluteGaloisGroup F) 1, a ≠ 0 →
      ∃ b, ProfiniteProPGroups.cupFp p (Field.absoluteGaloisGroup F) a b ≠ 0 := by
  obtain ⟨ζ, hζ⟩ := hmu
  obtain ⟨tr⟩ := ClassFieldTheory.h2MuEquivZMod_mixed p F p (NeZero.ne p)
  -- A coefficient morphism with a left inverse has a left inverse on cohomology.
  have hleft : ∀ {X Y : ClassFieldTheory.GalRep p F} (f : X ⟶ Y) (g : Y ⟶ X), f ≫ g = 𝟙 X →
      ∀ (n : ℕ) (z : ClassFieldTheory.H p F n X),
        (ProfiniteCohomology.coeffMap (ZMod p) g n).hom
          ((ProfiniteCohomology.coeffMap (ZMod p) f n).hom z) = z := by
    intro X Y f g hfg n z
    have key : TauCeti.ContinuousCohomology.coeffMap f n ≫
        TauCeti.ContinuousCohomology.coeffMap g n = 𝟙 _ := by
      rw [← TauCeti.ContinuousCohomology.coeffMap_comp, hfg,
        TauCeti.ContinuousCohomology.coeffMap_id]
    have h := congrArg
      (fun φ : continuousCohomology n X ⟶ continuousCohomology n X => φ.hom z) key
    simp only [TopModuleCat.hom_comp, TopModuleCat.hom_id, ContinuousLinearMap.coe_comp,
      Function.comp_apply, ContinuousLinearMap.coe_id', id_eq] at h
    exact h
  -- Step 1: `a` is the image of a nonzero class `x` of `H¹(G_F, μ_p)`.
  intro a ha
  obtain ⟨x, rfl⟩ : ∃ x : ClassFieldTheory.H p F 1 (ClassFieldTheory.muNRep p F),
      (ProfiniteCohomology.coeffMap (ZMod p) (muNRepIsoTrivialFp p F ζ hζ).hom 1).hom x = a :=
    ⟨_, hleft (muNRepIsoTrivialFp p F ζ hζ).inv (muNRepIsoTrivialFp p F ζ hζ).hom
      (muNRepIsoTrivialFp p F ζ hζ).inv_hom_id 1 a⟩
  have hx : x ≠ 0 := by
    rintro rfl
    exact ha (map_zero _)
  -- Step 2: `muNRepToTateDual ζ` has an inverse morphism, so the image of `x` is nonzero.
  have hD : ∀ (g : Field.absoluteGaloisGroup F)
      (w : (ClassFieldTheory.tateDual (ClassFieldTheory.muNRep p F)).V),
      (ClassFieldTheory.tateDual (ClassFieldTheory.muNRep p F)).ρ g w = w := by
    intro g w
    obtain ⟨v, rfl⟩ := (ClassFieldTheory.bijective_muNRepToTateDual ζ hζ).2 w
    rw [← TopRep.hom_comm_apply, ClassFieldTheory.muNRep_ρ_eq_self ζ hζ g v]
  let E := LinearEquiv.ofBijective
    (ClassFieldTheory.muNRepToTateDual ζ hζ).hom.toContinuousLinearMap.toLinearMap
    (ClassFieldTheory.bijective_muNRepToTateDual ζ hζ)
  let ψ : ClassFieldTheory.tateDual (ClassFieldTheory.muNRep p F) ⟶
      ClassFieldTheory.muNRep p F :=
    CategoryTheory.ConcreteCategory.ofHom (C := ClassFieldTheory.GalRep p F)
      ({ toContinuousLinearMap := ⟨E.symm.toLinearMap, continuous_of_discreteTopology⟩
         isIntertwining' := fun g => by
          refine ContinuousLinearMap.ext fun w => ?_
          simp [hD g, ClassFieldTheory.muNRep_ρ_eq_self ζ hζ g] } :
        ContIntertwiningMap (ClassFieldTheory.tateDual (ClassFieldTheory.muNRep p F)).ρ
          (ClassFieldTheory.muNRep p F).ρ)
  have hψ : ClassFieldTheory.muNRepToTateDual ζ hζ ≫ ψ = 𝟙 _ := by
    ext v
    exact E.symm_apply_apply v
  have hx' : (ProfiniteCohomology.coeffMap (ZMod p)
      (ClassFieldTheory.muNRepToTateDual ζ hζ) 1).hom x ≠ 0 := by
    intro h
    exact hx ((hleft _ ψ hψ 1 x).symm.trans
      ((congrArg (ProfiniteCohomology.coeffMap (ZMod p) ψ 1).hom h).trans (map_zero _)))
  -- Step 3: local duality gives `y` pairing nontrivially with the image of `x`.
  obtain ⟨y, hy⟩ : ∃ y : ClassFieldTheory.H p F 1 (ClassFieldTheory.muNRep p F),
      ClassFieldTheory.tateDualityPairing (ClassFieldTheory.muNRep p F) tr 1 1 rfl
        ((ProfiniteCohomology.coeffMap (ZMod p) (ClassFieldTheory.muNRepToTateDual ζ hζ) 1).hom
          x) y ≠ 0 := by
    by_contra h
    push Not at h
    exact hx' ((ClassFieldTheory.tateDualityPairing_perfect_mixed p F p (NeZero.ne p)
      (ClassFieldTheory.muNRep p F) tr inferInstance 1 1 rfl).1 _ h)
  -- Step 4: that pairing is the Hilbert pairing, so the Kummer cup of `x` and `y` is nonzero.
  rw [ClassFieldTheory.tateDualityPairing_muNRepToTateDual ζ hζ tr x y] at hy
  have hcup : ProfiniteCohomology.cup (ClassFieldTheory.kummerCupPairing ζ hζ) 1 1 x y ≠ 0 := by
    intro h0
    apply hy
    rw [ClassFieldTheory.localSymbol, h0]
    exact map_zero tr
  -- Step 5: the dictionary carries the Kummer cup to `cupFp`, injectively.
  refine ⟨(ProfiniteCohomology.coeffMap (ZMod p) (muNRepIsoTrivialFp p F ζ hζ).hom 1).hom y,
    fun h0 => hcup ?_⟩
  have h1 : ProfiniteCohomology.cup (ProfiniteProPGroups.fpPairing p (Field.absoluteGaloisGroup F))
      1 1 ((ProfiniteCohomology.coeffMap (ZMod p) (muNRepIsoTrivialFp p F ζ hζ).hom 1).hom x)
      ((ProfiniteCohomology.coeffMap (ZMod p) (muNRepIsoTrivialFp p F ζ hζ).hom 1).hom y) = 0 :=
    h0
  have h2 := ProfiniteCohomology.cup_coeffMap (ClassFieldTheory.kummerCupPairing ζ hζ)
    (ProfiniteProPGroups.fpPairing p (Field.absoluteGaloisGroup F))
    (muNRepIsoTrivialFp p F ζ hζ).hom (muNRepIsoTrivialFp p F ζ hζ).hom
    (muNRepIsoTrivialFp p F ζ hζ).hom (muNRepIsoTrivialFp_hom_kummerCupPairing p F ζ hζ) 1 1 x y
  exact (hleft (muNRepIsoTrivialFp p F ζ hζ).hom (muNRepIsoTrivialFp p F ζ hζ).inv
      (muNRepIsoTrivialFp p F ζ hζ).hom_inv_id (1 + 1) _).symm.trans
    ((congrArg
      (ProfiniteCohomology.coeffMap (ZMod p) (muNRepIsoTrivialFp p F ζ hζ).inv (1 + 1)).hom
      (h2.trans h1)).trans (map_zero _))

/-- **Layer 1, the cup square is nondegenerate on both sides when `μ_p ⊆ F`.** One side suffices:
the other follows from the graded commutativity `ProfiniteProPGroups.cupFp_gradedComm`, a closed
proof. -/
theorem cupFp_nondegenerate_of_mu (hmu : ∃ ζ : F, IsPrimitiveRoot ζ p) :
    (∀ a : ProfiniteProPGroups.cohomFp p (Field.absoluteGaloisGroup F) 1, a ≠ 0 →
        ∃ b, ProfiniteProPGroups.cupFp p (Field.absoluteGaloisGroup F) a b ≠ 0) ∧
      (∀ b : ProfiniteProPGroups.cohomFp p (Field.absoluteGaloisGroup F) 1, b ≠ 0 →
        ∃ a, ProfiniteProPGroups.cupFp p (Field.absoluteGaloisGroup F) a b ≠ 0) := by
  refine ⟨cupFp_left_nondegenerate_of_mu p F hmu, fun b hb => ?_⟩
  obtain ⟨a, ha⟩ := cupFp_left_nondegenerate_of_mu p F hmu b hb
  exact ⟨a, by rw [ProfiniteProPGroups.cupFp_gradedComm]; exact neg_ne_zero.mpr ha⟩

end LocalCohomologyTrivialFp

/-! ### Layer 2: inflation from the maximal pro-`p` quotient -/

/-- Degree-one inflation from `G_K(p)` to `G_K` is an isomorphism for trivial `𝔽_p`
coefficients. Its proof uses `ProfiniteCohomology.infl` and the named trivial-coefficient
comparison; this declaration is the resulting arithmetic bridge. -/
noncomputable def inflH1AbsoluteGaloisProP (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K]
    [CompactSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (absoluteGaloisGroupProP p K)] :
    ProfiniteProPGroups.cohomFp p (absoluteGaloisGroupProP p K) 1 ≃ₗ[ZMod p]
      ProfiniteProPGroups.cohomFp p (Field.absoluteGaloisGroup K) 1 :=
  sorry

/-- The actual degree-two inflation map, after identifying the quotient's invariant coefficient
object with the supplier's `trivialFp`. -/
noncomputable def inflH2AbsoluteGaloisProPMap (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K]
    [CompactSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (absoluteGaloisGroupProP p K)] :
    ProfiniteProPGroups.cohomFp p (absoluteGaloisGroupProP p K) 2 →ₗ[ZMod p]
      ProfiniteProPGroups.cohomFp p (Field.absoluteGaloisGroup K) 2 :=
  sorry

/-- Degree-two inflation is injective. This is the five-term-sequence half of the comparison;
surjectivity is a separate arithmetic theorem below. -/
theorem inflH2AbsoluteGaloisProP_injective (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K]
    [CompactSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (absoluteGaloisGroupProP p K)] :
    Function.Injective (inflH2AbsoluteGaloisProPMap p K) :=
  sorry

/-- **Degree-two inflation is surjective for a `p`-adic field**, in the two arithmetic cases. When
`μ_p ⊄ K` the target `H²(G_K, 𝔽_p)` vanishes, by Layer 1. When `μ_p ⊆ K` the target is
one-dimensional, by Layer 1, and it contains a nonzero cup square of two inflated classes:
degree-one inflation is bijective (`inflH1AbsoluteGaloisProP`), the cup square on `H¹(G_K, 𝔽_p)` is
nondegenerate (Layer 1), and inflation commutes with the cup product
(`ProfiniteCohomology.cup_infl`). Unlike injectivity, surjectivity uses the arithmetic of `K`. -/
theorem inflH2AbsoluteGaloisProP_surjective (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [CompactSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (absoluteGaloisGroupProP p K)] :
    Function.Surjective (inflH2AbsoluteGaloisProPMap p K) :=
  sorry

/-- **The degree-two inflation isomorphism** `H²(G_K(p), 𝔽_p) ≃ H²(G_K, 𝔽_p)` for a `p`-adic
field: the inflation map `inflH2AbsoluteGaloisProPMap`, which is bijective by
`inflH2AbsoluteGaloisProP_injective` and `inflH2AbsoluteGaloisProP_surjective`. The equivalence is
the inflation map by construction, and the local-field structure of `K` enters it through the
surjectivity theorem. -/
noncomputable def inflH2AbsoluteGaloisProP (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [CompactSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (absoluteGaloisGroupProP p K)] :
    ProfiniteProPGroups.cohomFp p (absoluteGaloisGroupProP p K) 2 ≃ₗ[ZMod p]
      ProfiniteProPGroups.cohomFp p (Field.absoluteGaloisGroup K) 2 :=
  LinearEquiv.ofBijective (inflH2AbsoluteGaloisProPMap p K)
    ⟨inflH2AbsoluteGaloisProP_injective p K, inflH2AbsoluteGaloisProP_surjective p K⟩

theorem cohomFp_two_subsingleton_of_not_mu (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [CompactSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (absoluteGaloisGroupProP p K)]
    (_hmu : ¬ ∃ ζ : K, IsPrimitiveRoot ζ p) :
    Subsingleton (ProfiniteProPGroups.cohomFp p (absoluteGaloisGroupProP p K) 2) :=
  sorry

/-! ### Layer 2: degree-one inflation with twisted coefficients

Stated on Tau Ceti's explicit model, with Tau Ceti's twisted modules `TauCeti.ZModTwist χ i`, the
coefficients `I(χ)/pⁱ` of `TauCeti.HasPrescriptionProperty`. -/

section TwistedInflation

variable (p : ℕ) [Fact p.Prime] (K : Type u) [Field K]

/-- The quotient map `G_K → G_K(p)` as a continuous homomorphism: Tau Ceti's
`ContinuousMonoidHom.quotientMk` at the supplier's `proPKernel`. -/
noncomputable abbrev absoluteGaloisGroupProPMk :
    Field.absoluteGaloisGroup K →ₜ* absoluteGaloisGroupProP p K :=
  TauCeti.ContinuousMonoidHom.quotientMk
    (ProfiniteProPGroups.proPKernel p (Field.absoluteGaloisGroup K))

variable (χ : absoluteGaloisGroupProP p K →ₜ* ℤ_[p]ˣ) (i : ℕ)

/-- **Layer 2, the pro-`p` kernel acts trivially on a pulled-back twist**: `χ ∘ π` kills
`R = proPKernel p G_K`, so its scalar on `I(χ ∘ π)/pⁱ` is `1` there. A closed proof. -/
theorem proPKernel_smul_zModTwist
    (r : ProfiniteProPGroups.proPKernel p (Field.absoluteGaloisGroup K))
    (x : TauCeti.ZModTwist (χ.comp (absoluteGaloisGroupProPMk p K)) i) :
    (r : Field.absoluteGaloisGroup K) • x = x := by
  ext
  have h1 : absoluteGaloisGroupProPMk p K (r : Field.absoluteGaloisGroup K) = 1 :=
    (QuotientGroup.eq_one_iff _).2 r.2
  simp [h1]

/-- **Layer 2, the coefficient adapter**: the `R`-invariants of `I(χ ∘ π)/pⁱ`, which are all of it
(`proPKernel_smul_zModTwist`), are `I(χ)/pⁱ` on `G_K(p)`. It is the identity of `ZMod (p ^ i)`, and
it is `G_K(p)`-equivariant (`zModTwistFixedPointsEquiv_smul`). It is a coefficient adapter of the
same kind as the `trivialFp` one, not a new coefficient carrier. -/
noncomputable def zModTwistFixedPointsEquiv :
    FixedPoints.addSubgroup (ProfiniteProPGroups.proPKernel p (Field.absoluteGaloisGroup K))
        (TauCeti.ZModTwist (χ.comp (absoluteGaloisGroupProPMk p K)) i) ≃+
      TauCeti.ZModTwist χ i where
  toFun x := ⟨(x : TauCeti.ZModTwist (χ.comp (absoluteGaloisGroupProPMk p K)) i).val⟩
  invFun y := ⟨⟨y.val⟩, (FixedPoints.mem_addSubgroup _ _ _).2 fun r =>
    proPKernel_smul_zModTwist p K χ i r _⟩
  left_inv _ := rfl
  right_inv _ := rfl
  map_add' _ _ := rfl

/-- The adapter is `G_K(p)`-equivariant, for the quotient action on the invariants. A closed
proof. -/
theorem zModTwistFixedPointsEquiv_smul (q : absoluteGaloisGroupProP p K)
    (x : FixedPoints.addSubgroup (ProfiniteProPGroups.proPKernel p (Field.absoluteGaloisGroup K))
      (TauCeti.ZModTwist (χ.comp (absoluteGaloisGroupProPMk p K)) i)) :
    zModTwistFixedPointsEquiv p K χ i (q • x) = q • zModTwistFixedPointsEquiv p K χ i x := by
  induction q using QuotientGroup.induction_on with
  | H g =>
    ext
    simp [zModTwistFixedPointsEquiv]

/-- **Layer 2, degree-one inflation with twisted coefficients is bijective**:
`H¹(G_K ⧸ R, (I(χ ∘ π)/pⁱ)^R) → H¹(G_K, I(χ ∘ π)/pⁱ)`, Tau Ceti's `explicitInfl1` at
`R = proPKernel p G_K`. It is injective (`TauCeti.ContCohomology.explicitInfl1_injective`) and its
image is the kernel of restriction to `R` (`TauCeti.ContCohomology.explicitInfRes_exact`), and that
restriction lands in `H¹(R, I(χ ∘ π)/pⁱ) = 0`: `R` acts trivially (`proPKernel_smul_zModTwist`), so
`H¹(R, -)` is the group of continuous homomorphisms `R → ℤ/pⁱ`
(`TauCeti.ContCohomology.H1EquivOfSmulEqSelf`), and each of them is trivial, since its kernel is
an open normal subgroup with `p`-group quotient and `R` has no proper one
(`ProfiniteProPGroups.proPKernel_proPKernel_eq_top`). A closed proof. -/
theorem explicitInfl1_zModTwist_bijective :
    Function.Bijective (TauCeti.ContCohomology.explicitInfl1 (Field.absoluteGaloisGroup K)
      (TauCeti.ZModTwist (χ.comp (absoluteGaloisGroupProPMk p K)) i)
      (ProfiniteProPGroups.proPKernel p (Field.absoluteGaloisGroup K))) := by
  refine ⟨TauCeti.ContCohomology.explicitInfl1_injective _ _ _, fun x => ?_⟩
  -- A continuous homomorphism from `R` to a discrete `p`-group is trivial.
  have hR : ∀ {M : Type u} [Group M] [TopologicalSpace M] [DiscreteTopology M], IsPGroup p M →
      ∀ φ : ProfiniteProPGroups.proPKernel p (Field.absoluteGaloisGroup K) →ₜ* M, φ = 1 := by
    intro M _ _ _ hM φ
    ext r
    have hr : r ∈ ProfiniteProPGroups.proPKernel p
        (ProfiniteProPGroups.proPKernel p (Field.absoluteGaloisGroup K)) := by
      rw [ProfiniteProPGroups.proPKernel_proPKernel_eq_top p (Field.absoluteGaloisGroup K)]
      exact Subgroup.mem_top r
    let U : OpenNormalSubgroup
        (ProfiniteProPGroups.proPKernel p (Field.absoluteGaloisGroup K)) :=
      { toSubgroup := φ.toMonoidHom.ker
        isOpen' := (isOpen_discrete ({1} : Set M)).preimage φ.continuous
        isNormal' := MonoidHom.normal_ker _ }
    exact Subgroup.mem_iInf.1 hr ⟨U, (hM.to_subgroup φ.toMonoidHom.range).of_equiv
      (QuotientGroup.quotientKerEquivRange φ.toMonoidHom).symm⟩
  have htriv : ∀ (r : ProfiniteProPGroups.proPKernel p (Field.absoluteGaloisGroup K))
      (m : TauCeti.ZModTwist (χ.comp (absoluteGaloisGroupProPMk p K)) i), r • m = m :=
    fun r m => proPKernel_smul_zModTwist p K χ i r m
  have hM : IsPGroup p
      (Multiplicative (TauCeti.ZModTwist (χ.comp (absoluteGaloisGroupProPMk p K)) i)) :=
    TauCeti.isProP_iff_isPGroup.1 (TauCeti.ZModTwist.isProP_multiplicative _ i)
  have hsub : Subsingleton (TauCeti.ContCohomology.H1
      (ProfiniteProPGroups.proPKernel p (Field.absoluteGaloisGroup K))
      (TauCeti.ZModTwist (χ.comp (absoluteGaloisGroupProPMk p K)) i)) := by
    refine (TauCeti.ContCohomology.H1EquivOfSmulEqSelf htriv).toEquiv.subsingleton_congr.2
      ⟨fun φ ψ => Additive.toMul.injective ?_⟩
    rw [hR hM (Additive.toMul φ), hR hM (Additive.toMul ψ)]
  have hx : x ∈ (TauCeti.ContCohomology.explicitRes1 (Field.absoluteGaloisGroup K)
      (TauCeti.ZModTwist (χ.comp (absoluteGaloisGroupProPMk p K)) i)
      (ProfiniteProPGroups.proPKernel p (Field.absoluteGaloisGroup K))).ker :=
    AddMonoidHom.mem_ker.2 (Subsingleton.elim _ _)
  rw [← TauCeti.ContCohomology.explicitInfRes_exact] at hx
  exact AddMonoidHom.mem_range.1 hx

/-- **Layer 2, twisted inflation**, `H¹(G_K(p), I(χ)/pⁱ) → H¹(G_K, I(χ ∘ π)/pⁱ)`: Tau Ceti's
`explicitInfl1`, read through the coefficient adapter `zModTwistFixedPointsEquiv`. -/
noncomputable def explicitInfl1ZModTwist :
    TauCeti.ContCohomology.H1 (absoluteGaloisGroupProP p K) (TauCeti.ZModTwist χ i) →+
      TauCeti.ContCohomology.H1 (Field.absoluteGaloisGroup K)
        (TauCeti.ZModTwist (χ.comp (absoluteGaloisGroupProPMk p K)) i) :=
  (TauCeti.ContCohomology.explicitInfl1 (Field.absoluteGaloisGroup K)
      (TauCeti.ZModTwist (χ.comp (absoluteGaloisGroupProPMk p K)) i)
      (ProfiniteProPGroups.proPKernel p (Field.absoluteGaloisGroup K))).comp
    (TauCeti.ContCohomology.explicitCoeff1Equiv (absoluteGaloisGroupProP p K)
      (TauCeti.ZModTwist χ i) (zModTwistFixedPointsEquiv p K χ i).symm
      continuous_of_discreteTopology continuous_of_discreteTopology
      (fun q y => AddEquiv.symm_map_smul_of_map_smul _
        (zModTwistFixedPointsEquiv_smul p K χ i) q y)).toAddMonoidHom

/-- Twisted inflation is bijective: `explicitInfl1_zModTwist_bijective` after the adapter, a closed
proof. -/
theorem explicitInfl1ZModTwist_bijective :
    Function.Bijective (explicitInfl1ZModTwist p K χ i) :=
  (explicitInfl1_zModTwist_bijective p K χ i).comp (AddEquiv.bijective _)

/-- **Layer 2, twisted inflation commutes with the reductions** `I(χ)/pⁱ → I(χ)/pʲ`: inflation is
the pullback along a compatible pair (`TauCeti.ContCohomology.explicitInfl1_eq_explicitMap1`), and
pullbacks commute with coefficient maps (`TauCeti.ContCohomology.explicitMap1_comp`); on cocycles
the two sides are the same cocycle. This square is what carries the Kummer surjectivity on `G_K` to
the prescription property on `G_K(p)`. A closed proof. -/
theorem explicitInfl1_zModTwist_reduce {j : ℕ} (hij : j ≤ i) :
    (TauCeti.ContCohomology.explicitCoeff1 (Field.absoluteGaloisGroup K)
        (TauCeti.ZModTwist (χ.comp (absoluteGaloisGroupProPMk p K)) i)
        (TauCeti.ZModTwist.reduce (χ.comp (absoluteGaloisGroupProPMk p K)) hij)
        continuous_of_discreteTopology).comp (explicitInfl1ZModTwist p K χ i) =
      (explicitInfl1ZModTwist p K χ j).comp
        (TauCeti.ContCohomology.explicitCoeff1 (absoluteGaloisGroupProP p K)
          (TauCeti.ZModTwist χ i) (TauCeti.ZModTwist.reduce χ hij)
          continuous_of_discreteTopology) := by
  ext c
  simp only [AddMonoidHom.comp_apply, QuotientAddGroup.mk'_apply, explicitInfl1ZModTwist,
    AddEquiv.coe_toAddMonoidHom, TauCeti.ContCohomology.explicitCoeff1Equiv_mk,
    TauCeti.ContCohomology.explicitInfl1_mk, TauCeti.ContCohomology.explicitCoeff1_mk]
  congr 1

end TwistedInflation

/-! ## Layers 3 and 4: rank and the structural dichotomy -/

section LocalField

variable (p : ℕ) [Fact p.Prime] (K : Type u) [Field K]
  [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [CompactSpace (Field.absoluteGaloisGroup K)]
  [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]
  [TotallyDisconnectedSpace (absoluteGaloisGroupProP p K)]

theorem isTopologicallyFinitelyGenerated_absoluteGaloisGroupProP :
    ProfiniteProPGroups.IsTopologicallyFinitelyGenerated (absoluteGaloisGroupProP p K) :=
  sorry

theorem topologicalGeneratorRankNat_absoluteGaloisGroupProP_of_mu
    (_hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    ProfiniteProPGroups.topologicalGeneratorRankNat (absoluteGaloisGroupProP p K)
        (isTopologicallyFinitelyGenerated_absoluteGaloisGroupProP p K)
      = Module.finrank ℚ_[p] K + 2 :=
  sorry

theorem topologicalGeneratorRankNat_absoluteGaloisGroupProP_of_not_mu
    (_hmu : ¬ ∃ ζ : K, IsPrimitiveRoot ζ p) :
    ProfiniteProPGroups.topologicalGeneratorRankNat (absoluteGaloisGroupProP p K)
        (isTopologicallyFinitelyGenerated_absoluteGaloisGroupProP p K)
      = Module.finrank ℚ_[p] K + 1 :=
  sorry

theorem absoluteGaloisGroupProP_iso_freeProP_of_not_mu
    (_hmu : ¬ ∃ ζ : K, IsPrimitiveRoot ζ p)
    [TotallyDisconnectedSpace
      (ProfiniteProPGroups.freeProP p (Fin (Module.finrank ℚ_[p] K + 1)))] :
    Nonempty (absoluteGaloisGroupProP p K ≃ₜ*
      ProfiniteProPGroups.freeProP p (Fin (Module.finrank ℚ_[p] K + 1))) :=
  sorry

theorem isDemushkin_absoluteGaloisGroupProP_of_mu
    (_hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    ProfiniteProPGroups.IsDemushkin p (absoluteGaloisGroupProP p K) :=
  sorry

/-- The supplier's abstract Demushkin rank is the arithmetic rank. This is the bridge that
licenses substituting `N + 2` for `demushkinRank` inside the imported marked classification;
without it the marked theorems of Layer 6 would be a second normal form rather than an
application of the supplier's. -/
theorem demushkinRank_absoluteGaloisGroupProP
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    ProfiniteProPGroups.demushkinRank (isDemushkin_absoluteGaloisGroupProP_of_mu p K hmu)
      = Module.finrank ℚ_[p] K + 2 :=
  sorry

/-! ## Layer 5: `q` and the cyclotomic orientation -/

theorem demushkinQ_absoluteGaloisGroupProP
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    ProfiniteProPGroups.demushkinQ
        (isDemushkin_absoluteGaloisGroupProP_of_mu p K hmu)
      = localRootOfUnityOrder p K (finite_pPowerRootsOfUnity p K) :=
  sorry

/-- **Layer 5, the pro-`p` kernel lies in the kernel of the cyclotomic character** when `μ_p ⊆ K`.
The image of `χ_cyc` is then pro-`p`: `G_K` fixes a primitive `p`-th root of unity, so for odd `p`
the image lies in `1 + pℤ_p`, and `ℤ₂ˣ` is pro-`2` (Tau Ceti's `isProP_units_padicInt_two`). A
continuous homomorphism into a pro-`p` group kills `proPKernel`, because the preimage of an open
normal subgroup is open and normal with `p`-group quotient. -/
theorem proPKernel_le_ker_localCyclotomicCharacter (_hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    ProfiniteProPGroups.proPKernel p (Field.absoluteGaloisGroup K) ≤
      (localCyclotomicCharacter p K).ker :=
  sorry

/-- The full cyclotomic character descended to `G_K(p)` under the roots-of-unity hypothesis
that kills its prime-to-`p` mod-`p` component, as a **continuous** homomorphism: Tau Ceti's
`ContinuousMonoidHom.quotientLift` of `continuousLocalCyclotomicCharacter` through
`proPKernel_le_ker_localCyclotomicCharacter`. It has a body, so `cyclotomicOrientation_mk` is a
closed proof, and it is bundled because Tau Ceti's `HasPrescriptionProperty` and `ZModTwist` take a
continuous character. No unconditional full orientation is exported. -/
noncomputable def cyclotomicOrientation
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    absoluteGaloisGroupProP p K →ₜ* ℤ_[p]ˣ :=
  TauCeti.ContinuousMonoidHom.quotientLift _ (continuousLocalCyclotomicCharacter p K)
    (proPKernel_le_ker_localCyclotomicCharacter p K hmu)

theorem cyclotomicOrientation_mk (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p)
    (g : Field.absoluteGaloisGroup K) :
    cyclotomicOrientation p K hmu (QuotientGroup.mk g) = localCyclotomicCharacter p K g :=
  TauCeti.ContinuousMonoidHom.quotientLift_mk _ _ _ g

/-- The orientation pulls back to the cyclotomic character along `G_K → G_K(p)`, as continuous
homomorphisms. A closed proof. -/
theorem cyclotomicOrientation_comp_absoluteGaloisGroupProPMk
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    (cyclotomicOrientation p K hmu).comp (absoluteGaloisGroupProPMk p K) =
      continuousLocalCyclotomicCharacter p K :=
  TauCeti.ContinuousMonoidHom.quotientLift_comp_quotientMk _ _ _

theorem cyclotomicOrientation_continuous (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    Continuous (cyclotomicOrientation p K hmu) :=
  map_continuous _

/-- The orientation and the character have the same image, because the quotient map is surjective.
This is the theorem that transports `range_localCyclotomicCharacter` to `G_K(p)`, and it is
what the Layer 6 branch predicates are stated against. -/
theorem cyclotomicOrientation_range (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    (cyclotomicOrientation p K hmu).toMonoidHom.range = (localCyclotomicCharacter p K).range := by
  ext y
  constructor
  · rintro ⟨q, rfl⟩
    induction q using QuotientGroup.induction_on with
    | H g => exact ⟨g, (cyclotomicOrientation_mk p K hmu g).symm⟩
  · rintro ⟨g, rfl⟩
    exact ⟨QuotientGroup.mk g, cyclotomicOrientation_mk p K hmu g⟩

/-- **Layer 5, the prescription property of the orientation**, as Tau Ceti's
`HasPrescriptionProperty`: for `i ≥ 1` every class of `H¹(G_K(p), I(χ)/p)` lifts to
`H¹(G_K(p), I(χ)/pⁱ)`. A closed proof from Kummer theory on `G_K`
(`continuousLocalCyclotomicCharacter_hasPrescriptionProperty`), the pull-back
`cyclotomicOrientation_comp_absoluteGaloisGroupProPMk`, and twisted inflation at the levels `i` and
`1` (`explicitInfl1ZModTwist_bijective`, `explicitInfl1_zModTwist_reduce`). Local duality is not
used. It is the input of `ProfiniteProPGroups.demushkinCharacter_unique` below. -/
theorem cyclotomicOrientation_hasPrescriptionProperty
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    TauCeti.HasPrescriptionProperty (cyclotomicOrientation p K hmu) := by
  have hp : (p : K) ≠ 0 := by
    rw [← map_natCast (algebraMap ℚ_[p] K) p]
    exact (map_ne_zero (algebraMap ℚ_[p] K)).2 (Nat.cast_ne_zero.2 (Fact.out : p.Prime).ne_zero)
  have hK := continuousLocalCyclotomicCharacter_hasPrescriptionProperty p K hp
  rw [← cyclotomicOrientation_comp_absoluteGaloisGroupProPMk p K hmu,
    TauCeti.hasPrescriptionProperty_iff] at hK
  rw [TauCeti.hasPrescriptionProperty_iff]
  intro i hi y
  obtain ⟨z, hz⟩ := hK i hi (explicitInfl1ZModTwist p K (cyclotomicOrientation p K hmu) 1 y)
  obtain ⟨w, rfl⟩ := (explicitInfl1ZModTwist_bijective p K (cyclotomicOrientation p K hmu) i).2 z
  refine ⟨w, (explicitInfl1ZModTwist_bijective p K (cyclotomicOrientation p K hmu) 1).1 ?_⟩
  rw [← hz]
  exact (DFunLike.congr_fun
    (explicitInfl1_zModTwist_reduce p K (cyclotomicOrientation p K hmu) i hi) w).symm

/-- The orientation extracted from the dualizing module is the descended cyclotomic character, as
continuous homomorphisms. This equation and `localCyclotomicCharacter_artinMap_unit` are the two
halves of the comparison: the first identifies the abstract orientation with `χ_cyc`, the second
computes `χ_cyc` from local reciprocity with the arithmetic-Frobenius normalization and the inverse.
A closed proof: ProfiniteProPGroups' prescription predicate is Tau Ceti's
`TauCeti.HasPrescriptionProperty`, so `ProfiniteProPGroups.demushkinCharacter_unique` applies to the
orientation and `cyclotomicOrientation_hasPrescriptionProperty` directly. -/
theorem demushkinCharacter_absoluteGaloisGroupProP
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    ProfiniteProPGroups.demushkinCharacter (isDemushkin_absoluteGaloisGroupProP_of_mu p K hmu)
      = cyclotomicOrientation p K hmu :=
  (ProfiniteProPGroups.demushkinCharacter_unique
    (isDemushkin_absoluteGaloisGroupProP_of_mu p K hmu) (cyclotomicOrientation p K hmu)
    (cyclotomicOrientation_hasPrescriptionProperty p K hmu)).symm

end LocalField

/-! ## Layer 6: marked local presentations

The abstract classification is **not** restated here. `ProfiniteProPGroups` owns
`isDemushkin_marked_of_q_ne_two`, `isDemushkin_marked_of_q_two_odd` and
`isDemushkin_marked_of_q_two_even` together with the three relator words; the theorems below are
those theorems after the three arithmetic computations `demushkinRank = N + 2`,
`demushkinQ = q(K)` and `demushkinCharacter = χ_cyc` have been substituted. No new relator, no
second normal form and no local specialization of Labute's theorem appears. -/

/-! ### The branch predicates

The cases are **predicates on the arithmetic of `K`**, not rows of a prose table: Lean can prove
them pairwise disjoint and jointly exhaustive, and every marked theorem below carries exactly one
of them as its hypothesis. The dyadic split is by the parity of `N` and by whether `-1` is a value
of the orientation, both statements about objects already computed, rather than an unrecorded
choice between two families that share `q` and the rank. -/

/-- The free case: `K` has no `p`-th root of unity. -/
def IsFreeCase (p : ℕ) (K : Type u) [Field K] : Prop :=
  ¬ ∃ ζ : K, IsPrimitiveRoot ζ p

/-- The generic Demushkin case `q ≠ 2`. At `p = 2` this is exactly the presence of a primitive
fourth root of unity, by `localRootOfUnityOrder_ne_two_iff`. -/
def IsQNeTwoCase (p : ℕ) [Fact p.Prime] (K : Type u) [Field K]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] : Prop :=
  (∃ ζ : K, IsPrimitiveRoot ζ p) ∧
    localRootOfUnityOrder p K (finite_pPowerRootsOfUnity p K) ≠ 2

/-- The dyadic case `q = 2` with `N` odd. -/
def IsDyadicOddCase (K : Type u) [Field K] [Algebra ℚ_[2] K] [Module.Finite ℚ_[2] K] : Prop :=
  localRootOfUnityOrder 2 K (finite_pPowerRootsOfUnity 2 K) = 2 ∧ Odd (Module.finrank ℚ_[2] K)

/-- The dyadic case `q = 2`, `N` even, `-1` in the orientation image: the `{±1} × U^(f)`
family. -/
def IsDyadicEvenPlusMinusCase (K : Type u) [Field K] [Algebra ℚ_[2] K] [Module.Finite ℚ_[2] K] :
    Prop :=
  localRootOfUnityOrder 2 K (finite_pPowerRootsOfUnity 2 K) = 2 ∧
    Even (Module.finrank ℚ_[2] K) ∧ (-1 : ℤ_[2]ˣ) ∈ (localCyclotomicCharacter 2 K).range

/-- The dyadic case `q = 2`, `N` even, `-1` **not** in the orientation image: Labute's `U^[f]`
family. ⚠ This branch is invisible to `q` and to the rank; it is exactly the case the roadmap's
`ℚ₂(√−2)` acceptance example detects. `U^[f] = closure⟨-1 + 2^f⟩` is torsion-free, which is why
`-1 ∉ Im χ` separates it from `{±1} × U^(f)`. -/
def IsDyadicEvenPrincipalCase (K : Type u) [Field K] [Algebra ℚ_[2] K]
    [Module.Finite ℚ_[2] K] : Prop :=
  localRootOfUnityOrder 2 K (finite_pPowerRootsOfUnity 2 K) = 2 ∧
    Even (Module.finrank ℚ_[2] K) ∧ (-1 : ℤ_[2]ˣ) ∉ (localCyclotomicCharacter 2 K).range

/-- **Exactly one dyadic branch applies.** The four predicates are pairwise disjoint and jointly
exhaustive at `p = 2`; `IsFreeCase 2 K` never occurs, because `-1` is always a primitive square
root of `1`, so the dyadic classification is genuinely a three-way split inside `q = 2` together
with `q ≠ 2`. -/
theorem dyadic_markedCase_exists_unique (K : Type u) [Field K]
    [Algebra ℚ_[2] K] [Module.Finite ℚ_[2] K] :
    ¬ IsFreeCase 2 K ∧
      ((IsQNeTwoCase 2 K ∧ ¬ IsDyadicOddCase K ∧ ¬ IsDyadicEvenPlusMinusCase K ∧
          ¬ IsDyadicEvenPrincipalCase K) ∨
        (¬ IsQNeTwoCase 2 K ∧ IsDyadicOddCase K ∧ ¬ IsDyadicEvenPlusMinusCase K ∧
          ¬ IsDyadicEvenPrincipalCase K) ∨
        (¬ IsQNeTwoCase 2 K ∧ ¬ IsDyadicOddCase K ∧ IsDyadicEvenPlusMinusCase K ∧
          ¬ IsDyadicEvenPrincipalCase K) ∨
        (¬ IsQNeTwoCase 2 K ∧ ¬ IsDyadicOddCase K ∧ ¬ IsDyadicEvenPlusMinusCase K ∧
          IsDyadicEvenPrincipalCase K)) :=
  sorry

/-- At an odd prime only two branches survive: the free case and `q ≠ 2`. The dyadic predicates
cannot be stated at odd `p` at all, and `q = 2` is impossible because `q` is a power of `p`. -/
theorem odd_markedCase_exists_unique (p : ℕ) [Fact p.Prime] (_hp : p ≠ 2) (K : Type u) [Field K]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    (IsFreeCase p K ∧ ¬ IsQNeTwoCase p K) ∨ (¬ IsFreeCase p K ∧ IsQNeTwoCase p K) :=
  sorry

section MarkedPresentations

variable (p : ℕ) [Fact p.Prime] (K : Type) [Field K]
  [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [CompactSpace (Field.absoluteGaloisGroup K)]
  [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]
  [TotallyDisconnectedSpace (absoluteGaloisGroupProP p K)]

/-- The arithmetic `q ≠ 2` marked normal form. -/
theorem absoluteGaloisGroupProP_marked_of_q_ne_two
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p)
    (_hq : IsQNeTwoCase p K)
    (_hn : 2 ≤ Module.finrank ℚ_[p] K + 2)
    [TotallyDisconnectedSpace
      (ProfiniteProPGroups.presentedProP p (Fin (Module.finrank ℚ_[p] K + 2))
        {ProfiniteProPGroups.demushkinWordNeTwo
          (localRootOfUnityOrder p K (finite_pPowerRootsOfUnity p K))
          (Module.finrank ℚ_[p] K + 2)
          (ProfiniteProPGroups.freeProPGen p (Module.finrank ℚ_[p] K + 2))})] :
    ∃ e : absoluteGaloisGroupProP p K ≃ₜ*
        ProfiniteProPGroups.presentedProP p (Fin (Module.finrank ℚ_[p] K + 2))
          {ProfiniteProPGroups.demushkinWordNeTwo
            (localRootOfUnityOrder p K (finite_pPowerRootsOfUnity p K))
            (Module.finrank ℚ_[p] K + 2)
            (ProfiniteProPGroups.freeProPGen p (Module.finrank ℚ_[p] K + 2))},
      ((cyclotomicOrientation p K hmu
          (e.symm (ProfiniteProPGroups.presentedProPGen p
            (Module.finrank ℚ_[p] K + 2) _ 1)) : ℤ_[p])
          * (1 - (localRootOfUnityOrder p K (finite_pPowerRootsOfUnity p K) : ℤ_[p])) = 1) ∧
        ∀ i : ℕ, i ≠ 1 → i < Module.finrank ℚ_[p] K + 2 →
          cyclotomicOrientation p K hmu
            (e.symm (ProfiniteProPGroups.presentedProPGen p
              (Module.finrank ℚ_[p] K + 2) _ i)) = 1 :=
  sorry

end MarkedPresentations

section DyadicMarkedPresentations

variable (K : Type) [Field K]
  [Algebra ℚ_[2] K] [Module.Finite ℚ_[2] K]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [CompactSpace (Field.absoluteGaloisGroup K)]
  [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]
  [TotallyDisconnectedSpace (absoluteGaloisGroupProP 2 K)]

/-- **The orientation image in the odd-degree dyadic case is everything.** This is the arithmetic
input that fixes the parameter `f = 2` in the marked theorem below. The image of `G_K` is a
subgroup of the image of `G_{ℚ₂}`, which is all of `ℤ₂ˣ` (`range_localCyclotomicCharacter_ratPadic`
at `p = 2`), of index dividing the odd degree `N` (`range_localCyclotomicCharacter_le_ratPadic`).
It is compact, hence closed, and of finite index, hence open, in the pro-`2` group `ℤ₂ˣ` (Tau
Ceti's `isProP_units_padicInt_two`), so that index is a power of `2`; dividing an odd number, it is
`1`. The equality `χ(G_{ℚ₂}) = ℤ₂ˣ` is an input of this theorem, not a consequence of `q(K) = 2`,
and nothing is read off `q`. -/
theorem range_localCyclotomicCharacter_of_degree_odd (_hcase : IsDyadicOddCase K) :
    (localCyclotomicCharacter 2 K).range = ⊤ :=
  sorry

/-- The arithmetic odd-degree dyadic marked normal form, with `f = 2`. -/
theorem absoluteGaloisGroupProP_two_marked_of_degree_odd
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ 2) (_hcase : IsDyadicOddCase K)
    [TotallyDisconnectedSpace
      (ProfiniteProPGroups.presentedProP 2 (Fin (Module.finrank ℚ_[2] K + 2))
        {ProfiniteProPGroups.demushkinWordTwoOdd 2 (Module.finrank ℚ_[2] K + 2)
          (ProfiniteProPGroups.freeProPGen 2 (Module.finrank ℚ_[2] K + 2))})] :
    ∃ e : absoluteGaloisGroupProP 2 K ≃ₜ*
        ProfiniteProPGroups.presentedProP 2 (Fin (Module.finrank ℚ_[2] K + 2))
          {ProfiniteProPGroups.demushkinWordTwoOdd 2 (Module.finrank ℚ_[2] K + 2)
            (ProfiniteProPGroups.freeProPGen 2 (Module.finrank ℚ_[2] K + 2))},
      cyclotomicOrientation 2 K hmu
          (e.symm (ProfiniteProPGroups.presentedProPGen 2
            (Module.finrank ℚ_[2] K + 2) _ 0)) = -1 ∧
        ((cyclotomicOrientation 2 K hmu
            (e.symm (ProfiniteProPGroups.presentedProPGen 2
              (Module.finrank ℚ_[2] K + 2) _ 2)) : ℤ_[2]) * (1 - 2 ^ 2) = 1) ∧
        ∀ i : ℕ, i ≠ 0 → i ≠ 2 → i < Module.finrank ℚ_[2] K + 2 →
          cyclotomicOrientation 2 K hmu
            (e.symm (ProfiniteProPGroups.presentedProPGen 2
              (Module.finrank ℚ_[2] K + 2) _ i)) = 1 :=
  sorry

/-- **The even-degree branch `{±1} × U^(f)`.** The exponent `f` is determined by the orientation
image, which this theorem records; the supplier's even relator is then
`demushkinWordTwoEven a f n` with `v₂(a) ≥ f`. -/
theorem range_localCyclotomicCharacter_of_degree_even_plusMinus
    (_hcase : IsDyadicEvenPlusMinusCase K) :
    ∃ f : ℕ, 2 ≤ f ∧
      (localCyclotomicCharacter 2 K).range = ProfiniteProPGroups.unitsPlusMinus f :=
  sorry

/-- **The even-degree branch `U^[f]`.** ⚠ Selecting this branch from `q` alone is impossible:
`q = 2` and the rank agree with the previous branch. The distinguishing statement is that `-1` is
not a value of the orientation. -/
theorem range_localCyclotomicCharacter_of_degree_even_principal
    (_hcase : IsDyadicEvenPrincipalCase K) :
    ∃ (f : ℕ) (u : ℤ_[2]ˣ), 2 ≤ f ∧ (u : ℤ_[2]) = -1 + 2 ^ f ∧
      (localCyclotomicCharacter 2 K).range = ProfiniteProPGroups.procyclicClosure u :=
  sorry

/-- **The even-degree marked normal form, `{±1} × U^(f)` branch.** The parameter `f` is pinned by
the orientation image: it is the `f` of `range_localCyclotomicCharacter_of_degree_even_plusMinus`,
taken here as the hypothesis `hrange` rather than re-chosen, and the relator is the supplier's even
word at `a = 0`, that is `x₁²(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯`. The conclusion records the supplier's
generator values under the isomorphism — `χ(x₂) = -1`, which is the supplier's equation
`χ(x₂)(1 + a) = -1` at `a = 0`; `χ(x₄)(1 - 2^f) = 1`; and `χ(x_i) = 1` elsewhere — against the
cyclotomic orientation, exactly as `absoluteGaloisGroupProP_two_marked_of_degree_odd` does.

⚠ An unmarked `Nonempty (_ ≃ₜ* _)` does not discharge this milestone: the two even branches have
relators of the same shape and the same `q` and rank, and only the values of `χ_cyc` on the marked
generators, together with the image equation, tie the presentation to the arithmetic of `K`. -/
theorem absoluteGaloisGroupProP_two_marked_of_degree_even_plusMinus
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ 2) (_hcase : IsDyadicEvenPlusMinusCase K)
    (f : ℕ) (_hf : 2 ≤ f)
    (_hrange : (localCyclotomicCharacter 2 K).range = ProfiniteProPGroups.unitsPlusMinus f)
    [TotallyDisconnectedSpace
      (ProfiniteProPGroups.presentedProP 2 (Fin (Module.finrank ℚ_[2] K + 2))
        {ProfiniteProPGroups.demushkinWordTwoEven 0 f (Module.finrank ℚ_[2] K + 2)
          (ProfiniteProPGroups.freeProPGen 2 (Module.finrank ℚ_[2] K + 2))})] :
    ∃ e : absoluteGaloisGroupProP 2 K ≃ₜ*
        ProfiniteProPGroups.presentedProP 2 (Fin (Module.finrank ℚ_[2] K + 2))
          {ProfiniteProPGroups.demushkinWordTwoEven 0 f (Module.finrank ℚ_[2] K + 2)
            (ProfiniteProPGroups.freeProPGen 2 (Module.finrank ℚ_[2] K + 2))},
      cyclotomicOrientation 2 K hmu
          (e.symm (ProfiniteProPGroups.presentedProPGen 2
            (Module.finrank ℚ_[2] K + 2) _ 1)) = -1 ∧
        ((cyclotomicOrientation 2 K hmu
            (e.symm (ProfiniteProPGroups.presentedProPGen 2
              (Module.finrank ℚ_[2] K + 2) _ 3)) : ℤ_[2]) * (1 - 2 ^ f) = 1) ∧
        ∀ i : ℕ, i ≠ 1 → i ≠ 3 → i < Module.finrank ℚ_[2] K + 2 →
          cyclotomicOrientation 2 K hmu
            (e.symm (ProfiniteProPGroups.presentedProPGen 2
              (Module.finrank ℚ_[2] K + 2) _ i)) = 1 :=
  sorry

/-- **The even-degree marked normal form, `U^[k]` branch.** The image is `procyclicClosure u` with
`(u : ℤ₂) = -1 + 2^k` and `k ≥ 2`, by `range_localCyclotomicCharacter_of_degree_even_principal`;
`k` and `u` are taken as hypotheses through that equation. The supplier's parameters are then
`a = 2^k` and any `f > k`, and the conclusion records the supplier's generator values
`χ(x₂)(1 + 2^k) = -1`, `χ(x₄)(1 - 2^f) = 1` and `χ(x_i) = 1` elsewhere.

Why these parameters. The equation `χ(x₂)(1 + a) = -1` is solvable in `U^[k]` exactly when
`v₂(a) = k`, because `-(1 + a)⁻¹ ≡ -1 + 2^k (mod 2^{k+1})` says `a ≡ 2^k (mod 2^{k+1})`; so `a` is
pinned up to the choice of representative, and `2^k` is the representative. ⚠ In this branch `f`
is **not** an invariant: `(1 - 2^f)⁻¹ ∈ U^(f) ⊆ U^[k]` for every `f > k`, and the presented groups
`x₁^{2+2^k}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯` for the different `f > k` are pairwise isomorphic by Labute's
classification — same rank, same `q = 2`, same image `U^[k]` — all of them isomorphic to Labute's
normal form `x₁^{2+2^k}(x₁,x₂)(x₃,x₄)⋯`, which is the value `f = ∞` that the supplier's word cannot
spell with a natural number. The theorem is therefore stated for every `f > k`; the `ℚ₂(√-2)`
acceptance instance of Layer 8 takes `k = 2`, `f = 3`. -/
theorem absoluteGaloisGroupProP_two_marked_of_degree_even_principal
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ 2) (_hcase : IsDyadicEvenPrincipalCase K)
    (k : ℕ) (_hk : 2 ≤ k) (u : ℤ_[2]ˣ) (_hu : (u : ℤ_[2]) = -1 + 2 ^ k)
    (_hrange : (localCyclotomicCharacter 2 K).range = ProfiniteProPGroups.procyclicClosure u)
    (f : ℕ) (_hkf : k < f)
    [TotallyDisconnectedSpace
      (ProfiniteProPGroups.presentedProP 2 (Fin (Module.finrank ℚ_[2] K + 2))
        {ProfiniteProPGroups.demushkinWordTwoEven (2 ^ k) f (Module.finrank ℚ_[2] K + 2)
          (ProfiniteProPGroups.freeProPGen 2 (Module.finrank ℚ_[2] K + 2))})] :
    ∃ e : absoluteGaloisGroupProP 2 K ≃ₜ*
        ProfiniteProPGroups.presentedProP 2 (Fin (Module.finrank ℚ_[2] K + 2))
          {ProfiniteProPGroups.demushkinWordTwoEven (2 ^ k) f (Module.finrank ℚ_[2] K + 2)
            (ProfiniteProPGroups.freeProPGen 2 (Module.finrank ℚ_[2] K + 2))},
      ((cyclotomicOrientation 2 K hmu
          (e.symm (ProfiniteProPGroups.presentedProPGen 2
            (Module.finrank ℚ_[2] K + 2) _ 1)) : ℤ_[2]) * (1 + ((2 ^ k : ℕ) : ℤ_[2])) = -1) ∧
        ((cyclotomicOrientation 2 K hmu
            (e.symm (ProfiniteProPGroups.presentedProPGen 2
              (Module.finrank ℚ_[2] K + 2) _ 3)) : ℤ_[2]) * (1 - 2 ^ f) = 1) ∧
        ∀ i : ℕ, i ≠ 1 → i ≠ 3 → i < Module.finrank ℚ_[2] K + 2 →
          cyclotomicOrientation 2 K hmu
            (e.symm (ProfiniteProPGroups.presentedProPGen 2
              (Module.finrank ℚ_[2] K + 2) _ i)) = 1 :=
  sorry

/-- The unmarked even-degree statement, a corollary of the two marked theorems and of the two
image computations: some supplier even word with `f ≥ 2` and `4 ∣ a` presents `G_K(2)`. The
`TotallyDisconnectedSpace` hypothesis is bound inside the statement because the relator, and hence
the presented group, depends on the parameters produced by the existential. ⚠ This is a
consequence and not the Layer 6 contract; it carries no orientation data. -/
theorem absoluteGaloisGroupProP_two_of_degree_even
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ 2)
    (hcase : IsDyadicEvenPlusMinusCase K ∨ IsDyadicEvenPrincipalCase K) :
    ∃ a f : ℕ, 2 ≤ f ∧ 4 ∣ a ∧
      ∀ _ : TotallyDisconnectedSpace
        (ProfiniteProPGroups.presentedProP 2 (Fin (Module.finrank ℚ_[2] K + 2))
          {ProfiniteProPGroups.demushkinWordTwoEven a f (Module.finrank ℚ_[2] K + 2)
            (ProfiniteProPGroups.freeProPGen 2 (Module.finrank ℚ_[2] K + 2))}),
        Nonempty (absoluteGaloisGroupProP 2 K ≃ₜ*
          ProfiniteProPGroups.presentedProP 2 (Fin (Module.finrank ℚ_[2] K + 2))
            {ProfiniteProPGroups.demushkinWordTwoEven a f (Module.finrank ℚ_[2] K + 2)
              (ProfiniteProPGroups.freeProPGen 2 (Module.finrank ℚ_[2] K + 2))}) := by
  rcases hcase with h | h
  · obtain ⟨f, hf, hrange⟩ := range_localCyclotomicCharacter_of_degree_even_plusMinus K h
    refine ⟨0, f, hf, dvd_zero 4, fun _ => ?_⟩
    obtain ⟨e, -⟩ :=
      absoluteGaloisGroupProP_two_marked_of_degree_even_plusMinus K hmu h f hf hrange
    exact ⟨e⟩
  · obtain ⟨k, u, hk, hu, hrange⟩ := range_localCyclotomicCharacter_of_degree_even_principal K h
    refine ⟨2 ^ k, k + 1, by omega, by simpa using Nat.pow_dvd_pow 2 hk, fun _ => ?_⟩
    obtain ⟨e, -⟩ := absoluteGaloisGroupProP_two_marked_of_degree_even_principal K hmu h k hk u
      hu hrange (k + 1) (Nat.lt_succ_self k)
    exact ⟨e⟩

end DyadicMarkedPresentations

/-! ## Layer 7: the completed multiplicative module and the rank of the full `G_K`

The rank theorem for the full absolute Galois group does **not** follow from a rational
representation-theoretic identity. `A(L) ⊗ ℚ_p ≅ ℚ_p[G]^N ⊕ ℚ_p` determines no minimal number of
*integral* topological generators, and the chain below is the integral one, in the order of the
proof of NSW (7.4.1): the completed module as an honest `ℤ_p[Gal(L/K)]`-lattice, its torsion, the
Tate module of a tame layer and its integral decomposition against the tame-frame module, the
relation-module surjection that the decomposition yields on a tame layer, the finite quotients
generated by `N + 2` elements, the compactness argument over tuples, and the relative Frattini
reduction along wild inertia. Each step is a named declaration. The relation-module sequence on
an *arbitrary* finite Galois layer, NSW (7.4.2)(i), is stated last, after the rank theorem it is
derived from.

⚠ Everything in this section lives over a **finite Galois layer** `L/K`, and from the rational
decomposition onwards that is a **Lean hypothesis** — `section FiniteGaloisLayer` below binds
`[IsScalarTower ℚ_[p] K L] [IsGalois K L] [FiniteDimensional K L]` — not a reading convention;
see the rejection test `not_nonempty_tensor_ratPadic_of_card_lt` for what goes wrong without it.
The group algebra is Mathlib's `MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)`; the supplier's
`completedGroupAlgebra` is the profinite object and is deliberately not used here, because the
cancellation theorems below are theorems about a finite group algebra over a complete discrete
valuation ring. Rationalization is
`M ⊗[ℤ_[p]] ℚ_[p]` with Mathlib's left-factor `ℤ_p[G]`-structure; a `ℤ_p[G]`-linear isomorphism
between `ℚ_p`-vector spaces is automatically `ℚ_p[G]`-linear, so no second module structure on
the rationalization is installed. -/

section GroupAlgebra

variable (p : ℕ) [Fact p.Prime] (G : Type u) [Group G]

/-- The augmentation ideal `I_G` of `ℤ_p[G]`: the kernel of Tau Ceti's augmentation
`TauCeti.MonoidAlgebra.augmentation`, the ring map `ℤ_p[G] → ℤ_p` sending every `g` to `1`. Its
generators `g - 1` are `augmentationIdeal_eq_span`. Tau Ceti's `Rep.augmentationIdeal` is the same
kernel as an object of the representation category; this roadmap uses it as a left ideal of the
group algebra, to form `ℤ_p[G] ⧸ I_G` and the submodule the Tate module maps onto. -/
noncomputable abbrev augmentationIdeal : Ideal (MonoidAlgebra ℤ_[p] G) :=
  RingHom.ker (TauCeti.MonoidAlgebra.augmentation ℤ_[p] G)

/-- The augmentation ideal is generated by the elements `g - 1`: Tau Ceti's
`TauCeti.MonoidAlgebra.ker_augmentation_eq_span`. A closed proof. -/
theorem augmentationIdeal_eq_span :
    augmentationIdeal p G =
      Ideal.span (Set.range fun g : G => MonoidAlgebra.single g (1 : ℤ_[p]) - 1) :=
  TauCeti.MonoidAlgebra.ker_augmentation_eq_span ℤ_[p] G

/-- **The `p`-relation module of a generating family** (NSW (5.6.6), Lyndon's sequence): the
kernel of `ℤ_p[G]^n → ℤ_p[G]`, `e_i ↦ g_i - 1`. For the presentation `1 → R → F_n → G → 1` in
which the free generators go to the `g_i`, this kernel is `R^ab(p)` with its conjugation action; the
kernel is taken as the definition, and `relationModule_linearEquiv_abelianizationProP` below is the
theorem identifying it with the group-theoretic `R^ab(p)`. -/
noncomputable def relationModule {n : ℕ} (g : Fin n → G) :
    Submodule (MonoidAlgebra ℤ_[p] G) (Fin n → MonoidAlgebra ℤ_[p] G) :=
  LinearMap.ker (Fintype.linearCombination (MonoidAlgebra ℤ_[p] G)
    fun i => MonoidAlgebra.single (g i) (1 : ℤ_[p]) - 1)

/-- The other half of Lyndon's sequence: when the `g_i` generate `G`, the map `e_i ↦ g_i - 1`
lands onto the augmentation ideal, so `0 → R^ab(p) → ℤ_p[G]^n → I_G → 0` is exact. -/
theorem range_linearCombination_eq_augmentationIdeal {n : ℕ} (g : Fin n → G)
    (_hg : Subgroup.closure (Set.range g) = ⊤) :
    LinearMap.range (Fintype.linearCombination (MonoidAlgebra ℤ_[p] G)
        fun i => MonoidAlgebra.single (g i) (1 : ℤ_[p]) - 1)
      = augmentationIdeal p G :=
  sorry

/-- **The tame-frame module** `M₀ = ℤ_p[G]² / ℤ_p[G]·(σ - a, τ - b)` of the proof of NSW (7.4.1),
for two elements `σ, τ` of `G` and two natural numbers `a, b`. In the application `σ, τ` are the
images of the tame frame in `Gal(L/K)` and `a, b` are exponents through which they act on the
`p`-power roots of unity of `L`, subject to the sharpness condition of
`exists_tameFrame_exponents`. It is the module against which the Tate module of the layer is
compared; it is a quotient of `ℤ_p[G]²`, which is where the `2` of `N + 2` comes from. -/
abbrev tameFrameModule (σ τ : G) (a b : ℕ) : Type u :=
  (Fin 2 → MonoidAlgebra ℤ_[p] G) ⧸ Submodule.span (MonoidAlgebra ℤ_[p] G)
    {![MonoidAlgebra.single σ (1 : ℤ_[p]) - a, MonoidAlgebra.single τ (1 : ℤ_[p]) - b]}

/-- The `p`-power torsion of a `ℤ_p[G]`-module, as a `ℤ_p[G]`-submodule: the elements killed by
some power of `p`. Mathlib's `Submodule.torsion` and `Submodule.torsionBy` take a commutative base
ring, which `ℤ_p[G]` is not, so the submodule is spelled out; membership is
`∃ n, (p ^ n : ℤ_p) • x = 0`, definitionally. This is the torsion the stable-isomorphism
criterion of Step 3 compares. -/
noncomputable def pPowerTorsion (M : Type u) [AddCommGroup M] [Module ℤ_[p] M]
    [Module (MonoidAlgebra ℤ_[p] G) M] [IsScalarTower ℤ_[p] (MonoidAlgebra ℤ_[p] G) M] :
    Submodule (MonoidAlgebra ℤ_[p] G) M where
  carrier := {x | ∃ n : ℕ, ((p : ℤ_[p]) ^ n) • x = 0}
  zero_mem' := ⟨0, smul_zero _⟩
  add_mem' := by
    rintro x y ⟨m, hx⟩ ⟨n, hy⟩
    refine ⟨m + n, ?_⟩
    have hx' : ((p : ℤ_[p]) ^ (m + n)) • x = 0 := by
      rw [pow_add, mul_comm, mul_smul, hx, smul_zero]
    have hy' : ((p : ℤ_[p]) ^ (m + n)) • y = 0 := by
      rw [pow_add, mul_smul, hy, smul_zero]
    rw [smul_add, hx', hy', add_zero]
  smul_mem' := by
    rintro r x ⟨n, hx⟩
    exact ⟨n, by rw [smul_comm, hx, smul_zero]⟩

section Lyndon

variable [TopologicalSpace G] [DiscreteTopology G] [Finite G]

/-- The presentation `F_n ↠ G` of a finite group on a family `g`: the continuous homomorphism from
Tau Ceti's free profinite group on `n` generators sending the generators to `g`
(`TauCeti.freeProfiniteGroup.lift`). Its kernel `R` is the relation subgroup, and `R^ab(p)` with the
conjugation action of `F_n ⧸ R` is `ProfiniteCohomology.abelianizationProP` of it. -/
noncomputable abbrev presentationHom {n : ℕ} (g : Fin n → G) :
    TauCeti.freeProfiniteGroup (ULift.{u} (Fin n)) →ₜ* G :=
  TauCeti.freeProfiniteGroup.lift fun i => g i.down

/-- **Lyndon's theorem for the relation module** (NSW (5.6.6), from (5.6.5) for
`1 → R → F_n → G → 1`). For a generating family `g` of the finite group `G`, the `p`-relation module
of the presentation, `R^ab(p)` for `R` the kernel of `presentationHom`, with the conjugation action
of `F_n ⧸ R`, is `relationModule p G g`: there is an additive isomorphism, equivariant for the two
actions of `G`. The isomorphism sends the class of `r ∈ R` to its vector of Fox derivatives, read in
`ℤ_p[G]`. Additive and equivariant is `ℤ_p[G]`-linear here: an additive map between finitely
generated `ℤ_p`-modules carries `p^k M` into `p^k N`, so it is continuous for the `p`-adic
topologies and hence `ℤ_p`-linear. This is what lets a module map out of `relationModule` act on
the kernel of the extension `F_n ⧸ ⁅R, R⁆R(p) → G`, in Step 5. -/
theorem relationModule_linearEquiv_abelianizationProP {n : ℕ} (g : Fin n → G)
    (_hg : Subgroup.closure (Set.range g) = ⊤) :
    ∃ e : Additive (ProfiniteCohomology.abelianizationProP p
          (TauCeti.freeProfiniteGroup (ULift.{u} (Fin n)))
          (presentationHom G g).toMonoidHom.ker) ≃+ ↥(relationModule p G g),
      ∀ (f : TauCeti.freeProfiniteGroup (ULift.{u} (Fin n))) x,
        e ((QuotientGroup.mk f : TauCeti.freeProfiniteGroup (ULift.{u} (Fin n)) ⧸
              (presentationHom G g).toMonoidHom.ker) • x) =
          MonoidAlgebra.single (presentationHom G g f) (1 : ℤ_[p]) • e x :=
  sorry

end Lyndon

end GroupAlgebra

/-! ### Step 3: integral cancellation over `ℤ_p[G]`

These theorems are the only place where an integral conclusion is extracted from rational or
finite-level data, and they are the reason a rational decomposition is not enough. They are
statements about the group algebra of a finite group over the complete discrete valuation ring
`ℤ_p` — Krull–Schmidt–Azumaya cancellation, the detection of projectives by their rationalization
and by their reduction, and the passage from a stable isomorphism to an isomorphism — and this
roadmap owns them: no supplier in the dependency list has integral representation theory over a
complete discrete valuation ring. The chain of Step 3 consumes
`exists_projective_prod_linearEquiv_of_torsion` and `linearEquiv_prod_free_of_stable`; the latter
is proved from `linearEquiv_of_prod_linearEquiv` and `linearEquiv_of_projective_of_tensorRat`.
`linearEquiv_of_projective_of_reduction` is the mod-`p` companion of the rational detection and
is part of the same library. -/

section IntegralCancellation

variable (p : ℕ) [Fact p.Prime] (G : Type u) [Group G] [Finite G]

/-- **Krull–Schmidt cancellation over `ℤ_p[G]`** (NSW (5.6.10)(i)). Finitely generated modules
over the group algebra of a finite group over a complete discrete valuation ring cancel. The
exchange argument is Tau Ceti's Krull–Schmidt theorem in Azumaya's form,
`TauCeti.exists_equiv_linearEquiv_of_isLocalRing_end`, which needs local endomorphism rings on one
side only. What is particular to `ℤ_p[G]` is that a finitely generated indecomposable
`ℤ_p[G]`-module has a local endomorphism ring: that ring is a finite `ℤ_p`-algebra with no
nontrivial idempotents, and over the complete local ring `ℤ_p` such an algebra is local. ⚠ The
same statement over `ℤ[G]` fails in general — Swan's stably free, non-free modules over integral
group rings of generalized quaternion groups — so completeness of `ℤ_p` is doing real work and
the base may not be weakened to a Dedekind domain. -/
theorem linearEquiv_of_prod_linearEquiv
    (M N P : Type u) [AddCommGroup M] [Module (MonoidAlgebra ℤ_[p] G) M]
    [Module.Finite (MonoidAlgebra ℤ_[p] G) M]
    [AddCommGroup N] [Module (MonoidAlgebra ℤ_[p] G) N]
    [Module.Finite (MonoidAlgebra ℤ_[p] G) N]
    [AddCommGroup P] [Module (MonoidAlgebra ℤ_[p] G) P]
    [Module.Finite (MonoidAlgebra ℤ_[p] G) P]
    (_h : Nonempty ((M × P) ≃ₗ[MonoidAlgebra ℤ_[p] G] (N × P))) :
    Nonempty (M ≃ₗ[MonoidAlgebra ℤ_[p] G] N) :=
  sorry

/-- **Projectives are detected rationally** (NSW (5.6.10)(ii), Swan). Two finitely generated
projective `ℤ_p[G]`-modules with isomorphic rationalizations are isomorphic. This is the theorem
that upgrades a rational identity to an integral one; it is applied, inside
`linearEquiv_prod_free_of_stable`, to the projective modules that a stable isomorphism leaves
over. -/
theorem linearEquiv_of_projective_of_tensorRat
    (M N : Type u) [AddCommGroup M] [Module ℤ_[p] M] [Module (MonoidAlgebra ℤ_[p] G) M]
    [IsScalarTower ℤ_[p] (MonoidAlgebra ℤ_[p] G) M]
    [Module.Finite (MonoidAlgebra ℤ_[p] G) M] [Module.Projective (MonoidAlgebra ℤ_[p] G) M]
    [AddCommGroup N] [Module ℤ_[p] N] [Module (MonoidAlgebra ℤ_[p] G) N]
    [IsScalarTower ℤ_[p] (MonoidAlgebra ℤ_[p] G) N]
    [Module.Finite (MonoidAlgebra ℤ_[p] G) N] [Module.Projective (MonoidAlgebra ℤ_[p] G) N]
    (_h : Nonempty ((M ⊗[ℤ_[p]] ℚ_[p]) ≃ₗ[MonoidAlgebra ℤ_[p] G] (N ⊗[ℤ_[p]] ℚ_[p]))) :
    Nonempty (M ≃ₗ[MonoidAlgebra ℤ_[p] G] N) :=
  sorry

/-- **Projectives are detected modulo `p`** (NSW (5.6.10)(iii)). Two finitely generated projective
`ℤ_p[G]`-modules with isomorphic reductions are isomorphic. -/
theorem linearEquiv_of_projective_of_reduction
    (M N : Type u) [AddCommGroup M] [Module (MonoidAlgebra ℤ_[p] G) M]
    [Module.Finite (MonoidAlgebra ℤ_[p] G) M] [Module.Projective (MonoidAlgebra ℤ_[p] G) M]
    [AddCommGroup N] [Module (MonoidAlgebra ℤ_[p] G) N]
    [Module.Finite (MonoidAlgebra ℤ_[p] G) N] [Module.Projective (MonoidAlgebra ℤ_[p] G) N]
    (_h : Nonempty
      ((M ⧸ (Ideal.span {(p : MonoidAlgebra ℤ_[p] G)} •
            (⊤ : Submodule (MonoidAlgebra ℤ_[p] G) M)))
        ≃ₗ[MonoidAlgebra ℤ_[p] G]
        (N ⧸ (Ideal.span {(p : MonoidAlgebra ℤ_[p] G)} •
            (⊤ : Submodule (MonoidAlgebra ℤ_[p] G) N))))) :
    Nonempty (M ≃ₗ[MonoidAlgebra ℤ_[p] G] N) :=
  sorry

/-- **From a stable isomorphism to an isomorphism** (NSW (5.6.11), finite-group form). If
`M ⊕ P ≅ N ⊕ Q` with `P, Q` finitely generated projective, and rationally
`M ⊗ ℚ_p ≅ (N ⊕ ℤ_p[G]^m) ⊗ ℚ_p`, then `M ≅ N ⊕ ℤ_p[G]^m`. The proof is cancellation rationally,
then `linearEquiv_of_projective_of_tensorRat` to identify `Q ≅ P ⊕ ℤ_p[G]^m`, then
`linearEquiv_of_prod_linearEquiv` integrally. -/
theorem linearEquiv_prod_free_of_stable
    (M N P Q : Type u) [AddCommGroup M] [Module ℤ_[p] M] [Module (MonoidAlgebra ℤ_[p] G) M]
    [IsScalarTower ℤ_[p] (MonoidAlgebra ℤ_[p] G) M] [Module.Finite (MonoidAlgebra ℤ_[p] G) M]
    [AddCommGroup N] [Module ℤ_[p] N] [Module (MonoidAlgebra ℤ_[p] G) N]
    [IsScalarTower ℤ_[p] (MonoidAlgebra ℤ_[p] G) N] [Module.Finite (MonoidAlgebra ℤ_[p] G) N]
    [AddCommGroup P] [Module (MonoidAlgebra ℤ_[p] G) P]
    [Module.Finite (MonoidAlgebra ℤ_[p] G) P] [Module.Projective (MonoidAlgebra ℤ_[p] G) P]
    [AddCommGroup Q] [Module (MonoidAlgebra ℤ_[p] G) Q]
    [Module.Finite (MonoidAlgebra ℤ_[p] G) Q] [Module.Projective (MonoidAlgebra ℤ_[p] G) Q]
    (m : ℕ) (_hstable : Nonempty ((M × P) ≃ₗ[MonoidAlgebra ℤ_[p] G] (N × Q)))
    (_hrat : Nonempty ((M ⊗[ℤ_[p]] ℚ_[p]) ≃ₗ[MonoidAlgebra ℤ_[p] G]
      ((N × (Fin m → MonoidAlgebra ℤ_[p] G)) ⊗[ℤ_[p]] ℚ_[p]))) :
    Nonempty (M ≃ₗ[MonoidAlgebra ℤ_[p] G] (N × (Fin m → MonoidAlgebra ℤ_[p] G))) :=
  sorry

/-- **The stable isomorphism class of a module of projective dimension one is its torsion**
(NSW (5.4.11) together with (5.6.9)). For a finitely generated `ℤ_p[G]`-module `M` presented as
a quotient of a free module by a projective kernel, `E¹(M) = Ext¹_{ℤ_p[G]}(M, ℤ_p[G])` is the
Pontryagin dual of the `p`-power torsion of `M`, and on such modules `E¹` is the transpose `D`,
which is a duality on the homotopy category. So two such modules with `ℤ_p[G]`-isomorphic
`p`-power torsion submodules are homotopy equivalent, that is, become isomorphic after adding
finitely generated projective modules. This is the theorem that makes the Tate module of a layer
comparable with the tame-frame module: their torsion submodules are both `μ_{p^∞}(L)`. -/
theorem exists_projective_prod_linearEquiv_of_torsion
    (M N : Type u) [AddCommGroup M] [Module ℤ_[p] M] [Module (MonoidAlgebra ℤ_[p] G) M]
    [IsScalarTower ℤ_[p] (MonoidAlgebra ℤ_[p] G) M] [Module.Finite (MonoidAlgebra ℤ_[p] G) M]
    [AddCommGroup N] [Module ℤ_[p] N] [Module (MonoidAlgebra ℤ_[p] G) N]
    [IsScalarTower ℤ_[p] (MonoidAlgebra ℤ_[p] G) N] [Module.Finite (MonoidAlgebra ℤ_[p] G) N]
    (_hM : ∃ (n : ℕ) (f : (Fin n → MonoidAlgebra ℤ_[p] G) →ₗ[MonoidAlgebra ℤ_[p] G] M),
      Function.Surjective f ∧ Module.Projective (MonoidAlgebra ℤ_[p] G) (LinearMap.ker f))
    (_hN : ∃ (n : ℕ) (f : (Fin n → MonoidAlgebra ℤ_[p] G) →ₗ[MonoidAlgebra ℤ_[p] G] N),
      Function.Surjective f ∧ Module.Projective (MonoidAlgebra ℤ_[p] G) (LinearMap.ker f))
    (_htors : Nonempty (↥(pPowerTorsion p G M) ≃ₗ[MonoidAlgebra ℤ_[p] G] ↥(pPowerTorsion p G N))) :
    ∃ (P Q : Type u) (_ : AddCommGroup P) (_ : Module (MonoidAlgebra ℤ_[p] G) P)
      (_ : AddCommGroup Q) (_ : Module (MonoidAlgebra ℤ_[p] G) Q),
      Module.Finite (MonoidAlgebra ℤ_[p] G) P ∧ Module.Projective (MonoidAlgebra ℤ_[p] G) P ∧
      Module.Finite (MonoidAlgebra ℤ_[p] G) Q ∧ Module.Projective (MonoidAlgebra ℤ_[p] G) Q ∧
      Nonempty ((M × P) ≃ₗ[MonoidAlgebra ℤ_[p] G] (N × Q)) :=
  sorry

/-- **The relation module depends only on the group and the number of generators** (Schanuel's
lemma with NSW (5.6.10)(i)). Two generating families of the same size `n` have `ℤ_p[G]`-isomorphic
relation modules: Lyndon's sequence `0 → R^ab(p) → ℤ_p[G]^n → I_G → 0` for each, Schanuel's lemma
gives `R^ab_g(p) ⊕ ℤ_p[G]^n ≅ R^ab_{g'}(p) ⊕ ℤ_p[G]^n`, and Krull–Schmidt cancels the free summand.
This is what lets the relation-module statements below quantify over every generating family
while their proofs construct the surjection for one. -/
theorem relationModule_linearEquiv_of_closure {n : ℕ} (g g' : Fin n → G)
    (_hg : Subgroup.closure (Set.range g) = ⊤) (_hg' : Subgroup.closure (Set.range g') = ⊤) :
    Nonempty (↥(relationModule p G g) ≃ₗ[MonoidAlgebra ℤ_[p] G] ↥(relationModule p G g')) :=
  sorry

end IntegralCancellation

section RelationModule

variable (p : ℕ) [Fact p.Prime] (L : Type u) [Field L]

/-- The transition maps `Lˣ/(Lˣ)^{p^{m+1}} → Lˣ/(Lˣ)^{p^m}` of the `p`-adic tower. Real data: the
carrier of `A(L)` has to be transparent, or every statement about it is vacuous. -/
noncomputable def padicCompletionTransition (m : ℕ) :
    (Lˣ ⧸ (powMonoidHom (p ^ (m + 1)) : Lˣ →* Lˣ).range) →*
      (Lˣ ⧸ (powMonoidHom (p ^ m) : Lˣ →* Lˣ).range) :=
  QuotientGroup.map _ _ (MonoidHom.id Lˣ) (by
    rintro _ ⟨x, rfl⟩
    refine ⟨x ^ p, ?_⟩
    simp only [powMonoidHom_apply, MonoidHom.id_apply, ← pow_mul]
    rw [← pow_succ'])

/-- **`A(L) = lim_m Lˣ/(Lˣ)^{p^m}`**, the `p`-adic completion of the multiplicative group, as a
subgroup of the product of the finite levels. Via local reciprocity it is `G_L^{ab}(p)`; that
identification is a theorem of Layer 7, not the definition. -/
noncomputable def padicCompletionUnits :
    Subgroup (∀ m : ℕ, Lˣ ⧸ (powMonoidHom (p ^ m) : Lˣ →* Lˣ).range) :=
  ⨅ m : ℕ, MonoidHom.eqLocus
    ((padicCompletionTransition p L m).comp (Pi.evalMonoidHom _ (m + 1)))
    (Pi.evalMonoidHom _ m)

/-- The canonical map `Lˣ → A(L)`. -/
noncomputable def padicCompletionUnitsOf : Lˣ →* ↥(padicCompletionUnits p L) :=
  MonoidHom.codRestrict (MonoidHom.pi fun m => QuotientGroup.mk' _) _ (by
    intro x
    rw [padicCompletionUnits, Subgroup.mem_iInf]
    intro m
    rfl)

/-- ⚠ Instance shortcut. The additive group of `A(L)` is `Additive.addCommGroup` of a subgroup of
a product of quotient groups; instance search reaches it through `Pi.commGroup` and the normality
of `(powMonoidHom _).range`, which is slow enough to time out inside larger instance problems
such as the module quotient of Step 2. The shortcut pins the same instance by name, so no diamond
is introduced. -/
noncomputable instance padicCompletionUnitsAddCommGroup :
    AddCommGroup (Additive ↥(padicCompletionUnits p L)) :=
  Additive.addCommGroup

/-- `A(L)` is a `ℤ_p`-module: it is an abelian pro-`p` group. -/
noncomputable instance padicCompletionUnitsPadicModule :
    Module ℤ_[p] (Additive ↥(padicCompletionUnits p L)) :=
  sorry

/-- The `ℤ_p`-action extends the intrinsic `ℕ`-action, so it is not a second addition. -/
theorem padicCompletionUnits_natCast_smul (n : ℕ)
    (x : Additive ↥(padicCompletionUnits p L)) :
    (n : ℤ_[p]) • x = n • x :=
  sorry

/-- **Step 2, the torsion.** The torsion subgroup of `A(L)` is exactly the image of the `p`-power
roots of unity of `L`. Without this the rank of `A(L)` is not well defined: over `ℤ_p` the module
has a finite cyclic summand precisely when `μ_p ⊆ L`, and that summand is the one carrying `q`. -/
theorem torsion_padicCompletionUnits [Algebra ℚ_[p] L] [Module.Finite ℚ_[p] L] :
    CommGroup.torsion ↥(padicCompletionUnits p L)
      = (pPowerRootsOfUnity p L).map (padicCompletionUnitsOf p L) :=
  sorry

/-- **Step 2, the torsion is finite**, of order `q(L)`. -/
theorem card_torsion_padicCompletionUnits [Algebra ℚ_[p] L] [Module.Finite ℚ_[p] L] :
    Nat.card ↥(CommGroup.torsion ↥(padicCompletionUnits p L))
      = localRootOfUnityOrder p L (finite_pPowerRootsOfUnity p L) :=
  sorry

/-- **Step 2, the torsion as a `ℤ_p`-submodule.** Mathlib's `Submodule.torsion ℤ_[p]` of `A(L)` is
the additive form of the group torsion: `A(L)` is pro-`p`, so being killed by a nonzero `p`-adic
integer is the same as having finite order. This is the submodule the free quotient below is
taken by. -/
theorem mem_torsion_padicCompletionUnits_iff (x : Additive ↥(padicCompletionUnits p L)) :
    x ∈ Submodule.torsion ℤ_[p] (Additive ↥(padicCompletionUnits p L)) ↔
      Additive.toMul x ∈ CommGroup.torsion ↥(padicCompletionUnits p L) :=
  sorry

/-- **Step 2, the free quotient.** Modulo its `ℤ_p`-torsion, `A(L)` is a free `ℤ_p`-module of rank
`[L : ℚ_p] + 1`: the `[L : ℚ_p]` comes from the principal units and the `1` from the valuation.
Stated as a `ℤ_p`-linear isomorphism with `ℤ_p^{N+1}`: an additive isomorphism would not see the
`ℤ_p`-structure and would not say that the quotient is free, and a `finrank` equation would be
`0` on a module that is not finite free and would hide exactly the failure it is meant to
exclude. The decomposition of this layer is algebraic at every finite layer; no topology on
`A(L)` or on this quotient is consumed anywhere below, and the only topological statement about
`A(L)` is its reciprocity identification with `G_L^{ab}(p)`. -/
theorem padicCompletionUnits_quotient_torsion_linearEquiv
    [Algebra ℚ_[p] L] [Module.Finite ℚ_[p] L] :
    Nonempty ((Additive ↥(padicCompletionUnits p L) ⧸
        Submodule.torsion ℤ_[p] (Additive ↥(padicCompletionUnits p L)))
      ≃ₗ[ℤ_[p]] (Fin (Module.finrank ℚ_[p] L + 1) → ℤ_[p])) :=
  sorry

variable (K : Type u) [Field K] [Algebra K L]

/-- The Galois action on `A(L)`, functorially from the action on `Lˣ`. -/
noncomputable def padicCompletionUnitsAut :
    (L ≃ₐ[K] L) →* MulAut ↥(padicCompletionUnits p L) :=
  sorry

/-- The action is the one induced by the action on `Lˣ`. This equation is what stops the action
from being an arbitrary structure: `padicCompletionUnitsAut` is pinned on the image of `Lˣ`, which
is dense in `A(L)`. -/
theorem padicCompletionUnitsAut_of (σ : L ≃ₐ[K] L) (x : Lˣ) :
    padicCompletionUnitsAut p L K σ (padicCompletionUnitsOf p L x)
      = padicCompletionUnitsOf p L (Units.map (σ : L →* L) x) :=
  sorry

/-- **Step 1, the integral lattice.** `A(L)` is a module over `ℤ_p[Gal(L/K)]`, not merely over
`ℚ_p[Gal(L/K)]`. This is the object the whole layer is about; the rational decomposition below is
a shadow of it and does not determine it. -/
noncomputable instance padicCompletionUnitsModule :
    Module (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)) (Additive ↥(padicCompletionUnits p L)) :=
  sorry

/-- The group-algebra action of a group element is the Galois action. -/
theorem padicCompletionUnits_single_smul (σ : L ≃ₐ[K] L)
    (x : ↥(padicCompletionUnits p L)) :
    (MonoidAlgebra.single σ (1 : ℤ_[p]) : MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)) •
        (Additive.ofMul x) = Additive.ofMul (padicCompletionUnitsAut p L K σ x) :=
  sorry

/-- The `ℤ_p`-structure of `A(L)` is the restriction of its `ℤ_p[Gal(L/K)]`-structure. Without
this the two module structures are unrelated data: the `ℤ_p`-torsion of Step 2 could not be read
inside the group-algebra module, and the rationalization `A(L) ⊗[ℤ_p] ℚ_p` would carry no
`ℤ_p[Gal(L/K)]`-structure. -/
instance padicCompletionUnits_isScalarTower :
    IsScalarTower ℤ_[p] (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L))
      (Additive ↥(padicCompletionUnits p L)) :=
  sorry

/-- **Step 1, finiteness of the lattice.** `A(L)` is a finitely generated `ℤ_p[Gal(L/K)]`-module.
Every cancellation theorem of Step 3 has this as a hypothesis and none of them holds without it. -/
theorem padicCompletionUnits_module_finite [Algebra ℚ_[p] L] [Module.Finite ℚ_[p] L]
    [Finite (L ≃ₐ[K] L)] :
    Module.Finite (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)) (Additive ↥(padicCompletionUnits p L)) :=
  sorry

/-- **Step 3, the coinvariants identity.** `N_{L/K}(σ x) = N_{L/K}(x)`, so the norm into `A(K)`
kills the augmentation ideal and factors through the coinvariants `A(L)_{Gal(L/K)}`. This is the
elementary half of the coinvariants step; the other half is that the cokernel of the norm is the
pro-`p` abelianized Galois group, which is the `p`-completion of `ClassFieldTheory.normResidue`
and so is not restated here. -/
theorem padicCompletionUnitsOf_norm_algEquiv (σ : L ≃ₐ[K] L) (x : Lˣ) :
    padicCompletionUnitsOf p K (Units.map (Algebra.norm K : L →* K) (Units.map (σ : L →* L) x))
      = padicCompletionUnitsOf p K (Units.map (Algebra.norm K : L →* K) x) :=
  sorry

/-! ### Step 3: the Tate module of a layer and its integral decomposition -/

/-- **Step 3, the Tate module of the layer** — the module `Y = I_{G_K}/I_{G_L} I_{G_K}` of NSW
(5.6.5) and the proof of (7.4.1), packaged by the properties the decomposition consumes: a
finitely generated `ℤ_p[Gal(L/K)]`-module of projective dimension at most one that is an extension
of the augmentation ideal `I_{Gal(L/K)}` by `A(L)`. Projective dimension at most one is
cohomological triviality, which is Tate's theorem (NSW (3.1.5)) for the fundamental class of the
layer transported to `A(L)` along the reciprocity identification of Step 1; the extension class is
that class. The decomposition below uses only the properties recorded here, so the package
carries nothing else. -/
structure TateModule where
  /-- The carrier `Y`. -/
  carrier : Type u
  [addCommGroup : AddCommGroup carrier]
  [module : Module (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)) carrier]
  /-- The inclusion of `A(L)`. -/
  ι : Additive ↥(padicCompletionUnits p L) →ₗ[MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)] carrier
  /-- The projection onto the augmentation ideal. -/
  π : carrier →ₗ[MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)] ↥(augmentationIdeal p (L ≃ₐ[K] L))
  ι_injective : Function.Injective ι
  π_surjective : Function.Surjective π
  exact : LinearMap.ker π = LinearMap.range ι
  finite : Module.Finite (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)) carrier
  /-- Projective dimension at most one: a quotient of a free module by a projective kernel. -/
  projdim : ∃ (n : ℕ)
      (f : (Fin n → MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)) →ₗ[MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)] carrier),
    Function.Surjective f ∧ Module.Projective (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)) (LinearMap.ker f)

attribute [instance] TateModule.addCommGroup TateModule.module

/-- ⚠ **Rejection test for the Galois hypothesis of the finite layer.** Finiteness of `L ≃ₐ[K] L`
is not a substitute for `L/K` being Galois. Over a finite layer of `p`-adic fields whose
automorphism group is smaller than its degree, the rational decomposition below is **false**: the
left side has `ℚ_p`-dimension `[L : ℚ_p] + 1`, by
`padicCompletionUnits_quotient_torsion_linearEquiv` and the finiteness of the torsion, while the
right side has dimension
`[K : ℚ_p] · #Aut_K(L) + 1 < [K : ℚ_p] · [L : K] + 1 = [L : ℚ_p] + 1`, by the tower formula. The
named instance is the non-Galois cubic `ℚ₅(∛5)`, `not_nonempty_tensor_ratPadic_nonGaloisCubic`,
where the two dimensions are `4` and `2`. The hypotheses are those of the Galois-layer section
below with `IsGalois` removed; `FiniteDimensional K L` follows from the tower by
`FiniteDimensional.right`. -/
theorem not_nonempty_tensor_ratPadic_of_card_lt
    [Algebra ℚ_[p] L] [Module.Finite ℚ_[p] L] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    [IsScalarTower ℚ_[p] K L]
    (_h : Nat.card (L ≃ₐ[K] L) < Module.finrank K L) :
    ¬ Nonempty ((Additive ↥(padicCompletionUnits p L) ⊗[ℤ_[p]] ℚ_[p])
      ≃ₗ[MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)]
      (((Fin (Module.finrank ℚ_[p] K) → MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)) ×
        (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L) ⧸ augmentationIdeal p (L ≃ₐ[K] L)))
          ⊗[ℤ_[p]] ℚ_[p])) :=
  sorry

/-! #### The finite Galois layer

⚠ From here to the end of Step 3 every statement is over a **finite Galois layer** `L/K` of
`p`-adic fields, as Lean hypotheses: `[IsScalarTower ℚ_[p] K L]` makes the three algebra
structures `ℚ_p ⊆ K ⊆ L` one tower, so that `[L : ℚ_p] = [K : ℚ_p] · [L : K]`, and
`[IsGalois K L]` with `[FiniteDimensional K L]` make `L ≃ₐ[K] L` the Galois group `Gal(L/K)`, of
order `[L : K]` and finite by `AlgEquiv.fintype`. These are the hypotheses under which Step 5a
applies the chain, at `L` the fixed field of `P_K U`; a prose reference to "the Galois layer" is
not a hypothesis Lean retains, and the rejection tests `not_nonempty_tensor_ratPadic_of_card_lt`
and `not_exists_tameFrame_exponents_one_one` record two statements of this step that are false
when one of these hypotheses is dropped. `Module.Finite ℚ_[p] K` and `FiniteDimensional K L` are
consequences of the tower and are bound for convenience. -/

section FiniteGaloisLayer

variable [Algebra ℚ_[p] L] [Module.Finite ℚ_[p] L] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
  [IsScalarTower ℚ_[p] K L] [IsGalois K L] [FiniteDimensional K L]

/-- **The rational decomposition (NSW (7.4.4)(i)).** `A(L) ⊗ ℚ_p ≅ ℚ_p[G]^N ⊕ ℚ_p` as
`ℚ_p[Gal(L/K)]`-modules, from the `p`-adic logarithm on the deep units and the normal basis
theorem — the normal basis theorem is where `L/K` Galois is consumed, and the `ℚ_p`-dimension
count `[K : ℚ_p] · [L : K] + 1 = [L : ℚ_p] + 1` is where the tower is. The trivial module is
`ℤ_p[G]/I_G`, rationalized, so that no second module structure has to be installed on `ℚ_[p]`
itself; the isomorphism is `ℤ_p[G]`-linear, which is the same as `ℚ_p[G]`-linear between
`ℚ_p`-vector spaces.

⚠ This theorem is an **input**, not the conclusion of Layer 7. A `ℚ_p[G]`-isomorphism says nothing
about the minimal number of generators of the integral module: `ℤ_p[G]`-modules with isomorphic
rationalizations need not be isomorphic — `ℤ_p` and `ℤ_p ⊕ ℤ/p` already differ, and they need
different numbers of generators — and the point of Step 3 is to supply the missing integral
information. -/
theorem padicCompletionUnits_tensor_ratPadic :
    Nonempty ((Additive ↥(padicCompletionUnits p L) ⊗[ℤ_[p]] ℚ_[p])
      ≃ₗ[MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)]
      (((Fin (Module.finrank ℚ_[p] K) → MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)) ×
        (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L) ⧸ augmentationIdeal p (L ≃ₐ[K] L)))
          ⊗[ℤ_[p]] ℚ_[p])) :=
  sorry

/-- **Step 3, sharp exponents for the tame frame** (the sequence `(∗)` in the proof of NSW
(7.4.1)). For a **generating pair** `σ, τ` of `Gal(L/K)` with `τ` of order prime to `p`, there are
natural numbers `a, b` through which `σ` and `τ` act on `μ_{p^∞}(L)` for which the left ideal
`J = (σ - a, τ - b)` of `ℤ_p[Gal(L/K)]` is the annihilator of `μ_{p^∞}(L)` itself — the kernel of
the ring map `ℤ_p[G] → ℤ/q(L) = End(μ_{p^∞}(L))` through which `G` acts. Both halves of that
identification are pinned: the quotient `ℤ_p[G]/J` has order `q(L)`, and it is isomorphic as a
left `ℤ_p[G]`-module to the `p`-power torsion of `A(L)`, which is `μ_{p^∞}(L)` with its Galois
action (Step 2). The cardinality alone would leave the action unpinned; the action alone would
leave a proper quotient possible.

⚠ Dual convention. With the contragredient action `(gφ)(ζ) = φ(g⁻¹ζ)` on the Pontryagin dual, the
annihilator of `μ_{p^∞}(L)^∨` is `(σ - a⁻¹, τ - b⁻¹)`, not `J`. The dual enters in
`tameFrameModule_torsion_linearEquiv` below — `E¹(M₀) = μ_{p^∞}(L)^∨` with `σ, τ` acting through
`a⁻¹, b⁻¹`, whose dual is `μ_{p^∞}(L)` again — and not here.

⚠ Generation is load-bearing, not decorative. When `σ, τ` generate, `ℤ_p[G]/J` is a cyclic
`ℤ_p`-module, `ℤ_p/(χ(r) - 1 : r ∈ R)` for the character `χ` of the free group on two letters with
`x ↦ a`, `y ↦ b` and `R` the relations of `G`; it maps onto `ℤ/q(L)` because `a, b` lift the
action, and the prime-to-`p` order of `τ` lets `b` be moved along `τ^{orderOf τ} = 1`, by a
multiple of `q(L)`, until `v_p(b^{orderOf τ} - 1)` is exactly `v_p(q(L))`. When `σ, τ` generate
only a proper subgroup `H`, the quotient is `(ℤ_p[H]/J_H)^{[G:H]}` and has order at least
`q(L)^{[G:H]} > q(L)` whenever `q(L) > 1`: the rejection test
`not_exists_tameFrame_exponents_one_one` records the identity pair on the unramified quadratic
extension of `ℚ₂`. Not every lift works either: with `a = b = 1` the quotient is `ℤ_p[G]/I_G ≅ ℤ_p`,
infinite, so its `Nat.card` is `0`, and the tame-frame module built from it has the wrong torsion.
The hypothesis `Subgroup.closure {σ, τ} = ⊤` is exactly what `exists_tameFrame_quotient` supplies
at the layer `L = fixed field of P_K U`. -/
theorem exists_tameFrame_exponents (σ τ : L ≃ₐ[K] L)
    (_hgen : Subgroup.closure {σ, τ} = ⊤) (_hτ : ¬ p ∣ orderOf τ) :
    ∃ a b : ℕ,
      (∀ ζ ∈ pPowerRootsOfUnity p L, Units.map (σ : L →* L) ζ = ζ ^ a) ∧
      (∀ ζ ∈ pPowerRootsOfUnity p L, Units.map (τ : L →* L) ζ = ζ ^ b) ∧
      Nat.card (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L) ⧸ Ideal.span
        {MonoidAlgebra.single σ (1 : ℤ_[p]) - a, MonoidAlgebra.single τ (1 : ℤ_[p]) - b})
        = localRootOfUnityOrder p L (finite_pPowerRootsOfUnity p L) ∧
      Nonempty ((MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L) ⧸ Ideal.span
          {MonoidAlgebra.single σ (1 : ℤ_[p]) - a, MonoidAlgebra.single τ (1 : ℤ_[p]) - b})
        ≃ₗ[MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)]
        ↥(pPowerTorsion p (L ≃ₐ[K] L) (Additive ↥(padicCompletionUnits p L)))) :=
  sorry

/-- **Step 3, the tame-frame module is rationally the group algebra.** Under the sharpness
condition the map `ℤ_p[G] → ℤ_p[G]²`, `1 ↦ (σ - a, τ - b)`, is injective, so `M₀ ⊗ ℚ_p ≅ ℚ_p[G]`.
The hypotheses are the same as for the sharp exponents, so the two are consumed together. -/
theorem tameFrameModule_tensorRat_linearEquiv (σ τ : L ≃ₐ[K] L) (a b : ℕ)
    (_hsharp : Nat.card (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L) ⧸ Ideal.span
        {MonoidAlgebra.single σ (1 : ℤ_[p]) - a, MonoidAlgebra.single τ (1 : ℤ_[p]) - b})
        = localRootOfUnityOrder p L (finite_pPowerRootsOfUnity p L)) :
    Nonempty ((tameFrameModule p (L ≃ₐ[K] L) σ τ a b ⊗[ℤ_[p]] ℚ_[p])
      ≃ₗ[MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)] (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L) ⊗[ℤ_[p]] ℚ_[p])) :=
  sorry

/-- **Step 3, the torsion of the tame-frame module is the roots of unity.** Under the sharpness
condition, `E¹(M₀)` is `μ_{p^∞}(L)^∨` with `σ` and `τ` acting through `a⁻¹` and `b⁻¹`, so the
`p`-power torsion of `M₀` is `μ_{p^∞}(L)` as a `ℤ_p[Gal(L/K)]`-module — the same module as the
torsion of `A(L)` of Step 2. This is the arithmetic input of the comparison with the Tate module;
everything else in the comparison is the formal module theory of Step 3. -/
theorem tameFrameModule_torsion_linearEquiv (σ τ : L ≃ₐ[K] L) (a b : ℕ)
    (_hσ : ∀ ζ ∈ pPowerRootsOfUnity p L, Units.map (σ : L →* L) ζ = ζ ^ a)
    (_hτ : ∀ ζ ∈ pPowerRootsOfUnity p L, Units.map (τ : L →* L) ζ = ζ ^ b)
    (_hsharp : Nat.card (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L) ⧸ Ideal.span
        {MonoidAlgebra.single σ (1 : ℤ_[p]) - a, MonoidAlgebra.single τ (1 : ℤ_[p]) - b})
        = localRootOfUnityOrder p L (finite_pPowerRootsOfUnity p L)) :
    Nonempty (↥(pPowerTorsion p (L ≃ₐ[K] L) (tameFrameModule p (L ≃ₐ[K] L) σ τ a b))
      ≃ₗ[MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)]
      ↥(pPowerTorsion p (L ≃ₐ[K] L) (Additive ↥(padicCompletionUnits p L)))) :=
  sorry

/-- **Step 3, existence of the Tate module** (NSW (5.6.5) for the extension `0 → A(L) → Y → I_G → 0`
and (3.1.5), Tate's theorem, for the cohomological triviality). Its inputs are the local class
formation — `ClassFieldTheory.ClassFormation`, which is Tau Ceti's
`TauCeti.ClassFieldTheory.ClassFormation` re-exported, with Tau Ceti's fundamental class
`ClassFormation.fundamentalClass` and its generation theorem
`ClassFormation.fundamentalClass_generates`, and `ClassFieldTheory.tateTheorem` — and the
reciprocity identification `A(L) ≃ G_L^{ab}(p)` of Step 1, which carries the fundamental class of
`Lˣ` to `A(L)`. -/
theorem nonempty_tateModule : Nonempty (TateModule p L K) :=
  sorry

/-- **Step 3, the integral decomposition** `Y ≅ M₀ ⊕ ℤ_p[Gal(L/K)]^N` (the isomorphism `(∗∗)` in
the proof of NSW (7.4.1)). This is the theorem the cancellation lemmas are applied to:
`exists_projective_prod_linearEquiv_of_torsion` gives `Y ⊕ P ≅ M₀ ⊕ Q`, because both have
`p`-power torsion `μ_{p^∞}(L)` (`tameFrameModule_torsion_linearEquiv`, and Step 2 for `Y` through
`Y.exact`); the rational decomposition `padicCompletionUnits_tensor_ratPadic` together with
`tameFrameModule_tensorRat_linearEquiv` and `I_G ⊗ ℚ_p ⊕ ℚ_p ≅ ℚ_p[G]` gives
`Y ⊗ ℚ_p ≅ (M₀ ⊕ ℤ_p[G]^N) ⊗ ℚ_p`; and `linearEquiv_prod_free_of_stable` concludes. It is an
integral statement about `A(L)`: `Y` is generated by `N + 2` elements because `M₀` is a quotient of
`ℤ_p[G]²`, and no such count is visible rationally. ⚠ The Galois-layer hypotheses are consumed
through the rational decomposition and are not removable: on the non-Galois cubic `ℚ₅(∛5)` a
`TateModule` exists — `G` is trivial, `I_G = 0`, and `A(L)` itself has projective dimension one
over `ℤ₅` — while the two sides have `ℚ₅`-dimensions `4` and `2`. -/
theorem tateModule_linearEquiv (Y : TateModule p L K) (σ τ : L ≃ₐ[K] L) (a b : ℕ)
    (_hσ : ∀ ζ ∈ pPowerRootsOfUnity p L, Units.map (σ : L →* L) ζ = ζ ^ a)
    (_hτ : ∀ ζ ∈ pPowerRootsOfUnity p L, Units.map (τ : L →* L) ζ = ζ ^ b)
    (_hsharp : Nat.card (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L) ⧸ Ideal.span
        {MonoidAlgebra.single σ (1 : ℤ_[p]) - a, MonoidAlgebra.single τ (1 : ℤ_[p]) - b})
        = localRootOfUnityOrder p L (finite_pPowerRootsOfUnity p L)) :
    Nonempty (Y.carrier ≃ₗ[MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)]
      (tameFrameModule p (L ≃ₐ[K] L) σ τ a b ×
        (Fin (Module.finrank ℚ_[p] K) → MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)))) :=
  sorry

/-- **Step 3, the relation-module surjection on a tame layer** (the first half of the proof of
NSW (7.4.1)). On a layer carrying a generating tame frame `σ, τ` — a generating pair with `τ` of
order prime to `p`, which is what `exists_tameFrame_quotient` supplies on the layers through
which wild inertia dies — for every generating family `g` of `Gal(L/K)` of size `N + 2`, the
`p`-relation module of `g` surjects `Gal(L/K)`-equivariantly onto `A(L)` with kernel free of rank
one: the integral relation-module decomposition `0 → ℤ_p[G] → R^ab_{N+2}(p) → A(L) → 0`. It is
derived from `tateModule_linearEquiv` at the frame: `exists_tameFrame_exponents` gives the sharp
exponents, `ℤ_p[G]^{N+2} = ℤ_p[G]² ⊕ ℤ_p[G]^N` maps onto `Y ≅ M₀ ⊕ ℤ_p[G]^N` over the augmentation
ideal with kernel `ℤ_p[G]`, and restricting to the kernels of the two maps to `I_G`
(`range_linearCombination_eq_augmentationIdeal` and `Y.exact`) gives `β`; the family `g` need not
extend the frame, because `relationModule_linearEquiv_of_closure` makes the relation module
independent of the generating family. Because the kernel `ℤ_p[G]` is induced, `β` induces an
isomorphism on `H¹(Gal(L/K), -)` and `H²(Gal(L/K), -)`; that is the `H²`-compatibility of the
README, which Step 5a uses to lift `β`, rescaled, to a morphism of group extensions.

⚠ **This, and not the unrestricted statement, is the input to Step 5.** The route through
`tateModule_linearEquiv` needs the two-element tame frame, and a general finite Galois layer has
none: for `p = 3`, `K = ℚ₃(μ₃)` and the layer with group `(ℤ/3)³` cut out by the elementary
abelian quotient of `G_K(3)` — whose generator rank is `4` by Layer 3 — no pair generates, every
prime-to-`3` element is the identity, and with `q(L) > 1` no pair of lifts is sharp. The
unrestricted theorem `exists_relationModule_surjective`, NSW (7.4.2)(i) itself, is stated
**after** the rank theorem, from which it is derived; consuming it here would be circular. -/
theorem exists_relationModule_surjective_of_tameFrame (σ τ : L ≃ₐ[K] L)
    (_hgen : Subgroup.closure {σ, τ} = ⊤) (_hτ : ¬ p ∣ orderOf τ)
    (g : Fin (Module.finrank ℚ_[p] K + 2) → (L ≃ₐ[K] L))
    (_hg : Subgroup.closure (Set.range g) = ⊤) :
    ∃ β : ↥(relationModule p (L ≃ₐ[K] L) g) →ₗ[MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)]
        Additive ↥(padicCompletionUnits p L),
      Function.Surjective β ∧
        Nonempty (↥(LinearMap.ker β) ≃ₗ[MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)]
          MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)) :=
  sorry

end FiniteGaloisLayer

end RelationModule

/-! ### Step 3: the class of the arithmetic extension generates -/

/-- **Step 3, the class of the arithmetic extension generates** (NSW (3.6.4)(iii) at `G = G_K`). For
an open normal subgroup `V` of `G_K`, the class `u_{G/V}(p)` of the extension
`1 → V^ab(p) → G_K ⧸ ⁅V, V⁆V(p) → G_K ⧸ V → 1` generates `H²(G_K ⧸ V, V^ab(p))`, a cyclic group of
order the `p`-part of `#(G_K ⧸ V)`. At `V = G_L` for a finite Galois layer `L/K`, `G_K ⧸ V` is
`Gal(L/K)` and `V^ab(p)` is `A(L)` by the reciprocity identification of Step 1, so the class of
`1 → G_L^ab(p) → G_K/⁅G_L, G_L⁆G_L(p) → Gal(L/K) → 1` generates `H²(Gal(L/K), A(L))`. This is the
one place strict cohomological dimension enters this roadmap, and it enters at `G_K` only. A closed
proof: `ProfiniteCohomology.abelianizationProPClass_generates` at `G = G_K`, whose hypothesis
`scd_p(G_K) ≤ 2` is `ClassFieldTheory.scd_p_absoluteGaloisGroup_eq_two` at `ℓ = p`. Both are
statements about `ProfiniteCohomology.scd_p`, which is Tau Ceti's `strictCohomologicalDimensionAt`,
so no comparison enters. -/
theorem contCohomologyClass_absoluteGaloisGroup_generates (p : ℕ) [Fact p.Prime] (K : Type)
    [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    (V : Subgroup (Field.absoluteGaloisGroup K)) [V.Normal]
    (hV : IsOpen (V : Set (Field.absoluteGaloisGroup K))) :
    AddSubgroup.zmultiples
        (ProfiniteCohomology.abelianizationProPClass p (Field.absoluteGaloisGroup K) V hV) = ⊤ ∧
      Nat.card (ProfiniteCohomology.H2 (Field.absoluteGaloisGroup K ⧸ V)
          (Additive (ProfiniteCohomology.abelianizationProP p (Field.absoluteGaloisGroup K) V))) =
        p ^ padicValNat p (Nat.card (Field.absoluteGaloisGroup K ⧸ V)) :=
  ProfiniteCohomology.abelianizationProPClass_generates p (Field.absoluteGaloisGroup K)
    (ClassFieldTheory.scd_p_absoluteGaloisGroup_eq_two K p p).le V hV

/-! ### Rejection tests for the finite-layer contracts

Two overgeneralized forms of Step 3 that a green build with admitted proofs cannot detect: the
rational decomposition without the Galois hypothesis, and the sharp exponents without the
generating hypothesis. Each is stated abstractly, with the hypothesis whose failure refutes it, and
then instantiated on a named field, so that the instance is checked against the abstract statement
by a closed proof. -/

section FiniteLayerRejectionTests

open Polynomial

/-- ⚠ **Rejection test for the generating hypothesis of `exists_tameFrame_exponents`.** Without
`Subgroup.closure {σ, τ} = ⊤` the sharp-exponent statement is false already for the identity pair
`σ = τ = 1` — which satisfies `¬ 2 ∣ orderOf τ`, since `orderOf 1 = 1` — on any layer at `p = 2`
with `q(L) = 2` and a nontrivial automorphism group. Since `-1 ∈ μ_{2^∞}(L)`, the action
equations `(-1)^a = -1 = (-1)^b` force `a` and `b` odd, so `1 - a` and `1 - b` lie in `2ℤ₂`, the
ideal `(1 - a, 1 - b)` is contained in `(2)`, and `ℤ₂[G]/(1 - a, 1 - b)` maps onto `𝔽₂[G]`, which
has `2^{#G} ≥ 4` elements when `G` is finite and is infinite otherwise. So the quotient is either
infinite, with `Nat.card` equal to `0`, or of order at least `4`; neither is `q(L) = 2`. The named
instance is the unramified quadratic extension `ℚ₂(ζ₃)`,
`not_exists_tameFrame_exponents_one_one_unramifiedQuadratic`. -/
theorem not_exists_tameFrame_exponents_one_one (L : Type u) [Field L] [Algebra ℚ_[2] L]
    [Module.Finite ℚ_[2] L] (K : Type u) [Field K] [Algebra K L] [Nontrivial (L ≃ₐ[K] L)]
    (_hq : localRootOfUnityOrder 2 L (finite_pPowerRootsOfUnity 2 L) = 2) :
    ¬ ∃ a b : ℕ,
      (∀ ζ ∈ pPowerRootsOfUnity 2 L, Units.map ((1 : L ≃ₐ[K] L) : L →* L) ζ = ζ ^ a) ∧
      (∀ ζ ∈ pPowerRootsOfUnity 2 L, Units.map ((1 : L ≃ₐ[K] L) : L →* L) ζ = ζ ^ b) ∧
      Nat.card (MonoidAlgebra ℤ_[2] (L ≃ₐ[K] L) ⧸ Ideal.span
        {MonoidAlgebra.single (1 : L ≃ₐ[K] L) (1 : ℤ_[2]) - a,
          MonoidAlgebra.single (1 : L ≃ₐ[K] L) (1 : ℤ_[2]) - b})
        = localRootOfUnityOrder 2 L (finite_pPowerRootsOfUnity 2 L) :=
  sorry

/-- `ℚ₂(ζ₃)`, the unramified quadratic extension of `ℚ₂`, as the root field of `X² + X + 1`.
Irreducibility over `ℚ₂` is a theorem (the polynomial has no root modulo `2`) and feeds the field
instance through a `Fact`. -/
noncomputable abbrev unramifiedQuadraticPoly : ℚ_[2][X] := X ^ 2 + X + 1

theorem unramifiedQuadraticPoly_irreducible : Irreducible unramifiedQuadraticPoly :=
  sorry

instance : Fact (Irreducible unramifiedQuadraticPoly) := ⟨unramifiedQuadraticPoly_irreducible⟩

/-- The unramified quadratic extension of `ℚ₂`, as a field. -/
abbrev UnramifiedQuadratic : Type := AdjoinRoot unramifiedQuadraticPoly

noncomputable instance : Module.Finite ℚ_[2] UnramifiedQuadratic :=
  (AdjoinRoot.powerBasis (Fact.out : Irreducible unramifiedQuadraticPoly).ne_zero).finite

/-- `q(ℚ₂(ζ₃)) = 2`: the extension is unramified, so it does not contain `i`, whose adjunction
is ramified. -/
theorem localRootOfUnityOrder_two_unramifiedQuadratic :
    localRootOfUnityOrder 2 UnramifiedQuadratic (finite_pPowerRootsOfUnity 2 UnramifiedQuadratic)
      = 2 :=
  sorry

/-- `ℚ₂(ζ₃)/ℚ₂` is Galois of degree `2`, so its automorphism group is nontrivial. -/
theorem nontrivial_algEquiv_unramifiedQuadratic :
    Nontrivial (UnramifiedQuadratic ≃ₐ[ℚ_[2]] UnramifiedQuadratic) :=
  sorry

/-- The instance of the rejection test, a closed proof from the abstract statement and the two
arithmetic facts above. -/
theorem not_exists_tameFrame_exponents_one_one_unramifiedQuadratic :
    ¬ ∃ a b : ℕ,
      (∀ ζ ∈ pPowerRootsOfUnity 2 UnramifiedQuadratic,
        Units.map ((1 : UnramifiedQuadratic ≃ₐ[ℚ_[2]] UnramifiedQuadratic) :
          UnramifiedQuadratic →* UnramifiedQuadratic) ζ = ζ ^ a) ∧
      (∀ ζ ∈ pPowerRootsOfUnity 2 UnramifiedQuadratic,
        Units.map ((1 : UnramifiedQuadratic ≃ₐ[ℚ_[2]] UnramifiedQuadratic) :
          UnramifiedQuadratic →* UnramifiedQuadratic) ζ = ζ ^ b) ∧
      Nat.card (MonoidAlgebra ℤ_[2] (UnramifiedQuadratic ≃ₐ[ℚ_[2]] UnramifiedQuadratic) ⧸
        Ideal.span
          {MonoidAlgebra.single (1 : UnramifiedQuadratic ≃ₐ[ℚ_[2]] UnramifiedQuadratic)
              (1 : ℤ_[2]) - a,
            MonoidAlgebra.single (1 : UnramifiedQuadratic ≃ₐ[ℚ_[2]] UnramifiedQuadratic)
              (1 : ℤ_[2]) - b})
        = localRootOfUnityOrder 2 UnramifiedQuadratic
            (finite_pPowerRootsOfUnity 2 UnramifiedQuadratic) :=
  haveI := nontrivial_algEquiv_unramifiedQuadratic
  not_exists_tameFrame_exponents_one_one UnramifiedQuadratic ℚ_[2]
    localRootOfUnityOrder_two_unramifiedQuadratic

instance factPrimeFive : Fact (Nat.Prime 5) := ⟨by norm_num⟩

/-- `ℚ₅(∛5)`, the root field of the Eisenstein polynomial `X³ - 5`: a totally ramified cubic
layer over `ℚ₅` that is **not** Galois. A nontrivial `ℚ₅`-automorphism would send `∛5` to
`ζ₃ ∛5` and put a primitive cube root of unity, of degree `2` over `ℚ₅`, inside a cubic
extension. -/
noncomputable abbrev nonGaloisCubicPoly : ℚ_[5][X] := X ^ 3 - C 5

theorem nonGaloisCubicPoly_irreducible : Irreducible nonGaloisCubicPoly :=
  sorry

instance : Fact (Irreducible nonGaloisCubicPoly) := ⟨nonGaloisCubicPoly_irreducible⟩

/-- The non-Galois cubic `ℚ₅(∛5)`, as a field. -/
abbrev NonGaloisCubic : Type := AdjoinRoot nonGaloisCubicPoly

noncomputable instance : Module.Finite ℚ_[5] NonGaloisCubic :=
  (AdjoinRoot.powerBasis (Fact.out : Irreducible nonGaloisCubicPoly).ne_zero).finite

/-- The degree is `3`, a closed proof from the power basis. -/
theorem finrank_nonGaloisCubic : Module.finrank ℚ_[5] NonGaloisCubic = 3 := by
  rw [(AdjoinRoot.powerBasis (Fact.out : Irreducible nonGaloisCubicPoly).ne_zero).finrank,
    AdjoinRoot.powerBasis_dim, natDegree_X_pow_sub_C]

/-- The automorphism group is trivial, so its order `1` is less than the degree `3`. -/
theorem nonGaloisCubic_card_algEquiv_lt :
    Nat.card (NonGaloisCubic ≃ₐ[ℚ_[5]] NonGaloisCubic) < Module.finrank ℚ_[5] NonGaloisCubic :=
  sorry

theorem not_isGalois_nonGaloisCubic : ¬ IsGalois ℚ_[5] NonGaloisCubic :=
  sorry

/-- The instance of the rejection test for the Galois hypothesis, a closed proof: with `K = ℚ₅`
the right-hand side of the rational decomposition has dimension `1 · 1 + 1 = 2`, the left-hand
side `3 + 1 = 4`. -/
theorem not_nonempty_tensor_ratPadic_nonGaloisCubic :
    ¬ Nonempty ((Additive ↥(padicCompletionUnits 5 NonGaloisCubic) ⊗[ℤ_[5]] ℚ_[5])
      ≃ₗ[MonoidAlgebra ℤ_[5] (NonGaloisCubic ≃ₐ[ℚ_[5]] NonGaloisCubic)]
      (((Fin (Module.finrank ℚ_[5] ℚ_[5]) →
          MonoidAlgebra ℤ_[5] (NonGaloisCubic ≃ₐ[ℚ_[5]] NonGaloisCubic)) ×
        (MonoidAlgebra ℤ_[5] (NonGaloisCubic ≃ₐ[ℚ_[5]] NonGaloisCubic) ⧸
          augmentationIdeal 5 (NonGaloisCubic ≃ₐ[ℚ_[5]] NonGaloisCubic)))
          ⊗[ℤ_[5]] ℚ_[5])) :=
  not_nonempty_tensor_ratPadic_of_card_lt 5 NonGaloisCubic ℚ_[5] nonGaloisCubic_card_algEquiv_lt

end FiniteLayerRejectionTests

/-! ### Steps 4–6: the relative Frattini reduction, the limit, and the two bounds -/

section FullGroup

variable (p : ℕ) [hpPrime : Fact p.Prime] (K : Type u) [Field K]
  [algQp : Algebra ℚ_[p] K] [finQp : Module.Finite ℚ_[p] K]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [CompactSpace (Field.absoluteGaloisGroup K)]
  [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]

/- ⚠ Every theorem of this section is **false without the mixed-characteristic hypotheses**: the
absolute Galois group of `𝔽_q((t))` is not topologically finitely generated. Lean drops section
variables a statement does not mention, and `IsTopologicallyFinitelyGenerated (G_K)` mentions
neither `p` nor the `ℚ_p`-algebra structure, so the instances are named and force-included
instead of being left to the automatic rule. -/
include hpPrime algQp finQp

/-- **Step 4, the relative Frattini reduction** (NSW (3.9.1), applied along wild inertia). A set
that generates `G_K` modulo the commutator subgroup of wild inertia already generates `G_K`,
because wild inertia is pro-`p` and `⁅P_K, P_K⁆ ≤ Φ(P_K)`.

This is the step that turns a generation statement about `G_K/⁅P_K, P_K⁆` into a generation
statement about `G_K` itself. It consumes exactly two supplier theorems,
`LocalFieldsRamification.wildInertia_isProP` and
`ProfiniteProPGroups.topologicallyGenerates_iff_frattiniQuotient`, and no abstract profinite
group theory is restated here to state it. -/
theorem topologicalClosure_eq_top_of_sup_wildInertiaCommutator
    (_hp : ringChar 𝓀[K] = p) (s : Set (Field.absoluteGaloisGroup K))
    (_h : (Subgroup.closure s ⊔
        ⁅LocalFieldsRamification.wildInertia K, LocalFieldsRamification.wildInertia K⁆
        ).topologicalClosure = ⊤) :
    (Subgroup.closure s).topologicalClosure = ⊤ :=
  sorry

/-- **Step 4, the tame frame.** The tame quotient is topologically generated by the classes of an
arithmetic Frobenius lift `σ` (`LocalFieldsRamification.exists_isArithFrobeniusLift`) and of a tame
generator `τ ∈ I_K` (`LocalFieldsRamification.exists_topologicalClosure_zpowers_eq_tameInertia`):
the supplier's marked isomorphism `LocalFieldsRamification.tameQuotientEquiv K σ τ hσ hτ` carries
them to the generators `iwasawaSigma`, `iwasawaTau` of the Iwasawa group
(`tameQuotientEquiv_mk_frobenius`, `tameQuotientEquiv_mk_tameGenerator`), which the free
generators generate topologically (`TauCeti.freeProfiniteGroup.dense_closure_range_of`). -/
theorem isTopologicallyFinitelyGenerated_tameQuotient :
    ProfiniteProPGroups.IsTopologicallyFinitelyGenerated
      (LocalFieldsRamification.tameQuotient K) :=
  sorry

/-- **Step 4, the tame frame is two generators.** The `2` of `N + 2`. -/
theorem topologicalGeneratorRankNat_tameQuotient_le_two :
    ProfiniteProPGroups.topologicalGeneratorRankNat (LocalFieldsRamification.tameQuotient K)
        (isTopologicallyFinitelyGenerated_tameQuotient p K) ≤ 2 :=
  sorry

/-- **Step 4, the tame frame on a finite tame layer.** Every finite quotient of `G_K` through
which wild inertia dies is generated by the images `σ, τ` of the tame frame, and `τ`, the image
of the tame inertia generator, has order prime to `p`. The frame is the supplier's: an arithmetic
Frobenius lift and a `τ ∈ I_K` from
`LocalFieldsRamification.exists_topologicalClosure_zpowers_eq_tameInertia`; their classes generate
`G_K/P_K` through `LocalFieldsRamification.tameQuotientEquiv`, hence every
finite quotient of it, and the class of `τ` lies in tame inertia, whose finite quotients have order
prime to `p` (`LocalFieldsRamification.tameInertiaEquiv`). These are the `σ, τ` and the hypothesis
`¬ p ∣ orderOf τ` that `exists_tameFrame_exponents` consumes at the layer `L = fixed field of
P_K U`, under the identification of `Gal(L/K)` with `G_K/(P_K U)` through
`IntermediateField.fixedField` and `IntermediateField.restrictNormalHom_ker`. -/
theorem exists_tameFrame_quotient (_hp : ringChar 𝓀[K] = p)
    (U : OpenNormalSubgroup (Field.absoluteGaloisGroup K))
    (_hU : LocalFieldsRamification.wildInertia K ≤ U.toSubgroup) :
    ∃ σ τ : Field.absoluteGaloisGroup K ⧸ U.toSubgroup,
      Subgroup.closure {σ, τ} = ⊤ ∧ ¬ p ∣ orderOf τ :=
  sorry

/-- **Step 5a, the finite level.** Every finite continuous quotient of `G_K` through which the
commutator subgroup of wild inertia dies is generated by `N + 2` elements, given as a tuple in
which repetitions are allowed. This is where the relation-module chain is used, exactly as in the
proof of NSW (7.4.1). With `L` the fixed field of `P_K U`, a finite tamely ramified Galois layer
whose group is `G_K/(P_K U)`:
`exists_tameFrame_quotient` supplies the generating frame `σ, τ`, which is the hypothesis
`exists_tameFrame_exponents` needs for the sharp exponents; `nonempty_tateModule` and
`tateModule_linearEquiv` the decomposition
`Y ≅ M₀ ⊕ ℤ_p[G]^N`; `exists_relationModule_surjective_of_tameFrame`, at that frame and for a
generating family of size `N + 2`, the surjection `β : R^ab_{N+2}(p) ↠ A(L)` with kernel
`ℤ_p[G]`. ⚠ Only the tame-frame surjection is consumed; the unrestricted
`exists_relationModule_surjective` comes after the rank theorem and would be circular here.
Through Lyndon (`relationModule_linearEquiv_abelianizationProP`) and the reciprocity identification
of Step 1, `β` is a surjection `R^ab(p) ↠ G_L^ab(p)` with kernel `ℤ_p[G]`, an isomorphism on `H²`.
The class of `E_bot = G_K/⁅G_L, G_L⁆G_L(p)` generates
(`contCohomologyClass_absoluteGaloisGroup_generates`). A morphism of extensions
`E_top = F_{N+2}/⁅R, R⁆R(p) → E_bot` over `G` built from lifts of the generators carries the class
of `E_top` to that of `E_bot` (PPG's
`ProfiniteGroupExtension.contCohomologyClass_map_eq_of_continuous_monoidHom`), so the class of
`E_top` generates as well, and `β` carries it to a unit multiple `c` of the class of `E_bot`.
Rescaled by `c⁻¹ ∈ ℤ_pˣ`, `β` lifts to a morphism `E_top → E_bot` over `G` (PPG's
`ProfiniteGroupExtension.exists_continuous_monoidHom_of_contCohomologyClass_map_eq`), surjective
because `β` is (`ProfiniteProPGroups.GroupExtension.surjective_of_comp_inl_eq`). `G_K/U`
is a quotient of `E_bot` because `G_L/U` is an abelian `p`-group, so the images of the `N + 2` free
generators generate it. No strict cohomological dimension of the free profinite group is used.

⚠ The statement is about tuples, not about finsets of cardinality `N + 2`: see the rejection test
below. -/
theorem exists_generating_tuple_quotient
    (U : OpenNormalSubgroup (Field.absoluteGaloisGroup K))
    (_hU : ⁅LocalFieldsRamification.wildInertia K, LocalFieldsRamification.wildInertia K⁆
      ≤ U.toSubgroup) :
    ∃ x : Fin (Module.finrank ℚ_[p] K + 2) → Field.absoluteGaloisGroup K ⧸ U.toSubgroup,
      Subgroup.closure (Set.range x) = ⊤ :=
  sorry

omit finQp [CompactSpace (Field.absoluteGaloisGroup K)]
  [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)] in
/-- ⚠ **Rejection test.** The finite-level statement with a `Finset` of cardinality exactly `N + 2`
is false: `U = G_K` is open, normal and contains `⁅P_K, P_K⁆`, its quotient is trivial, and a
finset in a subsingleton has at most one element while `N + 2 ≥ 2`. A closed proof, so that the
cardinality-equality form cannot return. -/
theorem not_forall_exists_finset_card_generating_quotient :
    ¬ ∀ U : OpenNormalSubgroup (Field.absoluteGaloisGroup K),
      ⁅LocalFieldsRamification.wildInertia K, LocalFieldsRamification.wildInertia K⁆
          ≤ U.toSubgroup →
        ∃ s : Finset (Field.absoluteGaloisGroup K ⧸ U.toSubgroup),
          s.card = Module.finrank ℚ_[p] K + 2 ∧
            Subgroup.closure (s : Set (Field.absoluteGaloisGroup K ⧸ U.toSubgroup)) = ⊤ := by
  intro h
  obtain ⟨s, hs, -⟩ := h ⟨⊤, show (⊤ : Subgroup _).Normal from inferInstance⟩ le_top
  have : s.card ≤ 1 := @Finset.card_le_one_of_subsingleton _
    QuotientGroup.subsingleton_quotient_top s
  omega

/-- **Step 5b, the tuple sets.** For an open normal `U`, the set `X_U` of `(N + 2)`-tuples of
elements of `G_K` whose images generate `G_K/U`. The compactness argument runs over these sets:
no compatibility between independently chosen generating sets of different quotients is needed,
because one tuple of `G_K` is compared against every quotient. The set depends only on `G_K` and
on `N`; the local-field structure of `K` enters through the condition `⁅P_K, P_K⁆ ≤ U` of
`generatingTuples_nonempty`, whose wild inertia `LocalFieldsRamification.wildInertia K` is built
from the ramification groups of the valuation of `K`. -/
def generatingTuples (U : OpenNormalSubgroup (Field.absoluteGaloisGroup K)) :
    Set (Fin (Module.finrank ℚ_[p] K + 2) → Field.absoluteGaloisGroup K) :=
  {x | Subgroup.closure (Set.range fun i =>
    (QuotientGroup.mk (x i) : Field.absoluteGaloisGroup K ⧸ U.toSubgroup)) = ⊤}

/-- **Step 5b, `X_U` is closed.** Membership depends only on the image in the discrete finite
quotient `(G_K/U)^{N+2}`, and the projection is continuous. -/
theorem isClosed_generatingTuples (U : OpenNormalSubgroup (Field.absoluteGaloisGroup K)) :
    IsClosed (generatingTuples p K U) :=
  sorry

/-- **Step 5b, `X_U` is nonempty** when `⁅P_K, P_K⁆ ≤ U`: lift the tuple of
`exists_generating_tuple_quotient` through the surjection `G_K → G_K/U`. -/
theorem generatingTuples_nonempty (U : OpenNormalSubgroup (Field.absoluteGaloisGroup K))
    (_hU : ⁅LocalFieldsRamification.wildInertia K, LocalFieldsRamification.wildInertia K⁆
      ≤ U.toSubgroup) :
    (generatingTuples p K U).Nonempty :=
  sorry

/-- **Step 5b, the finite-intersection step.** A tuple generating a finer quotient generates a
coarser one, so `X_{U'} ⊆ X_U` for `U' ≤ U`; finitely many admissible `U` are replaced by their
intersection, which is again open, normal and contains `⁅P_K, P_K⁆`. -/
theorem generatingTuples_antitone {U U' : OpenNormalSubgroup (Field.absoluteGaloisGroup K)}
    (_h : U' ≤ U) :
    generatingTuples p K U' ⊆ generatingTuples p K U :=
  sorry

/-- **Step 5b, compactness.** The closed sets `X_U`, over the open normal `U` containing
`⁅P_K, P_K⁆`, have the finite intersection property by the two theorems above, and `G_K^{N+2}` is
compact, so their intersection is nonempty: one tuple works in every quotient. -/
theorem iInter_generatingTuples_nonempty :
    (⋂ U : {U : OpenNormalSubgroup (Field.absoluteGaloisGroup K) //
        ⁅LocalFieldsRamification.wildInertia K, LocalFieldsRamification.wildInertia K⁆
          ≤ U.1.toSubgroup},
      generatingTuples p K U.1).Nonempty :=
  sorry

/-- **Step 5b, passage to the profinite group.** A tuple lying in every `X_U` generates `G_K`
modulo `⁅P_K, P_K⁆`: the closed subgroup it generates together with `⁅P_K, P_K⁆` maps onto every
finite quotient of `G_K/⁅P_K, P_K⁆`, hence is everything. Step 4 then removes the commutator. -/
theorem exists_tuple_generating_mod_wildInertiaCommutator :
    ∃ x : Fin (Module.finrank ℚ_[p] K + 2) → Field.absoluteGaloisGroup K,
      (Subgroup.closure (Set.range x) ⊔
        ⁅LocalFieldsRamification.wildInertia K, LocalFieldsRamification.wildInertia K⁆
        ).topologicalClosure = ⊤ :=
  sorry

/-- The full local absolute Galois group is topologically finitely generated. Steps 4 and 5
combine to give this; it is named separately so that the natural-valued rank accessor is never
applied before its hypothesis is available. -/
theorem isTopologicallyFinitelyGenerated_absoluteGaloisGroup :
    ProfiniteProPGroups.IsTopologicallyFinitelyGenerated (Field.absoluteGaloisGroup K) :=
  sorry

/-- **Step 6, the upper bound** `d(G_K) ≤ N + 2`, from the tuple of
`exists_tuple_generating_mod_wildInertiaCommutator` and the Frattini reduction
`topologicalClosure_eq_top_of_sup_wildInertiaCommutator`. -/
theorem topologicalGeneratorRankNat_absoluteGaloisGroup_le :
    ProfiniteProPGroups.topologicalGeneratorRankNat (Field.absoluteGaloisGroup K)
        (isTopologicallyFinitelyGenerated_absoluteGaloisGroup p K)
      ≤ Module.finrank ℚ_[p] K + 2 :=
  sorry

/-- **Step 6, the lower bound** `N + 2 ≤ d(G_K)`, in both roots-of-unity cases. When `μ_p ⊆ K` it
is the surjection onto `G_K(p)` and Layer 3; when `μ_p ⊄ K` it is the Schreier bound for the open
subgroup `G_L ≤ G_K` with `L = K(μ_p)`, which is exactly where the pro-`p` count `N + 1` fails to
be the count for `G_K`. -/
theorem le_topologicalGeneratorRankNat_absoluteGaloisGroup :
    Module.finrank ℚ_[p] K + 2
      ≤ ProfiniteProPGroups.topologicalGeneratorRankNat (Field.absoluteGaloisGroup K)
          (isTopologicallyFinitelyGenerated_absoluteGaloisGroup p K) :=
  sorry

/-- The exact rank of the full `G_K`, the conjunction of the two bounds above. The result is
`N + 2` in both roots-of-unity cases. -/
theorem rank_absoluteGaloisGroup :
    IsLeast
      {m : ℕ | ∃ s : Finset (Field.absoluteGaloisGroup K), s.card = m ∧
        (Subgroup.closure (s : Set (Field.absoluteGaloisGroup K))).topologicalClosure = ⊤}
      (Module.finrank ℚ_[p] K + 2) :=
  sorry

end FullGroup

/-! ### Step 7: the relation-module sequence on an arbitrary finite Galois layer

NSW (7.4.2)(i): for every finite Galois layer `L/K` and every presentation of `Gal(L/K)` on
`N + 2` generators, `0 → ℤ_p[G] → R^ab_{N+2}(p) → A(L) → 0`. ⚠ **Ordering.** This is a
consequence of the rank theorem, not an input to it, and it is placed after Step 6 for that
reason. NSW derive it from the second assertion of (7.4.1), `N^ab(p) ≅ ℤ_p[[G_K]]` for the
kernel `N` of a presentation `F_{N+2} ↠ G_K`, which exists only once `d(G_K) ≤ N + 2` is known;
Step 5 consumes the tame-frame surjection `exists_relationModule_surjective_of_tameFrame` and
nothing from here. -/

section RelationModuleAfterRank

variable (p : ℕ) [Fact p.Prime] (L : Type u) [Field L] (K : Type u) [Field K] [Algebra K L]
  [Algebra ℚ_[p] L] [Module.Finite ℚ_[p] L] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
  [IsScalarTower ℚ_[p] K L] [IsGalois K L] [FiniteDimensional K L]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [CompactSpace (Field.absoluteGaloisGroup K)]
  [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]

/-- **Step 7, the relation-module surjection on every finite Galois layer** (NSW (7.4.2)(i) at a
finite layer). For every generating family `g` of `Gal(L/K)` of size `N + 2`, the `p`-relation
module of `g` surjects `Gal(L/K)`-equivariantly onto `A(L)` with kernel free of rank one. The
proof, NSW's: by `rank_absoluteGaloisGroup` there is a surjection `π : F_{N+2} ↠ G_K` from the
free profinite group of rank `N + 2`; with `R = π⁻¹(G_L)` and `N = ker π`, the images of the
`N + 2` free generators generate `Gal(L/K)`, and `R^ab(p)` is the relation module of that family
(Lyndon, `relationModule_linearEquiv_abelianizationProP` and
`range_linearCombination_eq_augmentationIdeal`); `R ↠ G_L` induces
`β : R^ab(p) ↠ G_L^ab(p) = A(L)`, whose kernel is the image `N^ab(p)_{G_L}` of `N`, a projective
`ℤ_p[G]`-module (NSW (5.6.7)) with rationalization `ℚ_p[G]` by the dimension count
`ℚ_p ⊕ ℚ_p[G]^{N+1}` (Lyndon) against `ℚ_p[G]^N ⊕ ℚ_p` (the rational decomposition), hence
`ℤ_p[G]` by `linearEquiv_of_projective_of_tensorRat`; and `relationModule_linearEquiv_of_closure`
transports `β` to any other generating family of size `N + 2`. The hypotheses on `K` are those of
`rank_absoluteGaloisGroup`, because the proof consumes it.

⚠ This theorem is **not** an input to Step 5, and the tame-frame surjection of Step 3 is not a
special case of it in the dependency order: Step 5 proves the rank theorem from the tame-frame
surjection, and this theorem is proved from the rank theorem. Using it in Step 5 would be
circular. -/
theorem exists_relationModule_surjective
    (g : Fin (Module.finrank ℚ_[p] K + 2) → (L ≃ₐ[K] L))
    (_hg : Subgroup.closure (Set.range g) = ⊤) :
    ∃ β : ↥(relationModule p (L ≃ₐ[K] L) g) →ₗ[MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)]
        Additive ↥(padicCompletionUnits p L),
      Function.Surjective β ∧
        Nonempty (↥(LinearMap.ker β) ≃ₗ[MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)]
          MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)) :=
  sorry

end RelationModuleAfterRank

/-! ## Layer 8: marked `ℚ₂` acceptance -/

section MarkedRatPadic

variable [IsNonarchimedeanLocalField ℚ_[2]]
  [CompactSpace (Field.absoluteGaloisGroup ℚ_[2])]
  [TotallyDisconnectedSpace (Field.absoluteGaloisGroup ℚ_[2])]
  [TotallyDisconnectedSpace (absoluteGaloisGroupProP 2 ℚ_[2])]

theorem localRootOfUnityOrder_two_ratPadic :
    localRootOfUnityOrder 2 ℚ_[2] (finite_pPowerRootsOfUnity 2 ℚ_[2]) = 2 :=
  sorry

theorem ratPadicTwo_hasPrimitiveRoot :
    ∃ ζ : ℚ_[2], IsPrimitiveRoot ζ 2 :=
  sorry

/-- `ℚ₂` lands in the odd-degree dyadic branch: `q = 2` and `N = 1`. -/
theorem isDyadicOddCase_ratPadic : IsDyadicOddCase ℚ_[2] :=
  sorry

/-- The marked arithmetic identification. `ProfiniteProPGroups` owns `D₀` and its orientation;
this roadmap owns the local isomorphism and its compatibility with the cyclotomic character. -/
theorem absoluteGaloisGroupProP_two_ratPadic_marked :
    ∃ e : absoluteGaloisGroupProP 2 ℚ_[2] ≃ₜ*
        ProfiniteProPGroups.demushkinD0,
      MonoidHom.comp ProfiniteProPGroups.standardD0Orientation e.toMulEquiv.toMonoidHom
          = (cyclotomicOrientation 2 ℚ_[2] ratPadicTwo_hasPrimitiveRoot).toMonoidHom ∧
        Function.Surjective
          (cyclotomicOrientation 2 ℚ_[2] ratPadicTwo_hasPrimitiveRoot) :=
  sorry

theorem absoluteGaloisGroupProP_two_ratPadic :
    Nonempty (absoluteGaloisGroupProP 2 ℚ_[2] ≃ₜ*
      ProfiniteProPGroups.demushkinD0) := by
  obtain ⟨e, -⟩ := absoluteGaloisGroupProP_two_ratPadic_marked
  exact ⟨e⟩

end MarkedRatPadic

/-! ### `ℚ₂(√-2)`: the even-degree `U^[2]` branch

The example exists to detect the loss of Labute's `U^[f]` family: `q = 2` and the rank `4` are
the same as in the `{±1} × U^(f)` branch, and only the image of the orientation separates them.
Every statement below is the corresponding Layer 5–6 theorem at `K = ℚ₂(√-2)`, `N = 2`, `k = 2`,
`u = 3`, `f = 3`; none is a separate classification. -/

section MarkedRatPadicSqrtNegTwo

open Polynomial

/-- `ℚ₂(√-2)`, as the root field of the Eisenstein polynomial `X² + 2`. -/
noncomputable abbrev ratPadicSqrtNegTwoPoly : ℚ_[2][X] := X ^ 2 + C 2

theorem ratPadicSqrtNegTwoPoly_irreducible : Irreducible ratPadicSqrtNegTwoPoly :=
  sorry

instance : Fact (Irreducible ratPadicSqrtNegTwoPoly) := ⟨ratPadicSqrtNegTwoPoly_irreducible⟩

/-- The field `ℚ₂(√-2)`. -/
abbrev RatPadicSqrtNegTwo : Type := AdjoinRoot ratPadicSqrtNegTwoPoly

noncomputable instance : Module.Finite ℚ_[2] RatPadicSqrtNegTwo :=
  (AdjoinRoot.powerBasis (Fact.out : Irreducible ratPadicSqrtNegTwoPoly).ne_zero).finite

/-- The degree is `2`, a closed proof from the power basis; so `N + 2 = 4`. -/
theorem finrank_ratPadicSqrtNegTwo : Module.finrank ℚ_[2] RatPadicSqrtNegTwo = 2 := by
  rw [(AdjoinRoot.powerBasis (Fact.out : Irreducible ratPadicSqrtNegTwoPoly).ne_zero).finrank,
    AdjoinRoot.powerBasis_dim, natDegree_X_pow_add_C]

/-- `q(ℚ₂(√-2)) = 2`: `i ∉ ℚ₂(√-2)`, since `-1` and `-2` differ by the non-square `2`. -/
theorem localRootOfUnityOrder_two_ratPadicSqrtNegTwo :
    localRootOfUnityOrder 2 RatPadicSqrtNegTwo (finite_pPowerRootsOfUnity 2 RatPadicSqrtNegTwo)
      = 2 :=
  sorry

theorem ratPadicSqrtNegTwo_hasPrimitiveRoot :
    ∃ ζ : RatPadicSqrtNegTwo, IsPrimitiveRoot ζ 2 :=
  sorry

/-- **The image of the cyclotomic character is `U^[2] = closure⟨3⟩`.** By
`range_localCyclotomicCharacter` the image is generated by the values on the reciprocity image of
`Kˣ`: the uniformizer `√-2` has norm `2 = 2^{f}` with `f = 1`, so contributes `χ = 1` by
`localCyclotomicCharacter_artinMap_uniformizer`, and the unit norms `a² + 2b²` with `a` odd are
exactly the classes `1, 3 (mod 8)`, whose inverses generate `closure⟨3⟩` by
`localCyclotomicCharacter_artinMap_unit`. The generator `3 = -1 + 2²` is spelled as
`-negThreeUnit`, the negative of the supplier's named unit, so that no second `IsUnit` proof is
introduced. `-1 ∉ closure⟨3⟩`, which is what places `ℚ₂(√-2)` in the principal branch. -/
theorem range_localCyclotomicCharacter_ratPadicSqrtNegTwo :
    (localCyclotomicCharacter 2 RatPadicSqrtNegTwo).range
      = ProfiniteProPGroups.procyclicClosure (-ProfiniteProPGroups.negThreeUnit) :=
  sorry

/-- The generator of the image is `-1 + 2^2`, a closed proof: this is the equation the
principal-branch marked theorem takes as its hypothesis `hu`. -/
theorem negThreeUnit_neg_coe :
    ((-ProfiniteProPGroups.negThreeUnit : ℤ_[2]ˣ) : ℤ_[2]) = -1 + 2 ^ 2 := by
  rw [Units.val_neg, ProfiniteProPGroups.negThreeUnit_coe]; norm_num

/-- `ℚ₂(√-2)` lands in the even-degree principal branch: `q = 2`, `N = 2` is even, and `-1` is not
a value of the orientation. -/
theorem isDyadicEvenPrincipalCase_ratPadicSqrtNegTwo :
    IsDyadicEvenPrincipalCase RatPadicSqrtNegTwo :=
  sorry

/- The local-field and topological instances are needed only by the marked theorem and its
corollary; the arithmetic statements above are purely algebraic and do not carry them. -/
variable [ValuativeRel RatPadicSqrtNegTwo] [TopologicalSpace RatPadicSqrtNegTwo]
  [IsNonarchimedeanLocalField RatPadicSqrtNegTwo]
  [CompactSpace (Field.absoluteGaloisGroup RatPadicSqrtNegTwo)]
  [TotallyDisconnectedSpace (Field.absoluteGaloisGroup RatPadicSqrtNegTwo)]
  [TotallyDisconnectedSpace (absoluteGaloisGroupProP 2 RatPadicSqrtNegTwo)]

/-- **The marked arithmetic identification for `ℚ₂(√-2)`**:
`absoluteGaloisGroupProP_two_marked_of_degree_even_principal` at `N = 2`, `k = 2`, `u = 3`,
`f = 3`, with the relator `x₁⁶(x₁,x₂)x₃⁸(x₃,x₄)` written on `Fin 4`. The generator values
`χ(x₂)(1 + 4) = -1` and `χ(x₄)(1 - 8) = 1` are the marked content; the relator is
Labute-isomorphic to his `x₁⁶(x₁,x₂)(x₃,x₄)`, which is the same group with `f = ∞`. The value
`k = 2` is read off `range_localCyclotomicCharacter_ratPadicSqrtNegTwo` through
`negThreeUnit_neg_coe`, not off `q`. -/
theorem absoluteGaloisGroupProP_two_ratPadicSqrtNegTwo_marked
    [TotallyDisconnectedSpace
      (ProfiniteProPGroups.presentedProP 2 (Fin 4)
        {ProfiniteProPGroups.demushkinWordTwoEven 4 3 4
          (ProfiniteProPGroups.freeProPGen 2 4)})] :
    ∃ e : absoluteGaloisGroupProP 2 RatPadicSqrtNegTwo ≃ₜ*
        ProfiniteProPGroups.presentedProP 2 (Fin 4)
          {ProfiniteProPGroups.demushkinWordTwoEven 4 3 4 (ProfiniteProPGroups.freeProPGen 2 4)},
      ((cyclotomicOrientation 2 RatPadicSqrtNegTwo ratPadicSqrtNegTwo_hasPrimitiveRoot
          (e.symm (ProfiniteProPGroups.presentedProPGen 2 4 _ 1)) : ℤ_[2]) * (1 + 4) = -1) ∧
        ((cyclotomicOrientation 2 RatPadicSqrtNegTwo ratPadicSqrtNegTwo_hasPrimitiveRoot
            (e.symm (ProfiniteProPGroups.presentedProPGen 2 4 _ 3)) : ℤ_[2]) * (1 - 8) = 1) ∧
        cyclotomicOrientation 2 RatPadicSqrtNegTwo ratPadicSqrtNegTwo_hasPrimitiveRoot
            (e.symm (ProfiniteProPGroups.presentedProPGen 2 4 _ 0)) = 1 ∧
        cyclotomicOrientation 2 RatPadicSqrtNegTwo ratPadicSqrtNegTwo_hasPrimitiveRoot
            (e.symm (ProfiniteProPGroups.presentedProPGen 2 4 _ 2)) = 1 :=
  sorry

/-- The unmarked isomorphism, a corollary of the marked theorem and not a separate choice. -/
theorem absoluteGaloisGroupProP_two_ratPadicSqrtNegTwo
    [TotallyDisconnectedSpace
      (ProfiniteProPGroups.presentedProP 2 (Fin 4)
        {ProfiniteProPGroups.demushkinWordTwoEven 4 3 4
          (ProfiniteProPGroups.freeProPGen 2 4)})] :
    Nonempty (absoluteGaloisGroupProP 2 RatPadicSqrtNegTwo ≃ₜ*
      ProfiniteProPGroups.presentedProP 2 (Fin 4)
        {ProfiniteProPGroups.demushkinWordTwoEven 4 3 4
          (ProfiniteProPGroups.freeProPGen 2 4)}) := by
  obtain ⟨e, -⟩ := absoluteGaloisGroupProP_two_ratPadicSqrtNegTwo_marked
  exact ⟨e⟩

end MarkedRatPadicSqrtNegTwo

end TauCetiRoadmap.LocalGaloisGroups
