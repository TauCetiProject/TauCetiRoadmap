import Mathlib
import TauCetiRoadmap.NumberFieldArithmetic.Suggested

/-!
# Galois groups of polynomials: target signatures

**This file is not the roadmap, and it is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors converge on names and signatures. To discharge all of them finishes neither a
layer nor the roadmap.

`sorry` is allowed in this human-owned roadmap library. It appears here in three roles, which
should not be confused. In an `example` it marks a milestone of this roadmap. In a `def` it
marks data that a frozen export supplies, and not a proof that anybody owes. In the
`orbitProduct` field of a `ResolventSpec` it marks data that is *determined*: `esymmSubst` is
injective, so the accompanying equation has at most one solution, and the fundamental theorem of
symmetric polynomials says it has one.

Two declarations in the Layer 5 block carry **closed** proofs, and they state something about
the supplier contract rather than a milestone anybody owes. Dedekind's factorization theorem is
not proved here: it is `NumberFieldArithmetic.exists_gal_fullCycleType_eq_factorizationType`,
and `README.md`'s contract section is the record. Those two declarations apply it. Their point
is that they stop elaborating if the supplier's signature moves or if `fullCycleType` or
`factorDegrees` is redefined, so the contract is checked by the build and not asserted in prose.

The pinned Mathlib has:

* `Polynomial.Gal`, with its faithful action on the roots, transitive for irreducible
  polynomials;
* the permutation action library of A. Chambert-Loir, with `IsBlock`, `IsPreprimitive`,
  multiple transitivity, and Jordan's theorems for a transposition and for a 3-cycle;
* `Polynomial.discr` in Sylvester form, without the root-product formula;
* the finite fields, with the minimal polynomial over them.

Every carrier type of the roadmap therefore elaborates at that version, and this file spans
Layers 0 to 6, and Layers 8 and 9.

Two things about the shape of this file are worth reading before either is copied elsewhere.

A resolvent specification carries no polynomial and no coefficient ring. Specialization at a
polynomial is `ResolventSpec.specialize`, a construction over an arbitrary commutative ring, and
base change, coefficient integrality and reduction modulo `p` are theorems about it rather than
separate constructions. A specification that stored one specialization would have to be rebuilt
for every coefficient ring, and there would be no statement that base change commutes with the
resolvent.

The degree-five certificate is **sound only**: `check cert = true` implies the label, and nothing
here says that a certificate exists, or searches for one, or terminates. What separates `5T1`
from `5T2` is evidence beyond the discriminant and the resolvent sextic, and
`discriminant_and_sextic_do_not_distinguish_C5_D5` exhibits the two polynomials that prove it.

One statement below is worth reading with care before its shape is copied elsewhere. The
Layer 9 milestone says that the Galois image is the full symmetric group on the distinct
roots. It says so through surjectivity of `galActionHom`, together with separability.
Bijectivity alone would not say it. The polynomial `X ^ n` has one distinct root, a trivial
Galois group, and a bijection from that group onto the permutations of a one-point set. A
well-typed proposition can still express the wrong mathematics.
-/

namespace TauCetiRoadmap.PolynomialGaloisGroups

open Polynomial MulAction

universe u v

/-- A polynomial splits in its own splitting field, recorded as a `Fact` so that
`Polynomial.Gal.galActionHom p p.SplittingField` elaborates: Mathlib registers the
`MulAction` instance `galActionAux` for the splitting field, but `galActionHom` asks for
the `Fact`. -/
local instance factSplitsSplittingField {F : Type u} [Field F] (p : F[X]) :
    Fact ((p.map (algebraMap F p.SplittingField)).Splits) :=
  ⟨IsSplittingField.splits p.SplittingField p⟩

/-! ## Prototypes: suggested forms for the basic objects -/

section Prototypes

/-- **Pinned convention (README, "Cycle types count fixed points").** The cycle type of a
permutation *including* its fixed points as parts equal to `1`: Mathlib's
`Equiv.Perm.cycleType` lists only the cycle lengths `≥ 2`, while Dedekind factorization
types are partitions of `n` with their `1`-parts. Every Frobenius or factorization
comparison below is stated with `fullCycleType`, never with a bare `cycleType`.

⚠ The `DecidableEq α` argument is deliberate, and this definition is not `noncomputable`.
Closing it over `Classical.propDecidable` instead would make `fullCycleType g` disagree
*syntactically* with the same multiset written at the ambient instance, which is what the
supplied factorization theorem of Layer 5 is stated with, and the contract check there would
not close. -/
def fullCycleType {α : Type u} [Fintype α] [DecidableEq α] (σ : Equiv.Perm α) : Multiset ℕ :=
  σ.cycleType + Multiset.replicate (Fintype.card α - σ.support.card) 1

