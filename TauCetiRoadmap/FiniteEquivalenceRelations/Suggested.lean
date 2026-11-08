module

public import Mathlib
public import TauCeti.RingTheory.Invariant.EquivalenceRelation.Basic

/-!
# Finite equivalence relations: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the definitions their statements need. The Checks stay in the README.

A closed subscheme `R ⊆ X ×_k X` of an affine `X = Spec A` is given by its ideal
`I ⊆ A ⊗[k] A`; the two projections `R ⇉ X` are `Spec` of `specFst` and `specSnd`, and
equivalence relations and their effectivity are Mathlib's `CategoryTheory.IsEquivalenceRelation`
and `CategoryTheory.IsEffectiveEquivalenceRelation` in the category `AlgebraicGeometry.Scheme`.

Headline theorems stated here:

* README 0.2, `IsEquivIdeal.map_quotient`: an equivalence relation restricts to an equivalence
  relation on every closed subscheme.
* README 0.3, `isEquivalenceRelation_iff`: the ideal conditions are exactly Mathlib's internal
  equivalence relations in `Scheme`; `isEquivIdeal_iff_isSpecEquivRel`: they are exactly Tau Ceti's
  `RingHom.IsSpecEquivRel` for the two projections.
* README 1.2, `isColimit_cofork`: for `A` finite over a field, `Spec A^R` is the coequalizer of
  `R ⇉ X` in `Scheme`.
* README 1.3, `isEffectiveEquivalenceRelation_iff` and
  `isEffectiveEquivalenceRelation_iff_finrank`: effectivity is `I = J_B`, and, over a field, the
  equality of two dimensions.
* README 2.1, `isEffectiveEquivalenceRelation_of_flat`: a relation with a flat projection is
  effective, and `A` is flat over its invariants.
* README 3.1, `raicuIdeal_isEquivIdeal`, `raicuIdeal_finite` and `differenceIdeal_raicuIdeal_ne`:
  Raicu's finite equivalence relation on `𝔸²_k` is not given by its invariants.
* README 3.2, `not_isEffectiveEquivalenceRelation_raicuArtin`: over every field, a closed
  equivalence relation on a finite local `k`-scheme that is not effective.
* README 3.3, `raicuCocycle_not_mem_differenceIdeal`: over `𝔽₃`, the class of Raicu's cocycle is
  the obstruction.
* README 3.4, `eq_differenceIdeal_of_isToric`: toric equivalence relations on affine toric
  varieties are effective.
* README 3.5, `venkenRelation_isEquivIdeal` and `not_isEffectiveEquivalenceRelation_venken`:
  over every field, Venken's closed equivalence relation on the spectrum of a local artinian
  algebra of dimension `33` is not effective.
* README 4.1, `bijOn_baseChange` and `isAmitsurEqualizer_iff_bijOn`: under the Amitsur condition
  for `N`, and only then, morphisms of descent data into `B ⊗[A] N` descend uniquely.
* README 4.2, `forall_isAmitsurEqualizer_iff`, `full_faithful_comparison_iff` and
  `nonempty_comonadicLeftAdjoint_iff`: the Amitsur condition for every module, descent and
  effective descent of modules are each equivalent to purity of `A → B` (Joyal–Tierney).
* README 4.3, `isAmitsurEqualizer_invariants` and `nonempty_comonadicLeftAdjoint_invariants`: the
  quotient map `A^R → A` satisfies the Amitsur condition for `A^R`, and in the flat case
  extension of scalars along it is comonadic.
* README 4.4, `universally_effectiveEpi_iff`: `Spec B → Spec A` is a universal effective
  epimorphism of affine schemes iff `A → B` is pure.
-/

public section

namespace TauCetiRoadmap.FiniteEquivalenceRelations

open TensorProduct AlgebraicGeometry CategoryTheory CategoryTheory.Limits

universe u

section Relations

variable (k : Type u) [CommRing k] (A : Type u) [CommRing A] [Algebra k A]

/-! ## Layer 0: equivalence relations as ideals -/

/-- `a ⊗ b ↦ a ⊗ (b ⊗ 1)`, the first two factors of `X ×_k X ×_k X`. -/
noncomputable def incl₁₂ : A ⊗[k] A →ₐ[k] A ⊗[k] (A ⊗[k] A) :=
  Algebra.TensorProduct.map (AlgHom.id k A) Algebra.TensorProduct.includeLeft

