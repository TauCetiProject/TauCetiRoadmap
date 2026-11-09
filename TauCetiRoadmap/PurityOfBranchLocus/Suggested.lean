module

public import Mathlib
public import TauCeti.AlgebraicGeometry.Morphisms.RamificationLocus
public import TauCeti.AlgebraicGeometry.Scheme.Normal
public import TauCeti.AlgebraicGeometry.Scheme.Regular.Scheme

/-!
# Purity of the branch locus: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`. The headline theorems are
purity of the branch locus (Stacks, Lemma 58.21.4 (0BMB)) in Mathlib's stalk vocabulary, in
Stacks' form and in affine form (README §2.1); the global corollary that a finite dominant,
generically étale morphism from a normal integral scheme to a regular one is étale iff it is
unramified in codimension one (README §2.2); and the codimension-one purity of the ramification
and branch loci (SGA 1, Exposé X, Théorème 3.1; README §2.3). Every headline theorem is statable
at the pins, and every one is stated here, on the libraries' carriers: Mathlib's pointwise
notions (`Scheme.Hom.QuasiFiniteAt`, formal unramifiedness of `Scheme.Hom.stalkMap`), Tau Ceti's
ramification and branch loci `AlgebraicGeometry.Scheme.Hom.ramificationLocus` and
`AlgebraicGeometry.Scheme.Hom.branchLocus`, and Tau Ceti's normal and regular schemes
`TauCeti.AlgebraicGeometry.IsNormalScheme` and `TauCeti.AlgebraicGeometry.IsRegular`.

"Étale at `x`" is an open neighbourhood of `x` on which the restriction is `Etale`. The Stacks
form of Lemma 58.21.4 (0BMB), with Stacks' pointwise notions written out as in README
Convention 3, is an accompanying statement.
-/

@[expose] public section

universe u

namespace TauCetiRoadmap.PurityOfBranchLocus

open AlgebraicGeometry CategoryTheory IsLocalRing

/-! ## Layer 2: purity of the branch locus -/

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
classes. It follows from `exists_etale_of_formallyUnramified_stalk_codimOne` applied to the
restriction of `f` to an open neighbourhood of `x` on which `f` is locally of finite type, with
Tau Ceti's `AlgebraicGeometry.Scheme.Hom.unramifiedAt_iff_stalkMap` translating the hypotheses. -/
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

/-! ### The global corollary (README §2.2) -/

/-- **The global corollary.** A finite dominant morphism `f : X ⟶ Y` from a normal integral
locally Noetherian scheme to a regular integral scheme that is generically étale (étale on an
open neighbourhood of the generic point of `X`) is étale iff its stalk map is formally unramified
at every point `x` with `dim 𝒪_{X,x} = 1`. The generic hypothesis covers the points with
zero-dimensional stalk, which 0BMB does not (it excludes the purely inseparable
`Spec 𝔽_p(t)[u]/(uᵖ − t) → Spec 𝔽_p(t)`, where the right-hand side holds vacuously); at every
other point `exists_etale_of_formallyUnramified_stalk_codimOne` applies, the equality of stalk
dimensions coming from Tau Ceti's
`AlgebraicGeometry.Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite`. -/
theorem etale_of_etaleAt_codimOne [IsLocallyNoetherian X] [IsIntegral X] [IsIntegral Y]
    [TauCeti.AlgebraicGeometry.IsNormalScheme X] [TauCeti.AlgebraicGeometry.IsRegular Y]
    (f : X ⟶ Y) [IsFinite f] [IsDominant f]
    (hgen : ∃ U : X.Opens, genericPoint X ∈ U ∧ Etale (U.ι ≫ f)) :
    Etale f ↔ ∀ x : X, ringKrullDim (X.presheaf.stalk x) = 1 →
      (f.stalkMap x).hom.FormallyUnramified := by
  sorry

/-! ### Purity of the ramification and branch loci (README §2.3) -/

/-- **Purity of the ramification locus** (SGA 1, Exposé X, Théorème 3.1), derived from Stacks,
Lemma 58.21.4 (0BMB): for a dominant, locally quasi-finite morphism `f` locally of finite type
from a normal integral scheme to a regular integral scheme, if the ramification locus is not all
of `X`, then every point `z` of it that has no proper generization in it (equivalently, the
generic point of an irreducible component of it) satisfies `dim 𝒪_{X,z} = 1`. Under these
hypotheses Tau Ceti's `AlgebraicGeometry.Scheme.Hom.ramificationLocus_eq_nonEtaleLocus` makes the
ramification locus the set of points at which `f` is not étale, the set SGA 1 considers. -/
theorem ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus [IsIntegral X] [IsIntegral Y]
    [TauCeti.AlgebraicGeometry.IsNormalScheme X] [TauCeti.AlgebraicGeometry.IsRegular Y]
    (f : X ⟶ Y) [LocallyOfFiniteType f] [LocallyQuasiFinite f] [IsDominant f]
    (hne : f.ramificationLocus ≠ Set.univ) (z : X) (hz : z ∈ f.ramificationLocus)
    (hmax : ∀ z' ∈ f.ramificationLocus, z' ⤳ z → z' = z) :
    ringKrullDim (X.presheaf.stalk z) = 1 := by
  sorry

/-- **Purity of the branch locus**, in the classical form: under the hypotheses of
`ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus`, if the ramification locus is not all of
`X`, then every point `w` of the branch locus with no proper generization in it satisfies
`dim 𝒪_{Y,w} = 1`. With Tau Ceti's `AlgebraicGeometry.Scheme.Hom.isClosed_branchLocus`, for `f`
finite the branch locus is a closed subset of `Y` that is empty or of pure codimension one.
Derived from `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus` and Tau Ceti's
`AlgebraicGeometry.Scheme.Hom.ringKrullDim_stalk_eq_of_locallyQuasiFinite`. -/
theorem ringKrullDim_stalk_eq_one_of_maximal_branchLocus [IsIntegral X] [IsIntegral Y]
    [TauCeti.AlgebraicGeometry.IsNormalScheme X] [TauCeti.AlgebraicGeometry.IsRegular Y]
    (f : X ⟶ Y) [LocallyOfFiniteType f] [LocallyQuasiFinite f] [IsDominant f]
    (hne : f.ramificationLocus ≠ Set.univ) (w : Y) (hw : w ∈ f.branchLocus)
    (hmax : ∀ w' ∈ f.branchLocus, w' ⤳ w → w' = w) :
    ringKrullDim (Y.presheaf.stalk w) = 1 := by
  sorry

end TauCetiRoadmap.PurityOfBranchLocus
