module

public import Mathlib
public import TauCeti.NumberTheory.ArithmeticDirichletSeries.NaturalDensity
public import TauCeti.NumberTheory.ModularForms.Newforms.Fields

/-!
# Galois representations attached to modular and Hilbert modular forms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for its headline results.
The pins are Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and
Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5.

The density-one ordinary-prime theorem of README §7.7 is stated on Tau Ceti's
actual classical newforms and coefficient fields. Ordinarity means that the
integral Fourier coefficient a_p lies outside some coefficient prime above p.
Squarefree level and trivial nebentypus exclude CM, so a separate CM predicate
is unnecessary in this statement. All coefficient fields are allowed, and the
existential quantifier over coefficient primes is retained.

The other headline results require objects absent at these pins. The period,
eigenvariety and geometric realization theorems of Layer 0 need period rings,
the quaternionic analytic form spaces of QuaternionicModularForms and Shimura
cohomology. Layer 1's DFG comparison needs parabolic premotives and their
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
need residual attachments, geometric Hecke multiplicities, determinant laws and
deformation functors. Layer 7's pure strict fixed-eigenform family, large-image
and residual-ramification theorems need the attached members, residual reductions
and shared compatible-system carrier. None of these is statable at the pins; their
full scope is specified in the README.
-/

@[expose] public section

namespace TauCetiRoadmap.AutomorphicGaloisRepresentations

open IsDedekindDomain UpperHalfPlane
open scoped NumberField

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
