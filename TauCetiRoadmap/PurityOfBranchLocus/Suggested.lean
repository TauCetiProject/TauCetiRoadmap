import Mathlib
import TauCeti.AlgebraicGeometry.Morphisms.RamificationLocus
import TauCeti.AlgebraicGeometry.Scheme.Normal
import TauCeti.AlgebraicGeometry.Scheme.Regular.Scheme

/-!
# Purity of the branch locus: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti: Zariski–Nagata purity of the branch locus (Stacks, Lemma
58.21.4 (0BMB)) in its stalkwise, Stacks and affine forms (README §2.1), the global corollary for
finite generically étale morphisms (§2.2), and the codimension-one purity of the ramification and
branch loci (SGA 1, Exposé X, Théorème 3.1; §2.3). Every headline is statable at the pins.

The pointwise vocabulary, the ramification, non-étale and branch loci, normal and regular schemes
and the equality of local dimensions for dominant locally quasi-finite morphisms are Tau Ceti's
(`Scheme.Hom.ramificationLocus`, `Scheme.Hom.branchLocus`, `TauCeti.AlgebraicGeometry.IsNormalScheme`,
`TauCeti.AlgebraicGeometry.IsRegular`); "unramified at `x`" is formal unramifiedness of the stalk
map and "étale at `x`" is an open neighbourhood on which the restriction is `Etale` (README,
Convention 3).
-/

universe u

namespace TauCetiRoadmap.PurityOfBranchLocus

open AlgebraicGeometry CategoryTheory

/-! ## Layer 2: purity of the branch locus -/

variable {X Y : Scheme.{u}}

/-- **Purity of the branch locus.** Stacks, Lemma 58.21.4 (0BMB), in Mathlib's vocabulary: for
`f` locally of finite type between locally Noetherian schemes, a normal source stalk, a regular
target stalk, `f` quasi-finite at `x`, equal dimensions `≥ 1`, and formal unramifiedness of the
stalk maps at the codimension-one generizations of `x` (including `x` itself when its local ring
has dimension one) imply that `f` is étale on a neighbourhood of `x`. -/
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
classes. It follows from `exists_etale_of_formallyUnramified_stalk_codimOne` on an open
neighbourhood of `x` on which `f` is locally of finite type, through Tau Ceti's
`Scheme.Hom.unramifiedAt_iff_stalkMap`. -/
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
`Y = Spec R`, with `𝔮.height` for `dim S_𝔮`: for `S` of finite type over a Noetherian ring `R` and
a prime `𝔮` of `S` with `S_𝔮` a normal domain and `R_{𝔮 ∩ R}` regular, quasi-finiteness at `𝔮`,
equal heights `≥ 1` and unramifiedness at the height-one primes below `𝔮` give étaleness at `𝔮`. -/
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

/-- **The global corollary** (README §2.2). A finite dominant morphism from a normal integral
scheme to a regular integral scheme that is étale on a neighbourhood of the generic point of the
source (generically étale: the extension of function fields is separable) is étale iff its stalk
maps at the points of codimension one are formally unramified. Without the generic étaleness
hypothesis the purely inseparable `Spec 𝔽_p(t^{1/p}) → Spec 𝔽_p(t)` satisfies the right-hand side
vacuously and is not étale. -/
theorem etale_of_etaleAt_codimOne [IsIntegral X] [IsIntegral Y]
    [TauCeti.AlgebraicGeometry.IsNormalScheme X] [TauCeti.AlgebraicGeometry.IsRegular Y]
    (f : X ⟶ Y) [IsFinite f] [IsDominant f]
    (hgen : ∃ U : X.Opens, genericPoint X ∈ U ∧ Etale (U.ι ≫ f)) :
    Etale f ↔ ∀ x : X, ringKrullDim (X.presheaf.stalk x) = 1 →
      (f.stalkMap x).hom.FormallyUnramified := by
  sorry

/-- **Purity of the ramification locus** (SGA 1, Exposé X, Théorème 3.1), derived from Stacks,
Lemma 58.21.4 (0BMB): for a dominant, locally quasi-finite morphism, locally of finite type, from
a normal integral scheme to a regular integral scheme, if the ramification locus is not all of
`X`, then every point `z` of it that has no proper generization in it (equivalently, the generic
point of an irreducible component of it) satisfies `dim 𝒪_{X,z} = 1`. Under these hypotheses the
ramification locus is the non-étale locus (Tau Ceti's `Scheme.Hom.ramificationLocus_eq_nonEtaleLocus`). -/
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
`dim 𝒪_{Y,w} = 1`. With Tau Ceti's `Scheme.Hom.isClosed_branchLocus`, for `f` finite the branch
locus is a closed subset of `Y` that is empty or of pure codimension one. -/
theorem ringKrullDim_stalk_eq_one_of_maximal_branchLocus [IsIntegral X] [IsIntegral Y]
    [TauCeti.AlgebraicGeometry.IsNormalScheme X] [TauCeti.AlgebraicGeometry.IsRegular Y]
    (f : X ⟶ Y) [LocallyOfFiniteType f] [LocallyQuasiFinite f] [IsDominant f]
    (hne : f.ramificationLocus ≠ Set.univ) (w : Y) (hw : w ∈ f.branchLocus)
    (hmax : ∀ w' ∈ f.branchLocus, w' ⤳ w → w' = w) :
    ringKrullDim (Y.presheaf.stalk w) = 1 := by
  sorry

end TauCetiRoadmap.PurityOfBranchLocus