/-- `a ⊗ b ↦ 1 ⊗ (a ⊗ b)`, the last two factors of `X ×_k X ×_k X`. -/
noncomputable def incl₂₃ : A ⊗[k] A →ₐ[k] A ⊗[k] (A ⊗[k] A) :=
  Algebra.TensorProduct.includeRight

/-- `a ⊗ b ↦ a ⊗ (1 ⊗ b)`, the outer factors of `X ×_k X ×_k X`. -/
noncomputable def incl₁₃ : A ⊗[k] A →ₐ[k] A ⊗[k] (A ⊗[k] A) :=
  Algebra.TensorProduct.map (AlgHom.id k A) Algebra.TensorProduct.includeRight

/-- The ideal `I ⊆ A ⊗[k] A` of a closed subscheme `R ⊆ X ×_k X` defines an equivalence
relation: it lies in the ideal of the diagonal, it is stable under the swap of the factors, and
the outer projection sends `R ×_X R` into `R` (Kollár 2012, ¶50, conditions (1)–(3)). -/
structure IsEquivIdeal (I : Ideal (A ⊗[k] A)) : Prop where
  /-- Reflexivity: the diagonal `X → X ×_k X` factors through `R`. -/
  le_ker_mul : I ≤ RingHom.ker (Algebra.TensorProduct.lmul' k : A ⊗[k] A →ₐ[k] A)
  /-- Symmetry: `R` is stable under the swap of the two factors. -/
  map_comm : I.map (Algebra.TensorProduct.comm k A A) = I
  /-- Transitivity: `R ×_X R → X ×_k X`, the outer projection, factors through `R`. -/
  map_incl₁₃_le : I.map (incl₁₃ k A) ≤ I.map (incl₁₂ k A) ⊔ I.map (incl₂₃ k A)

/-- The first projection `R → X`, on rings: `a ↦ a ⊗ 1` modulo `I`. -/
noncomputable def relFst (I : Ideal (A ⊗[k] A)) : A →ₐ[k] (A ⊗[k] A) ⧸ I :=
  (Ideal.Quotient.mkₐ k I).comp Algebra.TensorProduct.includeLeft

/-- The second projection `R → X`, on rings: `a ↦ 1 ⊗ a` modulo `I`. -/
noncomputable def relSnd (I : Ideal (A ⊗[k] A)) : A →ₐ[k] (A ⊗[k] A) ⧸ I :=
  (Ideal.Quotient.mkₐ k I).comp Algebra.TensorProduct.includeRight

/-- The first projection `R ⟶ X` in `Scheme`. -/
noncomputable def specFst (I : Ideal (A ⊗[k] A)) :
    Spec (CommRingCat.of ((A ⊗[k] A) ⧸ I)) ⟶ Spec (CommRingCat.of A) :=
  Spec.map (CommRingCat.ofHom (relFst k A I).toRingHom)

/-- The second projection `R ⟶ X` in `Scheme`. -/
noncomputable def specSnd (I : Ideal (A ⊗[k] A)) :
    Spec (CommRingCat.of ((A ⊗[k] A) ⧸ I)) ⟶ Spec (CommRingCat.of A) :=
  Spec.map (CommRingCat.ofHom (relSnd k A I).toRingHom)

/-- Restriction to a closed subscheme `Z = Spec (A ⧸ 𝔞)`: the ideal of `R ∩ (Z ×_k Z)` defines an
equivalence relation on `Z` (Raicu 2010, §2.1; Kollár 2012, ¶50). -/
theorem IsEquivIdeal.map_quotient {I : Ideal (A ⊗[k] A)} (hI : IsEquivIdeal k A I)
    (𝔞 : Ideal A) :
    IsEquivIdeal k (A ⧸ 𝔞)
      (I.map (Algebra.TensorProduct.map (Ideal.Quotient.mkₐ k 𝔞) (Ideal.Quotient.mkₐ k 𝔞))) := by
  sorry

/-- The ideal conditions are Mathlib's internal equivalence relations in `Scheme` (Stacks,
Definition 39.3.1, Tag 022P; Raicu 2010, §2.1). -/
theorem isEquivalenceRelation_iff (I : Ideal (A ⊗[k] A)) :
    IsEquivIdeal k A I ↔ IsEquivalenceRelation (specFst k A I) (specSnd k A I) := by
  sorry

