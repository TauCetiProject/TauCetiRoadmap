# Roadmap: Temperley–Lieb operator algebras and annular modules

**Summary.** This roadmap builds the Hermitian and operator-algebraic theory of the complex
Temperley–Lieb algebras on top of two suppliers: the algebraic diagram theory of TemperleyLieb
(diagram category, presentation isomorphism, closure trace, cell modules and Gram polynomials,
Jones–Wenzl projections, negligible ideals and the fusion quotients) and the analytic
Temperley–Lieb theory of Subfactors Layer 3 (the analytic adjoint, Markov uniqueness, Jones's
positivity theorem, the positive path models, the positive Jones quotients `Q_n` and their
C*-tower `B_δ`). Layer 1 compares the two: the analytic adjoint against the vertical reflection of
diagrams, the Hermitian cell forms against the bilinear cell forms and their Gram determinants, the
trace radical against the negligible ideal, and the positive path model against the algebraic
path and block idempotents; it then realises the tower concretely: on positive spin chains with the
Powers product state (1.5), through the finite Potts, loop and ice partition functions (1.6), and
at `δ = √2` and `δ = √3` as an even Clifford algebra and an inversion-fixed quantum torus with
finite braid images (1.7–1.8). Layer 2 proves the sign isomorphism `TL_n(δ) ≅ TL_n(−δ)`, classifies
the negative loop parameters whose signed closure forms are positive at every level, and
identifies the Bratteli diagram of the Jones tower. Layer 3 builds the unitary Temperley–Lieb
category: the negligible quotient of the diagram category with its conjugate-linear dagger,
positive Hom spaces, C*-tensor structure, unitary duality, and the unitary fusion rules of its
simple objects. Layer 4 builds the affine Temperley–Lieb category, the algebras `ATL_n(δ)`, their
finite-dimensional standard modules `W_(t,z)(n)`, the classification of finite-dimensional simple
modules, the explicit intertwiners, the affine Gram determinant with its binomial exponents, and
the composition factors of the standard modules. The end theorems are:

- positivity of the signed closure forms at negative loop parameters exactly when `|δ|` is a Jones
  loop parameter (`markovTrace_neg_one_pow_nonneg_iff`);
- the unitary Temperley–Lieb category at every admissible `δ`, with its C*-tensor structure,
  standard unitary duality and unitary fusion rules;
- the classification of the finite-dimensional simple `ATL_n(δ)`-modules by the nonzero simple
  heads `L_(t,z)(n)`;
- the affine Gram determinant `det G_(t,Z)(n;X) = σ_(n,t) Π_r F_r(X,Z)^E_(n,r)` and the
  composition-factor formula `[W_(t,z)] = Σ_((t,z)≼(s,y)) [L_(s,y)]` over ℂ.

## Scope and ownership

This roadmap owns:

- the comparison of Subfactors 3.1's analytic adjoint with the reflection involutions of the
  diagram category and with the coefficient-fixing star of TemperleyLieb Layer 4, through
  TemperleyLieb Layer 4's `presentedTLEquiv`, and the coefficient-conjugation map between the
  fibers at `δ` and `conj δ` (Layer 1);
- the Hermitian cell forms obtained from TemperleyLieb Layer 5's bilinear cell forms, their
  invariance under the analytic adjoint, and the Gram-determinant anchors in the
  through-string labelling (Layer 1);
- the identification of Subfactors 3.2's trace radical `R_n` with the endomorphism component of
  TemperleyLieb Layer 6's negligible ideal, its generation by the embedded Jones–Wenzl projection
  at a root of unity, and the identification of Subfactors 3.3's `Q_n` with the endomorphism
  algebra of TemperleyLieb Layer 7's root-of-unity quotient (Layer 1);
- the comparison of Subfactors 3.3's positive path model with the algebraic path and block
  idempotents of TemperleyLieb Layers 6–7 (Layer 1);
- the positive-real spin-chain realisation of the tower, its one-site slices, and the comparison of
  the Powers product state with the trace-GNS representation of `B_δ` (1.5);
- finite Potts and Fortuin–Kasteleyn partition functions, their planar loop and six-vertex
  comparisons, planar closures and wired boundaries (1.6);
- the identification of the Jones quotient at `δ = √2` with an even Clifford algebra, its blocks,
  tower and braid image (1.7);
- the identification of the Jones quotient at `δ = √3` with the inversion-fixed algebra of a
  cubic quantum torus, its blocks, tower and finite braid image (1.8);
- the sign isomorphism `TL_n(δ) ≅ TL_n(−δ)` over every commutative ring, its trace relation,
  and the positivity classification at negative loop parameters (Layer 2);
- the Bratteli diagram of the Jones tower and the AF presentation of `B_δ` (Layer 2);
- the unitary Temperley–Lieb category and its C*-tensor and unitary-duality structure (Layer 3);
- the affine Temperley–Lieb category, the algebras `ATL_n(δ)`, their standard modules, simple
  heads, intertwiners, Gram determinants and composition factors (Layer 4).

The roadmap leaves the following to named roadmaps:

- The ordinary complex diagram theory belongs to TemperleyLieb: planar matchings and the
  half-diagram counts (Layer 1), the diagram category (Layer 2), the linear pivotal category with
  its reflection involutions (Layer 3), `TLAlg R δ n`, `presentedTLEquiv`, the closure trace, the
  Markov-trace predicate and its uniqueness (Layer 4), cell modules, cell forms, the universal Gram
  polynomial and the semisimplicity classification (Layer 5), Jones–Wenzl projections, the
  negligible ideal and the Goodman–Wenzl theorem (Layer 6), the Karoubi envelope, quotients by
  tensor ideals, the generic classification of simples and the root-of-unity fusion quotient
  (Layer 7).
- The analytic Temperley–Lieb theory over ℂ belongs to Subfactors Layer 3: the conjugate-linear
  adjoint on `TauCeti.TemperleyLieb ℂ δ n` for real `δ`, its uniqueness and its compatibility with
  strand inclusions (3.1); the normal form, Markov uniqueness, quantum integers, Jones–Wenzl
  projections `f_k` with `T_k(f_k) = [k+1]`, the Hermitian form `H_n`, the trace radical `R_n`,
  Jones's positivity theorem `markovTrace_nonneg_iff`, the first-bad-level theorem
  `markovTrace_nonneg_iff_lt_floor`, Cauchy–Schwarz and the pullback criterion (3.2); the positive
  path models `π_n` on paths of the half-line and of `A_(m−1)`, the weighted trace on the path
  model,
  `ker π_n = R_n`, the structure theorem `Q_n ≅ ⊕_t M_(#paths(n,t))(ℂ)`, the injective strand maps,
  the trace-preserving expectations `E_n` with the Markov formula, the finite-dimensional
  faithful-trace C*-lemma, the C*-inductive limit `B_δ` with its faithful trace, and its GNS
  representation and weak closure (3.3). None of it is restated here; Layers 1–2 consume it by
  section.
- General pivotal and spherical traces, finite semisimple categories and the fusion vocabulary
  belong to PivotalSpherical Layers 0–4.
- C*-categories, dagger tensor categories and unitary duality belong to CategoricalOperatorAlgebras
  CA1a and CA2a; Layer 3 instantiates them.
- C*-tensor products and C*-inductive limits belong to CStarAlgebras C5; finite matrix
  C*-algebras, ideals, the continuous functional calculus and completely positive maps belong to
  CStarAlgebras C1–C4.
- AF algebras and Bratteli diagrams belong to CStarClassification CL2; Layer 2 supplies the
  Temperley–Lieb instance.
- The Grothendieck group of an essentially small abelian category belongs to
  GrothendieckEulerForms Layer 2 and Tau Ceti's `TauCeti.CategoryTheory.GrothendieckGroup.Abelian`.
- Walks, component counts and the simple-graph bridge of edge-labelled graphs belong to
  GraphConnectivityAndFlows 1.1; bipartite ribbon graphs and their genus to BelyiMaps Layer 2
  (formalised in Tau Ceti); 1.6 adds only the partition-function adapters.
- Complexified Clifford algebras with their conjugation, analytic adjoint and scalar trace belong
  to SpinGeometry G1; the structure of complex Clifford algebras and their gradings to
  SpinRepresentations Layers 0–1; 1.7 supplies the Temperley–Lieb instance.
- Hecke-algebra Markov traces, their positive quotients and atomic tensor models belong to
  TypeAHeckeAlgebras H3 and H4a; 1.5 treats only the Temperley–Lieb spin chain.
- GNS representations, incomplete tensor products, normal representations, modular theory and
  completely positive maps belong to VonNeumannAlgebras V0, V2, V4, V10 and V13a.
- Knot invariants from braid closures, including the Jones polynomial through the
  Temperley–Lieb representation, belong to GeometricTopology Layer 4.

Outside the roadmap: planar algebras, subfactor basic constructions, index restriction and
realisation (Subfactors Layers 2–4); general C*- and W*-categories, Q-systems and categorical
realisation (CategoricalOperatorAlgebras CA3–CA10); affine Hecke algebras and their quiver
geometry; characteristic-p representation theory of ordinary or affine Temperley–Lieb algebras;
braided TQFT; the classification of unitary annular representations; the Arf-invariant
interpretation of the Jones polynomial at `t = i` and the identification of finite braid images
with named finite groups. The algebraic affine simple
modules of Layer 4 are included; no positivity is inferred from their bilinear pairings.

No roadmap consumes this roadmap at present.

## Conventions

- **The native presentation.** `TL_n` is `TauCeti.TemperleyLieb ℂ δ n`, with generators `e δ i`,
  `i : Fin (n − 1)`, and relations `e_i² = δ e_i`, `e_i e_(i±1) e_i = e_i`, `e_i e_j = e_j e_i` for
  `|i − j| ≥ 2`. Prose labels are one-based: `e_i` is the native `e δ (i−1)` for `1 ≤ i < n`, so the
  last generator of `TL_(n+2)` is the native `e δ (Fin.last n)` of `markovTrace_strandIncl_mul_e_last`.
  `ι` is `strandIncl`. The diagram
  algebra `TLAlg ℂ δ n` of TemperleyLieb Layer 4 is related to `TL_n` by `presentedTLEquiv`;
  every transported statement commutes with it. No second presented algebra is built.
- **Stacking.** Products stack the left factor on top of the right, matching Mathlib's `End`
  multiplication `x * y = y ≫ x`; the composite `f ≫ g` of the diagram category puts `g` on top of
  `f`.
- **Quantum integers.** `[r]` is TemperleyLieb Layer 0's `qInt ℂ δ r`, the evaluation of
  `Polynomial.Chebyshev.S ℂ (r − 1)` at `δ`: `[0] = 0`, `[1] = 1`, `[2] = δ`,
  `[r+2] = δ[r+1] − [r]`. For `δ = q + q⁻¹` it is the Laurent sum `(q^r − q^(−r))/(q − q⁻¹)`
  including `q = ±1` by evaluation. No quantum integer is defined by a singular rational expression.
- **Signs of the quantum parameter.** Tau Ceti's `markovTrace q hq` has loop value
  `δ = −(q + q⁻¹)`. Penneys and Chen use the positive-loop parameter `q′` with `δ = q′ + q′⁻¹`, so
  `q′ = −q`. Graham–Lehrer use `δ = −(v + v⁻¹)`, so their `v` is Tau Ceti's `q`; Layer 4 writes
  `v` for it. Erdmann–Green use the positive-loop convention `δ = v + v⁻¹`, so their `v` is `q′`.
- **The closure trace.** `T_n` is the unnormalised closure trace, `T_n(1) = δ^n`,
  `T_(n+1)(ι x) = δ T_n(x)`, `T_(n+1)(ι(x) e_n) = T_n(x)`. On `TL_n` it is `markovTrace q hq` for
  any `q` with `δ = −(q + q⁻¹)`, independent of `q` by Subfactors 3.2 and TemperleyLieb Layer 4. For
  real `δ ≠ 0` the normalised trace is `τ_n = δ⁻ⁿ T_n`; for `δ < 0` it differs in sign from `T_n`
  at odd levels. At `δ = 0` the normalised trace and the normalised Jones projections are undefined;
  the algebras and `T_n` remain defined.
- **Adjoints.** For real `δ`, `x†` is Subfactors 3.1's conjugate-linear adjoint on `TL_n`: it fixes
  every generator, reverses products and conjugates scalars, so `(i·1)† = −i·1`. TemperleyLieb
  Layer 4's `StarRing` on `TLAlg R δ n` is the `R`-linear vertical reflection; it is written `star`
  and is never confused with `†`. The Hermitian form is `H_n(x,y) = T_n(x† y)`, conjugate-linear in
  `x`. Positivity statements use the `ComplexOrder` partial order, in which `0 ≤ z` means `z` is
  real and nonnegative.
- **Jones loop parameters.** Subfactors 3.2's `jonesLoopParameters` is `{2cos(π/m) : m ≥ 3} ∪ [2,∞)`.
  A real `δ > 0` is admissible when it lies there. For `δ = 2cos(π/m)` the quantum integers
  `[1], …, [m−1]` are positive and `[m] = 0`.
- **Quotients.** `Q_n` is Subfactors 3.3's `TL_n ⧸ R_n` for every admissible `δ`, including `δ ≥ 2`
  where `R_n = 0`; it is never redefined.
- **Coefficients.** Everything is over ℂ except the sign isomorphism of 2.1, stated over every
  commutative ring, and the universal affine Gram matrices of 4.6, stated over `ℤ[X, Z, Z⁻¹]`.

## Exact supplier contracts

**From Mathlib.**

- `StarRing`, `StarModule` and the `ComplexOrder` instance on ℂ.
- `TwoSidedIdeal` and `RingCon.Quotient` for two-sided ideals and their quotients.
- `Real.arccos` with values in `[0, π]`, `Real.sqrt` the nonnegative square root, `Nat.floor`.
- `Polynomial.Chebyshev.S` and `Polynomial.Chebyshev.T`.
- `Matrix`, `Matrix.det`, `Matrix.trace`, and the finite-dimensional linear algebra used for block
  decompositions.
- `CategoryTheory.Idempotents.Karoubi` and `CategoryTheory.Mat_`, as plain categories; their
  monoidal and linear structures are TemperleyLieb Layer 7's.
- `FreeAlgebra`, `RingQuot` and `RingQuot.lift`, underlying the native presentation.
- `Matrix.kronecker`, `Matrix.PosDef`, `Fin.snoc` and `PMF` (1.5–1.6).
- `Graph V E` (`Mathlib/Combinatorics/Graph/Basic.lean`), allowing loops and parallel edges;
  `Graph.restrict` (`Delete.lean`, keeping every vertex), `Graph.map` (`Maps.lean`, creating loops
  when ends are identified), `Graph.toSimpleGraph : SimpleGraph V(G)` (`Simple.lean`) and
  `SimpleGraph.ConnectedComponent` (1.6).
- `QuadraticMap.weightedSumSquares`, `CliffordAlgebra` with `ι`, `lift`, `map`, `even`,
  `equivEven`, `ι_sq_scalar`, `ι_mul_ι_add_swap`, and the `star` `reverse ∘ involute` (1.7).
- `AlgHom.equalizer`, `LinearMap.BilinForm`, `ZMod` (1.8).

None of these supplies a Temperley–Lieb algebra, a diagram category, a C*-category or an affine
diagram.

**From Tau Ceti** (`TauCeti/Algebra/TemperleyLieb/Basic.lean`, `.../MarkovTrace.lean`,
`TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean`).

- `TauCeti.TemperleyLieb R δ n`, its generators `e δ i`, the relations `Rel`, the universal
  property `lift`, `lift_e`, `hom_ext`, and `adjoin_range_e` (the generators generate).
- `strandIncl : TemperleyLieb R δ (n+1) →ₐ[R] TemperleyLieb R δ (n+2)` with `strandIncl_e`.
- `algEquivOfLeOne` (levels `0` and `1` are the base ring), `e_ne_zero_two` (the generator is
  nonzero on two strands over a nontrivial ring), `aug` (the augmentation killing every generator).
- `markovTrace q hq` with `markovTrace_one` (value `δ^n` on `1`), `markovTrace_mul_comm`,
  `markovTrace_strandIncl` (factor `δ`) and `markovTrace_strandIncl_mul_e_last` (the Markov
  property). Its loop value is `−(q + q⁻¹)`.
- `TauCeti.AbelianK0 C` with `AbelianK0.of`, `of_shortExact` and `of_biprod`, the Grothendieck group
  of an essentially small abelian category.
- The spin model (`MarkovTrace.lean`): `spinCup`, `spinCap`, `markovWeight`, `spinGenerator`,
  `spinRep` with `spinRep_e` and `spinRep_strandIncl`, `spinWeight`,
  `diagonal_spinWeight_mul_spinGenerator`, `commute_diagonal_spinWeight_spinRep`,
  `markovTrace_apply` (`markovTrace = trace (diagonal spinWeight * spinRep x)`), and
  `Matrix.extendLast` (`TauCeti/LinearAlgebra/Matrix/ExtendLast.lean`).
- `BraidGroup n` (`TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean`) and the Kauffman-bracket
  representation `TemperleyLieb.jones a : BraidGroup n →* (TemperleyLieb R (jonesDelta a) n)ˣ` with
  `jonesUnit a i = a • 1 + a⁻¹ • e i` and `jonesDelta a = −(a² + a⁻²)`
  (`TauCeti/KnotTheory/TemperleyLieb.lean`).
- `BipartiteRibbonGraph` with `facePerm = (rotW * rotB)⁻¹` and `IsConnected`
  (`TauCeti/Combinatorics/RibbonGraph/Basic.lean`), and
  `BipartiteRibbonGraph.IsConnected.two_sub_two_mul_genus` (`.../RibbonGraph/Genus.lean`).
- `CliffordAlgebra.basis`, the ordered-monomial basis from a linearly ordered basis
  (`TauCeti/LinearAlgebra/CliffordAlgebra/Dimension.lean`).