/-- **Layer 1 carrier.** The action of `Equiv.Perm ι` on the functions `ι → D`, by permutation
of the coordinates, as a morphism into the automorphism group. The general wreath product is
built from this action. -/
def coordPermAut (D : Type u) [Group D] (ι : Type v) : Equiv.Perm ι →* MulAut (ι → D) where
  toFun σ :=
    { toFun := fun f => f ∘ σ.symm
      invFun := fun f => f ∘ σ
      left_inv := fun f => by funext i; simp
      right_inv := fun f => by funext i; simp
      map_mul' := fun _ _ => rfl }
  map_one' := by ext f i; rfl
  map_mul' σ τ := by ext f i; rfl

/-- **Layer 1 carrier.** The general permutation wreath product `(ι → D) ⋊ Equiv.Perm ι`.
Mathlib's `RegularWreathProduct` is the case in which `ι` is `Q` itself, with the translation
action. The restricted wreath product for a subgroup `Q ≤ Equiv.Perm ι` is the corresponding
`SemidirectProduct` over `Q`. -/
abbrev WreathProduct (D : Type u) [Group D] (ι : Type v) :=
  SemidirectProduct (ι → D) (Equiv.Perm ι) (coordPermAut D ι)

/-! ### The `nTj` data model

The roadmap owns only the proved degree-at-most-five classification. Raw database exports,
precomputed subgroup tables, and Galois-group certificates are deliberately not stored here.
-/

/-- The number of proved transitive-group classes in degrees at most five; zero outside the
classified range. -/
def numTransitiveGroups : ℕ → ℕ
  | 1 => 1
  | 2 => 1
  | 3 => 2
  | 4 => 5
  | 5 => 5
  | _ => 0

abbrev TransitiveGroupIndex (n : ℕ) : Type := Fin (numTransitiveGroups n)

/-- The named representative subgroup for a proved class in degree at most five. Its eventual
implementation is ordinary proved library data, not an imported database dump. -/
noncomputable def referenceSubgroup (n : ℕ) (j : TransitiveGroupIndex n) :
    Subgroup (Equiv.Perm (Fin n)) :=
  sorry

/-- **The label predicate.** `G` carries the label `nT(j+1)` when some numbering conjugates
it onto the reference subgroup. Transitivity of the reference is proved once (below), and a
conjugate of a transitive group is transitive, so this predicate needs no separate
transitivity clause. -/
def TransitiveGroupLabel {n : ℕ} (j : TransitiveGroupIndex n)
    (G : Subgroup (Equiv.Perm (Fin n))) : Prop :=
  ∃ σ : Equiv.Perm (Fin n),
    Subgroup.map (MulAut.conj σ).toMonoidHom G = referenceSubgroup n j

open scoped Classical in
/-- **The label of a polynomial.** Separability and the degree are part of the predicate, and
the comparison with a reference subgroup passes through an explicit relabeling of the root
set. The companion theorem below says the predicate does not depend on which relabeling is
chosen, which is why no global root order is ever fixed. -/
def HasGaloisLabel {F : Type u} [Field F] (f : F[X]) {n : ℕ}
    (j : TransitiveGroupIndex n) : Prop :=
  f.Separable ∧ f.natDegree = n ∧
    ∃ e : f.rootSet f.SplittingField ≃ Fin n,
      TransitiveGroupLabel j
        (Subgroup.map (Equiv.permCongrHom e).toMonoidHom
          (Polynomial.Gal.galActionHom f f.SplittingField).range)

/-- **Layer 9, the full-symmetric-group predicate.** Separability is part of the
statement: without it the root set is too small and surjectivity says nothing about the
degree. See the file header for why bijectivity of `galActionHom` alone is not enough. -/
def HasFullSymmetricGaloisGroup {F : Type u} [Field F] (f : F[X]) : Prop :=
  f.Separable ∧ Function.Surjective (Polynomial.Gal.galActionHom f f.SplittingField)

/-! ### Resolvents: universal data, and specialization as a base change

A resolvent specification is **universal**. It carries an invariant in the formal roots with
integral coefficients, the subgroup that is *exactly* its stabilizer, and an integral symmetric
expression for the orbit product. No polynomial and no coefficient ring appears in it, so the
invariant is written and proved once and never rebuilt.

Specialization at a polynomial is a separate construction, `ResolventSpec.specialize`, available
over any commutative ring: it substitutes the coefficients of a monic `f` of degree `n` for the
elementary symmetric polynomials of the roots. It is functorial, and the milestones below say
so — base change along any ring morphism, coefficient integrality as the case `ℤ → ℚ` of that,
reduction modulo `p` as the case `ℤ → ZMod p`, and agreement with the root-side orbit product
in a splitting field.
-/

/-- **Layer 4, root enumeration.** `x` lists the roots of `f` in `L`, with multiplicity. Because
the multiset of roots then has `n` elements, this forces `f` to split in `L` when
`f.natDegree = n`, and `x` is injective exactly when the mapped polynomial is separable; both
are milestones below. This is the hypothesis under which a coefficient-side resolvent is
compared with the root-side product. -/
def IsRootEnumeration {F : Type u} [Field F] {L : Type v} [Field L] [Algebra F L] {n : ℕ}
    (f : F[X]) (x : Fin n → L) : Prop :=
  (f.map (algebraMap F L)).roots = Multiset.map x Finset.univ.val

open scoped Classical in
/-- **Layer 4, the universal resolvent.** The orbit product in the formal roots: the product of
`X − Ψ` over the rename-orbit of `Φ`, a monic polynomial of degree `[Sₙ : H]` whose coefficients
are integral polynomials in `x₀, …, x_{n−1}`. Everything about a resolvent that does not mention
a polynomial lives here. -/
noncomputable def universalResolvent {n : ℕ} (Φ : MvPolynomial (Fin n) ℤ) :
    (MvPolynomial (Fin n) ℤ)[X] :=
  ∏ Ψ ∈ Finset.univ.image fun σ : Equiv.Perm (Fin n) => MvPolynomial.rename (⇑σ) Φ, (X - C Ψ)

/-- **Layer 4, the elementary-symmetric substitution** `xᵢ ↦ eᵢ₊₁`. The fundamental theorem of
symmetric polynomials is Mathlib's `MvPolynomial.esymmAlgHom_fin_bijective`: this map is
injective, with image exactly the symmetric polynomials. A symmetric polynomial therefore has
exactly one expression through it, which is what makes the `orbitProduct` field below
determined rather than chosen. -/
noncomputable def esymmSubst (n : ℕ) : MvPolynomial (Fin n) ℤ →+* MvPolynomial (Fin n) ℤ :=
  (MvPolynomial.aeval fun i : Fin n => MvPolynomial.esymm (Fin n) ℤ ((i : ℕ) + 1)).toRingHom

/-- **Layer 4, the Vieta substitution.** For a monic `f` of degree `n` over `R`, the `(k+1)`-st
elementary symmetric polynomial of the roots of `f` is `(−1)^(k+1) * f.coeff (n − (k+1))`. This
is the ring morphism that performs that substitution; it is what turns a universal integral
expression in the elementary symmetric polynomials into a polynomial over `R`. Its correctness
— that these values *are* the elementary symmetric polynomials of a root enumeration — is the
Vieta milestone below, and that milestone is where monicity and the degree are used. -/
noncomputable def vietaHom {R : Type u} [CommRing R] (n : ℕ) (f : R[X]) :
    MvPolynomial (Fin n) ℤ →+* R :=
  MvPolynomial.eval₂Hom (Int.castRingHom R)
    fun i : Fin n => (-1) ^ ((i : ℕ) + 1) * f.coeff (n - ((i : ℕ) + 1))

/-- **Layer 4, a static resolvent specification.** Universal library data, written and proved
once: an invariant in the formal roots, the subgroup that is exactly its stabilizer, and an
integral symmetric expression for the orbit product. Nothing here mentions a polynomial or a
coefficient ring; specialization is `ResolventSpec.specialize` below. -/
structure ResolventSpec (n : ℕ) where
  /-- The subgroup the resolvent tests membership in. -/
  H : Subgroup (Equiv.Perm (Fin n))
  /-- The invariant polynomial, with integral coefficients. -/
  Φ : MvPolynomial (Fin n) ℤ
  /-- The stabilizer of `Φ` is exactly `H`, not merely contained in it. "Exactly" is the point:
  a containment would not let the factorization of the resolvent detect the subgroup. -/
  stabilizer_eq : ∀ σ : Equiv.Perm (Fin n), MvPolynomial.rename (⇑σ) Φ = Φ ↔ σ ∈ H
  /-- **The integral symmetric expression for the orbit product**: the universal resolvent
  rewritten in the elementary symmetric polynomials. This field is *determined*, not chosen —
  `esymmSubst` is injective, so `orbitProduct_esymm` has at most one solution, and the
  fundamental theorem of symmetric polynomials says it has one. -/
  orbitProduct : (MvPolynomial (Fin n) ℤ)[X]
  /-- Substituting the elementary symmetric polynomials for the variables recovers the orbit
  product in the formal roots. -/
  orbitProduct_esymm : orbitProduct.map (esymmSubst n) = universalResolvent Φ

/-- **Layer 4, specialization, over any commutative ring.** Substitute the coefficients of `f`
for the elementary symmetric polynomials in the integral orbit product. The definition is total;
its agreement with the root-side product is a theorem with `f.Monic` and `f.natDegree = n` in
its hypotheses. Because the universal side is integral, `specialize ℤ f` is an integral
polynomial and every other coefficient ring receives it by base change. -/
noncomputable def ResolventSpec.specialize {n : ℕ} (spec : ResolventSpec n) (R : Type u)
    [CommRing R] (f : R[X]) : R[X] :=
  spec.orbitProduct.map (vietaHom n f)

open scoped Classical in
/-- **Layer 4, the root-side orbit resolvent.** The product of `X − Ψ(x)` over the rename-orbit
of `Φ`, evaluated at a root vector `x`.

⚠ The orbit is taken in `MvPolynomial (Fin n) ℤ`, and the values are the images of *those*
polynomials. Taking the orbit after mapping the coefficients into `L` would be wrong: over a
base where two integral renamings of `Φ` become equal, that orbit is smaller, and the product
over it is not the specialization of the universal resolvent. -/
noncomputable def galResolvent {L : Type v} [CommRing L] {n : ℕ}
    (Φ : MvPolynomial (Fin n) ℤ) (x : Fin n → L) : L[X] :=
  ∏ Ψ ∈ Finset.univ.image fun σ : Equiv.Perm (Fin n) => MvPolynomial.rename (⇑σ) Φ,
    (X - C (MvPolynomial.eval₂ (Int.castRingHom L) x Ψ))

/-- **Layer 4.** The resolvent cubic of the depressed quartic `X⁴ + pX² + qX + r`, from the
`D₄`-invariant `x₀x₂ + x₁x₃`. (Named `resolventCubic`, not `resolvent`: in Mathlib
`resolvent` is spectral theory.) That this cubic is `quarticD4Spec.specialize` at the depressed
quartic is a theorem below, not a definition. -/
noncomputable def resolventCubic {F : Type u} [Field F] (p q r : F) : F[X] :=
  X ^ 3 - C p * X ^ 2 - C (4 * r) * X + C (4 * p * r - q ^ 2)

/-- **Layer 4, the invariant behind the resolvent sextic.** Indexing `Fin 5` by `ℤ/5`,
`Φ = Σ_a x_a² (x_{a+1} x_{a−1} + x_{a+2} x_{a−2})`, ten terms of shape `x_a² x_b x_c`. This is
the invariant of Dummit, *Solving solvable quintics*, §1, with his `x₁, …, x₅` read as
`x₀, …, x₄`; the ten monomials are the same ten. Its stabilizer is exactly the Frobenius group
`F₂₀ = AGL(1,5)` of order 20 and its `S₅`-orbit has six elements, so the orbit resolvent is a
sextic; both facts are targets below. Defining the resolvent as that orbit product makes it
self-contained, so nothing depends on transcribing a closed coefficient formula. -/
noncomputable def quinticF20Invariant : MvPolynomial (Fin 5) ℤ :=
  ∑ a : Fin 5, (MvPolynomial.X a) ^ 2 *
    (MvPolynomial.X (a + 1) * MvPolynomial.X (a - 1) +
      MvPolynomial.X (a + 2) * MvPolynomial.X (a - 2))

/-- **Layer 4, collision evidence for a specialized orbit resolvent.** The specialized resolvent
never loses degree: it is the image of a monic polynomial of degree `[Sₙ : H]` under a ring
morphism, and `specialize_natDegree` below records that. What specialization can destroy is
*distinctness of the values*: two orbit elements, hence two cosets of `H`, can take the same
value at the roots of a particular `f`. Only distinct values let the factorization of the
resolvent read the subgroup, and over a field separability of the specialized resolvent records
exactly that. This evidence is required before the corresponding upper-bound theorem may run;
`x⁵ − x` below is the polynomial that shows the requirement is not decoration. -/
structure ResolventSeparationEvidence {F : Type u} [Field F] {n : ℕ} (spec : ResolventSpec n)
    (f : F[X]) : Prop where
  /-- Distinct cosets did not collide at the roots of this particular polynomial. -/
  specializationSeparated : (spec.specialize F f).Separable

/-! ### Tschirnhaus transforms, on the coefficient side -/

/-- **Layer 4.** The Tschirnhaus transform of `f` by `T`: the monic integral polynomial whose
roots are `T(α)` for the roots `α` of `f`. It is a resultant in the two variables, so it is a
function of the coefficients of `f` and `T` alone. -/
def tschirnhausPolynomial (f T : ℤ[X]) : ℤ[X] :=
  sorry

/-- **Layer 4.** `T` separates the roots of `f`: it is admissible as a Tschirnhaus transform. -/
def TschirnhausAdmissible (f T : ℤ[X]) : Prop :=
  sorry

/-! ### The registered specifications -/

/-- The number of registered resolvent specifications in each degree. -/
def numResolventSpecs : ℕ → ℕ
  | 4 => 1
  | 5 => 2
  | _ => 0

/-- A registered specification is named by a bounded index, so an identifier out of range is
not representable. -/
abbrev ResolventSpecIndex (n : ℕ) : Type := Fin (numResolventSpecs n)

/-- **Layer 4, the quartic specification.** The `D₄`-invariant `x₀x₂ + x₁x₃`, whose stabilizer
is exactly `referenceSubgroup 4 2`, the reference for the label `4T3`: the dihedral group of
order 8 preserving the pairing `{{0,2},{1,3}}`. Its specialization at a depressed quartic is the
resolvent cubic. -/
noncomputable def quarticD4Spec : ResolventSpec 4 where
  H := referenceSubgroup 4 ⟨2, by decide⟩
  Φ := MvPolynomial.X 0 * MvPolynomial.X 2 + MvPolynomial.X 1 * MvPolynomial.X 3
  stabilizer_eq := sorry
  orbitProduct := sorry
  orbitProduct_esymm := sorry

/-- **Layer 4, the quintic specification.** The invariant `quinticF20Invariant`, whose
stabilizer is exactly `referenceSubgroup 5 2`, the reference for the label `5T3`. -/
noncomputable def quinticF20Spec : ResolventSpec 5 where
  H := referenceSubgroup 5 ⟨2, by decide⟩
  Φ := quinticF20Invariant
  stabilizer_eq := sorry
  orbitProduct := sorry
  orbitProduct_esymm := sorry

/-- **Layer 4, the quintic pair-sum specification**, whose orbit has ten elements. The
stabilizer of `x₀ + x₁` is the intransitive group `S_{{0,1}} × S_{{2,3,4}}` of order 12, so it
is not a reference subgroup of any label; it is pinned here by generators. -/
noncomputable def quinticPairSumSpec : ResolventSpec 5 where
  H := Subgroup.closure {Equiv.swap 0 1, Equiv.swap 2 3, Equiv.swap 3 4}
  Φ := MvPolynomial.X 0 + MvPolynomial.X 1
  stabilizer_eq := sorry
  orbitProduct := sorry
  orbitProduct_esymm := sorry

/-- The small library registry: index `0` in degree 4 is `quarticD4Spec`, index `0` in degree 5
is `quinticF20Spec`, and index `1` in degree 5 is `quinticPairSumSpec`. -/
noncomputable def registeredResolvent (n : ℕ) (i : ResolventSpecIndex n) : ResolventSpec n :=
  sorry

/-- **Layer 4.** The resolvent sextic of a quintic: the specialization of the `F₂₀`
specification, **over `ℤ`**. Coefficient integrality is a theorem about `specialize` and not an
extra hypothesis, so this is a monic integral sextic; by the rational root theorem every
rational root of it is therefore an integer, which is what makes "has a rational root" a finite
condition on integers. The polynomial over `ℚ` is its image, by `specialize_map`. -/
noncomputable def resolventSextic (f : ℤ[X]) : ℤ[X] :=
  quinticF20Spec.specialize ℤ f

end Prototypes

section GaloisSide

variable {F : Type u} [Field F]

/-! ## Layer 0: the permutation representation -/

/-- **Non-vacuity.** The smallest interesting Galois group of a polynomial: `x³ − 2` over `ℚ`
has Galois group of order 6 (it is `S₃ = 3T2`; LMFDB field `3.1.108.1`). -/
example : Nat.card (X ^ 3 - 2 : ℚ[X]).Gal = 6 :=
  sorry

/-- **Layer 0, degree bookkeeping.** A separable polynomial has exactly `natDegree` distinct
roots in its splitting field. This is what makes the degree-`n` permutation picture available,
and it is the companion the Layer 9 predicate needs. -/
example (f : F[X]) (hf : f ≠ 0) (hsep : f.Separable) :
    Fintype.card (f.rootSet f.SplittingField) = f.natDegree :=
  sorry

open scoped Classical in
/-- **Layer 0, orbits and irreducible factors.** The principal statement is an *equivalence*:
the orbits of the Galois group on the roots correspond to the distinct monic irreducible
factors, the orbit of a root `α` being the root set of `minpoly F α`. Equality of the two
cardinalities is the corollary below, not the target. -/
example (p : F[X]) (hp : p ≠ 0) (hsep : p.Separable) :
    Nonempty (orbitRel.Quotient p.Gal (p.rootSet p.SplittingField) ≃
      (UniqueFactorizationMonoid.normalizedFactors p).toFinset) :=
  sorry

open scoped Classical in
/-- **Layer 0, the cardinality corollary** of the equivalence above. -/
example (p : F[X]) (hp : p ≠ 0) (hsep : p.Separable) :
    Nat.card (orbitRel.Quotient p.Gal (p.rootSet p.SplittingField)) =
      (UniqueFactorizationMonoid.normalizedFactors p).toFinset.card :=
  sorry

/-- **Layer 0, transitivity means irreducibility** for separable nonconstant polynomials. One
direction consumes `galAction_isPretransitive`. -/
example (p : F[X]) (hsep : p.Separable) (hdeg : 0 < p.natDegree) :
    IsPretransitive p.Gal (p.rootSet p.SplittingField) ↔ Irreducible p :=
  sorry

open scoped Classical in
/-- **Layer 0, parity.** The polynomial's parity invariant (the LMFDB's even/odd column): the
image lies in the alternating group exactly when every element acts by an even permutation of
the roots. Layer 3 computes this from the discriminant. -/
example (p : F[X]) (hsep : p.Separable) :
    (Polynomial.Gal.galActionHom p p.SplittingField).range ≤
        alternatingGroup (p.rootSet p.SplittingField) ↔
      ∀ σ : p.Gal, Equiv.Perm.sign (Polynomial.Gal.galActionHom p p.SplittingField σ) = 1 :=
  sorry

