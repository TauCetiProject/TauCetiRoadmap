<!--tauceti-status:v1 {"roadmap":"RepresentationTheory","to_sha":"b4da9b93577b676a9d2f149668a92b3d61897dcd","ts":"2026-09-13T10:51:36Z"}-->
# Status: RepresentationTheory

This file documents the status of the RepresentationTheory roadmap up until `b4da9b9` (2026-09-13T10:51:36Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Cartan-Killing classification, the character tables of a finite group and of
`Sₙ`, Peter-Weyl, Weyl complete reducibility, the highest-weight classification, and now Schur-Weyl
duality and the hook-length formula are established. Partial are the character-table algorithm, the
spin representations, Gabriel's theorem, Auslander-Reiten theory, the classical groups and the
Lie-group correspondence; Mackey theory, symmetric functions and RSK, and the deeper Lie-group
structure theory have not begun in the supplied record.

### Named results

- **[Schur-Weyl duality](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Symmetric/TensorAction/GeneralLinear.html#TauCeti.centralizer_range_tensorPowerRep_asAlgebraHom_eq_range_permTensorActionAlgHom)** — on `(kⁿ)^{⊗d}`, over a field in which `d!` is invertible, the images of `k[S_d]` and of `k[GLₙ]` are each other's centralizers.
- **[The Cartan-Killing classification](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/FiniteType/Classification.html#TauCeti.existsUnique_dynkinType)** — every irreducible reduced crystallographic finite root system has a unique valid Dynkin type.
- **[The hook-length formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Symmetric/Specht/HookLength.html#TauCeti.finrank_spechtModule_mul_prod_hookLength)** — the degree of the Specht module `S^μ` times the product of the hook lengths of the shape is `n!`.
- **[Kostant isotypy for `gl_N`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Lie/GeneralLinear/CAR/Isotypic.html#TauCeti.isIsotypicOfType_glIrreducible_car)** — over an algebraically closed field of characteristic zero, the left-regular CAR module is isotypic, every simple summand carrying the half-shifted staircase highest weight. This is the worked instance, not the Killing-semisimple summit.
- **[The character table of a finite group](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/CharacterTable/Table.html#TauCeti.characterTable)** — the irreducible characters are a basis of the class functions, with both orthogonality relations in row and column form; the integer [table of `Sₙ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Symmetric/Specht/Character.html#TauCeti.symmetricCharacterTable) sits beside it, as does [Peter-Weyl](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Compact/PeterWeyl.html#TauCeti.stdPeterWeylBasis) on the compact side.

### Notable definitions and infrastructure

- **[The BGP reflection functor at a source](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Reflection/Source.html#TauCeti.sourceReflectionFunctor)** — reflecting a representation at a source acts on dimension vectors by the corresponding simple reflection. It is the transport that carries indecomposables along a Coxeter word.
- **[The spin double cover over a general field](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/DoubleCover.html#CliffordAlgebra.spinDoubleCoverSpinorNormKernel)** — `Spin(Q)` is an extension of the kernel of the spinor norm by `ℤ/2`, the form it takes when surjectivity onto `SO(Q)` fails. In the compact real case it is also a covering map, with connected source for `n ≥ 2`.
- **[The inverse function theorem for manifolds](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/LocalDiffeomorph.html#TauCeti.isLocalDiffeomorph_of_mfderiv_eq)** — a `C^n` map whose differentials are all continuous linear equivalences is a local diffeomorphism, which makes the exponential map one at zero, as the closed-subgroup theorem and Baker-Campbell-Hausdorff need.

### Roadmap coverage

Root systems are done, Layers 1-6. Semisimple algebras reach Layer 6 with no gap: the Brauer group is
trivial over algebraically closed and finite fields, and every central simple algebra has a finite
separable splitting field. Schur-Weyl has Layers 0-5, the character half of Layer 6 and the
double-commutant half of Layer 8, but not Murnaghan-Nakayama, the Schur-functor decomposition, Layer
7 or Layer 9. Character theory has Layers 0-5 and 7, part of the Layer 6 solver, and only groundwork
in Layers 8-9. Highest-weight theory has Layers 0-5, Freudenthal and self-duality from Layer 7 and a
substantial Layer 9 `gl_n` interface, leaving the three Layer 6 formulas, Harish-Chandra, Serre and
all of Layer 8. Compact groups reach Peter-Weyl with the circle as a classified engine case, but not
character completeness or `SU(2)`. Induction-restriction has Layers 0-2 and Clifford theory in Layer
5, skipping Mackey in Layers 3-4. Spin has Layers 0-3, 6, 7 and the `gl_N` instance of Layer 9;
Layers 4-5 are partial, with the two type-`D` fork fundamental weights identified as the weights of
explicit exterior-basis vectors annihilated by the positive Serre generators. Quivers have Layer 0,
Layer 4, and uniqueness of almost-split sequences, but neither Gabriel's bijection nor existence of
those sequences. Classical groups have started: tensor powers, the Laurent expansion of a rational
representation on the diagonal torus, and the `GL 2` Weyl dimension. Lie groups
have Layer 0 and partial Layer 2.

## The frontier

- **Gabriel's theorem** — the positive roots of a positive definite Tits form are exactly the reflection images of the simple roots, and the source reflection functor exists; what remains is to carry indecomposables along a Coxeter word.
- **The Weyl character, dimension and Kostant multiplicity formulas** — identify the alternating numerator and derive the three formulas; the denominator machinery, finite-dimensional `L(λ)` and Freudenthal recursion are in place.
- **The Murnaghan-Nakayama rule** — the standard basis and the character table are in hand, so the obstacle is the rim-hook recursion computing the entries.
- **The spin and half-spin modules as `L(ω)`** — the type-`D` fork weights are pinned and the candidate highest-weight vectors annihilated by the positive generators; irreducibility, the dimension `2^{l-1}` and the type-`B` statement are missing.
- **Kostant's isotypy corollary for a semisimple Lie algebra** — the general case needs the adjoint embedding into `𝔰𝔬(𝔤, κ)` and the rank bookkeeping `d = l + 2·#Δ⁺`.
