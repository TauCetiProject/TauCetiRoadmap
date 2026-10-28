# Roadmap: approximation, deformation and rigidity of finite factors

**Summary.** This roadmap builds the correspondence and approximation methods used to
distinguish finite von Neumann algebras and to recover group actions from their crossed
products. From normal correspondences, tracial `L²`, conditional expectations and discrete
crossed products (Subfactors, VonNeumannAlgebras), completely positive maps and tensor norms
(CStarAlgebras), free products (FreeProbability) and invariant means (AmenableGroups), it develops
relative amenability, property (T) and spectral gap, Haagerup approximation, intertwining by
bimodules, Cartan pairs and cost, and malleable deformations as reusable theories. Its end
theorems are: relative property (T) of `(ℤ²⋊SL₂(ℤ), ℤ²)` and of `(ℤ²⋊G, ℤ²)` for nonamenable
`G ≤ SL₂(ℤ)` (Layer 3); the Haagerup property of the free groups `F_n`, `2 ≤ n ≤ ∞` (Layer 4);
`F(L(ℤ²⋊F_n)) = {1}` for a finite-index free subgroup `F_n ≤ SL₂(ℤ)` (Layer 7); Popa's
Bernoulli strong rigidity theorem (Layer 9); and solidity and primeness of `L(F_n)`,
`2 ≤ n ≤ ∞` (Layer 10). [Suggested.lean](Suggested.lean) states the first two at the pinned
libraries; the others need carriers the pins lack (group von Neumann algebras, crossed products,
amplifications, spatial tensor products), as its docstring records.

## Scope and ownership

This roadmap owns: the general tracial basic construction over arbitrary subalgebras of finite
algebras; weak containment of normal correspondences; relative amenability and the localization
lemma; relative property (T) for groups and for inclusions of tracial von Neumann algebras;
spectral gap for representations, actions and inclusions, and fullness; positive-definite
functions and the Haagerup property for groups and tracial algebras, with its relative version;
Popa's intertwining-by-bimodules relation `P ≺_M Q`; Cartan pairs of tracial algebras, the
p.m.p. orbit/Cartan comparison, cost and fundamental groups; tracial and s-malleable
deformations, mixing and clustering, Popa's absorption theorem and Bernoulli strong rigidity;
solidity and primeness of free group factors. No roadmap on main or among the open roadmap
proposals plans property (T), the Haagerup property, intertwining by bimodules, cost or the
fundamental group of a II₁ factor.

It leaves to named roadmaps:

- normal correspondences, Connes fusion, bounded vectors and the factor basic construction:
  Subfactors §§S1–S2;
- normality, tracial standard form, coupling dimension, group algebras and discrete crossed
  products, the Bernoulli shift over a finite atomic base (target `V8.BernoulliArbitraryDiscrete`),
  nonsingular measured relations and their algebras, tracial ultrapowers and injectivity:
  VonNeumannAlgebras §§V2–V13b;
- completely positive maps, Stinespring dilation, the Schwarz inequality for unital 2-positive
  maps and minimal/maximal C*-tensor norms: CStarAlgebras §§C3–C5;
- interior tensor products of C*-correspondences: HilbertModules §§H1–H3;
- reduced free products and their `L²` decompositions: FreeProbability §§F3–F4;
- covariant representations, regular representations and the P₂ amenability criterion:
  OperatorAlgebraDynamics §§D1–D2;
- invariant means, the free-group obstruction and Følner theory for discrete groups:
  AmenableGroups Layers 1–5.

Hausdorff topological groupoid C*-algebras stay in OperatorAlgebraDynamics. General cocycle
superrigidity, the realization of all possible fundamental groups, general amalgamated
free-product rigidity and the isomorphism problem for free group factors are not targets of
this roadmap.

## Conventions

A tracial von Neumann algebra `(M,τ)` carries a faithful normal tracial state, `τ(1)=1`; it
need not be a factor. II₁, separable predual, diffuseness and finite index are added where
stated. Subalgebras are weakly closed and share the ambient unit unless a corner projection is
displayed; a corner `pMp` carries `τ_p(x)=τ(x)/τ(p)`. Inner products are conjugate-linear in the
first variable, `‖x‖₂=τ(x*x)^(1/2)`, and `Ad(u)(x)=uxu*`.

An M–N correspondence has commuting normal unital representations of `M` and `Nᵐᵒᵖ`. `H≺K` is
weak containment of correspondences; `P≺_M Q` is intertwining of subalgebras inside `M`; the two
relations have different carriers. Approximation uses nets unless a separability or countability
hypothesis permits a sequence. A normal CP map is subunital when `φ(1)≤1` and subtracial when
`τ∘φ≤τ` on positive elements.

Groups in Layers 3, 4, 7 and 9 are discrete. A unitary representation of a discrete group `Γ` is
a Mathlib `ContRepresentation ℂ Γ H` on a complex Hilbert space whose operators preserve norms;
the discrete topology makes continuity automatic. The action of `SL₂(ℤ)` on `ℤ²` is matrix
multiplication on column vectors, and `ℤ²⋊G` is Mathlib's `SemidirectProduct` of the
multiplicative copy of `ℤ²` by `G`. A positive-definite function satisfies
`Σᵢⱼ conj(cᵢ) cⱼ φ(gᵢ⁻¹gⱼ) ≥ 0`, so `g ↦ ⟨ξ, π(g)ξ⟩` is positive definite for a unitary
representation `π`. Left translation of functions is `(L_g f)(x)=f(g⁻¹x)`.

Measured actions are actions of countable discrete groups on standard probability spaces; freeness
means essential freeness, and ergodicity and isomorphisms are modulo null sets. The amplification
`M^t` of a II₁ factor uses matrix corners with unnormalized amplification trace `t`.

## Exact supplier contracts

| Supplier | Exact input |
| --- | --- |
| Mathlib | `VonNeumannAlgebra`, `WStarAlgebra`, `StarAlgHom`, `CompletelyPositiveMap` (`→CP`), `PositiveLinearMap`, opposite algebras, algebraic tensor products and `Algebra.TensorProduct.lift`, `unitary`, `ContinuousLinearMap.adjoint`, orthogonal projections; `ContRepresentation` and `Representation.invariants`; `Matrix.SpecialLinearGroup`, `Matrix.SpecialLinearGroup.toLin'`, `SemidirectProduct`, `FreeGroup`, `lp`; `MeasureTheory.Measure.infinitePi`. Mathlib has no property (T), Haagerup property, group von Neumann algebra, crossed product or amplification. |
| Tau Ceti | `IsUnitary` for continuous representations and `isUnitary_iff_norm_map` in `TauCeti.RepresentationTheory.Continuous.Unitary.Basic`: unitarity of a representation is equivalent to norm preservation by each operator. |
| Subfactors | §S1: normal correspondences, intertwiners, direct sums, conjugates, Connes fusion and bounded vectors; §S2: expectations, Pimsner–Popa bases and the basic construction for II₁ factors. |
| VonNeumannAlgebras (the roadmap of that name with the modular-theory and injectivity layers V0–V13) | §V2: corners, spatial tensor products, Borel logarithms of unitaries; §V3: type I structure; §V4: preduals, normality, ultraweak topology, Lusin–Novikov selection; §§V5–V6: projection comparison, center-valued traces, tracial standard form; §V7: coupling dimension and the trace-preserving expectation onto a subfactor; §V8: group algebras, discrete crossed products, subgroup expectations, and `V8.BernoulliArbitraryDiscrete` (Bernoulli shift of an infinite discrete group over a finite atomic base, cylinder density, ergodicity, mixing, proper outerness, II₁ crossed product); §V11: nonsingular countable measured relations, full groups, hyperfinite exhaustions, their untwisted algebras, and trace-preserving expectations onto every subalgebra of a finite algebra; §V12: tracial ultrapowers, central sequences and the free-factor commutator estimate; §§V13a–V13b: injectivity, semidiscreteness, hypertraces, the hyperfinite II₁ factor `R`, and the commuting-representation minimal-norm criterion. |
| CStarAlgebras | §C3: completely bounded maps; §C4: Stinespring dilation and the Schwarz inequality for unital 2-positive maps; §C5: the algebraic tensor product `A⊙B` and its minimal and maximal C*-norms, the minimal norm being the spatial one. |
| HilbertModules | §H3: the interior tensor product of C*-correspondences, compared with normal fusion after completion. |
| FreeProbability | §F3: reduced free products of tracial algebras and the reduced-word decomposition of their `L²`; §F4: amalgamated free products and their expectations. |
| OperatorAlgebraDynamics | §D1: covariant representations on `ContRepresentation`; §D2: the regular representation, the P₂ amenability criterion and its converse to an invariant mean. |
| AmenableGroups | Layers 1–2: invariant means `Mean`, `Amenable`, and its topology-free discrete form; Layer 3: nonamenability of `F₂` and of every group containing it; Layers 4–5: closure properties and Følner criteria. Under the discrete topology `Amenable G` is the predicate `IsAmenableDiscrete G` of this roadmap. |

## How to read the build

