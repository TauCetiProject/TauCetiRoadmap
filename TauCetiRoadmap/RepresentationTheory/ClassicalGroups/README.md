# Roadmap: finite-dimensional representations of the classical groups

The finite-dimensional representation theory of `GLₙ`, `SLₙ`, `Oₙ`, and `Spₙ` over `ℂ` is one of the
oldest and most concrete corners of Lie theory, and it is the place where the abstract highest-weight
machinery meets an explicit computational engine: the **standard representation** `V = ℂⁿ` and its tensor
powers `V^{⊗d}`. Every **polynomial** irreducible representation of `GLₙ` is cut out of some `V^{⊗d}` by a
**Young symmetrizer**; the general rational irreducibles are **determinant twists** `det^m ⊗ Sᵘ V` of these,
with `m` an integer. A polynomial irreducible's character is a **Schur polynomial**, and its dimension is a
**Weyl dimension formula** that is, for `GLₙ`, a product over the boxes of a Young diagram. Mathlib has the
groups and the entire
multilinear-algebra engine (tensor, exterior, and symmetric powers; Young diagrams; elementary,
complete-homogeneous, and power-sum symmetric polynomials) but **nothing that turns them into
representations**: no standard representation as a `Representation`, no decomposition of a tensor power, no
weight-space theory for a matrix group, no Schur functions as characters, no Weyl character or dimension
formula, and no branching rules.

This roadmap builds that theory, with `GLₙ` primary and the standard representation and its tensor powers as
the concrete engine. It rests on two dependencies developed in parallel: the abstract root-system and
Weyl-group combinatorics of [`../RootSystems`](../RootSystems/README.md), and the highest-weight theory of
semisimple Lie algebras of [`../LieHighestWeight`](../LieHighestWeight/README.md). It connects to
[`../SchurWeyl`](../SchurWeyl/README.md) for the Young symmetrizers, the symmetric-group action on `V^{⊗d}`,
and Schur-Weyl duality, and it overlaps [`../ReductiveGroups`](../../ReductiveGroups/README.md) on the
algebraic-group side. The boundaries with all three are pinned in the conventions below. Suggested home:
`TauCeti/RepresentationTheory/ClassicalGroups/`, mirroring Mathlib's `RepresentationTheory/`.

## Standing conventions

- **The base field is `ℂ`.** State everything over `ℂ` (algebraically closed, characteristic `0`), where
  every finite-dimensional rational representation is completely reducible and highest-weight theory is
  clean. Do **not** state the representation-theoretic results over a general field; character-`p` phenomena
  belong to [`../ReductiveGroups`](../../ReductiveGroups/README.md), where rational representations of an
  affine group scheme are generally *not* semisimple. Where a construction is characteristic-free (the
  functors `⊗ᵈ`, `Symᵏ`, `⋀ᵏ`), state it over a general commutative ring and specialize; where the
  *decomposition* into irreducibles is used, work over `ℂ`.
- **`GLₙ` is primary; the others run alongside.** The engine is `GL n ℂ` acting on `V = Fin n → ℂ`. For
  `SLₙ`, **restriction** of `GLₙ`-representations along `SL n ℂ ↪ GL n ℂ` (quotienting weights by `(1,…,1)`)
  is the whole story. For `Oₙ` and `Spₙ` restriction constructs examples and drives branching, but it is
  **not** the whole story: the invariant form (a symmetric form for `Oₙ`, an alternating form for `Spₙ`)
  supplies a nonzero contraction `V ⊗ V → ℂ`, so the commutant of the group action on `V^{⊗d}` is the
  **Brauer algebra**, not the symmetric group, and the decomposition, indexing, and stability conditions
  genuinely differ from `GLₙ`'s rather than merely shortening. Prove the connected highest-weight theory once
  over `ℂ` and specialize the classification; but treat the `Oₙ`/`Spₙ` tensor decomposition as its own
  (Brauer/invariant-contraction) development, not a corollary of the `GLₙ` one. `Oₙ` is furthermore
  **disconnected**, so its irreducibles are governed by `SOₙ` plus an extension step, not by a Lie-algebra
  highest weight alone.
- **Reuse Mathlib's matrix-group and multilinear vocabulary.** `GL n ℂ` is
  `Matrix.GeneralLinearGroup (Fin n) ℂ`; `SL(n, ℂ)` is `Matrix.SpecialLinearGroup (Fin n) ℂ`; the
  symplectic and orthogonal groups are `Matrix.symplecticGroup` and `Matrix.orthogonalGroup`. A
  representation is `Representation ℂ G V = G →* (V →ₗ[ℂ] V)`, its finite-dimensional bundled form is
  `FDRep ℂ G`, and its character is `FDRep.character`. Tensor powers are `TensorPower ℂ d V = ⨂[ℂ]^d V`,
  exterior powers `exteriorPower ℂ k V = ⋀[ℂ]^k V`, symmetric powers `SymmetricPower ℂ (Fin k) V = Sym[ℂ]^k V`.
  Shapes are `YoungDiagram` and `Nat.Partition`; symmetric functions are `MvPolynomial.esymm`,
  `MvPolynomial.hsymm`, `MvPolynomial.psum`, `MvPolynomial.msymm`. Never introduce a private synonym for any
  of these.
- **Polynomial versus rational representations, kept distinct.** A **rational** representation of `GLₙ` is a
  group homomorphism `GL n ℂ →* GL(W)` whose matrix entries are rational functions of the entries of `g`
  and `det(g)⁻¹`; a **polynomial** one uses no `det⁻¹`. The polynomial irreducibles are indexed by
  **partitions** (`YoungDiagram` with at most `n` rows), the rational ones by **weakly decreasing integer
  sequences** `λ₁ ≥ ⋯ ≥ λₙ` (a `DominantWeight n`), and `V^{⊗d}` is polynomial. Pin `DominantWeight n` as the
  index type for `GLₙ`-irreducibles and identify partitions with the subset `λₙ ≥ 0`. The two are tied by the
  **determinant twist**: for any `λ`, setting `m = λₙ` and `μ = λ - m·(1,…,1)` gives a partition `μ` with
  `V_λ ≅ det^m ⊗ V_μ`, so every rational irreducible is a `det`-power times a polynomial one and the
  polynomial theory carries the rational theory. Rationality itself is a property of a `Representation`,
  defined basis-independently (a comodule over `ℂ[gᵢⱼ, det⁻¹]`); the general comodule framework is
  [`../ReductiveGroups`](../../ReductiveGroups/README.md)'s Layer 1, which this roadmap **cites** rather than
  rebuilds, working with honest `Representation`s of the concrete matrix group and a coordinate-entry lemma.
- **The maximal torus is the diagonal, and weights are its characters.** The maximal torus `T ⊂ GLₙ` is the
  subgroup of invertible diagonal matrices `diagonal (fun i => tᵢ)`; its character lattice is `ℤⁿ`
  (`Fin n → ℤ`) via `diagonal t ↦ ∏ tᵢ^{λᵢ}`. A **weight** of a `GLₙ`-representation `W` is a `λ : Fin n → ℤ`
  whose weight space `Wλ = {w | ∀ t, ρ (diagonal t) w = (∏ tᵢ^{λᵢ}) • w}` is nonzero; the weights refine
  Mathlib's `LieModule.Weight` for the Lie algebra `𝔤𝔩ₙ` under differentiation, and the identification with
  the abstract weight lattice of [`../RootSystems`](../RootSystems/README.md) is an explicit target, not an
  assumption. **Dominant** means weakly decreasing. Reuse `Matrix.diagonal` and Mathlib's root-datum
  vocabulary throughout.
