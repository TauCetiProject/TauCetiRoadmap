module

public import Mathlib
public import TauCeti.NumberTheory.QuadraticForm.Global.Localization
public import TauCeti.NumberTheory.QuadraticForm.Global.Predicates
public import TauCeti.NumberTheory.QuadraticForm.Global.Invariants
public import TauCeti.NumberTheory.QuadraticForm.Global.FormInvariants
public import TauCeti.NumberTheory.QuadraticForm.Global.WittLocalization

/-!
# Global quadratic forms over number fields: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

The statements use Tau Ceti's carriers as they are: the localizations
`QuadraticForm.atFinitePlace` and `QuadraticForm.atRealPlace`, the localized unit
`HeightOneSpectrum.unitAtFinitePlace`, the local predicates `QuadraticForm.IsLocallyIsotropic`,
`QuadraticForm.LocallyRepresentsScalar`, `QuadraticForm.LocallyRepresents` and
`QuadraticForm.LocallyEquivalent`, the invariant record
`TauCeti.NumberField.QuadraticForm.GlobalFormInvariants` with its predicate
`GlobalFormInvariants.IsAdmissible`, the record `QuadraticForm.globalInvariants` of a regular form,
and the Witt ring `TauCeti.WittRing` with its global-to-local map
`TauCeti.WittRing.globalToLocal`.

The headline theorems are the global square theorem (4.2), Hasse–Minkowski for isotropy (5.5),
for the representation of nonzero scalars (6.1), for the representation of forms (6.2) and for
isometry (6.3), the existence of a global form with prescribed admissible invariants (7.3), the
classification of regular forms by their invariants (8.1), the injectivity of the global-to-local
map of Witt rings (8.3), and the isometry corollary consumed by the orthogonal-group roadmaps
(8.4). Each is statable at the pins and is stated below.
-/

public section

namespace TauCetiRoadmap.GlobalQuadraticForms

open IsDedekindDomain NumberField
open TauCeti.NumberField.QuadraticForm (GlobalFormInvariants)

universe u v w

/-! ## Layer 4: the global square theorem -/

section GlobalSquare

variable {K : Type u} [Field K] [NumberField K]

/-- **4.2, the global square theorem** (O'Meara 65:15). A unit of a number field that is a square
in the completion at all but finitely many finite places is a square in `K`. No archimedean
hypothesis is needed. -/
theorem isSquare_of_isSquare_unitAtFinitePlace_of_notMem
    (a : Kˣ) (S : Finset (HeightOneSpectrum (𝓞 K)))
    (h : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S → IsSquare (v.unitAtFinitePlace a)) :
    IsSquare a :=
  sorry

end GlobalSquare

/-! ## Layers 5–6: Hasse–Minkowski for isotropy, representation and isometry -/

section HasseMinkowski

variable {K : Type u} [Field K] [NumberField K]
  {V : Type v} [AddCommGroup V] [Module K V]

/-- **5.5, Hasse–Minkowski for isotropy** (O'Meara 66:1), over an arbitrary number field: a
regular form is isotropic exactly when it is isotropic at every finite and every real place. -/
theorem hasseMinkowski_isotropic [FiniteDimensional K V]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) :
    ¬ Q.Anisotropic ↔ Q.IsLocallyIsotropic :=
  sorry

/-- **6.1, Hasse–Minkowski for the representation of a nonzero scalar** (O'Meara 66:3 in
dimension one): a regular form represents a nonzero scalar exactly when it represents it at every
finite and every real place. -/
theorem represents_iff_locallyRepresents [FiniteDimensional K V]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) (a : K) (ha : a ≠ 0) :
    QuadraticMap.Represents Q a ↔ Q.LocallyRepresentsScalar a :=
  sorry

/-- **6.2, Hasse–Minkowski for the representation of forms** (O'Meara 66:3): a regular form `Q`
admits an injective isometry into a regular form `R` exactly when it does so at every finite and
every real place. -/
theorem represented_iff_locallyRepresented [FiniteDimensional K V]
    {W : Type w} [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate) :
    Q.IsRepresentedBy R ↔ Q.LocallyRepresents R :=
  sorry

/-- **6.3, Hasse–Minkowski for isometry** (O'Meara 66:4): two regular forms are isometric exactly
when they are isometric at every finite and every real place. -/
theorem hasseMinkowski_equivalent [FiniteDimensional K V]
    {W : Type w} [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate) :
    Q.Equivalent R ↔ Q.LocallyEquivalent R :=
  sorry

end HasseMinkowski

/-! ## Layers 7–8: global existence, classification and Witt consequences -/

section Existence

variable {K : Type u} [Field K] [NumberField K]

/-- **7.3, existence from an admissible invariant record** (O'Meara 72:1). Every admissible
record `(n, d, s, p)` is the record of invariants of a regular form on `Kⁿ`. Admissibility
includes `1 ≤ n`; the zero form, whose record has rank `0`, is the regular form excluded. -/
theorem exists_globalForm_of_isAdmissible (I : GlobalFormInvariants K)
    (hI : I.IsAdmissible) :
    ∃ Q : QuadraticForm K (Fin I.rank → K),
      ∃ hQ : Q.Nondegenerate, Q.globalInvariants hQ = I :=
  sorry

/-- **8.1, classification by invariants** (O'Meara 66:5): two regular forms are
isometric exactly when they have the same rank, global discriminant, finite Hasse signs and real
positive indices. The statement includes rank zero. -/
theorem equivalent_iff_globalInvariants_eq
    {V : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    {W : Type w} [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate) :
    Q.Equivalent R ↔ Q.globalInvariants hQ = R.globalInvariants hR :=
  sorry

/-- **8.4, the isometry corollary consumed by the orthogonal-group roadmaps**: locally isometric
regular forms are isometric. Its translation into the triviality of the localization kernel of
`H¹(K, SO(Q))` is assigned by Orthogonal and Spin Groups to Orthogonal Tamagawa and Lattice
Mass; this roadmap defines no `H¹`. -/
theorem equivalent_of_locallyEquivalent
    {V : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    {W : Type w} [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate)
    (h : Q.LocallyEquivalent R) :
    Q.Equivalent R :=
  (hasseMinkowski_equivalent Q hQ R hR).2 h

/-- **8.3, injectivity of the global-to-local map of Witt rings.** The ring homomorphism
`W(K) → ∏_v W(K_v) × ∏_w W(ℝ)`, scalar extension to every finite completion and, along the real
embedding, to every real place, is injective: a Witt class of `K` that vanishes at every finite
and every real place is zero. Complex places are not needed: a class that vanishes at one finite
place has even dimension, and the dimension modulo two is the only invariant of `W(ℂ)`. -/
theorem injective_wittRing_baseChange_places :
    Function.Injective (TauCeti.WittRing.globalToLocal K) :=
  sorry

end Existence

end TauCetiRoadmap.GlobalQuadraticForms
