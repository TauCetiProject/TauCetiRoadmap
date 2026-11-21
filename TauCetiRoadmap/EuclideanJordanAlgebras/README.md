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
- **The Jordan–von Neumann–Wigner classification.** A Euclidean Jordan algebra is a direct product
  of simple ones, uniquely. The simple ones are `ℝ`, the spin factors `ℝ ⊕ ℝⁿ` with `n ≥ 2`, the
  Hermitian matrices `Herm_r(ℝ)`, `Herm_r(ℂ)`, `Herm_r(ℍ)` with `r ≥ 3`, and the 27-dimensional
  algebra `Herm₃(𝕆)` over the octonions.
- **The sequential product.** On the effects, the elements between `0` and `1`, the product
  `a & b = P(√a) b` satisfies the axioms of a sequential effect algebra and is continuous. Two
  effects satisfy `a & b = b & a` exactly when their multiplication operators commute, and exactly
  when they are diagonal in one Jordan frame.

Tau Ceti already has the Peirce decomposition at one idempotent, the trace form `Tr L_(x∘y)` and
the inner derivations of a Jordan algebra; this roadmap builds on them.
[CompactQuantumMetricSpaces](../CompactQuantumMetricSpaces/README.md) Layer 0 supplies order-unit
spaces and their states, and Euclidean Jordan algebras become its finite-dimensional examples with
an explicit norm and state space.
[LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md) Layer 8 supplies the
octonions and the compact Albert algebra, which the classification here identifies as the only
exceptional case. [LieGroups](../RepresentationTheory/LieGroups/README.md) Layer 2 supplies the
closed-subgroup theorem, used once, for the automorphism group of a cone. In the model `Herm_n(ℂ)`
every statement here is a statement about the self-adjoint part of `M_n(ℂ)`, the finite-dimensional
case of [VonNeumannAlgebras](../VonNeumannAlgebras/README.md) and
[CStarAlgebras](../CStarAlgebras/README.md).

Layer 0 fixes the carriers and builds the models. Layer 1 proves power-associativity and the
spectral theorem for one element. Layer 2 builds Jordan frames, the Peirce decomposition of a
frame, the rank and the spectral invariants. Layer 3 builds the quadratic representation and the
cone of squares. Layer 4 gives the order-unit norm, the states, the effects and Koecher's theorem.
Layer 5 proves the Koecher–Vinberg theorem. Layer 6 proves the classification. Layer 7 builds
effect algebras and the sequential product.

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
  of `L_c`, in Tau Ceti's `TauCeti.Jordan.peirceSpace`.
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
  space topology. The order-unit norm of Layer 4 and the norm of `B` induce it and have different
  values.
- **Effects and states.** An effect is an element of `[0, e]`. A state is a positive linear
  functional with value `1` at `e`. A density is an element of `C` of spectral trace `1`. The
  sequential product `a & b` has `a` first.
- **The zero algebra.** The zero ring is an EJA, with `e = 0`, the empty Jordan frame, rank `0`
  and determinant `1`. Statements about states, the order-unit norm or a simple algebra assume `J`
  nontrivial; a simple algebra is nonzero by definition.

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
  `Matrix.IsHermitian`, with `A ∘ B = (AB + BA)/2`. Obtain the Jordan identity from Mathlib's
  `SymAlg`. Prove that the diagonal entries are real, that the real part of `Tr(A²)` is the sum of
  the squared norms of the entries, hence formal reality, and
  `dim Herm_n(K) = n + (dim K) · n(n−1)/2`.
- **Spin factors.** For a finite-dimensional real inner-product space `W`, the space `ℝ × W` with
  `(t,u) ∘ (s,v) = (ts + ⟪u,v⟫, t v + s u)` and unit `(1,0)`. Prove the Jordan identity for an
  arbitrary symmetric bilinear form in place of the inner product, and formal reality for an inner
  product. `Spin_n` is the case `W = ℝⁿ`.

*Needs:* §0.1; Mathlib `Matrix.IsHermitian`, `SymAlg`, `Quaternion`, real inner-product spaces.

**Checks.**

- In `Herm₂(ℝ)` with `E = diag(1,0)` and `X = [[0,1],[1,0]]`: `E ∘ X = X/2` and `X ∘ X = 1`.
- A spin factor on an indefinite form is Jordan and not formally real: on `ℝ × ℝ` with the form
  `−uv`, `(0,1)² = (−1,0)` and `(1,0)² = (1,0)` are nonzero with sum zero.
- `Spin_0 = ℝ`, and `(t,u) ↦ (t+u, t−u)` is a Jordan isomorphism `Spin_1 → ℝ²`.
- The inclusion `t ↦ (t,0)` of `ℝ` in `ℝ²` is a Jordan homomorphism that is not unital.

## Layer 1: One element

### 1.1 Power-associativity

