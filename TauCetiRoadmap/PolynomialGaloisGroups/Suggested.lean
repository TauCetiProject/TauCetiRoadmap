import Mathlib
import TauCeti.GroupTheory.Solvable
import TauCeti.FieldTheory.GaloisGroups.Resolvent.Quintic.Basic

/-!
# Radical solvability for Galois groups of polynomials: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`. The roadmap continues the
completed Polynomial Galois Groups roadmap, whose results are Tau Ceti declarations at the pin and
are not restated here.

Every headline theorem of the roadmap is statable at the pins; none is omitted for want of a
carrier.
-/

namespace TauCetiRoadmap.PolynomialGaloisGroups

open Polynomial

/-! ## Layer 1: the radical criterion for finite Galois extensions -/

-- The one-step group lemma of the Layer 1 induction: a nontrivial finite solvable group has a
-- normal subgroup of prime index.
#check @Group.IsSolvable.exists_normal_index_prime

/-- **The radical criterion for finite Galois extensions** (Milne, *Fields and Galois Theory*,
Theorem 5.34). In characteristic zero, a finite Galois extension `E/F` has solvable Galois group
exactly when, under an `F`-embedding `ι` of `E` into an algebraic closure, every element of `E`
lands in the radical closure of `F` there. The radical closure is taken in the algebraic closure,
not in `E`: for the real cyclic cubic subfield `E` of `ℚ(ζ₇)`, `solvableByRad ℚ E = ℚ`. -/
theorem finiteGalois_iff_image_mem_solvableByRad
    (F E : Type*) [Field F] [CharZero F] [Field E] [Algebra F E]
    [FiniteDimensional F E] [IsGalois F E]
    (ι : E →ₐ[F] AlgebraicClosure F) :
    Group.IsSolvable (E ≃ₐ[F] E) ↔
      ∀ x : E, ι x ∈ solvableByRad F (AlgebraicClosure F) := by
  sorry

/-! ## Layer 2: the radical criterion for polynomials -/

/-- **The radical criterion for polynomials** (Milne, Theorem 5.34). In characteristic zero, a
polynomial has solvable Galois group exactly when **every** one of its roots in an algebraic
closure lies in the radical closure of the base field. Reducible polynomials are included; for
them one radical root does not suffice, as `(X⁵ − 4X + 2)(X − 1)` over `ℚ` shows. -/
theorem isSolvable_gal_iff_forall_rootSet_mem_solvableByRad
    (F : Type*) [Field F] [CharZero F] (q : F[X]) :
    Group.IsSolvable q.Gal ↔
      ∀ x ∈ q.rootSet (AlgebraicClosure F), x ∈ solvableByRad F (AlgebraicClosure F) := by
  sorry

/-! ## Layer 3: Dummit's quintic criterion -/

/-- **Separation of the quintic resolvent** (Chapman's note to Dummit). For a monic irreducible
quintic over a field in which `5 ≠ 0`, Dummit's `F₂₀` resolvent sextic is separable. Both
hypotheses are needed: `X⁵ − X` over `ℚ` is reducible with sextic `(X − 2)⁴ (X² + 16)`, and
`X⁵ − X − 1` over `𝔽₅` is irreducible with an inseparable sextic. -/
theorem separable_specialize_quinticF20Spec {F : Type*} [Field F] {f : F[X]}
    (hf : f.Monic) (hirr : Irreducible f) (hdeg : f.natDegree = 5) (h5 : (5 : F) ≠ 0) :
    (TauCeti.quinticF20Spec.specialize F f).Separable := by
  sorry

/-- **Dummit's criterion, group form** (Dummit, *Solving solvable quintics*, Theorem 1). For a
monic irreducible quintic over a field in which `5 ≠ 0`, the Galois group is solvable exactly when
the `F₂₀` resolvent sextic has a root in the base field. No separability hypothesis on the sextic
is made. -/
theorem isSolvable_gal_iff_exists_isRoot_quinticF20Spec {F : Type*} [Field F] {f : F[X]}
    (hf : f.Monic) (hirr : Irreducible f) (hdeg : f.natDegree = 5) (h5 : (5 : F) ≠ 0) :
    Group.IsSolvable f.Gal ↔ ∃ a : F, (TauCeti.quinticF20Spec.specialize F f).IsRoot a := by
  sorry

/-- **Dummit's criterion, radical form** (Dummit, Theorem 1). In characteristic zero, a monic
irreducible quintic is solvable by radicals, that is, all its roots in an algebraic closure lie in
the radical closure, exactly when its `F₂₀` resolvent sextic has a root in the base field. For
`X⁵ − 2` the sextic `X⁶ − 50000X` has the root `0`; for `X⁵ − X − 1` it has no rational root. -/
theorem forall_rootSet_mem_solvableByRad_iff_exists_isRoot_quinticF20Spec {F : Type*} [Field F]
    [CharZero F] {f : F[X]} (hf : f.Monic) (hirr : Irreducible f) (hdeg : f.natDegree = 5) :
    (∀ x ∈ f.rootSet (AlgebraicClosure F), x ∈ solvableByRad F (AlgebraicClosure F)) ↔
      ∃ a : F, (TauCeti.quinticF20Spec.specialize F f).IsRoot a := by
  sorry

end TauCetiRoadmap.PolynomialGaloisGroups
