# Operator theory

A connected family of roadmaps for the theory of bounded operators on Hilbert spaces and
the spectral perturbation theory built on it. Each subdirectory contains a roadmap
`README.md` and representative signatures in `Suggested.lean`; this page records their
scope and dependencies.

## Scope

- bounded operators between Hilbert spaces, over `ℝ` and `ℂ` uniformly where the
  mathematics permits;
- the functional calculus of a self-adjoint operator in finite dimension, positive square
  roots, the operator modulus, polar decomposition, and partial isometries;
- singular systems and Moore–Penrose inverses;
- Gram operators, orthogonal projections, and the geometry of spectral subspaces;
- majorization and unitarily invariant norms, square and rectangular;
- principal angles and eigenvalue perturbation;
- approximation numbers and the symmetric operator ideals their gauges define;
- the bounded Borel functional calculus, projection-valued measures, and the spectral
  theory of unbounded self-adjoint operators, with Stone's theorem;
- spectral-subspace perturbation: Sylvester equations, Rosenblum, and the Davis–Kahan
  `sin Θ` theorems;
- the matrix spectral statistics that consume the perturbation theory — entrywise-to-
  spectral comparisons, measurability of spectral functions of a random matrix, and
  elementary matrix concentration.

## The roadmaps

- [**Polar decomposition**](PolarDecomposition/README.md) — the functional calculus of a
  symmetric operator over `RCLike`, the positive square root and the operator modulus,
  polar decomposition and partial isometries, singular systems and the Moore–Penrose
  inverse.
- [**Orthogonal geometry**](OrthogonalGeometry/README.md) — Gram rigidity, the coordinate
  isometry of an orthonormal family, projection geometry, orthogonal series, and reducing
  subspaces.
- [**Majorization**](Majorization/README.md) — weak majorization and the transfer descent
  as convex analysis, Schur–Horn, Ky Fan sums and Fan dominance, unitarily invariant norms
  square and rectangular, and the Frobenius seminorm.
- [**Principal angles**](PrincipalAngles/README.md) — principal angles as singular values
  of an overlap operator, the projection gap, spectral subspaces and the separation
  predicates, Hoffman–Wielandt and Davis's eigenvalue-change bound.
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

### Independently submittable material

Independent material inside later roadmaps can be started earlier. The Haagerup–Zsidó
kernel (perturbation, Part A), and Stone's theorem and the Borel calculus (spectral theory,
Parts A and B), each depend on nothing in this family.

## Ownership boundaries

Between roadmaps in this family:

- **Unitarily invariant norms are defined once**, in `Majorization`, including the
  rectangular Frobenius seminorm that `OperatorIdeals` identifies `S₂` with. The
  perturbation roadmap states its estimates in that vocabulary and defines no norm of its
  own.
- **The operator modulus and the polar decomposition** belong to `PolarDecomposition`.
- **Gram rigidity, the coordinate isometry, projection geometry, orthogonal series and
  reducing subspaces** belong to `OrthogonalGeometry`.
- **The projection gap, spectral subspaces, the finite-dimensional restricted point spectrum, the separation
  predicates and `sinThetaMap`** belong to `PrincipalAngles`. `InternalGap`, the member of the separation
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
  between the two developments. The two must not carry competing generator or resolvent
  vocabularies. Both model an unbounded operator as a Mathlib `LinearPMap`, so one
  vocabulary suffices; a self-adjoint operator needs its own resolvent *set*, because
  Mathlib's `resolvent` is a Banach-algebra notion, and that definition should be shared.

## Acknowledgements

An Apache-2.0 implementation of most of this material exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.); each child roadmap records the relevant provenance. The public API and
proof structure may change during integration.
