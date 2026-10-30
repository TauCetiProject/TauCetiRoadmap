import Mathlib
import TauCeti.Analysis.Complex.ModularForms.LevelOne.JInputs
import TauCeti.NumberTheory.BinaryQuadraticForm.Reduction
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.Ideal

/-!
# Complex multiplication and explicit reciprocity: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for selected milestones; discharging them
finishes neither a layer nor the roadmap.

CM.3.1's singular-modulus integrality theorem is stated for every quadratic point of the
upper half-plane, using Tau Ceti's normalized modular `j`. The analytic class polynomial
uses the native complete reduced-form census, filtered for primitivity. Its integer
coefficients, separability and irreducibility over the imaginary quadratic field are stated
for every negative quadratic order discriminant. CM.5.3's unconditional root and coefficient
bounds concern that same polynomial. CM.4.3's canonical Gross-character existence criterion
is stated on the native Hecke-character carrier, with its algebraicity,
ideal character and least finite conductor. The defining predicate spells out the
conjugation, principal-sign and ramified-support conditions on those objects.

At the pinned revisions, the CM-type, primitive-core, inverse-coset reflex-pair and
selected tensor-factor interfaces needed for CM.0's reflex comparisons are absent.
CM.1's ideal-lattice classification and CM.2's polarized classification and explicit
reciprocity require CM actions, complex uniformization, relative Serre tensors, polarizations
and regular Siegel level functions. The field abelian-variety and isogeny carriers alone
do not supply these comparisons.

The ideal-lattice/CM-point comparison and ring/ray class-field objects needed for CM.3's
Artin action and exact field generation are absent. For CM.4's attachment,
Tate-component, all-prime factorization, induction and good-reduction statements, the CM
realization, Galois-avatar and local Euler-factor comparisons are missing. In particular,
canonical-character existence here does not state its attachment to a curve over the
Hilbert class field. CM.5's Deuring classification and lifting, CM Newton slopes,
isogeny-order graphs, ordinary-conductor criteria and reduction products require the
ordinary/supersingular endomorphism-order, good-reduction, crystalline CM-component and
embedded quaternion-order interfaces. The README specifies those headline statements on
the named supplier interfaces.
-/

open scoped NumberField nonZeroDivisors BigOperators
open Polynomial TauCeti.BinaryQuadraticForm
open TauCeti.GlobalNumberFields

namespace TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity

/-- CM.3.1: every singular modulus of the normalized modular invariant is an algebraic integer. -/
theorem singularModulus_integral (τ : UpperHalfPlane)
    (hτ : (minpoly ℚ (τ : ℂ)).natDegree = 2) :
    IsIntegral ℤ (TauCeti.ModularForm.j τ) := by
  sorry

/-- The complete reduced primitive census of discriminant `-D`, on native positive forms. -/
def primitiveReducedForms (D : ℕ) [NeZero D] : Finset (posDef D) :=
  ((TauCeti.reducedForms D).attach.filter
    (fun f => f.1.a.natAbs.gcd (f.1.b.natAbs.gcd f.1.c.natAbs) = 1)).map
    ⟨fun f => ⟨f.1, mem_posDef_of_mem_reducedForms f.2⟩, by
      intro f g h
      apply Subtype.ext
      exact congrArg (fun q : posDef D => q.1) h⟩

/-- The analytic order class polynomial, with each reduced primitive class included once. -/
noncomputable def classPolynomial (D : ℕ) [NeZero D] : ℂ[X] :=
  ∏ f ∈ primitiveReducedForms D, (X - C (TauCeti.ModularForm.j (root f)))

/-- CM.3.1: an integral, separable class polynomial of the class-number degree. -/
theorem classPolynomial.integral (D : ℕ) [NeZero D] (hD : D % 4 = 0 ∨ D % 4 = 3) :
    ∃ P : ℤ[X], P.Monic ∧ P.map (Int.castRingHom ℂ) = classPolynomial D ∧
      (classPolynomial D).Separable ∧ P.natDegree = (primitiveReducedForms D).card := by
  sorry

/-- CM.3.1: the order class polynomial is irreducible over its imaginary quadratic field. -/
theorem classPolynomial.irreducible (D : ℕ) [NeZero D]
    (hD : D % 4 = 0 ∨ D % 4 = 3) (P : ℤ[X])
    (hP : P.map (Int.castRingHom ℂ) = classPolynomial D) :
    let K := IntermediateField.adjoin ℚ ({Complex.I * (Real.sqrt D : ℂ)} : Set ℂ)
    Irreducible (P.map (algebraMap ℤ K)) := by
  sorry

/-- The canonical Gross conditions on an algebraic Hecke character of an imaginary quadratic
field, with the chosen complex embedding fixing the positive ideal infinity type.
The ideal-membership equivalence says that `b` is the conjugate of `a`. In a quadratic
field, a conductor prime contains the field discriminant exactly when it is ramified. -/
def IsCanonicalGrossCharacter {K : Type*} [Field K] [NumberField K]
    [NumberField.IsCMField K] [Algebra.IsQuadraticExtension ℚ K]
    (φ : K →+* ℂ) (ψ : HeckeCharacter K) : Prop :=
  let m : Modulus K := ⟨ψ.finiteConductor, ψ.finiteConductor_ne_bot, ∅⟩
  ψ.IsAlgebraic ∧
    (∀ a b : idealsPrimeTo m,
      (∀ x : K, x ∈ (a.1 : FractionalIdeal (𝓞 K)⁰ K) ↔
        NumberField.IsCMField.complexConj K x ∈ (b.1 : FractionalIdeal (𝓞 K)⁰ K)) →
      ψ.idealCharacter b = star (ψ.idealCharacter a)) ∧
    (∀ a : primeToSubgroup m,
      (ψ.idealCharacter (principalIdealPrimeTo m a) : ℂ) = φ (a.1 : K) ∨
      (ψ.idealCharacter (principalIdealPrimeTo m a) : ℂ) = -φ (a.1 : K)) ∧
    (∀ v : IsDedekindDomain.HeightOneSpectrum (𝓞 K),
      v.asIdeal ∣ ψ.finiteConductor →
      (NumberField.discr K : 𝓞 K) ∈ v.asIdeal)

/-- CM.4.3: canonical Gross characters exist exactly for the stated fundamental discriminants.
Their ideal values lie in `ℂ`, allowing algebraic coefficient extensions of the CM field. -/
theorem canonicalGrossExistence {K : Type*} [Field K] [NumberField K]
    [NumberField.IsCMField K] [Algebra.IsQuadraticExtension ℚ K] (φ : K →+* ℂ) :
    (∃ ψ : HeckeCharacter K, IsCanonicalGrossCharacter φ ψ) ↔
      NumberField.discr K ≠ -3 ∧
        (Odd (NumberField.discr K) ∨ (8 : ℤ) ∣ NumberField.discr K) := by
  sorry

/-- CM.5.3: the unconditional CM root bound and its integer coefficient bound. -/
theorem classPolynomialHeightBound (D : ℕ) [NeZero D] (hD : D % 4 = 0 ∨ D % 4 = 3) :
    let M : posDef D → ℝ := fun f =>
      Real.exp (Real.pi * Real.sqrt D / f.1.a) + 2114567 / 1000
    (∀ f ∈ primitiveReducedForms D, ‖TauCeti.ModularForm.j (root f)‖ ≤ M f) ∧
      ∀ k : ℕ, ‖(classPolynomial D).coeff k‖ ≤
        (⌈∏ f ∈ primitiveReducedForms D, (1 + M f)⌉ : ℤ) := by
  sorry

end TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity
