# Roadmap: finite-dimensional representations of the classical groups

**Summary.** This roadmap develops rational representations of the complex classical
matrix groups from their standard modules, tensor powers and Young-symmetrizer images.
Its end theorems are the rational highest-weight classification, Schur and Weyl character
and dimension formulas, representation-level branching, and normalized Gelfand–Tsetlin
bases. The orthogonal and symplectic constructions retain their invariant forms, actual
group weight lattices and multiplicity spaces.

## Scope and ownership

ClassicalGroups owns the comparison of the native rational Weyl and Schur models with
all rational irreducible GL modules (Layers 3–5), the concrete SO/Sp group–Lie comparisons
and rational models (Layer 3A), and the normalized branching constructions (Layers 6/6B).
Its diagonal-overgroup and all-linear-map comparisons are specified in Layers 6A and 2A.

- Mathlib supplies matrix groups, representations, multilinear powers and categorical
  colimits. Tau Ceti supplies the standard and power actions, rationality predicates,
  dominant weights, rational Weyl modules, Schur images, Schur polynomials and signed GT
  patterns. Their constructions and native identities are consumed, not repeated.
- SchurWeyl Layers 0–2 and 7–8 own tableaux, Young symmetrizers, the Frobenius
  characteristic and the double-centralizer theorem. Layer 4 uses the additional
  skew-tableau product contract stated explicitly below as a supplier gap.
- ReductiveGroups Layers 0–3, 5P and 6 own affine groups, comodules, tangent spaces,
  stabilizers, Cartier smoothness and linear reductivity. Its §10D owns polynomial
  matrix-monoid extensions and the nonnegative-weight criterion; Layer 0A here keeps
  only the comparison with the native matrix-action predicate.
- LieHighestWeight Layers 2–6 own the abstract semisimple highest-weight, character and
  dimension theory; its Layer 9 owns the GL differentiation application. The generic
  connected rational fixed-vector/stable-subspace theorem needed for SO/Sp is a target
  of Layer 3A here, not an input from that GL application.
- RootSystems Layers 1–4 and 6 supply root/coroot and Weyl geometry.
  SpinRepresentations Layers 4–5 own the spin and half-spin modules; their
  restriction comparison is consumed in Layer 6 here. ClassicalGroupsPartII's
  Scope and ownership reserves the GSp representation-ring and Levi-character theory;
  none of those constructions is assigned here.

## Conventions

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
  sequences** `λ₁ ≥ ⋯ ≥ λₙ` (a `TauCeti.DominantWeight n`), and `V^{⊗d}` is polynomial. Pin `TauCeti.DominantWeight n` as the
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

## Exact supplier contracts

### From Mathlib

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

### From Tau Ceti

Consume native Tau Ceti standard, tensor, symmetric and exterior representations;
`TauCeti.IsRationalRep`/`TauCeti.IsPolynomialRep`; diagonal torus and weight spaces; `TauCeti.DominantWeight`
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

The acceptance theorems use these carriers directly. In particular,
`TauCeti.IsRationalRep.isInternal_weightSpace` in
`TauCeti/RepresentationTheory/ClassicalGroups/Weight/Decomposition.lean:233`
supplies the internal weight decomposition, and
`TauCeti.char_tensorPowerRep` in
`TauCeti/RepresentationTheory/ClassicalGroups/TensorPower.lean:198`
supplies the tensor character identity. Also consume `TauCeti.char_extPowerRep_diagonal` from
`TauCeti/RepresentationTheory/ClassicalGroups/ExteriorPower.lean:138`,
`TauCeti.GTPattern.card_topRow_eq_weylDimension` from
`TauCeti/RepresentationTheory/ClassicalGroups/GelfandTsetlin/Dimension.lean:187`,
and `TauCeti.weylModuleOfShape_eq_bot_iff` from
`TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean:472`.
The structural tensor-square splitting is `TauCeti.tensorSquareRepEquiv`
(`TauCeti/RepresentationTheory/ClassicalGroups/Decomposition.lean:49`).
For characters and dimensions use
`TauCeti.char_weylFDRepOfShape_diagramOf_diagonal` and
`TauCeti.finrank_weylModuleOfShape`
(`TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Character.lean:150,159`),
and `TauCeti.finrank_rationalWeylFDRep`
(`TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Dimension.lean:76`).
The former character statement uses a partition of d; pass between it and a
Young diagram with the native shape-partition dictionary. Combine it with
`TauCeti.char_rationalWeylFDRep` for the determinant twist. Combine the rational
dimension theorem with `TauCeti.GTPattern.card_topRow_eq_weylDimension` for the
GT count. These native identities are inputs, not additional acceptance theorems.

### From TauCetiRoadmap.ReductiveGroups

Use Layers 0–1 for coordinate Hopf algebras, finite comodules and their point
representations; Layer 2 for tangent maps; Layer 3A for closed stabilizers;
Layer 5P for characteristic-zero Cartier smoothness; Layer 6 for linear
reductivity; and §10D for polynomial End(V)-actions, uniqueness, scalar
degrees and the nonnegative-weight criterion over every field. Layer 0A's
comparison specializes that last contract to the native complex matrix action.

### From TauCetiRoadmap.SchurWeyl

Use Layers 0–2 for Young diagrams/tableaux and Young symmetrizers, Layer 7 for
finite Schur polynomials, the Frobenius characteristic and RSK, and Layer 8
for the two action images and double-centralizer theorem. The Schur image
used in that theorem is the native Tau Ceti carrier, so neither construction
requires a return dependency on the classification here.

What SchurWeyl must provide (gap:skew-tableau-lr-product): finite skew
semistandard tableaux of outer shape ν and inner shape λ, with λ≤ν, weak
rows and strict columns; content μ given by row lengths; and the LR subset
whose reading word goes top to bottom and right to left, with every prefix
satisfying count(k+1)≤count(k). Supply its finiteness, zero count for failed
containment or size, the weight-preserving bijection between pairs of bounded
straight tableaux and pairs of a straight tableau of shape ν and such an LR
tableau, and hence the identity s_λ s_μ=Σ_ν c^ν_(λ,μ)s_ν in every finite
alphabet. This is an extension contract, not a claim about Layer 7's existing
RSK statement; ClassicalGroups owns only its representation-theoretic use.
For horizontal strips use `TauCeti.hsymm_mul_diagramSchurPoly` directly
(`TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/Pieri.lean:231`).

### From TauCetiRoadmap.LieHighestWeight and TauCetiRoadmap.RootSystems

Use LieHighestWeight Layers 2–6 for finite-dimensional semisimple Lie modules,
their integral highest weights and Weyl character/dimension formulas. Use
RootSystems Layers 1–4 and 6 for classical root systems and Weyl groups for the B/C/D coordinate
comparisons. The connected group/Lie comparison needed to apply them to SO/Sp
is proved in Layer 3A; LieHighestWeight Layer 9's GL-specific bridge is a
consumer of the GL models and is not an SO/Sp supplier.

## How to read the build

Layers 0–2 provide concrete rational modules and functorial powers; Layer 0A
compares native polynomiality with the supplied monoid extension and Layer 2A
specifies its all-linear-map comparison. Layers 3/3A classify GL and the form
groups; Layers 4–5 identify their characters and dimensions. Layer 6 proves
branching and normalized GL bases, Layer 6B resolves symplectic multiplicities,
and Layer 6A studies diagonal overgroups and restrictions. Each target lists
its construction and proof inputs separately from later applications.

## Layer 0: the classical groups and the standard representation

### 0.1 The standard representation

