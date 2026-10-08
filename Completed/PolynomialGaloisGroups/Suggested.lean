import Mathlib
import TauCeti.Algebra.Group.Action.End
import TauCeti.Algebra.Polynomial.ChineseRemainder
import TauCeti.Algebra.Polynomial.QuadraticDiscriminant
import TauCeti.FieldTheory.Finite.FactorizationPattern
import TauCeti.FieldTheory.Finite.Irreducible
import TauCeti.FieldTheory.GaloisGroups.Blocks
import TauCeti.FieldTheory.GaloisGroups.Certificate.Alternating
import TauCeti.FieldTheory.GaloisGroups.Certificate.Check
import TauCeti.FieldTheory.GaloisGroups.Certificate.Cyclic.Basic
import TauCeti.FieldTheory.GaloisGroups.Certificate.Cyclic.Dihedral
import TauCeti.FieldTheory.GaloisGroups.Certificate.Dihedral
import TauCeti.FieldTheory.GaloisGroups.Certificate.Evidence
import TauCeti.FieldTheory.GaloisGroups.Certificate.Examples
import TauCeti.FieldTheory.GaloisGroups.Certificate.Frobenius
import TauCeti.FieldTheory.GaloisGroups.Certificate.Generic
import TauCeti.FieldTheory.GaloisGroups.ConjugateFields
import TauCeti.FieldTheory.GaloisGroups.Cubic
import TauCeti.FieldTheory.GaloisGroups.Degree
import TauCeti.FieldTheory.GaloisGroups.Depression
import TauCeti.FieldTheory.GaloisGroups.Discriminant.Basic
import TauCeti.FieldTheory.GaloisGroups.Discriminant.Field
import TauCeti.FieldTheory.GaloisGroups.Embeddings
import TauCeti.FieldTheory.GaloisGroups.FactorDegrees
import TauCeti.FieldTheory.GaloisGroups.FrobeniusOrbits
import TauCeti.FieldTheory.GaloisGroups.Label
import TauCeti.FieldTheory.GaloisGroups.MultipleTransitivity
import TauCeti.FieldTheory.GaloisGroups.NonExamples
import TauCeti.FieldTheory.GaloisGroups.NormalClosure
import TauCeti.FieldTheory.GaloisGroups.Orbits
import TauCeti.FieldTheory.GaloisGroups.Product
import TauCeti.FieldTheory.GaloisGroups.Quartic.Basic
import TauCeti.FieldTheory.GaloisGroups.Quartic.Examples
import TauCeti.FieldTheory.GaloisGroups.Quartic.Reduction
import TauCeti.FieldTheory.GaloisGroups.Quintic
import TauCeti.FieldTheory.GaloisGroups.Reduction
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Homogeneous
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Quartic.Basic
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Quartic.Discriminant
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Quintic.Basic
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Quintic.Collision
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Quintic.PairSum
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Quintic.Pure
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Quintic.Solvable
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Quintic.Trinomial
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Reduction.Basic
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Reduction.Examples
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Root
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Spec
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Specialization
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Symmetric
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Tschirnhaus
import TauCeti.FieldTheory.GaloisGroups.Stabilizer
import TauCeti.FieldTheory.GaloisGroups.Symmetric.Basic
import TauCeti.FieldTheory.GaloisGroups.Symmetric.Realization
import TauCeti.FieldTheory.GaloisGroups.Tschirnhaus
import TauCeti.GroupTheory.Perm.Blocks
import TauCeti.GroupTheory.Perm.DihedralFour
import TauCeti.GroupTheory.Perm.Imprimitivity
import TauCeti.GroupTheory.Perm.Jordan
import TauCeti.GroupTheory.Perm.Jordan.Counterexamples
import TauCeti.GroupTheory.Perm.MultipleTransitivity
import TauCeti.GroupTheory.Perm.Partition
import TauCeti.GroupTheory.Perm.PermCongr
import TauCeti.GroupTheory.Perm.Recognition
import TauCeti.GroupTheory.Perm.SylowFive
import TauCeti.GroupTheory.Perm.SylowFour
import TauCeti.GroupTheory.Perm.TransitiveGroupLabel.Affine
import TauCeti.GroupTheory.Perm.TransitiveGroupLabel.Classification
import TauCeti.GroupTheory.Perm.TransitiveGroupLabel.Cyclic
import TauCeti.GroupTheory.Perm.TransitiveGroupLabel.Dihedral
import TauCeti.GroupTheory.Perm.TransitiveGroupLabel.KleinFour
import TauCeti.GroupTheory.Perm.TransitiveGroupLabel.Order
import TauCeti.GroupTheory.Perm.TransitiveGroupLabel.Parity
import TauCeti.GroupTheory.Perm.TransitiveGroupLabel.Primitive
import TauCeti.GroupTheory.Perm.TransitiveGroupLabel.Solvable
import TauCeti.GroupTheory.Perm.WreathProduct.Basic
import TauCeti.GroupTheory.Perm.WreathProduct.Primitive
import TauCeti.GroupTheory.Perm.WreathProduct.Regular
import TauCeti.GroupTheory.SpecificGroups.Affine.Primitive
import TauCeti.NumberTheory.NumberField.Frobenius.CycleType
import TauCeti.RingTheory.Polynomial.FactorDegrees
import TauCeti.RingTheory.Polynomial.Resultant.Discriminant
import TauCeti.RingTheory.Polynomial.RootEnumeration
import TauCeti.RingTheory.Polynomial.Tschirnhaus
import TauCeti.RingTheory.Polynomial.Vieta

/-!
# Galois groups of polynomials: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

Every milestone of `README.md`, Layers 0 to 6 and 9 with the worked examples and non-examples,
has a statement here in the form the roadmap asks for, closed by the Tau Ceti (or Mathlib)
declaration that realizes it, so the correspondence is checked by the Lean kernel rather than
asserted in prose. No statement is left as `sorry`. That is evidence for completion, not its
criterion: completion is judged by a milestone-by-milestone audit against `README.md`, which a
`sorry`-free file of suggested forms cannot replace.

The earlier version of this file proposed its own carriers (`fullCycleType`, `coordPermAut`,
`WreathProduct`, the `nTj` data model, `HasGaloisLabel`, `HasFullSymmetricGaloisGroup`,
`IsRootEnumeration`, `universalResolvent`, `esymmSubst`, `vietaHom`, `ResolventSpec` with
`specialize`, `galResolvent`, `resolventCubic`, `quinticF20Invariant`, the three registered
specifications, `resolventSextic`, `tschirnhausPolynomial`, `TschirnhausAdmissible`,
`factorDegrees`, the good-prime predicates and the certificate type), several of them with
`sorry` bodies. All of these now live in Tau Ceti, so the statements below are made about the
Tau Ceti objects directly, and each carrier is certified by its defining equation or iff. Dedekind's
factorization theorem is imported from Tau Ceti
(`TauCeti.NumberField.exists_gal_fullCycleType_eq_factorizationType`, the Number Field
Arithmetic supplier) rather than from that roadmap's `Suggested.lean`; the contract check of
Layer 5 is kept as a closed proof.

Deliberate differences between the README's forms and Tau Ceti's:

* Names and namespaces: `fullCycleType` is `Equiv.Perm.fullCycleType`, `factorDegrees` is
  `Polynomial.factorDegrees`, and `HasFullSymmetricGaloisGroup` is in namespace `Polynomial`.
  The wreath product acts on coordinates through Mathlib's `mulAutArrow`, so there is no separate
  `coordPermAut`; the block-stabilizer isomorphism is Mathlib's `MulAction.block_stabilizerOrderIso`
  onto `Set.Ici (stabilizer G a)`.
* The orbit-to-factor dictionary indexes factors by `Polynomial.Factors p` (monic irreducible
  divisors) and needs only `p ≠ 0`; the bridge to `(normalizedFactors p).toFinset` is below. The
  normal-closure and conjugate-field statements take `x : E` in a normal extension `E`.
* `F(√disc f)` is `TauCeti.discrField f E`, generated inside a chosen extension `E` by the roots
  of `X² − C disc`; `isSplittingField_discrField` shows it is the splitting field the README
  names. The isomorphism-of-base-fields case of functoriality is the bijective case of base change.
* The orbits of a resolvent are `MvPolynomial.renameOrbit`. There is no
  `ResolventSeparationEvidence` structure: its single field, separability of the specialized
  resolvent, is the hypothesis `(spec.specialize F f).Separable` of every theorem that needs it.
* Several statements are more general than the README asks: `tschirnhausPolynomial` and
  `resolventCubic` work over any commutative ring and `TschirnhausAdmissible` over any field; the
  quartic and quintic tables apply to any monic polynomial (depression is a separate theorem);
  the quintic criterion and package theorems need only `ringChar F ≠ 2`, not `ringChar F ∉ {2, 5}`;
  the factorization theorem does not need `f` separable; `QuinticCertificate.check_sound` needs no
  degree hypothesis; Layer 9's finite-field prerequisites hold for `2 ≤ n` and over any finite
  field.
* The quartic decision-table rows conclude `HasGaloisLabel`; the identification of each
  reference subgroup with `S₄`, `A₄`, `V₄`, `D₄` and `C₄` is the Layer 6 table.
* The reference subgroups `3T2`, `4T4`, `4T5`, `5T4` and `5T5` are `⊤` or `alternatingGroup`,
  and `4T2` is the Klein four-subgroup. The other rows are the README's generators.
* `HasSecondRootInRootField` compares with `X %ₘ f` rather than `X`. Product-action primitivity of
  the wreath product assumes `FaithfulSMul D Λ`, and the wreath embedding is injective exactly
  for a faithful action (`toWreathProduct_injective_iff`); both hypotheses are errata recorded in
  `README.md`.
* The README's `IsSolvable` is spelled `Group.IsSolvable` in the pinned Mathlib.

Earlier-proposed statements that are not carried over verbatim: `numResolventSpecs`,
`ResolventSpecIndex` and `registeredResolvent` are superseded by the named specifications
`quarticD4Spec`, `quinticF20Spec` and `quinticPairSumSpec`; the "imprimitivity grid"
`X ≃ Fin m × Fin l` is superseded by the wreath embedding along `α ≃ orbit G B × B`; the minimal
and maximal block statements are restated with `IsAtom` and `IsCoatom` in `BlockMem G a`; the
finite-field statement in Rabin's form is replaced by the README's milestone that factor degrees
are Frobenius orbit sizes; the two-cyclic-subgroups-of-order-4 example is replaced by
`transitiveGroupLabel_four_zero_iff` with uniqueness of labels; and the Layer 6 package theorem,
earlier stated over `ℤ` with integer sextic roots, is stated over a general field (the integer
form survives in `HasSexticRoot` and the certificate routes). Every other earlier statement is
kept, some in a stronger form.

