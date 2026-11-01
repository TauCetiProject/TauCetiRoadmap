import Mathlib
import TauCeti.RepresentationTheory.FDRep
import TauCeti.RepresentationTheory.Simple.Basic
import TauCeti.RepresentationTheory.CharacterTable.ClassFunction
import TauCeti.RepresentationTheory.CharacterTable.Kernel
import TauCeti.RepresentationTheory.Tensor.Power
import TauCeti.RepresentationTheory.CharacterTable.Pairing
import TauCeti.RepresentationTheory.CharacterTable.Completeness
import TauCeti.RepresentationTheory.CharacterTable.Specification
import TauCeti.RepresentationTheory.CharacterTable.Galois
import TauCeti.RepresentationTheory.Induction.Cyclotomic.SplittingField
import TauCeti.RepresentationTheory.CharacterTable.Dixon.Cyclotomic.Solver
import TauCeti.RepresentationTheory.CharacterTable.GL2.PrincipalSeries.Irreducible

/-!
# Character theory of finite groups, and computing character tables: target signatures

**This file is not the roadmap.** The definitive document is `README.md`. This file states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the few definitions needed to state them, and nothing else: the Burnside–Brauer faithful
tensor-generation theorem with its sharp bound and its transport to arbitrary carrier universes,
the generating series of tensor multiplicities with its noncancelling pole, the field of values of
an irreducible character as a fixed field, the comparison of the exact cyclotomic ring with the
ring of integers on the same generator, the exact-coordinate reconstruction of character and
central values with the bound `B_G = |G| · A_e`, strong Dixon primes, the bounded exact
certificate, the completeness of the pinned solver at every strong prime and the termination of
its prime search, the arbitrary-universe irreducibility criterion for the `GL₂` principal series,
and the quartic transverse energy of the two-particle spring.

The regrouping into the native irreducible models and the classification of irreducibles of a
product group are also stated below. Character recognition and the class-indexed `GL₂` table
are consumed from the pinned library, as specified in README.md.
The descended class-power identity is stated by existentially quantifying the `K`-valued row
and tying its image to the native central-character table. Thus it needs no auxiliary table
carrier. The headline statements retained here are all expressible on these pinned carriers.
-/

namespace TauCetiRoadmap.RepresentationTheory.CharacterTheory

open scoped Classical Matrix
open CategoryTheory
open Representation

universe u v w

/-! ## Layer 3: regrouping, product groups and faithful tensor generation -/