Layer 1 builds correspondence coefficients and weak containment; Layer 2 the general basic
construction and relative amenability. Layers 3 and 4 are the two opposing approximation
properties, relative property (T) with spectral gap and Haagerup approximation, for groups and for
tracial algebras. Layer 5 develops intertwining by bimodules and proves that rigidity against
Haagerup approximation forces intertwining. Layer 6 applies this to Cartan pairs and orbit
equivalence relations, and Layer 7 combines it with cost to compute a trivial fundamental group.
Layer 8 develops malleable deformations, mixing and Popa's absorption theorem; Layer 9 proves
Bernoulli strong rigidity from it. Layer 10 runs the free-product deformation to prove solidity and
primeness of free group factors.

## Layer 1: Correspondence coefficients and weak containment

### 1.1 Joint representations and coefficient maps

Consume Subfactors §S1's normal correspondences, intertwiners, direct sums, conjugates and fusion.
Construct the joint algebraic representation `π_H : M⊙Nᵐᵒᵖ → B(H)`, `π_H(x⊗yᵒᵖ)ξ = xξy`, from the
two commuting actions by the universal property of the algebraic tensor product. Develop coefficient
functionals, polarization, finite families and their matrix positivity. For a right bounded vector
`ξ`, construct `φ_ξ(x) = R_ξ* π_M(x) R_ξ` as a normal CP map into `N`.

- `π_H` is a unital star homomorphism, and an intertwiner of correspondences intertwines the joint
  representations.
- `⟨xξ, ξ⟩_N`-type coefficients satisfy `τ_N(φ_ξ(x)y) = ⟨xξy, ξ⟩`; `φ_ξ` is subunital iff
  `‖R_ξ‖ ≤ 1`, and subtracial iff the left coefficient `x ↦ ⟨xξ,ξ⟩` is dominated by `τ_M`.
- `φ_ξ` is covariant under unitary equivalence of correspondences.

*Needs:* Subfactors §S1 (correspondences, bounded vectors); Mathlib `Algebra.TensorProduct.lift`,
`CompletelyPositiveMap`.

### 1.2 The correspondence of a normal CP map

For a normal CP map `φ : M → N` construct its correspondence from the positive form
`⟨x⊗a, y⊗b⟩ = τ_N(a*φ(x*y)b)` on `M⊙N`, its null quotient and completion, and its commuting normal
actions (Anantharaman–Popa, §13.1). Construct the distinguished bounded vector `ξ_φ` and recover
`φ = φ_(ξ_φ)`, including degenerate maps and support corners. The cyclic subcorrespondence
generated by `ξ_φ ⊗ ξ_ψ` inside the fusion represents `ψ∘φ`; it is all of the fusion only when that
vector is cyclic. Compare with CStarAlgebras §C4's Stinespring construction and HilbertModules §H3's
interior tensor product after normal completion.

**Checks.**

- For `φ = id_M` the construction returns the identity correspondence `L²(M)` with `ξ_φ = 1̂`; a
  construction that forgot the right `N`-action would return `L²(M)` only as a left module.
- For `φ = τ(·)1` on `M = M₂(ℂ)` with normalized trace the correspondence is the coarse
  correspondence `L²(M)⊗L²(M)` of dimension 16; the identity correspondence has dimension 4.
- For `φ = 0` the correspondence is `0` and `ξ_φ = 0`, so the degenerate case is not excluded.

*Needs:* §1.1; CStarAlgebras §C4; HilbertModules §H3; Subfactors §S1 (fusion).

### 1.3 Weak containment

Define `H≺K` by `‖π_H(z)‖ ≤ ‖π_K(z)‖` for every `z ∈ M⊙Nᵐᵒᵖ`, and prove its equivalence with
approximation of every finite family of vector coefficients on every finite coefficient set by
finite sums of `K`-vector coefficients, the definition of Anantharaman–Popa by the Fell topology
(Definition 13.3.8 and Remark 13.3.9, p. 229). Construct the Fell topology and identify its closure
under arbitrary Hilbert direct sums with this relation. Define weak equivalence as mutual
containment.

- `≺` is reflexive and transitive and invariant under unitary equivalence.
- `≺` is compatible with conjugation, direct sums and restriction, and is preserved by fusion on
  either side.
- For M–M correspondences, `L²(M)≺H` iff the identity is the pointwise `L²` limit of sums of
  subunital subtracial bounded-vector coefficient maps of `H` (Anantharaman–Popa, Proposition
  13.3.10), with a sequence under a separability hypothesis.
- The joint representation extends to the maximal C*-tensor completion, and for every tracial `M`
  `‖π_coarse(z)‖ = ‖z‖_min` on `M⊙Mᵐᵒᵖ`, by the faithful spatial model and CStarAlgebras §C5.
- `L²(M)≺coarse(M)`, equivalently `‖π_id(z)‖ ≤ ‖z‖_min` for all `z ∈ M⊙Mᵐᵒᵖ`, equivalently
  extension of `π_id` to a unital star homomorphism `M⊗_min Mᵐᵒᵖ → B(L²(M))`, holds iff `M` is
  amenable (injective) (Anantharaman–Popa, Theorem 13.4.1, p. 231), using VonNeumannAlgebras §V13b's
  commuting-representation criterion transported by the standard opposite action. This is a
  one-way domination, not equality of norms and not weak equivalence with the coarse
  correspondence.

**Checks.**

- For `M = ℂ⊕ℂ`, `τ(a,b) = (a+b)/2`, `e = (1,0)`, `f = (0,1)` and `z = e⊗fᵐᵒᵖ`: `‖z‖_min = 1` and
  `π_coarse(z)` is a nonzero projection, whereas `π_id(z)ξ = eξf = 0` for every `ξ ∈ L²(M)`. So the
  identity correspondence of an amenable algebra is dominated by, but not weakly equivalent to, the
  coarse one; a definition by norm equality would declare `ℂ⊕ℂ` nonamenable.
- More generally, for a nontrivial central projection `e`, `π_id(e⊗(1−e)ᵒᵖ) = 0`.
- For `M = ℂ`, every correspondence is a Hilbert space and `H≺K` iff `K ≠ 0` or `H = 0`.
- Every M₂(ℂ)–M₂(ℂ) correspondence is a multiple of the irreducible `ℂ²⊗ℂ²`, so `H≺K` iff `K ≠ 0`
  or `H = 0`, whereas unitary containment compares multiplicities: two copies are weakly contained
  in one copy without embedding into it. For `M = L(F₂)` the coarse correspondence does not weakly
  contain `L²(M)`.

*Needs:* §§1.1–1.2; CStarAlgebras §C5 (minimal and maximal norms); VonNeumannAlgebras §V13b
(commuting-representation minimal-norm criterion).

### Examples

The identity and coarse correspondences of `M_n(ℂ)`, of `ℂ⊕ℂ` and of a diffuse abelian algebra
`L∞[0,1]`, with their coefficient maps `id` and `τ(·)1`.

### Dependencies

Subfactors §S1; CStarAlgebras §§C4–C5; HilbertModules §H3; VonNeumannAlgebras §§V4, V13b.

## Layer 2: Amenability relative to a subalgebra

### 2.1 The general tracial basic construction

For `Q ⊆ M` construct `⟨M,e_Q⟩ = (M∪{e_Q})''` on `L²(M)`, with its canonical faithful normal
semifinite trace `Tr(xe_Qy) = τ(xy)`, operator-valued weight and finite-trace ideal
(Anantharaman–Popa, §9.4). Identify `L²(⟨M,e_Q⟩,Tr)` with `L²(M)⊗_Q L²(M)` as an M–M
correspondence. This includes `Q` with diffuse center and infinite index; Subfactors §S2 treats
the II₁ factor case.

- `e_Q x e_Q = E_Q(x) e_Q` for `x ∈ M`, and `span(M e_Q M)` is weakly dense.
- `⟨M,e_Q⟩ = (JQJ)'`, and `p⟨M,e_Q⟩p` is the basic construction of `pMp` over `pQp` for a
  projection `p ∈ Q`.

**Checks.**

- For `Q = M`, `e_Q = 1` and `⟨M,e_Q⟩ = M`.
- For `Q = ℂ1`, `⟨M,e_Q⟩ = B(L²(M))` and `Tr` is the usual trace, with `Tr(e_ℂ) = 1`.
- For `M = ℂ⊕ℂ ⊇ Q = ℂ1` the basic construction is `M₂(ℂ)`, not `ℂ⊕ℂ`; for `Q = ℂ⊕ℂ` it is `ℂ⊕ℂ`.

*Needs:* VonNeumannAlgebras §V11 (trace-preserving expectations onto every subalgebra of a finite
algebra), §V6 (tracial standard form); Subfactors §S2 (factor case, for comparison).

### 2.2 Relative amenability

Define `P ⊆ pMp` amenable relative to `Q` inside `M` when there is a `P`-central state `Ω` on
`p⟨M,e_Q⟩p` restricting to `τ_p` on `pMp`; `Ω` is not required normal (Anantharaman–Popa,
Definition 13.4.5, p. 235).

- Equivalent criteria by normal positive functionals and unit vectors in `L²(p⟨M,e_Q⟩p, Tr)`:
  moments converge to `τ_p` and each `P`-unitary commutator converges to zero (Anantharaman–Popa,
  Theorem 13.4.4, p. 233).
- For `p = 1`: `_M L²(M)_P ≺ _M(L²(M)⊗_Q L²(M))_P` (same theorem, (v)).
- For a corner: relative amenability of `P ⊆ pMp` iff of `P⊕ℂ(1−p)` in `M`, and
  `L²(pMp) ≺ pL²(⟨M,e_Q⟩)p` as pMp–P correspondences.