/-- **Layer 0, the point stabilizer has index the degree.** With the block–stabilizer
dictionary of Layer 1, this is what makes the field side and the permutation side line up. -/
example (p : F[X]) (hp : Irreducible p) (hsep : p.Separable)
    (α : p.rootSet p.SplittingField) :
    (stabilizer p.Gal α).index = p.natDegree :=
  sorry

/-! ## Layer 2: the dictionary between Galois theory and permutations -/

/-- **Layer 2, prime degree implies primitive** (via `MulAction.IsPreprimitive.of_prime_card`
once the degree bookkeeping is in place). -/
example (p : F[X]) (hp : Irreducible p) (hsep : p.Separable) (hdeg : p.natDegree.Prime) :
    IsPreprimitive p.Gal (p.rootSet p.SplittingField) :=
  sorry

/-- **Layer 2, primitivity means no proper intermediate field.** For irreducible separable `p`
of degree `≥ 2` with root `α`, the root action is primitive exactly when `F(α)/F` has no
intermediate field other than the two ends, that is, when `F(α)` is an atom. The degree
hypothesis rules out the linear case, where the one-point action is primitive but `F(α) = ⊥`
is not an atom; it corresponds to the `[Nontrivial X]` hypothesis of Mathlib's
`isCoatom_stabilizer_iff_preprimitive`, which this transports along the Galois correspondence
and the Layer 1 block–stabilizer dictionary. -/
example (p : F[X]) (hp : Irreducible p) (hsep : p.Separable) (hdeg : 1 < p.natDegree)
    (α : p.SplittingField) (hα : α ∈ p.rootSet p.SplittingField) :
    IsPreprimitive p.Gal (p.rootSet p.SplittingField) ↔
      IsAtom (IntermediateField.adjoin F {α}) :=
  sorry

/-- **Layer 2, blocks and intermediate fields, with the orientation made explicit.** The
block–stabilizer correspondence preserves inclusion and the Galois correspondence reverses it,
so the composite **reverses** inclusion: it is an order isomorphism onto the order dual, that
is, an order anti-isomorphism. The two ends check the orientation: `E = F(α)` gives the
one-point block, and `E = F` gives the whole root set. -/
def blocksIntermediateFieldsOrderIso (p : F[X]) (hp : Irreducible p) (hsep : p.Separable)
    (hdeg : 1 < p.natDegree) (α : p.SplittingField) (hα : α ∈ p.rootSet p.SplittingField) :
    {B : Set (p.rootSet p.SplittingField) //
        (⟨α, hα⟩ : p.rootSet p.SplittingField) ∈ B ∧ IsBlock p.Gal B} ≃o
      (Set.Iic (IntermediateField.adjoin F {α}))ᵒᵈ :=
  sorry

open scoped Pointwise in
/-- A block goes to the fixed field of its setwise stabilizer. -/
theorem blocksIntermediateFieldsOrderIso_apply (p : F[X]) (hp : Irreducible p)
    (hsep : p.Separable) (hdeg : 1 < p.natDegree) (α : p.SplittingField)
    (hα : α ∈ p.rootSet p.SplittingField)
    (B : {B : Set (p.rootSet p.SplittingField) //
      (⟨α, hα⟩ : p.rootSet p.SplittingField) ∈ B ∧ IsBlock p.Gal B}) :
    (OrderDual.ofDual (blocksIntermediateFieldsOrderIso p hp hsep hdeg α hα B)).val
      = IntermediateField.fixedField (MulAction.stabilizer p.Gal B.1) :=
  sorry

/-- **Layer 2, 2-transitivity.** The root action of an irreducible separable `p` of degree
`≥ 2` is 2-transitive exactly when `p/(X − α)` stays irreducible over `F(α)` (transitivity of
the point stabilizer, via `SubMulAction.ofStabilizer`; the degree hypothesis rules out the
vacuously 2-pretransitive one-point case, where the quotient is `1`). -/
example (p : F[X]) (hp : Irreducible p) (hsep : p.Separable) (hdeg : 1 < p.natDegree)
    (α : p.SplittingField) (hα : α ∈ p.rootSet p.SplittingField) :
    IsMultiplyPretransitive p.Gal (p.rootSet p.SplittingField) 2 ↔
      Irreducible
        ((p.map (algebraMap F (IntermediateField.adjoin F {α}))) /ₘ
          (X - C (IntermediateField.AdjoinSimple.gen F α))) :=
  sorry

/-! ## Layer 3: the discriminant and the alternating group -/