- **Characters are symmetric Laurent polynomials.** For `GLₙ`, evaluating `FDRep.character` at
  `diagonal (x₁, …, xₙ)` gives a symmetric Laurent polynomial in `x₁, …, xₙ`; for polynomial
  representations it is an honest symmetric polynomial, an element of the `MvPolynomial.symmetricSubalgebra`.
  This is the arena in which "the character of the irreducible `V_λ` is the Schur polynomial `s_λ`" is a
  precise statement. Keep the character as a class function on the *group* (`FDRep.character`) and its
  torus restriction as a `MvPolynomial` separate, related by an explicit evaluation lemma.
- **The Weyl construction is the primary route to the polynomial irreducibles; highest weights classify
  all of them.** Build the polynomial irreducibles concretely, as **images of Young symmetrizers acting on
  `V^{⊗d}`** (the Schur functor `Sᵘ V`), because this is Mathlib-native (the symmetric group
  `Equiv.Perm (Fin d)` acts on `⨂[ℂ]^d V`) and gives the character for free via Schur-Weyl. Fix the choice
  once: the symmetrizer `c_λ` is taken for the row-superstandard tableau of shape `λ`, so `Sᵘ V` is a
  definite subspace; other tableaux give canonically isomorphic images, and that isomorphism is a stated
  lemma rather than a silent identification. Prove *separately*, via native group-level
  torus/transvection theory, that these (and their `det`-twists) exhaust the
  rational GLₙ irreducibles and are indexed by dominant weights. The two developments meet at the theorem `Sᵘ V ≅ V_μ` for
  a partition `μ`. Both comparisons are targets.

## What Mathlib already has (consume)

- **The classical groups.** `Matrix.GeneralLinearGroup (Fin n) R` (notation `GL n R`,
  `LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`) with `Matrix.GeneralLinearGroup.det : GL n R →* Rˣ`
  and `Matrix.GeneralLinearGroup.toLin : GL n R ≃* LinearMap.GeneralLinearGroup R (n → R)`;
  `Matrix.SpecialLinearGroup (Fin n) R` (notation `SL(n, R)`, `LinearAlgebra/Matrix/SpecialLinearGroup.lean`)
  with `Matrix.SpecialLinearGroup.toGL`; `Matrix.symplecticGroup l R` (a `Submonoid` of
  `Matrix (l ⊕ l) (l ⊕ l) R`, with `Matrix.J`, `symplecticGroup.symJ`, `symplectic_det`,
  `LinearAlgebra/SymplecticGroup.lean`); `Matrix.orthogonalGroup n R` and `Matrix.unitaryGroup n α`
  (`LinearAlgebra/UnitaryGroup.lean`, with `Matrix.UnitaryGroup.embeddingGL`).
- **Representations.** `Representation k G V = G →* (V →ₗ[k] V)` (`RepresentationTheory/Basic.lean`) with the
  functorial constructions `Representation.tprod` (`V ⊗ W`), `Representation.dual` (`Module.Dual`),
  `Representation.linHom` (`V →ₗ W`), `Representation.ofMulAction`, `Representation.asGroupHom`;
  `Representation.IsIrreducible` (`= IsSimpleOrder (Subrepresentation ρ)`, `RepresentationTheory/Irreducible.lean`,
  with `irreducible_iff_isSimpleModule_asModule`); the bundled `FDRep k G = Action (FGModuleCat k) G` with its
  `MonoidalCategory` instance and rigid duals (`RepresentationTheory/FDRep.lean`); `Rep k G`,
  `Rep.ofMulAction`, `Rep.leftRegular` (`RepresentationTheory/Rep/Basic.lean`); and the character
  `FDRep.character` with `char_tensor`, `char_dual`, `char_linHom`, `char_iso`
  (`RepresentationTheory/Character.lean`).
- **Tensor, exterior, symmetric powers.** `TensorPower R d M = ⨂[R]^d M` (`LinearAlgebra/TensorPower/Basic.lean`);
  `exteriorPower R k M = ⋀[R]^k M` as a `Submodule (ExteriorAlgebra R M)` with `exteriorPower.ιMulti`,
  `exteriorPower.map`, and a basis `exteriorPower.basis` on the `k`-subsets of a basis
  (`LinearAlgebra/ExteriorAlgebra/Basic.lean`, `LinearAlgebra/ExteriorPower/{Basic,Basis}.lean`);
  `SymmetricPower R ι M = Sym[R] ι M`, notation `Sym[R]^k M = Sym[R] (Fin k) M`, with `SymmetricPower.mk`,
  `SymmetricPower.tprod` (`LinearAlgebra/TensorPower/Symmetric.lean`); and `SymmetricAlgebra R M` with
  `IsSymmetricAlgebra` (`LinearAlgebra/SymmetricAlgebra/{Basic,Basis}.lean`).
- **Young diagrams, tableaux, partitions.** `YoungDiagram` with `YoungDiagram.ofRowLens`, `rowLens`,
  `colLen` (`Combinatorics/Young/YoungDiagram.lean`); `SemistandardYoungTableau` with
  `SemistandardYoungTableau.highestWeight` (`Combinatorics/Young/SemistandardTableau.lean`); `Nat.Partition`
  with `parts`, `parts_sum` (`Combinatorics/Enumerative/Partition/Basic.lean`).
- **Symmetric polynomials.** `MvPolynomial.esymm`, `MvPolynomial.hsymm`, `MvPolynomial.psum`,
  `MvPolynomial.msymm`, `MvPolynomial.esymmPart` (`RingTheory/MvPolynomial/Symmetric/Defs.lean`);
  `MvPolynomial.IsSymmetric`, `MvPolynomial.symmetricSubalgebra`; the fundamental theorem
  `MvPolynomial.esymmAlgEquiv` (`RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean`); Newton's
  identities (`RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean`).
- **Root systems and Lie weights (the abstract skeleton).** `RootPairing`, `RootSystem`, `RootPairing.Base`,
  `RootPairing.cartanMatrix`, `RootPairing.weylGroup` (`LinearAlgebra/RootSystem/*`); `LieModule.Weight`,
  `LieModule.genWeightSpace`, `LieModule.IsTriangularizable`, and `LieAlgebra.IsKilling.rootSystem` (the root
  system of a Lie algebra, `Algebra/Lie/Weights/*`). This roadmap consumes these as the *abstract* target
  of its weight theory and otherwise defers to [`../RootSystems`](../RootSystems/README.md) and
  [`../LieHighestWeight`](../LieHighestWeight/README.md).
- **Linear-algebra glue.** `Matrix.diagonal`, `Matrix.mulVec`, `Module.Dual`, `Matrix.toLin`,
  `Module.finrank`, `Basis.tensorPower`/`Basis.exteriorPower` where available.

## Native carriers and comparison targets