- `IsFactorSet`, `twistedMonoidAlgebra`, `TwistedMonoidAlgebra.of`, `.basis`, `.lift`
  (`TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean`), `HeisenbergGroup`
  (`TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean`), and
  `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`
  (`TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean`).
- No star structure, positivity, quotient, diagram category or affine algebra is supplied.

**From TauCetiRoadmap.TemperleyLieb.** Cited as TemperleyLieb Layer k. Assumed of each layer:

- Layer 0: `qInt R δ r` as the evaluation of `Polynomial.Chebyshev.S`, the recurrence, and
  `exists_qInt_eq_zero_iff` (over an algebraically closed field of characteristic zero, `[r] = 0`
  for some `r ≥ 1` exactly when `δ = ζ + ζ⁻¹` for a root of unity `ζ ≠ ±1`).
- Layer 1: `PlanarMatching k` with `card_planarMatching`, and `halfCount n k`, the number of
  half-diagrams on `n` points with `k` through strings, `halfCount n k = C(n,(n−k)/2) − C(n,(n−k)/2−1)`
  for `k < n`, `n − k` even, `halfCount n n = 1`, and `0` off that parity.
- Layer 2: the diagram category `TLDiagCat` with gluing composition and circle counts.
- Layer 3: the linear category `TL(R, δ)` with `diagBasis`, its monoidal, rigid, pivotal and
  spherical structure, the vertical reflection (a contravariant monoidal involution fixing every
  `e_i`) and the left–right reflection `reflect` (sending `e_i` to `e_(n−i)`).
- Layer 4: `TLAlg R δ n := End (TLCat.of n)`, `presentedTLEquiv : TauCeti.TemperleyLieb R δ n ≃ₐ[R]
  TLAlg R δ n` with its generator and `strandIncl ↦ incl` compatibilities, the `StarRing` by vertical
  reflection with `star (r • x) = r • star x`, the closure trace `tr̂` with `tr̂(1) = δ^n`, the
  pairing `tr̂(star x · y)`, the conditional expectation `condExp`, the predicate `IsMarkovTrace`,
  `existsUnique_isMarkovTrace`, and the comparison `tr̂ ∘ presentedTLEquiv = markovTrace q hq`
  whenever `δ = −(q + q⁻¹)`.
- Layer 5: `CellModule R δ n k` with the half-diagram basis, the bilinear `cellForm`, the scalar
  tower with the `TLAlg`-action, the universal Gram polynomial `gramPoly n k ∈ ℤ[X]` with its
  anchors `det G_{2,0} = [2]`, `det G_{3,1} = [3]`, `det G_{4,2} = [4]`, `det G_{4,0} = [2]²[3]`,
  `det G_{5,1} = [3]⁴(δ² − 2)`, and the semisimplicity classification
  `isSemisimpleRing_iff_of_charZero`.
- Layer 6: `jonesWenzl n` (`existsUnique_jonesWenzl`), both recursions, `IsMarkovTrace.apply_jonesWenzl`
  (`tr̂ f_n = [n+1]`), the partial-trace formula, tensor ideals, `negligibleIdeal` (the morphisms `f`
  with `tr̂(f ≫ g) = 0` for all `g`), the Goodman–Wenzl theorem (in characteristic zero at quantum
  order `ℓ`, `f_(ℓ−1)` generates the negligible ideal, the unique proper nonzero tensor ideal), and
  the path and block idempotents of its proof.
- Layer 7: the monoidal, linear and rigid structures on `Mat_` and `Karoubi`, `MonoidalIdeal` and
  `MonoidalQuotient`, the bridge to abelian Hom-finite categories, the generic classification of
  simples by Jones–Wenzl objects `X_r` with Clebsch–Gordan rules, and the root-of-unity quotient
  with simples `X_0, …, X_(ℓ−2)` satisfying PivotalSpherical's fusion hypotheses.

**From TauCetiRoadmap.Subfactors.** Cited as Subfactors 3.k. Assumed of each section:

- 3.1: for real `δ`, the conjugate-linear adjoint `†` on `TL_n`, involutive, additive, reversing
  products, fixing every generator, unique with these properties, commuting with `strandIncl`;
  non-existence for non-real `δ`.
- 3.2: the normal form; Markov uniqueness; the quantum integers and their signs; `f_k` when
  `[2], …, [k] ≠ 0`, idempotent, killed by every generator, `f_k† = f_k` for real `δ`,
  `T_k(f_k) = [k+1]`; `T_n(x†) = conj T_n(x)`; `H_n` Hermitian and natural under inclusion with
  factor `δ`; `R_n = {x : ∀ y, T_n(xy) = 0}` a `†`-stable two-sided ideal; `jonesLoopParameters`;
  `markovTrace_nonneg_iff` (for `δ > 0`, `T_n(x† x) ≥ 0` for all `n`, `x` iff `δ` admissible);
  `markovTrace_nonneg_iff_lt_floor`; Cauchy–Schwarz and `{x : H_n(x,x) = 0} = R_n`; the pullback
  criterion.
- 3.3: for admissible `δ`, the path model `π_n` on `ℓ²` of the `n`-step paths from `0` on the
  half-line (for `δ ≥ 2`) or on `A_(m−1)` (for `δ = 2cos(π/m)`), with `π_n(U_i)` mixing the two
  continuations of a path at a vertex `s` by the matrix `[s+1]⁻¹ v vᵀ`, `v = (√[s], √[s+2])`; the
  weighted trace `Σ_t [t+1] Tr(X_t)` on the path algebra (Subfactors writes it `τ_n`; composed with
  `π_n` it is this README's `T_n`); `ker π_n = R_n`; `Q_n ≅ ⊕_t M_(#paths(n,t))(ℂ)`; injective
  strand maps `Q_n → Q_(n+1)`; the expectations `E_n` with the Markov formula
  `T_(n+1)(ι_n(x) p_n) = δ⁻¹ T_n(x)`, `p_n = δ⁻¹ U_n`, equivalently
  `τ_(n+1)(ι_n(x) p_n) = δ⁻² τ_n(x)` for the normalised traces (Subfactors writes `τ_n` for this
  README's `T_n` and `tr_n` for its `τ_n`); the finite-dimensional faithful-trace
  C*-lemma and the C*-norm on `Q_n`; the C*-inductive limit `B_δ` with faithful normalised trace;
  the faithful GNS representation and its weak closure with the normal extension of the trace and
  of the expectations.

**From TauCetiRoadmap.PivotalSpherical.** Layers 0–4: the dual functors, `PivotalCategory`,
left and right traces and `SphericalCategory`, `IsFiniteSemisimpleCategory`, and the fusion
hypotheses stated as instance arguments.

**From TauCetiRoadmap.CategoricalOperatorAlgebras.** CA1a: daggers on complex linear
categories, C*-categories (Banach Hom spaces, contractive bilinear composition, isometric dagger,
`‖f†f‖ = ‖f‖²`, positivity of `f†f`), the C*-algebra structure on each `End(X)`, finite linking
algebras, finite orthogonal sums and unitary splittings. CA2a: dagger tensor categories with
unitary associators and unitors, solutions of the conjugate equations, standard and balanced
solutions, unitary dual functors with `(f∨)† = (f†)∨`, pivotal comparison and positive dimensions.
Nothing from CA1b, CA2b or CA3–CA10 is used.

**From TauCetiRoadmap.CStarAlgebras.** C1–C4: finite-dimensional C*-algebras and their ideals,
the continuous functional calculus, completely positive maps and their matrix order. C5: the
spatial tensor product of C*-algebras with `M_n ⊗ A ≅ M_n(A)`, and C*-inductive limits of directed
systems of *-homomorphisms with their universal property.

**From TauCetiRoadmap.CStarClassification.** CL2: `IsAF` and its local characterisation (2.1);
Bratteli diagrams, the inductive system of a diagram, the `K₀` connecting maps as multiplicity
matrices, and the recovery of a diagram from an AF presentation (2.2).

**From TauCetiRoadmap.GrothendieckEulerForms.** Layer 2: abelian `K₀` as exact `K₀` of the
canonical exact structure, its universal property and its functoriality under exact functors.

**From TauCetiRoadmap.GraphConnectivityAndFlows.** 1.1: walks in edge-labelled graphs,
`Graph.componentCount G = Nat.card G.toSimpleGraph.ConnectedComponent` for finite vertex sets,
isolated vertices counted, and its invariance under isomorphism.

**From TauCetiRoadmap.BelyiMaps.** Layer 2: finite bipartite ribbon graphs, faces as orbits of
`facePerm`, connectedness and genus, formalised in Tau Ceti as listed above.

**From TauCetiRoadmap.SpinGeometry.** G1 item 1: the complexification of a real quadratic space
and its Clifford algebra; G1 item 3: the coefficient conjugation `κ_tens`, the positive-form
adjoint `κ_tens ∘ (id ⊗ reverse)`, the scalar trace `cliffordScalarTrace = 2^(−dim V) Tr(L_a)`,
its cyclicity, the ordered-product basis compared with `CliffordAlgebra.basis`, and
`τ_ℂ(a* a) = Σ_I |a_I|² Π_(i ∈ I) b(e_i, e_i)`.

**From TauCetiRoadmap.SpinRepresentations.** Layers 0–1: the Clifford algebra with its gradings,
and the structure of complex Clifford algebras of even and odd dimension as matrix algebras and
sums of two matrix algebras, with their even subalgebras.

**From TauCetiRoadmap.VonNeumannAlgebras.** V0: GNS representations of states. V2: incomplete
tensor products of Hilbert spaces with reference vectors, prefix and tail splittings and slice
maps. V4: normal states and normal representations. V10: Tomita–Takesaki theory and the modular
group of a faithful normal state. These are used only by the infinite-site statements of 1.5.

**From TauCetiRoadmap.GeometricTopology.** Layer 4: braid closures, Markov moves and the Jones
polynomial from the Kauffman bracket and from the Temperley–Lieb representation, fixing the
closure normalisation used at the end of 1.7 and 1.8.

## How to read the build

Layer 1 is comparison: it takes Subfactors Layer 3's analytic objects and TemperleyLieb's
algebraic objects and proves they are the same objects seen from two sides, so that every later
statement can use whichever description is convenient. Layer 2 adds the one new positivity
statement of the roadmap, at negative loop parameters, by a sign isomorphism, and the Bratteli
diagram of the tower; it needs Layer 1 only for the block description of `Q_n`. Layer 3 builds the
unitary Temperley–Lieb category from Layer 1's positive Hom pairings and TemperleyLieb Layer 7's
envelope and quotient, and instantiates CategoricalOperatorAlgebras' interfaces. Layer 4 is
independent of Layers 2–3: it needs the ordinary diagram category and the Jones–Wenzl calculus of
TemperleyLieb, and Layer 1 only for the sign convention of the quantum parameter.

## Layer 1: Hermitian structure on the diagram side

### 1.1 The analytic adjoint and the diagram reflections

For real `δ` define the diagram adjoint on `TLAlg ℂ δ n` as the composite of TemperleyLieb
Layer 4's vertical reflection `star` with conjugation of the coefficients in `diagBasis`. Prove
that `presentedTLEquiv` intertwines Subfactors 3.1's `†` with it: both are conjugate-linear
anti-automorphisms fixing every generator, and 3.1's uniqueness applies (Penneys, *Unitary Quantum
Symmetries Lite*, Chapter 4, Facts 4.4.14 (TB4), printed p. 155, for the adjoint on tree-basis
matrix units). For every complex `δ` define coefficient conjugation `κ : TL_n(δ) → TL_n(conj δ)`
on the native presentation, the conjugate-linear ring isomorphism fixing the generators; it
descends through `RingQuot.lift` because conjugating `e_i² = δ e_i` gives `e_i² = conj(δ) e_i`.
Prove that `star ∘ κ = κ ∘ star` on the diagram side, that `κ ∘ κ = id`, that `κ` commutes with
`strandIncl`, and that for real `δ` the composite `star ∘ κ` is `†`. Prove `T_n ∘ κ = conj ∘ T_n`
on the fibers `δ` and `conj δ`, and `tr̂(star x) = tr̂(x)` (TemperleyLieb Layer 4's trace is
reflection-invariant), so that `T_n(x†) = conj T_n(x)` of Subfactors 3.2 is the composite of the two.
Identify the Hermitian form: `H_n(x, y) = tr̂(star(κ x) · y)`, the pairing of TemperleyLieb Layer 4
with the first argument conjugated.

- The diagram adjoint is a conjugate-linear anti-automorphism of `TLAlg ℂ δ n` for real `δ`, equal
  to `presentedTLEquiv ∘ † ∘ presentedTLEquiv⁻¹`.
- `κ` is a conjugate-linear ring isomorphism `TL_n(δ) → TL_n(conj δ)` fixing the generators,
  involutive, compatible with `strandIncl`, with `T_n^(conj δ)(κ x) = conj(T_n^δ(x))`.
- For real `δ`, `H_n(x, y) = tr̂(star(κ x) · y)` under `presentedTLEquiv`, and `H_n` is natural under
  `strandIncl` with factor `δ`.

**Checks.**

- On zero and one strands the algebra is ℂ (`algEquivOfLeOne`), `star` is the identity, `κ` and `†`
  are complex conjugation.
- On two strands `(i·e)† = −i·e`, while `star(i·e) = i·e`; a definition of the diagram adjoint that
  omitted `κ` would give the second value.
- At `δ = i`, `κ : TL_2(i) → TL_2(−i)` sends `e` to `e` and carries `e² = i·e` to `e² = −i·e`; no
  generator-fixing conjugate-linear map `TL_2(i) → TL_2(i)` exists (Subfactors 3.1's Check).
- On three strands the left–right reflection `reflect` of TemperleyLieb Layer 3 sends `e_1` to `e_2`,
  so it is neither `star` nor `†`; a test fixing only `e_1` on two strands would not see this.

*Needs:* Subfactors 3.1; TemperleyLieb Layer 3 (reflections), Layer 4 (`presentedTLEquiv`,
`star`, `tr̂`, the pairing); Tau Ceti `strandIncl`, `algEquivOfLeOne`, `e_ne_zero_two`; Mathlib
`RingQuot.lift`.

### 1.2 Hermitian cell forms and Gram anchors

Consume TemperleyLieb Layer 5's `CellModule ℂ δ n t` with `t` through strings, `0 ≤ t ≤ n`,
`t ≡ n (mod 2)`, of dimension `d_(n,p) = C(n,p) − C(n,p−1)` with `p = (n−t)/2`, and its bilinear
`cellForm`. For real `δ` define the Hermitian cell form `⟨u, v⟩_H := cellForm(κ u, v)`, with `κ`
conjugating the coefficients in the half-diagram basis. Prove it is sesquilinear and Hermitian
(the Gram matrix in the half-diagram basis is real symmetric), and prove the invariance
`⟨a·u, v⟩_H = ⟨u, a†·v⟩_H` from Layer 5's compatibility of `cellForm` with the action and 1.1's
identification of `†` with the reflection. Prove that the Hermitian and bilinear Gram matrices
coincide in the half-diagram basis, so their determinants agree, and that neither nondegeneracy
nor semisimplicity implies positivity of `⟨·,·⟩_H`.

Restate Layer 5's universal Gram identity in the through-string labelling as the rational-function
identity, for `p = (n−t)/2`,

```
det G_(n,t) = Π_(j=1)^p ([t+1+j]/[j])^(d_(n,p−j))
```

(Ridout–Saint-Aubin, Theorem 4.7, equation (4.20), printed p. 20; their `G_(n,p)` with `p` arcs is
this `G_(n,n−2p)`), and prove it from the polynomial identity before specialisation, never from a
quotient of evaluated zero denominators.

- `⟨·,·⟩_H` is a Hermitian form on `CellModule ℂ δ n t`, invariant under the `†`-twisted action.
- Its Gram matrix equals Layer 5's bilinear Gram matrix, and `det G_(n,t)` is the evaluation of
  `gramPoly n t`.
- The anchors `det G_(2,0) = δ`, `det G_(3,1) = δ² − 1 = [3]`, `det G_(4,2) = δ³ − 2δ = [4]`,
  `det G_(4,0) = δ²(δ² − 1) = [2]²[3]`, `det G_(5,1) = [3]⁴(δ² − 2)` agree with Layer 5's anchors.

**Checks.**

- `n = 5`, `t = 1`, `p = 2`: the formula gives `([3]/[1])^(d_(5,1)) ([4]/[2])^(d_(5,0))` with
  `d_(5,1) = 4`, `d_(5,0) = 1`, that is `[3]⁴(δ² − 2)`, Layer 5's anchor. A formula with
  exponent `d_(n,j)` instead of `d_(n,p−j)` gives `[3]⁴(δ² − 2)⁵`, since `d_(5,2) = 5`.
- At `δ = 1/2`, `n = 3`, `t = 1`: `G = [[δ, 1], [1, δ]]` has determinant `−3/4`, so `⟨·,·⟩_H` is
  nondegenerate and indefinite; positivity is not a consequence of nondegeneracy.
- At `δ = 0`: `det G_(3,1) = −1 ≠ 0` and `det G_(3,3) = 1`, so `TL_3(0)` is semisimple with an
  indefinite cell form, while `det G_(2,0) = 0` and `TL_2(0)` is not semisimple (Ridout–Saint-Aubin,
  Corollary 4.8 and the remarks after it, and Proposition 4.9, printed pp. 20–21). The parity
  exception of Layer 5 is recovered, not reproved.
- At `δ = 1`, `n = 2`: both cell forms are nondegenerate (`det G_(2,0) = 1`, `det G_(2,2) = 1`), so
  all cell radicals vanish, while 1.3 gives `R_2 = ℂ f_2 ≠ 0`: cell radicals and the trace radical
  are different objects.

*Needs:* TemperleyLieb Layer 5; 1.1; Subfactors 3.2 (`R_n`).

### 1.3 Trace radicals, negligible ideals and the Jones quotient

Prove that `presentedTLEquiv` carries Subfactors 3.2's trace radical `R_n` onto the endomorphism
component `negligibleIdeal (n, n)` of TemperleyLieb Layer 6: both are `{x : tr̂(x ≫ g) = 0 for all
g : n → n}` once `T_n` is identified with `tr̂` by TemperleyLieb Layer 4's comparison. Prove that
`R_n` is `†`-stable, `star`-stable and `κ`-compatible, and that it is carried into `R_(n+1)` by
`strandIncl` and onto `R_n` by Layer 4's `condExp`.

For `δ = 2cos(π/m)`, `m ≥ 3`, prove the structure of `R_n`:

- `R_n = 0` for `n ≤ m − 2`;
- `R_(m−1) = ℂ·f_(m−1)` (Penneys, Facts 4.4.14 (TB7), printed p. 155);
- for `n ≥ m − 1`, `R_n` is the span of the diagrams containing `f_(m−1)` as a subdiagram, equal
  to the two-sided ideal of `TL_n` generated by the embedded copies `1_a ⊗ f_(m−1) ⊗ 1_b`
  (Penneys, Definition 4.5.1 and Proposition 4.5.3, printed p. 158), and equal to the two-sided
  ideal generated by the single element `ι^(n−m+1)(f_(m−1))` (Iohara–Lehrer–Zhang, Proposition 3.1,
  with their `ℓ = m`).

Derive the first two from Subfactors 3.3's structure theorem (paths of length at most `m − 2` on
`A_(m−1)` are paths on the half-line, so `dim Q_n = catalan n` there, and exactly the straight path
is lost at length `m − 1`); derive the third from TemperleyLieb Layer 6's Goodman–Wenzl theorem by
comparing the `(n,n)`-component of the tensor ideal generated by `f_(m−1)` with the two-sided
ideal generated by its embeddings, and the embeddings with the single generator through the
cup-and-cap diagrams that slide a clasp. Identify Subfactors 3.3's `Q_n` with the endomorphism
algebra of the object `n` in TemperleyLieb Layer 7's `MonoidalQuotient` of `TL(ℂ, δ)` by the
negligible ideal, as *-algebras for the descended `†`, and prove the dimension formula
`dim Q_n = Σ_t (#paths_(n,t))²` equals the number of `(n,n)`-diagrams with fewer than `m − 1`
through strings (Penneys, Exercise 4.5.4, printed p. 158).

- `presentedTLEquiv(R_n) = negligibleIdeal (n, n)`; `R_n` is stable under `†`, `star`, `strandIncl`
  and `condExp`.
- At `δ = 2cos(π/m)`: `R_n = 0` for `n ≤ m − 2`, `R_(m−1) = ℂ f_(m−1)`, and for `n ≥ m − 1` the
  three descriptions above agree.
- `Q_n ≅ End(n)` in the negligible quotient category, as *-algebras, with
  `dim Q_n = Σ_t (#paths_(n,t))²`.

**Checks.**

- `δ = 1` (`m = 3`): `TL_2 = ℂ ⊕ ℂ` is semisimple, `f_2 = 1 − e` is a nonzero idempotent spanning
  `R_2`, `Q_2 = ℂ`, and `Q_n = ℂ` for every `n` since `A_2` has one path of each length from `0`.
  The Jacobson radical of `TL_2(1)` is zero: the trace radical is not the Jacobson radical.
- `δ = √2` (`m = 4`): `R_2 = 0`, `dim Q_2 = 2`; `R_3 = ℂ f_3` with `dim Q_3 = 4 = 5 − 1`, the two
  `3`-step paths on `A_3` from `0` both ending at `1`; the diagrams of `TL_3` with fewer than `3`
  through strings number `4`.
- `δ = 2`: every `[r] = r ≠ 0`, `R_n = 0`, `Q_n = TL_n` and `Σ_t (#paths_(n,t))² = catalan n`.
- `δ = 1`, `n = 3`: the ideal generated by `f_2 ⊗ 1` has codimension one, since in the quotient
  `e_1 = 1` forces `e_2 = e_1 e_2 e_1 = 1`; so it is all of `R_3`, whose codimension is `dim Q_3 = 1`.

*Needs:* Subfactors 3.2 (`R_n`, `f_k`), 3.3 (`Q_n`, `π_n`); TemperleyLieb Layer 4 (trace
comparison, `condExp`), Layer 6 (`jonesWenzl`, `negligibleIdeal`, Goodman–Wenzl), Layer 7
(`MonoidalQuotient`); 1.1.

### 1.4 Path models and block idempotents

Compare Subfactors 3.3's path model with the algebraic path and block idempotents of TemperleyLieb
Layers 6–7 (the idempotents of Goodman–Wenzl's §2.4 that Layer 6 exposes, and Penneys's tree basis,
Facts 4.4.14 (TB1)–(TB5), printed pp. 154–155). Construct the paths on the half-line from `0` with
steps `±1` and nonnegative heights, and on `A_(m−1)` with heights `0, …, m − 2`, with enumeration by
length and endpoint, restriction, extension, concatenation and reversal; prove that the number of
`n`-step paths from `0` to `t` on the half-line is `halfCount n t`, and consume TemperleyLieb
Layer 1's half-diagram/path bijection. Prove that the algebraic matrix units (defined over any field
where `[1], …, [n+1]` are nonzero, without square roots) and the Hermitian matrix units of `π_n`
(normalised by the positive square roots `√([s]/[s+1])` of the positive weight ratios) have the same
diagonal idempotents and differ off the diagonal by positive scalars; that a system of matrix units
with `(E_(p,q))† = E_(q,p)` and the given diagonal idempotents is determined up to conjugation by a
diagonal unitary (one phase per path), and the positive square roots select the system in which
every Hermitian unit is a positive multiple of the algebraic one; and that a different choice of
signs of the square roots conjugates the system by a diagonal sign matrix. Prove the block trace formula `T_n(x) = Σ_t [t+1] Tr(x_t)` on
the algebraic side, the identity `Σ_t (#paths_(n,t)) [t+1] = δ^n`, and the branching rule: the
inclusion `Q_n → Q_(n+1)` sends the block `t` into the blocks `t ± 1` with multiplicity one each where
the vertex exists, and `E_n` on blocks is the scaled partial trace. In the root-of-unity case the
quotient `Q_n` of 1.3 replaces any attempt to extend matrix units through a vanishing `[m]`.