- Permanence under unitary conjugacy, expected subalgebras, corners, amplification and
  intermediate subalgebras.
- For `p=1, P=M, Q=ℂ` this is amenability (injectivity) of `M`, equivalently `L²(M)≺coarse(M)`
  (Layer 1.3); VonNeumannAlgebras §V13's hypertraces and CP factorizations are identified with
  Layer 1's coefficients.
- For a subgroup `Λ ≤ Γ`, `L(Γ)` is amenable relative to `L(Λ)` iff `Γ` has a `Γ`-invariant mean on
  `ℓ∞(Γ/Λ)`.

**Checks.**

- For `Q = M` every `P` is amenable relative to `Q`: `Ω = τ_p` on `p⟨M,e_M⟩p = pMp`.
- For `M = L(F₂)`, `P = Q = ℂ1`, `p = 1`, the vacuum state `T ↦ ⟨T1̂,1̂⟩` on `⟨M,e_ℂ⟩ = B(L²(M))`
  restricts to `τ` and is `P`-central, although `M` is nonamenable: relative amenability of `P`
  is not amenability of `M`.
- `L(F₂)` is not amenable relative to `ℂ1` (taking `P = M`), by Layer 1.3 and nonamenability of
  `F₂` (AmenableGroups Layer 3); relative amenability does not assert finite index, as `Λ = {1}` in
  an amenable infinite `Γ` shows.

*Needs:* §2.1; Layer 1.3; VonNeumannAlgebras §§V12–V13b; AmenableGroups Layers 1–3.

### 2.3 Localization and amenable summands

Develop the localization lemma: a bounded, nonvanishing net of vectors in multiples of
`L²(⟨M,e_Q⟩)` with uniform left coefficient bound `‖xξ_i‖ ≤ C‖x‖₂` and asymptotic `P`-centrality
produces a nonzero projection `e ∈ Z(P'∩pMp)` such that `Pe` is amenable relative to `Q`
(Anantharaman–Popa, Lemma 13.4.8, p. 236). Construct the limiting normal functional, its support and
spectral cuts, and the corner state. For `Q = ℂ` pass from `Pe` to the nonzero central summand of
`P` given by the kernel of `x ↦ xe`, normally isomorphic to `Pe`; so a coarse almost-central net
contradicts absence of an amenable direct summand, even when `e ∈ P'` rather than `P`.

- Amenability is stable under arbitrary central direct sums.
- There is a largest `z ∈ Z(P)` with `Pz` amenable, and `P(1−z)` has no nonzero amenable direct
  summand.

*Needs:* §2.2; Subfactors §S1 (bounded vectors).

### Examples

The vacuum state on `B(L²(L(F₂)))`; subgroup inclusions `L(Λ) ⊆ L(Γ)` with `Γ/Λ` amenable or not;
`P ⊆ L(F₂)` amenable relative to a diffuse abelian `Q`.

### Dependencies

Layer 1; VonNeumannAlgebras §§V6, V11–V13b; Subfactors §§S1–S2; AmenableGroups Layers 1–3.

## Layer 3: Property (T), spectral gap and fullness

### 3.1 Relative property (T) for groups

Define `HasAlmostInvariantVectors ρ` for a representation `ρ` of a discrete group: for every finite
`F` and `ε > 0` some unit vector is moved by less than `ε` by each element of `F`. Define
`RelativePropertyT Λ` for a subgroup `Λ ≤ Γ`: every unitary representation of `Γ` with almost
invariant vectors has a nonzero `Λ`-invariant vector (Anantharaman–Popa, Definition 14.1.1,
p. 241). Property (T) of `Γ` is the case `Λ = Γ`.

- `RelativePropertyT Λ` iff there are finite `F` and `δ > 0` (a Kazhdan pair) such that every
  unitary representation with a `(F,δ)`-invariant unit vector has a nonzero `Λ`-invariant vector,
  and iff the quantitative form holds: for every `ε>0` some `(F,δ)` forces a `Λ`-invariant vector
  `ε`-close to the given one (Anantharaman–Popa, Proposition 14.1.2 (a)–(c), p. 241).
- Equivalently, every net of positive-definite functions converging pointwise to `1` converges
  uniformly on `Λ` (same proposition, (d)–(e)).
- Restriction to intermediate subgroups, passage to quotients, and finite-index transfer.

Define the action `slTwoAction` of `SL₂(ℤ)` on the multiplicative copy of `ℤ²` by
`v ↦ g·v` (column vectors).

**Checks.**

- For `g = [[1,1],[0,1]]`, `slTwoAction g` sends `(0,1)` to `(1,1)` and fixes `(1,0)`; a row-vector
  convention `v ↦ vg` would send `(0,1)` to `(0,1)` and `(1,0)` to `(1,1)`.
- `RelativePropertyT ⊥` holds for every `Γ`: a representation with almost invariant vectors is
  nonzero, and every vector is `{1}`-invariant.
- For finite `Γ`, `RelativePropertyT ⊤` holds: averaging an `(Γ, ε)`-invariant unit vector over
  `Γ` gives a nonzero invariant vector when `ε < 1`.
- `RelativePropertyT ⊤` fails for `Γ = ℤ`: the regular representation on `ℓ²(ℤ)` has almost
  invariant vectors `|I_n|^(-1/2) 1_(I_n)` for intervals `I_n` and no nonzero invariant vector.
- Asking for a `Γ`-invariant rather than a `Λ`-invariant vector would turn relative property (T) of
  `(ℤ²⋊SL₂(ℤ), ℤ²)` into property (T) of `ℤ²⋊SL₂(ℤ)`, which fails: the group surjects onto
  `SL₂(ℤ)`, which is infinite with the Haagerup property (Layer 4.1).

*Needs:* Mathlib `ContRepresentation`, `Representation.invariants`, `SemidirectProduct`,
`Matrix.SpecialLinearGroup.toLin'`; Tau Ceti `isUnitary_iff_norm_map`.

### 3.2 The pairs `(ℤ²⋊G, ℤ²)`

Prove `relativePropertyT_inl_slTwo`: the pair `(ℤ²⋊SL₂(ℤ), ℤ²)` has relative property (T)
(Kazhdan, Margulis; Anantharaman–Popa, Example 14.2.8, p. 245). More generally prove
`relativePropertyT_inl_of_not_isAmenableDiscrete`: for every subgroup `G ≤ SL₂(ℤ)` that is not
amenable, `(ℤ²⋊G, ℤ²)` has relative property (T) (Burger; same example). Here `IsAmenableDiscrete G`
is existence of a left-invariant mean on the bounded real functions on `G`: a positive linear
functional on `ℓ∞(G)` with value `1` on the constant `1`, unchanged by `f ↦ (x ↦ f(g⁻¹x))`. Route:
restrict a representation with almost invariant vectors to `ℤ²`, take the projection-valued spectral
measure on the dual torus `𝕋² = ℝ²/ℤ²`, push it to the projective line, and show that a sequence of
almost invariant unit vectors without `ℤ²`-invariant part produces a `G`-invariant mean on the
projective line, which forces amenability of `G` because the point stabilizers of `G` acting on the
projective line are amenable. Construct the spectral measures and their
`G`-equivariance used by this argument.

**Checks.**

- `IsAmenableDiscrete` holds for the trivial group (evaluation at `1`) and for `ℤ` (a Banach limit
  of averages over `[0,n]`); it fails for `F₂ ≤ SL₂(ℤ)`, generated by `[[1,2],[0,1]]` and
  `[[1,0],[2,1]]` (AmenableGroups Layer 3), so the second theorem applies to `G = F₂` and to
  `G = SL₂(ℤ)` itself.
- For the amenable subgroup `G = {[[1,n],[0,1]] : n ∈ ℤ}`, `(ℤ²⋊G, ℤ²)` fails relative property
  (T): `ℤ²⋊G` is amenable and infinite, and the regular representation restricted to `ℤ²` has no
  nonzero invariant vector. So the nonamenability hypothesis cannot be dropped.
- Under the discrete topology `IsAmenableDiscrete G` agrees with AmenableGroups' `Amenable G`,
  since every bounded function on a discrete group is uniformly continuous.

*Needs:* §3.1; Mathlib spectral theory for commuting unitaries and `lp`; AmenableGroups Layers 1–3.

### 3.3 Relative property (T) for tracial inclusions

Define relative property (T) of `B ⊆ M`: for each `ε > 0` there are finite `F ⊂ M` and `δ > 0`
such that every subunital subtracial normal CP map `φ` with `‖φ(x)−x‖₂ ≤ δ` on `F` satisfies
`‖φ(b)−b‖₂ ≤ ε` for all `b ∈ B` with `‖b‖ ≤ 1` (Anantharaman–Popa, Definition 14.2.1, p. 242).
Property (T) of `M` is the case `B = M`.

- Equivalent correspondence criterion with tracial, almost `M`-central unit vectors and a nearby
  `B`-central vector (Anantharaman–Popa, Proposition 14.2.4, p. 243).
- For `Λ ≤ Γ`, `RelativePropertyT Λ` iff `L(Λ) ⊆ L(Γ)` is relatively rigid (Anantharaman–Popa,
  Proposition 14.2.7, p. 245).
