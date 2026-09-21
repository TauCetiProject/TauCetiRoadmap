import Mathlib
import TauCetiRoadmap.ArithmeticDirichletSeries.Suggested
import TauCetiRoadmap.GlobalNumberFields.Suggested
import TauCetiRoadmap.NumberFieldArithmetic.Suggested

/-!
# The Chebotarev density theorem: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These declarations pin the carriers, names, and regression tests most likely to drift.

The imports are load-bearing. Arithmetic Dirichlet Series owns prime sums, density, summation, and
Wiener--Ikehara; Global Number Fields owns ray classes and their counting input; Number Field
Arithmetic owns `artinSymbol` and its restriction and tower laws. No opaque copy of one of those
declarations appears here.

Some signatures use `sorry`, as roadmap prototypes may. The transport of `artinSymbol` itself is
required by the README to be a closed definition once the supplier imports are staged.

Two clusters here exist because the mathematics is easy to get wrong rather than because the
names are likely to drift. `exists_auxiliaryPrime` and `irreducible_cyclotomic_of_unramified` pin
the fact that the auxiliary prime's *unramifiedness*, not the intersection `L ⊓ K(ζ_q) = ⊥`, is
what gives `[K(ζ_q) : K] = q - 1`. The Layer 11.3 estimates and `fixedFieldThetaDegOne_eq` pin the
fact that the weighted asymptotic crosses between number fields only through `ϑ` at residue degree
one, and is not a corollary of the prime-set crossing.
-/

namespace TauCetiRoadmap.Chebotarev

open Asymptotics Complex Filter NumberField Topology
open IsDedekindDomain (HeightOneSpectrum)
open scoped nonZeroDivisors

namespace ConjClasses

/-- **Layer 1, power of a conjugacy class.** It is the class containing `σ ^ j` for `σ ∈ C`.
Powering commutes with conjugation, so this does not depend on the representative. -/
noncomputable def pow {G : Type*} [Monoid G] (C : ConjClasses G) (j : ℕ) : ConjClasses G :=
  sorry

theorem mem_pow_iff {G : Type*} [Monoid G] (C : ConjClasses G) (j : ℕ) (τ : G) :
    τ ∈ (pow C j).carrier ↔ ∃ σ ∈ C.carrier, σ ^ j = τ := sorry

@[simp] theorem pow_zero {G : Type*} [Monoid G] (C : ConjClasses G) : pow C 0 = 1 := sorry

@[simp] theorem pow_one {G : Type*} [Monoid G] (C : ConjClasses G) : pow C 1 = C := sorry

theorem pow_mul {G : Type*} [Monoid G] (C : ConjClasses G) (i j : ℕ) :
    pow (pow C i) j = pow C (i * j) := sorry

/-- **Layer 11.1 regression**, the nonidentity square in `C₄`. A quadratic group cannot test this
case because it has no proper nonidentity square. -/
theorem pow_two_cyclicFour :
    pow (ConjClasses.mk (Multiplicative.ofAdd (1 : ZMod 4))) 2 =
      ConjClasses.mk (Multiplicative.ofAdd (2 : ZMod 4)) := sorry

end ConjClasses

section Frobenius

variable (K L : Type*) [Field K] [NumberField K] [Field L] [NumberField L]
  [Algebra K L] [IsGalois K L]

/-- **Layer 2, the unramified primes in one consumed Artin class.**

The carrier is `HeightOneSpectrum`, Mathlib's Dedekind-domain subtype of nonzero prime ideals. The
unramifiedness proof is existentially packaged because `artinSymbol` has no value at a ramified
prime. -/
def frobeniusPrimeSet (C : ConjClasses (L ≃ₐ[K] L)) : Set (HeightOneSpectrum (𝓞 K)) :=
  {𝔭 | ∃ hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal],
      Algebra.IsUnramifiedAt (𝓞 K) Q,
    TauCetiRoadmap.NumberFieldArithmetic.artinSymbol 𝔭.asIdeal hur = C}

/-- **Layer 2**, distinct classes give disjoint prime sets. -/
theorem disjoint_frobeniusPrimeSet {C D : ConjClasses (L ≃ₐ[K] L)} (h : C ≠ D) :
    Disjoint (frobeniusPrimeSet K L C) (frobeniusPrimeSet K L D) := sorry

/-- **Layer 2**, the finite exceptional set. -/
noncomputable def ramifiedPrimes (_L : Type*) : Finset (HeightOneSpectrum (𝓞 K)) := sorry

theorem mem_ramifiedPrimes_iff (𝔭 : HeightOneSpectrum (𝓞 K)) :
    𝔭 ∈ ramifiedPrimes K L ↔
      ¬ ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal],
        Algebra.IsUnramifiedAt (𝓞 K) Q := sorry

/-- **Layer 10, Dirichlet-density Chebotarev.** Density is the predicate imported from Arithmetic
Dirichlet Series, hence the ratio to the all-prime sum. -/
theorem hasDirichletDensity_frobeniusPrimeSet (C : ConjClasses (L ≃ₐ[K] L)) :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K L C)
      ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ)) := sorry

/-- **Layer 10**, the split-completely corollary is derived from the class theorem. -/
theorem hasDirichletDensity_splitCompletely :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K L 1)
      (1 / (Nat.card (L ≃ₐ[K] L) : ℝ)) := sorry

end Frobenius

section Cyclotomic

