module

import Mathlib
import TauCeti.AlgebraicGeometry.Modules.Differentials.Basic
import TauCeti.AlgebraicGeometry.Scheme.Normal
import TauCeti.AlgebraicGeometry.VectorBundle.FixedRank
import TauCeti.Topology.PureDimension

/-!
# Nash blowups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib and
Tau Ceti and each with `sorry`, the headline theorems of the roadmap that are statable there, with
the one predicate they need.

Stated here:
* the differential smoothness criterion in characteristic zero (README §4.4): a reduced scheme,
  locally of finite type and pure of dimension `d` over a field of characteristic zero, is smooth
  iff its sheaf of differentials admits a locally free quotient of rank `d`. With the triviality
  criterion of README §2.5 it is Nobile's theorem;
* the differential smoothness criterion for normal schemes over a perfect field of characteristic
  `p` (README §5.4, first statement). With README §2.5 it is the theorem of Duarte and
  Núñez-Betancourt.

Not statable at the pins, for want of the Nash blowup `ν : X* ⟶ X` itself. Its construction
(README §§1.2 and 2.1) is the scheme-theoretic image of the classifying map of the smooth locus in
the Grassmannian `Gr_d(Ω_{X/k}) ⟶ X` of locally free rank-`d` quotients of a quasi-coherent sheaf
of finite type on a scheme that need not be affine, with its universal quotient and classifying
maps (AlgebraicModuliForArithmeticGeometry §1.3). The pinned Tau Ceti has the Grassmannian scheme
of a module over an affine base only (`Module.Grassmannian.scheme`), with its morphisms described
from affine schemes only (`Module.Grassmannian.schemeHomEquiv`), so that even for affine `X` the
classifying map of the smooth locus, which need not be affine, is not available; and it has the
relative `Proj` of a graded quasi-coherent algebra without the universal property that would
classify the invertible quotient `∧^d Ω_{X/k}` over the smooth locus. The headline theorems that
lack this carrier are:
* the triviality criterion (README §2.5): `ν` is an isomorphism iff `Ω_{X/k}` admits a locally
  free quotient of rank `d`;
* Nobile's description of the Nash blowup as the blowup of an ideal, and of the Nash blowup of a
  hypersurface as the blowup of its Jacobian ideal (README §§3.2 and 3.3);
* Nobile's theorem (README §4.5) and the theorem of Duarte and Núñez-Betancourt (README §5.4,
  second statement) in their form for `ν`;
* the isomorphism criteria for the normalised Nash blowup `ν̄ : X̄* ⟶ X` (README §6.4), which lack
  `X*` and hence its normalisation;
* the never-resolves principle for the iterated Nash and normalised Nash blowups (README §7.3),
  which lacks the iterates.
-/

open CategoryTheory AlgebraicGeometry

universe u

namespace TauCetiRoadmap.NashBlowups

/-! ## Layer 0: interfaces with the pinned libraries -/

/-- The sheaf of relative differentials `Ω_{X/k}` admits a locally free quotient of rank `d`:
there are a finite locally free `𝒪_X`-module `E` of constant rank `d` and an epimorphism of
`𝒪_X`-modules `Ω_{X/k} ⟶ E` (README §0.7). It is the condition of the triviality criterion for the
Nash blowup (README §2.5; Nobile, *Notes on Nash modification*, Section 2) and the hypothesis of
the differential smoothness criteria below. -/
def HasLocallyFreeQuotientOfDifferentials (k : Type u) [CommRing k] (X : Scheme.{u})
    [X.Over (Spec (.of k))] (d : ℕ) : Prop :=
  ∃ (E : TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.FixedRank X d)
    (q : X.relativeDifferentials k ⟶ E.obj.obj), Epi q

/-! ## Layer 4: characteristic zero -/

/-- **The differential smoothness criterion in characteristic zero** (README §4.4). A reduced
scheme `X`, locally of finite type and pure of dimension `d` over a field `k` of characteristic
zero, is smooth over `k` iff `Ω_{X/k}` admits a locally free quotient of rank `d`. The backward
implication is Nobile's (*Notes on Nash modification*, Proposition 2.3, over an algebraically closed
field); with the triviality criterion of README §2.5 it gives Nobile's theorem that the Nash blowup
of `X` is an isomorphism iff `X` is smooth (Nobile 1975, Theorem 2). -/
theorem smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_charZero (k : Type u) [Field k]
    [CharZero k] (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsReduced X]
    [LocallyOfFiniteType (X ↘ Spec (.of k))] (d : ℕ) (hX : TauCeti.IsPureDimensional d X) :
    Smooth (X ↘ Spec (.of k)) ↔ HasLocallyFreeQuotientOfDifferentials k X d := by
  sorry

/-! ## Layer 5: normal varieties in positive characteristic -/

/-- **The differential smoothness criterion for normal schemes in characteristic `p`** (README
§5.4). A normal scheme `X`, locally of finite type and pure of dimension `d` over a perfect field
`k` of characteristic `p`, is smooth over `k` iff `Ω_{X/k}` admits a locally free quotient of
rank `d`. The backward implication is the heart of the theorem of Duarte and Núñez-Betancourt
(*Nash blowups in prime characteristic*, Theorem 3.10 and its proof, over an algebraically closed
field): the quotient makes the Frobenius pushforward of each local ring at a closed point free, so
the local ring is regular by Kunz's theorem. With README §2.5 it gives their theorem that the Nash
blowup of a normal `X` is an isomorphism iff `X` is smooth. -/
theorem smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_isNormalScheme (p : ℕ) [Fact p.Prime]
    (k : Type u) [Field k] [CharP k p] [PerfectField k] (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [TauCeti.AlgebraicGeometry.IsNormalScheme X] [LocallyOfFiniteType (X ↘ Spec (.of k))]
    (d : ℕ) (hX : TauCeti.IsPureDimensional d X) :
    Smooth (X ↘ Spec (.of k)) ↔ HasLocallyFreeQuotientOfDifferentials k X d := by
  sorry

end TauCetiRoadmap.NashBlowups
