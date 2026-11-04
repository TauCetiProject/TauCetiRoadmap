import Mathlib

/-!
# Abhyankar's lemma for a regular divisor: suggested forms

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Every statement is in Mathlib's vocabulary (README, Convention 2). Declarations with a Stacks
Project counterpart carry Mathlib's `@[stacks]` attribute; those without one say why. The
scheme-level targets, which use Mathlib's
`(@IsFinite ⊓ @Etale : MorphismProperty Scheme).Over ⊤ S` at the pinned
dependency revision and Tau Ceti's `IsEffectiveCartier`, are specified in the README; the affine
forms are stated here.
-/

universe u

namespace TauCetiRoadmap.AbhyankarLemma

noncomputable section

open IsLocalRing

/-! ## Layer 0: extensions of a discrete valuation ring -/

section Layer0

variable (A L : Type u) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
  [Field L] [Algebra A L]

/-- `L` is **unramified with respect to `A`**: every maximal ideal of the integral closure of `A`
in `L` has ramification index one and separable residue field extension. Stacks, Definition
15.113.7 (09E9), clause (1), in the notation of Remark 15.113.6 (09E8). Statements using it assume
that `L` is a finite separable extension of the fraction field of `A`, as Stacks does. -/
@[stacks 09E9 "(1)"]
def IsUnramifiedWRT : Prop :=
  ∀ (P : Ideal (integralClosure A L)) [P.IsMaximal] [P.LiesOver (maximalIdeal A)],
    P.ramificationIdx A = 1 ∧
      Algebra.IsSeparable (A ⧸ maximalIdeal A) (integralClosure A L ⧸ P)

/-- `L` is **tamely ramified with respect to `A`**: every residue field extension is separable and
every ramification index is invertible in `κ_A`. Stacks, Definition 15.113.7 (09E9), clause (2). -/
@[stacks 09E9 "(2)"]
def IsTamelyRamifiedWRT : Prop :=
  ∀ (P : Ideal (integralClosure A L)) [P.IsMaximal] [P.LiesOver (maximalIdeal A)],
    Algebra.IsSeparable (A ⧸ maximalIdeal A) (integralClosure A L ⧸ P) ∧
      IsUnit ((P.ramificationIdx A : ℕ) : A ⧸ maximalIdeal A)

/-- `L` is **totally ramified with respect to `A`**: the integral closure has one maximal ideal,
with trivial residue field extension. Stacks, Definition 15.113.7 (09E9), clause (3). -/
@[stacks 09E9 "(3)"]
def IsTotallyRamifiedWRT : Prop :=
  (∃! P : Ideal (integralClosure A L), P.IsMaximal) ∧
    ∀ (P : Ideal (integralClosure A L)) [P.IsMaximal] [P.LiesOver (maximalIdeal A)],
      Module.finrank (A ⧸ maximalIdeal A) (integralClosure A L ⧸ P) = 1

/-- Unramified extensions are tamely ramified. No tag: immediate from clauses (1) and (2) of
Definition 15.113.7 (09E9). -/
theorem IsUnramifiedWRT.isTamelyRamifiedWRT (h : IsUnramifiedWRT A L) :
    IsTamelyRamifiedWRT A L := by
  sorry

/-- **Kummer extensions of a discrete valuation ring**, clauses (1) and (3): for a uniformizer `π`
and `n ≥ 2`, `X^n − π` defines a degree-`n` extension whose ring of integers `A[X]/(X^n − π)` is a
discrete valuation ring. Stacks, Lemma 15.116.2 (09EV); the remaining clauses are README targets. -/
@[stacks 09EV "(1) and (3)"]
theorem kummer_dvr {π : A} (hπ : Irreducible π) {n : ℕ} (hn : 2 ≤ n) :
    Module.finrank (FractionRing A)
        (AdjoinRoot (Polynomial.X ^ n - Polynomial.C (algebraMap A (FractionRing A) π))) = n ∧
      ∃ _ : IsDomain (AdjoinRoot (Polynomial.X ^ n - Polynomial.C π)),
        IsDiscreteValuationRing (AdjoinRoot (Polynomial.X ^ n - Polynomial.C π)) := by
  sorry

end Layer0

/-! ## Layer 1: ramification in codimension one -/

section Layer1

