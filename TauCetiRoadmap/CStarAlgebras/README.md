# Roadmap: C*-algebras, operator spaces and approximation

**Summary.** Build the structure and representation theory of C*-algebras (ideals, hereditary
subalgebras, multipliers, irreducible representations, primitive ideal spaces and the bidual),
the theory of operator spaces and completely positive and completely bounded maps (Ruan,
Stinespring, Choi, Wittstock, Paulsen), the C*-tensor products and operator-space tensor
products, and finite-dimensional approximation (nuclearity with its tensorial, bidual and
amenability characterizations, exactness, the Choi–Effros lifting theorem, Kirchberg's WEP and
LLP characterizations, Voiculescu's theorems on quasidiagonality, local reflexivity and the
permanence of exactness under quotients). The end theorems are Stinespring's dilation and
Arveson's Radon–Nikodym theorem, Wittstock's extension theorem, the equivalence of nuclearity
with the uniqueness of the C*-tensor norm, with semidiscreteness of the bidual and with Banach
amenability, the Choi–Effros lifting theorem, Kirchberg's tensor characterizations of WEP and
LLP, Voiculescu's noncommutative Weyl–von Neumann theorem and his homotopy invariance of
quasidiagonality, and the theorem that exactness passes to quotients. Every object comes with
the constructions and the elementary API that make it usable by the operator-algebra roadmaps
downstream.

## Scope and ownership

This roadmap owns, in nine layers: closed ideals, annihilators, hereditary subalgebras,
approximate units, the Pedersen ideal, multiplier algebras and the strict topology (Layer 1,
C1); state extension, irreducible representations, Kadison transitivity, primitive ideal spaces
with their hull–kernel topology, Dauns–Hofmann, the universal representation and the bidual,
open projections, and the explicit matrix-field examples (Layer 2, C2); abstract operator spaces,
Ruan's theorem and completely bounded maps (Layer 3, C3); Stinespring dilations, Choi's
criterion, multiplicative domains, Wittstock extension and Paulsen similarity (Layer 4, C4); the
maximal C*-tensor norm and the comparison of C*-norms, the operator-space minimal, projective
and Haagerup tensor products, and the direct sums, products, inductive limits, cones and mapping
cones used later (Layer 5, C5); nuclearity and its characterizations, Haagerup's Grothendieck
inequality and the Banach amenability bridge (Layer 6, C6); exactness, liftings, WEP and LLP
(Layer 7, C7); quasidiagonality and Voiculescu's representation theorem (Layer 8, C8); local
reflexivity, the AF-subquotient theorem and exactness under quotients (Layer 9, C9). The layer
number is the lane: C`k` is Layer `k`, and the target `k.n` is cited as C`k`.`n`; the named
targets `C1.CommutativeMultiplierMorphisms` and `C2.AnnHull` keep their names in the headings of
§1.8 and §2.6.

Left to named roadmaps, and consumed from them where this roadmap needs them:

- **VonNeumannAlgebras** owns positive functionals, GNS, state separation and faithful
  representations (V0, including the separable faithful representation V0.SeparableFaithful),
  operator topologies, bicommutants and Kaplansky density (V1), support projections and the
  Hilbert and spatial von Neumann tensor products with their slice maps (V2), preduals and normal
  representations (V4), the center-valued trace, Dixmier averaging, halving and central
  decomposition (V5), the standard form of an arbitrary von Neumann algebra (V10–V11), normal
  Jordan and projection-logic maps on W*-algebras (V12.J), the shared completely positive and
  operator-system order foundations, Tomiyama's theorem, Arveson's extension theorem and the
  projection definition of injectivity (V13a), the spatial C*-norm on the algebraic tensor
  product of two concrete C*-algebras with its representation independence, slice maps and
  inclusion functoriality (V13b.SpatialNorm), and injectivity versus semidiscreteness with the
  commuting-representation minimal-norm criterion (V13b). Layer 5 here consumes
  V13b.SpatialNorm and adds the maximal norm, the comparison of C*-norms, units, associativity,
  flip, direct sums and functoriality; Layer 6 consumes V13b's injectivity–semidiscreteness
  equivalence for arbitrary W*-algebras, including biduals without separable predual or faithful
  normal state, and never the factor classification of V13.
- **BanachAlgebras** owns Banach-algebra ideals, the Jacobson radical, algebraic primitive ideals
  and the hull–kernel topology (A1), the holomorphic functional calculus (A2), characters and the
  extension/restriction comparison of character spaces (A3), Cohen factorization and the Arens
  products (A4), and bounded Hochschild cohomology, Banach amenability, virtual diagonals and the
  universal derivation (A6). Layer 1 specializes A1's annihilators to closed ideals of
  C*-algebras; Layer 2 identifies A1's algebraic primitive ideals with kernels of irreducible
  star representations; Layer 6 transfers A6's Banach amenability.
- **BanachSpaceTheory** owns duality, weak topologies, weak compactness and separation (B1–B2),
  completed Banach tensor products (B4) and Banach local reflexivity (B7); Layer 9's
  operator-space local reflexivity is contrasted with B7, not derived from it.
- **OperatorTheory/PolarDecomposition** owns the polar decomposition, the operator modulus,
  partial isometries and singular values of Hilbert-space operators;
  **OperatorTheory/SelfAdjointSpectralTheory** owns the Borel functional calculus and spectral
  projections of self-adjoint operators. Adjoints, compact operators, the compact-operator ideal
  and `IsCompactOperator` are Mathlib's. Nothing is taken from the OperatorTheory umbrella
  itself or from its ToeplitzOperators roadmap, which consume this roadmap.
- **HilbertModules** owns Hilbert C*-modules, Morita equivalence, C(X)-algebras and continuous
  fields, including the commutative pullback example of its H5 and the point-separation theorem
  of its H7; it consumes Layers 1, 2 and 7–9 and supplies nothing here. The matrix-field
  computations of §2.10 are self-contained.
- **OperatorAlgebraDynamics** owns group C*-algebras, crossed products and equilibrium states;
  its D1 identifies the universal unitary-generator algebra of §5.4 with the full free-group
  C*-algebra. **OperatorKTheory** and **CStarClassification** own K- and KK-theory, dimension
  groups and classification; §9.2 owns only the norm-perturbation and intertwining lemmas they
  consume. **FreeProbability** owns free products with prescribed states or expectations.
  Finite-dimensional C*-algebras and their inductive limits appear here only as examples and
  approximation tools.

Supply runs in one direction. The suppliers of this roadmap are Mathlib, BanachSpaceTheory,
BanachAlgebras, VonNeumannAlgebras, OperatorTheory/PolarDecomposition and
OperatorTheory/SelfAdjointSpectralTheory, each cited by section where it is used. HilbertModules,
OperatorAlgebraDynamics, OperatorKTheory, CStarClassification, FreeProbability,
ToeplitzOperators, NoncommutativeIntegration, TemperleyLiebOperatorAlgebras, QuantumGroups and
NoncompactQuantumSymmetry consume this roadmap and supply nothing to it; their comparisons are
listed under Downstream consumers.

## Conventions

- **Algebras.** Algebras are complex and complete: Mathlib's `NonUnitalCStarAlgebra` and
  `CStarAlgebra`, with `NonUnitalStarAlgHom` and `StarAlgHom`, closed `NonUnitalStarSubalgebra`
  and `StarSubalgebra`, and `TwoSidedIdeal`. A C*-subalgebra is norm closed; a two-sided ideal
  is norm closed whenever a C*-quotient is formed. Unit-preserving maps are stated explicitly,
  and "nonunital" means that no two-sided unit exists; the zero algebra is unital.
- **Representations.** A representation is a star homomorphism into `H →L[ℂ] H`; it is
  nondegenerate when the closed span of `π(A)H` is `H`, and its essential-subspace reduction is
  part of the API. An irreducible representation is nonzero (§2.2). General results use nets;
  separability or countability is imposed only where stated.
- **Order and calculus.** Use the continuous functional calculus `cfc` and `cfcₙ` (the latter
  for functions vanishing at zero), `IsStarProjection`, the spectral order on self-adjoint
  elements, positive square roots and `CFC.sqrt_le_sqrt`. Positive means `0 ≤ a` in the
  `StarOrderedRing` order.
- **Unitization.** `Unitization ℂ A` carries its C*-norm (`Unitization.instCStarRing`), which is
  the operator norm of the left action on `A` (§1.2) and differs from the ℓ¹ norm of a
  Banach-algebra unitization. Layer 6 identifies the two unitizations by a bounded algebra
  isomorphism with equivalent norms.
- **Hilbert spaces.** Inner products are conjugate-linear in the first variable;
  `ω_ξ(a) = ⟪ξ, π(a)ξ⟫`. Multiplication of operators is composition with the rightmost operator
  acting first. The Hilbert direct sum of `H` and `K` is `WithLp 2 (H × K)`.
- **Matrix levels.** `M_n(A)` is `CStarMatrix (Fin n) (Fin n) A` with its operator norm and
  square-matrix order; rectangular levels use the rectangular operator norms of `CStarMatrix`.
  An entrywise supremum norm on `Matrix` is never the norm in complete boundedness. Level zero is
  the zero space with norm zero and is retained.
- **Tensor products.** `A ⊙ B` is the algebraic tensor product; `⊗min` is the spatial completion
  of VonNeumannAlgebras V13b.SpatialNorm and `⊗max` the maximal completion of §5.1. The
  operator-space products are written `⊗min`, `⊗∧` and `⊗h`.
- **Timeless API.** Every new object has extensionality, coercion, equality and transport lemmas;
  every map has identity, composition, restriction, range and factorization APIs; a topological
  wrapper preserves the norm topology of the underlying algebra.

## Exact supplier contracts

### From Mathlib

- **Algebra classes.** `NonUnitalCStarAlgebra`, `CStarAlgebra`, `NonUnitalCommCStarAlgebra`,
  `CommCStarAlgebra`, `NonUnitalStarAlgHom` (`→⋆ₙₐ[ℂ]`), `StarAlgHom` (`→⋆ₐ[ℂ]`),
  `NonUnitalStarSubalgebra`, `StarSubalgebra`, `TwoSidedIdeal` with `TwoSidedIdeal.comap`, and
  the `PartialOrder`/`StarOrderedRing` instances on C*-algebras, on `H →L[ℂ] H`
  (`Mathlib/Analysis/InnerProductSpace/StarOrder.lean`) and on square `CStarMatrix`.
- **Functional calculus.** `cfc`, `cfcₙ`, `CFC.sqrt`, `CFC.sqrt_le_sqrt`, the positive part
  `a⁺ = cfcₙ (·⁺) a`, `IsStarProjection`, `IsSelfAdjoint`.
- **Unitization.** `Unitization ℂ A` with `Unitization.instCStarRing` and
  `Unitization.instCStarAlgebra` (`Mathlib/Analysis/CStarAlgebra/Unitization.lean`), the
  left-regular lemmas `ContinuousLinearMap.opNorm_mul_apply`,
  `ContinuousLinearMap.opNorm_mul_flip_apply` and `CStarRing.instRegularNormedAlgebra` there,
  `ContinuousLinearMap.mul`, `Unitization.starLift`, `Unitization.fstHom` and
  `Unitization.inrNonUnitalAlgHom`.
- **Gelfand duality.** `characterSpace`, `gelfandTransform_isometry`,
  `gelfandTransform_bijective` and `gelfandStarTransform` for `CommCStarAlgebra`
  (`Mathlib/Analysis/CStarAlgebra/GelfandDuality.lean`).
- **Matrices and CP maps.** `CStarMatrix`, `CStarMatrix.ofMatrix`, `Matrix.PosSemidef`,
  `CompletelyPositiveMap` with its notation `A →CP B`
  (`Mathlib/Analysis/CStarAlgebra/CompletelyPositiveMap.lean`), which bundles a linear map with
  positivity of every `Fin k` amplification.
- **Approximate units and multipliers.** `CStarAlgebra.approximateUnit`,
  `Filter.IsIncreasingApproximateUnit`, and the double-centralizer algebra `DoubleCentralizer ℂ A`
  (`𝓜(ℂ, A)`, `Mathlib/Analysis/CStarAlgebra/Multiplier.lean`).
- **Annihilators.** `Module.annihilator` with its `IsTwoSided` instance
  (`Mathlib/RingTheory/Ideal/Maps.lean`).
- **Hilbert-space material.** `ContinuousLinearMap.adjoint`, `IsCompactOperator`,
  `Submodule.topologicalClosure`, `LinearIsometryEquiv` (`≃ₗᵢ[ℂ]`), the inner product on
  `WithLp 2 (H × K)` (`Mathlib/Analysis/InnerProductSpace/ProdL2.lean`) with
  `WithLp.prodContinuousLinearEquiv`, `ContinuousLinearMap.prodMap`,
  `TopologicalSpace.SeparableSpace`, `lp (fun i ↦ A i) ∞` and `lp (fun _ : ℕ ↦ ℂ) 2`, and `Circle`.
- **Positive functionals and function algebras.** `PositiveContinuousLinearMap` (`A →P[ℂ] ℂ`)
  with the positive-functional lemmas of `Mathlib/Analysis/CStarAlgebra/PositiveLinearFunctional.lean`;
  the `NonUnitalCStarAlgebra` instance on `C(X, A)` for compact `X`
  (`Mathlib/Analysis/CStarAlgebra/ContinuousMap.lean`) and the `CStarRing` instance on
  `C₀(X, A)` (`Mathlib/Topology/ContinuousMap/ZeroAtInfty.lean`).

### From Tau Ceti

No Tau Ceti module is consumed: every carrier used here is Mathlib's or is built in this roadmap.

### From TauCetiRoadmap.BanachSpaceTheory

B1 (duality, weak and weak-star topologies, the weak-star continuity criterion by evaluation),
B2 (weak compactness, Krein–Milman, Hahn–Banach separation), B4 (completed Banach tensor
products) and B7 (Banach local reflexivity, used only as the contrast in §9.5). Assumed of them:
the stated theorems on arbitrary Banach spaces, without separability.

### From TauCetiRoadmap.BanachAlgebras

A1 (ideals, quotients, the Jacobson radical, algebraic primitive ideals, the hull–kernel
topology with `hull(J) = {P : J ⊆ P}` and its closure operator, ideal annihilators), A2 (the
holomorphic functional calculus and its uniqueness), A3 (characters, the extension/restriction
comparison of character spaces under unitization), A4 (Cohen factorization for Banach modules,
Arens products on the bidual) and A6 (bounded Hochschild cohomology, Banach amenability, virtual
diagonals, the universal derivation and the bimodule constructions). Assumed of them: they are
stated for arbitrary complex Banach algebras, unital or not.

### From TauCetiRoadmap.VonNeumannAlgebras

V0 (positive functionals, GNS, state separation, faithful representations and
V0.SeparableFaithful with its unital, nonunital and zero-algebra branches), V1 (operator
topologies, the bounded strong-star multiplication and star laws, bicommutant and Kaplansky
density in bounded strong-star form), V2 (support projections, completed Hilbert tensors,
bounded operator tensor maps, spatial von Neumann tensor products and vector-functional slice
maps), V4 (preduals, normal representations, the countable vector-functional decomposition of a
normal state after amplification by `ℓ²(ℕ)`, and the comparison of bounded strong-star
convergence across faithful normal realizations), V5 (center-valued trace, Dixmier averaging,
halving and central decomposition), V10–V11 (the standard form of an arbitrary von Neumann
algebra with its conjugation between `M` and `M′`), V12.J (normal Jordan and projection-logic
maps; used only in the W*-algebra application named in §2.2 and nowhere earlier), V13a (the
matrix-order and operator-system foundations, Tomiyama's theorem, Arveson's extension theorem,
the projection definition of injectivity), V13b.SpatialNorm (the spatial norm on `A ⊙ B` for
concrete C*-algebras, its C*-property, representation independence, slice maps and isometric
functoriality for inclusions) and V13b (injectivity iff semidiscreteness for arbitrary von
Neumann algebras, the commuting-representation minimal-norm criterion, the normal CP and predual
approximation equivalents, and the commutant-injectivity theorem). Assumed of them: no
separability or faithful-normal-state hypothesis beyond what each section states.

### From TauCetiRoadmap.OperatorTheory

PolarDecomposition (polar decomposition `T = u|T|` with its uniqueness, partial isometries,
singular values) and SelfAdjointSpectralTheory (the Borel functional calculus, spectral
projections and spectral cutoffs of a bounded self-adjoint operator). Assumed of them: they are
stated on arbitrary complex Hilbert spaces.

## How to read the build

Layer 1 builds the ideal theory, hereditary subalgebras, approximate units, the Pedersen ideal
and multiplier algebras on Mathlib's carriers; everything later quotients, restricts to ideals or
uses approximate units. Layer 2 builds representation theory on top of VonNeumannAlgebras V0:
state extension, irreducible representations and Kadison transitivity, primitive ideal spaces,
Dauns–Hofmann, the bidual with its open projections, and the matrix-field examples that
exercise all of it. Layer 3 sets up operator spaces and completely bounded maps, consuming
V13a's matrix-order foundations, and Layer 4 the dilation theory of completely positive and
completely bounded maps. Layer 5 adds the maximal C*-tensor norm to V13b.SpatialNorm's spatial
norm, the operator-space tensor products, and the direct sums, products, inductive limits, cones
and mapping cones that the approximation layers use. Layer 6 proves the equivalent
characterizations of nuclearity, consuming V13b's semidiscreteness theorems, BanachAlgebras A6
and Haagerup's Grothendieck inequality. Layer 7 develops exactness, liftings, WEP and LLP; Layer
8 quasidiagonality and Voiculescu's representation theorem; Layer 9 local reflexivity, the
AF-subquotient theorem, and the quotient and inductive-limit permanence of exactness that Layer 7
leaves open. Every layer ends with its examples and its dependency list.

## Layer 1: ideals, hereditary subalgebras and multipliers

### 1.1 Matrix-order examples and the compression criterion (C1.1)

In `CStarMatrix (Fin 2) (Fin 2) ℂ` put `a = [[0,1],[1,0]]`, `q = (1/2)[[1,1],[1,1]]` and
`b = diag(s,t)` with real `s, t ≥ 0`. Prove `q = a⁺` under the continuous functional calculus
and `q² = q`. Compare the matrix order with `Matrix.PosSemidef` (they agree on square matrices)
and prove the parameter regions: `b ≥ a` iff `st ≥ 1`, and `b ≥ q` iff `s ≥ 1/2`, `t ≥ 1/2` and
`(s − 1/2)(t − 1/2) ≥ 1/4`; both diagonal-minor conditions are part of the second region, since
a product inequality alone does not control the sign of `s − 1/2`. Prove the squared region
`b² ≥ q` iff `s² ≥ 1/2`, `t² ≥ 1/2` and `(s² − 1/2)(t² − 1/2) ≥ 1/4`. Consume `CFC.sqrt_le_sqrt`
for operator monotonicity of the square root on positive elements: `b ≥ q` implies
`sqrt(b) ≥ sqrt(q) = q`, so there is no square-root counterexample to monotonicity. For the
general statement, prove that for every positive `T` and star projection `p` in a unital
C*-algebra, `pTp ≤ T ↔ Commute p T`: the forward direction compresses `T − pTp ≥ 0` by `p`, whose
vanishing corner forces `(T − pTp)p = 0`; the reverse direction writes `T − pTp = (1 − p)T(1 − p)`.
`Suggested.lean` states this as `compression_le_iff_commute`.

