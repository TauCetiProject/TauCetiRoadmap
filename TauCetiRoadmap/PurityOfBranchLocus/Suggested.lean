import Mathlib
import TauCeti.RingTheory.RegularLocalRing.Basic

/-!
# Purity of the branch locus: suggested forms

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Every target is stated in Mathlib's vocabulary (README, Convention 2): the pointwise hypotheses
are stalkwise (`Scheme.Hom.QuasiFiniteAt`, formal unramifiedness of `Scheme.Hom.stalkMap`), and
"étale at `x`" is an open neighbourhood on which the restriction is `Etale`. The Stacks form of
Lemma 58.21.4 (0BMB), with Stacks' pointwise notions written out as in README Convention 3, is an
accompanying statement. Declarations with a Stacks Project counterpart carry `@[stacks]`.

The ramification locus (points where `f` is not unramified), the non-étale locus and the branch
locus (the image of the ramification locus in the target) are defined as sets, compared with
Mathlib's affine `Algebra.unramifiedLocus` and `Algebra.etaleLocus`, and the classical
codimension-one form of purity (SGA 1, Exposé X, Théorème 3.1) is derived from 0BMB.
-/

universe u

namespace TauCetiRoadmap.PurityOfBranchLocus

noncomputable section

open AlgebraicGeometry CategoryTheory IsLocalRing

/-! ## Layer 0: pointwise notions -/

section Layer0

variable {X Y : Scheme.{u}} (f : X ⟶ Y)

/-- Stacks' "unramified at `x`" (Definition 29.36.1 (02G4)), written with Mathlib's morphism
classes, is formal unramifiedness of the stalk map, for `f` locally of finite type. -/
@[stacks 02G4 "equivalence with the stalk form"]
theorem unramifiedAt_iff_stalkMap [LocallyOfFiniteType f] (x : X) :
    (∃ U : X.Opens, x ∈ U ∧ LocallyOfFiniteType (U.ι ≫ f) ∧ FormallyUnramified (U.ι ≫ f)) ↔
      (f.stalkMap x).hom.FormallyUnramified := by
  sorry

/-- Stacks' "étale at `x`" (Definition 29.37.1 (02GI)) is flatness and formal unramifiedness of
the stalk map, for `f` locally of finite presentation: Stacks, Lemma 29.37.15 (02GU), conditions
(1) and (4). -/
@[stacks 02GU "(1) ⇔ (4)"]
theorem etaleAt_iff_stalkMap [LocallyOfFinitePresentation f] (x : X) :
    (∃ U : X.Opens, x ∈ U ∧ Etale (U.ι ≫ f)) ↔
      (f.stalkMap x).hom.Flat ∧ (f.stalkMap x).hom.FormallyUnramified := by
  sorry

/-! ### The ramification, non-étale and branch loci (README §0.4) -/

/-- The **ramification locus** of `f`: the points of `X` at which `f` is not unramified, with
"unramified at `x`" in the stalk form of README Convention 3. For `f` locally of finite type it
is the complement of the set of points at which `f` is unramified in the sense of Stacks,
Definition 29.36.1 (02G4); see `ramificationLocus_eq_stacks`. -/
def ramificationLocus : Set X :=
  {x | ¬ (f.stalkMap x).hom.FormallyUnramified}

/-- The **non-étale locus** of `f`: the points of `X` with no open neighbourhood on which `f` is
étale, that is, the complement of the set of points at which `f` is étale in the sense of Stacks,
Definition 29.37.1 (02GI). Stacks, Sections 58.28 and 58.29, calls this set the ramification
locus; here that name is reserved for `ramificationLocus`, and the two agree under the hypotheses
of purity (`ramificationLocus_eq_nonEtaleLocus`). -/
def nonEtaleLocus : Set X :=
  {x | ¬ ∃ U : X.Opens, x ∈ U ∧ Etale (U.ι ≫ f)}

/-- The **branch locus** of `f`: the image in `Y` of the ramification locus, the points of `Y`
over which `f` is ramified at some point (the set described by the discriminant in the proof of
Stacks, Lemma 58.21.2 (0BJH)). -/
def branchLocus : Set Y :=
  f '' ramificationLocus f

/-- The ramification locus in the form of Stacks, Definition 29.36.1 (02G4): for `f` locally of
finite type, the points at which `f` is not unramified on any open neighbourhood. This is
`unramifiedAt_iff_stalkMap` pointwise. -/
@[stacks 02G4 "complement of the unramified points"]
theorem ramificationLocus_eq_stacks [LocallyOfFiniteType f] :
    ramificationLocus f = {x | ¬ ∃ U : X.Opens, x ∈ U ∧ LocallyOfFiniteType (U.ι ≫ f) ∧
      FormallyUnramified (U.ι ≫ f)} := by
  sorry

