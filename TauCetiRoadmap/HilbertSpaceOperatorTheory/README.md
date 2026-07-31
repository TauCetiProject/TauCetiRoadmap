# Hilbert-space operator theory

A connected family of roadmaps for the theory of bounded operators on Hilbert spaces and
the spectral perturbation theory built on it. Each subdirectory is a self-contained
roadmap — a definitive `README.md` and a `Suggested.lean` of representative target
signatures; this page is the index, the scope boundary, and the map of how they fit
together.

**This family does not claim all of operator theory.** It develops one connected body of
material: the functional calculus of a self-adjoint operator and the decompositions it
supports, the order and norm theory that measures them, the ideals that extend singular
values to infinite dimensions, the spectral theory of self-adjoint operators bounded and
unbounded, and the perturbation theorems that consume all of it. The exclusions below are
choices, and roadmaps for the excluded material are welcome as separate work.

## Scope

Included:

- bounded operators between Hilbert spaces, over `ℝ` and `ℂ` uniformly where the
  mathematics permits;
- the functional calculus of a self-adjoint operator in finite dimension, positive square
  roots, the operator modulus, polar decomposition, and partial isometries;
- singular systems and Moore–Penrose inverses;
- Gram operators, orthogonal projections, and the geometry of spectral subspaces;
- majorization, principal angles, and unitarily invariant norms, square and rectangular;
- approximation numbers and the symmetric operator ideals their gauges define;
- the bounded Borel functional calculus, projection-valued measures, and the spectral
  theory of unbounded self-adjoint operators, with Stone's theorem;
- spectral-subspace perturbation: Sylvester equations, Rosenblum, and the Davis–Kahan
  `sin Θ` theorems;
- the matrix spectral statistics that consume the perturbation theory — entrywise-to-
  spectral comparisons, measurability of spectral functions of a random matrix, and
  elementary matrix concentration.

Excluded:

- spectral theory of general nonnormal operators;
- operators on general Banach spaces, beyond the norm-and-rank layer where approximation
  numbers are naturally defined;
- generation theory for `C₀` semigroups beyond the interface the unitary-group material
  needs, which belongs to the
  [one-parameter semigroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md)
  roadmap;
- operator algebras and von Neumann algebras as subjects in their own right;
- noncommutative `Lᵖ` spaces;
- applications to partial differential equations;
- random matrix theory. The statistical roadmap here proves concentration for a sample
  covariance by Chebyshev and a union bound; limiting spectral distributions, universality,
  and the sharp dimensional constants of matrix Bernstein are not in scope.

## The roadmaps

- [**Hilbert-space operator foundations**](HilbertSpaceOperatorFoundations/README.md) —
  the functional calculus of a symmetric operator over `RCLike`, the positive square root
  and the operator modulus, polar decomposition and partial isometries, singular systems
  and the Moore–Penrose inverse, Gram rigidity, projection geometry and spectral
  subspaces. The vocabulary every other roadmap here is stated in.
- [**Majorization and angles**](MajorizationAndAngles/README.md) — weak majorization and
  the transfer descent as convex analysis, Schur–Horn, Ky Fan sums and Fan dominance,
  unitarily invariant norms square and rectangular, principal angles as singular values of
  an overlap operator, Hoffman–Wielandt and Davis's eigenvalue-change bound.
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
  factorizations with their uniqueness, Berge's maximum theorem for argmin stability,
  entrywise-to-spectral comparisons and measurability of spectral functions, sample moments
  and matrix concentration.

## How they depend on one another

```text
      HilbertSpaceOperatorFoundations                     (wave 1)
         │                    │
         ▼                    ▼
MajorizationAndAngles   SelfAdjointSpectralTheory         (wave 2)
         │                    │            │
         └────────┬───────────┘            ▼
                  ▼                MatrixSpectralStatistics  (wave 3)
           OperatorIdeals                                  (wave 3)
                  │
                  ▼
      SpectralSubspacePerturbation                        (wave 4)
```

| roadmap | mathematical prerequisites |
|---|---|
| `HilbertSpaceOperatorFoundations` | Mathlib |
| `MajorizationAndAngles` | foundations |
| `SelfAdjointSpectralTheory` | foundations |
| `OperatorIdeals` | foundations, majorization, self-adjoint spectral theory |
| `MatrixSpectralStatistics` | foundations, self-adjoint spectral theory |
| `SpectralSubspacePerturbation` | all five preceding roadmaps |