Consume native Tau Ceti standard, tensor, symmetric and exterior representations;
`IsRationalRep`/`IsPolynomialRep`; diagonal torus and weight spaces; `DominantWeight`
and rational Weyl representations; the row-superstandard Schur-functor image;
finite Schur polynomials and Weyl dimensions; and Gelfand–Tsetlin patterns,
the tableau equivalence and pattern-count dimension identity. The symmetric-group
and double-centralizer suppliers are owned by SchurWeyl; the invariant Schur-functor
image is owned here in Layer 2 and consumed by SchurWeyl Layer 8.

Build the complete API and comparisons described in the layers on those same
carriers: power functoriality and characters, highest-weight classification,
the Schur-functor and rational torus-character/dimension identities,
representation-level branching, and the normalized Gelfand–Tsetlin bases and
central operators. Consume existing finite-dimensional instances for tensor,
symmetric and exterior powers, rather than inserting them as new hypotheses.

`Suggested.lean` imports the native carriers and pins suggested forms for the
new targets, including `highestWeightRep`, `char_schurFunctor_diagonal`,
`character_irreducible_eq_schurPoly` and
`character_irreducible_one_eq_weylDimension`. It is not exhaustive; the markdown
remains definitive.

---

## The build, in layers

### Layer 0: the classical groups and the standard representation

- **The standard representation.** `stdRep n : Representation ℂ (GL n ℂ) (Fin n → ℂ)`, the tautological
  action `g • v = (g : Matrix _ _ ℂ).mulVec v`, built from `Matrix.GeneralLinearGroup.toLin`; its bundled
  form `FDRep ℂ (GL n ℂ)`, its character (`χ_std (g) = trace g`), and its dual `V*` via
  `Representation.dual`. This is the concrete engine; everything downstream is a functor applied to it.
- **The subgroups and the extra invariants.** The inclusions `SL(n,ℂ) →* GL n ℂ`
  (`Matrix.SpecialLinearGroup.toGL`), `symplecticGroup ↪ GL`, `orthogonalGroup ↪ GL`, and the restricted
  standard representation. The distinguishing structure each preserves: the volume form
  `⋀ⁿ V ≅ ℂ` (trivial for `SLₙ`), a nondegenerate symmetric form `V ≅ V*` (for `Oₙ`), a nondegenerate
  alternating form `V ≅ V*` (for `Spₙ`). State the invariance as an equivariance of the pairing; it is what
  collapses `V` and `V*` and shortens the tensor decompositions.
- **Rational and polynomial representations.** `TauCeti.IsRationalRep (ρ : Representation ℂ (GL n ℂ) W)` and
  `TauCeti.IsPolynomialRep ρ` as properties. State them **basis-independently** on a finite-dimensional `W` (the matrix
  entries in one basis are rational/polynomial in `gᵢⱼ`, `det⁻¹` iff in any basis; equivalently `ρ` is a
  comodule over `ℂ[gᵢⱼ, det⁻¹]`), and expose the coordinate-entry form as a lemma. `stdRep`, `tensorPowerRep`,
  `symPowerRep`, `extPowerRep` are polynomial; `det` and its powers are the one-dimensional rational
  representations `det^m`.
- **Complete reducibility over `ℂ`.** Every finite-dimensional rational representation is a direct sum of
  irreducibles. This is a **major external dependency, not a Layer 0 deliverable**:
  [`../ReductiveGroups`](../../ReductiveGroups/README.md) proves the linear reductivity of `GLₙ` in
  characteristic `0` at the comodule level, and this roadmap cites it. (An in-house proof via the compact form
  `U(n)` and Weyl's unitarian trick is possible but pulls in compact-group topology, Haar/unitary averaging,
  and analytic facts that are out of scope here, so it is not the chosen route.)

### Layer 1: functorial constructions and tensor powers

- **The tensor power representation.** `tensorPowerRep n d : Representation ℂ (GL n ℂ) (⨂[ℂ]^d (Fin n → ℂ))`,
  the `d`-fold tensor power of `stdRep` (diagonal action), with `char (tensorPowerRep n d) g = (trace g)^d`
  via `char_tensor`. Likewise the tensor product of two representations (`Representation.tprod`) as a
  bifunctor and the dual (`Representation.dual`).
- **Symmetric and exterior power representations.** `symPowerRep n k : Representation ℂ (GL n ℂ) (Sym[ℂ]^k V)`
  and `extPowerRep n k : Representation ℂ (GL n ℂ) (⋀[ℂ]^k V)`, functorial via `exteriorPower.map` and the
  symmetric-power functoriality; their characters are the complete-homogeneous `hsymm` and elementary
  `esymm` symmetric polynomials in the eigenvalues of `g`, i.e.
  `char (symPowerRep n k) (diagonal x) = hsymm k (x)` and `char (extPowerRep n k) (diagonal x) = esymm k (x)`.
  In particular `⋀ⁿ V ≅ det` and `⋀ᵏ V = 0` for `k > n`.
- **The first decomposition.** `V^{⊗2} ≅ Sym²V ⊕ ⋀²V` as `GL n ℂ`-representations (characteristic 0), an
  isomorphism of `FDRep ℂ (GL n ℂ)`, with the symmetrizer/antisymmetrizer projections `½(1 ± swap)`. This is
  the smallest instance of the Weyl construction and the first acceptance check.

### Layer 2: the Weyl construction via Young symmetrizers

This layer owns the native `TauCeti.schurFunctor n μ` invariant image from
`ClassicalGroups/WeylModule/Basic.lean`, fixed with the row-superstandard tableau;
SchurWeyl Layer 8 consumes that same carrier. Young symmetrizers belong to
SchurWeyl Layer 2 and the native symmetric-group action and full duality to
SchurWeyl Layer 8. Consume the native image, invariance and vanishing results;
construct only the remaining comparisons and API on that carrier.

- **The symmetric-group action on `V^{⊗d}`.** `permTensorAction n d : Representation ℂ (Equiv.Perm (Fin d)) (⨂[ℂ]^d V)`,
  permuting tensor factors, and its **commutation** with the `GLₙ`-action (they generate each other's
  commutants: Schur-Weyl duality, cited from [`../SchurWeyl`](../SchurWeyl/README.md)).
- **Young symmetrizers and the Schur functor.** For `λ : YoungDiagram` with `|λ| = d`, the Young symmetrizer
  `c_λ` (from [`../SchurWeyl`](../SchurWeyl/README.md)) acts on `⨂[ℂ]^d V`; its image is the **Schur functor**
  `schurFunctor λ V`, a `GLₙ`-subrepresentation of `V^{⊗d}`. Fix the choice of `c_λ` (the row-superstandard
  tableau of shape `λ`) so `Sᵘ V` is a definite subspace; images for other tableaux are canonically
  isomorphic to it, an explicit lemma. Prove `Sᵘ V` is a `GLₙ`-subrepresentation (the actions commute),
  that `Sᵘ V = 0` iff `λ` has more than `n` rows, and the two extreme cases
  `S^{(d)} V ≅ Symᵈ V`, `S^{(1ᵈ)} V ≅ ⋀ᵈ V`.
- **The decomposition of `V^{⊗d}`.** `V^{⊗d} ≅ ⊕_{λ ⊢ d} (Sᵘ V) ⊗ (Specht λ)` as `GLₙ × Sₐ`-representations
  (Schur-Weyl, cited), whence `V^{⊗d} ≅ ⊕_λ (Sᵘ V)^{⊕ f^λ}` as `GLₙ`-representations, with `f^λ` the number
  of standard Young tableaux (`../SchurWeyl`). This recovers Layer 1's `⊗2` case and is the structural heart.

