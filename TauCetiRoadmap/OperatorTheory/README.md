# Operator theory

A connected family of roadmaps for the theory of bounded operators on Hilbert spaces and
the spectral perturbation theory built on it. Each subdirectory contains a roadmap
`README.md` and representative signatures in `Suggested.lean`; this page records their
scope and dependencies.

## Scope

- bounded operators between Hilbert spaces, over `ℝ` and `ℂ` uniformly where the
  mathematics permits;
- the finite-dimensional self-adjoint functional calculus over `RCLike`, the continuous
  functional calculus for bounded self-adjoint operators on complete `RCLike` Hilbert spaces,
  positive square roots, the operator modulus, polar decomposition, and partial isometries;
- singular systems and Moore–Penrose inverses;
- Gram operators, orthogonal projections, and the geometry of spectral subspaces;
- majorization and unitarily invariant norms, square and rectangular;
- principal angles and eigenvalue perturbation;
- approximation numbers and the symmetric operator ideals their gauges define;
- the bounded Borel functional calculus, projection-valued measures, and the spectral
  theory of unbounded self-adjoint operators, with Stone's theorem;
- Hardy-space Toeplitz operators, scalar and matrix symbols, Fredholm index
  and stable finite sections;
- spectral-subspace perturbation: Sylvester equations, Rosenblum, and the Davis–Kahan
  `sin Θ` theorems;
- matrix spectral statistics that feed statistical applications of the perturbation theory —
  entrywise-to-spectral comparisons, measurability of spectral functions of a random matrix,
  and elementary matrix concentration.

## The roadmaps

- [**Polar decomposition**](PolarDecomposition/README.md) — the finite self-adjoint
  functional calculus over `RCLike`, the continuous functional calculus for bounded
  self-adjoint operators on complete `RCLike` Hilbert spaces, the positive square root and the
  operator modulus, polar decomposition and partial isometries, singular systems and the
  Moore–Penrose inverse.
- [**Orthogonal geometry**](OrthogonalGeometry/README.md) — Gram rigidity, the coordinate
  isometry of an orthonormal family, projection geometry, orthogonal series, and reducing
  subspaces.
- [**Majorization**](Majorization/README.md) — weak majorization and the transfer descent
  as convex analysis, forward Schur–Horn/Karamata diagonal inequalities, Ky Fan sums and Fan
  dominance, unitarily invariant norms
  square and rectangular, and the Frobenius seminorm.
- [**Principal angles**](PrincipalAngles/README.md) — principal angles as singular values
  of an overlap operator, the projection gap, finite-dimensional point-spectral subspaces and
  projectors, the separation predicates, Hoffman–Wielandt and Davis's eigenvalue-change bound.
- [**Self-adjoint spectral theory**](SelfAdjointSpectralTheory/README.md) — one-parameter
  unitary groups and Stone's theorem, the bounded Borel functional calculus and
  projection-valued measures, closed operators and resolvents on `LinearPMap`, and the
  spectral measure of an unbounded self-adjoint operator.
- [**Operator ideals**](OperatorIdeals/README.md) — approximation numbers as the
  infinite-dimensional continuation of singular values, symmetric norming functions and
  the ideals they induce, Schatten classes, and Hilbert–Schmidt operators realised as `ℓ²`
  of columns.
- [**Spectral-subspace perturbation**](SpectralSubspacePerturbation/README.md) — the
  Haagerup–Zsidó kernel behind the sharp `π/2` constant, Sylvester equations and the
  Rosenblum theorem, the Davis–Kahan `sin Θ` family, and the Yu–Wang–Samworth statistical
  variant.
- [**Matrix spectral statistics**](MatrixSpectralStatistics/README.md) — rank and Gram
  factorizations with their uniqueness, entrywise-to-spectral comparisons and
  measurability of spectral functions, sample moments and matrix concentration.
- [**Toeplitz operators**](ToeplitzOperators/README.md) — the native Hardy/Fourier
  model, bounded symbols, Coburn's alternative, Fredholm symbols and stable
  finite sections, consuming the C*-algebra and Calkin suppliers.

ToeplitzOperators owns the Hardy model, measurable scalar/block symbols,
Fredholm-symbol comparisons and finite sections. CStarAlgebras C8 owns
its scalar shift extension, and OperatorKTheory K4 owns the Calkin and
compact-perturbation index foundation.

## How they depend on one another