- Path sets with their enumeration API; `#paths_(n,t) = halfCount n t` on the half-line.
- Algebraic and Hermitian matrix units agree on the diagonal and differ by positive scalars off it;
  the Hermitian normalisation is unique up to a diagonal unitary.
- `T_n(x) = Σ_t [t+1] Tr(x_t)` and `Σ_t (#paths_(n,t)) [t+1] = δ^n`; the branching rule and the block
  form of `E_n`.

**Checks.**

- `n = 2`, any `δ`: the paths `0→1→0` and `0→1→2` have weights `[1] = 1` and `[3] = δ² − 1`, summing
  to `δ²`. With unit weights the sum is `2`, and already `T_1(1) = 1 ≠ δ`.
- `δ = 1`, `n = 3`: on `A_2` the single path `0→1→0→1` has weight `[2] = 1 = δ³`.
- `δ = (1+√5)/2` (`m = 5`): the weights on `A_4` are `[1] = 1`, `[2] = δ`, `[3] = δ`, `[4] = 1`; the
  `3`-step paths from `0` end at `1` twice and at `3` once, and `2δ + 1 = δ³`.
- `n = 4` on the half-line: `#paths_(4,0) = 2`, `#paths_(4,2) = 3`, `#paths_(4,4) = 1` are
  `halfCount 4 0`, `halfCount 4 2`, `halfCount 4 4`, and `4 + 9 + 1 = 14 = catalan 4`.
- Choosing `−√[s]` in place of `√[s]` at one vertex changes the sign of every matrix unit crossing
  that vertex and leaves the diagonal idempotents unchanged.

*Needs:* Subfactors 3.3; TemperleyLieb Layer 1 (`halfCount`, the half-diagram/path bijection),
Layers 6–7 (path and block idempotents); 1.3.

### 1.5 Positive spin matrices and the Powers-state comparison

This section realises the positive-parameter Temperley–Lieb tower on spin chains, following the
statement that the Jones trace is the restriction of a Powers product state (Jones, *A polynomial
invariant for knots via von Neumann algebras*, printed p. 104, crediting Temperley–Lieb and
Pimsner–Popa). Fix `t > 0`, put `r = √t > 0`, `δ = r + r⁻¹ ≥ 2` and `τ = δ⁻² = t/(1+t)²`. The
one-site basis of `ℂ²` is indexed by `Bool` with `false = 0`, `true = 1`, and the two-site basis is
ordered `00, 01, 10, 11`. On `m` sites the configuration space is `Fin m → Bool`, of cardinality
`2^m`, with its standard Hilbert norm.

Define the one-site density `D_t = diag(1, t)/(1+t)` and the two-site matrix

```
p_t = (1/(1+t)) [[0, 0, 0, 0],
                 [0, 1, r, 0],
                 [0, r, t, 0],
                 [0, 0, 0, 0]].
```

Let `p_i` act by `p_t` on the sites `i, i+1` and by the identity elsewhere. Prove that `p_t` is the
orthogonal projection onto the line spanned by `(0, 1, r, 0)`, that the `p_i` satisfy
`p_i p_(i±1) p_i = τ p_i` in both orders and commute at distance at least two, and that
`δ p_i` is the native generator matrix `spinRep (−r) hδ (e δ i)` of Tau Ceti's spin
representation: at `q = −r` the native cup and cap give `e_i` the block `[[r⁻¹, 1], [1, r]]` on
`01, 10`. Prove that `spinRep` at `q = −r` intertwines Subfactors 3.1's adjoint `†` with the
conjugate transpose of matrices; the native complex-parameter spin representation carries no
star structure, and this compatibility is the positive-real input of the section.

Define `φ_m(X) = Tr(D_t^(⊗m) X)` on `m`-site matrices, with `D_t^(⊗0) = 1`. Prove that `φ_m` is a
faithful state, that `D_t^(⊗m)` commutes with every `spinRep (e δ i)` (Tau Ceti's
`commute_diagonal_spinWeight_spinRep`, since the native weight matrix at `q = −r` is
`diag(r⁻¹, r)^(⊗m) = δ^m D_t^(⊗m)`), and hence that `φ_m` restricts to a trace on the image of
`TL_m`, while for `m ≥ 1` it is a trace on all `m`-site matrices exactly when `t = 1`. Prove the
two one-site slices of `p_t`: the last-site slice `(id ⊗ φ_1)(p_t) = τ I₂` and the first-site slice
`(φ_1 ⊗ id)(p_t) = diag(t², 1)/(1+t)²`. The last-site slice uses the ordering `Fin.snoc`, which is
compared with Tau Ceti's `Matrix.extendLast` explicitly. Prove `φ_(m+1)(ι x) = φ_m(x)` and
`φ_(m+1)(ι(x) p_m) = τ φ_m(x)` on the image of `TL_m`, and conclude

```
T_m(x) = δ^m φ_m(spinRep (−r) hδ x)      for x ∈ TL_m,
```

either from Markov uniqueness (Subfactors 3.2) or directly from Tau Ceti's `markovTrace_apply`.
For `δ ≥ 2` identify `ker spinRep` with `R_m` by faithfulness of `φ_m`; with Subfactors 3.2–3.3
(`R_m = 0` for `δ ≥ 2`) the spin representation is faithful. This deduction uses the positivity
theorem and is not an input to it.

Pass to infinitely many sites. On the one-site Hilbert–Schmidt space `HS(ℂ²)` with
`⟨A, B⟩ = Tr(A* B)` and unit vector `D_t^(1/2)`, with `M₂(ℂ)` acting by left multiplication, take
VonNeumannAlgebras V2's incomplete tensor product with reference vectors `D_t^(1/2)`. Identify
its finite prefixes with the GNS representations of the `φ_m` (VonNeumannAlgebras V0), and define
the Powers product state `φ = ⊗ φ_1` on the weak closure of the local algebras. Prove that the
product vector is cyclic and separating, and that the modular group of `φ` acts locally by
`X ↦ D_t^(is) X D_t^(−is)` (VonNeumannAlgebras V10); every `δ p_i` is fixed, so `φ` restricts to a
normal faithful trace on the weak closure of the Temperley–Lieb tower, and for `t ≠ 1` it is not
a trace on the ambient algebra. Let `K` be the closure of the Temperley–Lieb algebra applied to
the product vector. Construct the generator-preserving unitary from the trace-GNS space of
Subfactors 3.3's `B_δ` onto `K`, intertwining the local inclusions, the C*-inductive limit and its
weak closure, and obtain the normal *-isomorphism of Subfactors 3.3's weak closure with the
weak closure of the tower acting on `K`. `K` is a proper subspace of the product Hilbert space:
already on two sites the cyclic subspace has dimension `2` inside a space of dimension `16`.

- `p_t` is a rank-one orthogonal projection, `δ p_i = spinRep (−r) hδ (e δ i)`, and
  `spinRep (−r) hδ (x†) = (spinRep (−r) hδ x)ᴴ`.
- `φ_m` is a faithful state commuting with the Temperley–Lieb image; it is tracial on the image,
  and tracial on all matrices exactly when `t = 1` or `m = 0`.
- The last-site slice of `p_t` is `τ I₂`, the first-site slice is `diag(t², 1)/(1+t)²`, and the
  Markov property `φ_(m+1)(ι(x) p_m) = τ φ_m(x)` holds on the image.
- `T_m = δ^m · φ_m ∘ spinRep (−r) hδ` on `TL_m`, and `ker spinRep = R_m = 0` for `δ ≥ 2`.
- The Powers state `φ` is faithful and normal with cyclic separating product vector, restricts to
  a normal trace on the tower's weak closure, and the cyclic subspace `K` carries the trace-GNS
  representation of `B_δ`, unitarily and compatibly with inclusions.

**Checks.**

- At `t = 1`: `r = 1`, `δ = 2`, `τ = 1/4`, `D_1 = I₂/2`, `p_1` is the projection onto
  `(01 + 10)/√2` and `φ_m` is the normalised matrix trace. A convention putting `t` on the `0`
  entry of `D_t` gives the same value here and is separated only by the next Check.
- At `t = 4` (`r = 2`, `δ = 5/2`, `τ = 4/25`): the last-site slice of `p_4` is `(4/25) I₂`
  (entries `p_(01,01) D_(1,1) = (1/5)(4/5)` and `p_(10,10) D_(0,0) = (4/5)(1/5)`), while the
  first-site slice is `diag(16/25, 1/25)`; slicing on the wrong side gives a non-scalar matrix and
  breaks the Markov property.
- Simultaneous spin flip at every site sends `D_t` to `D_(1/t)` and `p_t` to `p_(1/t)` (the block
  `[[t, r], [r, 1]]/(1+t)` is `[[1, r⁻¹], [r⁻¹, t⁻¹]]/(1 + t⁻¹)`), and sends `spinRep (−r)` to
  `spinRep (−r⁻¹)`; the loop value `δ` is unchanged. This pins the reciprocal-parameter convention.
- At `q = −r` the native weights are `markovWeight false = r⁻¹`, `markovWeight true = r`; dividing
  by `δ` gives `1/(1+t)` and `t/(1+t)`, the diagonal of `D_t`. Using `q = r` instead gives the
  loop value `−δ` and negative weights.
- Dimensions: `TL_m` has `m − 1` generators on `m` sites, the spin space has dimension `2^m`, the
  finite product-state GNS space has dimension `4^m`, and the cyclic subspace of `TL_m` has
  dimension `dim TL_m = catalan m` for `δ ≥ 2`; at `m = 2` these are `4`, `16` and `2`. Jones's
  `A_n` with `n` projections is `TL_(n+1)` here.

*Needs:*

- Subfactors 3.1 (`†`), 3.2 (Markov uniqueness, `R_n`), 3.3 (`B_δ`, its trace-GNS representation
  and weak closure).
- Tau Ceti `spinRep`, `spinGenerator`, `spinWeight`, `markovWeight`, `markovTrace_apply`,
  `commute_diagonal_spinWeight_spinRep`, `Matrix.extendLast`, `spinRep_strandIncl`.
- Mathlib `Matrix.kronecker`, `Matrix.trace`, `Matrix.PosDef`, `Fin.snoc`.
- CStarAlgebras C1 (finite-dimensional C*-algebras) and C5 (inductive limits).
- VonNeumannAlgebras V0 (GNS), V2 (incomplete tensor products with reference vectors and slice
  maps), V4 (normal representations) and V10 (modular theory), for the infinite-site statements
  only.

### 1.6 Finite Potts models, planar loops and the ice-model comparison

This section proves the finite partition-function identities behind the Temperley–Lieb
equivalence of the Potts and ice-type models (Jones, printed p. 104; Temperley–Lieb 1971;
Baxter–Kelland–Wu 1976). It is algebraic and finite: no infinite-volume state is used.

