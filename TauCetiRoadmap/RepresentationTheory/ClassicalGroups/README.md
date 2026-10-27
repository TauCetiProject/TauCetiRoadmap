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
  **image of the Brauer algebra**, equivalently its quotient by the action kernel, and the decomposition, indexing, and stability conditions
  genuinely differ from `GLₙ`'s rather than merely shortening. Prove the connected highest-weight theory once
  over `ℂ` and specialize the classification; but treat the `Oₙ`/`Spₙ` tensor decomposition as its own
  (Brauer/invariant-contraction) development, not a corollary of the `GLₙ` one. `Oₙ` is furthermore
  **disconnected for n>0**, so its irreducibles are governed by `SOₙ` plus an extension step, not by a Lie-algebra
  highest weight alone; O₀ is trivial.
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
  the group character lattice and the abstract Lie weight lattice is an explicit target here,
  using LieHighestWeight for lattices/weights and RootSystems for roots/Weyl combinatorics, not an assumption. **Dominant** means weakly decreasing. Reuse `Matrix.diagonal` and Mathlib's root-datum
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
  diagonalization of the commuting torus, over `ℂ`). Identify these group characters with the abstract Lie weight lattice
  through this layer's torus/differentiation dictionary and LieHighestWeight;
  RootSystems supplies the root/Weyl geometry, not the weight lattice.
- **Dominant weights.** `DominantWeight n`, the weakly decreasing `λ : Fin n → ℤ` (`λ i ≥ λ (i+1)`), the
  index type for `GLₙ`-irreducibles; the subset with `λ n ≥ 0` corresponds to `YoungDiagram`s of at most `n`
  rows (polynomial representations). Construct the dominance order using LieHighestWeight's
  weight lattice and the positive roots. The `GLₙ` Weyl group `Sₙ` and its action on
  coordinates specialize RootSystems' Weyl-group geometry.
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
  root/Weyl specialization from RootSystems and lattice specialization from
  LieHighestWeight, by restriction along `SLₙ ↪ GLₙ`.
- **`SOₙ` then `Oₙ`, and `Sp₂ᵣ`.** The connected matrix groups and their
  exact rational highest-weight classification are constructed in Layer3A:
  SO_(2r+1) has type B_r, SO_(2r) type D_r, and Sp_(2r) type C_r,
  with their actual group character lattices and all small-rank cases.
  Their abstract Lie modules alone are not a rational-group construction.
  O remains the separate SO extension/induction problem, with its actual
  component action and low-dimensional cases; neither spin weights nor
  an unqualified Lie highest weight are automatically SO/O representations.

### Layer 3A: the rational SO/Sp carriers and their exact highest weights

Use `Matrix.specialOrthogonalGroup (Fin n) ℂ`, with the **trivial** star
used by `Matrix.orthogonalGroup`, and `Matrix.symplecticGroup (Fin r) ℂ`
on `(Fin r ⊕ Fin r) → ℂ`. The latter preserves native
`J = [[0,−I],[I,0]]`; its matrix condition is `A J Aᵀ = J`.
These are algebraic matrix groups, not the compact unitary groups obtained
from complex conjugation. Construct their standard modules and rationality
by restricting the native matrix-coefficient algebra; compare this property
with the ReductiveGroups coordinate-comodule definition and prove basis
independence, dual/tensor/exterior/submodule/quotient closure on the same
carriers. No new generic comodule engine is required.

