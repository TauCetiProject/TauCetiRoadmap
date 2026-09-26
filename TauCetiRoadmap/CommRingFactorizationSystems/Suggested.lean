/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Targets — generated factorization systems on commutative rings (`CommRingFactorizationSystems`)

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a milestone
nor the roadmap. Where a statement below and the README disagree, the README wins.

The file states the spine: the ring-level input to the generic small object argument (A), the
localization system with its unit generator (B), the Zariski system and the Zariski theorem (C1–C4),
the integral system (D), the absolutely flat system with its reflection and profinite spectra (E),
Bhatt–Scholze's `A^Z` and w-local rings (C5, stated after E because it needs `absFlatRing`), the
weak normalization and seminormalization systems with the absolute weak normalization theorem (F),
the monic system and its comparison with the Zariski system (G), and a selection of the example
suite (H).

The generic notions this roadmap consumes from the `OrthogonalFactorization` roadmap
(`TauCetiRoadmap/OrthogonalFactorization`) are not yet in Tau Ceti. They are restated in the first
section below **as stand-ins, with the signatures of that roadmap's `Suggested.lean`**, so that this
file elaborates; once that roadmap lands, the section is deleted and replaced by imports.

Universe conventions follow the README: explicit generator families and everything defined from
them live in `CommRingCat.{0}`, and classes defined by ring theory are universe-polymorphic.
-/

universe w v u

open CategoryTheory Category Limits Polynomial TensorProduct

/-! ## Stand-ins for the `OrthogonalFactorization` roadmap

Deleted once that roadmap is in Tau Ceti. Signatures match its `Suggested.lean`. -/

namespace CategoryTheory

variable {C : Type u} [Category.{v} C]

/-- Stand-in for `OrthogonalFactorization` B1. -/
class HasAtMostOneLiftingProperty {A B X Y : C} (i : A ⟶ B) (p : X ⟶ Y) : Prop where
  /-- The type of lifts of any square from `i` to `p` is a subsingleton. -/
  subsingleton_liftStruct :
    ∀ {f : A ⟶ X} {g : B ⟶ Y} (sq : CommSq f i p g), Subsingleton sq.LiftStruct

/-- Stand-in for `OrthogonalFactorization` B1. -/
class HasUniqueLiftingProperty {A B X Y : C} (i : A ⟶ B) (p : X ⟶ Y) : Prop
    extends HasLiftingProperty i p, HasAtMostOneLiftingProperty i p

namespace MorphismProperty

/-- Stand-in for `OrthogonalFactorization` D1. -/
def leftOrthogonal (T : MorphismProperty C) : MorphismProperty C := fun _ _ f ↦
  ∀ ⦃X Y : C⦄ (g : X ⟶ Y), T g → HasUniqueLiftingProperty f g

/-- Stand-in for `OrthogonalFactorization` D1. -/
def rightOrthogonal (T : MorphismProperty C) : MorphismProperty C := fun _ _ f ↦
  ∀ ⦃X Y : C⦄ (g : X ⟶ Y), T g → HasUniqueLiftingProperty g f

/-- Stand-in for `OrthogonalFactorization` E1. -/
class IsOrthogonalFactorizationSystem (L R : MorphismProperty C) : Prop where
  /-- The right class is the right orthogonal of the left class. -/
  rightOrthogonal : L.rightOrthogonal = R
  /-- The left class is the left orthogonal of the right class. -/
  leftOrthogonal : R.leftOrthogonal = L
  /-- Every morphism factors as a left map followed by a right map. -/
  hasFactorization : HasFactorization L R := by infer_instance

/-- Stand-in for `OrthogonalFactorization` G1. -/
noncomputable def codiagonalGenerators [HasPushouts C] (I : MorphismProperty C) :
    MorphismProperty C :=
  ofHoms (fun i : I.toSet ↦ pushout.codiagonal (I.homFamily i))

/-- Stand-in for `OrthogonalFactorization` G1. -/
noncomputable def orthogonalGenerators [HasPushouts C] (I : MorphismProperty C) :
    MorphismProperty C :=
  I ⊔ codiagonalGenerators I

/-- Stand-in for `OrthogonalFactorization` H1. -/
@[pp_with_univ]
def cellular (J : MorphismProperty C) : MorphismProperty C :=
  transfiniteCompositions.{w} (coproducts.{w} J).pushouts

/-- Stand-in for `OrthogonalFactorization` J1. -/
def localObjects [HasTerminal C] (R : MorphismProperty C) : ObjectProperty C :=
  fun A ↦ R (terminal.from A)

end MorphismProperty

end CategoryTheory

open CategoryTheory.MorphismProperty

/-! ## Milestone A — Commutative rings as a locally finitely presentable category -/

namespace CommRingCat

/-- **A1.** A ring finitely presented over `ℤ` is a finitely presentable object of `CommRingCat`,
through `Under.equivalenceOfIsInitial` and Mathlib's `isFinitelyPresentable_under`. -/
theorem isFinitelyPresentable_of_finitePresentation_int (R : CommRingCat.{u})
    (hR : (CommRingCat.isInitial.to R).hom.FinitePresentation) :
    IsFinitelyPresentable.{u} R :=
  sorry

/-- **A1.** The algebra form of the previous statement. -/
theorem isFinitelyPresentable_of_algebra_finitePresentation {R : Type u} [CommRing R]
    [Algebra ℤ R] [Algebra.FinitePresentation ℤ R] :
    IsFinitelyPresentable.{u} (CommRingCat.of R) :=
  sorry

/-- **A1.** `ℤ[X]`, the free commutative ring on one generator, is a finitely presentable strong
generator. -/
theorem isStrongGenerator_freeOne :
    (ObjectProperty.singleton (CommRingCat.free.obj PUnit.{u + 1})).IsStrongGenerator :=
  sorry

/-- **A1.** Hence `CommRingCat` is locally finitely presentable. -/
instance instIsLocallyFinitelyPresentable : IsLocallyFinitelyPresentable.{u} CommRingCat.{u} :=
  sorry

/-- **A1.** And so is `Under R`, for every `R`; this is the hypothesis of Mathlib's
`IsMultiplicative.ind_of_preIndSpreads` and `ind_iff_exists`. -/
instance instIsLocallyFinitelyPresentableUnder (R : CommRingCat.{u}) :
    IsLocallyFinitelyPresentable.{u} (Under R) :=
  sorry

/-- **A2.** The self-pushout of a ring map is the tensor square. -/
noncomputable def pushoutSelfIsoTensorProduct {A B : CommRingCat.{u}} (i : A ⟶ B) :
    pushout i i ≅ CommRingCat.of (letI := i.hom.toAlgebra; B ⊗[A] B) :=
  sorry

