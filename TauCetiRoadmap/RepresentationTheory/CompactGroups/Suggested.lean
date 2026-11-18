/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.RepresentationTheory.Compact.Unitarizable
import TauCeti.RepresentationTheory.Compact.Semisimple
import TauCeti.RepresentationTheory.Continuous.OrthogonalDecomposition
import TauCeti.RepresentationTheory.Compact.SchurOrthogonality
import TauCeti.RepresentationTheory.Compact.RepresentativeDensity
import TauCeti.RepresentationTheory.Compact.PeterWeyl
import TauCeti.RepresentationTheory.Compact.IsotypicBlock.Basic
import TauCeti.RepresentationTheory.Compact.TraceCoefficient.HilbertSum
import TauCeti.RepresentationTheory.Compact.Character.Basic
import TauCeti.RepresentationTheory.Compact.Character.Basis
import TauCeti.RepresentationTheory.Compact.Character.IsotypicProjection
import TauCeti.RepresentationTheory.Compact.FrobeniusSchur.Trichotomy
import TauCeti.RepresentationTheory.Compact.FrobeniusSchur.InvariantForm
import TauCeti.RepresentationTheory.SU2.Exhaustion
import TauCeti.RepresentationTheory.SU2.TorusConjugacy
import TauCeti.RepresentationTheory.SU2.Weyl.Character
import TauCeti.RepresentationTheory.SU2.Weyl.Integration

/-!
# Representations of compact groups and the Peter-Weyl theorem: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti.

Every headline theorem of the roadmap is proved in Tau Ceti at the pin, under the hypotheses the
README states (in particular continuity `Continuous π` of every representation it concerns), so
this file restates none of them: it pins each one with `#check`, and the elaborated types are the
acceptance test. No headline theorem is left unstatable at the pins.

The headline theorems pinned below are: unitarizability (Layer 1); complete reducibility (Layer 2);
the two Schur orthogonality relations (Layer 4); uniform density and point separation of the
representative functions, the Peter-Weyl Hilbert basis with its elements, and the isotypic
decomposition of `L²(G)` with its block projections and its `G × G`-equivariance (Layer 5);
orthonormality of characters, the character basis of the class functions, the range of the
isotypic projectors and the Frobenius-Schur theorem (Layer 6); and for `SU(2)`, irreducibility and
exhaustion of the symmetric powers, torus conjugacy, the Weyl character formula, the Weyl
integration formula and orthonormality of the characters (engine case).
-/

namespace TauCetiRoadmap.RepresentationTheory.CompactGroups

/-! ## Layer 1: unitarizability (Weyl's unitarian trick)

A continuous representation of a compact group on a complete inner product space has a positive
definite self-adjoint Gram operator `S` with `(π g)† ∘ S ∘ π g = S` for every `g`. -/

#check @ContRepresentation.isUnitarizable

/-! ## Layer 2: complete reducibility

A unitary finite-dimensional representation is an orthogonal internal direct sum of irreducible
subrepresentations; a finite-dimensional representation of a compact group with continuous matrix
coefficients is semisimple. -/

#check @ContRepresentation.IsUnitary.exists_orthogonal_irreducible_decomposition
#check @Representation.isSemisimpleRepresentation_of_continuous

/-! ## Layer 4: Schur orthogonality in L²(G)

For a unitary irreducible `π` of dimension `d`, the `L²` pairing of the coefficients of `(v₁, w₁)`
and `(v₂, w₂)` is `d⁻¹ · conj⟪v₁, v₂⟫ · ⟪w₁, w₂⟫`; coefficients of inequivalent irreducibles are
orthogonal. -/

#check @ContRepresentation.schur_orthogonality_self
#check @ContRepresentation.schur_orthogonality

/-! ## Layer 5: the Peter-Weyl theorem

The representative `*`-subalgebra is uniformly dense in `C(G, 𝕜)` and, for a `T1` group, separates
points. The normalized matrix coefficients of the chosen models of the irreducibles are a Hilbert
basis of `L²(G)`. `L²(G)` is the Hilbert sum of the coefficient blocks of a skeleton, the
projection onto a block is convolution with `dim · conj χ`, and the isometry onto the Hilbert sum
of the endomorphism spaces intertwines the two-sided translations. -/

#check @TauCeti.representativeStarSubalgebra_dense
#check @TauCeti.representativeStarSubalgebra_separatesPoints
#check @TauCeti.stdPeterWeylBasis
#check @TauCeti.coe_stdPeterWeylBasis
#check @TauCeti.isHilbertSum_peterWeylBlock
#check @TauCeti.peterWeylBlockAveraging_eq_starProjection
#check @TauCeti.peterWeylTraceEquiv_biRegularLp

/-! ## Layer 6: characters of compact groups

Characters of unitary irreducibles are orthonormal; the characters of the chosen models are a
Hilbert basis of the class functions in `L²(G)`; the isotypic projector cuts out the isotypic
component; the Frobenius-Schur indicator of a unitary irreducible is `1`, `0` or `-1`, with `1`
and `-1` characterized by invariant symmetric and alternating forms. -/

#check @ContRepresentation.character_orthonormal_self
#check @ContRepresentation.character_orthonormal_distinct
#check @TauCeti.stdCharacterBasis
#check @TauCeti.coe_stdCharacterBasis
#check @ContRepresentation.range_isotypicProjector
#check @ContRepresentation.frobeniusSchurIndicator_trichotomy
#check @ContRepresentation.frobeniusSchurIndicator_eq_one_iff
#check @ContRepresentation.frobeniusSchurIndicator_eq_neg_one_iff

/-! ## Engine case: `SU(2)` and the maximal torus

The symmetric powers `Symⁿ(ℂ²)` are irreducible and every finite-dimensional irreducible continuous
representation of `SU(2)` is equivalent to exactly one of them; every element is conjugate into the
torus; the character of `Symⁿ(ℂ²)` at `diag(e^{iθ}, e^{-iθ})` is `sin((n+1)θ)/sin θ` off `πℤ`; a
continuous class function integrates against `(2π)⁻¹ · 4 sin²θ dθ` on `[0, π]`; and the characters
are orthonormal against Haar measure. -/

#check @TauCeti.SU2.isIrreducible_symPowerModel
#check @TauCeti.SU2.existsUnique_nonempty_equiv_symPower
#check @TauCeti.SU2.exists_isConj_torusExp
#check @TauCeti.SU2.character_symPower_torusExp_eq_sin_div_sin
#check @TauCeti.SU2.weyl_integration_formula
#check @TauCeti.SU2.integral_character_symPower_mul_conj

end TauCetiRoadmap.RepresentationTheory.CompactGroups