**Checks.**

- `a` has eigenvalues `±1` with `+1`-eigenvector `(1,1)/√2`; its positive part is the spectral
  projection `(1/2)[[1,1],[1,1]] = q`, and `q² = q`. A wrong definition of `a⁺` as `|a|` would
  give the identity matrix.
- `(s,t) = (1/2, 3)`: `st = 3/2 ≥ 1` gives `b ≥ a`, also `b ≥ 0` and `a ≥ −1`, but `s − 1/2 = 0`
  fails the minor condition, so `b ≱ a⁺`. Monotonicity of `x ↦ x⁺` fails.
- `(s,t) = (5/8, 5)`: `(1/8)(9/2) = 9/16 ≥ 1/4` gives `b ≥ a⁺ ≥ 0`, but `b² − q` has `(1,1)`
  entry `25/64 − 1/2 < 0`, so `b² ≱ (a⁺)²`. Squaring is not operator monotone.
- `p = diag(1,0)`, `T = q`: `pTp = (1/2)e₁₁` and `T − pTp = [[0,1/2],[1/2,1/2]]` has determinant
  `−1/4`, so `pTp ≰ T`; indeed `p` and `q` do not commute. For `p = 1` or `p = 0` both sides of
  the criterion hold.

*Needs:* Mathlib `CStarMatrix`, its square-matrix order, `Matrix.PosSemidef`, `cfcₙ`,
`CFC.sqrt_le_sqrt`, `IsStarProjection`.

### 1.2 Maximal ideals of C[0,1] and the left-action unitization (C1.2)

On `C[0,1]` prove that the maximal ideal at `0` is `{f : f(0) = 0}` and is the closure of
`x·C[0,1]` where `x(t) = t`, and that `sqrt(x)` lies in the maximal ideal but not in `x·C[0,1]`,
because the quotient `1/sqrt(t)` is unbounded. Compare with multiplication by `x` and its
functional calculus: the kernel of the character is the closed principal ideal, not the algebraic
one.

For a C*-algebra `A` without two-sided unit, identify `Unitization ℂ A` isometrically with
`{λ·id + L_a : λ ∈ ℂ, a ∈ A}` inside `A →L[ℂ] A`, using `ContinuousLinearMap.mul` for `L_a` and
the C*-norm of `Unitization`. Consume `ContinuousLinearMap.opNorm_mul_apply` and
`CStarRing.instRegularNormedAlgebra` for `‖L_a‖ = ‖a‖`, including `a = 0`, and
`ContinuousLinearMap.opNorm_mul_flip_apply` for the right action. Prove `|λ| ≤ ‖λ·id + L_a‖`: if
not, `−L_a/λ = id − (λ·id + L_a)/λ` is invertible by the Neumann series, so `e = L_a⁻¹(a)`
satisfies `ex = x` for every `x`, a left unit whose adjoint is a right unit, forcing a two-sided
unit. Hence the `splitMul` norm `max(|λ|, ‖λ·id + L_a‖)` equals `‖λ·id + L_a‖`. Prove the image
is closed, transport the star algebra structure, and prove that `Unitization.starLift` of
`a ↦ L_a` is `(λ, a) ↦ λ·id + L_a` by uniqueness. For already-unital `A` the image is `L(A)` and
the external unitization map has kernel `{(λ, −λ·1)}`; for the zero algebra the external
unitization is `ℂ` while the left-action image is zero, so the comparison is not faithful there.
`Suggested.lean` states `scalar_norm_le_unitizationLeftAction` and `unitization_norm_eq_leftAction`.

**Checks.**

- `sqrt(x) ∉ x·C[0,1]`: the only candidate quotient is `t ↦ t^{−1/2}`, unbounded near `0`;
  `sqrt(x)` is the uniform limit of `x·g_n` with `g_n(t) = min(n, t^{−1/2})`, so it lies in the
  closure. A definition of the maximal ideal as the algebraic principal ideal is wrong.
- `A = C₀((0,1])`, `λ = 1`, `a = −x`: `‖id − L_x‖ = sup_t |1 − t| = 1 = |λ|`, so the inequality
  is an equality; with `A = C[0,1]` (unital) and `λ = 1`, `a = −1` the operator `id − L_1 = 0` has
  norm `0 < 1`, so the nonunital hypothesis is necessary.
- The zero algebra: `Unitization ℂ 0 ≅ ℂ` has norm `|λ|`, while the left-action image on the zero
  space is `0`; the identification is not injective, which is why `A ≠ 0` is part of
  "nonunital".

*Needs:* Mathlib `Unitization.instCStarRing`, `ContinuousLinearMap.mul`,
`ContinuousLinearMap.opNorm_mul_apply`, `ContinuousLinearMap.opNorm_mul_flip_apply`,
`CStarRing.instRegularNormedAlgebra`, `Unitization.starLift`; BanachAlgebras A2 for the Neumann
series.

### 1.3 Gelfand duality for nonunital commutative algebras, ideals and annihilators (C1.3)

For a `CommCStarAlgebra A` consume `gelfandTransform_isometry`, `gelfandTransform_bijective` and
`gelfandStarTransform`, the isometric star isomorphism `A ≃ C(characterSpace ℂ A, ℂ)`; no
separability or nontriviality hypothesis is needed. Own the nonunital adapter for
`NonUnitalCommCStarAlgebra A`: with `U = Unitization ℂ A`, the augmentation `ε = Unitization.fstHom`
viewed as a character, and `K = characterSpace ℂ U`, prove that `A` is identified with `ker ε`,
that the Gelfand transform of `U` identifies this ideal with `{F ∈ C(K, ℂ) : F(ε) = 0}`, and
that restriction to the locally compact Hausdorff space `X = K ∖ {ε}` is an isometric star
isomorphism of that ideal onto `C₀(X, ℂ)` with inverse extension by zero. Own the
vanishing-at-infinity, continuity-at-`ε`, inverse and norm equalities, so that the target is
`C₀(X)` and not merely an embedding into bounded functions. Include `A = 0` (`K` a singleton, `X`
empty) and the case of a unital `A` treated through its nonunital carrier, where `ε` is isolated,
`X` is compact and the result agrees with the unital theorem through `C₀(X) = C(X)`. BanachAlgebras
A3's extension/restriction comparison then identifies `X` with the nonzero continuous character
space of `A`. Faithful representations of general C*-algebras remain VonNeumannAlgebras V0.

Develop closed ideal lattices, closures, sums and intersections, ideal generation and quotient
C*-algebras. Prove that closed two-sided ideals are complex linear and self-adjoint, give their
induced nonunital C*-structure, the quotient order and quotient C*-norm, the correspondence with
surjective star homomorphisms and the isomorphism theorems (Blackadar II.5.1.1–II.5.1.3). Prove
that star homomorphisms are contractive with closed range and are isometric exactly when
injective (Blackadar II.5.1.2). Include positive contractive lifts of positive contractions in a
quotient, membership of `cfcₙ f a` in an ideal or hereditary subalgebra containing `a`, and
spectral permanence for C*-subalgebras with the appropriate unitization.

Specialize BanachAlgebras A1's ideal annihilators to closed ideals of C*-algebras. For a closed
two-sided ideal `I` define `Ann(I) = {a ∈ A : ∀ x ∈ I, ax = 0}` and prove it equals
`{a ∈ A : ∀ x ∈ I, xa = 0}` (for `x ∈ I`, `(xa)(xa)* = x(aa*x*) = 0` because `a*x* ∈ I`); prove
that `Ann(I)` is a closed self-adjoint two-sided ideal, that `Ann` reverses inclusion, that
`I ∩ Ann(I) = 0`, that `I ⊆ Ann(Ann(I))`, and that `Ann(I)` is the largest closed two-sided ideal
`J` with `JI = 0`. Define `I` to be essential when `I ∩ J ≠ 0` for every nonzero closed two-sided
ideal `J`, and prove this is equivalent to `Ann(I) = 0`. §2.6 consumes this ideal and supplies its
primitive-space comparisons.

Use `TwoSidedIdeal A` with its ideal and module conversions. For unital `A` identify `Ann(I)` with
`(Module.annihilator A I).toTwoSided` for the left-multiplication module on `I`, using the
`IsTwoSided` instance of `Module.annihilator`. For nonunital `A` and closed `I`, construct the
`Unitization ℂ A`-module action `(z, a) • x = z • x + ax` on `I` as a definition taking the
closedness hypothesis (not a global instance), and identify `Ann(I)` with the preimage in `A` of
`(Module.annihilator (Unitization ℂ A) I).toTwoSided` under `Unitization.inrNonUnitalAlgHom ℂ A`
through `TwoSidedIdeal.comap`. Prove both comparisons by their membership formulas and transport
closedness, complex linearity and star invariance; no parallel ideal type is introduced.

For a closed star subalgebra `B ⊆ A`, heredity means that `0 ≤ a ≤ b` and `b ∈ B` imply
`a ∈ B`. Construct the hereditary subalgebra generated by a positive `a` as `closure(aAa)`. Prove
the order-preserving correspondences between hereditary subalgebras `B`, closed left ideals `L`
and closed hereditary cones: `L ↦ L ∩ L*`, `B ↦ {x : x*x ∈ B}` and `B ↦ B₊` (Blackadar
II.5.3.2), and identify `{x : x*x ∈ B}` with `AB` by Cohen–Hewitt factorization (Blackadar
II.5.3.7, BanachAlgebras A4). For the closed ideal `I` generated by `B`, give the correspondence
`J ↦ J ∩ B` and `K ↦ closure(span(AKA))` between closed ideals of `A` contained in `I` and
closed ideals of `B` (Blackadar II.5.3.5). Distinguish full positive elements (generating `A` as
a closed ideal) from strictly positive elements (generating `A` as a hereditary subalgebra).
`Suggested.lean` states heredity of closed ideals as `closed_ideal_isHereditary`.

**Checks.**

- `A = C₀((0,1])` viewed through its nonunital carrier: `K` is the one-point compactification
  `[0,1]` with `ε` the point `0`, `X = (0,1]`, and the adapter returns `C₀((0,1])`; a wrong adapter
  that forgot continuity at `ε` would admit the bounded discontinuous function `t ↦ sign(t − 1/2)`.
- `A = M₂(ℂ)`, `I = 0`: `Ann(0) = A`, `I ∩ Ann(I) = 0` and `Ann(Ann(0)) = Ann(A) = 0`, consistent
  with `I ⊆ Ann(Ann(I))`. `A = ℂ ⊕ ℂ`, `I = ℂ ⊕ 0`: `Ann(I) = 0 ⊕ ℂ ≠ 0`, so `I` is not
  essential; in `A = K(ℓ²)`, `I = A` is essential and `Ann(A) = 0` since `aa* = 0` forces `a = 0`.
- Heredity: in `M₂(ℂ)` the subalgebra `ℂe₁₁ ⊕ ℂe₂₂` of diagonal matrices is not hereditary
  (`q ≤ 1 ∈ B` with `q` the rank-one projection of §1.1 not diagonal), while `e₁₁M₂e₁₁ = ℂe₁₁`
  is, and `closure(qM₂q) = ℂq`.
- Full versus strictly positive: in `K(ℓ²)` a rank-one projection is full (it generates the
  simple algebra as a closed ideal) but not strictly positive (its hereditary subalgebra is
  one-dimensional); `h = diag(1/n)` is strictly positive.

*Needs:* Mathlib `gelfandStarTransform`, `gelfandTransform_isometry`,
`gelfandTransform_bijective`, `Unitization.fstHom`, `Unitization.inrNonUnitalAlgHom`,
`TwoSidedIdeal.comap`, `Module.annihilator`; BanachAlgebras A1, A3, A4.

### 1.4 Approximate units and strictly positive elements (C1.4)

Use `CStarAlgebra.approximateUnit` and `Filter.IsIncreasingApproximateUnit`. Supply subnet and
convexification, transport, ideal, hereditary-subalgebra and representation lemmas. For each
closed ideal `I ⊆ A` construct a positive contractive approximate unit `e_λ` in `I` with
`‖e_λ a − a e_λ‖ → 0` for every `a ∈ A` (Arveson's quasicentral approximate unit; Blackadar
II.4.3). Prove that a C*-algebra has a countable approximate unit iff it has a strictly positive
element, and for `h ≥ 0` relate strict positivity to `closure(hAh) = A`, to `φ(h) > 0` for every
nonzero positive functional `φ`, and to `h(h + 1/n)⁻¹` (computed in the unitization, `n ≥ 1`)
being an approximate unit (Blackadar II.4.2). Prove that every separable C*-algebra is σ-unital;
the converse is false and is not claimed. `Suggested.lean` states
`exists_quasicentral_approximateUnit`.

**Checks.**

- `A = K(ℓ²)`: the finite-rank projections `P_n` form an increasing approximate unit, `diag(1/n)`
  is strictly positive, and `P_n` is quasicentral for every compact operator but not for the
  unilateral shift `S` in `B(ℓ²)`: `‖P_n S − S P_n‖ = 1` for every `n`, so quasicentrality in `A`
  is a statement about the ambient algebra.
- `A = C₀(ℝ)` is σ-unital with strictly positive `t ↦ e^{−t²}`; `A = C₀(X)` for an uncountable
  discrete `X` has no strictly positive element and no countable approximate unit, since any
  countable family of functions is supported on a countable set.
- `h = 0` is strictly positive only in the zero algebra, where `closure(0·A·0) = 0 = A`.

*Needs:* Mathlib `CStarAlgebra.approximateUnit`, `Filter.IsIncreasingApproximateUnit`;
VonNeumannAlgebras V0 for positive functionals.

### 1.5 Approximate identities in algebraic left ideals (C1.5)

For every complex left ideal `L` of `A`, not necessarily closed, construct a positive
contractive right approximate identity with elements in `L` itself. Index by finite `F ⊆ L` and
`δ > 0`, ordered by enlarging `F` and decreasing `δ`; put `b_F = Σ_{x ∈ F} x*x ∈ L` and
`e_{F,δ} = b_F(δ·1 + b_F)⁻¹`, computed in `Unitization ℂ A`. Prove `e_{F,δ} ∈ L` by writing it as
`(δ·1 + b_F)⁻¹ b_F` and using the left action of the unitization on the complex left ideal `L`,
never the closure of `L`. For `x ∈ F` prove `‖x − x e_{F,δ}‖² ≤ δ/4` from `x*x ≤ b_F` and
`sup_{t ≥ 0} δ²t/(δ + t)² = δ/4`, and deduce convergence for every `x ∈ L`. For norm-separable
`L` choose finite initial segments of a countable dense subset and `δ → 0` to obtain a sequence;
include `L = 0`. The right-ideal statement follows by taking stars. For closed two-sided ideals
compare with §1.4's approximate unit and recover two-sided convergence. The independent `δ`
index is retained even when the finite sets have bounded cardinality.

**Checks.**

- `A = C[0,1]`, `L = x·C[0,1]` (nonclosed), `F = {x}`: `b_F = x²` and `e = x²/(δ + x²) ∈ L` with
  `‖x − x e‖² = sup_t (δ t/(δ + t²))² = δ/4` attained at `t = √δ`; the bound is sharp.
- `L = 0`: `F = ∅`, `b_F = 0`, `e = 0`, and the net is the zero net, which converges to `0 = x`
  for the only `x ∈ L`.
- `δ²t/(δ + t)²` has maximum `δ/4` at `t = δ`; a wrong bound `δ` instead of `δ/4` would still
  give convergence, but the stated constant is the one the proof delivers.

*Needs:* Mathlib `Unitization`, the continuous functional calculus; §1.3's unitization action on
ideals.

### 1.6 Compact operators, the Calkin algebra and the Pedersen ideal (C1.6)

For every nonzero complex Hilbert space `H` prove that `K(H)` is simple, by extracting a rank-one
operator from any nonzero closed ideal and generating all finite-rank operators. For complex
separable infinite-dimensional `H` prove that the closed ideals of `B(H)` are exactly `0`, `K(H)`
and `B(H)`, so the unital Calkin algebra `B(H)/K(H)` is simple: for a noncompact element of an
ideal pass first to a noncompact self-adjoint part, then to a positive part; a spectral cutoff
bounded away from `0` lies in the ideal by multiplication with the bounded reciprocal on its
support (do not claim that successive square roots converge to the cutoff); choose an isometry `v`
with range in the infinite-dimensional cutoff range `pH`, so `pv = v` and `v*pv = 1`, in this
order of the factors. Treat finite-dimensional `H` separately (`K(H) = B(H)`, zero quotient), and
keep the separability hypothesis: for nonseparable `H` the operators with separable range form a
further closed ideal.

Construct the Pedersen ideal as the smallest dense two-sided ideal, generated by the elements
`cfcₙ f a` with `a ≥ 0` and `f` vanishing near `0` (Blackadar II.5.2.4). Prove density,
heredity, positive generation, minimality, quotient functoriality and `Ped(B) ⊆ Ped(A) ∩ B` for a
C*-subalgebra `B`. Identify it with the finite-rank operators for `K(H)`, with the compactly
supported continuous functions for `C₀(X)`, and with `A` for unital `A` (Blackadar II.5.2.5).
Keep this algebraic ideal distinct from its norm closure.

**Checks.**

- `H = ℂ²`: `K(H) = B(H) = M₂(ℂ)` is simple and the Calkin quotient is `0`; the three-ideal
  theorem is false here (only two ideals) and false for nonseparable `H`.
- `Ped(C₀(ℝ)) = C_c(ℝ)` contains `t ↦ max(0, 1 − |t|)` but not `t ↦ e^{−t²}`; a wrong definition
  as "the dense ideal `C₀` itself" fails minimality.
- `Ped(K(ℓ²))` is the finite-rank operators: `diag(1/n)` is in `K(ℓ²)` but not in `Ped`, while
  every finite-rank projection is.

*Needs:* Mathlib `IsCompactOperator`; OperatorTheory/SelfAdjointSpectralTheory for spectral
cutoffs; OperatorTheory/PolarDecomposition for the isometry.

### 1.7 Multiplier algebras and the strict topology (C1.7)

Extend Mathlib's `DoubleCentralizer` model `𝓜(ℂ, A)` of `M(A)`. Prove that `A` is an essential
ideal of `M(A)` with the universal property among essential ideal extensions (Blackadar
II.7.3.1). Construct the strict topology by the seminorms `m ↦ ‖ma‖ + ‖am‖`, `a ∈ A`; prove
Hausdorffness, completeness on bounded sets, strict density of `A`, joint continuity of
multiplication on bounded sets and strict continuity of the star. Prove that a nondegenerate star
homomorphism `A → M(B)` extends uniquely to a unital strictly continuous star homomorphism
`M(A) → M(B)`; formulate continuity on bounded sets and prove its equivalence with strict
continuity for these extensions through Cohen factorization `B = φ(A)B`. Include composition,
nondegenerate representations and the concrete idealizer description. Compute `M(C₀(X)) = C_b(X)`
and `M(K(H)) = B(H)` (Blackadar II.7.3.12), and identify the strict topologies on bounded sets
with uniform convergence on compact subsets and with strong-star convergence respectively.

