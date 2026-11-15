module

import Mathlib
import TauCeti.RepresentationTheory.CharacterTable.Table
import TauCeti.RepresentationTheory.Induction.ClassFunction
import TauCeti.RingTheory.Idempotents.Primitive.Basic

/-!
# Modular characters and blocks, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with the four definitions
they need.

The coprime-action strand (README Layers 1–5) is stated over `ℂ` with the native
`TauCeti.irreducibleCharacters`, Mathlib's `MulDistribMulAction`, `FixedPoints.subgroup` and
`SemidirectProduct`: the canonical extension and its values, Gallagher's correspondence, the count
of invariant characters, the `p`-group characterisation of the correspondent, the existence and
uniqueness of the Glauberman family, its value formula for a cyclic acting group through the
canonical extension, and its constituent, field-of-values and degree laws. The definitions are
the invariant irreducible characters `invariantIrreducibleCharacters` and the defining laws
`IsGlaubermanFamily` of the Glauberman family.

The block strand (README Layers 6–8) is stated for an arbitrary splitting `p`-modular system: a
complete discrete valuation ring `O` with fraction field `K = FractionRing O` of characteristic
zero containing a primitive `exp(G)`-th root of unity and residue field of characteristic `p`. A
block is a primitive idempotent of the centre of `O[G]`; its ordinary characters
(`blockCharacters`) are the characters of the irreducible `K`-representations on which it acts as
the identity, and its defect groups (`IsBlockDefectGroup`) are those of its reduction modulo the
maximal ideal, the maximal `p`-subgroups `P` on whose centraliser the reduction has a nonzero
coefficient. The headlines are Brauer's theorem on heights, the Fong–Reynolds correspondence,
Reynolds' height formula and Reynolds' theorem.

Every headline theorem of the roadmap is statable at the pins. Three propositions of the README
are definitions whose general validity the roadmap cites and does not prove, so they are not
stated here: Glauberman degree-divisibility (README §5.2, Hartley–Turull and Geck), Brauer's
height zero property and the Alperin–McKay property (README Layer 9, Kessar–Malle,
Malle–Navarro–Schaeffer Fry–Tiep, Ruhstorfer); their proved instances are the theorems below.
-/

namespace TauCetiRoadmap.ModularCharactersAndBlocksPartII

universe u v

/-! ## Layer 1: coprime actions on characters -/

/-- The **invariant irreducible characters** `Irr_S(Γ)`: the complex irreducible characters `χ`
of `Γ` with `χ(s • g) = χ(g)` for all `s ∈ S` and `g ∈ Γ`, the fixed points of the action
`(s · χ)(g) = χ(s⁻¹ • g)` of `S` on characters (Glauberman 1968, §1). -/
def invariantIrreducibleCharacters (S Γ : Type*) [Group S] [Group Γ]
    [MulDistribMulAction S Γ] : Set (Γ → ℂ) :=
  {χ | χ ∈ TauCeti.irreducibleCharacters ℂ Γ ∧ ∀ (s : S) (g : Γ), χ (s • g) = χ g}

/-! ## Layer 2: the canonical extension and Gallagher's correspondence -/

/-- **The canonical extension.** For `S` acting on `Γ` with `|S|` prime to `|Γ|` and an
`S`-invariant irreducible character `χ` of `Γ`, there is exactly one irreducible character `ψ`
of `Γ ⋊ S` extending `χ` that is afforded by a representation whose determinant is `1` on `S`
(Glauberman 1968, Theorem 2 (a); Hartley–Turull 1994, Definition 3.1). No solvability of `S` is
assumed. -/
theorem existsUnique_canonicalExtension {Γ : Type u} {S : Type v} [Group Γ] [Group S]
    [Finite Γ] [Finite S] [MulDistribMulAction S Γ] (hcop : (Nat.card S).Coprime (Nat.card Γ))
    {χ : Γ → ℂ} (hχ : χ ∈ invariantIrreducibleCharacters S Γ) :
    ∃! ψ : Γ ⋊[MulDistribMulAction.toMulAut S Γ] S → ℂ,
      ψ ∈ TauCeti.irreducibleCharacters ℂ (Γ ⋊[MulDistribMulAction.toMulAut S Γ] S) ∧
      ψ ∘ SemidirectProduct.inl = χ ∧
      ∃ (n : ℕ) (ρ : Representation ℂ (Γ ⋊[MulDistribMulAction.toMulAut S Γ] S) (Fin n → ℂ)),
        ρ.character = ψ ∧ ∀ s : S, LinearMap.det (ρ (SemidirectProduct.inr s)) = 1 := sorry

