# Roadmap: Euclidean Jordan algebras, symmetric cones and sequential products

**Summary.** A Euclidean Jordan algebra is a finite-dimensional unital real Jordan algebra that is
formally real: a sum of squares vanishes only when every term does. The self-adjoint real, complex
and quaternionic matrices with the product `(AB + BA)/2` are the standard examples. This roadmap
builds the structure theory of these algebras and five results.

- **The spectral theorem.** Every element is a real combination `Σ λ_i c_i` of a Jordan frame, a
  system of primitive orthogonal idempotents with sum `1`. All Jordan frames have the same number
  of elements, the rank. The eigenvalues `λ_i` define a trace, a determinant and a functional
  calculus.
- **The cone of squares is symmetric.** The squares form a closed convex cone that is self-dual
  for the inner product `tr(x ∘ y)`, and the linear automorphisms of the cone act transitively on
  its interior. A unital linear order isomorphism between two Euclidean Jordan algebras is a Jordan
  isomorphism (Koecher).
- **The Koecher–Vinberg theorem.** Conversely, let `C` be a self-dual closed convex cone in a
  finite-dimensional real inner-product space whose automorphisms act transitively on its interior,
  and let `e` be an interior point. Then the space has exactly one Euclidean Jordan product with
  unit `e` whose cone of squares is `C`.
- **Simple algebras.** A Euclidean Jordan algebra is a direct product of simple ones, uniquely up
  to the order of the factors. A simple algebra of rank `r ≥ 2` has a Peirce constant `d`, with
  dimension `r + d·r(r−1)/2`. The simple algebras of rank one and two are `ℝ` and the spin factors
  `ℝ ⊕ ℝⁿ`, `n ≥ 2`.
- **The sequential product.** On the effects, the elements between `0` and `1`, the product
  `a & b = P(√a) b` satisfies the axioms of a sequential effect algebra and is continuous. Two
  effects satisfy `a & b = b & a` exactly when their multiplication operators commute, and exactly
  when they are diagonal in one Jordan frame.

Tau Ceti has the Peirce decomposition at one idempotent, the trace form `Tr L_(x∘y)` and the inner
derivations of a Jordan algebra; this roadmap builds on them.
[CompactQuantumMetricSpaces](../CompactQuantumMetricSpaces/README.md) Layer 0 supplies order-unit
spaces and their states, and Euclidean Jordan algebras become finite-dimensional examples of them
with an explicit norm and state space.
[LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md) Layer 8 supplies the compact
Albert algebra, whose spectral and frame statements are instances of the general theory here.
[LieGroups](../RepresentationTheory/LieGroups/README.md) Layer 2 supplies the closed-subgroup
theorem, used once, for the automorphism group of a cone. For `Herm_n(ℂ)` the roadmap gives the
comparison with the self-adjoint part of the C*-algebra `M_n(ℂ)` that
[VonNeumannAlgebras](../VonNeumannAlgebras/README.md) and
[CStarAlgebras](../CStarAlgebras/README.md) can consume.

Layer 0 fixes the carriers and builds the models. Layer 1 proves power-associativity and the
spectral theorem for one element. Layer 2 builds Jordan frames, the Peirce decomposition of a
frame, the rank and the spectral invariants. Layer 3 builds the quadratic representation and the
cone of squares. Layer 4 gives the order-unit norm, the states, the effects and Koecher's theorem.
Layer 5 proves the Koecher–Vinberg theorem. Layer 6 treats ideals, simple algebras and the models.
Layer 7 builds effect algebras and the sequential product.

## Conventions

- **Carrier.** A Euclidean Jordan algebra, written EJA, is a type `J` with Mathlib's
  `NonAssocCommRing J`, `Module ℝ J`, `SMulCommClass ℝ J J`, `IsScalarTower ℝ J J`,
  [`IsCommJordan J`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Jordan/Basic.html),
  `Module.Finite ℝ J` and
  [`IsFormallyReal J`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/IsFormallyReal.html).
  These are hypotheses on one ring structure, not a new bundled class. The Jordan product `x ∘ y`
  is the ring multiplication and the unit `e` is `1`. No norm, order or inner product is part of
  the carrier: each is constructed, and attached to `J` by a definition or a local instance, never
  by a global instance.
- **Operators.** `L_x y = x ∘ y` is `LinearMap.mulLeft ℝ x`, and `P(x) = 2 L_x² − L_(x²)` is the
  quadratic representation. Products of operators are compositions.
- **Idempotents.** An idempotent is an `IsIdempotentElem`. Two idempotents are orthogonal when
  `p ∘ q = 0`. A complete system is a finite family of nonzero, pairwise orthogonal idempotents
  with sum `e`. An idempotent is primitive when it is nonzero and is not a sum of two nonzero
  orthogonal idempotents. A Jordan frame is a complete system of primitive idempotents, indexed by
  `Fin n`. The Peirce spaces of an idempotent `c` are the eigenspaces `J_1(c)`, `J_½(c)`, `J_0(c)`
  of `L_c`, Tau Ceti's `TauCeti.Jordan.peirceSpace`.
- **Two traces.** `τ(x,y) = Tr L_(x∘y)` is Tau Ceti's `TauCeti.Jordan.traceForm`. The spectral
  trace `tr x` is the sum of the eigenvalues of `x` (Layer 2), so `tr c = 1` for a primitive
  idempotent and `tr e = rank J`. The canonical inner product is `B(x,y) = tr(x ∘ y)`: cone
  duality, densities and states all use `B`. On a simple algebra `τ = (dim J / rank J) · B`
  (§6.1); in general no single constant relates them.
- **Cone and order.** `C = {x² | x ∈ J}` is the cone of squares, `Ω` its interior, and
  `x ≤ y` means `y − x ∈ C`. A *symmetric cone* in a finite-dimensional real inner-product space is
  a closed convex cone `C` with `ProperCone.innerDual C = C` such that the linear maps `g` with
  `g(Ω) = Ω` act transitively on `Ω = int C`. Sources that work with the open cone `Ω` are
  translated by taking closures.
- **Topology.** Every finite-dimensional real vector space carries its unique Hausdorff vector
  space topology; the order-unit norm of Layer 4 and the norm of `B` both induce it.
- **Effects and states.** An effect is an element of `[0, e]`. A state is a positive linear
  functional with value `1` at `e`. A density is an element of `C` of spectral trace `1`. The
  sequential product `a & b` has `a` first.
- **The zero algebra.** The zero ring is an EJA, with `e = 0`, the empty Jordan frame, rank `0`
  and determinant `1`. Statements about states, the order-unit norm or a simple algebra assume `J`
  nontrivial; a simple algebra is nontrivial by definition.

## Layer 0: Carriers and models

### 0.1 Jordan homomorphisms, subalgebras and products

A Jordan homomorphism is a real-linear map preserving the product; it is unital when it preserves
`e`. Prove that a linear map preserving squares preserves products, and that a bijective Jordan
homomorphism is unital and has a Jordan homomorphism as its inverse. Give identities, composition
and extensionality. A subalgebra is a `Submodule ℝ J` closed under the product; it is unital when
it contains `e`, and it may instead have its own unit, as the Peirce space `J_1(c)` does (§2.1).
Give subalgebras their induced structure, and finite products their componentwise structure with
projections and inclusions. Prove that a subalgebra with a unit and a finite product of EJAs are
EJAs.

*Needs:* Mathlib `Submodule`, `LinearMap`, `LinearEquiv`, `IsCommJordan`, `IsFormallyReal`.

### 0.2 The models

- **`ℝⁿ`** with the coordinatewise product.
- **`Herm_n(K)`** for `K = ℝ, ℂ, ℍ`: the real subspace of `Matrix (Fin n) (Fin n) K` cut out by
  `Matrix.IsHermitian`, with `A ∘ B = (AB + BA)/2`. `SymAlg` needs `Invertible (2 : Matrix _ _ K)`:
  supply the inverse `(1/2 : ℝ) • 1`. Prove that the Hermitian matrices are closed under the
  product of `SymAlg`, give the subspace its `NonAssocCommRing` structure with unit `1`, transport
  the Jordan identity through `SymAlg.sym_mul_sym`, and prove the two compatibility classes for the
  real scalar action. Prove that the diagonal entries are real, that the real part of `Tr(A²)` is
  the sum of the squared norms of the entries, hence formal reality, and
  `dim Herm_n(K) = n + (dim K) · n(n−1)/2`.
- **Spin factors.** For a finite-dimensional real vector space `W` with a symmetric bilinear form
  `b`, the space `ℝ × W` with `(t,u) ∘ (s,v) = (ts + b(u,v), t v + s u)` and unit `(1,0)`. Prove
  the Jordan identity for every `b`, and formal reality when `b` is positive definite. `Spin_n` is
  the case `W = ℝⁿ` with its inner product.