- Invariance under trace-preserving isomorphism; persistence through a trace-compatible unital
  inclusion `M ⊆ M̃`: compress a CP map on `M̃` by `E_M`, apply rigidity in `M`, and use the
  subunital Schwarz contraction `‖φ̃(b)−b‖₂² ≤ 2‖b‖₂‖E_M(φ̃(b))−b‖₂`.
- Corner and finite amplification transfer (Anantharaman–Popa, Proposition 14.2.11, p. 246).

**Checks.**

- `B = ℂ1` is rigid in every `M`: `‖φ(1)−1‖₂ ≤ δ` on `F = {1}` controls all scalars of norm `≤ 1`.
- `L(ℤ)` does not have property (T): the Fourier multipliers `u_n ↦ e^(−t|n|)u_n` are unital
  trace-preserving CP maps converging to the identity pointwise but not uniformly on the unit ball.
- Rigidity of `B ⊆ M` does not give property (T) of `M`: `L(ℤ²) ⊆ L(ℤ²⋊SL₂(ℤ))` is rigid by
  Layer 3.2 and the group-algebra comparison above, while `ℤ²⋊SL₂(ℤ)` lacks property (T) because it
  surjects onto the infinite Haagerup group `SL₂(ℤ)`.

*Needs:* §3.1; Layer 1; CStarAlgebras §C4 (Schwarz inequality, used through Layer 4.2's subunital
form).

### 3.4 Spectral gap and fullness

For a unitary representation on the orthogonal complement of its invariant vectors define spectral
gap by a finite `F` and `C > 0` with `‖ξ‖² ≤ C Σ_(g∈F) ‖ρ(g)ξ−ξ‖²` (Anantharaman–Popa, Definition
15.1.1, p. 257); prove equivalence with failure of weak containment of the trivial representation
there (Corollary 15.1.4). For trace-preserving actions use the Koopman representation on
`L²(M)⊖ℂ1`. Build the finite-cylinder Hilbert decomposition for Bernoulli actions of infinite groups
from VonNeumannAlgebras `V8.BernoulliArbitraryDiscrete` and extend it to a general standard base;
prove spectral gap of the Bernoulli action of a nonamenable countable group through quasi-regular
representations with finite stabilizers (Anantharaman–Popa, Lemma 15.1.9). This is a spectral-gap
theorem, not property (T) for every nonamenable group.

For II₁ factors develop the unitary-commutator spectral-gap inequality. Define fullness by
closedness of the inner automorphism group in the pointwise predual-norm topology
(Anantharaman–Popa, Definition 15.3.1). For separable predual prove that fullness, spectral gap,
absence of property Γ and triviality of bounded central sequences are equivalent (Theorem 15.3.2),
comparing with VonNeumannAlgebras §V12's ultrapower APIs. Construct the unitary quotient topology
and the lifting argument needed for closedness.

For an inclusion `P ⊆ M` distinguish an all-`L²` spectral-gap inequality from the unit-ball
condition that almost commuting bounded elements are `L²`-close to `E_(P'∩M)`; prove the latter
equivalent to `P'∩M^ω = (P'∩M)^ω` when `P` has separable predual and `ω` is a free ultrafilter on
`ℕ`. For expected `Q ⊆ M` construct `Q^ω ⊆ M^ω` with `E_(Q^ω) = (E_Q)^ω` on bounded representatives,
and its corner, commutant and inclusion comparisons.

**Checks.**

- The left regular representation of `F₂` has spectral gap with `F` the two generators; that of
  `ℤ` does not (Følner intervals).
- The trivial representation on `ℂ` has spectral gap vacuously (the complement of the invariant
  vectors is `0`); a definition on the whole space would fail for it.
- `L(F₂)` is full and `R` is not: `R` has nontrivial central sequences (VonNeumannAlgebras §V12).

*Needs:* §3.1; VonNeumannAlgebras §§V8, V12; OperatorAlgebraDynamics §D2 (P₂ criterion and its
converse); AmenableGroups Layer 5 (Følner criteria).

### Examples

Kazhdan pairs for `(ℤ²⋊SL₂(ℤ), ℤ²)`; nonamenable subgroups `F₂`, `Γ(2)` and `SL₂(ℤ)`; the
amenable unipotent subgroup; spectral gap of Bernoulli shifts of `F₂`.

### Dependencies

Layers 1–2; VonNeumannAlgebras §§V8, V12; OperatorAlgebraDynamics §D2; AmenableGroups Layers 1–5;
CStarAlgebras §C4.

## Layer 4: Haagerup approximation

### 4.1 Positive-definite functions and the Haagerup property of groups

Define `IsPositiveDefinite φ` for `φ : G → ℂ`: `Σᵢⱼ conj(cᵢ)cⱼ φ(gᵢ⁻¹gⱼ) ≥ 0` for all finite
families. Define conditionally negative-definite functions and prove Schoenberg's theorem that
`exp(−tψ)` is positive definite for `t > 0` (Anantharaman–Popa, Examples 16.1.2). Define
`HasHaagerupProperty G`: for every finite `F ⊆ G` and `ε > 0` there is a positive-definite
`φ` with `φ(1) = 1`, vanishing at infinity, and `|φ(g)−1| < ε` on `F` (the net form of
Anantharaman–Popa, Definition 16.1.1, p. 273).

- Positive-definite functions are exactly the coefficients `⟨ξ, π(g)ξ⟩` of unitary representations
  (GNS); they are closed under products, pointwise limits, restriction and zero extension from
  subgroups.
- The Haagerup property passes to subgroups, finite-index overgroups and increasing countable
  unions, and holds for finite and amenable groups.
- Prove `hasHaagerupProperty_freeGroup`: the free group on a countable set of generators has the
  Haagerup property. For finite rank the word length is conditionally negative definite and proper;
  for countable rank use increasing generator weights, since unweighted length is not proper.

**Checks.**

- For finite `G`, `φ = 1` witnesses the property, since every function vanishes at infinity along
  the cofinite filter of a finite set.
- On `ℤ`, `φ_t(n) = e^(−t|n|)` is positive definite, vanishes at infinity and tends to `1` as
  `t → 0`; the constant `1` is positive definite but not `c₀` on `ℤ`.
- On `F_∞` with unweighted word length, `{g : |g| ≤ 1}` is infinite, so `exp(−t|·|)` is not `c₀`;
  the weighted length `Σ kᵢ` over letters `a_(i)^(±1)` with weight `i` is proper.
- An infinite group with property (T), such as `SL₃(ℤ)`, fails the Haagerup property; so does
  `ℤ²⋊SL₂(ℤ)`, by Layer 3.2 and the uniform convergence on `ℤ²` that relative (T) forces.

*Needs:* Mathlib `FreeGroup`, `Filter.cofinite`; §3.1 (for the non-example).

### 4.2 Haagerup approximation of tracial algebras

For `(M,τ)` define the Haagerup property by normal subunital subtracial CP maps converging
pointwise in `L²` whose `L²` implementers are compact (Anantharaman–Popa, Definition 16.2.1).

- The subunital Schwarz inequality `φ(x)*φ(x) ≤ ‖φ(1)‖ φ(x*x)` from Stinespring, and the resulting
  `L²` contractivity `‖φ(x)‖₂ ≤ ‖x‖₂` for subtracial `φ`; CStarAlgebras §C4's unital statement
  alone does not give this normalization.
- Invariance under tracial isomorphism, expected subalgebras, corners and finite amplification,
  using uniqueness of the normalized faithful normal trace on a finite factor.
- A countable group has the Haagerup property iff `L(Γ)` does (Anantharaman–Popa, Proposition
  16.2.2), by Fourier multipliers and their coefficient functions.
- A II₁ factor with property (T) does not have the Haagerup property (Proposition 16.2.3), by the
  compactness argument on orthogonal unitaries.

**Checks.**

- `M_n(ℂ)` has the property with `φ = id`, whose implementer is compact because `L²` is
  finite dimensional.
- `L(F₂)` has it by Fourier multipliers `u_g ↦ e^(−t|g|)u_g`; `L(SL₃(ℤ))` does not.
- `id` on a diffuse `M` is not an admissible approximant: its implementer `1` on infinite-dimensional
  `L²(M)` is not compact.

*Needs:* §4.1; Layer 1; CStarAlgebras §C4 (Stinespring).

### 4.3 Relative Haagerup approximation

In `⟨M,e_B⟩` let `I` be the norm-closed ideal generated by the finite projections and `I₀` the
norm-closed ideal generated by `e_B`. Prove `I₀ ⊆ I` and, for every `T ∈ I` and `ε > 0`, a projection
`z ∈ Z(B)` with `τ(1−z) ≤ ε` and `T JzJ ∈ I₀` (Anantharaman–Popa, Proposition 16.3.1, p. 275). A
relative Haagerup approximation consists of `B`-bimodular subunital subtracial normal CP maps with
`L²` implementers in `I`, converging pointwise in `L²` (Definition 16.3.3).

- The equivalent `I₀` version by the central cutoffs and compression `ψ_z(x) = φ(zxz)`.
- For a trace-preserving action `Γ ↷ B`, `B⋊Γ` has the Haagerup property relative to `B` iff `Γ` has
  the Haagerup property (Proposition 16.3.5).
