# Hilbert-space operator theory

A connected family of roadmaps for the theory of operators on Hilbert spaces. Each
subdirectory contains a roadmap `README.md` and representative signatures in
`Suggested.lean`; this page records their scope and dependencies.

## Scope

Included:

- bounded operators between Hilbert spaces, over `ℝ` and `ℂ` uniformly where the
  mathematics permits;
- the functional calculus of a self-adjoint operator in finite dimension, positive square
  roots, the operator modulus, polar decomposition, and partial isometries;
- singular systems and Moore–Penrose inverses;
- Gram operators, orthogonal projections, and the geometry of spectral subspaces;
- principal angles, and the eigenvalue-perturbation theorems stated in them;
- closed operators and resolvents on `LinearPMap`;
- entrywise-to-spectral comparisons and measurability of spectral functions of a random
  matrix.

Excluded:

- spectral theory of general nonnormal operators;
- operators on general Banach spaces;
- generation theory for `C₀` semigroups beyond the interface the unitary-group material
  needs, which belongs to the
  [one-parameter semigroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md)
  roadmap;
- operator algebras and von Neumann algebras as subjects in their own right;
- noncommutative `Lᵖ` spaces;
- applications to partial differential equations;
- random matrix theory;
- matrix concentration and the statistical layer above it.

## The roadmaps

- [**Hilbert-space operator foundations**](HilbertSpaceOperatorFoundations/README.md) —
  the functional calculus of a symmetric operator over `RCLike`, the positive square root
  and the operator modulus, polar decomposition and partial isometries, singular systems
  and the Moore–Penrose inverse, Gram rigidity, projection geometry and spectral
  subspaces.
- [**Majorization and angles**](MajorizationAndAngles/README.md) — principal angles as
  singular values of an overlap operator, the von Neumann trace inequality,
  Hoffman–Wielandt and Davis's eigenvalue-change bound.
- [**Self-adjoint spectral theory**](SelfAdjointSpectralTheory/README.md) — closed
  operators and resolvents on `LinearPMap`, with the Cayley transform and the
  quadratic-form bounds.
- [**Matrix spectral statistics**](MatrixSpectralStatistics/README.md) — rank and Gram
  factorizations with their uniqueness, entrywise-to-spectral comparisons and
  measurability of spectral functions.

## How they depend on one another

```text
      HilbertSpaceOperatorFoundations                     (wave 1)
         │                    │
         ▼                    ▼
MajorizationAndAngles   SelfAdjointSpectralTheory         (wave 2)
                              │
                              ▼
                      MatrixSpectralStatistics            (wave 3)
```

| roadmap | mathematical prerequisites |
|---|---|
| `HilbertSpaceOperatorFoundations` | Mathlib |
| `MajorizationAndAngles` | foundations |
| `SelfAdjointSpectralTheory` | foundations |
| `MatrixSpectralStatistics` | foundations, self-adjoint spectral theory |

### Independently submittable material

Independent material inside later roadmaps can be started earlier. The `LinearPMap`
resolvent theory (spectral theory, Part D) and rank factorization (statistics, Part A)
each depend on nothing in this family.

## Ownership boundaries

Between roadmaps in this family:

- **Angles are defined once**, in `MajorizationAndAngles`.
- **The operator modulus, spectral subspaces, and the spectral-separation predicates**
  belong to `HilbertSpaceOperatorFoundations`. Every roadmap that hypothesizes a spectral
  gap uses those predicates.
- **Matrix-level statements with entrywise hypotheses** belong to
  `MatrixSpectralStatistics`.

With roadmaps outside this family:

- [**One-parameter semigroups**](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md)
  owns strongly continuous semigroups and groups in general, generators as general
  unbounded operators, Hille–Yosida, Lumer–Phillips, and the general theory of a
  generator's resolvent. `SelfAdjointSpectralTheory` owns the self-adjoint `LinearPMap`
  theory. **The two must not carry competing generator or resolvent
  vocabularies.** Both model an unbounded operator as a Mathlib `LinearPMap`, so one
  vocabulary suffices; a self-adjoint operator needs its own resolvent *set*, because
  Mathlib's `resolvent` is a Banach-algebra notion, and that definition should be shared.

## Acknowledgements

An Apache-2.0 implementation of most of this material exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.); each child roadmap records the relevant provenance. The public API and
proof structure may change during integration.