/-- **Values of the canonical extension.** The canonical extension `ψ` of `χ` has the same field
of values as `χ`, and its values on `S` are rational integers (Glauberman 1968, Theorem 2 (b)). -/
theorem canonicalExtension_values {Γ : Type u} {S : Type v} [Group Γ] [Group S] [Finite Γ]
    [Finite S] [MulDistribMulAction S Γ] (hcop : (Nat.card S).Coprime (Nat.card Γ))
    {χ : Γ → ℂ} (hχ : χ ∈ invariantIrreducibleCharacters S Γ)
    {ψ : Γ ⋊[MulDistribMulAction.toMulAut S Γ] S → ℂ}
    (hψ : ψ ∈ TauCeti.irreducibleCharacters ℂ (Γ ⋊[MulDistribMulAction.toMulAut S Γ] S))
    (hψχ : ψ ∘ SemidirectProduct.inl = χ)
    (hdet : ∃ (n : ℕ) (ρ : Representation ℂ (Γ ⋊[MulDistribMulAction.toMulAut S Γ] S)
      (Fin n → ℂ)), ρ.character = ψ ∧ ∀ s : S, LinearMap.det (ρ (SemidirectProduct.inr s)) = 1) :
    IntermediateField.adjoin ℚ (Set.range ψ) = IntermediateField.adjoin ℚ (Set.range χ) ∧
      ∀ s : S, ∃ z : ℤ, ψ (SemidirectProduct.inr s) = z := sorry

/-- **Gallagher's correspondence.** If an irreducible character `η` of `G` restricts to the
irreducible character `θ` of `N ⊴ G`, then `β ↦ η · (β ∘ π)` is a bijection from the irreducible
characters of `G ⧸ N` onto the irreducible characters `χ` of `G` lying over `θ`, those with
`Σ_{n ∈ N} χ(n) θ(n⁻¹) ≠ 0` (Glauberman 1968, Theorem 2 (c); Isaacs, Corollary 6.17). -/
theorem gallagher_bijOn {G : Type u} [Group G] [Finite G] (N : Subgroup G) [N.Normal]
    {θ : N → ℂ} (hθ : θ ∈ TauCeti.irreducibleCharacters ℂ N) {η : G → ℂ}
    (hη : η ∈ TauCeti.irreducibleCharacters ℂ G) (hηθ : η ∘ N.subtype = θ) :
    Set.BijOn (fun (β : G ⧸ N → ℂ) (g : G) ↦ η g * β (QuotientGroup.mk g))
      (TauCeti.irreducibleCharacters ℂ (G ⧸ N))
      {χ | χ ∈ TauCeti.irreducibleCharacters ℂ G ∧ ∑ᶠ n : N, χ n * θ n⁻¹ ≠ 0} := sorry

/-! ## Layer 4: the solvable case -/