variable (K F : Type*) [Field K] [NumberField K] [Field F] [NumberField F]
  [Algebra K F] [IsGalois K F]

/-- **Layer 4**, the canonical cyclotomic weight. Its bad-prime value is fixed to zero; it is not
an arbitrary weight constrained only at unramified primes.
⚠ The supplier's carrier is `MultiplicativeIdealWeight`; the accepted #192 has no `IdealWeight`,
and naming one here would be a Chebotarev-local stand-in for a merged declaration. -/
noncomputable def cyclotomicCharacterWeight (χ : (F ≃ₐ[K] F) →* ℂˣ) :
    TauCetiRoadmap.ArithmeticDirichletSeries.MultiplicativeIdealWeight K := sorry

/-- **Layer 4**, the weight vanishes at ramified primes. Applied through the supplier's `CoeFun`,
not through a projection name. -/
theorem cyclotomicCharacterWeight_eq_zero (χ : (F ≃ₐ[K] F) →* ℂˣ)
    {𝔭 : HeightOneSpectrum (𝓞 K)}
    (h𝔭 : ¬ ∀ (Q : Ideal (𝓞 F)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal],
      Algebra.IsUnramifiedAt (𝓞 K) Q) :
    cyclotomicCharacterWeight K F χ 𝔭.asIdeal = 0 := sorry

/-- **Layer 4, the Frobenius orientation on roots of unity.** Arithmetic Frobenius at `𝔭` raises a
primitive `m`-th root of unity to the power `𝔑𝔭`, not `𝔑𝔭⁻¹`. Over `ℚ` this is `ζ_m ↦ ζ_m ^ p`,
so the cyclotomic character sends Frobenius at `p` to `p mod m`. -/
theorem isArithFrobAt_zeta_pow (m : ℕ) [NeZero m] [IsCyclotomicExtension {m} K F]
    (ζ : F) (hζ : IsPrimitiveRoot ζ m)
    (𝔭 : HeightOneSpectrum (𝓞 K)) (hm : (m : 𝓞 K) ∉ 𝔭.asIdeal)
    (Q : Ideal (𝓞 F)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal]
    (σ : F ≃ₐ[K] F) (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    σ ζ = ζ ^ Ideal.absNorm 𝔭.asIdeal := sorry

/-- **Layer 11.4, the orthogonality relation the character reduction uses.** The inverse sits on
the tag `σ`, never on the Frobenius argument.
⚠ `∑ χ, χ σ * χ g` is the indicator of `g = σ⁻¹`, a different fibre; over `ℚ(ζ₅)` it exchanges
the classes of `p ≡ 2` and `p ≡ 3 (mod 5)`. -/
theorem sum_character_indicator {A : Type*} [CommGroup A] [Finite A] [DecidableEq A] (σ g : A) :
    ∑ᶠ χ : A →* ℂˣ, (((χ σ)⁻¹ : ℂˣ) : ℂ) * ((χ g : ℂˣ) : ℂ) =
      if g = σ then (Nat.card A : ℂ) else 0 := sorry

/-- **Layer 5**, the continued cyclotomic character series. Its construction factors through the
consumed ray-class character and uses ray-class ideal counting, not total ideal counting. -/
noncomputable def cyclotomicCharacterSeriesC (χ : (F ≃ₐ[K] F) →* ℂˣ) : ℂ → ℂ := sorry

theorem cyclotomicCharacterSeriesC_ne_zero_at_one (m : ℕ) [NeZero m]
    [IsCyclotomicExtension {m} K F] (χ : (F ≃ₐ[K] F) →* ℂˣ) (hχ : χ ≠ 1) :
    cyclotomicCharacterSeriesC K F χ 1 ≠ 0 := sorry

/-- **Layer 6**, cyclotomic Dirichlet density. -/
theorem hasDirichletDensity_cyclotomicFrobenius (m : ℕ) [NeZero m]
    [IsCyclotomicExtension {m} K F] (σ : F ≃ₐ[K] F) :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K F (ConjClasses.mk σ))
      (1 / (Nat.card (F ≃ₐ[K] F) : ℝ)) := sorry

/-- **Layer 6**, Dirichlet's primes-in-arithmetic-progressions corollary over `ℚ`. This is
derived by comparing cyclotomic arithmetic Frobenius with Mathlib's Dirichlet-primes theorem. -/
theorem hasDirichletDensity_primesCongruent (m a : ℕ) [NeZero m]
    (ha : IsUnit (a : ZMod m)) :
    NumberField.Set.HasDirichletDensity
      {𝔭 : HeightOneSpectrum (𝓞 ℚ) | Ideal.absNorm 𝔭.asIdeal % m = a % m}
      (1 / (Nat.totient m : ℝ)) := sorry

end Cyclotomic

section Crossing

variable (K L : Type*) [Field K] [NumberField K] [Field L] [NumberField L]
  [Algebra K L] [IsGalois K L]

/-- **Layer 7.1, the auxiliary prime.** Every condition the crossing uses is a conclusion: the
size bound that avoids the finite exceptional sets of Layers 2, 3 and 5; the congruence, in both
the `Nat.ModEq` form and the divisibility form `n ∣ q - 1` that supplies the tagged elements of
Layer 9; unramifiedness in `K` and in `L`; and the irreducibility of the `q`-th cyclotomic
polynomial over `K`, which is `K ∩ ℚ(ζ_q) = ℚ` restated so that it needs no ambient field.
"Choose a sufficiently large prime" is not a step of the proof; this theorem is.