**Potts and Fortuin–Kasteleyn sums.** A graph is Mathlib's `Graph V E`, which allows loops and
parallel edges; write `V_G` and `E_G` for its vertex and edge sets and assume both finite (the
ambient types need not be). For `A ⊆ E_G` let `G_A` be the spanning restriction `G.restrict A`,
which keeps every vertex, and let `k(A)` be its number of connected components, isolated vertices
included, computed as `Nat.card` of `SimpleGraph.ConnectedComponent` of `G_A.toSimpleGraph`
(GraphConnectivityAndFlows 1.1's component count). Passing to the simple graph is used for
connectivity only; edge products and contractions keep the original edges. For a commutative ring
`R`, `Q ∈ R` and weights `v : E_G → R` define

```
Z_FK(G; Q, v)    = Σ_(A ⊆ E_G) Q^k(A) Π_(e ∈ A) v_e,
Z_Potts(G; q, v) = Σ_(σ : V_G → Fin q) Π_(e ∈ E_G) (1 + v_e [σ(u_e) = σ(w_e)])    (q ∈ ℕ),
```

where `u_e, w_e` are the ends of `e` (the factor does not depend on their order, and is `1 + v_e`
for a loop). Prove `Z_Potts(G; q, v) = Z_FK(G; q, v)` for every `q ∈ ℕ`, including `q = 0`, by
expanding the product over edge subsets and counting colourings constant on the components of
`G_A`. Prove invariance under graph isomorphism and base change, the empty-edge value `Q^|V_G|`,
multiplicativity on disjoint unions, and the recursions

```
Z_G = Z_(G∖e) + v_e Z_(G/e)     (e not a loop),
Z_G = (1 + v_e) Z_(G∖e)         (e a loop),
Z_G = (Q + v_e) Z_(G/e)         (e a bridge),
```

where `G/e` deletes `e` and applies `Graph.map` to the quotient of `V_G` identifying the ends of
`e`, keeping the loops and parallel edges this creates. For real `β`, couplings `J_e` and
`v_e = exp(β J_e) − 1`, `Z_Potts` is the Boltzmann sum of the `q`-state Potts model. For `q ≥ 1`
and `v_e ≥ 0` construct the Edwards–Sokal coupling as a finite `PMF` on pairs `(σ, A)` and prove
both marginals: given `σ`, the edges with equal end colours are independently present with
probability `v_e/(1+v_e)` and the others absent; given `A`, the components of `G_A` are coloured
independently and uniformly.

**Ribbon structure and planar loops.** A ribbon structure on `G` is a cyclic order of the
half-edges at each vertex. Encode it by Tau Ceti's `BipartiteRibbonGraph` on the incidence
subdivision: black vertices are the non-isolated vertices of `G`, white vertices are its edges
(of degree two, a loop contributing its two half-edges), and the white rotation is the
half-edge involution; isolated vertices are recorded separately, since the endpoint maps of
`BipartiteRibbonGraph` are surjective. For `A ⊆ E_G` let `ell(A)` be the number of boundary
circles of the surface obtained from a disc at each vertex and a band along each edge of `A`,
computed from the orbits of `facePerm` of the restricted ribbon graph plus one circle per vertex
of degree zero in `G_A`. Let `g(A)` be the sum of the genera of the connected components of this
surface, an isolated vertex having genus zero. Prove the Euler relation

```
ell(A) = 2 k(A) + |A| − |V_G| − 2 g(A)
```

in ℤ, componentwise from Tau Ceti's `BipartiteRibbonGraph.IsConnected.two_sub_two_mul_genus`.
`BipartiteRibbonGraph.genus` of a disconnected ribbon graph is not this sum and is not used for
it. A plane graph (a ribbon structure of genus zero on `G = G_(E_G)`) has `g(A) = 0` for every `A`,
since deleting bands does not increase genus. For a unit `δ` with `Q = δ²` conclude

```
Z_FK(G; δ², v) = δ^|V_G| Σ_(A ⊆ E_G) δ^ell(A) Π_(e ∈ A) (v_e / δ)     (G plane),
```

and for a general ribbon structure the same identity with `ell(A) + 2 g(A)` in place of `ell(A)`.
Every closed circle is evaluated as `δ`, the unnormalised closure of Tau Ceti's `markovTrace`.

**The medial network and the six-vertex model.** Over ℂ fix `r ∈ ℂˣ` with `δ = r + r⁻¹ ≠ 0`
and native parameter `q = −r`, and order `ℂ² ⊗ ℂ²` as `00, 01, 10, 11`. For a four-leg vertex let
`I` be the through resolution and `E` the cup–cap resolution, and put `L(a, b) = a I + b E`, so

```
L(a, b) = [[a, 0,         0,         0],
           [0, a + b r⁻¹, b,         0],
           [0, b,         a + b r,   0],
           [0, 0,         0,         a]].
```

The native cup and cap at `q = −r` are `C = [[0, 1], [r, 0]]` and `A = [[0, r⁻¹], [1, 0]] = C⁻¹`,
indexed by `0, 1`; they satisfy both snake identities and `Σ_(a,b) A_ab C_ab = δ`. Define the
rotation of a four-leg tensor by `Rot(T)_(ab,cd) = Σ_(u,v) C_au T_(bv,uc) A_vd`. Prove
`Rot(I) = E`, `Rot(E) = I`, and that `Rot⁴` is conjugation by `W_r ⊗ W_r` with
`W_r = diag(r⁻¹, r)`, which is the identity on the span of `I` and `E` (Tau Ceti's
`diagonal_spinWeight_mul_spinGenerator`). The medial graph of a plane graph has a vertex on each
edge `e`; in a chart where "edge absent" is `I` and "edge present" is `E`, the vertex carries
`L(1, v_e/δ)`, and in the rotated chart `L(v_e/δ, 1)`, so that `v_e = 0` needs no division.
Construct the evaluation of planar Temperley–Lieb diagrams with these vertices as spin tensors
from the cup, cap and `L` matrices, prove that it is independent of the decomposition into
elementary slices, and compatible with composition, juxtaposition and the chart changes. Define the
ice partition function `Z_ice` as the sum over edge labels of the medial graph of the product of
the vertex entries and the boundary cups and caps; the nonzero entries of `L` are the six
arrow configurations obeying the two-in two-out rule. Prove

```
Z_Potts(G; q, v) = Z_FK(G; q, v) = δ^|V_G| Z_ice      (G plane, q = δ² ∈ ℕ).
```

For an `m`-strand element `X` closed in the plane, prove that the closure equals
`Tr(W_r^(⊗m) spinRep (−r) hδ X)`, which is `markovTrace (−r) hδ X`; if the closing cups and caps are
contracted explicitly, `W_r` is not inserted again. For real `r > 0`, `W_r = δ D_(r²)` and this is
`δ^m φ_m(spinRep X)` of 1.5. For real `r > 0` and `a, b ≥ 0` the entries of `L(a, b)` are
nonnegative; for `0 < Q < 4` the solutions of `r + r⁻¹ = √Q` lie on the unit circle, so the local
weights are complex.

**Wired boundaries.** Free boundary sums over all colours. For a noncrossing partition `ξ` of a
set of vertices on the outer face, the `ξ`-wired sum requires equal colours within each block,
each block's colour still summed freely. Prove `Z_wired(G, ξ) = Z_FK(G/ξ; Q, v)`, where `G/ξ`
identifies each block to a vertex (keeping loops and parallel edges), with planar prefactor
`δ^|V_(G/ξ)|` in the loop identity, the noncrossing condition keeping `G/ξ` plane. Construct the
matching medial caps and ice boundary tensors. For one nonempty wired block and `q ≥ 1`, fixing
that block's colour divides `Z_wired` by `q`.

- `Z_Potts(G; q, v) = Z_FK(G; q, v)` for `q ∈ ℕ`, with the deletion–contraction, loop and bridge
  recursions and the Edwards–Sokal marginals.
- `ell(A) = 2k(A) + |A| − |V_G| − 2g(A)`, and the loop expansion of `Z_FK(G; δ², v)` for plane `G`,
  with the genus-corrected form for ribbon graphs.
- `L(a, b)` is the spin image of `a·1 + b·e`, the rotation exchanges `I` and `E`, and
  `Rot⁴ = Ad(W_r ⊗ W_r)`.
- `Z_FK = δ^|V_G| Z_ice` for plane graphs, the planar closure of `X` is `markovTrace (−r) hδ X`, and
  the wired identities hold.

**Checks.**

- An edgeless graph on `n` vertices: `Z_FK = Q^n`, `ell(∅) = n` and the loop sum is
  `δ^n δ^n = Q^n`; a definition of `k` that ignored isolated vertices gives `1`.
- One non-loop edge `e`: `Z_FK = Q² + Q v_e`; the loop sum gives `δ²(δ² + δ · v_e/δ)`, the same.
  `Z_Potts` at `q = 0` is `0`, at `q = 1` is `1 + v_e`.
- One loop: `Z_FK = Q(1 + v_e)`, and the band of an untwisted loop has two boundary circles, so
  `ell({e}) = 2 = 2·1 + 1 − 1 − 0`; counting one circle would give `Q + δ v_e`.
- Two parallel edges between two vertices: `Z_FK = Q² + 2Qv + Qv²` (equal weights `v`), and the
  plane embedding gives `ell = 2, 1, 1, 2` on `∅, {e}, {f}, {e, f}`; a simple-graph model that
  merged the edges would give `Q² + Qv`.
- `Rot(I) = E` and `Rot(E) = I` at `r = 2`, while on the elementary tensor with the single entry
  `T_(00,01) = 1` the fourth rotation multiplies by `w_0 w_0 / (w_0 w_1) = r⁻²` with
  `w = (r⁻¹, r)`, so `Rot⁴ ≠ id`.
- At `r = 1`: `δ = 2`, `Q = 4`, `W_r = I`, and the closure of `1 ∈ TL_m` is `2^m = δ^m`.
- Wiring the two ends of a single edge gives `G/ξ` a vertex with a loop, and `Z_wired` is the
  one-loop value `Q(1 + v_e)`.

*Needs:*

- Mathlib `Graph`, `Graph.restrict`, `Graph.map`, `Graph.toSimpleGraph`,
  `SimpleGraph.ConnectedComponent`, `Finset.powerset`, `PMF`.
- GraphConnectivityAndFlows 1.1 (component counts of edge-labelled graphs and the simple-graph
  bridge).
- Tau Ceti `BipartiteRibbonGraph`, `facePerm`, `BipartiteRibbonGraph.IsConnected.two_sub_two_mul_genus`
  (BelyiMaps Layer 2 is the roadmap owning them).
- Tau Ceti `spinRep`, `spinCup`, `spinCap`, `spinWeight`, `markovTrace_apply`,
  `diagonal_spinWeight_mul_spinGenerator`.
- TemperleyLieb Layers 2–4 (diagram category, linear category, presentation and closure trace).
- 1.5 for the comparison with `φ_m` only.

### 1.7 The Jones quotient at `δ = √2` as an even Clifford algebra

At Jones's parameter `t = i` (Jones, printed p. 107) fix `u = exp(πi/4)`, so `δ = u + u⁻¹ = √2`
and `τ = 1/2`; the native quantum parameter is `−u`. This section identifies Subfactors 3.3's
quotient `Q_m` at `δ = √2` with an even Clifford algebra, preserving generators, traces and
adjoints (Iohara–Lehrer–Zhang, *The Jones quotients of the Temperley–Lieb algebras*, §5.3,
Theorem 5.4 and Proposition 5.5, where `γ_j = c_j/√2`). It consumes the positivity theorems of
Subfactors 3.2–3.3 and is not an input to them.

**Carriers.** Let `q_m = QuadraticMap.weightedSumSquares ℂ 1` on `Fin m → ℂ`, the complex
bilinear sum of squares, `Cl_m = CliffordAlgebra q_m`, `Cl_m⁰ = CliffordAlgebra.even q_m` and
`c_j = CliffordAlgebra.ι q_m (Pi.single j 1)` for `j : Fin m`. Then `c_j² = 1` and
`c_j c_k = −c_k c_j` for `j ≠ k` (Mathlib `CliffordAlgebra.ι_sq_scalar`,
`CliffordAlgebra.ι_mul_ι_add_swap`). Identify `q_m` with the complexification of the real sum
of squares and transport SpinGeometry G1's conjugation `κ`, analytic adjoint
`a† = κ(reverse a)` and scalar trace (G1 items 1 and 3) to `Cl_m`: `c_j† = c_j`, `(i·1)† = −i·1`,
and `Cl_m⁰` is `†`-stable. Mathlib's `star` on `CliffordAlgebra` is `reverse ∘ involute`; it
negates `c_j` and is complex-linear, so it is not `†`. Let `s_m` be the coefficient of `1` in the
ordered monomial basis `c_S` (`S ⊆ Fin m` increasing), compared with Tau Ceti's
`CliffordAlgebra.basis`; from SpinGeometry G1 item 3, `s_m` is cyclic, equals `2^(−m) Tr(L_a)`,
and `s_m(a† a) = Σ_S |a_S|²`, so it is faithful on `Cl_m` and on `Cl_m⁰`.

**The comparison map.** For `j < m − 1` put `d_j = c_j c_(j+1)`, `p_j = (1 + i d_j)/2` and
`E_j = √2 p_j`. Prove `d_j² = −1`, `d_j† = −d_j`, `p_j† = p_j = p_j²`,
`p_j p_(j±1) p_j = p_j/2`, and that `p_j, p_k` commute for `|j − k| ≥ 2`. Hence `TemperleyLieb.lift`
gives `F_m : TL_m(√2) →ₐ[ℂ] Cl_m⁰` with `F_m(e δ j) = E_j`, compatible with `†`. Prove `F_m`
surjective: for `a < b`, `c_a c_b = d_a d_(a+1) ⋯ d_(b−1)` (the inner factors square to `1`),
and `d_j = −i(2p_j − 1)`, so the image contains every even monomial;
for `m ≤ 1` both sides are ℂ. For the coordinate inclusion `J_m = CliffordAlgebra.map` of the
isometry `Fin m → ℂ ↪ Fin (m+1) → ℂ`, prove injectivity, preservation of `Cl⁰`, `†` and `s`, and
`s_(m+1)(J_m(x) p_(m−1)) = s_m(x)/2` for `x ∈ Cl_m⁰`, `m ≥ 1` (the terms containing `c_m` have
no scalar coefficient). By Markov uniqueness (Subfactors 3.2)

```
T_m(x) = (√2)^m s_m(F_m x)        for x ∈ TL_m(√2).
```

Then `ker F_m = R_m`: `R_m ⊆ ker F_m` because `s_m` is faithful and `F_m` is surjective, and
`ker F_m ⊆ R_m` from the trace identity. So `F_m` induces a trace-, adjoint- and
inclusion-preserving *-isomorphism `Q_m ≅ Cl_m⁰`, and by 1.3 `ker F_m` is generated by the
embedded `f_3` for `m ≥ 3` and is zero for `m ≤ 2`.

**Blocks, Pauli matrices and the tower.** By SpinRepresentations Layers 0–1, for `m = 2k+1`,
`Cl_m⁰ ≅ M_(2^k)(ℂ)` with `s_m` the normalised matrix trace, and for `m = 2k ≥ 2`,
`Cl_m⁰ ≅ M_(2^(k−1))(ℂ) ⊕ M_(2^(k−1))(ℂ)` with `s_m` half the sum of the normalised traces; so
`dim Q_m = 2^(m−1)` for `m ≥ 1` and `dim Q_0 = 1`. For even `m = 2k ≥ 2` the blocks are the
eigenspaces of the central self-adjoint unitary `P_m = i^k c_0 c_1 ⋯ c_(m−1)`, with projections
`(1 ± P_m)/2`. Realise `c_(2a) = Z^(⊗a) ⊗ X ⊗ I^(⊗(k−a−1))` and
`c_(2a+1) = Z^(⊗a) ⊗ Y ⊗ I^(⊗(k−a−1))` on `k` qubits, with Pauli matrices `X = [[0,1],[1,0]]`,
`Y = [[0,−i],[i,0]]`, `Z = diag(1,−1)`, and for `m = 2k+1` add `c_(2k) = Z^(⊗k)`; prove that this
realises the block isomorphisms with `†` the conjugate transpose and `s_m` the normalised trace on
`Cl_m⁰`. Identify the blocks with the path blocks of 1.4 on `A_3`: labels `0, 2` (the two signs of
`P_m`, the correspondence fixed by explicit projections) for even `m`, label `1` for odd `m`.
Compute the inclusions `J_m` on blocks (`M_d ⊕ M_d → M_(2d)` from even to odd `m`, diagonal
`M_d → M_d ⊕ M_d` from odd to even), and prove that the trace-preserving conditional expectation
`Cl_(m+1)⁰ → Cl_m⁰` deletes the monomials containing `c_m` and is Subfactors 3.3's `E_m`.

**Jones's generator convention.** Jones's `A_n` with `n` projections is `Q_(n+1) ≅ Cl_(n+1)⁰`,
of dimension `2^n`. For `m ≥ 1` the elements `a_j = i c_j c_(m−1)`, `j < m − 1`, are self-adjoint,
square to `1` and anticommute, and give an ungraded *-isomorphism `Cl_(m−1) ≅ Cl_m⁰` under which
`p_j = (1 + i a_j a_(j+1))/2` for `j < m − 2` and `p_(m−2) = (1 + a_(m−2))/2`; this is the sense in
which "the `A_n` are Clifford algebras". The tower maps in these coordinates are not the coordinate
inclusions of `Cl_(m−1)`. Compare with Mathlib's `CliffordAlgebra.equivEven`.

**Braid units.** Put `g_j = u((1+i) p_j − 1) = −(1 + d_j)/√2`. Prove `g_j⁻¹ = −(1 − d_j)/√2`,
`g_j² = d_j`, `g_j⁴ = −1`, `g_j⁸ = 1`, the eigenvalues `i u` on `p_j` and `−u` on `1 − p_j`, and the
braid relations; this gives a unitary representation of Tau Ceti's `BraidGroup m` in `Cl_m⁰`. With
Tau Ceti's Kauffman-bracket representation `TemperleyLieb.jones a` at a unit `a` with
`a² = −u⁻¹` (so `jonesDelta a = √2`), `F_m(jonesUnit a j) = (−a/u) g_j`. Conjugation by `g_j`
sends `c_j ↦ −c_(j+1)`, `c_(j+1) ↦ c_j` and fixes the other `c_k`, so for `m ≥ 2` the conjugation
image is the group of signed permutation matrices of determinant `1`, of order `2^(m−1) m!`, and
the kernel of conjugation on the group generated by the `g_j` is `{±1}` (it lies in the centre of
`Cl_m⁰` and consists of real elements of norm one; `−1 = g_0⁴`). The image of `BraidGroup m` in
`Cl_m⁰` therefore has order `2^m m!` for `m ≥ 2`, and is trivial for `m ≤ 1`. For a braid `b` on
`m ≥ 1` strands, the Jones polynomial of its closure at `t = i` is
`(−√2)^(m−1) s_m(F_m(ρ(b)))` with `ρ` Jones's braid representation including its writhe
factor, the normalisation of the closure being GeometricTopology Layer 4's.

- `F_m : TL_m(√2) → Cl_m⁰` is a surjective `†`-homomorphism with `F_m(e_j) = √2 p_j`,
  `T_m = (√2)^m s_m ∘ F_m`, `ker F_m = R_m`, and `Q_m ≅ Cl_m⁰` as *-algebras with traces and
  inclusions.
- `Cl_m⁰` has the stated matrix blocks, Pauli realisation, path-label identification and tower
  maps, and the expectation deletes monomials containing the new generator.
- `g_j = −(1 + d_j)/√2` is unitary of order `8`, and the braid image has order `2^m m!` for
  `m ≥ 2`.

**Checks.**

- `m = 0, …, 5`: `Cl_m⁰` is `ℂ`, `ℂ`, `ℂ ⊕ ℂ`, `M_2(ℂ)`, `M_2(ℂ) ⊕ M_2(ℂ)`, `M_4(ℂ)`, of dimensions
  `1, 1, 2, 4, 8, 16`, matching `dim Q_3 = 4` of 1.3; a formula `dim Q_m = 2^m` fails at `m = 3`
  against `dim TL_3 − 1 = 4`.
- `s_2(p_0) = 1/2` and `T_2(e) = (√2)² · √2 · 1/2 = √2 = δ`; omitting the factor `(√2)^m` gives
  `T_2(1) = 1 ≠ 2`.
- `p_0 p_1 p_0 = p_0/2` in `Cl_3`, while with Mathlib's `star` in place of `†` one gets
  `star(p_0) = (1 − i d_0)/2 ≠ p_0`, so `p_0` would not be a projection.
- On `TL_2(√2)` the generator `g_0` has eigenvalues `−u` (on `1 − p_0`) and `i u` (on `p_0`), so
  `g_0` has order `8` and the image of `BraidGroup 2` has order `8 = 2² · 2!`.
- `F_3(f_3) = 0`: `f_3` spans `R_3` (1.3), and `F_3` maps the five-dimensional `TL_3` onto the
  four-dimensional `Cl_3⁰`.
- `a_j = i c_j c_(m−1)` satisfies `a_j² = −c_j c_(m−1) c_j c_(m−1) = 1`; without the factor `i`
  the square is `−1`.

*Needs:*

- Mathlib `QuadraticMap.weightedSumSquares`, `CliffordAlgebra`, `CliffordAlgebra.ι`,
  `CliffordAlgebra.even`, `CliffordAlgebra.map`, `CliffordAlgebra.equivEven`,
  `CliffordAlgebra.ι_sq_scalar`, `CliffordAlgebra.ι_mul_ι_add_swap`.
- Tau Ceti `CliffordAlgebra.basis` (`TauCeti/LinearAlgebra/CliffordAlgebra/Dimension.lean`),
  `TemperleyLieb.lift`, `BraidGroup`, `TemperleyLieb.jones`, `jonesUnit`, `jonesDelta`.
- SpinGeometry G1 items 1 and 3 (complexification, conjugation, analytic adjoint, scalar trace).
- SpinRepresentations Layers 0–1 (gradings and the structure of complex Clifford algebras).
- Subfactors 3.2 (Markov uniqueness, `R_m`), 3.3 (`Q_m`, `E_m`); 1.3 and 1.4.
- GeometricTopology Layer 4, for the closure normalisation only.

### 1.8 The Jones quotient at `δ = √3` and the cubic Gaussian braid model

At Jones's parameter `t = ζ = exp(πi/3)` (Jones, printed p. 107, where the `A_n` are related to a
"cubic Clifford algebra" and the braid image is finite) fix `u = exp(πi/6)`, `δ = u + u⁻¹ = √3`,
`τ = 1/3` and `ω = ζ² = exp(2πi/3)`; the native quantum parameter is `−u`. Indices are zero-based.

