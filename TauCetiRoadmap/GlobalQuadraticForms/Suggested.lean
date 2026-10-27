import Mathlib
import TauCeti.NumberTheory.HilbertSymbol.Basic
import TauCeti.NumberTheory.QuadraticForm.Global.Localization
import TauCeti.NumberTheory.QuadraticForm.Global.Predicates
import TauCeti.NumberTheory.QuadraticForm.Global.Invariants
import TauCeti.NumberTheory.QuadraticForm.Global.FormInvariants
import TauCeti.LinearAlgebra.QuadraticForm.Witt.BaseChange

/-!
# Global quadratic forms over number fields: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

The carriers of Layers 0–3 are landed Tau Ceti code and are used here as they are: the
localizations `QuadraticForm.atFinitePlace` and `QuadraticForm.atRealPlace`, the localized units
`HeightOneSpectrum.unitAtFinitePlace` and `TauCeti.unitAtRealPlace`, the local predicates
`QuadraticForm.IsLocallyIsotropic`, `QuadraticForm.LocallyRepresents`,
`QuadraticForm.LocallyRepresentsScalar` and `QuadraticForm.LocallyEquivalent`, the invariant
carrier `TauCeti.NumberField.QuadraticForm.GlobalFormInvariants` with its admissibility predicate
`GlobalFormInvariants.IsAdmissible`, the invariants `QuadraticForm.globalInvariants` of a regular
form, the norm-equation symbol `TauCeti.hilbertSymbol`, and the Witt ring `TauCeti.WittRing` with
its scalar extension `TauCeti.WittRing.baseChange`. The field-generic quaternary descent
of Layer 5.1 is landed as `QuadraticForm.not_anisotropic_of_not_anisotropic_baseChange_quaternary`
and is not restated.

Every headline theorem of the roadmap is statable at the pins; none is omitted.
-/

namespace TauCetiRoadmap.GlobalQuadraticForms

open IsDedekindDomain NumberField
open TauCeti (hilbertSymbol unitAtRealPlace)
open TauCeti.NumberField.QuadraticForm (GlobalFormInvariants)

universe u v

/-! ## Layer 4: the global square theorem and Hilbert sign prescription -/

section GlobalArithmetic

variable {K : Type u} [Field K] [NumberField K]