Infinitude in the congruence class is Mathlib's `Nat.exists_prime_gt_modEq_one`; the primes
ramifying in `L` are finitely many, so enlarging `N` past all of them discharges the ramification
conjuncts, and 7.2 turns unramifiedness in `K` into the last one. -/
theorem exists_auxiliaryPrime (n N : ℕ) (hn : n ≠ 0) :
    ∃ q : ℕ, q.Prime ∧ N < q ∧ q ≡ 1 [MOD n] ∧ n ∣ q - 1 ∧
      (∀ (𝔮 : Ideal (𝓞 K)) [𝔮.IsPrime] [𝔮.LiesOver (Ideal.span {(q : ℤ)})],
        Algebra.IsUnramifiedAt ℤ 𝔮) ∧
      (∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver (Ideal.span {(q : ℤ)})],
        Algebra.IsUnramifiedAt ℤ Q) ∧
      Irreducible (Polynomial.cyclotomic q K) := sorry

/-- **Layer 7.2, the degree input the crossing actually needs.** `q` unramified in `K` forces
`K ∩ ℚ(ζ_q) = ℚ`, because `ℚ(ζ_q)/ℚ` is totally ramified at `q` and so every subfield of it other
than `ℚ` is ramified at `q`. That is what makes the `q`-th cyclotomic polynomial irreducible over
`K`, hence `[K(ζ_q) : K] = q - 1`.

⚠ `L ⊓ K(ζ_q) = ⊥` implies none of this: it constrains `L`, not `K ∩ ℚ(ζ_q)`. See
`not_irreducible_cyclotomic_five_of_sq_eq_five` for the witness. -/
theorem irreducible_cyclotomic_of_unramified (q : ℕ) (hq : q.Prime)
    (hur : ∀ (𝔮 : Ideal (𝓞 K)) [𝔮.IsPrime] [𝔮.LiesOver (Ideal.span {(q : ℤ)})],
      Algebra.IsUnramifiedAt ℤ 𝔮) :
    Irreducible (Polynomial.cyclotomic q K) := sorry

/-- **Layer 7.2**, the auxiliary Galois group is then the full unit group, in particular cyclic of
order `q - 1`. Consuming Mathlib's `IsCyclotomicExtension.autEquivPow` keeps the irreducibility
hypothesis visible in the type, so a crossing argument cannot silently assume the order. -/
noncomputable def auxiliaryCyclotomicEquiv (q : ℕ) [NeZero q] (F : Type*) [Field F] [Algebra K F]
    [IsCyclotomicExtension {q} K F] (hirr : Irreducible (Polynomial.cyclotomic q K)) :
    (F ≃ₐ[K] F) ≃* (ZMod q)ˣ :=
  IsCyclotomicExtension.autEquivPow F hirr

theorem card_auxiliaryCyclotomic (q : ℕ) [NeZero q] (F : Type*) [Field F] [Algebra K F]
    [IsCyclotomicExtension {q} K F] (hq : q.Prime)
    (hirr : Irreducible (Polynomial.cyclotomic q K)) :
    Nat.card (F ≃ₐ[K] F) = q - 1 := sorry

/-- ⚠ **Layer 7.2, rejection test.** With `K = ℚ(√5)`, `L = K(√2)` and `q = 5` the intersection
`L ⊓ K(ζ₅)` is `⊥`: the subfields of `L` are `ℚ`, `ℚ(√2)`, `ℚ(√5)`, `ℚ(√10)` and `L`, those of
`K(ζ₅) = ℚ(ζ₅)` are `ℚ`, `ℚ(√5)` and `ℚ(ζ₅)`, so the intersection is `ℚ(√5) = K`. Yet
`[K(ζ₅) : K] = 2`, not `q - 1 = 4`, and that is what this statement records: over such a `K` the
fifth cyclotomic polynomial is reducible. `5` ramifies in `K`, which is exactly what
`exists_auxiliaryPrime` excludes. -/
theorem not_irreducible_cyclotomic_five_of_sq_eq_five {E : Type*} [Field E] [NumberField E]
    (hdeg : Module.finrank ℚ E = 2) (h5 : ∃ x : E, x ^ 2 = 5) :
    ¬ Irreducible (Polynomial.cyclotomic 5 E) := sorry

/-- **Layer 7.5**, the group-theoretic reason a tagged fixed field carries a cyclotomic extension.
`orderOf σ ∣ orderOf τ` is exactly what makes `⟨(σ, τ)⟩` meet `Gal(M/K(ζ_q)) = G × 1` trivially,
and that intersection being trivial is `E_τ · K(ζ_q) = M`, i.e. `M = E_τ(ζ_q)`. -/
theorem zpowers_inf_prod_bot_of_orderOf_dvd {G H : Type*} [Group G] [Group H]
    (σ : G) (τ : H) (hστ : orderOf σ ∣ orderOf τ) :
    Subgroup.zpowers ((σ, τ) : G × H) ⊓ (⊤ : Subgroup G).prod (⊥ : Subgroup H) = ⊥ := sorry

/-- **Layers 7 and 9**, elements of the auxiliary cyclic group whose order is divisible by `f`. -/
noncomputable def taggedElements {H : Type*} [Group H] [Fintype H] (f : ℕ) : Finset H :=
  Finset.univ.filter fun τ => f ∣ orderOf τ