/-- The ideal conditions are Tau Ceti's conditions on `T`-points: `Spec ((A ⊗[k] A) ⧸ I) ⇉ Spec A`
is an equivalence relation in the sense of `RingHom.IsSpecEquivRel`. -/
theorem isEquivIdeal_iff_isSpecEquivRel (I : Ideal (A ⊗[k] A)) :
    IsEquivIdeal k A I ↔ (relFst k A I).toRingHom.IsSpecEquivRel (relSnd k A I).toRingHom := by
  sorry

/-! ## Layer 1: the ring of invariants, the quotient and effectivity -/

/-- The ring of invariants `A^R = {a ∈ A | a ⊗ 1 - 1 ⊗ a ∈ I}`, the equalizer of the two
projections (Stacks, Section 39.23, Tag 03BE, equation 39.23.0.1). -/
noncomputable def invariants (I : Ideal (A ⊗[k] A)) : Subalgebra k A :=
  AlgHom.equalizer (relFst k A I) (relSnd k A I)

/-- The ideal of `X ×_Y X` in `X ×_k X`, `Y = Spec A^R`: generated by the `b ⊗ 1 - 1 ⊗ b`,
`b ∈ A^R` (Kollár 2012, ¶50). -/
noncomputable def differenceIdeal (I : Ideal (A ⊗[k] A)) : Ideal (A ⊗[k] A) :=
  Ideal.span {x | ∃ b ∈ invariants k A I, x = b ⊗ₜ[k] (1 : A) - (1 : A) ⊗ₜ[k] b}

/-- The quotient map `X ⟶ Y = Spec A^R`. -/
noncomputable def specQuotientMap (I : Ideal (A ⊗[k] A)) :
    Spec (CommRingCat.of A) ⟶ Spec (CommRingCat.of (invariants k A I)) :=
  Spec.map (CommRingCat.ofHom (algebraMap (invariants k A I) A))

/-- `X ⟶ Spec A^R` equalizes the two projections. -/
theorem specFst_comp_specQuotientMap (I : Ideal (A ⊗[k] A)) :
    specFst k A I ≫ specQuotientMap k A I = specSnd k A I ≫ specQuotientMap k A I := by
  simp only [specFst, specSnd, specQuotientMap, ← Spec.map_comp, ← CommRingCat.ofHom_comp]
  congr 2
  ext b
  exact b.2

end Relations

section Field

variable (k : Type u) [Field k] (A : Type u) [CommRing A] [Algebra k A]

/-- For `A` finite over a field, `Spec A^R` is the coequalizer of `R ⇉ X` in the category of all
schemes (FGA III, §2, p. 212-04; Stacks, Section 39.23, Tag 03BE, for affine schemes). -/
theorem isColimit_cofork [FiniteDimensional k A] (I : Ideal (A ⊗[k] A)) :
    Nonempty (IsColimit (Cofork.ofπ (specQuotientMap k A I)
      (specFst_comp_specQuotientMap k A I))) := by
  sorry

/-- Effectivity is the equality `I = J_B` of the ideal of `R` with the ideal of `X ×_Y X`
(Kollár 2012, ¶50). -/
theorem isEffectiveEquivalenceRelation_iff [FiniteDimensional k A] (I : Ideal (A ⊗[k] A)) :
    IsEffectiveEquivalenceRelation (specFst k A I) (specSnd k A I) ↔
      I = differenceIdeal k A I := by
  sorry

/-- The linear-algebra criterion: effectivity is the equality of the `k`-dimensions of `I` and
of `J_B ⊆ I`, two subspaces of the finite-dimensional `A ⊗[k] A`. -/
theorem isEffectiveEquivalenceRelation_iff_finrank [FiniteDimensional k A]
    (I : Ideal (A ⊗[k] A)) :
    IsEffectiveEquivalenceRelation (specFst k A I) (specSnd k A I) ↔
      Module.finrank k (I.restrictScalars k) =
        Module.finrank k ((differenceIdeal k A I).restrictScalars k) := by
  sorry