**The quantum torus.** For `N ≥ 0` let `V_N = Fin N → ZMod 3` and
`B(a, b) = Σ_(j < N−1) (a_j b_(j+1) − a_(j+1) b_j)`, an alternating form on `V_N`. Put
`α(a, b) = ω^(2 B(a, b))` (that is, `ω^(B/2)` with `1/2 = 2` in `ZMod 3`, exponents read in
`ZMod 3`), a normalised factor set (`TauCeti.IsFactorSet`) since `B` is biadditive, and let
`G_N = TauCeti.twistedMonoidAlgebra ℂ (Multiplicative V_N) α` with basis
`W(a) = TwistedMonoidAlgebra.of a`. Then `dim G_N = 3^N`, `W(a) W(b) = α(a,b) W(a+b)`, and
`U_j = W(e_j)` satisfy `U_j³ = 1`, `U_j U_(j+1) = ω U_(j+1) U_j` and commute at distance at least
two; prove that `G_N` is the universal algebra with these relations (from Tau Ceti's
`TwistedMonoidAlgebra.lift`). Define the conjugate-linear adjoint
`(Σ z_a W(a))† = Σ conj(z_a) W(−a)` and the trace `s_N(x) = ` coefficient of `W(0)`; prove `†`
is an anti-multiplicative involution with `U_j† = U_j⁻¹`, and `s_N(x† x) = Σ_a |x_a|²`, so `s_N`
is a faithful normalised trace and the left regular representation on the `W`-basis makes `G_N`
a finite-dimensional C*-algebra (CStarAlgebras C1). Negation gives the complex-linear involutive
automorphism `θ_N(W(a)) = W(−a)` commuting with `†`; let `C_N = AlgHom.equalizer θ_N id`. It has
basis `1` and `W(a) + W(−a)` over the nonzero pairs `{a, −a}`, so `dim C_N = (3^N + 1)/2`.

**The comparison map.** For `m ≥ 1` put `N = m − 1`, `p_j = (1 + U_j + U_j²)/3` and `E_j = √3 p_j`
for `j < N`. Prove `p_j† = p_j = p_j²`, `θ_N(p_j) = p_j`, `p_j p_(j±1) p_j = p_j/3` and commutation
at distance at least two, and obtain `F_m : TL_m(√3) →ₐ[ℂ] C_(m−1)` with `F_m(e δ j) = E_j` by
`TemperleyLieb.lift`, compatible with `†`. The inclusion `I_N : W(a) ↦ W(a, 0)` of `G_N` in
`G_(N+1)` preserves `†`, `θ` and `s`, and `s_(N+1)(I_N(x) p_N) = s_N(x)/3`. By Markov uniqueness
`T_m(x) = (√3)^m s_(m−1)(F_m x)`, and faithfulness of `s` with `†`-compatibility gives
`ker F_m = R_m` (for `x ∈ R_m`, `s(F_m(x) F_m(x)†) = 0`), without using surjectivity. Surjectivity
follows by dimension: Subfactors 3.3's path model on `A_5` gives `dim Q_m = D_m` with `D_1 = 1`,
`D_2 = 2`, `D_m = 4 D_(m−1) − 3 D_(m−2)`, so `D_m = (3^(m−1) + 1)/2 = dim C_(m−1)`, and the injective
map `Q_m → C_(m−1)` is onto. So `Q_m(√3) ≅ C_(m−1)` as *-algebras with traces and inclusions, and
by 1.3 `R_m` is generated by the embedded `f_5` for `m ≥ 5` and is zero below; at `m = 0` both sides
are `ℂ`.

**Blocks.** Compute the radical of `B` (zero for `N` even, spanned by `ρ = (1, 0, 1, 0, …, 1)` for
`N` odd) and a symplectic basis of a complement (Tau Ceti's
`LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`). With clock and shift matrices
`Z e_x = ω^x e_x`, `X e_x = e_(x+1)` on `ℂ^(ZMod 3)` (`Z X = ω X Z`), realise `G_(2k) ≅ M_(3^k)(ℂ)`;
then `θ` is implemented by the parity `e_x ↦ e_(−x)` on `(ZMod 3)^k`, and with
`d_± = (3^k ± 1)/2`, `C_(2k) ≅ M_(d_+)(ℂ) ⊕ M_(d_−)(ℂ)` with trace weights `d_±/3^k` (the block
`M_(d_−)` absent when `d_− = 0`). For `N = 2k+1`, `G_N` is three copies of `M_(3^k)(ℂ)` indexed by
the eigenvalues `1, ω, ω²` of the central unitary `W(ρ)`; `θ` fixes the first and exchanges the
others, so `C_(2k+1) ≅ M_(d_+)(ℂ) ⊕ M_(d_−)(ℂ) ⊕ M_(3^k)(ℂ)` with trace weights
`d_+/3^(k+1)`, `d_−/3^(k+1)`, `2/3`. Identify these with the `A_5` path blocks of 1.4 by explicit
intertwiners: for `m = 2k+1` the labels `1, 3` have sizes `d_+, d_−`; for `m = 2k+2` the labels
`0, 2, 4` have sizes `d_+, 3^k, d_−`. The trace-preserving expectation `G_(N+1) → G_N` deletes the
`W(a)` with `a_N ≠ 0`, restricts to `C_(N+1) → C_N`, and is Subfactors 3.3's `E_m`.

**Gaussian braid units.** Put

```
g_j = u((1 + ζ) p_j − 1) = −(1 + ω²(U_j + U_j²))/√3 = −(Σ_(r ∈ ZMod 3) ω^(−r²) U_j^r)/√3.
```

Prove that the `g_j` are unitaries in `C_N` satisfying the braid relations, with eigenvalues `i`
on `p_j` and `−u` on `1 − p_j`, so `g_j³ = −i` and `g_j^12 = 1`; with Tau Ceti's
`TemperleyLieb.jones a` at `a² = −u⁻¹` (so `jonesDelta a = √3`), `F_m(jonesUnit a j) = (−a/u) g_j`.
Let `H_N = {ω^c W(a)}` (order `3^(N+1)`), the Heisenberg group of `B`, compared with Tau Ceti's
`HeisenbergGroup (ZMod 3)` on each symplectic plane. Conjugation by `g_j` fixes `U_j` and the
distant `U_k`, and sends `U_(j+1) ↦ ω U_(j+1) U_j⁻¹`, `U_(j−1) ↦ ω U_(j−1) U_j`, so the braid group
acts on the finite group `H_N`. Since `H_N` spans `G_N`, the kernel of this action consists of
central elements of `G_N`, scalar on each simple block of size `D = 3^⌊N/2⌋`; the determinant of
each `g_j` on a block has order dividing `12`, so a central element `z` of the image satisfies
`z^(12D) = 1` blockwise. Hence the image of `BraidGroup m` in `C_(m−1)` is finite (Galindo–Rowell,
Proposition 3.6, for the Gaussian representations, whose `R_j` at `q = ω` is the Galois conjugate
of `−g_j`; Rowell–Wenzl, §4). For a braid `b` on `m ≥ 1` strands the Jones polynomial of its closure
at `t = ζ` is `(−√3)^(m−1) s_(m−1)(F_m(ρ(b)))`, with GeometricTopology Layer 4's normalisation.

- `G_N` is the twisted group algebra of `(ZMod 3)^N` for the chain form, with `dim G_N = 3^N`,
  faithful trace `s_N` and C*-structure; `C_N` is its `θ`-fixed subalgebra of dimension
  `(3^N + 1)/2`.
- `F_m : TL_m(√3) → C_(m−1)` is a surjective `†`-homomorphism with `T_m = (√3)^m s_(m−1) ∘ F_m`
  and `ker F_m = R_m`, so `Q_m ≅ C_(m−1)`.
- `C_N` has the stated blocks and weights, identified with the `A_5` path blocks.
- The `g_j` satisfy `g_j³ = −i`, and the image of `BraidGroup m` is finite.

**Checks.**

- `dim C_N` for `N = 0, …, 5` is `1, 2, 5, 14, 41, 122`, equal to `D_1, …, D_6` from the recurrence;
  `dim Q_4 = 14 = catalan 4` (no radical below `f_5`) and `dim Q_5 = 41 = 42 − 1`. Taking all of
  `G_N` gives `1, 3, 9, …` and fails at `m = 2`.
- `m = 2`: `C_1 = span{1, U_0 + U_0²} ≅ ℂ ⊕ ℂ`, with trace weights `1/3` (on `p_0`) and `2/3`,
  matching `[1]/δ² = 1/3` and `[3]/δ² = 2/3` for the path labels `0` and `2`.
- `m = 3`: `C_2 ≅ M_2(ℂ) ⊕ M_1(ℂ)` (`d_+ = 2`, `d_− = 1`), with weights `2/3`, `1/3`; the paths of
  length `3` from `0` on `A_5` end at `1` twice and at `3` once.
- `U_0 U_1 = ω U_1 U_0` in `G_2` follows from `B(e_0, e_1) = 1` and `α(e_0, e_1)/α(e_1, e_0) = ω`;
  the symmetric choice `α = ω^B` would give `ω²`, the relation for `ω⁻¹`.
- `g_0` has eigenvalues `u ζ = i` and `−u`, so `g_0³ = −i·1` and `g_0³ ≠ 1`; the cubic relation
  holds only projectively.
- `s_1(p_0) = 1/3` and `T_2(e) = 3 · √3 · 1/3 = √3 = δ`.

*Needs:*

