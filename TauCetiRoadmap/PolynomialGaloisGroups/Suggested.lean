import Mathlib
import TauCeti.GroupTheory.Solvable
import TauCeti.GroupTheory.Perm.Imprimitivity
import TauCeti.GroupTheory.Perm.WreathProduct.Primitive
import TauCeti.GroupTheory.Perm.Jordan
import TauCeti.FieldTheory.IntermediateField.Adjoin.Embeddings
import TauCeti.FieldTheory.GaloisGroups.Blocks
import TauCeti.FieldTheory.GaloisGroups.Discriminant.Basic
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Quintic.Solvable
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Tschirnhaus
import TauCeti.FieldTheory.GaloisGroups.Reduction
import TauCeti.FieldTheory.GaloisGroups.Label
import TauCeti.FieldTheory.GaloisGroups.Certificate.Check
import TauCeti.FieldTheory.GaloisGroups.Symmetric.Realization

/-!
# Galois groups of polynomials: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti.

Every carrier of Layers 0 to 9 exists at the pinned Tau Ceti, under the names the README gives
them: `TauCeti.fullCycleType` (as `Equiv.Perm.fullCycleType`), `TauCeti.WreathProduct`,
`TauCeti.referenceSubgroup`, `TauCeti.TransitiveGroupLabel`, `TauCeti.HasGaloisLabel`,
`TauCeti.ResolventSpec` with `TauCeti.quinticF20Spec`, `Polynomial.tschirnhausPolynomial`,
`Polynomial.TschirnhausAdmissible`, `Polynomial.factorDegrees`, `TauCeti.QuinticCertificate`, and
`Polynomial.HasFullSymmetricGaloisGroup`. The headline theorems of those layers are stated on them
and closed by the Tau Ceti proofs, so that the statements are checked against the pins by the
build. The headline theorems of Layer 10 are stated with `sorry`.

Every headline theorem of the roadmap is statable at the pins; none is omitted for want of a
carrier.
-/

namespace TauCetiRoadmap.PolynomialGaloisGroups

open Polynomial MulAction

/-! ## Layer 1: permutation groups, blocks, and wreath products -/

/-- **The imprimitivity embedding** (Dixon–Mortimer, Theorem 2.6A). A faithful transitive action
with a nonempty block `B` embeds the group in `Sym(B) ≀ Sym(orbit G B)`, compatibly with the
grid `α ≃ orbit G B × B`. Faithfulness is necessary: `C₃ × C₄` acting on four points through
the regular action of `C₄`, with the block `{0, 2}`, has order 12, while `Sym(B) ≀ S₂` has
order 8. -/
theorem toWreathProduct_injective {G α : Type*} [Group G] [MulAction G α]
    [IsPretransitive G α] [FaithfulSMul G α] {B : Set α} (hB : IsBlock G B)
    (hBne : B.Nonempty) :
    Function.Injective (hB.toWreathProduct hBne) :=
  hB.toWreathProduct_injective_iff hBne |>.mpr inferInstance

/-- **Primitivity of the product action** (Dixon–Mortimer, §2.7). If `D` acts faithfully,
primitively and not freely on a nontrivial `Λ`, and `ι` is finite, then `D ≀ Sym(ι)` acts
primitively on `ι → Λ`. Faithfulness is necessary: `C₂ × C₃` acting on `C₃` through the
translations of `C₃` is primitive and not free, and for `ι = Fin 2` the cosets of the diagonal
of `C₃²` form a nontrivial block system. -/
theorem isPreprimitive_productAction {D ι Λ : Type*} [Group D] [MulAction D Λ] [Finite ι]
    [Nontrivial Λ] [FaithfulSMul D Λ] [IsPreprimitive D Λ] (hnotFree : ¬ IsCancelSMul D Λ) :
    IsPreprimitive (TauCeti.WreathProduct D ι) (ι → Λ) :=
  TauCeti.WreathProduct.isPreprimitive_product hnotFree

