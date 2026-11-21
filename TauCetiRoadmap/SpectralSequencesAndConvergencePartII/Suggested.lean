module

import Mathlib

/-!
# Spectral sequences and convergence, part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the two real-bodied
definitions they need: right acyclicity for the right derived functor on the bounded-below derived
category (README, Conventions) and the composition transformation of right derived functors
(README 3.1). The README carries every target, API list and Check.

Stated here:

* the acyclic assembly lemma and the comparison of totals for the direct-sum totalisation of a
  double complex indexed by `ℤ × ℤ`: when every antidiagonal has finitely many nonzero terms, in
  any abelian category, and in the half-plane cases, in an abelian category with exact sequential
  colimits (README 1.4, 1.5);
* the horseshoe lemma for injective resolutions of the outer terms of a short exact sequence of
  objects (README 2.1(a)), its form for short exact sequences of complexes vanishing below a
  given degree (README 2.1(a′)), and the relative horseshoe lemma, which lifts a morphism of short
  exact sequences to a prescribed degreewise split sequence of injective resolutions through
  prescribed maps on the outer terms (README 2.1(b));
* the agreement of the cohomology of Mathlib's `Functor.rightDerivedFunctorPlus` on objects with
  the classical right derived functors `Functor.rightDerived`, naturally in the object and in the
  functor (README 2.2(i));
* Leray's acyclicity lemma for the unit of `Functor.rightDerivedFunctorPlus` (README 2.2(v));
* Grothendieck's criterion: the composition transformation `R(G ∘ F) ⟶ RF ⋙ RG` is an
  isomorphism exactly when `F` sends injective objects to `G`-acyclic objects (README 3.1);
* the balancing of `Tor` in a monoidal abelian category whose tensor product is exact on
  projective objects (README 4.1).

Headline theorems that are not statable at the pins, and what each lacks:

* the product totalisation of a double complex and every statement about it: its convergence
  (1.3(c)), and the comparison of totals and acyclic assembly for it (1.4, 1.5). Neither library
  has a product total complex of a bicomplex. The class of categories these statements use, that
  of SpectralSequencesAndConvergence §7.4 (countable products and coproducts, exact sequential
  colimits and Tau Ceti's `TauCeti.IsReplete`), is expressible at the pins; the carrier that is
  missing is the total complex;
* the two spectral sequences of a double complex with their second pages and their convergence
  (1.2, 1.3), the two hypercohomology spectral sequences and their hyperhomology duals (2.4–2.6),
  the composite-functor spectral sequence of a complex with its low-degree exact sequences and its
  naturality in the functors (3.2–3.4), and the universal-coefficient, Künneth and change-of-rings
  spectral sequences (4.2–4.4). Each needs the column filtration of a total complex indexed by
  `ℤ × ℤ` as an input of Tau Ceti's `CochainComplex.spectralSequence`, which neither library
  constructs, and the convergence structures of SpectralSequencesAndConvergence §3.2 with the
  limit page of its §1.4 and the canonical presentation of its §5.2, which neither library has;
* the existence and the lifting of Cartan–Eilenberg resolutions (2.3), on which the
  hypercohomology sequences rest: neither library has them, and they are a construction of this
  roadmap whose definition asks that the complexes of horizontal cycles, boundaries and cohomology
  of a double complex, with the augmentations they inherit, be injective resolutions;
* the pairings of exact couples satisfying Massey's conditions, the multiplicativity of the
  spectral sequences of filtered and double complexes (5.1–5.3), and the Bockstein spectral
  sequence with its higher Bocksteins, limit page and convergence (6.1, 6.2): neither library has
  bigraded exact couples (StableHomotopyKTheory §7.22) or the spectral sequence of an exact couple
  (SpectralSequencesAndConvergence §6.1), and the limit-page and convergence statements need the
  limit page and convergence structures of SpectralSequencesAndConvergence §§1.4 and 3.2.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits CategoryTheory.MonoidalCategory

universe v₁ v₂ v₃ u₁ u₂ u₃

namespace TauCetiRoadmap.SpectralSequencesAndConvergencePartII

/-! ## Layer 1: double complexes and their two spectral sequences -/

/-- **Acyclic assembly for finite antidiagonals** (README 1.5; Stacks, Homological Algebra,
Lemmas 25.3 and 25.4, tags 0132 and 0133). In any abelian category, let `K` be a double complex
indexed by `ℤ × ℤ`, with columns `K.X p` and rows `K.flip.X q`, such that each antidiagonal
`p + q = n` has only finitely many nonzero terms. If all columns, or all rows, are exact, then
the direct-sum total complex is acyclic. -/
theorem acyclic_total_of_finite_antidiagonals {C : Type u₁} [Category.{v₁} C] [Abelian C]
    (K : HomologicalComplex₂ C (ComplexShape.up ℤ) (ComplexShape.up ℤ))
    [K.HasTotal (ComplexShape.up ℤ)]
    (hfin : ∀ n : ℤ, {p : ℤ | ¬ IsZero ((K.X p).X (n - p))}.Finite)
    (hexact : (∀ p, (K.X p).Acyclic) ∨ (∀ q, (K.flip.X q).Acyclic)) :
    (K.total (ComplexShape.up ℤ)).Acyclic := by
  sorry

/-- **Acyclic assembly for the direct-sum totalisation in the half-plane cases** (README 1.5;
Weibel, Lemma 2.7.3, for modules). In an abelian category with exact sequential colimits, let `K`
be a double complex indexed by `ℤ × ℤ` whose direct-sum total complex exists. If the columns are
exact and, for every `n`, the terms `K^{p, n - p}` vanish for all large `p`, or the rows are exact
and, for every `n`, the terms `K^{n - q, q}` vanish for all large `q`, then the direct-sum total
complex is acyclic. -/
theorem acyclic_total_of_bounded {C : Type u₁} [Category.{v₁} C] [Abelian C]
    [HasColimitsOfShape ℕ C] [HasExactColimitsOfShape ℕ C]
    (K : HomologicalComplex₂ C (ComplexShape.up ℤ) (ComplexShape.up ℤ))
    [K.HasTotal (ComplexShape.up ℤ)]
    (h : ((∀ p, (K.X p).Acyclic) ∧
          ∀ n : ℤ, ∃ b : ℤ, ∀ p, b < p → IsZero ((K.X p).X (n - p))) ∨
        ((∀ q, (K.flip.X q).Acyclic) ∧
          ∀ n : ℤ, ∃ b : ℤ, ∀ q, b < q → IsZero ((K.X (n - q)).X q))) :
    (K.total (ComplexShape.up ℤ)).Acyclic := by
  sorry

/-- **Comparison of totals for finite antidiagonals** (README 1.4). In any abelian category, a
morphism of double complexes indexed by `ℤ × ℤ` whose source and target have finitely many
nonzero terms on each antidiagonal, and which is a quasi-isomorphism on every column or on every
row, induces a quasi-isomorphism of direct-sum total complexes. -/
theorem quasiIso_total_map_of_finite_antidiagonals {C : Type u₁} [Category.{v₁} C] [Abelian C]
    {K L : HomologicalComplex₂ C (ComplexShape.up ℤ) (ComplexShape.up ℤ)} (f : K ⟶ L)
    [K.HasTotal (ComplexShape.up ℤ)] [L.HasTotal (ComplexShape.up ℤ)]
    (hK : ∀ n : ℤ, {p : ℤ | ¬ IsZero ((K.X p).X (n - p))}.Finite)
    (hL : ∀ n : ℤ, {p : ℤ | ¬ IsZero ((L.X p).X (n - p))}.Finite)
    (hf : (∀ p, QuasiIso (f.f p)) ∨
      (∀ q, QuasiIso (((HomologicalComplex₂.flipFunctor C _ _).map f).f q))) :
    QuasiIso (HomologicalComplex₂.total.map f (ComplexShape.up ℤ)) := by
  sorry

/-- **Comparison of direct-sum totals in the half-plane cases** (README 1.4). In an abelian
category with exact sequential colimits, a morphism of double complexes indexed by `ℤ × ℤ` with
direct-sum totals induces a quasi-isomorphism of total complexes if it is a quasi-isomorphism on
every column and, for every `n`, the terms of source and target on the antidiagonal `n` vanish in
all large columns, or if it is a quasi-isomorphism on every row and, for every `n`, those terms
vanish in all large rows. -/
theorem quasiIso_total_map_of_bounded {C : Type u₁} [Category.{v₁} C] [Abelian C]
    [HasColimitsOfShape ℕ C] [HasExactColimitsOfShape ℕ C]
    {K L : HomologicalComplex₂ C (ComplexShape.up ℤ) (ComplexShape.up ℤ)} (f : K ⟶ L)
    [K.HasTotal (ComplexShape.up ℤ)] [L.HasTotal (ComplexShape.up ℤ)]
    (h : ((∀ p, QuasiIso (f.f p)) ∧
          ∀ n : ℤ, ∃ b : ℤ, ∀ p, b < p →
            IsZero ((K.X p).X (n - p)) ∧ IsZero ((L.X p).X (n - p))) ∨
        ((∀ q, QuasiIso (((HomologicalComplex₂.flipFunctor C _ _).map f).f q)) ∧
          ∀ n : ℤ, ∃ b : ℤ, ∀ q, b < q →
            IsZero ((K.X (n - q)).X q) ∧ IsZero ((L.X (n - q)).X q))) :
    QuasiIso (HomologicalComplex₂.total.map f (ComplexShape.up ℤ)) := by
  sorry

/-! ## Layer 2: Cartan–Eilenberg resolutions and hyper-derived functors -/

/-- **The horseshoe lemma for injective resolutions** (README 2.1(a); Stacks, Derived Categories,
Lemma 18.9, tag 013T, and its proof; Weibel, §2.2). In any abelian category, for a short exact
sequence `0 → A → B → C → 0` and injective resolutions `I₁` of `A` and `I₃` of `C`, there are an
injective resolution `I₂` of `B` and chain maps `I₁ ⟶ I₂ ⟶ I₃`, compatible with the
augmentations, that form a split short exact sequence in every degree. -/
theorem exists_injectiveResolution_horseshoe {C : Type u₁} [Category.{v₁} C] [Abelian C]
    (S : ShortComplex C) (hS : S.ShortExact) (I₁ : InjectiveResolution S.X₁)
    (I₃ : InjectiveResolution S.X₃) :
    ∃ (I₂ : InjectiveResolution S.X₂) (i : I₁.cocomplex ⟶ I₂.cocomplex)
      (p : I₂.cocomplex ⟶ I₃.cocomplex),
      I₁.ι ≫ i = (CochainComplex.single₀ C).map S.f ≫ I₂.ι ∧
      I₂.ι ≫ p = (CochainComplex.single₀ C).map S.g ≫ I₃.ι ∧
      ∀ n : ℕ, ∃ w : i.f n ≫ p.f n = 0, Nonempty (ShortComplex.mk (i.f n) (p.f n) w).Splitting := by
  sorry

/-- **The horseshoe lemma for bounded-below complexes** (README 2.1(a′); Stacks, Derived
Categories, Lemma 18.9, tag 013T, items (1)–(3)). In an abelian category with enough injectives,
let `0 → A → B → C → 0` be a short exact sequence of cochain complexes indexed by `ℤ` that vanish
below degree `n`, and let `A ⟶ I₁` be a quasi-isomorphism into a complex of injective objects that
vanishes below degree `n`. Then there are complexes `I₂`, `I₃` of injective objects vanishing below
degree `n`, quasi-isomorphisms `B ⟶ I₂` and `C ⟶ I₃`, and chain maps `I₁ ⟶ I₂ ⟶ I₃` commuting
with the given maps and these quasi-isomorphisms, that form a split short exact sequence in every
degree. -/
theorem exists_quasiIso_injective_horseshoe {C : Type u₁} [Category.{v₁} C] [Abelian C]
    [EnoughInjectives C] (S : ShortComplex (CochainComplex C ℤ)) (hS : S.ShortExact) (n : ℤ)
    [S.X₁.IsStrictlyGE n] [S.X₂.IsStrictlyGE n] [S.X₃.IsStrictlyGE n]
    (I₁ : CochainComplex C ℤ) [I₁.IsStrictlyGE n] [∀ k, Injective (I₁.X k)]
    (ι₁ : S.X₁ ⟶ I₁) [QuasiIso ι₁] :
    ∃ (I₂ I₃ : CochainComplex C ℤ) (ι₂ : S.X₂ ⟶ I₂) (ι₃ : S.X₃ ⟶ I₃)
      (i : I₁ ⟶ I₂) (p : I₂ ⟶ I₃),
      I₂.IsStrictlyGE n ∧ I₃.IsStrictlyGE n ∧ (∀ k, Injective (I₂.X k)) ∧
      (∀ k, Injective (I₃.X k)) ∧ QuasiIso ι₂ ∧ QuasiIso ι₃ ∧
      S.f ≫ ι₂ = ι₁ ≫ i ∧ S.g ≫ ι₃ = ι₂ ≫ p ∧
      ∀ k : ℤ, ∃ w : i.f k ≫ p.f k = 0, Nonempty (ShortComplex.mk (i.f k) (p.f k) w).Splitting := by
  sorry

/-- **The relative horseshoe lemma** (README 2.1(b); Stacks, Derived Categories, Lemmas 18.6
and 18.7, tags 013P and 013S, for the lifting and the homotopies it corrects). In any abelian
category, let `φ = (f₁, f₂, f₃)` be a morphism from a short exact sequence `0 → A → B → C → 0` to a
short exact sequence `0 → A' → B' → C' → 0`. Let `R₁ ⟶ R₂ ⟶ R₃` be chain maps of `ℕ`-indexed
cochain complexes forming a short exact sequence in every degree, with quasi-isomorphisms
`εᵢ` from `A`, `B`, `C` placed in degree `0` compatible with them, and let `I₁' ⟶ I₂' ⟶ I₃'` be
chain maps between injective resolutions of `A'`, `B'`, `C'`, compatible with the augmentations,
forming a split short exact sequence in every degree. Then for chain maps `α : R₁ ⟶ I₁'` over `f₁`
and `β : R₃ ⟶ I₃'` over `f₃` there is a chain map `μ : R₂ ⟶ I₂'` over `f₂` whose composite with
`R₁ ⟶ R₂` is `α` followed by `I₁' ⟶ I₂'` and whose composite with `I₂' ⟶ I₃'` is `R₂ ⟶ R₃`
followed by `β`. -/
theorem exists_horseshoe_lift {C : Type u₁} [Category.{v₁} C] [Abelian C]
    {S S' : ShortComplex C} (hS : S.ShortExact) (hS' : S'.ShortExact) (φ : S ⟶ S')
    {R₁ R₂ R₃ : CochainComplex C ℕ} (r₁ : R₁ ⟶ R₂) (r₂ : R₂ ⟶ R₃)
    (hR : ∀ k : ℕ, ∃ w : r₁.f k ≫ r₂.f k = 0, (ShortComplex.mk (r₁.f k) (r₂.f k) w).ShortExact)
    (ε₁ : (CochainComplex.single₀ C).obj S.X₁ ⟶ R₁)
    (ε₂ : (CochainComplex.single₀ C).obj S.X₂ ⟶ R₂)
    (ε₃ : (CochainComplex.single₀ C).obj S.X₃ ⟶ R₃) [QuasiIso ε₁] [QuasiIso ε₂] [QuasiIso ε₃]
    (hε₁ : ε₁ ≫ r₁ = (CochainComplex.single₀ C).map S.f ≫ ε₂)
    (hε₂ : ε₂ ≫ r₂ = (CochainComplex.single₀ C).map S.g ≫ ε₃)
    (I₁ : InjectiveResolution S'.X₁) (I₂ : InjectiveResolution S'.X₂)
    (I₃ : InjectiveResolution S'.X₃) (i : I₁.cocomplex ⟶ I₂.cocomplex)
    (p : I₂.cocomplex ⟶ I₃.cocomplex)
    (hi : I₁.ι ≫ i = (CochainComplex.single₀ C).map S'.f ≫ I₂.ι)
    (hp : I₂.ι ≫ p = (CochainComplex.single₀ C).map S'.g ≫ I₃.ι)
    (hip : ∀ k : ℕ, ∃ w : i.f k ≫ p.f k = 0,
      Nonempty (ShortComplex.mk (i.f k) (p.f k) w).Splitting)
    (α : R₁ ⟶ I₁.cocomplex) (β : R₃ ⟶ I₃.cocomplex)
    (hα : ε₁ ≫ α = (CochainComplex.single₀ C).map φ.τ₁ ≫ I₁.ι)
    (hβ : ε₃ ≫ β = (CochainComplex.single₀ C).map φ.τ₃ ≫ I₃.ι) :
    ∃ μ : R₂ ⟶ I₂.cocomplex, ε₂ ≫ μ = (CochainComplex.single₀ C).map φ.τ₂ ≫ I₂.ι ∧
      r₁ ≫ μ = α ≫ i ∧ μ ≫ p = r₂ ≫ β := by
  sorry

/-- An object `B` is right acyclic for an additive functor `F` when the cohomology of
`F.rightDerivedFunctorPlus` at `B` placed in degree `0` vanishes in every positive degree
(README, Conventions; Stacks, Derived Categories, Lemma 16.4, tag 015C, for left exact `F`). -/
def IsRightAcyclic {C : Type u₁} [Category.{v₁} C] [Abelian C] {D : Type u₂} [Category.{v₂} D]
    [Abelian D] [HasDerivedCategory C] [HasDerivedCategory D] [EnoughInjectives C]
    (F : C ⥤ D) [F.Additive] (B : C) : Prop :=
  ∀ i : ℤ, 0 < i → IsZero ((DerivedCategory.Plus.homologyFunctor D i).obj
    (F.rightDerivedFunctorPlus.obj ((DerivedCategory.Plus.singleFunctor C 0).obj B)))

/-- **The two right derived functors agree** (README 2.2(i); Stacks, Derived Categories,
Definition 16.2, tag 015A). For additive functors `F : C ⥤ D` out of an abelian category with
enough injectives, there are isomorphisms between the `n`th cohomology of
`F.rightDerivedFunctorPlus` on objects placed in degree `0` and Mathlib's classical
`F.rightDerived n`, natural in the object and compatible with the maps that a natural
transformation `F₁ ⟶ F₂` induces on both sides. -/
theorem exists_rightDerivedFunctorPlus_homology_iso_rightDerived {C : Type u₁} [Category.{v₁} C]
    [Abelian C] {D : Type u₂} [Category.{v₂} D] [Abelian D] [HasDerivedCategory C]
    [HasDerivedCategory D] [EnoughInjectives C] (n : ℕ) :
    ∃ e : ∀ (F : C ⥤ D) [F.Additive],
        DerivedCategory.Plus.singleFunctor C 0 ⋙ F.rightDerivedFunctorPlus ⋙
          DerivedCategory.Plus.homologyFunctor D n ≅ F.rightDerived n,
      ∀ (F₁ F₂ : C ⥤ D) [F₁.Additive] [F₂.Additive] (τ : F₁ ⟶ F₂),
        Functor.whiskerLeft (DerivedCategory.Plus.singleFunctor C 0)
            (Functor.whiskerRight (NatTrans.rightDerivedFunctorPlus τ)
              (DerivedCategory.Plus.homologyFunctor D n)) ≫ (e F₂).hom =
          (e F₁).hom ≫ NatTrans.rightDerived τ n := by
  sorry

/-- **Leray's acyclicity lemma** (README 2.2(v); Stacks, Derived Categories, Lemma 16.7,
tag 015E). For a left exact functor `F` out of an abelian category with enough injectives and a
bounded-below complex `L` whose terms are right acyclic for `F`, the unit
`F(L) ⟶ RF(L)` of `F.rightDerivedFunctorPlus` is an isomorphism in the bounded-below derived
category. -/
theorem isIso_rightDerivedFunctorPlusUnit_app_of_isRightAcyclic {C : Type u₁} [Category.{v₁} C]
    [Abelian C] {D : Type u₂} [Category.{v₂} D] [Abelian D] [HasDerivedCategory C]
    [HasDerivedCategory D] [EnoughInjectives C] (F : C ⥤ D) [F.Additive]
    [PreservesFiniteLimits F] (L : CochainComplex.Plus C)
    (hL : ∀ n : ℤ, IsRightAcyclic F (L.obj.X n)) :
    IsIso (F.rightDerivedFunctorPlusUnit.app L) := by
  sorry

/-! ## Layer 3: composite functors -/

/-- The composition transformation `R(F ⋙ G) ⟶ RF ⋙ RG` of right derived functors on the
bounded-below derived categories (README 3.1; Stacks, Derived Categories, §22, tag 015L): the
transformation that the universal property of `(F ⋙ G).rightDerivedFunctorPlus` attaches to the
composite of the unit of `G.rightDerivedFunctorPlus` at `F` of a complex with the image under
`G.rightDerivedFunctorPlus` of the unit of `F.rightDerivedFunctorPlus`. -/
def compositionTrans {C : Type u₁} [Category.{v₁} C] [Abelian C] {D : Type u₂} [Category.{v₂} D]
    [Abelian D] {E : Type u₃} [Category.{v₃} E] [Abelian E] [HasDerivedCategory C]
    [HasDerivedCategory D] [HasDerivedCategory E] [EnoughInjectives C] [EnoughInjectives D]
    (F : C ⥤ D) (G : D ⥤ E) [F.Additive] [G.Additive] :
    (F ⋙ G).rightDerivedFunctorPlus ⟶ F.rightDerivedFunctorPlus ⋙ G.rightDerivedFunctorPlus :=
  (F ⋙ G).rightDerivedFunctorPlus.rightDerivedDesc (F ⋙ G).rightDerivedFunctorPlusUnit
    (CochainComplex.Plus.quasiIso C) _
    (Functor.whiskerLeft F.mapCochainComplexPlus G.rightDerivedFunctorPlusUnit ≫
      Functor.whiskerRight F.rightDerivedFunctorPlusUnit G.rightDerivedFunctorPlus)

/-- **Grothendieck's criterion for composing right derived functors** (README 3.1; Stacks,
Derived Categories, Lemma 22.1, tag 015M). Let `F : C ⥤ D` be additive and `G : D ⥤ E` left
exact, with `C` and `D` having enough injectives. The composition transformation
`R(F ⋙ G) ⟶ RF ⋙ RG` is an isomorphism if and only if `F` sends every injective object of `C` to
an object that is right acyclic for `G`. -/
theorem isIso_compositionTrans_iff {C : Type u₁} [Category.{v₁} C] [Abelian C] {D : Type u₂}
    [Category.{v₂} D] [Abelian D] {E : Type u₃} [Category.{v₃} E] [Abelian E]
    [HasDerivedCategory C] [HasDerivedCategory D] [HasDerivedCategory E] [EnoughInjectives C]
    [EnoughInjectives D] (F : C ⥤ D) (G : D ⥤ E) [F.Additive] [G.Additive]
    [PreservesFiniteLimits G] :
    IsIso (compositionTrans F G) ↔ ∀ I : C, Injective I → IsRightAcyclic G (F.obj I) := by
  sorry

/-! ## Layer 4: Tor and Ext over rings -/

/-- **Balancing of `Tor`** (README 4.1; Weibel, Theorem 2.7.2, for modules). In a monoidal
abelian category with projective resolutions in which tensoring on either side with a projective
object is exact, Mathlib's `Tor`, derived in the second variable, and `Tor'`, derived in the
first, are isomorphic as bifunctors in every degree. -/
theorem nonempty_tor_iso_tor' (C : Type u₁) [Category.{v₁} C] [MonoidalCategory C] [Abelian C]
    [MonoidalPreadditive C] [HasProjectiveResolutions C]
    (hexact : ∀ P : C, Projective P →
      (PreservesFiniteLimits (tensorLeft P) ∧ PreservesFiniteColimits (tensorLeft P)) ∧
        (PreservesFiniteLimits (tensorRight P) ∧ PreservesFiniteColimits (tensorRight P)))
    (n : ℕ) :
    Nonempty (Tor C n ≅ Tor' C n) := by
  sorry

end TauCetiRoadmap.SpectralSequencesAndConvergencePartII