*Needs:* §0.1; Mathlib `Matrix.IsHermitian`, `SymAlg`, `Quaternion`, bilinear forms.

*Lean:* `IsSpinFactor`.

**Checks.**

- In `Herm₂(ℝ)` with `E = diag(1,0)` and `X = [[0,1],[1,0]]`: `E ∘ X = X/2` and `X ∘ X = 1`.
- A spin factor on an indefinite form is Jordan and not formally real: on `ℝ × ℝ²` with
  `b(u,v) = u_1 v_1 − u_2 v_2`, the squares `(0,(0,1))² = (−1,0)` and `(1,0)² = (1,0)` are nonzero
  with sum zero.
- `Spin_0 = ℝ`, and `(t,u) ↦ (t+u, t−u)` is a Jordan isomorphism `Spin_1 → ℝ²`.
- The inclusion `t ↦ (t,0)` of `ℝ` in `ℝ²` is a Jordan homomorphism that is not unital.

## Layer 1: One element

### 1.1 Power-associativity

Define `x⁰ = e` and `xⁿ⁺¹ = x ∘ xⁿ`. Prove `xᵐ ∘ xⁿ = xᵐ⁺ⁿ` and that `L_(xᵐ)` and `L_(xⁿ)`
commute, for a commutative unital Jordan algebra over a field of characteristic zero, from
Mathlib's linearized Jordan identity `two_nsmul_lie_lmul_lmul_add_add_eq_zero`; formal reality is
not used. Deduce that the span `ℝ[x]` of the powers of `x` is an associative commutative unital
subalgebra, the smallest subalgebra containing `x` and `e`, and that polynomial evaluation
`ℝ[X] → ℝ[x]` is a surjective algebra homomorphism commuting with unital Jordan homomorphisms.
Prove that the scalar extension `K ⊗ J` of a commutative real Jordan algebra to a field `K ⊇ ℝ` is
a commutative Jordan algebra over `K`, because the linearized identity is multilinear; §2.4 uses
it for a field of rational functions.

*Needs:* §0.1; Mathlib `Polynomial`, `TensorProduct`. Faraut–Korányi, Chapter II.

*Lean:* `jpow`.

### 1.2 The spectral theorem for one element

Let `J` be an EJA and `x ∈ J`. The minimal polynomial `m_x` is the monic generator of the kernel of
evaluation at `x`. Prove that `ℝ[x]` has no nonzero nilpotents and that `m_x` is a product of
distinct real linear factors. Route: decompose `ℝ[x] ≅ ℝ[X]/(m_x)` by the Chinese remainder
theorem; a repeated factor gives a nilpotent, and an irreducible quadratic factor gives a summand
isomorphic to `ℂ`, with its own unit `p` and an element `i_p`, in which `p² + i_p² = 0`. Deduce the
spectral theorem: there are a unique finite set of real numbers `λ`, the eigenvalues of `x`, and a
unique complete system `(p_λ)` with `x = Σ_λ λ p_λ`; moreover each `p_λ` lies in `ℝ[x]`, with
`p_λ = ∏_(μ≠λ) (x − μ e)/(λ − μ)`. Prove `f(x) = Σ_λ f(λ) p_λ` for polynomials `f`, and that a
unital Jordan homomorphism sends the spectral system of `x` to that of its image, dropping zeros.

*Needs:* §1.1; Mathlib real polynomial factorization and the Chinese remainder theorem.
Faraut–Korányi, Theorem III.1.1.

*Lean:* `IsCompleteSystem`, `spectralResolution`, `spectralResolution_unique`.

### 1.3 Positivity of the trace form and the Euclidean condition

Prove that `Tr L_p ≥ 1` for a nonzero idempotent `p`, since `L_p` has eigenvalues in `{0, ½, 1}`
and fixes `p`; hence `τ(x,x) = Σ_λ λ² Tr L_(p_λ) > 0` for `x ≠ 0`. Prove, for a finite-dimensional
unital real Jordan algebra, the equivalence of:

1. the algebra is formally real;
2. `τ` is positive definite;
3. there is a positive definite symmetric bilinear form `b` that is *associative*:
   `b(x ∘ y, z) = b(y, x ∘ z)`.

Condition 3 is the definition of a Euclidean Jordan algebra in Faraut–Korányi, Section III.1. For 3 ⇒ 1 apply
`b(e, ·)` to a sum of squares. Prove that every `L_x` and `P(x)` is self-adjoint for an associative
form `b`, that the eigenvalues of `x` are bounded in absolute value by the operator norm of `L_x`
for `b`, and that the nonzero idempotents form a compact set.

*Needs:* §1.2; Tau Ceti's Peirce decomposition at one idempotent (`TauCeti.Algebra.Jordan.Peirce`),
for the eigenvalues of `L_p`; Tau Ceti `traceForm` with its symmetry and associativity.
Faraut–Korányi, Section III.1 and Proposition VIII.4.2.

*Lean:* `formallyReal_iff_exists_associativeForm`.

**Checks.**

- In `ℝ³`, `x = (2,2,−1)` has `m_x = (X−2)(X+1)`, `p_2 = (1,1,0)` and `p_(−1) = (0,0,1)`.
- `ℂ` as a real algebra is a commutative Jordan algebra without nilpotents in which `i` has no
  spectral resolution: `m_i = X² + 1`. Formal reality fails, as `1² + i² = 0`.
- On `ℝⁿ`, `τ(x,y) = Σ x_i y_i`. On every EJA, `τ(e,e) = dim J`.

## Layer 2: Jordan frames and spectral invariants

### 2.1 Peirce subalgebras and primitive idempotents

For an idempotent `c` of an EJA, prove that `J_1(c)` and `J_0(c)` are EJAs with units `c` and
`e − c`, that `J_1(c) ∘ J_0(c) = 0`, and that an idempotent `q` lies in `J_1(c)` exactly when
`c ∘ q = q`, in which case `c − q` is an idempotent orthogonal to `q`. Prove that a nonzero
idempotent `c` is primitive exactly when `J_1(c) = ℝ c`. Prove that every complete system can be
refined to a Jordan frame, by induction on dimension; in particular Jordan frames exist, and every
idempotent is a sum of members of some Jordan frame.

*Needs:* §1.2; Tau Ceti `TauCeti.Algebra.Jordan.Peirce`. Faraut–Korányi, Proposition IV.1.1.

*Lean:* `IsPrimitive`, `IsJordanFrame`.

### 2.2 The Peirce decomposition of a complete system

Let `(c_i)` be a complete system. Put `J_ii = J_1(c_i)` and, for `i ≠ j`,
`J_ij = J_½(c_i) ∩ J_½(c_j)`. Prove:

- the `L_(c_i)` commute and sum to the identity, and `J` is the internal direct sum of the `J_ij`
  over unordered pairs `i ≤ j`, with projections `P(c_i)` onto `J_ii` and `4 L_(c_i) L_(c_j)` onto
  `J_ij`;
- the multiplication rules `J_ii ∘ J_ii ⊆ J_ii`, `J_ii ∘ J_ij ⊆ J_ij`,
  `J_ij ∘ J_ij ⊆ J_ii + J_jj`, `J_ij ∘ J_jk ⊆ J_ik` for distinct `i, j, k`, and
  `J_ij ∘ J_kl = 0` when `{i,j} ∩ {k,l} = ∅`;
- for `x = Σ λ_i c_i`, `L_x` acts on `J_ij` by `(λ_i + λ_j)/2` and `P(x)` by `λ_i λ_j`;
- distinct `J_ij` are orthogonal for every associative form;
- for a sub-sum `c = Σ_(i∈S) c_i`, `J_1(c)` is the sum of the `J_ij` with `i, j ∈ S`, `J_0(c)`
  the sum with `i, j ∉ S`, and `J_½(c)` the sum with exactly one index in `S`.

For a Jordan frame, `J_ii = ℝ c_i`.

*Needs:* §2.1; Tau Ceti's projections and multiplication rules for one idempotent.
Faraut–Korányi, Theorem IV.2.1.

### 2.3 Rank and the spectral theorem for frames

Define `rank J` as the maximum of `dim ℝ[x]` over `x ∈ J`, and call `x` regular when it attains
it. Prove, in this order:

1. The regular elements are open and dense: with `r = rank J`, `x` is regular exactly when some
   `r × r` minor of the coordinates of `e, x, …, x^(r−1)` is nonzero, and these minors are
   polynomial functions that do not all vanish.
2. A complete system has at most `rank J` members, and the spectral system of a regular element is
   a Jordan frame with `rank J` members.
