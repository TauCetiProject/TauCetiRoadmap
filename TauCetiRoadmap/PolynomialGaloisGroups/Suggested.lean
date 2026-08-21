import Mathlib
import TauCetiRoadmap.NumberFieldArithmetic.Suggested

/-!
# Galois groups of polynomials: target signatures

**This file is not the roadmap, and it is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors converge on names and signatures. To discharge all of them finishes neither a
layer nor the roadmap.

`sorry` is allowed in this human-owned roadmap library. It appears here in two roles, which
should not be confused. In an `example` it marks a milestone of this roadmap. In a `def` it
marks data that a frozen export supplies, and not a proof that anybody owes.

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

/-! ### Resolvents -/

/-- **Layer 4, root enumeration.** `x` lists the roots of `f` in `L`, with multiplicity. This
is the hypothesis under which a coefficient-side resolvent is compared with the root-side
product. -/
def IsRootEnumeration {F : Type u} [Field F] {L : Type v} [Field L] [Algebra F L] {n : ℕ}
    (f : F[X]) (x : Fin n → L) : Prop :=
  (f.map (algebraMap F L)).roots = Multiset.map x Finset.univ.val

open scoped Classical in
/-- **Layer 4 prototype.** The orbit resolvent of an invariant `Φ` evaluated at a root vector
`x`: the product of `X − Ψ(x)` over the orbit of `Φ` under permutation of the variables. Its
degree is the orbit size `[Sₙ : H]` when the orbit values stay distinct, and for `x`
enumerating the roots of a monic separable `f` its coefficients descend to `F`. -/
noncomputable def galResolvent {F : Type u} [Field F] {L : Type v} [Field L] [Algebra F L]
    {n : ℕ} (Φ : MvPolynomial (Fin n) F) (x : Fin n → L) : L[X] :=
  ∏ Ψ ∈ Finset.univ.image fun σ : Equiv.Perm (Fin n) => MvPolynomial.rename (⇑σ) Φ,
    (X - C (MvPolynomial.aeval x Ψ))

/-- **Layer 4, a static resolvent specification.** Library data, written and proved once: an
invariant together with the subgroup that is *exactly* its stabilizer. -/
structure ResolventSpec (n : ℕ) where
  /-- The subgroup the resolvent tests membership in. -/
  H : Subgroup (Equiv.Perm (Fin n))
  /-- The invariant polynomial. -/
  Φ : MvPolynomial (Fin n) ℤ
  /-- The stabilizer of `Φ` is exactly `H`, not merely contained in it. -/
  stabilizer_eq : ∀ σ : Equiv.Perm (Fin n), MvPolynomial.rename (⇑σ) Φ = Φ ↔ σ ∈ H
  /-- **The coefficient-side resolvent.** An executable function of the coefficients of `f`;
  the root product below is what it means. -/
  specialize : ℤ[X] → ℚ[X]
  /-- `specialize` computes the orbit resolvent. -/
  specialize_correct :
    ∀ f : ℤ[X], f.Monic → f.natDegree = n →
      ∀ x : Fin n → (f.map (Int.castRingHom ℚ)).SplittingField,
        IsRootEnumeration (f.map (Int.castRingHom ℚ)) x →
          (specialize f).map (algebraMap ℚ (f.map (Int.castRingHom ℚ)).SplittingField)
            = galResolvent (MvPolynomial.map (Int.castRingHom ℚ) Φ) x

/-- **Layer 4.** The resolvent cubic of the depressed quartic `X⁴ + pX² + qX + r`, from the
`D₄`-invariant `x₀x₂ + x₁x₃`. (Named `resolventCubic`, not `resolvent`: in Mathlib
`resolvent` is spectral theory.) -/
noncomputable def resolventCubic {F : Type u} [Field F] (p q r : F) : F[X] :=
  X ^ 3 - C p * X ^ 2 - C (4 * r) * X + C (4 * p * r - q ^ 2)