/-- **Layer 3, the root-product formula** (the TODO of
`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`; coordinate upstream): for a monic
polynomial split by `L` with root enumeration `r`, `disc f = ∏_{i<j} (rᵢ − rⱼ)²`. -/
example {L : Type v} [Field L] [Algebra F L] (f : F[X]) (hf : f.Monic)
    (r : Fin f.natDegree → L)
    (hr : (f.map (algebraMap F L)).roots = Multiset.map r Finset.univ.val) :
    algebraMap F L f.discr = ∏ i, ∏ j ∈ Finset.Ioi i, (r i - r j) ^ 2 :=
  sorry

/-- **Layer 3, base change of the discriminant**, which is what Layer 5 needs at
`ℤ → ZMod p`. -/
example {R : Type u} {S : Type v} [CommRing R] [CommRing S] (φ : R →+* S) (f : R[X])
    (hf : f.Monic) : (f.map φ).discr = φ f.discr :=
  sorry

/-- **Layer 3.** Nonvanishing of the discriminant detects separability, in the monic case.

⚠ `F` is a **field** here, and that is not slack in the statement. Over a commutative ring, or
even over a domain, the two sides come apart: `Polynomial.Separable` is coprimality of `f` with
`f'` in the coefficient ring, and the next milestone exhibits an integral polynomial with
nonzero discriminant that fails it. The ring-level content of the discriminant is the universal
polynomial identity of the root-product formula above; the separability reading is
field-level. -/
example (f : F[X]) (hf : f.Monic) : f.discr ≠ 0 ↔ f.Separable :=
  sorry

/-- **Layer 3, the field hypothesis is necessary.** `X² − 1` over `ℤ` has discriminant `4 ≠ 0`
and is not `Polynomial.Separable`: a coprimality witness would give `2 ∣ 1` on evaluating at
`1`. So `discr ≠ 0 ↔ Separable` is false over `ℤ`, and every use of it over `ℤ` goes through the
fraction field, as in the milestone below. -/
example : (X ^ 2 - 1 : ℤ[X]).discr = 4 ∧ ¬ (X ^ 2 - 1 : ℤ[X]).Separable :=
  sorry

/-- **Layer 3, the criterion over a domain**, obtained by passing to the fraction field. This is
the form Layer 5 and the certificates of Layer 6 use over `ℤ`: a nonzero integral discriminant
says that the polynomial is separable **over `ℚ`**, and says nothing about coprimality in
`ℤ[X]`. -/
example {R : Type u} [CommRing R] [IsDomain R] {K : Type v} [Field K] [Algebra R K]
    [IsFractionRing R K] (f : R[X]) (hf : f.Monic) :
    f.discr ≠ 0 ↔ (f.map (algebraMap R K)).Separable :=
  sorry

open scoped Classical in
/-- **Layer 3, the discriminant test.** In characteristic other than 2, the Galois image lies
in the alternating group exactly when the discriminant is a square. The hypothesis is not
droppable: in characteristic 2 the product of root differences is itself symmetric, so its
square root is always rational and the test detects nothing. -/
example (hchar : ringChar F ≠ 2) (f : F[X]) (hf : f.Monic) (hsep : f.Separable) :
    IsSquare f.discr ↔
      (Polynomial.Gal.galActionHom f f.SplittingField).range ≤
        alternatingGroup (f.rootSet f.SplittingField) :=
  sorry

/-- **Layer 3, worked instance:** `disc (x³ − 3x − 1) = 81 = 9²`, the cyclic cubic `3T1`
(LMFDB field `3.3.81.1`). Its companion `x³ − 2` has discriminant `−108`, not a square. -/
example : (X ^ 3 - 3 * X - 1 : ℚ[X]).discr = 81 :=
  sorry

example : ¬ IsSquare (X ^ 3 - 2 : ℚ[X]).discr :=
  sorry

/-! ## Layer 4: resolvents

The five milestones of the symmetric-polynomial descent come first, in order. They are what
makes the coefficient-side resolvent exist at all: Galois invariance alone does not put the
orbit product's coefficients in the base field, and without the descent "compute the
coefficient-side resolvent" would hide the algebra behind a choice of splitting field.
-/

/-- **Layer 4, descent step 1: the orbit product is invariant under the full symmetric group.**
Renaming the formal roots permutes the orbit of `Φ` and so fixes the product over it. This is a
statement about `Sₙ`, not about a Galois group, and it holds for every `Φ`. -/
example {n : ℕ} (Φ : MvPolynomial (Fin n) ℤ) (σ : Equiv.Perm (Fin n)) :
    (universalResolvent Φ).map (MvPolynomial.rename (⇑σ)).toRingHom = universalResolvent Φ :=
  sorry

/-- **Layer 4, descent step 2: each coefficient is a symmetric polynomial in the formal
roots.** The coefficientwise reading of step 1. -/
example {n : ℕ} (Φ : MvPolynomial (Fin n) ℤ) (k : ℕ) :
    ((universalResolvent Φ).coeff k).IsSymmetric :=
  sorry

/-- **Layer 4, descent step 3: the fundamental theorem of symmetric polynomials.** Each
coefficient is an *integral* polynomial in the elementary symmetric polynomials, and only one
such polynomial: `esymmSubst` is injective by `MvPolynomial.esymmAlgHom_fin_injective` and its
image is the symmetric polynomials by `MvPolynomial.esymmAlgHom_fin_bijective`. This is the
milestone that makes the `orbitProduct` field of a `ResolventSpec` determined rather than
chosen, and it is where integrality of the coefficient side comes from. -/
example {n : ℕ} (Φ : MvPolynomial (Fin n) ℤ) :
    ∃! D : (MvPolynomial (Fin n) ℤ)[X], D.map (esymmSubst n) = universalResolvent Φ :=
  sorry

/-- **Layer 4, descent step 4: Vieta.** For a monic `g` of degree `n` over a domain, listed with
multiplicity by `x`, the `(k+1)`-st elementary symmetric polynomial evaluated at `x` is the
signed coefficient `(−1)^(k+1) * g.coeff (n − (k+1))`. This is what `vietaHom` substitutes, and
this milestone is the reason monicity and the degree are hypotheses of every theorem that reads
`specialize` as a resolvent. -/
example {L : Type v} [CommRing L] [IsDomain L] {n : ℕ} (g : L[X]) (hg : g.Monic)
    (hdeg : g.natDegree = n) (x : Fin n → L)
    (hx : g.roots = Multiset.map x Finset.univ.val) (k : Fin n) :
    MvPolynomial.eval x (MvPolynomial.esymm (Fin n) L ((k : ℕ) + 1))
      = (-1) ^ ((k : ℕ) + 1) * g.coeff (n - ((k : ℕ) + 1)) :=
  sorry

/-- **Layer 4, descent step 5: the specialization is the root-side orbit product.** In a field
where `f` splits, the coefficient-side resolvent maps to the product over the orbit evaluated at
the roots. The root product says what the resolvent *means*; `specialize` says how to obtain it
from the coefficients of `f`, and this is the theorem that joins the two. -/
example {L : Type v} [Field L] [Algebra F L] {n : ℕ} (spec : ResolventSpec n) (f : F[X])
    (hf : f.Monic) (hdeg : f.natDegree = n) (x : Fin n → L) (hx : IsRootEnumeration f x) :
    (spec.specialize F f).map (algebraMap F L) = galResolvent spec.Φ x :=
  sorry

/-- **Layer 4, base change.** Specialization commutes with any ring morphism on the
coefficients. No hypothesis on `f` is needed, because `vietaHom` reads coefficients and
`Polynomial.map` commutes with that; the hypotheses live in the *interpretation* milestones, not
here. -/
theorem specialize_map {R : Type u} {S : Type v} [CommRing R] [CommRing S] {n : ℕ}
    (spec : ResolventSpec n) (φ : R →+* S) (f : R[X]) :
    (spec.specialize R f).map φ = spec.specialize S (f.map φ) :=
  sorry

/-- **Layer 4, coefficient integrality**, the case `ℤ → ℚ` of base change: the resolvent of an
integral polynomial over `ℚ` is the image of an integral one. This is what makes
`resolventSextic` a polynomial over `ℤ`. -/
example {n : ℕ} (spec : ResolventSpec n) (f : ℤ[X]) :
    (spec.specialize ℤ f).map (Int.castRingHom ℚ)
      = spec.specialize ℚ (f.map (Int.castRingHom ℚ)) :=
  specialize_map spec (Int.castRingHom ℚ) f

/-- **Layer 4, reduction modulo `p`**, the case `ℤ → ZMod p` of base change. ⚠ The *identity* is
unconditional; the Galois-theoretic reading of the reduced resolvent is not. That reading needs
`p` good for `f` **and** good for the specialized resolvent, which is a second and independent
condition; see `ResolventSpec.IsGoodPrime` in Layer 5. -/
example {n : ℕ} (spec : ResolventSpec n) (f : ℤ[X]) (p : ℕ) [Fact p.Prime] :
    (spec.specialize ℤ f).map (Int.castRingHom (ZMod p))
      = spec.specialize (ZMod p) (f.map (Int.castRingHom (ZMod p))) :=
  specialize_map spec (Int.castRingHom (ZMod p)) f

/-- **Layer 4, the specialized resolvent is monic of the full orbit degree**, over every
coefficient ring and for every `f`: it is the image of a monic polynomial of degree
`[Sₙ : spec.H]`. Degree is therefore never the thing a specialization destroys, and no theorem
below takes the full orbit degree as a hypothesis. What a specialization can destroy is
distinctness of the orbit *values*; that is `ResolventSeparationEvidence`. -/
example {R : Type u} [CommRing R] [Nontrivial R] {n : ℕ} (spec : ResolventSpec n) (f : R[X]) :
    (spec.specialize R f).Monic ∧ (spec.specialize R f).natDegree = spec.H.index :=
  sorry