These edges state mathematical ownership: each roadmap consumes public objects and theorems
specified by its predecessors. Exact donor-module counts and import-graph diagnostics belong to
this repository's internal topic map, not to the upstream mathematical specification.

Reading the waves:

1. **Foundations goes first.** It rests only on Mathlib, and every other roadmap names it.
2. **Majorization and self-adjoint spectral theory unlock in parallel.** Neither needs the
   other: the first is finite-dimensional order and norm theory, the second is measure
   theory and unbounded operators.
3. **Operator ideals and matrix spectral statistics follow.** Operator ideals needs the
   norm theory of the majorization roadmap for the Ky Fan triangle inequality, and the
   spectral theory for the finite-rank behaviour of spectral bands.
4. **Spectral-subspace perturbation is the endpoint** and needs everything. That
   transitive depth is the honest cost of stating Davis–Kahan over objects that exist
   rather than over objects assumed: every norm, angle, ideal, and spectral projection its
   theorems quantify over is built first.

Independent material inside later roadmaps can be started earlier. The Haagerup–Zsidó
kernel (perturbation, Part A), Stone's theorem and the Borel calculus (spectral theory,
Parts A and B), the `LinearPMap` resolvent theory (Part D), and rank factorization and
Berge (statistics, Parts A and B) each depend on nothing in this family.

## Ownership boundaries

Between roadmaps in this family:

- **Norms and angles are defined once**, in `MajorizationAndAngles`. The perturbation
  roadmap states its estimates in that vocabulary and defines no norm of its own.
- **The operator modulus, spectral subspaces, and the spectral-separation predicates**
  belong to `HilbertSpaceOperatorFoundations`. Every roadmap that hypothesizes a spectral
  gap uses those predicates.
- **Approximation numbers and every gauge of them** belong to `OperatorIdeals`, including
  approximation numbers of spectral bands, whose proofs consume the unbounded spectral
  measure. That the *proof* runs through spectral theory does not make the *statement*
  spectral theory.
- **The domain-aware Sylvester equation** — the transport statement `A X − X B = C` with
  its domain bookkeeping — belongs to `SelfAdjointSpectralTheory`, which owns
  `LinearPMap`. Its solvability and its a-priori estimates belong to
  `SpectralSubspacePerturbation`.
- **Matrix-level statements with entrywise hypotheses** belong to
  `MatrixSpectralStatistics`. The abstract operator theory does not descend into
  coordinates.

With roadmaps outside this family:

- [**One-parameter semigroups**](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md)
  owns strongly continuous semigroups and groups in general, generators as general
  unbounded operators, Hille–Yosida, Lumer–Phillips, and the general theory of a
  generator's resolvent. `SelfAdjointSpectralTheory` owns the bounded Borel functional
  calculus, projection-valued measures, spectral measures, the self-adjoint `LinearPMap`
  theory, the self-adjoint and unitary specialization, and Stone's theorem as the bridge
  between the two developments. **The two must not carry competing generator or resolvent
  vocabularies.** Both roadmaps model an unbounded operator as a Mathlib `LinearPMap`,
  which is what makes one vocabulary possible; a self-adjoint operator needs its own
  resolvent *set* because Mathlib's `resolvent` is a Banach-algebra notion, and that
  definition should be shared rather than duplicated. Landing Stone's theorem discharges
  the `C₀`-group stretch goal that roadmap already records, so the coordinated edit there
  is to cite this family for it rather than to specify it twice.

## Submitting the family, and implementing it

A roadmap is accepted before the mathematics is contributed, and the two are separate
reviews. Accepting this family settles what the mathematics is, what the public API should
look like, and where the boundaries between the six documents run. Implementation then
arrives as pull requests against the accepted roadmaps, sized for review rather than by
roadmap: a roadmap's Parts are its natural PR seams, and several Parts here are
independently submittable before the roadmap around them is finished.

A substantial implementation of most of this material exists in the 
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization) (Kitware, Inc., Apache-2.0).
It establishes feasibility and provides source provenance for integration, but
each roadmap here specifies the desired mathematics and does not prescribe the
donor API or proof architecture. Each roadmap's provenance section says what
exists and under what terms.

The child `README.md` files remain the definitive roadmap documents.