### Layer 3: maximal torus, weights, and the highest-weight classification

The GLₙ route uses native group-level torus/transvection theory. For the other connected
classical groups, consume [`../RootSystems`](../RootSystems/README.md) (root data,
dominant chambers and Weyl groups) and [`../LieHighestWeight`](../LieHighestWeight/README.md)
(the semisimple highest-weight theorem).

- **The maximal torus and weight spaces.** `diagonalTorus n : Subgroup (GL n ℂ)`, the invertible diagonal
  matrices, `≃* (Fin n → ℂˣ)`; for a rational representation `ρ` on `W`, the **weight space** `weightSpace ρ λ`
  for `λ : Fin n → ℤ`, and the **weight-space decomposition** `W = ⊕_λ weightSpace ρ λ` (simultaneous
  diagonalization of the commuting torus, over `ℂ`). Identify these weights with the abstract weight lattice
  of the root datum of `GLₙ` from [`../RootSystems`](../RootSystems/README.md).
- **Dominant weights.** `DominantWeight n`, the weakly decreasing `λ : Fin n → ℤ` (`λ i ≥ λ (i+1)`), the
  index type for `GLₙ`-irreducibles; the subset with `λ n ≥ 0` corresponds to `YoungDiagram`s of at most `n`
  rows (polynomial representations). The dominance order and the `GLₙ` Weyl group `Sₙ` acting on `ℤⁿ` are
  the specialization of [`../RootSystems`](../RootSystems/README.md)'s Weyl group.
- **Highest weight and the classification.** The **highest weight** of an irreducible (the maximal weight in
  dominance order, with one-dimensional weight space), and the **theorem of the highest weight**: `λ ↦ V_λ`
  is a bijection from `DominantWeight n` to isomorphism classes of irreducible rational `GLₙ`-representations.
  For GLₙ consume native `DominantWeight`, `IsRationalRep`, `IsPolynomialRep`,
  `rationalWeylFDRep`, and `Weight/HighestWeight.lean`. The group-level route uses
  diagonal-torus weights and elementary transvections to recognize the highest
  weight and its central character, independently of differentiation. Retain all
  integer coordinates: the central character is not discarded modulo (1,…,1).
  Identify the shape-λ Schur functor with `rationalWeylFDRep (weightOfShape n λ)`
  for shapes of at most n rows; every rational irreducible is the determinant
  twist of its polynomial part. The comparison with gl_n Lie modules belongs to
  LieHighestWeight Layer 9 after this group-level classification.
- **`SLₙ`.** The corresponding statement for `SLₙ` (dominant weights modulo `(1,…,1)`), the type `Aₙ₋₁`
  specialization from [`../RootSystems`](../RootSystems/README.md), by restriction along `SLₙ ↪ GLₙ`.
- **`SOₙ` then `Oₙ`, and `Spₙ`.** State the highest-weight classification for the **connected** groups first:
  `SOₙ` (type `Bₙ`/`Dₙ`) and `Spₙ` (type `Cₙ`), each cut out by the invariant form of Layer 0. `Oₙ` is
  **disconnected** (`Oₙ / SOₙ ≅ ℤ/2`), so its irreducibles are **not** classified by a Lie-algebra highest
  weight; handle them by the separate `SOₙ ↑ Oₙ` extension problem (a representation of `SOₙ` extends to `Oₙ`
  in two ways or induces up, with the type `Dₙ` half-spin/`SO₂`/`SO₄` degeneracies treated by hand). Do not
  present the type `Bₙ`/`Dₙ` pipeline as classifying `Oₙ` directly.

### Layer 4: characters and Schur polynomials

Consume the native carriers `TauCeti.schurFunctor`, `diagGL`, `DominantWeight`,
`weightOfShape`, its `detShift`/`detShiftShape`, and `rationalWeylFDRep`.
This layer owns
`char(schurFunctor n μ)(diagGL t) = diagramSchurPoly n ℂ μ (t)` and
`finrank ℂ (schurFunctor n μ) = diagramSchurPoly n ℤ μ (1,…,1) = #BoundedSSYT n μ`,
including the zero module for taller shapes. Prove the torus identity using native
`char_weylRepOfShape_diagramOf_diagonal_eq_sum_spechtChar`, the independent
Frobenius power-sum formula of SchurWeyl Layer 7, and column orthogonality.
Combine it with the highest-weight isomorphism of Layer 3 for the abstract
irreducible-character statement and evaluate at the identity for the dimension.

- **Schur polynomials (consumed, one owner).** The combinatorial Schur functions `schurPoly` and their
  identities (Jacobi-Trudi, the tableau sum, the bialternant, Pieri, Littlewood-Richardson) are **owned by
  [SchurWeyl Layer7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/149fe79fc7f66b28ec635f15ec6553c7eff79b17/TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk)**, which supplies them; this roadmap **consumes** them and
  does not re-define them, avoiding a second incompatible foundation. What is proved *here* is that they are
  `GLₙ` characters (next bullet) and that the Littlewood-Richardson structure constants are the
  tensor-product multiplicities of the `V_λ` in this layer. Consume native
  `diagramSchurPoly`, its Jacobi–Trudi determinant with integer-indexed `hsymmInt`,
  and its bialternant identity after multiplying by the staircase alternant.
  The quotient interpretation takes place in the fraction field of the integral
  polynomial ring; it is not the definition of an `MvPolynomial`.

  In particular consume that Layer7's finite skew LR-tableau carrier and its
  weight-preserving tableau-product bijection, not a coefficient defined from this
  roadmap's tensor decomposition. For inner λ, outer ν and content μ its count is
  `Nat.card (LRTableau λ ν μ)`, with top-to-bottom/right-to-left reading and the
  zero-indexed prefix inequalities `#(k+1)≤#k`. The supplied finite-alphabet identity
  is `s_λ s_μ=∑_ν Nat.card (LRTableau λ ν μ)s_ν`, summing size |λ|+|μ| shapes
  with at most n rows; taller shapes vanish in n variables. Its containment/size
  zero conventions and empty/n=1 cases transport to the tensor multiplicities.
  SchurWeyl owns this combinatorial proof; the character and group-multiplicity
  comparison remains here.
- **Characters are Schur polynomials.** The **summit of this layer**: for a partition `μ`,
  `char (highestWeightRep n (weightOfShape n μ)) (diagonal x) = schurPoly n μ (x)`, i.e. the character of the polynomial
  `GLₙ`-irreducible `V_μ`, restricted to the torus, is the Schur polynomial `s_μ`. This is the **Weyl
  character formula specialized to `GLₙ`** (the bialternant is exactly Weyl's
  `∑_w (-1)^w e^{w(λ+ρ)} / ∑_w (-1)^w e^{w ρ}`); state and prove both the group-character and the
  symmetric-polynomial forms, related by the Layer-3 torus evaluation.