`TauCeti.stdRep ℂ n : Representation ℂ (GL n ℂ) (Fin n → ℂ)`, the tautological
action `g • v = (g : Matrix _ _ ℂ).mulVec v`, built from `Matrix.GeneralLinearGroup.toLin`; its bundled
form `FDRep ℂ (GL n ℂ)`, its character (`χ_std (g) = trace g`), and its dual `V*` via
`Representation.dual`. This is the concrete engine; everything downstream is a functor applied to it.

*Needs:* `Matrix.GeneralLinearGroup.toLin`; the native standard representation and trace.

### 0.2 The subgroups and the extra invariants

The inclusions `SL(n,ℂ) →* GL n ℂ`
(`Matrix.SpecialLinearGroup.toGL`), `symplecticGroup ↪ GL`, `orthogonalGroup ↪ GL`, and the restricted
standard representation. The distinguishing structure each preserves: the volume form
`⋀ⁿ V ≅ ℂ` (trivial for `SLₙ`), a nondegenerate symmetric form `V ≅ V*` (for `Oₙ`), a nondegenerate
alternating form `V ≅ V*` (for `Spₙ`). State the invariance as an equivariance of the pairing; it is what
collapses `V` and `V*` and shortens the tensor decompositions.

*Needs:* the native subgroup inclusions, volume and symmetric/alternating forms; Layer 1 for their exterior/tensor interpretations.

### 0.3 Rational and polynomial representations

`TauCeti.IsRationalRep (ρ : Representation ℂ (GL n ℂ) W)` and
`TauCeti.IsPolynomialRep ρ` as properties. State them **basis-independently** on a finite-dimensional `W` (the matrix
entries in one basis are rational/polynomial in `gᵢⱼ`, `det⁻¹` iff in any basis; equivalently `ρ` is a
comodule over `ℂ[gᵢⱼ, det⁻¹]`), and expose the coordinate-entry form as a lemma. `TauCeti.stdRep`, `TauCeti.tensorPowerRep`,
`TauCeti.symPowerRep`, `TauCeti.extPowerRep` are polynomial; `det` and its powers are the one-dimensional rational
representations `det^m`.

*Needs:* `TauCeti.IsRationalRep`, `TauCeti.IsPolynomialRep`; ReductiveGroups Layer 1 for the coordinate/comodule comparison.

### 0.4 Complete reducibility over `ℂ`

Every finite-dimensional rational representation is a direct sum of
irreducibles; `rationalRep_isSemisimple` states its native matrix-action comparison. Its comodule input is ReductiveGroups Layer 6:
[`../ReductiveGroups`](../../ReductiveGroups/README.md) proves the linear reductivity of `GLₙ` in
characteristic `0` at the comodule level, and this roadmap cites it. (An in-house proof via the compact form
`U(n)` and Weyl's unitarian trick is possible but pulls in compact-group topology, Haar/unitary averaging,
and analytic facts that are out of scope here, so it is not the chosen route.)

*Needs:* ReductiveGroups Layer 6 linear reductivity; the coordinate/comodule comparison above; finite-dimensionality.

### Examples

**Checks.**

- On diag(2,3), the standard trace is 5 and the dual trace is 1/2+1/3=5/6.
- Rank zero has the zero standard module, trace 0, but its zeroth tensor power
is the one-dimensional unit, trace 1.
- The GL₁ character t↦t⁻¹ takes 2 to 1/2: it is rational but not polynomial;
the trivial character takes 0 to 1 in its polynomial extension.

### Dependencies

The coordinate-entry/comodule comparison uses ReductiveGroups Layers 0–1.
The complete-reducibility comparison uses its Layer 6 linear reductivity and
finite-dimensionality. The standard action and form restrictions use the native
matrix actions and pairings only.

## Layer 0A: extending to the full matrix monoid

### 0A.1 Native polynomiality and the supplied monoid action

Compare ReductiveGroups §10D's polynomial End(V)-action with
`TauCeti.IsPolynomialRep ρ` for a finite-dimensional complex matrix-group
representation ρ on W. The comparison fixes a finite basis b of W and identifies
its coefficient coaction with the polynomials whose evaluations are
`LinearMap.toMatrix b b (ρ g)`; after choosing a basis of V, End(V) is the native
matrix monoid. This is a comparison of presentations of the same action,
not another construction of its coordinate bialgebra or extension theorem.

- Prove the coordinate/comodule comparison independent of b and of the basis of V.
- Identify the supplied extension on every invertible matrix with ρ, and compare
  its intertwining maps with native `Representation.IntertwiningMap` on W.
- Transport the supplied unit, multiplication, scalar-degree and nonnegative-weight
  laws through these comparison maps, including the zero-dimensional carrier.

*Needs:* ReductiveGroups §10D; Layer 0's coordinate/comodule dictionary;
`TauCeti.IsPolynomialRep`; `LinearMap.toMatrix`; native matrix/linear-map equivalence.

**Checks.**

- For N=1 and degree d=2 the action is A↦A²: 2↦4 and 0↦0 in both presentations.
- Degree 0 is the identity action even at A=0; it is not a zero-preserving map
  of additive monoids. The rational character A↦A⁻¹ cannot extend: its value
  at A=2 is 1/2 and no polynomial has that restriction on all nonzero A.
- For N=0 the matrix monoid has one element, 0=1, whose action must be the
  identity, including on a one-dimensional W. The zero module has the unique
  action; it cannot have a unique scalar degree.

### Examples

The scalar characters in the Checks distinguish a unital multiplicative action
from an additive map and from a rational action with poles.

### Dependencies

ReductiveGroups §10D and the Layer 0 dictionary; no highest-weight classification
is needed for the comparison.

## Layer 1: functorial constructions and tensor powers

### 1.1 The tensor power representation

`TauCeti.tensorPowerRep ℂ n d : Representation ℂ (GL n ℂ) (⨂[ℂ]^d (Fin n → ℂ))`,
the `d`-fold tensor power of `TauCeti.stdRep` (diagonal action), with `char (TauCeti.tensorPowerRep ℂ n d) g = (trace g)^d`
via `char_tensor`. Likewise the tensor product of two representations (`Representation.tprod`) as a
bifunctor and the dual (`Representation.dual`).

*Needs:* the native standard action, tensor-power maps and tensor-product representation.

### 1.2 Symmetric and exterior power representations

`TauCeti.symPowerRep ℂ n k : Representation ℂ (GL n ℂ) (Sym[ℂ]^k V)`
and `TauCeti.extPowerRep ℂ n k : Representation ℂ (GL n ℂ) (⋀[ℂ]^k V)`, functorial via `exteriorPower.map` and the
symmetric-power functoriality; their characters are the complete-homogeneous `hsymm` and elementary
`esymm` symmetric polynomials in the eigenvalues of `g`, i.e.
`char (TauCeti.symPowerRep ℂ n k) (diagonal x) = hsymm k (x)` and `char (TauCeti.extPowerRep ℂ n k) (diagonal x) = esymm k (x)`.
In particular `⋀ⁿ V ≅ det` and `⋀ᵏ V = 0` for `k > n`.

*Needs:* the native symmetric/exterior functors, their standard actions and torus character theorems.

### 1.3 The first decomposition

`V^{⊗2} ≅ Sym²V ⊕ ⋀²V` as `GL n ℂ`-representations (characteristic 0), an
isomorphism of `FDRep ℂ (GL n ℂ)`, with the symmetrizer/antisymmetrizer projections `½(1 ± swap)`. This is
the smallest instance of the Weyl construction, used through the supplied equivariant splitting.

*Needs:* the native tensor-square equivalence and invertibility of 2.

### Examples

**Checks.**