3. Every Jordan frame `(c_i)_(i<n)` has `n = rank J`. Route: let `x = Σ i·c_i` and choose regular
   `x_k → x`, with spectral frames `(q_(k,j))_(j<r)` and coefficients `μ_(k,j)`. The coefficients
   are bounded by §1.3 and the idempotents lie in a compact set, so along a subsequence
   `q_(k,j) → q_j` and `μ_(k,j) → μ_j`, with `(q_j)` a complete system and `x = Σ μ_j q_j`. Group
   the `q_j` by equal `μ_j`; by the uniqueness of §1.2 the grouped sums are the `c_i`. Each `c_i`
   is primitive, so each group has one member and `n = r`.

Deduce the second form of the spectral theorem: for every `x` there are a Jordan frame `(c_i)` and
reals `λ_i` with `x = Σ λ_i c_i`; the multiset of the `λ_i`, the *eigenvalues of `x` with
multiplicity*, does not depend on the frame, and the multiplicity of `λ` is `rank J_1(p_λ)`. Prove
by the same compactness and grouping argument that the eigenvalues with multiplicity, sorted in
decreasing order, form a continuous map `J → ℝ^(rank J)`.

*Needs:* §1.2, §1.3, §2.1, §2.2. Faraut–Korányi, Theorem III.1.2.

*Lean:* `rank`, `isGreatest_rank`, `card_frame`, `spectralFrame`. `rank` is defined there as the
largest size of a Jordan frame, and `isGreatest_rank` is its agreement with the definition above.

### 2.4 Characteristic polynomial, trace and determinant

Define `χ_x(T) = ∏_i (T − λ_i)`, `tr x = Σ λ_i` and `det x = ∏ λ_i` from the eigenvalues with
multiplicity. Prove that the coefficients of `χ_x` are polynomial functions of `x`, homogeneous of
degree equal to their index; in particular `tr` is linear and `det` is a homogeneous polynomial of
degree `rank J`: the coefficient of `T^(r−k)`, `r = rank J`, is homogeneous of degree `k`. Route,
with `ξ` the coordinates of a basis and
`K = FractionRing (MvPolynomial (Fin (Module.finrank ℝ J)) ℝ)`:

1. the generic element `x_ξ ∈ K ⊗ J` has a minimal polynomial over `K`, by §1.1, and it divides
   the characteristic polynomial of `L_(x_ξ)`, because `f(L_x) e = f(x)`;
2. that characteristic polynomial is monic with coefficients in `ℝ[ξ]`, so the coefficients of the
   generic minimal polynomial lie in `ℝ[ξ]`, by Gauss's lemma;
3. its degree is `rank J`, by the minors of §2.3;
4. specializing `ξ` to the coordinates of `x ∈ J` gives a monic polynomial of degree `rank J`
   vanishing at `x`, which is `m_x = χ_x` when `x` is regular;
5. both sides are continuous in `x`, by §2.3, and the regular elements are dense.

Prove `χ_x(x) = 0`, `m_x ∣ χ_x`, `tr e = rank J`, `tr c = 1` for a primitive idempotent, and
invariance of `χ`, `tr` and `det` under Jordan isomorphisms. On a product, `χ` and `det` multiply
and `tr` adds. On `Spin_n` with `n ≥ 1` prove `tr(t,u) = 2t` and `det(t,u) = t² − ‖u‖²`.

*Needs:* §1.1, §2.3; Mathlib `MvPolynomial`, `FractionRing`, `LinearMap.charpoly`, Gauss's lemma
for monic polynomials. Faraut–Korányi, Proposition II.2.1.

*Lean:* `spectralTrace`, `spectralTrace_frame`.

### 2.5 Functional calculus, inverses and square roots

For a real function `f` defined on the eigenvalues of `x`, define `f(x) = Σ_λ f(λ) p_λ`. Prove
that it agrees with polynomial evaluation, that `f ↦ f(x)` is a unital algebra homomorphism onto
`ℝ[x]`, that `(g ∘ f)(x) = g(f(x))`, and that it commutes with unital Jordan homomorphisms. For
`f` continuous on an interval `I`, prove that `x ↦ f(x)` is continuous on the set of elements with
eigenvalues in `I`: near a given element the eigenvalues stay in a compact subinterval by §2.3, on
which `f` is a uniform limit of polynomials `g`, and `f(x) − g(x)` has eigenvalues
`f(λ_i) − g(λ_i)`. Call `x` invertible when `det x ≠ 0`, with inverse `x⁻¹ = Σ λ⁻¹ p_λ`. Prove
that `x` is invertible exactly when some `y` satisfies `x ∘ y = e` and `x² ∘ y = x`, that `y` is
then unique and equals `x⁻¹`, and that inversion is smooth on the open set of invertible elements.
For `x` with nonnegative eigenvalues define the square root `√x`; prove it is the unique element
with nonnegative eigenvalues and square `x`, and that `x ↦ √x` is continuous. Define `exp x` and,
for positive eigenvalues, `log x`, and prove that they are mutually inverse.

*Needs:* §1.2, §2.2–2.4; Mathlib Weierstrass approximation. Faraut–Korányi, Proposition II.3.1.

*Lean:* `sqrt`, `sqrt_spec`.

**Checks.**

- In `Herm₂(ℂ)` with `c = diag(1,0)`: `J_1(c) = ℝ c`, `J_½(c)` is the off-diagonal part, of real
  dimension `2`, and `J_0(c) = ℝ(e − c)`. The square of `[[0,i],[−i,0]] ∈ J_½(c)` is `e`.
- In `ℝ³`, `x = (2,2,−1)` has `χ_x = (T−2)²(T+1)`, `tr x = 3`, `det x = −4`, and is not regular.
- In a spin factor, `(t,u)` with `u ≠ 0` has eigenvalues `t ± ‖u‖` with idempotents
  `½(1, ±u/‖u‖)`; so `Spin_n` has rank `2` for `n ≥ 1`, and `(3,(0,2))⁻¹ = (3/5,(0,−2/5))`.
- In `ℝ²`, `√(4,0) = (2,0)`; `(−2,0)` has the same square and a negative eigenvalue.
- In a nontrivial EJA, `e` has the single eigenvalue `1` with multiplicity `rank J`, and
  `Σ i · c_i` for a frame has `rank J` simple eigenvalues.

## Layer 3: The quadratic representation and the cone of squares

### 3.1 The quadratic representation and the fundamental formula

Prove `P(x) e = x²`, `P(e) = 1`, `P(tx) = t² P(x)`, `P(xⁿ) = P(x)ⁿ`, that `P(x)` is invertible
exactly when `x` is, with `P(x)⁻¹ = P(x⁻¹)` and `P(x) x⁻¹ = x`, and that `P(c)` is the Peirce
projection onto `J_1(c)` for an idempotent `c`; all by §2.2 in a frame of `x`. Then prove the
fundamental formula

`P(P(x) y) = P(x) P(y) P(x)`

through the following targets, each proved on the Peirce blocks of a frame of the element named.

1. `P(w)⁻¹ L_w = L_(w⁻¹)` for invertible `w`.
2. The derivative of inversion at an invertible `z` is `−P(z)⁻¹`: differentiate
   `z² ∘ z⁻¹ = z` and solve in a frame of `z`.
3. `(exp(tL_u) z)⁻¹ = exp(−tL_u) z⁻¹` for `u ∈ J`, invertible `z`, and `t` in an interval around
   `0` on which `exp(tL_u) z` is invertible: by 1 and 2 both sides solve `y′ = −L_u y`.
4. `P(exp(u/2)) = exp(L_u)`, in a frame of `u`; and `exp(tL_u) e = exp(tu)` is invertible for
   every `t`, so 3 holds on `[0,1]` for `z` near `e`.
5. Differentiating 3 in `z` at `t = 1` gives `P(g z) = g P(z) g` for `g = exp(L_u) = P(exp(u/2))`
   and `z` near `e`. Every element with positive eigenvalues is `exp(u/2)` for some `u`, these
   elements form an open set, and both sides are polynomial in `(x, z)`; so the formula holds for
   all `x` and `z`.

Deduce `(P(x) y)⁻¹ = P(x⁻¹) y⁻¹` for invertible `x, y`, that `P(x) y` is invertible exactly when
`x` and `y` are, and `P(f x) = f P(x) f⁻¹` for a Jordan isomorphism `f`. Prove `P(x) y = xyx` in
`Herm_n(K)`.

*Needs:* §2.2, §2.5; Mathlib `NormedSpace.exp` and uniqueness for linear ordinary differential
equations. Faraut–Korányi, Section II.3: Proposition II.3.1 for inverses, Proposition II.3.3(i) for
the derivative of inversion, and the fundamental formula.