- **The rational character is Laurent.** For a general `λ : DominantWeight n`, the torus character is a
  **Laurent** symmetric polynomial, so `schurPoly n · : MvPolynomial (Fin n) ℤ` cannot express it. With
  `m = λₙ` and `μ = λ - m·(1,…,1)`, state `char (highestWeightRep n λ) (diagonal x) = (∏ xᵢ)^m · s_μ(x)`, the
  determinant twist of the polynomial case. Keep `schurPoly` for partitions only. The general Weyl character
  formula for `SLₙ`, `Spₙ`, `SOₙ` follows from [`../RootSystems`](../RootSystems/README.md)'s Weyl-group sum
  over the appropriate root system.

### Layer 5: the Weyl dimension formula

- **The dimension of `V_λ`.** `weylDimension n λ : ℕ`, the product form
  `dim V_λ = ∏_{1 ≤ i < j ≤ n} (λ_i - λ_j + j - i) / (j - i)`, and the theorem
  `finrank ℂ (highestWeightRep n λ) = weylDimension n λ` obtained from Layer 4 by evaluating `s_λ` at
  `x₁ = ⋯ = xₙ = 1`, with `character_irreducible_one_eq_weylDimension` and
  `char_one` giving the equivalent trace statement (equivalently, the specialization of the abstract Weyl dimension formula
  `∏_{α > 0} ⟨λ + ρ, α⟩ / ⟨ρ, α⟩` from [`../RootSystems`](../RootSystems/README.md)). The product is rational
  term by term, so landing it in `ℕ` is itself a step: compute it in `ℚ`, prove positivity and integrality,
  then package as `ℕ`; note that it depends only on the differences `λ_i - λ_j`, hence is invariant under the
  determinant twist `λ ↦ λ + m·(1,…,1)`. For partitions this is the **hook-content formula**
  `dim = ∏_{(i,j) ∈ λ} (n + j - i) / hook(i,j)`; prove the two agree. Give the `Spₙ`, `SOₙ` product forms
  likewise.

### Layer 6: branching rules and Gelfand-Tsetlin bases

- **`GLₙ ↓ GLₙ₋₁`.** The restriction of `V_λ` along `GL(n-1) ↪ GL n` (upper-left block, fixing the last
  basis vector) decomposes **multiplicity-free**: `V_λ|_{GL_{n-1}} ≅ ⊕_μ V_μ`, the sum over `μ` **interlacing**
  `λ` (`λ_i ≥ μ_i ≥ λ_{i+1}`). State it as an isomorphism of `FDRep ℂ (GL (n-1) ℂ)` and, on characters, as
  the Schur-polynomial identity `s_λ(x₁,…,x_{n-1}, 1) = ∑_{μ ≺ λ} s_μ(x₁,…,x_{n-1})` for a partition `λ`. The
  **rational** version follows by the determinant twist (the interlacing runs over integer sequences, not just
  partitions), so state both the partition form and the `DominantWeight`-indexed form. This is the
  Gelfand-Tsetlin engine: iterating it gives a basis of `V_λ` indexed by Gelfand-Tsetlin patterns.
- **`SOₙ ↓ SOₙ₋₁` and `Spₙ ↓ Spₙ₋₂`.** The connected orthogonal and symplectic series carry their own
  branching theorems, cut out by the invariant form of Layer 0, but these are **type-specific** and do not
  reuse the `GLₙ` Schur-polynomial identity unchanged: the `SOₙ` rule interlaces with its own betweenness (and
  a parity/sign subtlety at the `Oₙ` extension), and `Spₙ` uses its own patterns and characters. State each
  with its own index convention rather than implying a single formula transfers.
- **Gelfand-Tsetlin patterns.** Consume native `TauCeti.GTPattern n`, the combinatorial index of the basis below, a **triangular
  array** `(λ_{i,j})_{1 ≤ i ≤ j ≤ n}` of integers (row `j` has `j` entries `λ_{1,j} ≥ ⋯ ≥ λ_{j,j}`) satisfying
  the **interlacing** (betweenness) inequalities `λ_{i,j+1} ≥ λ_{i,j} ≥ λ_{i+1,j+1}`, with **top row**
  `topRow : GTPattern n → (Fin n → ℤ)` reading off row `n`. The interlacing constraint ranges only over
  interior cells (where all three entries are informative), so it imposes **no sign condition** on the
  row-final entries: entries may be negative, and the rational (determinant-twisted) patterns are included
  alongside the polynomial ones. Preserve the native structure and its entry/extensionality API. For a partition `λ`
  (`λ n ≥ 0`) the patterns with top row `λ` **biject with semistandard Young tableaux** of shape `λ` **with
  entries in `{0,…,n-1}`**: the `j`-th row of the pattern records the shape of the sub-tableau on entries
  `< j`. Because Mathlib's `SemistandardYoungTableau λ` allows unbounded `ℕ` entries (an infinite set for a
  nonempty shape), the bijection is to the **bounded subtype** `{T // ∀ i j, (i,j) ∈ λ → T i j < n}`, reusing
  native `TauCeti.BoundedSSYT` and `TauCeti.BoundedSSYT.fiberEquiv`. Consume the full
  native `TauCeti.gtPatternEquivSSYT` from `GelfandTsetlin/Tableau.lean`: row k
  records the shape of entries < k, and its inverse fills successive strips with k−1.
  Supply the content/weight comparison with successive row-size differences used
  by the pattern basis, preserving the native pattern and bounded tableau carriers.
- **The Gelfand-Tsetlin basis.** Iterating the `GLₙ ↓ GLₙ₋₁` branching down the full chain
  `GL₁ ⊂ GL₂ ⊂ ⋯ ⊂ GLₙ` (each step multiplicity-free, the summands given by the interlacing condition)
  refines `V_λ` into a direct sum of canonical **lines**, one for each sequence of interlacing choices, i.e.
  one for each `GTPattern` with top row `λ`. The lines are canonical; a `Basis` further requires a vector in
  each line, determined only up to scalar, so `gtBasis` also **pins a normalization** (compatibility with the
  standard contravariant/Shapovalov form, equivalently the integral Gelfand-Tsetlin coefficients). Pin
  `gtBasis n λ : Module.Basis {P : GTPattern n // topRow P = λ} ℂ (highestWeightRep n λ)` and the
  **pattern-to-basis bijection**. Since patterns carry negative entries, this holds for every
  `λ : DominantWeight n`; the pattern ↔ tableau reading is the polynomial specialization `λ n ≥ 0`.
- **The Gelfand-Tsetlin dimension formula.** `finrank ℂ (highestWeightRep n λ) = #{P : GTPattern n with top row
  λ}`, the count of GT patterns with top row `λ`. Prove it **from the branching side**: the iterated
  multiplicity-free decomposition gives the count by induction on `n`, independently of Layer 5. *Then* compare
  with `weylDimension n λ` and, through the pattern ↔ tableau bijection, with the tableau sum `s_λ(1,…,1)`
  that specializes Layer 4's Schur polynomial at `x = (1,…,1)`. Do not use the Layer 5 equality to justify the
  basis construction itself; the three counts agree as a downstream corollary.