- Relative Haagerup approximation and relative amenability are distinct properties
  (Remark 16.3.6).

**Checks.**

- For `B = ℂ` the relative property is the absolute one of §4.2, `I = I₀ = K(L²(M))`.
- For `B = M` every `M` has it, with `φ = id` and implementer `1 = e_M ∈ I₀`.
- `L∞(𝕋²)⋊F₂` has the property relative to `L∞(𝕋²)` (Proposition 16.3.5 with §4.1), while
  `L∞(𝕋³)⋊SL₃(ℤ)` does not have it relative to `L∞(𝕋³)`, since `SL₃(ℤ)` lacks the Haagerup
  property.

*Needs:* §§4.1–4.2; Layer 2.1.

### Examples

Fourier multipliers on `L(F_n)` and on `L∞(𝕋²)⋊F_n`; the weighted length on `F_∞`.

### Dependencies

Layers 1–3; CStarAlgebras §C4; VonNeumannAlgebras §V8.

## Layer 5: Intertwining by bimodules

### 5.1 Definition and equivalent forms

For a nonzero projection `f ∈ M`, `P ⊆ fMf` and `Q ⊆ M` define `P ≺_M Q` by existence of a nonzero
P–Q subcorrespondence of `fL²(M)` with finite right `Q`-dimension. Construct the general
finite-algebra dimension and center-valued trace extending VonNeumannAlgebras §V7 to projections in
`Q⊗̄B(ℓ²)` commuting with `JQJ`; a finite scalar trace does not bound center-valued dimension
uniformly, so cut by a nonzero central spectral projection with a uniform finite bound before
choosing a finite matrix realization.

- Equivalent forms (Anantharaman–Popa, Theorem 17.1.1, p. 281): a nonzero positive finite-`Tr`
  element of `P'∩f⟨M,e_Q⟩f`; its support projection; and the matrix form: for some `n ≥ 1`, a
  projection `q ∈ M_n(Q)`, a normal unital `θ : P → qM_n(Q)q` and a nonzero partial isometry
  `v ∈ M_(1,n)(fM)` with `v*v ≤ q` and `xv = vθ(x)` for `x ∈ P`.
- The single-corner form after cutting `P` by a nonzero `p ∈ P`, with `θ : pPp → qQq` and
  `v ∈ pMq`, `vv* ∈ (pPp)'∩pMp`, `v*v ∈ θ(pPp)'∩qMq`; neither support need equal its corner unit.
- `P ⊀_M Q` iff some net `u_i ∈ U(P)` has `‖E_Q(x*u_i y)‖₂ → 0` for all `x, y ∈ M`
  (Theorem 17.1.1 (iv)), with a finite-tuple form and a sequence under separable predual.
- Invariance under unitary conjugacy, corner and amplification transport, expected-subalgebra
  comparisons and finite-index transfer. Transitivity requires a finite-module connection and is
  not asserted unconditionally.

**Checks.**

- `Q ≺_M Q` for every `Q`, with `n = 1`, `θ = id`, `v = 1`.
- For `M = L(F₂)` with generators `a, b`, `L(⟨a⟩) ⊀_M L(⟨b⟩)`: `u_n = a^n` gives
  `E_(L⟨b⟩)(x* a^n y) → 0` for group elements `x, y`.
- For `Λ ≤ Γ`, `L(Γ) ≺_(L(Γ)) L(Λ)` iff `[Γ:Λ] < ∞`; for `Λ = {1}` and `Γ` infinite the unitaries
  `u_g` witness nonintertwining.

*Needs:* Layer 2.1; Subfactors §S1; VonNeumannAlgebras §§V5–V7.

### 5.2 Rigidity against Haagerup approximation

Prove that relative property (T) of `P ⊆ M` together with Haagerup approximation of `M` relative to
`Q` implies `P ≺_M Q` (Anantharaman–Popa, Theorem 18.1.1, p. 293): combine uniform control on `U(P)`
with a finite relative-compact approximation, contradicting the expectation-vanishing criterion.

Prove the quantitative criterion: if `0 < ε < 1` and `‖x−E_Q(x)‖₂ ≤ ε τ(f)^(1/2)` for all `x ∈ P`
with `‖x‖ ≤ 1`, then `P ≺_M Q`. For unitaries `u ∈ U(P)`, orthogonality of `E_Q` gives
`‖E_Q(u)‖₂² ≥ (1−ε²)τ(f)`, contradicting the vanishing criterion. Anantharaman–Popa state it for
`ε < 2^(−1/2)` (Lemma 19.1.5, p. 306); Layer 10 uses that range.

**Checks.**

- Without the corner factor `τ(f)^(1/2)` the criterion is false: for a diffuse `P ⊆ fMf` with
  `τ(f) < 1/2` and `Q = ℂ1`, every `x` in the unit ball of `P` has
  `‖x − E_Q(x)‖₂ ≤ ‖x‖₂ ≤ τ(f)^(1/2) < 2^(−1/2)`, yet `P ⊀_M ℂ` because `P` is diffuse. With the
  corner factor, a unitary `u ∈ P` with `τ(u) = 0` has `‖u − E_Q(u)‖₂ = τ(f)^(1/2)`, which needs
  `ε ≥ 1`.
- For `ε = 1` the criterion fails: `P = L(⟨a⟩)`, `Q = L(⟨b⟩)` in `L(F₂)` satisfy
  `‖x − E_Q(x)‖₂ ≤ ‖x‖₂ ≤ 1` and `P ⊀ Q`.
- In `M = L∞(𝕋²)⋊F₂` (index-12 subgroup), for every automorphism `θ` of `M`,
  `θ(L∞(𝕋²)) ≺_M L∞(𝕋²)`: the image is rigid by Layer 3.2 and Fourier transform, and `M` has the
  Haagerup property relative to `L∞(𝕋²)` by Layer 4.3.

*Needs:* §5.1; Layers 3.3, 4.3.

### Examples

Group-subgroup intertwining; finite-dimensional corner examples; nonintertwining of distinct free
generators in `L(F₂)`.

### Dependencies

Layers 2–4; Subfactors §S1; VonNeumannAlgebras §§V5–V7.

## Layer 6: Cartan pairs and measured orbit relations

### 6.1 Cartan subalgebras and uniqueness of rigid Cartans

A Cartan subalgebra `A ⊆ M` is maximal abelian with normalizer generating `M` (the expectation is
the trace-preserving one). Construct its normalizer, partial normalizers and pseudogroup, and the
matrix-corner and amplification formulas. For Cartan `A, B` in a II₁ factor, `A ≺_M B` gives a
unitary `u` with `uAu* = B` (Anantharaman–Popa, Theorem 17.2.3, p. 286). Hence if `B` is relatively
rigid and `M` has the Haagerup property relative to `A`, the two Cartans are unitarily conjugate
(Theorem 18.1.3, p. 294).

**Checks.**

- `D_n ⊆ M_n(ℂ)` (diagonal) is Cartan; `ℂ1 ⊆ M_n(ℂ)` for `n ≥ 2` is not maximal abelian.
- `L∞(𝕋²) ⊆ L∞(𝕋²)⋊SL₂(ℤ)` is Cartan; `L(ℤ) ⊆ L(F₂)` for a generator is maximal abelian but not
  Cartan (its normalizer generates `L(ℤ)`).
- Uniqueness is only for rigid Cartans: a II₁ factor can have non-conjugate Cartans, and the
  theorem says nothing about non-rigid ones.

*Needs:* Layer 5; VonNeumannAlgebras §V11.

### 6.2 Measured relations and their algebras

Specialize VonNeumannAlgebras §V11's nonsingular measured relations, full groups and full
pseudogroups to countable p.m.p. Borel equivalence relations on standard probability spaces, with
restrictions, isomorphisms modulo null sets and graphings. Build the counting measure and the `L²`
convolution representation of the untwisted algebra `L(R)` from §V11's measured-groupoid model.

- `τ` is a faithful normalized trace, `L∞(X) ⊆ L(R)` is Cartan with its diagonal expectation, and
  `L(R)` is a factor iff `R` is ergodic.
- For a free p.m.p. action, `L(R_(Γ↷X)) ≅ L∞(X)⋊Γ` (VonNeumannAlgebras §V8), on base functions and
  group generators.
- Every countable p.m.p. relation is generated by countably many measurable partial isomorphisms,
  by VonNeumannAlgebras §V4's Lusin–Novikov selection.
- Isomorphism of relations iff trace-preserving isomorphism of their untwisted Cartan inclusions
  (Anantharaman–Popa, Theorem 12.2.2 and Corollary 12.2.4); hence orbit equivalence of free actions
  iff isomorphism of the Cartan inclusions (Corollary 12.2.6). Action conjugacy is not asserted, nor
  an untwisted presentation of every Cartan pair.
- Amplification `R^t`, `t > 0`, by a measure-`t` restriction of a finite counting amplification;
  in the ergodic atomless case it is independent of choices and
  `(L(R), L∞X)^t ≅ (L(R^t), L∞(X_t))` as trace-preserving Cartan pairs.
- Compression and amplification invariance of the rigid/relative-Haagerup Cartan conditions.

**Checks.**

- The trivial relation on `[0,1]` gives `L(R) = L∞[0,1]`, which is not a factor; the full relation
  on `n` points with uniform measure gives `M_n(ℂ)`.