/-- **Brauer's permutation lemma for a coprime solvable action.** For a solvable `S` acting on
`Γ` with `|S|` prime to `|Γ|`, the number of `S`-invariant irreducible characters of `Γ` equals
the number of irreducible characters of `C_Γ(S)` and the number of `S`-invariant conjugacy
classes of `Γ` (Glauberman 1968, Corollary 9). -/
theorem ncard_invariantIrreducibleCharacters {Γ : Type u} {S : Type v} [Group Γ] [Group S]
    [Finite Γ] [Finite S] [MulDistribMulAction S Γ] [Group.IsSolvable S]
    (hcop : (Nat.card S).Coprime (Nat.card Γ)) :
    (invariantIrreducibleCharacters S Γ).ncard =
        (TauCeti.irreducibleCharacters ℂ (FixedPoints.subgroup S Γ)).ncard ∧
      (invariantIrreducibleCharacters S Γ).ncard =
        {c : ConjClasses Γ | ∀ (s : S) (g : Γ), ConjClasses.mk g = c →
          ConjClasses.mk (s • g) = c}.ncard := sorry

/-- **The `p`-group case.** For a `p`-group `S` acting on `Γ` with `|S|` prime to `|Γ|` and an
`S`-invariant irreducible character `χ` of `Γ`, exactly one irreducible character `ψ` of
`C = C_Γ(S)` has multiplicity `[χ|_C, ψ]` prime to `p`, and every multiplicity prime to `p` is
`≡ ±1 (mod p)` (Glauberman 1968, Theorem 4 (a) with Corollary 8; Isaacs, Chapter 13). -/
theorem existsUnique_restrict_pairing_not_dvd {Γ : Type u} {S : Type v} [Group Γ] [Group S]
    [Finite Γ] [Finite S] [MulDistribMulAction S Γ] {p : ℕ} [Fact p.Prime] (hS : IsPGroup p S)
    (hcop : (Nat.card S).Coprime (Nat.card Γ)) {χ : Γ → ℂ}
    (hχ : χ ∈ invariantIrreducibleCharacters S Γ) :
    (∃! ψ : FixedPoints.subgroup S Γ → ℂ,
      ψ ∈ TauCeti.irreducibleCharacters ℂ (FixedPoints.subgroup S Γ) ∧
      ∃ m : ℕ, ¬ p ∣ m ∧ (Nat.card (FixedPoints.subgroup S Γ) : ℂ)⁻¹ *
        ∑ᶠ t : FixedPoints.subgroup S Γ, χ t * ψ t⁻¹ = m) ∧
    ∀ ψ ∈ TauCeti.irreducibleCharacters ℂ (FixedPoints.subgroup S Γ), ∀ m : ℕ,
      (Nat.card (FixedPoints.subgroup S Γ) : ℂ)⁻¹ *
        ∑ᶠ t : FixedPoints.subgroup S Γ, χ t * ψ t⁻¹ = m →
      ¬ p ∣ m → m ≡ 1 [MOD p] ∨ m + 1 ≡ 0 [MOD p] := sorry

/-- The defining laws of the **Glauberman family**. A family `π` assigns to every group `Γ`, every
group `S` and every action of `S` on `Γ` a map from functions on `Γ` to functions on `C_Γ(S)`.
It is a Glauberman family when, for every finite solvable `S` acting on a finite `Γ` with `|S|`
prime to `|Γ|`:
* `π Γ S` maps `Irr_S(Γ)` bijectively onto the irreducible characters of `C_Γ(S)`;
* when `S` is a `p`-group, `π Γ S χ` occurs in `χ|_{C_Γ(S)}` with multiplicity prime to `p`;
* for every normal subgroup `T` of `S` and `χ ∈ Irr_S(Γ)`, the character `π Γ T χ` of `C_Γ(T)` is
  invariant under `S ⧸ T`, and `π (C_Γ(T)) (S ⧸ T) (π Γ T χ)` agrees with `π Γ S χ` at elements
  of `C_{C_Γ(T)}(S ⧸ T)` and `C_Γ(S)` with the same image in `Γ`.
