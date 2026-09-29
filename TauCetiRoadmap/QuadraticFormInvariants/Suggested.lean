import Mathlib
import TauCetiRoadmap.ProfiniteCohomology.Suggested
import TauCetiRoadmap.LocalFieldsRamification.Suggested
import TauCetiRoadmap.ClassFieldTheory.Suggested
import TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras.Suggested

/-!
# Quadratic forms and cohomological invariants: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers agree on names and signatures. Discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap, that is Layers 0 to 9, the convention table, the worked examples,
and the references, is in `README.md`. Mathlib has the linear algebra of quadratic forms,
that is diagonalization, `Anisotropic`, `Nondegenerate`, and isometry equivalence, and it
has quaternion algebras. It has none of the arithmetic theory: no Witt decomposition, no
Witt cancellation, no Witt ring, no Hasse invariant, no Hilbert symbol, no transfer, and
no Stiefel-Whitney classes. We build that theory in `TauCeti/`.

This file fixes the design decisions that are most likely to fork two implementations:

* the carrier for isometry classes (Layer 0);
* the chain-equivalence relation and the descent principle (Layer 0);
* the binary normal forms (Layer 0);
* the four-fold splitting criterion (Layer 2);
* the Brauer-group data and the Hasse invariant built on it (Layer 5);
* the quadratic-form adapters to the imported local-field toolkit (Layer 6A);
* the fractional-ideal carrier of the quadratic defect and its exponent (Layer 6B);
* the Hilbert symbol as a `{±1}`-valued function of the norm equation, and the local
  Hasse invariant built from it (Layer 6C);
* the realization constraints of the local classification (Layer 6D);
* the operations on mod-2 Galois cohomology (Layer 7A);
* the crossed-product package that the comparison `Br(K) ≃ H²` is built from (Layer 7B);
* the Scharlau transfer and the twisted trace form, the value of the Evens norm on a Kummer
  class through the `Pin⁺` lift of `C₂ ≀ C₂` in explicit `2 × 2` matrices, and the relative
  Stiefel-Whitney formula it proves, with the conjugation and sign conventions the supplier's
  Evens norm carries (Layer 9).

**Supplier carriers are canonical.** This roadmap imports the final declarations from
`ProfiniteCohomology`, `LocalFieldsRamification`, and `ClassFieldTheory`; it does not package
private substitutes for their cohomology, valuation, ramification, reciprocity, or local-duality
interfaces. The only adapters below are specific to quadratic forms and to the coefficient
identification `mu₂ ≃ ZMod 2`. In particular, Class Field Theory owns the cohomological Hilbert
pairing and reciprocity, while this roadmap owns the norm-equation/quaternion symbol and proves
the comparison. Hasse--Minkowski and global classification belong to `GlobalQuadraticForms`.

Layer-6 conventions follow Serre (*A Course in Arithmetic*, ch. III and IV) and O'Meara
(§63). The symbol is defined by the norm equation `b = x² − a·y²`, which needs no
classification of quaternion algebras and no local hypothesis. Every theorem about the
symbol carries the local hypotheses.

Statements elaborate against the pinned Mathlib and use `sorry`, which is allowed in this
human-owned roadmap library.
-/

namespace TauCetiRoadmap.QuadraticFormInvariants

open QuadraticMap CategoryTheory
open scoped Quaternion

universe u v

section FormTheory

variable {K : Type u} [Field K]

/-! ## Layer 0: the carrier for isometry classes

Functions on isometry classes appear from Layer 3 onwards, and Layer 4 needs a ring
whose elements are such classes. A quotient over arbitrary finite-dimensional spaces
would force universe and bundling decisions on the first implementer, so the roadmap
fixes a diagonal presentation instead. -/

/-- A diagonal presentation of a regular quadratic form: a rank `n` together with a
tuple of units, read as `⟨w 0, …, w (n-1)⟩`. -/
abbrev RegularFormPresentation (K : Type u) [Field K] : Type u := Σ n : ℕ, Fin n → Kˣ

/-- The form presented by `(n, w)`, namely `weightedSumSquares K w`. -/
def presentedForm (p : RegularFormPresentation K) : QuadraticForm K (Fin p.1 → K) :=
  weightedSumSquares K fun i => ((p.2 i : K))

/-- Two presentations are related when the forms they present are isometric. Mathlib's
`QuadraticMap.Equivalent` already compares forms on different spaces, so presentations
of different ranks may be compared, and only equal ranks are ever related. -/
instance regularFormSetoid (K : Type u) [Field K] : Setoid (RegularFormPresentation K) where
  r p q := (presentedForm p).Equivalent (presentedForm q)
  iseqv :=
    { refl := fun p => Equivalent.refl (presentedForm p)
      symm := fun h => h.symm
      trans := fun h h' => h.trans h' }

/-- **Layer 0, the carrier.** Isometry classes of regular finite-dimensional quadratic
forms, presented diagonally. Layer 3's invariants are functions on this type, and
Layer 4's Witt-Grothendieck ring is built from its two monoid structures. -/
abbrev RegularFormClass (K : Type u) [Field K] : Type u := Quotient (regularFormSetoid K)

/-- **Layer 0, every regular form has a presentation.** Diagonalization
(`equivalent_weightedSumSquares_units_of_nondegenerate'`) supplies one. -/
theorem exists_presentedForm_equivalent [Invertible (2 : K)] {V : Type v} [AddCommGroup V]
    [Module K V] [FiniteDimensional K V] (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) :
    ∃ p : RegularFormPresentation K, Q.Equivalent (presentedForm p) :=
  sorry

/-- **Layer 0, the class of a regular form.** The content of the milestone is that the class
does not depend on the diagonalization chosen to compute it, which is `formClass_mk` below.
This is what lets every invariant of Layers 3, 5, 6 and 8 be applied to a form rather than to
a presentation, and it is what Layer 9's form-level Stiefel-Whitney theorem is stated
through. -/
noncomputable def formClass [Invertible (2 : K)] {V : Type v} [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) :
    RegularFormClass K :=
  Quotient.mk _ (exists_presentedForm_equivalent Q hQ).choose