- **The Gelfand-Tsetlin generators.** The Gelfand-Tsetlin subalgebra is generated by the images of the
  **centres of the universal enveloping algebras `Z(U(𝔤𝔩_k))`** (`1 ≤ k ≤ n`), embedded via the chain
  `𝔤𝔩_1 ⊂ ⋯ ⊂ 𝔤𝔩_n` (**not** the Lie-algebra centres of the `𝔤𝔩_k`, which are only the scalars and are far
  too small). Level `k` contributes `k` generators (the Gelfand invariants / Capelli elements, degrees
  `1 ≤ r ≤ k`), so `gtGenerator` is indexed by `(k, r)` — in `Suggested.lean` the level is 0-based
  (`k : Fin n`, matrix size `k + 1`, with `k + 1` generator degrees `r : Fin (k.val + 1)`), matching
  this 1-based description at level `= k + 1`. This maximal commutative family is **simultaneously
  diagonalized** in `gtBasis`, with eigenvalues explicit polynomials in the pattern entries; state that each
  `gtBasis` vector is a joint eigenvector and that the joint eigencharacter **separates** the basis (distinct
  patterns give distinct eigenvalue systems). That separation is what makes the GT basis intrinsic (the
  eigenbasis of the subalgebra), not merely a byproduct of one choice of chain.
- **`SOₙ ↓ SOₙ₋₁`, the symplectic series, and `Spin(n) ↓ Spin(n-1)`.** The same chain of subgroups gives
  Gelfand-Tsetlin-type bases for the orthogonal and symplectic families: `SO_n ↓ SO_{n-1}` is again
  multiplicity-free (the classical orthogonal Gelfand-Tsetlin construction), and the symplectic series carries
  its own GT-type patterns. Through the double cover this intertwines with the spin groups: the branching
  `Spin(n) ↓ Spin(n-1)` for the spin representations is the subject of the sibling
  [`../SpinRepresentations`](../SpinRepresentations/README.md), which this layer meets at the `SOₙ`/`Spin(n)`
  Gelfand-Tsetlin bases.

### Layer 6A: diagonal overgroups of the complex general linear group