**Checks.**

- `A = C₀((0,1])`: `M(A) = C_b((0,1])` contains `t ↦ sin(1/t)`; the bounded sequence
  `t ↦ tⁿ` converges strictly to `0`, uniformly on each `[ε, 1]` and dominated near `0` by any
  `g ∈ C₀((0,1])`, whereas the bounded sequence `t ↦ sin(nt)` has no uniform limit on `[1/2, 1]`
  and so converges strictly to nothing.
- `A = K(ℓ²)`: the projections `P_n` converge strictly to `1` and strong-star to `1`; the shifts
  `S^n` converge strongly to `0` but `(S^n)* = S*^n` does not, so `S^n` is not strictly convergent.
- For unital `A`, `M(A) = A` and the strict topology is the norm topology, since `m ↦ ‖m·1‖` is
  already the norm.

*Needs:* Mathlib `DoubleCentralizer`; BanachAlgebras A4 (Cohen factorization).

### 1.8 Commutative multiplier morphisms (C1.CommutativeMultiplierMorphisms)

**C1.CommutativeMultiplierMorphisms.** For locally compact Hausdorff `X, Y`, prove that
continuous maps `h : X → Y` correspond bijectively to nondegenerate star homomorphisms
`C₀(Y) → M(C₀(X)) = C_b(X)` by `f ↦ f ∘ h`, where nondegeneracy means that the closed span of
the products `φ(C₀(Y))·C₀(X)` is `C₀(X)`. Prove nondegeneracy with compact-support cutoffs on
`h(K)` for compact `K ⊆ X`, recover `h` from the nonzero evaluation characters of `φ`, and prove
continuity of the recovered map, both inverse identities, identities and contravariant
composition through the unique multiplier extension of §1.7. Prove that the homomorphism lands in
`C₀(X)` exactly when `h` is proper, using compact level sets and cutoffs, including `X` or `Y`
empty. No properness is needed merely to land in `C_b(X)`.

**Checks.**

- `X = (0,1)`, `Y = [0,1]`, `h` the inclusion: `f ↦ f|_{(0,1)}` is nondegenerate into
  `C_b((0,1))` but the constant `1` restricts to a function not in `C₀((0,1))`, so the image is not
  in `C₀(X)`; `h` is not proper.
- `X = ∅`: `C₀(X) = 0`, the only homomorphism is `0`, it is nondegenerate (closed span `0 = C₀(∅)`)
  and corresponds to the empty map, which is proper. `Y = ∅`, `X ≠ ∅`: the zero map `0 → C_b(X)`
  is degenerate and there is no map `X → ∅`, as the bijection requires.
- `h = id_ℝ`: `f ↦ f` is the identity, proper, and lands in `C₀(ℝ)`; `h : ℝ → ℝ`, `t ↦ 0`:
  `f ↦ f(0)·1` is nondegenerate and lands in `C_b` but not in `C₀`, matching that `h` is not
  proper.

*Needs:* §1.7; Mathlib `C₀(X, ℂ)` and `characterSpace`.

### Examples

- The maximal ideal `{f : f(0) = 0}` of `C[0,1]` with `sqrt(x)` outside the algebraic principal
  ideal (§1.2).
- The Calkin algebra of `ℓ²` and the Pedersen ideal of `K(ℓ²)` and of `C₀(ℝ)` (§1.6).
- `M(C₀(X)) = C_b(X)` and `M(K(H)) = B(H)` with their strict topologies (§1.7).

### Dependencies

Mathlib `NonUnitalCStarAlgebra`, `Unitization`, `TwoSidedIdeal`, `Module.annihilator`, the
continuous functional calculus, `CStarAlgebra.approximateUnit`, `DoubleCentralizer`,
`IsCompactOperator`; BanachAlgebras A1–A4; VonNeumannAlgebras V0;
OperatorTheory/PolarDecomposition and OperatorTheory/SelfAdjointSpectralTheory. Within this
roadmap: §1.3's unitization action is used by §1.5; §1.7 by §1.8.

## Layer 2: irreducible representations, primitive ideals and the bidual

Consume VonNeumannAlgebras V0's separable faithful representation on `ℓ²` and its unital,
nonunital and zero-algebra cases (V0.SeparableFaithful); V0 owns that construction and the
GNS construction.

### 2.1 State extension (C2.1)

For a unital closed star subalgebra `B ⊆ A` with the same unit, prove that every state on `B`
extends to a state on `A` with exact restriction and norm one: take a norm-preserving
Hahn–Banach extension and read positivity off its value at the unit (Blackadar II.6.3.1). An
arbitrary extension need not be pure or multiplicative, and for `B ⊆ B(H)` need not be normal.
Prove that every pure state has a pure extension: its extensions form a nonempty weak-star
compact face of the state space whose extreme points are pure states of `A` (Blackadar
II.6.3.2). Include functorial restriction and the nonunital case through the unitizations.

**Checks.**

- `B = ℂ·1 ⊆ A = M₂(ℂ)`: the unique state of `B` extends to every state of `M₂`, pure or not; the
  normalized trace is an extension that is not pure, the vector states are pure extensions.
- `B = C(𝕋) ⊆ B(L²(𝕋))` (multiplication operators): the state `f ↦ ∫ f` extends to the vector
  state of the constant function, which is normal, while a Banach limit along the Fourier basis
  gives a non-normal extension of the same state.
- The pure state `δ_0` on `C[0,1]` has the unique extension `f ↦ f(0)` to `C[0,1]` itself; on the
  larger algebra `M₂(C[0,1])` it has the pure extensions `f ↦ ⟪ξ, f(0)ξ⟫`, `ξ` a unit vector,
  and the non-pure extension `f ↦ tr(f(0))/2`.

*Needs:* BanachSpaceTheory B1–B2 (Hahn–Banach, Krein–Milman); VonNeumannAlgebras V0 (states,
positivity criteria).

### 2.2 Irreducible representations and Kadison transitivity (C2.2)

Extend V0's representation API with cyclic and irreducible representations, intertwiners,
unitary equivalence, direct sums, restriction to ideals and nondegenerate extension from ideals.
A pure state is an extreme point of the state space. An irreducible representation is nonzero
and has no closed invariant subspace other than `0` and `H`; `Suggested.lean` defines this as
`IsIrreducible`. Prove that an irreducible representation is nondegenerate, and that for a
nonzero nondegenerate representation irreducibility is equivalent to a scalar commutant
(Blackadar II.6.1.8). Keep the zero Hilbert space apart: its zero representation is
nondegenerate with scalar commutant but is not irreducible under the nonzero convention. Prove
that a state is pure iff its GNS representation is irreducible (Blackadar II.6.4.8) and norm
detection by irreducible representations (Blackadar II.6.4.9).

Establish Kadison transitivity with the exact bound: for irreducible `π` on `H`, `T ∈ B(H)` and a
finite-dimensional subspace `E ⊆ H`, there is `a ∈ A` with `‖a‖ ≤ ‖T‖` and `π(a)ξ = Tξ` for
every `ξ ∈ E`, and `a` can be chosen self-adjoint when `T` is (Blackadar II.6.1.12–II.6.1.13
give the `ε`-bound). For the exact bound in the self-adjoint case enlarge `E` to `E′ = E + T(E)`,
replace `T` by its compression `T₁ = P T P` to `E′`, which is self-adjoint, leaves `E′` invariant,
agrees with `T` on `E` and has `‖T₁‖ ≤ ‖T‖`, interpolate `T₁` on `E′` by a self-adjoint `a₁`, and
clip `a₁` by the functional calculus to `[−‖T₁‖, ‖T₁‖]`: since `E′` reduces `π(a₁)` and
`σ(π(a₁)|_{E′}) ⊆ [−‖T₁‖, ‖T₁‖]`, the clipped element still interpolates. For general `T` pass
to `M₂(A)` acting irreducibly on `H ⊕ H`, interpolate the self-adjoint block operator
`[[0, T], [T*, 0]]` of norm `‖T‖` on `E ⊕ E`, and take the `(1,2)` corner, whose norm is at most
that of the block. `Suggested.lean` states `kadison_transitivity` and
`kadison_transitivity_selfAdjoint`.

The W*-algebra application of VonNeumannAlgebras V12.J (normal Jordan and projection-logic maps,
with the type I₂ exception) consumes the pure-state/irreducible-GNS theorem of this section; this
section has no V12.J dependency, and projection logic alone does not choose an associative
orientation.

**Checks.**

- `A = M₂(ℂ)` on `H = ℂ²`: the identity representation is irreducible; the representation on
  `ℂ² ⊕ ℂ²` by `a ↦ a ⊕ a` has the invariant diagonal subspace and commutant `M₂(ℂ)`, so it is
  not irreducible. `A = ℂ ⊕ ℂ` on `ℂ²` by diagonal matrices is nondegenerate with commutant
  the diagonal algebra, not irreducible.
- Zero Hilbert space: `B(0) = 0`, the zero representation has commutant `0 = ℂ·1`, and
  `IsIrreducible` fails because no `π(a)` is nonzero; a definition omitting "nonzero" would
  call it irreducible.
- Kadison on `A = K(ℓ²)`, `E = span(e₀)`, `T = 2·S` (`S` the shift): `a = 2·e₁e₀*` has
  `‖a‖ = 2 = ‖T‖` and `π(a)e₀ = 2e₁ = Te₀`; the `ε`-version alone would only give norm `< 2 + ε`.
  For `T = S` and `E = span(e₀, e₁)` no self-adjoint interpolant exists, since it would need
  `⟪e₀, a e₁⟫ = ⟪a e₀, e₁⟫ = 1` while `a e₁ = e₂`; the self-adjoint clause needs `T` self-adjoint.

*Needs:* VonNeumannAlgebras V0 (GNS, states), V1 (Kaplansky density, bicommutant); Mathlib
`cfc` for the clipping; Layer 1 §1.3 for ideals in the restriction statements.

### 2.3 Representations containing compact operators (C2.3)

For a nonzero irreducible `π : A → B(H)`, prove that one nonzero compact operator in `π(A)`
forces `K(H) ⊆ π(A)`. If `π(A)` contains a nonzero compact operator and `ρ` is irreducible with
`ker ρ = ker π`, prove that `ρ` and `π` are unitarily equivalent, with no separability or global
GCR hypothesis: pass to `A/ker π`, restrict to its essential ideal `K(H)`, classify the
nondegenerate representations of `K(H)` as amplifications of the defining representation, and use
the unique multiplier extension of §1.7 and irreducibility to make the multiplicity one. Prove
that a nonzero restriction of an irreducible representation to a closed ideal is nondegenerate
and irreducible (Blackadar II.6.1.6, II.6.1.8). Deduce that irreducible representations of an
infinite-dimensional simple unital algebra contain no nonzero compact operator. When
`π(A) ⊆ K(H)` the first statement gives `π(A) = K(H)`; a compression `pap` of a self-adjoint
element by a projection need not be a projection.

**Checks.**

- The CAR algebra (the UHF algebra of type `2^∞`) is simple, so every irreducible
  representation has kernel `0`, and it has inequivalent irreducible representations; the
  compact-operator hypothesis is therefore necessary for "equal kernels imply equivalence".
- `A = K(ℓ²)`: the defining representation and its amplification `a ↦ a ⊕ a` have the same
  kernel `0`; the amplification is not irreducible, and the only irreducible representation up to
  equivalence is the defining one.
- `A = C(𝕋)` on `L²(𝕋)` by multiplication contains no nonzero compact operator; its irreducible
  representations are the characters, whose kernels are the maximal ideals, pairwise distinct.

*Needs:* §1.7 (multiplier extension), §1.6 (`K(H)` simple), §2.2.

### 2.4 Pure states of the compact operators and their unitization (C2.4)

Identify the pure states of `K(H)` with the projective space of `H` by `[ξ] ↦ (T ↦ ⟪ξ, Tξ⟫)` for
unit vectors `ξ`: prove surjectivity, equality exactly up to a unimodular scalar, and that the
map from the quotient of the unit sphere (norm topology) onto the pure states with the relative
weak-star topology is a homeomorphism, using the rank-one projection onto a proposed limit ray
for the inverse continuity, with nets and no separability. The zero Hilbert space has no pure
states and no unit rays. For infinite-dimensional `H` classify the irreducible representations of
`Unitization ℂ (K(H))` as the defining one and the character with kernel `K(H)`; its primitive
space is `{0, K(H)}` with open sets `∅`, `{0}` and the whole space, so `{0}` is dense and
`{K(H)}` is closed.

**Checks.**

- `H = ℂ²`: pure states of `M₂(ℂ)` are the vector states `T ↦ ⟪ξ, Tξ⟫` of unit vectors
  `ξ = (α, β)`, with density matrix `ξξ*`, the Bloch sphere; the state `tr/2` has density matrix
  `I/2` and is not pure, and `ξ` and `e^{iθ}ξ` give the same state.
- Weak-star convergence of vector states `ω_{ξ_n} → ω_ξ` on `K(H)` forces `|⟪ξ_n, ξ⟫| → 1` (test
  on the rank-one projection onto `ξ`), hence convergence of rays; a definition using the
  weak topology on the sphere instead of the norm topology would wrongly identify `e_n → 0`.
- `Unitization ℂ (K(ℓ²))`: the character `(λ, a) ↦ λ` has kernel `K(ℓ²)`, which is not contained
  in the kernel `0` of the defining representation, giving the two-point space with `{0}` open.

*Needs:* §2.2, §2.3; BanachSpaceTheory B1 (weak-star topology).

### 2.5 The pure-state quotient and the Baire property (C2.5)

Prove that the surjection from the pure states with their relative weak-star topology to
`Prim(A)`, `ω ↦ ker(π_ω)`, is continuous and open, hence induces the hull–kernel topology of
§2.6 as the quotient topology; use the pure-state/GNS theorem and norm detection on ideals,
never a map assigning an extreme point to every state. Include nonunital `A` and the empty
pure-state and primitive spaces of `A = 0`. For separable `A` prove that `Prim(A)` is a Baire
space: the extreme points of a compact metrizable convex set form a `G_δ`; for nonunital `A`
apply this to the compact quasi-state space, whose extreme points are the pure states and `0`,
and remove `0`; a `G_δ` in a compact metrizable space is completely metrizable, hence Baire, and
the open continuous surjection transports the Baire property (Blackadar II.6.5.14 states the
conclusion for every C*-algebra; the general case is not claimed here). No Hausdorff or `T₁`
hypothesis is imposed on `Prim(A)`.

**Checks.**

- `A = C₀(X)` for locally compact Hausdorff `X`: the pure states are the evaluations, the
  quotient map is the identity of `X`, and `Prim(A) = X` with its own topology, which is the
  hull–kernel topology of the closed ideals `I_K`.
- `A = Unitization ℂ (K(ℓ²))` from §2.4: the pure states `ω_ξ` all map to `0` and the character
  maps to `K(ℓ²)`; the image of the open set of states with `|ω(e₀e₀*)| > 1/2` is `{0}`, which
  is open, as openness requires.
- `A = 0`: the pure-state space and `Prim(A)` are empty and vacuously Baire; the quasi-state
  space is `{0}`, whose single extreme point is removed.

*Needs:* §2.2, §2.6 (hull–kernel topology); BanachSpaceTheory B1–B2; BanachAlgebras A1.

### 2.6 Primitive ideals, hull–kernel topology, annihilators and open supports (C2.AnnHull)

Identify the kernels of nonzero irreducible representations with the algebraic primitive ideals
of BanachAlgebras A1: Kadison transitivity gives algebraic irreducibility of the Hilbert-space
modules, and the maximal-modular-left-ideal/pure-state construction gives the converse (Blackadar
II.6.5.1–II.6.5.3). Use A1's hull–kernel topology on `Prim(A)` with `hull(J) = {P : J ⊆ P}`.
Prove that every closed ideal is an intersection of primitive ideals (Blackadar II.6.5.3), and
that every closed left ideal `J` is the intersection of the left kernels `{a : ω(a*a) = 0}` of
the pure states whose left kernels contain `J`: for `a ∉ J` construct such a pure state with
`ω(a*a) > 0`, through the unitization and the pure-state/maximal-left-ideal separation argument.
Prove the lattice correspondence between closed ideals and open subsets, identify `Prim(A/I)`
with `hull(I)` and `Prim(I)` with its open complement (Blackadar II.6.5.4), prove `T₀` and local
quasi-compactness, quasi-compactness for unital `A`, and for separable `A` second countability and
that closed prime ideals are primitive (Blackadar II.6.5.6–II.6.5.7, II.6.5.15). No
Hausdorffness is assumed.

**C2.AnnHull.** For a closed two-sided ideal `I` put `U_I = Prim(A) ∖ hull(I)` and prove that its
elements are exactly the kernels of nonzero irreducible `π` with `π(I) ≠ 0`; represent these
kernels by closed members of `TwoSidedIdeal A`. Prove `Ann(I) = ⨅_{P ∈ U_I} P` with the meet in
`TwoSidedIdeal A` (the underlying set is the intersection, closed, and the empty meet is `A`),
and `hull(Ann(I)) = closure(U_I)`; include `I = 0`, `I = A` and `A = 0`. For irreducible `π` with
`π(I) ≠ 0`, `closure(span π(I)H)` is a nonzero closed invariant subspace, hence `H`, so `aI = 0`
forces `π(a) = 0`; conversely, if `π(a) = 0` whenever `π(I) ≠ 0`, then `π(ai) = 0` for every
irreducible `π` and `i ∈ I`, so `ai = 0` by norm detection. `Ann(I)` is the annihilator ideal of
§1.3, used through its left-annihilator membership only. Identify A1's hull–kernel closure
operator on this representation of `Prim(A)` with `closure(S) = hull(⨅_{P ∈ S} P)` for every
`S ⊆ Prim(A)` and apply it to `U_I`. Deduce that `I` is essential iff `Ann(I) = 0` iff `U_I` is
dense, and `U_{Ann(I)} = interior(hull(I))`. No unitality, separability, type I or Hausdorff
hypothesis.

**Checks.**

- `I = 0`: `U_0 = ∅`, `Ann(0) = A`, the empty meet is `A`, and `hull(A) = ∅ = closure(∅)`.
  `I = A`: `U_A = Prim(A)`, `Ann(A) = 0`, `hull(0) = Prim(A)`. `A = 0`: all spaces are empty and
  `Ann(0) = 0 = A`.