/-- The ramification locus of a morphism locally of finite type is closed: the unramified points
form an open set (Stacks, Section 29.36 (02G3), the remark after Definition 29.36.1, with
`ramificationLocus_eq_stacks`). -/
theorem isClosed_ramificationLocus [LocallyOfFiniteType f] : IsClosed (ramificationLocus f) := by
  sorry

/-- The non-étale locus is closed, with no hypothesis on `f`: the étale points form an open set
by Stacks, Definition 29.37.1 (02GI). -/
theorem isClosed_nonEtaleLocus : IsClosed (nonEtaleLocus f) := by
  sorry

/-- An étale point is unramified. -/
theorem ramificationLocus_subset_nonEtaleLocus : ramificationLocus f ⊆ nonEtaleLocus f := by
  sorry

/-- The branch locus of a finite morphism is closed: a finite morphism is closed (Stacks, Lemma
29.45.7 (01WM)) and its ramification locus is closed (`isClosed_ramificationLocus`). -/
theorem isClosed_branchLocus [IsFinite f] : IsClosed (branchLocus f) := by
  sorry

/-- Affine comparison: on `Spec S → Spec R` the ramification locus is the complement of Mathlib's
`Algebra.unramifiedLocus`. -/
theorem ramificationLocus_spec {R S : Type u} [CommRing R] [CommRing S] [Algebra R S] :
    ramificationLocus (Spec.map (CommRingCat.ofHom (algebraMap R S))) =
      (Algebra.unramifiedLocus R S)ᶜ := by
  sorry

/-- Affine comparison: for `S` of finite presentation over `R`, the non-étale locus of
`Spec S → Spec R` is the complement of Mathlib's `Algebra.etaleLocus`. -/
theorem nonEtaleLocus_spec {R S : Type u} [CommRing R] [CommRing S] [Algebra R S]
    [Algebra.FinitePresentation R S] :
    nonEtaleLocus (Spec.map (CommRingCat.ofHom (algebraMap R S))) =
      (Algebra.etaleLocus R S)ᶜ := by
  sorry

/-- Affine comparison: the branch locus of `Spec S → Spec R` is the image under `comap` of the
complement of `Algebra.unramifiedLocus`. -/
theorem branchLocus_spec {R S : Type u} [CommRing R] [CommRing S] [Algebra R S] :
    branchLocus (Spec.map (CommRingCat.ofHom (algebraMap R S))) =
      PrimeSpectrum.comap (algebraMap R S) '' (Algebra.unramifiedLocus R S)ᶜ := by
  sorry

/-- The **global dimension** of a ring: the supremum of the projective dimensions of its modules.
Stacks, Definition 10.109.10 (00O6). -/
@[stacks 00O6]
def globalDimension (R : Type u) [CommRing R] : WithBot ℕ∞ :=
  ⨆ M : ModuleCat.{u} R, CategoryTheory.projectiveDimension M

/-- The supremum definition of global dimension agrees with Mathlib's pointwise projective
dimension bound. EnhancedDerivedSheaves E1.6 consumes this comparison. -/
theorem globalDimension_le_iff_hasProjectiveDimensionLE (R : Type u) [CommRing R] (n : ℕ) :
    globalDimension R ≤ n ↔
      ∀ M : ModuleCat.{u} R, CategoryTheory.HasProjectiveDimensionLE M n := by
  sorry

/-- A Noetherian local ring whose residue field has finite projective dimension is regular.
This is the residue-field implication of Stacks 00OC and supplies the local criterion consumed by
EnhancedDerivedSheaves E1.6. -/
@[stacks 00OC "residue-field criterion"]
theorem isRegularLocalRing_of_projectiveDimension_residueField (R : Type u) [CommRing R]
    [IsLocalRing R] [IsNoetherianRing R] (n : ℕ)
    (h : HasProjectiveDimensionLE (ModuleCat.of R (ResidueField R)) n) :
    IsRegularLocalRing R := by
  sorry

/-- **Serre's theorem.** A Noetherian local ring is regular iff it has finite global dimension, and
the localization of a regular local ring at a prime is a regular local ring. Stacks, Lemma
10.110.6 (0AFS). -/
@[stacks 0AFS]
theorem isRegularLocalRing_iff_finite_globalDimension (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R] :
    IsRegularLocalRing R ↔ ∃ n : ℕ, globalDimension R ≤ n := by
  sorry