/-- **Layer 9**, the lower-bound constant from one auxiliary prime. -/
noncomputable def crossingConstant {H : Type*} [Group H] [Fintype H] (f : ℕ) : ℝ :=
  ((taggedElements (H := H) f).card : ℝ) /
    ((Nat.card (L ≃ₐ[K] L) : ℝ) * (Nat.card H : ℝ))

/-- **Layer 9**, the exact cyclic count. The degree-four `f = 2` case returns three tagged
elements and detects a construction retaining only one generator. -/
theorem card_taggedElements_cyclic {H : Type*} [Group H] [Fintype H] [IsCyclic H]
    (f : ℕ) (hfpos : 0 < f) (hf : f ∣ Nat.card H) :
    ((taggedElements (H := H) f).card : ℝ) =
      (Nat.card H : ℝ) * ∏ p ∈ f.primeFactors,
        (1 - (p : ℝ) ^ (-(((Nat.card H).factorization p - f.factorization p + 1 : ℕ) : ℤ))) :=
  sorry

/-- **Layer 9**, the size inequality that separates the group-theoretic fibres. Each factor of the
exact count is at least `1 - 2^{-r}` once `f ^ r ∣ #H`, because `v_p(#H) - v_p(f) + 1 ≥ r` for
every `p ∣ f`. Raising the level `r` in `q ≡ 1 (mod f ^ r)` is the only mechanism pushing the
crossing constant up to `1/#G`; nothing about the auxiliary prime other than this congruence
enters the constant. -/
theorem le_card_taggedElements_cyclic {H : Type*} [Group H] [Fintype H] [IsCyclic H]
    (f r : ℕ) (hfpos : 0 < f) (hrpos : 0 < r) (hf : f ^ r ∣ Nat.card H) :
    (1 - (2 : ℝ) ^ (-(r : ℤ))) ^ f.primeFactors.card * (Nat.card H : ℝ) ≤
      ((taggedElements (H := H) f).card : ℝ) := sorry

/-- **Layer 9**, the same bound transported to the crossing constant. The right-hand side tends to
`1 / #G` as `r → ∞`, and that limit is taken only after the `x`-limit of Layer 12. -/
theorem le_crossingConstant {H : Type*} [Group H] [Fintype H] [IsCyclic H]
    (f r : ℕ) (hfpos : 0 < f) (hrpos : 0 < r) (hf : f ^ r ∣ Nat.card H) :
    (1 - (2 : ℝ) ^ (-(r : ℤ))) ^ f.primeFactors.card / (Nat.card (L ≃ₐ[K] L) : ℝ) ≤
      crossingConstant K L (H := H) f := sorry

/-- **Layer 9**, abelian Chebotarev, before the fixed-field reduction. -/
theorem hasDirichletDensity_abelianFrobenius
    (hab : ∀ σ τ : L ≃ₐ[K] L, σ * τ = τ * σ) (σ : L ≃ₐ[K] L) :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K L (ConjClasses.mk σ))
      (1 / (Nat.card (L ≃ₐ[K] L) : ℝ)) := sorry

section FixedField

/-- **Layer 8.1, the tower-exponent regression**, in `ℚ ⊂ ℚ(√-7) ⊂ ℚ(ζ₇)` at `p = 3`, transported
along `Gal(ℚ(ζ₇)/ℚ) ≃ (ZMod 7)ˣ`. Arithmetic Frobenius at `3` is the unit `3`, of order `6`.
Restriction to the normal subextension `ℚ(√-7)` takes **no power** and is nontrivial, so `3` is
inert there and `f(𝔭₃/3) = 2`. Raising the base to `ℚ(√-7)` raises Frobenius to that residue
degree, giving `3 ^ 2 = 2`.

`Gal(ℚ(ζ₇)/ℚ(√-7))` is the subgroup of squares. The statement records that `2` is a square while
neither `3` nor `3⁻¹ = 5` is: reading the tower exponent as "no power" or as an inverse produces
an element that does not lie in the relative Galois group at all. -/
theorem towerExponent_cyclotomicSeven :
    (3 : ZMod 7) ^ 2 = 2 ∧ (3 : ZMod 7) * 5 = 1 ∧
      IsSquare (2 : ZMod 7) ∧ ¬ IsSquare (3 : ZMod 7) ∧ ¬ IsSquare (5 : ZMod 7) := by
  decide

/-- The fixed field of the cyclic subgroup generated by `σ`. -/
noncomputable abbrev cyclicFixedField (σ : L ≃ₐ[K] L) : IntermediateField K L :=
  IntermediateField.fixedField (Subgroup.zpowers σ)

/-- The generator of `Gal(L / L^⟨σ⟩)` corresponding to `σ`. -/
noncomputable def fixedFieldGenerator (σ : L ≃ₐ[K] L) :
    L ≃ₐ[cyclicFixedField K L σ] L :=
  IntermediateField.subgroupEquivAlgEquiv (Subgroup.zpowers σ)
    ⟨σ, Subgroup.mem_zpowers σ⟩

