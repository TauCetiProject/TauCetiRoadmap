import Mathlib
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
-/

namespace TauCetiRoadmap.LocalGaloisGroups

universe u

open ValuativeRel
open scoped Classical TensorProduct TauCetiRoadmap.ProfiniteProPGroups

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
**definition with a body**, so no second cyclotomic normalization can be introduced by accident. -/
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
of silently changing the marked relator of Layer 6. -/
theorem localCyclotomicCharacter_artinMap_unit (u : Fˣ)
    (hu : ValuativeRel.valuation F (u : F) = 1) (σ : Field.absoluteGaloisGroup F)
    (hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization F)
      = ClassFieldTheory.artinMap F u) :
    Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom (localCyclotomicCharacter p F σ)
      = (Units.map (Algebra.norm ℚ_[p] : F →* ℚ_[p]) u)⁻¹ :=
  ClassFieldTheory.cyclotomicCharacter_artinMap p F u hu σ hσ

/-- The `ℚ_p` specialization, again as a closed proof. Together with the theorem above this pins
the sign of the exponent: with the geometric normalization the right-hand side would be `u`. -/
theorem localCyclotomicCharacter_artinMap_padic [IsNonarchimedeanLocalField ℚ_[p]] (u : ℤ_[p]ˣ)
    (σ : Field.absoluteGaloisGroup ℚ_[p])
    (hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization ℚ_[p])
      = ClassFieldTheory.artinMap ℚ_[p] (Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom u)) :
    localCyclotomicCharacter p ℚ_[p] σ = u⁻¹ :=
  ClassFieldTheory.cyclotomicCharacter_artinMap_padic p u σ hσ

/-- **The uniformizer half of the comparison**, and the second generator of the orientation image.
For a uniformizer `π` of `F` with residue degree `f = f(F/ℚ_p)`,
`χ_cyc(Art_F(π)) · N_{F/ℚ_p}(π) = p^f`.

The `ℚ_p` case is `χ_cyc(Art_{ℚ_p}(p)) = 1`, which holds because `p` is the norm of `1 - ζ` from
`ℚ_p(ζ)` for `ζ` a primitive `p^n`-th root — Mathlib's `Polynomial.eval_one_cyclotomic_prime_pow`
evaluated at `1` — so `Art_{ℚ_p}(p)` lies in the norm group of `ℚ_p(μ_{p^n})` for every `n` and
acts trivially on `μ_{p^∞}`. The general `F` follows by norm functoriality of the Artin map.

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