/-- `S` is **tamely ramified along `a`**: for every prime `Q` of `S` minimal over `aS` lying over
a prime minimal over `aR`, the residue extension is separable and the ramification index is
invertible in the residue field below. For `R` Noetherian, `a` a nonzerodivisor with `R/aR` reduced
and `S` the integral closure of `R` in a finite étale `R_a`-algebra, this is Stacks' "tamely
ramified over `Spec R` in codimension one" (Section 58.31 (0BSE)) for `X = Spec R`, `U = D(a)`;
the README target `isTamelyRamifiedInCodimOne_spec_iff` is the equivalence. -/
@[stacks 0BSE "affine form along a principal divisor"]
def IsTamelyRamifiedAlong (R S : Type u) [CommRing R] [CommRing S] [Algebra R S] (a : R) :
    Prop :=
  ∀ (Q : Ideal S) [Q.IsPrime], Q.under R ∈ (Ideal.span {a}).minimalPrimes →
    Q ∈ ((Ideal.span {a}).map (algebraMap R S)).minimalPrimes →
    letI := (Ideal.ResidueField.map (Q.under R) Q (algebraMap R S) rfl).toAlgebra
    Algebra.IsSeparable (Q.under R).ResidueField Q.ResidueField ∧
      IsUnit ((Q.ramificationIdx R : ℕ) : (Q.under R).ResidueField)

end Layer1

/-! ## Layer 2: extension across a regular divisor -/

section Layer2

/-- A Noetherian local ring with a nonzerodivisor `x` in the maximal ideal such that `R ⧸ (x)` is
a regular local ring is a regular local ring. Stacks, Lemma 10.106.7 (00NU), first sentence. -/
@[stacks 00NU]
theorem IsRegularLocalRing.of_quotient_nonZeroDivisor (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    {x : R} (hx : x ∈ maximalIdeal R) (hreg : x ∈ nonZeroDivisors R)
    [IsRegularLocalRing (R ⧸ Ideal.span {x})] : IsRegularLocalRing R := by
  sorry

end Layer2

/-! ## Layer 3: Abhyankar's lemma -/

section Layer3

/-- The standard tamely ramified cover `A[x]/(x^e − f)`. Stacks, Example 58.31.4 (0EYF). The
algebra is defined without the example's hypotheses; statements carry the ones they use. -/
@[stacks 0EYF "the algebra A[x]/(x^e − f)"]
abbrev standardTameCover (A : Type u) [CommRing A] (f : A) (e : ℕ) : Type u :=
  AdjoinRoot (Polynomial.X ^ e - Polynomial.C f)

/-- The standard cover is free of rank `e`: the "finite locally free" assertion of Stacks,
Example 58.31.4 (0EYF). -/
@[stacks 0EYF "finite locally free"]
theorem standardTameCover_free (A : Type u) [CommRing A] [Nontrivial A] (f : A) (e : ℕ)
    (he : 1 ≤ e) :
    Module.Free A (standardTameCover A f e) ∧ Module.finrank A (standardTameCover A f e) = e := by
  sorry

/-- `C` is `A`-isomorphic to a finite product of standard tamely ramified covers along `f` with
exponents invertible in `A`. No tag: it is the shape of the conclusions of Stacks, Lemmas 58.31.5
(0EYG) and 58.31.6 (0EYH). -/
def IsFiniteProductOfStandardTameCovers (A C : Type u) [CommRing A] [CommRing C] [Algebra A C]
    (f : A) : Prop :=
  ∃ (ι : Type) (_ : Fintype ι) (e : ι → ℕ), (∀ i, 1 ≤ e i) ∧ (∀ i, IsUnit (e i : A)) ∧
    Nonempty (C ≃ₐ[A] ∀ i, standardTameCover A f (e i))

/-- **Abhyankar's lemma for a regular divisor**, affine form. Stacks, Lemma 58.31.5 (0EYG), for
`X = Spec R` and `D = V(a)`, with the cover replaced by its normalization `Spec S` (the object of
Lemma 58.31.6 (0EYH)); "étale locally on `X`" is an étale `R → R'` hitting a given point of `D`. -/
@[stacks 0EYG "affine form", stacks 0EYH "local structure of the normalization, affine form"]
theorem abhyankar_standardCover {R S : Type u} [CommRing R] [CommRing S] [Algebra R S]
    [IsNoetherianRing R] [Module.Finite R S] (a : R) (ha : a ∈ nonZeroDivisors R)
    (hreg : IsRegularRing (R ⧸ Ideal.span {a}))
    (hetale : ∀ (q : Ideal S) [q.IsPrime], algebraMap R S a ∉ q → Algebra.IsEtaleAt R q)
    (hclosure : IsIntegralClosure S R (Localization.Away (algebraMap R S a)))
    (htame : IsTamelyRamifiedAlong R S a) (y : PrimeSpectrum R) (hy : a ∈ y.asIdeal) :
    ∃ (R' : Type u) (_ : CommRing R') (_ : Algebra R R'),
      Algebra.Etale R R' ∧ (∃ y' : PrimeSpectrum R', y'.asIdeal.under R = y.asIdeal) ∧
      algebraMap R R' a ∈ nonZeroDivisors R' ∧
      IsRegularRing (R' ⧸ Ideal.span {algebraMap R R' a}) ∧
      IsFiniteProductOfStandardTameCovers R' (TensorProduct R R' S) (algebraMap R R' a) := by
  sorry

end Layer3

end

end TauCetiRoadmap.AbhyankarLemma