*Lean:* `quadratic`, `fundamentalFormula`.

### 3.2 The trace inner product

Prove that `B(x,y) = tr(x ∘ y)` is symmetric, positive definite, with `B(x,x) = Σ λ_i²`, and
associative. Route to associativity: for a derivation `D`, `exp(tD)` is a Jordan automorphism,
because `exp(−tD)(exp(tD) x ∘ exp(tD) y)` has derivative zero in `t` by the Leibniz rule and
Mathlib's `hasDerivAt_exp_smul_const`; `tr` is invariant, so `tr(D x) = 0`; apply this to the
inner derivation `[L_x, L_z]`. Prove that every derivation is skew-adjoint for `B`, and that a Jordan frame is
orthonormal for `B`.

*Needs:* §2.4; Tau Ceti `TauCeti.jordanInnerDerivation`; Mathlib `NormedSpace.exp`.
Faraut–Korányi, Proposition II.4.3.

*Lean:* `spectralTrace_assoc`, `spectralTrace_pos`.

### 3.3 The cone of squares

Prove, for the cone of squares `C` of an EJA:

- `x ∈ C` exactly when all eigenvalues of `x` are nonnegative, exactly when `L_x` is positive
  semidefinite for `B`;
- for an idempotent `c` and an associative positive definite form `b`,
  `b(c, y²) = b(y_1, y_1) + ½ b(y_½, y_½) ≥ 0` in the Peirce decomposition of `y` at `c`;
- `C` is a closed convex cone with `C ∩ −C = 0`, and every sum of squares is a square;
- `C` is self-dual for every associative positive definite form `b`:
  `x ∈ C ↔ ∀ y ∈ C, b(x,y) ≥ 0`; in particular `ProperCone.innerDual C = C` for `B`;
- `Ω = int C` is the set of elements with positive eigenvalues, equivalently of `x ≥ εe` for some
  `ε > 0`, equivalently of squares of invertible elements; `e ∈ Ω` and `C` is the closure of `Ω`;
- a continuous path of invertible elements that starts in `Ω` stays in `Ω`: by §2.3 the sorted
  eigenvalues are continuous along the path and none of them vanishes, so each keeps its sign.

*Needs:* §2.2, §2.3, §2.5, §3.2; Mathlib `ProperCone.innerDual`. Faraut–Korányi, Theorem III.2.1.

*Lean:* `squares`, `squares_selfDual`, `squareCone`.

### 3.4 Homogeneity

Prove that `P(x)` maps `Ω` onto `Ω` when `x` is invertible: for `y ∈ Ω` the image under `P(x)` of
the segment from `e` to `y` consists of invertible elements by §3.1 and starts at `x² ∈ Ω`, so it
stays in `Ω` by §3.3; apply the same to `x⁻¹`. Deduce `P(x) C ⊆ C` for invertible `x` by taking
closures, and then for every `x`, because `x + te` is invertible for all but finitely many `t` and
`C` is closed. Prove that for `x, y ∈ Ω` the map `P(√y) P(√x)⁻¹` is an automorphism of `Ω` taking
`x` to `y`, so `C` is a symmetric cone. Let `G(Ω)` be the group of linear maps `g` with
`g(Ω) = Ω`. Prove that the adjoint of an element of `G(Ω)` for `B` lies in `G(Ω)`, and that every
`g ∈ G(Ω)` factors as `P(x) k` with `x ∈ Ω` and `k e = e`.

*Needs:* §3.1, §3.3. Faraut–Korányi, Theorem III.2.1.

*Lean:* `Homogeneous`, `squareCone`.

### 3.5 Supports and faces

Prove first, from the second item of §3.3: for an idempotent `c` and `y ∈ C`, `B(e − c, y) = 0`
exactly when `y ∈ J_1(c)`, and `B(c, y) = 0` exactly when `y ∈ J_0(c)`. Deduce that idempotents
satisfy `q ≤ c ↔ c ∘ q = q`, and that `x, y ∈ C` with `B(x,y) = 0` satisfy `x ∘ y = 0` and
`P(√x) y = 0`. For `x ∈ C` the support `s(x)` is the sum of the spectral idempotents `p_λ` with
`λ > 0`; prove that it is the least idempotent `c` with `c ∘ x = x`. For an idempotent `c` put
`F_c = C ∩ J_1(c)`. Prove `F_c = P(c) C`, that `F_c` is the cone of squares of `J_1(c)` and an
exposed face of `C` whose relative interior is `{y ∈ C | s(y) = c}`, that every nonempty face of
`C` is `F_c` for exactly one idempotent `c`, that `F_c ⊆ F_d ↔ c ∘ d = c`, and that the extreme
rays of `C` are the rays through primitive idempotents.

*Needs:* §2.1, §2.2, §3.3, §3.4; Mathlib `IsExposed`, `intrinsicInterior`. Lourenço,
Proposition 31.

**Checks.**

- In `Herm₂(ℂ)`, `x = diag(2,−3)` gives `P(x)` with eigenvalues `4`, `−6`, `9` on `J_11`, `J_12`,
  `J_22`: `P(x)` has a negative eigenvalue, so it is not positive semidefinite as an operator,
  and it still maps `C` into `C`.
- For `c = diag(1,0)` and off-diagonal `X`: `P(c) X = 0` while `L_c X = X/2`.
- In `Herm₂(ℝ)`, `C = {[[a,b],[b,d]] | a ≥ 0, d ≥ 0, ad ≥ b²}`. The matrix `[[1,1],[1,1]]` is on
  the boundary, with support `½[[1,1],[1,1]]`.
- In a spin factor, `(t,u) ∈ C ↔ t ≥ ‖u‖`: the cone of squares is the Lorentz cone.
- In `ℝ²`, `P((√2,√3))` takes `e` to `(2,3)`, and `P((1,0)) C` is the face `ℝ≥0 × 0`.

## Layer 4: Order units, states, effects and Koecher's theorem

### 4.1 The order-unit norm

For a nontrivial EJA prove that `≤` is an Archimedean partial order compatible with the vector
space structure, that `e` is an order unit, and that `−r e ≤ x ≤ r e` exactly when every eigenvalue
of `x` has absolute value at most `r`. Hence the order-unit norm of CompactQuantumMetricSpaces
§0.1 is `‖x‖_e = max |λ_i|` and satisfies its `IsOrderUnitNorm e`. Prove
`‖x‖_e ≤ ‖x‖_B ≤ √(rank J) ‖x‖_e` and the two norm laws

`‖x²‖_e = ‖x‖_e²` and `‖x²‖_e ≤ ‖x² + y²‖_e`.

Prove `‖x ∘ y‖_e ≤ ‖x‖_e ‖y‖_e`. Route: the unit ball is the convex hull of the elements
`u = 2p − e` with `p` an idempotent; for these `L_u = P(p) − P(e − p)`; and `P(p)`, `P(e − p)` are
positive by §3.4 with `P(p) e = p`, so `−e ≤ L_u y ≤ e` when `−e ≤ y ≤ e`.

*Needs:* §2.5, §3.3, §3.4; CompactQuantumMetricSpaces §0.1.

### 4.2 States and densities

The state space is `stateSpace e ⊆ WeakDual ℝ J` of CompactQuantumMetricSpaces §0.2, for `J`
normed by `‖·‖_e`; in finite dimension its weak-star topology is the subspace topology of the
dual. Prove that `ρ ↦ B(ρ, ·)` is an affine homeomorphism from the densities onto the state space,
by self-duality of `C`. Prove that the extreme points of the state space, the pure states,
correspond to the primitive idempotents, and that every state is a convex combination of at most
`rank J` pure states with pairwise orthogonal idempotents. Prove
`λ_min(x) ≤ φ(x) ≤ λ_max(x)` for every state `φ`, with both bounds attained at pure states.

*Needs:* §3.3, §3.5, §4.1; CompactQuantumMetricSpaces §0.2–0.3.

### 4.3 Effects and Koecher's theorem

Prove that the effect interval `[0,e]` is compact and convex, that `a` is an effect exactly when
its eigenvalues lie in `[0,1]`, and that its extreme points are exactly the idempotents. Prove
that an effect `p` is an idempotent exactly when `0` is the only effect below both `p` and
`e − p`, and that idempotents `p, q` are orthogonal exactly when `p + q ≤ e`. Deduce Koecher's
theorem: for EJAs `J` and `K`, a linear bijection `f : J → K` with `f(e) = e` and `f(C_J) = C_K`
is a Jordan isomorphism, and conversely. Hence the Jordan automorphisms of `J` are exactly the
elements of `G(Ω)` fixing `e`, and they are isometries for `‖·‖_e` and for `B`.