/-- The degree-two comparison is an isomorphism. Surjectivity splits into the `μ_p` and
`¬μ_p` cases described in the roadmap. -/
noncomputable def inflH2AbsoluteGaloisProP (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [CompactSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (absoluteGaloisGroupProP p K)] :
    ProfiniteProPGroups.cohomFp p (absoluteGaloisGroupProP p K) 2 ≃ₗ[ZMod p]
      ProfiniteProPGroups.cohomFp p (Field.absoluteGaloisGroup K) 2 :=
  sorry

theorem cohomFp_two_subsingleton_of_not_mu (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
    [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    [CompactSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]
    [TotallyDisconnectedSpace (absoluteGaloisGroupProP p K)]
    (_hmu : ¬ ∃ ζ : K, IsPrimitiveRoot ζ p) :
    Subsingleton (ProfiniteProPGroups.cohomFp p (absoluteGaloisGroupProP p K) 2) :=
  sorry

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

/-- The full cyclotomic character descended to `G_K(p)` under the roots-of-unity hypothesis
that kills its prime-to-`p` mod-`p` component. No unconditional full orientation is exported. -/
noncomputable def cyclotomicOrientation
    (_hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    absoluteGaloisGroupProP p K →* ℤ_[p]ˣ :=
  sorry

theorem cyclotomicOrientation_mk (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p)
    (g : Field.absoluteGaloisGroup K) :
    cyclotomicOrientation p K hmu (QuotientGroup.mk g) = localCyclotomicCharacter p K g :=
  sorry

theorem cyclotomicOrientation_continuous (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    Continuous (cyclotomicOrientation p K hmu) :=
  sorry

/-- The orientation and the character have the same image, because the quotient map is surjective.
This is the theorem that transports `range_localCyclotomicCharacter` to `G_K(p)`, and it is
what the Layer 6 branch predicates are stated against. -/
theorem cyclotomicOrientation_range (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    (cyclotomicOrientation p K hmu).range = (localCyclotomicCharacter p K).range :=
  sorry

theorem cyclotomicOrientation_hasPrescriptionProperty
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    ProfiniteProPGroups.HasPrescriptionProperty (cyclotomicOrientation p K hmu) :=
  sorry

/-- The orientation extracted from the dualizing module is the descended cyclotomic character.
This equation and `localCyclotomicCharacter_artinMap_unit` are the two halves of the comparison:
the first identifies the abstract orientation with `χ_cyc`, the second computes `χ_cyc` from local
reciprocity with the arithmetic-Frobenius normalization and the inverse. -/
theorem demushkinCharacter_absoluteGaloisGroupProP
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    ProfiniteProPGroups.demushkinCharacter
        (isDemushkin_absoluteGaloisGroupProP_of_mu p K hmu)
      = cyclotomicOrientation p K hmu :=
  sorry

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
input that fixes the parameter `f = 2` in the marked theorem below; it is proved from
`range_localCyclotomicCharacter` and the two evaluation theorems, not read off `q`. -/
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

/-- The even-degree marked normal form, in both branches: the supplier's even relator applies with
the parameters `a` and `f` read off the orientation image by the two theorems above. The
`TotallyDisconnectedSpace` hypothesis is bound inside the statement because the relator, and hence
the presented group, depends on the parameters produced by the existential. -/
theorem absoluteGaloisGroupProP_two_marked_of_degree_even
    (_hmu : ∃ ζ : K, IsPrimitiveRoot ζ 2)
    (_hcase : IsDyadicEvenPlusMinusCase K ∨ IsDyadicEvenPrincipalCase K) :
    ∃ a f : ℕ, 2 ≤ f ∧ 4 ∣ a ∧
      ∀ _ : TotallyDisconnectedSpace
        (ProfiniteProPGroups.presentedProP 2 (Fin (Module.finrank ℚ_[2] K + 2))
          {ProfiniteProPGroups.demushkinWordTwoEven a f (Module.finrank ℚ_[2] K + 2)
            (ProfiniteProPGroups.freeProPGen 2 (Module.finrank ℚ_[2] K + 2))}),
        Nonempty (absoluteGaloisGroupProP 2 K ≃ₜ*
          ProfiniteProPGroups.presentedProP 2 (Fin (Module.finrank ℚ_[2] K + 2))
            {ProfiniteProPGroups.demushkinWordTwoEven a f (Module.finrank ℚ_[2] K + 2)
              (ProfiniteProPGroups.freeProPGen 2 (Module.finrank ℚ_[2] K + 2))}) :=
  sorry

end DyadicMarkedPresentations

/-! ## Layer 7: the completed multiplicative module and the rank of the full `G_K`

The rank theorem for the full absolute Galois group does **not** follow from a rational
representation-theoretic identity. `A(L) ⊗ ℚ_p ≅ ℚ_p[G]^N ⊕ ℚ_p` determines no minimal number of
*integral* topological generators, and the chain below is the integral one: the completed module
as an honest `ℤ_p[Gal(L/K)]`-lattice, its torsion, the two cancellation theorems that detect an
integral isomorphism from finite-level data, the relative Frattini reduction along wild inertia,
the passage from finite quotients to the profinite group, and the matching of the two bounds.
Each step is a named declaration.

⚠ Everything in this section lives over a **finite Galois layer** `L/K`. The group algebra is
Mathlib's `MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)`; the supplier's `completedGroupAlgebra` is the
profinite object and is deliberately not used here, because the cancellation theorems below are
theorems about a finite group algebra over a complete discrete valuation ring. -/

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

/-- `A(L)` is a `ℤ_p`-module: it is an abelian pro-`p` group. -/
noncomputable instance padicCompletionUnitsPadicModule :
    Module ℤ_[p] (Additive ↥(padicCompletionUnits p L)) :=
  sorry

/-- The `ℤ_p`-action extends the intrinsic `ℕ`-action, so it is not a second addition. -/
theorem padicCompletionUnits_natCast_smul (n : ℕ)
    (x : Additive ↥(padicCompletionUnits p L)) :
    (n : ℤ_[p]) • x = n • x :=
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

/-- **Step 1, finiteness of the lattice.** `A(L)` is a finitely generated `ℤ_p[Gal(L/K)]`-module.
Every cancellation theorem below has this as a hypothesis and none of them holds without it. -/
theorem padicCompletionUnits_module_finite [Algebra ℚ_[p] L] [Module.Finite ℚ_[p] L]
    [Finite (L ≃ₐ[K] L)] :
    Module.Finite (MonoidAlgebra ℤ_[p] (L ≃ₐ[K] L)) (Additive ↥(padicCompletionUnits p L)) :=
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

/-- **Step 2, the free quotient.** Modulo torsion, `A(L)` is a free `ℤ_p`-module of rank
`[L : ℚ_p] + 1`: the `[L : ℚ_p]` comes from the principal units and the `1` from the valuation.
Stated as an explicit isomorphism with `ℤ_p^{N+1}` rather than as a `finrank` equation, because
`Module.finrank` is `0` on a module that is not finite free and would hide exactly the failure it
is meant to exclude. -/
theorem padicCompletionUnits_quotient_torsion_equiv
    [Algebra ℚ_[p] L] [Module.Finite ℚ_[p] L] :
    Nonempty (Additive (↥(padicCompletionUnits p L) ⧸
        CommGroup.torsion ↥(padicCompletionUnits p L))
      ≃+ (Fin (Module.finrank ℚ_[p] L + 1) → ℤ_[p])) :=
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

/-- The rationalization of `A(L)` is a `ℚ_p[Gal(L/K)]`-module. Declared so that the rational
decomposition below can be stated **equivariantly**; a merely `ℚ_p`-linear isomorphism would be a
dimension count and would carry none of the representation-theoretic content Step 3 acts on. -/
noncomputable instance padicCompletionUnitsRatModule :
    Module (MonoidAlgebra ℚ_[p] (L ≃ₐ[K] L))
      (ℚ_[p] ⊗[ℤ_[p]] Additive ↥(padicCompletionUnits p L)) :=
  sorry

/-- The trivial `ℚ_p[G]`-module `ℚ_p`, written as the quotient of the group algebra by its
augmentation ideal so that no second module structure has to be installed on `ℚ_[p]` itself. This
is the summand of the rational decomposition that comes from the valuation. -/
noncomputable abbrev trivialRatModule (p : ℕ) [Fact p.Prime] (G : Type u) [Group G] : Type u :=
  MonoidAlgebra ℚ_[p] G ⧸
    Ideal.span (Set.range fun g : G => MonoidAlgebra.single g (1 : ℚ_[p]) - 1)

/-- **The rational decomposition (NSW (7.4.4)(i)).** `A(L) ⊗ ℚ_p ≅ ℚ_p[G]^N ⊕ ℚ_p` as
`ℚ_p[Gal(L/K)]`-modules, from the `p`-adic logarithm on the deep units and the normal basis
theorem.

⚠ This theorem is an **input**, not the conclusion of Layer 7. A `ℚ_p[G]`-isomorphism says nothing
about the minimal number of generators of the integral module: `ℤ_p[G]`-modules with isomorphic
rationalizations need not be isomorphic — `ℤ_p` and `ℤ_p ⊕ ℤ/p` already differ, and they need
different numbers of generators — and the point of Steps 3-4 is to supply the missing integral
information. -/
theorem padicCompletionUnits_tensor_ratPadic
    [Algebra ℚ_[p] L] [Module.Finite ℚ_[p] L] [Finite (L ≃ₐ[K] L)]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    Nonempty ((ℚ_[p] ⊗[ℤ_[p]] Additive ↥(padicCompletionUnits p L))
      ≃ₗ[MonoidAlgebra ℚ_[p] (L ≃ₐ[K] L)]
      ((Fin (Module.finrank ℚ_[p] K) → MonoidAlgebra ℚ_[p] (L ≃ₐ[K] L)) ×
        trivialRatModule p (L ≃ₐ[K] L))) :=
  sorry

end RelationModule

/-! ### Step 3: integral cancellation over `ℤ_p[G]`

These two theorems are the only place where an integral conclusion is extracted from rational or
finite-level data, and they are the reason a rational decomposition is not enough. They are
statements about the group algebra of a finite group over the complete discrete valuation ring
`ℤ_p` — Krull–Schmidt–Azumaya cancellation, and the detection of projectives by their reduction —
and this roadmap owns them: no supplier in the dependency list has integral representation theory
over a complete discrete valuation ring. -/

section IntegralCancellation

variable (p : ℕ) [Fact p.Prime] (G : Type u) [Group G] [Finite G]

/-- **Krull–Schmidt cancellation over `ℤ_p[G]`** (NSW (5.6.10)(i)). Finitely generated modules
over the group algebra of a finite group over a complete discrete valuation ring cancel. ⚠ The
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

/-- **Projectives are detected modulo `p`** (NSW (5.6.10)(iii)). Two finitely generated projective
`ℤ_p[G]`-modules with isomorphic reductions are isomorphic. With cancellation, this is what
upgrades a rational identity to an integral one. -/
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

end IntegralCancellation

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

This is the step that turns a relation-module computation about `G_K/⁅P_K, P_K⁆` into a generation
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

/-- **Step 4, the tame frame.** The tame quotient is topologically finitely generated, by the
supplier's Iwasawa presentation `σ τ σ⁻¹ τ^{−q}` on the free profinite group of rank `2`. -/
theorem isTopologicallyFinitelyGenerated_tameQuotient :
    ProfiniteProPGroups.IsTopologicallyFinitelyGenerated
      (LocalFieldsRamification.tameQuotient K) :=
  sorry

/-- **Step 4, the tame frame is two generators.** The `2` of `N + 2`. -/
theorem topologicalGeneratorRankNat_tameQuotient_le_two :
    ProfiniteProPGroups.topologicalGeneratorRankNat (LocalFieldsRamification.tameQuotient K)
        (isTopologicallyFinitelyGenerated_tameQuotient p K) ≤ 2 :=
  sorry

/-- **Step 5a, the finite level.** Every finite continuous quotient of `G_K` through which the
commutator subgroup of wild inertia dies is generated by `N + 2` elements. This is where the
relation-module chain is used: `2` generators come from the tame frame and `N` from the free
`ℤ_p[G]`-summand that Steps 1–3 extract from the rational decomposition. -/
theorem exists_finset_card_generating_quotient
    (U : OpenNormalSubgroup (Field.absoluteGaloisGroup K))
    (_hU : ⁅LocalFieldsRamification.wildInertia K, LocalFieldsRamification.wildInertia K⁆
      ≤ U.toSubgroup) :
    ∃ s : Finset (Field.absoluteGaloisGroup K ⧸ U.toSubgroup),
      s.card = Module.finrank ℚ_[p] K + 2 ∧
        Subgroup.closure (s : Set (Field.absoluteGaloisGroup K ⧸ U.toSubgroup)) = ⊤ :=
  sorry

/-- **Step 5b, passage to the profinite group.** The compatible finite generating tuples of Step
5a assemble, by compactness, into `N + 2` elements of `G_K` that generate it modulo
`⁅P_K, P_K⁆`. -/
theorem exists_finset_generating_mod_wildInertiaCommutator :
    ∃ s : Finset (Field.absoluteGaloisGroup K),
      s.card = Module.finrank ℚ_[p] K + 2 ∧
        (Subgroup.closure (s : Set (Field.absoluteGaloisGroup K)) ⊔
          ⁅LocalFieldsRamification.wildInertia K, LocalFieldsRamification.wildInertia K⁆
          ).topologicalClosure = ⊤ :=
  sorry

/-- The full local absolute Galois group is topologically finitely generated. Steps 4 and 5
combine to give this; it is named separately so that the natural-valued rank accessor is never
applied before its hypothesis is available. -/
theorem isTopologicallyFinitelyGenerated_absoluteGaloisGroup :
    ProfiniteProPGroups.IsTopologicallyFinitelyGenerated (Field.absoluteGaloisGroup K) :=
  sorry

/-- **Step 6, the upper bound** `d(G_K) ≤ N + 2`. -/
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
          = cyclotomicOrientation 2 ℚ_[2] ratPadicTwo_hasPrimitiveRoot ∧
        Function.Surjective
          (cyclotomicOrientation 2 ℚ_[2] ratPadicTwo_hasPrimitiveRoot) :=
  sorry

theorem absoluteGaloisGroupProP_two_ratPadic :
    Nonempty (absoluteGaloisGroupProP 2 ℚ_[2] ≃ₜ*
      ProfiniteProPGroups.demushkinD0) := by
  obtain ⟨e, -⟩ := absoluteGaloisGroupProP_two_ratPadic_marked
  exact ⟨e⟩

end MarkedRatPadic

end TauCetiRoadmap.LocalGaloisGroups
