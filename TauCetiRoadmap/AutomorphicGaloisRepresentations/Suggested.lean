module

public import Mathlib
public import TauCeti.NumberTheory.ArithmeticDirichletSeries.NaturalDensity
public import TauCeti.NumberTheory.ModularForms.Newforms.Fields

/-!
# Galois representations attached to modular and Hilbert modular forms: target signatures

**This file is not the roadmap.** The roadmap is `README.md`; this file states,
against the pinned Mathlib and Tau Ceti, those of its headline theorems that are
statable there. The pins are Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and
Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5.

The density-one ordinary-prime theorem of README §7.7 is stated on Tau Ceti's
actual classical newforms and coefficient fields. Ordinarity means that the
integral Fourier coefficient a_p lies outside some coefficient prime above p.
Squarefree level and trivial nebentypus exclude CM, so a separate CM predicate
is unnecessary in this statement. All coefficient fields are allowed, and the
existential quantifier over coefficient primes is retained.

The other headline results require objects absent at these pins. Layer 0's
period theorems need the crystalline period ring and the Galois-equivariant
period functors; Mathlib's `BDeRhamPlus` and `BDeRham` are the de Rham period
rings as bare rings, with no Galois action or filtration. Layer 0's
slope-finiteness and family theorems (README §0.2e), partial determinant
identity and small-slope classicality (README §0.2f) and eigenvariety
(README §0.3) are statements about the controlling operator U_P on the
analytic quaternionic form spaces
M_D(U, A_{κ,r}) of README §0.2c. They need the analytic weight modules A_{κ,r}
of README §§0.2a–0.2b as right Δ_P-modules, whose action law is the cocycle
theorem for the automorphy factors j_κ(γ) built from the analytic expansion of
the weight character, and the Banach form spaces with U_P as a row-compact
endomorphism (README §§0.2c–0.2d); both constructions carry proof obligations
that are theorems of those sections. Their ingredients are at the pins: level
forms for any coefficient action are a submodule of the functions on the units
of the finite adele ring tensored with D, each slash operator
f ↦ j_κ(γ)·f(w_γ) is a Tau Ceti weighted substitution
`TauCeti.MvPowerSeries.restrictedWeightedSubstCLM`, and
`ContinuousLinearMap.charPowerSeries` is the Fredholm series of an endomorphism
of a module with property (Pr). Layer 0's geometric realization theorems need
Shimura cohomology. Layer 1's DFG comparison needs parabolic premotives and their
Kuga–Sato projector realizations. Layer 2's comparison of the weight-one
Artin representation of AlgebraicModularFormsAndSerreWeights §6.4 with the
normalization of Layer 1 needs that Galois representation, which is absent at
the pins.
The unrestricted Hilbert attachment, character converse and irreducibility of
Layer 3 need Hilbert automorphic representations, algebraic Hecke-character
avatars and labelled period functors. Layer 4's Ramanujan and full local
compatibility theorems additionally need local Langlands parameters and the
Weil–Deligne functor, retaining monodromy. Layer 5's ordinary and crystalline/Wach
comparisons need those attached representations and period modules. Layer 6's
optimized residual eigensystems, integral Hecke determinant and deformation maps
need residual attachments, geometric Hecke multiplicities and deformation
functors; determinant laws themselves are the multiplicative polynomial laws
homogeneous of degree two (Tau Ceti `PolynomialLaw.IsMultiplicative` and
`PolynomialLaw.IsHomogeneousOfDegree`). Layer 7's pure strict fixed-eigenform
family, large-image and residual-ramification theorems need the attached
members, residual reductions and shared compatible-system carrier. None of
these is statable at the pins; their full scope is specified in the README.
-/

@[expose] public section

namespace TauCetiRoadmap.AutomorphicGaloisRepresentations

open IsDedekindDomain UpperHalfPlane
open scoped NumberField

/-! ## Layer 7: density-one ordinary primes -/

/-- Good rational primes at which a weight-two newform is ordinary for some prime
of its coefficient field. Rational primes are represented by the nonzero prime
ideals of the integers of ℚ, with p given by their absolute norm. -/
def ordinaryGoodPrimes {N : ℕ} [NeZero N] (f : HeckeRing.GL2.Newform N 2) :
    Set (HeightOneSpectrum (𝓞 ℚ)) :=
  {v | let p := v.asIdeal.absNorm
    ¬ p ∣ N ∧ ∃ l : HeightOneSpectrum (𝓞 (TauCeti.CoefficientField f)),
      (p : 𝓞 (TauCeti.CoefficientField f)) ∈ l.asIdeal ∧
      ∃ a : 𝓞 (TauCeti.CoefficientField f),
        ((a : TauCeti.CoefficientField f) : ℂ) =
          (qExpansion 1 f.toCuspForm).coeff p ∧ a ∉ l.asIdeal}

/-- README §7.7: the good primes ordinary at some coefficient prime have natural
density one for a squarefree-level weight-two newform with trivial nebentypus.
This is the ordinary-prime conclusion of Skinner §3, printed p. 350. -/
theorem fixedSquarefreeForm_ordinary_density_one {N : ℕ} [NeZero N]
    (f : HeckeRing.GL2.Newform N 2) (hN : Squarefree N) (hχ : f.χ = 1) :
    NumberField.Set.HasNaturalDensity (ordinaryGoodPrimes f) 1 := by
  sorry

end TauCetiRoadmap.AutomorphicGaloisRepresentations
