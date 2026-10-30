import Mathlib
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Quintic.Basic
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Trivial

/-!
# Galois groups of polynomials, part III: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, and the one definition they
need, `TransitiveSubgroupClass`.

Headline theorems that are not statable at the pins:

* the labelled classification through degree eleven (README 1.3): every transitive subgroup of
  `Equiv.Perm (Fin n)`, `1 ≤ n ≤ 11`, has exactly one label `j` with
  `TauCeti.TransitiveGroupLabel j`, where `TauCeti.referenceSubgroup n j` is the TransGrp row, and
  the `6T6` comparison with the row of index 5. The missing carrier is the extended reference
  family: at the pinned Tau Ceti `TauCeti.numTransitiveGroups n = 0` for `n > 5`, so
  `TauCeti.TransitiveGroupIndex n` is empty there;
* the unique Galois label of a separable irreducible polynomial of degree at most eleven (README
  2.1), for the same reason.

The class count `card_transitiveSubgroupClass` is the part of the classification that the native
carriers express.
-/

namespace TauCetiRoadmap.PolynomialGaloisGroupsPartIII

open Polynomial

/-! ## Layer 1: transitive subgroups of `Sₙ` in degrees six to eleven -/

open scoped Pointwise in
/-- The conjugacy classes of transitive subgroups of `Sₙ`: the orbits of `Equiv.Perm (Fin n)`,
acting on its subgroups by conjugation, that contain a subgroup acting transitively on
`Fin n`. -/
def TransitiveSubgroupClass (n : ℕ) : Type :=
  {c : MulAction.orbitRel.Quotient (ConjAct (Equiv.Perm (Fin n)))
      (Subgroup (Equiv.Perm (Fin n))) //
    ∃ H : Subgroup (Equiv.Perm (Fin n)), Quotient.mk _ H = c ∧ MulAction.IsPretransitive H (Fin n)}

/-- **The transitive subgroups of `Sₙ` through degree eleven** (Butler–McKay; the counts are
Table 2 of Conway–Hulpke–McKay). For `n = 1, …, 11` the transitive subgroups of
`Equiv.Perm (Fin n)` fall into `1, 1, 2, 5, 5, 16, 7, 50, 34, 45, 8` conjugacy classes. -/
theorem card_transitiveSubgroupClass :
    (List.range 11).map (fun k ↦ Nat.card (TransitiveSubgroupClass (k + 1))) =
      [1, 1, 2, 5, 5, 16, 7, 50, 34, 45, 8] := by
  sorry

/-! ## Layer 3: radicals in characteristic zero -/

/-- **The radical criterion for finite Galois extensions** (Milne, *Fields and Galois Theory*,
Theorem 5.34). In characteristic zero, a finite Galois extension `E/F` has solvable Galois group
exactly when, under an `F`-embedding `ι` of `E` into an algebraic closure, every element of `E`
lands in the radical closure of `F` there. The radical closure is taken in the algebraic closure,
not in `E`. -/
theorem isSolvable_iff_forall_mem_solvableByRad
    (F E : Type*) [Field F] [CharZero F] [Field E] [Algebra F E]
    [FiniteDimensional F E] [IsGalois F E] (ι : E →ₐ[F] AlgebraicClosure F) :
    Group.IsSolvable (E ≃ₐ[F] E) ↔ ∀ x : E, ι x ∈ solvableByRad F (AlgebraicClosure F) := by
  sorry

/-- **The radical criterion for polynomials.** In characteristic zero, a polynomial has solvable
Galois group exactly when **every** one of its roots in an algebraic closure lies in the radical
closure of the base field. Reducible polynomials are included; for them one radical root does not
suffice, as `(X⁵ − 4X + 2)(X − 1)` over `ℚ` shows. -/
theorem isSolvable_gal_iff_forall_rootSet_mem_solvableByRad
    (F : Type*) [Field F] [CharZero F] (q : F[X]) :
    Group.IsSolvable q.Gal ↔
      ∀ x ∈ q.rootSet (AlgebraicClosure F), x ∈ solvableByRad F (AlgebraicClosure F) := by
  sorry

/-- **Separation of the quintic `F₂₀` resolvent** (Chapman's note on Dummit's *Solving solvable
quintics*). Over a field in which `5 ≠ 0`, the resolvent sextic of a monic separable irreducible
quintic has six distinct roots: a coincidence among the values of Dummit's invariant on the six
cosets of `F₂₀` in `S₅` would propagate along a `5`-cycle of the Galois group and force a root of
the quintic into the base field. Over `𝔽₅` the Artin–Schreier quintic `X⁵ − X − 1` shows that
the hypothesis `5 ≠ 0` is needed. -/
theorem separable_specialize_quinticF20Spec
    {F : Type*} [Field F] [NeZero (5 : F)] {f : F[X]} (hf : f.Monic) (hsep : f.Separable)
    (hirr : Irreducible f) (hdeg : f.natDegree = 5) :
    (TauCeti.quinticF20Spec.specialize F f).Separable := by
  sorry