/-! ## Layer 2: the flat case -/

/-- A finite equivalence relation whose first projection is flat is effective, and `A` is flat
over `A^R` (SGA 3, Exp. V, Théorème 4.1 (iv); FGA III, Théorème 5.1 (iv); Stacks,
Proposition 39.23.9, Tag 03BM), from Tau Ceti's `RingHom.IsSpecEquivRel.isPullback_SpecMap`,
`RingHom.IsSpecEquivRel.isColimitCofork` and `RingHom.IsSpecEquivRel.flat`. -/
theorem isEffectiveEquivalenceRelation_of_flat [FiniteDimensional k A] {I : Ideal (A ⊗[k] A)}
    (hI : IsEquivIdeal k A I) (hflat : Module.Flat A ((A ⊗[k] A) ⧸ I)) :
    IsEffectiveEquivalenceRelation (specFst k A I) (specSnd k A I) ∧
      Module.Flat (invariants k A I) A := by
  sorry

end Field

/-! ## Layer 3: examples -/

section Raicu

variable (k : Type u) [Field k]

/-- Raicu's cocycle `(x₁y₂ - x₂y₁) y₂³` in `k[x₁, x₂] ⊗[k] k[y₁, y₂]` (Kollár 2012, ¶50). -/
noncomputable def raicuCocycle : MvPolynomial (Fin 2) k ⊗[k] MvPolynomial (Fin 2) k :=
  (MvPolynomial.X 0 ⊗ₜ MvPolynomial.X 1 - MvPolynomial.X 1 ⊗ₜ MvPolynomial.X 0) *
    (1 ⊗ₜ MvPolynomial.X 1) ^ 3

/-- Raicu's ideal on `𝔸²_k × 𝔸²_k`: `(x₁² - y₁², x₁x₂ - x₂² - y₁y₂ + y₂², x₂³ - y₂³)` and the
cocycle (Kollár 2012, ¶50; Raicu 2010, Example 2.1). -/
noncomputable def raicuIdeal : Ideal (MvPolynomial (Fin 2) k ⊗[k] MvPolynomial (Fin 2) k) :=
  Ideal.span
    {(MvPolynomial.X 0 ^ 2) ⊗ₜ 1 - 1 ⊗ₜ (MvPolynomial.X 0 ^ 2),
      (MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.X 1 ^ 2) ⊗ₜ 1 -
        1 ⊗ₜ (MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.X 1 ^ 2),
      (MvPolynomial.X 1 ^ 3) ⊗ₜ 1 - 1 ⊗ₜ (MvPolynomial.X 1 ^ 3),
      raicuCocycle k}

/-- Raicu's ideal defines an equivalence relation on `𝔸²_k` (Kollár 2012, ¶50). -/
theorem raicuIdeal_isEquivIdeal : IsEquivIdeal k (MvPolynomial (Fin 2) k) (raicuIdeal k) := by
  sorry

/-- Raicu's relation is finite: `k[x, y] ⧸ I` is a finite `k[x]`-module (Kollár 2012, ¶50,
condition (4)). -/
theorem raicuIdeal_finite :
    Module.Finite (MvPolynomial (Fin 2) k)
      ((MvPolynomial (Fin 2) k ⊗[k] MvPolynomial (Fin 2) k) ⧸ raicuIdeal k) := by
  sorry

/-- Raicu's relation is not `X ×_Y X` for `Y = Spec` of its invariants, over every field
(Kollár 2012, ¶50; Raicu 2010, Example 2.1). -/
theorem differenceIdeal_raicuIdeal_ne :
    differenceIdeal k (MvPolynomial (Fin 2) k) (raicuIdeal k) ≠ raicuIdeal k := by
  sorry

/-- The ideal `(f₁², f₂², f₃²)` of a finite local subscheme `Z ⊆ 𝔸²_k`, with the invariants
`f₁ = x₁²`, `f₂ = x₁x₂ - x₂²`, `f₃ = x₂³` of Raicu's relation. -/
noncomputable def raicuArtinIdeal : Ideal (MvPolynomial (Fin 2) k) :=
  Ideal.span
    {(MvPolynomial.X 0 ^ 2) ^ 2, (MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.X 1 ^ 2) ^ 2,
      (MvPolynomial.X 1 ^ 3) ^ 2}