- The irrational rotation relation gives the hyperfinite II₁ factor, and `L∞(𝕋)` is Cartan in it.
- The restriction construction on the full relation on two points with `t = 1/2` gives the trivial
  relation on one point, matching the corner `pM₂(ℂ)p = ℂ` with `τ(p) = 1/2`.

*Needs:* §6.1; VonNeumannAlgebras §§V4, V8, V11.

### Examples

Orbit relations of `SL₂(ℤ)` and its finite-index subgroups on `𝕋²`; the hyperfinite relation.

### Dependencies

Layers 3–5; VonNeumannAlgebras §§V4, V8, V11.

## Layer 7: Cost and a trivial fundamental group

### 7.1 Cost

On an atomless standard probability space, for a graphing `(φ_i)` of a countable p.m.p. relation
define cost `Σᵢ μ(dom φ_i)` and `C(R)` its infimum over generating graphings, in `[0,∞]`
(Anantharaman–Popa, Definitions 18.2.1–18.2.2; Gaboriau, Definitions I.1–I.5).

- Invariance under generation, refinement, restriction, null sets and relation isomorphism.
- A treeing (acyclic graphing) attains the cost, including infinite cost (Gaboriau, Theorem IV.1).
  Route: cycle removal on positive-measure sets by disjoint word images; for a countable treeing and
  a competing graphing `Ψ`, express the first `q` treeing edges by words of bounded length `L` in a
  finite subfamily `Ψ_r` off small exceptional sets, restrict back to a finite initial treeing
  `Φ_p` discarding measure below `2^(−q)/(2Lr)` per generator, and obtain a lower bound tending to
  `C(Φ_q)` with error at most `q·2^(−q)` (Gaboriau, proofs IV.35–IV.39).
- For hyperfinite relations `C(R) = 1 − ∫_X |[x]_R|^(−1) dμ(x)`, with `1/∞ = 0`, from
  VonNeumannAlgebras §V11's hyperfinite exhaustions (Gaboriau, Proposition II.6, Lemma II.8).
- The amalgamated free-product formula `C(R₁ *_(R₃) R₂) = C(R₁) + C(R₂) − C(R₃)` for hyperfinite
  `R₃` and finite-cost `R₁, R₂` (Gaboriau, Theorem IV.15), with the amalgamated measured free
  product defined by absence of reduced alternating cycles outside `R₃`.
- For a free p.m.p. action of `F_n`, `2 ≤ n < ∞`, `C(R) = n` (Anantharaman–Popa, Theorem 18.3.3,
  p. 297).
- Compression formula `C(R^t) − 1 = (C(R) − 1)/t`, `t > 0`, for ergodic atomless relations, with
  infinite cost preserved (Theorem 18.2.3, p. 296); hence `F(R) = {t > 0 : R^t ≅ R} = {1}` when
  `1 < C(R) < ∞`.

**Checks.**

- A free p.m.p. `ℤ`-action has cost `1`, and the hyperfinite formula gives `1 − 0 = 1`.
- The relation on `[0,1)` whose classes are the orbits of `x ↦ x + 1/n mod 1` has cost `1 − 1/n`,
  by the hyperfinite formula and by the treeing of the `n−1` translations
  `[0,1/n) → [k/n,(k+1)/n)`, each with domain of measure `1/n`.
- For `R` of cost `2` and `t = 1/2`, `C(R^t) = 1 + 2 = 3`; the formula `C(R^t) = C(R)/t` would give
  `4`.

*Needs:* Layer 6.2; VonNeumannAlgebras §V11 (hyperfinite relations).

### 7.2 Fundamental groups

For a II₁ factor define `F(M) = {t > 0 : M^t ≅ M}`. Prove independence of the corner, the
multiplication and reciprocal laws (a subgroup of `ℝ_(>0)`), and compatibility with VonNeumannAlgebras
§V7's corner dimension.

- For an ergodic relation with Cartan `A`, `F(R) ⊆ F(L(R))` always.
- If for every `0 < t ≤ 1` and every isomorphism `θ : L(R) → L(R)^t` some unitary `u` has
  `uθ(A)u* = A^t`, then `F(L(R)) = F(R)` (Anantharaman–Popa, Theorem 18.3.1, p. 297); Layer 6.1's
  rigid/relative-Haagerup conditions supply this Cartan preservation.

**Checks.**

- `F(M_n(ℂ)⊗R) = F(R) = ℝ_(>0)`, since `R^t ≅ R` for all `t`.
- `F(M)` contains `1` and is closed under inverses: `M^t ≅ M` gives `M ≅ (M^t)^(1/t) ≅ M^(1/t)`.
- For `M = M_n(ℂ)` the definition does not apply (not II₁): `M^t` exists only for `t ∈ (1/n)ℕ`.

*Needs:* §7.1; Layer 6; VonNeumannAlgebras §V7.

### 7.3 `F(L(ℤ²⋊F_n)) = {1}`

For a finite-index subgroup `F_n ≤ SL₂(ℤ)`, `2 ≤ n < ∞`, with its action on `ℤ²` and dual action on
`𝕋²`: prove essential freeness and ergodicity, ICC of `ℤ²⋊F_n`, and `L(ℤ²⋊F_n) ≅ L∞(𝕋²)⋊F_n` by
Fourier transform. Layer 3.2 makes `L∞(𝕋²)` rigid and Layer 4.3 gives the relative Haagerup
property, so `L∞(𝕋²)` is the unique rigid Cartan up to unitary conjugacy across amplifications
(Anantharaman–Popa, Example 18.1.5, p. 294). With cost `n` and the compression formula,
`F(L(ℤ²⋊F_n)) = {1}` (Theorem 18.3.2, p. 297). The subgroup generated by `[[1,2],[0,1]]` and
`[[1,0],[2,1]]` is free of rank 2 and of index 12 in `SL₂(ℤ)`, by ping-pong on the projective line
and row reduction, so the theorem has an instance.

**Checks.**

- The ping-pong sets `{|x| > |y|}` and `{|x| < |y|}` in `ℤ²` are exchanged by powers of the two
  generators, and `[[1,2],[0,1]]·(0,1) = (2,1)`.
- The index 12 is `[SL₂(ℤ) : Γ(2)] = |SL₂(𝔽₂)| = 6` times `[Γ(2) : F₂] = 2` (`−1 ∉ F₂`).
- The cost argument needs `1 < n < ∞`: for `n = 1` the cost is `1` and the formula gives no
  information, and for `F_∞` the cost is infinite.

*Needs:* §§7.1–7.2; Layers 3.2, 4.3, 6.1; VonNeumannAlgebras §V8.

### Examples

`L∞(𝕋²)⋊F₂` for the index-12 subgroup; the hyperfinite relation, with `F = ℝ_(>0)`.

### Dependencies

Layers 3–6; VonNeumannAlgebras §§V7, V8, V11.

## Layer 8: Deformations, mixing and absorption

### 8.1 Tracial and s-malleable deformations

A tracial deformation of `M` is a family of normal trace-preserving embeddings `α_t : M → M̃`,
continuous pointwise in `L²`, with `α_0` the given inclusion and a trace-preserving expectation
`M̃ → M`. An s-malleable deformation uses a one-parameter automorphism group of `M̃` and a
trace-preserving involution `β` fixing `M` pointwise with `βα_tβ = α_(−t)` (Popa, Strong rigidity
I, §1; Popa, ICM 2006, §5).

- Transversality `‖α_(2t)(x) − x‖₂ ≤ 2‖α_t(x) − E_M(α_t(x))‖₂` for `x ∈ M`.
- Uniform convergence of `α_t → id` on the unit ball of a relatively rigid subalgebra, and
  extraction of intertwiners between the original and deformed subalgebras by convex-hull and
  polar-decomposition arguments, with control of supports, corner traces and normalizers.

**Checks.**

- The trivial deformation `α_t = id`, `M̃ = M` satisfies the definition; with `β = id` it is
  s-malleable only because `α_(−t) = α_t`.
- For `N = L(ℤ)` with Haar generator `u`, `M̃ = N*N` with second generator `v = exp(ih)`, the
  deformation `α_t(u) = exp(ith)u` has `α_1(u) = vu`, and `β(v) = v*` gives `β(h) = −h`, hence
  `βα_tβ(u) = exp(−ith)u = α_(−t)(u)`; with `β(v) = v` instead the time-reversal law fails.
- Transversality fails without the involution: the shift `α_t(u) = e^(it)u` on `L(ℤ)` inside
  `L(ℤ)` has `‖α_(2t)(u)−u‖₂ = |e^(2it)−1|` while `α_t(u) ∈ M`, so the right side is `0`.

*Needs:* Layers 3.3, 5; VonNeumannAlgebras §V2 (Borel logarithms, spatial tensors).

### 8.2 Mixing and clustering

Define mixing and weak mixing of trace-preserving actions by matrix coefficients off the fixed
subspace, and mixing of relative correspondences by finite bounded-vector coefficients tending to
zero on weakly escaping unitaries. Prove the finite-module and intertwining consequences. For
clustering actions (Popa, Strong rigidity II, Definition 1.1) construct a dense star algebra `N⁰`
and decreasing subalgebras `B_j`: each `y ∈ N⁰` eventually has `E_(B_j)(y) = τ(y)1`; its
translates lie in `B_j` outside a finite set of group elements; and for each `g, j` some `k` has
`σ_g(B_k) ⊆ B_j`. Prove the higher mixing identities and Fourier support estimates.