Work with G=GLₙ(ℂ), P=G×G and the actual diagonal Δ={(g,g)}.
This layer owns the complete concrete subgroup and restriction comparison below;
it consumes Layers0 and3 and [LieGroups Layers0–4](../LieGroups/README.md#layer-2-the-closed-subgroup-cartan-theorem)
for exponentials, closed subgroups and uniqueness of connected integral subgroups.
The structural matrix calculations do not require tensor multiplicities, hives,
Borel–Weil or later compact-normalizer/exceptional constructions.

**Four actual subgroups and their maps.** Define
H_sc={(λg,g):g∈G, λ∈ℂˣ} using the native scalar-matrix homomorphism,
and H_det=ker r for the character r(g,h)=det(g)det(h)⁻¹. Construct the
inclusions Δ≤H_sc,H_det≤P, entrywise membership/extensionality, multiplication,
inverse and scalar/determinant evaluation lemmas. The map
G×ℂˣ→H_sc, (g,λ)↦(λg,g), is an algebraic-group and complex-Lie-group
isomorphism when n>0; build its inverse by the unique scalar ratio, including
regularity on the invertible-matrix chart. For n=0 its scalar parameter is a
kernel, not an extra torus. The determinant-ratio character is surjective for
n>0 using diag(u,1,…,1) in the first factor. Export the native first-isomorphism
comparison P/H_det≃ℂˣ, with its actual character and complex topology/algebraic
quotient maps. No quotient by Δ in all of P is a group quotient for n≥2.
Construct the right-coset homogeneous-space maps P/Δ→G and H_det/Δ→SLₙ,
[g,h]↦gh⁻¹, with inverse a↦[a,1], their topology/regularity and the
explicit induced left action. These are spaces, not groups obtained from
normal Δ. In contrast Δ is normal in H_sc; its scalar-coordinate map gives
the genuine quotient-group and algebraic-group comparison H_sc/Δ≃ℂˣ
for n>0. State these normality distinctions as part of the quotient API.

Consume native `Subgroup.goursatFst`/`normal_goursatFst` and the quotient-group
API. For a subgroup H containing Δ put N=H.goursatFst={a:(a,1)∈H}.
Prove both projections surjective, N normal in G and
(g,h)∈H iff gh⁻¹∈N. The explicit maps
H→N×G, (g,h)↦(gh⁻¹,h), and (a,h)↦(ah,h)
are inverse homeomorphisms, and regular inverses for closed algebraic H.
They are not in general a direct-product GROUP isomorphism: multiplication is
(a,h)(b,k)=(a h b h⁻¹,hk). Identify the split exact sequence
1→N→H→G→1 and this actual conjugation action. Prove closedness of N from H,
and connectedness equivalence H connected iff N connected. The converse
construction from normal N, the two inverses and inclusion-order comparison
are specializations of the native Goursat/quotient maps, not a second generic
subdirect-product engine. Recover H_sc from N=Z(G) and H_det from N=SLₙ.
Consume native GeneralLinearGroup.center_eq_range_scalar and the
SpecialLinearGroup.toGLKerEquiv determinant-kernel dictionary. Use native
Matrix.ProjGenLinGroup and mk for G/Z(G); identify H_sc membership with
equality of the two actual projective images. Prove
N_P(Δ)=H_sc, by comparing the two inner conjugations; handle n=0,1
separately. For n≥2 also prove N_P(H_sc)=H_sc; H_det is normal in P.

**Category and complete classification.** The analytic assertion is for CLOSED
connected complex Lie subgroups of P, with the induced topology and holomorphic
inclusion. Equivalently, require closedness, connectedness and that its actual
real exponential tangent space is stable under multiplication by i. State that
equivalence using the actual matrix exponential, not an arbitrary chosen Lie
algebra or a predicate assuming classification. Apply the closed-subgroup
carrier comparison to obtain the complex tangent Lie subalgebra.

For n≥2 prove that a complex Lie subalgebra l⊂glₙ⊕glₙ containing the diagonal
has exactly four possibilities: diagonal, diagonal+ℂ(I,0),
{(X,Y):tr X=tr Y}, and all. The difference map (X,Y)↦X−Y has diagonal
kernel and identifies the quotient module with glₙ under the adjoint action.
Prove the four-case invariant-submodule classification on the native matrix
carrier by consuming TauCeti.slIdeal_le_or_le_center from
Algebra/Lie/GeneralLinear/Radical.lean: the stable image is an actual LieIdeal,
and over ℂ the theorem says it contains slₙ or lies in the center.
Consume GeneralLinear/Basic's scalar-center, trace-zero slIdeal and
isCompl_center_derivedSeries_one_matrix (n invertible). The center is
one-dimensional and trace has a one-dimensional quotient, so the two branches
give exactly0, ℂI, slₙ and glₙ. Supply those actual submodule/quotient and
preimage comparisons, including the rank assumptions. The existing matrix-unit
ideal-generation proof is not repeated or replaced by a new simplicity engine.
This excludes nontrivial graphs between the two summands and is not merely a
comparison of four dimensions.
Verify bracket closure and each displayed tangent kernel explicitly.
Alternatively apply the same ideal calculation to the actual normal N above.
Then use uniqueness of the connected integral subgroup, with the actual
exponential inclusions and open identity patches, to recover the GROUP,
not just a Lie-algebra list. This proves
H=Δ or H_sc or H_det or P. All four are closed and connected complex
algebraic subgroups; build the determinant-kernel identification and the
SLₙ×G homeomorphism to prove H_det connected. Prove G,SLₙ connected here
from native Matrix.diagonal_transvection_induction_of_det_ne_zero,
SpecialLinearGroup.diagonal_transvection_induction' and their elimination factors, continuous transvection/diagonal paths and the
determinant section, consuming Layer0's concrete carriers, rather than assuming this from a dimension label.

State and prove also the connected closed complex ALGEBRAIC subgroup version.
Use ReductiveGroups Layers0–3 for the coordinate/Hopf-ideal dictionary,
characteristic-zero smoothness, kernels and components; construct these actual
matrix subgroups on that same carrier. The concrete affine chart has both
matrix-entry coordinates and inverse determinants. Construct its regular
maps and tangent maps. Establish, for these closed algebraic subgroups of P,
that Zariski connectedness and connectedness of complex points agree, using
the actual finite component scheme and analytic open identity patch. Supply
the needed irreducible-component-to-connected-complex-points argument in this
application (finite affine open/curve-chain comparison over ℂ); a finite
component count or tangent dimension by itself is not the comparison.
As an explicit signature lane, a subgroup cut out by a set of polynomials in
this chart is closed and its exponential tangent space is complex: for each
polynomial evaluate along exp(zX); the resulting entire function vanishes
for real z and hence identically. Compare this lane with the algebraic model.

For n≥2 prove all four distinct, both intermediates proper, and incomparable:
(λI,I)∈H_det iff λⁿ=1, while a noncentral determinant-one transvection
paired with I lies in H_det\H_sc. Their intersection is exactly the image
of G×μₙ under the same scalar map, with identity component Δ; it is NOT
connected when n≥2. Their product/join is all P: choose an nth root of the
determinant ratio and reduce to H_det. This is an explicit surjectivity
argument, not an assertion of an algebraic nth-root section. Export complex
dimensions n²,n²+1,2n²−1,2n² and their tangent-map checks. At n=1,
H_det=Δ and H_sc=P; a connected closed complex subgroup containing Δ is
Δ or P, with no strict intermediate. Other slope subtori do not contain Δ.
At n=0 all groups are trivial. The category restriction is essential:
r⁻¹(S¹) for n>0 is an additional closed connected REAL Lie overgroup;
prove its actual preimage/connectedness and distinguish its real tangent
condition from the complex list. No statement about arbitrary real connected
overgroups, disconnected intermediate groups or positive characteristic follows.

**Restriction and characters.** Define the external representation on V⊗W
by (g,h)↦ρ(g)⊗σ(h) using native `Representation.tprod` after the two
projection pullbacks. Its Δ pullback is exactly the native tensor product.
For finite-dimensional rational irreducible GLₙ representations, construct
and evaluate the scalar central character: if ρ has highest weight λ then
ρ(λ₀I)=λ₀^(Σλᵢ)id; retain all determinant twists. Prove restriction to
SLₙ stays irreducible: G is generated by SLₙ and scalar matrices over ℂ,
and the latter act by scalars. Native rationalWeylSLRep and its
determinant-shift equality supply the SAME restricted carriers; they do not
prove this irreducibility. The missing implication is an explicit Layer3/6A
comparison target, with actual nth-root generation over ℂ. Prove the external restriction to H_det
irreducible, since it contains both separate SLₙ factors and their external
tensor action is irreducible. Consume native Schur and module-density/
finite endomorphism APIs from SemisimpleAlgebras Layers1/3, and explicitly
identify the generated image with End(V)⊗End(W)=End(V⊗W); no new generic
character or density engine is commissioned. Treat the rank1 torus and rank0
trivial representations directly.

Under H_sc≃G×ℂˣ the SAME external representation is
(g,λ₀)↦λ₀^(Σλᵢ)(ρ(g)⊗σ(g)), where λ is ρ's highest weight.
Construct this intertwiner, its inverse and the identity-on-carrier order
isomorphism of invariant submodules with the diagonal tensor product.
Define multiplicities by actual CG Hom spaces and prove their transport
before invoking any TPC count. Transport all diagonal tensor multiplicities;
the extra torus carries one fixed character on the ENTIRE tensor representation. Thus H_sc
has exactly the diagonal branching with that fixed scalar character, whereas
H_det has none of that branching into proper summands. Neither intermediate
supplies a new partial tensor-factorization algorithm. Tensor/LR computations
remain in Layer4 and TensorProductCombinatorics H2. Pin their consumption of
these subgroup maps rather than inferring the source's intermediate-group
assertion from a hive coefficient formula.

---

## Worked examples (acceptance criteria)

- **Ordinary endomorphism-monoid functors and their extension.** Let X be a vector
  space over a field k in a fixed adequate universe, and let C_X be the native
  `SingleObj (End X)`. Its inclusion J into all vector spaces has one object X
  and every linear endomorphism; it is full and faithful. For every ordinary
  functor F:C_X→Vec construct its pointwise left Kan extension E to all Vec,
  with the natural isomorphism F≅J⋙E. Consume native ModuleCat colimits,
  SingleObj.functor and pointwise Kan-extension/unit APIs, rather than adding
  another Kan-extension engine. The same construction works for all modules
  over any unital ring. Separate scalar and module universes; for X=k^n in a
  larger module universe use the actual ULift comparison, including its
  endomorphism-monoid isomorphism. Over a commutative field identify End(k^n)
  with the native matrix monoid by the actual basis/linear-map dictionary.
  `EndomorphismKanExtension.lean` gives the native inclusion, colimit extension,
  unit, full-faithful restriction isomorphism and explicit lifted free-module
  specialization, without admissions.

  Give the ordinary coend model: E(V) is the quotient of the direct sum of
  copies of F(X) indexed by linear maps f:X→V, with relations
  `[f∘a,w]=[f,F(a)w]` for a∈End(X). Each indexed copy is k-linear in w;
  do not impose additivity in f, since F is an ordinary functor and need not
  be additive on source hom-sets. Construct the maps from this quotient to
  the native CostructuredArrow colimit and back, with their inverse/naturality
  laws. At V=X the inverse to w↦[id,w] is [f,w]↦F(f)w. Prove it agrees
  with the native unit isomorphism. For n=0 the extension can be the constant
  functor F(0), with every arrow acting as identity. Outputs of a pointwise
  Kan extension can be infinite-dimensional even on finite-dimensional inputs;
  no finite-output or polynomial property is asserted. A finite-dimensional
  polynomial Schur-functor extension, and extension of a rational GL_n module
  across singular matrices, retain their separate hypotheses and constructions
  in Layers1–3. An unrestricted functor on the abstract GL_n group is not
  silently assumed rational, and a torus-weight criterion is not asserted for
  such a functor. This ordinary extension comparison has no Specht, Weyl
  character, highest-weight classification or finite polynomial-extension premise.
- **`V^{⊗2} = Sym²V ⊕ ⋀²V`.** The isomorphism `tensorPowerRep n 2 ≅ symPowerRep n 2 ⊞ extPowerRep n 2` of
  `FDRep ℂ (GL n ℂ)` (Layer 1), checked on characters:
  `(trace g)² = char(Sym²) g + char(⋀²) g`, i.e. at a diagonal `x`, `(∑ xᵢ)² = h₂(x) + e₂(x)` with
  `h₂ = ∑_{i ≤ j} xᵢxⱼ`, `e₂ = ∑_{i < j} xᵢxⱼ` (`MvPolynomial.hsymm`, `MvPolynomial.esymm`). The Schur-functor
  reading: `S^{(2)}V = Sym²V`, `S^{(1,1)}V = ⋀²V` (Layer 2).
- **A small Schur-polynomial character.** For `n = 2`, `λ = (2,1)`: `V_λ` has dimension
  `weylDimension 2 (2,1) = 2` (Layer 5), and its character at `diagonal (x₁, x₂)` is
  `s_{(2,1)}(x₁,x₂) = x₁²x₂ + x₁x₂²` (Layer 4). Equivalently `V_{(2,1)} ≅ det ⊗ V` (the determinant twist
  `m = 1`, `μ = (1,0)`), so its character is `(x₁x₂)(x₁ + x₂)`, a check against the Layer-1/Layer-3
  constructions. For `n = 3`, `λ = (1,1)`: `s_{(1,1)}(x) = e₂(x)` and `V_{(1,1)} ≅ ⋀²V`, of dimension `3`.
- **`SL₂` recovers `../LieHighestWeight`'s `V(n)`.** Restricting the `GL₂`-irreducible of highest weight
  `(m, 0)` to `SL(2,ℂ)` gives the `(m+1)`-dimensional irreducible `Sym^m V`, whose character at
  `diagonal (t, t⁻¹)` is `tᵐ + t^{m-2} + ⋯ + t^{-m}`; this **agrees** with the `(m+1)`-dimensional
  highest-weight module `V(m)` of `𝔰𝔩₂` from [`../LieHighestWeight`](../LieHighestWeight/README.md) under the
  differentiation `SL(2,ℂ) ⇝ 𝔰𝔩₂`. Stating and proving this isomorphism ties the matrix-group and Lie-algebra
  developments together.
- **A Gelfand-Tsetlin basis for `GL₃`.** For `n = 3`, `λ = (2,1,0)`: `V_λ` (the `8`-dimensional
  representation) has exactly `8` Gelfand-Tsetlin patterns with top row `(2,1,0)`, one for each choice of an
  interlacing middle row `(a,b)` (`2 ≥ a ≥ 1`, `1 ≥ b ≥ 0`) and a bottom entry `c` (`a ≥ c ≥ b`): the four
  middle rows `(1,0),(1,1),(2,0),(2,1)` admit `2,1,3,2` bottom entries, summing to `8`. This matches both
  `weylDimension 3 (2,1,0) = 8` (Layer 5) and the `8` semistandard Young tableaux of shape `(2,1)` with entries
  in `{1,2,3}` (Layer 4, via the pattern ↔ tableau bijection), the three counts agreeing by the two
  identifications of `finrank ℂ (irreducible 3 (2,1,0))`.
- **A rational Gelfand-Tsetlin basis for `GL₃`.** For `n = 3`, `λ = (1,0,-1)`: this is the determinant twist
  `m = -1`, `μ = (2,1,0)` of the previous example, so `V_{(1,0,-1)} ≅ det⁻¹ ⊗ V_{(2,1,0)}` still has dimension
  `8`. Its `8` Gelfand-Tsetlin patterns now have **negative** entries in some rows (top row `(1,0,-1)`), which
  the sign-free interlacing admits; a nonnegativity constraint on row-final entries would wrongly exclude
  them. This exercises the rational branch of `gtBasis`, which the polynomial `(2,1,0)` example does not.

## Ordering

The ordinary endomorphism-monoid extension example uses only native all-module
colimits and pointwise Kan extensions; none of Layers1–6 is its prerequisite.
Its existence statement supplies no finite-dimensional polynomial extension.

Layer 0 (the groups and the standard representation) is the foundation and comes first; its rational/
polynomial distinction and complete reducibility are used everywhere. Layer 1 (tensor, symmetric, exterior
powers and their characters) needs only Layer 0 and the Mathlib multilinear engine, and already delivers the
`⊗2` acceptance check. Layer 2's Schur-functor image needs Layer 1 and the native Young-symmetrizer input
from SchurWeyl Layer 2. SchurWeyl Layer 8 consumes that image for its duality
decomposition; this layer then consumes that decomposition for its GL-only
corollary. The image and the classification of Layer 3 therefore have no duality
prerequisite.
Layer 3 (torus, weights, classification) needs Layer 0 and
[`../RootSystems`](../RootSystems/README.md). The GLₙ classification uses native
group-level torus/transvection theory; the other connected classical groups use
[`../LieHighestWeight`](../LieHighestWeight/README.md); it is
what makes "the irreducibles are indexed by dominant weights" precise, and it joins Layer 2 at
`Sᵘ V ≅ V_λ`. Layer 4 (Schur polynomials as characters) needs Layers 2-3, native Schur
polynomials and SchurWeyl Layer 7's independent Frobenius formula; Layer 5 (dimensions) is a specialization of Layer 4; Layer 6 (branching and the Gelfand-Tsetlin basis) needs
Layers 3-4, and its pattern-count dimension formula reproves Layer 5's from the branching side, while its
Gelfand-Tsetlin generators and its `SOₙ`/`Spin(n)` bases connect it to
[`../SpinRepresentations`](../SpinRepresentations/README.md). A
contributor can complete Layers 0-1 and the `⊗2` example independently of the abstract dependencies, then
Layer 2 from native symmetric-group and symmetrizer suppliers, followed by
Layers 3–6 with the cited root and character dependencies.

Layer6A's concrete subgroup/normal-kernel and tangent calculations use Layer0
and the early LieGroups Layers0–4; the representation conclusions use Layer3
and native Schur/density. Its algebraic model uses ReductiveGroups Layers0–3.
TensorProductCombinatorics H2 consumes these finished subgroup/restriction maps;
no hive, tensor-multiplicity or later compact-normalizer theorem is an input
to the structural classification. No generic supplier receives a return dependency.

## References

- W. Fulton, J. Harris, *Representation Theory: A First Course*, Springer GTM 129 (1991) - the primary
  reference: the Weyl construction via Young symmetrizers (Lecture 6, 15), Schur functors and the
  decomposition of tensor powers, Schur polynomials as `GLₙ` characters (Lecture 6, Appendix A), the Weyl
  character and dimension formulas (Lecture 24-25), and branching (Lecture 25, Appendix).
- R. Goodman, N. R. Wallach, *Symmetry, Representations, and Invariants*, Springer GTM 255 (2009) - the
  classical groups uniformly: the standard representation and its tensor powers, highest-weight theory for
  `GLₙ`, `Oₙ`, `Spₙ`, Schur-Weyl duality, and branching rules with the interlacing conditions.
- H. Weyl, *The Classical Groups: Their Invariants and Representations*, Princeton (1939) - the original
  synthesis: the Weyl construction, characters of the classical groups, and the character/dimension formulas.
- C. Procesi, *Lie Groups: An Approach through Invariants and Representations*, Springer (2007) - the
  invariant-theoretic route, Schur-Weyl duality, and Schur functions.
- I. G. Macdonald, *Symmetric Functions and Hall Polynomials*, 2nd ed., Oxford (1995) - Chapter I: Schur
  functions, the bialternant and Jacobi-Trudi formulas, Pieri and Littlewood-Richardson rules, the
  symmetric-function facts Layer 4 builds.