/-- A closed application of the supplier's prime-relative tower theorem. The restriction runs
from `Gal(L/L^⟨σ⟩)` to `Gal(L/K)`, and the absolute Frobenius is raised to the residue degree
of the intermediate prime. -/
theorem artinClass_restrict_fixedField (σ : L ≃ₐ[K] L)
    (Q : Ideal (𝓞 L)) (𝔓 : Ideal (𝓞 (cyclicFixedField K L σ)))
    (𝔭 : Ideal (𝓞 K))
    (hQE : Q.under (𝓞 (cyclicFixedField K L σ)) = 𝔓)
    (hQK : Q.under (𝓞 K) = 𝔭)
    (hur : ∀ (Q' : Ideal (𝓞 L)) [Q'.IsPrime] [Q'.LiesOver 𝔭],
      Algebra.IsUnramifiedAt (𝓞 K) Q')
    (τ : L ≃ₐ[K] L) (hτ : IsArithFrobAt (𝓞 K) τ Q) :
    ∃ τE : L ≃ₐ[cyclicFixedField K L σ] L,
      IsArithFrobAt (𝓞 (cyclicFixedField K L σ)) τE Q ∧
        AlgEquiv.restrictScalars K τE = τ ^ 𝔓.inertiaDeg (𝓞 K) :=
  TauCetiRoadmap.NumberFieldArithmetic.exists_isArithFrobAt_pow_inertiaDeg
    (cyclicFixedField K L σ) Q 𝔓 𝔭 hQE hQK hur τ hτ

/-- The relative Frobenius fibre over the cyclic fixed field. -/
def fixedFieldFrobeniusPrimeSet (σ : L ≃ₐ[K] L) :
    Set (HeightOneSpectrum (𝓞 (cyclicFixedField K L σ))) :=
  frobeniusPrimeSet (cyclicFixedField K L σ) L
    (ConjClasses.mk (fixedFieldGenerator K L σ))

/-- **Layer 8.2**, the case the contraction uses. At residue degree one the exponent of the tower
law is `1`, so the relative Frobenius *is* the absolute one, unpowered. This is the only situation
in which the fibre count may compare the two without an exponent. -/
theorem isArithFrobAt_fixedField_of_inertiaDeg_one (σ : L ≃ₐ[K] L)
    (Q : Ideal (𝓞 L)) (𝔓 : Ideal (𝓞 (cyclicFixedField K L σ)))
    (𝔭 : Ideal (𝓞 K))
    (hQE : Q.under (𝓞 (cyclicFixedField K L σ)) = 𝔓)
    (hQK : Q.under (𝓞 K) = 𝔭)
    (hf : 𝔓.inertiaDeg (𝓞 K) = 1)
    (hur : ∀ (Q' : Ideal (𝓞 L)) [Q'.IsPrime] [Q'.LiesOver 𝔭],
      Algebra.IsUnramifiedAt (𝓞 K) Q')
    (τ : L ≃ₐ[K] L) (hτ : IsArithFrobAt (𝓞 K) τ Q) :
    ∃ τE : L ≃ₐ[cyclicFixedField K L σ] L,
      IsArithFrobAt (𝓞 (cyclicFixedField K L σ)) τE Q ∧
        AlgEquiv.restrictScalars K τE = τ := by
  obtain ⟨τE, hfrob, hres⟩ :=
    artinClass_restrict_fixedField K L σ Q 𝔓 𝔭 hQE hQK hur τ hτ
  exact ⟨τE, hfrob, by rw [hres, hf, pow_one]⟩

/-- **Layer 8.2**, the residue degree of the intermediate prime is the least positive power of the
absolute Frobenius that lands in `⟨σ⟩`. Hence `f(𝔓/𝔭) = 1` says exactly `Frob ∈ ⟨σ⟩`, which is the
selection criterion of the fibre count. -/
theorem inertiaDeg_fixedField_eq_one_iff (σ : L ≃ₐ[K] L)
    (Q : Ideal (𝓞 L)) (𝔓 : Ideal (𝓞 (cyclicFixedField K L σ)))
    (𝔭 : Ideal (𝓞 K))
    (hQE : Q.under (𝓞 (cyclicFixedField K L σ)) = 𝔓)
    (hQK : Q.under (𝓞 K) = 𝔭)
    (hur : ∀ (Q' : Ideal (𝓞 L)) [Q'.IsPrime] [Q'.LiesOver 𝔭],
      Algebra.IsUnramifiedAt (𝓞 K) Q')
    (τ : L ≃ₐ[K] L) (hτ : IsArithFrobAt (𝓞 K) τ Q) :
    𝔓.inertiaDeg (𝓞 K) = 1 ↔ τ ∈ Subgroup.zpowers σ := sorry

/-- The finite exceptional set used simultaneously in contraction and in the relative Artin
symbol: the primes of the fixed field lying above a prime of `K` that ramifies in `L`.

⚠ The primes of the fixed field that ramify in `L` are **not** enough, and the preimage
description below is false with that smaller set. A prime `𝔓` can be unramified in `L/E` while
`𝔭` ramifies in `L/K`; then `𝔓` carries a relative Artin symbol and `𝔭` carries no absolute one,
so `𝔓` lies in the relative fibre and above no member of `frobeniusPrimeSet K L C`. Witness:
`K = ℚ`, `L = ℚ(∛2, ζ₃)` with `Gal(L/K) ≅ S₃`, `σ` a transposition so `E = ℚ(∛2)`, and `p = 2`,
where the inertia group is the cyclic group of order three: `e(Q/2) = 3`, `e(Q/𝔓) = 1`, and
`e(𝔓/2) = 3`. -/
noncomputable def fixedFieldExceptionalPrimes (σ : L ≃ₐ[K] L) :
    Finset (HeightOneSpectrum (𝓞 (cyclicFixedField K L σ))) := sorry

theorem mem_fixedFieldExceptionalPrimes_iff (σ : L ≃ₐ[K] L)
    (𝔓 : HeightOneSpectrum (𝓞 (cyclicFixedField K L σ))) :
    𝔓 ∈ fixedFieldExceptionalPrimes K L σ ↔
      ∃ 𝔭 ∈ ramifiedPrimes K L, 𝔓.asIdeal.under (𝓞 K) = 𝔭.asIdeal := sorry

/-- Away from the named finite exceptional set, the relative cyclic Frobenius fibre is exactly
the residue-degree-one preimage of the absolute conjugacy-class fibre. -/
theorem frobeniusPrimeSet_preimage_fixedField
    (C : ConjClasses (L ≃ₐ[K] L)) (σ : L ≃ₐ[K] L) (hσ : σ ∈ C.carrier) :
    {𝔓 | 𝔓 ∉ fixedFieldExceptionalPrimes K L σ ∧
        𝔓 ∈ fixedFieldFrobeniusPrimeSet K L σ} =
      {𝔓 | 𝔓 ∉ fixedFieldExceptionalPrimes K L σ ∧
        𝔓.asIdeal.inertiaDeg (𝓞 K) = 1 ∧
          ∃ 𝔭 ∈ frobeniusPrimeSet K L C,
            𝔓.asIdeal.under (𝓞 K) = 𝔭.asIdeal} := sorry

/-- The natural-number division in the fibre count below is exact: `#C` is the index of the
centralizer of `σ`, and `orderOf σ` divides the order of that centralizer. Without this the
statement would be about a truncated quotient. -/
theorem card_carrier_mul_orderOf_dvd {G : Type*} [Group G] [Finite G]
    (C : ConjClasses G) (σ : G) (hσ : σ ∈ C.carrier) :
    Nat.card C.carrier * orderOf σ ∣ Nat.card G := sorry

/-- Exact cardinality of the residue-degree-one relative fibre over one unramified prime. -/
theorem fixedField_frobenius_fiber_card
    (C : ConjClasses (L ≃ₐ[K] L)) (σ : L ≃ₐ[K] L) (hσ : σ ∈ C.carrier)
    (𝔭 : HeightOneSpectrum (𝓞 K)) (h𝔭 : 𝔭 ∈ frobeniusPrimeSet K L C) :
    Nat.card {𝔓 : HeightOneSpectrum (𝓞 (cyclicFixedField K L σ)) //
      𝔓.asIdeal.under (𝓞 K) = 𝔭.asIdeal ∧
        𝔓 ∈ fixedFieldFrobeniusPrimeSet K L σ} =
      Nat.card (L ≃ₐ[K] L) / (Nat.card C.carrier * orderOf σ) := sorry

/-- The fixed-field reduction multiplies relative density `1 / orderOf σ` by the exact number
of generators/conjugates in each contracted fibre, yielding `|C|/|G|`. -/
theorem density_frobeniusClass_of_cyclic_fixedField
    (C : ConjClasses (L ≃ₐ[K] L)) (σ : L ≃ₐ[K] L) (hσ : σ ∈ C.carrier) :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K L C)
      ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ)) := sorry

end FixedField

section CyclotomicCrossing

variable {Ω : Type*} [Field Ω] [Algebra K Ω]

/-- The auxiliary cyclotomic crossing is linearly disjoint when the two intermediate fields
have trivial intersection. This is the hypothesis that produces the product Galois group and
keeps all tagged Frobenius fibres disjoint. -/
theorem cyclotomicCrossing_linearDisjoint (q : ℕ) [NeZero q]
    (A B : IntermediateField K Ω) [IsGalois K A] [IsGalois K B]
    [IsCyclotomicExtension {q} K B] (hinter : A ⊓ B = ⊥) :
    A.LinearDisjoint B := sorry

end CyclotomicCrossing

end Crossing

section PrimeCounting

variable (K L : Type*) [Field K] [NumberField K] [Field L] [NumberField L]
  [Algebra K L] [IsGalois K L]

open scoped Classical in
/-- **Layer 11.1, the nonnegative Frobenius von Mangoldt coefficient.** A prime power `𝔭^j`
contributes exactly when the `j`-th power of its consumed Artin class is `C`. -/
noncomputable def frobeniusVonMangoldtCoeff (C : ConjClasses (L ≃ₐ[K] L)) (n : ℕ) : ℝ :=
  ∑ᶠ p : {p : HeightOneSpectrum (𝓞 K) × ℕ // 0 < p.2 ∧
      Ideal.absNorm p.1.asIdeal ^ p.2 = n ∧
      ∃ (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver p.1.asIdeal],
          Algebra.IsUnramifiedAt (𝓞 K) Q),
        TauCetiRoadmap.Chebotarev.ConjClasses.pow
          (TauCetiRoadmap.NumberFieldArithmetic.artinSymbol p.1.asIdeal hur) p.2 = C},
    Real.log (Ideal.absNorm (p : HeightOneSpectrum (𝓞 K) × ℕ).1.asIdeal)

theorem frobeniusVonMangoldtCoeff_nonneg (C : ConjClasses (L ≃ₐ[K] L)) (n : ℕ) :
    0 ≤ frobeniusVonMangoldtCoeff K L C n := sorry

/-- **Layer 11.2**, the weighted Frobenius summatory function. -/
noncomputable def frobeniusPsi (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) : ℝ :=
  ∑ n ∈ Finset.range ⌊x⌋₊.succ, frobeniusVonMangoldtCoeff K L C n

/-- **Layer 11.2**, the prime-only weighted function `ϑ_C`. It is defined here and not in Layer 13
because the weighted crossing of Layer 12 runs through `ϑ`, never through `ψ`. -/
noncomputable def frobeniusTheta (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) : ℝ :=
  ∑ᶠ 𝔭 : {𝔭 : HeightOneSpectrum (𝓞 K) //
      𝔭 ∈ frobeniusPrimeSet K L C ∧ (Ideal.absNorm 𝔭.asIdeal : ℝ) ≤ x},
    Real.log (Ideal.absNorm (𝔭 : HeightOneSpectrum (𝓞 K)).asIdeal)

/-! ### Layer 11.3, the four discard estimates

Each has a different reason and a different rate, and together they are what makes the weighted
transfer of Layer 12 an argument rather than a restatement of the prime-set crossing of Layers
7--10. None of them is a consequence of that crossing. -/

/-- **Layer 11.3(1)**, `ϑ_C` is the `j = 1` part of `ψ_C`. -/
theorem frobeniusTheta_le_frobeniusPsi (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) :
    frobeniusTheta K L C x ≤ frobeniusPsi K L C x := sorry

/-- **Layer 11.3(1)**, the prime-power tail is dominated termwise by the generic all-prime tail,
so nothing about `C` is used. -/
theorem frobeniusPsi_sub_frobeniusTheta_le (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) :
    frobeniusPsi K L C x - frobeniusTheta K L C x ≤
      TauCetiRoadmap.ArithmeticDirichletSeries.primePsi K
          (Set.univ : Set (HeightOneSpectrum (𝓞 K))) x -
        TauCetiRoadmap.ArithmeticDirichletSeries.primeTheta K
          (Set.univ : Set (HeightOneSpectrum (𝓞 K))) x := sorry

/-- **Layer 11.3(1)**, hence `o(x)`, through the consumed `standardPrimePowerRemoval`. -/
theorem isLittleO_frobeniusPsi_sub_frobeniusTheta (C : ConjClasses (L ≃ₐ[K] L)) :
    (fun x : ℝ => frobeniusPsi K L C x - frobeniusTheta K L C x) =o[atTop] fun x : ℝ => x :=
  sorry

/-- **Layer 11.3(2)**, primes of residue degree at least two contribute `O(√x log x)`, hence
`o(x)`. This is the estimate that makes a contraction between two number fields legitimate: the
map `𝔓 ↦ 𝔭` preserves norms only when `f(𝔓/𝔭) = 1`, and `f(𝔓/𝔭) ≥ 2` forces `f(𝔓/p) ≥ 2`, so the
absolute statement covers the relative one. It is proved once and cited at every crossing. -/
theorem isLittleO_primeTheta_higherResidueDegree :
    (fun x : ℝ => TauCetiRoadmap.ArithmeticDirichletSeries.primeTheta K
        {𝔭 : HeightOneSpectrum (𝓞 K) | 2 ≤ 𝔭.asIdeal.inertiaDeg ℤ} x)
      =o[atTop] fun x : ℝ => x := sorry

/-- **Layer 11.3(3)**, a finite set of primes contributes `O(log x)` even to the inclusive
prime-power sum, because each `𝔭` supplies at most `log x / log 𝔑𝔭` terms of size `log 𝔑𝔭`. This
covers `ramifiedPrimes K L`, the fixed-field exceptional set, and the primes ramified in the
crossing compositum but not in `L`. -/
theorem isBigO_primePsi_finite (T : Finset (HeightOneSpectrum (𝓞 K))) :
    (fun x : ℝ => TauCetiRoadmap.ArithmeticDirichletSeries.primePsi K
        (T : Set (HeightOneSpectrum (𝓞 K))) x) =O[atTop] Real.log := sorry

/-- **Layer 11.3(4)**, the single statement consumed at each crossing: everything discarded on the
way from `ψ_C` to the residue-degree-one part of `ϑ_C`, over a finite exceptional set, is `o(x)`.
Use this rather than reassembling the three estimates at each use. -/
theorem isLittleO_frobeniusDiscard (C : ConjClasses (L ≃ₐ[K] L))
    (T : Finset (HeightOneSpectrum (𝓞 K))) :
    (fun x : ℝ => frobeniusPsi K L C x - frobeniusTheta K L C x +
        TauCetiRoadmap.ArithmeticDirichletSeries.primeTheta K
          {𝔭 : HeightOneSpectrum (𝓞 K) | 2 ≤ 𝔭.asIdeal.inertiaDeg ℤ} x +
        TauCetiRoadmap.ArithmeticDirichletSeries.primePsi K
          (T : Set (HeightOneSpectrum (𝓞 K))) x) =o[atTop] fun x : ℝ => x := sorry

/-! ### Layer 12.3, the exact residue-degree-one weighted contraction -/

/-- The residue-degree-one part of the relative weighted prime sum over the cyclic fixed field.
Only these primes satisfy `𝔑_E 𝔓 = 𝔑_K 𝔭`, which is why the crossing is stated for them and for
`ϑ` rather than for `ψ`. -/
noncomputable def fixedFieldThetaDegOne (σ : L ≃ₐ[K] L) (x : ℝ) : ℝ :=
  ∑ᶠ 𝔓 : {𝔓 : HeightOneSpectrum (𝓞 (cyclicFixedField K L σ)) //
      𝔓 ∈ fixedFieldFrobeniusPrimeSet K L σ ∧ 𝔓 ∉ fixedFieldExceptionalPrimes K L σ ∧
        𝔓.asIdeal.inertiaDeg (𝓞 K) = 1 ∧
        (Ideal.absNorm 𝔓.asIdeal : ℝ) ≤ x},
    Real.log (Ideal.absNorm (𝔓 : HeightOneSpectrum (𝓞 (cyclicFixedField K L σ))).asIdeal)

/-- **Layer 12.3, the exact weighted contraction.** There is no error term: at residue degree one
the two norms agree, so the identity is termwise, with multiplicity the fibre count of Layer 8.

⚠ There is no such identity for `ψ`, and the weighted asymptotic is therefore not a formal
corollary of the prime-set crossing. The count of `𝔓` over `𝔭` with `f(𝔓/𝔭) = 1` and
`Frob_{L/E}(𝔓) ^ m = σ` is the Layer 8 constant for `artinSymbol 𝔭`, multiplied by
`#{w ∈ artinSymbol 𝔭 ⊓ zpowers σ | w ^ m = σ}`. For `m ≥ 2` that is supported on the classes
`[w]` with `w ^ m = σ` rather than on `C`: in a cyclic extension of degree five with `G = ⟨g⟩`
and `σ = g`, a prime with Frobenius `g ^ 3` contributes its square term to the fibre of `g`,
because `(g ^ 3) ^ 2 = g`. The prime powers `m ≥ 2` must therefore be removed on both sides, by
`isLittleO_frobeniusPsi_sub_frobeniusTheta`, before this identity is applied. -/
theorem fixedFieldThetaDegOne_eq (C : ConjClasses (L ≃ₐ[K] L)) (σ : L ≃ₐ[K] L)
    (hσ : σ ∈ C.carrier) (x : ℝ) :
    fixedFieldThetaDegOne K L σ x =
      ((Nat.card (L ≃ₐ[K] L) / (Nat.card C.carrier * orderOf σ) : ℕ) : ℝ) *
        frobeniusTheta K L C x := sorry

/-- **Layer 12.3**, the same crossing once `isLittleO_primeTheta_higherResidueDegree` restores the
full relative `ϑ` and `isLittleO_frobeniusPsi_sub_frobeniusTheta` restores `ψ` on both sides. The
error term is genuinely present: only `fixedFieldThetaDegOne_eq` is an exact identity, and it is
exact only at residue degree one and only for `ϑ`. -/
theorem isLittleO_frobeniusPsi_fixedField_transfer (C : ConjClasses (L ≃ₐ[K] L))
    (σ : L ≃ₐ[K] L) (hσ : σ ∈ C.carrier) :
    (fun x : ℝ =>
        frobeniusPsi (cyclicFixedField K L σ) L
            (ConjClasses.mk (fixedFieldGenerator K L σ)) x -
          ((Nat.card (L ≃ₐ[K] L) / (Nat.card C.carrier * orderOf σ) : ℕ) : ℝ) *
            frobeniusPsi K L C x) =o[atTop] fun x : ℝ => x := sorry

/-- **Layer 12.5**, the weighted Chebotarev theorem. -/
theorem tendsto_frobeniusPsi (C : ConjClasses (L ≃ₐ[K] L)) :
    Tendsto (fun x : ℝ => frobeniusPsi K L C x / x) atTop
      (𝓝 ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ))) := sorry