/-- The localization of a regular local ring at a prime is a regular local ring. Stacks, Lemma
10.110.6 (0AFS), second sentence. -/
@[stacks 0AFS "second sentence"]
theorem isRegularLocalRing_localization (R : Type u) [CommRing R] [IsRegularLocalRing R]
    (p : Ideal R) [p.IsPrime] : IsRegularLocalRing (Localization.AtPrime p) := by
  sorry

end Layer0

/-! ## Layer 2: purity of the branch locus -/

section Layer2

variable {X Y : Scheme.{u}}

/-- **Purity of the branch locus.** Stacks, Lemma 58.21.4 (0BMB), in Mathlib's vocabulary: for
`f` locally of finite type between locally Noetherian schemes, a normal source stalk, a regular
target stalk, `f` quasi-finite at `x`, equal dimensions `≥ 1`, and formal unramifiedness of the
stalk maps at the codimension-one generizations of `x` imply that `f` is étale on a
neighbourhood of `x`. This is the target. -/
@[stacks 0BMB]
theorem exists_etale_of_formallyUnramified_stalk_codimOne [IsLocallyNoetherian X]
    [IsLocallyNoetherian Y] (f : X ⟶ Y) [LocallyOfFiniteType f] (x : X)
    [IsDomain (X.presheaf.stalk x)] [IsIntegrallyClosed (X.presheaf.stalk x)]
    [IsRegularLocalRing (Y.presheaf.stalk (f x))] (hqf : f.QuasiFiniteAt x)
    (hdim : ringKrullDim (X.presheaf.stalk x) = ringKrullDim (Y.presheaf.stalk (f x)))
    (hpos : 1 ≤ ringKrullDim (X.presheaf.stalk x))
    (hunr : ∀ x' : X, x' ⤳ x → ringKrullDim (X.presheaf.stalk x') = 1 →
      (f.stalkMap x').hom.FormallyUnramified) :
    ∃ U : X.Opens, x ∈ U ∧ Etale (U.ι ≫ f) := by
  sorry

/-- **Purity of the branch locus**, accompanying statement in the form of Stacks, Lemma 58.21.4
(0BMB): `f` is not assumed locally of finite type, and "quasi-finite at `x`" and "unramified at
`x'`" are Stacks' Definitions 29.21.1 (01TD) and 29.36.1 (02G4), written with Mathlib's morphism
classes. It follows from `exists_etale_of_formallyUnramified_stalk_codimOne` by
`unramifiedAt_iff_stalkMap`. -/
@[stacks 0BMB "Stacks form"]
theorem etaleAt_of_unramifiedAt_codimOne [IsLocallyNoetherian X] [IsLocallyNoetherian Y]
    (f : X ⟶ Y) (x : X)
    (hnormal : IsDomain (X.presheaf.stalk x) ∧ IsIntegrallyClosed (X.presheaf.stalk x))
    (hreg : IsRegularLocalRing (Y.presheaf.stalk (f x)))
    (hqf : (∃ U : X.Opens, x ∈ U ∧ LocallyOfFiniteType (U.ι ≫ f)) ∧ f.QuasiFiniteAt x)
    (hdim : ringKrullDim (X.presheaf.stalk x) = ringKrullDim (Y.presheaf.stalk (f x)))
    (hpos : 1 ≤ ringKrullDim (X.presheaf.stalk x))
    (hunr : ∀ x' : X, x' ⤳ x → ringKrullDim (X.presheaf.stalk x') = 1 →
      ∃ U : X.Opens, x' ∈ U ∧ LocallyOfFiniteType (U.ι ≫ f) ∧ FormallyUnramified (U.ι ≫ f)) :
    ∃ U : X.Opens, x ∈ U ∧ Etale (U.ι ≫ f) := by
  sorry

/-- **Purity of the branch locus**, affine form. Stacks, Lemma 58.21.4 (0BMB) for `X = Spec S`,
`Y = Spec R`, with `𝔮.height` for `dim S_𝔮`. -/
@[stacks 0BMB "affine form"]
theorem isEtaleAt_of_purity {R S : Type u} [CommRing R] [CommRing S] [Algebra R S]
    [IsNoetherianRing R] [Algebra.FiniteType R S] (q : Ideal S) [q.IsPrime]
    [IsDomain (Localization.AtPrime q)] [IsIntegrallyClosed (Localization.AtPrime q)]
    [IsRegularLocalRing (Localization.AtPrime (q.under R))]
    (hqf : Algebra.QuasiFiniteAt R q)
    (hdim : q.height = (q.under R).height) (hpos : 1 ≤ q.height)
    (hunr : ∀ (q' : Ideal S) [q'.IsPrime], q' ≤ q → q'.height = 1 →
      Algebra.IsUnramifiedAt R q') :
    Algebra.IsEtaleAt R q := by
  sorry

/-! ### Purity of the ramification and branch loci (README §2.3) -/

/-- For a dominant, locally quasi-finite morphism locally of finite type between integral schemes
with regular, locally Noetherian target, the source and target stalks have the same dimension:
going down holds for the stalk map (Zariski's main theorem, Stacks, Theorem 10.123.12 (00Q9),
and going down over a normal base, Proposition 10.38.7 (00H8)), so the dimension formula of Lemma
10.112.7 (00ON) applies with a zero-dimensional fibre. It is also the transcendence-degree-zero
case of Stacks, Lemma 29.53.1 (02JU). -/
theorem ringKrullDim_stalk_eq_of_locallyQuasiFinite [IsLocallyNoetherian Y] [IsIntegral X]
    [IsIntegral Y] (f : X ⟶ Y) [LocallyOfFiniteType f] [LocallyQuasiFinite f] [IsDominant f]
    [∀ y : Y, IsRegularLocalRing (Y.presheaf.stalk y)] (x : X) :
    ringKrullDim (X.presheaf.stalk x) = ringKrullDim (Y.presheaf.stalk (f x)) := by
  sorry

/-- Under the hypotheses of SGA 1, Exposé X, Théorème 3.1 (`f` quasi-finite and dominant, `X`
integral and normal, `Y` integral, regular and locally Noetherian), a point is ramified iff it is
not étale. Derived from `exists_etale_of_formallyUnramified_stalk_codimOne` (0BMB). -/
theorem ramificationLocus_eq_nonEtaleLocus [IsLocallyNoetherian Y] [IsIntegral X] [IsIntegral Y]
    (f : X ⟶ Y) [LocallyOfFiniteType f] [LocallyQuasiFinite f] [IsDominant f]
    [∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)]
    [∀ y : Y, IsRegularLocalRing (Y.presheaf.stalk y)] :
    ramificationLocus f = nonEtaleLocus f := by
  sorry

/-- **Purity of the ramification locus** (SGA 1, Exposé X, Théorème 3.1), derived from Stacks,
Lemma 58.21.4 (0BMB): under the hypotheses of `ramificationLocus_eq_nonEtaleLocus`, if the
ramification locus is not all of `X`, then every point `z` of it that has no proper generization
in it (equivalently, the generic point of an irreducible component of it) satisfies
`dim 𝒪_{X,z} = 1`. -/
theorem ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus [IsLocallyNoetherian Y]
    [IsIntegral X] [IsIntegral Y] (f : X ⟶ Y) [LocallyOfFiniteType f] [LocallyQuasiFinite f]
    [IsDominant f] [∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)]
    [∀ y : Y, IsRegularLocalRing (Y.presheaf.stalk y)]
    (hne : ramificationLocus f ≠ Set.univ) (z : X) (hz : z ∈ ramificationLocus f)
    (hmax : ∀ z' ∈ ramificationLocus f, z' ⤳ z → z' = z) :
    ringKrullDim (X.presheaf.stalk z) = 1 := by
  sorry

/-- **Purity of the branch locus**, in the classical form: under the hypotheses of
`ramificationLocus_eq_nonEtaleLocus`, if the ramification locus is not all of `X`, then every
point `w` of the branch locus with no proper generization in it satisfies `dim 𝒪_{Y,w} = 1`. With
`isClosed_branchLocus`, for `f` finite the branch locus is a closed subset of `Y` that is empty or
of pure codimension one. Derived from `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus`
and `ringKrullDim_stalk_eq_of_locallyQuasiFinite`. -/
theorem ringKrullDim_stalk_eq_one_of_maximal_branchLocus [IsLocallyNoetherian Y]
    [IsIntegral X] [IsIntegral Y] (f : X ⟶ Y) [LocallyOfFiniteType f] [LocallyQuasiFinite f]
    [IsDominant f] [∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)]
    [∀ y : Y, IsRegularLocalRing (Y.presheaf.stalk y)]
    (hne : ramificationLocus f ≠ Set.univ) (w : Y) (hw : w ∈ branchLocus f)
    (hmax : ∀ w' ∈ branchLocus f, w' ⤳ w → w' = w) :
    ringKrullDim (Y.presheaf.stalk w) = 1 := by
  sorry

end Layer2

end

end TauCetiRoadmap.PurityOfBranchLocus