/-- **Layer 4, what a root enumeration entails: the polynomial splits.** Listing `n = natDegree`
roots with multiplicity is exactly splitting; the finite indexing is not available before this
is known. -/
example {L : Type v} [Field L] [Algebra F L] {n : ℕ} (f : F[X]) (hf : f ≠ 0)
    (hdeg : f.natDegree = n) (x : Fin n → L) (hx : IsRootEnumeration f x) :
    (f.map (algebraMap F L)).Splits :=
  sorry

/-- **Layer 4, what a root enumeration entails: a *bijective* indexing needs separability.**
Without it the enumeration repeats a root, the permutation action is on too few points, and the
stabilizer reading of the resolvent's roots is false. -/
example {L : Type v} [Field L] [Algebra F L] {n : ℕ} (f : F[X]) (hf : f ≠ 0)
    (hdeg : f.natDegree = n) (x : Fin n → L) (hx : IsRootEnumeration f x) :
    Function.Injective x ↔ (f.map (algebraMap F L)).Separable :=
  sorry

/-- **Layer 4, the degenerate case, and why the collision hypothesis is not decoration.**
`f = x⁵ − x` is separable — its discriminant is `256` — yet only three of the six orbit values of
the `F₂₀`-invariant are distinct at its roots `0, ±1, ±i`, and its resolvent sextic is
`(X − 2)⁴ (X² + 16)`. So the sextic has the rational root `2` while the Galois group, generated
by the transposition of `i` and `−i`, is **not** conjugate into `F₂₀`, which contains no
transposition. A rational root of a resolvent proves the containment only under separation
evidence; the other direction, that a containment produces a rational root, needs no
hypothesis. -/
example : resolventSextic (X ^ 5 - X) = (X - C 2) ^ 4 * (X ^ 2 + C 16) :=
  sorry

/-- **Layer 4, the acceptance test against the literature.** Dummit's closed formula (2′) for
the resolvent sextic of `x⁵ + ax + b`. It is a test of the orbit-product definition against the
source, and **not** the definition: a disagreement is a defect in the specification, in the
descent, or in the Vieta substitution. Three instances the roadmap uses follow from it — `x⁵ − 2`
gives `X⁶ − 50000X`, `x⁵ − 5x − 12` gives a sextic with the rational root `40`, and `x⁵ − x`
gives the collision witness above. -/
example (a b : ℤ) :
    resolventSextic (X ^ 5 + C a * X + C b) =
      X ^ 6 + C (8 * a) * X ^ 5 + C (40 * a ^ 2) * X ^ 4 + C (160 * a ^ 3) * X ^ 3 +
        C (400 * a ^ 4) * X ^ 2 + C (512 * a ^ 5 - 3125 * b ^ 4) * X +
        C (256 * a ^ 6 - 9375 * a * b ^ 4) :=
  sorry

/-- **Layer 4, the quartic closed form.** The resolvent cubic is the specialization of the
`D₄` specification at a depressed quartic. The closed form is a theorem about the universal
object, not a definition of the resolvent. -/
example (p q r : F) :
    quarticD4Spec.specialize F (X ^ 4 + C p * X ^ 2 + C q * X + C r) = resolventCubic p q r :=
  sorry

/-- **Layer 4, quartic bookkeeping:** a depressed quartic and its resolvent cubic have the
*same* discriminant. Two consequences: the quartic decision table needs no separation evidence,
because a separable quartic has a separable resolvent cubic automatically; and the sign
convention of `Polynomial.discr` is the same on both sides. The quintic has no such identity,
which is why the sextic keeps its evidence hypothesis. -/
example (p q r : ℚ) :
    (X ^ 4 + C p * X ^ 2 + C q * X + C r : ℚ[X]).discr = (resolventCubic p q r).discr :=
  sorry

/-- **Layer 4, one row of the quartic decision table** (the `A₄` row): irreducible quartic,
irreducible resolvent cubic, square discriminant, hence Galois group of order 12. The full
table (`4T1` to `4T5`) is a Layer 4 milestone; worked instance `x⁴ + 8x + 12` (LMFDB field
`4.0.5184.1`, group `A₄ = 4T4`). -/
example (p q r : ℚ) (hf : Irreducible (X ^ 4 + C p * X ^ 2 + C q * X + C r : ℚ[X]))
    (hres : Irreducible (resolventCubic p q r))
    (hsq : IsSquare (X ^ 4 + C p * X ^ 2 + C q * X + C r : ℚ[X]).discr) :
    Nat.card (X ^ 4 + C p * X ^ 2 + C q * X + C r : ℚ[X]).Gal = 12 :=
  sorry

end GaloisSide

/-! ## Layer 1: permutation groups, blocks, and wreath products -/

section PermutationSide