/-- **Layer 0, the class is computed by any diagonalization.** -/
theorem formClass_mk [Invertible (2 : K)] {V : Type v} [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (p : RegularFormPresentation K) (hp : Q.Equivalent (presentedForm p)) :
    formClass Q hQ = Quotient.mk _ p :=
  sorry

/-- **Layer 0, two regular forms are isometric exactly when their classes agree.** -/
theorem formClass_eq_iff [Invertible (2 : K)] {V W : Type v} [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) (R : QuadraticForm K W)
    (hR : R.Nondegenerate) :
    formClass Q hQ = formClass R hR ↔ Q.Equivalent R :=
  sorry

/-! ## Layer 0: chain equivalence and the descent principle -/

/-- A permutation of the slots of a diagonal tuple. -/
def PermutationStep {n : ℕ} (w w' : Fin n → Kˣ) : Prop :=
  ∃ σ : Equiv.Perm (Fin n), ∀ i, w' i = w (σ i)

/-- A binary move: two slots change by an isometry of binary forms, the rest are fixed. -/
def BinaryStep [Invertible (2 : K)] {n : ℕ} (w w' : Fin n → Kˣ) : Prop :=
  ∃ i j : Fin n, i ≠ j ∧ (∀ k, k ≠ i → k ≠ j → w k = w' k) ∧
    (weightedSumSquares K ![(w i : K), (w j : K)]).Equivalent
      (weightedSumSquares K ![(w' i : K), (w' j : K)])

/-- One step of Witt's chain equivalence. A transposition is already a `BinaryStep`,
because `⟨a,b⟩ ≅ ⟨b,a⟩`, so `PermutationStep` adds no generating data. It is kept
because permutation invariance is what downstream proofs apply. -/
def DiagonalStep [Invertible (2 : K)] {n : ℕ} (w w' : Fin n → Kˣ) : Prop :=
  PermutationStep w w' ∨ BinaryStep w w'

/-- **Chain equivalence** of diagonal tuples (Lam I.5.2). -/
def DiagonalChain [Invertible (2 : K)] {n : ℕ} (w w' : Fin n → Kˣ) : Prop :=
  Relation.ReflTransGen DiagonalStep w w'

/-- **Layer 0, Witt's chain-equivalence theorem** (Lam I.5.2). The two directions are not
equally hard. Left to right is elementary, because each step is an isometry. Right to
left is Witt's theorem, and it is the difficult direction. -/
example [Invertible (2 : K)] {n : ℕ} (w w' : Fin n → Kˣ) :
    DiagonalChain w w' ↔
      (weightedSumSquares K fun i => ((w i : K))).Equivalent
        (weightedSumSquares K fun i => ((w' i : K))) :=
  sorry

/-- **Layer 0, the descent principle**, which is the form that every later invariant
consumes. A function of diagonal tuples that is invariant under permutations and under
binary moves descends uniquely to `RegularFormClass K`. It is applied with
`M = BrauerGroup K` (Layer 5), `M = ℤˣ` (Layer 6C), and `M = H²(G_K, 𝔽₂)` written
additively (Layer 8). -/
example [Invertible (2 : K)] {M : Type v} [CommMonoid M] (f : RegularFormPresentation K → M)
    (hperm : ∀ (n : ℕ) (w w' : Fin n → Kˣ), PermutationStep w w' → f ⟨n, w⟩ = f ⟨n, w'⟩)
    (hbin : ∀ (n : ℕ) (w w' : Fin n → Kˣ), BinaryStep w w' → f ⟨n, w⟩ = f ⟨n, w'⟩) :
    ∃! F : RegularFormClass K → M, ∀ p, F (Quotient.mk _ p) = f p :=
  sorry

/-! ## Layer 0: representation, value sets, and binary normal forms -/

/-- **Non-vacuity worked example.** `⟨1,1⟩` and `⟨1,−1⟩` are inequivalent over `ℚ`:
the first is anisotropic, that is positive definite, and the second is the hyperbolic
plane. -/
example :
    ¬ (weightedSumSquares ℚ ![(1 : ℚ), 1]).Equivalent (weightedSumSquares ℚ ![(1 : ℚ), -1]) :=
  sorry

/-- **Layer 0, every form represents the scalar `0`.** The witness is the zero vector, so this
holds for every `Q`, on every space, with no regularity and no finiteness hypothesis. It is
recorded as a theorem because it is what makes the full value set useless as an invariant, and
it is why every classification statement below is about `unitValueSet`. -/
theorem represents_zero {V : Type v} [AddCommGroup V] [Module K V] (Q : QuadraticForm K V) :
    ∃ v : V, Q v = 0 :=
  ⟨0, by simp⟩

/-- **Layer 0, representing `0` is not isotropy.** An anisotropic form still represents the
scalar `0`, and does so only through the zero vector. The two notions are kept apart
throughout: `Represents Q 0` is the theorem above, and "isotropic" is `¬ Q.Anisotropic`, which
demands a **nonzero** vector. ⚠ Never read the first as evidence of the second. -/
theorem represents_zero_of_anisotropic {V : Type v} [AddCommGroup V] [Module K V]
    (Q : QuadraticForm K V) (hQ : Q.Anisotropic) :
    (∃ v : V, Q v = 0) ∧ ∀ v : V, Q v = 0 → v = 0 :=
  ⟨represents_zero Q, hQ⟩

/-- **Layer 0, the representation criterion** (Lam I.3.5). A regular diagonal form
represents a unit `a` exactly when `⟨−a⟩ ⊥ q` is isotropic. This turns every value-set
question into an isotropy question. The criterion is about the unit value set `D(q)`, and the
hypothesis `a : Kˣ` carries its content: the right-hand side asks for a **nonzero** vector on
which `⟨−a⟩ ⊥ q` vanishes, and only for `a ≠ 0` can its first coordinate be normalized to `1`
and the isotropic vector turned into a representation of `a` by `q`. ⚠ Read at `a = 0` both
sides degenerate — the left is `represents_zero`, true for every `q`, and the right is isotropy
of the degenerate form `⟨0⟩ ⊥ q`, also true for every `q` — so the criterion is stated for units
and nowhere else. -/
example [Invertible (2 : K)] {n : ℕ} (w : Fin n → Kˣ) (a : Kˣ) :
    (∃ x : Fin n → K, weightedSumSquares K (fun i => ((w i : K))) x = a) ↔
      ¬ (weightedSumSquares K (Fin.cons (-(a : K)) fun i => ((w i : K)))).Anisotropic :=
  sorry

/-- **Layer 0, the binary representation normal form** (Lam I.2.3(2)). A binary form
represents `c` exactly when `c` can be taken as its first coefficient, the second being
forced by the discriminant. The second coefficient is written `a*b*c`, which is the
square class of `a*b/c`. Both spellings occur in the sources, and their agreement is part
of the milestone. -/
example [Invertible (2 : K)] (a b c : Kˣ) :
    (∃ x : Fin 2 → K, weightedSumSquares K ![(a : K), b] x = c) ↔
      (weightedSumSquares K ![(a : K), b]).Equivalent
        (weightedSumSquares K ![(c : K), (a : K) * b * c]) :=
  sorry

/-- **Layer 0, the binary equivalence criterion** (Lam I.5.1). Two regular binary
diagonal forms are equivalent exactly when they have the same discriminant in square
classes, that is `IsSquare (a*b*(c*d))` in the quotient-free spelling of
`TauCeti.squareClass_eq_zero_iff`, and represent a common unit. This is the single
binary move to which chain equivalence reduces every equivalence of diagonal forms. -/
example [Invertible (2 : K)] (a b c d : Kˣ) :
    (weightedSumSquares K ![(a : K), b]).Equivalent (weightedSumSquares K ![(c : K), d]) ↔
      (IsSquare (a * b * (c * d)) ∧
        ∃ e : Kˣ, (∃ x : Fin 2 → K, weightedSumSquares K ![(a : K), b] x = e) ∧
          ∃ x : Fin 2 → K, weightedSumSquares K ![(c : K), d] x = e) :=
  sorry

/-! ## Layer 1: hyperbolic planes and Witt theory -/

/-- **Layer 1, the hyperbolic plane is universal.** `⟨1,−1⟩` represents every unit, with
the witness `((a+1)/2)² − ((a−1)/2)² = a`. -/
example [Invertible (2 : K)] (a : Kˣ) :
    ∃ x : Fin 2 → K, weightedSumSquares K ![(1 : K), -1] x = a :=
  sorry

/-- **Layer 1, isotropic regular forms split off a hyperbolic plane** (Lam I.3.4). A
nondegenerate isotropic form is equivalent to `⟨1,−1⟩ ⊥ q'` with `q'` regular
diagonal. -/
example [Invertible (2 : K)] {V : Type v} [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (h : ¬ Q.Anisotropic) :
    ∃ (r : ℕ) (a : Fin r → Kˣ),
      Q.Equivalent ((weightedSumSquares K ![(1 : K), -1]).prod
        (weightedSumSquares K fun i => ((a i : K)))) :=
  sorry

/-- **Layer 1, Witt decomposition** (Lam I.4.1, nondegenerate case). Every nondegenerate
form is equivalent to `m` hyperbolic planes plus an anisotropic form. Here `m` is the
Witt index, and the anisotropic part is unique up to equivalence; uniqueness is a
separate milestone that uses cancellation below. -/
example [Invertible (2 : K)] {V : Type v} [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) :
    ∃ (m r : ℕ) (a : Fin r → Kˣ),
      Module.finrank K V = 2 * m + r ∧
      Q.Equivalent
        ((weightedSumSquares K
            (Sum.elim (fun _ : Fin m => (1 : K)) fun _ : Fin m => (-1 : K))).prod
          (weightedSumSquares K fun i => ((a i : K)))) ∧
      (weightedSumSquares K fun i => ((a i : K))).Anisotropic :=
  sorry

/-- **Layer 1, Witt cancellation** (Lam I.4.2). A common regular orthogonal summand
cancels. Regularity of all three forms is part of the statement: cancellation is false
without it. The proof runs through hyperplane reflections (Lam I.4.5 to I.4.7). -/
example [Invertible (2 : K)] {U V₁ V₂ : Type v}
    [AddCommGroup U] [Module K U] [FiniteDimensional K U]
    [AddCommGroup V₁] [Module K V₁] [FiniteDimensional K V₁]
    [AddCommGroup V₂] [Module K V₂] [FiniteDimensional K V₂]
    (Q : QuadraticForm K U) (Q₁ : QuadraticForm K V₁) (Q₂ : QuadraticForm K V₂)
    (hQ : Q.Nondegenerate) (hQ₁ : Q₁.Nondegenerate) (hQ₂ : Q₂.Nondegenerate)
    (h : (Q.prod Q₁).Equivalent (Q.prod Q₂)) :
    Q₁.Equivalent Q₂ :=
  sorry

/-! ## Layer 2: quaternion algebras and the four-fold splitting criterion -/

/-- **Layer 2, the norm form of a quaternion algebra.** The map `x ↦ (x * star x).re` is
scalar-valued by Mathlib's `QuaternionAlgebra.mul_star_eq_coe`. It is a quadratic form on
`ℍ[K, a, b]`, equivalent to the 2-fold Pfister form `⟨⟨a,b⟩⟩ = ⟨1, −a, −b, ab⟩`. -/
example [Invertible (2 : K)] (a b : Kˣ) :
    ∃ Q : QuadraticForm K ℍ[K, (a : K), (b : K)],
      (∀ x, Q x = (x * star x).re) ∧
      Q.Equivalent (weightedSumSquares K ![(1 : K), -(a : K), -(b : K), (a : K) * b]) :=
  sorry

/-- **Layer 2, split or division** (Lam III.2.2, III.2.7). A quaternion algebra over a
field is a division algebra or is isomorphic to `M₂(K)`. Both halves are computations
with the norm form, and neither needs central simplicity, which is a Layer 5
prerequisite. -/
example [Invertible (2 : K)] (a b : Kˣ) :
    (∀ x : ℍ[K, (a : K), (b : K)], x ≠ 0 → IsUnit x) ∨
      Nonempty (ℍ[K, (a : K), (b : K)] ≃ₐ[K] Matrix (Fin 2) (Fin 2) K) :=
  sorry

/-- **Layer 2, the four-fold splitting criterion**, the main theorem of the layer and the
statement that `gq2`'s B11a uses (Lam III.2.7, Serre *CiA* III.1.1-1.2, Gille-Szamuely
1.1.9). For `a, b ∈ Kˣ` the following are equivalent: (1) `ℍ[K,a,b]` splits; (2) `b` is a
norm of the quadratic algebra `K[√a]`, that is Mathlib's `QuadraticAlgebra K a 0`; (3)
`b = x² − ay²` has a solution; (4) `⟨1, −a, −b⟩` is isotropic. When `a` is a square all
four hold, so no non-square hypothesis is carried. The fifth equivalent condition, the
vanishing of the Kummer cup `(a) ∪ (b)`, is Layer 7C. -/
example [Invertible (2 : K)] (a b : Kˣ) :
    [Nonempty (ℍ[K, (a : K), (b : K)] ≃ₐ[K] Matrix (Fin 2) (Fin 2) K),
      ∃ z : QuadraticAlgebra K (a : K) 0, QuadraticAlgebra.norm z = (b : K),
      ∃ x y : K, (b : K) = x ^ 2 - (a : K) * y ^ 2,
      ¬ (weightedSumSquares K ![(1 : K), -(a : K), -(b : K)]).Anisotropic].TFAE :=
  sorry

/-- **Layer 3, the binary quaternion lemma.** Equivalent binary forms have isomorphic
quaternion algebras. This is the one nontrivial input to the well-definedness of the
Hasse invariant in Layer 5 and of the local Hasse invariant in Layer 6C (Lam III.2.11,
V.3.18). It is proved here, where its codomain is only an isomorphism class of
algebras. -/
example [Invertible (2 : K)] (a b c d : Kˣ)
    (h : (weightedSumSquares K ![(a : K), b]).Equivalent
      (weightedSumSquares K ![(c : K), d])) :
    Nonempty (ℍ[K, (a : K), (b : K)] ≃ₐ[K] ℍ[K, (c : K), (d : K)]) :=
  sorry

/-! ## Layer 3: the classical invariants that need no Brauer group -/

/-- **Layer 3, discriminant invariance.** Equivalent regular diagonal forms have the same
discriminant in square classes, in the quotient-free spelling. The signed discriminant
`d± = (−1)^{n(n−1)/2} d` transports along the same statement, because the dimensions
agree. -/
example [Invertible (2 : K)] {n : ℕ} (w w' : Fin n → Kˣ)
    (h : (weightedSumSquares K fun i => ((w i : K))).Equivalent
      (weightedSumSquares K fun i => ((w' i : K)))) :
    IsSquare ((∏ i, w i) * ∏ i, w' i) :=
  sorry

/-- **Layer 3, the discriminant** of a regular-form class in the square-class group. -/
noncomputable def discr [Invertible (2 : K)] :
    RegularFormClass K → Kˣ ⧸ Subgroup.square Kˣ :=
  sorry

theorem discr_mk [Invertible (2 : K)] {n : ℕ} (w : Fin n → Kˣ) :
    discr (Quotient.mk _ ⟨n, w⟩) = QuotientGroup.mk (∏ i, w i) :=
  sorry

/-- **Layer 3, the signed discriminant**, kept separate from `discr` so that consumers cannot
silently switch sign conventions. -/
noncomputable def signedDiscr [Invertible (2 : K)] :
    RegularFormClass K → Kˣ ⧸ Subgroup.square Kˣ :=
  sorry

theorem signedDiscr_mk [Invertible (2 : K)] {n : ℕ} (w : Fin n → Kˣ) :
    signedDiscr (Quotient.mk _ ⟨n, w⟩) =
      QuotientGroup.mk ((-1 : Kˣ) ^ (n * (n - 1) / 2) * ∏ i, w i) :=
  sorry

theorem signedDiscr_eq_sign_mul_discr [Invertible (2 : K)] {n : ℕ}
    (w : Fin n → Kˣ) :
    signedDiscr (Quotient.mk _ ⟨n, w⟩) =
      QuotientGroup.mk ((-1 : Kˣ) ^ (n * (n - 1) / 2)) *
        discr (Quotient.mk _ ⟨n, w⟩) :=
  sorry

/-! ## Layer 5: the Brauer group and the Hasse invariant

The carrier and the group law are both canonical. The law is the accepted
semisimple-algebras declaration `brauerCommGroup`, whose multiplication is induced by
`⊗_K`; this file imports it. What Layer 5 adds is the central simplicity of quaternion
algebras, and then the symbol is the class of `ℍ[K,a,b]` and nothing else. -/

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, quaternion algebras are central.** The hypothesis `Invertible (2 : K)` is
the standing one, and it is what the proof of central simplicity uses. -/
instance quaternionAlgebra_isCentral [Invertible (2 : K)] (a b : Kˣ) :
    Algebra.IsCentral K ℍ[K, (a : K), (b : K)] :=
  sorry

/-- **Layer 5, quaternion algebras are simple.** -/
instance quaternionAlgebra_isSimpleRing [Invertible (2 : K)] (a b : Kˣ) :
    IsSimpleRing ℍ[K, (a : K), (b : K)] :=
  sorry

/-- **Layer 5, quaternion algebras are four-dimensional.** -/
instance quaternionAlgebra_finiteDimensional (a b : Kˣ) :
    FiniteDimensional K ℍ[K, (a : K), (b : K)] :=
  sorry

/-- The quaternion algebra as a central simple algebra. -/
noncomputable def quaternionCSA [Invertible (2 : K)] (a b : Kˣ) : CSA.{u, u} K :=
  { toAlgCat := AlgCat.of K ℍ[K, (a : K), (b : K)] }

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, the quaternion symbol** `[(a,b)] = ⟦ℍ[K,a,b]⟧` in `BrauerGroup K`, with the
group law `brauerCommGroup` of the semisimple-algebras roadmap. -/
noncomputable def quaternionClass [Invertible (2 : K)] (a b : Kˣ) : BrauerGroup.{u, u} K :=
  Quotient.mk _ (quaternionCSA a b)

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, symmetry of the symbol.** -/
theorem quaternionClass_symm [Invertible (2 : K)] (a b : Kˣ) :
    quaternionClass a b = quaternionClass b a :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, the symbol is 2-torsion**, from `ℍ[K,a,b]ᵒᵖ ≃ₐ[K] ℍ[K,a,b]` through
`star`. -/
theorem quaternionClass_sq [Invertible (2 : K)] (a b : Kˣ) :
    quaternionClass a b ^ 2 = 1 :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, bilinearity of the symbol** (Gille-Szamuely 1.5.2 for the statement,
Lam III.2.11 for the linkage). This is a statement about the tensor-product law, and it
consumes `tensorProduct_isSimpleRing` and `tensorOp_algEquiv_matrix`. -/
theorem quaternionClass_mul [Invertible (2 : K)] (a b c : Kˣ) :
    quaternionClass a (b * c) = quaternionClass a b * quaternionClass a c :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, the symbol on equivalent binary forms.** This is the Layer 3 binary
quaternion lemma read in `BrauerGroup K`, and it is what the descent of the Hasse
invariant uses. It does not follow from symmetry, 2-torsion, and bilinearity alone: a
symmetric bilinear pairing on square classes satisfies those three and can take a
nonzero value at `([2],[−1])`, while `⟨2,−1⟩ ≅ ⟨1,−2⟩` forces the value `1`. -/
theorem quaternionClass_congr [Invertible (2 : K)] (a b c d : Kˣ)
    (h : (weightedSumSquares K ![(a : K), b]).Equivalent
      (weightedSumSquares K ![(c : K), d])) :
    quaternionClass a b = quaternionClass c d :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, the Steinberg relation** for `a : Kˣ` with `1 − a ≠ 0`. -/
theorem quaternionClass_one_sub [Invertible (2 : K)] (a : Kˣ) (h : (1 : K) - a ≠ 0) :
    quaternionClass a (Units.mk0 ((1 : K) - a) h) = 1 :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, the Hasse invariant** on a diagonal tuple, in the Lam and Serre convention
`∏_{i<j}`, with the empty product in ranks `0` and `1`. -/
noncomputable def hasseInvariant [Invertible (2 : K)] {n : ℕ} (w : Fin n → Kˣ) :
    BrauerGroup.{u, u} K :=
  ∏ ij ∈ Finset.univ.filter fun ij : Fin n × Fin n => ij.1 < ij.2,
    quaternionClass (w ij.1) (w ij.2)

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, well-definedness of the Hasse invariant**, by the Layer 0 descent
principle: permutation invariance from `quaternionClass_symm`, and binary invariance from
`quaternionClass_mul` together with `quaternionClass_congr`. -/
theorem hasseInvariant_congr [Invertible (2 : K)] {n : ℕ} (w w' : Fin n → Kˣ)
    (h : (weightedSumSquares K fun i => ((w i : K))).Equivalent
      (weightedSumSquares K fun i => ((w' i : K)))) :
    hasseInvariant w = hasseInvariant w' :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, the orthogonal-sum formula** (Lam p. 119):
`s(q ⊥ r) = s(q) · s(r) · [(d(q), d(r))]`. -/
theorem hasseInvariant_append [Invertible (2 : K)] {m n : ℕ} (w : Fin m → Kˣ)
    (w' : Fin n → Kˣ) :
    hasseInvariant (Fin.append w w') =
      hasseInvariant w * hasseInvariant w' * quaternionClass (∏ i, w i) (∏ i, w' i) :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, the scaling formula** (Lam V.3.16):
`s(λ • q) = s(q) · [(λ, −1)]^{n(n−1)/2} · [(λ, d(q))]^{n−1}`. It is written out because
each source states it in a different convention. -/
theorem hasseInvariant_smul [Invertible (2 : K)] {n : ℕ} (lam : Kˣ) (w : Fin n → Kˣ) :
    hasseInvariant (fun i => lam * w i) =
      hasseInvariant w * quaternionClass lam (-1) ^ (n * (n - 1) / 2) *
        quaternionClass lam (∏ i, w i) ^ (n - 1) :=
  sorry

/-! ## Layer 4: the Witt ring, the fundamental ideal, and the Clifford invariant

These are the carriers that Layer 5's `I²` homomorphism and Layer 8's comparisons use.
Their types and map directions are fixed here; the constructions are milestones. -/

/-- **Layer 4, the semiring of isometry classes**, with `⊥` as addition and `⊗` as
multiplication. -/
noncomputable instance regularFormClassSemiring [Invertible (2 : K)] :
    CommSemiring (RegularFormClass K) :=
  sorry

/-- **Layer 4, the Witt-Grothendieck ring**, the Grothendieck group of that semiring. -/
def wittGrothendieckRing (K : Type u) [Field K] [Invertible (2 : K)] : Type u :=
  sorry

noncomputable instance [Invertible (2 : K)] : CommRing (wittGrothendieckRing K) := sorry

/-- **Layer 4, the Witt ring**, the quotient by the ideal generated by the hyperbolic
plane. -/
def wittRing (K : Type u) [Field K] [Invertible (2 : K)] : Type u :=
  sorry

noncomputable instance [Invertible (2 : K)] : CommRing (wittRing K) := sorry

/-- **Layer 4, the quotient map** from the Witt-Grothendieck ring to the Witt ring. -/
noncomputable def toWittRing [Invertible (2 : K)] :
    wittGrothendieckRing K →+* wittRing K :=
  sorry

/-- **Layer 4, the dimension map** `W(K) → ZMod 2`. -/
noncomputable def wittDimMod2 [Invertible (2 : K)] : wittRing K →+* ZMod 2 :=
  sorry

/-- **Layer 4, the fundamental ideal** `I(K) = ker(W(K) → ZMod 2)`. -/
noncomputable def fundamentalIdeal (K : Type u) [Field K] [Invertible (2 : K)] :
    Ideal (wittRing K) :=
  RingHom.ker (wittDimMod2 (K := K))

/-- **Layer 4, the class of a form in the Witt-Grothendieck ring.** `(RegularFormClass K, ⊥, ⊗)`
is a commutative semiring and `Ŵ(K)` is its Grothendieck group, so this is the canonical map into
it. Without it no statement about which forms generate an ideal of `W(K)` is expressible, and the
generation milestones below would have no subject. -/
noncomputable def toWittGrothendieck [Invertible (2 : K)] :
    RegularFormClass K →+* wittGrothendieckRing K :=
  sorry

/-- **Layer 4, the Witt class of a form**, the composite of the two maps above. -/
noncomputable def wittClass [Invertible (2 : K)] : RegularFormClass K →+* wittRing K :=
  toWittRing.comp toWittGrothendieck

/-- **Layer 4, the signed discriminant on the fundamental ideal**, whose kernel is `I²`.
That pair of statements is `I/I² ≅ Kˣ/(Kˣ)²`. -/
noncomputable def signedDiscrHom [Invertible (2 : K)] :
    ↥(fundamentalIdeal K) →+ Additive (Kˣ ⧸ Subgroup.square Kˣ) :=
  sorry

theorem signedDiscrHom_surjective [Invertible (2 : K)] :
    Function.Surjective (signedDiscrHom (K := K)) :=
  sorry

theorem signedDiscrHom_eq_zero_iff [Invertible (2 : K)] (x : ↥(fundamentalIdeal K)) :
    signedDiscrHom x = 0 ↔ (x : wittRing K) ∈ fundamentalIdeal K ^ 2 :=
  sorry

/-- **Layer 4, the `n`-fold Pfister form** `⟨⟨a₁,…,aₙ⟩⟩ = ⟨1,−a₁⟩ ⊗ ⋯ ⊗ ⟨1,−aₙ⟩`, as a
presentation of rank `2^n`. The tuple is real data and not a `sorry`, because the tuple *is* the
minus-sign convention of Lam Ch. X and EKM that the README pins: the slot `k` carries
`∏_{i ∈ S} (−aᵢ)` for the subset `S` read off the binary digits of `k`. So `⟨⟨a⟩⟩ = ⟨1,−a⟩` and
`⟨⟨a,b⟩⟩ = ⟨1,−a,−b,ab⟩`, and a source using `⟨1,a⟩` factors disagrees with this file. -/
def pfisterForm {n : ℕ} (a : Fin n → Kˣ) : Fin (2 ^ n) → Kˣ :=
  fun k => ∏ i ∈ Finset.univ.filter fun i : Fin n => k.val.testBit i.val = true, (-(a i))

/-- `⟨⟨a⟩⟩ = ⟨1, −a⟩`. -/
theorem pfisterForm_one (a : Kˣ) : pfisterForm ![a] = ![1, -a] :=
  sorry

/-- `⟨⟨a,b⟩⟩ = ⟨1, −a, −b, ab⟩`, which is Layer 2's quaternion norm form. -/
theorem pfisterForm_two (a b : Kˣ) : pfisterForm ![a, b] = ![1, -a, -b, a * b] :=
  sorry

/-- **Layer 4, `Iⁿ` is generated as an additive group by the `n`-fold Pfister forms.** Stated for
general `n`; Layer 5 consumes `n = 2` for the construction of `c` and `n = 3` for its vanishing,
and Layer 8 consumes `n = 2`. ⚠ Additive generation, not ideal generation: the weaker ideal
statement does not let a homomorphism be defined by its values on the generators. -/
theorem fundamentalIdeal_pow_eq_addClosure [Invertible (2 : K)] (n : ℕ) :
    ((fundamentalIdeal K ^ n : Ideal (wittRing K)) : Set (wittRing K)) =
      ↑(AddSubgroup.closure
        {x : wittRing K | ∃ a : Fin n → Kˣ,
          x = wittClass (Quotient.mk (regularFormSetoid K) ⟨2 ^ n, pfisterForm a⟩)}) :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, the Clifford invariant.** The Brauer class of `C(q)` in even rank and of
`C₀(q)` in odd rank. Central simplicity of those algebras is a Layer 5 milestone. -/
noncomputable def cliffordInvariant [Invertible (2 : K)] {n : ℕ} (w : Fin n → Kˣ) :
    BrauerGroup.{u, u} K :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, the comparison of the two Brauer-valued invariants** (Lam V.3.20), with
the ⚠ Wall caution of the README's convention table. -/
theorem cliffordInvariant_eq [Invertible (2 : K)] {n : ℕ} (w : Fin n → Kˣ) :
    cliffordInvariant w =
      hasseInvariant w * quaternionClass (-1) (∏ i, w i) ^ ((n - 1) * (n - 2) / 2) *
        quaternionClass (-1) (-1) ^ ((n + 1) * n * (n - 1) * (n - 2) / 24) :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, step 1 of `c : I² → Br(K)[2]`: additivity of the Clifford invariant on `I²`.**
`c(q ⊥ r) = c(q) · c(r)` when both summands lie in `I²`, that is when each has even rank and
trivial signed discriminant. The correction terms of `cliffordInvariant_eq` and of
`hasseInvariant_append` cancel exactly there, and nowhere else: over a general pair the
identity is false, so the two hypotheses are part of the statement. This additivity, and not
"the universal property", is what lets the homomorphism below exist. -/
theorem cliffordInvariant_append_of_mem_I2 [Invertible (2 : K)] {m n : ℕ}
    (w : Fin m → Kˣ) (w' : Fin n → Kˣ) (hm : Even m) (hn : Even n)
    (hdm : IsSquare ((-1 : Kˣ) ^ (m * (m - 1) / 2) * ∏ i, w i))
    (hdn : IsSquare ((-1 : Kˣ) ^ (n * (n - 1) / 2) * ∏ i, w' i)) :
    cliffordInvariant (Fin.append w w') = cliffordInvariant w * cliffordInvariant w' :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, step 2: the value on a 2-fold Pfister generator.** `c(⟨⟨a,b⟩⟩) = [(a,b)]`, from
`cliffordInvariant_eq` and `hasseInvariant` of `⟨1,−a,−b,ab⟩`. Together with additivity and
Layer 4's `fundamentalIdeal_pow_eq_addClosure` at `n = 2`, it determines `c` on all of `I²`. -/
theorem cliffordInvariant_pfisterForm_two [Invertible (2 : K)] (a b : Kˣ) :
    cliffordInvariant (pfisterForm ![a, b]) = quaternionClass a b :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, step 3: the value on a 3-fold Pfister generator vanishes** (Lam V.3.4). This is
the computation that the vanishing on `I³` reduces to, and it is stated on the generator itself
rather than only on the ideal, because that is what `fundamentalIdeal_pow_eq_addClosure` at
`n = 3` lets a proof check. -/
theorem cliffordInvariant_pfisterForm_three [Invertible (2 : K)] (a b c : Kˣ) :
    cliffordInvariant (pfisterForm ![a, b, c]) = 1 :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, step 4: the homomorphism `c : I² → Br(K)[2]`** induced by the Clifford invariant.
It exists by additivity (step 1) together with Layer 4's additive generation of `I²` by the
2-fold Pfister forms; `cliffordHomI2_pfisterForm` is what ties it to `cliffordInvariant`, and
without that equation the declaration would assert nothing. -/
noncomputable def cliffordHomI2 [Invertible (2 : K)] :
    ↥(fundamentalIdeal K ^ 2) →+ Additive (BrauerGroup.{u, u} K) :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, `c` computes the Clifford invariant on the generators.** -/
theorem cliffordHomI2_pfisterForm [Invertible (2 : K)] (a b : Kˣ)
    (h : wittClass (Quotient.mk (regularFormSetoid K) ⟨2 ^ 2, pfisterForm ![a, b]⟩) ∈
      fundamentalIdeal K ^ 2) :
    cliffordHomI2 ⟨_, h⟩ = Additive.ofMul (quaternionClass a b) :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, `c` lands in the 2-torsion**, said additively, which is the statement
`c : I² → Br(K)[2]` of the README. -/
theorem cliffordHomI2_two_torsion [Invertible (2 : K)] (x : ↥(fundamentalIdeal K ^ 2)) :
    cliffordHomI2 x + cliffordHomI2 x = 0 :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, step 5: `c` vanishes on `I³`**, checked on the 3-fold Pfister generators
(Lam V.3.4) through Layer 4's `fundamentalIdeal_pow_eq_addClosure` at `n = 3`. -/
theorem cliffordHomI2_eq_zero [Invertible (2 : K)] (x : ↥(fundamentalIdeal K ^ 2))
    (hx : (x : wittRing K) ∈ fundamentalIdeal K ^ 3) :
    cliffordHomI2 x = 0 :=
  sorry

/-- `I³` seen as a submodule of `I²`, which is the subobject the quotient below divides by. -/
noncomputable abbrev fundamentalI3InI2 (K : Type u) [Field K] [Invertible (2 : K)] :
    Submodule (wittRing K) ↥(fundamentalIdeal K ^ 2) :=
  Submodule.comap (fundamentalIdeal K ^ 2).subtype (fundamentalIdeal K ^ 3)

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 5, step 6: the quotient homomorphism `c̄ : I²/I³ → Br(K)[2]`.** It is a named
declaration together with the equation `cliffordHomI2Bar_mk` that computes it on a
representative, and not the phrase "by the universal property": an unnamed map out of the
quotient is not citable, and a named one without that equation asserts nothing.

⚠ No injectivity claim, no surjectivity claim, and no classification claim is made for `c̄`.
Injectivity is Merkurjev's theorem, which no roadmap in this family proves; it is an explicit
exclusion and never a promised interface. -/
noncomputable def cliffordHomI2Bar [Invertible (2 : K)] :
    (↥(fundamentalIdeal K ^ 2) ⧸ fundamentalI3InI2 K) →+ Additive (BrauerGroup.{u, u} K) :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- `c̄` on a representative is `c`, which is the equation that makes the previous declaration
the descent of `cliffordHomI2` and not an unrelated map of the same type. -/
theorem cliffordHomI2Bar_mk [Invertible (2 : K)] (x : ↥(fundamentalIdeal K ^ 2)) :
    cliffordHomI2Bar (Submodule.Quotient.mk x) = cliffordHomI2 x :=
  sorry

/-! ## Layer 6A: consuming the Local Fields Ramification substrate

The general arithmetic of a nonarchimedean local field belongs to the
[Local Fields Ramification roadmap](../LocalFieldsRamification/README.md), and this sublayer consumes it rather than
building a second copy. The normalized valuation is
`TauCetiRoadmap.LocalFieldsRamification.normalizedValuation`, the unit filtration is
`TauCetiRoadmap.LocalFieldsRamification.unitFiltration`, the absolute ramification index
`e = v_K(2)` is `TauCetiRoadmap.LocalFieldsRamification.natCastValuation K 2`, named `dyadicLevel` here, and the identification of the two
spellings of the square classes is that roadmap's `square_eq_range_powMonoidHom`. All four are
opened by name below, and no valuation, no filtration and no ramification index is defined here.

What remains is the quadratic-form-facing arithmetic, stated against those objects: the
uniformizer predicate in its valuation form together with the lemma comparing it with the
supplier's `Irreducible` convention, the sharp local square theorem, the square-class counts in
the `4·q^e` shape that 6D consumes, and the unramified norm description in the shape 6C consumes.
Each of the last three carries a remark naming the Local Fields Ramification milestone it rests on. -/

section LocalField

open scoped ValuativeRel
open TauCetiRoadmap.LocalFieldsRamification (normalizedValuation unitFiltration
  natCastValuation absoluteRamificationIndex square_eq_range_powMonoidHom
  UnitFiltrationGraded)

variable (K)
variable [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- **Layer 6A, the dyadic level** `e = v_K(2)`, the supplier's `natCastValuation` at `2`.
⚠ It is deliberately **not** `absoluteRamificationIndex K 2`. That name is reserved by the
supplier for a finite extension of `ℚ_p`, so writing it at `p = 2` forces `[Algebra ℚ_[2] K]`,
and then `e = 0` — the odd-residue-characteristic case every count below splits on — is
unsatisfiable rather than merely false. `natCastValuation` is defined for every nonarchimedean
local field in which `2` is nonzero, and takes the value `0` exactly in odd residue
characteristic, which is the split the square-class counts need. -/
noncomputable def dyadicLevel [Invertible (2 : K)] : ℕ :=
  natCastValuation K 2 (by simpa using (isUnit_of_invertible (2 : K)).ne_zero)

/-- **Layer 6A, the comparison with the supplier's absolute ramification index.** In mixed
characteristic `2` the two agree, by the supplier's
`absoluteRamificationIndex_eq_natCastValuation`; this is the only place the reserved name is
used, and it is what lets a consumer that already has `K/ℚ_2` quote either. -/
theorem dyadicLevel_eq_absoluteRamificationIndex [Invertible (2 : K)] [Fact (Nat.Prime 2)]
    [Algebra ℚ_[2] K] [ValuativeExtension ℚ_[2] K] [Module.Finite ℚ_[2] K] :
    dyadicLevel K = absoluteRamificationIndex K 2 :=
  sorry

variable {K}

/-- **Layer 6A, a uniformizer** is an element of valuation one, said with the supplier's
valuation. It is a choice, so it is a predicate and not a field of a package: over `ℚ_2` both
`2` and `−2` have valuation one. -/
def IsUniformizer (π : Kˣ) : Prop :=
  normalizedValuation K π = Multiplicative.ofAdd 1

variable (K)

/-- **Layer 6A, the two descriptions of a uniformizer agree.** The Local Fields Ramification roadmap pins
uniformizers through `Irreducible` in `𝒪[K]`, and its `normalizedValuation_irreducible` gives
one direction. This is the equivalence, and it is the single lemma that relates the predicate
above to that convention; every later statement uses whichever side is convenient. -/
theorem isUniformizer_iff_exists_irreducible (π : Kˣ) :
    IsUniformizer (K := K) π ↔ ∃ ϖ : 𝒪[K], Irreducible ϖ ∧ (ϖ : K) = (π : K) :=
  sorry

/-- A uniformizer exists. Statements that need one take it and this proof explicitly. -/
theorem exists_isUniformizer : ∃ π : Kˣ, IsUniformizer (K := K) π :=
  sorry

/-- **Layer 6A, the local square theorem in its sharp form** (O'Meara 63:1):
`U(K, 2e+1) ⊆ (Kˣ)²`. The Local Fields Ramification roadmap owns this mathematics, in its Layer 1 milestone
*Deep units are squares, in mixed characteristic*, and carries the dyadic instance
`1 + 8ℤ_2 ⊆ (ℚ_2ˣ)²` as a worked example; it exports no target signature for the general
statement, so the form that 6B and 6C consume is stated here, against the supplier's
`unitFiltration` and `dyadicLevel`. -/
theorem unitFiltration_le_square [Invertible (2 : K)] :
    unitFiltration K (2 * dyadicLevel K + 1) ≤ Subgroup.square Kˣ :=
  sorry

/-- **Layer 6A, sharpness of the local square theorem.** The bound `2e+1` cannot be
lowered. Over `ℚ_2`, where `e = 1`, the unit `5` lies in `U(ℚ_2, 2)` and is not a
square. -/
theorem not_unitFiltration_le_square [Invertible (2 : K)] :
    ¬ (unitFiltration K (2 * dyadicLevel K) ≤ Subgroup.square Kˣ) :=
  sorry

/-- **Layer 6A, the square-class group is finite.** A corollary of the Local Fields Ramification Layer 1
milestone *Power classes, the primary statement*, through `square_eq_range_powMonoidHom`. -/
instance squareClass_finite [Invertible (2 : K)] : Finite (Kˣ ⧸ Subgroup.square Kˣ) :=
  sorry

/-- **Layer 6A, the square-class count in odd residue characteristic**, together with the
representatives `1, u, π, uπ` for a uniformizer `π` and a unit `u` whose residue is a
nonsquare. This is the Local Fields Ramification Layer 1 count
`#(Kˣ/(Kˣ)ⁿ) = n · #μ_n(K) · q^{v_K(n)}` at `n = 2` with `e = 0`, in the shape 6D consumes. -/
theorem card_squareClass_of_odd [Invertible (2 : K)]
    (hodd : dyadicLevel K = 0) :
    Nat.card (Kˣ ⧸ Subgroup.square Kˣ) = 4 :=
  sorry

/-- **Layer 6A, the square-class count in residue characteristic two**, stated
intrinsically as `4 · q^e` with `q = #𝓀[K]` and `e = v_K(2)`. For a finite extension of
`ℚ_2` of degree `N = e·f` this is `2^{N+2}`, and over `ℚ_2` itself it is `8`, on the
basis `−1, 2, 5`. It is the same Local Fields Ramification count at `n = 2`, where `#μ_2(K) = 2` because
`2` is invertible; the Local Fields Ramification roadmap exports the general formula as a milestone and the
`ℚ_2` instance as a worked example, so the `4·q^e` shape that 6D consumes is stated here. -/
theorem card_squareClass_of_dyadic [Invertible (2 : K)]
    (h2 : dyadicLevel K ≠ 0) :
    Nat.card (Kˣ ⧸ Subgroup.square Kˣ) =
      4 * Nat.card (IsLocalRing.ResidueField 𝒪[K]) ^ dyadicLevel K :=
  sorry

/-- **Layer 6A, the graded piece at depth zero**, `U(K,0)/U(K,1) ≃* 𝓀[K]ˣ` by reduction. The
carrier is the Local Fields Ramification roadmap's `UnitFiltrationGraded`; the isomorphism is
that roadmap's Layer 1 milestone *Graded pieces*, which exports no target signature, so the
shape 6B consumes is frozen here. It is stated as an existence because the isomorphism itself is
the supplier's and this roadmap builds no second copy of it. -/
theorem nonempty_unitFiltrationGraded_zero_equiv :
    Nonempty (UnitFiltrationGraded K 0 ≃* 𝓀[K]ˣ) :=
  sorry

/-- **Layer 6A, the graded pieces at positive depth**, `U(K,i+1)/U(K,i+2) ≃* 𝓀[K]⁺` through
`1 + x ↦ x mod 𝓂^{i+2}`. ⚠ The depth-zero piece is multiplicative and the deeper pieces are
additive, which is why the two statements stay apart. 6B needs the additive form: the
classification of unit defects improves an approximation `u = 1 + ε` with `v(ε) = d` by writing
the residue of `ε` as a square, which is possible exactly because the piece is `𝓀[K]⁺` and
`𝓀[K]` is a perfect field of characteristic `2` in the dyadic case. -/
theorem nonempty_unitFiltrationGraded_succ_equiv (i : ℕ) :
    Nonempty (UnitFiltrationGraded K (i + 1) ≃* Multiplicative 𝓀[K]) :=
  sorry

/-- **Layer 6A, the unramified quadratic extension and its norms, existence.** There is a
nonsquare `Δ` of even valuation — so a unit up to squares — such that `K(√Δ)/K` is the
unramified quadratic extension, and an element is a norm from it exactly when its valuation is
even. The statement is phrased through the norm equation, so it needs no extension-building API,
and that is the shape 6B's evaluation formula and 6C's symbol computation consume. It rests on
the Local Fields Ramification Layer 2 milestones *Existence and uniqueness* and *Norms*, which
own the unramified extension and the equality `N_{L/K}(Lˣ) = π^{fℤ} × 𝒪[K]ˣ`; that roadmap
exports no target signature phrased through the norm equation. -/
theorem exists_unramified_class [Invertible (2 : K)] :
    ∃ u : Kˣ, ¬ IsSquare u ∧
      Multiplicative.toAdd (normalizedValuation K u) = 0 ∧
      ∀ b : Kˣ, (∃ x y : K, (b : K) = x ^ 2 - (u : K) * y ^ 2) ↔
        Even (Multiplicative.toAdd (normalizedValuation K b)) :=
  sorry

/-- **Layer 6A, the unramified quadratic extension and its norms, uniqueness.** The norm
criterion pins `Δ` to a single square class, so "the unramified class" is well defined without
building the extension. This is the uniqueness half of the Local Fields Ramification Layer 2
milestone *Existence and uniqueness* at degree `2`, read through the norm equation; 6B's
ramification dictionary needs it, because "exactly one unit square class has defect `4𝒪[K]`" is
a statement about a class and not about a chosen element. -/
theorem unramified_class_unique [Invertible (2 : K)] (u u' : Kˣ)
    (hu : ∀ b : Kˣ, (∃ x y : K, (b : K) = x ^ 2 - (u : K) * y ^ 2) ↔
      Even (Multiplicative.toAdd (normalizedValuation K b)))
    (hu' : ∀ b : Kˣ, (∃ x y : K, (b : K) = x ^ 2 - (u' : K) * y ^ 2) ↔
      Even (Multiplicative.toAdd (normalizedValuation K b))) :
    IsSquare (u * u') :=
  sorry

end LocalField

/-! ## Layer 6B: the quadratic defect

Two decisions are fixed here. The carrier of the defect is a fractional ideal, because
for a general `a` the intersection `⋂_ξ (a − ξ²)·𝒪` has negative valuation once
`v(a) < 0`. Its exponent is `⊤` on squares, because the approximation order is then
unbounded. -/

section Defect

open scoped ValuativeRel
open TauCetiRoadmap.LocalFieldsRamification
  (normalizedValuation unitFiltration natCastValuation)

variable [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- **Layer 6B, the quadratic defect**, as a predicate that fixes `𝔡` to be the largest
fractional ideal contained in every `(a − ξ²)·𝒪[K]`. `FractionalIdeal` has a `Lattice`
and no infima of infinite families, so the greatest-lower-bound property is the
definition, and existence is a milestone. -/
def IsQuadraticDefect (a : Kˣ) (𝔡 : FractionalIdeal (nonZeroDivisors 𝒪[K]) K) : Prop :=
  (∀ ξ : K, 𝔡 ≤ FractionalIdeal.spanSingleton _ ((a : K) - ξ ^ 2)) ∧
    ∀ 𝔢 : FractionalIdeal (nonZeroDivisors 𝒪[K]) K,
      (∀ ξ : K, 𝔢 ≤ FractionalIdeal.spanSingleton _ ((a : K) - ξ ^ 2)) → 𝔢 ≤ 𝔡

/-- **Layer 6B, the defect exists and is unique.** Uniqueness is antisymmetry. Existence
is the content: the ideals `(a − ξ²)·𝒪[K]` are totally ordered, so the family has an
infimum. -/
theorem existsUnique_isQuadraticDefect (a : Kˣ) : ∃! 𝔡, IsQuadraticDefect a 𝔡 :=
  sorry

/-- **Layer 6B, the defect** as a function, from the previous milestone. -/
noncomputable def quadraticDefect (a : Kˣ) : FractionalIdeal (nonZeroDivisors 𝒪[K]) K :=
  (existsUnique_isQuadraticDefect a).choose

/-- **Layer 6B, the defect measures squareness**: it vanishes exactly on squares. -/
theorem quadraticDefect_eq_zero_iff (a : Kˣ) : quadraticDefect a = 0 ↔ IsSquare a :=
  sorry

/-- **Layer 6B, the defect scales by squares**, in the fractional-ideal sense. -/
theorem quadraticDefect_mul_sq (a c : Kˣ) :
    quadraticDefect (a * c ^ 2) =
      FractionalIdeal.spanSingleton _ ((c : K) ^ 2) * quadraticDefect a :=
  sorry

/-- **Layer 6B, the defect exponent** `δ(a) = sup_ξ v_K(a − ξ²)`, with `⊤` on squares,
where the supremum is unbounded. -/
noncomputable def defectExponent (a : Kˣ) : WithTop ℤ :=
  sorry

/-- **Layer 6B, the exponent detects squares.** -/
theorem defectExponent_eq_top_iff (a : Kˣ) : defectExponent a = ⊤ ↔ IsSquare a :=
  sorry

/-- **Layer 6B, the exponent under scaling by a square.** -/
theorem defectExponent_mul_sq (a c : Kˣ) :
    defectExponent (a * c ^ 2) =
      defectExponent a + (2 * Multiplicative.toAdd (normalizedValuation K c) : ℤ) :=
  sorry

/-- **Layer 6B, the exponent of an element of odd valuation.** Here
`v_K(a − ξ²) = min(v_K(a), 2 v_K(ξ))` for every `ξ`, because the two valuations have
different parities. -/
theorem defectExponent_of_odd (a : Kˣ)
    (ha : ¬ Even (Multiplicative.toAdd (normalizedValuation K a))) :
    defectExponent a = (Multiplicative.toAdd (normalizedValuation K a) : ℤ) :=
  sorry

/-- **Layer 6B, the possible defects of a unit** (O'Meara 63:2). For a unit that is not a
square, the exponent is `2e` or an odd number below `2e`. -/
theorem defectExponent_unit [Invertible (2 : K)] (u : Kˣ)
    (hu : Multiplicative.toAdd (normalizedValuation K u) = 0) (hsq : ¬ IsSquare u) :
    defectExponent u = ((2 * dyadicLevel K : ℕ) : ℤ) ∨
      ∃ k : ℕ, k < dyadicLevel K ∧ defectExponent u = ((2 * k + 1 : ℕ) : ℤ) :=
  sorry

/-- **Layer 6B, the ramification dictionary.** A nonsquare of even exponent is, up to
squares, the unramified class of `exists_unramified_class`. -/
theorem exists_sq_mul_eq_unramified [Invertible (2 : K)] (a : Kˣ) (ha : ¬ IsSquare a)
    (d : ℤ) (hd : defectExponent a = (d : ℤ)) (hev : Even d) :
    ∃ c : Kˣ, defectExponent (a * c ^ 2) = ((2 * dyadicLevel K : ℕ) : ℤ) :=
  sorry

end Defect

/-! ## Layer 6C: the Hilbert symbol and the local Hasse invariant

The symbol is defined from the norm equation, so its definition needs no classification
of quaternion algebras and no local hypothesis. That is what keeps Layer 6 free of the
circularity "values in `{±1}` because there are two local classes, and there are two
local classes by the symbol". Every theorem below carries the local hypotheses. -/

open Classical in
/-- **Layer 6C, the Hilbert symbol**: `+1` when `b` is a norm from `K(√a)`, and `−1`
otherwise. It is total on `Kˣ × Kˣ`, so no junk-value convention is needed. -/
noncomputable def hilbertSymbol (a b : Kˣ) : ℤˣ :=
  if ∃ x y : K, (b : K) = x ^ 2 - (a : K) * y ^ 2 then 1 else -1

/-- **Layer 6C, the local Hasse invariant** on a diagonal tuple, in the Lam and Serre
convention `∏_{i<j}`, with the empty product in ranks `0` and `1`. Its codomain is `ℤˣ`,
and it is built from the Hilbert symbol alone, so it exists whether or not Layer 5's
Brauer-valued invariant does. -/
noncomputable def localHasse {n : ℕ} (w : Fin n → Kˣ) : ℤˣ :=
  ∏ ij ∈ Finset.univ.filter fun ij : Fin n × Fin n => ij.1 < ij.2,
    hilbertSymbol (w ij.1) (w ij.2)

/-- **Layer 6C, square-class invariance in each argument.** True over any field, directly from
the norm equation: `b c² = x² − a y²` iff `b = (x/c)² − a (y/c)²`, and `b = x² − a c² y²` iff
`b = x² − a (cy)²`. This is what makes the symbol a function of a pair of square classes, and it
is the hypothesis under which the Gram matrix of `6C` is a well-defined table. -/
theorem hilbertSymbol_congr_sq (a a' b b' : Kˣ) (ha : IsSquare (a * a')) (hb : IsSquare (b * b')) :
    hilbertSymbol a b = hilbertSymbol a' b' :=
  sorry

/-- **Layer 6C, `(a, −a) = +1`.** True over any field, with the witness `−a = 0² − a · 1²`. It is
the input to `hilbertSymbol_self` below and to the second realization exception of 6D. -/
theorem hilbertSymbol_neg_self (a : Kˣ) : hilbertSymbol a (-a) = 1 :=
  sorry

section LocalSymbol

open scoped ValuativeRel
open TauCetiRoadmap.LocalFieldsRamification (normalizedValuation unitFiltration)

variable [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [Invertible (2 : K)]

/-- **Layer 6C, symmetry** (Serre *CiA* III.1.1). It is proved right after the agreement
of the norm, solvability, and splitting descriptions, so that Serre's orientation and
B11a's orientation are interchangeable from then on. -/
theorem hilbertSymbol_comm (a b : Kˣ) : hilbertSymbol a b = hilbertSymbol b a :=
  sorry

/-- **Layer 6C, evaluation against the unramified class.** For the `Δ` of
`exists_unramified_class`, `(Δ, b)_K = (−1)^{v_K(b)}`. This is the only closed formula
available at this generality. -/
theorem hilbertSymbol_unramified (u : Kˣ)
    (hu : ∀ b : Kˣ, (∃ x y : K, (b : K) = x ^ 2 - (u : K) * y ^ 2) ↔
      Even (Multiplicative.toAdd (normalizedValuation K b))) (b : Kˣ) :
    hilbertSymbol u b = if Even (Multiplicative.toAdd (normalizedValuation K b)) then 1 else -1 :=
  sorry

/-- **Layer 6B, the norm index**, which is the form in which multiplicativity is proved.
For a nonsquare `a`, the norm group of `K(√a)` has index `2` in `Kˣ`: a product of two
non-norms is a norm. -/
theorem hilbertSymbol_mul_of_neg (a : Kˣ) (ha : ¬ IsSquare a) (b c : Kˣ)
    (hb : hilbertSymbol a b = -1) (hc : hilbertSymbol a c = -1) :
    hilbertSymbol a (b * c) = 1 :=
  sorry

/-- **Layer 6C, bimultiplicativity, with the dyadic case included** (Serre *CiA* III
Thm 2; O'Meara 63:11 to 63:13 by the quadratic-defect route). It follows from the norm
index and the indicator lemma. -/
theorem hilbertSymbol_mul (a b c : Kˣ) :
    hilbertSymbol a (b * c) = hilbertSymbol a b * hilbertSymbol a c :=
  sorry

/-- **Layer 6C, `(a,a) = (a,−1)`.** From `hilbertSymbol_neg_self` and bimultiplicativity, since
the values are their own inverses. It is the third of the three evaluation rules that determine
the symbol on a square-class basis, and it fixes the diagonal. -/
theorem hilbertSymbol_self (a : Kˣ) : hilbertSymbol a a = hilbertSymbol a (-1) :=
  sorry

/-- **Layer 6C, the symbol on the square-class basis: unit against unit, odd residue
characteristic.** With `e = 0` every unit of `𝒪[K]` is a norm from `K(√u')` for every unit `u'`,
by Hensel's lemma. ⚠ This is the rule that fails in residue characteristic `2`: over `ℚ₂`,
`(−1,−1) = −1` with both arguments units, which is why 6B carries the dyadic content. -/
theorem hilbertSymbol_unit_unit_of_odd (hodd : dyadicLevel K = 0) (u u' : Kˣ)
    (hu : Multiplicative.toAdd (normalizedValuation K u) = 0)
    (hu' : Multiplicative.toAdd (normalizedValuation K u') = 0) :
    hilbertSymbol u u' = 1 :=
  sorry

/-- **Layer 6C, the symbol on the square-class basis: unit against uniformizer, odd residue
characteristic.** `(u, π)_K = +1` exactly when `u` is a square, which by Hensel is exactly when
the residue of `u` is a square in `𝓀[K]`; so `(u, π)_K` is the quadratic residue character of
`𝓀[K]` evaluated at `ū`, and over `ℚ_p` it is the Legendre symbol `(u|p)`. The `IsSquare u`
spelling is the one that needs no character API; the residue spelling is what a computation
over `ℚ_p` uses, through `legendreSym` and
`TauCeti/NumberTheory/LegendreSymbol/SquareClass.lean`. -/
theorem hilbertSymbol_unit_uniformizer_of_odd (hodd : dyadicLevel K = 0) (u π : Kˣ)
    (hu : Multiplicative.toAdd (normalizedValuation K u) = 0)
    (hπ : IsUniformizer (K := K) π) :
    hilbertSymbol u π = 1 ↔ IsSquare u :=
  sorry

/-- **Layer 6C, the closed formula in odd residue characteristic.** Writing `a = π^α u` and
`b = π^β u'` with `u, u'` units, bimultiplicativity reduces the symbol to the three rules above:

```text
(a,b)_K = (π,−1)^{αβ} · (u,π)^β · (u',π)^α .
```

`(π,−1)_K = (−1)^{(q−1)/2}` because `−1` is a unit and the rule above evaluates it by whether
`−1` is a square; `(u,π)` and `(u',π)` are the residue quadratic characters of `ū` and `ū'`. At
`K = ℚ_p` this is Serre *CiA* III Thm 1, `(a,b) = (−1)^{αβ ε(p)} (u|p)^β (u'|p)^α`. -/
theorem hilbertSymbol_of_odd (hodd : dyadicLevel K = 0) (π : Kˣ) (hπ : IsUniformizer (K := K) π)
    (α β : ℕ) (u u' : Kˣ)
    (hu : Multiplicative.toAdd (normalizedValuation K u) = 0)
    (hu' : Multiplicative.toAdd (normalizedValuation K u') = 0) :
    hilbertSymbol (π ^ α * u) (π ^ β * u') =
      hilbertSymbol π (-1) ^ (α * β) * hilbertSymbol u π ^ β * hilbertSymbol u' π ^ α :=
  sorry

/-- **Layer 6C, what replaces a closed formula over a finite dyadic `K`.** There is no formula of
Serre's shape for a general finite extension of `ℚ₂`; what determines the symbol completely is
that it is a **nondegenerate symmetric `𝔽₂`-bilinear form** on the finite group `Kˣ/(Kˣ)²`,
whose order 6A computes as `4·q^e = 2^{[K:ℚ₂]+2}`. Symmetry is `hilbertSymbol_comm`, bilinearity
is `hilbertSymbol_mul`, well-definedness on classes is `hilbertSymbol_congr_sq`, and
nondegeneracy is the next theorem; together with `hilbertSymbol_unramified` and 6B's defect
computations these determine every value, and over `ℚ₂` the resulting table is the `8 × 8`
acceptance suite. This declaration records the nondegeneracy in the square-class form that a
table computation uses. -/
theorem exists_hilbertSymbol_eq_neg_one_squareClass (a : Kˣ) (ha : ¬ IsSquare a) :
    ∃ b : Kˣ, hilbertSymbol a b = -1 ∧ ¬ IsSquare b :=
  sorry

/-- **Layer 6C, nondegeneracy** (Serre *CiA* III Thm 2; O'Meara 63:13). For every
nonsquare `a` some `b` fails to be a norm. The witnesses are listed by defect in the
README. -/
theorem exists_hilbertSymbol_eq_neg_one (a : Kˣ) (ha : ¬ IsSquare a) :
    ∃ b : Kˣ, hilbertSymbol a b = -1 :=
  sorry

/-- **Layer 6C, well-definedness of the local Hasse invariant**, by the Layer 0 descent
principle: permutation invariance from symmetry, and binary invariance from
bimultiplicativity together with the Layer 3 binary quaternion lemma. -/
theorem localHasse_congr {n : ℕ} (w w' : Fin n → Kˣ)
    (h : (weightedSumSquares K fun i => ((w i : K))).Equivalent
      (weightedSumSquares K fun i => ((w' i : K)))) :
    localHasse w = localHasse w' :=
  sorry

/-- **Layer 6D, the realization constraints, stated exactly** (O'Meara 63:23, Serre *CiA*
IV Prop 6). Every triple `(n, d, s)` with `n ≥ 1` is realized by a regular form, except
`n = 1` with `s = −1`, and `n = 2` with `d = [−1]` and `s = −1`. The two hypotheses below
are exactly those exclusions. -/
theorem exists_of_realization (n : ℕ) (hn : 1 ≤ n) (d : Kˣ) (s : ℤˣ)
    (h₁ : n = 1 → s = 1) (h₂ : n = 2 → IsSquare (-d) → s = 1) :
    ∃ w : Fin n → Kˣ, IsSquare ((∏ i, w i) * d) ∧ localHasse w = s :=
  sorry

/-- **Layer 6D, the second realization exception is forced.** A binary form of
discriminant `[−1]` is `⟨a, −a⟩` up to isometry, and its Hasse invariant is `+1`. -/
theorem localHasse_of_discr_neg_one (a b : Kˣ) (h : IsSquare (-(a * b))) :
    localHasse ![a, b] = 1 :=
  sorry

/-- **Layer 6D, isotropy in rank 2** (Serre *CiA* IV Thm 6). A binary form is isotropic
exactly when its discriminant is `[−1]`. The other ranks are stated in the README against
the same convention. -/
theorem anisotropic_binary_iff (a b : Kˣ) :
    ¬ (weightedSumSquares K ![(a : K), b]).Anisotropic ↔ IsSquare (-(a * b)) :=
  sorry

/-- **Layer 6D, `u(K) = 4`.** Every form in at least five variables is isotropic, with
the dyadic case included (O'Meara 63:19; Serre *CiA* IV Thm 6(iv)). -/
theorem not_anisotropic_of_five (w : Fin 5 → Kˣ) :
    ¬ (weightedSumSquares K fun i => ((w i : K))).Anisotropic :=
  sorry

/-- **Layer 6D, the anisotropic quaternary form is unique** (O'Meara 63:17-18; Serre
*CiA* IV Thm 7 corollary). The unique class is the norm form of the unique quaternion
division algebra. That consequence is never used to define the symbol. -/
theorem equivalent_of_anisotropic_four (w w' : Fin 4 → Kˣ)
    (h : (weightedSumSquares K fun i => ((w i : K))).Anisotropic)
    (h' : (weightedSumSquares K fun i => ((w' i : K))).Anisotropic) :
    (weightedSumSquares K fun i => ((w i : K))).Equivalent
      (weightedSumSquares K fun i => ((w' i : K))) :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 6E, the two Hasse invariants agree.** The quaternion classes over a local
field form a group of order two, by Layer 6D, so the map that sends the class of the
division algebra to `−1` identifies them with `ℤˣ`, and it carries `hasseInvariant` to
`localHasse`. This consumes Layer 5 and Layer 6D, and nothing consumes it. -/
theorem hasseInvariant_eq_localHasse :
    ∃ ε : Subgroup.closure (Set.range fun ab : Kˣ × Kˣ => quaternionClass ab.1 ab.2) →* ℤˣ,
      Function.Injective ε ∧
      ∀ {n : ℕ} (w : Fin n → Kˣ) (h : hasseInvariant w ∈
        Subgroup.closure (Set.range fun ab : Kˣ × Kˣ => quaternionClass ab.1 ab.2)),
        ε ⟨hasseInvariant w, h⟩ = localHasse w :=
  sorry

end LocalSymbol

/-! ### Layer 6C: Serre's closed formula over `ℚ₂`

The dyadic base is the one case where a closed formula does exist, and it is the acceptance
test for every sign convention of Layer 6. Both auxiliary functions are real data and not
`sorry`, because the formula *is* the convention being pinned. -/

open Classical in
/-- Serre's `ε(u) = (u − 1)/2 mod 2` for a `2`-adic unit, read off `u mod 8` through
`PadicInt.toZModPow 3`. On the four odd residues `1, 3, 5, 7` it is `0, 1, 0, 1`. -/
noncomputable def serreEps (u : ℤ_[2]) : ZMod 2 :=
  if PadicInt.toZModPow 3 u = 3 ∨ PadicInt.toZModPow 3 u = 7 then 1 else 0

open Classical in
/-- Serre's `ω(u) = (u² − 1)/8 mod 2` for a `2`-adic unit, read off `u mod 8`. On the four odd
residues `1, 3, 5, 7` it is `0, 1, 1, 0`. -/
noncomputable def serreOmega (u : ℤ_[2]) : ZMod 2 :=
  if PadicInt.toZModPow 3 u = 3 ∨ PadicInt.toZModPow 3 u = 5 then 1 else 0

/-- **Layer 6C, the closed formula over `ℚ₂`** (Serre, *A Course in Arithmetic*, III Thm 1). For
`a = 2^α u` and `b = 2^β v` with `u, v` units of `ℤ₂`,

```text
(a,b)_{ℚ₂} = (−1)^{ε(u)ε(v) + α ω(v) + β ω(u)} .
```

⚠ The exponent is read in `ZMod 2` and only then turned into a sign; writing it in `ℤ` invites
the off-by-one that the `8 × 8` table below catches. The three worked entries `(2,5) = −1`,
`(5,5) = +1` and `(−1,−1) = −1` are instances of it. -/
theorem hilbertSymbol_padicTwo (a b : ℚ_[2]ˣ) (α β : ℕ) (u v : ℤ_[2])
    (hu : IsUnit u) (hv : IsUnit v)
    (ha : (a : ℚ_[2]) = 2 ^ α * (u : ℚ_[2])) (hb : (b : ℚ_[2]) = 2 ^ β * (v : ℚ_[2])) :
    hilbertSymbol a b =
      (-1 : ℤˣ) ^ (serreEps u * serreEps v + (α : ZMod 2) * serreOmega v
        + (β : ZMod 2) * serreOmega u).val :=
  sorry

/-! ### Layer 6 worked examples over `ℚ_2`

These are phrased through the norm equation, so they are readable before any symbol
theory. -/

/-- `(−1,−1)_{ℚ_2} = −1`: `−1` is not a sum of two squares in `ℚ_2`, so Hamilton's
quaternions are a division algebra over `ℚ_2`. -/
example : ¬ ∃ x y : ℚ_[2], x ^ 2 + y ^ 2 = -1 :=
  sorry

/-- `(−1,−1)_{ℚ_p} = +1` for odd `p`: `−1` is a sum of two squares in `ℚ_p`. Solve modulo
`p` and lift by Hensel's lemma. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) : ∃ x y : ℚ_[p], x ^ 2 + y ^ 2 = -1 :=
  sorry

/-- `(2,5)_{ℚ_2} = −1`, the entry of the dyadic table where all four conditions of the
four-fold criterion fail. By Serre's formula the exponent is `ω(5) = 1`. -/
example : ¬ ∃ x y : ℚ_[2], (5 : ℚ_[2]) = x ^ 2 - 2 * y ^ 2 :=
  sorry

/-- `(5,5)_{ℚ_2} = +1`, the entry where all four conditions hold, with the explicit
witness `5 = 5² − 5·2²`. The `8 × 8` table over `{±1, ±5, ±2, ±10}` is a family of
decidable computations of exactly this shape. This entry needs no `sorry`. -/
example : ∃ x y : ℚ_[2], (5 : ℚ_[2]) = x ^ 2 - 5 * y ^ 2 :=
  ⟨5, 2, by norm_num⟩

/-- **The realization exceptions are sharp.** No regular form over `ℚ_2` has
`(n, d, s) = (1, [1], −1)` or `(2, [−1], −1)`, while the neighbouring triple
`(2, [1], −1)` is realized by `⟨−1,−1⟩`: its discriminant `(−1)·(−1)` is the trivial
square class, and its Hasse invariant is `(−1,−1)_{ℚ_2} = −1`. -/
example : (∏ i, ![(-1 : ℚ_[2]ˣ), -1] i) = 1 ∧ localHasse ![(-1 : ℚ_[2]ˣ), -1] = -1 :=
  sorry

/-- **Layer 6D, classification acceptance.** `⟨1,1,1,1⟩`, the norm form of Hamilton's
quaternions, is anisotropic over `ℚ_2` (O'Meara 63:17). -/
example : (weightedSumSquares ℚ_[2] fun _ : Fin 4 => (1 : ℚ_[2])).Anisotropic :=
  sorry

end FormTheory

/-! ## Layer 7A: consuming the Profinite Cohomology operations

The continuous cohomology of a profinite group, with its cup product, its Kummer theory, its
restriction and corestriction, and its Evens norm, belongs to the
[Profinite Cohomology roadmap](../ProfiniteCohomology/README.md). This sublayer consumes those
declarations and adds only what is specific to `μ₂` and to quadratic forms.

The carrier is that roadmap's `trivialF2` object over its `AbsoluteGaloisGroup`, so that its
`cup`, `res`, `corestriction` and `evensNormIndexTwo` apply here with no transport at all. The
abbreviations `contH`, `H1`, `H2` name that carrier and implement nothing.

What this roadmap owns here is the coefficient identification specific to `μ₂`: the Galois action
on `μ₂` is trivial when `2` is invertible, so the supplier's `KummerCoeff K 2` and its `trivialF2`
are isomorphic coefficient objects, and that isomorphism is what carries the supplier's Kummer
classes into the carrier above. Everything it is applied to is the supplier's, including the
coefficients `UnitsCoeff` and the passage from a `K`-embedding `σ : L → Kˢ` to the open subgroup
`G_L ≤ G_K` with the three operations attached to `L/K` and their independence of `σ`. -/

section Cohomology

open TauCetiRoadmap.ProfiniteCohomology

variable {K : Type u} [Field K]

section Carriers

variable (K)

/-- `Hⁿ_cont(G_K, 𝔽₂)`, as the Profinite Cohomology roadmap's `trivialF2` object over its
`AbsoluteGaloisGroup`. This is a carrier abbreviation and not an operation.
⚠ It names **Mathlib's** `continuousCohomology`, which is what the supplier's operations are
typed against: the supplier's own notation adapter is `private`, so a consumer cannot write that
type, and its packaged `continuousCohomologyFunctor` is a separate `sorry`-bodied definition that
does not reduce to it. Both alternatives typecheck in isolation and then fail to match
`coeffMap`, `kummerIso` and `h2KummerToUnits`. -/
noncomputable abbrev contH (n : ℕ) : TopModuleCat ℤ :=
  _root_.continuousCohomology n (trivialF2 (AbsoluteGaloisGroup K))

/-- `H¹(G_K, 𝔽₂)`. -/
noncomputable abbrev H1 : Type u := (contH K 1 : Type u)

/-- `H²(G_K, 𝔽₂)`. -/
noncomputable abbrev H2 : Type u := (contH K 2 : Type u)

/-- `Hⁿ_cont(G_K, Additive Kˢˣ)`, at the supplier's multiplicative coefficient object
`UnitsCoeff`. This is a carrier abbreviation and not an operation. -/
noncomputable abbrev contHUnits (n : ℕ) : TopModuleCat ℤ :=
  _root_.continuousCohomology n (ofDiscreteModule (AbsoluteGaloisGroup K) (UnitsCoeff K))

/-- `H²(G_K, Additive Kˢˣ)`, the cohomological Brauer group. -/
noncomputable abbrev H2Units : Type u := (contHUnits K 2 : Type u)

variable {K}

/-- **Layer 7A, the mod-2 cup in bidegree `(1, 1)`.** The supplier's `cup` at the canonical
`𝔽₂` pairing, with its result read in this file's `H2 K`. It defines nothing: the body *is*
`ProfiniteCohomology.cup`, so the two cannot drift, and every statement below is a statement
about the supplier's product.
⚠ The wrapper is forced, not cosmetic. `cup` returns its value in degree `m + n` through the
supplier's **private** notation adapter, so the type of `cup P 1 1 x y` is one a consumer cannot
write and that instance search cannot reduce: `x + cup P 1 1 y z` fails to synthesize `HAdd`
even though the two sides are definitionally equal. Naming the normalized form once is what lets
Layer 8's orthogonal-sum and transfer identities be stated at all. -/
noncomputable def cup11 [Invertible (2 : K)] (x y : H1 K) : H2 K :=
  cup (f2Pairing (AbsoluteGaloisGroup K)) 1 1 x y

/-- **Layer 7A, the sign convention of the mod-2 cup in bidegree `(1,1)`: it is symmetric.** The
supplier's `cup_gradedComm` gives `x ∪ y = (−1)^{mn} · (y ∪ x)` after `degreeCast`, so in
bidegree `(1,1)` the sign is `−1`; the coefficients are `𝔽₂`, where `−z = z`, and `f2Pairing` is
multiplication, which is its own opposite. Both facts are needed, and the statement is pinned
here because every identity of Layers 8 and 9 that reads a cup in the other order — the
orthogonal-sum formula for `w₂`, and the cross term of the Evens polarization — depends on it.
⚠ It is a `𝔽₂` fact and not a general one: in an odd-torsion coefficient module the sign
survives. -/
theorem cup11_comm [Invertible (2 : K)] (x y : H1 K) : cup11 x y = cup11 y x :=
  sorry

variable (K)

/-- `2` is a unit in `K`, in the `ℕ`-coerced spelling the supplier's Kummer statements use. -/
theorem isUnit_natCast_two [Invertible (2 : K)] : IsUnit ((2 : ℕ) : K) := by
  simpa using isUnit_of_invertible (2 : K)

/-- **Layer 7A adapter, the coefficient bridge** `μ₂ ≃ ZMod 2`. Its type pins it: there is only
one additive equivalence `ZMod 2 ≃+ ZMod 2`, so no normalization law is needed beyond
equivariance below. It needs `2` invertible, because both the bridge and the Kummer isomorphism
fail in characteristic two. -/
noncomputable def mu2EquivZMod2 [Invertible (2 : K)] : KummerCoeff K 2 ≃+ ZMod 2 :=
  sorry

/-- **Layer 7A adapter, the action on `μ₂` is trivial.** This is the content of the bridge: `μ₂`
is `{±1} ⊆ K`, so `G_K` fixes it pointwise, and that is what makes the two coefficient objects
below isomorphic. At `n > 2` the corresponding statement is false, which is why the roadmap's
mod-2 layers carry `Invertible (2 : K)` and not a general `n`. -/
theorem mu2EquivZMod2_equivariant [Invertible (2 : K)] (g : AbsoluteGaloisGroup K)
    (x : KummerCoeff K 2) :
    mu2EquivZMod2 K (g • x) = mu2EquivZMod2 K x :=
  sorry

/-- **Layer 7A adapter, the two coefficient objects agree.** The supplier's Kummer coefficients
at `n = 2` and its trivial `𝔽₂` object are isomorphic in `TopRep ℤ G_K`, by the bridge and its
equivariance. This is the transport that carries the supplier's Kummer classes into the carrier
of this roadmap, and it is the only coefficient transport used below. -/
noncomputable def kummerCoeffIsoTrivialF2 [Invertible (2 : K)] :
    ofDiscreteModule (AbsoluteGaloisGroup K) (KummerCoeff K 2) ≅
      trivialF2 (AbsoluteGaloisGroup K) :=
  sorry

variable {K}

/-- **Layer 7A, the Kummer class** `(a) ∈ H¹(G_K, 𝔽₂)` of a unit. It is the supplier's
`kummerMapCanonical` at `n = 2`, read through the coefficient transport, and not a second Kummer
cocycle: the body is a real term, so the two cannot drift. -/
noncomputable def kummerClass [Invertible (2 : K)] (a : Kˣ) : H1 K :=
  (coeffMap ℤ (kummerCoeffIsoTrivialF2 K).hom 1).hom
    (Multiplicative.toAdd (kummerMapCanonical K 2 (isUnit_natCast_two K) a))

variable (K)

/-- **Layer 7A, the Kummer isomorphism on square classes** `Kˣ/(Kˣ)² ≃ H¹(G_K, 𝔽₂)`. It is the
supplier's `kummerIso` at `n = 2`, read through `square_eq_range_powMonoidHom` and the coefficient
transport. The square-class side is the one Layer 0 and Layer 6 use. -/
noncomputable def kummerSquareClassEquiv [Invertible (2 : K)] :
    Additive (Kˣ ⧸ Subgroup.square Kˣ) ≃+ H1 K :=
  sorry

variable {K}

/-- The isomorphism sends a square class to the Kummer class of a representative. -/
theorem kummerSquareClassEquiv_kummerClass [Invertible (2 : K)] (a : Kˣ) :
    kummerSquareClassEquiv K (Additive.ofMul (QuotientGroup.mk a)) = kummerClass a :=
  sorry

variable (K)

/-- **Layer 7A, the map induced by `μ₂ ⊆ Kˢˣ`**, from the Kummer sequence. It is the supplier's
`h2KummerToUnits` at `n = 2`, reached through the coefficient transport, so it is not a second
coefficient map: the body is a real term. -/
noncomputable def h2MuToUnits [Invertible (2 : K)] : contH K 2 ⟶ contHUnits K 2 :=
  coeffMap ℤ (kummerCoeffIsoTrivialF2 K).inv 2 ≫ h2KummerToUnits K 2

/-- It is injective, by Hilbert 90. This is the supplier's `h2KummerToUnits_injective` composed
with an isomorphism of coefficient objects. -/
theorem h2MuToUnits_injective [Invertible (2 : K)] :
    Function.Injective (h2MuToUnits K).hom :=
  sorry

/-- Its image is the 2-torsion, which is the supplier's `h2KummerToUnits_range` at `n = 2`. -/
theorem h2MuToUnits_range [Invertible (2 : K)] (x : H2Units K) :
    (∃ y, (h2MuToUnits K).hom y = x) ↔ x + x = 0 :=
  sorry

end Carriers

/-! ### Layer 7A: what the transfer along a finite separable extension adds here

The supplier owns the whole passage from a `K`-embedding `σ : L → Kˢ` to the open subgroup
`G_L ≤ G_K`, the transport of its `𝔽₂`-cohomology, and the three operations attached to `L/K`:
`galoisSubgroup` with its index, `galoisRes`, `galoisCor`, `galoisEvens` and the choice-free
`galoisConj`, together with their laws, functoriality in a tower, and independence of the
embedding. Nothing here rebuilds any of that. What is left is the part that mentions this
roadmap's own notions: the multiplicative coefficients and the Kummer class. -/

section Transfer

variable (K) (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L]
  [Algebra.IsSeparable K L]

/-- **Layer 7A, restriction on the multiplicative coefficients.** `UnitsCoeff K` and `UnitsCoeff L`
have the same underlying group, `Kˢ` being a separable closure of `L` as well, but they are
coefficient objects over different groups, so the restriction of classes with these coefficients is
a milestone here rather than an instance of `galoisRes`. -/
noncomputable def resHUnits (σ : L →ₐ[K] SeparableClosure K) (n : ℕ) :
    contHUnits K n ⟶ contHUnits L n :=
  sorry

variable {K L}

/-- Restriction is the base change of square classes. This is the supplier's `kummerIso_res` at
`n = 2`, read through the coefficient transport. -/
theorem galoisRes_kummerClass [Invertible (2 : K)] [Invertible (2 : L)]
    (σ : L →ₐ[K] SeparableClosure K) (a : Kˣ) :
    (galoisRes K L σ 1).hom (kummerClass a) =
      kummerClass (Units.map (algebraMap K L : K →* L) a) :=
  sorry

/-- Corestriction is the norm on square classes. This is the supplier's `kummerIso_norm` at
`n = 2`, read through the same transport. -/
theorem galoisCor_kummerClass [Invertible (2 : K)] [Invertible (2 : L)]
    (σ : L →ₐ[K] SeparableClosure K) (a : Lˣ) :
    (galoisCor K L σ 1).hom (kummerClass a) =
      kummerClass (Units.map (Algebra.norm K : L →* K) a) :=
  sorry

/-- Compatibility of the coefficient map with restriction. -/
theorem h2MuToUnits_galoisRes [Invertible (2 : K)] [Invertible (2 : L)]
    (σ : L →ₐ[K] SeparableClosure K) (x : H2 K) :
    (h2MuToUnits L).hom ((galoisRes K L σ 2).hom x) =
      (resHUnits K L σ 2).hom ((h2MuToUnits K).hom x) :=
  sorry

end Transfer

/-! ## Layer 7B: the comparison of the Brauer group with `H²` -/

section BrauerComparison

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras

variable (K)

/-- The 2-torsion subgroup of the Brauer group. -/
noncomputable def Br2 : Subgroup (BrauerGroup.{u, u} K) :=
  MonoidHom.ker (powMonoidHom 2 : BrauerGroup.{u, u} K →* BrauerGroup.{u, u} K)

/-! ### Layer 7B, milestone 1: a finite Galois splitting field inside `Kˢ` -/

/-- **Layer 7B, milestone 1(a): a finite separable splitting field.** The mathematics is the
semisimple-algebras roadmap's Layer 6 milestone *every central simple algebra is split by a
finite separable extension*; that roadmap states it in prose and exports no target signature, so
the shape this roadmap consumes is frozen here and the contract row moves to that roadmap's
declaration when the signature exists. The field is produced **inside** the separable closure,
because Layer 7A's passage from `L/K` to the open subgroup `G_L ≤ G_K` is indexed by a
`K`-embedding into `Kˢ`, and a splitting field with no such embedding indexes nothing. -/
theorem exists_finiteSeparable_splittingField (A : Type u) [Ring A] [Algebra K A]
    [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A] :
    ∃ L : IntermediateField K (SeparableClosure K),
      FiniteDimensional K ↥L ∧ IsSplittingField K A ↥L :=
  sorry

/-- **Layer 7B, milestone 1(b): a finite Galois splitting field.** The Galois closure of the
field above still splits `A`, because an extension of a splitting field splits `A`. This is a
milestone here and not an assumption: the crossed-product construction indexes its cocycle by
`Gal(L/K)`, and a merely separable splitting field has no such group. -/
theorem exists_finiteGalois_splittingField (A : Type u) [Ring A] [Algebra K A]
    [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A] :
    ∃ L : IntermediateField K (SeparableClosure K),
      FiniteDimensional K ↥L ∧ IsGalois K ↥L ∧ IsSplittingField K A ↥L :=
  sorry

/-! ### Layer 7B, milestone 2: the crossed-product package

The comparison `Br(K) ≃ H²(G_K, Kˢˣ)` is the theory of crossed products and not a formality, so
it is assembled from eight separately citable targets rather than one step. Nothing below is an
internal step of a single proof: a consumer that needs only "cohomologous cocycles have the same
class", or only "the cocycle of a splitting presents the algebra", cites that one statement. The
eighth, the passage from a finite cocycle to a continuous class, is the sublayer that follows
`end CrossedProduct`. -/

section CrossedProduct

variable {K}

/-- **Layer 7B, milestone 2(i), the cocycles.** A `2`-cocycle of a finite Galois `L/K` with
values in `Lˣ`, in the normalization `σ(c τ ρ) · c σ (τρ) = c σ τ · c (στ) ρ`. The convention is
the inhomogeneous one of Gille-Szamuely 4.4 and Serre *Local Fields* X, and it is pinned here
because the opposite normalization changes the sign of the comparison in milestone 3.
Continuity costs nothing: `Gal(L/K)` is finite discrete, and the continuous statement is the
colimit of these over finite Galois `L/K`, which is milestone 2(v). -/
structure TwoCocycle (L : Type u) [Field L] [Algebra K L] where
  /-- The underlying function. -/
  toFun : (L ≃ₐ[K] L) → (L ≃ₐ[K] L) → Lˣ
  /-- The cocycle identity. -/
  isCocycle : ∀ σ τ ρ : L ≃ₐ[K] L,
    σ ((toFun τ ρ : L)) * (toFun σ (τ * ρ) : L) = (toFun σ τ : L) * (toFun (σ * τ) ρ : L)

/-- **Layer 7B, milestone 2(ii), the equivalence.** Two cocycles are cohomologous when they
differ by the coboundary of a `b : Gal(L/K) → Lˣ`. -/
def Cohomologous {L : Type u} [Field L] [Algebra K L] (z w : TwoCocycle (K := K) L) : Prop :=
  ∃ b : (L ≃ₐ[K] L) → Lˣ, ∀ σ τ : L ≃ₐ[K] L,
    (w.toFun σ τ : L) =
      (z.toFun σ τ : L) * σ ((b τ : L)) * ((b (σ * τ) : L))⁻¹ * (b σ : L)

/-- **Layer 7B, milestone 2(i), the algebra.** The crossed product of a cocycle. Its carrier is
pinned as **data** — the free `L`-module on the symbols `u_σ`, that is functions
`Gal(L/K) → L` — so that every statement below is typeable before the multiplication is built.
A construction whose carrier were opaque would leave `basis_mul_basis` and the finrank formula
unstatable, which is exactly the failure a black-box comparison hides. -/
structure CrossedProduct (L : Type u) [Field L] [Algebra K L] (_z : TwoCocycle (K := K) L) where
  /-- The coordinates in the basis `u_σ`. -/
  coeff : (L ≃ₐ[K] L) → L

variable {L : Type u} [Field L] [Algebra K L]

/-- The ring structure: `u_σ · x = σ(x) · u_σ` and `u_σ · u_τ = c(σ,τ) · u_{στ}`, extended
`L`-linearly. The two equations that characterize it are `basis_mul_inc` and
`basis_mul_basis`. -/
noncomputable instance (z : TwoCocycle (K := K) L) : Ring (CrossedProduct L z) := sorry

/-- The crossed product is a `K`-algebra, `K` sitting inside through `CrossedProduct.inc`. It is
**not** an `L`-algebra: `L` is not central in it unless `L = K`. -/
noncomputable instance (z : TwoCocycle (K := K) L) : Algebra K (CrossedProduct L z) := sorry

/-- **Layer 7B, milestone 2(i): the crossed product is central simple of degree `[L:K]`.** This
is the theorem that makes `crossedProductClass` well formed, and it is proved from the two
multiplication equations below. -/
instance crossedProduct_isCentral (z : TwoCocycle (K := K) L) [FiniteDimensional K L]
    [IsGalois K L] : Algebra.IsCentral K (CrossedProduct L z) := sorry

instance crossedProduct_isSimpleRing (z : TwoCocycle (K := K) L) [FiniteDimensional K L]
    [IsGalois K L] : IsSimpleRing (CrossedProduct L z) := sorry

instance crossedProduct_finiteDimensional (z : TwoCocycle (K := K) L) [FiniteDimensional K L] :
    FiniteDimensional K (CrossedProduct L z) := sorry

/-- The copy of `L` inside the crossed product, `x ↦ x · u_1`. -/
noncomputable def CrossedProduct.inc (z : TwoCocycle (K := K) L) : L →ₐ[K] CrossedProduct L z :=
  sorry

open Classical in
/-- The basis symbol `u_σ`, pinned as data: the indicator of `σ`. -/
noncomputable def CrossedProduct.basis (z : TwoCocycle (K := K) L) (σ : L ≃ₐ[K] L) :
    CrossedProduct L z :=
  ⟨fun τ => if τ = σ then 1 else 0⟩

/-- **The semilinearity equation** `u_σ · x = σ(x) · u_σ`. -/
theorem CrossedProduct.basis_mul_inc (z : TwoCocycle (K := K) L) (σ : L ≃ₐ[K] L) (x : L) :
    basis z σ * inc z x = inc z (σ x) * basis z σ :=
  sorry

/-- **The cocycle equation** `u_σ · u_τ = c(σ,τ) · u_{στ}`. Together with `basis_mul_inc` and
`L`-linearity this determines the multiplication, and it is why the cocycle identity is exactly
associativity. -/
theorem CrossedProduct.basis_mul_basis (z : TwoCocycle (K := K) L) (σ τ : L ≃ₐ[K] L) :
    basis z σ * basis z τ = inc z ((z.toFun σ τ : L)) * basis z (σ * τ) :=
  sorry

/-- `dim_K (L, G, c) = [L : K]²`, so the crossed product has degree `[L:K]`. -/
theorem CrossedProduct.finrank (z : TwoCocycle (K := K) L) [FiniteDimensional K L] :
    Module.finrank K (CrossedProduct L z) = Module.finrank K L ^ 2 :=
  sorry

/-- The crossed product as a central simple algebra. -/
noncomputable def crossedProductCSA (z : TwoCocycle (K := K) L) [FiniteDimensional K L]
    [IsGalois K L] : CSA.{u, u} K :=
  { toAlgCat := AlgCat.of K (CrossedProduct L z) }

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 7B, milestone 2(i): the Brauer class of a cocycle.** -/
noncomputable def crossedProductClass (z : TwoCocycle (K := K) L) [FiniteDimensional K L]
    [IsGalois K L] : BrauerGroup.{u, u} K :=
  Quotient.mk _ (crossedProductCSA z)

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 7B, milestone 2(ii): cohomologous cocycles give Brauer-equivalent algebras.** The
crossed products are then isomorphic, not merely equivalent, but the class equality is the form
the comparison uses. -/
theorem crossedProductClass_eq_of_cohomologous (z w : TwoCocycle (K := K) L)
    [FiniteDimensional K L] [IsGalois K L] (h : Cohomologous z w) :
    crossedProductClass z = crossedProductClass w :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 7B, milestone 2(iii): multiplying cocycles is tensoring algebras.** The pointwise
product of two cocycles presents the product of the two Brauer classes, that is the class of the
tensor product. This is the milestone that makes the comparison a homomorphism, and it is where
the normalization of `TwoCocycle` is felt: the opposite convention gives the inverse class. -/
theorem crossedProductClass_mul (z w v : TwoCocycle (K := K) L) [FiniteDimensional K L]
    [IsGalois K L] (h : ∀ σ τ : L ≃ₐ[K] L, v.toFun σ τ = z.toFun σ τ * w.toFun σ τ) :
    crossedProductClass v = crossedProductClass z * crossedProductClass w :=
  sorry

open scoped TensorProduct in
open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 7B, milestone 2(iv): the cocycle of a split algebra with chosen descent data.** The
descent datum is the chosen `L`-algebra isomorphism `φ : L ⊗_K A ≃ M_n(L)`. Each
`σ ∈ Gal(L/K)` moves `φ` by a `σ`-semilinear automorphism of `M_n(L)`, Skolem-Noether makes that
automorphism inner, and the chosen conjugators multiply up to the cocycle. This is the only step
of the comparison that uses Skolem-Noether, and it is the step that a black-box statement
hides. -/
noncomputable def cocycleOfSplitting (A : Type u) [Ring A] [Algebra K A]
    [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A]
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ) (φ : L ⊗[K] A ≃ₐ[L] Matrix (Fin n) (Fin n) L) : TwoCocycle (K := K) L :=
  sorry

open scoped TensorProduct in
open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 7B, milestone 2(v), first half: independence of the descent data.** Two choices of
`φ` over the same `L` give cohomologous cocycles, so the class is a function of `A` and `L`
alone. The conjugators of milestone 2(iv) are determined only up to `Lˣ`, and this records that
the ambiguity is exactly a coboundary. -/
theorem cohomologous_cocycleOfSplitting (A : Type u) [Ring A] [Algebra K A]
    [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A]
    [FiniteDimensional K L] [IsGalois K L]
    (n m : ℕ) (φ : L ⊗[K] A ≃ₐ[L] Matrix (Fin n) (Fin n) L)
    (ψ : L ⊗[K] A ≃ₐ[L] Matrix (Fin m) (Fin m) L) :
    Cohomologous (cocycleOfSplitting A n φ) (cocycleOfSplitting A m ψ) :=
  sorry

/-- **Layer 7B, milestone 2(v), second half: inflation.** A cocycle of `Gal(L/K)` inflated along
a compatible pair — a homomorphism `π : Gal(M/K) → Gal(L/K)` and an embedding `ι : L → M`
intertwining it — is a cocycle of `Gal(M/K)`. The pair that matters is
`AlgEquiv.restrictNormal` together with the inclusion, for `K ⊆ L ⊆ M` with both extensions
finite Galois. ⚠ The compatibility hypothesis is not decoration: without it the inflated
function is not a cocycle at all, so it is carried in the type rather than assumed in a
docstring. -/
def TwoCocycle.comap {M : Type u} [Field M] [Algebra K M] (π : (M ≃ₐ[K] M) →* (L ≃ₐ[K] L))
    (ι : L →ₐ[K] M) (hπι : ∀ (σ : M ≃ₐ[K] M) (x : L), σ (ι x) = ι (π σ x))
    (z : TwoCocycle (K := K) L) : TwoCocycle (K := K) M where
  toFun σ τ := Units.map ι.toRingHom.toMonoidHom (z.toFun (π σ) (π τ))
  isCocycle := sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 7B, milestone 2(v): inflation does not change the class**, so the classes computed
from two splitting fields are comparable and the colimit over finite Galois `L/K` is well
defined. Without this milestone the comparison is a family of unrelated maps. -/
theorem crossedProductClass_comap {M : Type u} [Field M] [Algebra K M]
    [FiniteDimensional K L] [IsGalois K L] [FiniteDimensional K M] [IsGalois K M]
    (π : (M ≃ₐ[K] M) →* (L ≃ₐ[K] L)) (ι : L →ₐ[K] M)
    (hπι : ∀ (σ : M ≃ₐ[K] M) (x : L), σ (ι x) = ι (π σ x)) (z : TwoCocycle (K := K) L) :
    crossedProductClass (z.comap π ι hπι) = crossedProductClass z :=
  sorry

open scoped TensorProduct in
open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 7B, milestone 2(vii), first half: the cocycle of a splitting presents the algebra.**
One of the two identifications the comparison needs. -/
theorem crossedProductClass_cocycleOfSplitting (A : Type u) [Ring A] [Algebra K A]
    [Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A]
    [FiniteDimensional K L] [IsGalois K L]
    (n : ℕ) (φ : L ⊗[K] A ≃ₐ[L] Matrix (Fin n) (Fin n) L) :
    crossedProductClass (cocycleOfSplitting A n φ) =
      Quotient.mk _ ({ toAlgCat := AlgCat.of K A } : CSA.{u, u} K) :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 7B, milestone 2(vii), second half: the two maps are mutually inverse.** Equal
crossed-product classes over the same `L` come from cohomologous cocycles. With the previous
theorem this identifies the two directions, and it is what makes the comparison of milestone 3
injective; Hilbert 90 for a finite Galois `L/K` is the input. -/
theorem cohomologous_of_crossedProductClass_eq (z w : TwoCocycle (K := K) L)
    [FiniteDimensional K L] [IsGalois K L]
    (h : crossedProductClass z = crossedProductClass w) :
    Cohomologous z w :=
  sorry

variable (K)

/-- A finite Galois subextension of `Kˢ/K` together with a cocycle of its Galois group. Bundling
the two is what lets milestone 2(vi) quantify over "some splitting field and some cocycle"
without an existential over instances. -/
structure GaloisCocycle where
  /-- The finite Galois extension, taken inside `Kˢ` so that Layer 7A's `galoisSubgroup`
  applies to it. -/
  extension : IntermediateField K (SeparableClosure K)
  [finite : FiniteDimensional K ↥extension]
  [galois : IsGalois K ↥extension]
  /-- The cocycle. -/
  cocycle : TwoCocycle (K := K) ↥extension

attribute [instance] GaloisCocycle.finite GaloisCocycle.galois

variable {K}

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- The Brauer class of a bundled crossed product. -/
noncomputable def GaloisCocycle.brauerClass (g : GaloisCocycle K) : BrauerGroup.{u, u} K :=
  crossedProductClass g.cocycle

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 7B, milestone 2(vi): every Brauer class is obtained.** Surjectivity of the
comparison. It composes milestone 1(b) with milestone 2(iv), and it is stated separately because
a consumer that needs a crossed-product presentation of a given class cites this and nothing
else. -/
theorem exists_galoisCocycle_brauerClass_eq (x : BrauerGroup.{u, u} K) :
    ∃ g : GaloisCocycle K, g.brauerClass = x :=
  sorry

end CrossedProduct

/-! ### Layer 7B, milestone 2(v): inflation into continuous cohomology

Milestone 3 compares the Brauer group with `H²(G_K, Kˢˣ)`, whose classes are continuous, while
the crossed-product package of milestone 2 produces cocycles of the finite groups `Gal(L/K)`.
This sublayer joins the two, and it is the only place where they meet.

Nothing here builds a second continuous-cohomology object. The explicit complex `Z2`, `H2`,
`H2pi`, `B2`, the invariant coefficients `Invariants`, the degree-two finite-quotient system with
its comparison legs `explicitFiniteQuotientComparison2` and its universality
`explicitFiniteQuotientColimit2`, and the comparison `explicitH2IsoContinuousCohomology` with the
canonical carrier all belong to the [Profinite Cohomology
roadmap](../ProfiniteCohomology/README.md). What this roadmap adds is the two things that mention
its own notions: the identification of the supplier's coefficient module `UnitsCoeff K` with the
units of `Kˢ`, and the packaging of a finite Galois subextension `L ⊆ Kˢ` as the open normal
subgroup `Gal(Kˢ/L) ≤ G_K` with its finite quotient `Gal(L/K)`. -/

section Inflation

variable {K}

/-- Two cocycles with the same underlying function are equal; the cocycle identity is a `Prop`
field. Stated because inflation is compared with `TwoCocycle.comap` through their functions. -/
theorem TwoCocycle.ext {L : Type u} [Field L] [Algebra K L] {z w : TwoCocycle (K := K) L}
    (h : z.toFun = w.toFun) : z = w := by
  cases z; cases w; simp_all

/-- **Layer 7B, milestone 2(v): the inflation of a finite cocycle to `G_K`.** It is
`TwoCocycle.comap` at the compatible pair that matters, namely `AlgEquiv.restrictNormalHom` for
`L` together with the inclusion `L ⊆ Kˢ`; the intertwining hypothesis is Mathlib's
`AlgEquiv.restrictNormal_commutes`, so the body is a real term and no second inflation can drift
from `comap`. The result is a cocycle of `Gal(Kˢ/K)` with values in `(Kˢ)ˣ`, still without any
continuity claim: continuity is `continuous_unitsCochain_inflate` below and needs `L/K` finite. -/
noncomputable def TwoCocycle.inflate {L : IntermediateField K (SeparableClosure K)} [Normal K ↥L]
    (z : TwoCocycle (K := K) ↥L) : TwoCocycle (K := K) (SeparableClosure K) :=
  z.comap (AlgEquiv.restrictNormalHom ↥L) (IsScalarTower.toAlgHom K ↥L (SeparableClosure K))
    fun σ x => (AlgEquiv.restrictNormal_commutes σ ↥L x).symm

/-- **Layer 7B, the coefficient identification.** A cocycle of `Gal(Kˢ/K)` valued in `(Kˢ)ˣ`,
read as a `2`-cochain with values in the supplier's `UnitsCoeff K`. This is the whole of the
translation between this roadmap's multiplicative convention and the supplier's additive one:
`UnitsCoeff K` *is* `Additive (Kˢ)ˣ`, so the body is `Additive.ofMul` and nothing else. -/
noncomputable def unitsCochain (z : TwoCocycle (K := K) (SeparableClosure K)) :
    AbsoluteGaloisGroup K × AbsoluteGaloisGroup K → UnitsCoeff K :=
  fun p => Additive.ofMul (z.toFun p.1 p.2)

set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B: the normalization of `TwoCocycle` is the supplier's.** The inhomogeneous
convention `σ(c(τ,ρ)) · c(σ,τρ) = c(σ,τ) · c(στ,ρ)` pinned in milestone 2(i) is exactly
Mathlib's `groupCohomology.IsCocycle₂` after `Additive.ofMul`. This theorem is what makes the comparison
sign-correct, and the opposite convention would fail it rather than merely inverting a sign
downstream. -/
theorem unitsCochain_isCocycle₂ (z : TwoCocycle (K := K) (SeparableClosure K)) :
    groupCohomology.IsCocycle₂ (unitsCochain z) := by
  intro g h j
  have h1 := z.isCocycle g h j
  show Additive.ofMul _ + Additive.ofMul _ = g • Additive.ofMul _ + Additive.ofMul _
  show Additive.ofMul (z.toFun (g * h) j * z.toFun g h) =
    Additive.ofMul ((g • z.toFun h j) * z.toFun g (h * j))
  refine congrArg Additive.ofMul (Units.ext ?_)
  push_cast
  rw [mul_comm]
  simpa [AlgEquiv.smul_def] using h1.symm

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B: an inflated cochain is continuous.** It factors through
`Gal(L/K) × Gal(L/K)`, which is discrete because `L/K` is finite, and the restriction map
`G_K → Gal(L/K)` is continuous by Mathlib's `InfiniteGalois.restrictNormalHom_continuous`.
⚠ Finiteness of `L/K` is where it is used: for an infinite normal subextension the same formula
is a cocycle but not a continuous one, so no class of `H²_cont` results. -/
theorem continuous_unitsCochain_inflate {L : IntermediateField K (SeparableClosure K)}
    [FiniteDimensional K ↥L] [Normal K ↥L] (z : TwoCocycle (K := K) ↥L) :
    Continuous (unitsCochain z.inflate) := by
  have hfac : unitsCochain z.inflate =
      (fun q : (↥L ≃ₐ[K] ↥L) × (↥L ≃ₐ[K] ↥L) => Additive.ofMul (Units.map
        (IsScalarTower.toAlgHom K ↥L (SeparableClosure K)).toRingHom.toMonoidHom
          (z.toFun q.1 q.2))) ∘
      fun p : AbsoluteGaloisGroup K × AbsoluteGaloisGroup K =>
        (AlgEquiv.restrictNormalHom ↥L p.1, AlgEquiv.restrictNormalHom ↥L p.2) := rfl
  have hcont := InfiniteGalois.restrictNormalHom_continuous (k := K) (K := SeparableClosure K) L
  rw [hfac]
  exact continuous_of_discreteTopology.comp
    ((hcont.comp continuous_fst).prodMk (hcont.comp continuous_snd))

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B: the inflated cocycle as an element of the supplier's `Z²`.** -/
noncomputable def inflateTwoCocycleZ2 {L : IntermediateField K (SeparableClosure K)}
    [FiniteDimensional K ↥L] [Normal K ↥L] (z : TwoCocycle (K := K) ↥L) :
    Z2 (AbsoluteGaloisGroup K) (UnitsCoeff K) :=
  ⟨unitsCochain z.inflate, continuous_unitsCochain_inflate z, unitsCochain_isCocycle₂ _⟩

variable (K)

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B: the supplier's explicit `H²` read on the canonical carrier.** The body is the
supplier's `explicitH2IsoContinuousCohomology`, so this defines nothing; it exists because every
statement below has to name one side or the other and the two are different objects. -/
noncomputable def unitsClassOfH2
    (y : ProfiniteCohomology.H2 (AbsoluteGaloisGroup K) (UnitsCoeff K)) : H2Units K :=
  (explicitH2IsoContinuousCohomology (AbsoluteGaloisGroup K) (UnitsCoeff K)).hom.hom
    ((discreteH2Equiv (AbsoluteGaloisGroup K) (UnitsCoeff K)).symm y)

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- It is surjective, being an isomorphism. -/
theorem unitsClassOfH2_surjective : Function.Surjective (unitsClassOfH2 K) := by
  intro x
  refine ⟨(discreteH2Equiv (AbsoluteGaloisGroup K) (UnitsCoeff K))
    ((explicitH2IsoContinuousCohomology (AbsoluteGaloisGroup K) (UnitsCoeff K)).inv.hom x), ?_⟩
  exact (explicitH2IsoContinuousCohomology (AbsoluteGaloisGroup K)
    (UnitsCoeff K)).inv_hom_id_apply x

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B: the class of a continuous `2`-cocycle in `H²(G_K, Kˢˣ)`.** -/
noncomputable def unitsClassOfZ2 (c : Z2 (AbsoluteGaloisGroup K) (UnitsCoeff K)) : H2Units K :=
  unitsClassOfH2 K (H2pi (AbsoluteGaloisGroup K) (UnitsCoeff K) c)

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- Every class of `H²(G_K, Kˢˣ)` is the class of a continuous cocycle. This is the easy half of
the exhaustion below: it is the surjectivity of a quotient map composed with an isomorphism, and
it is separated out so that `exists_galoisCocycle_inflateClass` reduces to the descent of a
*cocycle* to a finite level and to nothing else. -/
theorem unitsClassOfZ2_surjective : Function.Surjective (unitsClassOfZ2 K) :=
  (unitsClassOfH2_surjective K).comp (QuotientAddGroup.mk'_surjective _)

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B, milestone 2(v): the class in `H²(G_K, Kˢˣ)` of a finite cocycle.** This is the
right-hand side of the equation that determines `brauerCohomologyEquiv`, and it is the only
passage in this roadmap from a finite Galois level to the continuous group. -/
noncomputable def inflateTwoCocycleClass (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K ↥L] [Normal K ↥L] (z : TwoCocycle (K := K) ↥L) : H2Units K :=
  unitsClassOfZ2 K (inflateTwoCocycleZ2 z)

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B, milestone 2(v): inflation is well defined on cohomology classes.** The inflation
of the coboundary of `b : Gal(L/K) → Lˣ` is the coboundary of the continuous `1`-cochain
`g ↦ b(g|_L)`, so cohomologous cocycles of `Gal(L/K)` inflate to the same class. This is stated
independently of milestone 3, because it is what makes the right-hand side of
`brauerCohomologyEquiv_crossedProductClass` a function of the class of `z` and not of `z`. -/
theorem inflateTwoCocycleClass_eq_of_cohomologous
    (L : IntermediateField K (SeparableClosure K)) [FiniteDimensional K ↥L] [Normal K ↥L]
    (z w : TwoCocycle (K := K) ↥L) (h : Cohomologous z w) :
    inflateTwoCocycleClass K L z = inflateTwoCocycleClass K L w := by
  obtain ⟨b, hb⟩ := h
  refine congrArg (unitsClassOfH2 K) (QuotientAddGroup.eq_iff_sub_mem.mpr ?_)
  rw [AddSubgroup.mem_addSubgroupOf]
  refine ⟨fun g => -(Additive.ofMul (Units.map
      (IsScalarTower.toAlgHom K ↥L (SeparableClosure K)).toRingHom.toMonoidHom
      (b (AlgEquiv.restrictNormalHom ↥L g)))), ?_, ?_⟩
  · have hfac : (fun g : AbsoluteGaloisGroup K => -(Additive.ofMul (Units.map
        (IsScalarTower.toAlgHom K ↥L (SeparableClosure K)).toRingHom.toMonoidHom
        (b (AlgEquiv.restrictNormalHom ↥L g))))) =
        (fun s : ↥L ≃ₐ[K] ↥L => -(Additive.ofMul (Units.map
          (IsScalarTower.toAlgHom K ↥L (SeparableClosure K)).toRingHom.toMonoidHom (b s)))) ∘
        (AlgEquiv.restrictNormalHom ↥L) := rfl
    show Continuous _
    rw [hfac]
    exact continuous_of_discreteTopology.comp
      (InfiniteGalois.restrictNormalHom_continuous (k := K) (K := SeparableClosure K) L)
  · have hb' : ∀ σ τ : ↥L ≃ₐ[K] ↥L,
        w.toFun σ τ = z.toFun σ τ * (σ • b τ) * (b (σ * τ))⁻¹ * b σ := fun σ τ =>
      Units.ext (by simpa [AlgEquiv.smul_def] using hb σ τ)
    have hsmul : ∀ (g : AbsoluteGaloisGroup K) (u : (↥L)ˣ),
        Units.map (IsScalarTower.toAlgHom K ↥L (SeparableClosure K)).toRingHom.toMonoidHom
            ((AlgEquiv.restrictNormalHom ↥L g) • u) =
          g • Units.map
            (IsScalarTower.toAlgHom K ↥L (SeparableClosure K)).toRingHom.toMonoidHom u :=
      fun g u => Units.ext (AlgEquiv.restrictNormal_commutes g ↥L (u : ↥L))
    have habs : ∀ U V T Z W : (SeparableClosure K)ˣ,
        W = Z * U * V⁻¹ * T → U⁻¹ * V * T⁻¹ = Z * W⁻¹ := by
      intro U V T Z W hw
      subst hw
      refine Additive.ofMul.injective ?_
      simp only [ofMul_mul, ofMul_inv]
      abel
    funext p
    obtain ⟨g1, g2⟩ := p
    have key :
        (g1 • (Units.map
            (IsScalarTower.toAlgHom K ↥L (SeparableClosure K)).toRingHom.toMonoidHom
            (b (AlgEquiv.restrictNormalHom ↥L g2)))⁻¹) *
          Units.map (IsScalarTower.toAlgHom K ↥L (SeparableClosure K)).toRingHom.toMonoidHom
            (b (AlgEquiv.restrictNormalHom ↥L (g1 * g2))) *
          (Units.map (IsScalarTower.toAlgHom K ↥L (SeparableClosure K)).toRingHom.toMonoidHom
            (b (AlgEquiv.restrictNormalHom ↥L g1)))⁻¹ =
        Units.map (IsScalarTower.toAlgHom K ↥L (SeparableClosure K)).toRingHom.toMonoidHom
            (z.toFun (AlgEquiv.restrictNormalHom ↥L g1) (AlgEquiv.restrictNormalHom ↥L g2)) *
          (Units.map (IsScalarTower.toAlgHom K ↥L (SeparableClosure K)).toRingHom.toMonoidHom
            (w.toFun (AlgEquiv.restrictNormalHom ↥L g1)
              (AlgEquiv.restrictNormalHom ↥L g2)))⁻¹ := by
      rw [smul_inv']
      refine habs _ _ _ _ _ ?_
      rw [hb' (AlgEquiv.restrictNormalHom ↥L g1) (AlgEquiv.restrictNormalHom ↥L g2)]
      simp only [map_mul, map_inv, hsmul]
    exact congrArg Additive.ofMul key

variable {K}

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B: a compatible pair over `Kˢ` computes the restriction homomorphism.** For
`L, M ⊆ Kˢ` normal over `K` and a compatible pair `(π, ι)` whose embedding is the inclusion
inside `Kˢ`, the composite `π ∘ (·|_M)` is `(·|_L)`. ⚠ The hypothesis `hι` cannot be
dropped: composing `ι` with a nontrivial element of `Gal(M/K)` still gives a compatible
pair, and then the conclusion is false. -/
theorem restrictNormalHom_of_comap {L M : IntermediateField K (SeparableClosure K)}
    [Normal K ↥L] [Normal K ↥M]
    (π : (↥M ≃ₐ[K] ↥M) →* (↥L ≃ₐ[K] ↥L)) (ι : ↥L →ₐ[K] ↥M)
    (hπι : ∀ (σ : ↥M ≃ₐ[K] ↥M) (x : ↥L), σ (ι x) = ι (π σ x))
    (hι : ∀ x : ↥L, algebraMap (↥M) (SeparableClosure K) (ι x) =
      algebraMap (↥L) (SeparableClosure K) x)
    (σ : AbsoluteGaloisGroup K) :
    π (AlgEquiv.restrictNormalHom ↥M σ) = AlgEquiv.restrictNormalHom ↥L σ := by
  refine AlgEquiv.ext fun x => Subtype.ext ?_
  have hM := AlgEquiv.restrictNormal_commutes σ ↥M (ι x)
  have hL := AlgEquiv.restrictNormal_commutes σ ↥L x
  have h1 := hπι (AlgEquiv.restrictNormalHom ↥M σ) x
  have hrM : (AlgEquiv.restrictNormalHom (F := K) ↥M) σ = σ.restrictNormal ↥M := rfl
  have hrL : (AlgEquiv.restrictNormalHom (F := K) ↥L) σ = σ.restrictNormal ↥L := rfl
  show algebraMap (↥L) (SeparableClosure K) ((π ((AlgEquiv.restrictNormalHom ↥M) σ)) x)
    = algebraMap (↥L) (SeparableClosure K) (((AlgEquiv.restrictNormalHom ↥L) σ) x)
  rw [hrL, hL, ← hι x, ← hM, ← hrM, h1, hι]

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B, milestone 2(v): refinement does not change the inflated cocycle at all.**
Inflating from the larger field the cocycle `TwoCocycle.comap` produces gives back the cocycle
inflated from the smaller one, on the nose and not merely up to a coboundary. -/
theorem TwoCocycle.inflate_comap {L M : IntermediateField K (SeparableClosure K)}
    [Normal K ↥L] [Normal K ↥M]
    (π : (↥M ≃ₐ[K] ↥M) →* (↥L ≃ₐ[K] ↥L)) (ι : ↥L →ₐ[K] ↥M)
    (hπι : ∀ (σ : ↥M ≃ₐ[K] ↥M) (x : ↥L), σ (ι x) = ι (π σ x))
    (hι : ∀ x : ↥L, algebraMap (↥M) (SeparableClosure K) (ι x) =
      algebraMap (↥L) (SeparableClosure K) x)
    (z : TwoCocycle (K := K) ↥L) :
    (z.comap π ι hπι).inflate = z.inflate := by
  refine TwoCocycle.ext (funext fun σ => funext fun τ => Units.ext ?_)
  show algebraMap (↥M) (SeparableClosure K)
      (ι (z.toFun (π (AlgEquiv.restrictNormalHom ↥M σ))
        (π (AlgEquiv.restrictNormalHom ↥M τ))))
    = algebraMap (↥L) (SeparableClosure K)
      (z.toFun (AlgEquiv.restrictNormalHom ↥L σ) (AlgEquiv.restrictNormalHom ↥L τ))
  rw [restrictNormalHom_of_comap π ι hπι hι σ,
    restrictNormalHom_of_comap π ι hπι hι τ, hι]

variable (K)

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B, milestone 2(v): refining the splitting field does not change the continuous
class.** The cohomological counterpart of `crossedProductClass_comap`, and the reason the
comparison of milestone 3 is one map rather than a family of unrelated ones. It is stated with
the same compatible pair as `crossedProductClass_comap` so that the two sides of
`brauerCohomologyEquiv_crossedProductClass` refine together. -/
theorem inflateTwoCocycleClass_comap (L M : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K ↥L] [Normal K ↥L] [FiniteDimensional K ↥M] [Normal K ↥M]
    (π : (↥M ≃ₐ[K] ↥M) →* (↥L ≃ₐ[K] ↥L)) (ι : ↥L →ₐ[K] ↥M)
    (hπι : ∀ (σ : ↥M ≃ₐ[K] ↥M) (x : ↥L), σ (ι x) = ι (π σ x))
    (hι : ∀ x : ↥L, algebraMap (↥M) (SeparableClosure K) (ι x) =
      algebraMap (↥L) (SeparableClosure K) x)
    (z : TwoCocycle (K := K) ↥L) :
    inflateTwoCocycleClass K M (z.comap π ι hπι) = inflateTwoCocycleClass K L z :=
  congrArg (unitsClassOfZ2 K)
    (Subtype.ext (congrArg unitsCochain (TwoCocycle.inflate_comap π ι hπι hι z)))

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B: the finite Galois subextension as an open normal subgroup of `G_K`.** `Gal(Kˢ/L)`
is the kernel of the restriction homomorphism, which is open because that homomorphism is
continuous into a finite discrete group. This is the index of the supplier's finite-quotient
system at which the classes of this sublayer live, and it is pinned as data: the carrier is the
kernel, not an unnamed open normal subgroup with the right fixed field. -/
noncomputable def galoisOpenNormal (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K ↥L] [Normal K ↥L] : OpenNormalSubgroup (AbsoluteGaloisGroup K) where
  toSubgroup := (AlgEquiv.restrictNormalHom (F := K) (K₁ := SeparableClosure K) ↥L).ker
  isOpen' := (InfiniteGalois.restrictNormalHom_continuous
    (k := K) (K := SeparableClosure K) L).isOpen_preimage {1} (isOpen_discrete _)
  isNormal' := inferInstance

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B: `G_K ⧸ Gal(Kˢ/L)` maps onto `Gal(L/K)`.** The map is `AlgEquiv.restrictNormalHom`
factored through the quotient by its kernel, so it is a real term; surjectivity and injectivity
are Mathlib's infinite Galois correspondence and are not needed to state the finite-level cocycle
below. -/
noncomputable def galoisQuotientMap (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K ↥L] [Normal K ↥L] :
    AbsoluteGaloisGroup K ⧸ (galoisOpenNormal K L).toSubgroup →* (↥L ≃ₐ[K] ↥L) :=
  QuotientGroup.lift _ (AlgEquiv.restrictNormalHom ↥L) fun _ hg => hg

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B, the coefficient identification at a finite level:**
`Lˣ ⊆ ((Kˢ)ˣ)^{Gal(Kˢ/L)}`. This is the half of `M^U = Lˣ` that the finite-level cocycle needs; it is what makes
`finiteLevelZ2` land in the supplier's invariant coefficients. -/
theorem unitsCoeff_mem_invariants (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K ↥L] [Normal K ↥L] (y : (↥L)ˣ) :
    (Additive.ofMul (Units.map
      (IsScalarTower.toAlgHom K ↥L (SeparableClosure K)).toRingHom.toMonoidHom y) :
        UnitsCoeff K) ∈ Invariants (galoisOpenNormal K L).toSubgroup (UnitsCoeff K) := by
  intro u hu
  show Additive.ofMul (u • _) = _
  refine congrArg Additive.ofMul (Units.ext ?_)
  show u (algebraMap (↥L) (SeparableClosure K) (y : ↥L)) =
    algebraMap (↥L) (SeparableClosure K) (y : ↥L)
  rw [← AlgEquiv.restrictNormal_commutes u ↥L]
  have h1 : AlgEquiv.restrictNormalHom (F := K) (K₁ := SeparableClosure K) ↥L u = 1 := hu
  rw [show u.restrictNormal ↥L = AlgEquiv.restrictNormalHom (F := K) ↥L u from rfl, h1]
  rfl

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B: the finite cocycle read at the supplier's finite level.** The same function as
`inflateTwoCocycleZ2`, but on `G_K ⧸ Gal(Kˢ/L)` with values in the invariant coefficients, so
that it is an element of the object `explicitFiniteQuotientSystem2` takes at
`galoisOpenNormal K L`. -/
noncomputable def finiteLevelZ2 (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K ↥L] [Normal K ↥L] (z : TwoCocycle (K := K) ↥L) :
    Z2 (AbsoluteGaloisGroup K ⧸ (galoisOpenNormal K L).toSubgroup)
      (Invariants (galoisOpenNormal K L).toSubgroup (UnitsCoeff K)) :=
  ⟨fun q => ⟨Additive.ofMul (Units.map
      (IsScalarTower.toAlgHom K ↥L (SeparableClosure K)).toRingHom.toMonoidHom
      (z.toFun (galoisQuotientMap K L q.1) (galoisQuotientMap K L q.2))),
    unitsCoeff_mem_invariants K L _⟩,
   continuous_of_discreteTopology, by
    intro q1 q2 q3
    induction q1 using QuotientGroup.induction_on with | _ g1 =>
    induction q2 using QuotientGroup.induction_on with | _ g2 =>
    induction q3 using QuotientGroup.induction_on with | _ g3 =>
    exact Subtype.ext (unitsCochain_isCocycle₂ z.inflate g1 g2 g3)⟩

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B: the finite-level class,** an element of the value of the supplier's degree-two
finite-quotient system at `galoisOpenNormal K L`. -/
noncomputable def finiteLevelClass (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K ↥L] [Normal K ↥L] (z : TwoCocycle (K := K) ↥L) :
    ProfiniteCohomology.H2 (AbsoluteGaloisGroup K ⧸ (galoisOpenNormal K L).toSubgroup)
      (Invariants (galoisOpenNormal K L).toSubgroup (UnitsCoeff K)) :=
  H2pi _ _ (finiteLevelZ2 K L z)

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B, milestone 2(v): inflation is the supplier's finite-quotient comparison leg.**
The class of an inflated cocycle is the image of its finite-level class under
`explicitFiniteQuotientComparison2` at the open normal subgroup `Gal(Kˢ/L)`. This is what makes
the exhaustion below the supplier's colimit theorem specialized to `UnitsCoeff K` rather than an
independent existential: without it, `inflateTwoCocycleClass` and the legs of
`explicitFiniteQuotientCocone2` would be two unrelated maps into `H²(G_K, Kˢˣ)`. -/
theorem inflateTwoCocycleClass_eq_finiteQuotientComparison
    (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K ↥L] [Normal K ↥L] (z : TwoCocycle (K := K) ↥L) :
    inflateTwoCocycleClass K L z =
      unitsClassOfH2 K
        (((explicitFiniteQuotientComparison2 (AbsoluteGaloisGroup K) (UnitsCoeff K)).app
          (Opposite.op (galoisOpenNormal K L))).hom (finiteLevelClass K L z)) :=
  sorry

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B, milestone 2(v): every continuous cocycle is inflated from a finite Galois
subextension**, on the nose and with no coboundary subtracted. The inputs are the supplier's
Layer 4 strict descent of a continuous `2`-cocycle to a finite level, which is what makes this
an equality of cocycles rather than of classes, read at `G = G_K` and `M = UnitsCoeff K`
alongside the degree-two finite-quotient colimit `explicitFiniteQuotientColimit2` at the same
data; and Mathlib's infinite Galois correspondence, which presents the resulting open normal
subgroup as `galoisOpenNormal K L` for the finite Galois subextension `L = (Kˢ)^U`. ⚠ Compactness
of `G_K` is what descends both variables at once; total disconnectedness alone descends
neither. -/
theorem exists_galoisCocycle_inflateTwoCocycleZ2
    (c : Z2 (AbsoluteGaloisGroup K) (UnitsCoeff K)) :
    ∃ g : GaloisCocycle K, inflateTwoCocycleZ2 g.cocycle = c := by
  have hcolim := explicitFiniteQuotientColimit2 (AbsoluteGaloisGroup K) (UnitsCoeff K)
  sorry

variable {K}

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B: the continuous class of a bundled crossed product**, the cohomological
counterpart of `GaloisCocycle.brauerClass`. -/
noncomputable def GaloisCocycle.inflateClass (g : GaloisCocycle K) : H2Units K :=
  inflateTwoCocycleClass K g.extension g.cocycle

variable (K)

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B, milestone 2(v): the finite-quotient exhaustion of `H²(G_K, Kˢˣ)`.** Every
continuous class is the inflation of a cocycle of some finite Galois subextension. It is the
cohomological twin of `exists_galoisCocycle_brauerClass_eq`, and together with
`brauerCohomologyEquiv_galoisCocycle_brauerClass` it is what pins `brauerCohomologyEquiv`
uniquely. -/
theorem exists_galoisCocycle_inflateClass (x : H2Units K) :
    ∃ g : GaloisCocycle K, g.inflateClass = x := by
  obtain ⟨c, hc⟩ := unitsClassOfZ2_surjective K x
  obtain ⟨g, hg⟩ := exists_galoisCocycle_inflateTwoCocycleZ2 K c
  refine ⟨g, ?_⟩
  show unitsClassOfZ2 K (inflateTwoCocycleZ2 g.cocycle) = x
  rw [hg, hc]

end Inflation

/-- **Layer 7B, the crossed-product comparison**, as a named canonical equivalence.
Multiplication of Brauer classes goes to addition of cohomology classes, which is what
`≃+` records. ⚠ The equivalence is not the milestone on its own: what determines it is
`brauerCohomologyEquiv_crossedProductClass`, which evaluates it on every crossed-product class,
together with `exists_galoisCocycle_brauerClass_eq`, which says those classes are all of them.
`brauerCohomologyEquiv_unique` is the resulting rigidity statement. -/
noncomputable def brauerCohomologyEquiv :
    Additive (BrauerGroup.{u, u} K) ≃+ H2Units K :=
  sorry

/-- **Layer 7B, the 2-torsion comparison**, `ι` in the README. -/
noncomputable def brauer2EquivH2 [Invertible (2 : K)] :
    Additive ↥(Br2 K) ≃+ H2 K :=
  sorry

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B, milestone 3: the equation that determines the comparison.** On the class of the
crossed product of a cocycle of a finite Galois `L ⊆ Kˢ`, the comparison is the inflation of that
cocycle. This is the load-bearing statement of the whole sublayer: `brauerCohomologyEquiv` is a
bare equivalence without it, and with it the two sides are pinned together by
`crossedProductClass_eq_of_cohomologous` on the left and
`inflateTwoCocycleClass_eq_of_cohomologous` on the right, and refine together by
`crossedProductClass_comap` and `inflateTwoCocycleClass_comap`. -/
theorem brauerCohomologyEquiv_crossedProductClass
    (L : IntermediateField K (SeparableClosure K))
    [FiniteDimensional K ↥L] [IsGalois K ↥L] (z : TwoCocycle (K := K) ↥L) :
    brauerCohomologyEquiv K (Additive.ofMul (crossedProductClass z)) =
      inflateTwoCocycleClass K L z :=
  sorry

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- The same statement on a bundled `GaloisCocycle`, which is the form the two exhaustion
theorems are quantified over. -/
theorem brauerCohomologyEquiv_galoisCocycle_brauerClass (g : GaloisCocycle K) :
    brauerCohomologyEquiv K (Additive.ofMul g.brauerClass) = g.inflateClass :=
  brauerCohomologyEquiv_crossedProductClass K g.extension g.cocycle

set_option maxHeartbeats 1000000 in
set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 7B, milestone 3: there is only one such comparison.** Any additive equivalence that
sends the class of a crossed product to the inflation of its cocycle is `brauerCohomologyEquiv`.
This is what "one comparison with one normalization" means, and it is proved rather than
asserted: `exists_galoisCocycle_brauerClass_eq` reaches every Brauer class by a crossed product,
and the previous theorem evaluates the canonical comparison there. -/
theorem brauerCohomologyEquiv_unique (e : Additive (BrauerGroup.{u, u} K) ≃+ H2Units K)
    (h : ∀ g : GaloisCocycle K, e (Additive.ofMul g.brauerClass) = g.inflateClass) :
    e = brauerCohomologyEquiv K := by
  refine AddEquiv.ext fun y => ?_
  obtain ⟨g, hg⟩ := exists_galoisCocycle_brauerClass_eq (Additive.toMul y)
  have hy : y = Additive.ofMul g.brauerClass := by rw [hg]; rfl
  rw [hy, h g, brauerCohomologyEquiv_galoisCocycle_brauerClass]

variable {K}

/-- **Layer 7B: the normalization of the 2-torsion comparison.** The two comparisons agree on
2-torsion, through the coefficient map. Because `h2MuToUnits` is injective, this equation
determines `brauer2EquivH2` from `brauerCohomologyEquiv`, which is what
`brauer2EquivH2_unique` records; every statement about `ι` below is derived from it and from the
corresponding statement about `brauerCohomologyEquiv`. -/
theorem brauer2EquivH2_h2MuToUnits [Invertible (2 : K)] (x : ↥(Br2 K)) :
    (h2MuToUnits K).hom (brauer2EquivH2 K (Additive.ofMul x)) =
      brauerCohomologyEquiv K (Additive.ofMul (x : BrauerGroup.{u, u} K)) :=
  sorry

set_option maxHeartbeats 400000 in
/-- **Layer 7B: the 2-torsion comparison is determined by that square.** -/
theorem brauer2EquivH2_unique [Invertible (2 : K)] (e : Additive ↥(Br2 K) ≃+ H2 K)
    (h : ∀ x : ↥(Br2 K), (h2MuToUnits K).hom (e (Additive.ofMul x)) =
      brauerCohomologyEquiv K (Additive.ofMul (x : BrauerGroup.{u, u} K))) :
    e = brauer2EquivH2 K :=
  AddEquiv.ext fun y => h2MuToUnits_injective K
    ((h (Additive.toMul y)).trans (brauer2EquivH2_h2MuToUnits (Additive.toMul y)).symm)

set_option maxHeartbeats 400000 in
/-- **Layer 7B, milestone 6: the symbol as a cup product, on the one comparison.** The quaternion
algebra `(a, b)_K` is the crossed product of `K(√a)/K` by the cocycle whose only nontrivial value
is `b`, so `brauerCohomologyEquiv_crossedProductClass` computes its image as the inflation of
that cocycle, and the cyclic computation `H²(Gal(K(√a)/K), K(√a)ˣ) ≃ Kˣ/N(K(√a)ˣ)`
identifies that inflation with the image of `(a) ∪ (b)`. Stated on `brauerCohomologyEquiv` rather than on
`ι` so that the 2-torsion statement is a consequence and not a second normalization. -/
theorem brauerCohomologyEquiv_quaternionClass [Invertible (2 : K)] (a b : Kˣ) :
    brauerCohomologyEquiv K (Additive.ofMul (quaternionClass a b)) =
      (h2MuToUnits K).hom (cup11 (kummerClass a) (kummerClass b)) :=
  sorry

set_option maxHeartbeats 400000 in
/-- **Layer 7B, the symbol as a cup product.** The quaternion class is 2-torsion by
`quaternionClass_sq`, and its image is the cup of the two Kummer classes. It is a consequence of
the previous theorem and of the normalization square, by injectivity of `h2MuToUnits`. -/
theorem brauer2EquivH2_quaternionClass [Invertible (2 : K)] (a b : Kˣ)
    (h : quaternionClass a b ∈ Br2 K) :
    brauer2EquivH2 K (Additive.ofMul ⟨quaternionClass a b, h⟩) =
      cup11 (kummerClass a) (kummerClass b) := by
  refine h2MuToUnits_injective K ?_
  rw [brauer2EquivH2_h2MuToUnits ⟨quaternionClass a b, h⟩]
  exact brauerCohomologyEquiv_quaternionClass a b

end BrauerComparison

/-! ## Layer 7C: the symbol as a cup product

The canonical cup-norm theorem is the first statement below, and the four theorems after it are
the other descriptions of the same condition. Together they are what a consumer applies: one
named theorem per description, all against the supplier's `cup` at the canonical `𝔽₂` pairing,
so that a zero pairing cannot satisfy any of them. The hypothesis is `Invertible (2 : K)` and
nothing else; in particular no statement excludes the dyadic case. -/

/-- **Layer 7C, the canonical cup-norm theorem.** The cup product of two Kummer classes vanishes
exactly when the norm equation `b = x² − a y²` is solvable. This is the fifth equivalent
condition of Layer 2's four-fold criterion, and it holds over any field in which `2` is
invertible (Serre, *Local Fields* XIV §2 Prop. 4-5; Gille-Szamuely 4.7). -/
theorem cup_kummerClass_eq_zero_iff [Invertible (2 : K)] (a b : Kˣ) :
    cup11 (kummerClass a) (kummerClass b) = 0 ↔
      ∃ x y : K, (b : K) = x ^ 2 - (a : K) * y ^ 2 :=
  sorry

/-- **Layer 7C, the cup against the splitting of the quaternion algebra.** The bridge to Layer
2's four-fold criterion, named so that a consumer can move between the algebra and the class. -/
theorem cup_kummerClass_eq_zero_iff_split [Invertible (2 : K)] (a b : Kˣ) :
    cup11 (kummerClass a) (kummerClass b) = 0 ↔
      Nonempty (ℍ[K, (a : K), (b : K)] ≃ₐ[K] Matrix (Fin 2) (Fin 2) K) :=
  sorry

/-- **Layer 7C, the cup against the quadratic-algebra norm condition.** -/
theorem cup_kummerClass_eq_zero_iff_norm [Invertible (2 : K)] (a b : Kˣ) :
    cup11 (kummerClass a) (kummerClass b) = 0 ↔
      ∃ z : QuadraticAlgebra K (a : K) 0, QuadraticAlgebra.norm z = (b : K) :=
  sorry

/-- **Layer 7C, the cup against isotropy of `⟨1, −a, −b⟩`.** -/
theorem cup_kummerClass_eq_zero_iff_isotropic [Invertible (2 : K)] (a b : Kˣ) :
    cup11 (kummerClass a) (kummerClass b) = 0 ↔
      ¬ (weightedSumSquares K ![(1 : K), -(a : K), -(b : K)]).Anisotropic :=
  sorry

/-- **Layer 7C, the cup against the `{±1}`-valued Hilbert symbol**, over a nonarchimedean local
field. The norm-equation criterion belongs here; the continuous cup product is imported from
Profinite Cohomology. -/
theorem cup_kummerClass_eq_zero_iff_hilbertSymbol [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [Invertible (2 : K)] (a b : Kˣ) :
    cup11 (kummerClass a) (kummerClass b) = 0 ↔
      hilbertSymbol a b = 1 :=
  sorry

/-- Translate the additive `ZMod 2` normalization used by Class Field Theory to the classical
`{+1,-1}` normalization. This is a value adapter, not a second Hilbert pairing. -/
noncomputable def hilbertSign (x : ZMod 2) : ℤˣ :=
  if x = 0 then 1 else -1

/-! ### The two frozen bridges to Class Field Theory

⚠ **Universe 0.** Both statements below bind their own `F : Type` instead of using this file's
`K : Type u`. Class Field Theory pins every cohomological object to universe `0` on purpose —
Mathlib's `tateCohomology` needs the group and the coefficient ring `ℤ` in one universe — so
`ClassFieldTheory.H`, `muNRep`, `kummerClass` and `localSymbol` take a `Type`, and quantifying
them over `Type u` does not typecheck. The restriction is the supplier's and is not a weakening
of the quadratic-form side: `hilbertSymbol` itself is available at every universe, and the
bridges are exactly the statements that mention a CFT object. -/

/-- **Frozen QFI--CFT bridge, the single comparison of coefficients.** Class Field Theory's
`localSymbol` at the Kummer cup pairing vanishes exactly when this roadmap's `cup11` of the two
Kummer classes vanishes. The two cups are the same cup — Class Field Theory's `kummerCupPairing`
and this file's `f2Pairing` are both the supplier's `cup` — but they are taken at different
coefficient objects, `muNRep 2 F` against `trivialF2 (G_F)`, and over `Field.absoluteGaloisGroup`
against `ProfiniteCohomology.AbsoluteGaloisGroup`. That coefficient-and-group comparison is the
entire content of the bridge, and both halves of the dictionary it composes are supplied:
`ClassFieldTheory.muNRepCoeffDictionary` with its continuity and equivariance and
`ClassFieldTheory.absoluteGaloisGroupComparison` on one side, this file's
`kummerCoeffIsoTrivialF2` on the other. `localSymbol` then adds the invariant `tr`, which is an
`AddEquiv` and so does not affect vanishing.
⚠ This is *not* a consequence of `brauerCohomologyEquiv_crossedProductClass`: the crossed-product
comparison is about `Kˢˣ` coefficients and says nothing about the `μ₂`-valued cup that Class
Field Theory's symbol is built from. -/
theorem localSymbol_eq_zero_iff_cup (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Invertible (2 : F)]
    (ζ : F) (hζ : IsPrimitiveRoot ζ 2)
    (tr : ClassFieldTheory.H 2 F 2 (ClassFieldTheory.muNRep 2 F) ≃+ ZMod 2) (a b : Fˣ) :
    ClassFieldTheory.localSymbol (ClassFieldTheory.kummerCupPairing ζ hζ) tr
        (ClassFieldTheory.kummerClass 2 F a) (ClassFieldTheory.kummerClass 2 F b) = 0 ↔
      cup11 (kummerClass a) (kummerClass b) = 0 :=
  sorry

/-- **Frozen QFI--CFT bridge.** The norm-equation/quaternion Hilbert symbol agrees with Class
Field Theory's Kummer-cup symbol after translating its additive invariant to a sign. Class Field
Theory supplies `kummerClass`, `kummerCupPairing`, and `localSymbol`; no theorem in that roadmap
depends on this comparison. It is a consequence of the coefficient comparison above and of Layer
7C's `cup_kummerClass_eq_zero_iff_hilbertSymbol`: both symbols take two values, and each is
trivial exactly when the cup vanishes, so no third normalization is possible. -/
theorem hilbertSymbol_eq_cohomological (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Invertible (2 : F)]
    (ζ : F) (hζ : IsPrimitiveRoot ζ 2)
    (tr : ClassFieldTheory.H 2 F 2 (ClassFieldTheory.muNRep 2 F) ≃+ ZMod 2)
    (a b : Fˣ) :
    hilbertSymbol a b =
      hilbertSign
        (ClassFieldTheory.localSymbol (ClassFieldTheory.kummerCupPairing ζ hζ) tr
          (ClassFieldTheory.kummerClass 2 F a) (ClassFieldTheory.kummerClass 2 F b)) := by
  have hcup := cup_kummerClass_eq_zero_iff_hilbertSymbol (K := F) a b
  have hloc := localSymbol_eq_zero_iff_cup F ζ hζ tr a b
  rcases (show ∀ x : ZMod 2, x = 0 ∨ x = 1 by decide)
      (ClassFieldTheory.localSymbol (ClassFieldTheory.kummerCupPairing ζ hζ) tr
        (ClassFieldTheory.kummerClass 2 F a) (ClassFieldTheory.kummerClass 2 F b)) with h0 | h1
  · rw [h0, show hilbertSign 0 = 1 from by simp [hilbertSign]]
    exact hcup.mp (hloc.mp h0)
  · rw [h1, show hilbertSign 1 = -1 from by simp [hilbertSign]]
    rcases Int.units_eq_one_or (hilbertSymbol a b) with h | h
    · exact absurd (h1.symm.trans (hloc.mpr (hcup.mpr h))) (by decide)
    · exact h

/-- **Frozen global bridge.** This is the multiplicative-sign form of
`ClassFieldTheory.hilbertProductFormula`. At every finite place the factor is the local
norm-equation/quaternion symbol by `hilbertSymbol_eq_cohomological`; the infinite factors use
Class Field Theory's real/complex normalization. Thus this theorem derives reciprocity from CFT
and does not make CFT depend on quadratic forms. -/
theorem hilbertSymbol_productFormula (F : Type) [Field F] [NumberField F] (a b : Fˣ) :
    (∏ v ∈ ClassFieldTheory.finiteHilbertSupport F a b,
        hilbertSign (ClassFieldTheory.finiteHilbertInvariantAt F v a b)) *
      ∏ w : NumberField.InfinitePlace F,
        hilbertSign (ClassFieldTheory.infiniteHilbertInvariantAt F w a b) = 1 := by
  have hcoh := ClassFieldTheory.hilbertProductFormula F a b
  sorry

/-- **Layer 7C, the Steinberg corollary.** -/
theorem cup_kummerClass_one_sub [Invertible (2 : K)] (a : Kˣ) (h : (1 : K) - a ≠ 0) :
    cup11 (kummerClass a)
      (kummerClass (Units.mk0 ((1 : K) - a) h)) = 0 :=
  sorry

/-! ## Layer 8: Stiefel-Whitney classes in degrees 1 and 2 -/

/-- **Layer 8, the first Stiefel-Whitney class** of a diagonal tuple,
`w₁(q) = ∑ᵢ (aᵢ) = (d(q))`, with the plain discriminant. -/
noncomputable def sw1 [Invertible (2 : K)] {n : ℕ} (w : Fin n → Kˣ) : H1 K :=
  ∑ i, kummerClass (w i)

/-- **Layer 8, the second Stiefel-Whitney class** of a diagonal tuple,
`w₂(q) = ∑_{i<j} (aᵢ)(aⱼ)`. -/
noncomputable def sw2 [Invertible (2 : K)] {n : ℕ} (w : Fin n → Kˣ) : H2 K :=
  ∑ ij ∈ Finset.univ.filter fun ij : Fin n × Fin n => ij.1 < ij.2,
    cup11 (kummerClass (w ij.1)) (kummerClass (w ij.2))

/-- **Layer 8, well-definedness of the Stiefel-Whitney classes**, by the Layer 0 descent
principle. The binary step is the cup identity `(a)(b) = (c)(d)` for `⟨a,b⟩ ≅ ⟨c,d⟩`, which is
`cup_kummerClass_eq_zero_iff` together with Layer 0's binary criterion. -/
theorem sw_congr [Invertible (2 : K)] {n : ℕ} (w w' : Fin n → Kˣ)
    (h : (weightedSumSquares K fun i => ((w i : K))).Equivalent
      (weightedSumSquares K fun i => ((w' i : K)))) :
    sw1 w = sw1 w' ∧ sw2 w = sw2 w' :=
  sorry

variable (K)

/-- **Layer 8, `w₁` on isometry classes.** The descent of `sw1` along `Quotient.mk`, by the
Layer 0 descent principle applied to `sw_congr`. This is the definition the form-level theorem
of Layer 9 is stated with: a consumer never supplies a diagonalization. -/
noncomputable def sw1Class [Invertible (2 : K)] : RegularFormClass K → H1 K :=
  sorry

/-- **Layer 8, `w₂` on isometry classes.** -/
noncomputable def sw2Class [Invertible (2 : K)] : RegularFormClass K → H2 K :=
  sorry

variable {K}

/-- `w₁` of a class is computed on any presentation of it. -/
theorem sw1Class_mk [Invertible (2 : K)] {n : ℕ} (w : Fin n → Kˣ) :
    sw1Class K (Quotient.mk (regularFormSetoid K) ⟨n, w⟩) = sw1 w :=
  sorry

/-- `w₂` of a class is computed on any presentation of it. -/
theorem sw2Class_mk [Invertible (2 : K)] {n : ℕ} (w : Fin n → Kˣ) :
    sw2Class K (Quotient.mk (regularFormSetoid K) ⟨n, w⟩) = sw2 w :=
  sorry

/-- **Layer 8, `w₁` is the Kummer class of the discriminant,** on classes: the first low-degree
identity `w₁(q) = (d(q))`, with the plain discriminant and not `d±`. -/
theorem sw1Class_eq_discr [Invertible (2 : K)] (q : RegularFormClass K) :
    sw1Class K q = kummerSquareClassEquiv K (Additive.ofMul (discr q)) :=
  sorry

/-- **Layer 8, `w₁` and `w₂` are invariants of isometry.** Two regular forms that are
`QuadraticMap.Equivalent` have the same classes, since they have the same class in
`RegularFormClass K`. This is the statement a consumer needs in order to apply Layer 9 to a form
given by a construction rather than by a tuple. -/
theorem sw1Class_formClass_congr [Invertible (2 : K)] {V W : Type} [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) (R : QuadraticForm K W)
    (hR : R.Nondegenerate) (h : Q.Equivalent R) :
    sw1Class K (formClass Q hQ) = sw1Class K (formClass R hR) ∧
      sw2Class K (formClass Q hQ) = sw2Class K (formClass R hR) :=
  sorry

/-- **Layer 8, the orthogonal-sum identities**, stated degreewise, since this roadmap has
no total class. -/
theorem sw_append [Invertible (2 : K)] {m n : ℕ} (w : Fin m → Kˣ) (w' : Fin n → Kˣ) :
    sw1 (Fin.append w w') = sw1 w + sw1 w' ∧
      sw2 (Fin.append w w') =
        sw2 w + sw2 w' + cup11 (sw1 w) (sw1 w') :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 8, `w₂` is the image of the Hasse invariant** under the canonical `ι` of
Layer 7B. Both sides are defined on a diagonalization. -/
theorem brauer2EquivH2_hasseInvariant [Invertible (2 : K)] {n : ℕ} (w : Fin n → Kˣ)
    (h : hasseInvariant w ∈ Br2 K) :
    brauer2EquivH2 K (Additive.ofMul ⟨hasseInvariant w, h⟩) = sw2 w :=
  sorry

open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in
/-- **Layer 8, the comparison with the Clifford invariant** (Lam V.3.20 read in
cohomology), with the exponents `A_n` and `B_n` of the README. -/
theorem brauer2EquivH2_cliffordInvariant [Invertible (2 : K)] {n : ℕ} (w : Fin n → Kˣ)
    (h : cliffordInvariant w ∈ Br2 K) :
    brauer2EquivH2 K (Additive.ofMul ⟨cliffordInvariant w, h⟩) =
      sw2 w + ((n - 1) * (n - 2) / 2 : ℕ) •
          cup11 (kummerClass (-1)) (sw1 w) +
        ((n + 1) * n * (n - 1) * (n - 2) / 24 : ℕ) •
          cup11 (kummerClass (-1)) (kummerClass (-1)) :=
  sorry

/-- **Layer 8, acceptance examples.** `w₁⟨a⟩ = (a)` and `w₂⟨a⟩ = 0`; and
`w₂⟨a,b⟩ = (a) ∪ (b)`. -/
example [Invertible (2 : K)] (a b : Kˣ) :
    sw1 ![a] = kummerClass a ∧ sw2 ![a] = 0 ∧
      sw2 ![a, b] = cup11 (kummerClass a)
        (kummerClass b) :=
  sorry

/-! ## Layer 9: the Scharlau transfer and the relative Stiefel-Whitney formula -/

/-- **Layer 9, the nonzero functionals form an `Lˣ`-torsor.** `Hom_K(L,K)` is
one-dimensional over `L` under `(λ · s) x = s (λ x)`, so any two nonzero functionals
differ by a unique unit. This is what makes the change-of-functional theorem compare
every two choices. -/
example {L : Type v} [Field L] [Algebra K L] [FiniteDimensional K L]
    (s s' : L →ₗ[K] K) (hs : s ≠ 0) (hs' : s' ≠ 0) :
    ∃! lam : Lˣ, ∀ x : L, s' x = s ((lam : L) * x) :=
  sorry

/-- **Layer 9, the Scharlau transfer** of a form over `L` along a `K`-functional. This is
Mathlib's `LinearMap.compQuadraticMap'` at `R = L` and `S = K`, that is postcomposition
with `s` and restriction of scalars. The milestones are its properties, that is rank,
regularity, additivity, Frobenius reciprocity, and change of functional, and not the
construction. -/
def scharlauTransfer {L : Type v} [Field L] [Algebra K L] {V : Type v} [AddCommGroup V]
    [Module L V] [Module K V] [IsScalarTower K L V] (s : L →ₗ[K] K)
    (q : QuadraticForm L V) : QuadraticForm K V :=
  s.compQuadraticMap' q

/-- **Layer 9, the transfer respects isometry.** Isometric forms over `L` transfer to isometric
forms over `K`. Without it the transfer is a function of a form and not of its class, and the
form-level theorem below would have to name a presentation. -/
theorem scharlauTransfer_congr {L : Type v} [Field L] [Algebra K L] {V W : Type v}
    [AddCommGroup V] [Module L V] [Module K V] [IsScalarTower K L V]
    [AddCommGroup W] [Module L W] [Module K W] [IsScalarTower K L W]
    (s : L →ₗ[K] K) (q : QuadraticForm L V) (r : QuadraticForm L W) (h : q.Equivalent r) :
    (scharlauTransfer s q).Equivalent (scharlauTransfer s r) :=
  sorry

/-- **Layer 9, the transfer preserves hyperbolic forms.** A Lagrangian stays a
Lagrangian, so `s_*` descends to `W(L) → W(K)`. The descended map is additive and is a
`W(K)`-module map by Frobenius reciprocity. It is **not** a ring map. -/
example {L : Type v} [Field L] [Algebra K L] [FiniteDimensional K L] [Invertible (2 : K)]
    (s : L →ₗ[K] K) (hs : s ≠ 0) (m : ℕ) (hm : Module.finrank K L = m) :
    (scharlauTransfer s (weightedSumSquares L ![(1 : L), -1])).Equivalent
      (weightedSumSquares K (Sum.elim (fun _ : Fin m => (1 : K)) fun _ : Fin m => (-1 : K))) :=
  sorry

/-- **Layer 9, the transfer of `⟨1⟩` along the trace, diagonalized.** For the quadratic
algebra `K[√d]` the trace form is `⟨2, 2d⟩` on the basis `{1, √d}`. -/
example [Invertible (2 : K)] (d : Kˣ) :
    (LinearMap.BilinMap.toQuadraticMap
        (Algebra.traceForm K (QuadraticAlgebra K (d : K) 0))).Equivalent
      (weightedSumSquares K ![(2 : K), 2 * d]) :=
  sorry

/-! ### Layer 9: the twisted trace form

For `L = K(x)` with `x² = d` and `a : Lˣ`, the transfer `Tr_*⟨a⟩ : y ↦ Tr_{L/K}(a y²)` of the
rank-one form `⟨a⟩`. The statements use this file's `scharlauTransfer s q` and multiplicative
`discr`; Tau Ceti's `TauCeti/LinearAlgebra/QuadraticForm/Transfer/` writes the same transfer
`q.scharlauTransfer s` and `q.traceTransfer K`, and its additive `RegularFormClass.discr` is valued
in `SquareClassGroup K`. -/

/-- **Layer 9, the norm in square-root coordinates,** `N(u + v x) = u² − v² d`: the matrix of
multiplication by `u + v x` in the basis `(1, x)` is `[[u, v d], [v, u]]`. The trace companion
`Tr (u + v x) = 2 u` is Tau Ceti's
`TauCeti.Algebra.trace_eq_zero_of_sq_algebraMap_of_not_mem_range`, which gives `Tr x = 0`. -/
theorem norm_add_mul_of_sq {L : Type u} [Field L] [Algebra K L] {x : L} {d : K}
    (hfin : Module.finrank K L = 2) (hx : x ∉ Set.range (algebraMap K L))
    (hx2 : x ^ 2 = algebraMap K L d) (u v : K) :
    Algebra.norm K (algebraMap K L u + algebraMap K L v * x) = u ^ 2 - v ^ 2 * d :=
  sorry

/-- **Layer 9, the twisted trace form in Kahn's basis.** For `Tr a ≠ 0` the elements `1` and
`x / a` are orthogonal for `Tr_*⟨a⟩`, because `Tr (a · x / a) = Tr x = 0`, and their values are
`Tr a` and `Tr (d / a) = d · Tr a / N a`; they are independent, because `x / a ∈ K` would put `a` in
`K x` and force `Tr a = 0`. So `Tr_*⟨a⟩ ≅ ⟨Tr a, d · Tr a / N a⟩`, the basis in which the value of
the Evens norm below is computed. ⚠ `Tr a ≠ 0` is load-bearing: at `Tr a = 0` the two entries are
`0` and the form is hyperbolic, not `⟨0, 0⟩`. -/
theorem traceTransfer_weightedSumSquares_equivalent [Invertible (2 : K)] {L : Type u} [Field L]
    [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L] {x : L} {d : K}
    (hfin : Module.finrank K L = 2) (hx : x ∉ Set.range (algebraMap K L))
    (hx2 : x ^ 2 = algebraMap K L d) (a : Lˣ) (htr : Algebra.trace K L (a : L) ≠ 0) :
    (scharlauTransfer (Algebra.trace K L) (weightedSumSquares L ![(a : L)])).Equivalent
      (weightedSumSquares K
        ![Algebra.trace K L (a : L), d * Algebra.trace K L (a : L) / Algebra.norm K (a : L)]) :=
  sorry

/-- **Layer 9, the twisted trace form at trace zero is hyperbolic.** `Tr_*⟨a⟩ (1) = Tr a = 0`, so
the regular binary form `Tr_*⟨a⟩` is isotropic, hence `≅ ⟨1, −1⟩`. -/
theorem traceTransfer_weightedSumSquares_equivalent_hyperbolic [Invertible (2 : K)] {L : Type u}
    [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (hfin : Module.finrank K L = 2) (a : Lˣ) (htr : Algebra.trace K L (a : L) = 0) :
    (scharlauTransfer (Algebra.trace K L) (weightedSumSquares L ![(a : L)])).Equivalent
      (weightedSumSquares K ![(1 : K), -1]) :=
  sorry

/-- **Layer 9, the discriminant of the twisted trace form,** `d(Tr_*⟨a⟩) = d · N a` in square
classes: in Kahn's basis `Tr a · (d · Tr a / N a) ≡ d · N a`, and at trace zero `a = v x` and
`−1 ≡ d · N (v x) = −v² d²`. With Layer 8's `sw1Class_eq_discr` and Layer 7A's
`galoisCor_kummerClass` this is the whole of the degree-1 formula. -/
theorem discr_traceTransfer [Invertible (2 : K)] {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] [FiniteDimensional K (Fin 1 → L)]
    {x : L} (d : Kˣ) (hfin : Module.finrank K L = 2)
    (hx : x ∉ Set.range (algebraMap K L)) (hx2 : x ^ 2 = algebraMap K L (d : K)) (a : Lˣ)
    (ha : (scharlauTransfer (Algebra.trace K L) (weightedSumSquares L ![(a : L)])).Nondegenerate) :
    discr (formClass _ ha) =
      QuotientGroup.mk d * QuotientGroup.mk (Units.map (Algebra.norm K : L →* K) a) :=
  sorry

/-- **Layer 9, the supplier's corestriction in degree 1, read in this file's carrier.** As with
`cup11`, the body is the supplier's `galoisCor` and the wrapper exists only because that
declaration's result type goes through the supplier's private cohomology adapter, which
instance search cannot reduce against `H1 K`. -/
noncomputable def galoisCor1 {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K) (x : H1 L) : H1 K :=
  (galoisCor K L σ 1).hom x

/-- **Layer 9, the supplier's restriction in degree 1, read in this file's carrier.** -/
noncomputable def galoisRes1 {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K) (x : H1 K) : H1 L :=
  (galoisRes K L σ 1).hom x

/-- **Layer 9, the supplier's Evens norm of a quadratic extension, read in this file's
carrier.** Same reason as `galoisCor1`; the body is the supplier's `galoisEvens`. -/
noncomputable def galoisEvens2 {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K)
    (hdeg : Module.finrank K L = 2) (x : H1 L) : H2 K :=
  galoisEvens K L σ hdeg x

/-- **Layer 9, the supplier's corestriction in degree 2, read in this file's carrier.** Needed
because the cross term of the Evens polarization is a cup formed over `L` and then
corestricted. -/
noncomputable def galoisCor2 {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K) (x : H2 L) : H2 K :=
  (galoisCor K L σ 2).hom x

/-- **Layer 9, the supplier's restriction in degree 2, read in this file's carrier.** -/
noncomputable def galoisRes2 {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K) (x : H2 K) : H2 L :=
  (galoisRes K L σ 2).hom x

/-- **Layer 9, the conjugation convention, read in this file's carrier.** The body is the
supplier's `galoisConj`, which is `res ∘ cor − id`; by the supplier's `evensConj_eq_conjMapOf`
that agrees with conjugation by **every** `s ∈ G_K ∖ G_L`, so no element outside `G_L` is chosen
and the identities below are about `L/K` and not about a choice.
⚠ This is the `σ·x` of the Evens identities, and it is not `x`: a polarization written with `x`
in place of the conjugate is a different and false statement. -/
noncomputable def galoisConj1 {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K) (x : H1 L) : H1 L :=
  galoisConj K L σ 1 x

/-- **Layer 9, the first Evens identity in this file's carriers**, the transport of the
supplier's `galoisRes_galoisEvens`: `res (N x) = x ∪ σ·x`. The cup is formed over `L`, so it is
`cup11` at `L` and not at `K`. -/
theorem galoisRes2_galoisEvens2 {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] [Invertible (2 : L)] (σ : L →ₐ[K] SeparableClosure K)
    (hdeg : Module.finrank K L = 2) (x : H1 L) :
    galoisRes2 σ (galoisEvens2 σ hdeg x) = cup11 x (galoisConj1 σ x) :=
  sorry

/-- **Layer 9, the polarization identity in this file's carriers**, the transport of the
supplier's `galoisEvens_add`:

```text
N (x + y) = N x + N y + cor (x ∪ σ·y).
```

⚠ The Evens norm is **not** additive, and this cross term is exactly the failure. Its cup is
formed over `L`, with the **conjugate** of the second argument, and only then corestricted to
`K`; each of those three choices is load-bearing, and Layer 9's degree-2 Kahn formula is where
they are felt. -/
theorem galoisEvens2_add {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] [Invertible (2 : L)] (σ : L →ₐ[K] SeparableClosure K)
    (hdeg : Module.finrank K L = 2) (x y : H1 L) :
    galoisEvens2 σ hdeg (x + y) =
      galoisEvens2 σ hdeg x + galoisEvens2 σ hdeg y +
        galoisCor2 σ (cup11 x (galoisConj1 σ y)) :=
  sorry

/-- **Layer 9, corestriction is `H¹(G_K,𝔽₂)`-linear**, the transport of the supplier's
`galoisCor_cup` projection formula: `cor (res x ∪ y) = x ∪ cor y`. It is what turns the
`w₁(Tr_*⟨1⟩) ∪ cor(x)` term of the Kahn formula into a statement over `K`. -/
theorem galoisCor2_cup11 {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] [Invertible (2 : K)] [Invertible (2 : L)]
    (σ : L →ₐ[K] SeparableClosure K) (x : H1 K) (y : H1 L) :
    galoisCor2 σ (cup11 (galoisRes1 σ x) y) = cup11 x (galoisCor1 σ y) :=
  sorry

/-- **Layer 9, independence of the embedding, in this file's carriers.** The transport of the
supplier's `galoisCor_embedding_independent`, so that the Kahn formula is about `L/K` and not
about a chosen `σ : L → Kˢ`. -/
theorem galoisCor1_embedding_independent {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ τ : L →ₐ[K] SeparableClosure K) (x : H1 L) :
    galoisCor1 σ x = galoisCor1 τ x :=
  sorry

/-- The same for the Evens norm, transporting `galoisEvens_embedding_independent`. -/
theorem galoisEvens2_embedding_independent {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (σ τ : L →ₐ[K] SeparableClosure K)
    (hdeg : Module.finrank K L = 2) (x : H1 L) :
    galoisEvens2 σ hdeg x = galoisEvens2 τ hdeg x :=
  sorry

/-! ### Layer 9: the norm of a restricted class and the kernel of restriction

Identity 1, `res (N x) = x ∪ σ·x`, determines `N^{Ev}` only modulo the kernel of restriction, which
is `(d) ∪ H¹(G_K, 𝔽₂)`. The statements below identify the supplier's subgroup and character of
`L/K`, describe that kernel, and give the value of the norm on the classes that come from `K`; the
value on every Kummer class is computed in the next block. -/

/-- **Layer 9, `galoisSubgroup K L σ` is the subgroup of `G_K` fixing `σ L`.** The supplier's
Layer 9 describes it as the open subgroup cut out by the embedding and exports no target
signature for that description; the shape this layer consumes is frozen here. -/
theorem mem_galoisSubgroup_iff {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K) (γ : AbsoluteGaloisGroup K) :
    γ ∈ galoisSubgroup K L σ ↔ ∀ y : L, γ (σ y) = σ y :=
  sorry

/-- **Layer 9, the character of `K(√d)/K` is the Kummer class of `d`.** `σ x` is a square root of
`d` in `Kˢ`, and its stabilizer is `galoisSubgroup K L σ`, because `σ L = K(σ x)`; so the
supplier's `galoisCharacter`, the class of the character with kernel `G_L`, is the Kummer class of
`d`. ⚠ `x ∉ K` is load-bearing: for a square `d` the right-hand side is `0` and the left is not. -/
theorem galoisCharacter_eq_kummerClass {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] [Invertible (2 : K)]
    (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2) (d : Kˣ) {x : L}
    (hx : x ∉ Set.range (algebraMap K L)) (hx2 : x ^ 2 = algebraMap K L (d : K)) :
    galoisCharacter K L σ hdeg = kummerClass d :=
  sorry

/-- **Layer 9, identity 5 in this file's carriers,** the transport of the supplier's
`galoisEvens_galoisRes`: `N (res y) = y ∪ y + χ_{L/K} ∪ y`, where `χ_{L/K} = (d)` by
`galoisCharacter_eq_kummerClass`. For `y = (c)` with `c ∈ Kˣ` it agrees with the value below, since
`Tr c = 2c` and `N c = c²`. -/
theorem galoisEvens2_galoisRes1 {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] [Invertible (2 : K)] (σ : L →ₐ[K] SeparableClosure K)
    (hdeg : Module.finrank K L = 2) (y : H1 K) :
    galoisEvens2 σ hdeg (galoisRes1 σ y) = cup11 y y + cup11 (galoisCharacter K L σ hdeg) y :=
  sorry

/-- **Layer 9, the kernel of restriction in degree two,** `ker (res_{L/K}) = (d) ∪ H¹(G_K, 𝔽₂)`,
the transport of the supplier's `galoisRes_eq_zero_iff` through
`galoisCharacter_eq_kummerClass`. The map is restriction and not corestriction. -/
theorem galoisRes2_eq_zero_iff {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] [Invertible (2 : K)] (σ : L →ₐ[K] SeparableClosure K)
    (hdeg : Module.finrank K L = 2) (d : Kˣ) {x : L} (hx : x ∉ Set.range (algebraMap K L))
    (hx2 : x ^ 2 = algebraMap K L (d : K)) (z : H2 K) :
    galoisRes2 σ z = 0 ↔ ∃ y : H1 K, z = cup11 (kummerClass d) y :=
  sorry

/-! ### Layer 9: the value of the Evens norm, through the `Pin⁺` lift of `C₂ ≀ C₂`

Kahn's Lemme II.2.1: `N^{Ev}((a)) = (Tr a) ∪ (−d · N a) + (2) ∪ (d)` when `Tr a ≠ 0`, and
`(2) ∪ (d)` when `Tr a = 0`. The proof is Serre's second proof of his Théorème 1′ at `n = 2`, in
explicit `2 × 2` matrices, and three conventions are pinned, each against a wrong alternative that
changes the answer:

* the Clifford relations `e₁² = e₂² = +1` and `e₁ e₂ = −e₂ e₁` (`pinE1_mul_self`,
  `pinE2_mul_self`, `pinE1_mul_pinE2`, `pinT_mul_self`), which make the lift of `C₂ ≀ C₂` the
  dihedral group `D₁₆` of `Pin⁺` and not the quaternion group `Q₁₆`, as the supplier's `D₁₆` class
  and Kahn's and Serre's `(2)(d)` require;
* the twisted adjoint action `v ↦ det(x) · x v xᵀ` of an orthogonal `x`, which is
  `(−1)^{|x|} x v x⁻¹`, so that a unit vector lifts its own reflection (`IsPinLift`);
* the descent convention: `g ∈ G_K` acts on the coordinates of a point of `W` by `ρ_a(g)ᵀ`, an
  anti-homomorphism in `g`, while `ρ_a` itself is a homomorphism (`kummerPoint_galois`). -/

section EvensValue

open scoped Matrix

section PinModel

variable {F : Type*} [Field F]

/-- **Layer 9, the first Clifford generator** `e₁ = diag(1, −1)` of `Cl(F², ⟨1, 1⟩) = M₂(F)`. -/
def pinE1 : Matrix (Fin 2) (Fin 2) F := !![1, 0; 0, -1]

/-- **Layer 9, the second Clifford generator** `e₂`, which is also the swap matrix. -/
def pinE2 : Matrix (Fin 2) (Fin 2) F := !![0, 1; 1, 0]

/-- `e₁² = +1`: the sign that makes the lift `D₁₆` and not `Q₁₆`. -/
theorem pinE1_mul_self : (pinE1 : Matrix (Fin 2) (Fin 2) F) * pinE1 = 1 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [pinE1, Matrix.mul_apply, Fin.sum_univ_two]

/-- `e₂² = +1`. -/
theorem pinE2_mul_self : (pinE2 : Matrix (Fin 2) (Fin 2) F) * pinE2 = 1 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [pinE2, Matrix.mul_apply, Fin.sum_univ_two]

/-- `e₁ e₂ = −e₂ e₁`. -/
theorem pinE1_mul_pinE2 : (pinE1 : Matrix (Fin 2) (Fin 2) F) * pinE2 = -(pinE2 * pinE1) := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [pinE1, pinE2, Matrix.mul_apply, Fin.sum_univ_two]

/-- **Layer 9, the vector** `y₀ e₁ + y₁ e₂` of `F²` inside the Clifford model. -/
def pinVec (y : Fin 2 → F) : Matrix (Fin 2) (Fin 2) F := y 0 • pinE1 + y 1 • pinE2

/-- **The Clifford relation** `v² = q(v) · 1` for the unit form `q = ⟨1, 1⟩`. -/
theorem pinVec_mul_self (y : Fin 2 → F) :
    pinVec y * pinVec y = (y 0 ^ 2 + y 1 ^ 2) • (1 : Matrix (Fin 2) (Fin 2) F) := by
  ext i j; fin_cases i <;> fin_cases j <;>
    simp [pinVec, pinE1, pinE2, Matrix.mul_apply, Fin.sum_univ_two] <;> ring

/-- **Layer 9, the unit vector `t = (e₁ − e₂)/√2`,** for a square root `r2` of `2`. Its
reflection is the swap of the two coordinates. -/
noncomputable def pinT (r2 : F) : Matrix (Fin 2) (Fin 2) F := r2⁻¹ • (pinE1 - pinE2)

/-- `t² = +1`. -/
theorem pinT_mul_self [Invertible (2 : F)] {r2 : F} (hr2 : r2 ^ 2 = 2) : pinT r2 * pinT r2 = 1 := by
  have h2 : (2 : F) ≠ 0 := two_ne_zero' F
  have hr : r2 ≠ 0 := by
    rintro rfl
    exact h2 (by simpa using hr2.symm)
  ext i j; fin_cases i <;> fin_cases j <;>
    simp [pinT, pinE1, pinE2, Matrix.mul_apply, Fin.sum_univ_two]
  all_goals (field_simp; linear_combination -hr2)

/-- **Layer 9, `x` is a `Pin⁺` lift of `w`:** `x` is orthogonal and its twisted adjoint action
`v ↦ det(x) · x v xᵀ` on vectors is `w`. An orthogonal `2 × 2` matrix is homogeneous, even when its
determinant is `1` and odd when it is `−1`, so this action is `v ↦ (−1)^{|x|} x v x⁻¹`.
⚠ Without the sign, `e₁` would act as `diag(1, −1)`, the reflection in the wrong line. -/
def IsPinLift (x w : Matrix (Fin 2) (Fin 2) F) : Prop :=
  xᵀ * x = 1 ∧ ∀ y : Fin 2 → F, x.det • (x * pinVec y * xᵀ) = pinVec (w *ᵥ y)

/-- Lifts multiply. -/
theorem IsPinLift.mul {x w x' w' : Matrix (Fin 2) (Fin 2) F} (h : IsPinLift x w)
    (h' : IsPinLift x' w') : IsPinLift (x * x') (w * w') := by
  refine ⟨?_, fun y => ?_⟩
  · rw [Matrix.transpose_mul, Matrix.mul_assoc, ← Matrix.mul_assoc xᵀ, h.1, Matrix.one_mul, h'.1]
  · rw [Matrix.det_mul, ← Matrix.mulVec_mulVec, ← h.2, ← h'.2, Matrix.transpose_mul, mul_smul,
      Matrix.mul_smul, Matrix.smul_mul]
    simp only [Matrix.mul_assoc]

/-- Lifts invert. -/
theorem IsPinLift.inv {x w : Matrix (Fin 2) (Fin 2) F} (h : IsPinLift x w) :
    IsPinLift x⁻¹ w⁻¹ :=
  sorry

/-- Lifts are carried by ring homomorphisms, in particular by the Galois action on entries. -/
theorem IsPinLift.map {F' : Type*} [Field F'] (φ : F →+* F') {x w : Matrix (Fin 2) (Fin 2) F}
    (h : IsPinLift x w) : IsPinLift (x.map φ) (w.map φ) :=
  sorry

/-- **Two lifts differ by a sign.** If `x` and `x'` lift `w`, then `x' xᵀ` is orthogonal and acts
trivially: of determinant `1` it commutes with `e₁` and `e₂` and is a scalar `±1`, and of
determinant `−1` it would anticommute with both and be `μ e₁ e₂` with `μ² = 1`, which has
determinant `1`. -/
theorem IsPinLift.eq_or_eq_neg [Invertible (2 : F)] {x x' w : Matrix (Fin 2) (Fin 2) F}
    (h : IsPinLift x w) (h' : IsPinLift x' w) : x' = x ∨ x' = -x :=
  sorry

/-- **Every orthogonal matrix has a lift** over a separably closed field of characteristic not
two: by Tau Ceti's Cartan–Dieudonné theorem
(`TauCeti.QuadraticMap.exists_reflectionOrthogonal_list_prod_eq`) it is a product of at most two
reflections in anisotropic vectors, each vector can be scaled to a unit vector because square
roots exist, and a unit vector `u` lifts its own reflection, since `det(u) = −1` and
`u v u = 2⟨u, v⟩ u − v` by `pinVec_mul_self`. -/
theorem exists_isPinLift [IsSepClosed F] [Invertible (2 : F)] (P : Matrix (Fin 2) (Fin 2) F)
    (hP : Pᵀ * P = 1) : ∃ x, IsPinLift x P :=
  sorry

open Classical in
/-- **Layer 9, the signed-permutation representation of `C₂ ≀ C₂`,**
`(a, b, c) ↦ diag((−1)^a, (−1)^b) · e₂^c`: the base coordinates are signs and the top coordinate
swaps. It is a homomorphism by the supplier's coordinate rule `WreathC2.mk_mul_mk`. -/
def wreathSignedPerm : WreathC2 →* Matrix (Fin 2) (Fin 2) F where
  toFun g := Matrix.diagonal ![if WreathC2.coordA g = 0 then 1 else -1,
      if WreathC2.coordB g = 0 then 1 else -1] *
    (if WreathC2.coordC g = 0 then 1 else pinE2)
  map_one' := by
    rw [← WreathC2.mk_zero]
    simp only [WreathC2.coordA_mk, WreathC2.coordB_mk, WreathC2.coordC_mk, ↓reduceIte, mul_one]
    ext i j; fin_cases i <;> fin_cases j <;> rfl
  map_mul' := sorry

/-- **Layer 9, `D₁₆` in `M₂(F)`,** on Mathlib's `DihedralGroup 8`: `r ↦ e₁ t`, the rotation by
`π/4`, and `f = sr 0 ↦ t`, so that `r i ↦ (e₁ t)^i` and `sr i = f r^i ↦ t (e₁ t)^i`. Its image is
`D̃₁₆ = ⟨e₁, t⟩`. -/
noncomputable def pinDihedral (r2 : F) : DihedralGroup 8 → Matrix (Fin 2) (Fin 2) F
  | .r i => (pinE1 * pinT r2) ^ i.val
  | .sr i => pinT r2 * (pinE1 * pinT r2) ^ i.val

/-- **`D̃₁₆` is dihedral of order 16:** `pinDihedral` is a homomorphism, by `t² = 1`,
`t (e₁ t) t = (e₁ t)⁻¹` and `(e₁ t)⁸ = 1`; its kernel is trivial and `(e₁ t)⁴ = −1`. -/
theorem pinDihedral_mul [Invertible (2 : F)] {r2 : F} (hr2 : r2 ^ 2 = 2) (z z' : DihedralGroup 8) :
    pinDihedral r2 (z * z') = pinDihedral r2 z * pinDihedral r2 z' :=
  sorry

/-- **`D̃₁₆` lies over `C₂ ≀ C₂`:** `pinDihedral z` is a `Pin⁺` lift of the signed permutation of
the supplier's `dihedralToWreath z`. On the generators, `t` lifts the swap `s` and `e₁ t` lifts
`us`, since `e₁` lifts `diag(−1, 1)`. -/
theorem isPinLift_pinDihedral [Invertible (2 : F)] {r2 : F} (hr2 : r2 ^ 2 = 2)
    (z : DihedralGroup 8) :
    IsPinLift (pinDihedral r2 z) (wreathSignedPerm (dihedralToWreath z)) :=
  sorry

/-- **Layer 9, the lift of `C₂ ≀ C₂` into `D̃₁₆`** through the supplier's section `wreathSection`,
`(us)^i s^j ↦ (e₁ t)^i t^j`. -/
noncomputable def pinLift (r2 : F) (g : WreathC2) : Matrix (Fin 2) (Fin 2) F :=
  pinDihedral r2 (wreathSection g)

/-- **The factor set of `pinLift` is `c_{D₁₆}`,** the supplier's `wreathD16Cocycle` read as a sign:
`pinDihedral_mul` and `(e₁ t)⁴ = −1`. -/
theorem pinLift_mul_mul_inv [Invertible (2 : F)] {r2 : F} (hr2 : r2 ^ 2 = 2) (g h : WreathC2) :
    pinLift r2 g * pinLift r2 h * (pinLift r2 (g * h))⁻¹ = (-1) ^ (wreathD16Cocycle (g, h)).val :=
  sorry

open Classical in
/-- **Layer 9, the lift `e₁^{ε₀} e₂^{ε₁}` of a diagonal sign matrix.** -/
def pinDiagonalLift (ε : Fin 2 → ZMod 2) : Matrix (Fin 2) (Fin 2) F :=
  (if ε 0 = 0 then 1 else pinE1) * (if ε 1 = 0 then 1 else pinE2)

open Classical in
/-- It lifts `diag((−1)^{ε₀}, (−1)^{ε₁})`: `e₁` lifts `diag(−1, 1)` and `e₂` lifts `diag(1, −1)`. -/
theorem isPinLift_pinDiagonalLift (ε : Fin 2 → ZMod 2) :
    IsPinLift (pinDiagonalLift ε : Matrix (Fin 2) (Fin 2) F)
      (Matrix.diagonal fun i => if ε i = 0 then 1 else -1) := by
  have hZ : ∀ x : ZMod 2, x = 0 ∨ x = 1 := by decide
  unfold IsPinLift pinDiagonalLift
  rcases hZ (ε 0) with h0 | h0 <;> rcases hZ (ε 1) with h1 | h1 <;>
    (refine ⟨?_, fun y => ?_⟩ <;> ext i j <;> fin_cases i <;> fin_cases j <;>
      simp [h0, h1, pinE1, pinE2, pinVec, Matrix.mul_apply, Fin.sum_univ_two, Matrix.mulVec,
        Matrix.vecMul, Matrix.transpose_apply, dotProduct, Matrix.det_fin_two])

open Classical in
/-- **The product of two diagonal lifts,**
`e₁^a e₂^b · e₁^{a'} e₂^{b'} = (−1)^{b a'} e₁^{a + a'} e₂^{b + b'}`, by `e_i² = +1` and
`e₁ e₂ = −e₂ e₁`. So the twisted boundary of the diagonal lift of `diag(χ_α, χ_β)` is the cup
`χ_β ∪ χ_α`. -/
theorem pinDiagonalLift_mul (ε ε' : Fin 2 → ZMod 2) :
    (pinDiagonalLift ε : Matrix (Fin 2) (Fin 2) F) * pinDiagonalLift ε' =
      (if ε 1 * ε' 0 = 0 then 1 else -1) * pinDiagonalLift (ε + ε') := by
  have hZ : ∀ x : ZMod 2, x = 0 ∨ x = 1 := by decide
  have key : ∀ a b a' b' : ZMod 2,
      ((if a = 0 then 1 else pinE1) * (if b = 0 then 1 else pinE2)) *
          ((if a' = 0 then 1 else pinE1) * (if b' = 0 then 1 else pinE2)) =
        (if b * a' = 0 then 1 else -1) *
          ((if a + a' = 0 then 1 else pinE1) *
            (if b + b' = 0 then (1 : Matrix (Fin 2) (Fin 2) F) else pinE2)) := by
    intro a b a' b'
    rcases hZ a with rfl | rfl <;> rcases hZ b with rfl | rfl <;> rcases hZ a' with rfl | rfl <;>
      rcases hZ b' with rfl | rfl <;>
      (simp (config := {decide := true}) only [↓reduceIte, one_mul, mul_one] <;>
        ext i j <;> fin_cases i <;> fin_cases j <;>
        simp [pinE1, pinE2, Matrix.mul_apply, Fin.sum_univ_two])
  simpa [pinDiagonalLift] using key (ε 0) (ε 1) (ε' 0) (ε' 1)

end PinModel

open Classical in
/-- **Layer 9, the sign of a root under `G_K`:** `rootSign r g` is `0` when `g r = r` and `1`
otherwise. For `r² ∈ K` it is the Kummer character of `r²` read in `𝔽₂`. -/
noncomputable def rootSign (r : SeparableClosure K) (g : AbsoluteGaloisGroup K) : ZMod 2 :=
  if g r = r then 0 else 1

/-- **Layer 9, the Kummer character of `b ∈ Kˣ`,** `g ↦ rootSign r g` for a square root `r` of `b`
in `Kˢ`. It is a homomorphism because `g r = ±r`, in every characteristic. -/
noncomputable def kummerCharacter (b : Kˣ) (r : SeparableClosure K)
    (hr : r ^ 2 = algebraMap K (SeparableClosure K) b) :
    AbsoluteGaloisGroup K →* Multiplicative (ZMod 2) where
  toFun g := Multiplicative.ofAdd (rootSign r g)
  map_one' := by simp [rootSign]
  map_mul' g h := by
    have key : ∀ k : AbsoluteGaloisGroup K, k r = r ∨ k r = -r := fun k =>
      sq_eq_sq_iff_eq_or_eq_neg.1 (by rw [← map_pow, hr, AlgEquiv.commutes])
    have hmul : (g * h) r = g (h r) := rfl
    rw [← ofAdd_add]
    congr 1
    unfold rootSign
    rw [hmul]
    rcases key h with hh | hh
    · rw [hh]; simp
    · rcases key g with hg | hg
      · rw [hh, map_neg, hg]; simp
      · rw [hh, map_neg, hg, neg_neg, ite_eq_left rfl]
        split_ifs <;> decide

/-- The Kummer character is continuous: the stabilizer of `r` is open. -/
theorem continuous_kummerCharacter (b : Kˣ) (r : SeparableClosure K)
    (hr : r ^ 2 = algebraMap K (SeparableClosure K) b) :
    Continuous (kummerCharacter b r hr) :=
  sorry

/-- **Layer 9, the Kummer class is the class of the Kummer character.** The supplier's
`kummerMapCanonical` at `n = 2` is the class of `g ↦ g r / r ∈ μ₂`, and the `μ₂` bridge
`mu2EquivZMod2` reads that cocycle as `rootSign r`. This pins `kummerClass` at cochain level for
every computation of this layer. -/
theorem kummerClass_eq_homClass [Invertible (2 : K)] (b : Kˣ) (r : SeparableClosure K)
    (hr : r ^ 2 = algebraMap K (SeparableClosure K) b) :
    kummerClass b =
      homClass (AbsoluteGaloisGroup K) (kummerCharacter b r hr)
        (continuous_kummerCharacter b r hr) :=
  sorry

/-- **Layer 9, the Kummer character of `a ∈ Lˣ` on `G_L = galoisSubgroup K L σ`,**
`γ ↦ rootSign r γ` for a square root `r` of `σ a`: every `γ` in `G_L` fixes `σ L`
(`mem_galoisSubgroup_iff`), hence `r²`, so `γ r = ±r`. -/
noncomputable def galoisKummerCharacter {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K)
    (a : Lˣ) (r : SeparableClosure K) (hr : r ^ 2 = σ (a : L)) :
    (galoisSubgroup K L σ).toSubgroup →* Multiplicative (ZMod 2) where
  toFun γ := Multiplicative.ofAdd (rootSign r (γ : AbsoluteGaloisGroup K))
  map_one' := by simp [rootSign]
  map_mul' γ γ' := by
    have key : ∀ k : (galoisSubgroup K L σ).toSubgroup,
        (k : AbsoluteGaloisGroup K) r = r ∨ (k : AbsoluteGaloisGroup K) r = -r := fun k =>
      sq_eq_sq_iff_eq_or_eq_neg.1
        (by rw [← map_pow, hr]; exact (mem_galoisSubgroup_iff σ k).1 k.2 (a : L))
    have hmul : ((γ * γ' : (galoisSubgroup K L σ).toSubgroup) : AbsoluteGaloisGroup K) r =
        (γ : AbsoluteGaloisGroup K) ((γ' : AbsoluteGaloisGroup K) r) := rfl
    rw [← ofAdd_add]
    congr 1
    unfold rootSign
    rw [hmul]
    rcases key γ' with hh | hh
    · rw [hh]; simp
    · rcases key γ with hg | hg
      · rw [hh, map_neg, hg]; simp
      · rw [hh, map_neg, hg, neg_neg, ite_eq_left rfl]
        split_ifs <;> decide

/-- The Kummer character of `a` on `G_L` is continuous. -/
theorem continuous_galoisKummerCharacter {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K)
    (a : Lˣ) (r : SeparableClosure K) (hr : r ^ 2 = σ (a : L)) :
    Continuous (galoisKummerCharacter σ a r hr) :=
  sorry

/-- **Layer 9, the Kummer class of `a ∈ Lˣ`, carried to `galoisSubgroup K L σ`, is the class of
its Kummer character**: `kummerClass_eq_homClass` over `L`, transported along the supplier's
`galoisSubgroupEquiv`, which sends `γ` to its action on `σ L`. -/
theorem galoisF2Iso_inv_kummerClass {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] [Invertible (2 : L)]
    (σ : L →ₐ[K] SeparableClosure K) (a : Lˣ) (r : SeparableClosure K) (hr : r ^ 2 = σ (a : L)) :
    (galoisF2Iso K L σ 1).inv.hom (kummerClass a) =
      homClass _ (galoisKummerCharacter σ a r hr) (continuous_galoisKummerCharacter σ a r hr) :=
  sorry

/-- **Layer 9, the class of an explicit continuous `𝔽₂`-valued 2-cocycle of `G_K`,** read in
`H²(G_K, 𝔽₂)`: the supplier's Layer 1 `cochainClass` of its Layer 3 `inhomogeneousCochain2`. -/
noncomputable def f2CocycleClass (f : AbsoluteGaloisGroup K × AbsoluteGaloisGroup K → ZMod 2)
    (hf : Continuous f)
    (hc : ∀ g h j, f (g * h, j) + f (g, h) = f (h, j) + f (g, h * j)) : H2 K :=
  cochainClass ℤ (trivialF2 (AbsoluteGaloisGroup K)) 2
    (inhomogeneousCochain2 (AbsoluteGaloisGroup K) f hf)
    (inhomogeneousCochain2_d_eq_zero (AbsoluteGaloisGroup K) f hf hc)

/-- **Layer 9, the class map is additive and kills coboundaries:** if
`f = f₁ + f₂ + ∂ψ` for a continuous `ψ : G_K → 𝔽₂`, then `[f] = [f₁] + [f₂]`. This is the shape of
the supplier's class map (Layer 1's `cochainClass` with `cochainClass_eq_of_sub_eq_d`, on Layer 3's
explicit cochains) that this layer consumes; the supplier exports no target signature for it. -/
theorem f2CocycleClass_eq_add (f f₁ f₂ : AbsoluteGaloisGroup K × AbsoluteGaloisGroup K → ZMod 2)
    (hf : Continuous f) (hf₁ : Continuous f₁) (hf₂ : Continuous f₂)
    (hc : ∀ g h j, f (g * h, j) + f (g, h) = f (h, j) + f (g, h * j))
    (hc₁ : ∀ g h j, f₁ (g * h, j) + f₁ (g, h) = f₁ (h, j) + f₁ (g, h * j))
    (hc₂ : ∀ g h j, f₂ (g * h, j) + f₂ (g, h) = f₂ (h, j) + f₂ (g, h * j))
    (ψ : AbsoluteGaloisGroup K → ZMod 2) (hψ : Continuous ψ)
    (h : ∀ g h, f (g, h) = f₁ (g, h) + f₂ (g, h) + (ψ h - ψ (g * h) + ψ g)) :
    f2CocycleClass f hf hc = f2CocycleClass f₁ hf₁ hc₁ + f2CocycleClass f₂ hf₂ hc₂ :=
  sorry

/-- **Layer 9, the cup of two classes of continuous homomorphisms is the class of the product
cochain** `(g, h) ↦ χ(g) ψ(h)`: the supplier's `explicitIso_cup` and `homClass_eq_cochainClass` at
the trivial `𝔽₂` coefficients, where the explicit `(1, 1)` cup `a(g) · g(b(h))` loses its action. -/
theorem cup11_homClass [Invertible (2 : K)] (χ ψ : AbsoluteGaloisGroup K →* Multiplicative (ZMod 2))
    (hχ : Continuous χ) (hψ : Continuous ψ) :
    cup11 (homClass _ χ hχ) (homClass _ ψ hψ) =
      f2CocycleClass (fun q => Multiplicative.toAdd (χ q.1) * Multiplicative.toAdd (ψ q.2))
        ((continuous_of_discreteTopology (f := fun p : ZMod 2 × ZMod 2 => p.1 * p.2)).comp
          ((continuous_toAdd.comp (hχ.comp continuous_fst)).prodMk
            (continuous_toAdd.comp (hψ.comp continuous_snd))))
        (fun g h j => by simp only [map_mul, toAdd_mul]; ring) :=
  sorry

/-- **Layer 9, the representation `ρ_a = Ind α_a : G_K → C₂ ≀ C₂`,** the supplier's `indexTwoInd`
at the Kummer character of `a` on `G_L`, for a square root `r` of `σ a` and an `s ∈ G_K ∖ G_L`.
Through `wreathSignedPerm` it is the action of `G_K` on the roots `r, s r` of `X² − σ a` and
`X² − s (σ a)`: the `D₈`-representation of `M = K(√d, √a, √σa)`. -/
noncomputable def kummerInd {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2)
    (a : Lˣ) (r : SeparableClosure K) (hr : r ^ 2 = σ (a : L)) (s : AbsoluteGaloisGroup K)
    (hs : s ∉ galoisSubgroup K L σ) : AbsoluteGaloisGroup K →* WreathC2 :=
  indexTwoInd (galoisSubgroup K L σ).toSubgroup (by rw [galoisSubgroup_index]; exact hdeg) s hs
    (galoisKummerCharacter σ a r hr)

set_option synthInstance.maxHeartbeats 400000 in
/-- **Layer 9, step 1 at the bridge: `N^{Ev}((a)) = ρ_a^* c_{D₁₆}`.** The body of `galoisEvens2` is
the supplier's `evensNormIndexTwo` at `galoisSubgroup K L σ` applied to the transported class,
which is the class of the Kummer character by `galoisF2Iso_inv_kummerClass`, and the supplier's
`evensNormIndexTwo_eq_ind_pullback` evaluates it as the class of `c_{D₁₆} ∘ (ρ_a × ρ_a)`. -/
theorem galoisEvens2_kummerClass_eq_pullback {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] [Invertible (2 : L)]
    (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2) (a : Lˣ)
    (r : SeparableClosure K) (hr : r ^ 2 = σ (a : L)) (s : AbsoluteGaloisGroup K)
    (hs : s ∉ galoisSubgroup K L σ) :
    galoisEvens2 σ hdeg (kummerClass a) =
      f2CocycleClass
        (fun q => wreathD16Cocycle (kummerInd σ hdeg a r hr s hs q.1,
          kummerInd σ hdeg a r hr s hs q.2))
        (continuous_wreathD16Cocycle_indexTwoInd (galoisSubgroup K L σ) _ s hs _
          (continuous_galoisKummerCharacter σ a r hr))
        (fun g h j => by simp only [map_mul]; exact wreathD16Cocycle_isCocycle _ _ _) :=
  sorry

/-- **Layer 9, the point `φ(y) = (σ y · r, s (σ y · r))` of `(Kˢ)²`** attached to `y ∈ L`. The image
`W = φ(L)` is a `K`-form of `(Kˢ)²`, and with the unit form of `(Kˢ)²` it is `Tr_*⟨a⟩`. -/
noncomputable def kummerPoint {L : Type u} [Field L] [Algebra K L]
    (σ : L →ₐ[K] SeparableClosure K) (r : SeparableClosure K) (s : AbsoluteGaloisGroup K)
    (y : L) : Fin 2 → SeparableClosure K :=
  ![σ y * r, s (σ y * r)]

/-- **Layer 9, step 2: `W` carries `Tr_*⟨a⟩`.** `φ(y) · φ(y') = Tr_{L/K}(a y y')` for the unit form
of `(Kˢ)²`, because `σ` and `s ∘ σ` are the two `K`-embeddings of `L` into `Kˢ` and `r² = σ a`. -/
theorem kummerPoint_dotProduct {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2)
    (a : Lˣ) (r : SeparableClosure K) (hr : r ^ 2 = σ (a : L)) (s : AbsoluteGaloisGroup K)
    (hs : s ∉ galoisSubgroup K L σ) (y y' : L) :
    kummerPoint σ r s y ⬝ᵥ kummerPoint σ r s y' =
      algebraMap K (SeparableClosure K) (Algebra.trace K L ((a : L) * y * y')) :=
  sorry

/-- **Layer 9, step 2: the descent convention.** `g ∈ G_K` acts on the coordinates of `φ(y)` by
`ρ_a(g)ᵀ`, where `ρ_a = wreathSignedPerm ∘ kummerInd`; so `g ↦ ρ_a(g)ᵀ` is an anti-homomorphism
and `ρ_a` a homomorphism. At `y = 1` this says that the columns of `ρ_a(g)` are the images of the
roots `r` and `s r` under `g`, in the basis `(r, s r)`. -/
theorem kummerPoint_galois [Invertible (2 : K)] {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K)
    (hdeg : Module.finrank K L = 2) (a : Lˣ) (r : SeparableClosure K) (hr : r ^ 2 = σ (a : L))
    (s : AbsoluteGaloisGroup K) (hs : s ∉ galoisSubgroup K L σ) (y : L)
    (g : AbsoluteGaloisGroup K) :
    (fun i => g (kummerPoint σ r s y i)) =
      (wreathSignedPerm (kummerInd σ hdeg a r hr s hs g))ᵀ *ᵥ kummerPoint σ r s y :=
  sorry

/-- **Layer 9, the frame of an orthogonal basis:** for `y : Fin 2 → L` and `c : Fin 2 → Kˢ`, the
matrix whose `j`-th column is `φ(y j) / c j`. -/
noncomputable def kummerFrame {L : Type u} [Field L] [Algebra K L]
    (σ : L →ₐ[K] SeparableClosure K) (r : SeparableClosure K) (s : AbsoluteGaloisGroup K)
    (y : Fin 2 → L) (c : Fin 2 → SeparableClosure K) :
    Matrix (Fin 2) (Fin 2) (SeparableClosure K) :=
  Matrix.of fun i j => kummerPoint σ r s (y j) i / c j

open Classical in
/-- **Layer 9, step 4: the diagonalization.** Let `y` be an orthogonal basis of `Tr_*⟨a⟩` with
values `w_j = Tr (a y_j²)` and let `c_j² = w_j`. The frame `P` is orthogonal by
`kummerPoint_dotProduct`, and `P⁻¹ ρ_a(g) g(P) = diag((−1)^{rootSign c₀ g}, (−1)^{rootSign c₁ g})`
by `kummerPoint_galois`: `ρ_a` is cohomologous in `Z¹(G_K, O₂(Kˢ))` to the diagonal cocycle of the
Kummer characters of `w₀` and `w₁`. In Kahn's basis `(1, x/a)` these are `Tr a` and
`d · Tr a / N a`; at trace zero a hyperbolic basis gives `1` and `−1`. -/
theorem kummerFrame_conj [Invertible (2 : K)] {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K)
    (hdeg : Module.finrank K L = 2) (a : Lˣ) (r : SeparableClosure K) (hr : r ^ 2 = σ (a : L))
    (s : AbsoluteGaloisGroup K) (hs : s ∉ galoisSubgroup K L σ) (y : Fin 2 → L)
    (hy : Algebra.trace K L ((a : L) * y 0 * y 1) = 0) (c : Fin 2 → SeparableClosure K)
    (hc : ∀ i, c i ^ 2 = algebraMap K (SeparableClosure K) (Algebra.trace K L ((a : L) * y i ^ 2)))
    (hc0 : ∀ i, c i ≠ 0) (g : AbsoluteGaloisGroup K) :
    (kummerFrame σ r s y c)ᵀ * kummerFrame σ r s y c = 1 ∧
      (kummerFrame σ r s y c)⁻¹ * wreathSignedPerm (kummerInd σ hdeg a r hr s hs g) *
          (kummerFrame σ r s y c).map g =
        Matrix.diagonal fun i => if rootSign (c i) g = 0 then 1 else -1 :=
  sorry

/-- **Layer 9, the twisted boundary** of a matrix-valued 1-cochain of `G_K`,
`δ(x)(g, h) = x(g) · g(x(h)) · x(gh)⁻¹`, with `g` acting on entries. -/
noncomputable def twistedBoundary
    (x : AbsoluteGaloisGroup K → Matrix (Fin 2) (Fin 2) (SeparableClosure K))
    (q : AbsoluteGaloisGroup K × AbsoluteGaloisGroup K) :
    Matrix (Fin 2) (Fin 2) (SeparableClosure K) :=
  x q.1 * (x q.2).map q.1 * (x (q.1 * q.2))⁻¹

open Classical in
/-- **Layer 9, the twisted boundary read in `𝔽₂`:** `0` where it is `1` and `1` elsewhere. Where the
twisted boundary is `±1`, this is its exponent. -/
noncomputable def twistedBoundaryF2
    (x : AbsoluteGaloisGroup K → Matrix (Fin 2) (Fin 2) (SeparableClosure K))
    (q : AbsoluteGaloisGroup K × AbsoluteGaloisGroup K) : ZMod 2 :=
  if twistedBoundary x q = 1 then 0 else 1

/-- **Layer 9, step 5: conjugation invariance,** `δ(g ↦ Q⁻¹ x(g) g(Q)) = Q⁻¹ δ(x) Q` for invertible
`Q`, because `g(h(Q)) = (g h)(Q)`. A scalar twisted boundary is therefore unchanged. -/
theorem twistedBoundary_conj
    (x : AbsoluteGaloisGroup K → Matrix (Fin 2) (Fin 2) (SeparableClosure K))
    (Q : Matrix (Fin 2) (Fin 2) (SeparableClosure K)) (hQ : IsUnit Q.det)
    (g h : AbsoluteGaloisGroup K) :
    twistedBoundary (fun g => Q⁻¹ * x g * Q.map g) (g, h) = Q⁻¹ * twistedBoundary x (g, h) * Q :=
  sorry

/-- **Layer 9, the lift `ρ̃_a = pinLift ∘ ρ_a`** of the representation `ρ_a` into `D̃₁₆ ⊂ M₂(Kˢ)`,
for a square root `r2` of `2` in `Kˢ`. -/
noncomputable def kummerIndLift {L : Type u} [Field L] [Algebra K L] [FiniteDimensional K L]
    [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2)
    (a : Lˣ) (r : SeparableClosure K) (hr : r ^ 2 = σ (a : L)) (s : AbsoluteGaloisGroup K)
    (hs : s ∉ galoisSubgroup K L σ) (r2 : SeparableClosure K) (g : AbsoluteGaloisGroup K) :
    Matrix (Fin 2) (Fin 2) (SeparableClosure K) :=
  pinLift r2 (kummerInd σ hdeg a r hr s hs g)

/-- **Layer 9, the Galois action on the lift:** `g` fixes `e₁` and `e₂` and sends `t` to
`(−1)^{rootSign r2 g} t`, since `g r2 = ±r2`; so it multiplies `pinLift w` by
`(−1)^{rootSign r2 g · c}`, where `c` is the top coordinate of `w`, which counts the factors `t`. -/
theorem pinLift_map_galois [Invertible (2 : K)] {r2 : SeparableClosure K} (hr2 : r2 ^ 2 = 2)
    (g : AbsoluteGaloisGroup K) (w : WreathC2) :
    (pinLift r2 w).map g = (-1) ^ (rootSign r2 g * WreathC2.coordC w).val * pinLift r2 w :=
  sorry

/-- **Layer 9, step 3: `δ(ρ̃_a) = ρ_a^* c_{D₁₆} + (2) ∪ (d)` at cochain level,** as an equation of
matrices. `pinLift_mul_mul_inv` gives the factor set, `pinLift_map_galois` the twist, and the top
coordinate of `ρ_a h` is `rootSign (σ x) h`, the character with kernel `G_L`. This `(2) ∪ (d)` is
Serre's `(2)(d_E)`, and it is the discriminant of `L/K` that enters, not that of `Tr_*⟨a⟩`. -/
theorem twistedBoundary_kummerIndLift [Invertible (2 : K)] {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (σ : L →ₐ[K] SeparableClosure K)
    (hdeg : Module.finrank K L = 2) (d : Kˣ) {x : L} (hx : x ∉ Set.range (algebraMap K L))
    (hx2 : x ^ 2 = algebraMap K L (d : K)) (a : Lˣ) (r : SeparableClosure K)
    (hr : r ^ 2 = σ (a : L)) (s : AbsoluteGaloisGroup K) (hs : s ∉ galoisSubgroup K L σ)
    {r2 : SeparableClosure K} (hr2 : r2 ^ 2 = 2) (g h : AbsoluteGaloisGroup K) :
    twistedBoundary (kummerIndLift σ hdeg a r hr s hs r2) (g, h) =
      (-1) ^ (wreathD16Cocycle (kummerInd σ hdeg a r hr s hs g, kummerInd σ hdeg a r hr s hs h) +
        rootSign r2 g * rootSign (σ x) h).val :=
  sorry

/-- **Layer 9, step 5: `δ(ρ̃_a)` is cohomologous to the cup of the diagonal.** Take a `Pin⁺` lift
`P̃` of the frame (`exists_isPinLift`). By `twistedBoundary_conj` and step 3, the cochain
`g ↦ P̃⁻¹ ρ̃_a(g) g(P̃)` has the twisted boundary of `ρ̃_a`; by `isPinLift_pinDihedral`,
`IsPinLift.mul`, `IsPinLift.inv`, `IsPinLift.map` and `kummerFrame_conj` it lifts the diagonal
cocycle, as does `pinDiagonalLift`, so the two differ by a continuous sign `(−1)^{ψ(g)}`
(`IsPinLift.eq_or_eq_neg`); and the diagonal lift is Galois-fixed with twisted boundary
`rootSign c₁ g · rootSign c₀ h` by `pinDiagonalLift_mul`. -/
theorem twistedBoundaryF2_kummerIndLift_cohomologous [Invertible (2 : K)] {L : Type u} [Field L]
    [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2) (a : Lˣ)
    (r : SeparableClosure K) (hr : r ^ 2 = σ (a : L)) (s : AbsoluteGaloisGroup K)
    (hs : s ∉ galoisSubgroup K L σ) {r2 : SeparableClosure K} (hr2 : r2 ^ 2 = 2) (y : Fin 2 → L)
    (hy : Algebra.trace K L ((a : L) * y 0 * y 1) = 0) (c : Fin 2 → SeparableClosure K)
    (hc : ∀ i, c i ^ 2 = algebraMap K (SeparableClosure K) (Algebra.trace K L ((a : L) * y i ^ 2)))
    (hc0 : ∀ i, c i ≠ 0) :
    ∃ ψ : AbsoluteGaloisGroup K → ZMod 2, Continuous ψ ∧ ∀ g h,
      twistedBoundaryF2 (kummerIndLift σ hdeg a r hr s hs r2) (g, h) =
        rootSign (c 1) g * rootSign (c 0) h + (ψ h - ψ (g * h) + ψ g) :=
  sorry

end EvensValue

/-- **Layer 9, the value of the Evens norm on a Kummer class** (Kahn, Invent. Math. 78 (1984),
Lemme II.2.1), for `Tr a ≠ 0`:

```text
N^{Ev}((a)) = (Tr a) ∪ (−d · N a) + (2) ∪ (d).
```

Proof, for any `r`, `s`, `r2` as above: `galoisEvens2_kummerClass_eq_pullback`, then
`twistedBoundary_kummerIndLift` and `twistedBoundaryF2_kummerIndLift_cohomologous` in Kahn's basis
`(1, x / a)` (`traceTransfer_weightedSumSquares_equivalent`) give
`c_{D₁₆} ∘ (ρ_a × ρ_a) = (rootSign c₁ ∪ rootSign c₀) + (rootSign r2 ∪ rootSign (σ x)) + ∂ψ`, so by
`f2CocycleClass_eq_add`, `cup11_homClass` and `kummerClass_eq_homClass`,
`N^{Ev}((a)) = (d · Tr a / N a) ∪ (Tr a) + (2) ∪ (d)`; finally `cup11_comm`, `1 / N a ≡ N a` and
`(Tr a) ∪ (−Tr a) = 0` (`cup_kummerClass_eq_zero_iff`, `−t = 0² − t · 1²`) rewrite
`(Tr a) ∪ (d · Tr a / N a)` as `(Tr a) ∪ (−d · N a)`. -/
theorem galoisEvens2_kummerClass [Invertible (2 : K)] {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] [Invertible (2 : L)]
    (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2) (d : Kˣ) {x : L}
    (hx : x ∉ Set.range (algebraMap K L)) (hx2 : x ^ 2 = algebraMap K L (d : K)) (a : Lˣ)
    (t : Kˣ) (ht : (t : K) = Algebra.trace K L (a : L)) :
    galoisEvens2 σ hdeg (kummerClass a) =
      cup11 (kummerClass t) (kummerClass (-(d * Units.map (Algebra.norm K : L →* K) a))) +
        cup11 (kummerClass (unitOfInvertible (2 : K))) (kummerClass d) :=
  sorry

/-- **Layer 9, the value of the Evens norm at trace zero:** `N^{Ev}((a)) = (2) ∪ (d)`. The same
proof with a hyperbolic basis (`traceTransfer_weightedSumSquares_equivalent_hyperbolic`), whose
values `1` and `−1` give `(−1) ∪ (1) = 0`. -/
theorem galoisEvens2_kummerClass_of_trace_eq_zero [Invertible (2 : K)] {L : Type u} [Field L]
    [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L] [Invertible (2 : L)]
    (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2) (d : Kˣ) {x : L}
    (hx : x ∉ Set.range (algebraMap K L)) (hx2 : x ^ 2 = algebraMap K L (d : K)) (a : Lˣ)
    (ht : Algebra.trace K L (a : L) = 0) :
    galoisEvens2 σ hdeg (kummerClass a) =
      cup11 (kummerClass (unitOfInvertible (2 : K))) (kummerClass d) :=
  sorry

/-- **Layer 9, the norm of `1 + t√d`:** `N^{Ev}((1 + t x)) = (2) ∪ (1 − t² d)`. From
`galoisEvens2_kummerClass` with `Tr (1 + t x) = 2` (Tau Ceti's
`TauCeti.Algebra.trace_eq_zero_of_sq_algebraMap_of_not_mem_range`) and `N (1 + t x) = 1 − t² d`
(`norm_add_mul_of_sq`): `(2) ∪ (−d (1 − t² d)) + (2) ∪ (d) = (2) ∪ (−1) + (2) ∪ (1 − t² d)`, and
`(2) ∪ (−1) = 0` because `−1 = 1² − 2 · 1²` (`cup_kummerClass_eq_zero_iff`). There is no term from
the kernel `(d) ∪ H¹(G_K, 𝔽₂)` of restriction. -/
theorem galoisEvens2_kummerClass_one_add [Invertible (2 : K)] {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] [Invertible (2 : L)]
    (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2) (d : Kˣ) {x : L}
    (hx : x ∉ Set.range (algebraMap K L)) (hx2 : x ^ 2 = algebraMap K L (d : K)) (t : K)
    (ht : 1 - t ^ 2 * (d : K) ≠ 0) (b : Lˣ) (hb : (b : L) = 1 + algebraMap K L t * x) :
    galoisEvens2 σ hdeg (kummerClass b) =
      cup11 (kummerClass (unitOfInvertible (2 : K))) (kummerClass (Units.mk0 _ ht)) :=
  sorry

/-- **Layer 9, the norm of `√d`:** `N^{Ev}((x)) = (2) ∪ (d)`, the trace-zero case at `a = x`. -/
theorem galoisEvens2_kummerClass_sqrt [Invertible (2 : K)] {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] [Invertible (2 : L)]
    (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2) (d : Kˣ) {x : L}
    (hx : x ∉ Set.range (algebraMap K L)) (hx2 : x ^ 2 = algebraMap K L (d : K)) (b : Lˣ)
    (hb : (b : L) = x) :
    galoisEvens2 σ hdeg (kummerClass b) =
      cup11 (kummerClass (unitOfInvertible (2 : K))) (kummerClass d) :=
  sorry

/-- **Layer 9, the relative Stiefel-Whitney formula for a quadratic extension**, stated on the
transferred forms themselves (Kahn, Invent. Math. 78 (1984), Théorème 2 in degrees `≤ 2` and
Prop. II.3.5 at rank one; Kozlowski, Proc. AMS 91 (1984), Thm 1.1; Evens, Trans. AMS 108 (1963),
for the norm).

Nothing in the statement is a chosen diagonalization: the two sides are the Stiefel-Whitney
classes of the isometry classes of `Tr_*⟨1⟩` and `Tr_*⟨a⟩`, and the operations are the canonical
corestriction, cup and Evens norm attached to `L/K`. The regularity hypotheses are what make the
two transferred forms have classes; they are Layer 9's own milestone that the transfer of a
regular form along a nonzero functional is regular.

Proof, with `L = K(x)`, `x² = d ∈ Kˣ`. Degree 1: `sw1Class_eq_discr`, `discr_traceTransfer` at
`a` and at `1`, and `galoisCor_kummerClass` make both sides `(d) + (N a)`. Degree 2, Kahn's
computation: `Tr_*⟨1⟩ ≅ ⟨2, 2d⟩`, so `w₁(Tr_*⟨1⟩) = (d)` and
`w₂(Tr_*⟨1⟩) = (2) ∪ (2d) = (2) ∪ (d)`, as `(2) ∪ (2) = (2) ∪ (−1) = 0`; and
`(d) ∪ cor (a) = (d) ∪ (N a) = 0`, since `N a = u² − d v²` (`cup_kummerClass_eq_zero_iff`). So
the right-hand side is `(2) ∪ (d) + N^{Ev}((a))`. For `Tr a ≠ 0` the left-hand side is
`w₂ ⟨Tr a, d · Tr a / N a⟩ = (Tr a) ∪ (−d · N a)`, and `galoisEvens2_kummerClass` makes the
right-hand side the same; for `Tr a = 0` both sides are `0`, by
`traceTransfer_weightedSumSquares_equivalent_hyperbolic` and
`galoisEvens2_kummerClass_of_trace_eq_zero`. `sw2Class_mk` with `formClass_mk` evaluates `w₂` on
these diagonalizations. -/
theorem relativeStiefelWhitney_quadraticExtension {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] [Invertible (2 : K)] [Invertible (2 : L)]
    [FiniteDimensional K (Fin 1 → L)]
    (hdeg : Module.finrank K L = 2) (σ : L →ₐ[K] SeparableClosure K) (a : Lˣ)
    (h1 : (scharlauTransfer (Algebra.trace K L) (weightedSumSquares L ![(1 : L)])).Nondegenerate)
    (ha : (scharlauTransfer (Algebra.trace K L) (weightedSumSquares L ![(a : L)])).Nondegenerate) :
    sw1Class K (formClass _ ha) =
        sw1Class K (formClass _ h1) + galoisCor1 σ (kummerClass a) ∧
      sw2Class K (formClass _ ha) =
        sw2Class K (formClass _ h1) + galoisEvens2 σ hdeg (kummerClass a) +
          cup11 (sw1Class K (formClass _ h1)) (galoisCor1 σ (kummerClass a)) :=
  sorry

/-- **Layer 9, the calculational corollary of the formula above**, on chosen diagonal tuples.
`t` presents the trace form `Tr_*⟨1⟩` and `b` presents the twisted trace form `Tr_*⟨a⟩`; the
identity is then an equation between the Layer 8 classes of those tuples. This is the shape a
computation over a fixed base uses, and it follows from the form-level theorem through
`sw1Class_mk` and `sw2Class_mk`. -/
theorem relativeStiefelWhitney_quadraticExtension_diagonal {L : Type u} [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] [Invertible (2 : K)] [Invertible (2 : L)]
    (hdeg : Module.finrank K L = 2) (σ : L →ₐ[K] SeparableClosure K)
    (a : Lˣ) (t b : Fin 2 → Kˣ)
    (ht : (weightedSumSquares K fun i => ((t i : K))).Equivalent
      (LinearMap.BilinMap.toQuadraticMap (Algebra.traceForm K L)))
    (hb : (weightedSumSquares K fun i => ((b i : K))).Equivalent
      (scharlauTransfer (Algebra.trace K L) (weightedSumSquares L ![(a : L)]))) :
    sw1 b = sw1 t + galoisCor1 σ (kummerClass a) ∧
      sw2 b = sw2 t + galoisEvens2 σ hdeg (kummerClass a) +
        cup11 (sw1 t) (galoisCor1 σ (kummerClass a)) :=
  sorry

/-- **Layer 9, acceptance: the value of the Evens norm pins its sign.** Over `ℚ₂` with `d = −1`,
`L = ℚ₂(i)` and `a = 1 + 2i`: `Tr a = 2` and `N a = 5`, so `galoisEvens2_kummerClass_one_add` at
`t = 2` gives `N^{Ev}((a)) = (2) ∪ (5)`, which is nonzero because `(2, 5)_{ℚ₂} = −1`. Kahn's form
`(Tr a) ∪ (−d · N a) + (2) ∪ (d) = (2) ∪ (5) + (2) ∪ (−1)` is the class `(2) ∪ (−5)`, the same one,
because `(2, −1)_{ℚ₂} = +1`. The value with the extra term `(d) ∪ (−1) = (−1) ∪ (−1)`, which is what
the `SD₁₆` class would give, is `0`, because `(−1, −1)_{ℚ₂} = −1` and `H²(G_{ℚ₂}, 𝔽₂)` has two
elements; restriction to `L` cannot see the difference, since `(d) ∪ (−1)` lies in its kernel. -/
example [Invertible (2 : ℚ_[2])] {L : Type} [Field L] [Algebra ℚ_[2] L]
    [FiniteDimensional ℚ_[2] L] [Algebra.IsSeparable ℚ_[2] L] [Invertible (2 : L)]
    (σ : L →ₐ[ℚ_[2]] SeparableClosure ℚ_[2]) (hdeg : Module.finrank ℚ_[2] L = 2) (i : L)
    (hi : i ^ 2 = -1) (a : Lˣ) (ha : (a : L) = 1 + 2 * i) :
    galoisEvens2 σ hdeg (kummerClass a) =
        cup11 (kummerClass (unitOfInvertible (2 : ℚ_[2])))
          (kummerClass (Units.mk0 (5 : ℚ_[2]) (by norm_num))) ∧
      cup11 (kummerClass (unitOfInvertible (2 : ℚ_[2])))
          (kummerClass (Units.mk0 (5 : ℚ_[2]) (by norm_num))) ≠ 0 ∧
      galoisEvens2 σ hdeg (kummerClass a) =
        cup11 (kummerClass (unitOfInvertible (2 : ℚ_[2])))
          (kummerClass (-Units.mk0 (5 : ℚ_[2]) (by norm_num))) ∧
      galoisEvens2 σ hdeg (kummerClass a) ≠
        cup11 (kummerClass (unitOfInvertible (2 : ℚ_[2])))
            (kummerClass (Units.mk0 (5 : ℚ_[2]) (by norm_num))) +
          cup11 (kummerClass (-1 : ℚ_[2]ˣ)) (kummerClass (-1 : ℚ_[2]ˣ)) :=
  sorry

end Cohomology

section FormTheoryChecks

variable {K : Type u} [Field K]


/-! ## Consumed-interface checks

These confirm that the API this roadmap consumes says what the statements above assume.
They are not milestones. -/

/-- Consumed from Mathlib: `ℍ[ℝ]` is a division ring, which is the archimedean instance
`(−1,−1)_ℝ = −1` of the split-or-division dichotomy. -/
example (x : ℍ[ℝ]) (hx : x ≠ 0) : IsUnit x := hx.isUnit

/-- Consumed from Mathlib: the trace form of a finite separable extension is
nondegenerate, which is what makes the trace a legitimate default functional in
Layer 9. -/
example {L : Type v} [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L] :
    (Algebra.traceForm K L).Nondegenerate :=
  traceForm_nondegenerate K L

end FormTheoryChecks

end TauCetiRoadmap.QuadraticFormInvariants
