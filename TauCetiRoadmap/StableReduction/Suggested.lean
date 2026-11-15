import Mathlib
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic

/-!
# Stable reduction of curves and stable maps: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, so that the finished
roadmap is tested against them. Nothing here is a definition of the roadmap's own: every carrier
it uses exists at the pins.

Headline theorems that are not statable at the pins, and the carrier each lacks:

* Classical stable reduction after a finite separable extension (end goal 1) and uniqueness of
  stable models over a fixed discrete valuation ring (end goal 2) lack `StableFamily`: an
  at-worst-nodal predicate on morphisms of schemes, arithmetic genus in families, and rational
  tails and bridges are all absent.
* Pointed stable reduction (end goal 3) lacks, in addition, pointed prestable families with
  their marking sections.
* Stable maps and their API (end goals 4 and 5) lack `PrestableMap` and `IsStableMap`, which
  need the pointed prestable families above.
* The valuative interface (end goal 6) lacks the stable-model carriers of end goals 1–3.
* Nodal reduction with the uniform degree bound (Layer 7, Stacks Theorem 55.18.1) lacks
  `HasNodalReduction`, that is, the at-worst-nodal predicate.
* The Artin–Winters numerical conclusion (Layer 6) lacks the numerical type attached to a regular
  model; the abstract numerical types and their Picard torsion bound are Tau Ceti's
  `TauCeti.NumericalType` and `TauCeti.NumericalType.finrank_torsion_le_arithmeticGenus`.

Statable at the pins, on Tau Ceti's `TauCeti.Model`: the existence of a regular proper model
of a smooth proper curve (Layer 5), stated below.
-/

namespace TauCetiRoadmap.StableReduction

open AlgebraicGeometry CategoryTheory

universe u

/- Mathlib's valuative criterion for properness of morphisms of schemes, the scheme-level
statement that the README's valuative interface is packaged against. -/
#check @AlgebraicGeometry.IsProper.eq_valuativeCriterion

/-- **Existence of a regular proper model** (Layer 5). Let `R` be a discrete valuation ring
with fraction field `K`, and let `C` be a smooth proper curve over `K`: `toK` is proper and
smooth of relative dimension one (a proper curve over a field is projective, Stacks tag 0A26).
Then `C` has a proper model over `R`, in the sense of `TauCeti.Model`, whose total space is
regular at every point. The route is the closure of `C` in a projective space over `R` followed
by resolution by normalized blowups of closed points (Stacks tags 0C2S, 0C2U and 0C2W); no
excellence, completeness or residue-field hypothesis on `R` enters. -/
theorem exists_regular_proper_model (R K : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K]
    (C : Scheme.{u}) (toK : C ⟶ Spec (.of K))
    [IsProper toK] [SmoothOfRelativeDimension 1 toK] :
    ∃ M : TauCeti.Model R K C toK, M.IsProper ∧
      ∀ x : M.total, IsRegularLocalRing (M.total.presheaf.stalk x) := by
  sorry

end TauCetiRoadmap.StableReduction