Values off `Irr_S(Γ)` and for nonsolvable or noncoprime pairs are unconstrained (Glauberman 1968,
Theorem 4 and Corollaries 7–8; Späth–Vallejo 2016 for the compatibility law). -/
def IsGlaubermanFamily
    (π : ∀ (Γ : Type u) (S : Type v) [Group Γ] [Group S] [MulDistribMulAction S Γ],
      (Γ → ℂ) → FixedPoints.subgroup S Γ → ℂ) : Prop :=
  ∀ (Γ : Type u) (S : Type v) [Group Γ] [Group S] [Finite Γ] [Finite S]
    [MulDistribMulAction S Γ], Group.IsSolvable S → (Nat.card S).Coprime (Nat.card Γ) →
      Set.BijOn (π Γ S) (invariantIrreducibleCharacters S Γ)
          (TauCeti.irreducibleCharacters ℂ (FixedPoints.subgroup S Γ)) ∧
        (∀ p : ℕ, p.Prime → IsPGroup p S → ∀ χ ∈ invariantIrreducibleCharacters S Γ,
          ∃ m : ℕ, ¬ p ∣ m ∧ (Nat.card (FixedPoints.subgroup S Γ) : ℂ)⁻¹ *
            ∑ᶠ t : FixedPoints.subgroup S Γ, χ t * π Γ S χ t⁻¹ = m) ∧
        ∀ (T : Subgroup S) [T.Normal], ∀ χ ∈ invariantIrreducibleCharacters S Γ,
          π Γ T χ ∈ invariantIrreducibleCharacters (S ⧸ T) (FixedPoints.subgroup T Γ) ∧
          ∀ (x : FixedPoints.subgroup (S ⧸ T) (FixedPoints.subgroup T Γ))
            (y : FixedPoints.subgroup S Γ), ((x : FixedPoints.subgroup T Γ) : Γ) = y →
              π (FixedPoints.subgroup T Γ) (S ⧸ T) (π Γ T χ) x = π Γ S χ y

/-- **The Glauberman correspondence exists**: Glauberman's composition-series construction is a
Glauberman family (Glauberman 1968, Theorem 4 and Corollaries 7–8). -/
theorem exists_isGlaubermanFamily : ∃ π, IsGlaubermanFamily.{u, v} π := sorry

/-- **The Glauberman correspondence is unique**: two Glauberman families agree on `Irr_S(Γ)` for
every finite solvable `S` acting coprimely on a finite `Γ` (Navarro 2018, Chapter 2; proved by
induction through a normal subgroup of prime index). -/
theorem IsGlaubermanFamily.apply_eq
    {π π' : ∀ (Γ : Type u) (S : Type v) [Group Γ] [Group S] [MulDistribMulAction S Γ],
      (Γ → ℂ) → FixedPoints.subgroup S Γ → ℂ}
    (hπ : IsGlaubermanFamily π) (hπ' : IsGlaubermanFamily π') (Γ : Type u) (S : Type v)
    [Group Γ] [Group S] [Finite Γ] [Finite S] [MulDistribMulAction S Γ] [Group.IsSolvable S]
    (hcop : (Nat.card S).Coprime (Nat.card Γ)) {χ : Γ → ℂ}
    (hχ : χ ∈ invariantIrreducibleCharacters S Γ) : π Γ S χ = π' Γ S χ := sorry

/-- **The Glauberman correspondent is a constituent**: `θ*` occurs in `θ|_{C_Γ(S)}`
(Glauberman 1968, Theorem 5 (d)). -/
theorem IsGlaubermanFamily.restrict_pairing_ne_zero
    {π : ∀ (Γ : Type u) (S : Type v) [Group Γ] [Group S] [MulDistribMulAction S Γ],
      (Γ → ℂ) → FixedPoints.subgroup S Γ → ℂ}
    (hπ : IsGlaubermanFamily π) (Γ : Type u) (S : Type v)
    [Group Γ] [Group S] [Finite Γ] [Finite S] [MulDistribMulAction S Γ] [Group.IsSolvable S]
    (hcop : (Nat.card S).Coprime (Nat.card Γ)) {χ : Γ → ℂ}
    (hχ : χ ∈ invariantIrreducibleCharacters S Γ) :
    ∑ᶠ t : FixedPoints.subgroup S Γ, χ t * π Γ S χ t⁻¹ ≠ 0 := sorry