**Checks.**

- Bernoulli shifts of an infinite group are mixing and clustering, with `B_j` the tail algebras
  outside finite sets `F_j`.
- The trivial action on a nontrivial `L∞(X)` is not weakly mixing; an irrational rotation action of
  `ℤ` on `𝕋` is ergodic but not weakly mixing, since each character `z^k` is an eigenvector.
- Read along the cofinite filter, every action of a finite group is mixing (the limit is along the
  bottom filter), so the mixing statements of this layer carry `Γ` infinite as a hypothesis.

*Needs:* §8.1; VonNeumannAlgebras §V8.

### 8.3 Bernoulli enlargements and the descent lemma

For countably infinite `Γ` and the Bernoulli action `Γ ↷ (X₀,μ₀)^Γ` over a nontrivial standard
probability base, consume VonNeumannAlgebras `V8.BernoulliArbitraryDiscrete` for finite atomic
bases (cylinder density, ergodicity, mixing, proper outerness, the II₁ crossed product) and build
what it lacks: the general nontrivial standard base, the tail algebras and clustering. Construct
the equivariant diffuse-base enlargement `Ã = ⊗_g (A₀₀⊗̄L∞(𝕋))` of `A = ⊗_g A₀₀`, and the
s-malleable doubled Gaussian-coordinate rotation, with time `1` carrying the first copy to the
independent second copy, `β`'s fixed-copy and time-reversal laws, and `L²` continuity of infinite
tensor products. This is a sub-s-malleable enlargement of `A`; `α_t` need not preserve `A`. The
enlargement has the orthonormal basis `{1}∪{b_n}` of `Ã` over `A` made of finite tensor products of
powers of the Haar unitary of `L∞(𝕋)`, and it satisfies Popa's mixing condition
`lim_(g→∞) sup{‖E_A(b_i* y σ_g(b_j))‖₂ : y ∈ A, ‖y‖ ≤ 1} = 0` for all `i, j` (Popa, Strong rigidity I,
Definition 4.2, condition (4.2.1), and Lemma 4.3).

A net witnessing nonintertwining in `M = A⋊Γ` also witnesses it in `M̃ = Ã⋊Γ`: on finite tensor and
Fourier expressions the expectation coefficients acquire bounded factors, and density extends the
`L²` bound.

Prove the finite-module descent lemma (Popa, Strong rigidity I, Lemma 4.5): let `A ⊆ Ã` be finite
tracial algebras such that `Ã` has an orthonormal basis `{1}∪{b_n}` over `A` satisfying (4.2.1), and
let `σ` be a properly outer mixing trace-preserving action of `Γ` on `Ã` leaving `A` globally
invariant; put `M = A⋊Γ ⊆ M̃ = Ã⋊Γ`. If `P ⊆ M` has no corner embeddable into `Ã` and `x ∈ M̃`
satisfies `Px ⊆ Σ_(i=1)^n x_i M` for some `x_1,…,x_n ∈ M̃`, then `x ∈ M`; in particular
`P'∩M̃ = P'∩M`. Route: (4.2.1) and the no-corner hypothesis make every positive finite-trace element
`a` of `P'∩⟨M̃,e_M⟩` satisfy `e_M a e_M = a` (Popa, Strong rigidity I, Proposition 3.3); the projection onto the closure
of `span PxM` is such an element of right `M`-dimension at most `n`, so it lies under `e_M`.

Use this control on deformed supports, reflection and doubling, finite-trace corner extraction and
a maximal family of orthogonal corner partial isometries to obtain the absorption unitary inside
`M`.

**Checks.**

- Without (4.2.1) and mixing the descent lemma is false: for `Γ` ICC acting freely on `A`,
  `Ã = A⊗̄D` with `Γ` acting trivially on `D = L∞[0,1]` and `P = L(Γ)`, the element `x = 1⊗d`
  commutes with `P`, so `Px = xP ⊆ xM`, yet `x ∉ M`; here `E_A(b_i* y σ_g(b_j)) = E_A(b_i* y b_j)`
  does not depend on `g`.
- For the Bernoulli enlargement with `b = 1⊗z` at one coordinate `h`, `E_A(b* y σ_g(b)) = 0` once
  `g h ≠ h`, so (4.2.1) holds there with the supremum eventually `0`.
- The no-corner hypothesis cannot be dropped: `P = A` itself embeds into `Ã`, and `x` in the
  second tensor factor at one coordinate satisfies `Ax = xA ⊆ xM` without lying in `M`.

*Needs:* §§8.1–8.2; Layer 5; VonNeumannAlgebras §V8 (`V8.BernoulliArbitraryDiscrete`, crossed
products).

### 8.4 Popa's absorption theorem

Prove: for a countably infinite ICC `Λ`, a Bernoulli `M = B⋊Λ` over any nontrivial standard base,
and a diffuse relatively rigid `Q ⊆ pM^sp` whose normalizer `P = N(Q)''` is a factor, there is a
unitary `u` with `uPu* ⊆ L(Λ)^s` (Popa, Strong rigidity I, Theorem 4.4(i) in its factorial
normalizer ICC case, p. 28); `Q` may be abelian. Route: by the reduction of Step 7 of the proof of
Theorem 4.1 (with Lemma 3.5) choose a normalized finite matrix amplification `P₀` of a corner of
`P` and a diffuse relatively rigid `Q₀ ⊆ P₀` whose ambient normalizer generates `P₀`, transferring
rigidity through finite-set CP estimates and regularity through normalizing partial isometries;
`Q₀` is auxiliary and no property (T) of `P₀` is assumed. Run Steps 1–5 of the proof of Theorem 4.1
on `Q₀` in the enlargement `M̃` of §8.3: extract a nonzero finite-trace basic-construction element,
implement its corner map and use quasi-regularity to obtain the `P₀`-corner intertwiner into `L(Λ)`;
apply the descent lemma to `P`, not to `Q` (`P` is II₁, so no corner of `P` embeds into the abelian
`B̃` or a matrix algebra over it). The type-II₁-`Q` case, Theorem 4.4(ii), is not used.

For the source action `Γ ↷ A` of Layer 9 prove `L(Γ)'∩(A⋊Γ) = ℂ` by ICC Fourier coefficients. For
`H ⊴ Γ` infinite, `L(H)` is diffuse and its normalizer contains `L(Γ)`; so for `Q = θ(L(H))` the
target normalizer `P` contains `θ(L(Γ))` and `P'∩pMp = ℂp`, hence `P` is a II₁ factor and the
hypotheses above hold without ergodicity of `H ↷ X`.

**Checks.**

- For `Q = L(Λ₀)` with `Λ₀ ⊴ Λ` infinite and rigid in `Λ`, the conclusion holds with `u = 1`.
- The theorem shows that the Bernoulli base `B` is never rigid in `M = B⋊Λ`: `B` is diffuse with
  normalizer generating the factor `M`, so rigidity would give `uMu* = M ⊆ L(Λ)` for some unitary
  `u ∈ M`, which is false.
- The ICC hypothesis on `Λ` is needed for the factorial conclusion: for `Λ` with finite radical,
  Theorem 4.4(i) gives conjugacy only into corners `L(Λ)p` by central projections.

*Needs:* §8.3; Layers 3.3, 5.

### Examples

Bernoulli shifts of `F₂` and of `ℤ²⋊F₂` over the two-point base; the Gaussian rotation on
`L∞(𝕋)⊗̄L∞(𝕋)`.

### Dependencies

Layers 3, 5; VonNeumannAlgebras §§V2, V8.

## Layer 9: Bernoulli strong rigidity

### 9.1 The rigidity theorem

Let `Γ` be countable ICC with an infinite normal subgroup `H` such that `(Γ,H)` has relative
property (T), `Γ ↷ (X,μ)` any free ergodic p.m.p. action on a standard probability space, `Λ`
countably infinite ICC and `Λ ↷ (Y,ν)` its Bernoulli action over a nontrivial standard base. Prove
that for `0 < t ≤ 1` every isomorphism

```
θ : L∞(X)⋊Γ ≃ (L∞(Y)⋊Λ)^t
```

forces `t = 1` and has the form `Ad(u)∘θ^χ∘θ^(Δ,δ)` (Popa, Strong rigidity II, Theorem 0.1), where
`δ : Γ ≃ Λ` is a group isomorphism, `Δ : (X,μ) ≃ (Y,ν)` a probability-space isomorphism with
`Δ∘g = δ(g)∘Δ`, and `χ : Λ → 𝕋` a character. With group unitaries `u_g` in the source and `v_h` in
the target, `u_g a u_g* = a∘g⁻¹`, put `θ^χ(f) = f`, `θ^χ(v_h) = χ(h)v_h`, `θ^(Δ,δ)(a) = a∘Δ⁻¹` and
`θ^(Δ,δ)(u_g) = v_(δg)`. The source action need not be Bernoulli.