**Tori, lattices and differentiation.** For SO, pair consecutive coordinates
and, for `i=0,…,r−1`, set `u_(i+1)=e_(2i)+I e_(2i+1)`,
`v_(i+1)=(e_(2i)−I e_(2i+1))/2`. Their symmetric pairings are
`(u_i,u_j)=(v_i,v_j)=0`, `(u_i,v_j)=δ_ij`; retain the last norm-one
coordinate in odd dimension. Conjugate `diag(t,t⁻¹[,1])` through this
specified basis to construct an actual maximal torus of the native I-form
group, including inverse and determinant checks. For Sp use the native
diagonal map `diag(t,t⁻¹)` on the e/f summands. Prove maximality and identify
their **group character lattices** with `ℤ^r`, by
`t ↦ ∏_i t_i^(λ_i)`. Construct the differentials and compare the actual
matrix Cartan/root spaces with RootSystems' B/C/D roots. RootSystems owns
root/coroot and Weyl combinatorics; the lattice, dominant integral weights
and rho comparison are constructed here with LieHighestWeight, not claimed
as outputs of RootSystems.

For `SO_(2r+1)`, the roots are `±ε_i±ε_j, ±ε_i`; for `SO_(2r)`,
`±ε_i±ε_j`; for `Sp_(2r)`, `±ε_i±ε_j, ±2ε_i`.
The SO odd and Sp group-dominant tuples are **integers**
`λ₁≥⋯≥λ_r≥0`; SO even has
`λ₁≥⋯≥λ_(r−1)≥|λ_r|`. Identify these as the characters dominant
for the specified Borel, and compare with abstract Lie weights. SO does
not acquire all weights of its simply connected spin cover. The Lie
`sl₂` weight-1 module does not descend to SO₃; SO₃ weight `m` has
`sl₂` weight `2m`. Treat SO₀, SO₁ and Sp₀ as trivial groups, SO₂ as
a torus with **every integer** character, SO₃=B₁, SO₄=D₂=A₁×A₁
(covering weights of equal parity), and Sp₂=C₁ (all nonnegative `sl₂`
weights) explicitly. The rank-zero and torus cases are not applications
of a semisimple theorem with missing hypotheses. Spin and half-spin
weights remain owned by SpinRepresentations.