/-- **Jordan's theorem for a prime cycle** (Wielandt, Theorem 13.9). A primitive group of
permutations of `α` containing a cycle of prime length `p` with `p + 3 ≤ |α|` contains the
alternating group. -/
theorem alternatingGroup_le_of_isPreprimitive_of_isCycle_mem {α : Type*} [Fintype α]
    [DecidableEq α] {G : Subgroup (Equiv.Perm α)} (hG : IsPreprimitive G α) {p : ℕ}
    (hp : p.Prime) (hp' : p + 3 ≤ Nat.card α) {g : Equiv.Perm α} (hgc : g.IsCycle)
    (hgp : g.support.card = p) (hg : g ∈ G) :
    alternatingGroup α ≤ G :=
  TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem hG hp hp' hgc hgp hg

/-! ## Layer 2: the dictionary between Galois theory and permutations -/

/-- **Primitivity is the absence of intermediate fields.** For `p` irreducible and separable of
degree at least two and a root `x`, the Galois action on the roots is primitive exactly when
`F(x)/F` has no intermediate field other than its two ends. -/
theorem isPreprimitive_iff_isAtom_adjoin_root {F : Type*} [Field F] {p : F[X]}
    (hp : Irreducible p) (hsep : p.Separable) (hdeg : 1 < p.natDegree)
    (x : p.rootSet p.SplittingField) :
    IsPreprimitive p.Gal (p.rootSet p.SplittingField) ↔
      IsAtom (IntermediateField.adjoin F {(x : p.SplittingField)}) :=
  TauCeti.isPreprimitive_iff_isAtom_adjoin_simple hp hsep hdeg x

/-! ## Layer 3: the discriminant and the alternating group -/

open scoped Classical in
/-- **The discriminant test.** Away from characteristic two, a monic separable polynomial has
square discriminant exactly when its Galois image consists of even permutations of the roots. -/
theorem isSquare_discr_iff_range_le_alternatingGroup {F E : Type*} [Field F] [Field E]
    [Algebra F E] {f : F[X]} [Fact ((f.map (algebraMap F E)).Splits)] [IsGalois F E]
    (hf : f.Monic) (hsep : f.Separable) (hchar : ringChar F ≠ 2) :
    IsSquare f.discr ↔ (Gal.galActionHom f E).range ≤ alternatingGroup (f.rootSet E) :=
  hf.isSquare_discr_iff_range_le_alternatingGroup hsep hchar

/-! ## Layer 4: resolvents -/

/-- **The quintic solvability criterion** (Dummit, Theorem 1, with the separation hypothesis made
explicit). A monic irreducible separable quintic whose `F₂₀` resolvent sextic is separable has a
solvable Galois group exactly when that sextic has a root in the base field. -/
theorem isSolvable_gal_iff_exists_isRoot_resolventSextic {F : Type*} [Field F] {f : F[X]}
    (hf : f.Monic) (hsep : f.Separable) (hirr : Irreducible f) (hdeg : f.natDegree = 5)
    (hres : (TauCeti.quinticF20Spec.specialize F f).Separable) :
    Group.IsSolvable f.Gal ↔ ∃ a : F, (TauCeti.quinticF20Spec.specialize F f).IsRoot a :=
  TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec hf hsep hirr hdeg hres

/-- **Tschirnhaus transport of a resolvent bound.** If `T` separates the roots of a monic
separable `f` of degree `n` and the resolvent of the transform `f.tschirnhausPolynomial T` is
separable with a root in the base field, then the Galois image of `f`, numbered by `e`, lies in a
conjugate of the specification's subgroup, although the resolvent of `f` itself may be
inseparable. -/
theorem exists_le_map_conj_of_isRoot_tschirnhaus {F E : Type*} [Field F] [Field E]
    [Algebra F E] {f T : F[X]} {n : ℕ} [Fact ((f.map (algebraMap F E)).Splits)] [Normal F E]
    (spec : TauCeti.ResolventSpec n) (hf : f.Monic) (hsep : f.Separable)
    (hdeg : f.natDegree = n) (hT : f.TschirnhausAdmissible T) (e : f.rootSet E ≃ Fin n)
    (hres : (spec.specialize F (f.tschirnhausPolynomial T)).Separable) {a : F}
    (ha : (spec.specialize F (f.tschirnhausPolynomial T)).IsRoot a) :
    ∃ τ : Equiv.Perm (Fin n),
      (Gal.galActionHom f E).range.map (e.permCongrHom : _ →* Equiv.Perm (Fin n)) ≤
        spec.H.map (MulAut.conj τ).toMonoidHom :=
  spec.exists_le_map_conj_of_isRoot_specialize_tschirnhausPolynomial hf hsep hdeg hT e hres ha

/-! ## Layer 5: Frobenius specialization -/

section Frobenius

attribute [local instance] Polynomial.Gal.splits_ℚ_ℂ

/-- **The membership statement.** For monic `f : ℤ[X]` and a prime `p` not dividing `disc f`,
the factor degrees of `f mod p`, with their parts equal to one, are the full cycle type of an
element of the Galois image of `f` over `ℚ`. The input is Dedekind's factorization theorem,
`TauCeti.NumberField.exists_gal_fullCycleType_eq_factorizationType`. -/
theorem factorDegrees_mem_fullCycleType_galImage {f : ℤ[X]} (hf : f.Monic) (p : ℕ)
    [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ f.discr) :
    ∃ σ ∈ (Gal.galActionHom (f.map (Int.castRingHom ℚ)) ℂ).range,
      σ.fullCycleType = f.factorDegrees p :=
  TauCeti.exists_mem_range_galActionHom_fullCycleType_eq_factorDegrees hf p hp

end Frobenius

/-! ## Layer 6: transitive subgroups of `Sₙ` for `n ≤ 5`, and the labels -/

/-- **Every irreducible separable polynomial of degree at most five has exactly one label.**
The degree is at least one because `f` is irreducible; in degree zero there is no label, since
`TauCeti.TransitiveGroupIndex 0` is empty. -/
theorem existsUnique_hasGaloisLabel_of_natDegree_le_five {F : Type*} [Field F] {f : F[X]}
    (hsep : f.Separable) (hirr : Irreducible f) (hdeg : f.natDegree ≤ 5) :
    ∃! j : TauCeti.TransitiveGroupIndex f.natDegree, TauCeti.HasGaloisLabel f j := by
  sorry

/-- **Soundness of the degree-five certificate.** A certificate that checks proves the label it
claims for the quintic over `ℚ`. Nothing is claimed in the other direction. -/
theorem quinticCertificate_check_sound {f : ℤ[X]} (hf : f.Monic)
    (cert : TauCeti.QuinticCertificate) (h : cert.check f = true) :
    TauCeti.HasGaloisLabel (f.map (Int.castRingHom ℚ)) cert.label :=
  TauCeti.QuinticCertificate.check_sound hf h

/-! ## Layer 9: `Sₙ` as a Galois group over `ℚ` -/

/-- **`Sₙ` is a Galois group over `ℚ`** (the three-prime construction). For every `n ≥ 1` there
is a monic integral polynomial of degree `n`, irreducible over `ℚ`, whose Galois group acts on its
`n` distinct roots as the full symmetric group. -/
theorem exists_monic_int_polynomial_hasFullSymmetricGaloisGroup (n : ℕ) (hn : 1 ≤ n) :
    ∃ f : ℤ[X], f.Monic ∧ f.natDegree = n ∧ Irreducible (f.map (Int.castRingHom ℚ)) ∧
      Polynomial.HasFullSymmetricGaloisGroup (f.map (Int.castRingHom ℚ)) :=
  TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup n hn

/-! ## Layer 10: finite Galois extensions and radicals -/

-- The one-step group lemma of the Layer 10 route: a nontrivial finite solvable group has a
-- normal subgroup of prime index.
#check @Group.IsSolvable.exists_normal_index_prime

-- The root–embedding equivalence of a simple extension, consumed by the base-field transport of
-- Layer 0.
#check @TauCeti.rootSetEquivAlgHomAdjoin

namespace RadicalConverse

/-- **The radical criterion for finite Galois extensions** (Milne, *Fields and Galois Theory*,
Theorem 5.34). In characteristic zero, a finite Galois extension `E/F` has solvable Galois group
exactly when, under an `F`-embedding `ι` of `E` into an algebraic closure, every element of `E`
lands in the radical closure of `F` there. The radical closure is taken in the algebraic closure,
not in `E`: adjoining roots of unity can leave `E`. -/
theorem finiteGalois_iff_image_mem_solvableByRad
    (F E : Type*) [Field F] [CharZero F] [Field E] [Algebra F E]
    [FiniteDimensional F E] [IsGalois F E]
    (ι : E →ₐ[F] AlgebraicClosure F) :
    Group.IsSolvable (E ≃ₐ[F] E) ↔
      ∀ x : E, ι x ∈ solvableByRad F (AlgebraicClosure F) := by
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

end RadicalConverse

end TauCetiRoadmap.PolynomialGaloisGroups