/-- **Fields of values are preserved**: `ℚ(θ*) = ℚ(θ)` as subfields of `ℂ` (Glauberman 1968,
Theorem 5 (c)). -/
theorem IsGlaubermanFamily.adjoin_range_eq
    {π : ∀ (Γ : Type u) (S : Type v) [Group Γ] [Group S] [MulDistribMulAction S Γ],
      (Γ → ℂ) → FixedPoints.subgroup S Γ → ℂ}
    (hπ : IsGlaubermanFamily π) (Γ : Type u) (S : Type v)
    [Group Γ] [Group S] [Finite Γ] [Finite S] [MulDistribMulAction S Γ] [Group.IsSolvable S]
    (hcop : (Nat.card S).Coprime (Nat.card Γ)) {χ : Γ → ℂ}
    (hχ : χ ∈ invariantIrreducibleCharacters S Γ) :
    IntermediateField.adjoin ℚ (Set.range (π Γ S χ)) = IntermediateField.adjoin ℚ (Set.range χ) :=
  sorry

/-- **The cyclic case.** For a cyclic `S` with generator `a`, the canonical extension `ψ` of
`χ ∈ Irr_S(Γ)` and the Glauberman correspondent `χ*` satisfy `ψ(a t) = ε χ*(t)` for all
`t ∈ C_Γ(S)`, for a sign `ε = ±1` (Glauberman 1968, Theorem 3 and Theorem 4 (b)). -/
theorem IsGlaubermanFamily.exists_sign_of_isCyclic
    {π : ∀ (Γ : Type u) (S : Type v) [Group Γ] [Group S] [MulDistribMulAction S Γ],
      (Γ → ℂ) → FixedPoints.subgroup S Γ → ℂ}
    (hπ : IsGlaubermanFamily π) (Γ : Type u) (S : Type v)
    [Group Γ] [Group S] [Finite Γ] [Finite S] [MulDistribMulAction S Γ]
    (hcop : (Nat.card S).Coprime (Nat.card Γ)) {a : S} (ha : ∀ s : S, s ∈ Subgroup.zpowers a)
    {χ : Γ → ℂ} (hχ : χ ∈ invariantIrreducibleCharacters S Γ)
    {ψ : Γ ⋊[MulDistribMulAction.toMulAut S Γ] S → ℂ}
    (hψ : ψ ∈ TauCeti.irreducibleCharacters ℂ (Γ ⋊[MulDistribMulAction.toMulAut S Γ] S))
    (hψχ : ψ ∘ SemidirectProduct.inl = χ)
    (hdet : ∃ (n : ℕ) (ρ : Representation ℂ (Γ ⋊[MulDistribMulAction.toMulAut S Γ] S)
      (Fin n → ℂ)), ρ.character = ψ ∧ ∀ s : S, LinearMap.det (ρ (SemidirectProduct.inr s)) = 1) :
    ∃ ε : ℤ, (ε = 1 ∨ ε = -1) ∧ ∀ t : FixedPoints.subgroup S Γ,
      ψ (SemidirectProduct.inr a * SemidirectProduct.inl (t : Γ)) = ε * π Γ S χ t := sorry

/-! ## Layer 5: degree relations -/