- For diag(2,3), the tensor-square trace is 25, the symmetric-square trace
is 4+6+9=19, and the exterior-square trace is 6: 25=19+6.
- In dimension 1, the symmetric square of the character t is t² and Λ²=0;
at t=2 the splitting reads 4=4+0.
- Degree zero gives the unit with trace 1, even for dimension 0; every positive
tensor degree in dimension 0 gives trace 0.

### Dependencies

Power maps use Layer 0 and the native tensor/symmetric/exterior functors.
The tensor-square isomorphism uses the averaging projections (1±swap)/2,
so 2 is invertible; over characteristic 2 these projections are unavailable.

## Layer 2: the Weyl construction via Young symmetrizers

This layer owns the native `TauCeti.schurFunctor n μ` invariant image from
`ClassicalGroups/WeylModule/Basic.lean`, fixed with the row-superstandard tableau;
SchurWeyl Layer 8 consumes that same carrier. Young symmetrizers belong to
SchurWeyl Layer 2 and the native symmetric-group action and full duality to
SchurWeyl Layer 8. Consume the native image, invariance and vanishing results;
construct only the remaining comparisons and API on that carrier.

### 2.1 The symmetric-group action on `V^{⊗d}`

`TauCeti.permTensorAction ℂ n d : Representation ℂ (Equiv.Perm (Fin d)) (⨂[ℂ]^d V)`,
permuting tensor factors, and its **commutation** with the `GLₙ`-action (they generate each other's
commutants: Schur-Weyl duality, cited from [`../SchurWeyl`](../SchurWeyl/README.md)).

*Needs:* SchurWeyl Layer 8; native permutation action and commutation.

### 2.2 Young symmetrizers and the Schur functor

For `λ : YoungDiagram` with `|λ| = d`, the Young symmetrizer
`c_λ` (from [`../SchurWeyl`](../SchurWeyl/README.md)) acts on `⨂[ℂ]^d V`; its image is the **Schur functor**
the Schur image SᵘV, a `GLₙ`-subrepresentation of `V^{⊗d}`. Fix the choice of `c_λ` (the row-superstandard
tableau of shape `λ`) so `Sᵘ V` is a definite subspace; images for other tableaux are canonically
isomorphic to it, an explicit lemma. Use the native invariant-image and height-vanishing contracts; use the two extreme-case comparisons
`S^{(d)} V ≅ Symᵈ V`, `S^{(1ᵈ)} V ≅ ⋀ᵈ V`.

*Needs:* SchurWeyl Layer 2; the native Young image, height-vanishing and extreme-shape comparisons.

### 2.3 The decomposition of `V^{⊗d}`

`V^{⊗d} ≅ ⊕_{λ ⊢ d} (Sᵘ V) ⊗ (Specht λ)` as `GLₙ × Sₐ`-representations
(Schur-Weyl, cited), whence `V^{⊗d} ≅ ⊕_λ (Sᵘ V)^{⊕ f^λ}` as `GLₙ`-representations, with `f^λ` the number
of standard Young tableaux (`../SchurWeyl`). This recovers Layer 1's `⊗2` case and is the structural heart.

*Needs:* SchurWeyl Layer 8 double-centralizer theorem and its native Schur and Specht carriers.

### Examples

**Checks.**

- On a one-dimensional V, the row shape (2) gives a line and the column
shape (1,1) gives zero; a height-blind construction fails this distinction.
- For V=ℂ² and shape (1,1), the Young image is the line spanned by
e₁⊗e₂−e₂⊗e₁; swapping factors acts by −1 on it.
- The empty shape gives ℂ even for V=0; any nonempty shape of positive height
gives zero when V=0.

### Dependencies

The invariant image uses Layer 1 and SchurWeyl Layer 2's Young symmetrizer.
The tensor-power decomposition uses SchurWeyl Layer 8's two action images and
double-centralizer theorem. The Schur/highest-weight isomorphism is Layer 3.

## Layer 2A: Schur functors on all linear maps

For every shape λ of size d construct a functor on the native
`ModuleCat ℂ`, on **all** linear maps, whose value at V is the actual
submodule `S_λ(V)=range(c_λ:V^⊗d→V^⊗d)`. Use the existing
row-superstandard tableau and `YoungTableau.youngSymmetrizerOver`,
acting through native `PiTensorProduct.reindexRepresentation` and its
group-algebra action. For arbitrary linear `f:V→W`, including maps
between different dimensions, prove
`f^⊗d c_(λ,V)=c_(λ,W) f^⊗d` by native
`PiTensorProduct.map_comp_reindex_eq` and linear extension. Restrict
`PiTensorProduct.map (fun _=>f)` to the indicated image submodules.
Give its inclusion equation on every vector, identity/composition laws
and the resulting functor, with no chosen basis in its definition.
This construction works also on infinite-dimensional vector spaces;
its finite-dimensional restriction has finite-dimensional values.

Construct the comparison at V=ℂ^N with the SAME native
`TauCeti.weylModuleOfShape`/`TauCeti.schurFunctor N λ` carrier and
action, including the actual basis-change naturality squares. At every
endomorphism A of ℂ^N the induced map is the Layer0A polynomial monoid
extension. Prove polynomial dependence on f in finite bases, homogeneous
of degree d; no additivity in f is asserted when d>1. The empty shape
is the constant functor ℂ, with every arrow acting by identity. For a
nonempty shape and the zero arrow f:V→W, prove S_λ(f)=0 on the image
carriers. On finite-dimensional V prove vanishing iff dim V is less
than the height of λ, consuming the native coordinate-space result.
Export natural relabelling/tableau comparisons and the row/column
identifications with the symmetric/exterior power **functors**.
Upgrade Layer1's tensor-square splitting to a natural isomorphism on
all linear maps, with projections `½(1±swap)` and the actual
symmetric/exterior quotient-to-image comparisons.

For a linear map f of finite rank r, factor through its actual image
and prove `range(S_λ(f))≃S_λ(range f)` by the induced inclusion and
surjection, with inverse on image carriers. Prove that S_λ preserves
injective maps and surjective maps, using split linear maps over ℂ.
For finite-dimensional source and target, compute
`rank(S_λ(f))=s_λ(1,…,1)` in r variables using Layers4–5;
for d>0 it is zero exactly when r is less than the height.
For d=0 it is one even when r=0. Include zero-dimensional spaces,
the empty shape, singular maps and maps changing dimension.

After Layer3, compare the SAME functor with the column/exterior model
in the notes. Put `a_i=λ_i−λ_(i+1)` with λ_(h+1)=0 and construct
a natural injection
`S_λ(V)→⊗_(i=1)^h Sym^(a_i)(Λ^i V)` from the fixed Young operators,
column wedge maps and symmetrization of equal-height columns. Prove
injectivity and give the actual image, not an arbitrary irreducible
subspace chosen separately for each dimension. Normalize on a finite
ordered basis by sending the normalized highest vector to
`⊗_i(e₁∧⋯∧e_i)^(a_i)`; compute the nonzero scalar relating this to
the unnormalized Young-operator formula. Prove commutation with every
linear map and transport the earlier functor maps through these injections.
For finite dim V≥h, identify the image as the Cartan component generated
by that tensor, of highest weight `(λ₁,…,λ_h,0,…,0)`; below h both
sides of the claimed image comparison are zero. The whole ambient tensor
product is not asserted irreducible. The all-linear-map functor and its
native coordinate-space comparison precede this highest-weight argument.

