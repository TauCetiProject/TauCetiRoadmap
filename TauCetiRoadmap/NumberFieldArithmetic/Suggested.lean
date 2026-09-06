import TauCetiRoadmap.LocalFieldsRamification.Suggested

/-!
# Number fields: ramification, Frobenius, and the LMFDB invariants: target signatures

**This file is not the roadmap, and it is not exhaustive.** The definitive document is
`README.md`, which numbers the milestones as Layer `n.m`. The statements here suggest Lean
forms for particular milestones, so that contributors and reviewers agree on names and
signatures. Discharging all of them finishes neither a layer nor the roadmap.

What is prototyped here, in preference to end theorems, are the objects whose choice of
carrier, index type, or map determines everything below them. Every declaration elaborates
against the pinned Mathlib. Every proof is `sorry`, which this human-owned roadmap library
allows, with one kind of exception recording something about the pin instead of stating a
milestone:

* three statements in the Layer 5.7 block are proved `by infer_instance`, because the pin
  already supplies them and the milestone is to cite them rather than to prove them;
* the Layer 5.8 and Layer 6 supplier checks are closed applications of #189's imported
  declarations, so namespace and type mismatches are caught by elaboration;

Every carrier and every cross-subject interface in this file compiles as a named declaration.
That includes `artinSymbol` with `artinSymbol_map_restrictNormalHom` and
`exists_isArithFrobAt_pow_inertiaDeg`, the carrier `idealsAway` with `idealsAwayInclusion`,
`artinHomAway` with its four properties `artinHomAway_apply_prime`,
`artinHomAway_eq_of_apply_prime`, `artinHomAway_mono` and `artinHomAway_restrict`,
`integralIdealsAway` with `integralIdealsAwayHom`, `artinHomAwayIntegral` with
`artinHomAwayIntegral_apply_prime`, `exists_gal_fullCycleType_eq_factorizationType`,
`relDiscr`, `ramifiedSupport`, the three
Layer 5 comparison maps, the global `ramificationGroup`, and the unit-certificate candidate sets
`unitCandidates` and `cubicUnitCandidates`. The local lower filtration is not redeclared here:
Layer 6 imports and consumes `LocalFieldsRamification.lowerRamificationGroup` from the
prerequisite Local Fields and Ramification roadmap #189.

Conventions, recorded in `README.md`:

* Frobenius is Mathlib's **arithmetic** `IsArithFrobAt`, with exponent the *base* residue
  cardinality, and every Frobenius statement lives in a finite Galois extension. There is no
  canonical Frobenius element or class in an absolute Galois group, and nothing here targets
  one.
* The Artin symbol is attached to a nonzero prime **ideal** of `𝓞 K`; the rational-prime form
  is the `K = ℚ` corollary.
* Decomposition group = `MulAction.stabilizer`. This roadmap's global ideal-theoretic
  ramification groups are indexed by `ℕ`; the local groups are #189's canonical `ℤ`-indexed
  `LocalFieldsRamification.lowerRamificationGroup`.
* Splits-completely is the `primesOver`-count equation.
* The ideal-theoretic Artin map takes its excluded set of primes as a parameter; specializing
  it to the support of the relative discriminant is a Layer 4 statement. Its functoriality is
  stated as equations of homomorphisms, never as an inequality of carriers.
* The relative discriminant is the named `relDiscr`, and every statement uses that name rather
  than expanding it as `Ideal.relNorm A (differentIdeal A B)`.
* Tame and wild both include separability of the residue extension; see the Layer 6.4
  docstrings. The number-field prototypes get it from the finiteness of the residue field.
* A unit certificate is a candidate `Finset`, a completeness theorem, a root test **and** a
  field test. Neither `Set.Finite` nor root isolation alone certifies anything.
* Comparison maps are named objects. Where a milestone is a canonical map or equivalence
  (Layer 5's completion map, semi-local decomposition and decomposition-group comparison) the
  prototype is a `def` with its characteristic property, not `∃!` and never `Nonempty (… ≃ …)`,
  since later theorems have to say what the map does to particular elements.
* Concrete fields are presented by a generator `θ : 𝓞 K` with its `minpoly ℤ θ` and
  `Algebra.adjoin ℚ {(θ : K)} = ⊤`, matching the landed TauCeti files.
* ⚠ `Equiv.Perm.cycleType` omits fixed points; partition-valued statements add the `1`s back.
* No Artin conductor object and no conductor exponent is defined anywhere in this roadmap; the
  abelian conductor–discriminant formula belongs to a global class field theory subject.
-/

namespace TauCetiRoadmap.NumberFieldArithmetic

open scoped NumberField Pointwise nonZeroDivisors
open Polynomial IsDedekindDomain

variable {K : Type*} [Field K] [NumberField K]

/-! ## Layer 1: the splitting dictionary -/

/-- **Layer 1.4, the double-coset law** (Neukirch I §9, p. 55; absent upstream). For `M/ℚ`
Galois, `K` an intermediate field with fixing subgroup `H`, and `D` the decomposition group
(`MulAction.stabilizer`) of a prime `Q` over `p`, the double cosets `H\G/D` biject with the
primes of `𝓞 K` over `p`. -/
noncomputable def doubleCosetEquiv {M : Type*} [Field M] [NumberField M] [IsGalois ℚ M]
    (K : IntermediateField ℚ M) (p : ℕ) [Fact p.Prime] (Q : Ideal (𝓞 M)) [Q.IsPrime]
    [Q.LiesOver (Ideal.span {(p : ℤ)})] :
    DoubleCoset.Quotient (K.fixingSubgroup : Set (M ≃ₐ[ℚ] M))
        (MulAction.stabilizer (M ≃ₐ[ℚ] M) Q) ≃
      Ideal.primesOver (Ideal.span {(p : ℤ)}) (𝓞 K) :=
  sorry

/-- **Layer 1.4, the bijection is `HσD ↦ σQ ∩ K`.** Without this the equivalence above says only
that two finite sets have the same size, and the `e`/`f` read-off along it (a companion
milestone, README Layer 1) could not be stated at all. -/
example {M : Type*} [Field M] [NumberField M] [IsGalois ℚ M] (K : IntermediateField ℚ M)
    (p : ℕ) [Fact p.Prime] (Q : Ideal (𝓞 M)) [Q.IsPrime]
    [Q.LiesOver (Ideal.span {(p : ℤ)})] (σ : M ≃ₐ[ℚ] M) :
    (doubleCosetEquiv K p Q (Quotient.mk _ σ) : Ideal (𝓞 K)) = (σ • Q).under (𝓞 K) :=
  sorry

/-- **Layer 1.5, totally split in `K` and in the Galois closure** (Neukirch I §9 Ex. 4),
via the double-coset law. `hM` says `M` is the Galois closure of `K`. -/
example {M : Type*} [Field M] [NumberField M] [IsGalois ℚ M] (K : IntermediateField ℚ M)
    (hM : IntermediateField.normalClosure ℚ K M = ⊤) {p : ℕ} [Fact p.Prime] :
    (Ideal.primesOver (Ideal.span {(p : ℤ)}) (𝓞 K)).ncard = Module.finrank ℚ K ↔
      (Ideal.primesOver (Ideal.span {(p : ℤ)}) (𝓞 M)).ncard = Module.finrank ℚ M :=
  sorry

/-! ## Layer 2: Frobenius elements and the Artin symbol, at finite level -/

/-- **Layer 2.1, existence of the relative Frobenius.** For `L/K` finite Galois and `Q` a
nonzero prime of `𝓞 L`, there is a Frobenius `σ ∈ Gal(L/K)` at `Q`: the number-field
instantiation of the pin's `IsArithFrobAt.exists_of_isInvariant`, generalizing TauCeti's
landed base-`ℚ` `exists_isArithFrobAt`. ⚠ The exponent is the *base* residue cardinality
`#(𝓞 K ⧸ Q ∩ 𝓞 K)`, per the conventions table. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (Q : Ideal (𝓞 L)) [Q.IsPrime] (hQ : Q ≠ ⊥) :
    ∃ σ : L ≃ₐ[K] L, IsArithFrobAt (𝓞 K) σ Q :=
  sorry

/-- **Layer 2.2, uniqueness at unramified primes, in the Galois group.** The pin proves
uniqueness at `AlgHom` level (`AlgHom.IsArithFrobAt.eq_of_isUnramifiedAt`); the Galois-group
statement is the missing faithfulness upgrade. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    {σ τ : L ≃ₐ[K] L} {Q : Ideal (𝓞 L)} [Q.IsPrime] (hQ : Q ≠ ⊥)
    [Algebra.IsUnramifiedAt (𝓞 K) Q] (hσ : IsArithFrobAt (𝓞 K) σ Q)
    (hτ : IsArithFrobAt (𝓞 K) τ Q) :
    σ = τ :=
  sorry

/-- **Layer 2.3, the Artin symbol, at a prime ideal of the base.** For `𝔭` a
nonzero prime of `𝓞 K` unramified in `L`, all Frobenius elements at all primes of `𝓞 L` over
`𝔭` lie in one conjugacy class, and this is that class.
⚠ Relative and prime-ideal-indexed: the familiar `(p, K/ℚ)` is the `K = ℚ` specialization
`𝔭 = Ideal.span {(p : ℤ)}`, stated as a corollary and not as the definition. -/
noncomputable def artinSymbol {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭], Algebra.IsUnramifiedAt (𝓞 K) Q) :
    ConjClasses (L ≃ₐ[K] L) :=
  sorry

/-- **Layer 2.3, the characteristic property of `artinSymbol`.** Every Frobenius at every prime
over `𝔭` represents the class. Existence is `IsArithFrobAt.exists_of_isInvariant`, conjugacy
across the fibre is `isConj_arithFrobAt`, and Layer 2.2 makes the representative unique at each
prime; together they say the class is well defined and that this equation determines it. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭], Algebra.IsUnramifiedAt (𝓞 K) Q)
    (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭] (σ : L ≃ₐ[K] L)
    (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    ConjClasses.mk σ = artinSymbol 𝔭 hur :=
  sorry

/-- **Layer 2.3, the base-`ℚ` specialization of the Artin symbol.** The rational-prime form the
LMFDB pages display, obtained from the relative statement by `𝔭 = Ideal.span {(p : ℤ)}`. -/
example [IsGalois ℚ K] {p : ℕ} [Fact p.Prime]
    (hp : ∀ (Q : Ideal (𝓞 K)) [Q.IsPrime] [Q.LiesOver (Ideal.span {(p : ℤ)})],
      Algebra.IsUnramifiedAt ℤ Q) :
    ∃! c : ConjClasses (K ≃ₐ[ℚ] K),
      ∀ (Q : Ideal (𝓞 K)) (σ : K ≃ₐ[ℚ] K), Q.IsPrime →
        Q.LiesOver (Ideal.span {(p : ℤ)}) → IsArithFrobAt ℤ σ Q → ConjClasses.mk σ = c :=
  sorry

/-- **Layer 2.3, the order of Frobenius is the inertia degree** (at an unramified prime). With
the pin's `Ideal.card_stabilizer_eq`, this also gives `zpowers (Frob Q) = stabilizer`. -/
example [IsGalois ℚ K] {p : ℕ} [Fact p.Prime] {Q : Ideal (𝓞 K)} [Q.IsPrime]
    [Q.LiesOver (Ideal.span {(p : ℤ)})] [Algebra.IsUnramifiedAt ℤ Q]
    {σ : K ≃ₐ[ℚ] K} (hσ : IsArithFrobAt ℤ σ Q) :
    orderOf σ = (Ideal.span {(p : ℤ)}).inertiaDegIn (𝓞 K) :=
  sorry

/-- **Layer 2.4, restriction to a normal subextension.** Nothing upstream relates Frobenius
elements along `AlgEquiv.restrictNormal`; this is the tower half of the Artin-symbol
functoriality. -/
example {M : Type*} [Field M] [NumberField M] [IsGalois ℚ M] (K : IntermediateField ℚ M)
    [Normal ℚ K] {σ : M ≃ₐ[ℚ] M} {Q : Ideal (𝓞 M)} (hσ : IsArithFrobAt ℤ σ Q) :
    IsArithFrobAt ℤ (σ.restrictNormal K) (Q.under (𝓞 K)) :=
  sorry

/-- **Layer 2.4, the unramified hypothesis descends through an intermediate extension.** This
is `Algebra.IsUnramifiedAt.of_liesOver` applied inside the tower. It is named so the Artin-symbol
restriction theorem below takes only the hypothesis for `L/K`. -/
theorem isUnramifiedAt_of_intermediateExtension {L : Type*} [Field L] [NumberField L]
    [Algebra K L] (M : Type*) [Field M] [NumberField M] [Algebra K M] [Algebra M L]
    [IsScalarTower K M L] (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭],
      Algebra.IsUnramifiedAt (𝓞 K) Q) :
    ∀ (Q : Ideal (𝓞 M)) [Q.IsPrime] [Q.LiesOver 𝔭],
      Algebra.IsUnramifiedAt (𝓞 K) Q :=
  sorry

/-- **Layer 2.4, functoriality of the Artin symbol along restriction**, at the level of the
conjugacy class. This is the class-level half that 2.3 defers to 2.4, and it is consumed by
name: the Chebotarev roadmap reduces a general extension to a cyclotomic
one along exactly this square, so the declaration is a contract and not an internal step.

⚠ The unramified hypothesis for `M/K` is *derived* from the one for `L/K`, through
`isUnramifiedAway_of_intermediateField` below. Taking an unrelated second hypothesis would state
something weaker, namely that two separately-defined symbols agree, rather than that one symbol
restricts to the other. -/
theorem artinSymbol_map_restrictNormalHom {L : Type*} [Field L] [NumberField L] [Algebra K L]
    [IsGalois K L] (M : Type*) [Field M] [NumberField M] [Algebra K M] [Algebra M L]
    [IsScalarTower K M L] [IsGalois K M]
    (𝔭 : Ideal (𝓞 K)) [𝔭.IsMaximal]
    (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭], Algebra.IsUnramifiedAt (𝓞 K) Q) :
    ConjClasses.map (AlgEquiv.restrictNormalHom (F := K) (K₁ := L) M) (artinSymbol 𝔭 hur) =
      artinSymbol 𝔭 (isUnramifiedAt_of_intermediateExtension M 𝔭 hur) :=
  sorry

/-- **Layer 2.4, the tower formula**, `Frob_{L/M}(Q) = Frob_{L/K}(Q)^{f(Q ∩ M / 𝔭)}` for
`K ⊆ M ⊆ L`. It is stated **relative to one prime `Q` of `L`**, and that is the whole content of
the statement.

⚠ A version taking an arbitrary representative of `artinSymbol 𝔭 hur` and a fixed prime of `M`
is false when `M/K` is not normal: a conjugate representative need not stabilize `Q`, so its
`f`-th power need not fix `M` pointwise and is then the restriction of nothing in `Gal(L/M)`.
The class-level statement is a corollary of this one and never a replacement for it.