/-- The ideal of the restriction `R ∩ (Z ×_k Z)` of Raicu's relation to `Z`. -/
noncomputable def raicuArtinRelation :
    Ideal ((MvPolynomial (Fin 2) k ⧸ raicuArtinIdeal k) ⊗[k]
      (MvPolynomial (Fin 2) k ⧸ raicuArtinIdeal k)) :=
  (raicuIdeal k).map
    (Algebra.TensorProduct.map (Ideal.Quotient.mkₐ k (raicuArtinIdeal k))
      (Ideal.Quotient.mkₐ k (raicuArtinIdeal k)))

/-- Over every field `k`, the restriction of Raicu's relation to the finite local scheme `Z` is
a closed equivalence relation that is not effective. -/
theorem not_isEffectiveEquivalenceRelation_raicuArtin :
    ¬ IsEffectiveEquivalenceRelation
      (specFst k (MvPolynomial (Fin 2) k ⧸ raicuArtinIdeal k) (raicuArtinRelation k))
      (specSnd k (MvPolynomial (Fin 2) k ⧸ raicuArtinIdeal k) (raicuArtinRelation k)) := by
  sorry

end Raicu

/-- Over `𝔽₃`, the image of Raicu's cocycle on `Z × Z` lies in the ideal of the restricted
relation (it is a generator) and not in the ideal of `Z ×_Y Z`. -/
theorem raicuCocycle_not_mem_differenceIdeal :
    Algebra.TensorProduct.map (Ideal.Quotient.mkₐ (ZMod 3) (raicuArtinIdeal (ZMod 3)))
        (Ideal.Quotient.mkₐ (ZMod 3) (raicuArtinIdeal (ZMod 3))) (raicuCocycle (ZMod 3)) ∉
      differenceIdeal (ZMod 3) (MvPolynomial (Fin 2) (ZMod 3) ⧸ raicuArtinIdeal (ZMod 3))
        (raicuArtinRelation (ZMod 3)) := by
  sorry

section Toric

variable (k : Type u) [Field k] (σ : Type u) [AddCommMonoid σ]

