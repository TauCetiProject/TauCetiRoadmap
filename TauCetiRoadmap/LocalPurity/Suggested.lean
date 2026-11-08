import Mathlib
import TauCeti.AlgebraicGeometry.FiniteEtale.PuncturedSpectrum

/-!
# Finite étale covers of punctured spectra and local purity: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

The headlines are the two clauses of purity for a regular local ring of dimension at least two
(Stacks, Lemma 58.21.3 (0BMA), README §2.1), extension of finite étale covers across the points
where purity holds (Stacks, Lemma 58.21.6 (0EY7), README §2.2), and extension across a complement
whose local rings are regular of dimension at least two (SGA 2, Exposé X, Proposition 3.3 with
Théorème 3.4 (i); SGA 1, Exposé X, Corollaire 3.3 for a regular scheme; README §2.2). All four are
statable at the pins, on Tau Ceti's carriers: finite étale schemes `TauCeti.FiniteEtaleScheme`
with base change `TauCeti.FiniteEtaleScheme.pullback`, and purity of a local ring
`TauCeti.IsLocalRing.PurityHolds`, essential surjectivity of the restriction to the punctured
spectrum `TauCeti.IsLocalRing.puncturedSpectrum`. No headline is unstatable.
-/

universe u

namespace TauCetiRoadmap.LocalPurity

open AlgebraicGeometry CategoryTheory IsLocalRing

/-! ## Layer 2: local purity and extension -/

/-- **Purity for a regular local ring**, clause (1): if `A` is a regular local ring of dimension
at least two, every finite étale scheme over the punctured spectrum of `A` is the restriction of a
finite étale scheme over `Spec A`. Stacks, Lemma 58.21.3 (0BMA), (1); SGA 2, Exposé X,
Théorème 3.4 (i). -/
@[stacks 0BMA "(1)"]
theorem IsLocalRing.purityHolds_of_isRegularLocalRing (A : Type u) [CommRing A]
    [IsRegularLocalRing A] (hd : 2 ≤ ringKrullDim A) : TauCeti.IsLocalRing.PurityHolds A := by
  sorry

/-- **Purity for a regular local ring**, clause (2), corrected and in affine form: if `A` is a
regular local ring of dimension at least two and `B` a finite `A`-algebra, torsion free as an
`A`-module, whose localizations at primes are integrally closed domains and which is étale over
`A` at every prime not lying over the maximal ideal, then `B` is étale over `A`. Stacks, Lemma
58.21.3 (0BMA), (2), with "`B` torsion free over `A`" added (README, Convention 5): without it
`B = A × A/𝔪` is a counterexample. -/
@[stacks 0BMA "(2), with B torsion free over A added"]
theorem Algebra.etale_of_finiteNormal_of_isRegularLocalRing (A B : Type u) [CommRing A]
    [CommRing B] [Algebra A B] [IsRegularLocalRing A] (hd : 2 ≤ ringKrullDim A)
    [Module.Finite A B] [Module.IsTorsionFree A B]
    (hnormal : ∀ (p : Ideal B) [p.IsPrime],
      IsDomain (Localization.AtPrime p) ∧ IsIntegrallyClosed (Localization.AtPrime p))
    (hpunct : ∀ (q : Ideal B) [q.IsPrime], q.under A ≠ maximalIdeal A → Algebra.IsEtaleAt A q) :
    Algebra.Etale A B := by
  sorry

/-- **Extension across points where purity holds.** For an open `U` of a Noetherian scheme `X`
such that purity holds for the local ring of `X` at every point outside `U`, restriction of finite
étale schemes from `X` to `U` is essentially surjective. Stacks, Lemma 58.21.6 (0EY7). -/
@[stacks 0EY7]
theorem finiteEtale_extend_of_purity {X : Scheme.{u}} [IsNoetherian X] (U : X.Opens)
    (h : ∀ x : X, x ∉ U → TauCeti.IsLocalRing.PurityHolds (X.presheaf.stalk x)) :
    (TauCeti.FiniteEtaleScheme.pullback U.ι).EssSurj := by
  sorry

/-- **Extension across a regular complement of codimension at least two.** For an open `U` of a
locally Noetherian scheme `X` such that the local ring of `X` at every point outside `U` is a
regular local ring of dimension at least two, restriction of finite étale schemes from `X` to `U`
is essentially surjective. SGA 2, Exposé X, Proposition 3.3 with Théorème 3.4 (i), the essential
surjectivity half of the equivalence stated there; for `X` regular it is SGA 1, Exposé X,
Corollaire 3.3. No Stacks tag. -/
theorem finiteEtale_extend_of_regular_codimTwo {X : Scheme.{u}} [IsLocallyNoetherian X]
    (U : X.Opens)
    (h : ∀ x : X, x ∉ U →
      IsRegularLocalRing (X.presheaf.stalk x) ∧ 2 ≤ ringKrullDim (X.presheaf.stalk x)) :
    (TauCeti.FiniteEtaleScheme.pullback U.ι).EssSurj := by
  sorry

end TauCetiRoadmap.LocalPurity