/-- **Layer 4, the invariant behind the resolvent sextic.** Indexing `Fin 5` by `ℤ/5`,
`Φ = Σ_a x_a² (x_{a+1} x_{a−1} + x_{a+2} x_{a−2})`, ten terms of shape `x_a² x_b x_c`. Its
stabilizer is exactly the Frobenius group `F₂₀ = AGL(1,5)` of order 20 and its `S₅`-orbit has
six elements, so the orbit resolvent is a sextic; both facts are targets below. Defining the
resolvent this way makes it self-contained, so nothing depends on transcribing Dummit's
closed coefficient formula. -/
noncomputable def quinticF20Invariant : MvPolynomial (Fin 5) ℤ :=
  ∑ a : Fin 5, (MvPolynomial.X a) ^ 2 *
    (MvPolynomial.X (a + 1) * MvPolynomial.X (a - 1) +
      MvPolynomial.X (a + 2) * MvPolynomial.X (a - 2))

/-- **Layer 4, collision evidence for a specialized orbit resolvent.** A resolvent
supplies a sound subgroup upper bound only when specialization has preserved the full orbit
degree and kept the orbit values distinct; over a field, separability records the latter.
This evidence is required before the corresponding upper-bound theorem may run. -/
structure ResolventSeparationEvidence {F : Type u} [Field F] (R : F[X])
    (expectedOrbitDegree : ℕ) : Prop where
  /-- The specialized resolvent still has the full orbit degree `[Sₙ : H]`. -/
  fullOrbitDegree : R.natDegree = expectedOrbitDegree
  /-- Distinct cosets did not collide at the roots of this particular polynomial. -/
  specializationSeparated : R.Separable

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
is exactly `referenceSubgroup 4 2`, the reference for the label `4T3`. Its `specialize` is the
resolvent cubic. -/
def quarticD4Spec : ResolventSpec 4 :=
  sorry

/-- **Layer 4, the quintic specification.** The invariant `quinticF20Invariant`, whose
stabilizer is exactly `referenceSubgroup 5 2`, the reference for the label `5T3`. -/
def quinticF20Spec : ResolventSpec 5 :=
  sorry

/-- **Layer 4, the quintic pair-sum specification**, whose orbit has ten elements. -/
def quinticPairSumSpec : ResolventSpec 5 :=
  sorry

/-- The small library registry: index `0` in degree 4 is `quarticD4Spec`, index `0` in degree 5
is `quinticF20Spec`, and index `1` in degree 5 is `quinticPairSumSpec`. -/
def registeredResolvent (n : ℕ) (i : ResolventSpecIndex n) : ResolventSpec n :=
  sorry

/-- **Layer 4.** The resolvent sextic of a quintic: the coefficient-side specialization of the
`F₂₀` specification. -/
def resolventSextic (f : ℤ[X]) : ℚ[X] :=
  quinticF20Spec.specialize f

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

/-- **Layer 3.** Nonvanishing of the discriminant detects separability, in the monic case. -/
example (f : F[X]) (hf : f.Monic) : f.discr ≠ 0 ↔ f.Separable :=
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

/-! ## Layer 4: resolvents -/

open scoped Classical in
/-- **Layer 4, rationality of the orbit resolvent.** Evaluated at an enumeration of the roots
of a monic `f`, the orbit resolvent has coefficients in the base field: it descends to `F[X]`,
by the fundamental theorem of symmetric polynomials. -/
example {L : Type v} [Field L] [Algebra F L] {n : ℕ} (f : F[X]) (hf : f.Monic)
    (hdeg : f.natDegree = n) (Φ : MvPolynomial (Fin n) F) (x : Fin n → L)
    (hx : (f.map (algebraMap F L)).roots = Multiset.map x Finset.univ.val) :
    ∃ R : F[X], galResolvent Φ x = R.map (algebraMap F L) :=
  sorry

/-- **Layer 4, quartic bookkeeping:** a depressed quartic and its resolvent cubic have the
*same* discriminant. -/
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