*Needs:* §1.2, §3.5, §4.1. Westerbaan–Westerbaan–van de Wetering, Proposition 36.

*Lean:* `effects`, `koecher`.

**Checks.**

- In `Herm₂(ℂ)`, `diag(1,0)` gives the pure state `A ↦ A_11` and the density `e/2` gives the
  normalized trace. `‖e/2‖_e = 1/2` and `‖e/2‖_B = 1/√2`; on `ℝ` the two norms agree.
- In `Herm₂(ℂ)`, `B(c,c) = 1` and `τ(c,c) = 2` for `c = diag(1,0)`: a `τ`-normalized density
  would not have trace one.
- In `ℝ²`, `x ↦ (2x_1, x_2)` is a linear order automorphism that is not unital and not a Jordan
  homomorphism: the unit hypothesis in Koecher's theorem is needed.
- The effect `diag(1,½)` is not an idempotent: `diag(0,½)` lies below it and its complement.

## Layer 5: The Koecher–Vinberg theorem

Throughout, `V` is a finite-dimensional real inner-product space, `C ⊆ V` a symmetric cone with
interior `Ω`, and `G` the group of linear automorphisms `g` of `V` with `g(C) = C`.

### 5.1 The characteristic function and the base point

Prove that `G` is a closed subgroup of `GL(V)` and that `g* ∈ G` for `g ∈ G`, by self-duality.
Define `φ(x) = ∫_C exp(−⟪x,y⟫) dy` for `x ∈ Ω`. Prove:

- `φ` is finite, positive and smooth, and `log φ` is strictly convex;
- `φ(g x) = |det g|⁻¹ φ(x)` for `g ∈ G`, by the change of variables `y ↦ g* y`;
- `φ(x) → ∞` as `x` tends to a boundary point of `Ω`;
- `φ(x) ≥ c (1 + ‖x‖)^(−dim V)` for a constant `c > 0`, by integrating over
  `C ∩ B(0, (1 + ‖x‖)⁻¹)`.

Deduce that `log φ(x) + ‖x‖²/2` has a unique minimizer `e₀ ∈ Ω`, with `∇ log φ(e₀) = −e₀`. Prove
that the stabilizer of `e₀` in `G` is exactly `G ∩ O(V)`:

- an orthogonal `g ∈ G` preserves `φ` and the norm, so it fixes the minimizer;
- the stabilizer preserves the order-unit norm of `(V, C, e₀)`, so it is compact;
- if `g e₀ = e₀`, differentiating the transformation law at `e₀` gives `g* e₀ = e₀`; then `g* g`
  is a positive definite element of the stabilizer with bounded powers, so `g* g = 1`.

*Needs:* Mathlib Lebesgue integration, differentiation under the integral, `ProperCone`,
`LinearMap.adjoint`; CompactQuantumMetricSpaces §0.1. Faraut–Korányi, Chapter I; Proposition I.1.9
for the stabilizer.

### 5.2 The Lie algebra of the automorphism group

Let `𝔤 = {X ∈ End V | ∀ t, exp(tX) ∈ G}`. Regard `G` as a closed subgroup of the Lie group
`(End V)ˣ`. The closed-subgroup theorem
`TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed` makes `G` an
embedded Lie subgroup; `TauCeti.Lie.EmbeddedLieSubgroupData.lieEquivLieSubalgebraOfSubgroup`
identifies its left-invariant derivations with `TauCeti.Lie.lieSubalgebraOfSubgroup G`;
`leftInvariantDerivationLieEquivGroupLieAlgebra` identifies those with the tangent space at the
identity; and `TauCeti.Lie.unitsLieAlgebraLieEquiv` identifies the left-invariant derivations of
`(End V)ˣ` with `End V`. The definition of `𝔤` uses the exponential of `End V`, while
`TauCeti.Lie.mem_lieSubalgebraOfSubgroup` uses the Lie-group exponential; the bridge is
`TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff`. Prove that under these
identifications the tangent space of `G` at the identity is `𝔤 ⊆ End V`, and that the curve
`t ↦ exp(tX)` has tangent `X`. Prove:

- `𝔤` is stable under adjoints, so `𝔤 = 𝔨 ⊕ 𝔭` with `𝔨` its skew-adjoint and `𝔭` its self-adjoint
  elements, and `[𝔭,𝔭] ⊆ 𝔨`, `[𝔨,𝔭] ⊆ 𝔭`;
- `𝔨 = {X ∈ 𝔤 | X e₀ = 0}`: if `X e₀ = 0` then every `exp(tX)` lies in the stabilizer, which is
  `G ∩ O(V)` by §5.1, so `X` is skew-adjoint; and if `X ∈ 𝔨` then every `exp(tX)` is orthogonal,
  so it fixes `e₀`;
- `X ↦ X e₀` maps `𝔤` onto `V`. The orbit map `g ↦ g e₀` is the inclusion `G → End V` followed
  by evaluation at `e₀`, so it is smooth and its differential at the identity is `X ↦ X e₀`; by
  equivariance it has constant rank. `G` is second countable, hence Lindelöf, and `V` is a Baire
  space in which the range `Ω` is open and nonempty, hence not meagre; so the rank is `dim V` by
  Tau Ceti's `ContMDiff.isMeagre_range_of_finrank_mfderiv_lt`;
- hence `X ↦ X e₀` is a linear isomorphism `𝔭 → V`.

*Needs:* §5.1; LieGroups Layer 2 in `TauCeti.Geometry.Lie.Subgroup`; Mathlib `NormedSpace.exp`.
Faraut–Korányi, Chapter I and Theorem III.3.1.

### 5.3 The product

For `x ∈ V` let `L_x` be the element of `𝔭` with `L_x e₀ = x`, and put `x ∘ y = L_x y`. Prove:

1. the product is bilinear and commutative with unit `e₀`: `[L_x, L_y] ∈ 𝔨` kills `e₀`, and the
   identity map lies in `𝔭`;
2. `[A, L_x] = L_(Ax)` for `A ∈ 𝔨`, since both sides lie in `𝔭` and agree at `e₀`; so every
   element of `𝔨`, in particular `[L_x, L_y]`, is a derivation of the product;
3. applying the derivation `[L_x, L_y]` to `x ∘ x`, and reading both sides as operators on `y`,
   gives `L_(x ∘ x²) = 3 L_x L_(x²) − 2 L_x³`; the left side is self-adjoint, so `L_x` and
   `L_(x²)` commute, which is the Jordan identity;
4. every `L_x` is self-adjoint, so `V` is an EJA by §1.3, and the inner product of `V` is an
   associative form for it;
5. its cone of squares `C′` equals `C`: an element `x` with positive eigenvalues is
   `exp(L_(log x)) e₀`, by item 4 of §3.1, and so lies in `Ω`; hence `C′ ⊆ C` by closure; both cones are self-dual for the inner product
   of `V`, by hypothesis and by §3.3, so `C = C* ⊆ C′* = C′`.

Then prove the theorem for an arbitrary base point `e ∈ Ω`: there is exactly one bilinear product
on `V` that makes it an EJA with unit `e` and cone of squares `C`. Existence is transport of the
product at `e₀` by some `g ∈ G` with `g e₀ = e`; uniqueness is Koecher's theorem applied to the
identity map. Deduce that for the cone of an EJA the group `G` is `G(Ω)` of §3.4.

*Needs:* §5.2, §1.3, §2.5, §3.3, §4.3. Faraut–Korányi, Theorem III.3.1.

*Lean:* `IsEuclideanJordanProduct`, `productSquares`, `koecherVinberg`.

**Checks.**

- For the orthant `ℝⁿ≥0`, `φ(x) = 1/∏ x_i` and `e₀ = (1,…,1)`. At a base point `e` with positive
  coordinates the product is `(x ∘ y)_i = x_i y_i / e_i`: the product depends on the base point.
- For the positive semidefinite cone of `Herm_n(ℝ)` and a positive definite base point `e`, the
  product is `(x e⁻¹ y + y e⁻¹ x)/2`. At `e = diag(2,1)` the square of `diag(1,0)` is
  `diag(1/2,0)`.
- For the orthant of `ℝ²`, `g = diag(2, 1/2)` lies in `G` and has `φ(g e₀) = φ(e₀)`, but it moves
  `e₀` and is not orthogonal: the stabilizer is cut out by the minimizer, not by `φ` alone.
- In dimension zero the cone, its interior and the algebra are a point.

## Layer 6: Ideals, simple algebras and the models

### 6.1 Ideals and the simple decomposition