/-- **Layer 13**, `ϑ_C`, from Layer 12 and `isLittleO_frobeniusPsi_sub_frobeniusTheta`. -/
theorem tendsto_frobeniusTheta (C : ConjClasses (L ≃ₐ[K] L)) :
    Tendsto (fun x : ℝ => frobeniusTheta K L C x / x) atTop
      (𝓝 ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ))) := sorry

/-- **Layer 13**, the canonical Frobenius prime count `π_C`. -/
noncomputable def frobeniusPrimeCount (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) : ℕ :=
  Nat.card {𝔭 : HeightOneSpectrum (𝓞 K) //
    𝔭 ∈ frobeniusPrimeSet K L C ∧ (Ideal.absNorm 𝔭.asIdeal : ℝ) ≤ x}

/-- **Layer 13**, qualitative prime-counting Chebotarev. -/
theorem tendsto_frobeniusPrimeCount (C : ConjClasses (L ≃ₐ[K] L)) :
    Tendsto
      (fun x : ℝ => (frobeniusPrimeCount K L C x : ℝ) / (x / Real.log x))
      atTop (𝓝 ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ))) := sorry

/-- **Layer 14**, natural-density Chebotarev. This is proved from the counting theorem, not from
Dirichlet density. -/
theorem hasNaturalDensity_frobeniusPrimeSet (C : ConjClasses (L ≃ₐ[K] L)) :
    TauCetiRoadmap.ArithmeticDirichletSeries.HasNaturalDensity K
      (frobeniusPrimeSet K L C)
      ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ)) := sorry

end PrimeCounting

/-! ### Mandatory power regression

For a cyclic group of order four generated by `g`, the square of the class of `g` is the class of
`g^2`. Consequently a prime with Frobenius `g` contributes its square prime-power term to the
`g^2` von Mangoldt fibre. The implementation must discharge this as a concrete `ZMod 4` or
equivalent cyclic-extension example; a quadratic test does not exercise a proper nonidentity
square and is not accepted as a substitute.
-/

end TauCetiRoadmap.Chebotarev