- `A = ℂ ⊕ ℂ`, `I = ℂ ⊕ 0`: `Prim(A)` is two points, `U_I` is the point `ker(pr₁) = 0 ⊕ ℂ`,
  `Ann(I) = 0 ⊕ ℂ = ⨅_{P ∈ U_I} P`, `hull(Ann(I)) = {0 ⊕ ℂ} = closure(U_I)` (discrete topology),
  and `U_{Ann(I)} = {ℂ ⊕ 0} = interior(hull(I))`; `I` is not essential and `U_I` is not dense.
- `A = Unitization ℂ (K(ℓ²))`, `I = K(ℓ²)`: `U_I = {0}` is dense, `Ann(I) = 0`, `I` is
  essential, and `interior(hull(I)) = interior({K(ℓ²)}) = ∅ = U_{Ann(I)} = U_0`.
- In `C[0,1]` the closed left ideal `J = {f : f(0) = 0}` is the left kernel of the pure state
  `δ_0`, and `1 ∉ J` is separated by `δ_0(1*1) = 1 > 0`; a pure state `δ_t` with `t ≠ 0` has left
  kernel `{f : f(t) = 0}`, which does not contain `J`, so it is not among the states used.

*Needs:* §1.3 (`Ann`), §2.2 (Kadison, norm detection); BanachAlgebras A1 (primitive ideals,
hull–kernel closure); Mathlib `TwoSidedIdeal`.

### 2.7 Norm functions on the primitive space and Dauns–Hofmann (C2.7)

For `a ∈ A` prove lower semicontinuity of `P ↦ ‖a + P‖` on `Prim(A)`, quasi-compactness of
`{P : ‖a + P‖ ≥ ε}` for every `ε > 0` (Blackadar II.6.5.6), and continuity when `Prim(A)` is
Hausdorff. Identify the commutative primitive space with the Gelfand spectrum. Prove the
Dauns–Hofmann theorem as `Z(M(A)) ≅ C_b(Prim(A))`, characterized by `za + P = f(P)(a + P)`
(Blackadar II.6.5.10–II.6.5.12); this supplies the central action of `C_b(Prim(A))`, not only a
bijection.

**Checks.**

- `A = Unitization ℂ (K(ℓ²))`, `a = e₀e₀*`: `‖a + 0‖ = 1` and `‖a + K(ℓ²)‖ = 0`; the function
  `P ↦ ‖a + P‖` jumps down at the closed point `K(ℓ²)`, lower semicontinuous but not continuous,
  as `Prim(A)` is not Hausdorff.
- `A = C₀(X)`: `Z(M(A)) = C_b(X) = C_b(Prim(A))` and the action is multiplication; `A = K(ℓ²)`:
  `Z(M(A)) = ℂ = C_b(point)`.
- `A = M₂(C[0,1])`: `Prim(A) = [0,1]`, `Z(A) = C[0,1]·1`, and `z = x·1` acts on the fiber at `t`
  by the scalar `t`.

*Needs:* §1.7, §2.6; BanachAlgebras A1.

### 2.8 The universal representation and the bidual (C2.8)

Construct the universal representation as the direct sum of all state GNS representations.
Identify its bicommutant with the Banach bidual `A**`, with predual `A*` (Blackadar
III.5.2.5–III.5.2.7). Prove that the two Arens products of BanachAlgebras A4 agree here, that the
canonical embedding is isometric and preserves star, that multiplication is separately
weak-star continuous, and that this makes `A**` a W*-algebra. Prove that every nondegenerate
representation `π` extends uniquely to a normal surjective star homomorphism `A** → π(A)′′`
whose kernel is a central summand (Blackadar III.5.2.9), and for a closed ideal `I` identify
`A** ≅ I** ⊕ (A/I)**` as W*-algebras with the induced inclusions and quotient maps (Blackadar
III.5.2.11).

**Checks.**

- `A = c₀`: `A** = ℓ^∞` acting diagonally, and `A* = ℓ¹` is the predual; the two Arens
  products agree because `A**` is commutative.
- `A = K(ℓ²)`: `A** = B(ℓ²)` and `A* = S₁(ℓ²)` (trace class); the extension of the defining
  representation is the identity of `B(ℓ²)`.
- `A = C[0,1]`, `I = {f : f(0) = 0}`: `A** = I** ⊕ ℂ`, the summand `ℂ = (A/I)**` being the
  characteristic function of `{0}` in the universal enveloping algebra.

*Needs:* VonNeumannAlgebras V0, V1, V4; BanachAlgebras A4; BanachSpaceTheory B1.

### 2.9 Open projections and the multiplier algebra in the bidual (C2.9)

Define an open projection `p ∈ A**` as a weak-star limit of an increasing net of positive
elements of `A`. Identify hereditary subalgebras with open projections by `B = A ∩ pA**p` and
`p = sup e_λ`, and closed ideals with central open projections; prove `B** = pA**p`. For `a ≥ 0`
identify its support projection with that of `closure(aAa)`; strictly positive means full
support. Identify `M(A)` with the idealizer `{x ∈ A** : xA ⊆ A, Ax ⊆ A}` of `A` in `A**`, and
prove that bounded strict convergence implies strong-star convergence in every nondegenerate
representation, including the universal one.

**Checks.**

- `A = C₀(X)`: the open projections of `A**` are the images of the characteristic functions of
  open subsets `U ⊆ X`, the hereditary subalgebras are the `C₀(U)`, and every projection is
  central, so closed ideals and hereditary subalgebras coincide.
- `A = K(ℓ²)`: every projection of `A** = B(ℓ²)` is open (it is the strong limit of its
  compressions of finite-rank approximate units), `pA**p ∩ A = pK(ℓ²)p`, and the central open
  projections are `0` and `1`, matching the ideals `0` and `K(ℓ²)`.
- `A = C[0,1]`, `a = x`: the support of `x` is the characteristic function of `(0,1]`, equal to
  the support of `closure(xAx) = {f : f(0) = 0}`; `x` is not strictly positive.

*Needs:* §1.3, §1.4, §1.7, §2.8; VonNeumannAlgebras V1, V2.

### 2.10 Endpoint matrix algebras and their primitive spaces (C2.10)

**C2.MatrixFields.** Use the continuous-map algebra `C([0,1], M₂(ℂ))` with values in
`CStarMatrix (Fin 2) (Fin 2) ℂ` and its operator norm. For each of the four closed star
subalgebras `D = M₂(ℂ)`, `ℂe₁₁`, the diagonal algebra `ℂe₁₁ ⊕ ℂe₂₂` and `ℂ·I₂`, construct the
closed star subalgebra `A_D = {f ∈ C([0,1], M₂(ℂ)) : f(0) ∈ D}`, unital exactly when `I₂ ∈ D`
(the corner-endpoint algebra `A_{ℂe₁₁}` is nonunital). Give the evaluation maps, their
surjectivity, kernels, quotient isomorphisms and the quotient norm `‖f + ker(ev_x)‖ = ‖f(x)‖`; the
fiber is `M₂` for `x > 0` and `D` at `0`. Scalar multiplication is a nondegenerate central map
`C([0,1]) → Z(M(A_D))`; prove that its quotient fibers are the evaluation fibers and that the
norm functions `x ↦ ‖f(x)‖` are continuous; this central action exists also for the nonunital
corner-endpoint algebra. Compute the centers: `C([0,1])·I₂` for the full, diagonal and scalar
endpoints, and `Z(A_{ℂe₁₁}) = {h·I₂ : h ∈ C([0,1]), h(0) = 0} ≅ C₀((0,1])`.

Classify all closed two-sided ideals and all nonzero irreducible representations up to unitary
equivalence. In the full, corner and scalar cases the closed ideals are exactly
`I_K = {f : f|_K = 0}` for unique closed `K ⊆ [0,1]`, because the fiber `D` is simple; the
irreducible representations are evaluation on `ℂ²` for `x > 0` and evaluation on the defining
irreducible `D`-module at `0` (on `ℂ²` for full `D`), and their kernels identify `Prim(A_D)`
homeomorphically with `[0,1]`. In the diagonal case there are, besides `I_K` for every closed
`K`, exactly the two ideals `{f : f|_{K ∖ {0}} = 0, f(0) ∈ ℂe_jj}`, `j = 1, 2`, for each closed `K`
in which `0` is isolated; prove this list complete. The endpoint irreducibles are the two
coordinate characters; label their kernels `0⁺` and `0⁻` by first and second coordinate. Prove
`Prim(A_diagonal) = (0,1] ∪ {0⁺, 0⁻}` with the doubled-endpoint topology: the usual topology on
`(0,1]`, and at each `0±` the neighbourhood basis `{0±} ∪ (0, ε)`, `0 < ε ≤ 1`; each endpoint is
closed, the two have no disjoint neighbourhoods, and a subset of `(0,1]` has either endpoint in its
closure exactly when it accumulates at `0`. Prove these from the hull–kernel closure formulas
rather than reading them off the underlying set. Reflect the interval to obtain the same
examples with the restriction at `1`. The scalar and diagonal endpoint algebras have isomorphic
centers but are not isomorphic: they have one and two one-dimensional irreducible classes
respectively, and their central fibers at `0`, `ℂ` and `ℂ²`, distinguish them under any
isomorphism, which would have to match the unique points with non-`M₂` fibers.

For the compact `X = {0} ∪ {1/n : n ≥ 1} ⊆ ℝ`, construct `B_X = {f ∈ C(X, M₂) : f(0) diagonal}`.
Give the same closed-ideal and irreducible-evaluation classification with `X` in place of the
interval, compute `Z(B_X) = C(X)·I₂` and its quotient fibers, and prove that its primitive
space consists of the isolated points `1/n` and two closed points `0±`, each with the
neighbourhood basis consisting of the point and a cofinite tail of the sequence, so that `1/n`
converges to both endpoints. These are computations on the stated continuous-section algebras.

**Checks.**

- Diagonal case, `K = {0}`: `I_K = {f : f(0) = 0}` and the two extra ideals `0⁺ = {f : f(0)₁₁ = 0}`
  and `0⁻ = {f : f(0)₂₂ = 0}`; for `K = [0, 1/2]` the extra ideals collapse to `I_K`, since
  `f|_{(0,1/2]} = 0` forces `f(0) = 0`.
- Closure formulas: for `S = {1/n : n ≥ 1} ⊆ (0,1]` in the diagonal case, `⨅_{x ∈ S} ker(ev_x) = I_{S ∪ {0}}`
  and its hull is `S ∪ {0⁺, 0⁻}`; for `S = {1/2}`, the hull of `I_{{1/2}}` is `{1/2}`, so no
  endpoint is in the closure. The set `{0⁺} ∪ (0, ε)` is open because its complement
  `[ε,1] ∪ {0⁻}` is the hull of `{f : f|_{[ε,1]} = 0, f(0) ∈ ℂe₁₁}`.
- Centers: for the corner endpoint, `h·I₂` with `h(0) ≠ 0` has `f(0) = h(0)I₂ ∉ ℂe₁₁`, so
  `Z(A_{ℂe₁₁}) ≅ C₀((0,1])`; for the diagonal endpoint, `f(t)` scalar for `t > 0` forces `f(0)`
  scalar by continuity, so the center is `C([0,1])·I₂` and not the larger diagonal-valued
  functions.
- `B_X`: the singleton `{1/n}` is open, being `U_J` for `J = {f : f(x) = 0 for x ≠ 1/n}`; the
  point `0⁺` is not open, since every ideal not contained in `0⁺` contains a function with
  `f(0)₁₁ ≠ 0` and hence functions nonvanishing on a tail.

*Needs:* §1.3, §1.7, §2.6, §2.7; Mathlib `CStarMatrix`, `C(X, A)`.

### Examples

- Pure states of `M₂(ℂ)` as the Bloch sphere and of `K(H)` as the projective space (§2.4).
- The two-point primitive space of `Unitization ℂ (K(ℓ²))` and its non-Hausdorff norm function
  (§§2.4, 2.7).
- `Prim(A_diagonal)`: the interval with a doubled endpoint, and `Prim(B_X)`: a convergent
  sequence with two limits (§2.10).
- `A** = ℓ^∞` for `A = c₀` and `A** = B(ℓ²)` for `A = K(ℓ²)` (§2.8).

### Dependencies

VonNeumannAlgebras V0 (states, GNS, V0.SeparableFaithful), V1, V2, V4; BanachAlgebras A1, A4;
BanachSpaceTheory B1–B2; Mathlib `TwoSidedIdeal`, `cfc`, `CStarMatrix`. Within this roadmap:
Layer 1 §§1.3, 1.4, 1.6, 1.7.

## Layer 3: operator spaces and completely bounded maps

### 3.1 Abstract operator spaces and Ruan's theorem (C3.1)

Define an abstract operator space as a complex vector space `E` with a norm on each `M_{m,n}(E)`
satisfying Ruan's axioms `‖x ⊕ y‖ = max(‖x‖, ‖y‖)` and `‖αxβ‖ ≤ ‖α‖‖x‖‖β‖` for scalar matrices
`α, β`, with rectangular levels and the zero-level convention (level zero is the zero space with
norm zero). Prove compatibility of level one with the underlying normed space, reindexing,
matrix amplification, completions, subspaces and quotients. Prove Ruan's representation
theorem: every abstract operator space is completely isometric to a subspace of some `B(H)`,
closed when `E` is complete (Ruan 1988, Theorem 3.1; Pisier, Grothendieck's theorem past and
present, Theorem 13.6 for the dual and quotient structures). Reuse VonNeumannAlgebras V13a's
matrix-order and CP-extension APIs. Construct abstract Archimedean matrix-ordered star vector
spaces with a matrix order unit, their order-unit matrix norms, and their Choi–Effros realization
as concrete operator systems by matrix-state separation (Blackadar II.6.9.21–II.6.9.22).
Construct the Paulsen block operator system `S(E) = {[[λ, x], [y*, μ]] : λ, μ ∈ ℂ, x, y ∈ E}`
of an abstract operator space, prove its matrix-order axioms, and use its Choi–Effros
representation to prove Ruan's theorem.

**Checks.**

- `C(X)` with `M_n(C(X)) = C(X, M_n)` satisfies Ruan's axioms; its structure is the minimal one
  of §3.3, and the identity `C(X) → C(X)` is a complete isometry for it.
- Non-example: the entrywise supremum norms `‖[x_{ij}]‖ = max_{ij} |x_{ij}|` on `M_n(ℂ)` violate
  the second axiom, since for the all-ones matrix `x` and the unit vectors `α = (1,…,1)/√n` (row),
  `β = αᵀ` one has `αxβ = n > 1 = ‖α‖‖x‖‖β‖`.
- Level zero: `x ⊕ 0 = x` with `0 ∈ M_0(E)` gives `max(‖x‖, 0) = ‖x‖`, consistent with the first
  axiom; dropping level zero breaks the reindexing lemmas for empty index sets.

*Needs:* VonNeumannAlgebras V13a; Mathlib `CStarMatrix` rectangular norms; BanachSpaceTheory B1
(separation).

### 3.2 Completely bounded maps (C3.2)

For a linear map `u : E → F` set `u_n([x_{ij}]) = [u(x_{ij})]` and define
`‖u‖_cb = sup_n ‖u_n‖` on the maps for which this supremum is finite. Develop the normed space
`CB(E, F)`, complete when `F` is complete, together with complete contractions, complete
isometries, complete quotient maps, composition bounds and matrix amplification. Keep incomplete
operator spaces in the construction; for `E = ℂ` the evaluation isometry `CB(ℂ, F) ≅ F` records
the completeness boundary. Put the operator-space structure on `CB(E, F)` by
`M_n(CB(E, F)) = CB(E, M_n(F))` and on `E*` by `M_n(E*) = CB(E, M_n)`. Prove that the canonical
map `E → E**` is completely isometric, that duality exchanges complete quotient maps and
complete isometries, and Smith's lemma: a map into `M_n` has `‖u‖_cb = ‖u_n‖`, by compressing
the test vectors of a level-`m` amplification to the `n`-dimensional subspaces they span.
`Suggested.lean` defines complete boundedness of a linear map between C*-algebras as
`IsCompletelyBounded`.

**Checks.**

- The transpose on `M_n`, `n ≥ 1`, has operator norm `1` and cb norm `n`: at level `n` it sends
  the flip unitary `[E_{ji}]_{ij} ∈ M_n(M_n)`, of norm `1`, to `[E_{ij}]_{ij}`, which is `n` times
  a rank-one projection. A definition of the cb norm as the norm of the first amplification would
  return `1`.