An ideal is a `Submodule ℝ J` stable under every `L_x`. An EJA is simple when it is nontrivial and
has no ideals other than `0` and `J`. Prove that the orthogonal complement of an ideal for an
associative positive definite form is an ideal, that `J` is the internal direct sum of its minimal
nonzero ideals, that each is a simple EJA with its own unit, and that every isomorphism of `J`
with a finite product of simple EJAs is this decomposition up to a permutation of the factors and
isomorphisms of the factors. Prove that `C`, the order, `tr`, `det` and the rank decompose
accordingly, and that every positive definite associative form is a positive multiple of `B` on
each simple ideal; in particular `τ = (dim J / rank J) B` for simple `J`.

*Needs:* §1.3, §2.4, §3.2. Faraut–Korányi, Proposition III.4.4.

*Lean:* `IsJordanIdeal`, `IsSimpleJordan`, `IsMinimalNonzeroIdeal`, `simpleDecomposition`.

### 6.2 Simple algebras and the Peirce constant

Let `(c_i)` be a Jordan frame of a nontrivial EJA `J`, and join `i ≠ j` by an edge when
`J_ij ≠ 0`. Prove, in this order:

1. for a connected component `S` of this graph, the sum of the `J_ij` with `i, j ∈ S` is an ideal,
   by the multiplication rules of §2.2; conversely each `c_i` lies in an ideal or in its
   orthogonal complement, and `J_ij = 0` when `c_i` and `c_j` lie on different sides; so `J` is
   simple exactly when the graph is connected, as a graph with at least one vertex;
2. for `u ∈ J_ij`, `u² = ½ B(u,u)(c_i + c_j)`;
3. for an edge `i, j` and `u ∈ J_ij` with `u² = c_i + c_j`, the element `w = e − c_i − c_j + u`
   satisfies `w² = e`, and `P(w)` is a Jordan automorphism, by the fundamental formula, that
   exchanges `c_i` and `c_j`, fixes the other `c_k`, and maps `J_jk` onto `J_ik`;
4. hence, for simple `J` of rank `r ≥ 2`, every `J_ij` with `i ≠ j` is nonzero and all have the
   same dimension `d`, the Peirce constant, with `dim J = r + d·r(r−1)/2`; so `d` does not depend
   on the frame, and `Tr L_c = dim J / rank J` for every primitive idempotent `c`.

*Needs:* §2.2, §3.1, §3.2, §6.1. Faraut–Korányi, Corollary IV.2.6.

*Lean:* `exists_peirceConstant`.

### 6.3 Ranks one and two

Prove that a simple EJA of rank `1` is isomorphic to `ℝ`, and that a simple EJA of rank `2` is
isomorphic to `Spin_n` with `n = d + 1 ≥ 2`. Put `W = ℝ(c_1 − c_2) ⊕ J_12` with the inner product
`B/2`. Then `(c_1 − c_2)² = e`, `(c_1 − c_2) ∘ u = 0` for `u ∈ J_12` by §2.2, and `u² = ½ B(u,u) e`
by item 2 of §6.2; so `w² = ½ B(w,w) e` for every `w ∈ W`, which polarizes to
`u ∘ v = ½ B(u,v) e`, and `J = ℝ e ⊕ W`. Conversely prove that `Spin_n` is simple
of rank `2` with `d = n − 1` for `n ≥ 2`.

*Needs:* §0.2, §2.4, §6.2. Faraut–Korányi, Corollary IV.1.5.

*Lean:* `simple_rank_one`, `simple_rank_two`.

### 6.4 The models

Prove that the following are simple EJAs with the stated invariants, by exhibiting the diagonal
frame, its Peirce spaces and §6.2:

| algebra | rank | `d` | dimension |
| --- | --- | --- | --- |
| `Herm_r(ℝ)`, `r ≥ 2` | `r` | `1` | `r(r+1)/2` |
| `Herm_r(ℂ)`, `r ≥ 2` | `r` | `2` | `r²` |
| `Herm_r(ℍ)`, `r ≥ 2` | `r` | `4` | `r(2r−1)` |
| the compact Albert algebra | `3` | `8` | `27` |

For each model prove that `tr` is the sum of the diagonal entries: that sum `t` gives a positive
definite associative form `t(A ∘ B)`, which is a multiple of `B` by §6.1, and the multiple is `1`
at `e`. On `Herm_n(ℝ)` and `Herm_n(ℂ)` prove further that the eigenvalues with multiplicity are
those of Mathlib's `Matrix.IsHermitian.eigenvalues`, that `det` is the matrix determinant, that
`C` is the set of `Matrix.PosSemidef` matrices, that `≤` is the Loewner order and `‖·‖_e` the
operator norm, in Mathlib's `MatrixOrder` and `Matrix.Norms.L2Operator` scopes. For `Herm_n(ℂ)`,
identified with the self-adjoint part of the C*-algebra `M_n(ℂ)`, prove that the idempotents are
the `IsStarProjection` elements. Do not re-prove the correspondence of states: consume the
restriction and extension maps of CompactQuantumMetricSpaces §0.2 on this carrier, and prove only
that they carry the state `B(ρ, ·)` of §4.2 to `A ↦ Tr(ρA)`. Being affine bijections, they carry
pure states to pure states; the pure state of `vv*`, `‖v‖ = 1`, is `A ↦ v* A v`. Prove that a
Jordan homomorphism `Herm_n(ℂ) → Herm_m(ℂ)` has a unique complex-linear extension
`M_n(ℂ) → M_m(ℂ)`, which preserves the adjoint and the symmetrized product, and that restriction
is its inverse.

The compact Albert algebra is `TauCeti.CompactAlbertAlgebra ℝ` of LieHighestWeight Layer 8. This
roadmap takes from that layer the carrier, its coordinate product, formal reality, the Peirce
calculations at the three diagonal idempotents, the coordinate trace and cubic determinant with
the associativity of the trace form and the cubic characteristic identity, and the Jordan
identity, which is a target of that layer. Given these it is one more EJA, and the only targets
here that are specific to it are the table row above and the equalities of `tr` and `det` with
the coordinate trace and determinant; for `det`, `χ_x` and the coordinate cubic are monic of
degree three and vanish at `x`, so they agree at regular `x`, hence everywhere. The general
statements of Layers 1 and 2 then hold for it: power-associativity, the spectral decomposition,
primitive idempotents as the idempotents of trace one, and the cardinality of its frames. Layer 8
keeps its model-specific targets as it states them; this roadmap supplies the generic theorems
and the comparison.

*Needs:* §0.2, §2.4, §4.1, §4.2, §6.1, §6.2; Mathlib `Matrix.IsHermitian` spectral theory;
LieHighestWeight Layer 8; CompactQuantumMetricSpaces §0.2.

**Checks.**

- `Herm₃(ℂ)` has rank `3`, `d = 2` and dimension `3 + 2·3 = 9`.
- `Herm₂(ℂ) ≅ Spin_3` by `[[t+s, z],[z̄, t−s]] ↦ (t,(s, Re z, Im z))`, consistent with
  `d = 2 = n − 1`.
- `ℝ ⊕ ℝ` has rank `2` and is not simple: for its frame `J_12 = 0`.
- The zero algebra has the empty frame and is not simple: its graph has no vertex, so it is
  preconnected and not connected in the sense of Mathlib's `SimpleGraph.Connected`.
- The compact Albert algebra has `d = (27 − 3)/3 = 8`. The split Albert algebra
  `TauCeti.AlbertAlgebra ℝ` is a Jordan algebra that is not formally real.

## Layer 7: Effect algebras and the sequential product

### 7.1 Effect algebras and sequential effect algebras

An effect algebra (Foulis–Bennett) is a set `E` with elements `0`, `1`, a relation `a ⊥ b` and a
sum `a ⊕ b` defined exactly for `a ⊥ b`, such that: `a ⊥ b` implies `b ⊥ a` and
`a ⊕ b = b ⊕ a`; `b ⊥ c` and `a ⊥ (b ⊕ c)` imply `a ⊥ b`, `(a ⊕ b) ⊥ c` and
`a ⊕ (b ⊕ c) = (a ⊕ b) ⊕ c`; every `a` has a unique `a′` with `a ⊥ a′` and `a ⊕ a′ = 1`; and
`a ⊥ 1` implies `a = 0`. In Lean the sum takes the proof of `a ⊥ b` as an argument. Prove the
cancellation law, `a″ = a`, and that `a ≤ b :↔ ∃ c, a ⊕ c = b` is a partial order with least
element `0` and greatest element `1`, and prove that the interval `[0,u]` of a partially ordered
abelian group, `u ≥ 0`, is an effect algebra with `a ⊥ b ↔ a + b ≤ u`. A sequential effect algebra
(Gudder–Greechie) carries in addition a total product `&` such that, writing `a | b` for
`a & b = b & a`:

1. `a & (b ⊕ c) = (a & b) ⊕ (a & c)` when `b ⊥ c`;
2. `1 & a = a`;
3. `a & b = 0` implies `b & a = 0`;
4. `a | b` implies `a | b′` and `a & (b & c) = (a & b) & c` for every `c`;
5. `a | b` and `a | c` imply `a | (b & c)`, and `a | (b ⊕ c)` when `b ⊥ c`.

Prove `a & 0 = 0 = 0 & a`, `a & 1 = a`, `a & b ≤ a`, and monotonicity of `b ↦ a & b`.

*Needs:* Mathlib ordered groups. Foulis–Bennett; Gudder–Greechie.

### 7.2 Operator commutation

Two elements of an EJA *operator commute* when `L_a L_b = L_b L_a`. Prove:

1. If `a = Σ λ_i p_i` is the spectral resolution of `a` and `b_ij` are the Peirce components of
   `b` for `(p_i)`, then `[L_a, L_b] a = −Σ_(i<j) ¼(λ_i − λ_j)² b_ij`. Hence `a` and `b` operator
   commute exactly when `b ∈ ⊕_i J_1(p_i)`, exactly when `a` and `b` are real combinations of one
   Jordan frame; for the frame, diagonalize the component of `b` in each `J_1(p_i)`.
2. The set `A(a) = ⊕_i J_1(p_i)` of elements operator commuting with `a` is a unital subalgebra,
   closed under the functional calculus, and `P(x) y ∈ A(a)` for `x, y ∈ A(a)`.
3. If `a` and `b` operator commute then `P(a) b = a² ∘ b`, and for `a, b ∈ C`,
   `P(√a) P(√b) = P(√(a ∘ b))`.
4. If `a ∈ C` and `P(a) P(b) = P(b) P(a)`, then `a` and `b` operator commute. Route: let `p` be
   the spectral idempotent of the largest eigenvalue of `a ≠ 0`. Then `P(p)` is the spectral
   projection of `P(a)` for its largest eigenvalue, so it commutes with `P(b)`, and
   `P(b) p ∈ J_1(p)`. Since `B(e − p, P(b) p) = ½ B(b_½, b_½)` for the Peirce component `b_½` of
   `b` at `p`, this component vanishes. Repeat in `J_0(p)` with `a − λ_max p`.
5. For `a, b ∈ C` the following are equivalent: `a` and `b` operator commute;
   `P(a) P(b) = P(b) P(a)`; `P(√a) b = P(√b) a`. Route for the last: by the fundamental formula
   `T = P(√a) P(√b)` then satisfies `T T* = T* T` for `B`. For positive semidefinite `A` and `D`,
   `AD` has the characteristic polynomial of `D^(1/2) A D^(1/2)`, by `Matrix.charpoly_mul_comm`,
   so it splits over `ℝ`; and a normal real operator whose characteristic polynomial splits over
   `ℝ` is self-adjoint, by induction on the orthogonal complement of an eigenspace. So `T` is
   self-adjoint and its factors commute; apply 4 to `√a` and `√b`.

*Needs:* §2.2, §2.5, §3.1, §3.3. Faraut–Korányi, Lemma X.2.2, for item 1; Van de Wetering,
Proposition 3.9, for the statement of item 5.

*Lean:* `commute_mulLeft_iff_exists_frame`.

### 7.3 The sequential product of an EJA

For `a ∈ C` and `b ∈ J` put `a & b = P(√a) b`. Prove that `(a, b) ↦ a & b` is continuous on
`C × J`, that `a & b` is an effect below `a` when `a` and `b` are effects, and that `[0,e]` with
`&` is a sequential effect algebra: axioms 1 and 2 are linearity and `P(e) = 1`; axiom 3 is `B(e, a & b) = B(a,b)` with
§3.5; axiom 4 is items 3 and 5 of §7.2; axiom 5 is items 2 and 5 of §7.2. Prove that for
`a, b ∈ C`, `a & b = b & a` exactly when `a` and `b` operator commute, in which case
`a & b = a ∘ b`; outside `C` the product is not used. Prove that `p & b = P(p) b` is
the Peirce projection of `b` for an idempotent `p`, that an effect `p` is an idempotent exactly
when `p & p = p`, and that `a & b = √a b √a` in `Herm_n(K)`.

*Needs:* §2.5, §3.3–3.5, §4.3, §7.1, §7.2. Van de Wetering, Theorem 4.2 for the axioms and
Proposition 4.3 for continuity in `a` with `b` fixed.

*Lean:* `seqProd`, `continuousOn_seqProd`, `seqProd_mem_effects`, `one_seqProd`,
`seqProd_eq_zero_symm`, `seqProd_one_sub_comm`, `seqProd_assoc_of_comm`, `seqProd_comm_seqProd`,
`seqProd_comm_add`, `seqProd_comm_iff`, `seqProd_eq_mul_of_comm`.

**Checks.**

- In `ℝ`, `3/4 ⊕ 1/2` is undefined and `3/4 & 1/2 = 3/8`.
- In `Herm₂(ℂ)` let `p = diag(1,0)` and `q = ½[[1,1],[1,1]]`. Then `p & q = p/2` and
  `q & p = q/2`: these idempotents do not commute under `&`, although `B(p,q) = B(q,p) = 1/2`.
- With `a = diag(1,1/4)` and the same `q`: `a & q = [[1/2,1/4],[1/4,1/8]]`, while `a ∘ q` has
  off-diagonal entries `5/16`. The sequential product is not the Jordan product.
- The positivity hypothesis in item 4 of §7.2 is needed: in `Herm₂(ℂ)` the Pauli matrices
  `σ_x = [[0,1],[1,0]]` and `σ_z = diag(1,−1)` satisfy `P(σ_x) P(σ_z) = P(σ_z) P(σ_x)`, but
  `L_(σ_x) L_(σ_z) σ_z = σ_x` and `L_(σ_z) L_(σ_x) σ_z = 0`.

## Worked examples

- **A spin factor.** In `Spin_2`, `x = (3,(0,2))` has eigenvalues `5` and `1`, `tr x = 6`,
  `det x = 5`, `‖x‖_e = 5`, `‖x‖_B = √26` and `x⁻¹ = (3/5,(0,−2/5))`. The pure states at its two
  spectral idempotents take the values `5` and `1` on `x`; the pure state at `½(1,(1,0))` takes
  the value `3`.
- **A reducible algebra.** In `ℝ ⊕ Herm₂(ℂ)` the minimal ideals are the two summands, the rank is
  `3`, and a density is a pair `(t, ρ)` with `t ≥ 0`, `ρ ≥ 0` and `t + Tr ρ = 1`. The form `τ` is
  `B` on the first summand and `2B` on the second.
- **Transposition.** On `Herm_n(ℂ)` the transpose is a unital order automorphism, hence a Jordan
  automorphism by Koecher's theorem. Its complex-linear extension to `M_n(ℂ)` reverses products.

## Downstream consumers

- [VonNeumannAlgebras](../VonNeumannAlgebras/README.md) §12.J. For V12.J.Maps, §6.4 identifies
  the idempotents of `Herm_n(ℂ)` with the projections of `M_n(ℂ)`, and the Jordan `*`-maps
  between matrix algebras with the Jordan homomorphisms of their self-adjoint parts, by
  restriction and unique complexification; normality is automatic in finite dimension. For
  V12.J.Enriched, the state comparison of §6.4 preserves the evaluation of states on
  projections. Gleason's theorem, the enriched comparison theorem and the reconstruction of
  normal Jordan maps are V12.J's.
- [CStarAlgebras](../CStarAlgebras/README.md) C2.4. Under the state comparison of §6.4 the pure
  states of `Herm_n(ℂ)` are the pure states `T ↦ ⟪ξ, Tξ⟫` of `M_n(ℂ) = K(ℂⁿ)`.

## Scope and ownership

This roadmap owns the structure theory of finite-dimensional Euclidean Jordan algebras, proved
intrinsically from the spectral theorem: the spectral theory, the quadratic representation with
the fundamental formula for EJAs, the cone of squares, the order-unit norm and states, the Koecher
and Koecher–Vinberg theorems, the simple decomposition with the Peirce constant and the algebras
of rank at most two, and effect algebras with the sequential product of an EJA.