| roadmap                        | direct roadmap prerequisites                                                                                 |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------- |
| `PolarDecomposition`           | Mathlib                                                                                                    |
| `OrthogonalGeometry`           | Mathlib                                                                                                    |
| `Majorization`                 | `PolarDecomposition`, `OrthogonalGeometry`                                                                 |
| `PrincipalAngles`              | `PolarDecomposition`, `OrthogonalGeometry`, `Majorization`                                                 |
| `SelfAdjointSpectralTheory`    | `OrthogonalGeometry`, `OneParameterSemigroups`, `BanachSpaceTheory` B1/B5 (SA-B63/65 only) |
| `OperatorIdeals`               | `PolarDecomposition`, `Majorization`                                                                       |
| `MatrixSpectralStatistics`     | `PolarDecomposition`                                                                                       |
| `ToeplitzOperators`            | Mathlib Fourier/projection APIs, Tau Ceti circle degree, `BanachSpaceTheory` B5, `CStarAlgebras` C1/C5/C8, `OperatorKTheory` K4 |
| `SpectralSubspacePerturbation` | `PolarDecomposition`, `Majorization`, `PrincipalAngles`, `SelfAdjointSpectralTheory`                       |


`PrincipalAngles` needs `Majorization` for Davis's eigenvalue-change bound, which runs
through Birkhoff's theorem and the permutation-orbit convex hull. `OperatorIdeals` needs it
for the Ky Fan triangle inequality and for the Frobenius seminorm its `S₂` identification is
stated against.

### Dependency-minimal material

The Haagerup–Zsidó kernel in `SpectralSubspacePerturbation` Part A and the unitary-group
and bounded-Borel-calculus layers in `SelfAdjointSpectralTheory` Parts A and B depend only
on Mathlib within this family. SelfAdjointSpectralTheory's bidual comparison
`SA-B63` and `SA-B65` additionally consume `BanachSpaceTheory` B1/B5.
Part D consumes Tau Ceti’s supplied scalar-generic `LinearPMap`
resolvent core. The unitary-group restriction and generator
relation `SA-A15`–`SA-A16` also consume `OneParameterSemigroups`.

## Ownership boundaries

Between roadmaps in this family:

- **Unitarily invariant norms are defined once**, in `Majorization`, including the
  rectangular Frobenius seminorm that `OperatorIdeals` identifies `S₂` with. The
  perturbation roadmap states its estimates in that shared vocabulary.
- **The operator modulus and the polar decomposition** belong to `PolarDecomposition`.
- **Gram rigidity, coordinate isometries, the orthogonal-family constructor, projected-subspace
  completeness, and the reducing-subspace definition** belong to `OrthogonalGeometry`.
  Invariant subspaces, symmetric restrictions, and orthogonal-series estimates use Mathlib.
- **The projection gap, finite-dimensional point-spectral subspaces/projectors, the restricted point
  spectrum, the separation predicates and `sinThetaMap`** belong to `PrincipalAngles`. PVM spectral
  projections and their ranges belong to `SelfAdjointSpectralTheory`. `PointInternalGap`, the member
  of the separation family with both spectra from one operator, belongs to `SpectralSubspacePerturbation`,
  which is where it is consumed.
- **Approximation numbers and every gauge of them** belong to `OperatorIdeals`.
- **The domain-aware Sylvester equation** — the transport statement `A X − X B = C` with
  its domain bookkeeping — belongs to `SelfAdjointSpectralTheory`, together with its use of
  Tau Ceti’s supplied scalar-generic `LinearPMap` resolvent core, the self-adjoint resolvent
  estimates, and the imaginary-shift Yosida approximants. Its solvability and its a-priori
  estimates belong to `SpectralSubspacePerturbation`.
- **Matrix-level statements with entrywise hypotheses** belong to
  `MatrixSpectralStatistics`.

With roadmaps outside this family:

- [**One-parameter semigroups**](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md)
  owns strongly continuous semigroups and groups in general, generators as general
  unbounded operators, Hille–Yosida, Lumer–Phillips, and the general theory of a
  generator's resolvent. `SelfAdjointSpectralTheory` owns the bounded Borel functional
  calculus, projection-valued measures, spectral measures, the self-adjoint `LinearPMap`
  theory, the self-adjoint and unitary specialization, and Stone's theorem as the bridge
  between the two developments. Both developments use Mathlib `LinearPMap` for unbounded
  operators and share the `TauCeti.LinearPMap` resolvent vocabulary and the `zI-A` convention.
  The shared namespace also contains the partial-operator spectrum. The self-adjoint specialization
  adds resolvent estimates, the Cayley transform, and spectral theory.

## Acknowledgements

An Apache-2.0 implementation of most of this material exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.); each child roadmap records the relevant provenance.