/-- The multiplicity of the native `i`-th irreducible model in a finite-dimensional representation,
as the dimension of the space of intertwiners from that model. -/
noncomputable def intrinsicMultiplicity {k : Type u} {G : Type v} {V : Type w}
    [Field k] [Group G] [Finite G] [IsAlgClosed k] [Invertible (Nat.card G : k)]
    [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    (ρ : Representation k G V) (i : Fin (Nat.card (ConjClasses G))) : ℕ :=
  Module.finrank k (Representation.IntertwiningMap (TauCeti.irreducibleRepresentation k i) ρ)

/-- **Regrouping at arbitrary carrier universes.** A finite-dimensional representation over a
split semisimple group algebra is the direct sum of its native irreducible models, with the
multiplicity of each model given by equivariant Hom from it. -/
theorem nonempty_regrouping {k : Type u} {G : Type v} {V : Type w}
    [Field k] [Group G] [Finite G] [IsAlgClosed k] [Invertible (Nat.card G : k)]
    [AddCommGroup V] [Module k V] [FiniteDimensional k V] (ρ : Representation k G V) :
    Nonempty (ρ.asModule ≃ₗ[MonoidAlgebra k G]
      (Π₀ i : Fin (Nat.card (ConjClasses G)),
        Fin (intrinsicMultiplicity ρ i) → (TauCeti.irreducibleRepresentation k i).asModule)) := by
  sorry

/-- The external tensor product: `(g,h)` acts on `v ⊗ w` as `g v ⊗ h w`. -/
noncomputable def externalTensor {k : Type u} {G : Type v} {H : Type w}
    [Field k] [Group G] [Group H] (V : FDRep k G) (W : FDRep k H) : FDRep k (G × H) :=
  FDRep.of (Representation.tprod (V.ρ.comp (MonoidHom.fst G H))
    (W.ρ.comp (MonoidHom.snd G H)))

/-- **Product-group irreducibles.** Every simple representation of `G × H` is an external tensor
product of simple representations, uniquely up to isomorphism of each factor (Fulton–Harris,
Exercise 2.36, p. 24; uniqueness follows from orthogonality). -/
theorem externalTensor_classification {k : Type u} {G : Type v} {H : Type w}
    [Field k] [IsAlgClosed k] [CharZero k] [Group G] [Group H] [Finite G] [Finite H]
    (X : FDRep k (G × H)) [CategoryTheory.Simple X] :
    ∃ V : FDRep k G, ∃ W : FDRep k H,
      CategoryTheory.Simple V ∧ CategoryTheory.Simple W ∧ Nonempty (externalTensor V W ≅ X) ∧
      ∀ (V' : FDRep k G) (W' : FDRep k H), CategoryTheory.Simple V' → CategoryTheory.Simple W' →
        Nonempty (externalTensor V' W' ≅ X) → Nonempty (V' ≅ V) ∧ Nonempty (W' ≅ W) := by
  sorry

section FaithfulTensor

open CategoryTheory

variable {G : Type v} [Group G] [Fintype G]

/-- The finite set `S_U` of values of the character of `U`; no irreducibility or faithfulness of
`U` is assumed. -/
noncomputable def characterValues (U : FDRep ℂ G) : Finset ℂ :=
  Finset.univ.image U.character

/-- `r_U = |S_U|`, the sharp bound of the Burnside–Brauer theorem. -/
noncomputable def characterValueCount (U : FDRep ℂ G) : ℕ := (characterValues U).card

/-- The `n`-fold tensor power `U^⊗n` as an object of `FDRep ℂ G`, with `U^⊗0` the trivial
one-dimensional representation. -/
noncomputable def tensorPowerFDRep (U : FDRep ℂ G) (n : ℕ) : FDRep ℂ G :=
  FDRep.of (Representation.tensorPower U.ρ n)

/-- **Burnside–Brauer.** If `U.ρ` is injective, every simple `X` occurs in one of the first `r_U`
tensor powers of `U`: there is `n < r_U` with `Hom_G(X, U^⊗n) ≠ 0` (Isaacs, Theorem 4.3; Steinberg,
arXiv:1409.7632, Introduction). The zero-dimensional faithful `U` (forcing `G` trivial) is included
at `n = 0`. -/
theorem exists_pos_finrank_hom_tensorPower (U : FDRep ℂ G)
    (hU : Function.Injective U.ρ) (X : FDRep ℂ G) [CategoryTheory.Simple X] :
    ∃ n : ℕ, n < characterValueCount U ∧
      0 < Module.finrank ℂ (X ⟶ tensorPowerFDRep U n) := by
  sorry

/-- Burnside–Brauer for representations on carriers of arbitrary universe, through the pinned
finite model `FDRep.ofShrink`; the value count is that of the shrunken representation. -/
theorem exists_pos_finrank_intertwining_tensorPower
    {V W : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
    (ρ : Representation ℂ G V) (hρ : Function.Injective ρ)
    (σ : Representation ℂ G W) [σ.IsIrreducible] :
    ∃ n : ℕ, n < characterValueCount (FDRep.ofShrink ρ) ∧
      0 < Module.finrank ℂ (Representation.IntertwiningMap σ (ρ.tensorPower n)) := by
  sorry

/-- The generating series `F_X(z) = ∑_n dim Hom_G(X, U^⊗n) zⁿ` of tensor multiplicities. -/
noncomputable def tensorMultiplicitySeries (U X : FDRep ℂ G) : PowerSeries ℂ :=
  PowerSeries.mk fun n ↦ (Module.finrank ℂ (X ⟶ tensorPowerFDRep U n) : ℂ)

/-- **The character-fraction identity**
`F_X(z) = |G|⁻¹ ∑_g χ_X(g⁻¹) · (1 − χ_U(g) z)⁻¹`, each factor inverted as a formal power series
with constant coefficient `1`; the `n`-th coefficient is the pairing `⟨χ_U^n, χ_X⟩`, including
`n = 0` with the convention `χ_U(g)^0 = 1`. -/
theorem tensorMultiplicitySeries_eq_characterFractions (U X : FDRep ℂ G) :
    tensorMultiplicitySeries U X =
      PowerSeries.C ((Fintype.card G : ℂ)⁻¹) *
        ∑ g : G, PowerSeries.C (X.character g⁻¹) *
          (1 - PowerSeries.C (U.character g) * PowerSeries.X)⁻¹ := by
  sorry

/-- **The sharp positive-power bound.** For faithful `U` of positive dimension and simple `X`,
some positive tensor power `U^⊗n` with `n ≤ r_U` contains `X`. The hypothesis `0 < dim U` is
necessary: the zero representation of the trivial group is faithful with all positive tensor
powers zero. -/
theorem exists_positive_tensorPower_le_valueCount (U X : FDRep ℂ G)
    (hU : Function.Injective U.ρ) (hd : 0 < Module.finrank ℂ U.V)
    [CategoryTheory.Simple X] :
    ∃ n : ℕ, 0 < n ∧ n ≤ characterValueCount U ∧
      0 < Module.finrank ℂ (X ⟶ tensorPowerFDRep U n) := by
  sorry

/-- **The noncancelling pole.** For faithful `U` of positive dimension and simple `X`, `F_X` is not
a polynomial: `X` occurs in arbitrarily large tensor powers of `U`. -/
theorem arbitrarily_large_tensorPowers (U X : FDRep ℂ G)
    (hU : Function.Injective U.ρ) (hd : 0 < Module.finrank ℂ U.V)
    [CategoryTheory.Simple X] (B : ℕ) :
    ∃ n : ℕ, B ≤ n ∧ 0 < Module.finrank ℂ (X ⟶ tensorPowerFDRep U n) := by
  sorry

end FaithfulTensor

/-! ## Layer 4: the field of values -/

/-- **The field of values is the fixed field of the stabilizer.** Let `K` be the exponent
cyclotomic field of `G`, embedded in `ℂ`, and `ζ` its distinguished primitive `e`-th root.
`Gal(K/ℚ)` acts on the irreducible complex characters by `(σ · χ)(g) = χ(g ^ j)`, with
`j = autToPow σ` the cyclotomic exponent of `σ`; `H` is the stabilizer of `χ` for that action,
given by its membership condition. The field `ℚ(χ) ⊆ ℂ` generated by the values of `χ` is the
image in `ℂ` of the fixed field of `H` (Isaacs, *Character Theory of Finite Groups*, Chapter 9;
Serre, *Linear Representations of Finite Groups*, §§12.3–12.4). No automorphism of `ℂ` is
chosen. -/
theorem fieldOfValues_eq_map_fixedField_stabilizer {G : Type} [Group G] [Finite G]
    {K : Type} [Field K] [CharZero K] [Algebra K ℂ]
    [IsCyclotomicExtension {Monoid.exponent G} ℚ K]
    {χ : G → ℂ} (hχ : χ ∈ TauCeti.irreducibleCharacters ℂ G) (H : Subgroup Gal(K/ℚ))
    (hH : ∀ σ : Gal(K/ℚ), σ ∈ H ↔ ∀ g : G,
      χ (g ^ ((IsCyclotomicExtension.zeta_spec (Monoid.exponent G) ℚ K).autToPow ℚ σ :
        ZMod (Monoid.exponent G)).val) = χ g) :
    IntermediateField.adjoin ℚ (Set.range χ) =
      IntermediateField.map (algebraMap K ℂ).toRatAlgHom (IntermediateField.fixedField H) :=
  sorry

/-! ## Layer 6: exact reconstruction for the executable solver -/

/-- **The descended class-power identity.** Every native central-character row descends to the
exponent cyclotomic field; an automorphism taking its primitive root to the `b`-th power takes
the value on the class of `g` to that on the class of `g^b`. -/
theorem exists_centralRow_classPower {G : Type v} [Group G] [Fintype G]
    {K : Type} [Field K] [CharZero K] [Algebra K ℂ]
    (e : ℕ) [NeZero e] (he : e = Monoid.exponent G)
    [IsCyclotomicExtension {e} ℚ K] (i : Fin (Nat.card (ConjClasses G))) :
    ∃ w : ConjClasses G → K,
      (∀ C, algebraMap K ℂ (w C) = TauCeti.centralCharacterTable ℂ G i C) ∧
      ∀ (b : ℕ), Nat.Coprime b e → ∀ σ : Gal(K/ℚ),
        σ (IsCyclotomicExtension.zeta e ℚ K) = IsCyclotomicExtension.zeta e ℚ K ^ b →
        ∀ g : G, w (ConjClasses.mk (g ^ b)) = σ (w (ConjClasses.mk g)) := by
  sorry

/-- **The ring-of-integers comparison on the same generator.** For `K = CyclotomicField e ℚ` with
its distinguished primitive root `ζ`, there are a ring isomorphism `E` from the exact ring
`TauCeti.Cyclotomic e` onto `𝓞 K` and a field embedding `ι : K →+* ℂ` with `ι ζ = complexRoot e`,
`E (zeta e) = ζ`, `ι ∘ algebraMap ∘ E = complexEmbedding` on every exact element, and the
coordinates of `E x` in the integral power basis `hζ.integralPowerBasis` (of dimension `φ(e)`)
equal to the native ascending coordinates `x.coeff k`. -/
theorem exists_ringOfIntegers_equiv_integralPowerBasis (e : ℕ) [NeZero e] :
    letI : NeZero (e : ℚ) := ⟨Nat.cast_ne_zero.mpr (NeZero.ne e)⟩
    letI : IsCyclotomicExtension {e} ℚ (CyclotomicField e ℚ) :=
      CyclotomicField.isCyclotomicExtension e ℚ
    let hζ := IsCyclotomicExtension.zeta_spec e ℚ (CyclotomicField e ℚ)
    ∃ (E : TauCeti.Cyclotomic e ≃+* NumberField.RingOfIntegers (CyclotomicField e ℚ))
      (ι : CyclotomicField e ℚ →+* ℂ),
      ι (IsCyclotomicExtension.zeta e ℚ (CyclotomicField e ℚ)) =
          TauCeti.Cyclotomic.complexRoot e ∧
      algebraMap (NumberField.RingOfIntegers (CyclotomicField e ℚ)) (CyclotomicField e ℚ)
          (E (TauCeti.Cyclotomic.zeta e)) =
        IsCyclotomicExtension.zeta e ℚ (CyclotomicField e ℚ) ∧
      (∀ x : TauCeti.Cyclotomic e,
        ι (algebraMap (NumberField.RingOfIntegers (CyclotomicField e ℚ)) (CyclotomicField e ℚ)
          (E x)) = TauCeti.Cyclotomic.complexEmbedding x) ∧
      ∀ (x : TauCeti.Cyclotomic e) (k : Fin e.totient),
        (hζ.integralPowerBasis.basis.repr (E x))
          ((finCongr hζ.integralPowerBasis_dim).symm k) = x.coeff k.val := by
  sorry

/-- **An integral element of `ℚ(ζ_e) ⊆ ℂ` is exact.** An algebraic integer `z ∈ ℂ` lying in
`ℚ(complexRoot e)` is the image of an element of the exact ring; integrality in `ℂ` alone is not an
exact value. -/
theorem exists_exact_of_integral_mem_cyclotomic (e : ℕ) [NeZero e] (z : ℂ)
    (hz : IsIntegral ℤ z)
    (hmem : z ∈ Algebra.adjoin ℚ ({TauCeti.Cyclotomic.complexRoot e} : Set ℂ)) :
    ∃ w : TauCeti.Cyclotomic e, TauCeti.Cyclotomic.complexEmbedding w = z := by
  sorry

/-- `A_e`: the largest absolute value of a canonical coordinate of a power `zeta e ^ j`, `j < e`,
and at least `1`. The descending stored list is read through the ascending `coeff` API. -/
def canonicalPowerBound (e : ℕ) : ℕ :=
  max 1 (((Finset.univ : Finset (Fin e)).product
    (Finset.univ : Finset (Fin e.totient))).sup fun jk =>
      ((TauCeti.Cyclotomic.zeta e ^ jk.1.val).coeff jk.2.val).natAbs)

/-- `B_G = |G| · A_e`, the bound on every canonical coordinate of every central-character value. -/
def centralCoefficientBound (G : Type v) [Fintype G] (e : ℕ) : ℕ :=
  Fintype.card G * canonicalPowerBound e

/-- **Eigenvalue multiplicities in the exact ring.** For `e` the exponent of `G`, `V : FDRep ℂ G`
and `g ∈ G`, the eigenvalues of `V.ρ g` are powers of `complexRoot e` with multiplicities `m_j`
summing to `dim V`; the exact element `∑ m_j (zeta e)^j` has complex image `χ_V(g)` and every
canonical coordinate bounded by `dim V · A_e`. The zero representation is included. -/
theorem exists_eigenvalue_multiplicities {G : Type v} [Group G] [Fintype G]
    (e : ℕ) [NeZero e] (he : e = Monoid.exponent G) (V : FDRep ℂ G) (g : G) :
    ∃ m : Fin e → ℕ, (∑ j, m j = Module.finrank ℂ V.V) ∧
      TauCeti.Cyclotomic.complexEmbedding
          (∑ j, (m j : TauCeti.Cyclotomic e) * TauCeti.Cyclotomic.zeta e ^ j.val) =
        V.character g ∧
      ∀ k : Fin e.totient,
        ((∑ j, (m j : TauCeti.Cyclotomic e) * TauCeti.Cyclotomic.zeta e ^ j.val).coeff
          k.val).natAbs ≤ Module.finrank ℂ V.V * canonicalPowerBound e := by
  sorry

/-- **Exact ordinary and central values, the division-free identity and the bound.** For every
row `i` of the pinned table and class `C` there are exact `x, w` with images the ordinary entry
`χᵢ(C)` and the central entry `ωᵢ(K_C)`, with `dᵢ · w = |C| · x` in the exact ring and every
coordinate of `w` bounded by `|C| · A_e ≤ B_G`. No division inside the integral ring and no bound
read off complex absolute values is used. -/
theorem exists_exact_character_and_central_values {G : Type v} [Group G] [Fintype G]
    [DecidableEq G] (e : ℕ) [NeZero e] (he : e = Monoid.exponent G)
    (i : Fin (Nat.card (ConjClasses G))) (C : ConjClasses G) :
    ∃ x w : TauCeti.Cyclotomic e,
      TauCeti.Cyclotomic.complexEmbedding x = TauCeti.characterTable ℂ G i C ∧
      TauCeti.Cyclotomic.complexEmbedding w = TauCeti.centralCharacterTable ℂ G i C ∧
      (TauCeti.characterDegree ℂ i : TauCeti.Cyclotomic e) * w =
        (Nat.card C.carrier : TauCeti.Cyclotomic e) * x ∧
      (∀ k : Fin e.totient,
        (w.coeff k.val).natAbs ≤ Nat.card C.carrier * canonicalPowerBound e) ∧
      (∀ k : Fin e.totient, (w.coeff k.val).natAbs ≤ centralCoefficientBound G e) := by
  sorry

/-- **The bounded exact certificate.** From the pinned table, an exact certificate in the numbering
of `d : ClassData G` satisfying the exact specification, whose complex image is the labeled table
and all of whose central coordinates are bounded by `B_G`. -/
theorem exists_bounded_exact_character_table {G : Type v} [Group G] [Fintype G]
    [DecidableEq G] (d : TauCeti.ClassData G) (e : ℕ) [NeZero e] (he : e = Monoid.exponent G) :
    ∃ out : d.CyclotomicCharacterTableData e,
      d.IsCyclotomicCharacterTableSpec e out.omega out.table out.degree ∧
      d.complexTableOfCyclotomic e out.table = TauCeti.characterTable ℂ G ∧
      (∀ i k (j : Fin e.totient),
        ((out.omega i k).coeff j.val).natAbs ≤ centralCoefficientBound G e) := by
  sorry

/-- **Strong Dixon primes exist.** A pinned `DixonPrimeData` (a good Dixon prime with a primitive
modular `e`-th root) whose prime exceeds `2 · B_G`, from `Nat.exists_prime_gt_modEq_one`. -/
theorem exists_strongDixonPrime {G : Type v} [Group G] [Fintype G]
    (e : ℕ) (he : e = Monoid.exponent G) :
    ∃ q : TauCeti.DixonPrimeData G, 2 * centralCoefficientBound G e < q.p := by
  sorry

/-- **Completeness of the pinned solver at every strong prime**: the bounded certificate and the
pinned conditional completeness theorem give `some` whenever `2 · B_G < p`. -/
theorem characterTableDixon_isSome {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    (d : TauCeti.ClassData G) (e : ℕ) [NeZero e] (he : e = Monoid.exponent G)
    (q : TauCeti.DixonPrimeData G) (hq : 2 * centralCoefficientBound G e < q.p) :
    (d.dixonCyclotomicCharacterTable? e he q).isSome = true := by
  sorry

/-- **Termination of the prime search.** Some finite budget makes the pinned search
`characterTableDixon?` succeed; this is a totality theorem, not success-conditional soundness. -/
theorem characterTableDixonSearch_eventually_some {G : Type v} [Group G] [Fintype G]
    [DecidableEq G] (d : TauCeti.ClassData G) (e : ℕ) (he : e = Monoid.exponent G) :
    ∃ fuel : ℕ, (d.characterTableDixon? e he fuel).isSome = true := by
  sorry

/-! ## Layer 9: the principal series of `GL₂(𝔽_q)` at arbitrary universes -/

/-- **Irreducibility of the principal series**, `Ind_B(α ⊗ β)` simple iff `α ≠ β`, for a finite
field in an arbitrary universe; the pinned `TauCeti.simple_GL2PrincipalSeries_iff` is the case
`F : Type`, and the route is transport along a small model. -/
theorem simple_GL2PrincipalSeries_iff (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (α β : Fˣ →* ℂˣ) :
    CategoryTheory.Simple (TauCeti.GL2PrincipalSeries F α β) ↔ α ≠ β := sorry

/-! ## Layer 11: the transverse zero mode of the two-particle spring -/

/-- The exact length `ℓ(ε) = √(1 + 4ε²)` of the spring at the transverse displacement
`u₁ = (0, ε)`, `u₂ = (0, −ε)`, with rest length `1`. -/
noncomputable def transverseLength (ε : ℝ) : ℝ := Real.sqrt (1 + 4 * ε ^ 2)

/-- The exact potential `E(ε) = (κ/2)(ℓ(ε) − 1)²` of that displacement. -/
noncomputable def transverseEnergy (κ ε : ℝ) : ℝ := κ / 2 * (transverseLength ε - 1) ^ 2

/-- **The quartic leading term.** `E(ε)/ε⁴ → 2κ` as `ε → 0` through `ε ≠ 0`: the linearized
force vanishes on the transverse mode while the exact potential is quartic, which is the
limitation of the linear approximation. The puncture is necessary, since the quotient is `0` at
`ε = 0`. -/
theorem transverseEnergy_quartic (κ : ℝ) :
    Filter.Tendsto (fun ε : ℝ => transverseEnergy κ ε / ε ^ 4)
      (nhdsWithin 0 {0}ᶜ) (nhds (2 * κ)) := by
  sorry

end TauCetiRoadmap.RepresentationTheory.CharacterTheory