- Tau Ceti `IsFactorSet`, `twistedMonoidAlgebra`, `TwistedMonoidAlgebra.of`,
  `TwistedMonoidAlgebra.basis`, `TwistedMonoidAlgebra.lift`
  (`TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean`), `HeisenbergGroup`,
  `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, `TemperleyLieb.lift`, `BraidGroup`,
  `TemperleyLieb.jones`, `jonesUnit`, `jonesDelta`.
- Mathlib `AlgHom.equalizer`, `LinearMap.BilinForm`, `ZMod`, `Matrix.kronecker`.
- CStarAlgebras C1–C4 (finite-dimensional C*-algebras, completely positive maps).
- Subfactors 3.2 (Markov uniqueness, `R_m`), 3.3 (`Q_m`, the `A_5` path model, `E_m`); 1.3 and 1.4.
- GeometricTopology Layer 4, for the closure normalisation only.

### Examples

- `δ = 1`: `TL_2 = ℂ ⊕ ℂ`, `f_2 = 1 − e` spans `R_2`, every `Q_n = ℂ`, and the Hermitian cell forms
  of `TL_2` are nondegenerate while the trace form is degenerate.
- `δ = √2`: `dim Q_2 = 2`, `dim Q_3 = 4`, `dim TL_3 = 5`, with `R_3 = ℂ f_3` and `[4] = 0`.
- `δ = 1/2`: `det G_(3,1) = −3/4`, an indefinite nondegenerate Hermitian cell form.
- `δ = i`: the conjugate-fiber map `κ : TL_2(i) → TL_2(−i)`.
- `t = 1` (`δ = 2`): the spin chain with `D_1 = I₂/2` and `p_1` the projection onto
  `(01 + 10)/√2`; `T_m = 2^m · (normalised trace) ∘ spinRep`.
- A single loop: `Z_FK = Q(1 + v)`, with two boundary circles for its band.
- `δ = √2`: `Q_3 ≅ Cl_3⁰ ≅ M_2(ℂ)`, and the braid image on two strands is cyclic of order `8`.
- `δ = √3`: `Q_3 ≅ C_2 ≅ M_2(ℂ) ⊕ ℂ`, and `g_0³ = −i`.

### Dependencies

Subfactors 3.1–3.3; TemperleyLieb Layers 1–7; Tau Ceti `strandIncl`, `algEquivOfLeOne`,
`e_ne_zero_two`, `markovTrace` and its trace lemmas, the spin-model declarations of
`TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean`, `TemperleyLieb.jones`, `BipartiteRibbonGraph`,
`CliffordAlgebra.basis` and `twistedMonoidAlgebra`; Mathlib `RingQuot.lift`, `TwoSidedIdeal`,
`Graph`, `CliffordAlgebra`; GraphConnectivityAndFlows 1.1; SpinGeometry G1; SpinRepresentations
Layers 0–1; CStarAlgebras C1–C5; VonNeumannAlgebras V0, V2, V4, V10; GeometricTopology Layer 4.

## Layer 2: Sign isomorphism, negative loop parameters and the Bratteli diagram

### 2.1 The sign isomorphism and positivity at negative loop parameters

For every commutative ring `R` and `δ ∈ R` construct the algebra isomorphism
`s : TemperleyLieb R δ n ≃ₐ[R] TemperleyLieb R (−δ) n` with `s(e_i) = −e_i`, by `lift` (the
relations hold: `(−e_i)² = δ e_i = (−δ)(−e_i)`, `(−e_i)(−e_j)(−e_i) = −e_i`, and distant generators
still commute), with inverse the same construction at `−δ` and `hom_ext` for both composites.
Prove `s ∘ strandIncl = strandIncl ∘ s`. For a unit `q` with `δ = −(q + q⁻¹)` the unit `−q`
satisfies `−δ = −((−q) + (−q)⁻¹)`; prove the trace relation

```
markovTrace (−q) (s x) = (−1)^n · markovTrace q x    on TL_n(R, δ)
```

from TemperleyLieb Layer 4's `existsUnique_isMarkovTrace`: the family
`x ↦ (−1)^n markovTrace (−q) (s x)` takes the value `(−1)^n(−δ)^n = δ^n` on `1`, is tracial, gains
the factor `(−1)(−δ) = δ` under `strandIncl`, and satisfies the Markov property because
`s(ι(x) e_n) = −ι(s x) e_n`. For real `δ` prove that `s` is a *-isomorphism for the generator-fixing
conjugate-linear adjoints of Subfactors 3.1 on both fibers, by uniqueness. Deduce, for real
`δ ≠ 0`, that `τ_n^δ(x† x) = τ_n^(−δ)((s x)† (s x))` for the normalised traces, since
`δ⁻ⁿ (−1)^n = (−δ)⁻ⁿ`.

The headline is `markovTrace_neg_one_pow_nonneg_iff`: for real `δ < 0`, a unit `q` with
`δ = −(q + q⁻¹)`, and conjugate-linear star structures on every `TL_n(ℂ, δ)` fixing the
generators, the signed closure forms `(−1)^n T_n(x† x)` are real and nonnegative for every `n` and
`x` exactly when `−δ ∈ {2cos(π/m) : m ≥ 3} ∪ [2,∞)`. Its proof is the trace relation, the
*-property of `s`, and Subfactors 3.2's `markovTrace_nonneg_iff` at the positive parameter `−δ`;
the sign `(−1)^n` is Penneys, Facts 4.4.14 (TB6), printed p. 155. Equivalently, for real `δ ≠ 0`
the normalised forms `τ_n(x† x)` are nonnegative at every level exactly when `|δ|` is admissible.
Transport Subfactors 3.3's C*-tower: for `δ < 0` with `|δ|` admissible, `s` descends to
*-isomorphisms `Q_n^δ ≅ Q_n^(−δ)` compatible with the strand maps, so the normalised C*-tower at
`δ` is the tower at `|δ|`. No unitary spherical Temperley–Lieb category is claimed at `δ < 0`: the
closure trace of the identity of the one-strand object is `δ < 0`.

- `s` is an `R`-algebra isomorphism `TL_n(δ) → TL_n(−δ)` with `s(e_i) = −e_i`, involutive across the
  two fibers, compatible with `strandIncl`.
- `markovTrace (−q) (s x) = (−1)^n markovTrace q x`.
- For real `δ`, `s` is a *-isomorphism; for `δ ≠ 0`, `τ_n^δ(x† x) = τ_n^(−δ)((s x)†(s x))`.
- `markovTrace_neg_one_pow_nonneg_iff` as stated, with hypotheses `δ < 0`, `δ = −(q + q⁻¹)`,
  `StarRing` and `StarModule ℂ` on every `TL_n(ℂ, δ)`, and `star (e δ i) = e δ i` for all `n`, `i`.

**Checks.**

- `n = 1`: `T_1^δ(1) = δ` and `(−1)·T_1^(−δ)(s 1) = −(−δ) = δ`. The relation without the sign
  `(−1)^n` fails here.
- `n = 2`, `x = e`: `T_2^δ(e) = δ`, and `(−1)²·T_2^(−δ)(−e) = −(−δ) = δ`.
- `δ = −2`: `(−1)·T_1(1) = 2 ≥ 0`, `T_2(1) = 4 ≥ 0`, `T_2(e† e) = T_2(e²) = δ T_2(e) = δ² = 4 ≥ 0`;
  `−δ = 2` is admissible. The unsigned form fails at `n = 1`, where `T_1(1) = −2 < 0`.
- `δ = −1/2`: `f_2 = 1 − δ⁻¹ e = 1 + 2e` is `†`-invariant and idempotent, and
  `T_2(f_2† f_2) = T_2(f_2) = δ² + 2δ = −3/4 < 0`; `−δ = 1/2` is not admissible, and `s(f_2)` is the
  Jones–Wenzl projection at `1/2`.
- `δ = 0`: `T_n = 0` for `n > 0` because every closure of a nonempty diagram contains a loop, so both
  `T_n` and `(−1)^n T_n` are trivially positive semidefinite while `0` is in neither admissible set;
  the hypotheses `δ > 0` of Subfactors 3.2 and `δ < 0` here are both needed.
- A map with `s(e_i) = e_i` is not an algebra map `TL_n(δ) → TL_n(−δ)` for `δ ≠ 0`: it would send
  `e_i² = δ e_i` to `e_i² = δ e_i` in an algebra where `e_i² = −δ e_i`, forcing `2δ e_i = 0` against
  `e_ne_zero_two`.

*Needs:* Tau Ceti `lift`, `lift_e`, `hom_ext`, `strandIncl_e`, `e_ne_zero_two`, `markovTrace` and
its trace lemmas; TemperleyLieb Layer 4 (`existsUnique_isMarkovTrace`); Subfactors 3.1, 3.2
(`markovTrace_nonneg_iff`), 3.3 (`Q_n`, the C*-tower).

### 2.2 The Bratteli diagram of the Jones tower

For admissible `δ > 0` let `Γ` be the half-line (`δ ≥ 2`) or `A_(m−1)` (`δ = 2cos(π/m)`). Define the
Bratteli diagram of the tower `Q_0 ⊂ Q_1 ⊂ Q_2 ⊂ …` of Subfactors 3.3: the vertices at level `n` are
the endpoints `t` of the `n`-step paths from `0` on `Γ`, with sizes `#paths_(n,t)`, and there is one
edge between `t` at level `n` and `t ± 1` at level `n + 1` whenever both vertices exist. Prove that
this is the Bratteli diagram of the inclusion `Q_n ⊂ Q_(n+1)` in the sense of CStarClassification
CL2 2.2, that is, that the inclusion matrix is the adjacency matrix of `Γ` restricted to the two
vertex sets, using Layer 1.4's branching rule (Penneys, Examples 4.6.12 and 4.6.14, printed
pp. 163–164). Deduce `IsAF B_δ` for Subfactors 3.3's C*-inductive limit, with the stages `Q_n`;
compute `K₀(B_δ)` as the inductive limit of `ℤ^(vertices at level n)` along the adjacency matrices,
through CL2 2.2's `K₀` connecting maps; and identify the state on `K₀` induced by Subfactors 3.3's
trace `τ` with the compatible weight family `([t+1]/δ^n)_t`. For `δ = 2cos(π/m)` prove `τ` is the
unique tracial state of `B_δ` (the square of the adjacency matrix of `A_(m−1)` is primitive on each
parity class, so Perron–Frobenius applies); for `δ ≥ 2` prove it is not: the diagram does not depend
on `δ`, so all `B_δ` with `δ ≥ 2` are one AF algebra, and the weight families `([t+1]_λ/λ^n)_t`,
`λ ≥ 2`, are pairwise distinct compatible tracial states on it. Prove the sizes at `δ ≥ 2` are
`halfCount n t`, and at `δ = 2cos(π/m)` are the half-line counts restricted to paths of height at most
`m − 2`.

- The Bratteli diagram of `Q_n ⊂ Q_(n+1)` is the restriction of `Γ`; `IsAF B_δ`.
- `K₀(B_δ)` is the inductive limit along the adjacency matrices; `τ` corresponds to `([t+1]/δ^n)_t`,
  the unique tracial state for `δ = 2cos(π/m)` and one of a family for `δ ≥ 2`.
- Sizes: `halfCount n t` for `δ ≥ 2`, truncated at height `m − 2` for `δ = 2cos(π/m)`.

**Checks.**

- `δ = 1` (`m = 3`): one vertex of size `1` at every level, one edge between consecutive levels,
  `B_1 = ℂ`.
- `δ = √2` (`m = 4`): sizes `(1)`, `(1)`, `(1,1)`, `(2)`, `(2,2)`, `(4)`, so `dim Q_n = 2^(n−1)` for
  `n ≥ 1`; a diagram without truncation would give `dim Q_4 = 14`.
- `δ = 2`, level `2`: sizes `(1, 1)` at `t = 0, 2`, weights `1/4` and `3/4`, and
  `1·(1/4) + 1·(3/4) = 1` is the normalised trace of `1`. Unit weights give `1/2`.
- A diagram whose edges join `t` to `t` only would give size `1` at every level, contradicting
  `dim Q_2 = 2` at every admissible `δ ≥ √2`.
- `δ = 2` and `δ = 3`: the same diagram and the same AF algebra, but `τ_2` gives the level-`2` weights
  `(1/4, 3/4)` and `τ_3` gives `(1/9, 8/9)` on the blocks `t = 0, 2`; both are compatible, so `B_2`
  has more than one tracial state. A claim of trace uniqueness for every admissible `δ` is false.

*Needs:* Subfactors 3.3 (`Q_n`, `B_δ`); CStarClassification CL2 (2.1, 2.2); TemperleyLieb Layer 1
(`halfCount`); 1.4.

### Examples

- `δ = −1`: the signed forms `(−1)^n T_n` are positive at every level, and `s` identifies the
  normalised tower with the tower at `δ = 1`, where every `Q_n = ℂ`.
- `δ = −1/2`: `T_2(f_2) = −3/4` with `f_2 = 1 + 2e`, the first negative witness.
- `δ = √2`: `B_δ` is the AF algebra of the diagram with sizes `1, 1, 2, 4, 8, …`.

### Dependencies

Layer 1 (1.3, 1.4); Subfactors 3.1–3.3; TemperleyLieb Layers 1 and 4; CStarClassification CL2;
Tau Ceti `lift`, `hom_ext`, `strandIncl_e`, `e_ne_zero_two`, `markovTrace` and its trace lemmas.

## Layer 3: The unitary Temperley–Lieb category

### 3.1 The quotient category and its dagger

For admissible `δ > 0` define the unitary Temperley–Lieb category, written UTL_δ, as a wrapper
category: its objects wrap the objects `n` of TemperleyLieb Layer 3's `TL(ℂ, δ)`, and `Hom(n, m)` is
a type synonym of the quotient of the complex diagram Hom space by its negligible subspace
`negligibleIdeal (n, m)` of TemperleyLieb Layer 6. Use this quotient uniformly; for `δ ≥ 2` the
negligible subspace is zero. Composition, scalar action, cups, caps and the diagram operations
descend, and the canonical linear comparison maps commute with them. Equip the wrapper with its own
conjugate-linear dagger, the descent of Layer 1.1's diagram adjoint (vertical reflection composed
with coefficient conjugation), and prove the concrete laws `f†† = f`, `(f ≫ g)† = g† ≫ f†`,
`(c·f)† = conj(c)·f†`, `(f + g)† = f† + g†`, `(𝟙 n)† = 𝟙 n`. The `End` stars of the wrapper come
from this dagger; TemperleyLieb Layer 4's coefficient-fixing `star` is never installed on these Hom
synonyms. Prove `End(n) ≅ Q_n` as *-algebras through 1.3.

- UTL_δ is a ℂ-linear category with `Hom(n, m) = Hom_(TL)(n, m) ⧸ negligibleIdeal (n, m)`,
  zero for `n + m` odd.
- The dagger is a conjugate-linear involutive anti-functor fixing cups, caps and every `e_i`.
- `End(n) ≅ Q_n` as *-algebras.

**Checks.**

- `Hom(1, 2) = 0` and `Hom(0, 1) = 0`: there is no planar matching on an odd number of points.
- `Hom(0, 0) = ℂ` for every admissible `δ`, since `tr̂(𝟙 0) = 1 ≠ 0`.
- `δ = 1`: `Hom(2, 2) = Q_2 = ℂ`, with the negligible subspace spanned by `f_2 = 1 − e`; the dagger
  fixes `e`.
- On `Hom(0, 2) = ℂ·cup`: `(i·cup)† = −i·cap` and `((i·cup)†)† = i·cup`. A ℂ-linear dagger would
  give `(i·cup)† = i·cap`, and then `(i·cup) ≫ (i·cup)† = i·i·(cup ≫ cap) = −δ·𝟙 0` in `End(0)`,
  negative for `δ > 0`, while the conjugate-linear dagger gives `(i·cup) ≫ (−i·cap) = δ·𝟙 0`. The
  other order `(i·cup)† ≫ (i·cup)` lies in `End(2)`, where it is `−e` and `e` respectively.

*Needs:* TemperleyLieb Layer 3 (`TL(ℂ, δ)`), Layer 6 (`negligibleIdeal`); 1.1, 1.3; Subfactors 3.3
(`Q_n`).

### 3.2 Hom positivity and the Hilbert-space norms

For `n + m` even, bend the `n + m` boundary points of `Hom(n, m)` to `End((n+m)/2)` by TemperleyLieb
Layer 3's corner-dragging isomorphisms, and prove that the closure pairing `(f, g) ↦ tr̂(f† ≫ g)` on
`Hom(n, m)` corresponds to the pairing `H_((n+m)/2)` on `End((n+m)/2)`, with equal radicals. Deduce
from Subfactors 3.2's positivity theorem that the descended pairing is a definite inner product on
every `Hom(n, m)` of UTL_δ. For the additive envelope `Mat_(UTL_δ)` define the trace of an
endomorphism as the sum of the diagonal closure traces, prove positivity and faithfulness of its
`End` forms by summing the definite component forms, and identify each `Hom(n, m)` with a corner of
`End(n ⊕ m)`. Apply Subfactors 3.3's finite-dimensional faithful-trace C*-lemma to `End(n ⊕ m)` and
restrict its left-regular operator norm to each corner; prove independence of the envelope object
used, and that on `End(n)` the norm is Subfactors 3.3's C*-norm on `Q_n`.

- `Hom(n, m) ≅ End((n+m)/2)` for `n + m` even, carrying the closure pairing to `H_((n+m)/2)`.
- The inner product `⟨f, g⟩ = tr̂(f† ≫ g)` is positive definite on every Hom space of UTL_δ.
- The Hom norms make UTL_δ a C*-category in the sense of CA1a, with `‖f‖² = ‖f† ≫ f‖` and
  `End(n) ≅ Q_n` isometrically.

**Checks.**

- `Hom(0, 2)`: `⟨a·cup, b·cup⟩ = conj(a)·b·δ`, positive definite for `δ > 0`; `‖cup‖ = √δ`.
- `Hom(1, 3)` bends to `End(2)`, of dimension `2`; at `δ = 1` its radical is one-dimensional (the
  image of `f_2`), so the unitary `Hom(1, 3)` is one-dimensional.
- `‖e‖ = δ` on `End(n)`, `n ≥ 2`: `e† ≫ e = e² = δ e` and `e/δ` is a projection.
- `‖e_i e_(i+1) e_i‖ = δ`, since the product is `e_i`; submultiplicativity alone only gives the
  bound `δ³`, so the value is a computation of the C*-norm, not an estimate.

*Needs:* TemperleyLieb Layer 3 (corner dragging), Layer 4 (`tr̂`); Subfactors 3.2
(`markovTrace_nonneg_iff`, `R_n`), 3.3 (the C*-lemma); 3.1; CategoricalOperatorAlgebras CA1a.

### 3.3 C*-tensor structure and unitary duality

Instantiate CategoricalOperatorAlgebras CA1a's C*-category and CA2a's dagger tensor and
unitary-duality interfaces on UTL_δ. Prove the C*-category axioms explicitly: bounded composition,
`‖f† f‖ = ‖f‖²`, positivity of `f† f` in `End(X)`, and completeness of every finite-dimensional Hom
space. Prove that the tensor product respects daggers, `(f ⊗ g)† = f† ⊗ g†`, and is contractive on
morphisms, `‖f ⊗ g‖ ≤ ‖f‖ ‖g‖`, by an explicit *-homomorphism from the spatial tensor product
`End(n) ⊗_min End(m)` of CStarAlgebras C5 to `End(n + m)`; the associators and unitors are
identities, hence unitary. For admissible `δ` supply the cup `0 → 2` and cap `2 → 0` as the solution
of the conjugate equations for the object `1` with itself, with cap `= cup†`, prove both zigzag
identities, and prove that this solution is CA2a's balanced solution, with `‖cup‖² = ‖cap‖² = δ` the
dimension of the object `1`. Extend to every object `n` by tensoring, prove that the dual tensorator
is unitary and `(f∨)† = (f†)∨`, that the balanced solutions are transported along sums and
subobjects as CA2a prescribes, and that their spherical trace is the positive closure trace `tr̂`
descended to UTL_δ. This constructs the Temperley–Lieb example directly and uses no later
categorical realisation theorem.

- UTL_δ is a C*-category (CA1a) and a dagger tensor category with unitary structure maps (CA2a).
- `‖f ⊗ g‖ ≤ ‖f‖ ‖g‖`, with equality on the spatial tensor product of endomorphism algebras.
- `(cup, cap)` is a balanced solution of the conjugate equations for `1`, `dim 1 = δ`, and the
  induced spherical trace is `tr̂`.

**Checks.**

- The zigzag `(cup ⊗ 𝟙 1) ≫ (𝟙 1 ⊗ cap) = 𝟙 1` holds for every `δ`; `cap ≫ cup = e` on `End(2)`
  while `cup ≫ cap = δ·𝟙 0`, so the order of the two is not interchangeable.
- `‖cup‖² = δ = dim 1`: the rescaled pair `r = c·cup`, `r̄ = conj(c)⁻¹·cup` with `|c| ≠ 1` still
  solves the conjugate equations, but `‖r‖² = |c|² δ` and `‖r̄‖² = |c|⁻² δ` differ, so it is not
  balanced; balanced solutions for `1` are exactly the pairs with `|c| = 1`.
- `‖e ⊗ e‖ = δ²` in `End(4)`: `e ⊗ e = e_1 e_3 = e_3 e_1`, a product of commuting elements of norm
  `δ`, and `(e_1 e_3)² = δ² e_1 e_3` shows the C*-norm is exactly `δ²`.
- At `δ = 2`, `dim 1 = 2` and `End(1) = ℂ`: the object `1` is simple with dimension `2`, so UTL_2 is
  not a fusion category of the Vec type; dimensions in UTL_δ are the quantum integers `[r+1]`, not
  integers in general.

*Needs:* 3.1, 3.2; CategoricalOperatorAlgebras CA1a, CA2a; CStarAlgebras C5 (spatial tensor
product), C1–C4; TemperleyLieb Layer 3 (rigid and pivotal structure).

### 3.4 Envelopes, simple objects and unitary fusion rules

Transport TemperleyLieb Layer 7's additive and Karoubi envelope through the normed structure: prove
that the finite biproducts of `Mat_(UTL_δ)` and the idempotent splittings of `Karoubi` preserve the
completed Hom spaces and the dagger, that every idempotent of a finite-dimensional C*-algebra is
similar to a self-adjoint projection, so that splitting an arbitrary idempotent is isomorphic to
splitting a projection, and construct the unitary comparison between two splittings of the same
projection. Prove a monoidal ℂ-linear equivalence `Karoubi(Mat_(UTL_δ)) ≃ Karoubi(Mat_(TL(ℂ,δ)))/N`
with TemperleyLieb Layer 7's quotient by the negligible ideal, and transport its classification of
simple objects: for `δ ≥ 2` the simples are the Jones–Wenzl objects `X_r`, `r ≥ 0`, with quantum
dimension `[r+1]` and the untruncated rule