⚠ `𝔭` must be unramified. At a ramified prime a Frobenius lift is determined only modulo
inertia, so no equality of automorphisms is available; the ramified statement would have to live
in the quotient by inertia, or be a statement about a coset. -/
theorem exists_isArithFrobAt_pow_inertiaDeg {L : Type*} [Field L] [NumberField L] [Algebra K L]
    [IsGalois K L] (M : Type*) [Field M] [NumberField M] [Algebra K M] [Algebra M L]
    [IsScalarTower K M L] [IsGalois M L]
    (Q : Ideal (𝓞 L)) (𝔓 : Ideal (𝓞 M)) (𝔭 : Ideal (𝓞 K))
    (hQM : Q.under (𝓞 M) = 𝔓) (hQK : Q.under (𝓞 K) = 𝔭)
    (hur : ∀ (Q' : Ideal (𝓞 L)) [Q'.IsPrime] [Q'.LiesOver 𝔭], Algebra.IsUnramifiedAt (𝓞 K) Q')
    (σ : L ≃ₐ[K] L) (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    ∃ τ : L ≃ₐ[M] L, IsArithFrobAt (𝓞 M) τ Q ∧
      AlgEquiv.restrictScalars K τ = σ ^ 𝔓.inertiaDeg (𝓞 K) :=
  sorry

/-- **Layer 2.5, the carrier `J^S`.** The fractional ideals with valuation zero at every prime
of `S`, inside `(FractionalIdeal (𝓞 K)⁰ K)ˣ`. That is the carrier a reciprocity layer uses for
`J^{𝔪₀}`, which is why it is this type and not a new one. -/
def idealsAway (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Subgroup (FractionalIdeal (𝓞 K)⁰ K)ˣ where
  carrier := {I | ∀ v ∈ S, FractionalIdeal.count K v (I : FractionalIdeal (𝓞 K)⁰ K) = 0}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- **Layer 2.5, `idealsAway S` is generated by the primes outside `S`.** This is what makes the
value on primes determine the map. -/
example (S : Finset (HeightOneSpectrum (𝓞 K))) :
    idealsAway S = Subgroup.closure {I : (FractionalIdeal (𝓞 K)⁰ K)ˣ |
      ∃ v : HeightOneSpectrum (𝓞 K), v ∉ S ∧
        ((I : FractionalIdeal (𝓞 K)⁰ K) = (v.asIdeal : FractionalIdeal (𝓞 K)⁰ K))} :=
  sorry

/-- **Layer 2.5, `S`-monotonicity of the carrier.** A larger excluded set gives a smaller group. -/
example (S S' : Finset (HeightOneSpectrum (𝓞 K))) (h : S ⊆ S') :
    idealsAway (K := K) S' ≤ idealsAway (K := K) S :=
  sorry

/-- **Layer 2.5, the inclusion homomorphism for `S ⊆ S'`.** ⚠ The subgroup inequality above is
not the milestone: it relates the two carriers and says nothing about the two Artin maps. This
is the map along which they are compared, and the equation below is the comparison. -/
noncomputable def idealsAwayInclusion {S S' : Finset (HeightOneSpectrum (𝓞 K))} (h : S ⊆ S') :
    idealsAway (K := K) S' →* idealsAway (K := K) S :=
  Subgroup.inclusion sorry

/-- **Layer 2.5, the monoid of integral ideals prime to `S`.** The carrier for the classical
integral-ideal form of the Artin map, which is what a reciprocity layer pairs with a modulus. -/
def integralIdealsAway (S : Finset (HeightOneSpectrum (𝓞 K))) : Submonoid (Ideal (𝓞 K)) where
  carrier := {I | I ≠ ⊥ ∧ ∀ v ∈ S, ¬ v.asIdeal ∣ I}
  mul_mem' := sorry
  one_mem' := sorry

/-- **Layer 2.5, integral ideals prime to `S` sit inside `J^S`.** A nonzero integral ideal that no
prime of `S` divides is a fractional ideal with valuation zero at every prime of `S`. -/
noncomputable def integralIdealsAwayHom (S : Finset (HeightOneSpectrum (𝓞 K))) :
    integralIdealsAway (K := K) S →* idealsAway (K := K) S :=
  sorry

/-- **Layer 2.5, the ideal-theoretic Artin map.** The excluded set `S` is a **parameter**: any
finite set of primes outside which `L/K` is unramified will do, and the construction says
nothing about which primes those are. That keeps this layer independent of the relative
discriminant, and it is also what a reciprocity layer needs, since the support of a modulus is
generally larger than the ramified set. Specializing `S` to `ramifiedSupport K L` is a Layer 4.3
statement. ⚠ Reciprocity (kernel, surjectivity, factorization through ray class groups) is
deliberately absent. A global class field theory roadmap owns those, and uses this map without
change. -/
noncomputable def artinHomAway {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (hab : ∀ σ τ : L ≃ₐ[K] L, Commute σ τ)
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hur : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal], Algebra.IsUnramifiedAt (𝓞 K) Q) :
    idealsAway (K := K) S →* (L ≃ₐ[K] L) :=
  sorry

/-- **Layer 2.5, the unramified hypothesis descends to a subextension.** This is the pin's
`Algebra.IsUnramifiedAt.of_liesOver` applied to the tower `𝓞 K ⊆ 𝓞 M ⊆ 𝓞 L`. ⚠ The functoriality
equation below consumes this. Taking a second unramified hypothesis for `M/K` as an unrelated
input would state something weaker than the milestone, which is that both Artin maps are defined
from one hypothesis about `L`. -/
theorem isUnramifiedAway_of_intermediateField {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (M : IntermediateField K L) [NumberField M] (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hur : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal], Algebra.IsUnramifiedAt (𝓞 K) Q) :
    ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      ∀ (Q : Ideal (𝓞 M)) [Q.IsPrime] [Q.LiesOver v.asIdeal], Algebra.IsUnramifiedAt (𝓞 K) Q :=
  sorry

section ArtinHomAway
variable {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
  (hab : ∀ σ τ : L ≃ₐ[K] L, Commute σ τ)
  (S : Finset (HeightOneSpectrum (𝓞 K)))
  (hur : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
    ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal], Algebra.IsUnramifiedAt (𝓞 K) Q)

/-- **Layer 2.5, the value at a prime.** Consumed by name: the global class field theory roadmap
imports this map rather than building a second one, and recognizes its own construction through
this equation and the uniqueness below. -/
theorem artinHomAway_apply_prime (I : idealsAway (K := K) S) (v : HeightOneSpectrum (𝓞 K))
    (hv : v ∉ S)
    (hI : ((I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : FractionalIdeal (𝓞 K)⁰ K) =
      (v.asIdeal : FractionalIdeal (𝓞 K)⁰ K))
    (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal] (σ : L ≃ₐ[K] L)
    (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    artinHomAway (L := L) hab S hur I = σ :=
  sorry

/-- **Layer 2.5, the values on primes determine the map.** With the generation statement above,
this is what lets a reciprocity layer recognize its own construction as this one. -/
theorem artinHomAway_eq_of_apply_prime (φ : idealsAway (K := K) S →* (L ≃ₐ[K] L))
    (hφ : ∀ (I : idealsAway (K := K) S) (v : HeightOneSpectrum (𝓞 K)), v ∉ S →
      ((I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : FractionalIdeal (𝓞 K)⁰ K) =
        (v.asIdeal : FractionalIdeal (𝓞 K)⁰ K) →
      ∀ (Q : Ideal (𝓞 L)) (_ : Q.IsPrime) (_ : Q.LiesOver v.asIdeal) (σ : L ≃ₐ[K] L),
        IsArithFrobAt (𝓞 K) σ Q → φ I = σ) :
    φ = artinHomAway (L := L) hab S hur :=
  sorry

/-- **Layer 2.5, `S`-monotonicity of the map.** For `h : S ⊆ S'` the two Artin maps agree on the
smaller carrier, as homomorphisms on `idealsAway S'`. This is the statement that a reciprocity
layer needs when it enlarges the excluded set to the support of a modulus, and an inequality of
carriers is not a substitute for it. -/
theorem artinHomAway_mono (S' : Finset (HeightOneSpectrum (𝓞 K))) (h : S ⊆ S')
    (hur' : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S' →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal], Algebra.IsUnramifiedAt (𝓞 K) Q) :
    artinHomAway (L := L) hab S' hur' =
      (artinHomAway (L := L) hab S hur).comp (idealsAwayInclusion h) :=
  sorry

/-- **Layer 2.5, functoriality in `L`, as an equation.** For an intermediate field `M`, normal
over `K` (automatic here, since `L/K` is abelian), restriction of automorphisms carries the Artin
map of `L/K` to the Artin map of `M/K` on the same carrier. ⚠ There is one excluded set and one
unramified hypothesis: the right-hand side takes the *derived*
`isUnramifiedAway_of_intermediateField M S hur`, not a second assumption. Its proof also needs
Layer 2.4, which is what relates a Frobenius of `L/K` to a Frobenius of `M/K`. -/
theorem artinHomAway_restrict (M : IntermediateField K L) [NumberField M] [Normal K M]
    [IsGalois K M] (habM : ∀ σ τ : M ≃ₐ[K] M, Commute σ τ) :
    (AlgEquiv.restrictNormalHom (F := K) M).comp (artinHomAway (L := L) hab S hur) =
      artinHomAway (L := M) habM S (isUnramifiedAway_of_intermediateField M S hur) :=
  sorry

/-- **Layer 2.5, the integral Artin homomorphism.** The composite of `integralIdealsAwayHom` with
the map on fractional ideals. This is the form the classical statements are in, and it is a
corollary of the fractional-ideal map rather than a second construction. -/
noncomputable def artinHomAwayIntegral :
    integralIdealsAway (K := K) S →* (L ≃ₐ[K] L) :=
  (artinHomAway (L := L) hab S hur).comp (integralIdealsAwayHom S)

/-- **Layer 2.5, the value of the integral Artin homomorphism at a prime.** With the generation
statement above, this determines it. -/
theorem artinHomAwayIntegral_apply_prime (v : HeightOneSpectrum (𝓞 K)) (hv : v ∉ S)
    (hmem : v.asIdeal ∈ integralIdealsAway (K := K) S)
    (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal] (σ : L ≃ₐ[K] L)
    (hσ : IsArithFrobAt (𝓞 K) σ Q) :
    artinHomAwayIntegral (L := L) hab S hur ⟨v.asIdeal, hmem⟩ = σ :=
  sorry

end ArtinHomAway

/-- **Layer 2.6, the cyclotomic Frobenius is `p` itself.** The pin has the decomposition
*subgroup* (`IsCyclotomicExtension.Rat.galEquivZMod_stabilizer` = `⟨[p]⟩`) but never
identifies the Frobenius *element*; both halves exist (`IsArithFrobAt.apply_of_pow_eq_one`,
`galEquivZMod_apply_of_pow_eq`). -/
example {n : ℕ} [NeZero n] {K : Type*} [Field K] [NumberField K]
    [IsCyclotomicExtension {n} ℚ K] {p : ℕ} [Fact p.Prime] (hp : p.Coprime n)
    {Q : Ideal (𝓞 K)} [Q.IsPrime] [Q.LiesOver (Ideal.span {(p : ℤ)})]
    {σ : K ≃ₐ[ℚ] K} (hσ : IsArithFrobAt ℤ σ Q) :
    IsCyclotomicExtension.Rat.galEquivZMod n K σ = ZMod.unitOfCoprime p hp :=
  sorry

/-- **Layer 2.6, the quadratic Frobenius, with every hypothesis written out.** `p` is a finite
prime, odd (so that the Legendre symbol is available) and prime to `d` (so that `p` is
unramified and `θ` has exponent prime to `p`); `θ` is an integral generator with the stated
minimal polynomial. This upgrades TauCeti's landed `isArithFrobAt_apply_sqrt_eq_self_iff`
from an element identity to a statement about the symbol. -/
example {θ : 𝓞 K} {d : ℤ} (hd : Squarefree d) (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) [IsGalois ℚ K]
    {p : ℕ} [Fact p.Prime] (hp2 : p ≠ 2) (hpd : ¬ (p : ℤ) ∣ d)
    {Q : Ideal (𝓞 K)} [Q.IsPrime] [Q.LiesOver (Ideal.span {(p : ℤ)})]
    {σ : K ≃ₐ[ℚ] K} (hσ : IsArithFrobAt ℤ σ Q) :
    σ = 1 ↔ legendreSym p d = 1 :=
  sorry

/-- **Layer 2.7, complex conjugation at a selected ramified real place.** In a general Galois
extension this element depends on the selected place `w` of `L`; the CM involution is a
specialization, not this definition. ⚠ It is never called a Frobenius. -/
noncomputable def complexConjugationAt {L : Type*} [Field L] [NumberField L]
    [Algebra K L] [IsGalois K L] (w : NumberField.InfinitePlace L) (hw : w.IsComplex)
    (hv : (w.comap (algebraMap K L)).IsReal) : L ≃ₐ[K] L :=
  sorry

/-- **Layer 2.7, the defining embedding equation.** -/
theorem isConj_complexConjugationAt {L : Type*} [Field L] [NumberField L]
    [Algebra K L] [IsGalois K L] (w : NumberField.InfinitePlace L) (hw : w.IsComplex)
    (hv : (w.comap (algebraMap K L)).IsReal) :
    NumberField.ComplexEmbedding.IsConj w.embedding (complexConjugationAt w hw hv) :=
  sorry

/-- **Layer 2.7, stabilizer membership.** -/
theorem complexConjugationAt_mem_stabilizer {L : Type*} [Field L] [NumberField L]
    [Algebra K L] [IsGalois K L] (w : NumberField.InfinitePlace L) (hw : w.IsComplex)
    (hv : (w.comap (algebraMap K L)).IsReal) :
    complexConjugationAt w hw hv ∈ MulAction.stabilizer (L ≃ₐ[K] L) w :=
  sorry

/-- **Layer 2.7, nontriviality.** -/
theorem complexConjugationAt_ne_one {L : Type*} [Field L] [NumberField L]
    [Algebra K L] [IsGalois K L] (w : NumberField.InfinitePlace L) (hw : w.IsComplex)
    (hv : (w.comap (algebraMap K L)).IsReal) :
    complexConjugationAt w hw hv ≠ 1 :=
  sorry

/-- **Layer 2.7, order two.** -/
theorem orderOf_complexConjugationAt {L : Type*} [Field L] [NumberField L]
    [Algebra K L] [IsGalois K L] (w : NumberField.InfinitePlace L) (hw : w.IsComplex)
    (hv : (w.comap (algebraMap K L)).IsReal) :
    orderOf (complexConjugationAt w hw hv) = 2 :=
  sorry

/-- **Layer 2.7, uniqueness in the selected stabilizer.** -/
theorem complexConjugationAt_unique {L : Type*} [Field L] [NumberField L]
    [Algebra K L] [IsGalois K L] (w : NumberField.InfinitePlace L) (hw : w.IsComplex)
    (hv : (w.comap (algebraMap K L)).IsReal) (τ : L ≃ₐ[K] L)
    (hτ : τ ∈ MulAction.stabilizer (L ≃ₐ[K] L) w) (hτ1 : τ ≠ 1) :
    τ = complexConjugationAt w hw hv :=
  sorry

/-- **Layer 2.7, covariance under the Galois action on places.** -/
theorem complexConjugationAt_smul {L : Type*} [Field L] [NumberField L]
    [Algebra K L] [IsGalois K L] (w : NumberField.InfinitePlace L) (hw : w.IsComplex)
    (hv : (w.comap (algebraMap K L)).IsReal) (σ : L ≃ₐ[K] L)
    (hwσ : (σ • w).IsComplex) (hvσ : ((σ • w).comap (algebraMap K L)).IsReal) :
    complexConjugationAt (σ • w) hwσ hvσ =
      σ * complexConjugationAt w hw hv * σ⁻¹ :=
  sorry

/-- **Layer 2.7, restriction in a normal tower.** When the induced place of `M` remains complex,
restriction is the conjugation element at that induced place. -/
theorem complexConjugationAt_restrictNormal {L : Type*} [Field L] [NumberField L]
    [Algebra K L] [IsGalois K L] (w : NumberField.InfinitePlace L) (hw : w.IsComplex)
    (hv : (w.comap (algebraMap K L)).IsReal) (M : IntermediateField K L)
    [NumberField M] [Normal K M] [IsGalois K M]
    (hwM : (w.comap (M.val : M →+* L)).IsComplex)
    (hvM : ((w.comap (M.val : M →+* L)).comap (algebraMap K M)).IsReal) :
    (complexConjugationAt w hw hv).restrictNormal M =
      complexConjugationAt (K := K) (w.comap (M.val : M →+* L)) hwM hvM :=
  sorry

/-- **Layer 2.7, the real branch of restriction in a normal tower.** If the induced place of
the intermediate field is real, ordinary complex conjugation fixes its image pointwise, so the
restricted automorphism is the identity. Together with `complexConjugationAt_restrictNormal`
this exhausts the two tower-restriction cases. -/
theorem complexConjugationAt_restrictNormal_eq_one_of_isReal
    {L : Type*} [Field L] [NumberField L]
    [Algebra K L] [IsGalois K L] (w : NumberField.InfinitePlace L) (hw : w.IsComplex)
    (hv : (w.comap (algebraMap K L)).IsReal) (M : IntermediateField K L)
    [NumberField M] [Normal K M] [IsGalois K M]
    (hwM : (w.comap (M.val : M →+* L)).IsReal) :
    (complexConjugationAt w hw hv).restrictNormal M = 1 :=
  sorry

/-! ## Layer 3: the index, Dedekind–Kummer, and Dedekind's theorem -/

/-- **Layer 3.1, the carrier for the power-basis index.** ⚠ The index must not be defined by a
raw `Nat.card` on all of `𝓞 K`: a non-generator gives an infinite quotient and Mathlib's
fallback value `0`, which would make every divisibility statement about it silently true.
Restricting to integral generators keeps it junk-free. -/
def IntegralPrimitiveElement (K : Type*) [Field K] [NumberField K] : Type _ :=
  {θ : 𝓞 K // Algebra.adjoin ℚ {(θ : K)} = ⊤}

/-- **Layer 3.1, the power-basis index** `[𝓞 K : ℤ[θ]]`, on the junk-free carrier. Positivity
(both modules are free of rank `finrank ℚ K`, so the quotient is finite) is the companion
milestone. -/
noncomputable def index (θ : IntegralPrimitiveElement K) : ℕ :=
  Nat.card (𝓞 K ⧸ Subalgebra.toSubmodule (Algebra.adjoin ℤ {θ.1}))

example (θ : IntegralPrimitiveElement K) : 0 < index θ := sorry

/-- **Layer 3.2, the power basis of an integral generator.** Layer 3.3's index formula and the
discriminant comparison both need an actual `PowerBasis ℚ K`, not the phrase "the power basis of
`θ`". -/
noncomputable def powerBasisOfIntegralPrimitiveElement (θ : IntegralPrimitiveElement K) :
    PowerBasis ℚ K :=
  sorry

example (θ : IntegralPrimitiveElement K) :
    (powerBasisOfIntegralPrimitiveElement θ).gen = (θ.1 : K) :=
  sorry

/-- **Layer 3.2, the minimal polynomials agree after the cast.** Needed before the next
statement can be written at all. -/
example (θ : IntegralPrimitiveElement K) :
    minpoly ℚ (θ.1 : K) = (minpoly ℤ θ.1).map (algebraMap ℤ ℚ) :=
  sorry

/-- **Layer 3.2, the discriminant comparison, with the cast written out.** The two discriminants
live in different rings: `Algebra.discr ℚ` is rational and `Polynomial.discr (minpoly ℤ θ)` is
integral. Without `algebraMap ℤ ℚ` this is not an equation. -/
example (θ : IntegralPrimitiveElement K) :
    Algebra.discr ℚ (powerBasisOfIntegralPrimitiveElement θ).basis =
      algebraMap ℤ ℚ (minpoly ℤ θ.1).discr :=
  sorry

/-- **Layer 3.1, `index` is invariant under translation and negation**, because the subring is
unchanged: `ℤ[θ + n] = ℤ[θ] = ℤ[−θ]`. -/
example (θ : IntegralPrimitiveElement K) (n : ℤ) (θ' : IntegralPrimitiveElement K)
    (hθ' : θ'.1 = θ.1 + (n : 𝓞 K)) :
    Algebra.adjoin ℤ {θ'.1} = Algebra.adjoin ℤ {θ.1} :=
  sorry

/-- **Layer 3.3, the index formula** `disc(minpoly θ) = index(θ)² · disc K`, the equation
sharpening TauCeti's landed inequality `abs_discr_le_of_basis_isIntegral`. The link
`Algebra.discr ℚ (powerBasis θ) = Polynomial.discr (minpoly ℤ θ)` is the companion milestone;
both objects exist upstream and are never connected. -/
example (θ : IntegralPrimitiveElement K) :
    (minpoly ℤ θ.1).discr = (index θ : ℤ) ^ 2 * NumberField.discr K :=
  sorry

/-- **Layer 3.4, index and exponent have the same prime divisors.** ⚠ The two invariants are
different integers in general (`RingOfIntegers.exponent` is the `absNorm` of the contracted
order conductor), and only the index satisfies the formula above; this is what lets a
`p ∤ exponent` hypothesis be checked by discriminant arithmetic. -/
example (θ : IntegralPrimitiveElement K) (p : ℕ) [Fact p.Prime] :
    p ∣ index θ ↔ p ∣ RingOfIntegers.exponent θ.1 :=
  sorry

/-- **Layer 3.5, the checkable hypothesis.** The implication every polynomial-side statement
below uses, proved here rather than assumed: a prime not dividing the discriminant of the
minimal polynomial does not divide the exponent. -/
example (θ : IntegralPrimitiveElement K) (p : ℕ) [Fact p.Prime]
    (hp : ¬ (p : ℤ) ∣ (minpoly ℤ θ.1).discr) :
    ¬ p ∣ RingOfIntegers.exponent θ.1 :=
  sorry

/-- **Layer 3.6, relative Kummer–Dedekind invariant matching.** The pin matches `fᵢ` with
factor degrees only over `ℤ`
(`NumberField.Ideal.inertiaDeg_primesOverSpanEquivMonicFactorsMod_symm_apply`); this is the
AKLB form against the general equivalence of `Mathlib/NumberTheory/KummerDedekind.lean`. The
`eᵢ = multiplicity` companion is the matching milestone. -/
example {R S : Type*} [CommRing R] [IsDomain R] [IsIntegrallyClosed R] [CommRing S]
    [IsDedekindDomain S] [Algebra R S] [Module.IsTorsionFree R S] {x : S}
    (hx : IsIntegral R x) {I : Ideal R} (hI : I.IsMaximal) (hI' : I ≠ ⊥)
    (hcond : (conductor R x).comap (algebraMap R S) ⊔ I = ⊤)
    {J : Ideal S} (hJ : J ∈ UniqueFactorizationMonoid.normalizedFactors
      (I.map (algebraMap R S))) :
    J.inertiaDeg R =
      (KummerDedekind.normalizedFactorsMapEquivNormalizedFactorsMinPolyMk
        hI hI' hcond hx ⟨J, hJ⟩).val.natDegree :=
  sorry

/-- **Layer 3.7, Dedekind's criterion, over `ℤ`** (Cohen §6.1). Stated for the base `ℤ` because
the criterion divides by `p`, which has no base-free meaning; a relative version needs a
chosen uniformizer and explicit localization hypotheses and is not a milestone. `φ` lists the
distinct monic irreducible factors of `f mod p` with multiplicities `e`, `Φ` lists monic lifts,
and `H` is the quotient by `p` of `f − ∏ Φᵢ^{eᵢ}` (whose coefficientwise divisibility by `p`
is a companion milestone, as is independence of the criterion from the choice of lifts).
⚠ `he` says every listed multiplicity is positive, so that `ι` indexes exactly the irreducibles
occurring in the factorization. Without it the statement is false: an index with `eᵢ = 0`
leaves both the factorization and `H` unchanged, but its `φᵢ` still has to divide `H mod p`
for the right-hand side to hold. -/
example (θ : IntegralPrimitiveElement K) (p : ℕ) [Fact p.Prime]
    {ι : Type} [Fintype ι] (φ : ι → (ZMod p)[X]) (e : ι → ℕ) (Φ : ι → ℤ[X]) (H : ℤ[X])
    (hφ : ∀ i, Irreducible (φ i)) (hφm : ∀ i, (φ i).Monic) (hinj : Function.Injective φ)
    (he : ∀ i, 0 < e i)
    (hfact : (minpoly ℤ θ.1).map (Int.castRingHom (ZMod p)) = ∏ i, φ i ^ e i)
    (hΦm : ∀ i, (Φ i).Monic)
    (hΦ : ∀ i, (Φ i).map (Int.castRingHom (ZMod p)) = φ i)
    (hH : C (p : ℤ) * H = minpoly ℤ θ.1 - ∏ i, Φ i ^ e i) :
    ¬ p ∣ index θ ↔ ∀ i, e i = 1 ∨ ¬ φ i ∣ H.map (Int.castRingHom (ZMod p)) :=
  sorry

/-- **Layer 3.8, splitting fields of rational polynomials are number fields.** Needed so that
`Polynomial.Gal f` is the Galois group of a number field and Frobenius elements are available
in it directly; without it the cycle-type theorem can only be stated in an auxiliary Galois
number field where `f` splits, and the transfer back is left implicit. -/
example (f : ℚ[X]) (hf : f ≠ 0) : NumberField f.SplittingField := sorry

open scoped Classical in
/-- **Layer 3.9, Dedekind's theorem** (the named statement supplied to the
a polynomial Galois groups roadmap): at `p` prime to the exponent with squarefree reduction,
the
degree multiset of the monic irreducible factors of `minpoly θ mod p` is the cycle type of any
Frobenius at `p` acting on the roots in a Galois number field `M` where the polynomial splits,
as partitions of `n`. ⚠ `Equiv.Perm.cycleType` omits fixed points, hence the explicit
`replicate _ 1` correction. -/
example {θ : 𝓞 K} (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) {p : ℕ} [Fact p.Prime]
    (hexp : ¬ p ∣ RingOfIntegers.exponent θ)
    (hsq : Squarefree ((minpoly ℤ θ).map (Int.castRingHom (ZMod p))))
    {M : Type*} [Field M] [NumberField M] [IsGalois ℚ M]
    [Fact (((minpoly ℚ (θ : K)).map (algebraMap ℚ M)).Splits)]
    {Q : Ideal (𝓞 M)} [Q.IsPrime] [Q.LiesOver (Ideal.span {(p : ℤ)})]
    {σ : M ≃ₐ[ℚ] M} (hσ : IsArithFrobAt ℤ σ Q) :
    (RingOfIntegers.monicFactorsMod θ p).val.map Polynomial.natDegree =
      (Polynomial.Gal.galActionHom (minpoly ℚ (θ : K)) M
          (Polynomial.Gal.restrict (minpoly ℚ (θ : K)) M σ)).cycleType +
        Multiset.replicate
          (Nat.card (Function.fixedPoints
            (Polynomial.Gal.galActionHom (minpoly ℚ (θ : K)) M
              (Polynomial.Gal.restrict (minpoly ℚ (θ : K)) M σ)))) 1 :=
  sorry

attribute [local instance] Polynomial.Gal.splits_ℚ_ℂ

open scoped Classical in
/-- **Layer 3.10, the polynomial-side corollary, for arbitrary monic `f`.** This is the exact
interface a polynomial Galois groups roadmap uses, and it uses it on **reducible** `f` (it
derives the classical mod-`p` irreducibility criterion from it), so the statement genuinely
covers reducible `f` and the reduction to irreducible factors is a milestone, not an
afterthought: `p ∤ f.discr` gives separability and pairwise coprime reductions of the
`ℤ`-irreducible factors, the root set is their disjoint union, full cycle type and
factor-degree multisets are both additive along that decomposition, and one Frobenius upstairs
restricts to a Frobenius on each factor's field. The right side restores fixed points, matching
the `fullCycleType` such a roadmap uses.

This milestone is consumed **by name**: the polynomial Galois groups roadmap imports it and
derives its membership statement from it, so the declaration is named here rather than left as
an anonymous milestone. Changing its signature breaks that consumer's contract check. -/
theorem exists_gal_fullCycleType_eq_factorizationType
    (f : ℤ[X]) (hf : f.Monic) (p : ℕ) [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ f.discr) :
    ∃ σ : (f.map (Int.castRingHom ℚ)).Gal,
      (Polynomial.Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ σ).cycleType +
          Multiset.replicate
            (Fintype.card ((f.map (Int.castRingHom ℚ)).rootSet ℂ) -
              (Polynomial.Gal.galActionHom
                (f.map (Int.castRingHom ℚ)) ℂ σ).support.card) 1 =
        Multiset.map (fun g => g.natDegree)
          (UniqueFactorizationMonoid.normalizedFactors (f.map (Int.castRingHom (ZMod p)))) :=
  sorry

/-- **Layer 3.11, common index divisors, and the counting obstruction.** Dedekind's field is the
worked instance: `2` splits completely into three primes of residue degree `1`, but `𝔽₂` has
only two monic linear polynomials, so no integral generator can have index prime to `2`. -/
example (p : ℕ) [Fact p.Prime]
    (hsplit : (Ideal.primesOver (Ideal.span {(p : ℤ)}) (𝓞 K)).ncard = Module.finrank ℚ K)
    (hcount : Nat.card {g : (ZMod p)[X] // g.Monic ∧ Irreducible g ∧ g.natDegree = 1} <
      Module.finrank ℚ K) :
    ∀ θ : IntegralPrimitiveElement K, p ∣ index θ :=
  sorry

/-! ## Layer 4: the relative discriminant, algebraically -/

/-- **Layer 4.1, the relative discriminant ideal, as a definition.** The central new object of
Layer 4, carrying exactly the hypotheses `Ideal.relNorm` and `differentIdeal` carry and no
others; in particular no separability hypothesis, since the definition needs none. ⚠ Every
statement below uses this name. Expanding it in place as `Ideal.relNorm A (differentIdeal A B)`
would leave the roadmap with a relative norm of a different and no relative discriminant. -/
noncomputable def relDiscr (A B : Type*) [CommRing A] [IsDedekindDomain A]
    [CommRing B] [IsDedekindDomain B] [Algebra A B] [Module.Finite A B]
    [Module.IsTorsionFree A B] : Ideal A :=
  Ideal.relNorm A (differentIdeal A B)

/-- **Layer 4.1, the two facts that hold with no separability hypothesis.** -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] :
    relDiscr (𝓞 K) (𝓞 L) = ⊥ ↔ differentIdeal (𝓞 K) (𝓞 L) = ⊥ :=
  sorry

/-- **Layer 4.2, the relative discriminant ideal, reconciled.** The relative discriminant over
`ℤ` is the ideal generated by the absolute discriminant: the ideal-level sharpening of the pin's
`NumberField.absNorm_differentIdeal`. -/
example : relDiscr ℤ (𝓞 K) = Ideal.span {NumberField.discr K} :=
  sorry

/-- **Layer 4.2, the relative discriminant in towers** (Neukirch III (2.10)):
`𝔡_{M/K} = 𝔡_{L/K}^{[M:L]} · N_{L/K}(𝔡_{M/L})` at the level of discriminant ideals, from
the pin's different-ideal transitivity (`differentIdeal_eq_differentIdeal_mul_differentIdeal`)
and multiplicativity of `Ideal.relNorm`. The pin has only the absolute `ℤ`-version
(`NumberField.natAbs_discr_eq_absNorm_differentIdeal_mul_natAbs_discr_pow`); the relative
statement is absent upstream. -/
example {L M : Type*} [Field L] [NumberField L] [Field M] [NumberField M] [Algebra K L]
    [Algebra L M] [Algebra K M] [IsScalarTower K L M] :
    relDiscr (𝓞 K) (𝓞 M) =
      relDiscr (𝓞 K) (𝓞 L) ^ Module.finrank L M *
        Ideal.relNorm (𝓞 K) (relDiscr (𝓞 L) (𝓞 M)) :=
  sorry

/-- **Layer 4.2, the relative discriminant localizes.** ⚠ "`relDiscr A B` localized at `p`" is
not a statement until both localizations are named. `Aₚ` is the localization of `A` at
`p.primeCompl`, `Bₚ` is the localization of `B` at the image of `p.primeCompl` under
`algebraMap A B` (`Algebra.algebraMapSubmonoid`), and the equation is one of ideals of `Aₚ` along
the ideal map of `algebraMap A Aₚ`. The canonical instance is `Aₚ = Localization.AtPrime p` and
`Bₚ = Localization (Algebra.algebraMapSubmonoid B p.primeCompl)`, with the algebra structure
`localizationAlgebra p.primeCompl B`; the statement is for an arbitrary `IsLocalization` pair so
that a caller holding its own localization needs no transport along an isomorphism. -/
example {A B : Type*} [CommRing A] [IsDedekindDomain A] [CommRing B] [IsDedekindDomain B]
    [Algebra A B] [Module.Finite A B] [Module.IsTorsionFree A B]
    (p : Ideal A) [p.IsPrime]
    (Aₚ Bₚ : Type*) [CommRing Aₚ] [IsDedekindDomain Aₚ] [CommRing Bₚ] [IsDedekindDomain Bₚ]
    [Algebra A Aₚ] [IsLocalization p.primeCompl Aₚ]
    [Algebra B Bₚ] [IsLocalization (Algebra.algebraMapSubmonoid B p.primeCompl) Bₚ]
    [Algebra Aₚ Bₚ] [Algebra A Bₚ] [IsScalarTower A Aₚ Bₚ] [IsScalarTower A B Bₚ]
    [Module.Finite Aₚ Bₚ] [Module.IsTorsionFree Aₚ Bₚ] :
    (relDiscr A B).map (algebraMap A Aₚ) = relDiscr Aₚ Bₚ :=
  sorry

/-- **Layer 4.2, ramified if and only if it divides the relative discriminant**
(Neukirch III (2.12)), generalizing the pin's `ℚ`-only
`NumberField.not_dvd_discr_iff_forall_liesOver`. The Dedekind-generic contract defines
ramification as the existence of a prime above `p` where `Algebra.IsUnramifiedAt` fails; `e > 1`
is only the number-field corollary. The displayed number-field form is the negated universal
spelling of that existential. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (p : Ideal (𝓞 K)) [p.IsMaximal] (hp : p ≠ ⊥) :
    ¬ p ∣ relDiscr (𝓞 K) (𝓞 L) ↔
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver p], Algebra.IsUnramifiedAt (𝓞 K) Q :=
  sorry

/-- **Layer 4.3, the ramified support**, as a named `Finset`. It exists because
`relDiscr (𝓞 K) (𝓞 L) ≠ ⊥`, which needs separability of the fraction fields and is automatic for
number fields. Feeding this `Finset` and the membership lemma below into Layer 2.5's
`artinHomAway` gives the classical Artin map on the fractional ideals prime to the discriminant.
The dependency runs this way and not the other: Layer 2.5 takes its excluded set as a parameter
and does not mention `relDiscr`. -/
noncomputable def ramifiedSupport (K : Type*) [Field K] [NumberField K]
    (L : Type*) [Field L] [NumberField L] [Algebra K L] :
    Finset (HeightOneSpectrum (𝓞 K)) :=
  sorry

/-- **Layer 4.3, membership in the ramified support.** -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] (v : HeightOneSpectrum (𝓞 K)) :
    v ∈ ramifiedSupport K L ↔ v.asIdeal ∣ relDiscr (𝓞 K) (𝓞 L) :=
  sorry

/-- **Layer 4.3, primes outside `ramifiedSupport` are unramified.** This uses only the relative
discriminant criterion; it is the input to the Artin-map adapter below. -/
theorem isUnramifiedAway_ramifiedSupport {L : Type*} [Field L] [NumberField L] [Algebra K L] :
    ∀ v : HeightOneSpectrum (𝓞 K), v ∉ ramifiedSupport K L →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal],
        Algebra.IsUnramifiedAt (𝓞 K) Q :=
  sorry

/-- **Layer 4.3, the Artin map away from the ramified support.** The core support definition is
independent of Layer 2.5; this later adapter is where the dependency on `artinHomAway` belongs. -/
noncomputable def artinHomAway_ramifiedSupport {L : Type*} [Field L] [NumberField L]
    [Algebra K L] [IsGalois K L] (hab : ∀ σ τ : L ≃ₐ[K] L, Commute σ τ) :
    idealsAway (K := K) (ramifiedSupport K L) →* (L ≃ₐ[K] L) :=
  artinHomAway (L := L) hab (ramifiedSupport K L) isUnramifiedAway_ramifiedSupport

/-- **Layer 4.5, Stickelberger's congruence** (absent upstream): the discriminant of a number
field is `0` or `1 mod 4`. -/
example : NumberField.discr K % 4 = 0 ∨ NumberField.discr K % 4 = 1 :=
  sorry

/-! ## Layer 5: the global–local dictionary at finite places

⚠ The pin's own `Module.Finite K_v L_w` instance quantifies over an **arbitrary**
`[Algebra K_v L_w] [ContinuousSMul K_v L_w] [IsScalarTower K K_v L_w]`, so a theorem stated
that way is a theorem about an arbitrary compatible structure and can be about the wrong
extension. Nothing in this section does that. The comparison maps are named objects, not
existence statements: `∃! f, …` fixes a map mathematically but leaves later theorems with
nothing to be about, and `Nonempty (… ≃ …)` does not even do that. -/

/-- **Layer 5.1, the canonical valuative relation on a completion.** It is induced by the
existing completion valuation. In particular, the local-field theorem below is not quantified
over an arbitrary `ValuativeRel`, which need not induce the completion topology. -/
@[implicit_reducible]
noncomputable def adicCompletionValuativeRel (v : HeightOneSpectrum (𝓞 K)) :
    ValuativeRel (v.adicCompletion K) :=
  ValuativeRel.ofValuation (Valued.v : Valuation (v.adicCompletion K) _)

attribute [local instance] adicCompletionValuativeRel

/-- **Layer 5.1, the completion topology is the topology of the canonical relation.** -/
noncomputable instance adicCompletionIsValuativeTopology
    (v : HeightOneSpectrum (𝓞 K)) : IsValuativeTopology (v.adicCompletion K) :=
  sorry

/-- **Layer 5.1, the canonical relation is nontrivial.** Kept separate from the topology
comparison because both are fields of `IsNonarchimedeanLocalField`. -/
noncomputable instance adicCompletionValuativeRelIsNontrivial
    (v : HeightOneSpectrum (𝓞 K)) :
    ValuativeRel.IsNontrivial (v.adicCompletion K) :=
  sorry

/-- **Layer 5.1, completions of number fields are local fields.** The full class, not merely
local compactness, which is one of its corollaries. The preceding declarations fix the relation
from the completion valuation and prove its topology and nontriviality; no arbitrary relation is
accepted. -/
theorem isNonarchimedeanLocalField_adicCompletion
    (v : HeightOneSpectrum (𝓞 K)) :
    IsNonarchimedeanLocalField (v.adicCompletion K) :=
  sorry

/-- **Layer 5.1, the supplier-facing local instance.** This wrapper lets the imported #189
contracts infer the canonical local-field structure rather than accepting an unrelated one. -/
noncomputable local instance adicCompletionIsNonarchimedeanLocalField
    (v : HeightOneSpectrum (𝓞 K)) :
    IsNonarchimedeanLocalField (v.adicCompletion K) :=
  isNonarchimedeanLocalField_adicCompletion v

/-- **Layer 5.2, the canonical completion of an extension**, as an object. For `w ∣ v` there is
exactly one continuous ring map `K_v → L_w` compatible with `K → L`, and this is it; every
theorem below is about this map. -/
noncomputable def completionAlgHom {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    v.adicCompletion K →ₐ[K] w.adicCompletion L :=
  sorry

/-- **Layer 5.2, continuity of the canonical map.** -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    Continuous (completionAlgHom (K := K) v w) :=
  sorry

/-- **Layer 5.2, uniqueness of the canonical map**: any continuous ring map extending `K → L`
is it. This is what licenses calling it *the* completion of the extension. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal]
    (f : v.adicCompletion K →+* w.adicCompletion L) (hf : Continuous f)
    (hcomp : ∀ x : K, f (algebraMap K (v.adicCompletion K) x) =
      algebraMap L (w.adicCompletion L) (algebraMap K L x)) :
    f = (completionAlgHom (K := K) v w : v.adicCompletion K →+* w.adicCompletion L) :=
  sorry

/-- **Layer 5.2, the tower equation.** For `K ⊆ M ⊆ L` with `w ∣ u ∣ v`, the three canonical
maps compose. It follows from the uniqueness statement above, because the left side is
continuous and extends `K → L`. -/
example {M L : Type*} [Field M] [NumberField M] [Algebra K M]
    [Field L] [NumberField L] [Algebra K L] [Algebra M L] [IsScalarTower K M L]
    (v : HeightOneSpectrum (𝓞 K)) (u : HeightOneSpectrum (𝓞 M)) (w : HeightOneSpectrum (𝓞 L))
    [u.asIdeal.LiesOver v.asIdeal] [w.asIdeal.LiesOver u.asIdeal]
    [w.asIdeal.LiesOver v.asIdeal] :
    (completionAlgHom (K := M) u w).toRingHom.comp (completionAlgHom (K := K) v u).toRingHom =
      (completionAlgHom (K := K) v w).toRingHom :=
  sorry

/-- **Layer 5.2, the algebra structure the canonical map induces.** Everything downstream uses
this instance and no other; with an arbitrary compatible structure the statements below could
be about a different extension. -/
@[reducible] noncomputable def completionAlgebra {L : Type*} [Field L] [NumberField L]
    [Algebra K L] (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    Algebra (v.adicCompletion K) (w.adicCompletion L) :=
  (completionAlgHom v w : v.adicCompletion K →+* w.adicCompletion L).toAlgebra

attribute [local instance] completionAlgebra

/-- **Layer 5.2, valuation-order compatibility for the canonical completion map.** The
construction of `completionAlgHom` uses
`IsDedekindDomain.HeightOneSpectrum.uniformContinuous_algebraMap_liesOver` before applying
`UniformSpace.Completion.extensionHom`; this theorem is the valuation statement that remains
after extension. -/
theorem completionAlgHom_vle_iff_vle {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] (a b : v.adicCompletion K) :
    completionAlgHom v w a ≤ᵥ completionAlgHom v w b ↔ a ≤ᵥ b :=
  sorry

/-- **Layer 5.2, the canonical local extension is valuative.** Every invocation of #189's
local `(e,f)`, integer-ring, filtration, and different API uses this instance. -/
noncomputable instance completionValuativeExtension {L : Type*} [Field L] [NumberField L]
    [Algebra K L] (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    ValuativeExtension (v.adicCompletion K) (w.adicCompletion L) where
  vle_iff_vle := completionAlgHom_vle_iff_vle v w

/-- The subtype of primes over `v` carries its `LiesOver` proof; making that an instance is
what lets `K_v`-algebra structures be found for each factor of the semi-local decomposition. -/
local instance liesOverOfMem {L : Type*} [Field L] [NumberField L] [Algebra K L]
    {v : HeightOneSpectrum (𝓞 K)}
    (w : {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal}) :
    w.1.asIdeal.LiesOver v.asIdeal := w.2

/-- **Layer 5.2, the compatibility instances for the canonical structure.** The pin states
`Module.Finite K_v L_w` for an arbitrary compatible algebra structure; here it is a statement
about `completionAlgebra`, and the pin's version is the corollary. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    IsScalarTower K (v.adicCompletion K) (w.adicCompletion L) :=
  sorry

example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    ContinuousSMul (v.adicCompletion K) (w.adicCompletion L) :=
  sorry

noncomputable local instance completionModuleFinite
    {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    Module.Finite (v.adicCompletion K) (w.adicCompletion L) :=
  sorry

open scoped TensorProduct in
/-- **Layer 5.3, the semi-local decomposition** `K_v ⊗_K L ≅ ∏_{w ∣ v} L_w` (Neukirch II (8.3)),
as a named `K_v`-algebra equivalence. The completion is written on the left so that the
`K_v`-algebra structure on the source is Mathlib's `Algebra.TensorProduct.leftAlgebra`; the
index type is the subtype of `HeightOneSpectrum (𝓞 L)` lying over `v`, and its named
equivalence with `Ideal.primesOver v.asIdeal (𝓞 L)` is a companion milestone so that both
spellings are available. Consequence: `Σ_{w ∣ v} [L_w : K_v] = [L : K]`, the finite-place
analogue of the pin's archimedean `InfinitePlace.sum_inertiaDeg_eq_finrank`. -/
noncomputable def semilocalEquiv {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) :
    (v.adicCompletion K ⊗[K] L) ≃ₐ[v.adicCompletion K]
      ((w : {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal}) →
        w.1.adicCompletion L) :=
  sorry

open scoped TensorProduct in
/-- **Layer 5.3, what the semi-local equivalence does.** Its value on pure tensors is what pins
it down; without this the definition above could be any of many equivalences and no
compatibility theorem downstream would mean anything. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (a : v.adicCompletion K) (x : L)
    (w : {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal}) :
    semilocalEquiv v (a ⊗ₜ x) w =
      algebraMap (v.adicCompletion K) (w.1.adicCompletion L) a *
        algebraMap L (w.1.adicCompletion L) x :=
  sorry

/-- **Layer 5.5, the local degree is `e·f` at a finite place**, with `e` and `f` the *global*
`Ideal.ramificationIdx` and `Ideal.inertiaDeg`. The equality of the local and the global factor
pairs is this milestone. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    Module.finrank (v.adicCompletion K) (w.adicCompletion L) =
      w.asIdeal.ramificationIdx (𝓞 K) * w.asIdeal.inertiaDeg (𝓞 K) :=
  sorry

/-- **Layer 5.6, the decomposition group is the local Galois group** (Neukirch II §9), again as
a named map: continuous extension of the action on `L`. -/
noncomputable def decompositionHom {L : Type*} [Field L] [NumberField L] [Algebra K L]
    [IsGalois K L] (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    MulAction.stabilizer (L ≃ₐ[K] L) w.asIdeal →*
      ((w.adicCompletion L) ≃ₐ[v.adicCompletion K] (w.adicCompletion L)) :=
  sorry

/-- **Layer 5.6, what `decompositionHom` does**: it extends the action on the dense image of
`L`, which is also what forces injectivity. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal]
    (σ : MulAction.stabilizer (L ≃ₐ[K] L) w.asIdeal) (x : L) :
    decompositionHom v w σ (algebraMap L (w.adicCompletion L) x) =
      algebraMap L (w.adicCompletion L) ((σ : L ≃ₐ[K] L) x) :=
  sorry

/-- **Layer 5.6, the completion isomorphism induced by an automorphism.** `σ` carries `w` to
`w'`, so it extends continuously to an isomorphism of the two completions. This is the map the
conjugation square below needs, and writing it down is what removes the placeholder from that
square. -/
noncomputable def completionCongr {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w w' : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] [w'.asIdeal.LiesOver v.asIdeal]
    (σ : L ≃ₐ[K] L) (hσ : σ • w.asIdeal = w'.asIdeal) :
    w.adicCompletion L ≃ₐ[v.adicCompletion K] w'.adicCompletion L :=
  sorry

/-- **Layer 5.6, what `completionCongr` does.** -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w w' : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] [w'.asIdeal.LiesOver v.asIdeal]
    (σ : L ≃ₐ[K] L) (hσ : σ • w.asIdeal = w'.asIdeal) (x : L) :
    completionCongr v w w' σ hσ (algebraMap L (w.adicCompletion L) x) =
      algebraMap L (w'.adicCompletion L) (σ x) :=
  sorry

/-- **Layer 5.6, the conjugation square.** Conjugating in the stabilizer corresponds to
conjugating by `completionCongr σ`. Stated on the dense image of `L`, which determines it. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (v : HeightOneSpectrum (𝓞 K)) (w w' : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] [w'.asIdeal.LiesOver v.asIdeal]
    (σ : L ≃ₐ[K] L) (hσ : σ • w.asIdeal = w'.asIdeal)
    (τ : MulAction.stabilizer (L ≃ₐ[K] L) w.asIdeal)
    (hτ : σ * (τ : L ≃ₐ[K] L) * σ⁻¹ ∈ MulAction.stabilizer (L ≃ₐ[K] L) w'.asIdeal) (x : L) :
    decompositionHom v w' ⟨σ * (τ : L ≃ₐ[K] L) * σ⁻¹, hτ⟩
        (algebraMap L (w'.adicCompletion L) x) =
      completionCongr v w w' σ hσ
        (decompositionHom v w τ (algebraMap L (w.adicCompletion L) (σ⁻¹ x))) :=
  sorry

/-- **Layer 5.6, `decompositionHom` is bijective**, hence the isomorphism `D_Q ≅ Gal(L_w/K_v)`.
Compatibility with the residue maps, and the fact that it carries `IsArithFrobAt` to the
local Frobenius, are the companion milestones: the two conventions agree by
construction, and this is what makes that agreement a theorem. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    Function.Bijective (decompositionHom v w) :=
  sorry

/-- **Layer 5.6, the supplier-facing local Galois instance.** It is obtained from the
decomposition-group equivalence above, and lets #189's Galois-only filtration theorem be
applied to the canonical completion rather than to an abstract local extension. -/
noncomputable local instance completionIsGalois
    {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    IsGalois (v.adicCompletion K) (w.adicCompletion L) :=
  sorry

/-- **Layer 5.7, the canonical map on completed integer rings**, as a named map. The completion
map carries `𝓞_{K_v}` into `𝓞_{L_w}`, and this is that restriction. -/
noncomputable def completionIntegersAlgHom {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    v.adicCompletionIntegers K →+* w.adicCompletionIntegers L :=
  sorry

/-- **Layer 5.7, the square with `completionAlgHom`.** This is what says the restriction is the
right one. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] (x : v.adicCompletionIntegers K) :
    ((completionIntegersAlgHom v w x : w.adicCompletionIntegers L) : w.adicCompletion L) =
      completionAlgHom v w (x : v.adicCompletion K) :=
  sorry

/-- **Layer 5.7, the canonical map on completed integer rings.** The completion map carries
`𝓞_{K_v}` into `𝓞_{L_w}`; this is the algebra structure the local different is formed for. -/
@[reducible] noncomputable def completionIntegersAlgebra {L : Type*} [Field L] [NumberField L]
    [Algebra K L] (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    Algebra (v.adicCompletionIntegers K) (w.adicCompletionIntegers L) :=
  sorry

attribute [local instance] completionIntegersAlgebra

/-- **Layer 5.7, the completed integer rings form a torsion-free extension.** Part of the same
milestone: without it `differentIdeal` cannot even be formed for the local extension. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    Module.IsTorsionFree (v.adicCompletionIntegers K) (w.adicCompletionIntegers L) :=
  sorry

/-! ### Layer 5.7, the integral-closure package

Layer 6.3's named route is Mathlib's `conductor_mul_differentIdeal`, which at the pin takes
`[IsFractionRing A K]`, `[FiniteDimensional K L]`, `[Algebra.IsSeparable K L]`,
`[IsIntegralClosure B A L]`, `[IsIntegrallyClosed A]`, `[IsDedekindDomain B]`,
`[Module.IsTorsionFree A B]`, `[IsScalarTower A K L]` and `[IsScalarTower A B L]`. The
declarations below are that list at `A = 𝓞_{K_v}`, `K = K_v`, `B = 𝓞_{L_w}`, `L = L_w`. The three
that the pin already supplies are recorded with `by infer_instance` rather than as milestones,
and the last statement of the block applies the Mathlib theorem, so the bridge is checked here
and not asserted. -/

/-- **Layer 5.7, supplied by the pin.** `v.adicCompletionIntegers K` is a `ValuationSubring`, and
a `ValuationSubring` is a fraction ring of its own field. -/
example (v : HeightOneSpectrum (𝓞 K)) :
    IsFractionRing (v.adicCompletionIntegers K) (v.adicCompletion K) := by infer_instance

/-- **Layer 5.7, supplied by the pin**, through `IsDiscreteValuationRing (adicCompletionIntegers)`
and the integral closedness of a valuation subring. -/
example (v : HeightOneSpectrum (𝓞 K)) :
    IsDedekindDomain (v.adicCompletionIntegers K) := by infer_instance

example (v : HeightOneSpectrum (𝓞 K)) :
    IsIntegrallyClosed (v.adicCompletionIntegers K) := by infer_instance

/-- **Layer 5.7, the algebra structure of `𝓞_{K_v}` on `L_w`**, as the composite of the map on
integer rings with the inclusion. Both scalar towers below are stated for this structure. -/
@[reducible] noncomputable def completionIntegersFieldAlgebra {L : Type*} [Field L]
    [NumberField L] [Algebra K L] (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    Algebra (v.adicCompletionIntegers K) (w.adicCompletion L) :=
  ((algebraMap (w.adicCompletionIntegers L) (w.adicCompletion L)).comp
    (algebraMap (v.adicCompletionIntegers K) (w.adicCompletionIntegers L))).toAlgebra

attribute [local instance] completionIntegersFieldAlgebra

example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    IsScalarTower (v.adicCompletionIntegers K) (w.adicCompletionIntegers L)
      (w.adicCompletion L) :=
  sorry

example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    IsScalarTower (v.adicCompletionIntegers K) (v.adicCompletion K) (w.adicCompletion L) :=
  sorry

/-- **Layer 5.7, separability of the local fraction-field extension.** ⚠ Not an instance at the
pin: the completions have characteristic zero, but `CharZero (v.adicCompletion K)` is itself not
an instance there, so nothing fires. It is a milestone, not a citation. -/
noncomputable local instance completionIsSeparable
    {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    Algebra.IsSeparable (v.adicCompletion K) (w.adicCompletion L) :=
  sorry

/-- **Layer 5.7, `𝓞_{L_w}` is the integral closure of `𝓞_{K_v}` in `L_w`.** The content is one of
the two halves: every element of `𝓞_{L_w}` is integral over `𝓞_{K_v}`, because the valuation of
`L_w` is the unique extension of the valuation of `K_v`, so a minimal polynomial over `K_v` has
integral coefficients. The other half is the pin's `Valuation.Integers.mem_of_integral`, since a
valuation subring is integrally closed in its own field. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal]
    [IsScalarTower (v.adicCompletionIntegers K) (w.adicCompletionIntegers L)
      (w.adicCompletion L)] :
    IsIntegralClosure (w.adicCompletionIntegers L) (v.adicCompletionIntegers K)
      (w.adicCompletion L) :=
  sorry

/-- **Layer 5.7, module finiteness of the completed integer rings**, from the integral closure
above and `FiniteDimensional K_v L_w` of Layer 5.2, over the Dedekind base. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    Module.Finite (v.adicCompletionIntegers K) (w.adicCompletionIntegers L) :=
  sorry

/-- **Layer 5.8, the two spellings of the local integer ring.** `adicCompletionIntegers` is
Mathlib's valuation subring of an adic completion; `(ValuativeRel.valuation _).integer` is the
one #189 states its local theorems about. They are the same subring, but not definitionally, so
the identification is a milestone of this roadmap — it is the global-to-local dictionary, and
#189 cannot state it. ⚠ Every completion-facing adapter below goes through it; do not restate a
supplier theorem in the other spelling instead. -/
theorem adicCompletionIntegers_eq_valuationInteger {L : Type*} [Field L] [NumberField L]
    (w : HeightOneSpectrum (𝓞 L)) :
    (w.adicCompletionIntegers L).toSubring =
      (ValuativeRel.valuation (w.adicCompletion L)).integer :=
  sorry

/-- **Layer 5.8, the completion-facing local-monogenicity adapter.** Apply #189's
`LocalFieldsRamification.exists_integerRing_adjoin_eq_top` after Layers 5.1, 5.2, and 5.7
discharge its hypotheses for the canonical completion. This roadmap does not reprove the local
theorem; it is stated in the supplier's own spelling of the integer ring, and
`adicCompletionIntegers_eq_valuationInteger` is what transports it to Mathlib's. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    ∃ x : (ValuativeRel.valuation (w.adicCompletion L)).integer,
      Algebra.adjoin ((ValuativeRel.valuation (v.adicCompletion K)).integer) {x} = ⊤ :=
  LocalFieldsRamification.exists_integerRing_adjoin_eq_top
    (v.adicCompletion K) (w.adicCompletion L)

/-- **Layer 5.8, the field-level form of the imported generator.** This is the adapter used by
global completion arguments; the ring-level supplier theorem is stronger. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] (x : w.adicCompletionIntegers L)
    (hx : Algebra.adjoin (v.adicCompletionIntegers K) {x} = ⊤) :
    Algebra.adjoin (v.adicCompletion K)
      {algebraMap (w.adicCompletionIntegers L) (w.adicCompletion L) x} = ⊤ :=
  sorry

/-- **Layer 5.9, the different localizes** (Neukirch III (2.2)(iii)), written with the actual
ideal map into the completed integer ring rather than as informal multiplication by
`𝓞_{L_w}`. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal]
    [Module.IsTorsionFree (v.adicCompletionIntegers K) (w.adicCompletionIntegers L)] :
    (differentIdeal (𝓞 K) (𝓞 L)).map (algebraMap (𝓞 L) (w.adicCompletionIntegers L)) =
      differentIdeal (v.adicCompletionIntegers K) (w.adicCompletionIntegers L) :=
  sorry

/-- **Layer 5.10, the relative discriminant valuation, with the residue-degree weights written
out.** In the multiplicity normalization pinned by the conventions table, and stated with a
`finsum` so that no finiteness instance has to be threaded through. This is where every
exponent computation of Layer 6 lands. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] (v : HeightOneSpectrum (𝓞 K)) :
    multiplicity v.asIdeal (relDiscr (𝓞 K) (𝓞 L)) =
      ∑ᶠ P ∈ Ideal.primesOver v.asIdeal (𝓞 L),
        P.inertiaDeg (𝓞 K) * multiplicity P (differentIdeal (𝓞 K) (𝓞 L)) :=
  sorry

/-! ## Layer 6: global ramification consequences

This layer computes the exponents of the different and of the discriminant from Layer 5 and
the Local Fields and Ramification roadmap #189. It builds no local ramification theory.

Layer 6.1 imports the canonical `ℤ`-indexed
`LocalFieldsRamification.lowerRamificationGroup`. The closed checks below apply all five #189
contracts used by this roadmap to the canonical completions, so changes to the supplier's
namespace, hypotheses, or result types fail elaboration here. -/

/-- **Layer 6.1, imported lower filtration, closed supplier check.** The negative-index
convention is applied at the canonical completion; no local alias or duplicate group is used. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    LocalFieldsRamification.lowerRamificationGroup
        (v.adicCompletion K) (w.adicCompletion L) (-1) = ⊤ :=
  LocalFieldsRamification.lowerRamificationGroup_eq_top_of_le_neg_one
    (v.adicCompletion K) (w.adicCompletion L) (-1) (by omega)

/-- **Layer 6.1, imported Hilbert different formula, closed supplier check.** -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    LocalFieldsRamification.differentExponent
        (v.adicCompletion K) (w.adicCompletion L) =
      ∑ᶠ i : ℕ, (Nat.card (LocalFieldsRamification.lowerRamificationGroup
        (v.adicCompletion K) (w.adicCompletion L) (i : ℤ)) - 1) :=
  LocalFieldsRamification.differentExponent_eq_finsum_lowerRamificationGroup
    (v.adicCompletion K) (w.adicCompletion L)

/-- **Layer 6.1, imported tame equality criterion, closed supplier check.** -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] :
    LocalFieldsRamification.differentExponent
        (v.adicCompletion K) (w.adicCompletion L) =
        LocalFieldsRamification.ramificationIndex
          (v.adicCompletion K) (w.adicCompletion L) - 1 ↔
      LocalFieldsRamification.IsTamelyRamified
        (v.adicCompletion K) (w.adicCompletion L) :=
  LocalFieldsRamification.differentExponent_eq_ramificationIndex_sub_one_iff
    (v.adicCompletion K) (w.adicCompletion L)

/-- **Layer 6.1, imported wild bounds, closed supplier check.** -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal]
    (hwild : LocalFieldsRamification.IsWildlyRamified
      (v.adicCompletion K) (w.adicCompletion L))
    (he : (LocalFieldsRamification.ramificationIndex
      (v.adicCompletion K) (w.adicCompletion L) : w.adicCompletion L) ≠ 0) :
    LocalFieldsRamification.ramificationIndex
          (v.adicCompletion K) (w.adicCompletion L) ≤
        LocalFieldsRamification.differentExponent
          (v.adicCompletion K) (w.adicCompletion L) ∧
      LocalFieldsRamification.differentExponent
          (v.adicCompletion K) (w.adicCompletion L) ≤
        LocalFieldsRamification.ramificationIndex
            (v.adicCompletion K) (w.adicCompletion L) - 1 +
          LocalFieldsRamification.natCastValuation (w.adicCompletion L)
            (LocalFieldsRamification.ramificationIndex
              (v.adicCompletion K) (w.adicCompletion L)) he :=
  LocalFieldsRamification.differentExponent_bounds_of_wild
    (v.adicCompletion K) (w.adicCompletion L) hwild he

/-- **Layer 6.2, the global lower filtration.** Indexed by `ℕ`, so `G 0` is inertia; the
decomposition group keeps its own name and is never `G (-1)`. The definition is the easy part;
its central API is the comparison with the local filtration of `L_w/K_v` along Layer 5's
`decompositionHom`, which is how every further property is obtained. -/
noncomputable def ramificationGroup {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (Q : Ideal (𝓞 L)) (i : ℕ) : Subgroup (L ≃ₐ[K] L) where
  carrier := {σ | σ ∈ MulAction.stabilizer (L ≃ₐ[K] L) Q ∧ ∀ x : 𝓞 L,
    (galRestrict (𝓞 K) K L (𝓞 L) σ) x - x ∈ Q ^ (i + 1)}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

example {L : Type*} [Field L] [NumberField L] [Algebra K L] (Q : Ideal (𝓞 L)) :
    ramificationGroup (K := K) Q 0 = Q.inertia (L ≃ₐ[K] L) :=
  sorry

/-- **Layer 6.2, the global/local lower-filtration comparison.** This is the actual imported
supplier type, not a prose placeholder: membership is transported along the named
`decompositionHom` at the integer index `(i : ℤ)`. -/
theorem mem_ramificationGroup_iff_mem_lowerRamificationGroup
    {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] (i : ℕ)
    (σ : MulAction.stabilizer (L ≃ₐ[K] L) w.asIdeal) :
    (σ : L ≃ₐ[K] L) ∈ ramificationGroup (K := K) w.asIdeal i ↔
      decompositionHom v w σ ∈
        LocalFieldsRamification.lowerRamificationGroup
          (v.adicCompletion K) (w.adicCompletion L) (i : ℤ) :=
  sorry

/-- **Layer 6.3, the different-exponent formula** `v_Q(𝔡) = Σ_{i ≥ 0} (#G_i − 1)`.
Apply #189's Hilbert local different formula to the canonical completion, use Layer 6.2's
comparison with its `lowerRamificationGroup`, and transport the different back through Layer
5.9. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (Q : Ideal (𝓞 L)) [Q.IsPrime] (hQ : Q ≠ ⊥) :
    multiplicity Q (differentIdeal (𝓞 K) (𝓞 L)) =
      ∑ᶠ i : ℕ, (Nat.card (ramificationGroup (K := K) Q i) - 1) :=
  sorry

/-- **Layer 6.4, the exact tame exponent, restricted to number fields.** This is the global
corollary of #189's local tame equality criterion, transported through the canonical completion
and Layer 5.9. The equality, rather than only its weaker non-divisibility consequence, is the
contract consumed by discriminant and conductor calculations. The roadmap makes no unsupported
Dedekind-generic claim. -/
theorem multiplicity_differentIdeal_eq_ramificationIdx_sub_one_of_tame
    {L : Type*} [Field L] [NumberField L] [Algebra K L]
    {p : Ideal (𝓞 K)} [p.IsMaximal] (hp : p ≠ ⊥)
    {P : Ideal (𝓞 L)} [P.IsPrime] [P.LiesOver p]
    (htame : ¬ ringChar (𝓞 K ⧸ p) ∣ P.ramificationIdx (𝓞 K)) :
    multiplicity P (differentIdeal (𝓞 K) (𝓞 L)) =
      P.ramificationIdx (𝓞 K) - 1 :=
  sorry

/-- **Layer 6.4, the missing exponent bridge.** The normalized valuation of a natural-number
cast in the completion is the multiplicity of the global prime in the corresponding principal
ideal. The proof uses `maximalIdeal_map_completion`, its power compatibility and contraction,
and the DVR valuation/multiplicity characterization. -/
theorem natCastValuation_completion_eq_multiplicity_span
    {L : Type*} [Field L] [NumberField L] [Algebra K L]
    (v : HeightOneSpectrum (𝓞 K)) (w : HeightOneSpectrum (𝓞 L))
    [w.asIdeal.LiesOver v.asIdeal] (n : ℕ) (hn : (n : w.adicCompletion L) ≠ 0) :
    LocalFieldsRamification.natCastValuation (w.adicCompletion L) n hn =
      multiplicity w.asIdeal (Ideal.span {(n : 𝓞 L)}) :=
  sorry

/-- **Layer 6.4, the wild bounds**, restricted to number fields and imported from #189's local
different bounds. Here `v_P(e)` is the multiplicity of `P` in the ideal generated by `e`, in the
same normalization as `v_P(𝔡)`; the preceding natural-cast theorem supplies the exponent bridge,
while Layer 5.9 transports the different itself. -/
example {L : Type*} [Field L] [NumberField L] [Algebra K L]
    {p : Ideal (𝓞 K)} [p.IsMaximal] (hp : p ≠ ⊥)
    {P : Ideal (𝓞 L)} [P.IsPrime] [P.LiesOver p]
    (hwild : ringChar (𝓞 K ⧸ p) ∣ P.ramificationIdx (𝓞 K))
    (he : P.ramificationIdx (𝓞 K) ≠ 0) :
    P.ramificationIdx (𝓞 K) ≤ multiplicity P (differentIdeal (𝓞 K) (𝓞 L)) ∧
      multiplicity P (differentIdeal (𝓞 K) (𝓞 L)) ≤
        P.ramificationIdx (𝓞 K) - 1 +
          multiplicity P (Ideal.span {(P.ramificationIdx (𝓞 K) : 𝓞 L)}) :=
  sorry

/-- **Layer 6.5, the permutation-action discriminant exponent formula.** Both sides are
integers and no conductor object appears: `#(G i ⊓ H)` is the number of elements of `G i`
fixing the chosen base point of `G/H`, so each summand counts the elements of `G i` that move
that base point. It is not the number of fixed cosets. A future ArtinRepresentations roadmap
may recognize this integer as an Artin conductor; that identification is theirs and is needed
by nothing here. -/
example {L : Type*} [Field L] [NumberField L] [IsGalois ℚ L] (M : IntermediateField ℚ L)
    (Q : Ideal (𝓞 L)) [Q.IsPrime] (hQ : Q ≠ ⊥) :
    Q.ramificationIdx (𝓞 M) *
        multiplicity (Q.under (𝓞 M)) (differentIdeal ℤ (𝓞 M)) =
      ∑ᶠ i : ℕ, (Nat.card (ramificationGroup (K := ℚ) Q i) -
        Nat.card ((ramificationGroup (K := ℚ) Q i ⊓ M.fixingSubgroup :
          Subgroup (L ≃ₐ[ℚ] L)))) :=
  sorry

/-! ## Layer 7: subfields, integral bases, monogenicity, and explicit units -/

/-! ### Layer 7.1: a specified normal closure and its intrinsic permutation action -/

/-- **Layer 7.1, the Galois-closure carrier.** Besides the chosen embedding `K → M`, it records
the actual normal-closure condition: the conjugates of the embedded copy of `K` generate `M`.
Merely assuming that `M/ℚ` is Galois would not make the permutation action faithful. -/
structure NormalClosureData (K M : Type*) [Field K] [NumberField K]
    [Field M] [NumberField M] [IsGalois ℚ M] where
  embedding : K →ₐ[ℚ] M
  adjoin_orbit_eq_top :
    Algebra.adjoin ℚ
      (Set.range fun p : (M ≃ₐ[ℚ] M) × K => p.1 (embedding p.2)) = ⊤

/-- **Layer 7.1, the canonical finite carrier.** The Galois group acts on the `ℚ`-embeddings
of `K` into its specified normal closure by postcomposition. -/
noncomputable def NormalClosureData.embeddingAction
    {K M : Type*} [Field K] [NumberField K]
    [Field M] [NumberField M] [IsGalois ℚ M] (N : NormalClosureData K M) :
    (M ≃ₐ[ℚ] M) →* Equiv.Perm (K →ₐ[ℚ] M) :=
  sorry

/-- **Layer 7.1, characteristic formula for the action.** -/
theorem NormalClosureData.embeddingAction_apply
    {K M : Type*} [Field K] [NumberField K]
    [Field M] [NumberField M] [IsGalois ℚ M] (N : NormalClosureData K M)
    (σ : M ≃ₐ[ℚ] M) (φ : K →ₐ[ℚ] M) :
    N.embeddingAction σ φ = σ.toAlgHom.comp φ :=
  sorry

/-- **Layer 7.1, faithfulness.** An automorphism fixing every conjugate of `K` fixes their
compositum, which is all of `M` by `adjoin_orbit_eq_top`. -/
theorem NormalClosureData.embeddingAction_injective
    {K M : Type*} [Field K] [NumberField K]
    [Field M] [NumberField M] [IsGalois ℚ M] (N : NormalClosureData K M) :
    Function.Injective N.embeddingAction :=
  sorry

/-- **Layer 7.1, transitivity on embeddings.** This is the intrinsic form of the transitive
permutation representation, before choosing coordinates `Fin n`. -/
theorem NormalClosureData.embeddingAction_isPretransitive
    {K M : Type*} [Field K] [NumberField K]
    [Field M] [NumberField M] [IsGalois ℚ M] (N : NormalClosureData K M)
    (φ ψ : K →ₐ[ℚ] M) :
    ∃ σ : M ≃ₐ[ℚ] M, N.embeddingAction σ φ = ψ :=
  sorry

/-- **Layer 7.1, the intrinsic carrier has cardinality `[K : ℚ]`.** -/
theorem NormalClosureData.card_embeddings
    {K M : Type*} [Field K] [NumberField K]
    [Field M] [NumberField M] [IsGalois ℚ M] (N : NormalClosureData K M) :
    Fintype.card (K →ₐ[ℚ] M) = Module.finrank ℚ K :=
  sorry

/-- **Layer 7.1, the subgroup fixing the chosen copy of `K`.** This is the precise carrier
denoted `Gal(M/K)` in the prose. -/
def NormalClosureData.fixingSubgroup
    {K M : Type*} [Field K] [NumberField K]
    [Field M] [NumberField M] [IsGalois ℚ M] (N : NormalClosureData K M) :
    Subgroup (M ≃ₐ[ℚ] M) where
  carrier := {σ | σ.toAlgHom.comp N.embedding = N.embedding}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- **Layer 7.1, the subfield/subgroup-interval dictionary.** The `OrderDual` records the
order reversal, and the subtype records exactly the interval of subgroups containing
`Gal(M/K)`. -/
noncomputable def NormalClosureData.subfieldEquivSubgroupInterval
    {K M : Type*} [Field K] [NumberField K]
    [Field M] [NumberField M] [IsGalois ℚ M] (N : NormalClosureData K M) :
    IntermediateField ℚ K ≃o
      OrderDual {H : Subgroup (M ≃ₐ[ℚ] M) // N.fixingSubgroup ≤ H} :=
  sorry

/-- **Layer 7.1, coordinates in `S_n`.** Only a chosen equivalence of the intrinsic embedding
set with `Fin n` turns the canonical action into this coordinate-dependent representation. -/
noncomputable def NormalClosureData.permutationEmbedding
    {K M : Type*} [Field K] [NumberField K]
    [Field M] [NumberField M] [IsGalois ℚ M] (N : NormalClosureData K M)
    (e : (K →ₐ[ℚ] M) ≃ Fin (Module.finrank ℚ K)) :
    (M ≃ₐ[ℚ] M) →* Equiv.Perm (Fin (Module.finrank ℚ K)) :=
  sorry

theorem NormalClosureData.permutationEmbedding_injective
    {K M : Type*} [Field K] [NumberField K]
    [Field M] [NumberField M] [IsGalois ℚ M] (N : NormalClosureData K M)
    (e : (K →ₐ[ℚ] M) ≃ Fin (Module.finrank ℚ K)) :
    Function.Injective (N.permutationEmbedding e) :=
  sorry

/-- **Layer 7.1, independence of the coordinate choice.** Replacing the identification with
`Fin n` conjugates the image in `S_n`; it does not define a different intrinsic action. -/
theorem NormalClosureData.permutationEmbedding_change_equiv
    {K M : Type*} [Field K] [NumberField K]
    [Field M] [NumberField M] [IsGalois ℚ M] (N : NormalClosureData K M)
    (e e' : (K →ₐ[ℚ] M) ≃ Fin (Module.finrank ℚ K)) :
    ∃ τ : Equiv.Perm (Fin (Module.finrank ℚ K)), ∀ σ : M ≃ₐ[ℚ] M,
      N.permutationEmbedding e' σ =
        τ * N.permutationEmbedding e σ * τ⁻¹ :=
  sorry

/-- **Layer 7.3, the monogenicity predicate.** Suggested public name and carrier:
`NumberField.IsMonogenic K`, a property of the field; it is declared in this roadmap's own
namespace here rather than claiming `NumberField.IsMonogenic` before implementation.
⚠ Search Mathlib for an existing `IsMonogenic` at implementation time, and keep it out of the
root namespace: a bare `IsMonogenic` invites a collision with a future generic ring-theoretic
version, and if such a version lands this becomes an abbreviation for it. -/
def IsMonogenic (K : Type*) [Field K] [NumberField K] : Prop :=
  ∃ θ : 𝓞 K, Algebra.adjoin ℤ {θ} = ⊤

/-- **Layer 7.2, quadratic integral bases, the `d ≡ 1 mod 4` half**: for squarefree
`d ≡ 1 mod 4`, a root of `X² − X + (1−d)/4`, that is `(1+√d)/2`, generates `𝓞 K`. The
`d ≡ 2, 3 mod 4` half (`ℤ[√d]`) and `disc = d` versus `4d` are companions; TauCeti's landed
`QuadraticIntegralBasis` is the `{1, x}`-basis seed this generalizes. -/
example {θ : 𝓞 K} {d : ℤ} (hd : Squarefree d) (hd4 : d % 4 = 1)
    (hmin : minpoly ℤ θ = X ^ 2 - X + C ((1 - d) / 4))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    Algebra.adjoin ℤ {θ} = ⊤ :=
  sorry

/-- **Layer 7.2 ⚠ dyadic acceptance**: `2` splits in `ℚ(√d)` (`d ≡ 1 mod 4` squarefree,
`ω`-presentation) iff `d ≡ 1 mod 8`. This is unreachable from the `X² − d` presentation, whose
exponent is even here, which is why it is the test that no oddness hypothesis has crept into
Layers 3 or 7. -/
example {θ : 𝓞 K} {d : ℤ} (hd : Squarefree d) (hd4 : d % 4 = 1)
    (hmin : minpoly ℤ θ = X ^ 2 - X + C ((1 - d) / 4))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    (Ideal.primesOver (Ideal.span {(2 : ℤ)}) (𝓞 K)).ncard = 2 ↔ d % 8 = 1 :=
  sorry

open scoped Classical in
/-- **Layer 7.4, explicit unit certification, the criterion.** Mathlib's Dirichlet theorem gives
*a* fundamental system and `regOfFamily_div_regulator` gives the index of a candidate family,
but nothing upstream certifies that a *named* unit generates modulo torsion, so no exact
regulator value can be asserted without this. In rank one there are exactly two infinite
places, `w v = 1` characterizes torsion for either of them, and generation is minimality: no
unit lies strictly between `1` and `u`.
⚠ `Classical` is opened for the norm: `logSpace K` is `{w : InfinitePlace K // w ≠ w₀} → ℝ`, and
its `Norm` instance needs the subtype to be a `Fintype`, hence `DecidablePred (· ≠ w₀)`. Mathlib
opens it for the same reason at `unitLattice_inter_ball_finite`. -/
theorem logEmbedding_norm_lt_iff_at_place
    (hrank : NumberField.Units.rank K = 1) (w : NumberField.InfinitePlace K)
    (u v : (𝓞 K)ˣ) (hu : 1 < w ((u : 𝓞 K) : K)) :
    ‖NumberField.Units.logEmbedding K (Additive.ofMul v)‖ <
        ‖NumberField.Units.logEmbedding K (Additive.ofMul u)‖ ↔
      |Real.log (w ((v : 𝓞 K) : K))| < Real.log (w ((u : 𝓞 K) : K)) :=
  sorry

/-- **Layer 7.4, explicit unit certification, the chosen-place form.** The preceding comparison
is what turns the intrinsic log-embedding criterion into this real-place inequality; the
multiplicity convention is already built into `NumberField.Units.logEmbedding`. -/
example (hrank : NumberField.Units.rank K = 1) (w : NumberField.InfinitePlace K)
    (u : (𝓞 K)ˣ) (hu0 : u ∉ NumberField.Units.torsion K)
    (hu : 1 < w ((u : 𝓞 K) : K)) :
    Subgroup.closure {u} ⊔ NumberField.Units.torsion K = ⊤ ↔
      ∀ v : (𝓞 K)ˣ, w ((v : 𝓞 K) : K) ≤ 1 ∨ w ((u : 𝓞 K) : K) ≤ w ((v : 𝓞 K) : K) :=
  sorry

/-- **Layer 7.4, the finiteness that makes the criterion checkable.** A unit bounded at every
infinite place has all its archimedean absolute values bounded, so the pin's
`NumberField.Embeddings.finite_of_norm_le` applies and the candidate set is finite; for a real
quadratic or a signature-`(1,1)` cubic field this becomes a finite search over integral minimal
polynomials with bounded coefficients. ⚠ "Mathlib has Dirichlet's unit theorem" is not a proof
of index one, and no worked example may cite it as one. ⚠ Finiteness is also not a certificate:
the three declarations after this one are what turn it into one. -/
example (B : ℝ) :
    {u : (𝓞 K)ˣ | ∀ w : NumberField.InfinitePlace K, w ((u : 𝓞 K) : K) ≤ B}.Finite :=
  sorry

/-! ### Layer 7.4, the polynomial certificate: rank one **and** prime degree

The four declarations below are the certificate, and they carry two hypotheses, neither implied
by the other.

* `NumberField.Units.rank K = 1` is what makes a candidate set exist at all. At rank one there
  are exactly two infinite places, so a bound at one is a two-sided bound at the other and the
  coefficients are bounded. Above rank one no `Finset` works: in `ℚ(√2, √3)`, of rank `3`, the
  image of `u ↦ log (w u)` is a non-cyclic subgroup of `ℝ`, hence dense, so infinitely many units
  satisfy `1 < w u < B` for every `B > 1` and they have infinitely many minimal polynomials.
* `Nat.Prime (Module.finrank ℚ K)` is what makes a competing unit an `IntegralPrimitiveElement K`,
  which is what the field test is about. At rank one the signature is `(2,0)`, `(1,1)` or
  `(0,2)`; only the last has composite degree, and there a unit can sit in a quadratic subfield.
  `ℚ(ζ₈)` is that case, with the non-torsion unit `1 + √2`, and `README.md` puts it out of scope.
-/

/-- **Layer 7.4, torsion-and-inversion normalization at a real place.** An infinite place
forgets sign. Before using a positive real root, replace a non-torsion competitor `v` by
`ε * v` or `ε * v⁻¹`, for a torsion unit `ε`, so its chosen real value lies in `(1,B)`. -/
theorem exists_unit_normalization_at_real_place
    (hrank : NumberField.Units.rank K = 1) (w : NumberField.InfinitePlace K) (hw : w.IsReal)
    (B : ℝ) (hB : 1 < B) (v : (𝓞 K)ˣ) (hv : v ∉ NumberField.Units.torsion K)
    (hvB : |Real.log (w (((v : 𝓞 K) : K)))| < Real.log B) :
    ∃ ε δ : (𝓞 K)ˣ, ε ∈ NumberField.Units.torsion K ∧ (δ = v ∨ δ = v⁻¹) ∧
      1 < w.embedding_of_isReal hw ((((ε * δ : (𝓞 K)ˣ) : 𝓞 K) : K)) ∧
        w.embedding_of_isReal hw ((((ε * δ : (𝓞 K)ˣ) : 𝓞 K) : K)) < B :=
  sorry

/-- **Layer 7.4, the candidate set at a real place.** The monic integer polynomials that can be
the minimal polynomial of a normalized unit whose value under the chosen real embedding lies
in `(1,B)`. -/
noncomputable def unitCandidates (K : Type*) [Field K] [NumberField K]
    (w : NumberField.InfinitePlace K) (hw : w.IsReal) (B : ℝ) : Finset ℤ[X] :=
  sorry

/-- **Layer 7.4, completeness of the candidate set.** ⚠ Both scope hypotheses appear here and
neither can be dropped. Without `hrank` the statement is unprovable for any definition of
`unitCandidates`, since the competing units can be infinite in number. Without `hdeg` the minimal
polynomial need not have degree `[K : ℚ]`, and the field test below does not apply to it. -/
example (hrank : NumberField.Units.rank K = 1)
    (hdeg : Nat.Prime (Module.finrank ℚ K))
    (w : NumberField.InfinitePlace K) (hw : w.IsReal) (B : ℝ) (v : (𝓞 K)ˣ)
    (h1 : 1 < w.embedding_of_isReal hw (((v : 𝓞 K) : K)))
    (h2 : w.embedding_of_isReal hw (((v : 𝓞 K) : K)) < B) :
    minpoly ℤ (v : 𝓞 K) ∈ unitCandidates K w hw B :=
  sorry

/-- **Layer 7.4, prime degree makes a competing unit a generator**, which is what connects the
candidate set to the field test. A unit with `w v ≠ 1` is not rational, and a proper subfield of
a field of prime degree is `ℚ`. -/
example (hdeg : Nat.Prime (Module.finrank ℚ K)) (w : NumberField.InfinitePlace K) (v : (𝓞 K)ˣ)
    (h1 : 1 < w ((v : 𝓞 K) : K)) :
    Algebra.adjoin ℚ {((v : 𝓞 K) : K)} = ⊤ :=
  sorry

/-- **Layer 7.4, the field test**, in the form the elimination uses. By Layer 3.3 the minimal
polynomial of an integral generator has discriminant `index² · discr K`, so a candidate whose
discriminant is not `discr K` times a square is not the minimal polynomial of any integral
generator of `K`. ⚠ Together with the root test this is what closes the certificate. Root
isolation on its own leaves candidates standing; §`Worked_3_1_23_1` exhibits two of them. -/
example (g : ℤ[X]) (hg : ∀ m : ℕ, g.discr ≠ (m : ℤ) ^ 2 * NumberField.discr K)
    (θ : IntegralPrimitiveElement K) :
    minpoly ℤ θ.1 ≠ g :=
  sorry

/-- **Layer 7.4, a proof-carrying elimination certificate.** Every candidate carries either a
proof that it has no real root in `(1,B)`, or a proof that it cannot be the minimal polynomial
of an integral generator of `K`. Exact root-isolation computations may construct the first
proof, but no unverified Boolean root test is part of the interface. -/
def UnitCandidateEliminationCertificate (K : Type*) [Field K] [NumberField K]
    (w : NumberField.InfinitePlace K) (hw : w.IsReal) (B : ℝ) : Prop :=
  ∀ g ∈ unitCandidates K w hw B,
    (∀ x : ℝ, 1 < x → x < B → Polynomial.eval x (g.map (Int.castRingHom ℝ)) ≠ 0) ∨
      ∀ θ : IntegralPrimitiveElement K, minpoly ℤ θ.1 ≠ g

/-- **Layer 7.4, soundness of the proof-carrying certificate.** Rank one supplies candidate
completeness and prime degree makes every normalized non-torsion competitor a generator. -/
theorem UnitCandidateEliminationCertificate.sound
    (hrank : NumberField.Units.rank K = 1) (hdeg : Nat.Prime (Module.finrank ℚ K))
    (w : NumberField.InfinitePlace K) (hw : w.IsReal) (B : ℝ)
    (hcert : UnitCandidateEliminationCertificate K w hw B) :
    ¬ ∃ v : (𝓞 K)ˣ,
      1 < w.embedding_of_isReal hw (((v : 𝓞 K) : K)) ∧
        w.embedding_of_isReal hw (((v : 𝓞 K) : K)) < B :=
  sorry

/-- **Layer 7.4, the regulator of a certified generator.** Once the closure statement above
holds, `regOfFamily_div_regulator` has index `1` and the regulator is a computation about one
explicit unit. -/
example (u : (𝓞 K)ˣ) (hu : Subgroup.closure {u} ⊔ NumberField.Units.torsion K = ⊤) :
    NumberField.Units.regOfFamily (fun _ : Fin (NumberField.Units.rank K) => u) =
      NumberField.Units.regulator K :=
  sorry

/-- **Layer 7.4, the rank-one evaluation.** ⚠ Do not drop `w.mult`. In rank one there are exactly
two infinite places and `Σ_w mult w · log (w u) = log |N u| = 0`, so the two choices of `w`
agree; but a version without the factor is wrong at every field with a complex place, since the
regulator of `ℚ(ζ₅)` is `2·log((1+√5)/2)`. Mathlib's `logEmbedding` carries `mult` for the same
reason. Note also that `Real.log` is applied to `w u`, a real number, and never to a unit:
there is no `Real.log` of an element of `𝓞 K`. -/
example (hrank : NumberField.Units.rank K = 1) (w : NumberField.InfinitePlace K)
    (u : (𝓞 K)ˣ) (hu : 1 < w ((u : 𝓞 K) : K))
    (hgen : Subgroup.closure {u} ⊔ NumberField.Units.torsion K = ⊤) :
    NumberField.Units.regulator K = w.mult * Real.log (w ((u : 𝓞 K) : K)) :=
  sorry

/-! ## Layer 8: the intrinsic LMFDB label prefix and the worked suite

Worked examples as acceptance criteria; the numerics are verified in `README.md`.
Presentations follow the landed TauCeti idiom: a generator `θ : 𝓞 K` with its integral
minimal polynomial and `Algebra.adjoin ℚ {(θ : K)} = ⊤`. The displayed LMFDB names are
external identifiers for the examples; this roadmap certifies only their intrinsic
`d.r.|D|` prefix, never the database-order `.i` coordinate. -/

/-- **Layer 8.1, the intrinsic label prefix.** The three coordinates that are intrinsic
theorems. ⚠ The `.i` coordinate is deliberately not here and is not a deliverable of this
roadmap in any form: it needs a certified database ordering, a canonical defining polynomial,
isomorphism deduplication, and a bounded-list completeness certificate, none of which is
extractable from `finite_of_discr_bdd`. -/
def HasLMFDBIntrinsicLabel (K : Type*) [Field K] [NumberField K] (d r D : ℕ) : Prop :=
  Module.finrank ℚ K = d ∧ NumberField.InfinitePlace.nrRealPlaces K = r ∧
    (NumberField.discr K).natAbs = D

/-- **Layer 8.1, sign recovery.** The prefix carries `|D|` only, and Brill's theorem
(`NumberField.sign_discr`) recovers the sign from the signature, so no separate sign datum is
needed. -/
example {d r D : ℕ} (h : HasLMFDBIntrinsicLabel K d r D) :
    NumberField.discr K = (-1 : ℤ) ^ ((d - r) / 2) * D :=
  sorry

section Worked_2_2_5_1
/-! **LMFDB `2.2.5.1` = ℚ(√5)**, presented by `θ = (1+√5)/2`, `minpoly = X² − X − 1`. The
class number and the zeta residue are consumed from Mathlib; the discriminant, torsion, unit
certification and splitting are proved here. -/

variable {θ : 𝓞 K} (hmin : minpoly ℤ θ = X ^ 2 - X - 1)
  (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)

include hmin hgen

example : NumberField.discr K = 5 := sorry

example : HasLMFDBIntrinsicLabel K 2 2 5 := sorry

example : NumberField.classNumber K = 1 := sorry

example : NumberField.Units.torsionOrder K = 2 := sorry

/-- The certification: the golden ratio generates the units modulo torsion. Layer 7's
criterion plus the finite search; this is the statement that makes the next one legitimate. -/
example (u : (𝓞 K)ˣ) (hu : (u : 𝓞 K) = θ) :
    Subgroup.closure {u} ⊔ NumberField.Units.torsion K = ⊤ := sorry

/-- Hence `regulator = log((1+√5)/2)`. -/
example : NumberField.Units.regulator K = Real.log ((1 + Real.sqrt 5) / 2) := sorry

/-- The class-number-formula consistency check: `ζ_K` has residue `2·log((1+√5)/2)/√5`, one
equation crossing the certified unit, the class number, the discriminant, and the CNF
normalization. -/
example : NumberField.dedekindZeta_residue K =
    2 * Real.log ((1 + Real.sqrt 5) / 2) / Real.sqrt 5 := sorry

/-- `2` is inert in `ℚ(√5)` (`5 ≡ 5 mod 8`). -/
example : (Ideal.primesOver (Ideal.span {(2 : ℤ)}) (𝓞 K)).ncard = 1 := sorry

end Worked_2_2_5_1

section Worked_2_0_4_1
/-! **LMFDB `2.0.4.1` = ℚ(i)**, presented by `θ = i`, `minpoly = X² + 1`. The dyadic case:
`2` is wildly ramified, the wild lower bound `e ≤ v_P(𝔡)` of Layer 6 is attained, and the
upper bound `e − 1 + v_P(e) = 3` is strict. This is the example a tame-only exponent formula
must not claim. -/

variable {θ : 𝓞 K} (hmin : minpoly ℤ θ = X ^ 2 + 1)
  (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)

include hmin hgen

/-- ⚠ The sign is Brill's theorem in action: `r₂ = 1`, so `discr < 0`. -/
example : NumberField.discr K = -4 := sorry

example : HasLMFDBIntrinsicLabel K 2 0 4 := sorry

example : NumberField.classNumber K = 1 := sorry

example : NumberField.Units.torsionOrder K = 4 := sorry

/-- `ℤ[i]` is the full ring of integers: index `1`, and `K` is monogenic. -/
example : Algebra.adjoin ℤ {θ} = ⊤ := sorry

/-- `2` is totally ramified: `(2) = P²` with `P = (1 + i)`. -/
example : (Ideal.primesOver (Ideal.span {(2 : ℤ)}) (𝓞 K)).ncard = 1 := sorry

example : Ideal.ramificationIdxIn (Ideal.span {(2 : ℤ)}) (𝓞 K) = 2 := sorry

/-- The wild lower bound is attained: `v_P(𝔡) = 2 = e`, while `e − 1 + v_P(e) = 3`. -/
example {P : Ideal (𝓞 K)} [P.IsPrime] [P.LiesOver (Ideal.span {(2 : ℤ)})] :
    multiplicity P (differentIdeal ℤ (𝓞 K)) = 2 := sorry

end Worked_2_0_4_1

section Worked_4_0_125_1
/-! **LMFDB `4.0.125.1` = ℚ(ζ₅)** as `CyclotomicField 5 ℚ`. Discriminant, class number,
torsion and monogenicity are consumed from the pin (`IsCyclotomicExtension.Rat.discr_prime`,
`five_pid`); the Frobenius data and the subfield lattice are proved here. ⚠ The
conductor–discriminant instance `∏_{χ mod 5} cond(χ) = 125` is **not** a target of this
roadmap. It is the abelian conductor–discriminant formula, which belongs to a global class
field theory subject, and it is not used here. -/

example : NumberField.discr (CyclotomicField 5 ℚ) = 125 := sorry

example : HasLMFDBIntrinsicLabel (CyclotomicField 5 ℚ) 4 0 125 := sorry

example : NumberField.classNumber (CyclotomicField 5 ℚ) = 1 := sorry

example : NumberField.Units.torsionOrder (CyclotomicField 5 ℚ) = 10 := sorry

/-- The subfield lattice of `ℚ(ζ₅)` is `{ℚ, ℚ(√5), ℚ(ζ₅)}`, the subgroup lattice of `C₄`. -/
example : Nat.card (IntermediateField ℚ (CyclotomicField 5 ℚ)) = 3 := sorry

/-- `11 ≡ 1 mod 5` splits completely in `ℚ(ζ₅)`. -/
example : (Ideal.primesOver (Ideal.span {(11 : ℤ)}) (𝓞 (CyclotomicField 5 ℚ))).ncard = 4 :=
  sorry

/-- `2` has order `4` in `(ℤ/5)ˣ`, so `f(2) = 4`: `2` is inert in `ℚ(ζ₅)`. -/
example : (Ideal.span {(2 : ℤ)}).inertiaDegIn (𝓞 (CyclotomicField 5 ℚ)) = 4 := sorry

end Worked_4_0_125_1

section Worked_3_1_23_1
/-! **LMFDB `3.1.23.1`**: the non-Galois cubic `X³ − X² + 1`, `disc = −23` squarefree (so the
index is `1`). The unramified splitting data at `2, 3, 5, 7, 59` are instances of Layer 3's
Dedekind theorem. ⚠ `23` is ramified, so there is **no** Frobenius class and **no** cycle type
at `23`; its factorization is a Kummer–Dedekind statement and is listed separately below.
⚠ Nothing here identifies the Galois group of the Galois closure. No milestone of this roadmap
supplies the cubic discriminant-square criterion, and recognition of a polynomial Galois group is
out of scope; the statements below are about `K` itself. -/

variable {θ : 𝓞 K} (hmin : minpoly ℤ θ = X ^ 3 - X ^ 2 + 1)
  (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)

include hmin hgen

example : NumberField.discr K = -23 := sorry

example : HasLMFDBIntrinsicLabel K 3 1 23 := sorry

example : ¬ IsGalois ℚ K := sorry

example : NumberField.classNumber K = 1 := sorry

example : NumberField.Units.rank K = 1 := sorry

/-- The explicit unit: `θ·(θ² − θ) = −1`, so `θ² − θ = −θ⁻¹` is a positive unit. -/
example : θ * (θ ^ 2 - θ) = -1 := sorry

/-! #### The unit certificate for `3.1.23.1`, in four steps

This is the instance of Layer 7.4's polynomial certificate at `Units.rank K = 1` and
`Module.finrank ℚ K = 3`, which is prime; both scope hypotheses hold here and follow from `hmin`,
so neither is written out below.

`u = θ² − θ` has `w u ≈ 1.3247` at the real place, and satisfies `u³ − u − 1 = 0`. The
coefficient bounds of Layer 7.4 give `|a| ≤ 3`, `|b| ≤ 3`, `c = ±1` for the minimal polynomial
`X³ − aX² + bX − c` of a competing unit, so the candidate set is these `98` polynomials. -/

open scoped Classical in
/-- **Step 1, the candidate set**, concretely: the monic cubics `X³ − aX² + bX − c` with
`|a|, |b| ≤ 3` and `c = ±1`. -/
noncomputable def cubicUnitCandidates : Finset ℤ[X] :=
  ((Finset.Icc (-3 : ℤ) 3) ×ˢ (Finset.Icc (-3 : ℤ) 3) ×ˢ ({-1, 1} : Finset ℤ)).image
    fun p => X ^ 3 - C p.1 * X ^ 2 + C p.2.1 * X - C p.2.2

/-- **Step 2, completeness.** A unit strictly between `1` and `u` at the real place has its
minimal polynomial in the list. Note the degree-`3` step: `v` is not rational, since the rational
units are `±1`, and `[K : ℚ] = 3` is prime, so `ℚ(v) = K`. -/
example (w : NumberField.InfinitePlace K) (hw : w.IsReal) (u v : (𝓞 K)ˣ)
    (hu : (u : 𝓞 K) = θ ^ 2 - θ) (h1 : 1 < w ((v : 𝓞 K) : K))
    (h2 : w ((v : 𝓞 K) : K) < w ((u : 𝓞 K) : K)) :
    minpoly ℤ (v : 𝓞 K) ∈ cubicUnitCandidates := sorry

/-- **Step 3, the root test, with its exact outcome.** ⚠ This is where "discard the candidates
with no root in `(1, w u)`" stops being enough: exactly two of the `98` have a root in that open
interval, and both are still standing after the test. ⚠ The interval is open at both ends, and
the count depends on that. On the closed `[1, w u]` there are `15`: these two, twelve candidates
with a root at `1`, and `minpoly ℤ u = X³ − X − 1`, whose only real root is `w u`. Neither
endpoint is `w v` for a unit `v` with `1 < w v < w u`. -/
example (w : NumberField.InfinitePlace K) (hw : w.IsReal) (u : (𝓞 K)ˣ)
    (hu : (u : 𝓞 K) = θ ^ 2 - θ) (g : ℤ[X]) (hg : g ∈ cubicUnitCandidates)
    (hroot : ∃ x : ℝ, 1 < x ∧ x < w ((u : 𝓞 K) : K) ∧ aeval x g = 0) :
    g = X ^ 3 + X ^ 2 - 2 * X - 1 ∨ g = X ^ 3 + 2 * X ^ 2 - 3 * X - 1 := sorry

/-- **Step 4, the field test**, which eliminates the two survivors. Their discriminants are
positive, while Layer 3.3 forces `disc(minpoly v) = index(v)² · (−23) < 0` for every integral
generator `v` of `K`. -/
example : (X ^ 3 + X ^ 2 - 2 * X - 1 : ℤ[X]).discr = 49 := sorry

example : (X ^ 3 + 2 * X ^ 2 - 3 * X - 1 : ℤ[X]).discr = 257 := sorry

/-- **The concrete 98-candidate acceptance artifact.** Unlike the abstract predicate, this
constructs an elimination proof for this exact field and bound: the 96 interval failures and
the two displayed discriminant obstructions. -/
theorem cubicUnitEliminationCertificate (w : NumberField.InfinitePlace K) (hw : w.IsReal)
    (u : (𝓞 K)ˣ) (hu : (u : 𝓞 K) = θ ^ 2 - θ) :
    UnitCandidateEliminationCertificate K w hw
      (w.embedding_of_isReal hw (((u : 𝓞 K) : K))) :=
  sorry

/-- Applying the general soundness theorem to the concrete certificate rules out every smaller
normalized unit, including the 96 candidates that do not appear in the survivor table. -/
example (w : NumberField.InfinitePlace K) (hw : w.IsReal)
    (u : (𝓞 K)ˣ) (hu : (u : 𝓞 K) = θ ^ 2 - θ)
    (hrank : NumberField.Units.rank K = 1)
    (hdeg : Nat.Prime (Module.finrank ℚ K)) :
    ¬ ∃ v : (𝓞 K)ˣ,
      1 < w.embedding_of_isReal hw (((v : 𝓞 K) : K)) ∧
        w.embedding_of_isReal hw (((v : 𝓞 K) : K)) <
          w.embedding_of_isReal hw (((u : 𝓞 K) : K)) :=
  UnitCandidateEliminationCertificate.sound hrank hdeg w hw _
    (cubicUnitEliminationCertificate hmin hgen w hw u hu)

example (θ' : IntegralPrimitiveElement K) : (minpoly ℤ θ'.1).discr < 0 := sorry

/-- The conclusion of the four steps: no unit lies strictly between `1` and `u`, which is
Layer 7.4's criterion. -/
example (w : NumberField.InfinitePlace K) (hw : w.IsReal) (u : (𝓞 K)ˣ)
    (hu : (u : 𝓞 K) = θ ^ 2 - θ) (v : (𝓞 K)ˣ) :
    w ((v : 𝓞 K) : K) ≤ 1 ∨ w ((u : 𝓞 K) : K) ≤ w ((v : 𝓞 K) : K) := sorry

/-- The certification, from the four steps above and Layer 7.4's criterion: `θ² − θ` generates
the units modulo torsion. Only after this is the regulator value legitimate. -/
example (u : (𝓞 K)ˣ) (hu : (u : 𝓞 K) = θ ^ 2 - θ) :
    Subgroup.closure {u} ⊔ NumberField.Units.torsion K = ⊤ := sorry

/-- The exact regulator, at the unique real place `w` (so `w.mult = 1`), where
`w (θ² − θ) ≈ 1.3247 > 1`. Numerically `≈ 0.2812`, but the decimal is orientation, not the
target. ⚠ The real place has to be named: `θ² − θ` is an element of `𝓞 K`, so `Real.log` of it
is not an expression at all. -/
example (w : NumberField.InfinitePlace K) (hw : w.IsReal)
    (u : (𝓞 K)ˣ) (hu : (u : 𝓞 K) = θ ^ 2 - θ)
    (hgen' : Subgroup.closure {u} ⊔ NumberField.Units.torsion K = ⊤) :
    NumberField.Units.regulator K = Real.log (w ((u : 𝓞 K) : K)) := sorry

/-- `2` is inert, cycle type `(3)`: `X³ + X² + 1` is irreducible over `𝔽₂`. -/
example : (RingOfIntegers.monicFactorsMod θ 2).val.map Polynomial.natDegree = {3} := sorry

example : (Ideal.primesOver (Ideal.span {(2 : ℤ)}) (𝓞 K)).ncard = 1 := sorry

/-- `5` has splitting type `(1,2)`. -/
example : (Ideal.primesOver (Ideal.span {(5 : ℤ)}) (𝓞 K)).ncard = 2 := sorry

/-- `59` splits completely, so its Frobenius class is `1`. ⚠ The roadmap does **not** claim
that `59` is the *least* totally split prime: that needs a finite check at every smaller
prime, which no milestone here performs. -/
example : (Ideal.primesOver (Ideal.span {(59 : ℤ)}) (𝓞 K)).ncard = 3 := sorry

/-- ⚠ `23` is **ramified** (`23 ∣ discr K`), so this is ramification data from
Kummer–Dedekind and the different, not a Frobenius cycle type: `(23) = 𝔭²𝔮`, with the double
root of `minpoly mod 23` at `16` and the simple root at `15`. -/
example : (Ideal.primesOver (Ideal.span {(23 : ℤ)}) (𝓞 K)).ncard = 2 := sorry

/-- `23` divides the discriminant, which is what "ramified" means here (the pin's
`not_dvd_discr_iff_forall_liesOver`); Layer 2's Artin symbol is undefined at such a prime. -/
example : (23 : ℤ) ∣ NumberField.discr K := sorry

/-- `3.1.23.1` has no proper subfield, so its intermediate-field lattice is `{⊥, ⊤}`. The reason
is the degree alone: `[K : ℚ] = 3` is prime, so `Module.finrank_mul_finrank` leaves an
intermediate field with `finrank ℚ M ∈ {1, 3}`, and `IntermediateField.finrank_eq_one_iff` and
`IntermediateField.finrank_eq_one_iff_eq_top` turn those into `M = ⊥` and `M = ⊤`. ⚠ No Galois
group is involved, and none is identified anywhere in this section. -/
example (M : IntermediateField ℚ K) : M = ⊥ ∨ M = ⊤ := sorry

example : Nat.card (IntermediateField ℚ K) = 2 := sorry

end Worked_3_1_23_1

section Worked_3_1_503_1
/-! **LMFDB `3.1.503.1` = Dedekind's field** `ℚ[x]/(x³ − x² − 2x − 8)`: `disc(f) = −4·503`,
`disc K = −503`, index `2`. The prime `2` splits completely although no cubic over `𝔽₂` has
three distinct linear factors, so `2` is a common index divisor and `𝓞 K` is not monogenic
(Neukirch III §2 Ex. 1). This is why Layer 3's polynomial-side corollary is hypothesized on
`p ∤ f.discr` and not on "`p` unramified": here `2` is unramified and the factorization of
`f mod 2` still lies about the splitting. -/

variable {θ : 𝓞 K} (hmin : minpoly ℤ θ = X ^ 3 - X ^ 2 - 2 * X - 8)
  (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)

include hmin hgen

/-- The half-integral element `β = (θ² - θ)/2` exists in the full ring of integers. This is the
first step of the noncircular discriminant calculation. -/
example : ∃ β : 𝓞 K,
    (2 : K) * (β : K) = (θ : K) ^ 2 - (θ : K) :=
  sorry

variable {β : 𝓞 K} (hβ : (2 : K) * (β : K) = (θ : K) ^ 2 - (θ : K))

/-- Integrality is certified by the exact monic equation for `β`. -/
example : β ^ 3 - 2 * β ^ 2 + 3 * β - 10 = 0 :=
  sorry

/-- The explicit intermediate order generated by `θ` and `β`. Naming it prevents the
squarefree-discriminant argument from jumping directly to a basis of the full integer ring. -/
def dedekindOrder : Subalgebra ℤ (𝓞 K) :=
  Algebra.adjoin ℤ ({θ, β} : Set (𝓞 K))

theorem dedekindOrder_eq_span :
    (dedekindOrder (K := K) (θ := θ) (β := β)).toSubmodule =
      Submodule.span ℤ ({1, θ, β} : Set (𝓞 K)) :=
  sorry

/-- The basis calculation is performed in the intermediate order itself. -/
theorem discr_dedekindOrder :
    ∃ b : Module.Basis (Fin 3) ℤ (dedekindOrder (K := K) (θ := θ) (β := β)),
      Algebra.discr ℤ b = -503 :=
  sorry

/-- The additive index of the intermediate order in the full ring of integers. -/
noncomputable def dedekindOrderIndex : ℕ :=
  Nat.card ((𝓞 K) ⧸ (dedekindOrder (K := K) (θ := θ) (β := β)).toSubmodule)

/-- The general order-index/discriminant formula specialized to this explicit order. -/
theorem index_dedekindOrder_sq_mul_discr :
    (-503 : ℤ) = (dedekindOrderIndex (K := K) (θ := θ) (β := β) : ℤ) ^ 2 * NumberField.discr K :=
  sorry

/-- Squarefreeness of `503` forces the intermediate order to have index one. -/
theorem dedekindOrder_eq_ringOfIntegers :
    dedekindOrder (K := K) (θ := θ) (β := β) = ⊤ :=
  sorry

/-- The integral basis `(1, θ, β)` has squarefree discriminant `-503`; hence its order is the
full ring of integers by `dedekindOrder_eq_ringOfIntegers`. This is the source of
`discr K = -503` and `index θ = 2`, not a consequence of either assertion. -/
example : ∃ b : Module.Basis (Fin 3) ℤ (𝓞 K),
    b 0 = 1 ∧ b 1 = θ ∧ b 2 = β ∧ Algebra.discr ℤ b = -503 :=
  sorry

example : NumberField.discr K = -503 := sorry

example : HasLMFDBIntrinsicLabel K 3 1 503 := sorry

/-- The three explicit factors of `(2)`, defined in the full ring of integers. -/
def dedekindPrimeOne : Ideal (𝓞 K) :=
  Ideal.span ({(2 : 𝓞 K), θ, β} : Set (𝓞 K))

def dedekindPrimeTwo : Ideal (𝓞 K) :=
  Ideal.span ({(2 : 𝓞 K), θ, β - 1} : Set (𝓞 K))

def dedekindPrimeThree : Ideal (𝓞 K) :=
  Ideal.span ({(2 : 𝓞 K), θ - 1, β - 1} : Set (𝓞 K))

/-- Quotient certificates pin each displayed factor as a degree-one prime above `2`. -/
noncomputable def dedekindPrimeOneQuotientEquiv :
    (𝓞 K ⧸ dedekindPrimeOne (K := K) (θ := θ) (β := β)) ≃+* ZMod 2 :=
  sorry

noncomputable def dedekindPrimeTwoQuotientEquiv :
    (𝓞 K ⧸ dedekindPrimeTwo (K := K) (θ := θ) (β := β)) ≃+* ZMod 2 :=
  sorry

noncomputable def dedekindPrimeThreeQuotientEquiv :
    (𝓞 K ⧸ dedekindPrimeThree (K := K) (θ := θ) (β := β)) ≃+* ZMod 2 :=
  sorry

theorem dedekindPrimeOne_isMaximal :
    (dedekindPrimeOne (K := K) (θ := θ) (β := β)).IsMaximal := sorry

theorem dedekindPrimeTwo_isMaximal :
    (dedekindPrimeTwo (K := K) (θ := θ) (β := β)).IsMaximal := sorry

theorem dedekindPrimeThree_isMaximal :
    (dedekindPrimeThree (K := K) (θ := θ) (β := β)).IsMaximal := sorry

theorem dedekindPrimes_ne_bot :
    dedekindPrimeOne (K := K) (θ := θ) (β := β) ≠ ⊥ ∧
      dedekindPrimeTwo (K := K) (θ := θ) (β := β) ≠ ⊥ ∧
        dedekindPrimeThree (K := K) (θ := θ) (β := β) ≠ ⊥ :=
  sorry

theorem dedekindPrimes_lieOver_two :
    (dedekindPrimeOne (K := K) (θ := θ) (β := β)).LiesOver (Ideal.span {(2 : ℤ)}) ∧
      (dedekindPrimeTwo (K := K) (θ := θ) (β := β)).LiesOver (Ideal.span {(2 : ℤ)}) ∧
        (dedekindPrimeThree (K := K) (θ := θ) (β := β)).LiesOver (Ideal.span {(2 : ℤ)}) :=
  sorry

theorem dedekindPrimes_residue_card :
    Nat.card (𝓞 K ⧸ dedekindPrimeOne (K := K) (θ := θ) (β := β)) = 2 ∧
      Nat.card (𝓞 K ⧸ dedekindPrimeTwo (K := K) (θ := θ) (β := β)) = 2 ∧
        Nat.card (𝓞 K ⧸ dedekindPrimeThree (K := K) (θ := θ) (β := β)) = 2 :=
  sorry

theorem dedekindPrimes_pairwise_ne :
    dedekindPrimeOne (K := K) (θ := θ) (β := β) ≠ dedekindPrimeTwo (K := K) (θ := θ) (β := β) ∧
      dedekindPrimeOne (K := K) (θ := θ) (β := β) ≠ dedekindPrimeThree (K := K) (θ := θ) (β := β) ∧
        dedekindPrimeTwo (K := K) (θ := θ) (β := β) ≠ dedekindPrimeThree (K := K) (θ := θ) (β := β) :=
  sorry

theorem dedekindPrimes_product :
    dedekindPrimeOne (K := K) (θ := θ) (β := β) * dedekindPrimeTwo (K := K) (θ := θ) (β := β) *
        dedekindPrimeThree (K := K) (θ := θ) (β := β) = Ideal.span {(2 : 𝓞 K)} :=
  sorry

/-- The index-divisor caveat as a theorem: the three explicit maximal, pairwise-distinct,
degree-one ideals above `2` prove complete splitting. The polynomial factorization
`f mod 2 = x²(x+1)` does *not* compute the splitting here. -/
example : (Ideal.primesOver (Ideal.span {(2 : ℤ)}) (𝓞 K)).ncard = 3 := sorry

/-- The factorization of `(2)` computed in the full integral basis, not by reducing the
index-divisible power-basis polynomial. -/
example :
    Ideal.span ({(2 : 𝓞 K), θ, β} : Set (𝓞 K)) *
        Ideal.span ({(2 : 𝓞 K), θ, β - 1} : Set (𝓞 K)) *
        Ideal.span ({(2 : 𝓞 K), θ - 1, β - 1} : Set (𝓞 K)) =
      Ideal.span {(2 : 𝓞 K)} := by
  simpa [dedekindPrimeOne, dedekindPrimeTwo, dedekindPrimeThree] using
    dedekindPrimes_product (K := K) (θ := θ) (β := β) hmin hgen

/-- `2` is a common index divisor: every integral generator has even index. -/
example : ∀ θ' : IntegralPrimitiveElement K, 2 ∣ index θ' := sorry

/-- Hence `𝓞 K` is not monogenic. -/
example : ¬ IsMonogenic K := sorry

end Worked_3_1_503_1

end TauCetiRoadmap.NumberFieldArithmetic