/-- **The degree bound**: `θ(1)` divides `|Γ : C_Γ(S)| θ*(1)` (Glauberman 1968,
Theorem 5 (e)). -/
theorem IsGlaubermanFamily.index_mul_degree_eq
    {π : ∀ (Γ : Type u) (S : Type v) [Group Γ] [Group S] [MulDistribMulAction S Γ],
      (Γ → ℂ) → FixedPoints.subgroup S Γ → ℂ}
    (hπ : IsGlaubermanFamily π) (Γ : Type u) (S : Type v)
    [Group Γ] [Group S] [Finite Γ] [Finite S] [MulDistribMulAction S Γ] [Group.IsSolvable S]
    (hcop : (Nat.card S).Coprime (Nat.card Γ)) {χ : Γ → ℂ}
    (hχ : χ ∈ invariantIrreducibleCharacters S Γ) :
    ∃ q : ℕ, ((FixedPoints.subgroup S Γ).index : ℂ) * π Γ S χ 1 = q * χ 1 := sorry

/-! ## Layer 6: heights -/

/-- `P` is a **defect group** of `e ∈ k[G]`: a `p`-subgroup on whose centraliser `e` has a
nonzero coefficient (the Brauer projection `Br_P(e)` is nonzero), maximal with this property
(Sambale 2014, Definition 1.4). For a block idempotent these are its defect groups. -/
def IsBlockDefectGroup {G k : Type*} [Group G] [Field k] (p : ℕ) (e : MonoidAlgebra k G)
    (P : Subgroup G) : Prop :=
  IsPGroup p P ∧ (∃ g ∈ Subgroup.centralizer (P : Set G), e.coeff g ≠ 0) ∧
    ∀ Q : Subgroup G, IsPGroup p Q → P ≤ Q →
      (∃ g ∈ Subgroup.centralizer (Q : Set G), e.coeff g ≠ 0) → Q = P

/-- The **ordinary characters of a block**: for `b ∈ O[G]`, the characters of the irreducible
representations of `G` over the fraction field `K` of `O`, on coordinate spaces `Fin n → K`, on
which the image of `b` in `K[G]` acts as the identity. For a block idempotent `b` this is
`Irr(B)`. -/
def blockCharacters {G O : Type*} [Group G] [CommRing O] [IsDomain O] (b : MonoidAlgebra O G) :
    Set (G → FractionRing O) :=
  {χ | ∃ (n : ℕ) (ρ : Representation (FractionRing O) G (Fin n → FractionRing O)),
    ρ.IsIrreducible ∧ ρ.character = χ ∧
      ρ.asAlgebraHom (MonoidAlgebra.mapRingHom G (algebraMap O (FractionRing O)) b) = 1}