```
X_a ⊗ X_b ≅ ⊕_(c = |a−b|, |a−b|+2, …, a+b) X_c
```

(Chen, *The Temperley–Lieb categories and skein modules*, Theorems 2.4.6 and 3.3.5); for
`δ = 2cos(π/m)` the simples are `X_0, …, X_(m−2)` and the range becomes

```
|a − b| ≤ c ≤ min(a + b, 2m − 4 − a − b),    c ≡ a + b (mod 2)
```

(Chen, Theorems 5.4.4 and 5.4.5, with Chen's `n` equal to `m`). Normalise the intertwiners to make
these decompositions unitary: the inclusion `X_c → X_a ⊗ X_b` is the trivalent vertex scaled by the
positive square root of its theta-net value, and the scaled inclusions are isometries with
orthogonal ranges. Prove all surviving quantum dimensions positive, transport the fusion hypotheses
of PivotalSpherical Layer 4 to `Karoubi(Mat_(UTL_δ))` for `δ = 2cos(π/m)`, and prove compatibility
with 1.3's blocks: `End(X_a^(⊕k)) ≅ M_k(ℂ)` is the block of `Q_n` at `t = a`. The category at `δ ≥ 2`
has infinitely many simple objects and is not declared a fusion category. Arbitrary idempotents are
not declared self-adjoint.

- `Karoubi(Mat_(UTL_δ))` is a C*-tensor category with unitary duals; its simples are the `X_r`.
- The unitary fusion rules above, with isometric intertwiners.
- For `δ = 2cos(π/m)`, PivotalSpherical's fusion hypotheses hold with simples `X_0, …, X_(m−2)` and
  positive dimensions `[r+1]`.

**Checks.**

- `X_1 ⊗ X_1 ≅ X_0 ⊕ X_2` for every admissible `δ ≥ √2`, with dimensions `δ² = 1 + [3]`; the
  isometric inclusion of `X_0` is `δ^(−1/2)·cup`.
- `m = 3` (`δ = 1`): the simples are `X_0` and `X_1`, both of dimension `1`, and the range gives
  `X_1 ⊗ X_1 ≅ X_0` since `min(2, 2m − 4 − 2) = 0`. `Hom(0, 1) = 0`, so `X_1 ≇ X_0` although
  `End(n) = Q_n = ℂ` for every `n`; the object `n` is `X_0` or `X_1` according to the parity of `n`.
  A definition with one simple would make `X_1` negligible, but `tr̂(𝟙 1) = δ = 1 ≠ 0`.
- `m = 4` (`δ = √2`): simples `X_0, X_1, X_2` with dimensions `1, √2, 1`; `X_1 ⊗ X_1 ≅ X_0 ⊕ X_2`,
  `X_1 ⊗ X_2 ≅ X_1`, `X_2 ⊗ X_2 ≅ X_0`.
- `m = 5` (`δ = (1+√5)/2`): simples `X_0, …, X_3` with dimensions `1, δ, δ, 1`;
  `X_2 ⊗ X_2 ≅ X_0 ⊕ X_2` since `2m − 4 − 4 = 2`, and `X_3 ⊗ X_3 ≅ X_0` since `2m − 4 − 6 = 0`;
  the untruncated rule would give `X_2 ⊗ X_2 ≅ X_0 ⊕ X_2 ⊕ X_4` with `X_4` absent.
- The idempotent `e/δ ∈ End(2)` is already a projection. In `End(X_1 ⊕ X_1) ≅ M_2(ℂ)` the idempotent
  `[[1, 1], [0, 0]]` is not self-adjoint, but it is similar to the projection `[[1, 0], [0, 0]]`, and
  both split to `X_1`; a construction that only split self-adjoint idempotents would still produce
  every object of the Karoubi envelope.

*Needs:* 3.1–3.3; TemperleyLieb Layer 7; PivotalSpherical Layers 2–4; Subfactors 3.3 (`Q_n`); 1.3.

### Examples

- UTL_1 has two simple objects `X_0`, `X_1` with the `ℤ/2` fusion rule `X_1 ⊗ X_1 ≅ X_0`; every
  Hom space is `ℂ` or `0` according to the parity of `n + m`, and every endomorphism algebra is `ℂ`.
- UTL_√2 has the Ising fusion rules on `X_0, X_1, X_2`.
- UTL_((1+√5)/2) contains the Fibonacci rules on `X_0, X_2`.
- UTL_2: infinitely many simples `X_r` of dimension `r + 1`.

### Dependencies

Layers 1–2; TemperleyLieb Layers 3, 4, 6, 7; Subfactors 3.2–3.3; PivotalSpherical Layers 2–4;
CategoricalOperatorAlgebras CA1a, CA2a; CStarAlgebras C1–C5.

## Layer 4: Affine diagrams and finite-dimensional standard modules

Throughout, `δ ∈ ℂ` and `v ∈ ℂ^×` with `δ = −v − v⁻¹`; `v` is Tau Ceti's `q` and Graham–Lehrer's
quantum parameter, and `−v` is the positive-loop parameter of Layers 1–3.

### 4.1 Affine diagrams, the affine category and `ATL_n(δ)`

Construct the affine Temperley–Lieb category at loop parameter `δ`. Its objects are the natural
numbers. A morphism `n → m` is a complex linear combination of affine diagrams: non-intersecting
curves on a cylinder joining `n` marked points on the bottom circle and `m` on the top, with
contractible loops removed at the cost of a factor `δ`, essential circles retained as diagram data,
and the integral winding of through strings around the cylinder retained as diagram data
(Erdmann–Green, *On representations of affine Temperley–Lieb algebras, II*, 2.1.1–2.1.6, printed
pp. 3–4, for the periodic-strip model; Graham–Lehrer, *Diagram algebras, Hecke algebras and
decomposition numbers at roots of unity*, §4, printed pp. 487–489, for the cylinder picture and
the generators). Represent diagrams as periodic rectangle diagrams with a marked seam, prove a
discrete normal-form classification of affine diagrams up to isotopy fixing the marked boundaries
(a through-string diagram is determined by its top and bottom matchings and one winding integer,
Erdmann–Green, Proposition 2.4.4, printed p. 7; a diagram without through strings by its two
matchings and the number of essential circles), so that equality, gluing and winding are
combinatorially decidable. Composition is stacking in the order of the ordinary category. Prove
associativity, identity, and the reflection formulas, including coefficient conjugation to the
fiber at `conj δ`. Horizontal juxtaposition of annuli is not an ordinary tensor product and is not
declared one.

Let `ATL_n(δ)` be the endomorphism algebra of `n`. Give its diagram basis, through-string filtration,
the rotation `τ` and its inverse for `n > 0`, the seam generators, and the cup, cap and generator
computations. Prove the relations `e_i² = δ e_i` and `τ e_i τ⁻¹ = e_(i+1)` for every `n ≥ 2` with
indices modulo `n`, and for `n ≥ 3` the relations `e_i e_(i±1) e_i = e_i` and `e_i e_j = e_j e_i`
for `j ≢ i ± 1 (mod n)` (Graham–Lehrer 2003, relations (TL) and the remark after them, printed
p. 488; Erdmann–Green, Proposition 2.2.4, printed p. 5, both for `n ≥ 3`), without using the list
as a presentation. For `n = 2` prove instead `e_1 e_2 e_1 = c² e_1` and `e_2 e_1 e_2 = c² e_2`,
where `c` is the essential circle: the arc of `e_1` and the arc of `e_2` on the same side of the
middle level close to a curve around the cylinder, not to a contractible loop. Treat `n = 0, 1, 2`
through the diagram
definitions: `ATL_0(δ)` is the polynomial algebra on an essential circle, `ATL_1(δ)` is the Laurent
algebra on the winding of the single through string. For `n > 0` prove `ATL_n(δ)` infinite-dimensional
from the winding diagrams. Construct the insertion of an ordinary rectangle into the cut annulus,
an injective algebra map `TL_n → ATL_n(δ)` (injective by distinct diagram bases), and the restriction
of affine modules along it.

- The affine category with its normal form, composition, associativity and reflections.
- `ATL_n(δ)`: basis, filtration, rotation, relations, infinite dimension for `n > 0`,
  `ATL_0(δ) ≅ ℂ[c]`, `ATL_1(δ) ≅ ℂ[u, u⁻¹]`.
- The injective algebra map `TL_n → ATL_n(δ)` and restriction.

**Checks.**

- In `ATL_2(δ)` the two generators `e_1`, `e_2` are distinct diagrams (the arc crosses the seam or
  not), and `e_1 e_2 e_1 = c² e_1`, not `e_1`: on `W_(0,z)(2)` with basis `b_1`, `b_2` and
  `a = z + z⁻¹`, `e_1 b_1 = δ b_1`, `e_2 b_1 = a b_2` and `e_1 b_2 = a b_1`, so
  `e_1 e_2 e_1 b_1 = δ a² b_1` while `e_1 b_1 = δ b_1`; at `z = 2` the factor is `a² = 25/4`. On
  `W_(2,z)(2)` both sides are zero. In `TL_2` there is one generator and the relation has no
  instance.
- `τ² ≠ 1` in `ATL_2(δ)`: `τ²` is the full twist of two through strings, a diagram with winding, so
  `τ` has infinite order, whereas a model identifying `τ^n` with `1` is a different algebra.
- `ATL_1(δ) ≅ ℂ[u, u⁻¹]`: the winding number is a complete invariant of the one-strand diagrams,
  and no contractible loop can form.
- In `ATL_0(δ)` the essential circle `c` satisfies no relation: `c^k` are linearly independent, and a
  definition evaluating `c` to `δ` would collapse it to ℂ.

*Needs:* TemperleyLieb Layers 1–3 (planar matchings, the ordinary diagram category); Mathlib
`Polynomial`, `LaurentPolynomial`.

### 4.2 The standard modules `W_(t,z)(n)`

For `0 ≤ t ≤ n`, `n − t` even, and `z ∈ ℂ^×`, construct `W_(t,z)(n)` from the monic affine diagrams
`t → n` (every source point joined to a distinct target point): quotient the right action of the
winding by its character, one positive rotation of the `t` through strings acting by `z` and the
negative rotation by `z⁻¹` when `t > 0`, and an essential circle acting by `z + z⁻¹` when `t = 0`; a
composite that loses a through string acts by zero. Construct the left `ATL_n(δ)`-action and prove
the module axioms, scalar compatibility and representative independence (Graham–Lehrer 1998,
Definitions 2.5–2.6, printed p. 188, uncertified; Erdmann–Green, 2.5.4–2.5.5, printed p. 9, for
the standard modules of the finite quotients and their dependence on the winding eigenvalue only).
Give the finite standard basis, `dim W_(t,z)(n) = C(n, (n−t)/2)`, the matrices of the seam and
winding actions, the functorial maps between object sizes and their composition rules. At `t = 0`
compare `z` and `z⁻¹`: `W_(0,z)(n) = W_(0,z⁻¹)(n)` by construction.

- `W_(t,z)(n)` is a left `ATL_n(δ)`-module of dimension `C(n, (n−t)/2)`.
- Its restriction along `TL_n → ATL_n(δ)` is filtered by the ordinary cell modules.
- `W_(0,z)(n) = W_(0,z⁻¹)(n)`; for `t > 0`, `W_(t,z)(n)` and `W_(t,z′)(n)` differ when `z ≠ z′`.

**Checks.**

- `n = 2`, `t = 0`: two monic diagrams (the arc passing either side of the seam), `dim = C(2,1) = 2`.
- `n = 3`, `t = 1`: three monic diagrams, the defect at position `k` with an arc on the other two
  points, `dim = C(3,1) = 3`; the rotation `τ` permutes them cyclically up to the winding character,
  and `τ³`, the full turn, acts by the character of one positive rotation of the through string.
- `n = 4`, `t = 0`: six monic diagrams, `dim = C(4,2) = 6`.
- `n = 0`, `t = 0`: `W_(0,z)(0) = ℂ` with the essential circle acting by `z + z⁻¹`; `n = 1`, `t = 1`:
  `W_(1,z)(1) = ℂ` with the winding acting by `z`.

*Needs:* 4.1.

### 4.3 Bilinear pairings, Gram matrices and simple heads

Construct the invariant bilinear pairing `W_(t,z)(n) × W_(t,z⁻¹)(n) → ℂ` by gluing a monic diagram
to the reflection of another, killing non-monic composites, and evaluating the resulting winding or
essential circles by the character. Reflection here fixes coefficients and does not conjugate them.
Prove the invariance `⟨a·u, w⟩ = ⟨u, a*·w⟩` for the coefficient-fixing reflection `a*`, compute its
Gram matrix in the monic-diagram bases, define the left and right radicals, compare with the dual
module, and prove specialisation along `ℂ[X, Z, Z⁻¹] → ℂ`. Define `L_(t,z)(n)` as the quotient of
`W_(t,z)(n)` by the left radical. Prove that `L_(t,z)(n)` is zero or absolutely simple and that the
radical is the unique maximal submodule when the head is nonzero (the cellular-algebra argument,
Erdmann–Green, 2.5.6, printed p. 9). A bilinear perfect pairing between opposite winding
parameters gives no Hilbert-space structure by itself.

- The invariant pairing, its Gram matrix, radicals and dual comparison.
- `L_(t,z)(n)` is zero or absolutely simple, with the radical the unique maximal submodule.

**Checks.**

- `n = 2`, `t = 0`, `a = z + z⁻¹`, `d = δ`: Gram matrix `[[d, a], [a, d]]` (gluing an arc to its own
  reflection gives a contractible loop; to the other arc, an essential circle), determinant
  `d² − a²`. It vanishes exactly for `z ∈ {v, v⁻¹, −v, −v⁻¹}`, that is `a = ∓d`.
- `n = 3`, `t = 1`: each diagonal entry is `X`, the three off-diagonal pairs multiply around the
  cycle to the full twist `Z^(±2)`, and the determinant is `X³ − 3X + Z² + Z⁻²`.
- `t = n`: `W_(n,z)(n)` is one-dimensional with Gram matrix `[1]`; the pairing is perfect for every
  `z`, and `L_(n,z)(n) = W_(n,z)(n)`.
- The conjugate-linear variant `⟨κ u, w⟩` would pair `W_(t,z)` with `W_(t,conj(z)⁻¹)`, not
  `W_(t,z⁻¹)`; for `|z| ≠ 1` these differ.

*Needs:* 4.2; TemperleyLieb Layer 5 (the cellular argument for simple heads).

### 4.4 Classification of finite-dimensional simple modules

Classify the finite-dimensional simple `ATL_n(δ)`-modules over ℂ by the nonzero heads `L_(t,z)(n)`:
the label equivalence is `(0, z) ∼ (0, z⁻¹)`, all other labels retain `z`, and the class
`(0, v) ∼ (0, v⁻¹)` is removed when `v² = −1` and `n > 0` is even, where the head is zero
(Graham–Lehrer 1998, Theorem 2.8, printed pp. 189–191, uncertified, for the full statement
including the exceptional even case; Erdmann–Green, 2.5.5–2.5.6, printed p. 9, for the
parametrisation by the winding eigenvalue at `t > 0` only). The exceptional case is this roadmap's
own computation: at `v² = −1` the loop value is `δ = 0` and `z = v` gives `z + z⁻¹ = 0`, so every
entry of the Gram matrix of `W_(0,v)(n)`, a monomial in `δ` and `z + z⁻¹` of positive degree,
vanishes and the head is zero. Prove that distinct remaining classes have inequivalent heads
(the minimal through-string level and the winding eigenvalue there are invariants), and
completeness by choosing a winding eigenvector at the minimal through-string level of a
finite-dimensional simple module and mapping the corresponding `W_(t,z)(n)` onto it. Include the
`n = 0` characters of `ℂ[c]` and the `n = 1` characters of `ℂ[u, u⁻¹]`. The theorem quantifies over
finite-dimensional modules; `ATL_n(δ)` itself is infinite-dimensional for `n > 0`.

- Every finite-dimensional simple module is `L_(t,z)(n)` for a unique class `[(t, z)]` in the
  stated domain.

**Checks.**

- `n = 1`: the simples are the characters `u ↦ z` of `ℂ[u, u⁻¹]`, one for each `z ∈ ℂ^×`, and
  `L_(1,z)(1) = W_(1,z)(1)`.
- `n = 0`: the simples are the characters `c ↦ z + z⁻¹`, and `(0, z) ∼ (0, z⁻¹)` is exactly the
  fiber of `z ↦ z + z⁻¹`.
- `n = 2`, `v = i` (`δ = 0`): the class `(0, i) ∼ (0, −i)` has `a = 0 = d`, Gram matrix zero, and
  `L_(0,i)(2) = 0`; it is removed. For every even `n > 0` the `C(n, n/2)²` Gram entries of
  `W_(0,i)(n)` are the monomials `d^k a^l` with `k + l ≥ 1` (the number of closed curves formed by
  two matchings on `n` points), all zero, so `L_(0,i)(n) = 0`; at `n = 4` the `6 × 6` matrix of
  4.6 at `d = a = 0` is zero. For `v = i` and `n = 3` nothing is removed, since `n` is odd.
- `n = 2`, `v` with `v² ≠ −1`: `W_(0,v)(2)` has Gram determinant `d² − a² = 0` with `a = −d ≠ 0`, so
  the radical is one-dimensional and `L_(0,v)(2)` is one-dimensional, not zero.

*Needs:* 4.2, 4.3.

### 4.5 Intertwiners and the parameter order

On the valid labels define the parameter order as the reflexive transitive closure of the
elementary successors

```
0 ≤ t < s ≤ n,   s − t = 2k,   ε ∈ {+1, −1},
z² = v^(εs),   y = z v^(−εk),   (t, z) ≼ (s, y),
```

descended through the `t = 0` label equivalence. Prove antisymmetry, finiteness of the upper sets
and invariance under `v ↔ v⁻¹`. Construct the cell maps `W_(s,y)(n) → W_(t,z)(n)` as the explicit
sums of standard diagrams with forest coefficients of Graham–Lehrer 1998, Theorem 3.4, printed
pp. 197–201 (uncertified), prove their rotation covariance and cap cancellation through the
forest-polynomial recurrence and the four diagram cases, and prove the successor maps injective.

- The parameter order, antisymmetric with finite upper sets.
- Injective `ATL_n(δ)`-module maps `W_(s,y)(n) → W_(t,z)(n)` for each elementary successor.

**Checks.**

- `n = 2`, `t = 0`, `s = 2`, `k = 1`: `z² = v^(±2)`, `z = ±v^(±1)`, `y = z v^(∓1) = ±1`; so
  `W_(2,±1)(2)` embeds in `W_(0,±v^(±1))(2)`, exactly where 4.3's Gram determinant `d² − a²` vanishes.
- `t = s` is excluded: no label is its own proper successor, and the identity map is the only
  endomorphism counted in 4.7.
- Invariance under `v ↔ v⁻¹`: replacing `v` by `v⁻¹` and `ε` by `−ε` gives the same pair of labels.
- For `v` not a root of unity, an elementary successor of `(t, z)` at level `s` exists only when
  `z² = v^(±s)`, which holds for at most one `s` and one `ε`; so every label has at most one
  successor at each level and the upper sets are finite.

*Needs:* 4.2, 4.3; TemperleyLieb Layer 6 (the Jones–Wenzl calculus used in the forest
coefficients).

### 4.6 The affine Gram determinant

Compute the Gram determinant of 4.3 in the monic-diagram bases over `ℤ[X, Z, Z⁻¹]`, where `X` is the
contractible-loop value and `Z` the winding character (at `t = 0` an essential circle evaluates to
`Z + Z⁻¹`). Put `m = (n − t)/2` and

```
a_(n,r) = C(n, (n−r)/2) − C(n, (n−r)/2 − 1),     E_(n,r) = C(n, (n−r)/2),
T_0(X) = 2,  T_1(X) = X,  T_(r+1)(X) = X T_r(X) − T_(r−1)(X),
F_r(X, Z) = Z² + Z⁻² − (−1)^r T_r(X),
```

with a negative lower binomial index meaning zero. Prove the block triangularisation and the scalar
Gram recurrences of Morin-Duchesne–Saint-Aubin, Corollary 4.2, equation (23), and Proposition 4.3,
equation (29), with `C_j = cos(jΛ)`, `Λ = π − λ`, `β = −2C_1` their loop value and `α = Z + Z⁻¹`
(their restriction product carries the ordinary cell multiplicities `a_(n,r)`), cancel the
quantum-integer factors as rational-function identities, and prove the telescoping identity
`Σ_(r ≤ s ≤ n, s ≡ r) a_(n,s) = E_(n,r)`, so the final exponent is `E_(n,r)`. Prove the
Laurent-polynomial identity

```
det G_(t,Z)(n; X) = σ_(n,t) Π_(t < r ≤ n, r ≡ t mod 2) F_r(X, Z)^(E_(n,r)),
σ_(n,t) = (−1)^((t+1) Σ_(t < r ≤ n, r ≡ t) E_(n,r)),
```

with matching reflected standard orders on the two bases. Fix the sign by comparing leading terms:
each diagonal entry has leading `X`-term `X^m` with coefficient one, every off-diagonal entry has
smaller `X`-degree, and `Σ_r r E_(n,r) = m C(n, m)`. For independent row and column permutations give
the determinant sign adapter; reciprocal rescalings of the two bases cancel. The empty product for
`t = n` is one, including `n = 0, 1`. At `X = δ = −v − v⁻¹` prove `T_r(δ) = (−1)^r (v^r + v^(−r))`, so
the factors become `z² + z⁻² − v^r − v^(−r)`. The identity holds at every parameter; no rational
expression is evaluated at a zero denominator. When another presentation of the periodic algebra
is used, transport the bases, seam and character explicitly: a per-strand twist is not `Z`.

- The universal Gram matrix over `ℤ[X, Z, Z⁻¹]` and its determinant formula with sign `σ_(n,t)`.
- The telescoping identity and the leading-term identity `Σ_r r E_(n,r) = m C(n,m)`.
- `T_r(−v − v⁻¹) = (−1)^r (v^r + v^(−r))`.

**Checks.**

- `n = 2`, `t = 0`: `F_2 = Z² + Z⁻² − (X² − 2) = (Z + Z⁻¹)² − X²`, `E_(2,2) = 1`, `σ_(2,0) = −1`, so the
  determinant is `X² − (Z + Z⁻¹)²`, which is 4.3's `d² − a²`.
- `n = 3`, `t = 1`: `F_3 = Z² + Z⁻² + X³ − 3X`, `E_(3,3) = 1`, `σ_(3,1) = 1`, matching 4.3. In
  Morin-Duchesne–Saint-Aubin's per-site twist `w` (their `v = e^(iµ)`, renamed because `v` is Tau
  Ceti's `q` here; their `u = e^(iλ/2)` is a root of the loop value, `u² + u⁻² = β`), the same
  determinant reads `X³ − 3X + w⁶ + w⁻⁶`: their factor `α² − 4C²_(3/2)` with `α = w³ + w⁻³` equals
  `α² − 2 − 2C_3 = w⁶ + w⁻⁶ + X³ − 3X` at `X = −2C_1`. So `Z = w³` here; identifying `Z` with `w` is
  wrong, and a model whose three-cycle product were `Z` would give `Z + Z⁻¹`.
- `n = 4`, `t = 0`, with `d = X` and `a = Z + Z⁻¹`, one compatible simultaneous order has Gram matrix

  ```
  [d², d,  a,  a,  ad, a²]
  [d,  d², ad, ad, a,  d ]
  [a,  ad, d², a², d,  a ]
  [a,  ad, a², d², d,  a ]
  [ad, a,  d,  d,  d², ad]
  [a², d,  a,  a,  ad, d²]
  ```

  with determinant `(d² − a²)⁴ ((d² − 2)² − a²)`: `E_(4,2) = 4`, `E_(4,4) = 1`, `σ_(4,0) = −1`,
  `F_2 = a² − d²`, `F_4 = a² − (d² − 2)²`. At `d = 3`, `a = 0` it is `9⁴ · 49 = 321489`; at `d = a = 3`
  the rank is two and the nullity four; with `a = 3` and `d = 3 + h` the leading term is `51840 h⁴`
  (`1296 · 40`). These are standard-module values: for the first take `z = i` and either root of
  `v² + 3v + 1 = 0`; for the second `z = (3 + √5)/2` and `v = −z`. Neither label is the excluded
  zero-head class, since `v² ≠ −1` in both.
- Telescoping at `n = 4`, `r = 0`: `a_(4,0) + a_(4,2) + a_(4,4) = 2 + 3 + 1 = 6 = E_(4,0)`; leading
  terms at `n = 4`, `t = 0`: `2 E_(4,2) + 4 E_(4,4) = 12 = 2 · C(4,2)`.
- Chen–Przytycki's type B determinant `Π_i (T_i(δ)² − α²)^(C(2n, n−i))` at `t = 0` (their §2,
  printed pp. 1–2) has the same factors `T_r(X)² − a²` as `F_r · (conjugate factor)` at even `r`;
  the six-state matrix above is their `n = 2` pairing with `⟨b_1, b_1⟩ = δ²`, `⟨b_1, b_2⟩ = α`,
  `⟨b_1, b_3⟩ = αδ`.

