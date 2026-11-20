import Mathlib
import TauCeti.AlgebraicGeometry.Cohomology.Basic
import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
import TauCeti.AlgebraicGeometry.LineBundle.Basic
import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
import TauCeti.AlgebraicGeometry.Curves.StableReduction.NodalReduction

/-!
# Stable reduction of curves and stable maps: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, so that the finished
roadmap is tested against them. Nothing here is a definition of the roadmap's own: every carrier
it uses exists at the pins.

Statable at the pins and stated below: the existence of a regular proper model of a smooth proper
curve (Layer 5, §5.1), on Tau Ceti's `TauCeti.Model`; nodal reduction after a finite separable
extension in every genus (Layer 7, §§7.1–7.3), and in genus at least two with the uniform degree
bound of Stacks Theorem 55.18.1 (§7.3), on Tau Ceti's `TauCeti.HasNodalReduction` and
`TauCeti.FiniteDVRExtension`.

Headline theorems that are not statable at the pins, and the carrier each lacks:

* Classical stable reduction after a finite separable extension (§8.5) and uniqueness of stable
  models over a fixed discrete valuation ring (§8.6) lack the stable-family predicate. Tau Ceti has
  prestable families (`TauCeti.AlgebraicGeometry.PrestableFamily`), but stability of the geometric
  fibres needs either the dual graph of an actual nodal curve, to exclude rational tails and
  bridges, or the relative dualizing sheaf with relative ampleness; the pins have neither.
* Pointed stable reduction (§9.4) lacks, in the same way, stability of pointed prestable families
  (relative ampleness of `ω(Σsᵢ)`); pointed prestable families are Tau Ceti's
  `TauCeti.AlgebraicGeometry.PointedPrestableFamily`.
* The characterizations of stable maps (§10.4) lack the stability predicate on Tau Ceti's
  `TauCeti.AlgebraicGeometry.PrestableMap`: the log-canonical degree of a contracted component of a
  geometric fibre needs the normalization genus and special flags of an actual nodal curve.
* The valuative interfaces (§§8.7, 9.7) lack the stable carriers of the three items above.
* The Artin–Winters numerical conclusion (§6.4) lacks the numerical type attached to a regular
  model and the minimality of a model (exceptional curves of the first kind); the abstract
  numerical types and their Picard torsion bound are Tau Ceti's `TauCeti.NumericalType` and
  `TauCeti.NumericalType.finrank_torsion_le_arithmeticGenus`.
-/

namespace TauCetiRoadmap.StableReduction

open AlgebraicGeometry CategoryTheory Module

universe u

/- Mathlib's valuative criterion for properness of morphisms of schemes, the scheme-level
statement that the README's valuative interface is packaged against. -/
#check @AlgebraicGeometry.IsProper.eq_valuativeCriterion

/-- **Existence of a regular proper model** (Layer 5, §5.1). Let `R` be a discrete valuation ring
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

/-- **Nodal reduction** (Layer 7, §§7.1–7.3; Stacks Theorem 55.18.1). Let `R` be a discrete
valuation ring with fraction field `K`, with no completeness or residue-field hypothesis, and let
`C` be a smooth, proper, geometrically integral curve over `K`. Then there are a finite separable
extension `K'` of `K` and a place of `K'` above the closed point of `R`, with local ring `R'`
(a `TauCeti.FiniteDVRExtension`), such that `C_{K'}` has a proper model over `R'` that is at worst
nodal of relative dimension one. -/
theorem exists_hasNodalReduction (R K : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K]
    (C : Scheme.{u}) [C.Over (Spec (.of K))]
    [IsProper (C ↘ Spec (.of K))] [SmoothOfRelativeDimension 1 (C ↘ Spec (.of K))]
    [GeometricallyIntegral (C ↘ Spec (.of K))] :
    ∃ E : TauCeti.FiniteDVRExtension R K,
      TauCeti.HasNodalReduction E.localRing E.extensionField
        (TauCeti.genericFiber K E.extensionField (C ↘ Spec (.of K))).left
        (TauCeti.genericFiber K E.extensionField (C ↘ Spec (.of K))).hom := by
  sorry

/-- **Nodal reduction in genus at least two, with the uniform bound** (Layer 7, §7.3; Stacks
Theorem 55.18.1 (3) and equation 55.18.0.1). Let `R`, `K` and `C` be as in
`exists_hasNodalReduction`, with `C` of genus `g = dim_K H¹(C, 𝒪_C) ≥ 2`, and let `ℓ` be the
second prime larger than `768 g`: `ℓ` is a prime, `768 g < ℓ`, and exactly one prime lies strictly
between `768 g` and `ℓ`. Then the extension can be chosen of degree at most
`B_g = (2g − 2) · (ℓ ^ (2g))!`. -/
theorem exists_hasNodalReduction_of_two_le_genus (R K : Type u) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K]
    (C : Scheme.{u}) [C.Over (Spec (.of K))]
    [IsProper (C ↘ Spec (.of K))] [SmoothOfRelativeDimension 1 (C ↘ Spec (.of K))]
    [GeometricallyIntegral (C ↘ Spec (.of K))] (g ℓ : ℕ)
    (hg : finrank K (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial C).obj 1) = g)
    (hg2 : 2 ≤ g) (hℓ : ℓ.Prime) (hgℓ : 768 * g < ℓ)
    (hℓ' : ((Finset.Ioo (768 * g) ℓ).filter Nat.Prime).card = 1) :
    ∃ E : TauCeti.FiniteDVRExtension R K,
      finrank K E.extensionField ≤ (2 * g - 2) * (ℓ ^ (2 * g)).factorial ∧
      TauCeti.HasNodalReduction E.localRing E.extensionField
        (TauCeti.genericFiber K E.extensionField (C ↘ Spec (.of K))).left
        (TauCeti.genericFiber K E.extensionField (C ↘ Spec (.of K))).hom := by
  sorry

end TauCetiRoadmap.StableReduction