/-- **A2.** Under that isomorphism the codiagonal is the multiplication map. -/
theorem codiagonal_eq_lmul' {A B : CommRingCat.{u}} (i : A ⟶ B) :
    letI := i.hom.toAlgebra
    pushout.codiagonal i =
      (pushoutSelfIsoTensorProduct i).hom ≫
        CommRingCat.ofHom (Algebra.TensorProduct.lmul' A (S := B)).toRingHom :=
  sorry

/-- **A2. The epimorphism test.** A ring map is an epimorphism exactly when the multiplication map
of its tensor square is an isomorphism. -/
theorem epi_iff_isIso_lmul' {A B : CommRingCat.{u}} (i : A ⟶ B) :
    letI := i.hom.toAlgebra
    Epi i ↔ IsIso (CommRingCat.ofHom (Algebra.TensorProduct.lmul' A (S := B)).toRingHom) :=
  sorry

/-- **A2.** An epimorphism of rings is formally unramified, so a nonzero module of Kähler
differentials refutes epimorphicity. This is what shows `ℤ ⟶ ℤ[X]` and the universal monic roots of
degree `≥ 2` are not epimorphisms. -/
theorem not_epi_of_not_subsingleton_kaehlerDifferential (A B : Type u) [CommRing A] [CommRing B]
    [Algebra A B] (h : ¬ Subsingleton (_root_.KaehlerDifferential A B)) :
    ¬ Epi (CommRingCat.ofHom (algebraMap A B)) :=
  sorry

/-- **A2.** `MorphismProperty.surjective CommRingCat` is the translation of `RingHom.surjective`
and is stable under cobase change, from Mathlib's base-change stability. -/
instance surjective_isStableUnderCobaseChange :
    (MorphismProperty.surjective CommRingCat.{u}).IsStableUnderCobaseChange :=
  sorry

end CommRingCat

namespace CategoryTheory.MorphismProperty

/-- **A2.** The packaged small object argument for the codiagonal-augmented family of a small class
of maps between rings finitely presented over `ℤ`. Both hypotheses are in the form a concrete
generator family discharges by `rintro ⟨j⟩`. -/
theorem commRingCat_hasSmallObjectArgument_orthogonalGenerators
    (I : MorphismProperty CommRingCat.{u}) [I.IsSmall.{u}]
    (hsource : ∀ {A B : CommRingCat.{u}} (i : A ⟶ B), I i →
      (CommRingCat.isInitial.to A).hom.FinitePresentation)
    (htarget : ∀ {A B : CommRingCat.{u}} (i : A ⟶ B), I i →
      (CommRingCat.isInitial.to B).hom.FinitePresentation) :
    HasSmallObjectArgument.{u} (orthogonalGenerators I) :=
  sorry

/-- **A2.** The packaged generated orthogonal factorization system in `CommRingCat`. -/
theorem commRingCat_generatedOrthogonalFactorizationSystem
    (I : MorphismProperty CommRingCat.{u}) [I.IsSmall.{u}]
    (hsource : ∀ {A B : CommRingCat.{u}} (i : A ⟶ B), I i →
      (CommRingCat.isInitial.to A).hom.FinitePresentation)
    (htarget : ∀ {A B : CommRingCat.{u}} (i : A ⟶ B), I i →
      (CommRingCat.isInitial.to B).hom.FinitePresentation) :
    IsOrthogonalFactorizationSystem I.rightOrthogonal.leftOrthogonal I.rightOrthogonal :=
  sorry

/-- **A2.** The right class generated by maps between finitely presentable rings is stable under
every essentially small filtered colimit: the ring form of Stacks 0FWT. -/
theorem commRingCat_rightOrthogonal_isStableUnderFilteredColimits
    (I : MorphismProperty CommRingCat.{u})
    (hsource : ∀ {A B : CommRingCat.{u}} (i : A ⟶ B), I i → IsFinitelyPresentable.{u} A)
    (htarget : ∀ {A B : CommRingCat.{u}} (i : A ⟶ B), I i → IsFinitelyPresentable.{u} B)
    (J : Type w) [Category.{v} J] [EssentiallySmall.{u} J] [IsFiltered J] :
    I.rightOrthogonal.IsStableUnderColimitsOfShape J :=
  sorry

end CategoryTheory.MorphismProperty

/-! ## Milestone B — Localization and local homomorphisms -/

namespace CommRingCat.MorphismProperty

/-- **B1.** Local homomorphisms, as a morphism property. Defined directly: Mathlib's `IsLocalHom` is
a class on the map, not a `RingHom` predicate. -/
def localHom : MorphismProperty CommRingCat.{u} := fun _ _ f ↦ IsLocalHom f.hom

/-- **B1.** The submonoid of elements a ring map inverts. -/
def invertedSubmonoid {A B : CommRingCat.{u}} (f : A ⟶ B) : Submonoid A :=
  (IsUnit.submonoid B).comap f.hom

/-- **B1.** The localization maps: `f` exhibits its target as the localization of its source at the
submonoid it inverts. -/
def localizationMap : MorphismProperty CommRingCat.{u} := fun _ B f ↦
  letI := f.hom.toAlgebra
  IsLocalization (invertedSubmonoid f) B

/-- **B1.** A map is a localization map exactly when it is a localization at *some* submonoid. -/
theorem localizationMap_iff_exists {A B : CommRingCat.{u}} (f : A ⟶ B) :
    localizationMap f ↔ ∃ S : Submonoid A, letI := f.hom.toAlgebra; IsLocalization S B :=
  sorry

/-- **B1.** The canonical factorization of `f` through `S⁻¹A`, `S = f⁻¹(Bˣ)`. -/
noncomputable def localizationFactorization {A B : CommRingCat.{u}} (f : A ⟶ B) :
    localizationMap.MapFactorizationData localHom f :=
  sorry

/-- **B2.** The left class of the local homomorphisms is the localization maps, in every universe.
The inclusion `⊇` is the universal property of localization; `⊆` is the collapse argument through
`IsOrthogonalPair.inf_eq_isomorphisms`. -/
theorem leftOrthogonal_localHom_eq : localHom.{u}.leftOrthogonal = localizationMap.{u} :=
  sorry

/-- **B2.** The right class of the localization maps is the local homomorphisms. -/
theorem rightOrthogonal_localizationMap_eq : localizationMap.{u}.rightOrthogonal = localHom.{u} :=
  sorry

/-- **B2. The localization system**, with an explicit functorial factorization and no small object
argument. -/
theorem localizationLocalHomFactorizationSystem :
    IsOrthogonalFactorizationSystem localizationMap.{u} localHom.{u} :=
  sorry

/-- **B2.** The factorization is functorial in the arrow, by `IsLocalization.map`. -/
theorem localizationHasFunctorialFactorization :
    HasFunctorialFactorization localizationMap.{u} localHom.{u} :=
  sorry

/-- **B2.** The two classes meet in the isomorphisms. -/
theorem localizationMap_inf_localHom_eq_isomorphisms :
    localizationMap.{u} ⊓ localHom.{u} = isomorphisms CommRingCat.{u} :=
  sorry

end CommRingCat.MorphismProperty

namespace CommRingCat.Zariski

/-- **B3.** The unit generator `λ : ℤ[t] ⟶ ℤ[t, t⁻¹]`. -/
noncomputable def unitGenerator :
    CommRingCat.of (Polynomial ℤ) ⟶
      CommRingCat.of (Localization.Away (Polynomial.X : Polynomial ℤ)) :=
  CommRingCat.ofHom (algebraMap (Polynomial ℤ) (Localization.Away (Polynomial.X : Polynomial ℤ)))

/-- **B3.** Maps out of `ℤ[t, t⁻¹]` are units, naturally in `R`. -/
noncomputable def laurentHomEquiv (R : Type*) [CommRing R] :
    (Localization.Away (Polynomial.X : Polynomial ℤ) →+* R) ≃ Rˣ :=
  sorry

/-- **B3.** Unique lifting against `λ` is reflecting units. -/
theorem hasUniqueLiftingProperty_unitGenerator_iff {X Y : Type} [CommRing X] [CommRing Y]
    (f : X →+* Y) :
    HasUniqueLiftingProperty unitGenerator (CommRingCat.ofHom f) ↔ IsLocalHom f :=
  sorry

/-- **B3.** `λ` is an epimorphism, so unique lifting against it is ordinary lifting and the H4 form
of the generic theory applies. -/
instance epi_unitGenerator : Epi unitGenerator := sorry

/-- **B3.** The one-element family. -/
noncomputable def unitGenerators : MorphismProperty CommRingCat.{0} :=
  .ofHoms (fun _ : Unit ↦ unitGenerator)

/-- **B3.** The right orthogonal of `λ` is the local homomorphisms. -/
theorem rightOrthogonal_unitGenerators_eq :
    unitGenerators.rightOrthogonal = CommRingCat.MorphismProperty.localHom.{0} :=
  sorry

/-- **B3.** The localization maps are the cellular class of `λ`, with no codiagonal. -/
theorem localizationMap_eq_cellular_unitGenerators :
    CommRingCat.MorphismProperty.localizationMap.{0} = cellular.{0} unitGenerators :=
  sorry

/-- **B3. Zariski pairs (Stacks 0ELX).** The quotient map lifts uniquely against `λ` exactly when
the ideal lies in the Jacobson radical. -/
theorem hasUniqueLiftingProperty_unitGenerator_quotientMk_iff {R : Type} [CommRing R]
    (I : Ideal R) :
    HasUniqueLiftingProperty unitGenerator (CommRingCat.ofHom (Ideal.Quotient.mk I)) ↔
      I ≤ Ideal.jacobson ⊥ :=
  sorry

/-- **B3.** Every localization is one cell attachment: `A ⟶ M⁻¹A` is the pushout of `∐_{m ∈ M} λ`
along the evaluation `∐_{m ∈ M} ℤ[t] ⟶ A`, `t ↦ m`. -/
theorem exists_isPushout_coproduct_unitGenerator (A : Type) [CommRing A] (M : Submonoid A) :
    ∃ (e : ∐ (fun _ : M ↦ CommRingCat.of (Polynomial ℤ)) ⟶ CommRingCat.of A)
      (d : ∐ (fun _ : M ↦ CommRingCat.of (Localization.Away (Polynomial.X : Polynomial ℤ))) ⟶
        CommRingCat.of (Localization M)),
      IsPushout e (Limits.Sigma.map fun _ : M ↦ unitGenerator)
        (CommRingCat.ofHom (algebraMap A (Localization M))) d :=
  sorry

/-! ## Milestone C — The Zariski system (C1–C4; C5 follows Milestone E) -/

/-- **C1.** The idempotent generator `δ : ℤ ⟶ ℤ × ℤ`. -/
def idempotentGenerator : CommRingCat.of ℤ ⟶ CommRingCat.of (ℤ × ℤ) :=
  CommRingCat.ofHom (Int.castRingHom (ℤ × ℤ))

/-- **C1.** Maps out of `ℤ × ℤ` are idempotents, naturally in `R`. -/
def prodIntHomEquiv (R : Type*) [CommRing R] :
    ((ℤ × ℤ) →+* R) ≃ {e : R // IsIdempotentElem e} :=
  sorry

/-- **C1.** Unique lifting against `δ` is bijectivity on idempotents. -/
theorem hasUniqueLiftingProperty_idempotentGenerator_iff {X Y : Type} [CommRing X] [CommRing Y]
    (f : X →+* Y) :
    HasUniqueLiftingProperty idempotentGenerator (CommRingCat.ofHom f) ↔
      Function.Bijective (fun e : {e : X // IsIdempotentElem e} ↦
        (⟨f e, e.2.map f⟩ : {e : Y // IsIdempotentElem e})) :=
  sorry

/-- **C2.** The two-element index of the Zariski family. -/
inductive Index
  | idem
  | unit

/-- **C2.** The Zariski generators. -/
noncomputable def Index.hom : (i : Index) → (match i with
    | .idem => CommRingCat.of ℤ
    | .unit => CommRingCat.of (Polynomial ℤ)) ⟶ (match i with
    | .idem => CommRingCat.of (ℤ × ℤ)
    | .unit => CommRingCat.of (Localization.Away (Polynomial.X : Polynomial ℤ)))
  | .idem => idempotentGenerator
  | .unit => unitGenerator

/-- **C2.** The Zariski family `{δ, λ}`. -/
noncomputable def zariskiGenerators : MorphismProperty CommRingCat.{0} := .ofHoms Index.hom

/-- **C2.** The Zariski right class. -/
noncomputable def zariskiRight : MorphismProperty CommRingCat.{0} :=
  zariskiGenerators.rightOrthogonal

/-- **C2. The pinning lemma.** A map is in the Zariski right class exactly when it is a local
homomorphism bijective on idempotents. -/
theorem zariskiRight_iff {X Y : Type} [CommRing X] [CommRing Y] (f : X →+* Y) :
    zariskiRight (CommRingCat.ofHom f) ↔
      IsLocalHom f ∧ Function.Bijective (fun e : {e : X // IsIdempotentElem e} ↦
        (⟨f e, e.2.map f⟩ : {e : Y // IsIdempotentElem e})) :=
  sorry

/-- **C2.** Strictly inside the local homomorphisms, separated by the diagonal `ℤ ⟶ ℤ × ℤ`. -/
theorem zariskiRight_lt_localHom : zariskiRight < CommRingCat.MorphismProperty.localHom.{0} :=
  sorry

/-- **C3.** `δ` is not an epimorphism, so the codiagonal augmentation is genuinely used. -/
theorem zariskiGenerators_hasSmallObjectArgument :
    HasSmallObjectArgument.{0} (orthogonalGenerators zariskiGenerators) :=
  sorry

/-- **C3.** The Zariski left class. -/
noncomputable def zariskiLeft : MorphismProperty CommRingCat.{0} := zariskiRight.leftOrthogonal

/-- **C3. The Zariski system.** -/
theorem zariskiOrthogonalFactorizationSystem :
    IsOrthogonalFactorizationSystem zariskiLeft zariskiRight :=
  sorry

/-- **C3.** The cellular description of the Zariski left class. -/
theorem zariskiLeft_eq_cellular :
    zariskiLeft = cellular.{0} (orthogonalGenerators zariskiGenerators) :=
  sorry

/-- **C3.** Strictly larger than the localization maps: `A ⟶ A × A` is a Zariski map and not an
epimorphism. -/
theorem localizationMap_lt_zariskiLeft :
    CommRingCat.MorphismProperty.localizationMap.{0} < zariskiLeft :=
  sorry

/-- **C4.** Bhatt–Scholze's Zariski localizations: maps isomorphic, as arrows, to
`A ⟶ ∏_{j < n} A[1/f_j]`. `n = 0` is allowed. -/
def zariskiLocalization : MorphismProperty CommRingCat.{u} := fun A _ f ↦
  ∃ (n : ℕ) (g : Fin n → A), Nonempty (CategoryTheory.Arrow.mk f ≅
    CategoryTheory.Arrow.mk
      (CommRingCat.ofHom (RingHom.pi fun j ↦ algebraMap A (Localization.Away (g j)))))

/-- **C4.** A Zariski localization of a Zariski localization is one. -/
instance zariskiLocalization_isMultiplicative : zariskiLocalization.{u}.IsMultiplicative := sorry

instance zariskiLocalization_isStableUnderCobaseChange :
    zariskiLocalization.{u}.IsStableUnderCobaseChange := sorry

/-- **C4.** Zariski localizations are finitely presentable maps. -/
theorem zariskiLocalization_le_isFinitelyPresentable :
    zariskiLocalization.{u} ≤ MorphismProperty.isFinitelyPresentable.{u} CommRingCat.{u} :=
  sorry

/-- **C4.** A Zariski localization of a filtered colimit is the cobase change of one of a stage. -/
instance zariskiLocalization_preIndSpreads : PreIndSpreads.{u} zariskiLocalization.{u} := sorry

/-- **C4.** The ind-Zariski localizations, Mathlib's `ind` of the previous class. -/
noncomputable def indZariskiLocalization : MorphismProperty CommRingCat.{u} :=
  ind.{u} zariskiLocalization.{u}

/-- **C4.** The generators and their codiagonals are Zariski localizations. -/
theorem orthogonalGenerators_zariskiGenerators_le_zariskiLocalization :
    orthogonalGenerators zariskiGenerators ≤ zariskiLocalization.{0} :=
  sorry

/-- **C4. The Zariski theorem.** The Zariski left class is the class of ind-Zariski
localizations. `⊇` is stability of the left class under colimits in `Under A`; `⊆` is
`cellular_le_ind`, every layer of the cellular class staying inside `ind` of a class of finitely
presentable maps stable under cobase change and composition. -/
theorem zariskiLeft_eq_indZariskiLocalization : zariskiLeft = indZariskiLocalization.{0} :=
  sorry

/-- **C4.** A finitely presentable Zariski map is a Zariski localization on the nose: it is a
retract of a stage, and a retract of `A ⟶ ∏ A[1/f_j]` under `A` is cut out by an idempotent, hence
by clopens of the `Spec A[1/f_j]`, which are finite unions of basic opens. -/
theorem zariskiLocalization_eq_zariskiLeft_inf_isFinitelyPresentable :
    zariskiLocalization.{0} = zariskiLeft ⊓ MorphismProperty.isFinitelyPresentable.{0} CommRingCat.{0} :=
  sorry

/-- **C4.** Strict, since `A ⟶ A^Z` is not finitely presented for `A = ℤ`. -/
theorem zariskiLocalization_lt_zariskiLeft : zariskiLocalization.{0} < zariskiLeft := sorry

end CommRingCat.Zariski

/-! ## Milestone D — Integral closure -/

namespace CommRingCat.MorphismProperty

/-- **D1.** Integral maps, as the translation of Mathlib's `RingHom.IsIntegral`. -/
noncomputable def integral : MorphismProperty CommRingCat.{u} :=
  RingHom.toMorphismProperty RingHom.IsIntegral

/-- **D1.** Integrally closed extensions: Mathlib's `IsIntegrallyClosedIn A B` for the algebra
structure of the map. It includes injectivity. -/
noncomputable def integrallyClosed : MorphismProperty CommRingCat.{u} := fun A B f ↦
  letI := f.hom.toAlgebra
  IsIntegrallyClosedIn A B

/-- **D1.** The pinning lemma. -/
theorem integrallyClosed_iff {A B : CommRingCat.{u}} (f : A ⟶ B) :
    integrallyClosed f ↔
      Function.Injective f.hom ∧ ∀ {y : B}, f.hom.IsIntegralElem y → ∃ x : A, f.hom x = y :=
  sorry

/-- **D1.** The factorization through the integral closure. -/
noncomputable def integralClosureFactorization {A B : CommRingCat.{u}} (f : A ⟶ B) :
    integral.MapFactorizationData integrallyClosed f :=
  sorry

/-- **D1.** An integral map lifts uniquely against an integrally closed extension. -/
theorem hasUniqueLiftingProperty_of_integral_of_integrallyClosed {A B X Y : CommRingCat.{u}}
    (i : A ⟶ B) (p : X ⟶ Y) (hi : integral i) (hp : integrallyClosed p) :
    HasUniqueLiftingProperty i p :=
  sorry

/-- **D1.** The left class of the integrally closed extensions is the integral maps, in every
universe, by the collapse argument. -/
theorem leftOrthogonal_integrallyClosed_eq : integrallyClosed.{u}.leftOrthogonal = integral.{u} :=
  sorry

/-- **D2.** The kernel generator `ℤ[x] ⟶ ℤ`, `x ↦ 0`. -/
noncomputable def kernelGenerator : CommRingCat.of (Polynomial ℤ) ⟶ CommRingCat.of ℤ :=
  CommRingCat.ofHom (Polynomial.evalRingHom 0)

/-- **D2.** Unique lifting against the kernel generator is injectivity. -/
theorem hasUniqueLiftingProperty_kernelGenerator_iff {A B : Type} [CommRing A] [CommRing B]
    (f : A →+* B) :
    HasUniqueLiftingProperty kernelGenerator (CommRingCat.ofHom f) ↔ Function.Injective f :=
  sorry

/-- **D2.** Positive degrees. -/
abbrev PositiveDegree := {n : ℕ // 0 < n}

/-- **D2.** The universal monic polynomial of degree `n`, `Xⁿ + Σ_{i<n} aᵢ Xⁱ` over `ℤ[a₀, …, aₙ₋₁]`. -/
noncomputable def UniversalMonic.polynomial (n : PositiveDegree) :
    Polynomial (MvPolynomial (Fin n.1) ℤ) :=
  X ^ n.1 + ∑ i : Fin n.1, C (MvPolynomial.X i) * X ^ (i : ℕ)

/-- **D2.** The universal monic root generator of degree `n`. -/
noncomputable def universalMonicRootGenerator (n : PositiveDegree) :
    CommRingCat.of (MvPolynomial (Fin n.1) ℤ) ⟶
      CommRingCat.of (AdjoinRoot (UniversalMonic.polynomial n)) :=
  CommRingCat.ofHom (algebraMap _ _)

/-- **D2.** The index of the integral family. -/
inductive BasicIntegralGeneratorIndex
  | kernel
  | monicRoot (n : PositiveDegree)

/-- **D2.** The integral generators. -/
noncomputable def basicGenHom : (j : BasicIntegralGeneratorIndex) → (match j with
    | .kernel => CommRingCat.of (Polynomial ℤ)
    | .monicRoot n => CommRingCat.of (MvPolynomial (Fin n.1) ℤ)) ⟶ (match j with
    | .kernel => CommRingCat.of ℤ
    | .monicRoot n => CommRingCat.of (AdjoinRoot (UniversalMonic.polynomial n)))
  | .kernel => kernelGenerator
  | .monicRoot n => universalMonicRootGenerator n

/-- **D2.** The integral family. -/
noncomputable def basicIntegralGenerators : MorphismProperty CommRingCat.{0} :=
  .ofHoms basicGenHom

theorem basicIntegralGenerators_le_integral : basicIntegralGenerators ≤ integral.{0} := sorry

/-- **D2.** The root generators of degree `≥ 2` are not epimorphisms, so the codiagonal augmentation
is required for this system; the degree-one one is an isomorphism. -/
theorem not_epi_universalMonicRootGenerator (n : PositiveDegree) (hn : 2 ≤ n.1) :
    ¬ Epi (universalMonicRootGenerator n) :=
  sorry

/-- **D3.** The right orthogonal of the integral family is the integrally closed extensions. -/
theorem rightOrthogonal_basicIntegralGenerators_eq :
    basicIntegralGenerators.rightOrthogonal = integrallyClosed.{0} :=
  sorry

/-- **D3. The integral system.** -/
theorem integralIntegrallyClosedFactorizationSystem :
    IsOrthogonalFactorizationSystem integral.{0} integrallyClosed.{0} :=
  sorry

/-- **D3.** The right class is stable under filtered colimits. -/
instance integrallyClosed_isStableUnderFilteredColimitsOfShape (J : Type w) [Category.{v} J]
    [EssentiallySmall.{0} J] [IsFiltered J] :
    integrallyClosed.{0}.IsStableUnderColimitsOfShape J :=
  sorry

/-- **D3.** The cellular description of the integral maps. -/
theorem integral_eq_cellular :
    integral.{0} = cellular.{0} (orthogonalGenerators basicIntegralGenerators) :=
  sorry

/-- **D3.** Every quotient map is one cell attachment along the kernel generator, with no finiteness
hypothesis on the ideal. -/
theorem exists_isPushout_coproduct_kernelGenerator (A : Type) [CommRing A] (I : Ideal A) :
    ∃ (e : ∐ (fun _ : I ↦ CommRingCat.of (Polynomial ℤ)) ⟶ CommRingCat.of A)
      (d : ∐ (fun _ : I ↦ CommRingCat.of ℤ) ⟶ CommRingCat.of (A ⧸ I)),
      IsPushout e (Limits.Sigma.map fun _ : I ↦ kernelGenerator)
        (CommRingCat.ofHom (Ideal.Quotient.mk I)) d :=
  sorry

/-- **D3.** The local objects of the integral system are trivial: only the zero ring is integrally
closed in the zero ring. -/
theorem localObjects_integrallyClosed_iff (A : Type u) [CommRing A] :
    localObjects integrallyClosed.{u} (CommRingCat.of A) ↔ Subsingleton A :=
  sorry

end CommRingCat.MorphismProperty

/-! ## Milestone E — Absolute flatness -/

/-- **E1.** Von Neumann regular rings: `a = a²b` for some `b`. -/
class IsVonNeumannRegularRing (A : Type u) [CommRing A] : Prop where
  /-- Every element is a multiple of its square. -/
  exists_mul_self_mul : ∀ a : A, ∃ b, a = a * a * b

section E1

variable (A : Type u) [CommRing A]

/-- **E1.** Every element has a regular decomposition: an idempotent `e` with `a e = 0` and `a` a
unit modulo `e`. -/
theorem isVonNeumannRegularRing_iff_exists_idempotent :
    IsVonNeumannRegularRing A ↔
      ∀ a : A, ∃ e : A, IsIdempotentElem e ∧ a * e = 0 ∧
        IsUnit (Ideal.Quotient.mk (Ideal.span {e}) a) :=
  sorry

/-- **E1.** All modules in the ring's universe are flat. -/
theorem isVonNeumannRegularRing_iff_forall_flat :
    IsVonNeumannRegularRing A ↔
      ∀ (M : Type u) [AddCommGroup M] [Module A M], Module.Flat A M :=
  sorry

/-- **E1.** Reduced of Krull dimension zero. -/
theorem isVonNeumannRegularRing_iff_isReduced_and_krullDimLE_zero :
    IsVonNeumannRegularRing A ↔ IsReduced A ∧ Ring.KrullDimLE 0 A :=
  sorry

/-- **E1.** Reduced with Hausdorff spectrum. -/
theorem isVonNeumannRegularRing_iff_isReduced_and_t2Space :
    IsVonNeumannRegularRing A ↔ IsReduced A ∧ T2Space (PrimeSpectrum A) :=
  sorry

/-- **E1.** Every localization at a prime is a field. -/
theorem isVonNeumannRegularRing_iff_forall_isField_localization_atPrime :
    IsVonNeumannRegularRing A ↔
      ∀ (p : Ideal A) [p.IsPrime], IsField (Localization.AtPrime p) :=
  sorry

instance IsVonNeumannRegularRing.of_field (K : Type u) [Field K] : IsVonNeumannRegularRing K :=
  sorry

instance IsVonNeumannRegularRing.instPi {ι : Type*} (B : ι → Type u) [∀ i, CommRing (B i)]
    [∀ i, IsVonNeumannRegularRing (B i)] : IsVonNeumannRegularRing (∀ i, B i) :=
  sorry

instance IsVonNeumannRegularRing.instQuotient [IsVonNeumannRegularRing A] (I : Ideal A) :
    IsVonNeumannRegularRing (A ⧸ I) :=
  sorry

instance IsVonNeumannRegularRing.instLocalization [IsVonNeumannRegularRing A] (M : Submonoid A) :
    IsVonNeumannRegularRing (Localization M) :=
  sorry

/-- **E1.** A von Neumann regular domain is a field. -/
theorem IsVonNeumannRegularRing.isField_iff_isDomain [IsVonNeumannRegularRing A] :
    IsField A ↔ IsDomain A :=
  sorry

/-- **E1.** Finitely generated ideals are generated by an idempotent. -/
theorem Ideal.FG.exists_isIdempotentElem_span_eq [IsVonNeumannRegularRing A] (I : Ideal A)
    (hI : I.FG) : ∃ e : A, IsIdempotentElem e ∧ I = Ideal.span {e} :=
  sorry

end E1

namespace CommRingCat.VonNeumannRegular

/-- **E2.** `ℤ[x, x⁻¹]`. -/
abbrev intLaurent : Type := Localization.Away (Polynomial.X : Polynomial ℤ)

/-- **E2.** The absolutely flat generator `w : ℤ[x] ⟶ ℤ × ℤ[x, x⁻¹]`, `x ↦ (0, x)`. -/
noncomputable def regularGeneratorHom : Polynomial ℤ →+* ℤ × intLaurent :=
  (Polynomial.evalRingHom 0).prod (algebraMap (Polynomial ℤ) intLaurent)

/-- **E2.** The generator in `CommRingCat.{0}`. -/
noncomputable def regularGenerator : CommRingCat.of (Polynomial ℤ) ⟶ CommRingCat.of (ℤ × intLaurent) :=
  CommRingCat.ofHom regularGeneratorHom

/-- **E2.** `w` is an epimorphism: `ℤ ⊗_{ℤ[x]} ℤ[x, x⁻¹] = 0`. -/
instance epi_regularGenerator : Epi regularGenerator := sorry

/-- **E2.** A cell attachment along `w` at `a : A` is `A ⟶ A/(a) × A[1/a]`. -/
theorem exists_isPushout_regularGenerator (A : Type) [CommRing A] (a : A) :
    ∃ g : CommRingCat.of (ℤ × intLaurent) ⟶ CommRingCat.of ((A ⧸ Ideal.span {a}) × Localization.Away a),
      IsPushout (CommRingCat.ofHom (Polynomial.aeval a).toRingHom) regularGenerator
        (CommRingCat.ofHom ((Ideal.Quotient.mk (Ideal.span {a})).prod
          (algebraMap A (Localization.Away a)))) g :=
  sorry

/-- **E2.** A regular decomposition of `a`. -/
def RegularDecomp {A : Type u} [CommRing A] (a : A) : Prop :=
  ∃ e : A, IsIdempotentElem e ∧ a * e = 0 ∧ IsUnit (Ideal.Quotient.mk (Ideal.span {e}) a)

/-- **E2.** Maps reflecting regular decompositions: the intrinsic right class. -/
def regularHom : MorphismProperty CommRingCat.{u} := fun _ _ f ↦
  ∀ a, RegularDecomp (f.hom a) → RegularDecomp a

/-- **E2.** Unique lifting against `w` is reflecting regular decompositions. -/
theorem hasUniqueLiftingProperty_regularGenerator_iff {A B : Type} [CommRing A] [CommRing B]
    (f : A →+* B) :
    HasUniqueLiftingProperty regularGenerator (CommRingCat.ofHom f) ↔
      regularHom (CommRingCat.ofHom f) :=
  sorry

/-- **E2.** The one-element family. -/
noncomputable def regularGenerators : MorphismProperty CommRingCat.{0} :=
  .ofHoms (fun _ : Unit ↦ regularGenerator)

theorem rightOrthogonal_regularGenerators_eq : regularGenerators.rightOrthogonal = regularHom.{0} :=
  sorry

/-- **E2.** The local objects, in every universe. -/
theorem regularHom_terminal_iff (A : Type u) [CommRing A] :
    regularHom (CommRingCat.punitIsTerminal.from (CommRingCat.of A)) ↔
      IsVonNeumannRegularRing A :=
  sorry

/-- **E3.** The small object argument on the *unaugmented* family. -/
instance regularGenerators_hasSmallObjectArgument :
    HasSmallObjectArgument.{0} regularGenerators :=
  sorry

/-- **E3.** The absolutely flat right class. -/
noncomputable def absFlatRight : MorphismProperty CommRingCat.{0} := regularGenerators.rightOrthogonal

/-- **E3.** The absolutely flat left class. -/
noncomputable def absFlatLeft : MorphismProperty CommRingCat.{0} := absFlatRight.leftOrthogonal

theorem absFlatRight_eq_regularHom : absFlatRight = regularHom.{0} := sorry

/-- **E3.** The cellular description, with no codiagonals since `w` is an epimorphism. -/
theorem absFlatLeft_eq_cellular : absFlatLeft = cellular.{0} regularGenerators := sorry

/-- **E3. The absolutely flat system.** -/
theorem absFlatOrthogonalFactorizationSystem :
    IsOrthogonalFactorizationSystem absFlatLeft absFlatRight :=
  sorry

/-- **E3.** The left class consists of epimorphisms (H5 of `OrthogonalFactorization`). -/
theorem absFlatLeft_le_epimorphisms : absFlatLeft ≤ epimorphisms CommRingCat.{0} := sorry

/-- **E3.** Olivier's universal absolutely flat ring, as the left factor of `A ⟶ 0`. -/
noncomputable def absFlatRing (A : Type) [CommRing A] : CommRingCat.{0} := sorry

/-- **E3.** The structure map `A ⟶ A^af`. -/
noncomputable def absFlatMap (A : Type) [CommRing A] : CommRingCat.of A ⟶ absFlatRing A := sorry

instance (A : Type) [CommRing A] : IsVonNeumannRegularRing (absFlatRing A) := sorry

theorem absFlatLeft_absFlatMap (A : Type) [CommRing A] : absFlatLeft (absFlatMap A) := sorry

/-- **E3.** The universal property. -/
theorem absFlat_lift (A : Type) [CommRing A] {S : Type} [CommRing S] [IsVonNeumannRegularRing S]
    (φ : A →+* S) : ∃! l : absFlatRing A →+* S, l.comp (absFlatMap A).hom = φ :=
  sorry

/-- **E3.** Idempotence. -/
theorem isIso_absFlatMap_of_vonNeumannRegular (A : Type) [CommRing A]
    [IsVonNeumannRegularRing A] : IsIso (absFlatMap A) :=
  sorry

/-- **E3.** The local objects as an object property. -/
def IsAbsFlat : ObjectProperty CommRingCat.{0} := fun X ↦ IsVonNeumannRegularRing X

/-- **E3.** The reflection onto von Neumann regular rings. A `def`, instantiated by the caller. -/
@[instance_reducible]
noncomputable def reflective_isAbsFlat_ι : Reflective IsAbsFlat.ι := sorry

/-- **E3.** The local objects of the system are the von Neumann regular rings. -/
theorem isVonNeumannRegularRing_iff_localObjects (A : Type) [CommRing A] :
    IsVonNeumannRegularRing A ↔ absFlatRight.localObjects (CommRingCat.of A) :=
  sorry

/-- **E3.** Filtered colimits of von Neumann regular rings are von Neumann regular, read off from
J1 of `OrthogonalFactorization`. -/
theorem isVonNeumannRegularRing_of_isColimit {J : Type w} [Category.{v} J]
    [EssentiallySmall.{0} J] [IsFiltered J] {F : J ⥤ CommRingCat.{0}} {c : Cocone F}
    (hc : IsColimit c) (h : ∀ j, IsVonNeumannRegularRing (F.obj j)) :
    IsVonNeumannRegularRing c.pt :=
  sorry

/-- **E3.** Base change of the reflection along a map to a local object is an isomorphism. -/
theorem isIso_absFlatBaseChange (A K : Type) [CommRing A] [CommRing K] [Algebra A K]
    [IsVonNeumannRegularRing K] :
    letI : Algebra A (absFlatRing A) := (absFlatMap A).hom.toAlgebra
    Function.Bijective (Algebra.TensorProduct.includeLeftRingHom : K →+* K ⊗[A] absFlatRing A) :=
  sorry

/-- **E4.** `Spec A^af ⟶ Spec A` is a bijection. -/
theorem bijective_comap_absFlatMap (A : Type) [CommRing A] :
    Function.Bijective (PrimeSpectrum.comap (absFlatMap A).hom) :=
  sorry

/-- **E4.** The residue field of `A^af` at the prime over `p` is the residue field of `A` at `p`. -/
noncomputable def residueFieldAtEquiv (A : Type) [CommRing A] (p : Ideal A) [p.IsPrime]
    {q : Ideal (absFlatRing A)} [q.IsPrime] (hq : q.comap (absFlatMap A).hom = p) :
    FractionRing (A ⧸ p) ≃+* absFlatRing A ⧸ q :=
  sorry

/-- **E4.** `Spec A^af` is `Spec A` with the constructible topology. -/
noncomputable def homeomorphConstructibleComapAbsFlatMap (A : Type) [CommRing A] :
    PrimeSpectrum (absFlatRing A) ≃ₜ WithConstructibleTopology (PrimeSpectrum A) :=
  sorry

end CommRingCat.VonNeumannRegular

namespace IsVonNeumannRegularRing

variable (V : Type u) [CommRing V] [IsVonNeumannRegularRing V]

instance t2Space : T2Space (PrimeSpectrum V) := sorry

instance totallySeparatedSpace : TotallySeparatedSpace (PrimeSpectrum V) := sorry

/-- **E4.** The spectrum of a von Neumann regular ring is profinite. -/
def profinite : Profinite.{u} := Profinite.of (PrimeSpectrum V)

/-- **E4.** The clopens of the spectrum are the idempotents (Mathlib's
`isIdempotentElemEquivClopens`, specialized). -/
noncomputable def idempotentEquivClopens :
    {e : V // IsIdempotentElem e} ≃o TopologicalSpace.Clopens (PrimeSpectrum V) :=
  PrimeSpectrum.isIdempotentElemEquivClopens (R := V)

/-- **E4.** `Spec` as a contravariant functor from von Neumann regular rings to profinite spaces. -/
noncomputable def specProfinite :
    CommRingCat.VonNeumannRegular.IsAbsFlat.FullSubcategoryᵒᵖ ⥤ Profinite.{0} :=
  sorry

/-- **E4.** A map of von Neumann regular rings bijective on idempotents is a homeomorphism on
spectra; with C2, maps in `zariskiRight` between such rings are homeomorphisms on spectra. -/
theorem isHomeomorph_comap_of_bijective_idempotent {W : Type u} [CommRing W]
    [IsVonNeumannRegularRing W] (φ : V →+* W)
    (h : Function.Bijective (fun e : {e : V // IsIdempotentElem e} ↦
      (⟨φ e, e.2.map φ⟩ : {e : W // IsIdempotentElem e}))) :
    IsHomeomorph (PrimeSpectrum.comap φ) :=
  sorry

end IsVonNeumannRegularRing

/-- **E4.** The spectrum of a product of fields is the Stone–Čech compactification of the index
set. -/
noncomputable def PrimeSpectrum.piFieldHomeoUltrafilter {ι : Type u} (k : ι → Type u)
    [∀ i, Field (k i)] : PrimeSpectrum (∀ i, k i) ≃ₜ Ultrafilter ι :=
  sorry

/-! ## Milestone C5 — The Zariski factor of the absolutely flat reflection, and w-local rings -/

/-- **C5.** The closed points of a prime spectrum. -/
def PrimeSpectrum.closedPoints (A : Type u) [CommRing A] : Set (PrimeSpectrum A) :=
  {x | IsClosed ({x} : Set (PrimeSpectrum A))}

/-- **C5.** Bhatt–Scholze's w-local rings: closed points form a closed set, and every connected
component contains exactly one closed point. -/
class IsWLocalRing (A : Type u) [CommRing A] : Prop where
  /-- The closed points form a closed set. -/
  isClosed_closedPoints : IsClosed (PrimeSpectrum.closedPoints A)
  /-- Every connected component contains exactly one closed point. -/
  existsUnique_closedPoint : ∀ x : PrimeSpectrum A,
    ∃! y, y ∈ connectedComponent x ∧ y ∈ PrimeSpectrum.closedPoints A

namespace CommRingCat.Zariski

open CommRingCat.VonNeumannRegular

/-- **C5.** A ring is w-local exactly when it has a map in the Zariski right class to a von Neumann
regular ring. -/
theorem isWLocalRing_iff_exists_zariskiRight_isVonNeumannRegularRing (R : Type) [CommRing R] :
    IsWLocalRing R ↔ ∃ (V : Type) (_ : CommRing V) (_ : IsVonNeumannRegularRing V) (r : R →+* V),
      zariskiRight (CommRingCat.ofHom r) :=
  sorry

/-- **C5.** A map in the Zariski right class into a von Neumann regular ring has the Jacobson
radical as kernel. -/
theorem ker_eq_jacobson_bot_of_zariskiRight {R V : Type} [CommRing R] [CommRing V]
    [IsVonNeumannRegularRing V] (r : R →+* V) (hr : zariskiRight (CommRingCat.ofHom r)) :
    RingHom.ker r = Ideal.jacobson (⊥ : Ideal R) :=
  sorry

/-- **C5.** Bhatt–Scholze's `A^Z`: the middle object of the Zariski factorization of `A ⟶ A^af`. -/
noncomputable def zLocalization (A : Type) [CommRing A] : CommRingCat.{0} := sorry

variable (A : Type) [CommRing A]

/-- **C5.** `A ⟶ A^Z`. -/
noncomputable def zLocalizationMap : CommRingCat.of A ⟶ zLocalization A := sorry

/-- **C5.** `A^Z ⟶ A^af`. -/
noncomputable def zLocalizationProj : zLocalization A ⟶ absFlatRing A := sorry

theorem zLocalizationMap_comp_proj : zLocalizationMap A ≫ zLocalizationProj A = absFlatMap A :=
  sorry

theorem zariskiLeft_zLocalizationMap : zariskiLeft (zLocalizationMap A) := sorry

theorem zariskiRight_zLocalizationProj : zariskiRight (zLocalizationProj A) := sorry

/-- **C5.** `A^Z ⟶ A^af` is surjective with kernel the Jacobson radical: `A^af = A^Z / J(A^Z)`. -/
theorem surjective_zLocalizationProj : Function.Surjective (zLocalizationProj A).hom := sorry

theorem ker_zLocalizationProj :
    RingHom.ker (zLocalizationProj A).hom = Ideal.jacobson (⊥ : Ideal (zLocalization A)) :=
  sorry

/-- **C5.** The connected components of `Spec A^Z` are the points of `Spec A^af`, and the closed
points of `Spec A^Z` are a closed subset homeomorphic to it. -/
noncomputable def connectedComponentsZLocalizationEquiv :
    _root_.ConnectedComponents (PrimeSpectrum (zLocalization A)) ≃ₜ
      PrimeSpectrum (absFlatRing A) :=
  sorry

/-- **C5.** `A^Z` is w-local. -/
theorem isWLocalRing_zLocalization : IsWLocalRing (zLocalization A) := sorry

/-- **C5.** `Spec A^Z ⟶ Spec A` is surjective. -/
theorem surjective_comap_zLocalizationMap :
    Function.Surjective (PrimeSpectrum.comap (zLocalizationMap A).hom) :=
  sorry

/-- **C5.** `A ⟶ A^Z` is faithfully flat, as an ind-Zariski localization (C4). -/
theorem faithfullyFlat_zLocalizationMap : RingHom.FaithfullyFlat (zLocalizationMap A).hom := sorry

end CommRingCat.Zariski

/-! ## Milestone F — Weak normalization and seminormalization -/

/-- **F1.** Seminormal rings (Stacks 0EUL): `x³ = y²` has a *unique* solution `x = a²`, `y = a³`. -/
class IsSeminormalRing (A : Type u) [CommRing A] : Prop where
  /-- Unique square-cube lifting. -/
  existsUnique_of_cube_eq_sq : ∀ x y : A, x ^ 3 = y ^ 2 → ∃! a : A, x = a ^ 2 ∧ y = a ^ 3

/-- **F1.** Absolutely weakly normal rings (Stacks 0EUL): seminormal, and for every prime `p`,
`pᵖ x = yᵖ` has a unique solution `x = aᵖ`, `y = p a`. -/
class IsAbsolutelyWeaklyNormalRing (A : Type u) [CommRing A] : Prop
    extends IsSeminormalRing A where
  /-- Unique `p`-th power lifting. -/
  existsUnique_of_pth : ∀ p : ℕ, p.Prime → ∀ x y : A,
    (p : A) ^ p * x = y ^ p → ∃! a : A, x = a ^ p ∧ y = (p : A) * a

instance IsSeminormalRing.isReduced (A : Type u) [CommRing A] [IsSeminormalRing A] : IsReduced A :=
  sorry

/-- **F1.** A normal domain is seminormal. -/
theorem IsSeminormalRing.of_isIntegrallyClosed (R : Type u) [CommRing R] [IsDomain R]
    [IsIntegrallyClosed R] : IsSeminormalRing R :=
  sorry

/-- **F1.** A seminormal `ℚ`-algebra is absolutely weakly normal. -/
instance isAbsolutelyWeaklyNormalRing_of_algebra_rat (A : Type u) [CommRing A] [Algebra ℚ A]
    [IsSeminormalRing A] : IsAbsolutelyWeaklyNormalRing A :=
  sorry

/-- **F1.** A field is absolutely weakly normal exactly when it is perfect. -/
theorem isAbsolutelyWeaklyNormalRing_iff_perfectField (K : Type u) [Field K] :
    IsAbsolutelyWeaklyNormalRing K ↔ PerfectField K :=
  sorry

section F2

variable {A B : Type u} [CommRing A] [CommRing B]

/-- **F2.** Universally injective, in the field-valued-point form (Stacks 01S4). -/
def RingHom.UniversallyInjective (f : A →+* B) : Prop :=
  ∀ (K : Type u) [Field K], Function.Injective fun g : B →+* K ↦ g.comp f

/-- **F2.** Residue isomorphism: every field-valued point of `B` is generated by its restriction
to `A`. -/
def RingHom.ResidueIso (f : A →+* B) : Prop :=
  ∀ (K : Type u) [Field K] (g : B →+* K),
    Set.range (g : B → K) ⊆ Subfield.closure (Set.range ((g.comp f : A →+* K) : A → K))

/-- **F2.** `ResidueIso` is bijectivity of every residue field map. -/
theorem RingHom.residueIso_iff_surjective_residueFieldMap {f : A →+* B} :
    RingHom.ResidueIso f ↔
      ∀ (q : Ideal B) [q.IsPrime], Function.Surjective (Ideal.ResidueField.map (q.comap f) q f rfl) :=
  sorry

/-- **F2.** Universally injective maps have purely inseparable residue extensions (Stacks 01S4). -/
theorem RingHom.UniversallyInjective.isPurelyInseparable_residueField {f : A →+* B}
    (hf : RingHom.UniversallyInjective f) (q : Ideal B) [q.IsPrime] :
    letI := (Ideal.ResidueField.map (q.comap f) q f rfl).toAlgebra
    IsPurelyInseparable (q.comap f).ResidueField q.ResidueField :=
  sorry

end F2

namespace CommRingCat.WeakNormalization

/-- **F2.** Universal homeomorphisms of rings (Stacks 0CNE): integral, universally injective,
surjective on spectra. -/
def univHomeo : MorphismProperty CommRingCat.{u} := fun _ _ f ↦
  RingHom.IsIntegral f.hom ∧ RingHom.UniversallyInjective f.hom ∧
    Function.Surjective (PrimeSpectrum.comap f.hom)

/-- **F2.** Residue isomorphisms, as a morphism property. -/
def residueIso : MorphismProperty CommRingCat.{u} := fun _ _ f ↦ RingHom.ResidueIso f.hom

instance univHomeo_isStableUnderCobaseChange : univHomeo.{u}.IsStableUnderCobaseChange := sorry

instance univHomeo_isStableUnderFilteredColimits :
    IsStableUnderFilteredColimits.{u, u} univHomeo.{u} := sorry

instance univHomeo_isStableUnderTransfiniteComposition :
    univHomeo.{u}.IsStableUnderTransfiniteComposition.{u} := sorry

/-- **F2.** A surjection with nilpotent kernel is a universal homeomorphism (Stacks 0BR6). -/
theorem univHomeo_of_surjective_of_isNilpotent_ker {X Y : CommRingCat.{u}} (f : X ⟶ Y)
    (hf : Function.Surjective f.hom) (hker : ∀ x ∈ RingHom.ker f.hom, IsNilpotent x) :
    univHomeo f :=
  sorry

theorem univHomeo_le_integral : univHomeo.{u} ≤ CommRingCat.MorphismProperty.integral.{u} := sorry

/-- **F3.** The cusp relation `x³ − y²`. -/
noncomputable def cuspRelation : MvPolynomial (Fin 2) ℤ :=
  MvPolynomial.X 0 ^ 3 - MvPolynomial.X 1 ^ 2

/-- **F3.** The cusp `ℤ[x, y]/(x³ − y²)`. -/
noncomputable abbrev cuspSource : CommRingCat.{0} :=
  CommRingCat.of (MvPolynomial (Fin 2) ℤ ⧸ Ideal.span {cuspRelation})

/-- **F3.** The cusp generator, `x ↦ t²`, `y ↦ t³`. -/
noncomputable def cuspGenerator : cuspSource ⟶ CommRingCat.of (Polynomial ℤ) :=
  CommRingCat.ofHom <| Ideal.Quotient.lift (Ideal.span {cuspRelation})
    (MvPolynomial.eval₂Hom (Int.castRingHom (Polynomial ℤ)) ![Polynomial.X ^ 2, Polynomial.X ^ 3])
    sorry

/-- **F3.** The `p`-th power relation `pᵖ x − yᵖ`. -/
noncomputable def pthRelation (p : ℕ) : MvPolynomial (Fin 2) ℤ :=
  (p : MvPolynomial (Fin 2) ℤ) ^ p * MvPolynomial.X 0 - MvPolynomial.X 1 ^ p

/-- **F3.** `ℤ[x, y]/(pᵖ x − yᵖ)`. -/
noncomputable abbrev pthSource (p : ℕ) : CommRingCat.{0} :=
  CommRingCat.of (MvPolynomial (Fin 2) ℤ ⧸ Ideal.span {pthRelation p})

/-- **F3.** The `p`-th power generator, `x ↦ tᵖ`, `y ↦ p t`. -/
noncomputable def pthGenerator (p : ℕ) : pthSource p ⟶ CommRingCat.of (Polynomial ℤ) :=
  CommRingCat.ofHom <| Ideal.Quotient.lift (Ideal.span {pthRelation p})
    (MvPolynomial.eval₂Hom (Int.castRingHom (Polynomial ℤ))
      ![Polynomial.X ^ p, (p : Polynomial ℤ) * Polynomial.X])
    sorry

/-- **F3.** The index of the absolute family: the cusp and one `p`-th power generator per prime. -/
inductive AwnGeneratorIndex
  | cusp
  | pth (p : Nat.Primes)

/-- **F3.** The absolute weak normalization generators. -/
noncomputable def awnGenHom : (j : AwnGeneratorIndex) → (match j with
    | .cusp => cuspSource
    | .pth p => pthSource p) ⟶ CommRingCat.of (Polynomial ℤ)
  | .cusp => cuspGenerator
  | .pth p => pthGenerator p

/-- **F3.** The absolute family. -/
noncomputable def awnGenerators : MorphismProperty CommRingCat.{0} := .ofHoms awnGenHom

/-- **F3.** The seminormal family: the cusp alone. -/
noncomputable def snGenerators : MorphismProperty CommRingCat.{0} :=
  .ofHoms (fun _ : Unit ↦ cuspGenerator)

/-- **F3.** Both generators are universal homeomorphisms. -/
theorem awnGenerators_le_univHomeo : awnGenerators ≤ univHomeo.{0} := sorry

/-- **F3.** The cusp is a residue isomorphism; the `p`-th power generator is not. -/
theorem cuspGenerator_residueIso : RingHom.ResidueIso cuspGenerator.hom := sorry

theorem not_residueIso_pthGenerator (p : ℕ) (hp : p.Prime) :
    ¬ RingHom.ResidueIso (pthGenerator p).hom := sorry

section RightClass

variable {A B : Type u} [CommRing A] [CommRing B]

/-- **F3.** Reflecting cusp data: a solution downstairs of `x³ = y²` lifts uniquely. -/
def _root_.RingHom.ReflectsCuspData (f : A →+* B) : Prop :=
  ∀ x y : A, x ^ 3 = y ^ 2 → ∀ b : B, f x = b ^ 2 → f y = b ^ 3 →
    ∃! a : A, x = a ^ 2 ∧ y = a ^ 3 ∧ f a = b

/-- **F3.** Reflecting `p`-th power data. -/
def _root_.RingHom.ReflectsPthData (p : ℕ) (f : A →+* B) : Prop :=
  ∀ x y : A, (p : A) ^ p * x = y ^ p → ∀ b : B, f x = b ^ p → f y = (p : B) * b →
    ∃! a : A, x = a ^ p ∧ y = (p : A) * a ∧ f a = b

end RightClass

/-- **F3.** Unique lifting against the cusp generator is reflecting cusp data. -/
theorem hasUniqueLiftingProperty_cuspGenerator_iff {B C : Type} [CommRing B] [CommRing C]
    (f : B →+* C) :
    HasUniqueLiftingProperty cuspGenerator (CommRingCat.ofHom f) ↔ f.ReflectsCuspData :=
  sorry

/-- **F3.** The intrinsic absolute right class. -/
def awnHom : MorphismProperty CommRingCat.{u} := fun _ _ f ↦
  f.hom.ReflectsCuspData ∧ ∀ p : ℕ, p.Prime → f.hom.ReflectsPthData p

/-- **F3.** The intrinsic seminormal right class. -/
def snHom : MorphismProperty CommRingCat.{u} := fun _ _ f ↦ f.hom.ReflectsCuspData

theorem rightOrthogonal_awnGenerators_eq : awnGenerators.rightOrthogonal = awnHom.{0} := sorry

theorem rightOrthogonal_snGenerators_eq : snGenerators.rightOrthogonal = snHom.{0} := sorry

/-- **F3.** The local objects, in every universe. -/
theorem awnHom_terminal_iff (A : Type u) [CommRing A] :
    awnHom (CommRingCat.punitIsTerminal.from (CommRingCat.of A)) ↔
      IsAbsolutelyWeaklyNormalRing A :=
  sorry

theorem snHom_terminal_iff (A : Type u) [CommRing A] :
    snHom (CommRingCat.punitIsTerminal.from (CommRingCat.of A)) ↔ IsSeminormalRing A :=
  sorry

/-- **F4.** The absolute classes. -/
noncomputable def awnRight : MorphismProperty CommRingCat.{0} := awnGenerators.rightOrthogonal

noncomputable def awnLeft : MorphismProperty CommRingCat.{0} := awnRight.leftOrthogonal

/-- **F4.** The seminormal classes. -/
noncomputable def snRight : MorphismProperty CommRingCat.{0} := snGenerators.rightOrthogonal

noncomputable def snLeft : MorphismProperty CommRingCat.{0} := snRight.leftOrthogonal

theorem awnRight_eq_awnHom : awnRight = awnHom.{0} := sorry

theorem snRight_eq_snHom : snRight = snHom.{0} := sorry

/-- **F4. The absolute weak normalization system.** -/
theorem awnOrthogonalFactorizationSystem : IsOrthogonalFactorizationSystem awnLeft awnRight :=
  sorry

/-- **F4. The seminormalization system.** -/
theorem snOrthogonalFactorizationSystem : IsOrthogonalFactorizationSystem snLeft snRight :=
  sorry

/-- **F4.** The absolute weak normalization `A^awn`, as the left factor of `A ⟶ 0`. -/
noncomputable def awnRing (A : Type) [CommRing A] : CommRingCat.{0} := sorry

/-- **F4.** The seminormalization `A^sn`. -/
noncomputable def snRing (A : Type) [CommRing A] : CommRingCat.{0} := sorry

variable (A : Type) [CommRing A]

noncomputable def awnMap : CommRingCat.of A ⟶ awnRing A := sorry

instance : IsAbsolutelyWeaklyNormalRing (awnRing A) := sorry

/-- **F4.** The universal property (Stacks 0EUR). -/
theorem awn_lift {S : Type} [CommRing S] [IsAbsolutelyWeaklyNormalRing S] (φ : A →+* S) :
    ∃! l : awnRing A →+* S, l.comp (awnMap A).hom = φ :=
  sorry

theorem isIso_awnMap_of_absolutelyWeaklyNormal [IsAbsolutelyWeaklyNormalRing A] :
    IsIso (awnMap A) :=
  sorry

noncomputable def snMap : CommRingCat.of A ⟶ snRing A := sorry

instance : IsSeminormalRing (snRing A) := sorry

theorem sn_lift {S : Type} [CommRing S] [IsSeminormalRing S] (φ : A →+* S) :
    ∃! l : snRing A →+* S, l.comp (snMap A).hom = φ :=
  sorry

/-- **F4.** The local objects as object properties, and the reflections. -/
def IsAwn : ObjectProperty CommRingCat.{0} := fun X ↦ IsAbsolutelyWeaklyNormalRing X

def IsSn : ObjectProperty CommRingCat.{0} := fun X ↦ IsSeminormalRing X

@[instance_reducible]
noncomputable def reflective_isAwn_ι : Reflective IsAwn.ι := sorry

@[instance_reducible]
noncomputable def reflective_isSn_ι : Reflective IsSn.ι := sorry

/-- **F4.** Both reflections kill the nilradical. -/
theorem awnMap_factors_reduced {x : A} (hx : IsNilpotent x) : (awnMap A).hom x = 0 := sorry

/-- **F4.** By antitonicity from `snGenerators ≤ awnGenerators`. -/
theorem snLeft_le_awnLeft : snLeft ≤ awnLeft := sorry

theorem awnRight_le_snRight : awnRight ≤ snRight := sorry

/-- **F5. The cusp step.** For `f : A ⟶ B` injective with `B` generated over `A` by `b` and
`f x = b²`, `f y = b³`, the map is in the absolute left class. Two fillers of a square differ by an
element with zero cube, which the right class kills. -/
theorem awnLeft_of_cusp_step {A B : CommRingCat.{0}} {f : A ⟶ B} (b : B) (x y : A)
    (hinj : Function.Injective f.hom)
    (hsurj : Function.Surjective (Polynomial.eval₂RingHom f.hom b))
    (hbx : f.hom x = b ^ 2) (hby : f.hom y = b ^ 3) : awnLeft f :=
  sorry

/-- **F5. The `p`-th power step.** -/
theorem awnLeft_of_pth_step {A B : CommRingCat.{0}} {f : A ⟶ B} {p : ℕ} (hp : p.Prime) (b : B)
    (x y : A) (hinj : Function.Injective f.hom)
    (hsurj : Function.Surjective (Polynomial.eval₂RingHom f.hom b))
    (hbx : f.hom x = b ^ p) (hby : f.hom y = (p : B) * b) : awnLeft f :=
  sorry

/-- **F5.** The cusp step lies in the seminormal left class. -/
theorem snLeft_of_cusp_step {A B : CommRingCat.{0}} {f : A ⟶ B} (b : B) (x y : A)
    (hinj : Function.Injective f.hom)
    (hsurj : Function.Surjective (Polynomial.eval₂RingHom f.hom b))
    (hbx : f.hom x = b ^ 2) (hby : f.hom y = b ^ 3) : snLeft f :=
  sorry

/-- **F5.** The elementary steps. -/
def elementaryStep : MorphismProperty CommRingCat.{0} := fun _ B f ↦
  Function.Injective f.hom ∧
    ∃ b : B, Function.Surjective (Polynomial.eval₂RingHom f.hom b) ∧
      ((∃ x y, f.hom x = b ^ 2 ∧ f.hom y = b ^ 3) ∨
        ∃ p : ℕ, p.Prime ∧ ∃ x y, f.hom x = b ^ p ∧ f.hom y = (p : B) * b)

theorem elementaryStep_le_awnLeft : elementaryStep ≤ awnLeft := sorry

/-- **F6. Stacks 0CNA.** Two consecutive powers in `A` produce a power with square and cube in `A`. -/
theorem exists_sq_cube_mem_of_pow_pow_mem {A B : Type u} [CommRing A] [CommRing B] [Algebra A B]
    {b : B} (hb : b ∉ (⊥ : Subalgebra A B)) {n : ℕ} (hn : 2 ≤ n)
    (hbn : b ^ n ∈ (⊥ : Subalgebra A B)) (hbn1 : b ^ (n + 1) ∈ (⊥ : Subalgebra A B)) :
    ∃ b' : B, b' ∉ (⊥ : Subalgebra A B) ∧ b' ^ 2 ∈ (⊥ : Subalgebra A B) ∧
      b' ^ 3 ∈ (⊥ : Subalgebra A B) :=
  sorry

/-- **F6. Stacks 0CNC.** A finite universal homeomorphism that is not an isomorphism admits an
elementary step. -/
theorem exists_elementary_of_univHomeo {A B : Type u} [CommRing A] [CommRing B] [Algebra A B]
    [Module.Finite A B] (huinj : RingHom.UniversallyInjective (algebraMap A B))
    (hne : (⊥ : Subalgebra A B) ≠ ⊤) :
    ∃ b : B, b ∉ (⊥ : Subalgebra A B) ∧
      ((b ^ 2 ∈ (⊥ : Subalgebra A B) ∧ b ^ 3 ∈ (⊥ : Subalgebra A B)) ∨
        ∃ q : ℕ, q.Prime ∧ b ^ q ∈ (⊥ : Subalgebra A B) ∧ (q : B) * b ∈ (⊥ : Subalgebra A B)) :=
  sorry

/-- **F6. Stacks 0CNB.** Under a residue isomorphism the step is a cusp step. -/
theorem exists_cusp_of_univHomeo_residueIso {A B : Type u} [CommRing A] [CommRing B] [Algebra A B]
    [Module.Finite A B] (huinj : RingHom.UniversallyInjective (algebraMap A B))
    (hresidue : RingHom.ResidueIso (algebraMap A B)) (hne : (⊥ : Subalgebra A B) ≠ ⊤) :
    ∃ b : B, b ∉ (⊥ : Subalgebra A B) ∧ b ^ 2 ∈ (⊥ : Subalgebra A B) ∧
      b ^ 3 ∈ (⊥ : Subalgebra A B) :=
  sorry

/-- **F6. The absolute weak normalization theorem (Stacks 0CNE).** The absolute left class is the
class of universal homeomorphisms. `≤` is the cellular peel against F2's closure properties; `≥` is
Zorn's lemma over subalgebras, with F5 at successor steps and closure of the left class under
directed unions at limit steps. -/
theorem awnLeft_eq_univHomeo : awnLeft = univHomeo.{0} := sorry

/-- **F6. Stacks 0CND.** The seminormal left class is the universal homeomorphisms inducing
isomorphisms on residue fields. -/
theorem snLeft_eq_univHomeo_residueIso : snLeft = univHomeo.{0} ⊓ residueIso.{0} := sorry

/-- **F6. Stacks 0H3H.** -/
theorem univHomeo_inf_awnRight_eq_isomorphisms :
    univHomeo.{0} ⊓ awnRight = isomorphisms CommRingCat.{0} := sorry

/-- **F6.** The reflections are universal homeomorphisms. -/
theorem univHomeo_awnMap : univHomeo.{0} (awnMap A) := sorry

theorem univHomeo_residueIso_snMap : univHomeo.{0} (snMap A) ∧ residueIso.{0} (snMap A) := sorry

/-- **F6. Stacks 0EUR(1).** `A ⟶ A^awn` is terminal among universal homeomorphisms out of `A`. -/
theorem awnMap_final_among_univHomeo {B : CommRingCat.{0}} (f : CommRingCat.of A ⟶ B)
    (hf : univHomeo.{0} f) : ∃! g : B ⟶ awnRing A, f ≫ g = awnMap A :=
  sorry

/-- **F6.** The two systems differ, separated by the `p`-th power generator and by `𝔽_p(s)`. -/
theorem snLeft_lt_awnLeft : snLeft < awnLeft := sorry

theorem awnRight_lt_snRight : awnRight < snRight := sorry

theorem awnLeft_lt_integral : awnLeft < CommRingCat.MorphismProperty.integral.{0} := sorry

section F7

variable {A B : Type u} [CommRing A] [CommRing B] [Algebra A B]

/-- **F7.** Dominant maps: kernel inside the nilradical, i.e. dense image on spectra. -/
def _root_.RingHom.IsDominant (f : A →+* B) : Prop := RingHom.ker f ≤ nilradical A

theorem _root_.RingHom.isDominant_iff_denseRange_comap {f : A →+* B} :
    RingHom.IsDominant f ↔ DenseRange (PrimeSpectrum.comap f) :=
  sorry

/-- **F7.** The weak normalization of `A` in `B` (Stacks 0H3J): the subalgebra generated by all
subalgebras `C` with `A ⟶ C` a universal homeomorphism. -/
def univHomeoSubalgebra (A B : Type u) [CommRing A] [CommRing B] [Algebra A B] : Subalgebra A B :=
  Algebra.adjoin A {b : B | ∃ C : Subalgebra A B,
    univHomeo (CommRingCat.ofHom (algebraMap A C)) ∧ b ∈ C}

/-- **F7.** Maximality needs no dominance. -/
theorem le_univHomeoSubalgebra {C : Subalgebra A B}
    (hC : univHomeo (CommRingCat.ofHom (algebraMap A C))) : C ≤ univHomeoSubalgebra A B :=
  sorry

/-- **F7.** For a dominant map, `A ⟶ B'` is itself a universal homeomorphism. -/
theorem univHomeo_toUnivHomeoSubalgebra (hd : RingHom.IsDominant (algebraMap A B)) :
    univHomeo (CommRingCat.ofHom (algebraMap A (univHomeoSubalgebra A B))) :=
  sorry

/-- **F7. Stacks 0H3K.** The weak normalization commutes with localization. -/
theorem localizedUnivHomeoSubalgebra_eq_univHomeoSubalgebra {Aₘ Bₘ : Type u} [CommRing Aₘ]
    [CommRing Bₘ] [Algebra A Aₘ] [Algebra A Bₘ] [Algebra B Bₘ] [Algebra Aₘ Bₘ]
    [IsScalarTower A B Bₘ] [IsScalarTower A Aₘ Bₘ] (M : Submonoid A) [IsLocalization M Aₘ]
    [IsLocalization (Algebra.algebraMapSubmonoid B M) Bₘ]
    (hd : RingHom.IsDominant (algebraMap A B)) :
    Algebra.adjoin Aₘ (algebraMap B Bₘ '' (univHomeoSubalgebra A B : Set B)) =
      univHomeoSubalgebra Aₘ Bₘ :=
  sorry

end F7

/-- **F7.** For a dominant map the middle object of the absolute factorization is `B'`. -/
theorem awnFactorization_eq_univHomeoSubalgebra {A B : Type} [CommRing A] [CommRing B]
    [Algebra A B] (hd : RingHom.IsDominant (algebraMap A B))
    (fac : awnLeft.MapFactorizationData awnRight (CommRingCat.ofHom (algebraMap A B))) :
    ∃ e : fac.Z ≅ CommRingCat.of (univHomeoSubalgebra A B),
      fac.i ≫ e.hom = CommRingCat.ofHom (algebraMap A (univHomeoSubalgebra A B)) ∧
        e.hom ≫ CommRingCat.ofHom (univHomeoSubalgebra A B).val.toRingHom = fac.p :=
  sorry

end CommRingCat.WeakNormalization

/-! ## Milestone G — The monic system -/

namespace CommRingCat.MonicGenerators

/-- **G1.** The universal monic polynomial of degree `n`. -/
noncomputable def universalMonic (n : ℕ) : Polynomial (MvPolynomial (Fin n) ℤ) :=
  X ^ n + ∑ i : Fin n, C (MvPolynomial.X i) * X ^ (i : ℕ)

/-- **G1.** The standard étale pair `(f, f')` for `f` the universal monic of degree `n`. -/
noncomputable def monicGeneratorPair (n : ℕ) : StandardEtalePair (MvPolynomial (Fin n) ℤ) where
  f := universalMonic n
  monic_f := sorry
  g := derivative (universalMonic n)
  cond := ⟨1, 0, 1, by ring⟩

/-- **G1.** The index of the monic family: the unit generator and one root generator per degree. -/
inductive Index
  | unit
  | root (n : ℕ)

/-- **G1.** The monic generators. -/
noncomputable def hom : (i : Index) → (match i with
    | .unit => CommRingCat.of (Polynomial ℤ)
    | .root n => CommRingCat.of (MvPolynomial (Fin n) ℤ)) ⟶ (match i with
    | .unit => CommRingCat.of (Localization.Away (Polynomial.X : Polynomial ℤ))
    | .root n => CommRingCat.of (monicGeneratorPair n).Ring)
  | .unit => Zariski.unitGenerator
  | .root n => CommRingCat.ofHom (algebraMap (MvPolynomial (Fin n) ℤ) (monicGeneratorPair n).Ring)

/-- **G1.** Every generator is étale. -/
theorem hom_etale (i : Index) : RingHom.Etale (hom i).hom := sorry

/-- **G1.** The monic family. -/
noncomputable def monicGenerators : MorphismProperty CommRingCat.{0} := .ofHoms hom

instance monicGenerators_hasSmallObjectArgument :
    HasSmallObjectArgument.{0} (orthogonalGenerators monicGenerators) := sorry

noncomputable def monicRight : MorphismProperty CommRingCat.{0} := monicGenerators.rightOrthogonal

noncomputable def monicLeft : MorphismProperty CommRingCat.{0} := monicRight.leftOrthogonal

/-- **G1. The monic system.** -/
theorem monicOrthogonalFactorizationSystem : IsOrthogonalFactorizationSystem monicLeft monicRight :=
  sorry

instance monicRight_isStableUnderFilteredColimitsOfShape (J : Type w) [Category.{v} J]
    [EssentiallySmall.{0} J] [IsFiltered J] : monicRight.IsStableUnderColimitsOfShape J :=
  sorry

theorem monicLeft_eq_cellular : monicLeft = cellular.{0} (orthogonalGenerators monicGenerators) :=
  sorry

/-- **G2.** A quotient map is in the right orthogonal of the monic family exactly when the pair is
Henselian in Mathlib's sense. -/
theorem henselianRing_iff_uniqueRLP_monicGenerators {R : Type} [CommRing R] (I : Ideal R) :
    HenselianRing R I ↔ monicGenerators.rightOrthogonal (CommRingCat.ofHom (Ideal.Quotient.mk I)) :=
  sorry

/-- **G2.** In a Henselian pair, simple roots lift *uniquely*; Mathlib supplies existence. -/
theorem _root_.HenselianRing.existsUnique_root {R : Type u} [CommRing R] {I : Ideal R}
    [HenselianRing R I] {f : R[X]} (hf : f.Monic) {a₀ : R} (h₁ : f.eval a₀ ∈ I)
    (h₂ : IsUnit (Ideal.Quotient.mk I (f.derivative.eval a₀))) :
    ∃! a : R, f.IsRoot a ∧ a - a₀ ∈ I :=
  sorry

/-- **G2. The pinning lemma.** A surjection is in `monicRight` exactly when its kernel makes a
Henselian pair. -/
theorem monicRight_iff_henselianRing_ker_of_surjective {R S : Type} [CommRing R] [CommRing S]
    (p : R →+* S) (hp : Function.Surjective p) :
    monicRight (CommRingCat.ofHom p) ↔ HenselianRing R (RingHom.ker p) :=
  sorry

/-- **G2.** Necessary conditions for an arbitrary map. The converse of the second fails without
surjectivity. -/
theorem isLocalHom_of_monicRight {R S : Type} [CommRing R] [CommRing S] (r : R →+* S)
    (h : monicRight (CommRingCat.ofHom r)) : IsLocalHom r :=
  sorry

theorem henselianRing_ker_of_monicRight {R S : Type} [CommRing R] [CommRing S] (r : R →+* S)
    (h : monicRight (CommRingCat.ofHom r)) : HenselianRing R (RingHom.ker r) :=
  sorry

/-- **G2.** A sufficient criterion: a local homomorphism along which simple roots of monic
polynomials lift uniquely. -/
theorem monicRight_of_isLocalHom_of_forall_root {R S : Type} [CommRing R] [CommRing S]
    (p : R →+* S) (hp : IsLocalHom p)
    (hroot : ∀ f : R[X], f.Monic → ∀ s : S, (f.map p).IsRoot s →
      IsUnit ((f.map p).derivative.eval s) → ∃! r : R, f.IsRoot r ∧ p r = s) :
    monicRight (CommRingCat.ofHom p) :=
  sorry

/-- **G3.** `δ` is a pushout of the degree-two root generator along `(a₀, a₁) ↦ (0, −1)`. -/
theorem exists_isPushout_idempotentGenerator :
    ∃ (s : CommRingCat.of (MvPolynomial (Fin 2) ℤ) ⟶ CommRingCat.of ℤ)
      (t : CommRingCat.of (monicGeneratorPair 2).Ring ⟶ CommRingCat.of (ℤ × ℤ)),
      IsPushout s (hom (.root 2)) Zariski.idempotentGenerator t :=
  sorry

theorem monicRight_le_zariskiRight : monicRight ≤ Zariski.zariskiRight := sorry

theorem zariskiLeft_le_monicLeft : Zariski.zariskiLeft ≤ monicLeft := sorry

/-- **G3.** The separating map `ℚ ⟶ ℚ(√2)`: in `monicLeft` and in `zariskiRight`, not an
isomorphism, hence in neither `monicRight` nor `zariskiLeft`. -/
theorem monicLeft_adjoinRoot_sub_two :
    monicLeft (CommRingCat.ofHom (algebraMap ℚ (AdjoinRoot (X ^ 2 - C (2 : ℚ))))) := sorry

theorem zariskiRight_adjoinRoot_sub_two :
    Zariski.zariskiRight (CommRingCat.ofHom (algebraMap ℚ (AdjoinRoot (X ^ 2 - C (2 : ℚ))))) :=
  sorry

theorem not_monicRight_adjoinRoot_sub_two :
    ¬ monicRight (CommRingCat.ofHom (algebraMap ℚ (AdjoinRoot (X ^ 2 - C (2 : ℚ))))) := sorry

theorem not_zariskiLeft_adjoinRoot_sub_two :
    ¬ Zariski.zariskiLeft (CommRingCat.ofHom (algebraMap ℚ (AdjoinRoot (X ^ 2 - C (2 : ℚ))))) :=
  sorry

theorem monicRight_lt_zariskiRight : monicRight < Zariski.zariskiRight := sorry

theorem zariskiLeft_lt_monicLeft : Zariski.zariskiLeft < monicLeft := sorry

end CommRingCat.MonicGenerators

/-! ## Milestone H — Examples, separations, and coverage (a selection) -/

namespace Examples

theorem Z.not_isVonNeumannRegularRing : ¬ IsVonNeumannRegularRing ℤ := sorry

theorem Z.not_isWLocalRing : ¬ IsWLocalRing ℤ := sorry

theorem Z6.isVonNeumannRegularRing : IsVonNeumannRegularRing (ZMod 6) := sorry

theorem Z4.not_isSeminormalRing : ¬ IsSeminormalRing (ZMod 4) := sorry

/-- **H1.** The cusp `k[x, y]/(y² − x³)` is reduced and not seminormal. -/
theorem Cusp.not_isSeminormalRing (k : Type u) [Field k] :
    ¬ IsSeminormalRing (Polynomial (Polynomial k) ⧸
      Ideal.span {(X ^ 2 - C (X ^ 3) : Polynomial (Polynomial k))}) :=
  sorry

/-- **H1.** The node `k[x, y]/(xy)` is seminormal. -/
theorem Node.isSeminormalRing (k : Type u) [Field k] :
    IsSeminormalRing (Polynomial (Polynomial k) ⧸
      Ideal.span {(X * C X : Polynomial (Polynomial k))}) :=
  sorry

/-- **H1.** `𝔽_p(s)` is seminormal and not absolutely weakly normal. -/
theorem Fpt.not_isAbsolutelyWeaklyNormalRing (p : ℕ) [Fact p.Prime] :
    ¬ IsAbsolutelyWeaklyNormalRing (RatFunc (ZMod p)) :=
  sorry

/-- **H1.** Locally constant functions on a profinite set with values in a field form a von Neumann
regular, w-local ring with spectrum the profinite set. -/
theorem LocallyConstantProfinite.isVonNeumannRegularRing (S : Profinite.{u}) (k : Type u)
    [Field k] : IsVonNeumannRegularRing (LocallyConstant S k) :=
  sorry

theorem LocallyConstantProfinite.isWLocalRing (S : Profinite.{u}) (k : Type u) [Field k] :
    IsWLocalRing (LocallyConstant S k) :=
  sorry

noncomputable def LocallyConstantProfinite.homeoPrimeSpectrum (S : Profinite.{u}) (k : Type u)
    [Field k] : PrimeSpectrum (LocallyConstant S k) ≃ₜ S :=
  sorry

/-- **H2.** Refutations with ground witnesses. -/
theorem not_integrallyClosed_gaussianInt :
    ¬ CommRingCat.MorphismProperty.integrallyClosed (CommRingCat.ofHom (Int.castRingHom GaussianInt)) :=
  sorry

theorem not_absFlatRight_int_rat :
    ¬ CommRingCat.VonNeumannRegular.absFlatRight (CommRingCat.ofHom (Int.castRingHom ℚ)) :=
  sorry

theorem not_univHomeo_kernelGenerator :
    ¬ CommRingCat.WeakNormalization.univHomeo CommRingCat.MorphismProperty.kernelGenerator :=
  sorry

/-- **H3.** Resolutions of inclusions not already stated above. -/
theorem univHomeo_lt_integral :
    CommRingCat.WeakNormalization.univHomeo.{u} < CommRingCat.MorphismProperty.integral.{u} :=
  sorry

theorem absFlatLeft_lt_epimorphisms :
    CommRingCat.VonNeumannRegular.absFlatLeft < epimorphisms CommRingCat.{0} :=
  sorry

theorem elementaryStep_lt_awnLeft :
    CommRingCat.WeakNormalization.elementaryStep < CommRingCat.WeakNormalization.awnLeft :=
  sorry

end Examples