Deduce that any finite-dimensional polynomial M_N representation admits
an extension to a finite direct sum of these Schur functors, by its
finite shape multiplicities and the Layer0A comparison. Fixed-N evaluation
does not determine that global extension uniquely: every shape of height
greater than N evaluates to zero there. Compare this finite-output
polynomial construction with the ordinary Kan extension already specified
in the worked examples; its existence alone supplies neither polynomiality
nor finite-dimensional outputs. The generic Kan-extension engine is unchanged.

### Examples

**Checks.**

- For shape (2) and f:ℂ→ℂ given by 2, the induced map is multiplication
  by 4; for f+f it is multiplication by 16, not 8.
- For shape (1,1), a rank-one map ℂ²→ℂ³ induces rank 0 on Λ², while a
  rank-two inclusion induces rank 1. The row shape (2) at rank 1 has rank 1.
- The empty shape sends the zero map to the identity of ℂ, of rank 1;
  the nonempty row shape (1) sends it to zero.

### Dependencies

The functor maps and naturality use Layer 1 and Young-operator commutation.
The matrix-monoid comparison uses Layer 0A; the column/Cartan identification
uses Layer 3. The numerical rank formula uses Layers 4–5 after these maps exist.

## Layer 3: maximal torus, weights, and the highest-weight classification

The GLₙ route uses native group-level torus/transvection theory. For the other connected
classical groups, consume [`../RootSystems`](../RootSystems/README.md) (root data,
dominant chambers and Weyl groups) and [`../LieHighestWeight`](../LieHighestWeight/README.md)
(the semisimple highest-weight theorem).

### 3.1 The maximal torus and weight spaces

`TauCeti.diagonalTorus ℂ n : Subgroup (GL n ℂ)`, the invertible diagonal
matrices, `≃* (Fin n → ℂˣ)`; for a rational representation `ρ` on `W`, the **weight space** `TauCeti.weightSpace ρ λ`
for `λ : Fin n → ℤ`, and the **weight-space decomposition** `W = ⊕_λ TauCeti.weightSpace ρ λ` (simultaneous
diagonalization of the commuting torus, over `ℂ`). Identify these group characters with the abstract Lie weight lattice
through this layer's torus/differentiation dictionary and LieHighestWeight;
RootSystems supplies the root/Weyl geometry, not the weight lattice.

*Needs:* native diagonal torus and `TauCeti.IsRationalRep.isInternal_weightSpace`; LieHighestWeight Layer 2 only for the abstract weight dictionary.

### 3.2 Dominant weights

`TauCeti.DominantWeight n`, the weakly decreasing `λ : Fin n → ℤ` (`λ i ≥ λ (i+1)`), the
index type for `GLₙ`-irreducibles; the subset with `λ n ≥ 0` corresponds to `YoungDiagram`s of at most `n`
rows (polynomial representations). Construct the dominance order using LieHighestWeight's
weight lattice and the positive roots. The `GLₙ` Weyl group `Sₙ` and its action on
coordinates specialize RootSystems' Weyl-group geometry.

*Needs:* native `TauCeti.DominantWeight`; RootSystems Layers 1–4; LieHighestWeight Layer 2 for the lattice comparison.

### 3.3 Highest weight and the classification

The **highest weight** of an irreducible (the maximal weight in
dominance order, with one-dimensional weight space), and the **theorem of the highest weight**: `λ ↦ V_λ`
is a bijection from `TauCeti.DominantWeight n` to isomorphism classes of irreducible rational `GLₙ`-representations, stated as `rational_irreducible_classification`.
For GLₙ consume native `TauCeti.DominantWeight`, `TauCeti.IsRationalRep`, `TauCeti.IsPolynomialRep`,
`TauCeti.rationalWeylFDRep`, and `Weight/HighestWeight.lean`. The group-level route uses
diagonal-torus weights and elementary transvections to recognize the highest
weight and its central character, independently of differentiation. Retain all
integer coordinates: the central character is not discarded modulo (1,…,1).
Identify the shape-λ Schur functor with `rationalWeylFDRep (TauCeti.weightOfShape n λ)`
for shapes of at most n rows (`schurFunctor_iso_irreducible`); every rational irreducible is the determinant
twist of its polynomial part. The comparison with gl_n Lie modules belongs to
LieHighestWeight Layer 9 after this group-level classification.

*Needs:* native rational Weyl modules and highest vectors; torus/transvection theory; Layer 0 complete reducibility; Layer 2 for the Schur comparison.

### 3.4 `SLₙ`

The corresponding statement for `SLₙ` (dominant weights modulo `(1,…,1)`), the type `Aₙ₋₁`
root/Weyl specialization from RootSystems and lattice specialization from
LieHighestWeight, by restriction along `SLₙ ↪ GLₙ`.

*Needs:* Layer 3 GL classification; scalar generation of GL over ℂ and restriction along `Matrix.SpecialLinearGroup.toGL`.

### 3.5 `SOₙ` then `Oₙ`, and `Sp₂ᵣ`

The connected matrix groups and their
exact rational highest-weight classification are constructed in Layer3A:
SO_(2r+1) has type B_r, SO_(2r) type D_r, and Sp_(2r) type C_r,
with their actual group character lattices and all small-rank cases.
Their abstract Lie modules alone are not a rational-group construction.
O remains the separate SO extension/induction problem, with its actual
component action and low-dimensional cases; neither spin weights nor
an unqualified Lie highest weight are automatically SO/O representations.

*Needs:* Layer 3A group/Lie comparison and rational models; the component action for the O extension.

### Examples

**Checks.**

- In rank 1 the weights −1,0,1 give values 1/2,1,2 at t=2; discarding
the central coordinate would identify three distinct irreducibles.
- Rank 0 has exactly one empty dominant weight and a one-dimensional simple
representation; the zero representation is not simple.
- Shape (1,1) in dimension 1 gives a zero Schur module, whereas truncating
its row weight gives weight (1), a nonzero line. The row-bound hypothesis
in the Schur/highest-weight comparison excludes this counterexample.

### Dependencies

The GL classification uses native torus/weight/transvection theory and
Layer 0 complete reducibility. The Schur comparison uses Layer 2's actual
image. The SL comparison uses scalar generation; SO/Sp use Layer 3A and
LieHighestWeight Layers 2–6, not its GL-specific Layer 9.

## Layer 3A: the rational SO/Sp carriers and their exact highest weights

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

For these form groups, regular matrix coefficients mean that in one finite
basis every action entry is the evaluation of a polynomial in the matrix entries
of the group element. This is a property of the given action, not a choice of a
second action. Since inverses in SO and Sp are form adjoints, no inverse-determinant
coordinate is necessary here.

- Prove independence of the finite basis and agreement with the coordinate coaction.
- Prove closure under tensor products, duals, invariant subspaces and quotients.
- Compare the standard action's coordinate functions with the chosen form matrix.

*Needs:* Layer 0; ReductiveGroups Layer 1; native matrix form and inverse identities.

**Checks.**

- For the standard Sp₂ representation, diag(2,1/2) acts by those very entries;
  both diagonal coefficients are coordinate polynomials of degree 1.
- The trivial one-dimensional action has coefficient 1, including at the identity;
  its coefficients must not be mistaken for zero-degree-zero polynomials equal to 0.
- On SO₂≅Gₘ, complex conjugation of a torus coordinate is an abstract group
  character but not regular: on real positive t it equals t, whereas at t=i
  it equals −i. A Laurent polynomial agreeing with t on all positive reals is t
  and would give i, excluding this non-example.


### 3A.1 Tori, lattices and differentiation

For SO, pair consecutive coordinates
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