/-- **4.2, the global square theorem** (O'Meara 65:15). A unit of a number field that is a square
in all but finitely many finite completions is a square in `K`. No archimedean hypothesis is
needed. The proof route is the norm-index argument: if `a` is a nonsquare, weak approximation
makes every idele a principal idele times an idele norm from `K(√a)`, contradicting the index
`[C_K : N C_{K(√a)}] = 2`. -/
theorem isSquare_of_isSquare_unitAtFinitePlace_of_notMem
    (a : Kˣ) (S : Finset (HeightOneSpectrum (𝓞 K)))
    (h : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S → IsSquare (v.unitAtFinitePlace a)) :
    IsSquare a :=
  sorry

/-- **4.4, the localized product formula** (Hilbert reciprocity). For `a b : Kˣ`
and a finite set `S` of finite places outside which the finite symbols are trivial, the product of
the norm-equation symbols over `S` and over the real places is `1`. Complex places contribute `1`,
so only the real ones appear. -/
theorem hilbertSymbol_localized_productFormula (a b : Kˣ)
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hS : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      hilbertSymbol (v.unitAtFinitePlace a) (v.unitAtFinitePlace b) = 1) :
    letI : Fintype {w : InfinitePlace K // w.IsReal} := Fintype.ofFinite _
    (∏ v ∈ S, hilbertSymbol (v.unitAtFinitePlace a) (v.unitAtFinitePlace b)) *
        ∏ w : {w : InfinitePlace K // w.IsReal},
          hilbertSymbol (unitAtRealPlace w a) (unitAtRealPlace w b) = 1 :=
  sorry

/-- **4.4, Hilbert sign prescription with a prescribed second argument** (O'Meara 71:19). Given a
finite set of finite and real places of even total cardinality at each of which `b` is a
nonsquare, some `a : Kˣ` has symbol `(a, b)_v = -1` exactly at the places of that set. This is an
existence theorem; the product formula alone does not prove it. -/
theorem exists_hilbertSymbol_eq_neg_one_iff
    (b : Kˣ)
    (Tf : Finset (HeightOneSpectrum (𝓞 K)))
    (Tr : Finset {w : InfinitePlace K // w.IsReal})
    (hpar : Even (Tf.card + Tr.card))
    (hbf : ∀ v ∈ Tf, ¬ IsSquare (v.unitAtFinitePlace b))
    (hbr : ∀ w ∈ Tr, ¬ IsSquare (unitAtRealPlace w b)) :
    ∃ a : Kˣ,
      (∀ v : HeightOneSpectrum (𝓞 K),
          hilbertSymbol (v.unitAtFinitePlace a) (v.unitAtFinitePlace b) = -1 ↔ v ∈ Tf) ∧
        ∀ w : {w : InfinitePlace K // w.IsReal},
          hilbertSymbol (unitAtRealPlace w a) (unitAtRealPlace w b) = -1 ↔ w ∈ Tr :=
  sorry

/-- **4.4, Hilbert sign prescription without a prescribed second argument** (O'Meara 71:19). Every
finite set of finite and real places of even total cardinality is exactly the set of places where
`(a, b)_v = -1` for some pair `a b : Kˣ`. -/
theorem exists_hilbertSymbol_eq_neg_one_iff_pair
    (Tf : Finset (HeightOneSpectrum (𝓞 K)))
    (Tr : Finset {w : InfinitePlace K // w.IsReal})
    (hpar : Even (Tf.card + Tr.card)) :
    ∃ a b : Kˣ,
      (∀ v : HeightOneSpectrum (𝓞 K),
          hilbertSymbol (v.unitAtFinitePlace a) (v.unitAtFinitePlace b) = -1 ↔ v ∈ Tf) ∧
        ∀ w : {w : InfinitePlace K // w.IsReal},
          hilbertSymbol (unitAtRealPlace w a) (unitAtRealPlace w b) = -1 ↔ w ∈ Tr :=
  sorry

end GlobalArithmetic

/-! ## Layers 5–6: Hasse–Minkowski, representation, and isometry -/

section HasseMinkowski

variable {K : Type u} [Field K] [NumberField K]
  {V : Type v} [AddCommGroup V] [Module K V]

/-- **5.5, Hasse–Minkowski isotropy** (O'Meara 66:1), over an arbitrary number field: a regular
form is isotropic exactly when it is isotropic at every finite and every real place. -/
theorem hasseMinkowski_isotropic [FiniteDimensional K V]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) :
    ¬ Q.Anisotropic ↔ Q.IsLocallyIsotropic :=
  sorry

/-- **6.1, scalar representation**: a regular form represents a nonzero scalar
exactly when it represents it at every finite and every real place. -/
theorem represents_iff_locallyRepresents [FiniteDimensional K V]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate) (a : K) (ha : a ≠ 0) :
    QuadraticMap.Represents Q a ↔ Q.LocallyRepresentsScalar a :=
  sorry

/-- **6.2, representation of forms** (O'Meara 66:3): a regular form `Q` admits an injective
isometry into a regular form `R` exactly when it does so at every finite and every real place. -/
theorem represented_iff_locallyRepresented [FiniteDimensional K V]
    {W : Type v} [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate) :
    Q.IsRepresentedBy R ↔ Q.LocallyRepresents R :=
  sorry

/-- **6.3, Hasse–Minkowski isometry** (O'Meara 66:4): two regular forms are isometric exactly when
they are isometric at every finite and every real place. -/
theorem hasseMinkowski_equivalent [FiniteDimensional K V]
    {W : Type v} [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate) :
    Q.Equivalent R ↔ Q.LocallyEquivalent R :=
  sorry

end HasseMinkowski

/-! ## Layers 7–8: global existence and classification -/

section Existence

variable {K : Type u} [Field K] [NumberField K]

/-- **7.3, existence from an admissible invariant system** (O'Meara 72:1). Every admissible system
`(n, d, s, p)` is the system of invariants of a regular form on `Kⁿ`. -/
theorem exists_globalForm_of_isAdmissible (I : GlobalFormInvariants K)
    (hI : I.IsAdmissible) :
    ∃ Q : QuadraticForm K (Fin I.rank → K),
      ∃ hQ : Q.Nondegenerate, Q.globalInvariants hQ = I :=
  sorry

/-- **7.4, uniqueness of a global realization**: two regular forms with the same rank, global
discriminant, finite Hasse signs and real positive indices are isometric. -/
theorem equivalent_of_globalInvariants_eq
    {V W : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate)
    (h : Q.globalInvariants hQ = R.globalInvariants hR) :
    Q.Equivalent R :=
  sorry

/-- **8.1, complete global classification**: equality of rank, global
discriminant, every finite Hasse sign and every real positive index is necessary and sufficient
for two regular forms to be isometric. -/
theorem equivalent_iff_globalInvariants_eq
    {V W : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate) :
    Q.Equivalent R ↔ Q.globalInvariants hQ = R.globalInvariants hR :=
  sorry

/-- **8.4, the form-theoretic consequence consumed by Orthogonal and Spin Groups**: locally
isometric regular forms are isometric. That roadmap owns the translation to `H¹(K, SO(Q))`. -/
theorem equivalent_of_locallyEquivalent
    {V W : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (R : QuadraticForm K W) (hR : R.Nondegenerate)
    (h : Q.LocallyEquivalent R) :
    Q.Equivalent R :=
  (hasseMinkowski_equivalent Q hQ R hR).2 h

/-- **8.3, injectivity of the global-to-local Witt map.** A Witt class of `K` that becomes zero in
the Witt ring of every finite completion and of every real completion is zero. Together with 8.2
this is the Witt-ring form of Hasse–Minkowski. Complex places are omitted: a class that vanishes
at one finite place has even rank, and rank parity is the only invariant of `W(ℂ)`. -/
theorem injective_wittRing_baseChange_places :
    letI : Invertible (2 : K) := invertibleOfNonzero two_ne_zero
    Function.Injective fun x : TauCeti.WittRing K =>
      ((fun v : HeightOneSpectrum (𝓞 K) =>
          TauCeti.WittRing.baseChange (L := v.adicCompletion K) x),
        fun w : {w : InfinitePlace K // w.IsReal} =>
          letI : Algebra K ℝ := (InfinitePlace.embedding_of_isReal w.2).toAlgebra
          TauCeti.WittRing.baseChange (L := ℝ) x) :=
  sorry

end Existence

end TauCetiRoadmap.GlobalQuadraticForms