/-- The diagonal coaction of the torus of `X = Spec k[σ]` on `X ×_k X`:
`χ^s ⊗ χ^t ↦ (χ^s ⊗ χ^t) ⊗ χ^(s + t)`, built from the comultiplication of `k[σ]`. -/
noncomputable def diagonalCoaction :
    AddMonoidAlgebra k σ ⊗[k] AddMonoidAlgebra k σ →ₐ[k]
      (AddMonoidAlgebra k σ ⊗[k] AddMonoidAlgebra k σ) ⊗[k] AddMonoidAlgebra k σ :=
  (Algebra.TensorProduct.map (AlgHom.id k _) (Algebra.TensorProduct.lmul' k)).comp
    ((Algebra.TensorProduct.tensorTensorTensorComm k k k k (AddMonoidAlgebra k σ)
        (AddMonoidAlgebra k σ) (AddMonoidAlgebra k σ) (AddMonoidAlgebra k σ)).toAlgHom.comp
      (Algebra.TensorProduct.map (Bialgebra.comulAlgHom k (AddMonoidAlgebra k σ))
        (Bialgebra.comulAlgHom k (AddMonoidAlgebra k σ))))

/-- A relation on `Spec k[σ]` is toric when its ideal is stable under the diagonal coaction:
`R` is invariant under the diagonal action of the torus (Raicu 2010, §1, Definition). -/
def IsToric (I : Ideal (AddMonoidAlgebra k σ ⊗[k] AddMonoidAlgebra k σ)) : Prop :=
  I.map (diagonalCoaction k σ) ≤
    I.map (Algebra.TensorProduct.includeLeft : AddMonoidAlgebra k σ ⊗[k] AddMonoidAlgebra k σ →ₐ[k]
      (AddMonoidAlgebra k σ ⊗[k] AddMonoidAlgebra k σ) ⊗[k] AddMonoidAlgebra k σ)

/-- Toric equivalence relations on an affine toric variety are effective: `I = J_B`
(Raicu 2010, Theorem 4.1; Kollár 2012, Theorem 51). -/
theorem eq_differenceIdeal_of_isToric [IsAddFG σ] [IsCancelAdd σ] [IsAddTorsionFree σ]
    {I : Ideal (AddMonoidAlgebra k σ ⊗[k] AddMonoidAlgebra k σ)}
    (hI : IsEquivIdeal k (AddMonoidAlgebra k σ) I) (ht : IsToric k σ I) :
    I = differenceIdeal k (AddMonoidAlgebra k σ) I := by
  sorry

end Toric

section Venken

variable (k : Type u) [Field k]

/-- Venken's ideal of `k[m, n, x, y, z, w]` (the variables `0, …, 5`): `m², mn, n², yz, ny, mz,
nxy, myw` and the monomials of degree `3` in `x, y, z, w` (Venken 1971, Corollaire 3.1). -/
noncomputable def venkenIdeal : Ideal (MvPolynomial (Fin 6) k) :=
  Ideal.span
    ({MvPolynomial.X 0 ^ 2, MvPolynomial.X 0 * MvPolynomial.X 1, MvPolynomial.X 1 ^ 2,
        MvPolynomial.X 3 * MvPolynomial.X 4, MvPolynomial.X 1 * MvPolynomial.X 3,
        MvPolynomial.X 0 * MvPolynomial.X 4,
        MvPolynomial.X 1 * MvPolynomial.X 2 * MvPolynomial.X 3,
        MvPolynomial.X 0 * MvPolynomial.X 3 * MvPolynomial.X 5} ∪
      {p | ∃ i j l : Fin 4, p = MvPolynomial.X (Fin.natAdd 2 i) *
        MvPolynomial.X (Fin.natAdd 2 j) * MvPolynomial.X (Fin.natAdd 2 l)})

/-- Venken's local artinian `k`-algebra `k[m, n, x, y, z, w] ⧸ venkenIdeal k`, of dimension
`33`. -/
abbrev VenkenAlgebra : Type u := MvPolynomial (Fin 6) k ⧸ venkenIdeal k

/-- The class in `VenkenAlgebra k` of the variable `i` (`m, n, x, y, z, w` for `i = 0, …, 5`). -/
noncomputable def venkenVar (i : Fin 6) : VenkenAlgebra k :=
  Ideal.Quotient.mk (venkenIdeal k) (MvPolynomial.X i)

/-- Venken's relation: the ideal of `O(V) ⊗[k] O(V)` generated by the `a ⊗ 1 - 1 ⊗ a` for
`a = m, n, mx, nw, my - nz` and by `mxy ⊗ w`. -/
noncomputable def venkenRelation : Ideal (VenkenAlgebra k ⊗[k] VenkenAlgebra k) :=
  Ideal.span
    ((fun a : VenkenAlgebra k => a ⊗ₜ[k] (1 : VenkenAlgebra k) - 1 ⊗ₜ[k] a) ''
        {venkenVar k 0, venkenVar k 1, venkenVar k 0 * venkenVar k 2,
          venkenVar k 1 * venkenVar k 5,
          venkenVar k 0 * venkenVar k 3 - venkenVar k 1 * venkenVar k 4} ∪
      {(venkenVar k 0 * venkenVar k 2 * venkenVar k 3) ⊗ₜ[k] venkenVar k 5})

/-- Venken's ideal defines a closed equivalence relation on `Spec (VenkenAlgebra k)`
(Venken 1971, Corollaire 3.1). -/
theorem venkenRelation_isEquivIdeal : IsEquivIdeal k (VenkenAlgebra k) (venkenRelation k) := by
  sorry

/-- Over every field `k`, Venken's relation is not effective (Venken 1971, Corollaire 3.1). -/
theorem not_isEffectiveEquivalenceRelation_venken :
    ¬ IsEffectiveEquivalenceRelation (specFst k (VenkenAlgebra k) (venkenRelation k))
      (specSnd k (VenkenAlgebra k) (venkenRelation k)) := by
  sorry

end Venken

/-! ## Layer 4: descent of modules along the quotient map -/

section ModuleDescent

variable (A : Type u) (B : Type u) [CommRing A] [CommRing B] [Algebra A B]
variable (N : Type u) [AddCommGroup N] [Module A N]

/-- The first coface `B ⊗[A] N → (B ⊗[A] B) ⊗[A] N`, `b ⊗ n ↦ (b ⊗ 1) ⊗ n`. -/
noncomputable def coface₁ : B ⊗[A] N →ₗ[A] (B ⊗[A] B) ⊗[A] N :=
  (Algebra.TensorProduct.includeLeft (R := A) (S := A) (A := B) (B := B)).toLinearMap.rTensor N

/-- The second coface `B ⊗[A] N → (B ⊗[A] B) ⊗[A] N`, `b ⊗ n ↦ (1 ⊗ b) ⊗ n`. -/
noncomputable def coface₂ : B ⊗[A] N →ₗ[A] (B ⊗[A] B) ⊗[A] N :=
  (Algebra.TensorProduct.includeRight (R := A) (A := B) (B := B)).toLinearMap.rTensor N

/-- The Amitsur condition for `N`: `N → B ⊗[A] N ⇉ (B ⊗[A] B) ⊗[A] N`, with first map
`n ↦ 1 ⊗ n` and the two cofaces, is an equalizer of `A`-modules (Mesablishvili 2000, p. 39,
the unit of `f^* ⊣ f_*` at `N`; Stacks, Lemma 35.13.2, Tag 0EUA, condition (1) for one
morphism). -/
def IsAmitsurEqualizer : Prop :=
  Function.Injective (TensorProduct.mk A B N 1) ∧
    ∀ x : B ⊗[A] N, coface₁ A B N x = coface₂ A B N x → ∃ n : N, (1 : B) ⊗ₜ n = x

variable {A B N} {M : Type u} [AddCommGroup M] [Module A M]

/-- The base change of a `B`-linear `g : B ⊗[A] M → B ⊗[A] N` along `b ↦ 1 ⊗ b`, written on
`(B ⊗[A] B) ⊗[A] M`. -/
noncomputable def pullRight (g : B ⊗[A] M →ₗ[B] B ⊗[A] N) :
    (B ⊗[A] B) ⊗[A] M →ₗ[A] (B ⊗[A] B) ⊗[A] N :=
  (TensorProduct.assoc A B B N).symm.toLinearMap ∘ₗ (g.restrictScalars A).lTensor B ∘ₗ
    (TensorProduct.assoc A B B M).toLinearMap

/-- The base change of a `B`-linear `g : B ⊗[A] M → B ⊗[A] N` along `b ↦ b ⊗ 1`, written on
`(B ⊗[A] B) ⊗[A] M`. -/
noncomputable def pullLeft (g : B ⊗[A] M →ₗ[B] B ⊗[A] N) :
    (B ⊗[A] B) ⊗[A] M →ₗ[A] (B ⊗[A] B) ⊗[A] N :=
  (TensorProduct.comm A B B).toLinearMap.rTensor N ∘ₗ pullRight g ∘ₗ
    (TensorProduct.comm A B B).toLinearMap.rTensor M

/-- A `B`-linear `g : B ⊗[A] M → B ⊗[A] N` is a morphism of the canonical descent data when its
two base changes to `B ⊗[A] B` agree (Stacks, Definition 35.4.15, Tag 08WY; Mesablishvili 2000,
p. 39). -/
def IsCompatible (g : B ⊗[A] M →ₗ[B] B ⊗[A] N) : Prop :=
  pullLeft g = pullRight g

/-- Under the Amitsur condition for `N`, base change `f ↦ B ⊗ f` is a bijection from
`M →ₗ[A] N` onto the morphisms `B ⊗[A] M → B ⊗[A] N` of canonical descent data, for every
`A`-module `M` (Mesablishvili 2000, Proposition 2, at the module `N`). -/
theorem bijOn_baseChange (hN : IsAmitsurEqualizer A B N) :
    Set.BijOn (fun f : M →ₗ[A] N ↦ f.baseChange B) Set.univ {g | IsCompatible g} := by
  sorry

/-- Conversely, bijectivity for `M = A` alone gives the Amitsur condition for `N`. -/
theorem isAmitsurEqualizer_iff_bijOn :
    IsAmitsurEqualizer A B N ↔
      Set.BijOn (fun f : A →ₗ[A] N ↦ f.baseChange B) Set.univ {g | IsCompatible g} := by
  sorry

variable (A B)

/-- The Amitsur condition holds for every `A`-module iff `A → B` is universally injective
(pure): `P → B ⊗[A] P` is injective for every `A`-module `P` (Stacks, Section 35.4, Tag 08WE,
Lemma 35.4.20 and Theorem 35.4.22, Tag 08XA). -/
theorem forall_isAmitsurEqualizer_iff :
    (∀ (P : Type u) [AddCommGroup P] [Module A P], IsAmitsurEqualizer A B P) ↔
      ∀ (P : Type u) [AddCommGroup P] [Module A P],
        Function.Injective (TensorProduct.mk A B P 1) := by
  sorry

/-- `A → B` is a descent morphism for modules (the comparison functor from `A`-modules to
coalgebras of the comonad `B ⊗[A] -` is fully faithful) iff it is pure (Stacks, Theorem 35.4.22,
Tag 08XA, (a) ⇔ (c); Mesablishvili 2000, Proposition 2). -/
theorem full_faithful_comparison_iff :
    ((Comonad.comparison
        (ModuleCat.extendRestrictScalarsAdj.{u, u, u} (algebraMap A B))).Full ∧
      (Comonad.comparison
        (ModuleCat.extendRestrictScalarsAdj.{u, u, u} (algebraMap A B))).Faithful)
      ↔ ∀ (P : Type u) [AddCommGroup P] [Module A P],
        Function.Injective (TensorProduct.mk A B P 1) := by
  sorry

/-- `A → B` is an effective descent morphism for modules (extension of scalars is comonadic)
iff it is pure: the Joyal–Tierney theorem (Mesablishvili 2000, Theorem 4; Stacks,
Theorem 35.4.22, Tag 08XA, (b) ⇔ (c)). -/
theorem nonempty_comonadicLeftAdjoint_iff :
    Nonempty (ComonadicLeftAdjoint (ModuleCat.extendScalars.{u, u, u} (algebraMap A B))) ↔
      ∀ (P : Type u) [AddCommGroup P] [Module A P],
        Function.Injective (TensorProduct.mk A B P 1) := by
  sorry

/-- `Spec B → Spec A` is a universal effective epimorphism in the category of affine schemes iff
`A → B` is pure (Stacks, Lemma 35.13.2, Tag 0EUA, with `forall_isAmitsurEqualizer_iff`). -/
theorem universally_effectiveEpi_iff :
    MorphismProperty.universally (C := AffineScheme.{u}) (fun _ _ f => EffectiveEpi f)
        (AffineScheme.Spec.map (CommRingCat.ofHom (algebraMap A B)).op) ↔
      ∀ (P : Type u) [AddCommGroup P] [Module A P],
        Function.Injective (TensorProduct.mk A B P 1) := by
  sorry

end ModuleDescent

section QuotientDescent

variable (k : Type u) [CommRing k] (A : Type u) [CommRing A] [Algebra k A]

/-- The quotient map `X → Spec A^R` satisfies the Amitsur condition for the structure sheaf:
`A^R → A ⇉ A ⊗[A^R] A` is an equalizer, for every ideal `I`. -/
theorem isAmitsurEqualizer_invariants (I : Ideal (A ⊗[k] A)) :
    IsAmitsurEqualizer (invariants k A I) A (invariants k A I) := by
  sorry

end QuotientDescent

section QuotientDescentFlat

variable (k : Type u) [Field k] (A : Type u) [CommRing A] [Algebra k A]

/-- In the flat case of 2.1, extension of scalars along `A^R → A` is comonadic: modules on
`Spec A^R` are the `A`-modules with descent data along the quotient map (SGA 1, Exp. VIII,
Théorème 1.1), from Tau Ceti's `RingHom.IsSpecEquivRel.faithfullyFlat` and Mathlib's
`comonadicExtendScalars`. -/
theorem nonempty_comonadicLeftAdjoint_invariants [FiniteDimensional k A] {I : Ideal (A ⊗[k] A)}
    (hI : IsEquivIdeal k A I)
    (hflat : Module.Flat A ((A ⊗[k] A) ⧸ I)) :
    Nonempty (ComonadicLeftAdjoint
      (ModuleCat.extendScalars.{u, u, u} (algebraMap (invariants k A I) A))) := by
  sorry

end QuotientDescentFlat

end TauCetiRoadmap.FiniteEquivalenceRelations