**Antidiagonal matrix and Borel adapter.** Order the SO isotropic basis as
`(u₁,…,u_r,v_r,…,v₁)` in dimension2r and
`(u₁,…,u_r,w,v_r,…,v₁)` in dimension2r+1, with the last norm-one
coordinate w above. Let J_anti have entry1 exactly on the reverse diagonal.
Prove that this ordered basis has Gram matrix J_anti and use its explicit
change-of-basis matrix to identify the native I-form SO group with the
same group in coordinates satisfying `Aᵀ J_anti A=J_anti`, det A=1.
For every matrix define `A^R=J_anti⁻¹ Aᵀ J_anti` and prove its
product-reversal and involution identities. For invertible A prove
`Aᵀ J_anti A=J_anti ↔ A A^R=I`, with A^R=A⁻¹ in that case;
retain det A=1 as the separate SO condition. No conjugation of complex
entries occurs in this symmetric-form adjoint.
The torus becomes `diag(t₁,…,t_r,t_r⁻¹,…,t₁⁻¹)` in even dimension,
with a middle1 in odd dimension. In these antidiagonal coordinates identify
the upper-triangular subgroup
as the Borel for the positive roots ε_i−ε_j and ε_i+ε_j, i<j,
and also ε_i in odd dimension. Its unipotent radical U consists of
upper-triangular matrices with diagonal1. Prove unique diagonal/unipotent
factorization, the action of T by conjugation, and the group isomorphism
`U ⋊ T ≃* B`, `(u,t)↦u t`, with the specified conjugation action.
Prove multiplication against this specified semidirect group law. Consume
the native `TauCeti.GeneralLinear.UpperTriangular` and
`TauCeti.SpecialLinear.UpperTriangular` coordinate Hopf algebras, point
equivalences and diagonal tori for the GL_n/SL_n comparisons. For n≥1 use
ReductiveGroups' PGL_n quotient to construct their PGL_n maps over ℂ,
including the scalar kernels, diagonal tori and unipotent radicals. Retain the rank-zero and
SO₂ torus branches below; generic Borel/root theory remains ReductiveGroups'
owner, and this item supplies its concrete matrix comparisons.
`AntidiagonalTargets.lean` prototypes the reverse-diagonal adjoint and its
comparison with the form equation on the same invertible-matrix carrier.

*Needs:* the isotropic basis above; native transpose and matrix multiplication;
ReductiveGroups Layer 7 for Borel structure, and the native upper-triangular
coordinate algebras for the GL/SL comparison.

**Checks.**

- In dimension 2, J_anti=[[0,1],[1,0]] sends diag(2,3) to diag(3,2)
  under the adjoint. Applying the adjoint twice recovers diag(2,3).
- The adjoint of diag(i,1) is diag(1,i), whereas a conjugate-transpose
  convention would give diag(1,−i); the two differ.
- For A=diag(2,1/2), A A^R=I and AᵀJ_anti A=J_anti. For A=diag(2,3),
  the two left sides are 6I and 6J_anti, so A fails both form-preservation tests.


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

### 3A.2 Connected rational group–Lie comparison