Route: Layer 8.4 puts `θ(L(Γ))` into a corner of `L(Λ)`. Build the target ultrapower algebra of
clustering Fourier coefficients and its finite-support approximations; use Layer 5.1's
basic-construction criterion to obtain a corner intertwiner of the Cartan algebras; prove the
simultaneous Cartan/group-algebra conjugacy criterion (Popa, Strong rigidity II, Theorems 4.2 and
5.1–5.2, Lemma 6.1): for a clustering target and an isomorphism onto `pMp` with `p ∈ L(Λ)` and
source group algebra inside `pL(Λ)p`, obtain `p` central, integral reciprocal trace, finite normal
kernel, character and cocycle data, and full group-algebra equality; first for finite Fourier
support, then in general by local quantization in the Cartan. ICC eliminates the finite kernel,
forcing `p = 1`; the same partial isometry carries the Cartan and the group generators, so the
recovered map is an action conjugacy with the character twist above.

**Checks.**

- For `Γ = Λ`, `X = Y` and `θ = id` the decomposition has `u = 1`, `χ = 1`, `δ = id`, `Δ = id`.
- For `Λ = F₂ = ⟨a,b⟩` and the character `χ(a) = −1`, `χ(b) = 1`, `θ^χ` fixes `L∞(Y)` and is not of
  the form `Ad(u)∘θ^(Δ,δ)`: such a `u` would lie in `L∞(Y)` with `u∘h = χ(h)u`, an eigenfunction of
  the weakly mixing Bernoulli action. So the character factor cannot be dropped.
- For `t = 1/2` there is no isomorphism at all: the Bernoulli factor of `ℤ²⋊SL₂(ℤ)` is not
  isomorphic to its corner of trace `1/2`.

*Needs:* Layers 5, 8; VonNeumannAlgebras §§V8, V12.

### 9.2 Consequences

Deduce `F(L∞(Y)⋊Λ) = {1}` for the Bernoulli factors of the groups above, by the reciprocal
amplification law, and classification of these Bernoulli presentations by group and action
conjugacy up to the stated inner and character ambiguity. For `Γ = ℤ²⋊F_n` (Layer 7.3) both its
Bernoulli factor and its torus-action factor have fundamental group `{1}`, by this layer and by
Layer 7 respectively. This is the proved class of rigidity results, not a uniqueness theorem for
all group-measure-space decompositions.

**Checks.**

- `ℤ²⋊SL₂(ℤ)` with `H = ℤ²` satisfies the hypotheses (ICC, Layer 3.2), so its Bernoulli factor has
  trivial fundamental group.
- `F₂` does not satisfy them: it has no infinite normal subgroup with relative (T), by Layer 4.1.
- The Bernoulli factors of `Γ₁ = ℤ²⋊SL₂(ℤ)` and `Γ₂ = ℤ²⋊F₂` (index-12 subgroup) are not isomorphic:
  an isomorphism would give `Γ₁ ≅ Γ₂`, but `Γ₁` contains `−I` of order 2 and `Γ₂` is torsion-free.

*Needs:* §9.1; Layer 7.

### Examples

Bernoulli factors of `ℤ²⋊SL₂(ℤ)` and of `ℤ²⋊F₂`.

### Dependencies

Layers 3, 5, 7, 8; VonNeumannAlgebras §§V8, V12.

## Layer 10: Solidity and primeness of free group factors

### 10.1 Solidity

For a finite factor define solidity by amenability of `A'∩M` for every diffuse `A ⊆ M`; prove the
equivalent form that `P'∩M` diffuse implies `P` amenable (Anantharaman–Popa, Chapter 19, Theorem, p. 303
and Exercise 19.2), with invariance under isomorphism, corners and finite amplification. `R` is
solid by expectation permanence of amenability.

**Checks.**

- `R` is solid: every subalgebra of an amenable finite algebra with expectation is amenable.
- `L(F₂)⊗̄R` is not solid: `A = ℂ⊗L∞[0,1]` is diffuse with commutant containing `L(F₂)`.
- `L(F₂)` is not amenable, so solidity of `L(F₂)` is not the trivial case: a nonamenable `P` with
  diffuse relative commutant would refute it, and `P = L(⟨a⟩)` has `P'∩L(F₂) = L(⟨a⟩)` diffuse but is
  amenable.

*Needs:* Layer 2; VonNeumannAlgebras §V13b.

### 10.2 The free-product deformation and spectral gap

For `N = L(F_n)`, `2 ≤ n ≤ ∞`, build `N*N` (FreeProbability §F3) and its s-malleable deformation
(Anantharaman–Popa, Lemma 19.1.1, p. 303): with bounded self-adjoint logarithms `h_i` of the second
copy's Haar generators `v_i` (VonNeumannAlgebras §V2), `α_t(u_i) = exp(ith_i)u_i`, `α_t(v_i) = v_i`,
`β(u_i) = u_i`, `β(v_i) = v_i*`; `β` fixes the first copy and reverses time, and `α_1(N)` together
with `N` generates `N*N`. Identify `L²(N*N)⊖L²(N)` with a sum of coarse N–N correspondences by
FreeProbability §F4's reduced-word decomposition (Lemma 19.1.2).

Prove the spectral-gap lemma (Lemma 19.1.3): for `P ⊆ pM₁p` with separable predual and no amenable
direct summand in a tracial free product `M₁*M₂`, `P'∩p(M₁*M₂)^ωp ⊆ pM₁^ωp`, from Layer 2.3's
relative-coarse localization. Prove that a diffuse subalgebra of `M₁` has no corner intertwining
into `M₂` inside `M₁*M₂` (Lemma 19.1.4). No property (T) of `P` is assumed.

*Needs:* Layers 2.3, 3.4, 5, 8.1; FreeProbability §§F3–F4; VonNeumannAlgebras §§V2, V12.

### 10.3 Solidity and primeness of `L(F_n)`

Prove `L(F_n)` solid, `2 ≤ n ≤ ∞`: cut a nonamenable `P` with diffuse commutant to its nonamenable
support, use spectral gap of its commutant for uniform small-time deformation bounds, apply Layer
5.2's criterion with `ε < 2^(−1/2)`, and iterate the resulting intertwiners by the `β` symmetry to
force a diffuse corner into the other free copy, contradicting Lemma 19.1.4.

Define a II₁ factor prime when it is not isomorphic to `M₁⊗̄M₂` with both `M_i` diffuse finite
factors. Deduce primeness of `L(F_n)`, `2 ≤ n ≤ ∞`: solidity makes both tensor factors amenable, so
their product is amenable, but `L(F_n)` is not (VonNeumannAlgebras §§V12–V13; for countable rank via
the expected `L(F₂)`). Comparison of `L(F_m)` with `L(F_n)` is not a target.

**Checks.**

- `R ≅ R⊗̄R` is not prime.
- `M₂(ℂ)⊗L(F₂) ≅ L(F₂)^2` is allowed by the definition of primeness, since `M₂(ℂ)` is not diffuse.
- `L(F₂)⊗̄L(F₂)` is not prime, and is not solid: `L(F₂)⊗1` has diffuse relative commutant
  `1⊗L(F₂)` and is not amenable.

*Needs:* §§10.1–10.2; Layer 5.2; VonNeumannAlgebras §§V12–V13b.

### Examples

`L(F₂)`, `L(F_∞)`, `R⊗̄R`, `L(F₂)⊗̄L(F₂)`.

### Dependencies

Layers 2, 3, 5, 8; FreeProbability §§F3–F4; VonNeumannAlgebras §§V2, V12–V13b.

## Downstream consumers

No roadmap on main or among the open roadmap proposals takes a declaration of this roadmap as a
supplier. Two leave objects to it by name: OperatorKTheory leaves proper length functions and
Haagerup kernels on free groups to Layer 4.1, and the VonNeumannAlgebras roadmap with layers V0–V13
leaves the p.m.p. specialization of its measured-relation and Lusin–Novikov selection API to
Layer 6.2 and p.m.p. cost to Layer 7.1.

## References

- C. Anantharaman and S. Popa, [*An Introduction to II₁ Factors*](https://www.math.ucla.edu/~popa/Books/IIun.pdf),
  draft book: Chapters 9 and 12–19, at the theorem numbers cited in each layer.
- D. Gaboriau, [*Coût des relations d'équivalence et des groupes*](https://doi.org/10.1007/s002229900019),
  Invent. Math. 139 (2000): Definitions I.1–I.5, Proposition II.6, Lemma II.8, Theorems IV.1 and
  IV.15 and their proofs IV.35–IV.39.
- S. Popa, [*Deformation and rigidity for group actions and von Neumann algebras*](https://www.math.ucla.edu/~popa/ICMpopafinal.pdf),
  Proceedings of the ICM 2006: §§5–8.
- S. Popa, [*Strong rigidity of II₁ factors arising from malleable actions of w-rigid groups, I*](https://arxiv.org/abs/math/0305306),
  Invent. Math. 165 (2006): Theorem 4.1 and its proof (Steps 1–7), Definition 4.2, Lemma 4.3,
  Theorem 4.4, Lemma 4.5, Proposition 3.3, Lemma 3.5.
- S. Popa, [*Strong rigidity of II₁ factors arising from malleable actions of w-rigid groups, II*](https://arxiv.org/abs/math/0407103),
  Invent. Math. 165 (2006): Definitions 1.1 and 1.3, Theorems 0.1, 0.7, 4.2, 5.1–5.2, Lemma 6.1.
