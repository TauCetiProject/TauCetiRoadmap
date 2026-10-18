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

/-- The **global dimension** of a ring: the supremum of the projective dimensions of its modules.
Stacks, Definition 10.109.10 (00O6). -/
@[stacks 00O6]
def globalDimension (R : Type u) [CommRing R] : WithBot ℕ∞ :=
  ⨆ M : ModuleCat.{u} R, CategoryTheory.projectiveDimension M

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
stalk maps at the codimension-one specializations of `x` imply that `f` is étale on a
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

end Layer2

end

end TauCetiRoadmap.PurityOfBranchLocus