/-- **Layer 1, the block–stabilizer dictionary** (Wielandt 7.5; Dixon–Mortimer 1.5A): for a
transitive action, the blocks containing a point correspond order-isomorphically to the
subgroups between its stabilizer and the whole group. Mathlib has both endpoints
(`MulAction.BlockMem` is a bounded order, and `isCoatom_stabilizer_iff_preprimitive` is the
coatom shadow); this is the lattice isomorphism that Layer 2 transports to intermediate
fields. -/
def blockStabilizerOrderIso {G : Type u} [Group G] {X : Type v} [MulAction G X]
    [IsPretransitive G X] (a : X) :
    {B : Set X // a ∈ B ∧ IsBlock G B} ≃o Set.Icc (stabilizer G a) ⊤ :=
  sorry

open scoped Pointwise in
/-- The map goes from a block to its setwise stabilizer. This lemma is what pins the
definition; an equivalence that exists but is not named this way would be useless downstream. -/
theorem blockStabilizerOrderIso_apply {G : Type u} [Group G] {X : Type v} [MulAction G X]
    [IsPretransitive G X] (a : X) (B : {B : Set X // a ∈ B ∧ IsBlock G B}) :
    ((blockStabilizerOrderIso a B : Set.Icc (stabilizer G a) ⊤) : Subgroup G)
      = stabilizer G (B : Set X) :=
  sorry

/-- The inverse sends a subgroup to the orbit of `a` under it. -/
theorem blockStabilizerOrderIso_symm_apply {G : Type u} [Group G] {X : Type v} [MulAction G X]
    [IsPretransitive G X] (a : X) (H : Set.Icc (stabilizer G a) ⊤) :
    (((blockStabilizerOrderIso a).symm H : {B : Set X // a ∈ B ∧ IsBlock G B}) : Set X)
      = MulAction.orbit ((H : Subgroup G)) a :=
  sorry

open scoped Pointwise in
/-- **Layer 1, minimal blocks.** A minimal nontrivial block `B` containing `a` corresponds to
a subgroup minimal above `stabilizer G a`; consequently the setwise stabilizer of `B` acts
primitively **on `B`**. This is not interchangeable with the statement about maximal blocks
below; crossing the two is the standard error here. -/
example {G : Type u} [Group G] {X : Type v} [MulAction G X] [IsPretransitive G X]
    (a : X) (B : Set X) (haB : a ∈ B) (hB : IsBlock G B)
    (hmin : ∀ B' : Set X, a ∈ B' → IsBlock G B' → B' ⊆ B → B' = {a} ∨ B' = B)
    (hne : B ≠ {a}) :
    IsPreprimitive (stabilizer G B) B :=
  sorry

open scoped Pointwise in
/-- **Layer 1, maximal blocks.** A maximal proper block `B` containing `a` corresponds to a
maximal proper subgroup of `G`; consequently `G` acts primitively **on the block system**. -/
example {G : Type u} [Group G] {X : Type v} [MulAction G X] [IsPretransitive G X]
    (a : X) (B : Set X) (haB : a ∈ B) (hB : IsBlock G B)
    (hmax : ∀ B' : Set X, a ∈ B' → IsBlock G B' → B ⊆ B' → B' = B ∨ B' = Set.univ)
    (hne : B ≠ Set.univ) :
    IsCoatom (stabilizer G B) :=
  sorry

/-- **Layer 1, the imprimitivity grid** (the wreath-embedding structure theorem, stated
without the wreath packaging; the `WreathProduct` version is a Layer 1 milestone coordinated
with Mathlib's `RegularWreathProduct`): a transitive action with a nontrivial block is an
action on a grid `Fin m × Fin l` in which every element permutes the rows. -/
example {G : Type u} [Group G] {X : Type v} [Finite X] [MulAction G X]
    [IsPretransitive G X] {B : Set X} (hB : IsBlock G B)
    (h1 : 1 < B.ncard) (h2 : B.ncard < Nat.card X) :
    ∃ (m l : ℕ) (e : X ≃ Fin m × Fin l), 1 < m ∧ 1 < l ∧
      ∀ g : G, ∃ σ : Equiv.Perm (Fin m),
        ∀ x : Fin m × Fin l, (e (g • e.symm x)).1 = σ x.1 :=
  sorry

/-- **Layer 1, Jordan's prime-cycle theorem** (Wielandt 13.9). Mathlib's
`GroupTheory/GroupAction/Jordan.lean` records the same statement as a `proof_wanted`, so this
follows its shape. It is a Tau Ceti theorem with a Tau Ceti name, proved here. -/
theorem alternatingGroup_le_of_isPreprimitive_of_isCycle_mem
    {α : Type u} [Fintype α] [DecidableEq α] {G : Subgroup (Equiv.Perm α)}
    (hG : IsPreprimitive G α) {p : ℕ} (hp : p.Prime) (hp' : p + 3 ≤ Nat.card α)
    {g : Equiv.Perm α} (hgc : g.IsCycle) (hgp : g.support.card = p) (hg : g ∈ G) :
    alternatingGroup α ≤ G :=
  sorry

/-- **Layer 1, the transposition-extraction lemma** that Layer 9 needs: an element with
exactly one 2-cycle and all other cycle lengths odd has an odd power that is a
transposition. -/
example {α : Type u} [Fintype α] [DecidableEq α] (g : Equiv.Perm α)
    (h2 : Multiset.count 2 g.cycleType = 1)
    (hodd : ∀ k ∈ g.cycleType, k ≠ 2 → Odd k) :
    ∃ m : ℕ, (g ^ m).IsSwap :=
  sorry

/-! ## Layers 6 and 7: reference subgroups and the labels -/

/-- **Layer 6 and 7, every reference subgroup is transitive.** Proved once, which is why the
label predicate carries no separate transitivity clause. -/
example (n : ℕ) (j : TransitiveGroupIndex n) :
    IsPretransitive (referenceSubgroup n j) (Fin n) :=
  sorry

/-- **Layer 6, the label of a polynomial is independent of the relabeling.** `HasGaloisLabel`
compares the Galois image with a reference subgroup through some equivalence
`f.rootSet f.SplittingField ≃ Fin n`, and this is the companion theorem promised there: if one
equivalence exhibits the label then so does every other. That is what makes the predicate a
statement about `f` rather than about a chosen numbering of its roots. -/
example {F : Type u} [Field F] (f : F[X]) {n : ℕ} (j : TransitiveGroupIndex n)
    (e e' : f.rootSet f.SplittingField ≃ Fin n)
    (h : TransitiveGroupLabel j
      (Subgroup.map (Equiv.permCongrHom e).toMonoidHom
        (Polynomial.Gal.galActionHom f f.SplittingField).range)) :
    TransitiveGroupLabel j
      (Subgroup.map (Equiv.permCongrHom e').toMonoidHom
        (Polynomial.Gal.galActionHom f f.SplittingField).range) :=
  sorry

/-- **Layer 6, the order spectrum in degree 5:** a transitive subgroup of `S₅` has order 5,
10, 20, 60, or 120. -/
example (G : Subgroup (Equiv.Perm (Fin 5))) [IsPretransitive G (Fin 5)] :
    Nat.card G = 5 ∨ Nat.card G = 10 ∨ Nat.card G = 20 ∨
      Nat.card G = 60 ∨ Nat.card G = 120 :=
  sorry

/-- **Layer 6, order classifies in degree 5:** two transitive subgroups of `S₅` of the same
order are conjugate. -/
example (G H : Subgroup (Equiv.Perm (Fin 5))) [IsPretransitive G (Fin 5)]
    [IsPretransitive H (Fin 5)] (h : Nat.card G = Nat.card H) :
    ∃ g : Equiv.Perm (Fin 5), Subgroup.map (MulAut.conj g).toMonoidHom G = H :=
  sorry

/-- **Layer 6, the label partition, degree 5:** every transitive subgroup of `S₅` has exactly
one of the labels `5T1` to `5T5`. The corresponding statement in degrees 6 to 11 is **not** a
target of this roadmap; see the scope section of `README.md`. -/
example (G : Subgroup (Equiv.Perm (Fin 5))) [IsPretransitive G (Fin 5)] :
    ∃! j : TransitiveGroupIndex 5, TransitiveGroupLabel j G :=
  sorry

/-- **Layer 6, degree 4:** order determines the label except at order 4, where cyclicity
separates `4T1 = C₄` from `4T2 = V₄`. -/
example (G H : Subgroup (Equiv.Perm (Fin 4))) [IsPretransitive G (Fin 4)]
    [IsPretransitive H (Fin 4)] (hG4 : Nat.card G = 4) (hH4 : Nat.card H = 4)
    (hGc : IsCyclic G) (hHc : IsCyclic H) :
    ∃ g : Equiv.Perm (Fin 4), Subgroup.map (MulAut.conj g).toMonoidHom G = H :=
  sorry

/-! ## Layer 4, the two resolvent specifications worked out -/

open scoped Classical in
/-- **Layer 4, the quartic specification.** The stabilizer of `x₀x₂ + x₁x₃` has order 8 and
its orbit has three elements, so the resolvent is a cubic. -/
example :
    (Finset.univ.image fun σ : Equiv.Perm (Fin 4) =>
      MvPolynomial.rename (⇑σ)
        (MvPolynomial.X 0 * MvPolynomial.X 2 + MvPolynomial.X 1 * MvPolynomial.X 3 :
          MvPolynomial (Fin 4) ℤ)).card = 3 :=
  sorry

open scoped Classical in
/-- **Layer 4, the quintic specification.** The `S₅`-orbit of the `F₂₀`-invariant has six
elements, so `resolventSextic` is a sextic. -/
example :
    (Finset.univ.image fun σ : Equiv.Perm (Fin 5) =>
      MvPolynomial.rename (⇑σ) quinticF20Invariant).card = 6 :=
  sorry

/-- **Layer 4, the stabilizer is exactly `F₂₀`,** of order 20. "Exactly" is the point: a
containment would not make the resolvent's factorization detect the subgroup. -/
example :
    Nat.card {σ : Equiv.Perm (Fin 5) //
      MvPolynomial.rename (⇑σ) quinticF20Invariant = quinticF20Invariant} = 20 :=
  sorry

open scoped Classical in
/-- **Layer 4, the pair-sum resolvent has degree 10.** The stabilizer of `x₀ + x₁` is
`S_{{0,1}} × S_{{2,3,4}}` of order 12, so the orbit has `120/12 = 10` elements, indexed by
the ten unordered pairs. -/
example :
    (Finset.univ.image fun σ : Equiv.Perm (Fin 5) =>
      MvPolynomial.rename (⇑σ)
        (MvPolynomial.X 0 + MvPolynomial.X 1 : MvPolynomial (Fin 5) ℤ)).card = 10 :=
  sorry

end PermutationSide

/-! ## Layer 5: Frobenius specialization, and the worked examples over `ℚ` -/

section Frobenius

attribute [local instance] Polynomial.Gal.splits_ℚ_ℂ

open scoped Classical in
/-- **Layer 5 carrier.** The multiset of degrees of the monic irreducible factors of the
reduction of `f` modulo `p`; this is the right-hand side of the imported factorization theorem. -/
noncomputable def factorDegrees (f : ℤ[X]) (p : ℕ) [Fact p.Prime] : Multiset ℕ :=
  Multiset.map Polynomial.natDegree
    (UniqueFactorizationMonoid.normalizedFactors (f.map (Int.castRingHom (ZMod p))))

/-- **Layer 5, carrier API: multiplicity one.** For monic `f` and a prime `p` that does not
divide `f.discr`, the reduction of `f` modulo `p` is separable, so no factor repeats and
`factorDegrees f p` is the multiset of degrees of distinct factors. -/
example (f : ℤ[X]) (hf : f.Monic) (p : ℕ) [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ f.discr) :
    (f.map (Int.castRingHom (ZMod p))).Separable :=
  sorry

/-- **Layer 5, a good prime for a polynomial.** `p` does not divide the discriminant, so the
reduction stays separable and the factorization type is a cycle type of the Galois image. -/
def IsGoodPrime (f : ℤ[X]) (p : ℕ) : Prop := ¬ (p : ℤ) ∣ f.discr

/-- **Layer 5, a good prime for a polynomial *and* a resolvent.** Reducing a resolvent modulo
`p` is a second condition, independent of the first: the identity
`(spec.specialize ℤ f).map (ZMod p) = spec.specialize (ZMod p) (f mod p)` is unconditional, but
reading the reduced resolvent as a resolvent of the reduced polynomial needs the reduced
resolvent to stay separable too. A prime may be good for `f` and bad for the resolvent, and then
no factorization statement about the reduced resolvent is available. Any milestone that reduces
a resolvent modulo `p` carries this predicate, and not `IsGoodPrime`. -/
def ResolventSpec.IsGoodPrime {n : ℕ} (spec : ResolventSpec n) (f : ℤ[X]) (p : ℕ) : Prop :=
  ¬ (p : ℤ) ∣ f.discr ∧ ¬ (p : ℤ) ∣ (spec.specialize ℤ f).discr

/-- **Layer 5, a finite-field input.** For an element `α` of an extension of
`ZMod q`, the degree of the minimal polynomial is the size of the orbit of `α` under `x ↦ x ^ q`.
This statement mentions no Galois theory over `ℚ`, and it is not a step of the imported theorem
either. It is Lemma 1 of Rabin's paper and supports the finite-field existence results in
Layer 9. -/
example (q : ℕ) [Fact q.Prime] {K : Type u} [Field K] [Algebra (ZMod q) K] (α : K)
    (hα : IsIntegral (ZMod q) α) (n : ℕ) (hn : 0 < n) :
    (minpoly (ZMod q) α).natDegree = n ↔
      (α ^ q ^ n = α ∧ ∀ m, 0 < m → m < n → α ^ q ^ m ≠ α) :=
  sorry

/-! ### Dedekind's factorization theorem, imported

This roadmap does **not** prove it. `NumberFieldArithmetic.exists_gal_fullCycleType_eq_factorizationType`
is the theorem, and `README.md`'s contract section is the record. Its statement is the one
below with `fullCycleType` and `factorDegrees` unfolded, so the two declarations here are
**closed**: they break if the supplier's signature moves or if either abbreviation is redefined.
There is no second Dedekind theorem in this file, and no `sorry` stands for one.
-/

/-- **Layer 5, the contract check.** The supplied theorem, spelled with this roadmap's two
abbreviations. Nothing owes a proof here: the proof is the supplier's declaration, applied. -/
example (f : ℤ[X]) (hf : f.Monic) (p : ℕ) [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ f.discr) :
    ∃ σ : (f.map (Int.castRingHom ℚ)).Gal,
      fullCycleType (Polynomial.Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ σ) =
        factorDegrees f p := by
  simpa only [fullCycleType, factorDegrees] using
    NumberFieldArithmetic.exists_gal_fullCycleType_eq_factorizationType f hf p hp

/-- **Layer 5, the membership statement.** The first theorem of this layer that this roadmap
owns. The factor degrees of `f mod p` are exhibited by an element *of the Galois image*.
Everything downstream—the irreducibility criterion, recognition theorems, and Layer 9—is applied
to this form, and none of it mentions a prime ideal or a Frobenius element.

The criterion is applied to an `f` that is not yet known to be irreducible, which is why the
supplied theorem has to cover reducible `f`. -/
theorem factorDegrees_mem_fullCycleType_galImage (f : ℤ[X]) (hf : f.Monic) (p : ℕ)
    [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ f.discr) :
    ∃ g ∈ (Polynomial.Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ).range,
      fullCycleType g = factorDegrees f p := by
  obtain ⟨σ, hσ⟩ :=
    NumberFieldArithmetic.exists_gal_fullCycleType_eq_factorizationType f hf p hp
  exact ⟨_, ⟨σ, rfl⟩, by simpa only [fullCycleType, factorDegrees] using hσ⟩

/-- **Layer 5, the membership statement run backwards** (worked instance): `x⁴ + 1` has Galois
group `V₄`, which contains no 4-cycle, so it is reducible modulo *every* prime. This is the
classical example of a polynomial irreducible over `ℚ` that is irreducible modulo no prime. -/
example (p : ℕ) [Fact p.Prime] : ¬ Irreducible (X ^ 4 + 1 : (ZMod p)[X]) :=
  sorry

/-- **Layers 5 and 6, the `V₄` label data for `x⁴ + 1`** (LMFDB field `4.0.256.1`, `ℚ(ζ₈)`,
group `4T2`): order 4 and not cyclic. Consume the cyclotomic API
`galCyclotomicEquivUnitsZMod`, which identifies the group with `(ZMod 8)ˣ`. -/
example : Nat.card (X ^ 4 + 1 : ℚ[X]).Gal = 4 ∧ ¬ IsCyclic (X ^ 4 + 1 : ℚ[X]).Gal :=
  sorry

/-- **Layer 5, the generic quintic theorem.** Let `f` be a monic quintic over `ℤ`, and let `p`
and `q` be primes that do not divide `f.discr`. Assume that `f mod p` is irreducible, and that
`f mod q` has factor degrees `(2,1,1,1)`. Then `f` has full `S₅` Galois group. The proof is
transitivity, plus a transposition, in prime degree; it consumes
`Equiv.Perm.subgroup_eq_top_of_swap_mem`. Worked examples instantiate this theorem. -/
example (f : ℤ[X]) (hf : f.Monic) (hdeg : f.natDegree = 5)
    (p q : ℕ) [Fact p.Prime] [Fact q.Prime]
    (hp : ¬ (p : ℤ) ∣ f.discr) (hq : ¬ (q : ℤ) ∣ f.discr)
    (hirr : Irreducible (f.map (Int.castRingHom (ZMod p))))
    (htype : factorDegrees f q = {2, 1, 1, 1}) :
    Function.Surjective (Polynomial.Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ) :=
  sorry

/-- **Layers 5 and 6, the `S₅` acceptance instance** (`x⁵ − x − 1`; LMFDB field `5.1.2869.1`,
group `5T5`). Modulo 2 the factorization `(x² + x + 1)(x³ + x² + 1)` exhibits an
element of order 6; modulo 5 the polynomial is Artin–Schreier, hence irreducible; transitive
together with an element of order 6 forces `S₅`. -/
example : Nat.card (X ^ 5 - X - 1 : ℚ[X]).Gal = 120 :=
  sorry

/-! ## Layer 6: what the low-degree data determine, and certificates

Three different things, kept apart. First, a **classification theorem from a package of data**:
what the discriminant and the registered resolvents determine on their own. Second, a **sound
certificate**: a finite package of evidence, which may additionally contain good-prime
factorizations, together with a soundness theorem. Third, a **search** for such evidence, which
is not here: nothing below claims that a certificate exists for a given `f`, and nothing below
terminates. The existence of a prime with a prescribed factorization type is Chebotarev's
theorem, which this roadmap does not own and does not use.
-/

/-- **Layer 6, the degree-five package theorem.** Exactly what the discriminant and the
resolvent sextic determine for an irreducible quintic, with the separation evidence attached to
the two branches that need it. Three of the four branches determine the label. The fourth does
not: `discriminant_and_sextic_do_not_distinguish_C5_D5` exhibits the pair that keeps it a
disjunction. -/
example (f : ℤ[X]) (hf : f.Monic) (hdeg : f.natDegree = 5)
    (hirr : Irreducible (f.map (Int.castRingHom ℚ))) :
    (¬ IsSquare f.discr → (∀ a : ℤ, (resolventSextic f).eval a ≠ 0) →
        HasGaloisLabel (f.map (Int.castRingHom ℚ)) (⟨4, by decide⟩ : TransitiveGroupIndex 5)) ∧
      (IsSquare f.discr → (∀ a : ℤ, (resolventSextic f).eval a ≠ 0) →
        HasGaloisLabel (f.map (Int.castRingHom ℚ)) (⟨3, by decide⟩ : TransitiveGroupIndex 5)) ∧
      (¬ IsSquare f.discr → (resolventSextic f).discr ≠ 0 →
        (∃ a : ℤ, (resolventSextic f).eval a = 0) →
        HasGaloisLabel (f.map (Int.castRingHom ℚ)) (⟨2, by decide⟩ : TransitiveGroupIndex 5)) ∧
      (IsSquare f.discr → (resolventSextic f).discr ≠ 0 →
        (∃ a : ℤ, (resolventSextic f).eval a = 0) →
        HasGaloisLabel (f.map (Int.castRingHom ℚ)) (⟨0, by decide⟩ : TransitiveGroupIndex 5) ∨
          HasGaloisLabel (f.map (Int.castRingHom ℚ)) (⟨1, by decide⟩ : TransitiveGroupIndex 5)) :=
  sorry

/-- **Layer 6, the fourth branch is genuinely undetermined.** `x⁵ + x⁴ − 4x³ − 3x² + 3x + 1`
(the field `ℚ(ζ₁₁)⁺`, label `5T1`) and `x⁵ − 5x − 12` (label `5T2`) both have square
discriminant — `11⁴ = 121²` and `8000²` — and both have a **separable** resolvent sextic with a
rational root, at `−16` and at `40`. So the hypotheses of the package theorem's fourth branch
hold of both while the labels differ, and a decision procedure claimed from the discriminant
and a rational sextic root alone would be false. Separating `5T1` from `5T2` takes a further
datum, and the certificates below carry one: a good-prime factorization of type `(1,2,2)`, or a
second root of `f` in `ℚ[X]/(f)`.

This is a regression theorem, not stored database computation: the pair is recorded as the
counterexample that keeps the fourth branch a disjunction, so that no revision reintroduces a
"quintic decision procedure" from those two data. It is the acceptance test for the certificate
API — the `cyclic` and `dihedral` constructors carry evidence beyond the sextic because this
pair shows those two data do not decide. -/
theorem discriminant_and_sextic_do_not_distinguish_C5_D5 :
    (X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1 : ℤ[X]).discr = 121 ^ 2 ∧
      (X ^ 5 - 5 * X - 12 : ℤ[X]).discr = 8000 ^ 2 ∧
      (resolventSextic (X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1)).eval (-16) = 0 ∧
      (resolventSextic (X ^ 5 - 5 * X - 12)).eval 40 = 0 ∧
      (resolventSextic (X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1)).discr ≠ 0 ∧
      (resolventSextic (X ^ 5 - 5 * X - 12)).discr ≠ 0 ∧
      HasGaloisLabel ((X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1 : ℤ[X]).map
          (Int.castRingHom ℚ)) (⟨0, by decide⟩ : TransitiveGroupIndex 5) ∧
      HasGaloisLabel ((X ^ 5 - 5 * X - 12 : ℤ[X]).map (Int.castRingHom ℚ))
        (⟨1, by decide⟩ : TransitiveGroupIndex 5) :=
  sorry

/-- **Layer 6, a good-prime factorization item.** `p` is good for `f` and the factor degrees of
`f mod p` are `t`. By the membership statement this exhibits an element of the Galois image with
`fullCycleType` equal to `t`, so it is **lower-bound** evidence: it never certifies containment
in a proper subgroup. -/
def HasFactorDegrees (f : ℤ[X]) (p : ℕ) (t : Multiset ℕ) : Prop :=
  ∃ hp : p.Prime, IsGoodPrime f p ∧ @factorDegrees f p ⟨hp⟩ = t

/-- **Layer 6, a resolvent item.** `a` is a root of the resolvent sextic, and that sextic is
separable, so the root really does place the Galois image inside a conjugate of `F₂₀`. Both
conjuncts are conditions on integers: the sextic is monic over `ℤ`. This is **upper-bound**
evidence. -/
def HasSexticRoot (f : ℤ[X]) (a : ℤ) : Prop :=
  (resolventSextic f).eval a = 0 ∧ (resolventSextic f).discr ≠ 0

/-- **Layer 6, a normality item.** `b` names a root of `f` in `ℚ[X]/(f)` other than the class of
`X`. For an irreducible quintic the point stabilizer fixes exactly one root unless the group is
`C₅`, so a second root in the field generated by one root is upper-bound evidence that pins
`5T1`. -/
def HasSecondRootInRootField (f : ℤ[X]) (b : ℚ[X]) : Prop :=
  ((f.map (Int.castRingHom ℚ)).comp b) %ₘ (f.map (Int.castRingHom ℚ)) = 0 ∧
    b %ₘ (f.map (Int.castRingHom ℚ)) ≠ X

/-- **Layer 6, a degree-five certificate.** One constructor per sound route to a label; the
arguments are the evidence, and `Verifies` says what has to hold of it. The type is
deliberately small and closed: a certificate is a finite package, it carries no proof of its own
existence, and nothing here searches for one. -/
inductive QuinticCertificate : Type
  /-- `5T1`: irreducible modulo `p`, and a second root of `f` in `ℚ[X]/(f)`. -/
  | cyclic (p : ℕ) (b : ℚ[X]) : QuinticCertificate
  /-- `5T2`: irreducible modulo `p`, square discriminant `s²`, a root `a` of a separable sextic,
  and a prime `q` with factorization type `(1,2,2)`, which exhibits the element of order two
  that `C₅` has not. -/
  | dihedral (p q : ℕ) (s a : ℤ) : QuinticCertificate
  /-- `5T3`: irreducible modulo `p`, non-square discriminant, and a root `a` of a separable
  sextic. -/
  | frobeniusF20 (p : ℕ) (a : ℤ) : QuinticCertificate
  /-- `5T4`: irreducible modulo `p`, square discriminant `s²`, and a prime `q` with
  factorization type `(1,1,3)`. -/
  | alternating (p q : ℕ) (s : ℤ) : QuinticCertificate
  /-- `5T5`: irreducible modulo `p`, and a prime `q` with factorization type `(2,3)`, which
  exhibits an element of order six. -/
  | symmetric (p q : ℕ) : QuinticCertificate

/-- The label a certificate claims. -/
def QuinticCertificate.label : QuinticCertificate → TransitiveGroupIndex 5
  | .cyclic _ _ => ⟨0, by decide⟩
  | .dihedral _ _ _ _ => ⟨1, by decide⟩
  | .frobeniusF20 _ _ => ⟨2, by decide⟩
  | .alternating _ _ _ => ⟨3, by decide⟩
  | .symmetric _ _ => ⟨4, by decide⟩

/-- **Layer 6, the verification conditions.** Every clause is finite: an equation between
integers, a divisibility of integers, an equation in `ℚ[X]`, or the factorization of `f` over
the finite field `ZMod p`. There is no quantifier over primes and no unbounded search. -/
def QuinticCertificate.Verifies (f : ℤ[X]) : QuinticCertificate → Prop
  | .cyclic p b => HasFactorDegrees f p {5} ∧ HasSecondRootInRootField f b
  | .dihedral p q s a =>
      HasFactorDegrees f p {5} ∧ f.discr = s ^ 2 ∧ HasSexticRoot f a ∧
        HasFactorDegrees f q {1, 2, 2}
  | .frobeniusF20 p a =>
      HasFactorDegrees f p {5} ∧ ¬ IsSquare f.discr ∧ HasSexticRoot f a
  | .alternating p q s =>
      HasFactorDegrees f p {5} ∧ f.discr = s ^ 2 ∧ HasFactorDegrees f q {1, 1, 3}
  | .symmetric p q => HasFactorDegrees f p {5} ∧ HasFactorDegrees f q {2, 3}

open scoped Classical in
/-- **Layer 6, the checker.** `decide` of the verification conditions. It is `noncomputable`
only because Mathlib's `Polynomial` is: the conditions themselves are finite, and an
implementation evaluates them by integer arithmetic and by factoring over a finite field. -/
noncomputable def QuinticCertificate.check (f : ℤ[X]) (cert : QuinticCertificate) : Bool :=
  decide (cert.Verifies f)

/-- **Layer 6, the public theorem: soundness, and only soundness.** A certificate that checks
proves the label. Nothing is claimed in the other direction: there is no theorem that a
certificate exists, and no procedure that finds one. Producing the good primes a certificate
needs is Chebotarev's theorem, which is outside this roadmap. -/
theorem QuinticCertificate.check_sound (f : ℤ[X]) (hf : f.Monic) (hdeg : f.natDegree = 5)
    (cert : QuinticCertificate) (h : cert.check f = true) :
    HasGaloisLabel (f.map (Int.castRingHom ℚ)) cert.label :=
  sorry

/-- **Layer 6, the five acceptance certificates.** One per label, with the evidence written
out: `x⁵ + x⁴ − 4x³ − 3x² + 3x + 1` is irreducible modulo `2` and has the second root `α² − 2`
in `ℚ[X]/(f)`; `x⁵ − 5x − 12` is irreducible modulo `7`, has discriminant `8000²`, sextic root
`40`, and type `(1,2,2)` modulo `3`; `x⁵ − 2` is irreducible modulo `11`, has non-square
discriminant `50000`, and sextic root `0`; `x⁵ + 20x − 16` is irreducible modulo `3`, has
discriminant `32000²`, and type `(1,1,3)` modulo `7`; `x⁵ − x − 1` is irreducible modulo `3` and
has type `(2,3)` modulo `2`. -/
example :
    (QuinticCertificate.cyclic 2 (X ^ 2 - 2)).check
        (X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1) = true ∧
      (QuinticCertificate.dihedral 7 3 8000 40).check (X ^ 5 - 5 * X - 12) = true ∧
      (QuinticCertificate.frobeniusF20 11 0).check (X ^ 5 - 2) = true ∧
      (QuinticCertificate.alternating 3 7 32000).check (X ^ 5 + 20 * X - 16) = true ∧
      (QuinticCertificate.symmetric 3 2).check (X ^ 5 - X - 1) = true :=
  sorry

/-! ## Layer 9: `Sₙ` over `ℚ`, and its prerequisites -/

/-- **Layer 9, prerequisite 1.** For every degree there is a monic irreducible polynomial over
`ZMod 2`. Name the finite-field existence theorem that is used, or prove this statement here.
"Choose an irreducible polynomial" is not an instruction that an implementation agent can
follow. -/
example (d : ℕ) (hd : 1 ≤ d) :
    ∃ g : (ZMod 2)[X], g.Monic ∧ Irreducible g ∧ g.natDegree = d :=
  sorry

/-- **Layer 9, prerequisite 2.** A squarefree monic polynomial over `ZMod 3` of degree `n`
with factor degrees `(1, n−1)`. -/
example (n : ℕ) (hn : 2 ≤ n) :
    ∃ g : (ZMod 3)[X], g.Monic ∧ g.natDegree = n ∧ Squarefree g ∧
      ∃ h : (ZMod 3)[X], Irreducible h ∧ h.natDegree = n - 1 ∧ h ∣ g :=
  sorry

local instance factPrimeFive : Fact (Nat.Prime 5) := ⟨by norm_num⟩

/-- **Layer 9, prerequisite 3.** A squarefree monic polynomial over `ZMod 5` of degree `n`
with exactly one quadratic factor and all remaining factor degrees odd. -/
example (n : ℕ) (hn : 3 ≤ n) :
    ∃ g : (ZMod 5)[X], g.Monic ∧ g.natDegree = n ∧ Squarefree g ∧
      Multiset.count 2 (Multiset.map (fun h => h.natDegree)
        (UniqueFactorizationMonoid.normalizedFactors g)) = 1 ∧
      ∀ k ∈ Multiset.map (fun h => h.natDegree)
        (UniqueFactorizationMonoid.normalizedFactors g), k ≠ 2 → Odd k :=
  sorry

/-- **Layer 9, prerequisite 4.** Coefficientwise Chinese remainder theorem: prescribed monic
reductions at 2, 3 and 5 are realized by a monic integral polynomial of the same degree. -/
example (n : ℕ) (g2 : (ZMod 2)[X]) (g3 : (ZMod 3)[X]) (g5 : (ZMod 5)[X])
    (h2 : g2.Monic) (h3 : g3.Monic) (h5 : g5.Monic)
    (d2 : g2.natDegree = n) (d3 : g3.natDegree = n) (d5 : g5.natDegree = n) :
    ∃ f : ℤ[X], f.Monic ∧ f.natDegree = n ∧
      f.map (Int.castRingHom (ZMod 2)) = g2 ∧
      f.map (Int.castRingHom (ZMod 3)) = g3 ∧
      f.map (Int.castRingHom (ZMod 5)) = g5 :=
  sorry

/-- **Layer 9, the theorem.** For every `n` there is an explicit monic integral polynomial of
degree `n`, irreducible over `ℚ`, whose Galois action on the roots is the **full** symmetric
group. Irreducibility and surjectivity are both part of the statement: without them the
proposition would be satisfied by polynomials with repeated roots (see the file header and the
regression below). -/
example (n : ℕ) (hn : 1 ≤ n) :
    ∃ f : ℤ[X], f.Monic ∧ f.natDegree = n ∧
      Irreducible (f.map (Int.castRingHom ℚ)) ∧
      Function.Surjective (Polynomial.Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ) :=
  sorry

/-- **Layer 9, the regression that keeps the predicate honest.** A polynomial with repeated
roots does **not** have full symmetric Galois group in the sense of
`HasFullSymmetricGaloisGroup`, even though its Galois group does act as all permutations of
its one distinct root. A Layer-9 target stated only as bijectivity of `galActionHom` would be
satisfied by `X ^ n`, and so would say nothing. -/
example (n : ℕ) (hn : 2 ≤ n) :
    ¬ HasFullSymmetricGaloisGroup (X ^ n : ℚ[X]) :=
  sorry

end Frobenius

end TauCetiRoadmap.PolynomialGaloisGroups
