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
are genuine objects owned here: the specialization `G_K(p)`, the intrinsic set of `p`-power roots
of unity, and the local cyclotomic character and its descent.
-/

namespace TauCetiRoadmap.LocalGaloisGroups

universe u

open ValuativeRel
open scoped Classical TauCetiRoadmap.ProfiniteProPGroups

/-! ## Layer 0: arithmetic carriers -/

/-- The maximal pro-`p` quotient `G_K(p)` of the absolute Galois group of `K`. This is a reducible
specialization of the supplier's carrier, not a second construction. -/
abbrev absoluteGaloisGroupProP (p : ℕ) (K : Type u) [Field K] : Type u :=
  ProfiniteProPGroups.maximalProPQuotient p (Field.absoluteGaloisGroup K)

/-- The roots of unity in `K` whose order divides some power of `p`, as an intrinsic subtype. -/
abbrev pPowerRootsOfUnity (p : ℕ) (K : Type u) [Field K] : Type u :=
  {x : K // ∃ n : ℕ, x ^ (p ^ n) = 1}

/-- The local roots-of-unity invariant: the number of `p`-power roots of unity in `K`. -/
noncomputable def localRootOfUnityOrder (p : ℕ) (K : Type u) [Field K] : ℕ :=
  Nat.card (pPowerRootsOfUnity p K)

/-- The `p`-adic cyclotomic character of the local absolute Galois group. -/
noncomputable def localCyclotomicCharacter (p : ℕ) [Fact p.Prime] (K : Type u) [Field K] :
    Field.absoluteGaloisGroup K →* ℤ_[p]ˣ :=
  sorry

theorem localCyclotomicCharacter_continuous (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] :
    Continuous (localCyclotomicCharacter p K) :=
  sorry

theorem localRootOfUnityOrder_isPow (p : ℕ) [Fact p.Prime] (K : Type u) [Field K]
    [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    ∃ n : ℕ, localRootOfUnityOrder p K = p ^ n :=
  sorry

theorem primitiveRoot_iff_dvd_localRootOfUnityOrder (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    (∃ ζ : K, IsPrimitiveRoot ζ p) ↔ p ∣ localRootOfUnityOrder p K :=
  sorry

/-! ### Closed checks on the arithmetic supplier contract

These statements add no new interface. They apply the exact final supplier declarations so that
renaming or changing a carrier breaks this file rather than silently creating a replacement. -/

section SupplierChecks

variable (p : ℕ) [Fact p.Prime] (K : Type u) [Field K]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]

example (n : ℕ) (hn : n ≠ 0) :
    Nat.card (Kˣ ⧸ (powMonoidHom n : Kˣ →* Kˣ).range)
      = n * Nat.card (rootsOfUnity n K)
        * Nat.card (↥𝒪[K] ⧸ Ideal.span {(n : ↥𝒪[K])}) :=
  LocalFieldsRamification.card_powerClasses_mixed K p n hn

noncomputable example (n : ℕ) (hn : n ≠ 0) :
    Additive (Kˣ ⧸ (powMonoidHom n : Kˣ →* Kˣ).range) ≃+
      ClassFieldTheory.H n K 1 (ClassFieldTheory.muNRep n K) :=
  ClassFieldTheory.kummerEquiv_mixed p K n hn

example (n : ℕ) (hn : n ≠ 0) :
    Nonempty (ClassFieldTheory.H n K 2 (ClassFieldTheory.muNRep n K) ≃+ ZMod n) :=
  ClassFieldTheory.h2MuEquivZMod_mixed p K n hn

end SupplierChecks

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

/-! ## Layer 5: `q` and the cyclotomic orientation -/

theorem demushkinQ_absoluteGaloisGroupProP
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    ProfiniteProPGroups.demushkinQ
        (isDemushkin_absoluteGaloisGroupProP_of_mu p K hmu)
      = localRootOfUnityOrder p K :=
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

theorem cyclotomicOrientation_hasPrescriptionProperty
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    ProfiniteProPGroups.HasPrescriptionProperty (cyclotomicOrientation p K hmu) :=
  sorry

theorem demushkinCharacter_absoluteGaloisGroupProP
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p) :
    ProfiniteProPGroups.demushkinCharacter
        (isDemushkin_absoluteGaloisGroupProP_of_mu p K hmu)
      = cyclotomicOrientation p K hmu :=
  sorry

end LocalField

/-! ## Layer 6: marked local presentations -/

section MarkedPresentations

variable (p : ℕ) [Fact p.Prime] (K : Type) [Field K]
  [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]
  [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [CompactSpace (Field.absoluteGaloisGroup K)]
  [TotallyDisconnectedSpace (Field.absoluteGaloisGroup K)]
  [TotallyDisconnectedSpace (absoluteGaloisGroupProP p K)]

/-- The arithmetic `q != 2` marked normal form. -/
theorem absoluteGaloisGroupProP_marked_of_q_ne_two
    (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p)
    (hq : localRootOfUnityOrder p K ≠ 2)
    (hn : 2 ≤ Module.finrank ℚ_[p] K + 2)
    [TotallyDisconnectedSpace
      (ProfiniteProPGroups.presentedProP p (Fin (Module.finrank ℚ_[p] K + 2))
        {ProfiniteProPGroups.demushkinWordNeTwo (localRootOfUnityOrder p K)
          (Module.finrank ℚ_[p] K + 2)
          (ProfiniteProPGroups.freeProPGen p (Module.finrank ℚ_[p] K + 2))})] :
    ∃ e : absoluteGaloisGroupProP p K ≃ₜ*
        ProfiniteProPGroups.presentedProP p (Fin (Module.finrank ℚ_[p] K + 2))
          {ProfiniteProPGroups.demushkinWordNeTwo (localRootOfUnityOrder p K)
            (Module.finrank ℚ_[p] K + 2)
            (ProfiniteProPGroups.freeProPGen p (Module.finrank ℚ_[p] K + 2))},
      ((cyclotomicOrientation p K hmu
          (e.symm (ProfiniteProPGroups.presentedProPGen p
            (Module.finrank ℚ_[p] K + 2) _ 1)) : ℤ_[p])
          * (1 - (localRootOfUnityOrder p K : ℤ_[p])) = 1) ∧
        ∀ i : ℕ, i ≠ 1 → i < Module.finrank ℚ_[p] K + 2 →
          cyclotomicOrientation p K hmu
            (e.symm (ProfiniteProPGroups.presentedProPGen p
              (Module.finrank ℚ_[p] K + 2) _ i)) = 1 :=
  sorry

/-- The arithmetic odd-rank dyadic marked normal form, with `f=2`. -/
theorem absoluteGaloisGroupProP_two_marked_of_degree_odd
    (hp : p = 2) (hmu : ∃ ζ : K, IsPrimitiveRoot ζ p)
    (hq : localRootOfUnityOrder p K = 2)
    (hodd : Odd (Module.finrank ℚ_[p] K))
    [TotallyDisconnectedSpace
      (ProfiniteProPGroups.presentedProP p (Fin (Module.finrank ℚ_[p] K + 2))
        {ProfiniteProPGroups.demushkinWordTwoOdd 2 (Module.finrank ℚ_[p] K + 2)
          (ProfiniteProPGroups.freeProPGen p (Module.finrank ℚ_[p] K + 2))})] :
    ∃ e : absoluteGaloisGroupProP p K ≃ₜ*
        ProfiniteProPGroups.presentedProP p (Fin (Module.finrank ℚ_[p] K + 2))
          {ProfiniteProPGroups.demushkinWordTwoOdd 2 (Module.finrank ℚ_[p] K + 2)
            (ProfiniteProPGroups.freeProPGen p (Module.finrank ℚ_[p] K + 2))},
      cyclotomicOrientation p K hmu
          (e.symm (ProfiniteProPGroups.presentedProPGen p
            (Module.finrank ℚ_[p] K + 2) _ 0)) = -1 ∧
        ((cyclotomicOrientation p K hmu
            (e.symm (ProfiniteProPGroups.presentedProPGen p
              (Module.finrank ℚ_[p] K + 2) _ 2)) : ℤ_[p]) * (1 - 2 ^ 2) = 1) ∧
        ∀ i : ℕ, i ≠ 0 → i ≠ 2 → i < Module.finrank ℚ_[p] K + 2 →
          cyclotomicOrientation p K hmu
            (e.symm (ProfiniteProPGroups.presentedProPGen p
              (Module.finrank ℚ_[p] K + 2) _ i)) = 1 :=
  sorry

end MarkedPresentations

/-! ## Layer 7: the full absolute Galois group -/

/-- The full local absolute Galois group is topologically finitely generated. The proof uses the
tame frame and the completed multiplicative relation module, not the `H¹` counts alone. -/
theorem isTopologicallyFinitelyGenerated_absoluteGaloisGroup (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    ProfiniteProPGroups.IsTopologicallyFinitelyGenerated (Field.absoluteGaloisGroup K) :=
  sorry

/-- The exact rank of the full `G_K`. The result is `N+2` in both roots-of-unity cases. -/
theorem rank_absoluteGaloisGroup (p : ℕ) [Fact p.Prime]
    (K : Type u) [Field K] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] :
    IsLeast
      {m : ℕ | ∃ s : Finset (Field.absoluteGaloisGroup K), s.card = m ∧
        (Subgroup.closure (s : Set (Field.absoluteGaloisGroup K))).topologicalClosure = ⊤}
      (Module.finrank ℚ_[p] K + 2) :=
  sorry

/-! ## Layer 8: marked `ℚ₂` acceptance -/

section MarkedRatPadic

variable [IsNonarchimedeanLocalField ℚ_[2]]
  [CompactSpace (Field.absoluteGaloisGroup ℚ_[2])]
  [TotallyDisconnectedSpace (Field.absoluteGaloisGroup ℚ_[2])]
  [TotallyDisconnectedSpace (absoluteGaloisGroupProP 2 ℚ_[2])]

theorem localRootOfUnityOrder_two_ratPadic :
    localRootOfUnityOrder 2 ℚ_[2] = 2 :=
  sorry

theorem ratPadicTwo_hasPrimitiveRoot :
    ∃ ζ : ℚ_[2], IsPrimitiveRoot ζ 2 :=
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
