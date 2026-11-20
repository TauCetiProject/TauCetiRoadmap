/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.Matrix.GramFactorization
import TauCeti.Analysis.Matrix.GramFactorization.Uniqueness
import TauCeti.Analysis.Matrix.Eigenvalues.Basic
import TauCeti.Analysis.Matrix.FunctionalCalculus
import TauCeti.Probability.Moments.MatrixConcentration

/-!
# Matrix spectral statistics: target signatures

`README.md` is the roadmap; this file is not the roadmap. It lists the roadmap's headline
theorems and pins, by `#check`, the Tau Ceti declarations that prove them.

The headline theorems are:

* the Gram characterization: a square matrix over `ℝ` or `ℂ` is positive semidefinite of rank at
  most `d` exactly when it is `Aᴴ * A` for a matrix `A` with `d` rows, and two such factors differ
  by a unitary on the left (README §1.2 and §1.3);
* entrywise eigenvalue perturbation: if Hermitian `n × n` matrices have entries within `ε`, their
  sorted eigenvalues are within `n * ε` (README §2.1);
* measurability of spectral functions: for continuous `h`, and for the indicator of `[c, ∞)`,
  `A ↦ cfc h A` is Borel measurable on matrices, so spectral functions and fixed-threshold
  spectral projectors of a measurable random matrix are measurable (README §2.2 and §2.3);
* eigenvalue concentration from entrywise second moments, and its consequence for the empirical
  second-moment matrix: every population eigenvalue at least `c` stays at least `c / 2` with
  probability at least `1 - 4 d⁴ v / (r c²)` (README §3.4).

Every one of them is statable at the pins, and every one is proved in the pinned Tau Ceti library,
so this file restates none of them. The `#check` lines below pin the Tau Ceti declarations that
prove them, whose hypotheses the README records under its supplier contracts; the file fails to
build if one of them is renamed or removed. A `#check` does not compare a declaration's statement
with the README's.
-/

namespace TauCetiRoadmap.MatrixSpectralStatistics

-- Layer 1: positive-semidefinite Gram factorization and its uniqueness.
#check @Matrix.posSemidef_and_rank_le_iff_eq_conjTranspose_mul_self
#check @TauCeti.conjTranspose_mul_self_eq_iff_exists_unitary_mul

-- Layer 2: entrywise eigenvalue perturbation and measurability of spectral functions.
#check @Matrix.IsHermitian.abs_eigenvalues₀_sub_le_of_entry_le
#check @TauCeti.measurable_matrix_cfc
#check @TauCeti.measurable_matrix_cfc_indicator

-- Layer 3: eigenvalue concentration and the empirical second-moment eigenvalue floor.
#check @TauCeti.one_sub_le_measure_forall_abs_eigenvalues₀_sub_le
#check @TauCeti.one_sub_le_measure_forall_half_le_eigenvalues₀_sampleSecondMoment

end TauCetiRoadmap.MatrixSpectralStatistics