*Needs:* 4.3; TemperleyLieb Layer 0 (`qInt`), Layer 5 (`gramPoly`, `halfCount` multiplicities);
Mathlib `Polynomial.Chebyshev.T`, `Matrix.det`.

### 4.7 Specialisation, composition factors and Hom dimensions

Keep `z` fixed and substitute the independent loop variable `x` into the universal Gram matrix of
4.6, working over the discrete valuation ring `ℂ[x]_((x−δ))`. Its determinant is not the zero
polynomial, so Smith normal form bounds the nullity of the specialised Gram matrix by

```
Σ_(t < r ≤ n, r ≡ t) E_(n,r) · ord_(x−δ) F_r(x, z),
```

where several factors can vanish together at a root of unity and a factor can vanish to higher
order; sum the valuations with their multiplicities, never the number of vanishing labels. Compare
the images of the injective successor maps of 4.5 and their intersections, including coincident
factors and the exceptional zero-head class, with this bound. Then prove by induction on the finite
parameter order, in the Grothendieck group `AbelianK0` of the essentially small abelian category of
finite-dimensional `ATL_n(δ)`-modules (modelled by finite matrix representations; these modules have
finite length),

```
[W_(t,z)(n)] = Σ_((t,z) ≼ (s,y)) [L_(s,y)(n)]
```

with every multiplicity one (Graham–Lehrer 1998, Theorem 5.1, printed pp. 212–215, uncertified;
Graham–Lehrer 2003, §4, printed p. 489, records that the composition factors and multiplicities of
`W_(t,z)(n)` were determined in characteristic zero). Deduce `dim Hom(W_(s,y)(n), W_(t,z)(n)) = 1`
when `(t, z) ≼ (s, y)` and `0` otherwise, identity maps included, for labels in the nonzero-head
domain, and give the radical filtrations and head dimensions. No semisimplicity of `ATL_n(δ)` is
inferred.

- The valuation bound on the specialisation nullity.
- `[W_(t,z)(n)] = Σ_((t,z) ≼ (s,y)) [L_(s,y)(n)]` in `AbelianK0`, multiplicity one.
- `dim Hom(W_(s,y)(n), W_(t,z)(n)) ∈ {0, 1}` as stated; radical filtrations and head dimensions.

**Checks.**

- `n = 2`, `t = 0`, `z = v`: `F_2(x, v) = (v + v⁻¹)² − x²` has a simple zero at `x = δ = −(v + v⁻¹)`
  when `δ ≠ 0`, `E_(2,2) = 1`, so the nullity bound is `1`; `W_(0,v)(2)` has the one-dimensional
  submodule `W_(2,1)(2)` (4.5) and `[W_(0,v)(2)] = [L_(0,v)(2)] + [L_(2,1)(2)]`, both of dimension one.
- `n = 2`, `t = 0`, `z` generic: no factor vanishes, `W_(0,z)(2) = L_(0,z)(2)` is simple of dimension
  two.
- `v = i`, `n = 2`, `z = i`: `F_2(x, i) = −x²` vanishes to order two at `δ = 0`, bound `2`, and indeed
  the Gram matrix is zero and `L_(0,i)(2) = 0`; counting vanishing labels instead of orders would
  give `1`.
- `t = n`: `W_(n,z)(n) = L_(n,z)(n)` and `Hom(W_(n,z)(n), W_(n,z)(n)) = ℂ`.

*Needs:* 4.3, 4.5, 4.6; GrothendieckEulerForms Layer 2; Tau Ceti `AbelianK0`; Mathlib
`IsDiscreteValuationRing`, `Module.Basis.SmithNormalForm`.

### Examples

- `ATL_1(δ) = ℂ[u, u⁻¹]` and `ATL_0(δ) = ℂ[c]`, with their characters as the simple modules.
- `W_(0,z)(2)` with Gram determinant `δ² − (z + z⁻¹)²`, simple exactly when `z ∉ {±v^(±1)}`.
- The six-state `W_(0,z)(4)` at `(d, a) = (3, 0)`, `(3, 3)` and `(3 + h, 3)`.
- `W_(1,z)(3)` with determinant `δ³ − 3δ + z² + z⁻²`.

### Dependencies

TemperleyLieb Layers 0–3, 5, 6; GrothendieckEulerForms Layer 2; Tau Ceti `AbelianK0`; Mathlib
`Polynomial.Chebyshev.T`, `LaurentPolynomial`, `Matrix.det`, `IsDiscreteValuationRing`,
`Module.Basis.SmithNormalForm`.

## Downstream consumers

No roadmap consumes this roadmap at present. Subfactors and CategoricalOperatorAlgebras build the
Temperley–Lieb material they need in Subfactors Layer 3 and consume it from there.

## References

- D. Penneys, *Unitary Quantum Symmetries Lite*, Part I, Chapter 4 (author's page): Lemma 4.3.8,
  printed p. 147; Theorem 4.3.17, printed p. 150; Facts 4.4.14 (TB1)–(TB7), printed pp. 154–155;
  Definition 4.5.1, Proposition 4.5.3 and Exercise 4.5.4, printed p. 158; Facts 4.5.5, printed
  p. 159; Examples 4.6.12 and 4.6.14, printed pp. 163–164. Positive-loop convention `d = q + q⁻¹`.
- D. Ridout and Y. Saint-Aubin, *Standard modules, induction and the structure of the Temperley–Lieb
  algebra* (arXiv:1204.4505): Theorem 4.7, equation (4.20), printed p. 20; Corollary 4.8 and
  Proposition 4.9, printed pp. 20–21.
- K. Iohara, G. I. Lehrer and R. B. Zhang, *The Jones quotients of the Temperley–Lieb algebras*
  (arXiv:1702.08128): §5.3, Theorem 5.4 (the Jones quotient at `ℓ = 4` is the even Clifford
  algebra) and §5.4, Proposition 5.5 (the scalar coefficient is the Jones trace). Their
  `γ_j² = 1/2`; loop value `−(q + q⁻¹)` with `q = −exp(πi/4)`.
- K. Iohara, G. I. Lehrer and R. B. Zhang, *Temperley–Lieb algebras at roots of unity, a fusion
  category and the Jones quotient* (author's page): Proposition 3.1 and Remark 3.2 (the radical of
  the trace form is generated by the Jones–Wenzl idempotent). Loop value `−(q + q⁻¹)`.
- J. Chen, *The Temperley–Lieb categories and skein modules* (arXiv:1502.06845): Theorem 2.3.2
  (Jones–Wenzl recursion), Theorems 2.4.6 and 3.3.5 (generic multiplicities and tensor
  decomposition), Theorem 4.0.8 (generic semisimplicity), Theorems 5.4.4 and 5.4.5 (truncated
  rules and root-of-unity semisimplicity). Loop value `q + q⁻¹`.
- A. Morin-Duchesne and Y. Saint-Aubin, *A homomorphism between link and XXZ modules over the
  periodic Temperley–Lieb algebra* (arXiv:1203.4996): Corollary 4.2, equation (23), and
  Proposition 4.3, equation (29); conventions `C_j = cos(jΛ)`, `Λ = π − λ`, loop `−2C_1`, and the
  per-site twist parameter `v = e^(iµ)`, written `w` in 4.6.
- Q. Chen and J. H. Przytycki, *The Gram determinant of the type B Temperley–Lieb algebra*
  (arXiv:0802.1083): §2, the annular pairing and its determinant.
- J. J. Graham and G. I. Lehrer, *The representation theory of affine Temperley–Lieb algebras*,
  L'Enseignement Mathématique 44 (1998), 173–218, doi:10.5169/seals-63902 (uncertified, cited by
  locator): Definitions 2.5–2.6, printed p. 188; Theorem 2.8, printed pp. 189–191; Theorem 3.4,
  printed pp. 197–201; Corollary 4.7, printed p. 211; Theorem 5.1, printed pp. 212–215.
- J. J. Graham and G. I. Lehrer, *Diagram algebras, Hecke algebras and decomposition numbers at
  roots of unity*, Annales scientifiques de l'École normale supérieure 36 (2003), 479–524
  (Numdam): §4, printed pp. 487–489, the affine Temperley–Lieb algebras, their diagrammatic
  description and the cell modules `W_(t,z)(n)`.
- K. Erdmann and R. M. Green, *On representations of affine Temperley–Lieb algebras, II*, Pacific
  Journal of Mathematics 191 (1999), 243–273 (arXiv:math/9811017): §2, printed pp. 3–10, affine
  diagrams, generators and relations, winding numbers, the ideals `I_t`, the finite cellular
  quotients and their standard modules.
- V. F. R. Jones, *A polynomial invariant for knots via von Neumann algebras*, Bulletin of the
  American Mathematical Society 12 (1985), 103–111, doi:10.1090/S0273-0979-1985-15304-2 (AMS open
  archive): printed p. 104 (the algebras `A_n` with `n` projections and parameter `t`, the spin
  representation of Temperley–Lieb, the Potts–ice equivalence, and the trace as the restriction of
  the Powers state); printed p. 107 (the `A_n` at `t = i` are Clifford algebras; at `t = exp(πi/3)`
  they are related to a cubic Clifford algebra and the braid image is finite).
- H. N. V. Temperley and E. H. Lieb, *Relations between the 'percolation' and 'colouring' problem
  and other graph-theoretical problems associated with regular planar lattices*, Proceedings of
  the Royal Society A 322 (1971), 251–280, doi:10.1098/rspa.1971.0067 (uncertified, cited for the
  Potts–ice equivalence of 1.6).
- R. J. Baxter, S. B. Kelland and F. Y. Wu, *Equivalence of the Potts model or Whitney polynomial
  with an ice-type model*, Journal of Physics A 9 (1976), 397–406, doi:10.1088/0305-4470/9/3/009
  (uncertified, cited for the loop and six-vertex forms of 1.6).
- C. Galindo and E. C. Rowell, *Braid representations from unitary braided vector spaces*
  (arXiv:1312.5557): §3.1, Proposition 3.4 (the Gaussian operator `R`) and Proposition 3.6
  (finiteness of the Gaussian braid image).
- E. C. Rowell and H. Wenzl, *SO(N)_2 braid group representations are Gaussian*, Quantum Topology
  8 (2017), doi:10.4171/QT/85 (read as arXiv:1401.5329v4): §4, Theorem 4.9 (quantum tori and
  finite Gaussian braid images).