/-- **Dummit's criterion for quintics, group form** (Dummit, *Solving solvable quintics*,
Theorem 1, with Chapman's separation argument). Over a field in which `5 ≠ 0`, a monic separable
irreducible quintic has solvable Galois group exactly when its `F₂₀` resolvent sextic has a root
in the base field. No separation hypothesis on the sextic is needed. -/
theorem isSolvable_gal_iff_exists_isRoot_quinticF20
    {F : Type*} [Field F] [NeZero (5 : F)] {f : F[X]} (hf : f.Monic) (hsep : f.Separable)
    (hirr : Irreducible f) (hdeg : f.natDegree = 5) :
    Group.IsSolvable f.Gal ↔ ∃ a : F, (TauCeti.quinticF20Spec.specialize F f).IsRoot a := by
  sorry

/-- **Dummit's criterion for quintics** (Dummit, *Solving solvable quintics*, Theorem 1, with
Chapman's separation argument). In characteristic zero, the roots of a monic irreducible quintic
are expressible by radicals exactly when its `F₂₀` resolvent sextic has a root in the base field.
No separation hypothesis on the sextic is needed. -/
theorem forall_rootSet_mem_solvableByRad_iff_exists_isRoot_quinticF20
    {F : Type*} [Field F] [CharZero F] {f : F[X]} (hf : f.Monic) (hirr : Irreducible f)
    (hdeg : f.natDegree = 5) :
    (∀ x ∈ f.rootSet (AlgebraicClosure F), x ∈ solvableByRad F (AlgebraicClosure F)) ↔
      ∃ a : F, (TauCeti.quinticF20Spec.specialize F f).IsRoot a := by
  sorry

/-! ## Layer 4: arithmetic equivalence -/

/-- **Gassmann's theorem** (Perlis, Theorem 1, sufficient direction). If two subgroups of the
Galois group of a Galois number field `E/ℚ` meet every conjugacy class in the same number of
elements, their fixed fields have the same number of ideals of each norm, hence the same Dedekind
zeta function. -/
theorem dedekindZetaCoeff_fixedField_eq_of_almostConjugate
    {E : Type*} [Field E] [NumberField E] [IsGalois ℚ E] (H K : Subgroup (E ≃ₐ[ℚ] E))
    (hHK : ∀ C : ConjClasses (E ≃ₐ[ℚ] E),
      Nat.card {g : E ≃ₐ[ℚ] E // g ∈ C.carrier ∧ g ∈ H} =
        Nat.card {g : E ≃ₐ[ℚ] E // g ∈ C.carrier ∧ g ∈ K}) (n : ℕ) :
    TauCeti.dedekindZetaCoeff (IntermediateField.fixedField H) n =
      TauCeti.dedekindZetaCoeff (IntermediateField.fixedField K) n := by
  sorry

/-- **Isomorphic fixed fields and conjugate subgroups.** For a finite Galois extension `E/F` and
subgroups `H, K` of its Galois group, the fixed fields of `H` and `K` are isomorphic as
`F`-algebras exactly when `H` and `K` are conjugate, `K = g H g⁻¹` for some `g`: an isomorphism
extends to an automorphism of `E` by normality, which carries `fixedField H` onto the fixed field
of the conjugate subgroup, and the Galois correspondence is injective. -/
theorem nonempty_fixedField_algEquiv_iff_exists_map_conj_eq
    {F E : Type*} [Field F] [Field E] [Algebra F E] [FiniteDimensional F E] [IsGalois F E]
    (H K : Subgroup (E ≃ₐ[F] E)) :
    Nonempty (IntermediateField.fixedField H ≃ₐ[F] IntermediateField.fixedField K) ↔
      ∃ g : E ≃ₐ[F] E, H.map (MulAut.conj g).toMonoidHom = K := by
  sorry

/-- **Nonisomorphic number fields with the same zeta function** (Gassmann). There are two number
fields with the same number of ideals of each norm that are not isomorphic. -/
theorem exists_dedekindZetaCoeff_eq_not_isomorphic :
    ∃ (K L : Type) (_ : Field K) (_ : Field L) (_ : NumberField K) (_ : NumberField L),
      (∀ n : ℕ, TauCeti.dedekindZetaCoeff K n = TauCeti.dedekindZetaCoeff L n) ∧
        IsEmpty (K ≃+* L) := by
  sorry

end TauCetiRoadmap.PolynomialGaloisGroupsPartIII