For a smooth connected affine algebraic group G over an algebraically closed
field k of characteristic zero and a finite-dimensional rational G-module W,
prove that a subspace U⊆W is G-stable if and only if it is Lie(G)-stable,
and that a vector is G-fixed if and only if its differential action vanishes.
Apply this to the rational Hom module to identify group intertwiners with Lie
intertwiners, respecting identities, composition and inverses. Reductivity is
needed for the subsequent semisimplicity application, not for this comparison
(Milne, *Algebraic Groups*, 2022 edition, Proposition 10.31, printed p. 196;
Cartier's Theorem 3.23, printed p. 71).

One proof uses the scheme-theoretic subspace stabilizer H in G. Construct its
closed defining equations and identify Lie(H) with the endomorphisms preserving
U by evaluating on k[ε]/(ε²). Cartier smoothness gives dim H=dim Lie(H).
If U is Lie-stable this equals dim G; connected smooth G is irreducible, so its
closed subgroup H of full dimension is G. For fixed vectors use the point
stabilizer, or the graph of k→W, 1↦w. Only after this step form the rational
submodule and quotient. This avoids assuming the group action on a Lie-stable
subspace as part of the argument.

- Construct differentiation of the given rational action and its tensor, dual
  and Hom compatibility before comparing invariant vectors.
- Construct the two inverse maps on stable subspaces and on Hom spaces; both
  retain the underlying linear subspace or map.
- Deduce the simplicity and representation-isomorphism comparisons, and apply
  them to the explicit SO/Sp carriers and their smoothness/connectedness data.

*Needs:* ReductiveGroups Layers 1–2 (rational actions and tangent functor),
Layer 3A (closed stabilizers), Layer 5P (Cartier smoothness), and its
Layer 3 component/dimension theory; this section's differentiation and Hom
construction. No GL classification or harmonic tensor decomposition is an input.

**Checks.**

- For the standard Sp₂ module, diag(2,1/2) fixes no nonzero coordinate vector,
  and its Cartan differential diag(1,−1) has zero kernel: both fixed spaces
  have dimension 0. In SO₃'s standard module the torus-fixed line is ℂw;
  the root operator with Xw=u, Xv=−w and Xu=0 moves it, so both full
  fixed spaces again have dimension 0.
- In characteristic p, the Gₘ character t↦tᵖ has derivative p=0 while
  tᵖ is not identically 1; in characteristic 3, t=2 gives 2³=2≠1. The Lie
  fixed space has dimension 1 and the group fixed space dimension 0.
- The sign character of the disconnected group {±1} over ℂ has Lie algebra
  0, hence a one-dimensional Lie fixed space, but −1 acts by −1, so its
  group fixed space is 0. For the trivial group both dimensions are 1.

### 3A.3 Exterior blocks and Cartan components
 Construct
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

### Examples

**Checks.**

- In rank 1, u=e₁+i e₂ and v=(e₁−i e₂)/2 have pairings (u,u)=0,
  (v,v)=0 and (u,v)=1. With the standard orientation, *u=−i u and *v=i v.
- For Sp₄, the primitive second exterior power has dimension 6−1=5;
  the first exterior power has dimension 4−0=4.
- SO₃ weight 1 corresponds to sl₂ weight 2 and dimension 3; sl₂ weight 1
  has dimension 2 and does not descend. SO₂ permits weight −1, taking t=2
  to 1/2; a nonnegative-only dominant convention loses it.

### Dependencies

The tori use matrix/form linear algebra. §3A.2 uses the listed tangent,
stabilizer and Cartier contracts. Exterior/Hodge blocks use Layer 1 and the
abstract highest-weight/dimension theory of LieHighestWeight Layers 2–6;
Cartan components use complete reducibility and §3A.2. Harmonic/Brauer
classification is not an input to those constructions.

## Layer 4: characters and Schur polynomials

Consume the native carriers `TauCeti.schurFunctor`, `TauCeti.diagGL`, `TauCeti.DominantWeight`,
`TauCeti.weightOfShape`, its `detShift`/`detShiftShape`, and `TauCeti.rationalWeylFDRep`.
Apply the Schur-character and dimension identities listed in the supplier
contracts to the Layer 3 classification of an arbitrary rational irreducible.
Thus the identification concerns actual rational modules, rather than only
polynomials with the same numerical character. The group-multiplicity
comparison below is the additional tensor-product target.

### 4.1 Schur products and representation multiplicities

Use SchurWeyl Layer 7 for the finite Schur/Frobenius theory and the exact
skew-tableau product contract gap:skew-tableau-lr-product above for general LR.
For the resulting finite count c^ν_(λ,μ), identify it with the multiplicity of
the actual Schur module of shape ν in the tensor product of shapes λ and μ.
The sum is over |ν|=|λ|+|μ| with at most n rows; taller shapes vanish in n
variables. The count is defined by tableaux, not by the multiplicity being proved.
Consume native `TauCeti.diagramSchurPoly`, its integer-indexed Jacobi–Trudi
identity and its denominator-cleared bialternant identity. The fraction-field
quotient is an interpretation after divisibility, not a polynomial definition.

*Needs:* the supplier gap's finite tableau/product bijection; Layer 3
classification; Layer 0 complete reducibility; this layer's torus character
comparison and independence of irreducible formal characters.

**Checks.**

- In two variables (2,3), s_(1)²=25, s_(2)=19 and s_(1,1)=6, giving 25=19+6.
- In one variable x=2, s_(1)²=4, s_(2)=4 and s_(1,1)=0, giving 4=4+0.
- The empty shape contributes the unit: s_empty=1. Failed containment or
|ν|≠|λ|+|μ| gives count 0; an empty alphabet annihilates every nonempty shape.

### 4.2 Characters are Schur polynomials

For a partition μ with at most n rows, the character comparison is
`char (TauCeti.rationalWeylFDRep ℂ n (TauCeti.weightOfShape n μ)) (diagonal x) = TauCeti.diagramSchurPoly n ℂ μ (x)`, i.e. the character of the polynomial
`GLₙ`-irreducible `V_μ`, restricted to the torus, is the Schur polynomial `s_μ`. This is the **Weyl
character formula specialized to `GLₙ`** (the bialternant is exactly Weyl's
`∑_w (-1)^w e^{w(λ+ρ)} / ∑_w (-1)^w e^{w ρ}`); relate the supplied polynomial identity to the Layer 3 classification and
retain the same torus evaluation.

*Needs:* the native Schur-character identity; Layer 3 Schur/highest-weight isomorphism.

### 4.3 The rational character is Laurent

For a general `λ : TauCeti.DominantWeight n`, the torus character is a
**Laurent** symmetric polynomial, so `TauCeti.diagramSchurPoly n ℤ · : MvPolynomial (Fin n) ℤ` cannot express it. With
`m = λₙ` and `μ = λ - m·(1,…,1)`, the resulting identity is `char (TauCeti.rationalWeylFDRep ℂ n λ) (diagonal x) = (∏ xᵢ)^m · s_μ(x)`, the
determinant twist of the polynomial case. Keep `TauCeti.diagramSchurPoly` for partitions only. The general Weyl character
formula for `SLₙ`, `Sp₂ᵣ`, `SOₙ` follows from LieHighestWeight's abstract
Weyl character theorem, transported through Layers3/3A's actual group-weight
dictionary; RootSystems supplies the appropriate roots and Weyl group.

*Needs:* the native determinant-twist character formula and Schur character; Layer 3A and LieHighestWeight Layer 6 for SO/Sp.

### Examples

**Checks.**

- Shape (2,1) on diag(2,3) gives 2²·3+2·3²=30, equal to det·trace=6·5.
- Weight (1,−1) has det shift −1 and polynomial part (2,0); its value is
(4+6+9)/6=19/6, not 19.
- In rank 0 the empty Schur polynomial and empty determinant product both
equal 1; every nonempty shape gives Schur character 0.

### Dependencies

Schur characters use Layer 2's native image, SchurWeyl Layer 7's Frobenius
characteristic and column orthogonality. Rational characters use Layer 3 and
the native determinant twist. General LR additionally uses the declared
skew-tableau product gap; horizontal Pieri uses the pinned theorem directly.

## Layer 5: the Weyl dimension formula

### 5.1 Dimension comparison

`TauCeti.weylDimension λ : ℕ`, the product form
`dim V_λ = ∏_{1 ≤ i < j ≤ n} (λ_i - λ_j + j - i) / (j - i)`, and the theorem
`finrank ℂ (TauCeti.rationalWeylFDRep ℂ n λ) = TauCeti.weylDimension λ` obtained from Layer 4 by evaluating `s_λ` at
`x₁ = ⋯ = xₙ = 1`, with `Representation.char_one` giving the equivalent trace statement (equivalently, the specialization of the abstract Weyl dimension formula
`∏_{α > 0} ⟨λ + ρ, α⟩ / ⟨ρ, α⟩` from LieHighestWeight,
using RootSystems' root/Weyl input and the explicit group-lattice comparison). Use the rational-product interpretation of the native natural-valued dimension;
its factors depend only on the differences λ_i−λ_j, so determinant twists
preserve dimension. For the form groups prove the analogous product formulas
on the actual group lattices of Layer 3A using the supplied Lie formula.

*Needs:* the native rational Weyl dimension formula; Layer 3 classification; Layer 3A and LieHighestWeight Layer 6 for SO/Sp.

### Examples

**Checks.**

- Weight (2,1,0) gives factors 2,2,2 and dimension 8; its determinant
shift (1,0,−1) gives the same factors and dimension 8.
- Weight (2,1) gives 2; in rank 1 every integer weight gives the empty
product 1, including weight −1.
- Rank 0 also gives the empty product 1. In every nonempty factor i<j,
the denominator j−i is a positive integer, not truncated natural subtraction.

### Dependencies

The module dimension uses Layer 4's character identity and trace at 1.
The native Weyl product and signed-pattern counting identities are inputs.
SO/Sp dimension comparisons additionally use Layer 3A's lattice dictionary
and LieHighestWeight Layer 6.

## Layer 6: branching rules and Gelfand-Tsetlin bases

### 6.1 `GLₙ ↓ GLₙ₋₁`

The restriction of `V_λ` along `GL(n-1) ↪ GL n` (upper-left block, fixing the last
basis vector) decomposes **multiplicity-free**: `V_λ|_{GL_{n-1}} ≅ ⊕_μ V_μ`, the sum over `μ` **interlacing**
`λ` (`λ_i ≥ μ_i ≥ λ_{i+1}`). State it as an isomorphism of `FDRep ℂ (GL (n-1) ℂ)` and, on characters, as
the Schur-polynomial identity `s_λ(x₁,…,x_{n-1}, 1) = ∑_{μ ≺ λ} s_μ(x₁,…,x_{n-1})` for a partition `λ`. The
**rational** version follows by the determinant twist (the interlacing runs over integer sequences, not just
partitions), so state both the partition form and the `TauCeti.DominantWeight`-indexed form. This is the
Gelfand-Tsetlin engine, stated on the native block inclusion by `rationalWeyl_branching`: iterating it gives a basis of `V_λ` indexed by Gelfand-Tsetlin patterns.

*Needs:* the native block inclusion and interlacing; Layer 3 rational models and complete reducibility; Molev v2 §2.1 for branching.

### 6.2 `SOₙ ↓ SOₙ₋₁` and `Spₙ ↓ Spₙ₋₂`

The connected orthogonal and symplectic series carry their own
branching theorems, cut out by the invariant form of Layer 0, but these are **type-specific** and do not
reuse the `GLₙ` Schur-polynomial identity unchanged: the `SOₙ` rule interlaces with its own betweenness (and
a parity/sign subtlety at the `Oₙ` extension), and `Spₙ` uses its own patterns and characters. State each
with its own index convention rather than implying a single formula transfers.

*Needs:* Layer 3A rational models; Layer 6B for symplectic multiplicities; Molev v2 §3.2.

### 6.3 Gelfand-Tsetlin patterns

Consume native `TauCeti.GTPattern n`, the combinatorial index of the basis below, a **triangular
array** `(λ_{i,j})_{1 ≤ i ≤ j ≤ n}` of integers (row `j` has `j` entries `λ_{1,j} ≥ ⋯ ≥ λ_{j,j}`) satisfying
the **interlacing** (betweenness) inequalities `λ_{i,j+1} ≥ λ_{i,j} ≥ λ_{i+1,j+1}`, with **top row**
`topRow : TauCeti.GTPattern n → (Fin n → ℤ)` reading off row `n`. The interlacing constraint ranges only over
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

*Needs:* native `TauCeti.GTPattern` and the tableau equivalence.

### 6.4 A fixed algebraic GT basis and its action

Iterated multiplicity-free
GL₁⊂⋯⊂GLₙ branching gives the canonical pattern-indexed lines.
Construct the normalized basis indexed by signed GT patterns with top row λ
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

Pin the matrix-unit action (Molev v2, Theorem 2.3, printed p. 9):
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

*Needs:* Layers 3–4; the native block inclusion and signed patterns; Molev v2 Theorems 2.3/2.7 for normalized vectors.

### 6.5 The Gelfand-Tsetlin dimension formula

`finrank ℂ (TauCeti.rationalWeylFDRep ℂ n λ) = #{P : TauCeti.GTPattern n with top row
λ}`, the count of GT patterns with top row λ. The representation-level branching gives a second proof: the iterated
multiplicity-free decomposition gives the count by induction on `n`, independently of Layer 5. *Then* compare
with `TauCeti.weylDimension λ` and, through the pattern ↔ tableau bijection, with the tableau sum `s_λ(1,…,1)`
that specializes Layer 4's Schur polynomial at `x = (1,…,1)`. Do not use the Layer 5 equality to justify the
basis construction itself; the three counts agree as a downstream corollary.

*Needs:* representation-level branching above and native signed-pattern counting; comparison with the native Weyl dimension theorem follows afterward.

### 6.6 The actual Capelli generators

For size k define the column-ordered
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
The level is the actual matrix size k and the degree satisfies 1≤r≤k.

*Needs:* the differentiated action on the rational Weyl module; block Lie/enveloping maps; Molev v2 (2.21).

### 6.7 `SOₙ ↓ SOₙ₋₁`, the symplectic series, and `Spin(n) ↓ Spin(n-1)`

The same chain of subgroups gives
Gelfand-Tsetlin-type bases for the orthogonal and symplectic families: `SO_n ↓ SO_{n-1}` is again
multiplicity-free (the classical orthogonal Gelfand-Tsetlin construction), and the symplectic series carries
the multiplicity-resolving construction of Layer6B, with primed rows,
actual Hom-space bases and evaluation maps. Through the double cover this intertwines with the spin groups: the branching
`Spin(n) ↓ Spin(n-1)` for the spin representations is the subject of the sibling
[`../SpinRepresentations`](../SpinRepresentations/README.md), which this layer meets at the `SOₙ`/`Spin(n)`
Gelfand-Tsetlin bases.

*Needs:* Layers 3–4; the native block inclusion and signed patterns; Molev v2 Theorems 2.3/2.7 for normalized vectors.

### Examples

**Checks.**

- Top row (2,1,0) has middle rows (1,0),(1,1),(2,0),(2,1), with
2,1,3,2 bottom rows respectively: 8 patterns and dimension 8.
- Top row (1,0,−1) has 8 patterns after shifting every row by −1;
forbidding negative entries would destroy this bijection.
- GL₂ weight (1,−1) restricts to GL₁ weights −1,0,1; at t=2 the
character is 1/2+1+2=7/2. A GL₁ weight m restricts to the unique GL₀
module once, for every integer m.

### Dependencies

Branching uses Layer 3's rational models and the actual upper-left block
inclusion. The normalized basis uses the differentiated matrix-unit action
and Molev v2 Theorems 2.3/2.7, not the dimension formula as a premise.
The GT dimension theorem follows from branching, then compares with Layer 5.
Capelli operators need the enveloping action and ordered determinant.

## Layer 6B: symplectic multiplicity vectors and iterated bases

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
`f_i=F_ii−i` and `g_i=f_i+1/2`,
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
The operator coefficients stand to the left of powers of u, so evaluation at
Cartan elements is right evaluation (Molev v2, (3.10)–(3.12), printed pp. 31–32;
(3.30), p. 41). Do not substitute arbitrary endomorphisms for Z or z.

**Checks.**

- In C₂ at source highest weight (0,−1), g=(−1/2,−5/2). At u=−5/2
  the interpolation coefficients are (0,1), since the squared nodes are
  (1/4,25/4); at u=−1/2 they are (1,0). Omitting the half shift gives
  (11/32,21/32) at u=−5/2 and fails the interpolation law.
- In rank 1 the product over j≠i is empty and equals 1, so Z(g₁)=z_(1,1)z_(1,−1).
- For source λ=(0,0), g=(−1/2,−3/2), with square difference −2; for
  λ=(0,−1) it is −6. Generally λ_i−i+1/2 is strictly decreasing and negative,
  so distinct admissible nodes have distinct squares and no scalar denominator
  in this highest-weight specialization vanishes.

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

### Examples

**Checks.**

- The standard Sp₄ highest row (1,0) has two intermediate rows over the
  trivial Sp₂ weight and one over weight 1, giving 1+1+2=4 dimensions.
- In C₂ source weight (0,−1), right evaluation at −5/2 selects the second
  interpolation term: coefficients (0,1), with squared-node difference −6.
- At rank 0 there is one empty pattern and the unit has dimension 1;
  a lowering product of length 0 is the identity, so it cannot send the
  chosen nonzero highest vector to zero.

### Dependencies

Use Layer 3A's rational models and group/Lie Hom comparison. Construct
Mickelsson operators before the multiplicity vectors, using Molev v2
(3.10)–(3.12), Lemma 3.4 and Theorem 3.5; evaluation and iterated bases
then use these actual Hom maps and the same last-plane inclusions.

## Layer 6A: diagonal overgroups of the complex general linear group

Work with G=GLₙ(ℂ), P=G×G and the actual diagonal Δ={(g,g)}.
In the acceptance signatures these are `DiagonalOvergroups.G`,
`DiagonalOvergroups.P`, `DiagonalOvergroups.diagonalMap` and
`DiagonalOvergroups.diagonal`; the two intermediate groups are
`DiagonalOvergroups.scalarDiagonal` and `DiagonalOvergroups.determinantEqual`,
with maps `DiagonalOvergroups.scalarDiagonalMap` and
`DiagonalOvergroups.determinantRatio`. The exponential and its genuine
one-parameter membership condition are `DiagonalOvergroups.pairExp` and
`DiagonalOvergroups.realDirections`.
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
H=Δ or H_sc or H_det or P (`DiagonalOvergroups.connected_complex_overgroup`). All four are closed and connected complex
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
The external action is `DiagonalOvergroups.external`.
For finite-dimensional rational irreducible GLₙ representations, construct
and evaluate the scalar central character: if ρ has highest weight λ then
ρ(λ₀I)=λ₀^(Σλᵢ)id; retain all determinant twists. Prove restriction to
SLₙ stays irreducible (`DiagonalOvergroups.restrict_specialLinear_irreducible`): G is generated by SLₙ and scalar matrices over ℂ,
and the latter act by scalars. Native rationalWeylSLRep and its
determinant-shift equality supply the SAME restricted carriers; they do not
prove this irreducibility. The missing implication is an explicit Layer3/6A
comparison target, with actual nth-root generation over ℂ. Prove the external restriction to H_det
irreducible (`DiagonalOvergroups.external_determinantEqual_irreducible`), since it contains both separate SLₙ factors and their external
tensor action is irreducible. Consume native Schur and module-density/
finite endomorphism APIs from SemisimpleAlgebras Layers1/3, and explicitly
identify the generated image with End(V)⊗End(W)=End(V⊗W); no new generic
character or density engine is commissioned. Treat the rank1 torus and rank0
trivial representations directly.

Under H_sc≃G×ℂˣ the SAME external representation is
(g,λ₀)↦λ₀^(Σλᵢ)(ρ(g)⊗σ(g)), where λ is ρ's highest weight.
Construct this intertwiner, its inverse and the identity-on-carrier order
isomorphism of invariant submodules with the diagonal tensor product, stated
existentially as `DiagonalOvergroups.scalarRestriction_exists_orderIso`.
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

### Examples

**Checks.**

- In rank 2, (2I,I) belongs to the scalar-diagonal subgroup but has
  determinant ratio 4, so is not determinant-equal. A nontrivial unipotent
  transvection paired with I is determinant-equal but is not scalar-diagonal.
- For n=1 the determinant-equal subgroup is the diagonal and the scalar-diagonal
  subgroup is the full product. For n=0 all are trivial and every scalar
  parameter has the same image, so scalar-map injectivity fails.
- On rank-one characters of weights a=−1,b=2, (g,u)=(3,2) acts under
  the scalar-diagonal map by (6)⁻¹·3²=3/2, equal to 2⁻¹·3^(−1+2).
  Thus the invariant-subspace comparison retains the central character.

### Dependencies

Subgroup maps use native matrix groups, scalar matrices and Goursat.
The four-group theorem uses LieGroups Layers 0–4 and the native matrix Lie-ideal
classification. Rational restriction uses Layer 3, scalar generation and
SemisimpleAlgebras Layers 1/3. No tensor-multiplicity computation is a prerequisite.

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
- **`V^{⊗2} = Sym²V ⊕ ⋀²V`.** The isomorphism V⊗V ≅ Sym²V ⊕ Λ²V of
  `FDRep ℂ (GL n ℂ)` (Layer 1), checked on characters:
  `(trace g)² = char(Sym²) g + char(⋀²) g`, i.e. at a diagonal `x`, `(∑ xᵢ)² = h₂(x) + e₂(x)` with
  `h₂ = ∑_{i ≤ j} xᵢxⱼ`, `e₂ = ∑_{i < j} xᵢxⱼ` (`MvPolynomial.hsymm`, `MvPolynomial.esymm`). The Schur-functor
  reading: `S^{(2)}V = Sym²V`, `S^{(1,1)}V = ⋀²V` (Layer 2).
- **A small Schur-polynomial character.** For `n = 2`, `λ = (2,1)`: `V_λ` has dimension
  `the Weyl dimension of (2,1) = 2` (Layer 5), and its character at `diagonal (x₁, x₂)` is
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
  `the Weyl dimension of (2,1,0) = 8` (Layer 5) and the `8` semistandard Young tableaux of shape `(2,1)` with entries
  in `{1,2,3}` (Layer 4, via the pattern ↔ tableau bijection), the three counts agreeing by the two
  identifications of `finrank ℂ (irreducible 3 (2,1,0))`.
- **A rational Gelfand-Tsetlin basis for `GL₃`.** For `n = 3`, `λ = (1,0,-1)`: this is the determinant twist
  `m = -1`, `μ = (2,1,0)` of the previous example, so `V_{(1,0,-1)} ≅ det⁻¹ ⊗ V_{(2,1,0)}` still has dimension
  `8`. Its `8` Gelfand-Tsetlin patterns now have **negative** entries in some rows (top row `(1,0,-1)`), which
  the sign-free interlacing admits; a nonnegativity constraint on row-final entries would wrongly exclude
  them. This exercises the rational branch of the normalized GT basis, which the polynomial `(2,1,0)` example does not.

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
linear algebra; their irreducibility comparison comes afterward. For N=3 and (m,n)=(2,1), surjectivity gives dim H=18−3=15
before identifying its highest weight; this calculation uses no SchubertGeometry input.

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


### A U(3) symmetric-square Pieri computation

For a,b≥0 let H_(a,b) be the rank-three mixed-contraction kernel above,
identified with the irreducible of highest weight
`(a,0,−b)`. Tensor with Sym²(ℂ³), of highest weight `(2,0,0)` and dimension6.
Prove the multiplicity-one decomposition

| summand | condition for occurrence |
| --- | --- |
| H_(a+2,b) | every a,b≥0 |
| det ⊗ H_(a,b+1) | a≥1 |
| H_(a+1,b−1) | b≥1 |
| det² ⊗ H_(a−2,b+2) | a≥2 |
| det ⊗ H_(a−1,b) | a≥1 and b≥1 |
| H_(a,b−2) | b≥2 |

The tensor product is the direct sum of exactly the indicated terms, with
none of the excluded terms interpreted through negative symmetric degrees.
Construct this first for rational GL₃ and prove its restriction to U(3).
All summands have central weight a−b+2; export this check and the complete
highest-weight and dimension identities, with the actual determinant actions.

For the proof, twist `(a,0,−b)` by det^b to the partition `(a+b,b,0)`.
Apply native `TauCeti.hsymm_mul_diagramSchurPoly` at strip size 2 and the rational
character comparison of Layer4. Prove that the resulting dominant weights
are exactly `(a+x₁,x₂,−b+x₃)`, where the x_i are nonnegative integers with
`x₁+x₂+x₃=2`, `x₂≤a` and `x₃≤b`. Enumerate these six possible triples,
prove the corresponding weights distinct, and translate their second
coordinates into the displayed determinant twists. The horizontal-strip
inequalities, rather than a dimension count alone, give the occurrence
conditions, including the boundary cases a=0,1 and b=0,1.

Use rational complete reducibility and independence of irreducible formal
characters from Layers3–4 to prove that each indicated intertwining space
is one-dimensional. Choose a nonzero map
from each indicated irreducible and prove that their direct-sum evaluation
is an isomorphism; construct its inverse and prove both inverse identities.
Prove that rescaling a chosen map leaves its summand image fixed and rescales
the corresponding inverse coordinate reciprocally. Compare
the resulting weight multiplicities with convolution of the actual H_(a,b)
weight function and the six weights of Sym²(ℂ³). This supplies the full
highest-weight-subtraction calculation with its determinant twists.

Check the dimension identity
`Σ_(indicated terms) dim = 6(a+1)(b+1)(a+b+2)/2`.
For a=b=0 obtain just H_(2,0). For a=b=1 obtain dimensions24,15,6,3
and total48, with no term containing a negative index. The generating
highest-weight/Hom-multiplicity statement on the native representation
models is illustrated in [U3PieriTargets.lean](U3PieriTargets.lean).

## Construction routes

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
classification. Its group/Lie adapters use the stabilizer proof of §3A.2, with the specified
ReductiveGroups tangent/stabilizer/Cartier inputs. The GLₙ classification uses native
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

## Downstream consumers

LieHighestWeight Layer 9 uses the GL models and characters for differentiation.
SpinRepresentations uses the orthogonal branching comparison. TensorProductCombinatorics
§2.7 compares diagonal-overgroup restrictions with its hive multiplicities; no hive
count supplies the subgroup classification here.

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

- J. S. Milne, [*Algebraic Groups*, 2022 edition](https://www.jmilne.org/math/Books/iAG2022.pdf),
  Proposition 10.31, printed p. 196 (Lie algebra of a subspace stabilizer), and
  Theorem 3.23, printed p. 71 (Cartier smoothness); §3A.2 owns their connected
  stabilizer argument and application to rational Hom modules.