Awaiting Tau Ceti (https://github.com/TauCetiProject/TauCeti/pull/13170), to be cited after the
next pin bump:

* **Not yet certified:** that the README's LMFDB generators generate the reference subgroups
  `3T2`, `4T2`, `4T4`, `4T5`, `5T4` and `5T5` (`referenceSubgroup_*_eq_closure`).
* **Proved in this file for now:** `disc(x⁵ − x − 1) = 2869`, by a resultant computation that
  moves to Tau Ceti as `discr_X_pow_five_sub_X_sub_one`, and the group-side quintic criterion,
  by a short bridge that becomes the public
  `isSolvable_gal_iff_exists_le_map_conj_referenceSubgroup_five_two`.

Not certified: Dedekind's cubic `x³ + x² − 2x + 8`, which the README cites as the false
generalization of the imported theorem (its content is ramification theory, owned by Number
Field Arithmetic), and the LMFDB field labels of the worked examples, which are provenance. The
existence of an admissible Tschirnhaus transform is explicitly not a milestone.
-/

namespace TauCetiRoadmap.PolynomialGaloisGroups

/-! ## Layer 0: the permutation representation of a polynomial -/

section Layer0

open Polynomial MulAction IntermediateField

universe u v

/-! ### `fullCycleType` and its API -/

section FullCycleType

variable {α β : Type*} [Fintype α] [DecidableEq α] [Fintype β] [DecidableEq β]

/-- **Constructor.** `fullCycleType σ` is the cycle type with the fixed points restored as parts
equal to `1`. It takes the carrier's `DecidableEq` as an argument and is not `noncomputable`. -/
example (σ : Equiv.Perm α) :
    σ.fullCycleType = σ.cycleType + Multiset.replicate (Fintype.card α - σ.support.card) 1 :=
  rfl

/-- **Simp form at the identity.** -/
example : (1 : Equiv.Perm α).fullCycleType = Multiset.replicate (Fintype.card α) 1 :=
  Equiv.Perm.fullCycleType_one

/-- **Examples in `Fin 4`.** The identity gives `{1,1,1,1}`, a transposition `{2,1,1}`, and a
4-cycle `{4}`. -/
example : (1 : Equiv.Perm (Fin 4)).fullCycleType = {1, 1, 1, 1} := by
  rw [Equiv.Perm.fullCycleType_one]
  rfl

example : (Equiv.swap 0 1 : Equiv.Perm (Fin 4)).fullCycleType = {2, 1, 1} := by
  have h : (0 : Fin 4) ≠ 1 := by decide
  simp only [Equiv.Perm.fullCycleType, Equiv.Perm.support_swap h, Finset.card_pair h,
    Fintype.card_fin, Equiv.Perm.isSwap_iff_cycleType.mp (Equiv.Perm.swap_isSwap_iff.mpr h)]
  rfl

example : (finRotate 4).fullCycleType = {4} := by
  rw [Equiv.Perm.fullCycleType_eq_cycleType (support_finRotate_of_le (by norm_num)),
    cycleType_finRotate_of_le (by norm_num)]

/-- **Comparison lemmas.** The parts sum to the degree; `fullCycleType` is the bare cycle type
exactly when there is no fixed point; and the number of parts equal to `1` is the number of fixed
points. -/
example (σ : Equiv.Perm α) : σ.fullCycleType.sum = Fintype.card α :=
  Equiv.Perm.sum_fullCycleType σ

example (σ : Equiv.Perm α) : σ.fullCycleType = σ.cycleType ↔ σ.support = Finset.univ :=
  Equiv.Perm.fullCycleType_eq_cycleType_iff

example (σ : Equiv.Perm α) :
    Multiset.count 1 σ.fullCycleType = Fintype.card α - σ.support.card :=
  Equiv.Perm.count_one_fullCycleType σ

/-- **Naturality.** `fullCycleType` is constant on conjugacy classes and commutes with transport
along an equivalence `α ≃ β`, that is, with `Equiv.permCongrHom`. -/
example {σ τ : Equiv.Perm α} (h : IsConj σ τ) : σ.fullCycleType = τ.fullCycleType :=
  Equiv.Perm.fullCycleType_eq_of_isConj h

example (g σ : Equiv.Perm α) : (g * σ * g⁻¹).fullCycleType = σ.fullCycleType :=
  Equiv.Perm.fullCycleType_conj g σ

example (e : α ≃ β) (σ : Equiv.Perm α) :
    (Equiv.permCongrHom e σ).fullCycleType = σ.fullCycleType :=
  Equiv.Perm.fullCycleType_permCongr e σ

/-- **Edge cases.** An empty carrier gives the empty multiset, and only then; with no fixed point
`fullCycleType` is the cycle type; and `σ = 1` is the only permutation all of whose parts are
`1`. -/
example [IsEmpty α] (σ : Equiv.Perm α) : σ.fullCycleType = 0 :=
  Equiv.Perm.fullCycleType_of_isEmpty σ

example (σ : Equiv.Perm α) : σ.fullCycleType = 0 ↔ Fintype.card α = 0 :=
  Equiv.Perm.fullCycleType_eq_zero_iff

example {σ : Equiv.Perm α} (h : σ.support = Finset.univ) : σ.fullCycleType = σ.cycleType :=
  Equiv.Perm.fullCycleType_eq_cycleType h

example (σ : Equiv.Perm α) :
    σ.fullCycleType = Multiset.replicate (Fintype.card α) 1 ↔ σ = 1 := by
  rw [Equiv.Perm.fullCycleType_def]
  exact Equiv.Perm.parts_partition_eq_replicate_one_iff

end FullCycleType

variable {F : Type u} [Field F]

/-- **Non-vacuity.** `x³ − 2` over `ℚ` has Galois group of order `6` (label `3T2`, LMFDB field
`3.1.108.1`). -/
example : Nat.card (X ^ 3 - 2 : ℚ[X]).Gal = 6 :=
  TauCeti.natCard_gal_X_pow_three_sub_two

/-! ### Degree bookkeeping -/

/-- **Degree bookkeeping.** A separable polynomial has `natDegree` distinct roots in its splitting
field, so they can be numbered by `Fin p.natDegree`; the Galois action on them is faithful, so the
image has the order of `p.Gal`. -/
example (p : F[X]) (hsep : p.Separable) :
    Fintype.card (p.rootSet p.SplittingField) = p.natDegree :=
  card_rootSet_eq_natDegree hsep (IsSplittingField.splits p.SplittingField p)

example (p : F[X]) (hsep : p.Separable) :
    Nonempty (p.rootSet p.SplittingField ≃ Fin p.natDegree) :=
  TauCeti.nonempty_rootSet_splittingField_equiv_fin p hsep

example (p : F[X]) {E : Type v} [Field E] [Algebra F E]
    [Fact ((p.map (algebraMap F E)).Splits)] :
    Function.Injective (Gal.galActionHom p E) :=
  Gal.galActionHom_injective p E

example (p : F[X]) (E : Type v) [Field E] [Algebra F E]
    [Fact ((p.map (algebraMap F E)).Splits)] :
    Nat.card (Gal.galActionHom p E).range = Nat.card p.Gal :=
  TauCeti.natCard_galActionHom_range p E

/-! ### Orbits and irreducible factors -/

section Orbits

variable {p : F[X]} (E : Type v) [Field E] [Algebra F E] [Fact ((p.map (algebraMap F E)).Splits)]

/-- **The orbit of a root is the set of roots of its minimal polynomial** inside `p.rootSet E`. -/
example (x : p.rootSet E) :
    orbit p.Gal x = Subtype.val ⁻¹' (minpoly F (x : E)).rootSet E :=
  TauCeti.orbit_eq_preimage_rootSet_minpoly E x

/-- **The orbit quotient is in bijection with the distinct monic irreducible factors**, the orbit
of `α` going to `minpoly F α`. `p.Factors` is the type of monic irreducible divisors of `p`, which
for nonzero `p` are exactly the members of `normalizedFactors p`. Only `p ≠ 0` is needed. -/
example (hp : p ≠ 0) (x : p.rootSet E) :
    ((TauCeti.orbitQuotientEquivFactors p E hp (Quotient.mk _ x) : p.Factors) : F[X]) =
      minpoly F (x : E) :=
  TauCeti.orbitQuotientEquivFactors_apply_mk E hp x

open scoped Classical in
example (hp : p ≠ 0) :
    Nonempty (orbitRel.Quotient p.Gal (p.rootSet E) ≃
      (UniqueFactorizationMonoid.normalizedFactors p).toFinset) :=
  ⟨(TauCeti.orbitQuotientEquivFactors p E hp).trans
    (Equiv.subtypeEquivRight fun q => by
      rw [Multiset.mem_toFinset, Polynomial.mem_normalizedFactors_iff hp])⟩

/-- **Along that bijection, the degree of a factor is the cardinality of its orbit.** For
separable `p` every factor is separable. -/
example (hp : p ≠ 0) (hsep : p.Separable) (ω : orbitRel.Quotient p.Gal (p.rootSet E)) :
    Nat.card (orbitRel.Quotient.orbit ω) =
      ((TauCeti.orbitQuotientEquivFactors p E hp ω : p.Factors) : F[X]).natDegree :=
  TauCeti.natCard_orbit_eq_natDegree_factor E hp ω (Polynomial.Factors.separable hsep _)

/-- **The cardinality corollary.** -/
example (hp : p ≠ 0) :
    Nat.card (orbitRel.Quotient p.Gal (p.rootSet E)) = Nat.card p.Factors :=
  TauCeti.natCard_orbitQuotient p E hp

/-! ### Transitivity and irreducibility -/

/-- **Transitivity means irreducibility**, for separable `p` of positive degree. -/
example (hsep : p.Separable) (hdeg : 0 < p.natDegree) :
    IsPretransitive p.Gal (p.rootSet E) ↔ Irreducible p :=
  TauCeti.isPretransitive_iff_irreducible E hsep hdeg

end Orbits

/-- **False generalization.** Without separability, `(X² − 2)²` over `ℚ` has a transitive Galois
action on its roots and is not irreducible. -/
example :
    ¬ ((X ^ 2 - 2) ^ 2 : ℚ[X]).Separable ∧ ¬ Irreducible ((X ^ 2 - 2) ^ 2 : ℚ[X]) ∧
      IsPretransitive ((X ^ 2 - 2) ^ 2 : ℚ[X]).Gal
        (((X ^ 2 - 2) ^ 2 : ℚ[X]).rootSet ((X ^ 2 - 2) ^ 2 : ℚ[X]).SplittingField) :=
  ⟨TauCeti.not_separable_X_sq_sub_two_sq, TauCeti.not_irreducible_X_sq_sub_two_sq,
    TauCeti.isPretransitive_gal_X_sq_sub_two_sq⟩

/-! ### Invariants of the image -/

section Invariants

variable (p : F[X]) (E : Type v) [Field E] [Algebra F E] [Fact ((p.map (algebraMap F E)).Splits)]

/-- **Order**, through `card_of_separable`, computed equally in the image. -/
example (hsep : p.Separable) :
    Nat.card (Gal.galActionHom p E).range = Module.finrank F p.SplittingField :=
  (TauCeti.natCard_galActionHom_range p E).trans (Gal.card_of_separable hsep)

open scoped Classical in
/-- **Parity.** The character `p.Gal →* ℤˣ` is `sign ∘ galActionHom`, and the image lies in the
alternating group exactly when that character is trivial. -/
example :
    (Gal.galActionHom p E).range ≤ alternatingGroup (p.rootSet E) ↔
      Equiv.Perm.sign.comp (Gal.galActionHom p E) = 1 :=
  MonoidHom.range_le_ker_iff _ _

/-- **Solvability**, as `IsSolvable p.Gal`, is the same computed in the image. -/
example : Group.IsSolvable p.Gal ↔ Group.IsSolvable (Gal.galActionHom p E).range := by
  let e := MonoidHom.ofInjective (Gal.galActionHom_injective p E)
  exact ⟨fun _ => Group.isSolvable_of_surjective (f := e.toMonoidHom) e.surjective,
    fun _ => Group.isSolvable_of_isSolvable_injective (f := e.toMonoidHom) e.injective⟩

open scoped Classical in
/-- **Cycle types of elements** are computed through `fullCycleType`, and do not depend on the
splitting extension in which the roots are read. -/
example (E' : Type*) [Field E'] [Algebra F E'] [Fact ((p.map (algebraMap F E')).Splits)]
    (g : p.Gal) :
    (Gal.galActionHom p E' g).fullCycleType = (Gal.galActionHom p E g).fullCycleType := by
  rw [Gal.galActionHom_eq_permCongr p E E' g]
  convert Equiv.Perm.fullCycleType_permCongr (Gal.rootsEquivRoots p E E') (Gal.galActionHom p E g)

end Invariants

/-! ### Polynomials and normal closures -/

section NormalClosure

variable {E : Type v} [Field E] [Algebra F E] [Normal F E]

/-- **The normal-closure isomorphism.** For `x` in a normal extension `E`, the Galois group of
`f = minpoly F x` is isomorphic to the automorphism group of the normal closure of `F⟮x⟯/F`; the
`MulEquiv` is the one induced by an `AlgEquiv` of the two fields. -/
noncomputable example (x : E) :
    (minpoly F x).Gal ≃* (normalClosure F F⟮x⟯ E ≃ₐ[F] normalClosure F F⟮x⟯ E) :=
  TauCeti.galEquivNormalClosure x

example (x : E) :
    TauCeti.galEquivNormalClosure (F := F) x =
      (TauCeti.splittingFieldEquivNormalClosure (F := F) x).autCongr :=
  rfl

/-- **Under it, the stabilizer of the root `x` is the subgroup fixing `F⟮x⟯`**, of index
`[F⟮x⟯ : F]`. -/
example (x : E) :
    ∃ y : (minpoly F x).rootSet (minpoly F x).SplittingField,
      (TauCeti.splittingFieldEquivNormalClosure (F := F) x y : E) = x ∧
      (stabilizer (minpoly F x).Gal y).map (TauCeti.galEquivNormalClosure x).toMonoidHom =
        (F⟮x⟯.restrict (le_normalClosure F⟮x⟯)).fixingSubgroup :=
  TauCeti.exists_root_map_stabilizer_eq_fixingSubgroup x

example (x : E) (hsep : (minpoly F x).Separable)
    (y : (minpoly F x).rootSet (minpoly F x).SplittingField) :
    ((stabilizer (minpoly F x).Gal y).map
      (TauCeti.galEquivNormalClosure x).toMonoidHom).index = Module.finrank F F⟮x⟯ :=
  TauCeti.index_map_stabilizer_galEquivNormalClosure x hsep y

/-! ### Conjugate fields -/

/-- **`G/H` and the roots.** For an irreducible `q` with root `α` in a normal extension `M`, the
roots are `G`-equivariantly the cosets of the stabilizer of `α`. -/
example {M : Type*} [Field M] [Algebra F M] [Normal F M] {q : F[X]} (hq : Irreducible q)
    {α : M} (hα : α ∈ q.rootSet M) (g : M ≃ₐ[F] M) (z : q.rootSet M) :
    TauCeti.rootSetEquivQuotientStabilizer hq hα (g • z) =
      g • TauCeti.rootSetEquivQuotientStabilizer hq hα z :=
  TauCeti.rootSetEquivQuotientStabilizer_smul hq hα g z

/-- **`G/H` and the embeddings.** The cosets of a root stabilizer in `(minpoly F x).Gal` index the
`F`-embeddings of `F⟮x⟯` into its normal closure; the coset of `σ` sends the generator to the
transported `σ • y`. -/
noncomputable example (x : E) (y : (minpoly F x).rootSet (minpoly F x).SplittingField) :
    (minpoly F x).Gal ⧸ stabilizer (minpoly F x).Gal y ≃
      (F⟮x⟯ →ₐ[F] normalClosure F F⟮x⟯ E) :=
  TauCeti.quotientGalStabilizerEquivAlgHomSimpleField x y

example (x : E) (y : (minpoly F x).rootSet (minpoly F x).SplittingField)
    (σ : (minpoly F x).Gal) :
    TauCeti.quotientGalStabilizerEquivAlgHomSimpleField x y (QuotientGroup.mk σ)
      (AdjoinSimple.gen F x) =
      TauCeti.splittingFieldEquivNormalClosure (F := F) (E := E) x
        (σ • y : (minpoly F x).SplittingField) :=
  TauCeti.quotientGalStabilizerEquivAlgHomSimpleField_mk_gen x y σ

/-- **The embedding bijection is `G`-equivariant**: translating a coset by `σ` composes the
corresponding embedding with the automorphism of the normal closure that `σ` induces. -/
example (x : E) (y : (minpoly F x).rootSet (minpoly F x).SplittingField)
    (σ : (minpoly F x).Gal) (q : (minpoly F x).Gal ⧸ stabilizer (minpoly F x).Gal y) :
    TauCeti.quotientGalStabilizerEquivAlgHomSimpleField x y (σ • q) =
      TauCeti.galEquivNormalClosure x σ •
        TauCeti.quotientGalStabilizerEquivAlgHomSimpleField x y q :=
  TauCeti.quotientGalStabilizerEquivAlgHomSimpleField_smul x y σ q

/-- **Conjugate subfields and conjugate subgroups.** The conjugates of `F⟮x⟯` in its normal
closure are the fields `F⟮y⟯` for the roots `y` of `minpoly F x`, and they correspond to the
conjugates of the stabilizer `H` in `G`. -/
example (x : E) {K : IntermediateField F (normalClosure F F⟮x⟯ E)} :
    K ∈ TauCeti.conjugateSimpleFields (F := F) x ↔
      ∃ y : (minpoly F x).rootSet (normalClosure F F⟮x⟯ E),
        K = F⟮(y : normalClosure F F⟮x⟯ E)⟯ :=
  TauCeti.mem_conjugateSimpleFields_iff_adjoin_root

example (x : E) (hsep : (minpoly F x).Separable)
    (y : (minpoly F x).rootSet (minpoly F x).SplittingField)
    (hy : (stabilizer (minpoly F x).Gal y).map
      (TauCeti.galEquivNormalClosure (F := F) (E := E) x).toMonoidHom =
        (F⟮x⟯.restrict (le_normalClosure F⟮x⟯)).fixingSubgroup)
    (K : TauCeti.conjugateSimpleFields (F := F) x) :
    ((TauCeti.conjugateSimpleFieldsEquivConjugateSubgroups x hsep y hy K).1).map
      ((TauCeti.galEquivNormalClosure (F := F) (E := E) x) : _ →* _) = K.1.fixingSubgroup :=
  TauCeti.conjugateSimpleFieldsEquivConjugateSubgroups_apply x hsep y hy K

/-- **The number of conjugate fields is `[G : N_G(H)]`**, and they are indexed by `G / N_G(H)`. -/
example (x : E) (hsep : (minpoly F x).Separable)
    (y : (minpoly F x).rootSet (minpoly F x).SplittingField)
    (hy : (stabilizer (minpoly F x).Gal y).map
      (TauCeti.galEquivNormalClosure (F := F) (E := E) x).toMonoidHom =
        (F⟮x⟯.restrict (le_normalClosure F⟮x⟯)).fixingSubgroup) :
    (TauCeti.conjugateSimpleFields (F := F) x).ncard =
      (Subgroup.normalizer (stabilizer (minpoly F x).Gal y : Set (minpoly F x).Gal)).index :=
  TauCeti.ncard_conjugateSimpleFields_eq_index_normalizer x hsep y hy

noncomputable example (x : E) (hsep : (minpoly F x).Separable)
    (y : (minpoly F x).rootSet (minpoly F x).SplittingField)
    (hy : (stabilizer (minpoly F x).Gal y).map
      (TauCeti.galEquivNormalClosure (F := F) (E := E) x).toMonoidHom =
        (F⟮x⟯.restrict (le_normalClosure F⟮x⟯)).fixingSubgroup) :
    (minpoly F x).Gal ⧸
        Subgroup.normalizer (stabilizer (minpoly F x).Gal y : Set (minpoly F x).Gal) ≃
      TauCeti.conjugateSimpleFields (F := F) x :=
  TauCeti.quotientGalNormalizerEquivConjugateSimpleFields x hsep y hy

end NormalClosure

end Layer0


/-! ## Layer 1: permutation groups, blocks, and wreath products -/

section Layer1

open MulAction
open scoped Pointwise

/-! ### The block-stabilizer correspondence -/

section Blocks

variable {G X : Type*} [Group G] [MulAction G X]

/-- **The block-stabilizer correspondence** (Wielandt 7.5; Dixon and Mortimer 1.5A). For a
transitive action, the blocks containing `a` are order-isomorphic to the subgroups in the interval
`[stabilizer G a, ⊤]`, which is `Set.Ici (stabilizer G a)`. Mathlib's
`MulAction.block_stabilizerOrderIso` is this isomorphism. -/
example [IsPretransitive G X] (a : X) :
    {B : Set X // a ∈ B ∧ IsBlock G B} ≃o Set.Ici (stabilizer G a) :=
  block_stabilizerOrderIso G a

/-- The correspondence sends a block to its setwise stabilizer. -/
example [IsPretransitive G X] (a : X) (B : {B : Set X // a ∈ B ∧ IsBlock G B}) :
    ((block_stabilizerOrderIso G a B : Set.Ici (stabilizer G a)) : Subgroup G) =
      stabilizer G (B : Set X) :=
  rfl

/-- Its inverse sends a subgroup `H` to the orbit `H • a`. -/
example [IsPretransitive G X] (a : X) (H : Set.Ici (stabilizer G a)) :
    (((block_stabilizerOrderIso G a).symm H : {B : Set X // a ∈ B ∧ IsBlock G B}) : Set X) =
      orbit (H : Subgroup G) a :=
  rfl

/-- **The false generalization: transitivity cannot be dropped.** For the trivial group acting on
`{0, 1}`, both `{0}` and the whole set are blocks containing `0`, and both have stabilizer `⊤`. -/
example :
    IsBlock (⊥ : Subgroup (Equiv.Perm (Fin 2))) ({0} : Set (Fin 2)) ∧
      IsBlock (⊥ : Subgroup (Equiv.Perm (Fin 2))) (Set.univ : Set (Fin 2)) ∧
      stabilizer (⊥ : Subgroup (Equiv.Perm (Fin 2))) ({0} : Set (Fin 2)) = ⊤ ∧
      stabilizer (⊥ : Subgroup (Equiv.Perm (Fin 2))) (Set.univ : Set (Fin 2)) = ⊤ ∧
      ({0} : Set (Fin 2)) ≠ Set.univ := by
  have htriv : ∀ (s : Set (Fin 2)),
      stabilizer (⊥ : Subgroup (Equiv.Perm (Fin 2))) s = ⊤ := by
    intro s
    rw [eq_top_iff]
    rintro ⟨g, hg⟩ -
    rw [Subgroup.mem_bot] at hg
    subst hg
    exact one_mem _
  refine ⟨?_, IsBlock.univ, htriv _, htriv _, ?_⟩
  · rw [isBlock_iff_smul_eq_or_disjoint]
    rintro ⟨g, hg⟩
    rw [Subgroup.mem_bot] at hg
    subst hg
    exact Or.inl (one_smul _ _)
  · intro h
    have : (1 : Fin 2) ∈ ({0} : Set (Fin 2)) := h ▸ Set.mem_univ _
    simp at this

/-- **The two extremal cases: minimal blocks.** A block `B ∋ a` is minimal among the nontrivial
blocks containing `a` (an atom of `BlockMem G a`) exactly when `stabilizer G B` covers
`stabilizer G a`, and then the setwise stabilizer of `B` acts primitively **on `B`**. -/
example [IsPretransitive G X] {a : X} {B : Set X} (hB : IsBlock G B) (ha : a ∈ B) :
    IsAtom (⟨B, ha, hB⟩ : BlockMem G a) ↔ stabilizer G a ⋖ stabilizer G B :=
  hB.isAtom_iff_stabilizer_covBy ha

example [IsPretransitive G X] {a : X} {B : Set X} (hB : IsBlock G B) (ha : a ∈ B)
    (hmin : IsAtom (⟨B, ha, hB⟩ : BlockMem G a)) :
    IsPreprimitive (stabilizer G B) B :=
  hB.isPreprimitive_stabilizer_of_isAtom ha hmin

/-- **The two extremal cases: maximal blocks.** A block `B ∋ a` is a maximal proper block exactly
when `stabilizer G B` is a maximal subgroup, and then `G` acts primitively **on the block
system** `{g • B}`, the orbit of `B`. -/
example [IsPretransitive G X] {a : X} {B : Set X} (hB : IsBlock G B) (ha : a ∈ B) :
    IsCoatom (⟨B, ha, hB⟩ : BlockMem G a) ↔ IsCoatom (stabilizer G B) :=
  hB.isCoatom_iff_isCoatom_stabilizer ha

example [IsPretransitive G X] {a : X} {B : Set X} (hB : IsBlock G B) (ha : a ∈ B)
    (hmax : IsCoatom (⟨B, ha, hB⟩ : BlockMem G a)) :
    IsPreprimitive G (orbit G B) :=
  hB.isPreprimitive_orbit_of_isCoatom ha hmax

/-- **The iterated chain of imprimitivity.** Covering relations among blocks containing `a` are
the covering relations among their stabilizers, so maximal chains of blocks from `{a}` to `X`
correspond to maximal chains of subgroups from `stabilizer G a` to `G`. -/
example [IsPretransitive G X] {a : X} {B₁ B₂ : BlockMem G a} :
    B₁ ⋖ B₂ ↔ stabilizer G (B₁ : Set X) ⋖ stabilizer G (B₂ : Set X) :=
  BlockMem.covBy_iff_stabilizer_covBy

/-- At each step `B₁ ⋖ B₂` of the chain, the stabilizer of `B₂` acts primitively on the
translates of `B₁` that it contains. -/
example [IsPretransitive G X] {a : X} {B₁ B₂ : BlockMem G a} (h : B₁ ⋖ B₂) :
    IsPreprimitive (stabilizer G (B₂ : Set X))
      (orbit (stabilizer G (B₂ : Set X)) (B₁ : Set X)) :=
  BlockMem.isPreprimitive_stabilizer_orbit_of_covBy h

/-- Along a chain of blocks from `{a}` to `X`, the degree is the product of the degrees of the
primitive pieces. -/
example [IsPretransitive G X] {a : X} {k : ℕ} (B : Fin (k + 1) → BlockMem G a)
    (hB : Monotone B) (h0 : B 0 = ⊥) (hk : B (Fin.last k) = ⊤) :
    Nat.card X =
      ∏ i : Fin k, (orbit (stabilizer G (B i.succ : Set X)) (B i.castSucc : Set X)).ncard :=
  BlockMem.natCard_eq_prod_ncard_orbit_stabilizer B hB h0 hk

end Blocks

/-! ### General wreath products -/

section Wreath

open TauCeti

variable {D : Type*} [Group D] {ι : Type*}

/-- **The general wreath product** `WreathProduct D ι := (ι → D) ⋊ Equiv.Perm ι`, by definition,
with `Equiv.Perm ι` permuting coordinates through `mulAutArrow`. -/
example : WreathProduct D ι =
    SemidirectProduct (ι → D) (Equiv.Perm ι) (mulAutArrow (G := Equiv.Perm ι)) :=
  rfl

/-- The coordinate action: `σ` sends `f` to `f ∘ σ⁻¹`, the left action of the README's
`coordPermAut`. -/
example (σ : Equiv.Perm ι) (f : ι → D) (i : ι) :
    mulAutArrow (G := Equiv.Perm ι) σ f i = f (σ⁻¹ i) :=
  mulAutArrow_apply_apply_eq_apply_inv_smul σ f i

/-- Multiplication in base coordinates. -/
example (a b : WreathProduct D ι) (i : ι) :
    (a * b).left i = a.left i * b.left (a.right⁻¹ i) :=
  PermutationWreathProduct.mul_left a b i

/-- **The restricted wreath product** `(ι → D) ⋊ Q` for `Q ≤ Equiv.Perm ι`. -/
example (Q : Subgroup (Equiv.Perm ι)) :
    PermSubgroupWreathProduct D ι Q = SemidirectProduct (ι → D) Q (mulAutArrow (G := Q)) :=
  rfl

/-- **Constructors and projections.** The base group `ι → D` is included as a normal subgroup,
the kernel of the projection to the top group. -/
example : (SemidirectProduct.inl : (ι → D) →* WreathProduct D ι).range =
    (SemidirectProduct.rightHom : WreathProduct D ι →* Equiv.Perm ι).ker :=
  SemidirectProduct.range_inl_eq_ker_rightHom

example : (SemidirectProduct.inl : (ι → D) →* WreathProduct D ι).range.Normal := by
  rw [SemidirectProduct.range_inl_eq_ker_rightHom]
  infer_instance

/-- The top group is included by `inr`, and the projection `rightHom` splits it. -/
example (σ : Equiv.Perm ι) :
    SemidirectProduct.rightHom
      (SemidirectProduct.inr σ : WreathProduct D ι) = σ :=
  SemidirectProduct.rightHom_inr σ

/-- **Orders.** For finite `ι`, `|(ι → D) ⋊ Q| = |D| ^ |ι| * |Q|`. -/
example [Finite ι] (Q : Subgroup (Equiv.Perm ι)) :
    Nat.card (PermSubgroupWreathProduct D ι Q) = Nat.card D ^ Nat.card ι * Nat.card Q :=
  PermSubgroupWreathProduct.card Q

/-- For finite `ι`, `|WreathProduct D ι| = |D| ^ |ι| * |ι|!`. -/
example [Finite ι] :
    Nat.card (WreathProduct D ι) = Nat.card D ^ Nat.card ι * (Nat.card ι).factorial :=
  WreathProduct.card

/-- **Example.** `WreathProduct C₂ (Fin 2)` is dihedral of order 8. -/
example : Nonempty (WreathProduct (Multiplicative (ZMod 2)) (Fin 2) ≃* DihedralGroup 4) :=
  ⟨wreathTwoMulEquivDihedralGroupFour⟩

example : Nat.card (DihedralGroup 4) = 8 := by
  rw [DihedralGroup.nat_card]

/-- **Example.** Its faithful imprimitive action on `Fin 4` has image a Sylow 2-subgroup of
`S₄`, of order 8. -/
example : Function.Injective wreathTwoToPermFour ∧
    (wreathTwoSylowFour : Subgroup (Equiv.Perm (Fin 4))) = wreathTwoToPermFour.range ∧
    Nat.card wreathTwoToPermFour.range = 8 :=
  ⟨wreathTwoToPermFour_injective, wreathTwoSylowFour_toSubgroup,
    natCard_range_wreathTwoToPermFour⟩

/-- **Example and edge case.** `WreathProduct D (Fin 1) ≃* D`, reading the single coordinate. -/
example (w : WreathProduct D (Fin 1)) : WreathProduct.finOneEquiv w = w.left 0 :=
  WreathProduct.finOneEquiv_apply w

/-- **Edge case.** Over the empty index type the wreath product is trivial. -/
example : Nonempty (WreathProduct D Empty ≃* PUnit) :=
  ⟨WreathProduct.emptyEquiv⟩

/-- **Edge case.** With trivial `D` the wreath product is `Equiv.Perm ι`, by the projection. -/
example [Subsingleton D] (w : WreathProduct D ι) :
    WreathProduct.subsingletonBaseEquiv w = w.right :=
  WreathProduct.subsingletonBaseEquiv_apply w

/-- **Functoriality in `D`.** A morphism `D →* D'` acts pointwise on the base and trivially on
the top, and the construction preserves identities and composition. -/
example {D' D'' : Type*} [Group D'] [Group D''] (f : D →* D') (g : D' →* D'')
    (w : WreathProduct D ι) (i : ι) :
    (WreathProduct.map f w).left i = f (w.left i) ∧ (WreathProduct.map f w).right = w.right ∧
      WreathProduct.map (MonoidHom.id D) = MonoidHom.id (WreathProduct D ι) ∧
      WreathProduct.map (g.comp f) =
        (WreathProduct.map g).comp (WreathProduct.map f : WreathProduct D ι →* _) :=
  ⟨WreathProduct.map_left f w i, WreathProduct.map_right f w, WreathProduct.map_id,
    WreathProduct.map_comp g f⟩

/-- **Functoriality in `ι`.** An equivalence `e : ι ≃ κ` relabels the base coordinates and
conjugates the top permutation; it preserves identities and composition. -/
example {κ μ : Type*} (e : ι ≃ κ) (e' : κ ≃ μ) (w : WreathProduct D ι) (i : κ) :
    (WreathProduct.congr e w).left i = w.left (e.symm i) ∧
      (WreathProduct.congr e w).right = e.permCongr w.right ∧
      WreathProduct.congr (Equiv.refl ι) = MulEquiv.refl (WreathProduct D ι) ∧
      (WreathProduct.congr (D := D) e).trans (WreathProduct.congr e') =
        WreathProduct.congr (e.trans e') :=
  ⟨WreathProduct.congr_left e w i, WreathProduct.congr_right e w, WreathProduct.congr_refl,
    WreathProduct.congr_trans e e'⟩

/-- **The imprimitive action on `ι × Λ`**, unconditional: `w` sends `(i, x)` to
`(w.right i, w.left (w.right i) • x)`. -/
example {Λ : Type*} [MulAction D Λ] (w : WreathProduct D ι) (x : ι × Λ) :
    w • x = (w.right x.1, w.left (w.right x.1) • x.2) :=
  WreathProduct.imprimitive_smul D ι Λ w x

/-- **The product action on `ι → Λ`**, unconditional as a construction:
`(w • x) i = w.left i • x (w.right⁻¹ i)`. -/
example {Λ : Type*} [MulAction D Λ] (w : WreathProduct D ι) (x : ι → Λ) (i : ι) :
    (w • x) i = w.left i • x (w.right⁻¹ i) :=
  WreathProduct.product_smul D ι Λ w x i

/-- **Primitivity of the product action**, a separate theorem with its hypotheses: `D` acts
faithfully and primitively but not regularly on `Λ`, and `ι` is finite. Nonregularity is
`¬ IsCancelSMul D Λ`, that is, some point stabilizer is nontrivial; with the other hypotheses this
forces `Λ` to have at least three points. -/
example {Λ : Type*} [MulAction D Λ] [Finite ι] [Nontrivial Λ] [FaithfulSMul D Λ]
    [IsPreprimitive D Λ] (hnotRegular : ¬ IsCancelSMul D Λ) :
    IsPreprimitive (WreathProduct D ι) (ι → Λ) :=
  WreathProduct.isPreprimitive_product hnotRegular

/-- The imprimitive action, by contrast, is never primitive once there are two blocks of at least
two points: each fibre `{i} × Λ` is a block. -/
example {Λ : Type*} [MulAction D Λ] [Nontrivial ι] [Nontrivial Λ] :
    ¬ IsPreprimitive (WreathProduct D ι) (ι × Λ) :=
  WreathProduct.not_isPreprimitive_imprimitive

/-- **Comparison with Mathlib's regular wreath product.** A canonical `MulEquiv`
`D ≀ᵣ Q ≃* (Q → D) ⋊ Q'`, where `Q'` is the image of the regular representation of `Q`; it keeps
the base coordinates and sends the top coordinate through the regular representation. -/
example (Q : Type*) [Group Q] (w : D ≀ᵣ Q) (x : Q) :
    (regularWreathProductEquiv D Q w).left x = w.left x ∧
      (regularWreathProductEquiv D Q w).right = Equiv.Perm.subgroupOfMulAction Q Q w.right :=
  ⟨regularWreathProductEquiv_left D Q w x, regularWreathProductEquiv_right D Q w⟩

end Wreath

/-! ### Imprimitivity gives a wreath embedding -/

section Imprimitivity

variable {G α : Type*} [Group G] [MulAction G α] [IsPretransitive G α]

/-- **The block system has `n / l` members:** `|B| * |{g • B}| = n`. -/
example {B : Set α} (hB : IsBlock G B) (hBne : B.Nonempty) :
    B.ncard * (orbit G B).ncard = Nat.card α :=
  hB.ncard_block_mul_ncard_orbit_eq hBne

/-- **Imprimitivity gives a wreath embedding** (Dixon and Mortimer 2.6A). For a nonempty block
`B` there is a bijection `α ≃ (block system) × B` and a morphism
`G →* WreathProduct (Equiv.Perm B) (block system)` making it equivariant for the imprimitive
action. The morphism is injective exactly when the action is faithful, its top component is the
action on the block system, and the kernel of that action is exactly what lands in the base
`(block system) → Equiv.Perm B`. -/
example {B : Set α} (hB : IsBlock G B) (hBne : B.Nonempty) (g : G) (x : α) :
    hB.imprimitivityEquiv hBne (g • x) =
      hB.toWreathProduct hBne g • hB.imprimitivityEquiv hBne x :=
  hB.imprimitivityEquiv_smul hBne g x

example {B : Set α} (hB : IsBlock G B) (hBne : B.Nonempty) :
    Function.Injective (hB.toWreathProduct hBne) ↔ FaithfulSMul G α :=
  hB.toWreathProduct_injective_iff hBne

example {B : Set α} (hB : IsBlock G B) (hBne : B.Nonempty) (g : G) :
    (hB.toWreathProduct hBne g).right = MulAction.toPerm g :=
  hB.toWreathProduct_right hBne g

example {B : Set α} (hB : IsBlock G B) (hBne : B.Nonempty) :
    (SemidirectProduct.inl.range).comap (hB.toWreathProduct hBne) =
      (MulAction.toPermHom G (orbit G B)).ker :=
  hB.comap_toWreathProduct_range_inl hBne

end Imprimitivity

/-! ### Jordan's theorem for a `p`-cycle -/

section Jordan

open Equiv

/-- **Jordan's theorem for a `p`-cycle** (Wielandt 13.9). A primitive subgroup of `Sₙ` containing
a `p`-cycle, `p` prime and `p + 3 ≤ n`, contains `Aₙ`. Proved in Tau Ceti, independently of
Mathlib's `proof_wanted`. -/
theorem alternatingGroup_le_of_isPreprimitive_of_isCycle_mem
    {α : Type*} [Fintype α] [DecidableEq α] {G : Subgroup (Perm α)}
    (hG : IsPreprimitive G α) {p : ℕ} (hp : p.Prime) (hp' : p + 3 ≤ Nat.card α)
    {g : Perm α} (hgc : g.IsCycle) (hgp : g.support.card = p) (hg : g ∈ G) :
    alternatingGroup α ≤ G :=
  TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem hG hp hp' hgc hgp hg

/-- **False generalization: `p ≤ n` is not enough.** `AGL(1,5)`, of order `20`, is primitive on
five points and contains a `5`-cycle, but does not contain `A₅`. -/
example :
    Nat.card (toPermHom (TauCeti.AffineGroup (ZMod 5)) (ZMod 5)).range = 20 ∧
      IsPreprimitive (toPermHom (TauCeti.AffineGroup (ZMod 5)) (ZMod 5)).range (ZMod 5) ∧
      (∃ g ∈ (toPermHom (TauCeti.AffineGroup (ZMod 5)) (ZMod 5)).range,
        g.IsCycle ∧ g.support = Finset.univ) ∧
      ¬ alternatingGroup (ZMod 5) ≤ (toPermHom (TauCeti.AffineGroup (ZMod 5)) (ZMod 5)).range := by
  have : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩
  have hcard : Nat.card (ZMod 5) = 5 := Nat.card_zmod 5
  refine ⟨?_, (MulAction.isPreprimitive_range_toPermHom_iff _ _).2 inferInstance,
    TauCeti.AffineGroup.exists_isCycle_mem_range_toPermHom_support_eq_univ
      (by rw [hcard]; exact Nat.prime_five),
    TauCeti.AffineGroup.not_alternatingGroup_le_range_toPermHom hcard.ge⟩
  rw [TauCeti.AffineGroup.natCard_range_toPermHom, hcard]

section AGL18

attribute [local instance] Classical.propDecidable

noncomputable local instance : Fintype (GaloisField 2 3) := Fintype.ofFinite _

/-- **False generalization: `p + 1 ≤ n` is not enough.** `AGL(1,8)`, of order `56`, is primitive
on eight points and contains a `7`-cycle fixing one point, but does not contain `A₈`. -/
example :
    Nat.card (toPermHom (TauCeti.AffineGroup (GaloisField 2 3)) (GaloisField 2 3)).range = 56 ∧
      IsPreprimitive (toPermHom (TauCeti.AffineGroup (GaloisField 2 3)) (GaloisField 2 3)).range
        (GaloisField 2 3) ∧
      (∃ g ∈ (toPermHom (TauCeti.AffineGroup (GaloisField 2 3)) (GaloisField 2 3)).range,
        g.IsCycle ∧ g.support = {0}ᶜ) ∧
      ¬ alternatingGroup (GaloisField 2 3) ≤
          (toPermHom (TauCeti.AffineGroup (GaloisField 2 3)) (GaloisField 2 3)).range := by
  have hcard : Nat.card (GaloisField 2 3) = 8 := GaloisField.card 2 3 (by norm_num)
  refine ⟨?_, (MulAction.isPreprimitive_range_toPermHom_iff _ _).2 inferInstance,
    TauCeti.AffineGroup.exists_isCycle_mem_range_toPermHom_support_eq_compl_zero
      (by rw [hcard]; norm_num),
    TauCeti.AffineGroup.not_alternatingGroup_le_range_toPermHom (by rw [hcard]; norm_num)⟩
  rw [TauCeti.AffineGroup.natCard_range_toPermHom, hcard]

end AGL18

open TauCeti in
/-- The two sharpness statements in the form of Jordan's theorem: the conclusion fails for some
primitive group with a `p`-cycle in degree `p`, and in degree `p + 1`. -/
example :
    (¬ ∀ (α : Type) [Fintype α] [DecidableEq α] (G : Subgroup (Perm α)),
      IsPreprimitive G α → ∀ g ∈ G, g.IsCycle → g.support.card.Prime →
        g.support.card = Nat.card α → alternatingGroup α ≤ G) ∧
    (¬ ∀ (α : Type) [Fintype α] [DecidableEq α] (G : Subgroup (Perm α)),
      IsPreprimitive G α → ∀ g ∈ G, g.IsCycle → g.support.card.Prime →
        g.support.card + 1 = Nat.card α → alternatingGroup α ≤ G) :=
  ⟨not_forall_alternatingGroup_le_of_isPreprimitive_of_isCycle_mem_of_card_support_eq,
    not_forall_alternatingGroup_le_of_isPreprimitive_of_isCycle_mem_of_card_support_add_one_eq⟩

end Jordan

/-! ### The recognition theorems -/

section Recognition

open Equiv

variable {α : Type*} [Fintype α] [DecidableEq α]

/-- **Recognition 1.** A transitive subgroup of `S_p`, `p` prime, contains a `p`-cycle. -/
example {G : Subgroup (Perm α)} (hG : IsPretransitive G α) (hp : (Fintype.card α).Prime) :
    ∃ g : Perm α, g ∈ G ∧ g.IsCycle ∧ g.support = Finset.univ :=
  TauCeti.exists_isCycle_mem_of_isPretransitive_of_prime_card hG hp

/-- **Recognition 2.** A transitive subgroup of `S_p`, `p` prime, containing a transposition is
`S_p`. -/
example {G : Subgroup (Perm α)} (hG : IsPretransitive G α) (hp : (Nat.card α).Prime)
    (g : Perm α) (hgs : g.IsSwap) (hg : g ∈ G) : G = ⊤ :=
  TauCeti.subgroup_eq_top_of_isPretransitive_of_prime_card_of_isSwap_mem hG hp g hgs hg

/-- **Recognition 3.** A transitive group containing an `(n−1)`-cycle is 2-transitive, and
therefore primitive. -/
example (G : Subgroup (Perm α)) [IsPretransitive G α] {σ : Perm α} (hσ : σ.IsCycle)
    (hσG : σ ∈ G) (hcard : σ.support.card + 1 = Fintype.card α) :
    IsMultiplyPretransitive G α 2 ∧ IsPreprimitive G α :=
  ⟨TauCeti.is_two_pretransitive_of_isCycle_mem_of_card_support_add_one_eq_card G hσ hσG hcard,
    TauCeti.isPreprimitive_of_isCycle_mem_of_card_support_add_one_eq_card G hσ hσG hcard⟩

/-- **Recognition 4** (Mathlib). A primitive group containing a transposition is `Sₙ`; one
containing a 3-cycle contains `Aₙ`. -/
example {G : Subgroup (Perm α)} (hG : IsPreprimitive G α) (g : Perm α) (hgs : g.IsSwap)
    (hg : g ∈ G) : G = ⊤ :=
  Perm.subgroup_eq_top_of_isPreprimitive_of_isSwap_mem hG g hgs hg

example {G : Subgroup (Perm α)} (hG : IsPreprimitive G α) {g : Perm α} (hg3 : g.IsThreeCycle)
    (hg : g ∈ G) : alternatingGroup α ≤ G :=
  Perm.alternatingGroup_le_of_isPreprimitive_of_isThreeCycle_mem hG hg3 hg

/-- **Recognition 5.** An element with exactly one cycle of length 2, and all other cycle lengths
odd, has an odd power that is a transposition. -/
example {σ : Perm α} (htwo : σ.cycleType.count 2 = 1)
    (hodd : ∀ n ∈ σ.cycleType, n ≠ 2 → Odd n) :
    ∃ k, Odd k ∧ (σ ^ k).IsSwap :=
  σ.exists_odd_isSwap_pow htwo hodd

end Recognition

end Layer1

/-! ## Layer 2: the dictionary between Galois theory and permutations -/

section Layer2

open Polynomial MulAction IntermediateField
open scoped Pointwise

universe u

variable {F : Type u} [Field F] {p : F[X]}

/-- **Stabilizers are relative Galois groups.** The stabilizer of a root `α` is the fixing
subgroup of `F⟮α⟯`; for irreducible separable `p` it has index `natDegree p`. -/
example (x : p.rootSet p.SplittingField) :
    stabilizer p.Gal x = F⟮(x : p.SplittingField)⟯.fixingSubgroup :=
  TauCeti.stabilizer_eq_fixingSubgroup_adjoin_simple x

example (hp : Irreducible p) (hsep : p.Separable) (x : p.rootSet p.SplittingField) :
    (stabilizer p.Gal x).index = p.natDegree :=
  TauCeti.index_stabilizer_eq_natDegree hp hsep x

/-- **Blocks and intermediate fields.** The blocks containing a root `α` are order
anti-isomorphic to the intermediate fields of `F⟮α⟯/F`. -/
noncomputable example (hp : Irreducible p) (hsep : p.Separable) (x : p.rootSet p.SplittingField) :
    BlockMem p.Gal x ≃o (Set.Iic F⟮(x : p.SplittingField)⟯)ᵒᵈ :=
  TauCeti.rootBlockIntermediateFieldOrderIso hp hsep x

/-- A block `B` goes to the fixed field of `stabilizer p.Gal B`. -/
example (hp : Irreducible p) (hsep : p.Separable) (x : p.rootSet p.SplittingField)
    (B : BlockMem p.Gal x) :
    ((TauCeti.rootBlockIntermediateFieldOrderIso hp hsep x B).ofDual :
        IntermediateField F p.SplittingField) =
      FixedPoints.intermediateField (stabilizer p.Gal (B : Set (p.rootSet p.SplittingField))) := by
  ext y
  rw [TauCeti.mem_rootBlockIntermediateFieldOrderIso_apply_iff,
    FixedPoints.mem_intermediateField_iff]
  exact ⟨fun h g => h g g.2, fun h g hg => h ⟨g, hg⟩⟩

/-- An intermediate field `E ⊆ F⟮α⟯` goes to the set of roots of `minpoly E α` in `p.rootSet L`. -/
example (hp : Irreducible p) (hsep : p.Separable) (x : p.rootSet p.SplittingField)
    (E : Set.Iic F⟮(x : p.SplittingField)⟯) :
    (((TauCeti.rootBlockIntermediateFieldOrderIso hp hsep x).symm (OrderDual.toDual E) :
      BlockMem p.Gal x) : Set (p.rootSet p.SplittingField)) =
      Subtype.val ⁻¹' (minpoly E.1 (x : p.SplittingField)).rootSet p.SplittingField :=
  TauCeti.coe_rootBlockIntermediateFieldOrderIso_symm_apply_eq_preimage_rootSet_minpoly
    hp hsep x E

/-- **The two ends confirm the orientation**: `{α}` goes to `F⟮α⟯` and the whole root set to
`F`. -/
example (hp : Irreducible p) (hsep : p.Separable) (x : p.rootSet p.SplittingField) :
    ((TauCeti.rootBlockIntermediateFieldOrderIso hp hsep x
      (⊥ : BlockMem p.Gal x)).ofDual.1 : IntermediateField F p.SplittingField) =
        F⟮(x : p.SplittingField)⟯ ∧
      ((TauCeti.rootBlockIntermediateFieldOrderIso hp hsep x
        (⊤ : BlockMem p.Gal x)).ofDual.1 : IntermediateField F p.SplittingField) = ⊥ :=
  ⟨TauCeti.rootBlockIntermediateFieldOrderIso_apply_bot hp hsep x,
    TauCeti.rootBlockIntermediateFieldOrderIso_apply_top hp hsep x⟩

/-- **Primitivity and intermediate fields.** For `1 < natDegree p` the root action is
preprimitive exactly when `F⟮α⟯` is an atom; irreducible of prime degree implies primitive. -/
example (hp : Irreducible p) (hsep : p.Separable) (hdeg : 1 < p.natDegree)
    (x : p.rootSet p.SplittingField) :
    IsPreprimitive p.Gal (p.rootSet p.SplittingField) ↔ IsAtom F⟮(x : p.SplittingField)⟯ :=
  TauCeti.isPreprimitive_iff_isAtom_adjoin_simple hp hsep hdeg x

example (hp : Irreducible p) (hsep : p.Separable) (hprime : p.natDegree.Prime) :
    IsPreprimitive p.Gal (p.rootSet p.SplittingField) :=
  TauCeti.isPreprimitive_of_irreducible_of_separable_of_prime_natDegree hp hsep hprime

/-- **2-transitivity.** For `1 < natDegree p`, the action is 2-pretransitive exactly when
`p / (X − α)` is irreducible over `F⟮α⟯`. -/
example (hp : Irreducible p) (hsep : p.Separable) (hdeg : 1 < p.natDegree)
    (x : p.rootSet p.SplittingField) :
    IsMultiplyPretransitive p.Gal (p.rootSet p.SplittingField) 2 ↔
      Irreducible
        ((p.map (algebraMap F F⟮(x : p.SplittingField)⟯)) /ₘ
          (X - C (AdjoinSimple.gen F (x : p.SplittingField)))) :=
  TauCeti.is_two_pretransitive_iff_irreducible_divByMonic hp hsep hdeg x

/-! ### Products and towers -/

section Products

variable {q : F[X]} [Fact ((p.map (algebraMap F (p * q).SplittingField)).Splits)]
  [Fact ((q.map (algebraMap F (p * q).SplittingField)).Splits)]

/-- **The image of `restrictProd` is the fiber product** over the Galois group of
`L_p ∩ L_q`, through the two named restriction maps. -/
example (hp : p.Separable) (hq : q.Separable) (σ : p.Gal) (τ : q.Gal) :
    (σ, τ) ∈ (Gal.restrictProd p q).range ↔
      Gal.restrictInfLeft p q σ = Gal.restrictInfRight p q τ :=
  Gal.mem_range_restrictProd_iff_restrictInfLeft_eq_restrictInfRight hp hq σ τ

/-- **Both projections are surjective.** -/
example (hpq : p * q ≠ 0) :
    Function.Surjective (Gal.restrictDvd (dvd_mul_right p q)) ∧
      Function.Surjective (Gal.restrictDvd (dvd_mul_left q p)) :=
  ⟨Gal.restrictDvd_surjective _ hpq, Gal.restrictDvd_surjective _ hpq⟩

/-- **The degenerate case.** `restrictProd` is onto exactly when `L_p ∩ L_q = F`, equivalently when
the splitting fields are linearly disjoint, and then it is an isomorphism onto the product. -/
example (hp : p.Separable) (hq : q.Separable) :
    Function.Surjective (Gal.restrictProd p q) ↔
      (IsScalarTower.toAlgHom F p.SplittingField (p * q).SplittingField).fieldRange ⊓
          (IsScalarTower.toAlgHom F q.SplittingField (p * q).SplittingField).fieldRange = ⊥ :=
  Gal.restrictProd_surjective_iff hp hq

example (hp : p.Separable) (hq : q.Separable) :
    Function.Surjective (Gal.restrictProd p q) ↔
      (IsScalarTower.toAlgHom F p.SplittingField (p * q).SplittingField).fieldRange.LinearDisjoint
        (IsScalarTower.toAlgHom F q.SplittingField (p * q).SplittingField).fieldRange :=
  Gal.restrictProd_surjective_iff_linearDisjoint hp hq

example (hp : p.Separable) (hq : q.Separable)
    (h : IntermediateField.LinearDisjoint
      (IsScalarTower.toAlgHom F p.SplittingField (p * q).SplittingField).fieldRange
      (IsScalarTower.toAlgHom F q.SplittingField (p * q).SplittingField).fieldRange)
    (g : (p * q).Gal) :
    Gal.restrictProdMulEquiv hp hq h g = Gal.restrictProd p q g :=
  Gal.restrictProdMulEquiv_apply hp hq h g

end Products

/-- **A surjection `Gal p ↠ Gal q` when the splitting field of `q` embeds in that of `p`**, in
general: if `q` splits in `p.SplittingField`, restriction `p.Gal →* q.Gal` is surjective, and it
is compatible with the two root actions, so any `Gal p`-equivariant description of the roots of
`q` inside the splitting field of `p` is read off through it. -/
example (p q : F[X]) [Fact ((q.map (algebraMap F p.SplittingField)).Splits)] :
    Function.Surjective (Gal.restrict q p.SplittingField : p.Gal →* q.Gal) :=
  Gal.restrict_surjective q p.SplittingField

example (p q : F[X]) [Fact ((q.map (algebraMap F p.SplittingField)).Splits)] (σ : p.Gal)
    (x : q.rootSet p.SplittingField) :
    (Gal.galActionHom q p.SplittingField (Gal.restrict q p.SplittingField σ) x :
      p.SplittingField) = σ x :=
  Gal.galActionHom_restrict q p.SplittingField σ x

/-- **An equivariant polynomial map of root data gives a surjection of Galois groups.** For the
map `α ↦ T(α)` from the roots of `f` to those of its Tschirnhaus transform, whose splitting field
embeds in that of `f`, restriction `f.Gal →* (f.tschirnhausPolynomial T).Gal` is surjective and
intertwines the two root actions. -/
example (f T : F[X]) : Function.Surjective (Gal.restrictTschirnhaus f T) :=
  Gal.restrictTschirnhaus_surjective f T

example (f T : F[X]) (g : f.Gal) (x : f.rootSet f.SplittingField) :
    Gal.tschirnhausActionHom f T g (tschirnhausRootMap f T x) =
      tschirnhausRootMap f T ⟨g (x : f.SplittingField), rootSet_mapsTo g.toAlgHom x.2⟩ :=
  Gal.tschirnhausActionHom_apply_rootMap f T g x

/-- **Reducible polynomials, one orbit at a time.** For any `p`, with no irreducibility, the
stabilizer of a root is the fixing subgroup of the field it generates, of index the degree of its
own factor `minpoly F α`, and its orbit is the root set of that factor. -/
example (x : p.rootSet p.SplittingField)
    (hsep : (minpoly F (x : p.SplittingField)).Separable) :
    (stabilizer p.Gal x).index = (minpoly F (x : p.SplittingField)).natDegree :=
  TauCeti.index_stabilizer_eq_natDegree_minpoly x hsep

example (x : p.rootSet p.SplittingField) :
    Subtype.val '' orbit p.Gal x =
      (minpoly F (x : p.SplittingField)).rootSet p.SplittingField :=
  TauCeti.image_val_orbit_eq_rootSet_minpoly_splittingField x

end Layer2


/-! ## Layer 3: the discriminant and the alternating group -/

section Layer3

open Polynomial TauCeti

/-- **The root-product formula**, as a universal identity over any commutative ring, in the
product form of Mathlib's TODO in `Resultant/Basic.lean`: a product of linear factors has
discriminant the square of the product of the root differences. -/
example {R : Type*} [CommRing R] {n : ℕ} (r : Fin n → R) :
    (∏ i, (X - C (r i))).discr = ∏ i, ∏ j ∈ Finset.Ioi i, (r i - r j) ^ 2 :=
  discr_prod_X_sub_C r

/-- **The root-product formula for a monic polynomial**, against a numbering `r` of its roots
with multiplicity in a domain `L`. -/
example {R L : Type*} [CommRing R] [CommRing L] [IsDomain L] [Algebra R L] (f : R[X])
    (hf : f.Monic) (r : Fin f.natDegree → L)
    (hr : (f.map (algebraMap R L)).roots = Multiset.map r Finset.univ.val) :
    algebraMap R L f.discr = ∏ i, ∏ j ∈ Finset.Ioi i, (r i - r j) ^ 2 :=
  hf.discr_eq_prod_roots_sub_sq hr

/-- **The product formula for `discr (f * g)`**, with the resultant as its cross term. -/
example {R : Type*} [CommRing R] (f g : R[X]) (hf : f.Monic) (hg : g.Monic) :
    (f * g).discr = f.discr * g.discr * (f.resultant g) ^ 2 :=
  hf.discr_mul hg

/-- **Base change of the discriminant** in the degree-preserving case, and in the monic case that
Layer 5 uses along `ℤ → ZMod p`. -/
example {R S : Type*} [CommRing R] [CommRing S] (φ : R →+* S) (f : R[X])
    (hdeg : (f.map φ).natDegree = f.natDegree) : (f.map φ).discr = φ f.discr :=
  discr_map_of_natDegree_eq φ hdeg

example {R S : Type*} [CommRing R] [CommRing S] (φ : R →+* S) (f : R[X]) (hf : f.Monic) :
    (f.map φ).discr = φ f.discr :=
  hf.discr_map φ

/-- **Separability over a field.** A monic polynomial over a field is separable exactly when its
discriminant is nonzero. -/
example {F : Type*} [Field F] (f : F[X]) (hf : f.Monic) : f.discr ≠ 0 ↔ f.Separable :=
  hf.discr_ne_zero_iff

/-- **Separability over a domain**, by passage to the fraction field. This is the form every use
over `ℤ` takes. -/
example {R K : Type*} [CommRing R] [IsDomain R] [Field K] [Algebra R K] [IsFractionRing R K]
    (f : R[X]) (hf : f.Monic) : f.discr ≠ 0 ↔ (f.map (algebraMap R K)).Separable :=
  hf.discr_ne_zero_iff_separable_map K

/-- **The field hypothesis is necessary.** Over `ℤ`, `X² − 1` has discriminant `4 ≠ 0` and is not
`Polynomial.Separable`. -/
example : (X ^ 2 - 1 : ℤ[X]).discr = 4 ∧ ¬ (X ^ 2 - 1 : ℤ[X]).Separable :=
  ⟨discr_X_pow_two_sub_one, not_separable_X_pow_two_sub_one⟩

/-- **Comparison with `Cubic.discr`.** The two discriminants of a cubic with nonzero leading
coefficient agree, with no normalization to monic. -/
example {R : Type*} [CommRing R] (P : Cubic R) (ha : P.a ≠ 0) : P.toPoly.discr = P.discr :=
  Cubic.toPoly_discr ha

/-- **Comparison with `Algebra.discr`.** The discriminant of a power basis is the discriminant
of the minimal polynomial of its generator. -/
example {K L : Type*} [Field K] [Field L] [Algebra K L] (pb : PowerBasis K L) :
    Algebra.discr K pb.basis = (minpoly K pb.gen).discr :=
  Algebra.discr_powerBasis_eq_minpoly_discr pb

section SquareRoot

variable {F : Type*} [Field F] {E : Type*} [Field E] [Algebra F E] {f : F[X]}

/-- **The square root of the discriminant**, `δ = ∏_{i<j} (rᵢ − rⱼ)` along a numbering `e` of
the root set, is a square root of `disc f` for monic separable `f`. -/
example (e : Fin f.natDegree ≃ f.rootSet E) :
    discrSqrt e = ∏ i, ∏ j ∈ Finset.Ioi i, ((e i : E) - (e j : E)) :=
  discrSqrt_def e

example (hf : f.Monic) (hsep : f.Separable) (e : Fin f.natDegree ≃ f.rootSet E) :
    discrSqrt e ^ 2 = algebraMap F E f.discr :=
  hf.discrSqrt_sq hsep e

open scoped Classical in
/-- **The transformation law** `σ δ = sign (galActionHom σ) • δ`, for every automorphism of a
splitting extension, acting on the roots through `Polynomial.Gal.restrict`. -/
example [Fact ((f.map (algebraMap F E)).Splits)] (ϕ : E ≃ₐ[F] E)
    (e : Fin f.natDegree ≃ f.rootSet E) :
    ϕ (discrSqrt e) =
      Equiv.Perm.sign (Gal.galActionHom f E (Gal.restrict f E ϕ)) • discrSqrt e :=
  ϕ.map_discrSqrt e

open scoped Classical in
/-- **The discriminant test.** For monic separable `f` and `ringChar F ≠ 2`, `disc f` is a
square exactly when the Galois image lies in the alternating group. It is stated for any Galois
splitting extension `E`, in particular `f.SplittingField`. -/
example [Fact ((f.map (algebraMap F E)).Splits)] [IsGalois F E] (hf : f.Monic)
    (hsep : f.Separable) (hchar : ringChar F ≠ 2) :
    IsSquare f.discr ↔ (Gal.galActionHom f E).range ≤ alternatingGroup (f.rootSet E) :=
  hf.isSquare_discr_iff_range_le_alternatingGroup hsep hchar

/-- **The characteristic hypothesis cannot be dropped.** In characteristic `2` the discriminant
of every monic polynomial is a square, so the test decides nothing. -/
example (hf : f.Monic) (hchar : ringChar F = 2) : IsSquare f.discr :=
  hf.isSquare_discr_of_char_two hchar

end SquareRoot

section DiscrField

open scoped IntermediateField

variable {F : Type*} [Field F] {E : Type*} [Field E] [Algebra F E] {f : F[X]}

/-- **The discriminant quadratic extension `F(√disc f)`**, taken inside an extension `E`: the
field generated over `F` by the roots of `X² − C (disc f)` in `E`. -/
example : discrField f E = IntermediateField.adjoin F ((X ^ 2 - C f.discr).rootSet E) :=
  rfl

/-- When `E` contains a square root `δ` of the discriminant, `F(√disc f)` is `F⟮δ⟯` and is a
splitting field of `X² − C (disc f)` over `F`. -/
example {δ : E} (hδ : δ ^ 2 = algebraMap F E f.discr) :
    discrField f E = F⟮δ⟯ ∧ IsSplittingField F (discrField f E) (X ^ 2 - C f.discr) :=
  ⟨discrField_eq_adjoin_simple hδ, isSplittingField_discrField hδ⟩

/-- **Characterization.** `F(√disc f)` is `F` exactly when `disc f` is a square, and is a
quadratic extension otherwise. No characteristic hypothesis is needed. -/
example {δ : E} (hδ : δ ^ 2 = algebraMap F E f.discr) :
    (discrField f E = ⊥ ↔ IsSquare f.discr) ∧
      (¬ IsSquare f.discr → Module.finrank F (discrField f E) = 2) :=
  ⟨discrField_eq_bot_iff hδ, finrank_discrField_eq_two hδ⟩

/-- For `ringChar F ≠ 2` and nonzero discriminant, `F(√disc f)` is Galois over `F`. -/
example {δ : E} (hδ : δ ^ 2 = algebraMap F E f.discr) (hdisc : f.discr ≠ 0)
    (hchar : ringChar F ≠ 2) : IsGalois F (discrField f E) :=
  isGalois_discrField hδ hdisc hchar

/-- **Comparison:** `F(√disc f)` is the fixed field of the even part of the Galois group. -/
example [Fact ((f.map (algebraMap F E)).Splits)] [IsGalois F E] (hf : f.Monic)
    (hsep : f.Separable) (hchar : ringChar F ≠ 2) :
    IntermediateField.fixedField (evenAutSubgroup f E) = discrField f E :=
  fixedField_evenAutSubgroup hf hsep hchar

open scoped Classical in
/-- The even part of the Galois group: the automorphisms acting evenly on the roots. -/
example [Fact ((f.map (algebraMap F E)).Splits)] (ϕ : E ≃ₐ[F] E) :
    ϕ ∈ evenAutSubgroup f E ↔
      Equiv.Perm.sign (Gal.galActionHom f E (Gal.restrict f E ϕ)) = 1 :=
  mem_evenAutSubgroup

/-- **Functoriality in the extension:** an `F`-isomorphism `E ≃ E'` carries `F(√disc f)` in `E`
onto `F(√disc f)` in `E'`, and whether a polynomial stays irreducible over `F(√disc f)` does not
depend on the extension in which it is taken. -/
example {E' : Type*} [Field E'] [Algebra F E'] (ψ : E ≃ₐ[F] E') :
    (discrField f E).map ψ.toAlgHom = discrField f E' :=
  discrField_map ψ

example {E' : Type*} [Field E'] [Algebra F E'] {δ : E} {δ' : E'}
    (hδ : δ ^ 2 = algebraMap F E f.discr) (hδ' : δ' ^ 2 = algebraMap F E' f.discr) (g : F[X]) :
    Irreducible (g.map (algebraMap F (discrField f E))) ↔
      Irreducible (g.map (algebraMap F (discrField f E'))) :=
  irreducible_map_discrField_congr hδ hδ' g

/-- **Base change along `F → K`:** the discriminant field of `f` over `K` is the compositum of
`K` with the discriminant field of `f` over `F`, and it stays quadratic over `K` when `disc f`
stays a nonsquare in `K`. -/
example {K : Type*} [Field K] [Algebra F K] [Algebra K E] [IsScalarTower F K E] :
    discrField (f.map (algebraMap F K)) E =
      IntermediateField.adjoin K (discrField f E : Set E) :=
  discrField_baseChange

example {K : Type*} [Field K] [Algebra F K] [Algebra K E] [IsScalarTower F K E] {δ : E}
    (hδ : δ ^ 2 = algebraMap F E f.discr) (hsq : ¬ IsSquare ((algebraMap F K) f.discr)) :
    Module.finrank K (IntermediateField.adjoin K (discrField f E : Set E)) = 2 :=
  finrank_discrField_baseChange_eq_two hδ hsq

/-- **Functoriality under an isomorphism of base fields:** the case of base change along a
bijective `F → K`. The discriminant field of `f` over `K` is then the same subfield of `E` as
that of `f` over `F`. -/
example {K : Type*} [Field K] [Algebra F K] [Algebra K E] [IsScalarTower F K E]
    (hφ : Function.Bijective (algebraMap F K)) :
    (discrField (f.map (algebraMap F K)) E).toSubfield = (discrField f E).toSubfield := by
  rw [discrField_baseChange, IntermediateField.adjoin_toSubfield]
  refine le_antisymm (Subfield.closure_le.mpr ?_)
    fun x hx => Subfield.subset_closure (Or.inr hx)
  rintro x (⟨k, rfl⟩ | hx)
  · obtain ⟨a, rfl⟩ := hφ.2 k
    rw [← IsScalarTower.algebraMap_apply]
    exact (discrField f E).algebraMap_mem a
  · exact hx

open scoped Classical in
/-- **Downstream interface:** `f` stays irreducible over `F(√disc f)` exactly when the even part
of the Galois image is transitive; this is the datum that separates `C₄` from `D₄`. -/
example [Fact ((f.map (algebraMap F E)).Splits)] [Normal F E] (hf : f.Monic)
    (hsep : f.Separable) (hchar : ringChar F ≠ 2) (hdeg : 0 < f.natDegree) :
    Irreducible (f.map (algebraMap F (discrField f E))) ↔
      MulAction.IsPretransitive
        ((Gal.galActionHom f E).range ⊓ alternatingGroup (f.rootSet E) :
          Subgroup (Equiv.Perm (f.rootSet E))) (f.rootSet E) :=
  irreducible_map_discrField_iff hf hsep hchar hdeg

open scoped Classical in
/-- The discriminant test, read on `F(√disc f)`. -/
example [Fact ((f.map (algebraMap F E)).Splits)] [IsGalois F E] (hf : f.Monic)
    (hsep : f.Separable) (hchar : ringChar F ≠ 2) :
    discrField f E = ⊥ ↔ (Gal.galActionHom f E).range ≤ alternatingGroup (f.rootSet E) :=
  discrField_eq_bot_iff_range_le_alternatingGroup hf hsep hchar

end DiscrField

/-- **Worked instance: the quadratic case.** For a monic quadratic `X² + bX + c`, the
discriminant is `b² − 4c`, and away from characteristic `2` the quadratic splits exactly when
that discriminant is a square: the test is the quadratic formula. -/
example {F : Type*} [Field F] [NeZero (2 : F)] (b c : F) :
    (X ^ 2 + C b * X + C c : F[X]).discr = b ^ 2 - 4 * c ∧
      ((X ^ 2 + C b * X + C c : F[X]).Splits ↔ IsSquare (b ^ 2 - 4 * c)) := by
  have hq : (X ^ 2 + C b * X + C c : F[X]) = C 1 * X ^ 2 + C b * X + C c := by simp
  refine ⟨?_, ?_⟩
  · rw [discr_of_degree_eq_two (by compute_degree!)]
    simp only [coeff_add, coeff_X_pow, coeff_C_mul, coeff_X, coeff_C]
    norm_num
  · rw [hq, splits_quadratic_iff_isSquare one_ne_zero, discrim]
    ring_nf

/-- **Worked instances:** `disc (x³ − 3x − 1) = 81 = 9²`, a square, and `disc (x³ − 2) = −108`,
not a square. -/
example : (X ^ 3 - 3 * X - 1 : ℚ[X]).discr = 81 ∧ IsSquare (X ^ 3 - 3 * X - 1 : ℚ[X]).discr :=
  ⟨discr_X_pow_three_sub_three_mul_X_sub_one,
    by rw [discr_X_pow_three_sub_three_mul_X_sub_one]; exact ⟨9, by norm_num⟩⟩

example : (X ^ 3 - 2 : ℚ[X]).discr = -108 ∧ ¬ IsSquare (X ^ 3 - 2 : ℚ[X]).discr := by
  refine ⟨discr_X_pow_three_sub_two, ?_⟩
  rw [discr_X_pow_three_sub_two]
  rintro ⟨r, hr⟩
  nlinarith [mul_self_nonneg r]

/-- **Worked instance: the two discriminant APIs agree** on `x³ − 2`, written as a `Cubic`. -/
example : (⟨1, 0, 0, -2⟩ : Cubic ℚ).discr = (X ^ 3 - 2 : ℚ[X]).discr := by
  rw [← Cubic.toPoly_discr one_ne_zero]
  congr 1
  simp only [Cubic.toPoly, map_one, one_mul, map_zero, zero_mul, add_zero, map_neg]
  rw [sub_eq_add_neg, C_ofNat]

end Layer3

/-! ## Layer 5: Frobenius specialization -/

section Layer5

open Polynomial TauCeti UniqueFactorizationMonoid

attribute [local instance] Polynomial.Gal.splits_ℚ_ℂ

/-- **`factorDegrees`, the defining equation:** the multiset of degrees of the monic irreducible
factors of `f mod p`, through `normalizedFactors` over `ZMod p`. -/
example (f : ℤ[X]) (p : ℕ) [Fact p.Prime] :
    f.factorDegrees p =
      Multiset.map Polynomial.natDegree (normalizedFactors (f.map (Int.castRingHom (ZMod p)))) :=
  rfl

/-- **Examples:** `factorDegrees (X⁵ − X − 1) 2 = {3, 2}` and `factorDegrees (X⁵ − X − 1) 5 = {5}`.
-/
example : (X ^ 5 - X - 1 : ℤ[X]).factorDegrees 2 = {3, 2} :=
  factorDegrees_X_pow_five_sub_X_sub_one_two

example : haveI : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩
    (X ^ 5 - X - 1 : ℤ[X]).factorDegrees 5 = {5} :=
  factorDegrees_X_pow_five_sub_X_sub_one_five

/-- **Multiplicity:** each irreducible factor is counted as often as it occurs. The sum of the
factor degrees is the degree of the reduction, hence `f.natDegree` when `p` does not divide the
leading coefficient, in particular when `f` is monic. -/
example (f : ℤ[X]) (p : ℕ) [Fact p.Prime] :
    (f.factorDegrees p).card = (normalizedFactors (f.map (Int.castRingHom (ZMod p)))).card :=
  card_factorDegrees f p

example (f : ℤ[X]) (p : ℕ) [Fact p.Prime] (hlc : ¬ (p : ℤ) ∣ f.leadingCoeff) :
    (f.factorDegrees p).sum = f.natDegree := by
  rw [sum_factorDegrees_eq_natDegree_map]
  refine natDegree_map_of_leadingCoeff_ne_zero _ ?_
  rwa [eq_intCast, ne_eq, ZMod.intCast_zmod_eq_zero_iff_dvd]

example (f : ℤ[X]) (hf : f.Monic) (p : ℕ) [Fact p.Prime] :
    (f.factorDegrees p).sum = f.natDegree :=
  hf.sum_factorDegrees p

/-- **Comparison:** `factorDegrees f p = {n}` exactly when `f mod p` is irreducible of degree
`n`. -/
example (f : ℤ[X]) (p n : ℕ) [Fact p.Prime] :
    f.factorDegrees p = {n} ↔
      Irreducible (f.map (Int.castRingHom (ZMod p))) ∧
        (f.map (Int.castRingHom (ZMod p))).natDegree = n :=
  factorDegrees_eq_singleton_iff

/-- **Comparison: multiplicity one at a good prime.** When `p ∤ disc f` the reduction of a monic
`f` is separable, so no irreducible factor repeats. -/
example (f : ℤ[X]) (hf : f.Monic) (p : ℕ) [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ f.discr) :
    (f.map (Int.castRingHom (ZMod p))).Separable ∧
      (normalizedFactors (f.map (Int.castRingHom (ZMod p)))).Nodup := by
  have hsep := (hf.separable_map_zmod_iff_not_dvd_discr p).mpr hp
  exact ⟨hsep, (squarefree_iff_nodup_normalizedFactors (hf.map _).ne_zero).mp hsep.squarefree⟩

/-- **Edge case: `f` not monic, where the degree can drop:** the factor degrees always sum to the
degree of the reduction. -/
example (f : ℤ[X]) (p : ℕ) [Fact p.Prime] :
    (f.factorDegrees p).sum = (f.map (Int.castRingHom (ZMod p))).natDegree :=
  sum_factorDegrees_eq_natDegree_map f p

/-- **Good primes for a polynomial:** `IsGoodPrime f p` is `p ∤ disc f`. -/
example (f : ℤ[X]) (p : ℕ) : IsGoodPrime f p ↔ ¬ (p : ℤ) ∣ f.discr :=
  isGoodPrime_iff f p

/-- **Good primes for a resolvent:** `ResolventSpec.IsGoodPrime spec f p` is the conjunction of
`p ∤ disc f` and `p ∤ disc (specialize ℤ f)`. -/
example {n : ℕ} (spec : ResolventSpec n) (f : ℤ[X]) (p : ℕ) :
    spec.IsGoodPrime f p ↔
      ¬ (p : ℤ) ∣ f.discr ∧ ¬ (p : ℤ) ∣ (spec.specialize ℤ f).discr :=
  spec.isGoodPrime_iff f p

/-- **Edge case:** a prime good for `f` and bad for the resolvent. `3` avoids the discriminant of
`x⁵ − 5x − 12` but not that of its resolvent sextic. -/
example : IsGoodPrime (X ^ 5 - 5 * X - 12) 3 ∧
    ¬ quinticF20Spec.IsGoodPrime (X ^ 5 - 5 * X - 12) 3 :=
  isGoodPrime_and_not_isGoodPrime_quinticF20Spec_X_pow_five_sub_five_mul_X_sub_twelve

open scoped Classical in
/-- **Factor degrees are Frobenius orbit sizes.** Over a finite field `F`, a permutation of the
roots of a squarefree `g` that acts as `x ↦ x ^ q` has full cycle type the multiset of degrees of
the monic irreducible factors of `g`; orbit by orbit, the size of a Frobenius orbit is the degree
of the matching factor. -/
example {F : Type*} [Field F] [Fintype F] {g : F[X]} (E : Type*) [Field E] [Algebra F E]
    [Algebra.IsAlgebraic F E] [Fact ((g.map (algebraMap F E)).Splits)] (hg : Squarefree g)
    (π : Equiv.Perm (g.rootSet E)) (hπ : ∀ x, (π x : E) = (x : E) ^ Fintype.card F) :
    π.fullCycleType = (normalizedFactors g).map natDegree :=
  FiniteField.fullCycleType_eq_map_natDegree_normalizedFactors E hg π hπ

example {F : Type*} [Field F] [Fintype F] {g : F[X]} (E : Type*) [Field E] [Algebra F E]
    [Algebra.IsAlgebraic F E] [Fact ((g.map (algebraMap F E)).Splits)] (hg : g ≠ 0)
    (q : g.Factors) :
    ∃ x : g.rootSet E,
      MulAction.orbit
          (Subgroup.zpowers (_root_.FiniteField.frobeniusAlgEquivOfAlgebraic F E)) (x : E)
          = (q : F[X]).rootSet E ∧
        Nat.card (MulAction.orbit
          (Subgroup.zpowers (_root_.FiniteField.frobeniusAlgEquivOfAlgebraic F E)) (x : E))
          = (q : F[X]).natDegree :=
  FiniteField.exists_orbit_eq_rootSet_factor E hg q

open scoped Classical in
/-- **Dedekind's factorization theorem, imported: the contract check.** The supplied theorem,
`TauCeti.NumberField.exists_gal_fullCycleType_eq_factorizationType`, implies the statement of
the contract row with both abbreviations unfolded: the cycle type plus one part for each fixed
root equals the multiset of factor degrees modulo `p`. It covers reducible `f`. -/
example (f : ℤ[X]) (hf : f.Monic) (p : ℕ) [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ f.discr) :
    ∃ σ : (f.map (Int.castRingHom ℚ)).Gal,
      (Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ σ).cycleType +
          Multiset.replicate (Fintype.card ((f.map (Int.castRingHom ℚ)).rootSet ℂ) -
            (Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ σ).support.card) 1 =
        Multiset.map natDegree (normalizedFactors (f.map (Int.castRingHom (ZMod p)))) := by
  simpa only [Equiv.Perm.fullCycleType, factorDegrees_def] using
    NumberField.exists_gal_fullCycleType_eq_factorizationType f hf p hp

open scoped Classical in
/-- **The membership statement:** the factor degrees of `f mod p` are the full cycle type of an
element of the Galois image. -/
example (f : ℤ[X]) (hf : f.Monic) (p : ℕ) [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ f.discr) :
    ∃ σ ∈ (Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ).range,
      σ.fullCycleType = f.factorDegrees p :=
  exists_mem_range_galActionHom_fullCycleType_eq_factorDegrees hf p hp

/-- **Consequence 1, the criterion of irreducibility modulo `p`:** if `f mod p` is irreducible,
the Galois image contains a cycle through all the roots, and `f` is irreducible over `ℚ`. -/
example (f : ℤ[X]) (hf : f.Monic) (hdeg : 2 ≤ f.natDegree) (p : ℕ) [Fact p.Prime]
    (hirr : Irreducible (f.map (Int.castRingHom (ZMod p)))) :
    (∃ σ ∈ (Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ).range,
      σ.IsCycle ∧ σ.support = Finset.univ) ∧ Irreducible (f.map (Int.castRingHom ℚ)) :=
  ⟨exists_isCycle_mem_range_galActionHom_of_irreducible_map hf hdeg p hirr,
    HasFactorDegrees.irreducible_map_rat (n := f.natDegree)
      (HasFactorDegrees.mk ((isGoodPrime_iff f p).mpr
        ((hf.separable_map_zmod_iff_not_dvd_discr p).mp
          (PerfectField.separable_of_irreducible hirr)))
        ((hf.factorDegrees_eq_singleton_iff_irreducible p).mpr hirr)) hf⟩

open scoped Classical in
/-- **Consequence 2:** in prime degree, transitivity (irreducibility over `ℚ`) together with a
good prime of factorization type `(1, …, 1, 2)`, or more generally one quadratic factor and all
others odd, gives the full symmetric group `S_p`. -/
example (f : ℤ[X]) (hf : f.Monic) (hirr : Irreducible (f.map (Int.castRingHom ℚ)))
    (hprime : f.natDegree.Prime) (p : ℕ) [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ f.discr)
    (htwo : (f.factorDegrees p).count 2 = 1) (hodd : ∀ k ∈ f.factorDegrees p, k ≠ 2 → Odd k) :
    Function.Surjective (Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ) :=
  surjective_galActionHom_of_prime_natDegree hf hirr hprime p hp htwo hodd

open scoped Classical in
/-- **Consequence 3:** factorization type `(1, …, 1, 3)` at a good prime, with primitivity, gives
a Galois image that contains the alternating group. -/
example (f : ℤ[X]) (hf : f.Monic)
    (hprim : MulAction.IsPreprimitive (Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ).range
      ((f.map (Int.castRingHom ℚ)).rootSet ℂ))
    (p : ℕ) [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ f.discr)
    (hthree : (f.factorDegrees p).filter (2 ≤ ·) = {3}) :
    alternatingGroup ((f.map (Int.castRingHom ℚ)).rootSet ℂ) ≤
      (Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ).range :=
  alternatingGroup_le_range_galActionHom hf hprim p hp hthree

/-- **What factorization types give: lower bounds on the order.** The order of the exhibited
element, the least common multiple of the factor degrees, divides the order of the Galois group.
They give no upper bound, since every larger group also contains the exhibited element. -/
example (f : ℤ[X]) (hf : f.Monic) (p : ℕ) [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ f.discr) :
    (f.factorDegrees p).lcm ∣ Nat.card (f.map (Int.castRingHom ℚ)).Gal :=
  lcm_factorDegrees_dvd_natCard_gal hf p hp

/-- **The membership statement read backwards:** `x⁴ + 1` has Galois group `V₄`, which contains
no `4`-cycle, so it is reducible modulo every prime. Its Galois group has order `4`. -/
example (p : ℕ) [Fact p.Prime] : ¬ Irreducible (X ^ 4 + 1 : (ZMod p)[X]) :=
  not_irreducible_X_pow_four_add_one p

example : Nat.card (X ^ 4 + 1 : ℚ[X]).Gal = 4 :=
  natCard_gal_X_pow_four_add_one

/-- The Galois group of `x⁴ + 1` is not cyclic: it carries the label `4T2 = V₄`. -/
example : ¬ IsCyclic (X ^ 4 + 1 : ℚ[X]).Gal := by
  obtain ⟨-, -, e, he⟩ := hasGaloisLabel_X_pow_four_add_one
  intro hc
  have : Fact (((X ^ 4 + 1 : ℚ[X]).map
      (algebraMap ℚ (X ^ 4 + 1 : ℚ[X]).SplittingField)).Splits) := ⟨SplittingField.splits _⟩
  have h1 : IsCyclic
      (Gal.galActionHom (X ^ 4 + 1 : ℚ[X]) (X ^ 4 + 1 : ℚ[X]).SplittingField).range :=
    isCyclic_of_surjective _ (MonoidHom.rangeRestrict_surjective _)
  have h2 := (MulEquiv.isCyclic (e.permCongrHom.subgroupMap
    (Gal.galActionHom (X ^ 4 + 1 : ℚ[X]) (X ^ 4 + 1 : ℚ[X]).SplittingField).range)).mp h1
  exact not_isCyclic_referenceSubgroup_four_one (he.isCyclic_iff.mp h2)

/-- **The generic instance:** a monic quintic that is irreducible modulo one good prime and has
factor type `(1,1,1,2)` modulo another has group `S₅`, the label `5T5`. -/
example (f : ℤ[X]) (hf : f.Monic) (p q : ℕ) (hp : HasFactorDegrees f p {5})
    (hq : HasFactorDegrees f q {1, 1, 1, 2}) :
    HasGaloisLabel (f.map (Int.castRingHom ℚ)) (⟨4, by simp⟩ : TransitiveGroupIndex 5) :=
  hasGaloisLabel_five_four_of_factorDegrees_five_and_one_one_one_two hf hp hq

/-- **The `S₅` instance `x⁵ − x − 1`:** its Galois action is the full symmetric group, of order
`120`. -/
example : Function.Surjective
    (Gal.galActionHom ((X ^ 5 - X - 1 : ℤ[X]).map (Int.castRingHom ℚ)) ℂ) :=
  surjective_galActionHom_X_pow_five_sub_X_sub_one

example : Nat.card ((X ^ 5 - X - 1 : ℤ[X]).map (Int.castRingHom ℚ)).Gal = 120 := by
  rw [hasGaloisLabel_X_pow_five_sub_X_sub_one.natCard_gal, natCard_referenceSubgroup_five_four]

end Layer5


section Layer4

open TauCeti Polynomial MulAction
open MvPolynomial (renameStabilizer renameOrbit universalResolvent galResolvent)

/-! ## Layer 4: resolvents

### Static resolvent specifications -/

section Spec

variable {n : ℕ}

/-- **A resolvent specification is universal data with four fields**: a subgroup of
`Equiv.Perm (Fin n)`, an integral invariant, the statement that the stabilizer of the invariant
under `MvPolynomial.rename` is *exactly* that subgroup, and the integral expression of the orbit
product in the elementary symmetric polynomials. No polynomial and no coefficient ring appears. -/
example (H : Subgroup (Equiv.Perm (Fin n))) (Φ : MvPolynomial (Fin n) ℤ)
    (hH : ∀ σ : Equiv.Perm (Fin n), MvPolynomial.rename (⇑σ) Φ = Φ ↔ σ ∈ H)
    (D : (MvPolynomial (Fin n) ℤ)[X]) (hD : D.map (esymmSubst n) = universalResolvent Φ) :
    ResolventSpec n :=
  ⟨H, Φ, hH, D, hD⟩

/-- The universal resolvent is the product of `X - Ψ` over the rename-orbit of `Φ`, a set of
polynomials with no numbering, whose members are exactly the renamings of `Φ`. -/
example (Φ : MvPolynomial (Fin n) ℤ) :
    universalResolvent Φ = ∏ Ψ ∈ renameOrbit Φ, (X - C Ψ) :=
  MvPolynomial.universalResolvent_def Φ

example (Φ Ψ : MvPolynomial (Fin n) ℤ) :
    Ψ ∈ renameOrbit Φ ↔ ∃ σ : Equiv.Perm (Fin n), MvPolynomial.rename (⇑σ) Φ = Ψ :=
  MvPolynomial.mem_renameOrbit Φ Ψ

/-- The elementary-symmetric substitution `xᵢ ↦ eᵢ₊₁` of the fourth field. -/
example (i : Fin n) :
    esymmSubst n (MvPolynomial.X i) = MvPolynomial.esymm (Fin n) ℤ ((i : ℕ) + 1) :=
  esymmSubst_X n i

/-- **Constructor.** An invariant with a proved exact stabilizer gives a specification; the orbit
product is supplied by the symmetric descent, not chosen. -/
example (H : Subgroup (Equiv.Perm (Fin n))) (Φ : MvPolynomial (Fin n) ℤ)
    (h : ∀ σ : Equiv.Perm (Fin n), MvPolynomial.rename (⇑σ) Φ = Φ ↔ σ ∈ H) :
    (ResolventSpec.mk' H Φ h).H = H ∧ (ResolventSpec.mk' H Φ h).Φ = Φ :=
  ⟨ResolventSpec.mk'_H H Φ h, ResolventSpec.mk'_Φ H Φ h⟩

/-- **Comparison: the orbit of `Φ` has `[Sₙ : H]` elements.** -/
example (spec : ResolventSpec n) : (renameOrbit spec.Φ).card = spec.H.index :=
  spec.card_renameOrbit

/-- **Comparison: the stabilizer of a renamed invariant is the conjugate subgroup.** -/
example (e : Equiv.Perm (Fin n)) (Φ : MvPolynomial (Fin n) ℤ) :
    renameStabilizer (MvPolynomial.rename (⇑e) Φ) =
      (renameStabilizer Φ).map (MulAut.conj e).toMonoidHom :=
  MvPolynomial.renameStabilizer_rename e Φ

/-- **Naturality.** Renaming along `e` sends the specification for `H` to the specification for
`e H e⁻¹`, with the renamed invariant and the same orbit product. -/
example (spec : ResolventSpec n) (e : Equiv.Perm (Fin n)) :
    (spec.rename e).H = spec.H.map (MulAut.conj e).toMonoidHom ∧
      (spec.rename e).Φ = MvPolynomial.rename (⇑e) spec.Φ ∧
      (spec.rename e).orbitProduct = spec.orbitProduct :=
  ⟨spec.rename_H e, spec.rename_Φ e, spec.rename_orbitProduct e⟩

/-- **Edge case `H = ⊤`**: the resolvent is linear exactly when the specification tests the whole
symmetric group (and the orbit then has one element). -/
example (spec : ResolventSpec n) (R : Type*) [CommRing R] [Nontrivial R] (f : R[X]) :
    (spec.specialize R f).natDegree = 1 ↔ spec.H = ⊤ :=
  spec.natDegree_specialize_eq_one_iff R f

example (spec : ResolventSpec n) (h : spec.H = ⊤) : (renameOrbit spec.Φ).card = 1 := by
  rw [spec.card_renameOrbit, h, Subgroup.index_top]

/-- **Edge case `H = ⊥`**: the orbit has `n!` elements, and so has the degree of the resolvent. -/
example (spec : ResolventSpec n) (h : spec.H = ⊥) (R : Type*) [CommRing R] [Nontrivial R]
    (f : R[X]) : (spec.specialize R f).natDegree = n.factorial :=
  spec.natDegree_specialize_of_H_eq_bot h R f

/-- **Uniqueness.** The integral expression for the orbit product is unique, so two
specifications with the same invariant are the same object. -/
example (spec : ResolventSpec n) (D : (MvPolynomial (Fin n) ℤ)[X])
    (hD : D.map (esymmSubst n) = universalResolvent spec.Φ) : D = spec.orbitProduct :=
  spec.orbitProduct_unique hD

example (s t : ResolventSpec n) (h : s.Φ = t.Φ) : s = t :=
  ResolventSpec.ext h

end Spec

/-! ### The symmetric-polynomial descent, in five milestones -/

section Descent

variable {n : ℕ}

/-- **Descent step 1: invariance.** The universal resolvent is fixed by renaming along every
`σ ∈ Sₙ`. -/
example (Φ : MvPolynomial (Fin n) ℤ) (σ : Equiv.Perm (Fin n)) :
    (universalResolvent Φ).map (MvPolynomial.rename (R := ℤ) (⇑σ)).toRingHom =
      universalResolvent Φ :=
  MvPolynomial.universalResolvent_map_rename Φ σ

/-- **Descent step 2: symmetry of the coefficients.** -/
example (Φ : MvPolynomial (Fin n) ℤ) (k : ℕ) : ((universalResolvent Φ).coeff k).IsSymmetric :=
  MvPolynomial.isSymmetric_universalResolvent_coeff Φ k

/-- **Descent step 3: the fundamental theorem of symmetric polynomials.** Each coefficient is an
integral polynomial in the elementary symmetric polynomials, in exactly one way; `esymmSubst` is
injective. -/
example (Φ : MvPolynomial (Fin n) ℤ) :
    ∃! D : (MvPolynomial (Fin n) ℤ)[X], D.map (esymmSubst n) = universalResolvent Φ :=
  MvPolynomial.existsUnique_orbitProduct Φ

example : Function.Injective (esymmSubst n) :=
  esymmSubst_injective n

/-- **Descent step 4: Vieta.** For a monic `g` of degree `n` over a domain, listed with
multiplicity by `x`, the `(k+1)`-st elementary symmetric polynomial at `x` is
`(-1)^(k+1) * g.coeff (n - (k+1))`. -/
example {L : Type*} [CommRing L] [IsDomain L] (g : L[X]) (hg : g.Monic)
    (hdeg : g.natDegree = n) (x : Fin n → L) (hx : g.roots = Multiset.map x Finset.univ.val)
    (k : Fin n) :
    MvPolynomial.eval x (MvPolynomial.esymm (Fin n) L ((k : ℕ) + 1)) =
      (-1) ^ ((k : ℕ) + 1) * g.coeff (n - ((k : ℕ) + 1)) := by
  have hprod := eq_prod_X_sub_C_of_monic_of_roots_eq hg (by simpa using hdeg) hx
  have h := MvPolynomial.aeval_esymm_eq_coeff_prod_X_sub_C (R := L) x
    (k := (k : ℕ) + 1) (by simp)
  rw [← hprod, Fintype.card_fin] at h
  simpa [MvPolynomial.aeval_eq_eval] using h

/-- The same step, in the form of a root enumeration of `f` over `R` in a domain `L`. -/
example {R L : Type*} [CommRing R] [CommRing L] [IsDomain L] [Algebra R L] {f : R[X]}
    {x : Fin n → L} (hx : IsRootEnumeration f x) (hf : f.Monic) (hdeg : f.natDegree ≤ n)
    {k : ℕ} (hk : k ≤ n) :
    MvPolynomial.aeval x (MvPolynomial.esymm (Fin n) R k) =
      (-1) ^ k * algebraMap R L (f.coeff (n - k)) := by
  simpa using hx.aeval_esymm_eq_coeff hf (by simpa using hdeg) (by simpa using hk)

/-- **Descent step 5: agreement.** In a field where `f` splits, the coefficient-side resolvent maps
to the root-side orbit product at any root enumeration. -/
example {F L : Type*} [Field F] [Field L] [Algebra F L] (spec : ResolventSpec n) (f : F[X])
    (hf : f.Monic) (hdeg : f.natDegree = n) (x : Fin n → L) (hx : IsRootEnumeration f x) :
    (spec.specialize F f).map (algebraMap F L) = galResolvent spec.Φ x :=
  spec.map_specialize_eq_galResolvent (algebraMap F L) hf hdeg hx

end Descent

/-! ### Specialization at a polynomial, over any coefficient ring -/

section Specialize

variable {n : ℕ}

/-- **The defining formula.** `specialize R f` substitutes the signed coefficients of `f` for the
elementary symmetric polynomials in the integral orbit product. -/
example (spec : ResolventSpec n) (R : Type*) [CommRing R] (f : R[X]) :
    spec.specialize R f = spec.orbitProduct.map (vietaHom n f) :=
  spec.specialize_def R f

example {R : Type*} [CommRing R] (f : R[X]) (i : Fin n) :
    vietaHom n f (MvPolynomial.X i) = (-1) ^ ((i : ℕ) + 1) * f.coeff (n - ((i : ℕ) + 1)) :=
  vietaHom_X f i

/-- **Base change**, with no hypothesis on `f`. -/
example (spec : ResolventSpec n) {R S : Type*} [CommRing R] [CommRing S] (φ : R →+* S)
    (f : R[X]) : (spec.specialize R f).map φ = spec.specialize S (f.map φ) :=
  spec.specialize_map φ f

/-- **Coefficient integrality**, the case `ℤ → ℚ` of base change. -/
example (spec : ResolventSpec n) (f : ℤ[X]) :
    (spec.specialize ℤ f).map (Int.castRingHom ℚ) =
      spec.specialize ℚ (f.map (Int.castRingHom ℚ)) :=
  spec.specialize_map (Int.castRingHom ℚ) f

/-- **Reduction**, the case `ℤ → ZMod p` of base change. The identity is unconditional. -/
example (spec : ResolventSpec n) (f : ℤ[X]) (p : ℕ) :
    (spec.specialize ℤ f).map (Int.castRingHom (ZMod p)) =
      spec.specialize (ZMod p) (f.map (Int.castRingHom (ZMod p))) :=
  spec.specialize_map (Int.castRingHom (ZMod p)) f

/-- **Degree and monicity.** The specialized resolvent is monic of degree `[Sₙ : H]` over every
nonzero ring and for every `f`. -/
example (spec : ResolventSpec n) (R : Type*) [CommRing R] [Nontrivial R] (f : R[X]) :
    (spec.specialize R f).Monic ∧ (spec.specialize R f).natDegree = spec.H.index :=
  ⟨spec.monic_specialize R f, spec.natDegree_specialize R f⟩

end Specialize

/-! ### The orbit resolvent -/

section OrbitResolvent

variable {n : ℕ} {L : Type*} [CommRing L]

/-- **Constructor: the product formula**, over the rename-orbit taken in
`MvPolynomial (Fin n) ℤ`, with each orbit element evaluated at `x`. -/
example (Φ : MvPolynomial (Fin n) ℤ) (x : Fin n → L) :
    galResolvent Φ x =
      ∏ Ψ ∈ renameOrbit Φ, (X - C (MvPolynomial.eval₂ (Int.castRingHom L) x Ψ)) :=
  MvPolynomial.galResolvent_def Φ x

/-- **Degree `[Sₙ : H]`, unconditionally**, whatever the values do. -/
example [Nontrivial L] (spec : ResolventSpec n) (x : Fin n → L) :
    (galResolvent spec.Φ x).Monic ∧ (galResolvent spec.Φ x).natDegree = spec.H.index := by
  refine ⟨MvPolynomial.monic_galResolvent _ x, ?_⟩
  rw [MvPolynomial.natDegree_galResolvent, spec.card_renameOrbit]

/-- **Independence of the numbering.** -/
example (Φ : MvPolynomial (Fin n) ℤ) (x : Fin n → L) (σ : Equiv.Perm (Fin n)) :
    galResolvent Φ (x ∘ σ) = galResolvent Φ x :=
  MvPolynomial.galResolvent_comp_perm Φ x σ

/-- **Comparison with the universal resolvent**, as its image under evaluation at `x`. -/
example (Φ : MvPolynomial (Fin n) ℤ) (x : Fin n → L) :
    (universalResolvent Φ).map (MvPolynomial.eval₂Hom (Int.castRingHom L) x) =
      galResolvent Φ x :=
  MvPolynomial.map_universalResolvent_eq_galResolvent Φ x

/-- **Comparison with `specialize`** at the roots of a monic `f` of degree `n`. -/
example {R : Type*} [CommRing R] [IsDomain L] (spec : ResolventSpec n) (φ : R →+* L) {f : R[X]}
    (hf : f.Monic) (hdeg : f.natDegree = n) {x : Fin n → L}
    (hx : (f.map φ).roots = Finset.univ.val.map x) :
    (spec.specialize R f).map φ = galResolvent spec.Φ x :=
  spec.map_specialize_eq_galResolvent φ hf hdeg hx

/-- **Edge case: orbit values may agree.** Over a domain the roots are the values of the orbit,
with multiplicity, so a collision of values costs separability and never degree. -/
example [IsDomain L] (Φ : MvPolynomial (Fin n) ℤ) (x : Fin n → L) :
    (galResolvent Φ x).roots =
      (renameOrbit Φ).val.map fun Ψ => MvPolynomial.eval₂ (Int.castRingHom L) x Ψ :=
  MvPolynomial.roots_galResolvent Φ x

end OrbitResolvent

/-! ### The root data that a resolvent statement assumes -/

section RootEnumeration

variable {F L : Type*} [Field F] [Field L] [Algebra F L] {n : ℕ}

/-- A root enumeration lists the roots with multiplicity. -/
example (f : F[X]) (x : Fin n → L) :
    IsRootEnumeration f x ↔ (f.map (algebraMap F L)).roots = Finset.univ.val.map x :=
  isRootEnumeration_iff

/-- **Splitting.** If `f.natDegree = n` and `x` enumerates the roots, then `f` splits in `L`. -/
example (f : F[X]) (hdeg : f.natDegree = n) (x : Fin n → L) (hx : IsRootEnumeration f x) :
    (f.map (algebraMap F L)).Splits :=
  hx.splits (by simp [hdeg])

/-- **Separability.** `x` is injective if and only if the mapped polynomial is separable. -/
example (f : F[X]) (hf : f ≠ 0) (hdeg : f.natDegree = n) (x : Fin n → L)
    (hx : IsRootEnumeration f x) :
    Function.Injective x ↔ (f.map (algebraMap F L)).Separable :=
  hx.injective_iff_separable_map (by simp [hdeg])
    (Polynomial.map_ne_zero hf)

end RootEnumeration

/-! ### The factorization theorem and the degenerate case -/

section Factorization

variable {F : Type*} [Field F] {E : Type*} [Field E] [Algebra F E] {f : F[X]} {n : ℕ}
  [Fact ((f.map (algebraMap F E)).Splits)]

/-- **The factorization theorem.** For a separable specialized resolvent, its monic irreducible
factors correspond to the orbits of the Galois image on `Sₙ/H`, the orbit of the coset of `τ`
going to the minimal polynomial of the value of the renamed invariant. -/
noncomputable example [Normal F E] (spec : ResolventSpec n) (hf : f.Monic) (hdeg : f.natDegree = n)
    (e : f.rootSet E ≃ Fin n) (hres : (spec.specialize F f).Separable) :
    MulAction.orbitRel.Quotient
        ((Gal.galActionHom f E).range.map (e.permCongrHom : _ →* Equiv.Perm (Fin n)))
        (Equiv.Perm (Fin n) ⧸ spec.H) ≃ (spec.specialize F f).Factors :=
  spec.orbitQuotientEquivFactors hf hdeg e hres

example [Normal F E] (spec : ResolventSpec n) (hf : f.Monic) (hdeg : f.natDegree = n)
    (e : f.rootSet E ≃ Fin n) (hres : (spec.specialize F f).Separable)
    (τ : Equiv.Perm (Fin n)) :
    ((spec.orbitQuotientEquivFactors hf hdeg e hres
        (Quotient.mk _ (τ : Equiv.Perm (Fin n) ⧸ spec.H)) : (spec.specialize F f).Factors) :
        F[X]) =
      minpoly F (MvPolynomial.eval₂ (Int.castRingHom E) (fun i => ((e.symm i : f.rootSet E) : E))
        (MvPolynomial.rename ⇑τ spec.Φ)) :=
  spec.orbitQuotientEquivFactors_apply_mk hf hdeg e hres τ

/-- Along the bijection, the degree of a factor is the size of its orbit. -/
example [Normal F E] (spec : ResolventSpec n) (hf : f.Monic) (hdeg : f.natDegree = n)
    (e : f.rootSet E ≃ Fin n) (hres : (spec.specialize F f).Separable)
    (ω : MulAction.orbitRel.Quotient
      ((Gal.galActionHom f E).range.map (e.permCongrHom : _ →* Equiv.Perm (Fin n)))
      (Equiv.Perm (Fin n) ⧸ spec.H)) :
    Nat.card (MulAction.orbitRel.Quotient.orbit ω) =
      ((spec.orbitQuotientEquivFactors hf hdeg e hres ω : (spec.specialize F f).Factors) :
        F[X]).natDegree :=
  spec.natCard_orbit_eq_natDegree_factor hf hdeg e hres ω

open scoped Classical in
/-- **Corollary: the multiset of factor degrees is the multiset of orbit sizes.** -/
example [Normal F E] (spec : ResolventSpec n) (hf : f.Monic) (hdeg : f.natDegree = n)
    (e : f.rootSet E ≃ Fin n) (hres : (spec.specialize F f).Separable) :
    (UniqueFactorizationMonoid.normalizedFactors (spec.specialize F f)).map natDegree =
      Finset.univ.val.map fun ω : MulAction.orbitRel.Quotient
          ((Gal.galActionHom f E).range.map (e.permCongrHom : _ →* Equiv.Perm (Fin n)))
          (Equiv.Perm (Fin n) ⧸ spec.H) => Nat.card (MulAction.orbitRel.Quotient.orbit ω) :=
  spec.map_natDegree_normalizedFactors_specialize hf hdeg e hres

/-- **Corollary: a root in `F` exactly when the image is conjugate into `H`**, for a monic
separable `f` and a separable specialized resolvent. -/
example [IsGalois F E] (spec : ResolventSpec n) (hf : f.Monic) (hsep : f.Separable)
    (hdeg : f.natDegree = n) (e : f.rootSet E ≃ Fin n)
    (hres : (spec.specialize F f).Separable) :
    (∃ a : F, (spec.specialize F f).IsRoot a) ↔
      ∃ τ : Equiv.Perm (Fin n),
        (Gal.galActionHom f E).range.map (e.permCongrHom : _ →* Equiv.Perm (Fin n)) ≤
          spec.H.map (MulAut.conj τ).toMonoidHom :=
  spec.exists_isRoot_specialize_iff_exists_le_map_conj hf hsep hdeg e hres

/-- **The degenerate case, first direction**, with no hypothesis on the resolvent: an image
conjugate into `H` gives the specialized resolvent a root in `F`. -/
example [IsGalois F E] (spec : ResolventSpec n) (hf : f.Monic) (hsep : f.Separable)
    (hdeg : f.natDegree = n) (e : f.rootSet E ≃ Fin n) (τ : Equiv.Perm (Fin n))
    (hle : (Gal.galActionHom f E).range.map (e.permCongrHom : _ →* Equiv.Perm (Fin n)) ≤
      spec.H.map (MulAut.conj τ).toMonoidHom) :
    ∃ a : F, (spec.specialize F f).IsRoot a :=
  spec.exists_isRoot_specialize_of_le_map_conj hf hsep hdeg e τ hle

/-- **The degenerate case, the converse**, which holds under separation evidence. -/
example [Normal F E] (spec : ResolventSpec n) (hf : f.Monic) (hsep : f.Separable)
    (hdeg : f.natDegree = n) (e : f.rootSet E ≃ Fin n)
    (hres : (spec.specialize F f).Separable) {a : F} (ha : (spec.specialize F f).IsRoot a) :
    ∃ τ : Equiv.Perm (Fin n),
      (Gal.galActionHom f E).range.map (e.permCongrHom : _ →* Equiv.Perm (Fin n)) ≤
        spec.H.map (MulAut.conj τ).toMonoidHom :=
  spec.exists_le_map_conj_of_isRoot_specialize hf hsep hdeg e hres ha

end Factorization

/-! ### The `x⁵ − x` instance: the converse fails without separation evidence -/

section Collision

attribute [local instance] Gal.splits_ℚ_ℂ

/-- `x⁵ − x` is separable over `ℚ`, and its discriminant is `-256`. -/
example : (X ^ 5 - X : ℤ[X]).discr = -256 ∧ (X ^ 5 - X : ℚ[X]).Separable :=
  ⟨discr_X_pow_five_sub_X, separable_X_pow_five_sub_X⟩

/-- Its resolvent sextic is `(X − 2)⁴ (X² + 16)`: still a sextic, with the rational root `2`, and
not separable. -/
example : resolventSextic (X ^ 5 - X : ℤ[X]) = (X - C 2) ^ 4 * (X ^ 2 + C 16) := by
  rw [resolventSextic_X_pow_five_sub_X]
  simp

example : (quinticF20Spec.specialize ℚ (X ^ 5 - X : ℚ[X])).IsRoot 2 ∧
    ¬ ((resolventSextic (X ^ 5 - X : ℤ[X])).map (Int.castRingHom ℚ)).Separable :=
  ⟨isRoot_specialize_quinticF20Spec_X_pow_five_sub_X,
    not_separable_map_resolventSextic_X_pow_five_sub_X⟩

/-- The Galois image of `x⁵ − x` is not conjugate into `F₂₀`, through any numbering. -/
example (e : (X ^ 5 - X : ℚ[X]).rootSet ℂ ≃ Fin 5) :
    ¬ ∃ τ : Equiv.Perm (Fin 5),
      (Gal.galActionHom (X ^ 5 - X : ℚ[X]) ℂ).range.map
          (e.permCongrHom : _ →* Equiv.Perm (Fin 5)) ≤
        quinticF20Spec.H.map (MulAut.conj τ).toMonoidHom :=
  not_exists_le_map_conj_quinticF20Spec_X_pow_five_sub_X e

/-- So the separation hypothesis of the converse cannot be dropped. -/
example :
    ¬ ∀ f : ℚ[X], f.Monic → f.Separable → f.natDegree = 5 →
      ∀ e : f.rootSet ℂ ≃ Fin 5, ∀ a : ℚ, (quinticF20Spec.specialize ℚ f).IsRoot a →
        ∃ τ : Equiv.Perm (Fin 5),
          (Gal.galActionHom f ℂ).range.map (e.permCongrHom : _ →* Equiv.Perm (Fin 5)) ≤
            quinticF20Spec.H.map (MulAut.conj τ).toMonoidHom :=
  not_forall_exists_le_map_conj_of_isRoot_specialize_quinticF20Spec

end Collision

/-! ### Tschirnhaus transforms -/

section Tschirnhaus

/-- **`tschirnhausPolynomial f T`** is the resultant in `X` of `f(X)` and `Y - T(X)`, a function of
the coefficients of `f` and `T` alone; for monic `f` it commutes with every ring morphism. -/
example {R : Type*} [CommRing R] (f T : R[X]) :
    f.tschirnhausPolynomial T = resultant (f.map C) (C X - T.map C : R[X][X]) :=
  tschirnhausPolynomial_def f T

example {R S : Type*} [CommRing R] [CommRing S] {f : R[X]} (hf : f.Monic) (T : R[X])
    (φ : R →+* S) :
    (f.tschirnhausPolynomial T).map φ = (f.map φ).tschirnhausPolynomial (T.map φ) :=
  map_tschirnhausPolynomial hf T φ

/-- For monic `f` split over a domain, its roots are the values `T(α)`, with multiplicity. -/
example {R : Type*} [CommRing R] [IsDomain R] {f : R[X]} (hs : f.Splits) (T : R[X]) :
    (f.tschirnhausPolynomial T).roots = f.roots.map fun a => T.eval a :=
  roots_tschirnhausPolynomial hs T

variable {F : Type*} [Field F] {f T : F[X]}

/-- **`TschirnhausAdmissible f T`**: `T` separates the roots of `f`. -/
example : TschirnhausAdmissible f T ↔
    Set.InjOn (fun a ↦ aeval a T) (f.rootSet f.SplittingField) :=
  Iff.rfl

/-- **The transform preserves the degree** (for monic `f`, admissible or not). -/
example (hf : f.Monic) : (f.tschirnhausPolynomial T).natDegree = f.natDegree :=
  natDegree_tschirnhausPolynomial hf T

/-- **Separability**: the transform of a nonzero `f` is separable exactly when `f` is separable
and `T` is admissible. -/
example (hf : f ≠ 0) :
    (f.tschirnhausPolynomial T).Separable ↔ f.Separable ∧ TschirnhausAdmissible f T :=
  separable_tschirnhausPolynomial_iff hf T

/-- **The root sets correspond**, through `α ↦ T(α)`, in any field where `f` splits. -/
example {L : Type*} [Field L] [Algebra F L] (hT : TschirnhausAdmissible f T)
    (hs : (f.map (algebraMap F L)).Splits) :
    Set.BijOn (fun a ↦ aeval a T) (f.rootSet L) ((f.tschirnhausPolynomial T).rootSet L) :=
  hT.bijOn_rootSet hs

/-- **The splitting fields agree up to an `AlgEquiv`.** -/
example (hT : TschirnhausAdmissible f T) (hsep : f.Separable) :
    Nonempty (f.SplittingField ≃ₐ[F] (f.tschirnhausPolynomial T).SplittingField) :=
  hT.nonempty_algEquiv_splittingField hsep

/-- **The Galois images are conjugate**, along the root equivalence `α ↦ T(α)`. -/
example {E : Type*} [Field E] [Algebra F E] [Normal F E] (hT : TschirnhausAdmissible f T)
    [hfsp : Fact ((f.map (algebraMap F E)).Splits)]
    [Fact (((f.tschirnhausPolynomial T).map (algebraMap F E)).Splits)] :
    (Gal.galActionHom (f.tschirnhausPolynomial T) E).range =
      (Gal.galActionHom f E).range.map
        (Equiv.permCongrHom (hT.rootSetEquiv hfsp.out)).toMonoidHom :=
  hT.range_galActionHom_eq_map_rootSetEquiv

/-- **The upper bound transports back to `f`**: an admissible transform whose resolvent is
separable with a root in `F` confines the Galois image of `f` to a conjugate of `H`. -/
example {E : Type*} [Field E] [Algebra F E] [Normal F E]
    [Fact ((f.map (algebraMap F E)).Splits)] {n : ℕ} (spec : ResolventSpec n) (hf : f.Monic)
    (hsep : f.Separable) (hdeg : f.natDegree = n) (hT : TschirnhausAdmissible f T)
    (e : f.rootSet E ≃ Fin n)
    (hres : (spec.specialize F (f.tschirnhausPolynomial T)).Separable) {a : F}
    (ha : (spec.specialize F (f.tschirnhausPolynomial T)).IsRoot a) :
    ∃ τ : Equiv.Perm (Fin n),
      (Gal.galActionHom f E).range.map (e.permCongrHom : _ →* Equiv.Perm (Fin n)) ≤
        spec.H.map (MulAut.conj τ).toMonoidHom :=
  spec.exists_le_map_conj_of_isRoot_specialize_tschirnhausPolynomial hf hsep hdeg hT e hres ha

end Tschirnhaus

/-! ### The quartic -/

section Quartic

/-- **The `D₄` specification**: the invariant `x₀x₂ + x₁x₃`, whose stabilizer is exactly
`referenceSubgroup 4 2`, the label `4T3`, of order 8; its orbit has three elements. -/
example : quarticD4Spec.H = referenceSubgroup 4 ⟨2, by simp⟩ ∧
    quarticD4Spec.Φ =
      MvPolynomial.X 0 * MvPolynomial.X 2 + MvPolynomial.X 1 * MvPolynomial.X 3 :=
  ⟨quarticD4Spec_H, quarticD4Spec_Φ⟩

example (σ : Equiv.Perm (Fin 4)) :
    MvPolynomial.rename (⇑σ) quarticD4Invariant = quarticD4Invariant ↔
      σ ∈ referenceSubgroup 4 ⟨2, by simp⟩ :=
  rename_quarticD4Invariant_eq_self_iff σ

example : Nat.card (referenceSubgroup 4 ⟨2, by simp⟩) = 8 :=
  natCard_referenceSubgroup_four_two

example : renameOrbit quarticD4Invariant =
    {MvPolynomial.X 0 * MvPolynomial.X 2 + MvPolynomial.X 1 * MvPolynomial.X 3,
      MvPolynomial.X 0 * MvPolynomial.X 1 + MvPolynomial.X 2 * MvPolynomial.X 3,
      MvPolynomial.X 0 * MvPolynomial.X 3 + MvPolynomial.X 1 * MvPolynomial.X 2} ∧
    (renameOrbit quarticD4Invariant).card = 3 :=
  ⟨renameOrbit_quarticD4Invariant, card_renameOrbit_quarticD4Invariant⟩

/-- **The closed form.** `resolventCubic p q r = X³ − pX² − 4rX + (4pr − q²)` is the
specialization of the `D₄` specification at `X⁴ + pX² + qX + r`. -/
example {R : Type*} [CommRing R] (p q r : R) :
    resolventCubic p q r = X ^ 3 - C p * X ^ 2 - C (4 * r) * X + C (4 * p * r - q ^ 2) ∧
      quarticD4Spec.specialize R (X ^ 4 + C p * X ^ 2 + C q * X + C r) =
        resolventCubic p q r :=
  ⟨resolventCubic_def p q r, quarticD4Spec_specialize_depressed p q r⟩

/-- The general classical form `X³ − bX² + (ac − 4d)X − (a²d + c² − 4bd)` of
`X⁴ + aX³ + bX² + cX + d`, read off the coefficients. -/
example {R : Type*} [CommRing R] (f : R[X]) :
    quarticD4Spec.specialize R f = X ^ 3 - C (f.coeff 2) * X ^ 2 +
      C (f.coeff 3 * f.coeff 1 - 4 * f.coeff 0) * X -
      C (f.coeff 3 ^ 2 * f.coeff 0 + f.coeff 1 ^ 2 - 4 * f.coeff 2 * f.coeff 0) :=
  quarticD4Spec_specialize R f

/-- **Discriminants agree**, with the sign convention of `Polynomial.discr` on both sides. -/
example {R : Type*} [CommRing R] (p q r : R) :
    (X ^ 4 + C p * X ^ 2 + C q * X + C r : R[X]).discr = (resolventCubic p q r).discr :=
  discr_resolventCubic p q r

example {R : Type*} [CommRing R] {f : R[X]} (hf : f.Monic) (h4 : f.natDegree = 4) :
    f.discr = (quarticD4Spec.specialize R f).discr :=
  discr_quarticD4Spec_specialize hf h4

/-- **A separable quartic has a separable resolvent cubic**, so the decision table needs no
separation evidence. -/
example {R : Type*} [CommRing R] (p q r : R)
    (h : (X ^ 4 + C p * X ^ 2 + C q * X + C r : R[X]).Separable) :
    (resolventCubic p q r).Separable :=
  separable_resolventCubic p q r h

example {R : Type*} [CommRing R] {f : R[X]} (hf : f.Monic) (h4 : f.natDegree = 4) :
    (quarticD4Spec.specialize R f).Separable ↔ f.Separable :=
  separable_quarticD4Spec_specialize_iff hf h4

variable {F : Type*} [Field F]

/-- **Depression is valid.** `X ↦ X − s` removes the cubic term of `X⁴ + 4sX³ + ⋯` over every
ring; away from characteristic `2` it applies with `s = a/4`, and the label is unchanged. -/
example {R : Type*} [CommRing R] (s b c d : R) :
    (X ^ 4 + C (4 * s) * X ^ 3 + C b * X ^ 2 + C c * X + C d).comp (X - C s) =
      X ^ 4 + C (b - 6 * s ^ 2) * X ^ 2 + C (c - 2 * b * s + 8 * s ^ 3) * X +
        C (d - c * s + b * s ^ 2 - 3 * s ^ 4) :=
  quartic_comp_X_sub_C s b c d

example (hchar : ringChar F ≠ 2) (a b c d : F) {j : TransitiveGroupIndex 4} :
    HasGaloisLabel (X ^ 4 + C a * X ^ 3 + C b * X ^ 2 + C c * X + C d) j ↔
      HasGaloisLabel (X ^ 4 + C (b - 6 * (a / 4) ^ 2) * X ^ 2 +
        C (c - 2 * b * (a / 4) + 8 * (a / 4) ^ 3) * X +
        C (d - c * (a / 4) + b * (a / 4) ^ 2 - 3 * (a / 4) ^ 4)) j :=
  hasGaloisLabel_quartic_iff_depressed hchar a b c d

/-- Translation preserves the splitting field. -/
example {L : Type*} [Field L] [Algebra F L] {p : F[X]} {t : F} :
    IsSplittingField F L (p.comp (X + C t)) ↔ IsSplittingField F L p :=
  isSplittingField_comp_X_add_C_iff

/-- Translation induces a `Gal`-equivariant bijection of root sets, `x ↦ x + t`. -/
example {E : Type*} [Field E] [Algebra F E] (p : F[X]) (t : F)
    [Fact (p.map (algebraMap F E)).Splits] [Fact ((p.comp (X + C t)).map (algebraMap F E)).Splits]
    (ϕ : Gal(E/F)) (x : (p.comp (X + C t)).rootSet E) :
    Gal.galActionHom p E (Gal.restrict p E ϕ) (rootSetCompXAddCEquiv p t E x) =
      rootSetCompXAddCEquiv p t E
        (Gal.galActionHom (p.comp (X + C t)) E (Gal.restrict (p.comp (X + C t)) E ϕ) x) :=
  galActionHom_restrict_rootSetCompXAddCEquiv p t ϕ x

variable {f : F[X]} (hchar : ringChar F ≠ 2) (hf : f.Monic)
include hchar hf

/-- **Decision table, row 1** (`S₄ = 4T5`): resolvent cubic irreducible, discriminant not a
square. -/
example : HasGaloisLabel f (⟨4, by simp⟩ : TransitiveGroupIndex 4) ↔
    Irreducible f ∧ f.natDegree = 4 ∧ ¬ IsSquare f.discr ∧
      Irreducible (quarticD4Spec.specialize F f) :=
  hasGaloisLabel_four_four_iff hchar hf

/-- **Decision table, row 2** (`A₄ = 4T4`): resolvent cubic irreducible, discriminant a
square. -/
example : HasGaloisLabel f (⟨3, by simp⟩ : TransitiveGroupIndex 4) ↔
    Irreducible f ∧ f.natDegree = 4 ∧ IsSquare f.discr ∧
      Irreducible (quarticD4Spec.specialize F f) :=
  hasGaloisLabel_four_three_iff hchar hf

/-- **Decision table, row 3** (`V₄ = 4T2`): resolvent cubic splits completely. -/
example : HasGaloisLabel f (⟨1, by simp⟩ : TransitiveGroupIndex 4) ↔
    Irreducible f ∧ f.natDegree = 4 ∧ (quarticD4Spec.specialize F f).Splits :=
  hasGaloisLabel_four_one_iff_splits_resolvent hchar hf

example : HasGaloisLabel f (⟨1, by simp⟩ : TransitiveGroupIndex 4) ↔
    Irreducible f ∧ f.natDegree = 4 ∧ IsSquare f.discr ∧
      ∃ a : F, (quarticD4Spec.specialize F f).IsRoot a :=
  hasGaloisLabel_four_one_iff hchar hf

/-- **Decision table, row 4** (`C₄ = 4T1` or `D₄ = 4T3`): exactly one root of the resolvent cubic
in `F`, discriminant not a square. -/
example : (HasGaloisLabel f (⟨0, by simp⟩ : TransitiveGroupIndex 4) ∨
      HasGaloisLabel f (⟨2, by simp⟩ : TransitiveGroupIndex 4)) ↔
    Irreducible f ∧ f.natDegree = 4 ∧ ∃! a : F, (quarticD4Spec.specialize F f).IsRoot a :=
  hasGaloisLabel_four_zero_or_two_iff_existsUnique_isRoot_resolvent hchar hf

example : (HasGaloisLabel f (⟨0, by simp⟩ : TransitiveGroupIndex 4) ∨
      HasGaloisLabel f (⟨2, by simp⟩ : TransitiveGroupIndex 4)) ↔
    Irreducible f ∧ f.natDegree = 4 ∧ ¬ IsSquare f.discr ∧
      ∃ a : F, (quarticD4Spec.specialize F f).IsRoot a :=
  hasGaloisLabel_four_zero_or_two_iff hchar hf

/-- **Row 4 separated over `F(√disc f)`**: `C₄` when `f` becomes reducible there, `D₄` when it
stays irreducible. -/
example {E : Type*} [Field E] [Algebra F E] {δ : E} (hδ : δ ^ 2 = algebraMap F E f.discr) :
    HasGaloisLabel f (⟨0, by simp⟩ : TransitiveGroupIndex 4) ↔
      Irreducible f ∧ f.natDegree = 4 ∧ ¬ Irreducible (f.map (algebraMap F (discrField f E))) :=
  hasGaloisLabel_four_zero_iff hchar hf hδ

example {E : Type*} [Field E] [Algebra F E] {δ : E} (hδ : δ ^ 2 = algebraMap F E f.discr) :
    HasGaloisLabel f (⟨2, by simp⟩ : TransitiveGroupIndex 4) ↔
      Irreducible f ∧ f.natDegree = 4 ∧ ¬ IsSquare f.discr ∧
        (∃ a : F, (quarticD4Spec.specialize F f).IsRoot a) ∧
          Irreducible (f.map (algebraMap F (discrField f E))) :=
  hasGaloisLabel_four_two_iff hchar hf hδ

omit hchar hf in
/-- The `A₄` row read as an order: an irreducible depressed quartic over `ℚ` with irreducible
resolvent cubic and square discriminant has Galois group of order 12. -/
example (p q r : ℚ) (hirr : Irreducible (X ^ 4 + C p * X ^ 2 + C q * X + C r : ℚ[X]))
    (hres : Irreducible (resolventCubic p q r))
    (hsq : IsSquare (X ^ 4 + C p * X ^ 2 + C q * X + C r : ℚ[X]).discr) :
    Nat.card (X ^ 4 + C p * X ^ 2 + C q * X + C r : ℚ[X]).Gal = 12 := by
  have hmon : (X ^ 4 + C p * X ^ 2 + C q * X + C r : ℚ[X]).Monic := by monicity!
  have hdeg : (X ^ 4 + C p * X ^ 2 + C q * X + C r : ℚ[X]).natDegree = 4 := by
    compute_degree!
  have hchar : ringChar ℚ ≠ 2 := by simp
  have h := (hasGaloisLabel_four_three_iff hchar hmon).2
    ⟨hirr, hdeg, hsq, by rwa [quarticD4Spec_specialize_depressed]⟩
  rw [h.natCard_gal, natCard_referenceSubgroup_four_three]

end Quartic

/-! ### The quintic -/

section Quintic

/-- **The invariant** `Φ = Σ_{a ∈ ℤ/5} x_a² (x_{a+1} x_{a−1} + x_{a+2} x_{a−2})`. -/
example : quinticF20Invariant =
    ∑ a : Fin 5, MvPolynomial.X a ^ 2 *
      (MvPolynomial.X (a + 1) * MvPolynomial.X (a - 1) +
        MvPolynomial.X (a + 2) * MvPolynomial.X (a - 2)) :=
  quinticF20Invariant_def

/-- **Its stabilizer is exactly `F₂₀ = referenceSubgroup 5 2`**, the label `5T3`, of order 20,
and its `S₅`-orbit has six elements. -/
example (σ : Equiv.Perm (Fin 5)) :
    MvPolynomial.rename (⇑σ) quinticF20Invariant = quinticF20Invariant ↔
      σ ∈ referenceSubgroup 5 ⟨2, by simp⟩ :=
  rename_quinticF20Invariant_eq_self_iff σ

example : quinticF20Spec.H = referenceSubgroup 5 ⟨2, by simp⟩ ∧
    quinticF20Spec.Φ = quinticF20Invariant :=
  ⟨quinticF20Spec_H, quinticF20Spec_Φ⟩

example : Nat.card {σ : Equiv.Perm (Fin 5) //
    MvPolynomial.rename (⇑σ) quinticF20Invariant = quinticF20Invariant} = 20 := by
  rw [← natCard_referenceSubgroup_five_two]
  exact Nat.card_congr (Equiv.subtypeEquivRight rename_quinticF20Invariant_eq_self_iff)

example : (renameOrbit quinticF20Invariant).card = 6 :=
  card_renameOrbit_quinticF20Invariant

/-- **`resolventSextic f`** is the specialization of that specification over `ℤ`: monic of
degree six with integer coefficients. -/
example (f : ℤ[X]) : resolventSextic f = quinticF20Spec.specialize ℤ f :=
  resolventSextic_def f

example (f : ℤ[X]) : (resolventSextic f).Monic ∧ (resolventSextic f).natDegree = 6 :=
  ⟨monic_resolventSextic f, natDegree_resolventSextic f⟩

/-- **The acceptance test against Dummit's (2′)** for `x⁵ + ax + b`. -/
example (a b : ℤ) :
    resolventSextic (X ^ 5 + C a * X + C b) =
      X ^ 6 + C (8 * a) * X ^ 5 + C (40 * a ^ 2) * X ^ 4 + C (160 * a ^ 3) * X ^ 3 +
        C (400 * a ^ 4) * X ^ 2 + C (512 * a ^ 5 - 3125 * b ^ 4) * X +
        C (256 * a ^ 6 - 9375 * a * b ^ 4) :=
  resolventSextic_X_pow_five_add_C_mul_X_add_C a b

/-- The values the roadmap uses: `x⁵ − 2` has sextic `X⁶ − 50000X`, with root `0`. -/
example : resolventSextic (X ^ 5 - C 2) = X ^ 6 - C 50000 * X := by
  rw [resolventSextic_X_pow_five_sub_C]
  norm_num

/-- `x⁵ − 5x − 12` has sextic root `40`. -/
example : (resolventSextic (X ^ 5 - 5 * X - 12)).IsRoot 40 :=
  isRoot_resolventSextic_X_pow_five_sub_five_mul_X_sub_twelve

variable {F : Type*} [Field F] {f : F[X]}

/-- A polynomial splits in its own splitting field, as the `Fact` that `galActionHom` asks for. -/
local instance factSplitsSplittingFieldL4 (p : F[X]) :
    Fact ((p.map (algebraMap F p.SplittingField)).Splits) :=
  ⟨IsSplittingField.splits p.SplittingField p⟩

/-- **The criterion, on the group side.** For an irreducible quintic, `Group.IsSolvable f.Gal`
holds if and only if the Galois image is conjugate into `F₂₀`. No characteristic hypothesis is
needed. The README writes `IsSolvable`, which Mathlib now deprecates in favour of
`Group.IsSolvable`. -/
example (hirr : Irreducible f) (e : f.rootSet f.SplittingField ≃ Fin 5) :
    Group.IsSolvable f.Gal ↔
      ∃ τ : Equiv.Perm (Fin 5),
        (Gal.galActionHom f f.SplittingField).range.map e.permCongrHom.toMonoidHom ≤
          (referenceSubgroup 5 ⟨2, by simp⟩).map (MulAut.conj τ).toMonoidHom := by
  let G : Subgroup (Equiv.Perm (Fin 5)) :=
    (Gal.galActionHom f f.SplittingField).range.map e.permCongrHom.toMonoidHom
  have : IsPretransitive G (Fin 5) :=
    (Equiv.isPretransitive_map_permCongrHom_iff e _).2
      (isPretransitive_range_galActionHom f.SplittingField hirr)
  have hgal : Group.IsSolvable f.Gal ↔ Group.IsSolvable G :=
    MulEquiv.isSolvable_congr <|
      (MonoidHom.ofInjective (Gal.galActionHom_injective f f.SplittingField)).trans
        (e.permCongrHom.subgroupMap _)
  rw [hgal]
  exact isSolvable_iff_exists_le_map_conj_referenceSubgroup_five_two G

/-- **The criterion, with separation evidence**: `Group.IsSolvable f.Gal` holds if and only if the
specialized sextic has a root in `F`. -/
example (hf : f.Monic) (hsep : f.Separable) (hirr : Irreducible f) (hdeg : f.natDegree = 5)
    (hres : (quinticF20Spec.specialize F f).Separable) :
    Group.IsSolvable f.Gal ↔ ∃ a : F, (quinticF20Spec.specialize F f).IsRoot a :=
  isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec hf hsep hirr hdeg hres

/-- The direction from solvability to a root needs no separation evidence. -/
example (hf : f.Monic) (hsep : f.Separable) (hirr : Irreducible f) (hdeg : f.natDegree = 5)
    (hsol : Group.IsSolvable f.Gal) : ∃ a : F, (quinticF20Spec.specialize F f).IsRoot a :=
  exists_isRoot_specialize_quinticF20Spec_of_isSolvable hf hsep hirr hdeg hsol

end Quintic

/-! ### Linear resolvents -/

section PairSum

/-- **The pair-sum specification**: the stabilizer of `x₀ + x₁` is `S_{{0,1}} × S_{{2,3,4}}`,
pinned by generators, of order 12, and the symbolic orbit has exactly ten elements. -/
example : quinticPairSumSpec.Φ = MvPolynomial.X 0 + MvPolynomial.X 1 ∧
    quinticPairSumSpec.H =
      Subgroup.closure {Equiv.swap (0 : Fin 5) 1, Equiv.swap 2 3, Equiv.swap 3 4} := by
  rw [quinticPairSumSpec_H, quinticPairSumStabilizer_eq_closure]
  exact ⟨quinticPairSumSpec_Φ, rfl⟩

example : Nat.card quinticPairSumStabilizer = 12 := by
  rw [@Nat.card_eq_fintype_card _ (Fintype.ofFinite _), card_quinticPairSumStabilizer]

example : (renameOrbit (MvPolynomial.X 0 + MvPolynomial.X 1 : MvPolynomial (Fin 5) ℤ)).card =
    10 :=
  card_renameOrbit_quinticPairSumInvariant

end PairSum

end Layer4


/-! ## Layer 6: transitive subgroups of `Sₙ` for `n ≤ 5`, and the label predicates -/

section Layer6

open TauCeti Polynomial Equiv Equiv.Perm MulAction

/-! ### The data model -/

/-- **`numTransitiveGroups`** takes the values `1, 1, 2, 5, 5` in degrees one to five and is `0`
outside that range. -/
example : numTransitiveGroups 0 = 0 ∧ numTransitiveGroups 1 = 1 ∧ numTransitiveGroups 2 = 1 ∧
    numTransitiveGroups 3 = 2 ∧ numTransitiveGroups 4 = 5 ∧ numTransitiveGroups 5 = 5 :=
  ⟨rfl, rfl, rfl, rfl, rfl, rfl⟩

example {n : ℕ} (hn : 5 < n) : numTransitiveGroups n = 0 :=
  numTransitiveGroups_eq_zero_of_five_lt hn

/-- **A label index is valid by construction**: `TransitiveGroupIndex n` is
`Fin (numTransitiveGroups n)`, and an index forces `0 < n`. -/
example (n : ℕ) : TransitiveGroupIndex n = Fin (numTransitiveGroups n) := rfl

example {n : ℕ} (j : TransitiveGroupIndex n) : 0 < n := pos_of_transitiveGroupIndex j

/-- **`TransitiveGroupLabel j G`** says that some element of `Equiv.Perm (Fin n)` conjugates `G`
onto `referenceSubgroup n j`. -/
example {n : ℕ} (j : TransitiveGroupIndex n) (G : Subgroup (Perm (Fin n))) :
    TransitiveGroupLabel j G ↔
      ∃ σ : Perm (Fin n), G.map (MulAut.conj σ).toMonoidHom = referenceSubgroup n j :=
  Iff.rfl

/-! ### The reference subgroups, row by row

The generators are the LMFDB ones, transcribed to `0`-based cycle notation: `finRotate n` is the
cycle `(0 1 ⋯ n-1)`. The rows `3T2`, `4T4`, `4T5`, `5T4` and `5T5` are the alternating and
symmetric groups themselves, `4T2` is the normal Klein four-subgroup of `A₄`, and each named
group of the table is identified explicitly. -/

/-- `1T1` and `2T1`: the whole symmetric group, of orders `1` and `2`. -/
example (j : TransitiveGroupIndex 1) : referenceSubgroup 1 j = ⊤ := referenceSubgroup_one j

example (j : TransitiveGroupIndex 2) : referenceSubgroup 2 j = ⊤ := referenceSubgroup_two j

example : Nat.card (referenceSubgroup 1 ⟨0, by simp⟩) = 1 ∧
    Nat.card (referenceSubgroup 2 ⟨0, by simp⟩) = 2 :=
  ⟨natCard_referenceSubgroup_index_zero _, natCard_referenceSubgroup_index_zero _⟩

/-- `3T1 = C₃ = A₃`, generated by `(0 1 2)`, of order `3`. -/
example : referenceSubgroup 3 ⟨0, by simp⟩ = Subgroup.closure {finRotate 3} ∧
    Subgroup.closure {finRotate 3} = alternatingGroup (Fin 3) ∧
    Nat.card (referenceSubgroup 3 ⟨0, by simp⟩) = 3 :=
  ⟨referenceSubgroup_three_zero, closure_finRotate_three_eq_alternatingGroup,
    natCard_referenceSubgroup_three_zero⟩

/-- `3T2 = S₃`, of order `6`. -/
example : referenceSubgroup 3 ⟨1, by simp⟩ = ⊤ ∧ Nat.card (referenceSubgroup 3 ⟨1, by simp⟩) = 6 :=
  ⟨referenceSubgroup_three_one, natCard_referenceSubgroup_three_one⟩

/-- `4T1 = C₄`, generated by `(0 1 2 3)`, isomorphic to `ℤ/4`. -/
example : referenceSubgroup 4 ⟨0, by simp⟩ = Subgroup.closure {finRotate 4} ∧
    Nat.card (referenceSubgroup 4 ⟨0, by simp⟩) = 4 :=
  ⟨referenceSubgroup_four_zero, natCard_referenceSubgroup_four_zero⟩

noncomputable example : referenceSubgroup 4 ⟨0, by simp⟩ ≃* Multiplicative (ZMod 4) :=
  referenceSubgroupIndexZeroMulEquivZMod (by simp)

/-- `4T2 = V₄`: the Klein four-subgroup of `A₄`, a Klein four-group of order `4`. -/
example : referenceSubgroup 4 ⟨1, by simp⟩ =
    (alternatingGroup.kleinFour (Fin 4)).map (alternatingGroup (Fin 4)).subtype :=
  referenceSubgroup_four_one

example : IsKleinFour (referenceSubgroup 4 ⟨1, by simp⟩) ∧
    Nat.card (referenceSubgroup 4 ⟨1, by simp⟩) = 4 :=
  ⟨inferInstance, natCard_referenceSubgroup_four_one⟩

/-- `4T3 = D₄`, generated by `(0 1 2 3)` and `(0 2)`: the stabilizer of the pairing
`{{0, 2}, {1, 3}}`, isomorphic to `DihedralGroup 4`, of order `8`. -/
example : referenceSubgroup 4 ⟨2, by simp⟩ = Subgroup.closure {finRotate 4, swap 0 2} ∧
    Nat.card (referenceSubgroup 4 ⟨2, by simp⟩) = 8 :=
  ⟨referenceSubgroup_four_two, natCard_referenceSubgroup_four_two⟩

example {σ : Perm (Fin 4)} :
    σ ∈ referenceSubgroup 4 ⟨2, by simp⟩ ↔ ∀ i, σ (i + 2) = σ i + 2 :=
  mem_referenceSubgroup_four_two_iff

noncomputable example : referenceSubgroup 4 ⟨2, by simp⟩ ≃* DihedralGroup 4 :=
  referenceSubgroupFourTwoMulEquivDihedralGroup

/-- `4T4 = A₄` and `4T5 = S₄`, of orders `12` and `24`. -/
example : referenceSubgroup 4 ⟨3, by simp⟩ = alternatingGroup (Fin 4) ∧
    referenceSubgroup 4 ⟨4, by simp⟩ = ⊤ ∧
    Nat.card (referenceSubgroup 4 ⟨3, by simp⟩) = 12 ∧
    Nat.card (referenceSubgroup 4 ⟨4, by simp⟩) = 24 :=
  ⟨referenceSubgroup_four_three, referenceSubgroup_four_four,
    natCard_referenceSubgroup_four_three, natCard_referenceSubgroup_four_four⟩

/-- `5T1 = C₅`, generated by `(0 1 2 3 4)`, isomorphic to `ℤ/5`. -/
example : referenceSubgroup 5 ⟨0, by simp⟩ = Subgroup.closure {finRotate 5} ∧
    Nat.card (referenceSubgroup 5 ⟨0, by simp⟩) = 5 :=
  ⟨referenceSubgroup_five_zero, natCard_referenceSubgroup_five_zero⟩

noncomputable example : referenceSubgroup 5 ⟨0, by simp⟩ ≃* Multiplicative (ZMod 5) :=
  referenceSubgroupIndexZeroMulEquivZMod (by simp)

/-- `5T2 = D₅`, generated by `(0 1 2 3 4)` and `(0 3)(1 2)`, isomorphic to `DihedralGroup 5`, of
order `10`. -/
example : referenceSubgroup 5 ⟨1, by simp⟩ =
      Subgroup.closure {finRotate 5, swap 0 3 * swap 1 2} ∧
    Nat.card (referenceSubgroup 5 ⟨1, by simp⟩) = 10 :=
  ⟨referenceSubgroup_five_one, natCard_referenceSubgroup_five_one⟩

noncomputable example : referenceSubgroup 5 ⟨1, by simp⟩ ≃* DihedralGroup 5 :=
  referenceSubgroupFiveOneMulEquivDihedralGroup

/-- `5T3 = F₂₀ = AGL(1, 5)`, generated by `(0 1 2 3 4)` and `(0 1 3 2)`, of order `20`. -/
example : referenceSubgroup 5 ⟨2, by simp⟩ =
      Subgroup.closure {finRotate 5, [0, 1, 3, 2].formPerm} ∧
    Nat.card (referenceSubgroup 5 ⟨2, by simp⟩) = 20 :=
  ⟨referenceSubgroup_five_two, natCard_referenceSubgroup_five_two⟩

noncomputable example : referenceSubgroup 5 ⟨2, by simp⟩ ≃* AffineGroup (ZMod 5) :=
  referenceSubgroupFiveTwoMulEquivAffineGroup

/-- `5T4 = A₅` and `5T5 = S₅`, of orders `60` and `120`. -/
example : referenceSubgroup 5 ⟨3, by simp⟩ = alternatingGroup (Fin 5) ∧
    referenceSubgroup 5 ⟨4, by simp⟩ = ⊤ ∧
    Nat.card (referenceSubgroup 5 ⟨3, by simp⟩) = 60 ∧
    Nat.card (referenceSubgroup 5 ⟨4, by simp⟩) = 120 :=
  ⟨referenceSubgroup_five_three, referenceSubgroup_five_four,
    natCard_referenceSubgroup_five_three, natCard_referenceSubgroup_five_four⟩

/-- **The parity column**: the even rows are `1T1`, `3T1`, `4T2`, `4T4`, `5T1`, `5T2` and `5T4`. -/
example {n : ℕ} (j : TransitiveGroupIndex n) :
    referenceSubgroup n j ≤ alternatingGroup (Fin n) ↔
      n = 1 ∨ (n = 3 ∧ (j : ℕ) = 0) ∨ (n = 4 ∧ ((j : ℕ) = 1 ∨ (j : ℕ) = 3)) ∨
        (n = 5 ∧ ((j : ℕ) = 0 ∨ (j : ℕ) = 1 ∨ (j : ℕ) = 3)) :=
  referenceSubgroup_le_alternatingGroup_iff j

/-- **The primitivity column**: every row is primitive except `4T1`, `4T2` and `4T3`. -/
example {n : ℕ} (j : TransitiveGroupIndex n) :
    IsPreprimitive (referenceSubgroup n j) (Fin n) ↔ n ≠ 4 ∨ 3 ≤ (j : ℕ) :=
  isPreprimitive_referenceSubgroup_iff j

/-- **The solvability column**: every row is solvable except `5T4` and `5T5`. -/
example {n : ℕ} (j : TransitiveGroupIndex n) :
    Group.IsSolvable (referenceSubgroup n j) ↔ n ≠ 5 ∨ (j : ℕ) < 3 :=
  isSolvable_referenceSubgroup_iff j

/-! ### The label API -/

/-- **Every reference subgroup is transitive**, proved once. -/
example (n : ℕ) (j : TransitiveGroupIndex n) : IsPretransitive (referenceSubgroup n j) (Fin n) :=
  isPretransitive_referenceSubgroup n j

/-- So a labelled subgroup is transitive, and the label predicate needs no transitivity
clause. -/
example {n : ℕ} {j : TransitiveGroupIndex n} {G : Subgroup (Perm (Fin n))}
    (h : TransitiveGroupLabel j G) : IsPretransitive G (Fin n) :=
  h.isPretransitive

/-- **Comparison lemmas**: a labelled subgroup has the order, parity, primitivity and
solvability of its reference subgroup. -/
example {n : ℕ} {j : TransitiveGroupIndex n} {G : Subgroup (Perm (Fin n))}
    (h : TransitiveGroupLabel j G) :
    Nat.card G = Nat.card (referenceSubgroup n j) ∧
      (G ≤ alternatingGroup (Fin n) ↔ referenceSubgroup n j ≤ alternatingGroup (Fin n)) ∧
      (IsPreprimitive G (Fin n) ↔ IsPreprimitive (referenceSubgroup n j) (Fin n)) ∧
      (Group.IsSolvable G ↔ Group.IsSolvable (referenceSubgroup n j)) :=
  ⟨h.natCard_eq, h.le_alternatingGroup_iff, h.isPreprimitive_iff, h.isSolvable_iff⟩

/-- **Naturality**: the label is invariant under conjugation of `G`. -/
example {n : ℕ} {j : TransitiveGroupIndex n} (G : Subgroup (Perm (Fin n))) (σ : Perm (Fin n)) :
    TransitiveGroupLabel j (G.map (MulAut.conj σ)) ↔ TransitiveGroupLabel j G :=
  transitiveGroupLabel_map_conj_iff G σ

/-- **Naturality**: the label is invariant under transport along an equivalence `Fin n ≃ Fin n`
(and, more generally, does not depend on the numbering of any `n`-element set). -/
example {n : ℕ} {j : TransitiveGroupIndex n} (G : Subgroup (Perm (Fin n))) (e : Fin n ≃ Fin n) :
    TransitiveGroupLabel j (G.map e.permCongrHom.toMonoidHom) ↔ TransitiveGroupLabel j G := by
  rw [Subgroup.transitiveGroupLabel_map_permCongrHom_iff G e (Equiv.refl _)]
  have : (Equiv.refl (Fin n)).permCongrHom.toMonoidHom = MonoidHom.id (Perm (Fin n)) := by
    ext; simp
  rw [this, Subgroup.map_id]

/-- **Edge cases** `n = 0` and `n = 1`: there is no index in degree `0`, and in degree `1` every
subgroup has the label `1T1`. -/
example : IsEmpty (TransitiveGroupIndex 0) := by
  rw [TransitiveGroupIndex, numTransitiveGroups_zero]
  infer_instance

example (j : TransitiveGroupIndex 1) (G : Subgroup (Perm (Fin 1))) : TransitiveGroupLabel j G :=
  transitiveGroupLabel_one j G

/-! ### `HasGaloisLabel` -/

section HasGaloisLabel

variable {F : Type*} [Field F]

/-- A polynomial splits in its own splitting field, recorded as the `Fact` that
`Polynomial.Gal.galActionHom` asks for. -/
local instance factSplitsSplittingFieldLabel (f : F[X]) :
    Fact ((f.map (algebraMap F f.SplittingField)).Splits) :=
  ⟨SplittingField.splits f⟩

/-- **`HasGaloisLabel f j`** says that `f` is separable of degree `n` and that some numbering of
its root set carries the Galois image to a subgroup with label `j`. -/
example (f : F[X]) {n : ℕ} (j : TransitiveGroupIndex n) :
    HasGaloisLabel f j ↔ f.Separable ∧ f.natDegree = n ∧
      ∃ e : f.rootSet f.SplittingField ≃ Fin n,
        TransitiveGroupLabel j
          ((Gal.galActionHom f f.SplittingField).range.map e.permCongrHom.toMonoidHom) :=
  Iff.rfl

/-- **Independence of the numbering**: if one numbering exhibits the label, every numbering
does. -/
example (f : F[X]) {n : ℕ} (j : TransitiveGroupIndex n) :
    HasGaloisLabel f j ↔ f.Separable ∧ f.natDegree = n ∧
      ∀ e : f.rootSet f.SplittingField ≃ Fin n,
        TransitiveGroupLabel j
          ((Gal.galActionHom f f.SplittingField).range.map e.permCongrHom.toMonoidHom) :=
  hasGaloisLabel_iff_forall

open scoped Classical in
/-- **Comparison lemmas**: a label gives the order, the parity, the primitivity and the
solvability of `f.Gal`; primitivity of the abstract action of `f.Gal` is below. -/
example {f : F[X]} {n : ℕ} {j : TransitiveGroupIndex n} (h : HasGaloisLabel f j) :
    Nat.card f.Gal = Nat.card (referenceSubgroup n j) ∧
      ((Gal.galActionHom f f.SplittingField).range ≤
          alternatingGroup (f.rootSet f.SplittingField) ↔
        referenceSubgroup n j ≤ alternatingGroup (Fin n)) ∧
      (IsPreprimitive (Gal.galActionHom f f.SplittingField).range (f.rootSet f.SplittingField) ↔
        IsPreprimitive (referenceSubgroup n j) (Fin n)) ∧
      (Group.IsSolvable f.Gal ↔ Group.IsSolvable (referenceSubgroup n j)) :=
  ⟨h.natCard_gal, h.range_le_alternatingGroup_iff, h.isPreprimitive_iff, h.isSolvable_iff⟩

/-- **Edge cases**: an inseparable polynomial, and a polynomial of the wrong degree, have no
label. -/
example {f : F[X]} {n : ℕ} (j : TransitiveGroupIndex n) (hf : ¬ f.Separable) :
    ¬ HasGaloisLabel f j :=
  not_hasGaloisLabel_of_not_separable hf

example {f : F[X]} {n : ℕ} (j : TransitiveGroupIndex n) (hf : f.natDegree ≠ n) :
    ¬ HasGaloisLabel f j :=
  not_hasGaloisLabel_of_natDegree_ne hf

/-- A labelled polynomial is irreducible: reducible polynomials carry no label. -/
example {f : F[X]} {n : ℕ} {j : TransitiveGroupIndex n} (h : HasGaloisLabel f j) :
    Irreducible f :=
  h.irreducible

end HasGaloisLabel

/-- Primitivity of `f.Gal` on the roots, for its intrinsic action, is that of the reference
subgroup. -/
example {F : Type*} [Field F] {f : F[X]} {n : ℕ} {j : TransitiveGroupIndex n}
    (h : HasGaloisLabel f j) :
    IsPreprimitive f.Gal (f.rootSet f.SplittingField) ↔
      IsPreprimitive (referenceSubgroup n j) (Fin n) :=
  h.isPreprimitive_gal_iff

/-! ### The classification theorems -/

/-- **Degrees 1 and 2.** Every subgroup of `S₁` is `1T1`; a subgroup of `S₂` is `2T1` exactly when
it is transitive. -/
example (G : Subgroup (Perm (Fin 1))) : ∃! j : TransitiveGroupIndex 1, TransitiveGroupLabel j G :=
  ⟨⟨0, by simp⟩, transitiveGroupLabel_one _ G, fun j _ =>
    Fin.ext (by have := j.isLt; simp only [numTransitiveGroups_one] at this; simp; omega)⟩

example (G : Subgroup (Perm (Fin 2))) [IsPretransitive G (Fin 2)] :
    ∃! j : TransitiveGroupIndex 2, TransitiveGroupLabel j G :=
  ⟨⟨0, by simp⟩, (transitiveGroupLabel_two_iff _ G).mpr inferInstance,
    fun j _ =>
      Fin.ext (by have := j.isLt; simp only [numTransitiveGroups_two] at this; simp; omega)⟩

/-- **Degrees 3, 4 and 5.** Every transitive subgroup is conjugate to exactly one reference
subgroup. -/
example (G : Subgroup (Perm (Fin 3))) [IsPretransitive G (Fin 3)] :
    ∃! j, TransitiveGroupLabel j G :=
  existsUnique_transitiveGroupLabel_three G

example (G : Subgroup (Perm (Fin 4))) [IsPretransitive G (Fin 4)] :
    ∃! j, TransitiveGroupLabel j G :=
  existsUnique_transitiveGroupLabel_four G

example (G : Subgroup (Perm (Fin 5))) [IsPretransitive G (Fin 5)] :
    ∃! j, TransitiveGroupLabel j G :=
  existsUnique_transitiveGroupLabel_five G

/-- **Disjointness**: no two reference subgroups of degree five are conjugate (and likewise in
degrees three and four). -/
example {j k : TransitiveGroupIndex 5} {G : Subgroup (Perm (Fin 5))}
    (hj : TransitiveGroupLabel j G) (hk : TransitiveGroupLabel k G) : j = k :=
  hj.eq_of_five hk

example {j k : TransitiveGroupIndex 4} {G : Subgroup (Perm (Fin 4))}
    (hj : TransitiveGroupLabel j G) (hk : TransitiveGroupLabel k G) : j = k :=
  hj.eq_of_four hk

example {j k : TransitiveGroupIndex 3} {G : Subgroup (Perm (Fin 3))}
    (hj : TransitiveGroupLabel j G) (hk : TransitiveGroupLabel k G) : j = k :=
  hj.eq_of_three hk

/-- **Degree 4, the order-8 step**: the transitive subgroup `4T3` is a Sylow 2-subgroup of
`S₄`, realized as the wreath product `C₂ ≀ C₂`. -/
example : TransitiveGroupLabel (⟨2, by simp⟩ : TransitiveGroupIndex 4)
    wreathTwoToPermFour.range :=
  transitiveGroupLabel_wreathTwoToPermFour

/-- **Degree 5, step 1**: the number of Sylow 5-subgroups of a subgroup of `S₅` is `1` or `6`. -/
example (G : Subgroup (Perm (Fin 5))) :
    Nat.card (Sylow 5 G) = 1 ∨ Nat.card (Sylow 5 G) = 6 :=
  card_sylow_five_eq_one_or_six (by simp) G

/-- **Degree 5, step 2**: if it is `1`, then `G` lies in the normalizer of a Sylow 5-subgroup of
`S₅`, and the normalizer of the reference `C₅` is the reference `F₂₀`. -/
example (G : Subgroup (Perm (Fin 5))) (h5 : 5 ∣ Nat.card G) (h1 : Nat.card (Sylow 5 G) = 1) :
    ∃ P : Sylow 5 (Perm (Fin 5)), (P : Subgroup (Perm (Fin 5))) ≤ G ∧
      G ≤ Subgroup.normalizer (P : Set (Perm (Fin 5))) :=
  exists_sylow_le_le_normalizer_of_card_sylow_five_eq_one (by simp) G h5 h1

example : referenceSubgroup 5 ⟨2, by simp⟩ =
    Subgroup.normalizer (referenceSubgroup 5 ⟨0, by simp⟩ : Set (Perm (Fin 5))) :=
  referenceSubgroup_five_two_eq_normalizer_referenceSubgroup_five_zero

/-- **Degree 5, step 3**: if the number of Sylow 5-subgroups is `6`, then `6` and `5` both
divide `|G|`, so `30` divides `|G|`. -/
example (G : Subgroup (Perm (Fin 5))) (h5 : 5 ∣ Nat.card G)
    (h6 : Nat.card (Sylow 5 G) = 6) : 30 ∣ Nat.card G := by
  have : Fact (Nat.Prime 5) := ⟨by norm_num⟩
  obtain ⟨P⟩ := (inferInstance : Nonempty (Sylow 5 G))
  have h6' : 6 ∣ Nat.card G :=
    h6 ▸ P.card_dvd_index.trans (P : Subgroup G).index_dvd_card
  exact (by norm_num : Nat.Coprime 5 6).mul_dvd_of_dvd_of_dvd h5 h6'

/-- **Degree 5, steps 4 and 5**: a subgroup of `S₅` of order divisible by `30` is `A₅` or `S₅`; in
particular `S₅` has no subgroup of order `30`. -/
example (G : Subgroup (Perm (Fin 5))) (h30 : 30 ∣ Nat.card G) :
    G = alternatingGroup (Fin 5) ∨ G = ⊤ := by
  have h := eq_alternatingGroup_or_eq_top_of_thirty_dvd_natCard (by simp) G h30
  convert h

example (G : Subgroup (Perm (Fin 5))) : Nat.card G ≠ 30 := by
  intro h
  have := natCard_mem_of_five_dvd_natCard (α := Fin 5) (by simp) G (by rw [h]; norm_num)
  simp [h] at this

/-! ### Order recognizes the label -/

/-- **Degree 5**: a transitive subgroup has order in `{5, 10, 20, 60, 120}`, and the order
determines the label. -/
example (G : Subgroup (Perm (Fin 5))) [IsPretransitive G (Fin 5)] :
    Nat.card G ∈ ({5, 10, 20, 60, 120} : Finset ℕ) :=
  natCard_mem_of_natCard_eq_five_of_isPretransitive (by simp) G

example (j : TransitiveGroupIndex 5) (G : Subgroup (Perm (Fin 5))) [IsPretransitive G (Fin 5)] :
    TransitiveGroupLabel j G ↔ Nat.card G = Nat.card (referenceSubgroup 5 j) :=
  transitiveGroupLabel_five_iff_natCard_eq j G

/-- **Degree 3**: the order determines the label. -/
example (j : TransitiveGroupIndex 3) (G : Subgroup (Perm (Fin 3))) [IsPretransitive G (Fin 3)] :
    TransitiveGroupLabel j G ↔ Nat.card G = Nat.card (referenceSubgroup 3 j) :=
  transitiveGroupLabel_three_iff_natCard_eq j G

/-- **Degree 4**: the order determines the label except at order 4, where `IsCyclic` separates
`4T1 = C₄` from `4T2 = V₄`. -/
example (j : TransitiveGroupIndex 4) (hj : 2 ≤ (j : ℕ)) (G : Subgroup (Perm (Fin 4)))
    [IsPretransitive G (Fin 4)] :
    TransitiveGroupLabel j G ↔ Nat.card G = Nat.card (referenceSubgroup 4 j) :=
  transitiveGroupLabel_four_iff_natCard_eq_of_two_le j hj G

example (G : Subgroup (Perm (Fin 4))) [IsPretransitive G (Fin 4)] :
    (TransitiveGroupLabel (⟨0, by simp⟩ : TransitiveGroupIndex 4) G ↔
        Nat.card G = 4 ∧ IsCyclic G) ∧
      (TransitiveGroupLabel (⟨1, by simp⟩ : TransitiveGroupIndex 4) G ↔
        Nat.card G = 4 ∧ ¬ IsCyclic G) :=
  ⟨transitiveGroupLabel_four_zero_iff G, transitiveGroupLabel_four_one_iff G⟩

/-- **The false generalization in degree 4**: `4T1` and `4T2` both have order `4`, and they are
not conjugate, because one is cyclic and the other is not. -/
example : Nat.card (referenceSubgroup 4 ⟨0, by simp⟩) = 4 ∧
    Nat.card (referenceSubgroup 4 ⟨1, by simp⟩) = 4 ∧
    IsCyclic (referenceSubgroup 4 ⟨0, by simp⟩) ∧
    ¬ IsCyclic (referenceSubgroup 4 ⟨1, by simp⟩) ∧
    ¬ TransitiveGroupLabel (⟨1, by simp⟩ : TransitiveGroupIndex 4)
      (referenceSubgroup 4 ⟨0, by simp⟩) :=
  ⟨natCard_referenceSubgroup_four_zero, natCard_referenceSubgroup_four_one,
    isCyclic_referenceSubgroup_index_zero _, not_isCyclic_referenceSubgroup_four_one,
    fun h => by
      have := (transitiveGroupLabel_referenceSubgroup 4 ⟨0, by simp⟩).eq_of_four h
      simp [Fin.ext_iff] at this⟩

/-- **Two transitive subgroups of `S₅` of the same order are conjugate.** -/
example (G H : Subgroup (Perm (Fin 5))) [IsPretransitive G (Fin 5)]
    [IsPretransitive H (Fin 5)] (h : Nat.card G = Nat.card H) :
    ∃ g : Perm (Fin 5), G.map (MulAut.conj g).toMonoidHom = H := by
  obtain ⟨j, hj⟩ := exists_transitiveGroupLabel_five G
  have hk : TransitiveGroupLabel j H :=
    (transitiveGroupLabel_five_iff_natCard_eq j H).mpr (h ▸ hj.natCard_eq)
  obtain ⟨σ, hσ⟩ := hj
  obtain ⟨τ, hτ⟩ := hk
  refine ⟨τ⁻¹ * σ, ?_⟩
  calc G.map (MulAut.conj (τ⁻¹ * σ)).toMonoidHom
      = (G.map (MulAut.conj σ).toMonoidHom).map (MulAut.conj τ⁻¹).toMonoidHom := by
        rw [Subgroup.map_map]; congr 1
    _ = (H.map (MulAut.conj τ).toMonoidHom).map (MulAut.conj τ⁻¹).toMonoidHom := by
        rw [hσ, hτ]
    _ = H := by
        rw [Subgroup.map_map]
        convert Subgroup.map_id H
        ext; simp

/-! ### Recognition by order in degree 5 -/

/-- A transitive `G ≤ S₅` that contains an element of order 6 is `S₅`; a transitive `G ≤ S₅`
that contains an element of order 3 contains `A₅` (parity is not needed). -/
example {G : Subgroup (Perm (Fin 5))} (hG : IsPretransitive G (Fin 5)) {σ : Perm (Fin 5)}
    (hσ : orderOf σ = 6) (hg : σ ∈ G) : G = ⊤ :=
  subgroup_eq_top_of_isPretransitive_of_orderOf_eq_six (by simp) hG hσ hg

example {G : Subgroup (Perm (Fin 5))} (hG : IsPretransitive G (Fin 5)) {σ : Perm (Fin 5)}
    (hσ : orderOf σ = 3) (hg : σ ∈ G) : alternatingGroup (Fin 5) ≤ G :=
  alternatingGroup_le_of_isPretransitive_of_orderOf_eq_three (by simp) hG hσ hg


/-! ### Solvability and the labels in degree 5 -/

/-- **An irreducible quintic has `IsSolvable f.Gal` exactly when its label is `5T1`, `5T2` or
`5T3`.** This is about the group, not about `solvableByRad`. -/
example {F : Type*} [Field F] {f : F[X]} {j : TransitiveGroupIndex 5} (h : HasGaloisLabel f j) :
    Group.IsSolvable f.Gal ↔ (j : ℕ) < 3 :=
  h.isSolvable_iff_five

/-- Every separable irreducible quintic has exactly one label. -/
example {F : Type*} [Field F] {f : F[X]} (hsep : f.Separable) (hirr : Irreducible f)
    (hdeg : f.natDegree = 5) : ∃! j : TransitiveGroupIndex 5, HasGaloisLabel f j :=
  existsUnique_hasGaloisLabel_five hsep hirr hdeg

/-! ### Classification from the discriminant and the resolvents -/

section Package

variable {F : Type*} [Field F] {f : F[X]}

/-- **Degree 3.** Away from characteristic 2, an irreducible separable cubic has label `3T1` if
`f.discr` is a square and `3T2` if it is not. -/
example (hchar : ringChar F ≠ 2) :
    HasGaloisLabel f (⟨0, by simp⟩ : TransitiveGroupIndex 3) ↔
      f.Separable ∧ Irreducible f ∧ f.natDegree = 3 ∧ IsSquare f.discr :=
  hasGaloisLabel_three_zero_iff hchar

example (hchar : ringChar F ≠ 2) :
    HasGaloisLabel f (⟨1, by simp⟩ : TransitiveGroupIndex 3) ↔
      Irreducible f ∧ f.natDegree = 3 ∧ ¬ IsSquare f.discr :=
  hasGaloisLabel_three_one_iff hchar

/-- **Degree 4, the decision table read as labels.** Away from characteristic 2, for a monic
quartic with resolvent cubic `quarticD4Spec.specialize F f`: `4T5` (irreducible resolvent,
non-square discriminant), `4T4` (irreducible resolvent, square discriminant), `4T2` (square
discriminant and a root of the resolvent, equivalently the resolvent splits), and `4T1` or `4T3`
(non-square discriminant and a root of the resolvent). No separation evidence is needed. -/
example (hchar : ringChar F ≠ 2) (hf : f.Monic) :
    (HasGaloisLabel f (⟨4, by simp⟩ : TransitiveGroupIndex 4) ↔
      Irreducible f ∧ f.natDegree = 4 ∧ ¬ IsSquare f.discr ∧
        Irreducible (quarticD4Spec.specialize F f)) ∧
    (HasGaloisLabel f (⟨3, by simp⟩ : TransitiveGroupIndex 4) ↔
      Irreducible f ∧ f.natDegree = 4 ∧ IsSquare f.discr ∧
        Irreducible (quarticD4Spec.specialize F f)) ∧
    (HasGaloisLabel f (⟨1, by simp⟩ : TransitiveGroupIndex 4) ↔
      Irreducible f ∧ f.natDegree = 4 ∧ IsSquare f.discr ∧
        ∃ a : F, (quarticD4Spec.specialize F f).IsRoot a) ∧
    (HasGaloisLabel f (⟨1, by simp⟩ : TransitiveGroupIndex 4) ↔
      Irreducible f ∧ f.natDegree = 4 ∧ (quarticD4Spec.specialize F f).Splits) ∧
    ((HasGaloisLabel f (⟨0, by simp⟩ : TransitiveGroupIndex 4) ∨
        HasGaloisLabel f (⟨2, by simp⟩ : TransitiveGroupIndex 4)) ↔
      Irreducible f ∧ f.natDegree = 4 ∧ ¬ IsSquare f.discr ∧
        ∃ a : F, (quarticD4Spec.specialize F f).IsRoot a) :=
  ⟨hasGaloisLabel_four_four_iff hchar hf, hasGaloisLabel_four_three_iff hchar hf,
    hasGaloisLabel_four_one_iff hchar hf, hasGaloisLabel_four_one_iff_splits_resolvent hchar hf,
    hasGaloisLabel_four_zero_or_two_iff hchar hf⟩

/-- **Degree 4, the four rows are exhaustive**: an irreducible separable quartic has exactly one
label. -/
example (hsep : f.Separable) (hirr : Irreducible f) (hdeg : f.natDegree = 4) :
    ∃! j : TransitiveGroupIndex 4, HasGaloisLabel f j :=
  existsUnique_hasGaloisLabel_four hsep hirr hdeg

/-- **Degree 4, the last row**, separated over the discriminant field `F(√disc f)`, taken inside
any extension `E` containing a square root `δ` of the discriminant: `4T1` when `f` becomes
reducible there, `4T3` when it stays irreducible. -/
example (hchar : ringChar F ≠ 2) (hf : f.Monic) {E : Type*} [Field E] [Algebra F E] {δ : E}
    (hδ : δ ^ 2 = algebraMap F E f.discr) :
    (HasGaloisLabel f (⟨0, by simp⟩ : TransitiveGroupIndex 4) ↔
      Irreducible f ∧ f.natDegree = 4 ∧
        ¬ Irreducible (f.map (algebraMap F (discrField f E)))) ∧
    (HasGaloisLabel f (⟨2, by simp⟩ : TransitiveGroupIndex 4) ↔
      Irreducible f ∧ f.natDegree = 4 ∧ ¬ IsSquare f.discr ∧
        (∃ a : F, (quarticD4Spec.specialize F f).IsRoot a) ∧
          Irreducible (f.map (algebraMap F (discrField f E)))) :=
  ⟨hasGaloisLabel_four_zero_iff hchar hf hδ, hasGaloisLabel_four_two_iff hchar hf hδ⟩

/-- **Degree 5, what the discriminant and the sextic give**, for an irreducible quintic away from
characteristic 2: non-square discriminant and no root of the sextic give `5T5`; square
discriminant and no root give `5T4`; non-square discriminant, separation evidence and a root
give `5T3`; square discriminant, separation evidence and a root give `5T1` **or** `5T2`. -/
example (hchar : ringChar F ≠ 2) (hf : f.Monic) (hsep : f.Separable) (hirr : Irreducible f)
    (hdeg : f.natDegree = 5) :
    (¬ IsSquare f.discr → (∀ a : F, ¬ (quinticF20Spec.specialize F f).IsRoot a) →
      HasGaloisLabel f (⟨4, by simp⟩ : TransitiveGroupIndex 5)) ∧
    (IsSquare f.discr → (∀ a : F, ¬ (quinticF20Spec.specialize F f).IsRoot a) →
      HasGaloisLabel f (⟨3, by simp⟩ : TransitiveGroupIndex 5)) ∧
    (¬ IsSquare f.discr → (quinticF20Spec.specialize F f).Separable →
      (∃ a : F, (quinticF20Spec.specialize F f).IsRoot a) →
      HasGaloisLabel f (⟨2, by simp⟩ : TransitiveGroupIndex 5)) ∧
    (IsSquare f.discr → (quinticF20Spec.specialize F f).Separable →
      (∃ a : F, (quinticF20Spec.specialize F f).IsRoot a) →
      HasGaloisLabel f (⟨0, by simp⟩ : TransitiveGroupIndex 5) ∨
        HasGaloisLabel f (⟨1, by simp⟩ : TransitiveGroupIndex 5)) :=
  ⟨hasGaloisLabel_five_four_of_not_isSquare_discr_of_forall_not_isRoot hf hchar hirr hdeg,
    hasGaloisLabel_five_three_of_isSquare_discr_of_forall_not_isRoot hf hchar hsep hirr hdeg,
    fun hd hres ⟨_, ha⟩ =>
      hasGaloisLabel_five_two_of_not_isSquare_discr_of_isRoot hf hchar hirr hdeg hd hres ha,
    fun hd hres ⟨_, ha⟩ =>
      hasGaloisLabel_five_zero_or_one_of_isSquare_discr_of_isRoot hf hchar hsep hirr hdeg hd
        hres ha⟩

end Package

/-- **The fourth branch is genuinely undetermined.** `x⁵ + x⁴ − 4x³ − 3x² + 3x + 1` (label `5T1`)
and `x⁵ − 5x − 12` (label `5T2`) both have square discriminant, `121²` and `8000²`, and both have
a separable resolvent sextic with a rational root, at `−16` and at `40`. -/
theorem discriminant_and_sextic_do_not_distinguish_C5_D5 :
    (X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1 : ℤ[X]).discr = 121 ^ 2 ∧
      (X ^ 5 - 5 * X - 12 : ℤ[X]).discr = 8000 ^ 2 ∧
      (resolventSextic (X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1)).eval (-16) = 0 ∧
      (resolventSextic (X ^ 5 - 5 * X - 12)).eval 40 = 0 ∧
      (resolventSextic (X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1)).discr ≠ 0 ∧
      (resolventSextic (X ^ 5 - 5 * X - 12)).discr ≠ 0 ∧
      HasGaloisLabel ((X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1 : ℤ[X]).map
          (Int.castRingHom ℚ)) (⟨0, by simp⟩ : TransitiveGroupIndex 5) ∧
      HasGaloisLabel ((X ^ 5 - 5 * X - 12 : ℤ[X]).map (Int.castRingHom ℚ))
        (⟨1, by simp⟩ : TransitiveGroupIndex 5) :=
  TauCeti.discriminant_and_sextic_do_not_distinguish_C5_D5

/-! ### The degree-five certificate -/

/-- **`HasFactorDegrees f p t`**: `p` is a prime not dividing `f.discr`, and the factor degrees of
`f mod p` are `t`. Lower-bound evidence. -/
example (f : ℤ[X]) (p : ℕ) (t : Multiset ℕ) :
    HasFactorDegrees f p t ↔
      ∃ hp : p.Prime, ¬ (p : ℤ) ∣ f.discr ∧ @Polynomial.factorDegrees f p ⟨hp⟩ = t :=
  Iff.rfl

/-- **`HasSexticRoot f a`**: `a` is an integral root of the resolvent sextic, which has nonzero
discriminant (the separation evidence). Upper-bound evidence. -/
example (f : ℤ[X]) (a : ℤ) :
    HasSexticRoot f a ↔ (resolventSextic f).eval a = 0 ∧ (resolventSextic f).discr ≠ 0 :=
  Iff.rfl

/-- **`HasSecondRootInRootField f b`**: `b` represents a root of `f` in `ℚ[X]/(f)` other than the
class of `X`. -/
example (f : ℤ[X]) (b : ℚ[X]) :
    HasSecondRootInRootField f b ↔
      ((f.map (Int.castRingHom ℚ)).comp b) %ₘ (f.map (Int.castRingHom ℚ)) = 0 ∧
        b %ₘ (f.map (Int.castRingHom ℚ)) ≠ X %ₘ (f.map (Int.castRingHom ℚ)) :=
  Iff.rfl

/-- **`QuinticCertificate`**, one constructor per route, with the label each route claims. -/
example (p q : ℕ) (s a : ℤ) (b : ℚ[X]) :
    (QuinticCertificate.cyclic p b).label = ⟨0, by simp⟩ ∧
      (QuinticCertificate.dihedral p q s a).label = ⟨1, by simp⟩ ∧
      (QuinticCertificate.frobeniusF20 p a).label = ⟨2, by simp⟩ ∧
      (QuinticCertificate.alternating p q s).label = ⟨3, by simp⟩ ∧
      (QuinticCertificate.symmetric p q).label = ⟨4, by simp⟩ :=
  ⟨rfl, rfl, rfl, rfl, rfl⟩

/-- **`Verifies`**, the finite conditions of each route: every route starts with a good prime at
which `f` is irreducible. -/
example (f : ℤ[X]) (p q : ℕ) (s a : ℤ) (b : ℚ[X]) :
    ((QuinticCertificate.cyclic p b).Verifies f ↔
      HasFactorDegrees f p {5} ∧ HasSecondRootInRootField f b) ∧
    ((QuinticCertificate.dihedral p q s a).Verifies f ↔
      HasFactorDegrees f p {5} ∧ f.discr = s ^ 2 ∧ HasSexticRoot f a ∧
        HasFactorDegrees f q {1, 2, 2}) ∧
    ((QuinticCertificate.frobeniusF20 p a).Verifies f ↔
      HasFactorDegrees f p {5} ∧ ¬ IsSquare f.discr ∧ HasSexticRoot f a) ∧
    ((QuinticCertificate.alternating p q s).Verifies f ↔
      HasFactorDegrees f p {5} ∧ f.discr = s ^ 2 ∧ HasFactorDegrees f q {1, 1, 3}) ∧
    ((QuinticCertificate.symmetric p q).Verifies f ↔
      HasFactorDegrees f p {5} ∧ HasFactorDegrees f q {2, 3}) :=
  ⟨Iff.rfl, Iff.rfl, Iff.rfl, Iff.rfl, Iff.rfl⟩

/-- **`check`** is the Boolean decision of `Verifies`. -/
example (cert : QuinticCertificate) (f : ℤ[X]) : cert.check f = true ↔ cert.Verifies f :=
  QuinticCertificate.check_eq_true_iff

/-- **Soundness, and only soundness**: a certificate that checks proves its label. -/
example (f : ℤ[X]) (hf : f.Monic) (cert : QuinticCertificate) (h : cert.check f = true) :
    HasGaloisLabel (f.map (Int.castRingHom ℚ)) cert.label :=
  QuinticCertificate.check_sound hf h

/-- `X⁵ − X − 1` is irreducible modulo `3`. -/
private theorem factorDegrees_X_pow_five_sub_X_sub_one_three :
    (X ^ 5 - X - 1 : ℤ[X]).factorDegrees 3 = {5} := by
  rw [Polynomial.factorDegrees_eq_singleton_iff]
  have hmap : (X ^ 5 - X - 1 : ℤ[X]).map (Int.castRingHom (ZMod 3)) =
      (X ^ 5 - X - 1 : (ZMod 3)[X]) := by norm_num
  have hf : (X ^ 5 - X - 1 : (ZMod 3)[X]) = X ^ 5 + C 2 * X + C 2 := by
    have h3 : (3 : (ZMod 3)[X]) = 0 := by exact_mod_cast CharP.cast_eq_zero (ZMod 3)[X] 3
    rw [C_ofNat]
    linear_combination (-(X + 1)) * h3
  rw [hmap, hf]
  exact ⟨irreducible_X_pow_five_add_C_mul_X_add_C (by decide) (by decide), by compute_degree!⟩

/-- **The five acceptance certificates**, with the evidence of the README. -/
example :
    (QuinticCertificate.cyclic 2 (X ^ 2 - 2)).check
        (X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1) = true ∧
      (QuinticCertificate.dihedral 7 3 8000 40).check (X ^ 5 - 5 * X - 12) = true ∧
      (QuinticCertificate.frobeniusF20 11 0).check (X ^ 5 - 2) = true ∧
      (QuinticCertificate.alternating 3 7 32000).check (X ^ 5 + 20 * X - 16) = true ∧
      (QuinticCertificate.symmetric 3 2).check (X ^ 5 - X - 1) = true := by
  refine ⟨QuinticCertificate.check_X5_add_X4_sub_4X3_sub_3X2_add_3X_add_1,
    QuinticCertificate.check_X_pow_five_sub_five_mul_X_sub_twelve,
    QuinticCertificate.check_X_pow_five_sub_two,
    QuinticCertificate.check_X_pow_five_add_twenty_mul_X_sub_sixteen, ?_⟩
  -- The library's symmetric certificate uses the prime `5`; the README's uses `3`.
  have : Fact (Nat.Prime 3) := ⟨Nat.prime_three⟩
  have hf := monic_X_pow_five_sub_X_sub_one
  have h5 := QuinticCertificate.check_symmetric_X_pow_five_sub_X_sub_one
  rw [QuinticCertificate.check_eq_true_iff, QuinticCertificate.verifies_symmetric_iff] at h5 ⊢
  have hirr := (Polynomial.factorDegrees_eq_singleton_iff.mp
    factorDegrees_X_pow_five_sub_X_sub_one_three).1
  have hgood3 : IsGoodPrime (X ^ 5 - X - 1) 3 := (isGoodPrime_iff _ 3).mpr <|
    (hf.separable_map_zmod_iff_not_dvd_discr 3).mp (PerfectField.separable_of_irreducible hirr)
  exact ⟨HasFactorDegrees.mk hgood3 factorDegrees_X_pow_five_sub_X_sub_one_three, h5.2⟩

end Layer6


/-! ## Worked examples, as acceptance tests -/

section WorkedExamples

open TauCeti Polynomial

attribute [local instance] Polynomial.Gal.splits_ℚ_ℂ

local instance factPrimeSevenWorkedExamples : Fact (Nat.Prime 7) := ⟨by norm_num⟩

local instance factPrimeElevenWorkedExamples : Fact (Nat.Prime 11) := ⟨by norm_num⟩

private theorem ringChar_rat_ne_two : ringChar ℚ ≠ 2 := by
  rw [ringChar.eq_zero]; norm_num

/-! ### Degree 3 -/

/-- `x³ − 3x − 1` has discriminant `81 = 9²` and label `3T1 = C₃`; `x³ − 2` has discriminant
`−108`, not a square, and label `3T2 = S₃`. -/
example : (X ^ 3 - 3 * X - 1 : ℚ[X]).discr = 9 ^ 2 ∧
    HasGaloisLabel (X ^ 3 - 3 * X - 1 : ℚ[X]) (⟨0, by simp⟩ : TransitiveGroupIndex 3) ∧
    Nat.card (X ^ 3 - 3 * X - 1 : ℚ[X]).Gal = 3 :=
  ⟨by rw [discr_X_pow_three_sub_three_mul_X_sub_one]; norm_num,
    hasGaloisLabel_X_pow_three_sub_three_mul_X_sub_one,
    natCard_gal_X_pow_three_sub_three_mul_X_sub_one⟩

example : (X ^ 3 - 2 : ℚ[X]).discr = -108 ∧ ¬ IsSquare (X ^ 3 - 2 : ℚ[X]).discr ∧
    HasGaloisLabel (X ^ 3 - 2 : ℚ[X]) (⟨1, by simp⟩ : TransitiveGroupIndex 3) ∧
    Nat.card (X ^ 3 - 2 : ℚ[X]).Gal = 6 :=
  ⟨discr_X_pow_three_sub_two,
    ((hasGaloisLabel_three_one_iff ringChar_rat_ne_two).mp hasGaloisLabel_X_pow_three_sub_two).2.2,
    hasGaloisLabel_X_pow_three_sub_two, natCard_gal_X_pow_three_sub_two⟩

/-! ### Degree 4: the five quartic labels and every row of the decision table -/

/-- `x⁴ + x + 1`: resolvent cubic `X³ − 4X − 1`, irreducible; discriminant `229`, not a square;
label `4T5 = S₄`. -/
example : quarticD4Spec.specialize ℚ (X ^ 4 + X + 1) = X ^ 3 - 4 * X - 1 ∧
    Irreducible (X ^ 3 - 4 * X - 1 : ℚ[X]) ∧ (X ^ 4 + X + 1 : ℚ[X]).discr = 229 ∧
    ¬ IsSquare (X ^ 4 + X + 1 : ℚ[X]).discr ∧
    HasGaloisLabel (X ^ 4 + X + 1 : ℚ[X]) (⟨4, by simp⟩ : TransitiveGroupIndex 4) ∧
    Nat.card (X ^ 4 + X + 1 : ℚ[X]).Gal = 24 :=
  ⟨quarticD4Spec_specialize_X_pow_four_add_X_add_one,
    irreducible_X_pow_three_sub_four_mul_X_sub_one, discr_X_pow_four_add_X_add_one,
    ((hasGaloisLabel_four_four_iff ringChar_rat_ne_two (by monicity!)).mp
      hasGaloisLabel_X_pow_four_add_X_add_one).2.2.1,
    hasGaloisLabel_X_pow_four_add_X_add_one, natCard_gal_X_pow_four_add_X_add_one⟩

/-- `x⁴ + 8x + 12`: resolvent cubic `X³ − 48X − 64`, irreducible; discriminant
`331776 = 576²`; label `4T4 = A₄`. -/
example : quarticD4Spec.specialize ℚ (X ^ 4 + 8 * X + 12) = X ^ 3 - 48 * X - 64 ∧
    Irreducible (X ^ 3 - 48 * X - 64 : ℚ[X]) ∧
    (X ^ 4 + 8 * X + 12 : ℚ[X]).discr = 331776 ∧ (331776 : ℚ) = 576 ^ 2 ∧
    HasGaloisLabel (X ^ 4 + 8 * X + 12 : ℚ[X]) (⟨3, by simp⟩ : TransitiveGroupIndex 4) ∧
    Nat.card (X ^ 4 + 8 * X + 12 : ℚ[X]).Gal = 12 :=
  ⟨quarticD4Spec_specialize_X_pow_four_add_eight_mul_X_add_twelve,
    irreducible_X_pow_three_sub_fortyEight_mul_X_sub_sixtyFour,
    discr_X_pow_four_add_eight_mul_X_add_twelve, by norm_num,
    hasGaloisLabel_X_pow_four_add_eight_mul_X_add_twelve,
    natCard_gal_X_pow_four_add_eight_mul_X_add_twelve⟩

/-- `x⁴ − 2`: resolvent cubic `X³ + 8X`, with exactly one rational root; discriminant `−2048`,
not a square; label `4T3 = D₄`. -/
example : quarticD4Spec.specialize ℚ (X ^ 4 - 2) = X ^ 3 + 8 * X ∧
    (∃! a : ℚ, (X ^ 3 + 8 * X : ℚ[X]).IsRoot a) ∧ (X ^ 4 - 2 : ℚ[X]).discr = -2048 ∧
    ¬ IsSquare (X ^ 4 - 2 : ℚ[X]).discr ∧
    HasGaloisLabel (X ^ 4 - 2 : ℚ[X]) (⟨2, by simp⟩ : TransitiveGroupIndex 4) ∧
    Nat.card (X ^ 4 - 2 : ℚ[X]).Gal = 8 := by
  have hf : (X ^ 4 - 2 : ℚ[X]).Monic := by monicity!
  have h := hasGaloisLabel_X_pow_four_sub_two
  refine ⟨quarticD4Spec_specialize_X_pow_four_sub_two, ?_, discr_X_pow_four_sub_two,
    ((hasGaloisLabel_four_zero_or_two_iff ringChar_rat_ne_two hf).mp (Or.inr h)).2.2.1, h,
    natCard_gal_X_pow_four_sub_two⟩
  have := ((hasGaloisLabel_four_zero_or_two_iff_existsUnique_isRoot_resolvent
    ringChar_rat_ne_two hf).mp (Or.inr h)).2.2
  rwa [quarticD4Spec_specialize_X_pow_four_sub_two] at this

/-- `x⁴ + 1`: resolvent cubic `X³ − 4X = X (X − 2) (X + 2)`, which splits completely;
discriminant `256 = 16²`; label `4T2 = V₄`. -/
example : quarticD4Spec.specialize ℚ (X ^ 4 + 1) = X ^ 3 - 4 * X ∧
    (X ^ 3 - 4 * X : ℚ[X]) = X * (X - 2) * (X + 2) ∧ (X ^ 3 - 4 * X : ℚ[X]).Splits ∧
    (X ^ 4 + 1 : ℚ[X]).discr = 16 ^ 2 ∧
    HasGaloisLabel (X ^ 4 + 1 : ℚ[X]) (⟨1, by simp⟩ : TransitiveGroupIndex 4) ∧
    Nat.card (X ^ 4 + 1 : ℚ[X]).Gal = 4 := by
  have hf : (X ^ 4 + 1 : ℚ[X]).Monic := by monicity!
  have h := hasGaloisLabel_X_pow_four_add_one
  refine ⟨quarticD4Spec_specialize_X_pow_four_add_one, by ring, ?_,
    by rw [discr_X_pow_four_add_one]; norm_num, h, natCard_gal_X_pow_four_add_one⟩
  have := ((hasGaloisLabel_four_one_iff_splits_resolvent ringChar_rat_ne_two hf).mp h).2.2
  rwa [quarticD4Spec_specialize_X_pow_four_add_one] at this

/-- `x⁴ + 1` is reducible modulo every prime: its group `V₄` contains no 4-cycle. -/
example (p : ℕ) [Fact p.Prime] : ¬ Irreducible (X ^ 4 + 1 : (ZMod p)[X]) :=
  not_irreducible_X_pow_four_add_one p

/-- `x⁴ + x³ + x² + x + 1`: resolvent cubic `X³ − X² − 3X + 2`, with exactly one rational root;
discriminant `125`, **not** a square (see the erratum in the archived README); label
`4T1 = C₄`. -/
example : quarticD4Spec.specialize ℚ (X ^ 4 + X ^ 3 + X ^ 2 + X + 1) =
      X ^ 3 - X ^ 2 - 3 * X + 2 ∧
    (∃! a : ℚ, (X ^ 3 - X ^ 2 - 3 * X + 2 : ℚ[X]).IsRoot a) ∧
    (X ^ 4 + X ^ 3 + X ^ 2 + X + 1 : ℚ[X]).discr = 125 ∧
    ¬ IsSquare (X ^ 4 + X ^ 3 + X ^ 2 + X + 1 : ℚ[X]).discr ∧
    HasGaloisLabel (X ^ 4 + X ^ 3 + X ^ 2 + X + 1 : ℚ[X]) (⟨0, by simp⟩ : TransitiveGroupIndex 4) ∧
    Nat.card (X ^ 4 + X ^ 3 + X ^ 2 + X + 1 : ℚ[X]).Gal = 4 := by
  have hf : (X ^ 4 + X ^ 3 + X ^ 2 + X + 1 : ℚ[X]).Monic := by monicity!
  have h := hasGaloisLabel_X_pow_four_add_X_pow_three_add_X_sq_add_X_add_one
  refine ⟨quarticD4Spec_specialize_X_pow_four_add_X_pow_three_add_X_sq_add_X_add_one, ?_,
    discr_X_pow_four_add_X_pow_three_add_X_sq_add_X_add_one,
    ((hasGaloisLabel_four_zero_or_two_iff ringChar_rat_ne_two hf).mp (Or.inl h)).2.2.1, h,
    natCard_gal_X_pow_four_add_X_pow_three_add_X_sq_add_X_add_one⟩
  have := ((hasGaloisLabel_four_zero_or_two_iff_existsUnique_isRoot_resolvent
    ringChar_rat_ne_two hf).mp (Or.inl h)).2.2
  rwa [quarticD4Spec_specialize_X_pow_four_add_X_pow_three_add_X_sq_add_X_add_one] at this

/-! ### Degree 5: each with the certificate that proves its label -/

/-- `x⁵ + x⁴ − 4x³ − 3x² + 3x + 1`, label `5T1 = C₅`: discriminant `121²`, irreducible modulo
`2`, second root `α² − 2` in `ℚ[X]/(f)`. -/
example :
    (X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1 : ℤ[X]).discr = 121 ^ 2 ∧
    (X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1 : ℤ[X]).factorDegrees 2 = {5} ∧
    HasSecondRootInRootField (X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1) (X ^ 2 - 2) ∧
    HasGaloisLabel ((X ^ 5 + X ^ 4 - 4 * X ^ 3 - 3 * X ^ 2 + 3 * X + 1 : ℤ[X]).map
      (Int.castRingHom ℚ)) (⟨0, by simp⟩ : TransitiveGroupIndex 5) :=
  ⟨discr_X5_add_X4_sub_4X3_sub_3X2_add_3X_add_1,
    Polynomial.factorDegrees_X5_add_X4_sub_4X3_sub_3X2_add_3X_add_1_two,
    hasSecondRootInRootField_X5_add_X4_sub_4X3_sub_3X2_add_3X_add_1,
    hasGaloisLabel_X5_add_X4_sub_4X3_sub_3X2_add_3X_add_1⟩

/-- `x⁵ − 5x − 12`, label `5T2 = D₅`: discriminant `8000²`, irreducible modulo `7`, sextic root
`40`, factor degrees `(1, 2, 2)` modulo `3`, group of order 10. Every factorization type at a
good prime is a cycle type of an even permutation, and `A₅` is not contained in the Galois
image: factorization types give no upper bound. -/
example : (X ^ 5 - 5 * X - 12 : ℤ[X]).discr = 8000 ^ 2 ∧
    (X ^ 5 - 5 * X - 12 : ℤ[X]).factorDegrees 7 = {5} ∧
    HasSexticRoot (X ^ 5 - 5 * X - 12) 40 ∧
    (X ^ 5 - 5 * X - 12 : ℤ[X]).factorDegrees 3 = {1, 2, 2} ∧
    HasGaloisLabel ((X ^ 5 - 5 * X - 12 : ℤ[X]).map (Int.castRingHom ℚ))
      (⟨1, by simp⟩ : TransitiveGroupIndex 5) ∧
    Nat.card (X ^ 5 - 5 * X - 12 : ℚ[X]).Gal = 10 :=
  ⟨discr_X_pow_five_sub_five_mul_X_sub_twelve,
    factorDegrees_X_pow_five_sub_five_mul_X_sub_twelve_seven,
    hasSexticRoot_X_pow_five_sub_five_mul_X_sub_twelve,
    factorDegrees_X_pow_five_sub_five_mul_X_sub_twelve_three,
    hasGaloisLabel_X_pow_five_sub_five_mul_X_sub_twelve,
    natCard_gal_X_pow_five_sub_five_mul_X_sub_twelve⟩

example :
    (∀ (p : ℕ) [Fact p.Prime], ¬ (p : ℤ) ∣ (X ^ 5 - 5 * X - 12 : ℤ[X]).discr →
      ∃ σ ∈ alternatingGroup (((X ^ 5 - 5 * X - 12 : ℤ[X]).map (Int.castRingHom ℚ)).rootSet ℂ),
        σ.fullCycleType = (X ^ 5 - 5 * X - 12 : ℤ[X]).factorDegrees p) ∧
      ¬ alternatingGroup (((X ^ 5 - 5 * X - 12 : ℤ[X]).map (Int.castRingHom ℚ)).rootSet ℂ) ≤
        (Gal.galActionHom ((X ^ 5 - 5 * X - 12 : ℤ[X]).map (Int.castRingHom ℚ)) ℂ).range :=
  factorDegrees_do_not_distinguish_D5_A5

/-- `x⁵ − 2`, label `5T3 = F₂₀`: resolvent sextic `X⁶ − 50000X` with the rational root `0`,
discriminant `50000`, not a square, irreducible modulo `11`, group of order 20. -/
example : resolventSextic (X ^ 5 - 2) = X ^ 6 - 50000 * X ∧ HasSexticRoot (X ^ 5 - 2) 0 ∧
    (X ^ 5 - 2 : ℤ[X]).discr = 50000 ∧ ¬ IsSquare (X ^ 5 - 2 : ℤ[X]).discr ∧
    (X ^ 5 - 2 : ℤ[X]).factorDegrees 11 = {5} ∧
    HasGaloisLabel ((X ^ 5 - 2 : ℤ[X]).map (Int.castRingHom ℚ))
      (⟨2, by simp⟩ : TransitiveGroupIndex 5) ∧
    Nat.card (X ^ 5 - 2 : ℚ[X]).Gal = 20 := by
  have hc := QuinticCertificate.check_X_pow_five_sub_two
  rw [QuinticCertificate.check_eq_true_iff, QuinticCertificate.verifies_frobeniusF20_iff] at hc
  refine ⟨?_, hc.2.2, discr_X_pow_five_sub_two, hc.2.1, factorDegrees_X_pow_five_sub_two_eleven,
    hasGaloisLabel_X_pow_five_sub_two, natCard_gal_X_pow_five_sub_two⟩
  have := resolventSextic_X_pow_five_sub_C 2
  rw [C_ofNat] at this
  rw [this, ← C_ofNat]
  norm_num

/-- `x⁵ + 20x − 16`, label `5T4 = A₅`: discriminant `32000²`, irreducible modulo `3`, factor
degrees `(1, 1, 3)` modulo `7`. -/
example : (X ^ 5 + 20 * X - 16 : ℤ[X]).discr = 32000 ^ 2 ∧
    (X ^ 5 + 20 * X - 16 : ℤ[X]).factorDegrees 3 = {5} ∧
    (X ^ 5 + 20 * X - 16 : ℤ[X]).factorDegrees 7 = {1, 1, 3} ∧
    HasGaloisLabel ((X ^ 5 + 20 * X - 16 : ℤ[X]).map (Int.castRingHom ℚ))
      (⟨3, by simp⟩ : TransitiveGroupIndex 5) :=
  ⟨discr_X_pow_five_add_twenty_mul_X_sub_sixteen,
    Polynomial.factorDegrees_X_pow_five_add_twenty_mul_X_sub_sixteen_three,
    Polynomial.factorDegrees_X_pow_five_add_twenty_mul_X_sub_sixteen_seven,
    hasGaloisLabel_X_pow_five_add_twenty_mul_X_sub_sixteen⟩

/-- `x⁵ − x − 1` has discriminant `2869 = 19 · 151`. -/
private theorem discr_X_pow_five_sub_X_sub_one_int : (X ^ 5 - X - 1 : ℤ[X]).discr = 2869 := by
  have hQ : (X ^ 5 - X - 1 : ℚ[X]).discr = 2869 := by
    let f : ℚ[X] := X ^ 5 - X - 1
    let g : ℚ[X] := X ^ 4 - C (1 / 5)
    have hf : f.Monic := by dsimp [f]; monicity!
    have hdeg : f.natDegree = 5 := by dsimp [f]; compute_degree!
    have hgdeg : g.natDegree ≤ 4 := by dsimp [g]; compute_degree
    have hC : (C 5 * C 5⁻¹ : ℚ[X]) = 1 := by rw [← C_mul]; norm_num
    have hC45 : (C 4 + 1 : ℚ[X]) = C 5 := by rw [← C_1, ← C_add]; norm_num
    have hder : f.derivative = C 5 * g := by
      simp [f, g]
      linear_combination X ^ 4 * hC45 + hC
    have hres := resultant_deriv (f := f) (natDegree_pos_iff_degree_pos.mp (by omega))
    rw [hdeg, hf.leadingCoeff, hder] at hres
    norm_num at hres
    have h1 : (C (-4 / 5) * C (-5 / 4) : ℚ[X]) = 1 := by rw [← C_mul]; norm_num
    have h2 : (C (-4 / 5) - C (1 / 5) + 1 : ℚ[X]) = 0 := by
      rw [← C_sub, ← C_1, ← C_add]; norm_num
    have hred : f = C (-4 / 5) * (X - C (-5 / 4)) + g * X := by
      simp only [f, g]
      linear_combination (-X) * h2 + h1
    have hresult : f.resultant g 5 4 = (-4 / 5) ^ 4 * ((-5 / 4) ^ 4 - 1 / 5) := by
      rw [hred, resultant_add_mul_left _ _ _ 5 4 (by simp) hgdeg]
      rw [resultant_add_left_deg _ _ 1 4 4 (by compute_degree!)]
      rw [resultant_C_mul_left, resultant_X_sub_C_left _ _ _ hgdeg]
      norm_num [g]
    rw [resultant_C_mul_right, hresult] at hres
    norm_num at hres
    linarith
  have hmap := monic_X_pow_five_sub_X_sub_one.discr_map (Int.castRingHom ℚ)
  have hX : (X ^ 5 - X - 1 : ℤ[X]).map (Int.castRingHom ℚ) = X ^ 5 - X - 1 := by simp
  rw [hX, hQ, eq_intCast] at hmap
  exact_mod_cast hmap.symm

/-- `x⁵ − x − 1`, label `5T5 = S₅`: discriminant `2869 = 19 · 151`; modulo 2 it factors as
`(x² + x + 1)(x³ + x² + 1)`, exhibiting an element of order 6; modulo 5 it is irreducible
(Artin-Schreier); the Galois action on the roots is the full symmetric group. -/
example : (X ^ 5 - X - 1 : ℤ[X]).discr = 2869 ∧ (2869 : ℤ) = 19 * 151 ∧
    (X ^ 5 - X - 1 : ℤ[X]).map (Int.castRingHom (ZMod 2)) =
      (X ^ 2 + X + 1) * (X ^ 3 + X ^ 2 + 1) ∧
    (X ^ 5 - X - 1 : ℤ[X]).factorDegrees 2 = {3, 2} ∧
    Irreducible (X ^ 5 - X - 1 : (ZMod 5)[X]) ∧
    HasGaloisLabel ((X ^ 5 - X - 1 : ℤ[X]).map (Int.castRingHom ℚ))
      (⟨4, by simp⟩ : TransitiveGroupIndex 5) ∧
    Function.Surjective
      (Gal.galActionHom ((X ^ 5 - X - 1 : ℤ[X]).map (Int.castRingHom ℚ)) ℂ) := by
  refine ⟨discr_X_pow_five_sub_X_sub_one_int, by norm_num, ?_,
    Polynomial.factorDegrees_X_pow_five_sub_X_sub_one_two,
    Polynomial.irreducible_X_pow_five_sub_X_sub_one_zmod_five,
    hasGaloisLabel_X_pow_five_sub_X_sub_one, surjective_galActionHom_X_pow_five_sub_X_sub_one⟩
  have h2 : (2 : (ZMod 2)[X]) = 0 := by exact_mod_cast CharP.cast_eq_zero (ZMod 2)[X] 2
  simp only [Polynomial.map_sub, Polynomial.map_pow, Polynomial.map_X, Polynomial.map_one]
  linear_combination (-(X ^ 4 + X ^ 3 + X ^ 2 + X + 1)) * h2

/-- **The generic instance, for Layer 5**: a quintic irreducible modulo one good prime with
factor type `(1, 1, 1, 2)` modulo another has label `5T5`. -/
example {f : ℤ[X]} {p q : ℕ} (hf : f.Monic) (hp : HasFactorDegrees f p {5})
    (hq : HasFactorDegrees f q {1, 1, 1, 2}) :
    HasGaloisLabel (f.map (Int.castRingHom ℚ)) (⟨4, by simp⟩ : TransitiveGroupIndex 5) :=
  hasGaloisLabel_five_four_of_factorDegrees_five_and_one_one_one_two hf hp hq

/-! ### Layer 9: the alternating examples, as an exact list -/

/-- `x³ − 3x − 1` (`3T1`), `x⁴ + 8x + 12` (`4T4`) and `x⁵ + 20x − 16` (`5T4`): each has square
discriminant and the alternating label. -/
example : IsSquare (X ^ 3 - 3 * X - 1 : ℚ[X]).discr ∧
    HasGaloisLabel (X ^ 3 - 3 * X - 1 : ℚ[X]) (⟨0, by simp⟩ : TransitiveGroupIndex 3) ∧
    IsSquare (X ^ 4 + 8 * X + 12 : ℚ[X]).discr ∧
    HasGaloisLabel (X ^ 4 + 8 * X + 12 : ℚ[X]) (⟨3, by simp⟩ : TransitiveGroupIndex 4) ∧
    IsSquare (X ^ 5 + 20 * X - 16 : ℤ[X]).discr ∧
    HasGaloisLabel ((X ^ 5 + 20 * X - 16 : ℤ[X]).map (Int.castRingHom ℚ))
      (⟨3, by simp⟩ : TransitiveGroupIndex 5) :=
  ⟨⟨9, by rw [discr_X_pow_three_sub_three_mul_X_sub_one]; norm_num⟩,
    hasGaloisLabel_X_pow_three_sub_three_mul_X_sub_one,
    ⟨576, by rw [discr_X_pow_four_add_eight_mul_X_add_twelve]; norm_num⟩,
    hasGaloisLabel_X_pow_four_add_eight_mul_X_add_twelve,
    ⟨32000, by rw [discr_X_pow_five_add_twenty_mul_X_sub_sixteen]; ring⟩,
    hasGaloisLabel_X_pow_five_add_twenty_mul_X_sub_sixteen⟩

/-! ### Non-examples -/

/-- `x⁴` and `(x² − 2)²` are not separable, so they carry no label and do not satisfy the
full-symmetric predicate of Layer 9. -/
example : ¬ (X ^ 4 : ℚ[X]).Separable ∧ ¬ HasFullSymmetricGaloisGroup (X ^ 4 : ℚ[X]) :=
  ⟨fun h => not_isUnit_X (h.squarefree X ⟨X ^ 2, by ring⟩),
    not_hasFullSymmetricGaloisGroup_X_pow 4 (by norm_num)⟩

example {n : ℕ} (j : TransitiveGroupIndex n) :
    ¬ HasGaloisLabel (X ^ 4 : ℚ[X]) j ∧ ¬ HasGaloisLabel ((X ^ 2 - 2) ^ 2 : ℚ[X]) j :=
  ⟨not_hasGaloisLabel_of_not_separable
      fun h => not_isUnit_X (h.squarefree X ⟨X ^ 2, by ring⟩),
    not_hasGaloisLabel_of_not_separable not_separable_X_sq_sub_two_sq⟩

/-- `(x² − 2)²` shows that transitivity gives irreducibility only under separability: its Galois
group acts transitively on its two distinct roots, and it is not irreducible. -/
example : ¬ ((X ^ 2 - 2) ^ 2 : ℚ[X]).Separable ∧ ¬ Irreducible ((X ^ 2 - 2) ^ 2 : ℚ[X]) ∧
    MulAction.IsPretransitive ((X ^ 2 - 2) ^ 2 : ℚ[X]).Gal
      (((X ^ 2 - 2) ^ 2 : ℚ[X]).rootSet ((X ^ 2 - 2) ^ 2 : ℚ[X]).SplittingField) ∧
    ¬ HasFullSymmetricGaloisGroup ((X ^ 2 - 2) ^ 2 : ℚ[X]) := by
  refine ⟨not_separable_X_sq_sub_two_sq, not_irreducible_X_sq_sub_two_sq,
    isPretransitive_gal_X_sq_sub_two_sq,
    not_hasFullSymmetricGaloisGroup_pow_of_not_isUnit ?_ 2 le_rfl⟩
  intro h
  have := natDegree_eq_zero_of_isUnit h
  rw [show (X ^ 2 - 2 : ℚ[X]).natDegree = 2 by compute_degree!] at this
  omega

/-- `(x² − 2)(x² − 3)` is separable and reducible, with Galois group `V₄` acting with two orbits
of size 2, and carries no label. -/
example (E : Type*) [Field E] [Algebra ℚ E]
    [Fact ((((X ^ 2 - 2) * (X ^ 2 - 3) : ℚ[X]).map (algebraMap ℚ E)).Splits)] {n : ℕ}
    (j : TransitiveGroupIndex n) :
    ((X ^ 2 - 2) * (X ^ 2 - 3) : ℚ[X]).Separable ∧
      ¬ Irreducible ((X ^ 2 - 2) * (X ^ 2 - 3) : ℚ[X]) ∧
      IsKleinFour ((X ^ 2 - 2) * (X ^ 2 - 3) : ℚ[X]).Gal ∧
      (∀ x : ((X ^ 2 - 2) * (X ^ 2 - 3) : ℚ[X]).rootSet E,
        Nat.card (MulAction.orbit ((X ^ 2 - 2) * (X ^ 2 - 3) : ℚ[X]).Gal x) = 2) ∧
      Nat.card (MulAction.orbitRel.Quotient ((X ^ 2 - 2) * (X ^ 2 - 3) : ℚ[X]).Gal
        (((X ^ 2 - 2) * (X ^ 2 - 3) : ℚ[X]).rootSet E)) = 2 ∧
      ¬ HasGaloisLabel ((X ^ 2 - 2) * (X ^ 2 - 3) : ℚ[X]) j :=
  ⟨separable_X_sq_sub_two_mul_X_sq_sub_three, not_irreducible_X_sq_sub_two_mul_X_sq_sub_three,
    isKleinFour_gal_X_sq_sub_two_mul_X_sq_sub_three,
    natCard_orbit_X_sq_sub_two_mul_X_sq_sub_three E,
    natCard_orbitQuotient_X_sq_sub_two_mul_X_sq_sub_three E,
    not_hasGaloisLabel_X_sq_sub_two_mul_X_sq_sub_three j⟩

/-- `x⁵ + x + 1 = (x² + x + 1)(x³ − x² + 1)` is a reducible quintic and carries no `5Tj`
label. -/
example (j : TransitiveGroupIndex 5) :
    (X ^ 5 + X + 1 : ℚ[X]) = (X ^ 2 + X + 1) * (X ^ 3 - X ^ 2 + 1) ∧
      ¬ Irreducible (X ^ 5 + X + 1 : ℚ[X]) ∧ ¬ HasGaloisLabel (X ^ 5 + X + 1 : ℚ[X]) j :=
  ⟨by ring, not_irreducible_X_pow_five_add_X_add_one, not_hasGaloisLabel_X_pow_five_add_X_add_one j⟩

/-- `x⁵ − x` is separable, with discriminant `−256` (see the erratum in the archived README),
and its resolvent sextic `(X − 2)⁴ (X² + 16)` is not separable. The rational root `2` does not
place the Galois image inside a conjugate of `F₂₀`. -/
example : (X ^ 5 - X : ℚ[X]).Separable ∧ (X ^ 5 - X : ℤ[X]).discr = -256 ∧
    resolventSextic (X ^ 5 - X : ℤ[X]) = (X - 2) ^ 4 * (X ^ 2 + 16) ∧
    ¬ ((resolventSextic (X ^ 5 - X : ℤ[X])).map (Int.castRingHom ℚ)).Separable ∧
    (quinticF20Spec.specialize ℚ (X ^ 5 - X : ℚ[X])).IsRoot 2 :=
  ⟨separable_X_pow_five_sub_X, discr_X_pow_five_sub_X, resolventSextic_X_pow_five_sub_X,
    not_separable_map_resolventSextic_X_pow_five_sub_X,
    isRoot_specialize_quinticF20Spec_X_pow_five_sub_X⟩

example {E : Type*} [Field E] [Algebra ℚ E]
    [Fact (((X ^ 5 - X : ℚ[X])).map (algebraMap ℚ E)).Splits]
    (e : (X ^ 5 - X : ℚ[X]).rootSet E ≃ Fin 5) :
    ¬ ∃ τ : Equiv.Perm (Fin 5),
      (Gal.galActionHom (X ^ 5 - X : ℚ[X]) E).range.map
          (e.permCongrHom : _ →* Equiv.Perm (Fin 5)) ≤
        quinticF20Spec.H.map (MulAut.conj τ).toMonoidHom :=
  not_exists_le_map_conj_quinticF20Spec_X_pow_five_sub_X e

end WorkedExamples


section Layer9

open Polynomial MulAction TauCeti UniqueFactorizationMonoid

/-- `Polynomial.Gal.galActionHom f f.SplittingField` asks for splitting as a `Fact`. -/
local instance layer9FactSplits {F : Type*} [Field F] (f : F[X]) :
    Fact ((f.map (algebraMap F f.SplittingField)).Splits) :=
  ⟨IsSplittingField.splits f.SplittingField f⟩

local instance layer9FactPrimeFive : Fact (Nat.Prime 5) := ⟨by norm_num⟩

/-! ## Layer 9: `Sₙ` as a Galois group over `ℚ` -/

/-- **Layer 9, the full-symmetric predicate**, certified by its content: `f` is separable and
`galActionHom f f.SplittingField` is surjective. Separability is part of the predicate. -/
example {F : Type*} [Field F] (f : F[X]) :
    HasFullSymmetricGaloisGroup f ↔
      f.Separable ∧ Function.Surjective (Gal.galActionHom f f.SplittingField) :=
  Iff.rfl

/-- The predicate may be read in any splitting extension, in particular in `ℂ` over `ℚ`. -/
example {F : Type*} [Field F] (f : F[X]) (E : Type*) [Field E] [Algebra F E]
    [Fact ((f.map (algebraMap F E)).Splits)] :
    HasFullSymmetricGaloisGroup f ↔ f.Separable ∧ Function.Surjective (Gal.galActionHom f E) :=
  hasFullSymmetricGaloisGroup_iff_separable_and_surjective_galActionHom E

/-- **Layer 9, the regression that keeps the predicate honest.** `X ^ n` with `2 ≤ n` has one
distinct root and a trivial Galois group acting bijectively on it, and it does not have full
symmetric Galois group. -/
example {F : Type*} [Field F] (n : ℕ) (hn : 2 ≤ n) :
    ¬ HasFullSymmetricGaloisGroup (X ^ n : F[X]) :=
  not_hasFullSymmetricGaloisGroup_X_pow n hn

/-- **Non-examples.** `x⁴` and `(x² − 2)²` are not separable, so neither satisfies the
full-symmetric predicate. -/
example : ¬ HasFullSymmetricGaloisGroup (X ^ 4 : ℚ[X]) ∧
    ¬ HasFullSymmetricGaloisGroup ((X ^ 2 - C 2) ^ 2 : ℚ[X]) := by
  refine ⟨not_hasFullSymmetricGaloisGroup_X_pow 4 (by norm_num),
    not_hasFullSymmetricGaloisGroup_pow_of_not_isUnit (fun h => ?_) 2 le_rfl⟩
  have := natDegree_eq_zero_of_isUnit h
  rw [natDegree_X_pow_sub_C] at this
  exact two_ne_zero this

/-- **Layer 9, the theorem** (van der Waerden, *Algebra* I, §61). For every `n ≥ 1` there is a
monic `f : ℤ[X]` of degree `n`, irreducible over `ℚ`, with full symmetric Galois group. -/
example (n : ℕ) (hn : 1 ≤ n) :
    ∃ f : ℤ[X], f.Monic ∧ f.natDegree = n ∧
      Irreducible (f.map (Int.castRingHom ℚ)) ∧
      HasFullSymmetricGaloisGroup (f.map (Int.castRingHom ℚ)) :=
  exists_monic_int_polynomial_hasFullSymmetricGaloisGroup n hn

attribute [local instance] Gal.splits_ℚ_ℂ in
/-- The same theorem in the form of the earlier suggested statement: the Galois action on the
complex roots is all of `Equiv.Perm`. -/
example (n : ℕ) (hn : 1 ≤ n) :
    ∃ f : ℤ[X], f.Monic ∧ f.natDegree = n ∧
      Irreducible (f.map (Int.castRingHom ℚ)) ∧
      Function.Surjective (Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ) := by
  obtain ⟨f, hf, hd, hi, hS⟩ := exists_monic_int_polynomial_hasFullSymmetricGaloisGroup n hn
  exact ⟨f, hf, hd, hi,
    ((hasFullSymmetricGaloisGroup_iff_separable_and_surjective_galActionHom ℂ).mp hS).2⟩

/-! ### The prerequisites of the theorem, in order -/

/-- **Layer 9, prerequisite 1.** For every `d ≥ 1` there is a monic irreducible polynomial of
degree `d` over `ZMod 2`, and in fact over any finite field. -/
example (d : ℕ) (hd : 1 ≤ d) :
    ∃ g : (ZMod 2)[X], g.Monic ∧ Irreducible g ∧ g.natDegree = d :=
  exists_monic_irreducible_natDegree_eq (ZMod 2) d hd

/-- **Layer 9, prerequisite 2.** A squarefree monic polynomial over `ZMod 3` of degree `n` with
factor degrees `(1, n − 1)`. -/
example (n : ℕ) (hn : 2 ≤ n) :
    ∃ g : (ZMod 3)[X], g.Monic ∧ g.natDegree = n ∧ Squarefree g ∧
      (normalizedFactors g).map natDegree = {1, n - 1} :=
  exists_monic_squarefree_map_natDegree_normalizedFactors_eq_pair_one_sub_one (ZMod 3) n hn

/-- **Layer 9, prerequisite 3.** A squarefree monic polynomial over `ZMod 5` of degree `n` with
exactly one quadratic factor and all other factor degrees odd. -/
example (n : ℕ) (hn : 2 ≤ n) :
    ∃ g : (ZMod 5)[X], g.Monic ∧ g.natDegree = n ∧ Squarefree g ∧
      ((normalizedFactors g).map natDegree).count 2 = 1 ∧
      ∀ d ∈ (normalizedFactors g).map natDegree, d ≠ 2 → Odd d :=
  exists_monic_squarefree_count_two_map_natDegree_normalizedFactors_eq_one_and_odd (ZMod 5) n hn

/-- **Layer 9, prerequisite 4.** The coefficientwise Chinese remainder theorem: prescribed
monic reductions of degree `n` at `2`, `3` and `5` are realized by one monic integral
polynomial of degree `n`. -/
example (n : ℕ) (g2 : (ZMod 2)[X]) (g3 : (ZMod 3)[X]) (g5 : (ZMod 5)[X])
    (h2 : g2.Monic) (h3 : g3.Monic) (h5 : g5.Monic)
    (d2 : g2.natDegree = n) (d3 : g3.natDegree = n) (d5 : g5.natDegree = n) :
    ∃ f : ℤ[X], f.Monic ∧ f.natDegree = n ∧
      f.map (Int.castRingHom (ZMod 2)) = g2 ∧
      f.map (Int.castRingHom (ZMod 3)) = g3 ∧
      f.map (Int.castRingHom (ZMod 5)) = g5 :=
  exists_monic_int_polynomial_map_two_three_five_eq n g2 g3 g5 h2 h3 h5 d2 d3 d5

/-- **Layer 9, prerequisite 5, base change.** The discriminant of a monic polynomial commutes
with every ring morphism, in particular with `ℤ → ZMod p`. -/
example {R S : Type*} [CommRing R] [CommRing S] (f : R[X]) (hf : f.Monic) (φ : R →+* S) :
    (f.map φ).discr = φ f.discr :=
  hf.discr_map φ

/-- **Layer 9, prerequisite 5, admissibility.** A monic integral polynomial with squarefree
reduction modulo a prime `p` has `p ∤ disc f`; this is applied at `2`, `3` and `5`. -/
example (f : ℤ[X]) (hf : f.Monic) (p : ℕ) [Fact p.Prime]
    (hsq : Squarefree (f.map (Int.castRingHom (ZMod p)))) :
    ¬ (p : ℤ) ∣ f.discr :=
  (hf.separable_map_zmod_iff_not_dvd_discr p).mp (PerfectField.separable_iff_squarefree.mpr hsq)

attribute [local instance] Gal.splits_ℚ_ℂ in
/-- **Layer 9, prerequisite 6, the criterion for irreducibility modulo `p`**, through the
membership statement of Layer 5: an irreducible reduction exhibits a cycle through all the
roots in the Galois image, hence a transitive action, hence irreducibility over `ℚ`. -/
example (f : ℤ[X]) (hf : f.Monic) (hdeg : 2 ≤ f.natDegree) (p : ℕ) [Fact p.Prime]
    (hirr : Irreducible (f.map (Int.castRingHom (ZMod p)))) :
    Irreducible (f.map (Int.castRingHom ℚ)) := by
  classical
  have hp : ¬ (p : ℤ) ∣ f.discr :=
    (hf.separable_map_zmod_iff_not_dvd_discr p).mp (PerfectField.separable_of_irreducible hirr)
  have hsep : (f.map (Int.castRingHom ℚ)).Separable := by
    rw [hf.separable_map_iff_map_discr_ne_zero, eq_intCast, Int.cast_ne_zero]
    exact fun h => hp (h ▸ dvd_zero _)
  obtain ⟨σ, hσ, hcyc, hsupp⟩ :=
    exists_isCycle_mem_range_galActionHom_of_irreducible_map hf hdeg p hirr
  have hG := isPretransitive_of_isCycle_mem_of_support_eq_univ hcyc hσ hsupp
  have hT : IsPretransitive (f.map (Int.castRingHom ℚ)).Gal
      ((f.map (Int.castRingHom ℚ)).rootSet ℂ) := by
    refine ⟨fun x y => ?_⟩
    obtain ⟨⟨s, hs⟩, hg⟩ := hG.exists_smul_eq x y
    obtain ⟨g, rfl⟩ := hs
    exact ⟨g, hg⟩
  exact (isPretransitive_iff_irreducible ℂ hsep (by
    rw [natDegree_map_eq_of_injective (RingHom.injective_int _)]; omega)).mp hT

/-- **Layer 9, prerequisite 7, first step.** A subgroup containing an `n`-cycle is
transitive. -/
example {α : Type*} [Fintype α] [DecidableEq α] {G : Subgroup (Equiv.Perm α)}
    {g : Equiv.Perm α} (hgc : g.IsCycle) (hg : g ∈ G) (hsupp : g.support = Finset.univ) :
    IsPretransitive G α :=
  isPretransitive_of_isCycle_mem_of_support_eq_univ hgc hg hsupp

/-- **Layer 9, prerequisite 7, second step.** A transitive group containing an
`(n − 1)`-cycle is 2-transitive, and therefore primitive. -/
example {α : Type*} [Fintype α] [DecidableEq α] (G : Subgroup (Equiv.Perm α))
    [IsPretransitive G α] {σ : Equiv.Perm α} (hσ : σ.IsCycle) (hσG : σ ∈ G)
    (hcard : σ.support.card + 1 = Fintype.card α) :
    IsMultiplyPretransitive G α 2 ∧ IsPreprimitive G α :=
  ⟨is_two_pretransitive_of_isCycle_mem_of_card_support_add_one_eq_card G hσ hσG hcard,
    isPreprimitive_of_isCycle_mem_of_card_support_add_one_eq_card G hσ hσG hcard⟩

/-- **Layer 9, prerequisite 7, third step.** An element with exactly one cycle of length 2
and all other cycles of odd length has an odd power that is a transposition. -/
example {α : Type*} [Fintype α] [DecidableEq α] (σ : Equiv.Perm α)
    (htwo : σ.cycleType.count 2 = 1) (hodd : ∀ n ∈ σ.cycleType, n ≠ 2 → Odd n) :
    ∃ k, Odd k ∧ (σ ^ k).IsSwap :=
  σ.exists_odd_isSwap_pow htwo hodd

/-- **Layer 9, prerequisite 7, fourth step.** A primitive subgroup that contains a
transposition is the whole symmetric group (Mathlib). -/
example {α : Type*} [Finite α] [DecidableEq α] {G : Subgroup (Equiv.Perm α)}
    [IsPreprimitive G α] {g : Equiv.Perm α} (hg : g.IsSwap) (hgG : g ∈ G) : G = ⊤ :=
  Equiv.Perm.subgroup_eq_top_of_isPreprimitive_of_isSwap_mem inferInstance g hg hgG

attribute [local instance] Gal.splits_ℚ_ℂ in
/-- **Layer 9, the four steps assembled.** An irreducible monic integral polynomial with factor
degrees `(1, n − 1)` at one prime and, at a good prime, exactly one quadratic factor with all
other factor degrees odd, has full symmetric Galois action on its complex roots. -/
example (f : ℤ[X]) (hf : f.Monic) (hirr : Irreducible (f.map (Int.castRingHom ℚ)))
    (q : ℕ) [Fact q.Prime] (hqdeg : f.factorDegrees q = {1, f.natDegree - 1})
    (r : ℕ) [Fact r.Prime] (hr : ¬ (r : ℤ) ∣ f.discr) (htwo : (f.factorDegrees r).count 2 = 1)
    (hodd : ∀ k ∈ f.factorDegrees r, k ≠ 2 → Odd k) :
    Function.Surjective (Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ) :=
  surjective_galActionHom_of_factorDegrees hf hirr q hqdeg r hr htwo hodd

/-- **Layer 9, prerequisite 8, degree one.** The three patterns cover every `n ≥ 2`
uniformly; degree one is witnessed by `X`, whose Galois group is trivial and acts on one
root. -/
example : HasFullSymmetricGaloisGroup (X : ℚ[X]) := by
  rw [hasFullSymmetricGaloisGroup_iff_natCard_gal_eq_factorial_natDegree separable_X]
  simpa only [natDegree_X, Nat.factorial_one] using (Nat.card_unique (α := (X : ℚ[X]).Gal))

end Layer9

end TauCetiRoadmap.PolynomialGaloisGroups