**The earlier generic bridge and this specialization.** Consume
[LieHighestWeight Layer9's connected rational fixed-vector comparison](../LieHighestWeight/README.md#layer-9-reductive-lie-algebras-and-gl_n)
at its actual finite-dimensional, smooth connected affine reductive,
characteristic-zero scope. Its earlier suppliers are ReductiveGroups
Layer2's tangent comparison and only Layer5P's closed-stabilizer/Cartier
cut. Here construct the concrete SO/Sp group and Lie carrier, smoothness,
connectedness, reductivity, Cartan and differentiation dictionaries to apply
that theorem, and consume ReductiveGroups' characteristic-zero linear
reductivity for these explicitly identified reductive groups. For a Lie-stable subspace `U⊂W`, first use the **closed
subspace stabilizer in G** and its tangent inclusion to prove that U is
G-stable. Do not define a rational representation on U or W/U before that
step. Only then form submodule/quotient representations. Apply the generic
fixed-vector theorem to the rational Hom module to identify group
intertwiners with Lie intertwiners, with composition/identity/inverse
compatibility. This proves the corresponding simplicity and isomorphism
comparisons. No generic fixed-vector theorem is rebuilt here or assumed
absent; no assertion is made for arbitrary discontinuous abstract-group
representations or disconnected O.

**Direct construction, before harmonic/Brauer classification.** Construct
the following rational building blocks from exterior powers of the actual
standard modules. For C_r, construct contraction with J and its equivariance;
the kernel in `⋀^k V`, `1≤k≤r`, has highest weight `ω_k`.
For B_r use `⋀^k V`, `1≤k≤r`, whose last highest weight is `2ω_r`.
For D_r, `r≥3`, use `⋀^k V` for `1≤k≤r−2`,
`⋀^(r−1)V` of weight `ω_(r−1)+ω_r`, and the two invariant
middle-exterior Hodge eigenspaces of weights `2ω_(r−1)` and `2ω_r`.
Construct the Hodge operator from the specified symmetric form, ordered
volume and exterior pairing; prove its square, invariance and decomposition.
Label its two spaces by their **actual highest wedge vectors** and compute
their eigenvalues in that convention, rather than declaring an unchecked
`±I^r` label. More precisely define the complex-linear Hodge star by
`α∧*β=⟨α,β⟩ vol`, with vol the consecutive-coordinate standard volume.
For `κ_r=(−1)^(r(r−1)/2)(−I)^r`, prove
`*(u₁∧⋯∧u_r)=κ_r(u₁∧⋯∧u_r)` and
`*(u₁∧⋯∧u_(r−1)∧v_r)=−κ_r(u₁∧⋯∧u_(r−1)∧v_r)`.
These label the weights `2ω_r` and `2ω_(r−1)` respectively, not a
choice of an unproved sign. D₂ and all smaller ranks use the explicit models above.
For each block prove the weight calculation, nonzero highest vector,
Lie simplicity and dimension using the earlier abstract highest-weight/Weyl
theory and a direct exterior/contraction character or dimension calculation.
For C, construct contraction and inverse-form wedge maps and their
commutator on each degree; prove the required contraction surjectivity
for `1≤k≤r` and the kernel dimension
`binom(2r,k)−binom(2r,k−2)` (the negative-index binomial is0).
For B the dimensions are `binom(2r+1,k)`; for D the unsplit exterior
dimensions are `binom(2r,k)` and each middle eigenspace has half of
`binom(2r,r)`. Prove these identities and their agreement with the
earlier Lie Weyl dimensions on the indicated highest weights.
Then use the stabilizer comparison to obtain group simplicity on the same
explicit subspace. No harmonic tensor decomposition is a premise.

Prove these block weights generate exactly the group-dominant monoids.
For D, the coefficients of the two terminal fundamental weights have equal
parity; split off their common part and then the even remainders, using
`ω_(r−1)+ω_r`, `2ω_(r−1)`, `2ω_r`. For B the last coefficient
is even; C has all fundamental generators. Form a tensor of the indicated
blocks, fix its highest tensor, and take the **U(g)-submodule generated by
that tensor**. Earlier complete reducibility and abstract highest-weight
theory show this Cartan component is the simple module of their summed
weight. The closed-stabilizer argument makes it a genuine rational stable
subspace of the group tensor module. This constructs every admissible
irreducible, including the empty tensor/unit. Differentiating arbitrary
rational irreducibles and the Hom comparison prove uniqueness and
exhaustiveness; compare torus characters and Weyl dimensions through the
actual lattice dictionary. SchurWeyl's later contraction/harmonic and
Brauer decomposition consumes these modules and is **not** their existence
or rational-integration input. GT bases and multiplicity vectors are later
outputs, not inputs of this construction.

For O, retain the separate index-two SO extension/induction problem,
including O₀ trivial and O₁'s two characters. Give the actual component
action and stabilizer of an SO isomorphism class before deciding extension
versus induction; do not call forbidden spin weights SO representations.
On tensor powers the commutant is the **image/quotient** of the Brauer
diagram algebra; identify its kernel and stable faithful range, rather than
asserting an abstract-algebra isomorphism in every dimension.


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
  formula for `SLₙ`, `Sp₂ᵣ`, `SOₙ` follows from LieHighestWeight's abstract
  Weyl character theorem, transported through Layers3/3A's actual group-weight
  dictionary; RootSystems supplies the appropriate roots and Weyl group.

### Layer 5: the Weyl dimension formula

- **The dimension of `V_λ`.** `weylDimension n λ : ℕ`, the product form
  `dim V_λ = ∏_{1 ≤ i < j ≤ n} (λ_i - λ_j + j - i) / (j - i)`, and the theorem
  `finrank ℂ (highestWeightRep n λ) = weylDimension n λ` obtained from Layer 4 by evaluating `s_λ` at
  `x₁ = ⋯ = xₙ = 1`, with `character_irreducible_one_eq_weylDimension` and
  `char_one` giving the equivalent trace statement (equivalently, the specialization of the abstract Weyl dimension formula
  `∏_{α > 0} ⟨λ + ρ, α⟩ / ⟨ρ, α⟩` from LieHighestWeight,
  using RootSystems' root/Weyl input and the explicit group-lattice comparison). The product is rational
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
- **A fixed algebraic GT basis and its action.** Iterated multiplicity-free
  GL₁⊂⋯⊂GLₙ branching gives the canonical pattern-indexed lines.
  Construct `gtBasis n λ : Basis {P : GTPattern n // P.topRow=λ} ℂ V_λ`
  by choosing the following definite vector in each line, and prove the
  pattern-to-line/vector comparisons for all integer dominant λ. Use Molev's unnormalized
  algebraic vectors (Theorems2.3/2.7), on the actual differentiated native
  rational Weyl carrier, with `l_ki=P_(i,k)−i+1` in 1-based notation.
  Fix its highest vector by the native row-superstandard polynomial image:
  construct the highest line in the ambient ordered tensor basis and scale
  its lexicographically first nonzero coefficient to 1; use the fixed native
  determinant-line basis for the determinant twist. Prove that this fixes
  a nonzero vector uniquely, and retain the empty/rank-zero unit case.
  Construct the extremal-projector/cleared Mickelsson lowering operators
  `z_ki` on finite-dimensional highest-vector spaces, including their domain,
  denominator cancellation, no-pole and action equations. The vector of P is
  the source-ordered product, for increasing `k=2,…,n`, of
  `z_(k,1)^(P_(1,k)−P_(1,k−1)) …
  z_(k,k−1)^(P_(k−1,k)−P_(k−1,k−1))` applied to that fixed vector.
  Construct the comparison with the native differentiated module using
  LieHighestWeight Layer9's GL dictionary. This fixes each residual scalar;
  orthogonality alone does not fix them.

  Pin the matrix-unit action (Molev Theorem2.3):
  `E_kk ξ_P=(Σ_i P_(i,k)−Σ_i P_(i,k−1)) ξ_P`,
  `E_(k,k+1) ξ_P=−Σ_i [∏_(j=1)^(k+1)(l_ki−l_(k+1,j)) /
  ∏_(j≠i)^(k)(l_ki−l_kj)] ξ_(P+δ_ki)`, and
  `E_(k+1,k) ξ_P=Σ_i [∏_(j=1)^(k−1)(l_ki−l_(k−1,j)) /
  ∏_(j≠i)^(k)(l_ki−l_kj)] ξ_(P−δ_ki)`.
  A changed nonpattern contributes the zero vector. Prove the denominator
  factors are nonzero for admitted rows; no division-by-zero convention is
  used to conceal a term. Prove the pattern-to-vector bijection and basis
  theorem from branching, for every integer dominant top row. Transport
  patterns, vectors and off-diagonal matrices under determinant shifts;
  diagonal `E_ii` acquires precisely the shift. The contravariant form with
  highest-vector norm1 and `E_ij* = E_ji` has its separate orthogonality
  and Molev Proposition2.4 norm formula; unit-normalized vectors are obtained
  by their positive norms. These are two related conventions, not a claim
  that the algebraic basis has integral coefficients. In the GL₃
  `(2,1,0)`/adjoint determinant-shift example exhibit the adjacent-edge
  coefficient product `1/2`, invariant under rescaling the two vectors.

- **The Gelfand-Tsetlin dimension formula.** `finrank ℂ (highestWeightRep n λ) = #{P : GTPattern n with top row
  λ}`, the count of GT patterns with top row `λ`. Prove it **from the branching side**: the iterated
  multiplicity-free decomposition gives the count by induction on `n`, independently of Layer 5. *Then* compare
  with `weylDimension n λ` and, through the pattern ↔ tableau bijection, with the tableau sum `s_λ(1,…,1)`
  that specializes Layer 4's Schur polynomial at `x = (1,…,1)`. Do not use the Layer 5 equality to justify the
  basis construction itself; the three counts agree as a downstream corollary.
- **The actual Capelli generators.** For size k define the column-ordered
  polynomial in `U(gl_k)[u]`
  `A_k(u)=Σ_(σ∈S_k) sign(σ) ∏_(c=1)^k
  (E_(σ(c),c)+δ_(σ(c),c)(u−c+1))`, multiplying columns from left
  to right. Define generator `(k,r)`, `1≤r≤k`, to be its coefficient
  of `u^(k−r)`, transported along the actual block Lie inclusion,
  enveloping map and differentiated action on V_λ. Construct those maps;
  prove centrality in U(gl_k), generation of its center, block compatibility
  and the determinant-shift formula. This is not the scalar Lie center.
  On ξ_P it acts by the **elementary symmetric polynomial**
  `e_r(P_(1,k),P_(2,k)−1,…,P_(k,k)−k+1)`.
  Prove the ordered determinant's action formula, simultaneous
  diagonalization, commutation and separation of full patterns, including
  n=0/empty products. The strict order of shifted entries recovers each
  row from these symmetric coefficients, so separation is an actual
  injectivity theorem. The total number of generators is n(n+1)/2.
  In Suggested the level is `k : Fin n` and degree `r : Fin(k.val+1)`;
  these mean matrix size k+1 and degree r+1 respectively.

- **`SOₙ ↓ SOₙ₋₁`, the symplectic series, and `Spin(n) ↓ Spin(n-1)`.** The same chain of subgroups gives
  Gelfand-Tsetlin-type bases for the orthogonal and symplectic families: `SO_n ↓ SO_{n-1}` is again
  multiplicity-free (the classical orthogonal Gelfand-Tsetlin construction), and the symplectic series carries
  the multiplicity-resolving construction of Layer6B, with primed rows,
  actual Hom-space bases and evaluation maps. Through the double cover this intertwines with the spin groups: the branching
  `Spin(n) ↓ Spin(n-1)` for the spin representations is the subject of the sibling
  [`../SpinRepresentations`](../SpinRepresentations/README.md), which this layer meets at the `SOₙ`/`Spin(n)`
  Gelfand-Tsetlin bases.

### Layer 6B: symplectic multiplicity vectors and iterated bases

The restriction is along the native inclusion fixing the **first**
symplectic plane and acting on the last r−1 planes. Construct this
block map and all recursive inclusions. For nonnegative dominant top row
`a^(r)=λ`, keep an intermediate row `b^(k)` of length k between every
two successive unprimed rows, with
`a_i^(k)≥b_i^(k)≥a_(i+1)^(k)` for i<k,
`a_k^(k)≥b_k^(k)≥0`, and
`b_i^(k)≥a_i^(k−1)≥b_(i+1)^(k)` for i<k.
The intermediate row is actual multiplicity data; discarding it loses
vectors even in the standard Sp₄ module. Construct finite row/pattern
types, extensionality, admissibility/empty/low-rank API and enumeration.

**The signed-coordinate dictionary.** Molev orders signed indices
`−r,…,−1,1,…,r`. Identify `−i` with native `e_(r+1−i)` and `+i`
with `f_(r+1−i)`. Compare the signed alternating form with native
`J=[[0,−I],[I,0]]` (an overall negative has the same preserving group),
and conjugate every signed matrix unit before comparing brackets, Cartan
and Borel operators. In particular `F_ii` acts as
`E_(f_(r+1−i),f_(r+1−i))−E_(e_(r+1−i),e_(r+1−i))`.
Thus source coordinates `0≥λ₁≥⋯≥λ_r` become
`a_j=−λ_(r+1−j)`. Removing signed ±r fixes native e₁,f₁;
the rank-(r−1) dictionary followed by the last-plane inclusion gives the
same maps on every remaining signed index. Prove these equations and the
two translated interlacing chains, rather than changing the Borel or the
subgroup silently. Orthogonal and Spin chains keep their separate
conventions and ownership.

Explicitly the source C generator is
`F_ij=E_ij−sgn(i)sgn(j)E_(−j,−i)`.
Under the signed-index bijection α its native matrix is
`E_(α(i),α(j))−sgn(i)sgn(j)E_(α(−j),α(−i))`.
Check `XJ+JXᵀ=0` and the Cartan/positive-root identities on these
matrices. A scalar sign change in the alternating form preserves its
stabilizer; an unmentioned change in F_ij or in the subgroup is not allowed.

**The actual operators and spectral shifts.** On the finite-dimensional
highest-vector spaces construct Molev's Cartan projector and cleared
Mickelsson lowering operators z, with domains, rational identities,
denominator cancellation and pole-free action at all admitted integral
rows. In this signed convention **ρ_i=−i**,
`f_i=g_i=F_ii−i`,
`l_i=λ_i−i+1/2`, `γ_i=ν_i−i+1/2`,
`l_ki=λ_ki−i+1/2` and `l'_ki=λ'_ki−i+1/2`.
The shift uses the column i, not the row k. Define the interpolation
operator on these spaces by Molev (3.10),
`Z_(r,−r)(u)=Σ_(i=1)^r z_(r,i)z_(i,−r)
∏_(j≠i)(u²−g_j²)/(g_i²−g_j²)`;
prove the indicated localized identities, the action after cancellation,
and `Z_(r,−r)(g_i)=z_(r,i)z_(i,−r)` in the stated convention.
The i=r endpoint uses the source's Cartan-extended operators; build that
extension and its defining identity before using this interpolation.
Do not substitute an arbitrary family of endomorphisms for Z or z.

For each admissible restricted weight μ and intermediate negative row ν,
the **actual multiplicity vector** is the source-ordered product
`[∏_(i=1)^(r−1) z_(r,i)^(ν_i−μ_i)
z_(i,−r)^(ν_i−λ_i)]
[∏_(s=l_r)^(γ_r−1) Z_(r,−r)(s)] ξ`.
The upper endpoint is γ_r **minus 1**, not γ_(r−1). These endpoints
are half-integers: define this as the finite product at `s=l_r+m`,
`m=0,…,ν_r−λ_r−1`, of natural length `ν_r−λ_r≥0`; it is empty
when that length is0. In the iterated pattern formula the corresponding
length is `λ'_(k,k)−λ_(k,k)`, with start `l_(k,k)`. Do not round a
half-integer endpoint or sum only over integral spectral values. Prove its highest weight, nonzero
value and basis status in the actual restricted highest-vector space,
using Lemma3.4/Theorem3.5 and the explicit signed/native module comparison.
Translate each such vector to a **group intertwiner**
`V_μ → Res V_λ` through the Layer3A Hom comparison and the unique map
from the normalized highest vector. Prove these maps form a basis of
the actual `Representation.IntertwiningMap` space, not a merely
equal-cardinality auxiliary vector space. No type-A norm identity is
assumed for type C.

Construct the evaluation isomorphism
`⊕_μ (Hom_Sp(V_μ,Res V_λ) ⊗ V_μ) ≅ Res V_λ`,
with its actual evaluation, inverse/projections, group equivariance and
coordinate equations. Combine the chosen Hom basis with the previously
constructed basis of V_μ and iterate the **same** last-plane inclusions.
This is the ordered construction of a full pattern basis; prove
independence/spanning, branching character and dimension identities,
coordinate changes and compatibility at every level. Neither a row count
nor the centers of the subgroup chain constructs these vectors.

For λ=(1,0), the standard Sp₄ module restricted to the last-plane Sp₂ is
its standard V₂ plus two trivial copies. The two fixed vectors are the
actual first-plane e₁,f₁. For μ=0 the two admissible rows are b=(1,0)
and b=(0,0); compute the nonzero scalar comparisons of their source
lowering vectors with those two coordinate vectors in the fixed
normalization. Every subgroup-chain central operator has the same
character on the two trivial copies and cannot separate them. Exhibit
this failure and the two independent normalized Hom maps. This test,
the Sp₂ unit/rank-zero cases and all existing GL/SO/Spin examples are
acceptance criteria of the complete construction.


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

### Mixed symmetric tensors and contraction

For `N≥2`, `V=ℂᴺ` and `m,n≥0`, construct the rational `GL_N` representation
`P_(m,n)=Sym^m V⊗Sym^n V*` on the existing power and dual carriers.
Identify it equivariantly with the bidegree `(m,n)` submodule of
`R=ℂ[x₁,…,x_N,y₁,…,y_N]`, using native
`MvPolynomial.weightedHomogeneousSubmodule` with variable weights `(1,0)`
and `(0,1)`. The variables represent basis vectors and dual basis vectors:
`g·x_i=Σ_j g_ji x_j` and `g·y_i=Σ_j (g⁻¹)_ij y_j`.
Construct the symmetric-power/polynomial comparison and its inverse on monomials,
including the zero-degree cases, using `SymmetricAlgebra.equivMvPolynomial`
and the quotient defining `SymmetricPower`. Prove compatibility with the
existing actions, degree decompositions and change of basis.

**The operators and their normalization.** On this same polynomial ring define
`Δ=Σ_i ∂x_i∂y_i`, multiplication by `r=Σ_i x_i y_i`, and the two Euler
operators `E_x=Σ_i x_i∂x_i`, `E_y=Σ_i y_i∂y_i`, using native
`MvPolynomial.pderiv`. Prove their monomial formulas, degree changes,
`GL_N` equivariance of Δ and r, and `[Δ,r]=N+E_x+E_y`.
In particular, `Δ(x^α y^β)=Σ_i α_iβ_i x^(α−e_i)y^(β−e_i)`;
a summand with a zero exponent is zero. For `m,n≥1`, compare Δ with
the tensor contraction obtained by embedding each symmetric power into its
tensor power by **averaging** all permutations, contracting one selected
V/V* pair, and projecting to symmetric powers: that map is `Δ/(mn)`.
The sum of all `mn` selected-pair contractions is Δ. Export the actual
comparison maps and the nonzero normalization scalar, rather than identify
all symmetrization conventions silently.

**Surjectivity and the decomposition.** For `a,b≥0` and `f∈P_(a,b)`, construct
an equivariant right inverse `S_(a,b):P_(a,b)→P_(a+1,b+1)` by

```
S_(a,b)(f) = Σ_(j=0)^min(a,b) c_j r^(j+1) Δ^j f,
c_0 = 1/(N+a+b),
c_j = −c_(j−1)/((j+1)(N+a+b−j))  (j≥1).
```

Prove the coefficient denominators are nonzero and telescope the identities

```
Δ(r^(j+1)Δ^j f)
  = (j+1)(N+a+b−j) r^j Δ^j f + r^(j+1)Δ^(j+1)f.
```

Thus `Δ S_(a,b)=id`, with the image of S contained in `r P_(a,b)`.
Prove multiplication by r injective and the restriction
`Δ:r P_(a,b)→P_(a,b)` an isomorphism. Define `H_(m,n)` as the kernel
of the ambient Δ restricted to `P_(m,n)`, so `H_(m,0)=P_(m,0)` and
`H_(0,n)=P_(0,n)` without a fictitious negative-degree target. Construct
the equivariant projection `id−S_(m−1,n−1)Δ` for positive m,n and the
actual mutually inverse maps of the Fischer decomposition

```
P_(m,n) = ⊕_(j=0)^min(m,n) r^j H_(m−j,n−j).
```

Give inclusion, component extraction, projection, kernel and image laws.
For the standard U(N) restriction, equip monomials with squared norm
`α!β!` and prove multiplication by r is adjoint to Δ. This makes
`H_(m,n)⊕rP_(m−1,n−1)` an orthogonal invariant splitting and identifies
the recursively extracted Fischer summands as pairwise orthogonal.

**Highest weights and dimensions.** After Layers3–5, identify H with the
irreducible of dominant weight `(m,0,…,0,−n)`. Construct its nonzero
highest vector `x₁^m y_N^n`, prove it is killed by the upper-triangular
raising operators `x_i∂x_j−y_j∂y_i` for `i<j`, and use complete
reducibility and the Weyl dimension formula to prove that its irreducible
summand exhausts H. The required dimension comparison is

```
dim H_(m,n) = binom(N+m−1,m) binom(N+n−1,n)
             − binom(N+m−2,m−1) binom(N+n−2,n−1),
```

where the entire second term is zero if m=0 or n=0. Prove this equals
the Weyl dimension at the displayed weight; in rank N=3 it is
`(m+1)(n+1)(m+n+2)/2`. Export the actual irreducible comparisons and the
resulting multiplicity-one decomposition of P, including all determinant
weights. Algebraic contraction and splitting use Layer1 and polynomial
linear algebra; their irreducibility comparison comes afterward. In
particular, SchubertGeometry S4.4a's independent early 15-dimensional
kernel calculation has no prerequisite on this later classification.

**The U(3) weight diagram.** For `ν∈ℤ³` with `Σν_i=m−n`, put
`L=m−Σ_i max(ν_i,0)=n−Σ_i max(−ν_i,0)`. Prove by counting monomial
pairs that the multiplicity in P is `binom(L+2,2)` when L≥0 and zero
otherwise. Surjectivity on each weight space then gives multiplicity
`L+1` in H when L≥0 and zero otherwise. Weights with the wrong coordinate
sum have multiplicity zero. Describe the resulting hexagonal support,
its triangular degenerations when m or n is zero, and its inward layers;
the maximal multiplicities are `binom(min(m,n)+2,2)` in P and
`min(m,n)+1` in H. Check `(m,n)=(1,1)`: `P=ℂ⊕sl₃`, dim H=8 and
zero-weight multiplicity2; `(2,1)`: dim H=15 and weight `(0,0,1)` has
multiplicity2; `(3,2)`: dim H=42 and maximal multiplicity3.

`MixedSymmetricContractionTargets.lean` pins the native polynomial carrier,
operators and right-inverse target. This subsection specifies the full
construction and representation comparisons.


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
RootSystems' root/Weyl geometry, with the lattice and Weyl character/dimension
inputs from LieHighestWeight. Layer3A builds the concrete SO/Sp torus, lattice,
exterior blocks and Cartan components before the later harmonic/Brauer
classification. Its group/Lie adapters use only LHW9's earlier connected
finite-dimensional rational fixed-vector cut and its specified RG tangent/Cartier suppliers. The GLₙ classification uses native
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

Layer6B consumes the rational modules and Hom comparison of Layer3A,
then owns its projectors/cleared lowering/interpolation operators and actual
multiplicity bases before their evaluation and pattern-basis iteration.
No subgroup-chain central-character separation is assumed for multiplicities.

Layer6A's concrete subgroup/normal-kernel and tangent calculations use Layer0
and the early LieGroups Layers0–4; the representation conclusions use Layer3
and native Schur/density. Its algebraic model uses ReductiveGroups Layers0–3.
TensorProductCombinatorics H2 consumes these finished subgroup/restriction maps;
no hive, tensor-multiplicity or later compact-normalizer theorem is an input
to the structural classification. No generic supplier receives a return dependency.

## References

- A. I. Molev, [*Gelfand–Tsetlin bases for classical Lie algebras*, arXiv:math/0211289v2](https://arxiv.org/abs/math/0211289v2), §§2.1–2.4 and3.1–3.4: Theorems2.3/2.7 and Proposition2.4, Capelli(2.21), type-C(3.10), Lemma3.4 and Theorem3.5. The source signed-coordinate and type-C shifts are fixed explicitly in Layers6/6B.

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