/-- **Brauer's theorem on heights.** Let `O` be a complete discrete valuation ring whose fraction
field has characteristic zero and contains a primitive `exp(G)`-th root of unity, with residue
field of characteristic `p`, and let `b` be a block idempotent of `O[G]` whose reduction has
defect group `D`. With `|G|_p = p^a` and `|D| = p^d`, every ordinary character of the block has
degree divisible by `p^{a−d}`, and some has degree of `p`-adic valuation exactly `a − d`
(Martínez 2024, Theorem 3.4; Navarro 1998, Chapter 3). -/
theorem brauer_height {G : Type u} {O : Type v} [Group G] [Finite G] [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [CharZero O]
    {ζ : FractionRing O} (hζ : IsPrimitiveRoot ζ (Monoid.exponent G)) {p : ℕ} [Fact p.Prime]
    [CharP (IsLocalRing.ResidueField O) p] (b : Subalgebra.center O (MonoidAlgebra O G))
    (hb : TauCeti.IsPrimitiveIdempotent b) {D : Subgroup G}
    (hD : IsBlockDefectGroup p (MonoidAlgebra.mapRingHom G (IsLocalRing.residue O) b) D) :
    (∀ χ ∈ blockCharacters (b : MonoidAlgebra O G), ∃ n : ℕ, χ 1 = n ∧
      p ^ (padicValNat p (Nat.card G) - padicValNat p (Nat.card D)) ∣ n) ∧
    ∃ χ ∈ blockCharacters (b : MonoidAlgebra O G), ∃ n : ℕ, χ 1 = n ∧
      padicValNat p n = padicValNat p (Nat.card G) - padicValNat p (Nat.card D) := sorry

/-! ## Layer 7: blocks and normal subgroups -/

/-- **The Fong–Reynolds correspondence.** Over a splitting `p`-modular system, let `b` be a block
of `N ⊴ G`, `T` its stabiliser (the `g` commuting with `b` in `O[G]`) and `B` a block of `T`
covering `b`. Then some block `B'` of `G` covers `b`, induction from `T` to `G` maps the ordinary
characters of `B` bijectively onto those of `B'`, and every defect group of `B` is a defect group
of `B'`; with `ψ^G(1) = |G : T| ψ(1)` this preserves heights (Martínez 2024, Theorem 7.12;
Reynolds 1963, Theorem 1). -/
theorem fongReynolds {G : Type u} {O : Type v} [Group G] [Finite G] [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [CharZero O]
    {ζ : FractionRing O} (hζ : IsPrimitiveRoot ζ (Monoid.exponent G)) {p : ℕ} [Fact p.Prime]
    [CharP (IsLocalRing.ResidueField O) p] (N : Subgroup G) [N.Normal]
    (b : Subalgebra.center O (MonoidAlgebra O N)) (hb : TauCeti.IsPrimitiveIdempotent b)
    (T : Subgroup G) (hNT : N ≤ T)
    (hT : ∀ g : G, g ∈ T ↔ MonoidAlgebra.of O G g *
        MonoidAlgebra.mapDomain N.subtype (b : MonoidAlgebra O N) =
      MonoidAlgebra.mapDomain N.subtype (b : MonoidAlgebra O N) * MonoidAlgebra.of O G g)
    (B : Subalgebra.center O (MonoidAlgebra O T)) (hB : TauCeti.IsPrimitiveIdempotent B)
    (hBb : (B : MonoidAlgebra O T) *
      MonoidAlgebra.mapDomain (Subgroup.inclusion hNT) (b : MonoidAlgebra O N) ≠ 0) :
    ∃ B' : Subalgebra.center O (MonoidAlgebra O G), TauCeti.IsPrimitiveIdempotent B' ∧
      (B' : MonoidAlgebra O G) * MonoidAlgebra.mapDomain N.subtype (b : MonoidAlgebra O N) ≠ 0 ∧
      Set.BijOn (Subgroup.indClassFun T) (blockCharacters (B : MonoidAlgebra O T))
        (blockCharacters (B' : MonoidAlgebra O G)) ∧
      ∀ D : Subgroup T,
        IsBlockDefectGroup p (MonoidAlgebra.mapRingHom T (IsLocalRing.residue O) B) D →
          IsBlockDefectGroup p (MonoidAlgebra.mapRingHom G (IsLocalRing.residue O) B')
            (D.map T.subtype) := sorry

/-- **The Fong–Reynolds correspondence is bijective on blocks.** In the situation of
`fongReynolds`, every block `B'` of `G` covering `b` receives, under induction from `T`, the
ordinary characters of exactly one block `B` of `T` covering `b` (Martínez 2024,
Theorem 7.12 (i)). -/
theorem existsUnique_fongReynolds {G : Type u} {O : Type v} [Group G] [Finite G] [CommRing O]
    [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [CharZero O] {ζ : FractionRing O} (hζ : IsPrimitiveRoot ζ (Monoid.exponent G)) {p : ℕ}
    [Fact p.Prime] [CharP (IsLocalRing.ResidueField O) p] (N : Subgroup G) [N.Normal]
    (b : Subalgebra.center O (MonoidAlgebra O N)) (hb : TauCeti.IsPrimitiveIdempotent b)
    (T : Subgroup G) (hNT : N ≤ T)
    (hT : ∀ g : G, g ∈ T ↔ MonoidAlgebra.of O G g *
        MonoidAlgebra.mapDomain N.subtype (b : MonoidAlgebra O N) =
      MonoidAlgebra.mapDomain N.subtype (b : MonoidAlgebra O N) * MonoidAlgebra.of O G g)
    (B' : Subalgebra.center O (MonoidAlgebra O G)) (hB' : TauCeti.IsPrimitiveIdempotent B')
    (hB'b : (B' : MonoidAlgebra O G) *
      MonoidAlgebra.mapDomain N.subtype (b : MonoidAlgebra O N) ≠ 0) :
    ∃! B : Subalgebra.center O (MonoidAlgebra O T), TauCeti.IsPrimitiveIdempotent B ∧
      (B : MonoidAlgebra O T) *
        MonoidAlgebra.mapDomain (Subgroup.inclusion hNT) (b : MonoidAlgebra O N) ≠ 0 ∧
      Set.MapsTo (Subgroup.indClassFun T) (blockCharacters (B : MonoidAlgebra O T))
        (blockCharacters (B' : MonoidAlgebra O G)) := sorry

/-! ## Layer 8: blocks with a normal defect group -/

/-- **Reynolds' height formula.** Over a splitting `p`-modular system, if the block `b` of `O[G]`
has a normal defect group `D`, `|G|_p = p^a` and `|D| = p^d`, then the heights
`ν_p(χ(1)) − (a − d)` of its ordinary characters are exactly the numbers `ν_p(ξ(1))` for the
irreducible characters `ξ` of `D` (Reynolds 1963, Theorem 8; Martínez 2024, Corollary 8.12 for
the block of `D C_G(D)`, carried to `G` in the proof of Theorem 9.8). -/
theorem reynolds_heights {G : Type u} {O : Type v} [Group G] [Finite G] [CommRing O]
    [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [CharZero O] {ζ : FractionRing O} (hζ : IsPrimitiveRoot ζ (Monoid.exponent G)) {p : ℕ}
    [Fact p.Prime] [CharP (IsLocalRing.ResidueField O) p]
    (b : Subalgebra.center O (MonoidAlgebra O G)) (hb : TauCeti.IsPrimitiveIdempotent b)
    {D : Subgroup G} [D.Normal]
    (hD : IsBlockDefectGroup p (MonoidAlgebra.mapRingHom G (IsLocalRing.residue O) b) D) :
    {h : ℕ | ∃ χ ∈ blockCharacters (b : MonoidAlgebra O G), ∃ n : ℕ, χ 1 = n ∧
        h = padicValNat p n - (padicValNat p (Nat.card G) - padicValNat p (Nat.card D))} =
      {h : ℕ | ∃ ξ ∈ TauCeti.irreducibleCharacters ℂ D, ∃ m : ℕ, ξ 1 = m ∧
        h = padicValNat p m} := sorry

/-- **Reynolds' theorem**, Brauer's height zero conjecture for a normal defect group. Over a
splitting `p`-modular system, if the block `b` of `O[G]` has a normal defect group `D`, then
every ordinary character of the block has height zero exactly when `D` is abelian (Reynolds 1963,
Theorem 9; Martínez 2024, Theorem 9.8). -/
theorem reynolds {G : Type u} {O : Type v} [Group G] [Finite G] [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [CharZero O]
    {ζ : FractionRing O} (hζ : IsPrimitiveRoot ζ (Monoid.exponent G)) {p : ℕ} [Fact p.Prime]
    [CharP (IsLocalRing.ResidueField O) p] (b : Subalgebra.center O (MonoidAlgebra O G))
    (hb : TauCeti.IsPrimitiveIdempotent b) {D : Subgroup G} [D.Normal]
    (hD : IsBlockDefectGroup p (MonoidAlgebra.mapRingHom G (IsLocalRing.residue O) b) D) :
    (∀ χ ∈ blockCharacters (b : MonoidAlgebra O G), ∃ n : ℕ, χ 1 = n ∧
      padicValNat p n = padicValNat p (Nat.card G) - padicValNat p (Nat.card D)) ↔
      IsMulCommutative D := sorry

end TauCetiRoadmap.ModularCharactersAndBlocksPartII
