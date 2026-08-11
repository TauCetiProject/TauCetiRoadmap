# Operator theory

A connected family of roadmaps for the theory of bounded operators on Hilbert spaces and
the spectral perturbation theory built on it. Each subdirectory contains a roadmap
`README.md` and representative signatures in `Suggested.lean`; this page records their
scope and dependencies.

## Scope

- bounded operators between Hilbert spaces, over `ℝ` and `ℂ` uniformly where the
  mathematics permits;
- the finite-dimensional self-adjoint functional calculus over `RCLike`, the continuous
  functional calculus for bounded self-adjoint operators on complete real Hilbert spaces,
  positive square roots, the operator modulus, polar decomposition, and partial isometries;
- singular systems and Moore–Penrose inverses;
- Gram operators, orthogonal projections, and the geometry of spectral subspaces;
- majorization and unitarily invariant norms, square and rectangular;
- principal angles and eigenvalue perturbation;
- approximation numbers and the symmetric operator ideals their gauges define;
- the bounded Borel functional calculus, projection-valued measures, and the spectral
  theory of unbounded self-adjoint operators, with Stone's theorem;
- spectral-subspace perturbation: Sylvester equations, Rosenblum, and the Davis–Kahan
  `sin Θ` theorems;
- matrix spectral statistics that feed statistical applications of the perturbation theory —
  entrywise-to-spectral comparisons, measurability of spectral functions of a random matrix,
  and elementary matrix concentration.

## The roadmaps

- [**Polar decomposition**](PolarDecomposition/README.md) — the finite self-adjoint
  functional calculus over `RCLike`, the continuous functional calculus for bounded
  self-adjoint operators on complete real Hilbert spaces, the positive square root and the
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

## How they depend on one another


| roadmap                        | direct roadmap prerequisites                                                                                 |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------- |
| `PolarDecomposition`           | Mathlib                                                                                                    |
| `OrthogonalGeometry`           | Mathlib                                                                                                    |
| `Majorization`                 | `PolarDecomposition`, `OrthogonalGeometry`                                                                 |
| `PrincipalAngles`              | `PolarDecomposition`, `OrthogonalGeometry`, `Majorization`                                                 |
| `SelfAdjointSpectralTheory`    | `OrthogonalGeometry`                                                                                       |
| `OperatorIdeals`               | `PolarDecomposition`, `Majorization`                                                                       |
| `MatrixSpectralStatistics`     | `PolarDecomposition`                                                                                       |
| `SpectralSubspacePerturbation` | `PolarDecomposition`, `Majorization`, `PrincipalAngles`, `SelfAdjointSpectralTheory`                       |


`PrincipalAngles` needs `Majorization` for Davis's eigenvalue-change bound, which runs
through Birkhoff's theorem and the permutation-orbit convex hull. `OperatorIdeals` needs it
for the Ky Fan triangle inequality and for the Frobenius seminorm its `S₂` identification is
stated against.

### Dependency-minimal material

The Haagerup–Zsidó kernel in `SpectralSubspacePerturbation` Part A and the unitary-group,
bounded-Borel-calculus, and self-adjoint resolvent layers in `SelfAdjointSpectralTheory`
Parts A, B, and D depend only on Mathlib within this family.

## Ownership boundaries

Between roadmaps in this family:

- **Unitarily invariant norms are defined once**, in `Majorization`, including the
  rectangular Frobenius seminorm that `OperatorIdeals` identifies `S₂` with. The
  perturbation roadmap states its estimates in that shared vocabulary.
- **The operator modulus and the polar decomposition** belong to `PolarDecomposition`.
- **Gram rigidity, the coordinate isometry, projection geometry, orthogonal series and
  reducing subspaces** belong to `OrthogonalGeometry`.
- **The projection gap, finite-dimensional point-spectral subspaces/projectors, the restricted point
  spectrum, the separation predicates and `sinThetaMap`** belong to `PrincipalAngles`. PVM spectral
  projections and their ranges belong to `SelfAdjointSpectralTheory`. `InternalGap`, the member of the separation
  family with both spectra from one operator, belongs to `SpectralSubspacePerturbation`,
  which is where it is consumed.
- **Approximation numbers and every gauge of them** belong to `OperatorIdeals`.
- **The domain-aware Sylvester equation** — the transport statement `A X − X B = C` with
  its domain bookkeeping — belongs to `SelfAdjointSpectralTheory`, which owns
  `LinearPMap`, together with the self-adjoint resolvent set and the imaginary-shift Yosida
  approximants. Its solvability and its a-priori estimates belong to
  `SpectralSubspacePerturbation`.
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
  operators and share one generator and resolvent vocabulary. The self-adjoint specialization
  adds its resolvent *set* alongside Mathlib's Banach-algebra `resolvent`, with the same
  definition shared across the two developments.

## Acknowledgements

An Apache-2.0 implementation of most of this material exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.); each child roadmap records the relevant provenance.