- **JB-algebras and Hilbert-space quantum theory.** Segal systems; JB- and JBW-algebras with
  their quadratic representation, fundamental formula, inverses, square cone and projection order;
  the bounded Hilbert comparison with its state adapter; and effects, POVMs, instruments,
  Gleason's theorem and density operators on Hilbert spaces, are the subject of the roadmap on the
  mathematical foundations of quantum systems (its §1.6, §1.8, §2.1 and §2.3) and of
  VonNeumannAlgebras. None of them is built or used here. The interface has two parts. The norm
  laws of §4.1 say that an EJA with `‖·‖_e` satisfies the JB-algebra axioms. The statements
  the two roadmaps share (the fundamental formula, Jordan inverses, `P(x) C ⊆ C`, closedness of
  the cone, the Peirce decomposition at one idempotent and `q ≤ c ↔ c ∘ q = q`) are kept here on
  the carrier without a norm and proved without the JB norm, by the routes of §3.1, §3.4 and
  §3.5; they cannot be imported from the JB setting, because the norm laws of §4.1 rest on §3.3. And on `Herm_n(ℂ) = B(ℂⁿ)_sa` the map `b ↦ a & b = √a b √a` of §7.3 is the
  operation on observables determined by the effect `a`; for a projection `p` it is the map
  `b ↦ pbp` of a sharp Lüders measurement.
- **Order-unit spaces and states** in general belong to
  [CompactQuantumMetricSpaces](../CompactQuantumMetricSpaces/README.md) Layer 0. Layers 4 and 5
  specialize them.
- **The octonions and the Albert algebra** belong to
  [LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md) Layer 8. This roadmap
  consumes the carrier and its coordinate facts as listed in §6.4, proves nothing about the
  octonions, and offers the general spectral and frame theory, of which the corresponding
  statements for the compact Albert algebra are instances.
- **Lie subgroups** belong to [LieGroups](../RepresentationTheory/LieGroups/README.md). §5.2
  consumes the closed-subgroup theorem.
- **The classification of the simple algebras of rank at least three**, by Jacobson's
  coordinatization and Hurwitz's theorem, is not part of this roadmap. Macdonald's theorem and the
  Shirshov–Cohn theorem are not part of it either, and are not used.
- **Homogeneous cones that are not self-dual**, their classification by Vinberg, and the
  characterizations of EJAs among order-unit spaces that rest on it, are not part of this
  roadmap.

## Exact supplier contracts

### From Mathlib

- `Mathlib.Algebra.Jordan.Basic`: `IsCommJordan` and the linearized Jordan identity
  `two_nsmul_lie_lmul_lmul_add_add_eq_zero`. `Mathlib.Algebra.Ring.IsFormallyReal`:
  `IsFormallyReal (R : Type u) [AddCommMonoid R] [Mul R] : Prop`, whose field is
  `¬ IsSumNonzeroSq (0 : R)`; it applies to nonassociative rings.
  `Mathlib.Algebra.Symmetrized`: `SymAlg` and `SymAlg.sym_mul_sym`.
- `LinearMap.mulLeft`, `Module.End.eigenspace`, `LinearMap.trace`, `IsIdempotentElem`,
  `Polynomial`, `MvPolynomial`, `Matrix.IsHermitian` with `Matrix.IsHermitian.eigenvalues` and
  `Matrix.IsHermitian.spectral_theorem`, `Matrix.PosSemidef`, `Quaternion`, `IsStarProjection`.
- `ProperCone` and `ProperCone.innerDual`, `IsExposed`, `intrinsicInterior`, extreme points,
  `NormedSpace.exp`, `LinearMap.adjoint`, Lebesgue measure on a finite-dimensional real
  inner-product space.

### From Tau Ceti

The modules `Peirce` and `TraceForm` are Tau Ceti commits `9dee29bbef` and `cd517a2511`.

- `TauCeti.Algebra.Jordan.Basic`: `TauCeti.Jordan.mul_mul_mul_sub_add_add_eq_zero`, the linearized
  Jordan identity in product form.
- `TauCeti.Algebra.Jordan.Peirce`: `TauCeti.Jordan.peirceSpace`, the projections `peirceOne`,
  `peirceHalf`, `peirceZero`, the decomposition `peirceLinearEquiv`, and the multiplication rules
  for one idempotent. Layer 2 extends these to complete systems.
- `TauCeti.Algebra.Jordan.TraceForm`: `TauCeti.Jordan.mulTrace` and `traceForm` with
  `traceForm_comm`, `traceForm_assoc` and `traceForm_derivation`. Its positivity is §1.3.
- `TauCeti.Algebra.Jordan.Derivation`: `TauCeti.jordanInnerDerivation` in
  `TauCeti.derivationLieAlgebra`.
- `TauCeti.Geometry.Manifold.Sard.Meagre`: `ContMDiff.isMeagre_range_of_finrank_mfderiv_lt`.

### From CompactQuantumMetricSpaces Layer 0

- §0.1: the order-unit norm and the predicate `IsOrderUnitNorm e`.
- §0.2: positive maps are bounded with norm attained at the unit; `stateSpace e` in
  `WeakDual ℝ E`; restriction and extension of states between a C*-algebra and its self-adjoint
  part.
- §0.3: compactness and convexity of the state space; states determine the order and the norm.

### From LieHighestWeight Layer 8

- `TauCeti.CompactAlbertAlgebra ℝ` (`TauCeti.Algebra.AlbertAlgebra.Compact`) with its
  `NonAssocCommRing` and `Module ℝ` structure, its coordinate product, `IsFormallyReal`, dimension
  `27`, the Peirce calculations at the three diagonal idempotents, and the coordinate trace and
  cubic determinant with the associativity of the trace form and the cubic characteristic
  identity.
- The Jordan identity `IsCommJordan (TauCeti.CompactAlbertAlgebra ℝ)`, a target of that layer.

### From LieGroups Layer 2

- `TauCeti.Geometry.Lie.Subgroup.Embedded`: the closed-subgroup theorem with its model space,
  `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`.
- `TauCeti.Geometry.Lie.Subgroup.LieAlgebra`: `TauCeti.Lie.lieSubalgebraOfSubgroup` and its
  description by one-parameter subgroups, `TauCeti.Lie.mem_lieSubalgebraOfSubgroup`.
- `TauCeti.Geometry.Lie.Subgroup.Differential`:
  `TauCeti.Lie.EmbeddedLieSubgroupData.lieEquivLieSubalgebraOfSubgroup`.
- `TauCeti.Geometry.Lie.Tangent.LieEquiv`: `leftInvariantDerivationLieEquivGroupLieAlgebra`.
- `TauCeti.Geometry.Lie.Adjoint.Units.Basic`: `TauCeti.Lie.unitsLieAlgebraLieEquiv`.
- `TauCeti.Geometry.Lie.Subgroup.Units`:
  `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff`, which turns
  membership in the Lie algebra of a closed subgroup of the units into the exponential line of the
  algebra staying in the subgroup.

## Provenance

Two existing formalizations cover parts of this roadmap. The specification is the text above.

- [euclidean-jordan](https://github.com/ehrlich-b/euclidean-jordan) (Bryan Ehrlich, Apache-2.0), a source to compare
  with and to reuse: §1.1–1.3,
  §2.1–2.2, Koecher's theorem of §4.3 and the order-unit structure of §4.1 for `Herm_n(ℝ)` and
  `Herm_n(ℂ)`.
- [jordanalgebra](https://github.com/cobord/jordanalgebra) (Ammar Husain): spin factors, Hermitian
  matrix algebras and an Albert algebra over the octonions, with a bundled Jordan-algebra class
  that differs from Mathlib's `IsCommJordan`. It states no licence; it is cited as prior work
  only, and none of its code is to be reused without its author's permission.

## References

- J. Faraut and A. Korányi, *Analysis on Symmetric Cones*, Oxford University Press, 1994.
  Cited by result number, or by chapter where only the chapter is given.
- B. F. Lourenço,
  [*Amenable cones: error bounds without constraint qualifications*](https://arxiv.org/abs/1712.06221),
  Mathematical Programming **186** (2021), 1–48. Proposition 31 of the arXiv version.
- A. Westerbaan, B. Westerbaan and J. van de Wetering,
  [*Pure maps between Euclidean Jordan algebras*](https://arxiv.org/abs/1805.11496), EPTCS **287**
  (2019), 345–364. Proposition 36.
- D. J. Foulis and M. K. Bennett,
  [*Effect algebras and unsharp quantum logics*](https://doi.org/10.1007/BF02283036), Foundations
  of Physics **24** (1994), 1331–1352.
- S. Gudder and R. Greechie,
  [*Sequential products on effect algebras*](https://doi.org/10.1016/S0034-4877(02)80007-6),
  Reports on Mathematical Physics **49** (2002), 87–111.
- J. van de Wetering,
  [*Commutativity in Jordan operator algebras*](https://arxiv.org/abs/1912.01903), Journal of Pure
  and Applied Algebra **224** (2020), 106407. Proposition 3.9, Theorem 4.2 and Proposition 4.3 of
  the arXiv version.