Define `x⁰ = e` and `xⁿ⁺¹ = x ∘ xⁿ`. Prove `xᵐ ∘ xⁿ = xᵐ⁺ⁿ` and that `L_(xᵐ)` and `L_(xⁿ)`
commute, in every commutative real Jordan algebra, from the linearized Jordan identity (Tau
Ceti's `TauCeti.Jordan.mul_mul_mul_sub_add_add_eq_zero`); formal reality is not used. Deduce that the span `ℝ[x]` of the powers of `x` is an associative
commutative unital subalgebra, the smallest subalgebra containing `x` and `e`, and that polynomial
evaluation `ℝ[X] → ℝ[x]` is a surjective algebra homomorphism commuting with unital Jordan
homomorphisms.

*Needs:* §0.1; Mathlib `Polynomial`. Faraut–Korányi, Chapter II.

### 1.2 The spectral theorem for one element

Let `J` be an EJA and `x ∈ J`. The minimal polynomial `m_x` is the monic generator of the kernel of
evaluation at `x`. Prove that `ℝ[x]` has no nonzero nilpotents and that `m_x` is a product of
distinct real linear factors: a repeated factor gives a nilpotent, and an irreducible quadratic
factor gives a copy of `ℂ` in `ℝ[x]`, in which `1² + i² = 0`. Deduce the spectral theorem: there
are a unique finite set of real numbers `λ`, the eigenvalues of `x`, and a unique complete system
`(p_λ)` with `x = Σ_λ λ p_λ`; moreover each `p_λ` lies in `ℝ[x]`, with
`p_λ = ∏_(μ≠λ) (x − μ e)/(λ − μ)`. Prove `f(x) = Σ_λ f(λ) p_λ` for polynomials `f`, and that a
unital Jordan homomorphism sends the spectral system of `x` to that of its image, dropping zeros.

*Needs:* §1.1; Mathlib real polynomial factorization and the Chinese remainder theorem.
Faraut–Korányi, Chapter III.

### 1.3 Positivity of the trace form and the Euclidean condition

Prove that `Tr L_p ≥ 1` for a nonzero idempotent `p`, since `L_p` has eigenvalues in `{0, ½, 1}`
and fixes `p`; hence `τ(x,x) = Σ_λ λ² Tr L_(p_λ) > 0` for `x ≠ 0`. Prove, for a finite-dimensional
unital real Jordan algebra, the equivalence of:

1. the algebra is formally real;
2. `τ` is positive definite;
3. there is a positive definite symmetric bilinear form `b` that is *associative*:
   `b(x ∘ y, z) = b(y, x ∘ z)`.

Condition 3 is the definition of a Euclidean Jordan algebra in Faraut–Korányi. For 3 ⇒ 1 apply
`b(e, ·)` to a sum of squares. Prove that every `L_x` and `P(x)` is self-adjoint for an associative
form, and that the nonzero idempotents form a compact set.

*Needs:* §1.2; Tau Ceti `traceForm` with its symmetry and associativity. Faraut–Korányi,
Chapter III.

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

*Needs:* §1.2; Tau Ceti `TauCeti.Algebra.Jordan.Peirce`. Faraut–Korányi, Chapter IV.

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
Faraut–Korányi, Chapter IV.

### 2.3 Rank and the spectral theorem for frames

Define `rank J` as the maximum of `dim ℝ[x]` over `x ∈ J`, and call `x` regular when it attains
it. Prove that the regular elements are open and dense. Prove that every Jordan frame has exactly
`rank J` elements. Route: a frame with `n` members and distinct coefficients gives `n ≤ rank J`;
the spectral idempotents of a regular element are primitive; approximate a frame element with
distinct coefficients by regular elements and pass to a limit of their spectral systems, using the
compactness of §1.3 and the uniqueness of §1.2. Deduce the second form of the spectral theorem:
for every `x` there are a Jordan frame `(c_i)` and reals `λ_i` with `x = Σ λ_i c_i`; the
multiset of the `λ_i`, the *eigenvalues of `x` with multiplicity*, does not depend on the frame,
and the multiplicity of `λ` is `rank J_1(p_λ)`.

*Needs:* §1.2, §1.3, §2.1, §2.2. Faraut–Korányi, Chapters II and III.

### 2.4 Characteristic polynomial, trace and determinant

Define `χ_x(T) = ∏_i (T − λ_i)`, `tr x = Σ λ_i` and `det x = ∏ λ_i` from the eigenvalues with
multiplicity. Prove that the coefficients of `χ_x` are polynomial functions of `x`, homogeneous of
degree equal to their index; in particular `tr` is linear and `det` is a homogeneous polynomial of
degree `rank J`. Route: `χ_x = m_x` on regular elements, and the coefficients of the minimal
polynomial of the generic element are polynomials (Faraut–Korányi, Chapter II). Prove `χ_x(x) = 0`,
`m_x ∣ χ_x`, `tr e = rank J`, `tr c = 1` for a primitive idempotent, and invariance of `χ`, `tr`
and `det` under Jordan isomorphisms. On a product, `χ` and `det` multiply and `tr` adds. Identify
`tr` and `det` on `Herm_n(ℝ)` and `Herm_n(ℂ)` with the matrix trace and determinant, `tr` on
`Herm_n(ℍ)` with the sum of the diagonal entries, and on `Spin_n` with `n ≥ 1` prove
`tr(t,u) = 2t` and `det(t,u) = t² − ‖u‖²`.

*Needs:* §2.3; Mathlib `MvPolynomial`, `Matrix.IsHermitian` spectral theory.

### 2.5 Functional calculus, inverses and square roots

For a real function `f` defined on the eigenvalues of `x`, define `f(x) = Σ_λ f(λ) p_λ`. Prove
that it agrees with polynomial evaluation, that `f ↦ f(x)` is a unital algebra homomorphism onto
`ℝ[x]`, that `(g ∘ f)(x) = g(f(x))`, that it commutes with unital Jordan homomorphisms, and that
`x ↦ f(x)` is continuous on the set of elements with eigenvalues in an interval on which `f` is
continuous. Call `x` invertible when `det x ≠ 0`, with inverse `x⁻¹ = Σ λ⁻¹ p_λ`. Prove that
`x` is invertible exactly when some `y` satisfies `x ∘ y = e` and `x² ∘ y = x`, that `y` is then
unique and equals `x⁻¹`, and that inversion is smooth on the open set of invertible elements. For
`x` with nonnegative eigenvalues define the square root `√x`; prove it is the unique element with
nonnegative eigenvalues and square `x`, and that `x ↦ √x` is continuous on its whole domain,
boundary included.

*Needs:* §1.2, §2.2, §2.4; Mathlib Weierstrass approximation. Faraut–Korányi, Chapter II.

**Checks.**

- In `Herm₂(ℂ)` with `c = diag(1,0)`: `J_1(c) = ℝ c`, `J_½(c)` is the off-diagonal part, of real
  dimension `2`, and `J_0(c) = ℝ(e − c)`. The square of `[[0,i],[−i,0]] ∈ J_½(c)` is `e`.
- In `ℝ³`, `x = (2,2,−1)` has `χ_x = (T−2)²(T+1)`, `tr x = 3`, `det x = −4`, and is not regular.
- In a spin factor, `(t,u)` with `u ≠ 0` has eigenvalues `t ± ‖u‖` with idempotents
  `½(1, ±u/‖u‖)`; so `Spin_n` has rank `2` for `n ≥ 1`, and `(3,(0,2))⁻¹ = (3/5,(0,−2/5))`.
- In `ℝ²`, `√(4,0) = (2,0)`; `(−2,0)` has the same square and a negative eigenvalue.
- `e` and `Σ i · c_i` for a frame show the two extremes: one eigenvalue of multiplicity `rank J`,
  and `rank J` simple eigenvalues.

## Layer 3: The quadratic representation and the cone of squares

### 3.1 The quadratic representation

Prove `P(x) e = x²`, `P(e) = 1`, `P(tx) = t² P(x)`, `P(xⁿ) = P(x)ⁿ`, that `P(x)` is invertible
exactly when `x` is, with `P(x)⁻¹ = P(x⁻¹)` and `P(x) x⁻¹ = x`, that `P(c)` is the Peirce
projection onto `J_1(c)` for an idempotent `c`, and that `P(x) y = xyx` in `Herm_n(K)`. Prove the
fundamental formula

`P(P(x) y) = P(x) P(y) P(x)`,

and its consequences `(P(x) y)⁻¹ = P(x⁻¹) y⁻¹` for invertible `x, y` and `P(f x) = f P(x) f⁻¹` for
a Jordan isomorphism `f`. Route: Faraut–Korányi, Chapter II, by differentiating the inverse; the
derivative of `x ↦ x⁻¹` at `x` is `−P(x)⁻¹`, also a target.

*Needs:* §2.2, §2.5. Faraut–Korányi, Chapter II; McCrimmon, Part II, 5.2.3.

### 3.2 The trace inner product

Prove that `B(x,y) = tr(x ∘ y)` is symmetric, positive definite, with `B(x,x) = Σ λ_i²`, and
associative. Route to associativity: a derivation `D` satisfies `tr(D x) = 0`, because `exp(tD)`
is a Jordan automorphism and `tr` is invariant; apply this to Tau Ceti's inner derivation
`[L_x, L_z]`. Prove that every derivation is skew-adjoint for `B`, and that a Jordan frame is
orthonormal for `B`.

*Needs:* §2.4; Tau Ceti `jordanInnerDerivation`; Mathlib `NormedSpace.exp`. Faraut–Korányi,
Chapters II and III.

### 3.3 The cone of squares

Prove, for the cone of squares `C` of an EJA:

- `x ∈ C` exactly when all eigenvalues of `x` are nonnegative, exactly when `L_x` is positive
  semidefinite for `B`;
- `C` is a closed convex cone with `C ∩ −C = 0`, and every sum of squares is a square;
- `C` is self-dual for every associative positive definite form `b`:
  `x ∈ C ↔ ∀ y ∈ C, b(x,y) ≥ 0`; in particular `ProperCone.innerDual C = C` for `B`;
- `Ω = int C` is the set of elements with positive eigenvalues, equivalently of `x ≥ εe` for some
  `ε > 0`, equivalently of squares of invertible elements; `e ∈ Ω` and `C` is the closure of `Ω`;
- if `x, y ∈ C` and `B(x,y) = 0` then `x ∘ y = 0`;
- on `Herm_n(ℝ)` and `Herm_n(ℂ)`, `C` is the set of `Matrix.PosSemidef` matrices.

*Needs:* §2.2, §2.5, §3.2; Mathlib `ProperCone.innerDual`. Faraut–Korányi, Chapter III.

### 3.4 Homogeneity

Prove that `P(x) C ⊆ C` for every `x`, and that `P(x)` maps `Ω` onto `Ω` when `x` is invertible.
Route: for invertible `x` the image under `P(x)` of the segment from `e` to `y ∈ Ω` consists of
invertible elements and starts at `x² ∈ Ω`, so it stays in `Ω`; then use closure. Prove that for
`x, y ∈ Ω` the map `P(√y) P(√x)⁻¹` is an automorphism of `Ω` taking `x` to `y`, so `C` is a
symmetric cone. Let `G(Ω)` be the group of linear maps `g` with `g(Ω) = Ω`. Prove that the adjoint
of an element of `G(Ω)` for `B` lies in `G(Ω)`, and that every `g ∈ G(Ω)` factors as `P(x) k` with
`x ∈ Ω` and `k e = e`.

*Needs:* §3.1, §3.3. Faraut–Korányi, Chapter III.

### 3.5 Supports and faces

For `x ∈ C` the support `s(x)` is the sum of the spectral idempotents `p_λ` with `λ > 0`. Prove
that it is the least idempotent `c` with `c ∘ x = x`. For an idempotent `c` put `F_c = C ∩ J_1(c)`.
Prove `F_c = P(c) C = {y ∈ C | B(e − c, y) = 0}`, that `F_c` is the cone of squares of `J_1(c)`
and an exposed face of `C` whose relative interior is `{y ∈ C | s(y) = c}`, that every nonempty
face of `C` is `F_c` for exactly one idempotent `c`, that `F_c ⊆ F_d ↔ c ∘ d = c`, and that the
extreme rays of `C` are the rays through primitive idempotents.

*Needs:* §2.1, §2.2, §3.3; Mathlib `IsExposed`, `intrinsicInterior`. Lourenço, Proposition 31.

**Checks.**

- In `Herm₂(ℂ)`, `x = diag(2,−3)` gives `P(x)` with eigenvalues `4`, `−6`, `9` on `J_11`, `J_12`,
  `J_22`: `P(x)` is invertible and self-adjoint but not positive, as `x ∉ C`.
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
`‖x‖_e ≤ ‖x‖_B ≤ √(rank J) ‖x‖_e`, `‖x ∘ y‖_e ≤ ‖x‖_e ‖y‖_e`, and the two norm laws

`‖x²‖_e = ‖x‖_e²` and `‖x²‖_e ≤ ‖x² + y²‖_e`.

On `Herm_n(ℝ)` and `Herm_n(ℂ)` identify `≤` with the Loewner order and `‖·‖_e` with the operator
norm.

*Needs:* §2.5, §3.3; CompactQuantumMetricSpaces §0.1.

### 4.2 States and densities

Prove that `ρ ↦ B(ρ, ·)` is an affine homeomorphism from the densities onto the state space of
CompactQuantumMetricSpaces §0.2, by self-duality of `C`. Prove that the extreme points of the
state space, the pure states, correspond to the primitive idempotents, and that every state is a
convex combination of at most `rank J` pure states with pairwise orthogonal idempotents. Prove
`λ_min(x) ≤ φ(x) ≤ λ_max(x)` for every state `φ`, with both bounds attained at pure states. On
`Herm_n(ℂ)` the pure state of the primitive idempotent `vv*`, `‖v‖ = 1`, is `A ↦ v* A v`.

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

**Checks.**

- In `Herm₂(ℂ)`, `diag(1,0)` gives the pure state `A ↦ A_11` and the density `e/2` gives the
  normalized trace. `‖e/2‖_e = 1/2` and `‖e/2‖_B = 1/√2`.
- In `Herm₂(ℂ)`, `B(c,c) = 1` and `τ(c,c) = 2` for `c = diag(1,0)`: a `τ`-normalized density
  would not have trace one.
- In `ℝ²`, `x ↦ (2x_1, x_2)` is a linear order automorphism that is not unital and not a Jordan
  homomorphism: the unit hypothesis in Koecher's theorem is needed.
- The effect `diag(1,½)` is not an idempotent: `diag(0,½)` lies below it and its complement.

## Layer 5: The Koecher–Vinberg theorem

Throughout, `V` is a finite-dimensional real inner-product space, `C ⊆ V` a symmetric cone with
interior `Ω`, and `G` the group of linear automorphisms `g` of `V` with `g(C) = C`.

### 5.1 The characteristic function

Define `φ(x) = ∫_C exp(−⟪x,y⟫) dy` for `x ∈ Ω`. Prove that `φ` is finite, positive and smooth,
that `φ(g x) = |det g|⁻¹ φ(x)` for `g ∈ G`, in particular `φ(tx) = t^(−dim V) φ(x)` for `t > 0`,
that `log φ` is strictly convex, and that `φ(x) → ∞` as `x` tends to a boundary point of `Ω`. Deduce that `log φ(x) + ‖x‖²/2` has a unique minimizer
`e₀ ∈ Ω`, and that every `g ∈ G` that is orthogonal fixes `e₀`.

*Needs:* Mathlib Lebesgue integration, differentiation under the integral, `ProperCone`.
Faraut–Korányi, Chapter I.

### 5.2 The automorphism group and its Lie algebra

Prove that `G` is a closed subgroup of `GL(V)` and is stable under adjoints. Let
`𝔤 = {X ∈ End V | ∀ t, exp(tX) ∈ G}`; by the closed-subgroup theorem it is the Lie algebra of the
Lie group `G`. Prove:

- `X ↦ X e₀` maps `𝔤` onto `V`, because `G` acts transitively on the open set `Ω`;
- `𝔤 = 𝔨 ⊕ 𝔭` with `𝔨` the skew-adjoint and `𝔭` the self-adjoint elements, `[𝔭,𝔭] ⊆ 𝔨` and
  `[𝔨,𝔭] ⊆ 𝔭`;
- the stabilizer of `e₀` in `G` is compact, since it preserves the order-unit norm of `(V, C, e₀)`;
- `𝔨 = {X ∈ 𝔤 | X e₀ = 0}`, and `X ↦ X e₀` is a linear isomorphism `𝔭 → V`.

*Needs:* §5.1; CompactQuantumMetricSpaces §0.1; LieGroups Layer 2 in Tau Ceti's
`TauCeti.Geometry.Lie.Subgroup`; Mathlib `NormedSpace.exp`, `LinearMap.adjoint`.
Faraut–Korányi, Chapters I and III.

### 5.3 The product

For `x ∈ V` let `L_x` be the element of `𝔭` with `L_x e₀ = x`, and put `x ∘ y = L_x y`. Prove that
this product is commutative with unit `e₀`, that `[A, L_x] = L_(Ax)` for `A ∈ 𝔨`, that it
satisfies the Jordan identity, and that every `L_x` is self-adjoint; so `V` is an EJA by §1.3, and
its cone of squares is `C`. Then prove the theorem for an arbitrary base point `e ∈ Ω`: there is
exactly one bilinear product on `V` that makes it an EJA with unit `e` and cone of squares `C`.
Existence is transport of the product at `e₀` by some `g ∈ G` with `g e₀ = e`; uniqueness is
Koecher's theorem applied to the identity map. Deduce that EJAs up to Jordan isomorphism
correspond to symmetric cones with a base point up to linear isomorphism, and that
`G = G(Ω)` of §3.4 for the cone of an EJA.

*Needs:* §5.2, §1.3, §2.5, §3.3, §4.3. Faraut–Korányi, Chapter III.

**Checks.**

- For the orthant `ℝⁿ≥0`, `φ(x) = 1/∏ x_i` and `e₀ = (1,…,1)`. At a base point `e` with positive
  coordinates the product is `(x ∘ y)_i = x_i y_i / e_i`: the product depends on the base point.
- For the positive semidefinite cone of `Herm_n(ℝ)` and a positive definite base point `e`, the
  product is `(x e⁻¹ y + y e⁻¹ x)/2`. At `e = diag(2,1)` the square of `diag(1,0)` is
  `diag(1/2,0)`.
- In dimension zero the cone, its interior and the algebra are a point.

## Layer 6: The classification

### 6.1 Ideals and the simple decomposition

An ideal is a `Submodule ℝ J` stable under every `L_x`. An EJA is simple when it is nontrivial and
has no ideals other than `0` and `J`. Prove that the orthogonal complement of an ideal for an
associative positive definite form is an ideal, that `J` is the internal direct sum of its minimal
nonzero ideals, that each is a simple EJA with its own unit, and that this is the only
decomposition of `J` as a product of simple EJAs. Prove that `C`, the order, `tr`, `det` and the
rank decompose accordingly, and that every positive definite associative form is a positive
multiple of `B` on each simple ideal; in particular `τ = (dim J / rank J) B` for simple `J`.

*Needs:* §1.3, §2.4, §3.2. Faraut–Korányi, Chapter III.

### 6.2 Simple algebras: connected frames and the Peirce constant

Let `(c_i)` be a Jordan frame of a simple EJA of rank `r`. Prove that `J_ij ≠ 0` for all
`i ≠ j`, that for `u ∈ J_ij` one has `u² = ½ B(u,u)(c_i + c_j)`, and that for `u ∈ J_ij`,
`v ∈ J_jk` with `i, j, k` distinct, `B(u ∘ v, u ∘ v) = ⅛ B(u,u) B(v,v)`. Prove that all `J_ij`
with `i ≠ j` have the same dimension `d`, the same for every frame, so that
`dim J = r + d · r(r−1)/2`. Route: for `u ∈ J_ij` with `u² = c_i + c_j` the element
`w = e − c_i − c_j + u` satisfies `w² = e`, and `P(w)` is a Jordan automorphism exchanging `c_i`
and `c_j` and fixing the other `c_k`. Conversely, prove that an EJA with a Jordan frame for which
every `J_ij` with `i ≠ j` is nonzero is simple.

*Needs:* §2.2, §3.1, §3.2, §6.1. Faraut–Korányi, Chapter IV.

### 6.3 Ranks one and two

Prove that a simple EJA of rank `1` is `ℝ`, and that a simple EJA of rank `2` is isomorphic to
`Spin_n` with `n = d + 1 ≥ 2`: the vector part is `ℝ(c_1 − c_2) ⊕ J_12` with inner product `B/2`.
Conversely prove that `Spin_n` is simple of rank `2` for `n ≥ 2`, and that `Herm₂(K)` is
isomorphic to `Spin_n` with `n = 1 + dim K` for `K = ℝ, ℂ, ℍ`.

*Needs:* §0.2, §2.4, §6.2. Faraut–Korányi, Chapter V.

### 6.4 Coordinates in rank at least three

Let `J` be a simple EJA of rank `r ≥ 3` with Jordan frame `(c_i)`. Choose `u_12 ∈ J_12` and
`u_13 ∈ J_13` with `u_1j² = c_1 + c_j` and put `u_23 = 2 u_12 ∘ u_13`. On the real vector space
`D = J_12` define

`a · b = 4 (a ∘ b′) ∘ u_23`, where `b′ = 4 u_12 ∘ (b ∘ u_23) ∈ J_23`,

`ā = B(a, u_12) u_12 − a` and `N(a) = ½ B(a,a)`. Prove that `(D, ·)` is a real algebra with unit
`u_12`, that `a ↦ ā` is an involution with `a · ā = ā · a = N(a) u_12` and fixed space `ℝ u_12`,
that `N` is positive definite with `N(a · b) = N(a) N(b)`, and that `D` is alternative, and
associative when `r ≥ 4`. Let `Herm_r(D)` be the real vector space of `r × r` matrices over `D`
with `A_ji` the conjugate of `A_ij`, with the product `(AB + BA)/2` computed from the product of
`D`. Prove that there is a linear isomorphism `Herm_r(D) → J` preserving this product, taking the
diagonal matrix units to the `c_i` and the matrix with entries `a` at `(1,2)` and `ā` at `(2,1)`
to `a`. The route is the Peirce calculus of §2.2 and §6.2 together with the associativity of `B`.

*Needs:* §2.2, §3.1, §6.2. Jordan–von Neumann–Wigner; Faraut–Korányi, Chapter V; McCrimmon, Part
II, Chapters 14–17.

### 6.5 Hurwitz's theorem

Prove: a finite-dimensional real algebra `D` with unit, not assumed associative, carrying a
positive definite quadratic form `N` with `N(ab) = N(a) N(b)`, is isomorphic to `ℝ`, `ℂ`, `ℍ` or
the octonions `TauCeti.DivisionOctonionReal`, by an isomorphism that takes `N` to the standard
norm and `a ↦ 2⟪a,1⟫ 1 − a`, with `⟪·,·⟫` the polarization of `N`, to the standard conjugation. Route: a proper subalgebra `A` closed
under conjugation and a unit vector orthogonal to it generate the Cayley–Dickson double of `A`;
the double is a composition algebra only if `A` is associative, which stops the process at
dimension `8`.

*Needs:* Mathlib `Quaternion`; Tau Ceti `TauCeti.CayleyDickson` and `TauCeti.DivisionOctonionReal`.
Baez, Theorem 1 and §§2.2–2.3.

### 6.6 The classification theorem

Prove that the following are simple EJAs, pairwise non-isomorphic, and that every simple EJA is
isomorphic to exactly one of them:

| algebra | rank | `d` | dimension |
| --- | --- | --- | --- |
| `ℝ` | `1` | – | `1` |
| `Spin_n`, `n ≥ 2` | `2` | `n − 1` | `n + 1` |
| `Herm_r(ℝ)`, `r ≥ 3` | `r` | `1` | `r(r+1)/2` |
| `Herm_r(ℂ)`, `r ≥ 3` | `r` | `2` | `r²` |
| `Herm_r(ℍ)`, `r ≥ 3` | `r` | `4` | `r(2r−1)` |
| `Herm₃(𝕆)` | `3` | `8` | `27` |

Here `Herm₃(𝕆)` is the compact Albert algebra `TauCeti.CompactAlbertAlgebra ℝ` of LieHighestWeight
Layer 8, which supplies its Jordan identity, formal reality, dimension and diagonal frame; no fact
about the octonions or the Albert algebra is proved here beyond §6.5 and the identification of
`Herm₃(D)` with it when `D` is the octonions. Simplicity of each model follows from §6.2 applied
to its diagonal frame. With §6.1 this classifies all EJAs, and with §5.3 all symmetric cones: the
half-line, the Lorentz cones, the cones of positive semidefinite real, complex and quaternionic
Hermitian matrices, the 27-dimensional exceptional cone, and their products.

*Needs:* §0.2, §6.1–6.5, §5.3; LieHighestWeight Layer 8. Faraut–Korányi, Chapter V.

**Checks.**

- `Herm₃(ℂ)` has rank `3`, `d = 2` and dimension `3 + 2·3 = 9`.
- In `Herm₃(ℍ)` with `u_12 = E_12 + E_21` and `u_13 = E_13 + E_31`, the product of §6.4 on
  `J_12 ≅ ℍ` is quaternion multiplication, `ā` is quaternion conjugation and `N` is the squared
  norm; in particular `·` is not commutative.
- `Herm₂(ℂ) ≅ Spin_3` by `[[t+s, z],[z̄, t−s]] ↦ (t,(s, Re z, Im z))`. This is why `r ≥ 3` in the
  table.
- `ℝ ⊕ ℝ` has rank `2` and is not simple: for its frame `J_12 = 0`.
- The compact Albert algebra has `d = (27 − 3)/3 = 8`. The split Albert algebra
  `TauCeti.AlbertAlgebra ℝ` is a Jordan algebra that is not formally real and is not on the list.

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

Two elements of an EJA *operator commute* when `L_a L_b = L_b L_a`. Prove that `a` and `b`
operator commute exactly when they are real combinations of one Jordan frame, and that then
`f(a)` and `g(b)` operator commute for all `f`, `g`, and `P(a) b = a² ∘ b`. For `a, b ∈ C` prove
the equivalence of:

1. `a` and `b` operator commute;
2. `P(a) P(b) = P(b) P(a)`;
3. `P(√a) b = P(√b) a`.

Route: 3 makes `P(√a) P(√b)` a normal operator by the fundamental formula, and a normal product
of two positive semidefinite operators is self-adjoint; on `Ω`, `P(x) = exp(2 L_(log x))`, and the
boundary case reduces to the supports of §3.5.

*Needs:* §2.2, §2.5, §3.1, §3.5. Van de Wetering, Proposition 3.9.

### 7.3 The sequential product of an EJA

For effects `a, b` of an EJA put `a & b = P(√a) b`. Prove that `a & b` is an effect below `a`,
that `[0,e]` with `&` is a sequential effect algebra, that `(a, b) ↦ a & b` is continuous, and
that `a | b` exactly when `a` and `b` operator commute, in which case `a & b = a ∘ b`. Prove
`B(e, a & b) = B(a,b)`, that `p & b = P(p) b` is the Peirce projection of `b` for an idempotent
`p`, that an effect `p` is an idempotent exactly when `p & p = p`, and that
`a & b = √a b √a` in `Herm_n(K)`.

*Needs:* §2.5, §3.3–3.5, §4.3, §7.1, §7.2. Van de Wetering, Theorem 4.2 and Proposition 4.3.

**Checks.**

- In `ℝ`, `3/4 ⊕ 1/2` is undefined and `3/4 & 1/2 = 3/8`.
- In `Herm₂(ℂ)` let `p = diag(1,0)` and `q = ½[[1,1],[1,1]]`. Then `p & q = p/2` and
  `q & p = q/2`: these idempotents do not commute under `&`, although `B(p,q) = B(q,p) = 1/2`.
- With `a = diag(1,1/4)` and the same `q`: `a & q = [[1/2,1/4],[1/4,1/8]]`, while `a ∘ q` has
  off-diagonal entries `5/16`. The sequential product is not the Jordan product.
- The positivity hypothesis in §7.2 is needed: in `Herm₂(ℂ)` the Pauli matrices
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

- [VonNeumannAlgebras](../VonNeumannAlgebras/README.md) §12.J. For `M_n(ℂ)` the idempotents of
  `Herm_n(ℂ)` are the projections, Jordan frames are the families of rank-one projections of
  orthonormal bases, and the Jordan maps of V12.J.Maps restrict to Jordan homomorphisms. This
  gives V12.J its finite-dimensional test cases.
- [CStarAlgebras](../CStarAlgebras/README.md) C2.4. The pure states of `Herm_n(ℂ)` in §4.2 are
  the pure states `T ↦ ⟪ξ, Tξ⟫` of `M_n(ℂ) = K(ℂⁿ)`.

## Scope and ownership

This roadmap owns the structure theory of finite-dimensional Euclidean Jordan algebras: their
spectral theory, quadratic representation, cone of squares, order-unit norm and states, the
Koecher and Koecher–Vinberg theorems, the classification with Hurwitz's theorem, and effect
algebras with the sequential product of an EJA. Everything in it is finite-dimensional.

- **Infinite dimension and Hilbert-space quantum theory.** Segal systems, JB- and JBW-algebras,
  effects, POVMs, instruments and Lüders operations on Hilbert spaces, Gleason's theorem and
  density operators are not built or used here; they are the subject of the roadmap on the
  mathematical foundations of quantum systems and of VonNeumannAlgebras. The two meet in two
  facts. The norm laws of §4.1 say that every EJA is a JB-algebra in its order-unit norm. And on
  the shared example `Herm_n(ℂ) = B(ℂⁿ)_sa`, the product `a & b = √a b √a` of §7.3 is the Lüders
  operation of the effect `a`, and `p & b = pbp` for a projection `p`.
- **Order-unit spaces and states** in general belong to
  [CompactQuantumMetricSpaces](../CompactQuantumMetricSpaces/README.md) Layer 0. Layers 4 and 5
  specialize them.
- **The octonions and the Albert algebra** belong to
  [LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md) Layer 8. Layer 6 consumes
  them.
- **Lie subgroups** belong to [LieGroups](../RepresentationTheory/LieGroups/README.md). §5.2
  consumes the closed-subgroup theorem.
- **Macdonald's theorem and the Shirshov–Cohn theorem** are neither built nor used here: the
  fundamental formula is proved by the route of §3.1, and the identities of Layer 6 by the Peirce
  calculus.
- **Homogeneous cones that are not self-dual**, their classification by Vinberg, and the
  characterizations of EJAs among order-unit spaces that rest on it, are not part of this
  roadmap.

## Exact supplier contracts

### From Mathlib

- `Mathlib.Algebra.Jordan.Basic`: `IsCommJordan` and the linearized Jordan identities.
  `Mathlib.Algebra.Ring.IsFormallyReal`: `IsFormallyReal`, stated for a type with only an addition
  and a multiplication, so it applies to nonassociative rings.
  `Mathlib.Algebra.Symmetrized`: `SymAlg`.
- `LinearMap.mulLeft`, `Module.End.eigenspace`, `LinearMap.trace`, `IsIdempotentElem`,
  `Polynomial`, `MvPolynomial`, `Matrix.IsHermitian`, `Matrix.PosSemidef`, `Quaternion`.
- `ProperCone` and `ProperCone.innerDual`, `IsExposed`, `intrinsicInterior`, extreme points,
  `NormedSpace.exp`, `LinearMap.adjoint`, Lebesgue measure on a finite-dimensional real
  inner-product space.

### From Tau Ceti

- `TauCeti.Algebra.Jordan.Basic`: `TauCeti.Jordan.mul_mul_mul_sub_add_add_eq_zero`, the linearized
  Jordan identity.
- `TauCeti.Algebra.Jordan.Peirce`: `TauCeti.Jordan.peirceSpace`, the projections `peirceOne`,
  `peirceHalf`, `peirceZero`, the decomposition `peirceLinearEquiv`, and the multiplication rules
  for one idempotent. Layer 2 extends these to complete systems.
- `TauCeti.Algebra.Jordan.TraceForm`: `TauCeti.Jordan.mulTrace` and `traceForm` with
  `traceForm_comm`, `traceForm_assoc` and `traceForm_derivation`. Its positivity is §1.3.
- `TauCeti.Algebra.Jordan.Derivation`: `TauCeti.jordanInnerDerivation` in
  `TauCeti.derivationLieAlgebra`.
- `TauCeti.Algebra.CayleyDickson.Quaternion`: `TauCeti.CayleyDickson` and
  `TauCeti.DivisionOctonionReal` with their product, conjugation, multiplicative positive definite
  norm and alternative laws.

### From CompactQuantumMetricSpaces Layer 0

- §0.1: the order-unit norm and the predicate `IsOrderUnitNorm e`.
- §0.2: positive maps are bounded with norm attained at the unit; states and `stateSpace e`.
- §0.3: compactness and convexity of the state space; states determine the order and the norm.

### From LieHighestWeight Layer 8

- `TauCeti.CompactAlbertAlgebra ℝ` (`TauCeti.Algebra.AlbertAlgebra.Compact`) with its `NonAssocCommRing`, `Module ℝ`, `IsCommJordan` and
  `IsFormallyReal` structure, its dimension `27`, its trace and its diagonal frame of three
  primitive idempotents with their Peirce spaces.

### From LieGroups Layer 2

- The closed-subgroup theorem `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`, the Lie algebra
  `TauCeti.Lie.lieSubalgebraOfSubgroup` of a closed subgroup with its description by one-parameter
  subgroups `TauCeti.Lie.mem_lieSubalgebraOfSubgroup`, and its comparison with the tangent space
  in `TauCeti.Geometry.Lie.Subgroup.Differential`, applied to `G ⊆ GL(V)` through
  `TauCeti.Geometry.Lie.Subgroup.Units`.

## Provenance

Two existing formalizations cover parts of this roadmap. They are sources to compare with and to
reuse where their licences and authors allow; the specification is the text above.

- [euclidean-jordan](https://github.com/ehrlich-b/euclidean-jordan) (Bryan Ehrlich): §1.1–1.3,
  §2.1–2.2, Koecher's theorem of §4.3 and the order-unit structure of §4.1 for `Herm_n(ℝ)` and
  `Herm_n(ℂ)`.
- [jordanalgebra](https://github.com/cobord/jordanalgebra) (Ammar Husain): spin factors, Hermitian
  matrix algebras and an Albert algebra over the octonions, with a bundled Jordan-algebra class
  that differs from Mathlib's `IsCommJordan`.

## References

- J. Faraut and A. Korányi, *Analysis on Symmetric Cones*, Oxford University Press, 1994.
  Chapters I–V, cited by chapter.
- P. Jordan, J. von Neumann and E. Wigner,
  [*On an algebraic generalization of the quantum mechanical formalism*](https://doi.org/10.2307/1968117),
  Annals of Mathematics **35** (1934), 29–64.
- K. McCrimmon, [*A Taste of Jordan Algebras*](https://doi.org/10.1007/b97489), Springer, 2004.
  Part II, 5.2.3 (the fundamental formula) and Chapters 14–17 (coordinatization).
- J. C. Baez, [*The octonions*](https://arxiv.org/abs/math/0105155), Bulletin of the AMS **39**
  (2002), 145–205. Theorem 1 in §1.1, the Cayley–Dickson construction in §2.2 and the proof of
  Theorem 1 in §2.3.
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