- A bounded functional `u : E → ℂ = M_1` has `‖u‖_cb = ‖u‖` (Smith's lemma with `n = 1`); so
  does every bounded map into a commutative C*-algebra.
- `E = ℂ`: `CB(ℂ, F) → F`, `u ↦ u(1)`, is an isometry for every operator space `F`, complete or
  not; `CB(E, F)` is complete only when `F` is, as `F = c₀₀` with the sup norm shows.

*Needs:* §3.1; BanachSpaceTheory B1.

### 3.3 Column and row spaces, MIN and MAX, operator algebras (C3.3)

Construct the column space `C(H) = B(ℂ, H)` and row space `R(H) = B(H, ℂ)`, their
conjugate-dual identifications and the finite formulas `‖[x_i]‖_{C_n} = ‖Σ x_i*x_i‖^{1/2}` and
`‖[x_i]‖_{R_n} = ‖Σ x_i x_i*‖^{1/2}` (Pisier, Grothendieck's theorem, Theorem 13.10). Construct
`MIN(E)` and `MAX(E)` for a Banach space `E` (Blecher–Paulsen 1991), prove their universal
properties (bounded maps into `MIN(E)`, respectively out of `MAX(E)`, are completely bounded with
the same norm) and the dualities `MIN(E)* = MAX(E*)`, `MAX(E)* = MIN(E*)`. Give explicit examples
separating bounded from completely bounded maps, including the transpose of §3.2. Define an
operator algebra as a norm-closed, not necessarily self-adjoint subalgebra of `B(H)` with its
inherited operator-space structure, specifying units where used.

**Checks.**

- The identity `R_n → C_n` is isometric at level one (both are `ℓ²_n`) and has cb norm `√n`:
  the column `[e_i*]_i ∈ M_{n,1}(R_n)` has norm `1` while its image `[e_i]_i ∈ M_{n,1}(C_n)` has
  norm `√n`.
- `MIN(E)` for `E = C(X)` is the operator-space structure of the C*-algebra `C(X)`, and
  `MIN(E) = MAX(E) = ℂ` for `E = ℂ`; for every infinite-dimensional `E` the identity
  `MIN(E) → MAX(E)` is bounded with norm `1` but not completely bounded (Blecher–Paulsen 1991).
- The disc algebra `A(𝔻) ⊆ C(𝕋)` is an operator algebra that is not self-adjoint; its
  conjugate `A(𝔻)*` is a different subspace of `C(𝕋)`.

*Needs:* §3.1, §3.2; Mathlib `H →L[ℂ] H`.

### Examples

- The transpose on `M_n` and the identity `R_n → C_n` as bounded, not completely contractive
  maps (§§3.2–3.3).
- `MIN(C(X))` and `MAX(ℓ¹_n)` (§3.3).

### Dependencies

VonNeumannAlgebras V13a; BanachSpaceTheory B1–B2; Mathlib `CStarMatrix`. Within this roadmap:
none before Layer 3.

## Layer 4: CP dilations, multiplicative domains and Wittstock theory

### 4.1 Completely positive maps, Schwarz and the multiplicative domain (C4.1)

Use `CompletelyPositiveMap` and V13a's operator-system extension API. Add bounded and continuous
realizations and norm compatibility: for a completely positive `φ` with unital domain,
`‖φ‖_cb = ‖φ‖ = ‖φ(1)‖` (Blackadar II.6.9.4 for the norm, the matrix bound for `cb`); include the
nonunital approximate-unit formulation `‖φ‖ = lim ‖φ(e_λ)‖` and the unitization of completely
positive contractions (Blackadar II.6.9.5). Prove that positive maps with commutative domain
(Stinespring 1955, Theorem 4) or commutative range are completely positive. Prove the
Kadison–Schwarz inequality `φ(a)*φ(a) ≤ φ(a*a)` for unital 2-positive maps (Blackadar
II.6.9.14). For unital completely positive `φ`, prove that the elements `a` with both
`φ(a*a) = φ(a)*φ(a)` and `φ(aa*) = φ(a)φ(a)*` form a closed unital C*-subalgebra, the
multiplicative domain, characterized by `φ(ab) = φ(a)φ(b)` and `φ(ba) = φ(b)φ(a)` for every `b`:
with a Stinespring dilation `φ = V*π(·)V` of §4.2, the first equality says
`(1 − VV*)^{1/2}π(a)V = 0`, so `π(a)V = VV*π(a)V` and `φ(ba) = φ(b)φ(a)`; the second handles
the other side. Prove that the restriction of `φ` to its multiplicative domain is a star
homomorphism and that a unital completely positive map fixing a C*-subalgebra pointwise is
bimodular over it. `Suggested.lean` states `completelyPositive_isCompletelyBounded`,
`completelyPositive_matrix_bound`, `schwarz`, `multiplicativeDomain_iff` and
`multiplicativeDomain_isClosedStarSubalgebra`.

**Checks.**

- Compression `φ(a) = pap` from `B(H)` onto `pB(H)p`, `p` a projection: `φ` is unital onto its
  range, and its multiplicative domain is `{a : ap = pa}`, since `φ(a*a) = φ(a)*φ(a)` says
  `(1 − p)ap = 0`. A definition using one Schwarz equality only would return the non-self-adjoint
  set `{a : (1 − p)ap = 0}`.
- The trace state `tr/n` on `M_n` has multiplicative domain `ℂ·1` (equality in Cauchy–Schwarz for
  a faithful trace); a vector state `ω_ξ` has multiplicative domain `{a : aξ ∈ ℂξ, a*ξ ∈ ℂξ}`.
- The transpose on `M₂` is unital and positive but not 2-positive, and it violates Schwarz:
  for `a = E₁₂`, `φ(a) = E₂₁`, so `φ(a)*φ(a) = E₁₂E₂₁ = E₁₁`, while `φ(a*a) = φ(E₂₂) = E₂₂`, and
  `E₁₁ ≤ E₂₂` fails.

*Needs:* VonNeumannAlgebras V13a; Mathlib `CompletelyPositiveMap`, `CStarMatrix`; §4.2 for the
dilation route.

### 4.2 Stinespring dilation and the Radon–Nikodym theorem (C4.2)

For every completely positive `φ : A → B(H)` construct a Hilbert space `K`, a nondegenerate
representation `π : A → B(K)` and a bounded `V : H → K` with `φ(a) = V*π(a)V` and
`‖V‖² = ‖φ‖` (Stinespring 1955, Theorem 1; Blackadar II.6.9.7): build `K` from the positive form
`⟪Σ a_i ⊗ ξ_i, Σ b_j ⊗ η_j⟫ = Σ_{ij} ⟪ξ_i, φ(a_i*b_j)η_j⟫` on `A ⊙ H` and prove the null-space,
bounded-action, completion and nonunital approximate-unit steps. Take the minimal dilation
`K = closure(span(π(A)VH))`, prove uniqueness up to a unitary intertwining both `π` and `V`, and
prove that `V` is an isometry when `φ` is unital. For `ψ ≤ φ` in the completely positive order,
establish Arveson's Radon–Nikodym correspondence with positive contractions `T ∈ π(A)′`,
`ψ(a) = V*Tπ(a)V`, an affine order isomorphism onto the interval `[0, φ]`, with uniqueness in the
minimal dilation (Arveson 1969, Theorem 1.4.2): on the algebraic Stinespring space the form
`q_ψ(Σ a_i ⊗ ξ_i, Σ b_j ⊗ η_j) = Σ_{ij} ⟪ξ_i, ψ(a_i*b_j)η_j⟫` satisfies `0 ≤ q_ψ ≤ q_φ`, so it
descends to a positive contraction whose left-action identity gives commutation with `π(A)`.
`Suggested.lean` states `stinespring` (unital domain) and `cp_radonNikodym`.

**Checks.**

- `φ` a state `ω` of `A` (`H = ℂ`): the minimal Stinespring dilation is the GNS triple
  `(H_ω, π_ω, λ ↦ λ·ξ_ω)`, and `‖V‖² = ‖ξ_ω‖² = ‖ω‖`.
- `φ = id_{B(H)}`: the minimal dilation is `(H, id, 1)`; `(H ⊕ H, id ⊕ id, ξ ↦ (ξ, 0))` is a
  dilation that is not minimal, since `π(A)VH = H ⊕ 0 ≠ H ⊕ H`.
- Radon–Nikodym for `φ = id_{B(H)}`: `π(A)′ = ℂ`, so `[0, φ] = {t·id : 0 ≤ t ≤ 1}`; the wrong
  model `T ∈ π(A)′′` would propose `a ↦ Ta` for an arbitrary positive contraction `T`, which is
  not even positive unless `T` is scalar.

*Needs:* VonNeumannAlgebras V0 (GNS); Mathlib `ContinuousLinearMap.adjoint`,
`Submodule.topologicalClosure`; §1.4 (approximate units).

### 4.3 Choi's criterion and Kraus decompositions (C4.3)

For `φ : M_n → M_m` prove Choi's criterion: `φ` is completely positive iff it is `n`-positive iff
the Choi matrix `[φ(E_{ij})]_{ij} ∈ M_n(M_m)` is positive (Choi 1975, Theorem 2). Construct Kraus
operators `V_k : ℂ^m → ℂ^n` with `φ(a) = Σ_k V_k* a V_k`, the minimal number of them being the
rank of the Choi matrix, and the unitary and isometric change-of-family formulas. Derive
unitality `Σ V_k*V_k = 1` and the trace dual `ρ ↦ Σ V_k ρ V_k*`, whose trace preservation
corresponds to that unitality. Relate these finite formulas to the minimal Stinespring dilation
of §4.2.

**Checks.**

- The transpose on `M₂` has Choi matrix `Σ E_{ij} ⊗ E_{ji}`, the flip, with eigenvalue `−1`: it
  is positive but not completely positive.
- The identity of `M_n` has Choi matrix `Σ E_{ij} ⊗ E_{ij} = n·P` for the rank-one projection `P`
  onto `Σ e_i ⊗ e_i`; its rank is `1`, matching the single Kraus operator `1`.
- `φ(a) = tr(a)·1/n` has Choi matrix `(1/n)·1 ⊗ 1` of rank `n²`, so it needs `n²` Kraus operators
  (`E_{ij}/√n`); it is unital and trace preserving.

*Needs:* Mathlib `CStarMatrix`, `Matrix.PosSemidef`; §4.2.

### 4.4 Wittstock extension, decomposition and Paulsen similarity (C4.4)

Prove the `2 × 2` operator-system trick and Wittstock's extension theorem: a completely bounded
map from an operator subspace of a C*-algebra to `B(H)` extends with unchanged cb norm
(Wittstock 1981; Ozawa, About the QWEP conjecture, Theorem 2.2). For a completely bounded
`u : A → B(H)` construct a representation `π` and operators `V, W` with `u(a) = V*π(a)W` and
`‖V‖‖W‖ = ‖u‖_cb` (Pisier, Grothendieck's theorem, Theorem 13.3). Prove the completely positive
block-matrix completion and Wittstock's decomposition of a completely bounded map into a linear
combination of four completely positive maps, including the self-adjoint two-term version with
its norm estimates. For a unital completely bounded homomorphism `ρ` from a unital operator
algebra into `B(H)`, prove Paulsen's similarity theorem: some invertible `S` makes `S⁻¹ρ(·)S`
completely contractive with `‖S‖‖S⁻¹‖ = ‖ρ‖_cb` (Paulsen 1984); for a C*-algebra domain the
transformed map is a star homomorphism. Complete boundedness is a hypothesis of this result.

**Checks.**

- The transpose on `M_n = B(ℂ^n)`, `n ≥ 2`, is bounded with norm `1` but has cb norm `n`; it
  admits a factorization `V*π(·)W` with `‖V‖‖W‖ = n` and none with `‖V‖‖W‖ = ‖u‖ = 1`, so the
  factorization theorem cannot be stated with the operator norm in place of the cb norm.
- A star homomorphism `ρ` has `‖ρ‖_cb = 1` and Paulsen's `S` can be taken `1`; the similarity
  `ρ_S = S⁻¹ρS` with `S = diag(1, 2)` on `ℂ²` has `‖ρ_S‖_cb = ‖S‖‖S⁻¹‖ = 2` and the theorem
  recovers a star homomorphism.
- `2 × 2` trick for `u = id_A`: the map `[[a, b], [c, d]] ↦ [[a, b], [c, d]]` on the Paulsen
  system is a star homomorphism, hence completely positive, as the trick asserts for complete
  contractions.

*Needs:* §3.1–§3.2, §4.2; VonNeumannAlgebras V13a (Arveson extension).

### Examples

- The GNS triple as a Stinespring dilation, and the Choi matrices of the transpose, the identity
  and the completely depolarizing map (§§4.2–4.3).
- The multiplicative domain of a compression and of the trace state (§4.1).

### Dependencies

VonNeumannAlgebras V0, V13a; Mathlib `CompletelyPositiveMap`, `CStarMatrix`,
`ContinuousLinearMap.adjoint`. Within this roadmap: Layer 3; §1.4.

## Layer 5: C*-tensor products and operator-space tensor products

### 5.1 The maximal C*-norm and the comparison of C*-norms (C5.1)

Consume VonNeumannAlgebras V13b.SpatialNorm for the spatial norm `‖·‖_min` on `A ⊙ B`, its
C*-property, its representation independence, the slice maps `R_ψ`, `L_φ` and the isometric
functoriality for inclusions; `A ⊗min B` is its completion. Construct here the maximal norm as the
supremum over pairs of commuting star representations `π, ρ` on a common Hilbert space of
`‖Σ π(a_i)ρ(b_i)‖` (Blackadar II.9.2.1–II.9.2.3): prove finiteness (`≤ Σ ‖a_i‖‖b_i‖`),
nondegeneracy, the C*-identity, the universal property of `A ⊗max B` for commuting pairs of
representations, and `‖·‖_min ≤ ‖·‖_max`. Prove that every C*-norm on `A ⊙ B` lies between the
two and is a cross norm (Blackadar II.9.5.1–II.9.5.2). Include units and unitizations,
associativity, flip, distributivity over finite direct sums, functoriality with its norm bounds
(Blackadar II.9.2.5–II.9.2.6, II.9.6.1). State the inclusion and exactness properties separately:
spatial tensor products inject under inclusions (V13b.SpatialNorm), maximal tensor products
preserve quotient exact sequences (Blackadar II.9.6.6).

**Checks.**

- `M_n ⊙ A` has a unique C*-norm and `M_n ⊗ A = M_n(A)` (Blackadar II.9.4.2); both norms of
  `Σ E_{ij} ⊗ a_{ij}` are the `CStarMatrix` norm of `[a_{ij}]`.
- `C(X) ⊙ C(Y)`: `‖·‖_min = ‖·‖_max` and the completion is `C(X × Y)` (Blackadar II.9.4.4); for
  `f ⊗ g` both norms are `‖f‖‖g‖`.
- `C*(F₂) ⊙ C*(F₂)`: `‖·‖_min ≠ ‖·‖_max` (Blackadar II.9.4.6); a definition of the maximal norm as
  a supremum over non-commuting pairs would not even give a seminorm on `A ⊙ B`.

*Needs:* VonNeumannAlgebras V13b.SpatialNorm, V0, V2; §1.4; §4.2.

### 5.2 Tensoring maps and functionals; concrete identifications (C5.2)

Prove that completely positive maps tensor to completely positive maps on both completions, with
the product norm bound (Blackadar II.9.7.2–II.9.7.3). For arbitrary bounded functionals `φ, ψ`
construct `φ ⊗ ψ` on `A ⊗min B` and prove `‖φ ⊗ ψ‖ = ‖φ‖‖ψ‖`, using the bidual polar
decomposition and spatial representation for the upper bound and simple tensors for the lower
bound; include zero functionals and naturality. Prove the matrix identification
`M_n ⊗ A ≅ M_n(A)`. Identify `C₀(X) ⊗min A` with `C₀(X, A)` for locally compact Hausdorff `X`,
supplying the vector-valued continuous-function and density bridge (Blackadar II.9.4.4), and in
particular `C(X) ⊗min C(Y) ≅ C(X × Y)`, `f ⊗ g ↦ ((x,y) ↦ f(x)g(y))`, with star, norm, unit and
pullback naturality, by Stone–Weierstrass density. Identify the spatial completion of
`K(H) ⊙ K(K)` with `K(H ⊗₂ K)`. Relate the C*-tensor inclusion in representations to the spatial
von Neumann tensor product of V2.

**Checks.**

- Product states: for states `φ, ψ` the functional `φ ⊗ ψ` is a state, so `‖φ ⊗ ψ‖ = 1 = ‖φ‖‖ψ‖`.
- `φ = ψ = δ_x − δ_y` on `C(X)`, `x ≠ y`: `‖φ‖ = 2` and `φ ⊗ ψ = δ_{(x,x)} − δ_{(x,y)} − δ_{(y,x)} + δ_{(y,y)}`
  on `C(X × X)` has norm `4`, attained at a function taking the values `1, −1, −1, 1` at the four
  points.
- `K(H) ⊙ K(K) → K(H ⊗₂ K)`: a tensor of rank-one operators is rank one, and `φ ⊗ 0 = 0` for
  every `φ`, with norm `‖φ‖·0`.

*Needs:* §5.1; VonNeumannAlgebras V2, V4 (polar decomposition in the bidual); Mathlib
`C₀(X, A)`.

### 5.3 Operator-space tensor products (C5.3)

For arbitrary operator spaces construct the minimal (injective) tensor norm by concrete spatial
realization and prove independence and injectivity. Construct the operator-space projective
tensor product with `‖z‖_∧ = inf ‖α‖‖x‖‖y‖‖β‖` over factorizations `z = α(x ⊗ y)β` with
`x ∈ M_p(E)`, `y ∈ M_q(F)` and scalar `α ∈ M_{n,pq}`, `β ∈ M_{pq,n}` at level `n`, giving the
indexing and shuffle maps explicitly (Blecher–Paulsen 1991). Prove the norm axioms, completion,
associativity, flip, functoriality and complete quotient property, and identify its dual with
`CB(E, F*)`. Its universal bilinear maps are jointly completely bounded: the matrices
`[u(x_{ij}, y_{kl})]_{(i,k),(j,l)}` are bounded by `C‖x‖‖y‖`; prove the linearization and the
equality of norms at every matrix level. Construct the Haagerup tensor product with
`‖z‖_h = inf ‖x‖‖y‖` over `z_{ij} = Σ_k x_{ik} ⊗ y_{kj}`, `x ∈ M_{n,r}(E)`, `y ∈ M_{r,n}(F)`,
which at level one in concrete realizations is `inf ‖Σ a_i a_i*‖^{1/2}‖Σ b_i* b_i‖^{1/2}` (Pisier,
Grothendieck's theorem, §14 and Theorem 14.1; Pisier, Similarity problems, Chapter 5). Prove the
matrix norm axioms, associativity, functoriality, injectivity under complete isometries and
preservation of complete quotients. Its universal bilinear maps satisfy the multiplicative
amplification bound `‖[Σ_k u(x_{ik}, y_{kj})]‖ ≤ C‖x‖‖y‖`, distinct from the jointly completely
bounded condition. Prove the common-Hilbert-space product representation and the completely
bounded factorization interpretation using Layer 4, construct the canonical complete contractions
`E ⊗∧ F → E ⊗h F → E ⊗min F`, and compute `C_n ⊗h R_n ≅ M_n` with the operator norm and
`R_n ⊗h C_n ≅ S₁^n` with its dual operator-space structure. These products are not symmetric.

**Checks.**

- `z = Σ_i e_i ⊗ e_i* ∈ C_n ⊗ R_n`: `‖z‖_h = ‖1_{M_n}‖ = 1 = ‖z‖_min`, while
  `(C_n ⊗∧ R_n)* = CB(C_n, C_n) = M_n` makes `C_n ⊗∧ R_n = S₁^n` and `‖z‖_∧ = tr(1) = n`; so
  `⊗∧ ≠ ⊗h` already here.
- `z′ = Σ_i e_i* ⊗ e_i ∈ R_n ⊗ C_n`: `‖z′‖_h = n` (the trace norm of `1`), while the concrete
  realization `Σ E_{1i} ⊗ E_{i1}` has `z′z′* = E_{11} ⊗ 1`, so `‖z′‖_min = 1`; so `⊗h ≠ ⊗min`,
  and comparing with the previous bullet `⊗h` is not symmetric.
- `E = ℂ`: all three products return `F` itself with its own matrix norms.

*Needs:* §3.1–§3.3, §4.4; BanachSpaceTheory B4 (comparison with Banach tensor norms).

### 5.4 Direct sums, products, inductive limits and the universal unitary algebra (C5.4)

Supply the analytic constructions used by the approximation layers: finite direct sums, `c₀`
direct sums, bounded products and their closed-ideal quotients (Blackadar II.8.1), and
C*-inductive limits of directed systems of star homomorphisms, including noninjective connecting
maps (Blackadar II.8.2), with their universal properties, canonical maps, norm formulas and dense
union and range criteria. For a family `(A_i)` pin the bounded product to `lp (fun i ↦ A_i) ∞` and
the `c₀` ideal to its subspace of families whose coordinate norms tend to `0` along the cofinite
filter; prove the closed-ideal property from the uniform norm bound, with pointwise products and
star and the induced quotient norm `limsup_i ‖a_i‖`. Build the universal unital C*-algebra on
countably many unitary generators, `C*(F_∞)`, from the supremum over unitary representations
(Blackadar II.8.3.1–II.8.3.2), and prove its universal property and separability; it is the test
object of Layer 7, and OperatorAlgebraDynamics D1 identifies it with the full free-group algebra.

**Checks.**

- `∏_n M_n / ⊕_n M_n` is a nonzero unital C*-algebra: the constant family `(1_n)` is its unit,
  and `(a_n)` with `‖a_n‖ = 1` for all `n` has quotient norm `1`, while `(a_n/n)` has quotient norm
  `0`.
- The inductive limit of `M_{2^n}` with the unital embeddings `a ↦ a ⊗ 1₂` is the CAR algebra;
  it is simple because each stage is simple (Blackadar II.8.2.5), and it is separable.
- `C*(F_∞)` is separable (generated by countably many elements) and its universal property
  sends the generators to any sequence of unitaries of a unital C*-algebra; a definition through
  a single representation would lose the universal property.

*Needs:* Mathlib `lp`; §1.3 (ideals and quotients).

### 5.5 Paths, cones, suspensions, mapping cones and homotopies (C5.5)

Construct the path algebra `PA = C([0,1], A)`, the cone `CA = C₀((0,1], A)` and the suspension
`SA = C₀((0,1), A)` with supremum norm and pointwise star operations (Blackadar II.5.5.10);
prove completeness, endpoint evaluation, ideal and quotient identifications, functoriality,
tensor comparisons and cone contraction (Blackadar II.5.5.11). View cone functions as paths
vanishing at `0`; the cone quotient is evaluation at `1`. For a star homomorphism `φ : A → B`
construct the mapping cone `C_φ = {(a, f) ∈ A × CB : φ(a) = f(1)}` as a closed pullback
C*-algebra; prove its pullback universal property, functoriality for commuting squares, and the
extension `0 → SB → C_φ → A → 0` with inclusion `g ↦ (0, g)` and projection `(a, f) ↦ a`;
prove surjectivity with `f(t) = tφ(a)` and give the completely positive contractive section
`a ↦ (a, tφ(a))`. Construct homotopies of star homomorphisms as maps into `PB` with evaluation,
composition and concatenation APIs. For a homotopy `Φ : A → PB` construct `C_Φ` and its endpoint
maps to `C_{ev₀Φ}` and `C_{ev₁Φ}`, and prove them homotopy equivalences by path rescaling and
concatenation, so that homotopic homomorphisms have homotopy-equivalent mapping cones.
OperatorKTheory K2 consumes these constructions independently of Layer 9.

**Checks.**

- `CA` is contractible through `φ_t(f)(s) = f(s − t)` for `s > t` and `0` otherwise; `SA ⊆ CA` is
  subcontractible, and `Sℂ = C₀(ℝ)` is not contractible (Blackadar II.5.5.11).
- `C_{id_A} ≅ {f ∈ C([0,1], A) : f(0) = 0} = CA` is contractible, while `C_0 = A ⊕ SB` for the zero
  map `0 : A → B`; the two differ already for `A = B = ℂ`.
- The section `a ↦ (a, tφ(a))` is completely positive and contractive but not multiplicative:
  `(a, tφ(a))(b, tφ(b)) = (ab, t²φ(ab)) ≠ (ab, tφ(ab))` unless `φ(ab) = 0`.

*Needs:* Mathlib `C(X, A)`, `C₀(X, A)`; §1.3.

### Examples

- `M_n ⊗ A = M_n(A)`, `C(X) ⊗ C(Y) = C(X × Y)` and the two-norm algebra `C*(F₂) ⊙ C*(F₂)`
  (§5.1).
- The three norms of `Σ e_i ⊗ e_i*` on `C_n ⊗ R_n` (§5.3).
- The CAR algebra as an inductive limit and `∏ M_n / ⊕ M_n` (§5.4).

### Dependencies

VonNeumannAlgebras V0, V2, V4, V13b.SpatialNorm; BanachSpaceTheory B4; Mathlib `lp`,
`C(X, A)`, `C₀(X, A)`. Within this roadmap: Layers 1, 3 and 4.

## Layer 6: nuclearity, the bidual and Banach amenability

### 6.1 Nuclear maps and nuclear algebras (C6.1)

Define a completely positive contraction `φ : A → B` to be nuclear when it is a point-norm limit
of composites `A → M_{n_i} → B` of completely positive contractions (Blackadar IV.3.1.4). Give
the finite-set/`ε` formulation, the passage between nets and that formulation, unitization,
composition, matrix amplification and point-norm closure properties. For a general bounded
completely positive map use positive scalar multiples of nuclear contractions and prove
independence of the scaling. `A` is nuclear when `id_A` is nuclear. Distinguish this notion
from nuclear Banach-space operators and from the Banach-space approximation property.
`Suggested.lean` defines the finite-set form as `IsNuclearContraction`.

**Checks.**

- A finite-dimensional C*-algebra `⊕_i M_{n_i}` is nuclear: it embeds unitally in `M_N`,
  `N = Σ n_i`, and the conditional expectation back is a completely positive contraction, so the
  identity factors exactly through one matrix algebra.
- `B(ℓ²)` is not nuclear (Blackadar IV.3.4.4; Pisier, Grothendieck's theorem, Remark 12.8), so
  the identity of `B(ℓ²)` is not a nuclear map although every compression `a ↦ P_n a P_n` is.
- The identity of `C[0,1]` is a nuclear completely positive map (Blackadar II.9.4.4) but not a
  nuclear operator in the Banach-space sense, which no identity of an infinite-dimensional space
  is; the zero map is nuclear through `n = 0`, and a map is nuclear exactly when its
  normalization by `‖φ‖` is a nuclear contraction.

*Needs:* §4.1; Mathlib `CStarMatrix`, `CompletelyPositiveMap`.

### 6.2 The equivalent characterizations of nuclearity (C6.2)

Prove that the following are equivalent for every C*-algebra `A` (Blackadar IV.3.1.5,
IV.3.1.6, IV.3.1.12; Pisier, Grothendieck's theorem, Theorems 12.3–12.4):

- `A` has the completely positive approximation property of §6.1;
- the identity of `A` is a point-norm limit of finite-rank completely positive contractions, with
  no matrix factorization imposed;
- for every C*-algebra `B` the canonical map `A ⊗max B → A ⊗min B` is an isomorphism,
  equivalently `A ⊙ B` has a unique C*-cross norm;
- `A**` is semidiscrete, equivalently injective, by VonNeumannAlgebras V13b;
- `A` is amenable as a Banach algebra in the sense of BanachAlgebras A6.

Build the connecting tools as targets. Prove the tensor-extension argument turning nuclear
completely positive factorizations into min-to-max continuity (Blackadar IV.3.1.8). For the
converse construct the matrix factorizations by completely positive extension and separation,
consuming V13b's commuting-representation minimal-norm criterion and its normal completely
positive and predual approximation equivalents (the route of Blackadar IV.3.1.6 and the proof
sketch following it, due to Choi–Effros and Kirchberg). Develop dual completely positive pairings
and the point-weak-star approximation on `A*`, then the passage between approximations of `A`,
`A*` and `A**`; convexity and Kaplansky density yield the point-norm conclusion. Keep the normal
maps of the semidiscreteness definition distinct from arbitrary completely positive extensions.

**Checks.**

- `C₀(X)` is nuclear (Blackadar II.9.4.4), amenable (Blackadar IV.3.3.10) and has commutative,
  hence injective, bidual; the three characterizations agree on it.
- `C*(F₂)` and `C*_r(F₂)` are not nuclear (Blackadar II.9.4.6); `C*_r(F₂)` is not amenable, as
  `C*_r(G)` is nuclear iff `G` is amenable (Pisier, Grothendieck's theorem, §12, citing Lance);
  a wrong equivalence would have to make `A ⊙ A` single-normed for one of them.
- `K(H)`: the compressions `a ↦ P_n a P_n ∈ M_n` and the inclusions `M_n → K(H)` are completely
  positive contractions whose composites converge in point norm to the identity, and the min and
  max norms on `K(H) ⊙ B` agree for every `B`.

*Needs:* §5.1, §5.2, §6.1; VonNeumannAlgebras V13b, V1 (Kaplansky), V4; BanachSpaceTheory
B1–B2; BanachAlgebras A6.

### 6.3 Haagerup's Grothendieck inequality and normal virtual diagonals (C6.3)

For the amenability bridge develop bounded bilinear forms on C*-algebras, their weak compactness
and their separately weak-star continuous extensions to the biduals. Prove the noncommutative
Grothendieck inequality: for a bounded bilinear form `u` on nonzero unital C*-algebras `A × B`
there are states `f₁, f₂` on `A` and `g₁, g₂` on `B` with
`|u(a,b)| ≤ ‖u‖ (f₁(a*a) + f₂(aa*))^{1/2} (g₁(b*b) + g₂(bb*))^{1/2}` (Haagerup 1985, Theorem 1.1;
Pisier, Grothendieck's theorem past and present, Theorem 7.1), the square roots being those of
the nonnegative real values of the functionals; give the nonunital version through unitization
and prove the Hilbert-space factorization and weak-compactness consequences used for the bidual
extension. `Suggested.lean` states the unital form as `haagerup_grothendieck`.

Define the space `V` of separately normal bounded bilinear forms on a W*-algebra `M`, its dual
bimodule `V*` and the multiplication map `V* → M`. A normal virtual diagonal is an `N ∈ V*`
commuting with every `a ∈ M` and satisfying `N((x,y) ↦ ω(xy)) = ω(1)` for each normal functional
`ω`. Prove the normal-virtual-diagonal criterion for injectivity, construct the diagonal from the
injective/semidiscrete structure, and transfer it to a Banach virtual diagonal of `A` through the
bidual extension of bilinear forms; prove the converse transfer from a Banach virtual diagonal
and the expectation criterion (Haagerup 1983, §§2–3; Runde, Chapter 6; Blackadar
IV.3.3.12–IV.3.3.15).

Include the analytic construction of the normal diagonal. Write `V_h ⊆ V` for the forms
continuous for the Haagerup norm of §5.3, with its norm. Construct a faithful normal
representation of `M` in which every normal state is a vector state, by amplifying any faithful
normal representation by `ℓ²(ℕ)` and using V4's countable vector-functional decomposition. In
that representation extend `x ⊗ y ↦ (T ↦ xTy)` to the isometric bimodule identification of
`V_h*` with the bounded `M′`-bimodule maps on `B(H)`, consuming V13b's commutant-injectivity
theorem and V10–V11's standard form for its representation comparison. For nonzero `M` an
expectation onto `M′` yields a central element of `V_h*` of norm one with multiplication equal to
`1`; for `M = 0` use the zero diagonal. Construct an `M`-bimodule map `θ : V_h* → V*`
intertwining the multiplication maps, of norm at most `2` in the finite case (V5's center-valued
trace and unitary averages) and at most `1` in the properly infinite case (a countable sequence
of pairwise orthogonal projections equivalent to `1` and implementing partial isometries, the
projections tending ultraweakly to zero), and combine the finite and properly infinite central
summands by V5's halving and central decomposition into a normal virtual diagonal of norm at most
`2`. Supply the normal-state factorization of Haagerup-bounded forms, the vector-functional dual
pairing and the weak-star limit arguments these maps need; a diagonal lies in the dual of the
form space.

**Checks.**

- `M = ℂ`: `V = ℂ` through `u ↦ u(1,1)`, and `N = 1 ∈ V*` is the normal virtual diagonal:
  `N((x,y) ↦ ω(xy)) = ω(1)`.
- `M = M_n`: `N(u) = (1/n) Σ_{ij} u(E_{ij}, E_{ji})` is a normal virtual diagonal, since
  `(1/n) Σ_{ij} ω(E_{ij}E_{ji}) = (1/n) Σ_i ω(E_{ii}) = ω(1)` and `N` commutes with every matrix; the
  normalization `1/n` is forced by the unit condition, so `Σ_{ij} u(E_{ij}, E_{ji})` itself is not a
  diagonal for `n ≥ 2`.
- `M = 0`: `V = 0`, the zero element is the diagonal, and the unit condition reads `0 = ω(0)`.
- Grothendieck for `u(a,b) = ω(ab)` with `ω` a state of `A = B`: `|ω(ab)| ≤ ω(aa*)^{1/2}ω(b*b)^{1/2}`
  by Cauchy–Schwarz, so `f₂ = g₁ = ω` and `‖u‖ = 1` witness the inequality with the other two
  states arbitrary. For `u = 0` every choice works, and the zero algebra is excluded by the
  nontriviality hypothesis because it has no state.

*Needs:* §5.3 (Haagerup norm); VonNeumannAlgebras V4, V5, V10–V11, V13b; BanachAlgebras A6;
BanachSpaceTheory B1–B2.

### 6.4 Normal dual bimodules and Connes amenability (C6.4)

Define normal dual Banach bimodules over a W*-algebra `M`: the actions are weak-star continuous
in the module variable and each orbit map from `M` is weak-star continuous. Develop bounded
weak-star continuous derivations and prove the equivalent Connes-amenability formulation: every
such derivation from `M` is inner iff `M` has a normal virtual diagonal (Runde, Chapter 6;
Blackadar IV.3.3.2). Reuse A6's bimodule and universal-derivation constructions with these
continuity conditions. Handle nonunital `A` by its unitization and its contractive approximate
unit. These constructions prove the amenability equivalence of §6.2; they are not extra
hypotheses on nuclear algebras.

**Checks.**

- `M = ℂ`: every derivation vanishes on `1` and hence everywhere, so `ℂ` is Connes-amenable
  with the diagonal of §6.3.
- `M` itself, as the dual of `M_*` with multiplication as the actions, is a normal dual
  bimodule; `M*` with the actions `(a·φ)(y) = φ(ya)` is a dual bimodule that is not normal in
  general, since `a ↦ φ(ya)` is weak-star continuous only for normal `φ`, so the two notions of
  amenability differ.
- `B(ℓ²)` is Connes-amenable (it is injective) but not amenable as a Banach algebra, since it is
  not nuclear (§6.1); the weak-star continuity restriction on derivations is essential.

*Needs:* §6.3; BanachAlgebras A6; VonNeumannAlgebras V4.

### 6.5 Permanence and explicit approximations (C6.5)

Prove that nuclearity is invariant under star isomorphism, unitization, matrix amplification and
stabilization by `K(ℓ²)`; passes to closed ideals (Blackadar II.9.6.3), hereditary subalgebras
(IV.3.1.14) and quotients (IV.3.1.13); and is preserved by extensions (IV.3.1.3), directed
inductive limits (IV.3.1.9–IV.3.1.10) and minimal tensor products (IV.3.1.1). An extension is
nuclear iff its ideal and quotient are nuclear. Give the compression, ideal approximate-unit and
quotient/bidual arguments. Produce explicit completely positive approximations for
finite-dimensional algebras, `C₀(X)`, `K(H)` and inductive limits of finite-dimensional algebras.
Deduce the metric approximation property for `A` and `A*` from the dual approximation criteria of
§6.2.

**Checks.**

- The Toeplitz extension `0 → K(ℓ²) → T → C(𝕋) → 0` of §8.4 is nuclear, as ideal and quotient
  are.
- Nuclearity does not pass to C*-subalgebras: every separable exact C*-algebra is a subalgebra of
  a nuclear one (Blackadar IV.3.4.19), and exact non-nuclear separable algebras exist (Blackadar
  II.9.6.6 end: "not every exact C*-algebra is nuclear"); so the permanence list must not contain
  subalgebras.
- `C₀(X)`: for a finite open cover by relatively compact sets with partition of unity `(h_i)`
  and points `x_i`, `f ↦ (f(x_i))_i ∈ ℓ^∞_k ⊆ M_k` and `(λ_i) ↦ Σ λ_i h_i` are completely positive
  contractions whose composite is within `ε` of `f` on a given finite set; `K(H)`: compressions to
  `P_nH` and inclusions.

*Needs:* §6.1–§6.2; §5.1, §5.4; §2.8.

### Examples

- `C₀(X)`, `K(H)`, finite-dimensional and AF algebras as nuclear algebras with explicit
  factorizations; `C*(F₂)`, `C*_r(F₂)` and `B(ℓ²)` as non-nuclear algebras (§§6.1–6.2, 6.5).
- The normal virtual diagonals of `ℂ` and `M_n` (§6.3).

### Dependencies

VonNeumannAlgebras V1, V4, V5, V10–V11, V13b; BanachAlgebras A6; BanachSpaceTheory B1–B2, B4;
Mathlib `CompletelyPositiveMap`, `PositiveContinuousLinearMap`. Within this roadmap: Layers 2, 4
and 5.

## Layer 7: exactness, lifting and weak expectation

### 7.1 Exactness (C7.1)

Define `A` to be exact when tensoring every closed-ideal sequence `0 → J → B → B/J → 0` with
`A ⊗min −` leaves it exact (Blackadar II.9.6.6). Develop the kernel and quotient-norm
formulations (Blackadar IV.3.4.1–IV.3.4.2), unitization and matrix variants, and prove that
nuclear algebras are exact. Prove Kirchberg's local characterization: `A` is exact iff for each
finite-dimensional operator subspace `E ⊆ A` and `ε > 0` there is a linear isomorphism `u`
of `E` onto a subspace of some `M_n` with `‖u‖_cb‖u⁻¹‖_cb < 1 + ε`; include the
finite-dimensional operator-space compactness and perturbation lemmas connecting this condition
to tensor exactness. Prove that `A` is exact iff a faithful representation `A → B(H)` is nuclear
as a completely positive map, with independence of the faithful representation (nuclear
embeddability, Blackadar IV.3.4.16 and IV.3.4.18); the approximating maps return to `B(H)`, not
to `A`, which is the distinction from nuclearity. Prove permanence under C*-subalgebras
(Blackadar IV.3.4.3), closed ideals, minimal tensor products and directed inductive limits with
injective connecting maps (IV.3.4.5). Layer 9 proves quotient permanence and the general
inductive-limit result. For extensions prove exactness under a local completely positive
splitting hypothesis, in particular when the quotient is nuclear, using the liftings of §7.2
(Blackadar IV.3.4.21 and IV.3.2.10; Kirchberg 1993); unconditional permanence under extensions
is false and is not asserted.

**Checks.**

- `C*(F₂)` is not exact: tensoring `0 → J → C*(F₂) → C*_r(F₂) → 0` with `C*(F₂) ⊗min −` is not
  exact (Blackadar II.9.6.6 end, from II.9.4.6); hence `B(ℓ²)`, which contains it, is not exact.
- The kernel formulation: `A` is exact iff for every `B` and `J` the kernel of
  `A ⊗min B → A ⊗min (B/J)` is `A ⊗min J`; one inclusion always holds, and the maximal tensor
  product satisfies the equality for every `A` (Blackadar II.9.6.6).
- `E = span(1) ⊆ A`: `u : E → M_1` sending `1 ↦ 1` has `‖u‖_cb‖u⁻¹‖_cb = 1`, so the local
  condition is vacuous for one-dimensional subspaces; since `C*(F₂)` is not exact, it fails the
  condition on some finite-dimensional subspace for some `ε`.

*Needs:* §5.1–§5.2, §6.1–§6.2; §3.2; VonNeumannAlgebras V13b.SpatialNorm.

### 7.2 Completely positive liftings and the Choi–Effros theorem (C7.2)

For a quotient map `q : B → B/J` define a completely positive contractive lifting of
`φ : A → B/J` as a completely positive contraction `ψ : A → B` with `qψ = φ`. Prove
matrix-domain lifting (Blackadar IV.3.2.16–IV.3.2.17) and the perturbation lemma adjusting one
lifting to stay close to another on a prescribed finite set (IV.3.2.13), using quasicentral
approximate units. Prove the Choi–Effros theorem: every nuclear completely positive contraction
from a separable C*-algebra admits a lifting, with the unital version in the unital setting
(Blackadar IV.3.2.3–IV.3.2.4); thus extensions with separable nuclear quotient are semisplit
(IV.3.2.5). Without separability prove finite-set approximate liftings for nuclear quotients
(IV.3.2.10). Use `0 → c₀ → ℓ^∞ → ℓ^∞/c₀ → 0` to show that the separability hypothesis of the
global theorem cannot be dropped (IV.3.2.9). Prove Phillips's lemma: bounded finitely additive
complex measures `μ_n` on `ℕ` with a uniform total-variation bound and `μ_n(E) → 0` for every
`E ⊆ ℕ` satisfy `Σ_k |μ_n({k})| → 0` (Phillips 1940, Lemma 3.3); deduce that `c₀` is not
complemented in `ℓ^∞`, since a bounded projection `P` onto `c₀` would give
`μ_n(E) = (P1_E)_n` with singleton masses `δ_{nk}`. `Suggested.lean` states
`choi_effros_lifting` with the quotient given as a surjective star homomorphism.

**Checks.**

- The identity of `ℓ^∞/c₀` has no completely positive contractive lifting `ψ` to `ℓ^∞`: the
  idempotent `ψ ∘ q` has kernel `c₀`, so `1 − ψ ∘ q` would be a bounded projection onto `c₀`;
  `ℓ^∞/c₀` is nuclear but not separable, so only the separability hypothesis fails.
- `n = 1`: a completely positive contraction `ℂ → B/J` is `λ ↦ λb` with `0 ≤ b`, `‖b‖ ≤ 1`, and
  §1.3's positive contractive lifts supply the lifting; a wrong statement without the contraction
  requirement would be the trivial lifting of elements.
- Phillips: `μ_n = δ_n` has `μ_n(ℕ) = 1` for all `n`, so it does not satisfy the hypothesis, and
  indeed `Σ_k |μ_n({k})| = 1`; for a putative projection `P` onto `c₀` the measures
  `μ_n(E) = (P1_E)_n` do satisfy it, since `P1_E ∈ c₀`, with total variation at most `‖P‖`.

*Needs:* §1.3, §1.4 (quasicentral units), §6.1, §4.3; BanachSpaceTheory B1.

### 7.3 WEP and LLP (C7.3)

For WEP and LLP use nonzero unital algebras and proper quotient ideals. Define the local lifting
property: every unital completely positive map `A → B/J`, with `B` unital, restricts on each
finite-dimensional operator subsystem `E ⊆ A` to a unital completely positive map `E → B`
lifting that restriction. Define the weak expectation property by a faithful unital
representation `A ⊆ B(H)` and a unital completely positive map `B(H) → A**` extending the
inclusion of `A` (Pisier, Grothendieck's theorem, Definition 12.6 and the remark after it).
Prove representation independence, the relative weak-injectivity criterion in larger unital
C*-algebras (Ozawa, Theorem 3.3), and invariance under unital star isomorphism. Prove that
separable `A` has LLP iff every unital completely positive map into the Calkin algebra lifts
(Ozawa, Proposition 3.13).

**Checks.**

- `B(H)` has WEP through the identity map; every nuclear algebra has WEP and LLP, by §6.2 and
  the Choi–Effros theorem.
- `C*(F_∞)` has LLP, indeed the lifting property for all unital completely positive maps (Ozawa,
  Theorem 3.8).
- `A = M_n`: `A** = A`, and for any faithful unital representation `M_n ⊆ B(H)` a conditional
  expectation `B(H) → M_n` is a weak expectation; for the amplification `a ↦ a ⊗ 1_k` it is the
  normalized partial trace over the second factor.

*Needs:* §2.8 (`A**`), §3.1, §7.2; VonNeumannAlgebras V13a.

### 7.4 Kirchberg's tensor characterizations (C7.4)

Prove Kirchberg's tensor characterizations, the maps being the canonical algebraic
identifications (Ozawa, Theorem 3.14 and Corollary 3.17; Pisier, Grothendieck's theorem,
Theorems 12.5 and 12.7):

- `A` has LLP iff `A ⊗min B(ℓ²(ℕ)) = A ⊗max B(ℓ²(ℕ))`;
- `A` has WEP iff `A ⊗min C*(F_∞) = A ⊗max C*(F_∞)`;
- if `A` has LLP and `B` has WEP, then min and max agree on `A ⊙ B`;
- `A` is nuclear iff it is exact and has WEP (Ozawa, p. 27: exact algebras are locally reflexive
  and locally reflexive algebras with WEP are nuclear).

Develop the finite-dimensional subsystem duality, the local lifting/tensor continuity
equivalences (Ozawa, Theorem 3.6) and the extension arguments in these proofs. Prove that
`C*(F_∞)` has LLP and `B(H)` has WEP, and that `C*(F_∞) ⊗min B(ℓ²) = C*(F_∞) ⊗max B(ℓ²)`.
Retain the unital conventions throughout and give the unitization formulation for nonunital
algebras. No universal assertion of WEP or QWEP is a target.

**Checks.**

- `B(ℓ²)` has WEP but not LLP: `B(ℓ²) ⊗min B(ℓ²) ≠ B(ℓ²) ⊗max B(ℓ²)` (Pisier, Grothendieck's
  theorem, Remark 12.8), which the third bullet would forbid if `B(ℓ²)` had LLP.
- A nuclear `A` has both properties and min = max against every `B`, consistent with the third
  bullet in both roles.
- Whether `C*(F_∞)` has WEP is Kirchberg's QWEP problem (Pisier, Problem 12.9); no target here
  decides it, and the first two bullets are the only statements about `C*(F_∞)` claimed.

*Needs:* §5.1, §7.1–§7.3; §2.8.

### Examples

- `0 → c₀ → ℓ^∞ → ℓ^∞/c₀ → 0`: nuclear quotient, no completely positive splitting (§7.2).
- `C*(F₂)` and `B(ℓ²)` as non-exact algebras; `C*(F_∞)` and `B(ℓ²)` as the test objects of the
  LLP and WEP characterizations (§§7.1, 7.4).

### Dependencies

VonNeumannAlgebras V13a, V13b.SpatialNorm, V13b; BanachSpaceTheory B1; Mathlib
`CompletelyPositiveMap`, `TopologicalSpace.SeparableSpace`. Within this roadmap: Layers 1–6.

## Layer 8: quasidiagonality and representation approximation

### 8.1 Quasidiagonal sets of operators and quasidiagonal algebras (C8.1)

A set `Ω ⊆ B(H)` is quasidiagonal if for every finite `F ⊆ Ω`, finite `X ⊆ H` and `ε > 0` there
is a finite-rank projection `P` with `‖[P, T]‖ < ε` for `T ∈ F` and `‖Pξ − ξ‖ < ε` for `ξ ∈ X`
(Blackadar V.4.1.6); `Suggested.lean` defines this as `IsQuasidiagonalSet`. For norm-separable
`Ω` on separable `H` prove the equivalence with an increasing sequence of finite-rank projections
`P_n → 1` strongly and `‖[P_n, T]‖ → 0` for every `T ∈ Ω` (Blackadar V.4.1.5). Develop the net
formulation, direct sums, amplifications and compact perturbations (Blackadar V.4.1.4,
V.4.1.9–V.4.1.10). Distinguish restriction to a reducing subspace from these permanence results:
quasidiagonality of a representation need not pass to a reducing summand. A separable C*-algebra
is quasidiagonal if it has a faithful quasidiagonal representation (Blackadar V.4.2.1);
`Suggested.lean` defines `IsQuasidiagonal` by the existence of a faithful representation with
quasidiagonal image. A faithful representation is essential when its image meets `K(H)` only in
`0`.

**Checks.**

- `K(H)` and every set of compact operators is quasidiagonal: the finite-rank projections of
  an approximate unit almost commute with any compact operator and almost fix any finite set of
  vectors.
- The unilateral shift `S` is not quasidiagonal, since a quasidiagonal isometry is unitary
  (Blackadar V.4.1.11); `S ⊕ S*` is a rank-one perturbation of the bilateral shift, a unitary,
  hence quasidiagonal, although its reducing summand `S` is not.
- On the zero Hilbert space every set is quasidiagonal with `P = 0`; the empty set and `{0}` are
  quasidiagonal on every `H`; a definition without the vector condition `‖Pξ − ξ‖ < ε` would be
  satisfied by `P = 0` everywhere.

*Needs:* Mathlib `IsStarProjection`, `IsCompactOperator`; VonNeumannAlgebras V1 (strong
convergence).

### 8.2 Voiculescu's noncommutative Weyl–von Neumann theorem (C8.2)

Prove Voiculescu's theorem in the form needed for representation independence: if `A` is
separable unital, `π : A → B(H)` is a faithful unital essential representation on separable `H`,
and `ρ : A → B(K)` is any unital representation on separable `K`, then there are unitaries
`U_n : H → H ⊕ K` with `U_n π(a) U_n* − (π(a) ⊕ ρ(a))` compact and tending to zero in norm for
every `a` (Blackadar II.8.4.29 gives the form with two faithful essential representations;
absorbing `ρ` is the standard corollary). Develop the finite-set isometry and compression
approximations, the orthogonal summand selection and the absorption argument. Deduce that
quasidiagonality of a separable algebra can be tested in any faithful essential representation
(Blackadar V.4.2.3). `Suggested.lean` states `voiculescu_weyl_von_neumann` on the Hilbert direct
sum `WithLp 2 (H × K)`, with `directSumOperator` and `conjugate` as the two operator constructions.

**Checks.**

- `A = ℂ`: an essential unital representation forces `H = 0` or `H` infinite-dimensional; for
  `H = ℓ²` and any separable `K`, any unitary `U : ℓ² → ℓ² ⊕ K` works since `π(λ) = λ·1` and the
  difference is `0`.
- `A = C(𝕋)`, `π` multiplication on `L²(𝕋)`, `ρ` evaluation at `1` on `K = ℂ`: the theorem
  says that adding the eigenvalue `f(1)` to `M_f` is a compact perturbation that is small in norm,
  the classical Weyl–von Neumann statement for the normal operator `M_z`.
- The essential hypothesis is needed: for `A = Unitization ℂ (K(ℓ²))` with `π = ρ` the defining
  representation, `a = e₀e₀*` has `Uπ(a)U*` of rank one and `π(a) ⊕ ρ(a)` of rank two; projections
  of different rank are at distance at least `1`, so no sequence of unitaries makes the difference
  tend to zero.

*Needs:* §8.1, §2.3; VonNeumannAlgebras V0; Mathlib `WithLp 2 (H × K)`, `LinearIsometryEquiv`.

### 8.3 The matrix-map criterion, permanence and stable finiteness (C8.3)

Prove the abstract criterion: a separable unital `A` is quasidiagonal iff it admits unital
completely positive maps `φ_n : A → M_{k_n}` with `‖φ_n(ab) − φ_n(a)φ_n(b)‖ → 0` and
`‖φ_n(a)‖ → ‖a‖` for all `a, b` (Blackadar V.4.2.14, in the finite-set form with
finite-dimensional targets; compress a quasidiagonal faithful representation by the `P_n` of
§8.1 for one direction and build a faithful representation on `⊕ ℂ^{k_n}` through the
quotient `∏ M_{k_n} / ⊕ M_{k_n}` of §5.4 for the other). Give the finite-set formulation and the
nonunital completely positive contractive version through unitization. Prove permanence under
C*-subalgebras and injective sequential inductive limits (Blackadar V.4.1.4, V.4.1.8), and that
finite-dimensional, commutative separable, compact-operator and separable AF algebras are
quasidiagonal (Blackadar V.4.2.4). Define stable finiteness by finiteness of every matrix
amplification of the unitization and prove that quasidiagonal algebras are stably finite
(Blackadar V.4.2.6). `Suggested.lean` states `isQuasidiagonal_iff_exists_matrix_maps`.

**Checks.**

- `A = C(𝕋)`: evaluation at the `n`-th roots of unity, `f ↦ diag(f(e^{2πik/n}))_k ∈ M_n`, is a
  unital star homomorphism, hence exactly multiplicative, and `max_k |f(e^{2πik/n})| → ‖f‖`. The
  compressions `φ_n(f) = P_n M_f P_n` of the multiplication representation on `L²(𝕋)` to
  `span(z^0, …, z^{n−1})` are not asymptotically multiplicative in norm, as
  `φ_n(z)φ_n(z̄) − φ_n(1) = −e₀e₀*` for every `n`; the maps of the criterion come from a
  quasidiagonal sequence of projections, not from an arbitrary faithful representation.
- The Toeplitz algebra of §8.4 is not quasidiagonal: it contains the non-unitary isometry `S`,
  so it is not finite, hence not stably finite; it is nevertheless nuclear.
- `A = 0` is quasidiagonal with `k_n = 0` and the zero maps, and the zero representation on the
  zero Hilbert space is faithful; the unitization `ℂ` of the zero algebra is quasidiagonal through
  `k_n = 1`.

*Needs:* §8.1–§8.2, §5.4, §4.1; Mathlib `CStarMatrix`.

### 8.4 The Toeplitz extension (C8.4)

Exhibit the unilateral shift algebra as the obstruction: with `ℓ² = lp (fun _ : ℕ ↦ ℂ) 2`, `S`
the forward shift `Sx(0) = 0`, `Sx(n+1) = x(n)`, `𝕋 = Circle` and `T = C*(S)` the Toeplitz
algebra, construct the extension `0 → K(ℓ²) → T → C(𝕋) → 0`, proving that `K(ℓ²) ⊆ T` is the
kernel of the symbol map and that the symbol of `S` is the coordinate function `z`. Deduce
nuclearity of `T` from §6.5 (extension of nuclear by nuclear) and non-quasidiagonality from §8.3.
ToeplitzOperators consumes this extension for its Hardy-space comparison; OperatorKTheory
consumes the symbol `z` and its index.

**Checks.**

- `S*S = 1` and `SS* = 1 − e₀e₀*`, so `[S*, S]` is the rank-one projection `e₀e₀*`: `T/K(ℓ²)` is
  commutative and generated by the unitary image of `S`, which is why the quotient is `C(𝕋)`.
- The symbol map sends the Toeplitz operator with symbol `f` to `f`, and `S ↦ z`; a wrong
  convention `S ↦ z̄` is excluded by `S e_n = e_{n+1}` matching multiplication by `z` on the
  Hardy basis `z^n`.
- `1 − SS* = e₀e₀*` is a nonzero finite-rank projection in `T`, so `S` is a non-unitary
  isometry and `T` is not finite.

*Needs:* §1.6, §6.5, §8.3; Mathlib `lp`, `Circle`.

### Examples

- `S ⊕ S*` quasidiagonal with `S` not (§8.1); the Toeplitz algebra as a nuclear non-quasidiagonal
  algebra (§§8.3–8.4).
- The Weyl–von Neumann statement for `M_z` on `L²(𝕋)` (§8.2).

### Dependencies

VonNeumannAlgebras V0, V1; Mathlib `IsCompactOperator`, `IsStarProjection`, `WithLp 2 (H × K)`,
`lp`, `Circle`. Within this roadmap: §§1.6, 2.3, 4.1, 5.4, 6.5.

## Layer 9: local reflexivity and exactness under quotients

### 9.1 Residual finite-dimensionality and homotopy invariance (C9.1)

A C*-algebra is residually finite-dimensional (RFD) when its finite-dimensional star
representations separate points. Give its faithful product-of-matrices description and its
norm-detecting finite-set criteria, and prove permanence under subalgebras and unitization.
Consume §5.5's cone and homotopy APIs and prove that cones over RFD algebras are RFD, using
evaluations and finite-dimensional representations. Prove Voiculescu's homotopy invariance of
quasidiagonality for separable C*-algebras: if `α : A → B` and `β : B → A` have `β ∘ α`
homotopic to `id_A` and `B` is quasidiagonal, then `A` is quasidiagonal (Blackadar V.4.2.10, from
V.4.2.8); in particular `CA` is quasidiagonal for every separable `A` (Blackadar V.4.2.11).
`Suggested.lean` states `isQuasidiagonal_of_homotopy` with the homotopy as a star homomorphism
into `C(unitInterval, A)`.

**Checks.**

- `C*(F₂)` is RFD (Blackadar IV.3.4.4 records this) and embeds in `∏_n M_{k_n}`; `K(ℓ²)` is not
  RFD, since a finite-dimensional representation of a simple infinite-dimensional algebra is
  zero; `C(X)` is RFD through its characters.
- The cone over `K(ℓ²)` is `C₀((0,1]) ⊗ K(ℓ²)`, whose quotients are of the form
  `C₀(closed subset) ⊗ K(ℓ²)` and have no nonzero finite-dimensional representations, so it is
  not RFD: the RFD hypothesis on `A` in "cones over RFD algebras are RFD" cannot be dropped.
- Homotopy invariance with `B = 0`: `β ∘ α = 0` homotopic to `id_A` means `A` is contractible,
  and the conclusion is that contractible separable algebras, such as `CA`, are quasidiagonal.

*Needs:* §5.5, §8.1, §8.3; Mathlib `C(unitInterval, A)`.

### 9.2 External finite-dimensional approximation and norm stability of matrix units (C9.2)

For a separable exact quasidiagonal algebra in a faithful essential representation on a separable
Hilbert space, prove Dadarlat's external finite-dimensional approximation theorem: every finite
subset is arbitrarily close in norm to a finite-dimensional C*-subalgebra of `B(H)` (Dadarlat
1999). Prove norm stability of the relations of any fixed finite family of matrix blocks: for
every `ε > 0` choose `δ > 0` depending only on `ε` and the block sizes, uniformly over all
C*-algebras, such that elements `e^r_{ij}` of norm at most `2` with `‖(e^r_{ij})* − e^r_{ji}‖ < δ`,
`‖e^r_{ij}e^r_{kl} − δ_{jk}e^r_{il}‖ < δ` within each block and `‖e^r_{ij}e^s_{kl}‖ < δ` for
`r ≠ s` are within `ε` entry by entry of an exact system of matrix units with orthogonal block
supports (Blackadar II.8.3.23); include the unital version when the diagonal sum is close to `1`;
construct the correction by spectral cutoffs and polar decomposition inside the generated
C*-algebra; prove that nearby exact systems are conjugate by a unitary close to `1` in the
unitization, with estimates on their finitely many entries. CStarClassification uses these norm
perturbation lemmas for finite-dimensional semiprojectivity and local AF approximation. Develop
approximate intertwining for sequences of finite-dimensional algebras, including norm
convergence, injectivity and unitary adjustment lemmas: asymptotically multiplicative and
isometric completely positive contractions into finite-dimensional stages, with summable
compatibility errors on a set with dense linear span, induce an embedding into the inductive
limit.

**Checks.**

- One `1 × 1` block: an element `e` with `‖e − e*‖ < δ` and `‖e² − e‖ < δ` is within `ε` of a
  projection, by the spectral cutoff of its real part at `1/2`; the constant `δ(ε)` does not depend
  on the algebra.
- Two projections `p, q` with `‖p − q‖ < 1` are conjugate by a unitary `u` with
  `‖u − 1‖ ≤ √2‖p − q‖`, the `1 × 1`-block instance of the conjugacy lemma; for `‖p − q‖ = 1`
  (`p = e₁₁`, `q = e₂₂` in `M₂`) they are still conjugate but by no unitary close to `1`.
- A `δ` depending on the algebra would not serve the inductive systems of §9.4, where the stages
  vary; the uniform `δ(ε, block sizes)` is what the spectral-cutoff construction delivers.

*Needs:* §8.1–§8.3, §7.1; OperatorTheory/PolarDecomposition; Mathlib `cfc`.

### 9.3 Admissible representations and the stable homotopy lemma (C9.3)

For a separable unital algebra, a finite set `F` and `ε > 0`, call a unital finite-dimensional
representation `σ` `(F, ε)`-admissible when its countable infinite amplification is within `ε` on
`F`, after unitary conjugation, of a faithful essential representation. Prove existence for
separable unital exact RFD algebras and preservation under adding a finite-dimensional summand.
Supply the RFD homomorphism refinement of §9.2: for a faithful essential representation `π` and
finite `F, ε`, construct a finite-dimensional unital star representation `σ` whose infinite
amplification is unitarily within `ε` of `π` on `F`, using block-diagonal finite-dimensional
separating representations and the absorption theorem of §8.2. For homotopic unital
representations `σ₀, σ₁ : A → M_k` with `σ₀` `(F, ε)`-admissible, prove that for some `N` the
representations `(N+1)σ₀` and `σ₁ ⊕ Nσ₀` are within `3ε` on `F` after unitary conjugation, by
subdividing the homotopy and absorbing into a faithful essential representation. Prove that any
two unital representations of the unitized cone on the same Hilbert space are homotopic. These
estimates supply the summable unitary adjustments of the inductive system in §9.4.

**Checks.**

- `A = ℂ`: every unital finite-dimensional representation is `(F, ε)`-admissible, as `π` and
  `σ^{(∞)}` are both the unital representation of `ℂ` on an infinite-dimensional separable space.
- Adding a summand: if `σ` is admissible then `σ ⊕ τ` is, because `(σ ⊕ τ)^{(∞)} = σ^{(∞)} ⊕ τ^{(∞)}`
  and Voiculescu's theorem absorbs `τ^{(∞)}` into the essential representation.
- The unitized cone of `A = ℂ` is `C[0,1]`, and two unital representations `f ↦ f(T₀)`,
  `f ↦ f(T₁)` for self-adjoint `T₀, T₁` with spectrum in `[0,1]` are homotopic through
  `f ↦ f((1−t)T₀ + tT₁)`.

*Needs:* §8.2, §9.1–§9.2, §5.5.

### 9.4 The AF-subquotient theorem (C9.4)

Prove that the cone of a separable exact RFD algebra embeds into an AF algebra. For an exact
separable quasidiagonal `B`, use §8.3's matrix maps `φ_n` to embed `B` into
`∏ M_{k_n} / ⊕ M_{k_n}`; form the pullback `E` inside the bounded matrix product with ideal the
`c₀` sum, the coordinate maps `φ_n` giving a completely positive contractive section `B → E`;
prove that `E` is separable, RFD and exact, using §7.1's locally split extension theorem. Apply
this to `B = CA` and embed `CE` in an AF algebra; compose the evaluations at `1` and the map
`E → CA` to obtain a surjection `CE → A`. Thus every separable exact algebra is isomorphic to a
quotient of a C*-subalgebra of a separable AF algebra (Blackadar IV.3.4.19(iv) states the
conclusion with the CAR algebra; the route here is Dadarlat's cone embedding, Blackadar V.4.2.12
and the remark citing [Dad00]). This analytic subquotient theorem does not assume the
`O₂`-embedding or K-theoretic classification results.

**Checks.**

- `C*(F₂)` is not exact, and a subquotient of an AF (hence nuclear, hence exact) algebra is
  exact by §7.1 and §9.7; so the theorem's exactness hypothesis is necessary.
- `A = K(ℓ²)` is itself AF, and the construction returns an AF algebra of which `K(ℓ²)` is a
  quotient of a subalgebra; for `A = ℂ`, `CA = C₀((0,1])` embeds in the AF algebra `C(Cantor set)`.
- The section `B → E` is completely positive and contractive but not multiplicative, exactly as
  in §5.5; a wrong statement asking for a star-homomorphic section would make `E ≅ B ⊕ ideal`.

*Needs:* §5.4, §5.5, §7.1, §8.3, §9.1–§9.3.

### 9.5 Operator-space local reflexivity (C9.5)

For unital `A`, operator-space local reflexivity means that every finite-dimensional operator
subsystem `E ⊆ A**` admits completely contractive maps `E → A` converging point-weak-star to its
inclusion. Prove the equivalent finite-test formulations, the point-norm refinement on `E ∩ A`
and the operator-subspace version; for nonunital `A` use the unitization and prove equivalence
with the direct subspace formulation. Distinguish this from Banach local reflexivity in
BanachSpaceTheory B7: the matrix norm bounds are essential.

**Checks.**

- Every nuclear algebra is locally reflexive, through property C of §9.6 (Blackadar IV.3.4.9).
- `B(ℓ²)` has WEP and is not nuclear, while locally reflexive algebras with WEP are nuclear
  (Ozawa, p. 27); so `B(ℓ²)` is not locally reflexive, although as a Banach space it satisfies
  the principle of local reflexivity of B7.
- For a finite-dimensional `A`, `A** = A` and the identity maps witness local reflexivity.

*Needs:* §2.8, §3.1–§3.2; BanachSpaceTheory B1, B7; §7.4.

### 9.6 Properties C, C′ and C″ and the strong-star family algebra (C9.6)

Construct the canonical injective binormal map `A** ⊙ B** → (A ⊗min B)**` from the normal
extensions of the commuting factor representations (Blackadar IV.3.4.7). Define property C by
its min-continuity for every `B` (Blackadar IV.3.4.8), property C′ by min-continuity of its
restriction to `A ⊙ B**`, and property C″ by min-continuity of its restriction to `A** ⊙ B`.
Prove independence of representations, the restriction and unitization lemmas and the
subalgebra permanence of all three properties (Blackadar IV.3.4.10–IV.3.4.11). Prove that C and
C″ pass to closed-ideal quotients using §2.8's central-summand description. Prove C″ iff local
reflexivity, using the operator-space duality of Layer 3 and weak-star approximation of
finite-dimensional matrix maps, and C′ iff exactness, using the following strong-star family
construction in its tensor-kernel argument (the C′ and C″ refinements are Effros–Haagerup's;
Blackadar IV.3.4.12–IV.3.4.13 give C implies exact).

For every C*-algebra `B` choose its faithful universal normal realization `B** ⊆ B(H_u)` with
the canonical inclusion of `B`. Take the common directed set `I = Finset(H_u) × ℕ_{≥1}`, ordered
by inclusion of the finite test set and increasing `n`; it does not depend on the element to be
approximated. In §5.4's bounded product `lp (fun _ : I ↦ B) ∞` construct
`D_I(B) = {b : b_i converges strong-star in B**}` with its inherited norm. Use V1's bounded
strong-star multiplication and star laws to prove that it is a norm-closed star subalgebra, in
general nonunital when `B` is nonunital; for closedness, the strong-star limits of a uniformly
norm-Cauchy family are norm-Cauchy by the contractive estimate of the limit map, and the
three-term vector estimate gives strong-star convergence of the uniform limit family. Prove that
the limit map `q : D_I(B) → B**` is a contractive star homomorphism with
`ker q = {b : b_i → 0 strong-star}`. For `x ∈ B**` bounded strong-star Kaplansky density chooses
`b_{F,n} ∈ B` with `‖b_{F,n}‖ ≤ ‖x‖`, `‖(b_{F,n} − x)ξ‖ < 1/n` and `‖(b_{F,n}* − x*)ξ‖ < 1/n` for
`ξ ∈ F` (the zero family for `x = 0`); these families converge strong-star to `x`, so `q` is
surjective, and the induced map is the isometric C*-quotient comparison `D_I(B)/ker q ≅ B**`.
When `B` is unital the constant family `1` is the unit and `q` is unital; `B = 0` gives the zero
algebra and quotient. Use common-universe lifts when needed. Prove transport under faithful
normal realizations using V4's comparison of bounded strong-star convergence, without replacing
the directed set by a countable model. This uses §5.4's single bounded-product/quotient carrier.

**Checks.**

- Star closure control for `B = K(ℓ²)`, `B** = B(ℓ²)`: `T_n = e₀e_n*` has norm `1` and
  `T_nξ = ξ_n e₀ → 0` for every `ξ`, while `T_n*e₀ = e_n` has no limit; bounded strongly convergent
  families are not star closed and cannot replace `D_I(B)`.
- `B = ℂ`: `B** = ℂ`, `D_I(ℂ)` is the algebra of bounded convergent families indexed by `I`, `q` is
  the limit, `ker q` the null families, and `D_I(ℂ)/ker q ≅ ℂ`.
- Nuclear algebras have property C (Blackadar IV.3.4.9), property C passes to subalgebras and
  quotients (IV.3.4.11) and implies exactness (IV.3.4.13); `C*(F₂)`, which is not exact, has
  none of C, C′.

*Needs:* §2.8, §5.1, §5.4, Layer 3; VonNeumannAlgebras V1, V4.

### 9.7 Consequences: exactness under quotients and inductive limits (C9.7)

Prove that nuclear algebras have property C using §6.2's semidiscrete bidual theorem (Blackadar
IV.3.4.9). Apply the AF-subquotient theorem of §9.4 to prove C, C′ and exactness equivalent for
separable algebras (Blackadar IV.3.4.19 for C), hence that exact algebras are locally reflexive.
Prove the separable-subalgebra tests (Blackadar IV.3.4.6) and the equivalence `C ↔ (C′ and C″)`
that remove separability. Deduce that exactness passes to every closed-ideal quotient (Blackadar
IV.3.4.20) and to directed inductive limits with arbitrary connecting star homomorphisms, by
applying quotient permanence to the stage images and §7.1's increasing-union result. For a
unital locally reflexive `A` prove that each quotient extension is locally completely positively
split, with a lifting on each finite-dimensional operator subsystem, and prove the converse
local-reflexivity theorem for locally split extensions whose ideal and quotient are locally
reflexive. These give the extension and quotient interfaces used by crossed products, K-theory
and classification.

**Checks.**

- Quotients: every quotient of the CAR algebra is exact, and by §9.4 every separable exact
  algebra arises as a quotient of a subalgebra of it; the Calkin algebra, a quotient of the
  non-exact `B(ℓ²)`, contains `C*(F₂)` (its essential representation meets `K(ℓ²)` in `0`) and is
  not exact, consistent with the theorem's direction.
- Inductive limits with non-injective maps: the system `A → A/J → A/J → ⋯` with identity maps
  after the first step has limit `A/J`; exactness of the limit is exactly quotient permanence.
- Local splitting for `A = C(X)`, `X` compact metrizable: a quotient `C(X) → C(K)` admits a
  positive unital extension operator `C(K) → C(X)` (Dugundji), so every finite-dimensional
  operator subsystem lifts, as local reflexivity of the nuclear algebra `C(X)` predicts.

*Needs:* §6.2, §7.1, §7.2, §9.4–§9.6.

### Examples

- `C*(F₂)` RFD and not exact; `K(ℓ²)` not RFD; cones of RFD algebras RFD (§9.1).
- The strong-star family algebra `D_I(K(ℓ²))` and the star-closure control `T_n = e₀e_n*` (§9.6).
- Every separable exact algebra as a subquotient of an AF algebra (§9.4).

### Dependencies

VonNeumannAlgebras V1, V4; BanachSpaceTheory B1, B7; OperatorTheory/PolarDecomposition;
Mathlib `C(unitInterval, A)`, `lp`, `cfc`. Within this roadmap: Layers 2, 3, 5, 6, 7 and 8.

## Downstream consumers

- **HilbertModules** consumes Layers 1 and 2 (ideals, approximate units, hereditary
  subalgebras, multipliers and the strict topology, representations, primitive spectra,
  Dauns–Hofmann), §2.6's left-ideal separation theorem in its H7, and Layers 7–9 for tensor
  permanence under exactness; its H5 commutative fiber example is its own.
- **OperatorAlgebraDynamics** consumes Layers 1–2 and identifies §5.4's universal unitary
  algebra with the full free-group algebra in its D1.
- **OperatorKTheory** consumes §5.5's paths, cones, suspensions and mapping cones in its K2, and
  §8.4's Toeplitz extension with its symbol.
- **CStarClassification** consumes Layer 1 (hereditary subalgebras, multipliers), §5.4's
  inductive limits and bounded products, §7.2's lifting theorem, §9.2's norm-perturbation and
  intertwining lemmas and §9.4's cone theorem.
- **FreeProbability** consumes Layers 1–5; **TemperleyLiebOperatorAlgebras** consumes Layers 1–5
  (finite-dimensional algebras, completely positive maps, tensor products, inductive limits).
- **ToeplitzOperators** consumes §1.6's Calkin algebra, §5.1's tensor products and §8.4's
  extension; **NoncommutativeIntegration** consumes Layer 3 and §4.1's Kadison–Schwarz
  estimate; **QuantumGroups** consumes `C1.CommutativeMultiplierMorphisms` and Layer 5;
  **NoncompactQuantumSymmetry** consumes `C2.AnnHull`.
- **BanachAlgebras** A1 and A6 record that §2.6 and §6.2 own the C*-algebraic comparisons of
  primitive ideals and of amenability; nothing flows from here to BanachAlgebras.

## References

- B. Blackadar, *Operator Algebras: Theory of C*-Algebras and von Neumann Algebras*,
  Encyclopaedia of Mathematical Sciences 122, Springer 2006; author's corrected copy. Cited by
  item number: II.4 (approximate units), II.5 (ideals, hereditary subalgebras, Pedersen ideal,
  cones), II.6 (representations, states, primitive ideals, completely positive maps), II.7.3
  (multipliers), II.8 (constructions, Voiculescu's theorem, matrix units), II.9 (tensor products),
  III.5.2 (universal representation and bidual), IV.3 (nuclearity, lifting, amenability,
  exactness) and V.4 (quasidiagonality).
- W. Arveson, *Subalgebras of C*-algebras*, Acta Math. 123 (1969), 141–224,
  doi:10.1007/BF02392388; Theorem 1.4.2 (Radon–Nikodym).
- W. F. Stinespring, *Positive functions on C*-algebras*, Proc. Amer. Math. Soc. 6 (1955),
  211–216, doi:10.1090/S0002-9939-1955-0069403-4; Theorems 1 and 4.
- M.-D. Choi, *Completely positive linear maps on complex matrices*, Linear Algebra Appl. 10
  (1975), 285–290, doi:10.1016/0024-3795(75)90075-0; Theorem 2.
- G. Wittstock, *Ein operatorwertiger Hahn–Banach Satz*, J. Funct. Anal. 40 (1981), 127–150,
  doi:10.1016/0022-1236(81)90064-1.
- V. I. Paulsen, *Every completely polynomially bounded operator is similar to a contraction*,
  J. Funct. Anal. 55 (1984), 1–17, doi:10.1016/0022-1236(84)90002-7.
- Z.-J. Ruan, *Subspaces of C*-algebras*, J. Funct. Anal. 76 (1988), 217–230,
  doi:10.1016/0022-1236(88)90057-2.
- D. P. Blecher and V. I. Paulsen, *Tensor products of operator spaces*, J. Funct. Anal. 99
  (1991), 262–292, doi:10.1016/0022-1236(91)90042-4.
- G. Pisier, *Grothendieck's theorem, past and present*, Bull. Amer. Math. Soc. 49 (2012),
  237–323, arXiv:1101.4195; Theorems 7.1, 12.3–12.7, 13.3, 13.6, 13.10, 14.1 and Remark 12.8.
- G. Pisier, *Similarity Problems and Completely Bounded Maps*, Lecture Notes in Mathematics
  1618, 2nd ed., Springer 2001, doi:10.1007/b55674; Chapter 5 (the Haagerup tensor product).
- U. Haagerup, *The Grothendieck inequality for bilinear forms on C*-algebras*, Adv. Math. 56
  (1985), 93–116, doi:10.1016/0001-8708(85)90026-X; Theorem 1.1.
- U. Haagerup, *All nuclear C*-algebras are amenable*, Invent. Math. 74 (1983), 305–319,
  doi:10.1007/BF01394319; §§2–3.
- A. Connes, *On the cohomology of operator algebras*, J. Funct. Anal. 28 (1978), 248–253,
  doi:10.1016/0022-1236(78)90088-5.
- E. C. Lance, *On nuclear C*-algebras*, J. Funct. Anal. 12 (1973), 157–176,
  doi:10.1016/0022-1236(73)90021-9.
- E. G. Effros and E. C. Lance, *Tensor products of operator algebras*, Adv. Math. 25 (1977),
  1–34, doi:10.1016/0001-8708(77)90085-8.
- V. Runde, *Lectures on Amenability*, Lecture Notes in Mathematics 1774, Springer 2002,
  doi:10.1007/b82937; Chapter 6 (Connes amenability and normal virtual diagonals).
- E. Kirchberg, *On non-semisplit extensions, tensor products and exactness of group
  C*-algebras*, Invent. Math. 112 (1993), 449–489, doi:10.1007/BF01232444.
- N. Ozawa, *About the QWEP conjecture*, Internat. J. Math. 15 (2004), 501–530,
  arXiv:math/0306067; Theorems 2.2, 3.3, 3.6, 3.8, 3.14, Proposition 3.13, Corollary 3.17 and
  the discussion on p. 27.
- M. Dadarlat, *On the approximation of quasidiagonal C*-algebras*, J. Funct. Anal. 167 (1999),
  69–78, doi:10.1006/jfan.1999.3435.
- R. S. Phillips, *On linear transformations*, Trans. Amer. Math. Soc. 48 (1940), 516–541,
  doi:10.1090/S0002-9947-1940-0004094-3; Lemma 3.3.
- M. Takesaki, *Theory of Operator Algebras I*, Springer, doi:10.1007/978-3-662-10451-4;
  Chapter III §2 (the universal representation and the enveloping von Neumann algebra), cited
  in §2.8.

Mathlib's `CompletelyPositiveMap`, `CStarMatrix`, approximate-unit, unitization and
double-centralizer APIs determine the underlying objects; the supplier contracts above name the
declarations used.
