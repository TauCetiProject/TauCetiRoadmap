# Roadmap: Hilbert C*-modules, Morita equivalence, and continuous trace

**Summary.** A Hilbert module over a C*-algebra A is a complex vector space E with a right action
of A and an A-valued inner product ⟨x, y⟩, complete for the norm `‖x‖ = ‖⟨x, x⟩‖^(1/2)`. For
A = ℂ it is a Hilbert space. In general a closed submodule need not have an orthogonal complement
that splits E, a bounded A-linear map need not have an adjoint, and the module-compact operators
(the closed span of the rank-one maps `z ↦ x⟨y, z⟩`) need not be compact operators of the
underlying Banach space. This roadmap builds Hilbert modules over complex C*-algebras, possibly
nonunital, as an analytic theory on which correspondences, crossed products and operator K-theory
can build without those Hilbert-space properties. Separability and countable generation are never
standing assumptions; each statement carries the ones it uses.

Its headline theorems are these.

- *Adjointable operators.* If T : E → F and S : F → E are any functions between Hilbert A-modules
  with `⟨Tx, y⟩ = ⟨x, Sy⟩` for all x and y, then T and S are bounded complex-linear maps and T
  commutes with the action of A; and `‖S ∘ T‖ = ‖T‖²`. The adjointable operators on E form a
  C*-algebra, the multiplier algebra of the module-compact operators. Over a unital A, E has a
  finite Parseval frame, vectors x₁, …, xₙ with `z = Σ xᵢ⟨xᵢ, z⟩` for every z, if and only if E
  is finitely generated and projective as an algebraic right A-module.
- *Stabilization and Morita equivalence.* For every C*-algebra A and every countably generated
  Hilbert A-module E, `E ⊕ ℓ²(ℕ, A) ≅ ℓ²(ℕ, A)` (Kasparov). Two σ-unital C*-algebras A and B are
  strongly Morita equivalent if and only if `A ⊗ K ≅ B ⊗ K`, with K the compact operators on ℓ²
  (Brown–Green–Rieffel).
- *Dixmier–Douady theory.* Let A and B have continuous trace, with the same paracompact Hausdorff
  spectrum X. They are Morita equivalent over X if and only if their Dixmier–Douady classes in the
  Čech group `Ȟ³(X, ℤ)` agree, every class occurs, and the Brauer group of X is `Ȟ³(X, ℤ)`.
- *The local–global principle* (Kaad–Lesch, Pierrot). A closed, densely defined A-linear operator
  T with densely defined adjoint is regular if and only if, for every pure state, the localized
  operators satisfy `(T*)^π = (T^π)*`; the same holds with all states or all representations.

The carrier is Mathlib's Hilbert C*-module class, in its opposite-algebra convention for right
modules. [CStarAlgebras](../CStarAlgebras/README.md) supplies ideals, approximate units,
multipliers, primitive spectra, the Dauns–Hofmann theorem and the spatial tensor product;
[VonNeumannAlgebras](../VonNeumannAlgebras/README.md) supplies states, the trace on B(H) and the
normal modules of finite factors; [TopologicalKTheory](../TopologicalKTheory/README.md) supplies
vector bundles, whose section modules Layer 5 identifies with finitely generated projective
Hilbert modules. [OperatorKTheory](../OperatorKTheory/README.md) and
[IndexTheory](../IndexTheory/README.md) consume the standard module and the module-compact
operators, and the child roadmap
[HeisenbergImprimitivity](HeisenbergImprimitivity/README.md) builds explicit imprimitivity
bimodules on top of Layers 1–3.

Layers 1–4 build the modules, their operators, tensor products and Morita equivalence, and
stabilization; Layer 5 treats continuous fields, the projective modules over the two-torus,
continuous trace and Dixmier–Douady theory; Layers 6–7 treat regular operators and the
local–global principle. This README is the roadmap; [Suggested.lean](Suggested.lean) states the
headlines statable at the pinned libraries and names the others.

## How to read the build

Layers 1–4 come first and in order; Layers 5 and 6 build on them independently; Layer 7 uses
Layers 3 and 6. Other roadmaps cite the layers as H1–H7: Hk is Layer k throughout, and the named
units of H5 keep their names in the headings of §§5.2, 5.4 and 5.6. Within Layer 1,
§§1.8–1.9 speak of maps having adjoints; they state that condition directly and need nothing of
Layer 2. In Layer 5, the torus modules (§§5.4–5.7) follow the fields and bundles of §§5.1–5.3;
continuous trace (§§5.8–5.9) needs §5.1 and Layer 3; the Čech cohomology and compact-operator
bundles of §§5.10–5.12 need none of §§5.1–5.9; §§5.13–5.15 join these strands. Each target's *Needs:* line lists what its statement and its
route use, so that a target proved by another route is not blocked behind an unrelated section.

## Conventions

1. **Coefficients.** Coefficient algebras are complex C*-algebras, possibly nonunital:
   `[NonUnitalCStarAlgebra A] [PartialOrder A] [StarOrderedRing A]`, with `[CStarAlgebra A]` where
   a unit is needed. Zero algebras and zero modules are included, and every statement is read in
   that case too.
2. **Right modules.** A right Hilbert A-module E is complete for `‖x‖² = ‖⟨x, x⟩‖`; its inner
   product is conjugate-linear in the first variable, linear in the second, and satisfies
   `⟨x, ya⟩ = ⟨x, y⟩a`. Without completeness E is a pre-Hilbert module. In Lean a right module is
   Mathlib's `CStarModule Aᵐᵒᵖ E`, with `[NormedAddCommGroup E] [NormedSpace ℂ E]` and, for a
   Hilbert module, `[CompleteSpace E]`: the right action is `x a = MulOpposite.op a • x`, and the
   A-valued inner product is `MulOpposite.unop (inner Aᵐᵒᵖ x y)`. The class itself has a left
   scalar action, and using A in place of Aᵐᵒᵖ reverses the multiplication convention. The
   opposite of a C*-algebra carries Mathlib's C*-algebra, order and star-order instances, so
   every construction of Mathlib on the class applies verbatim with Aᵐᵒᵖ as coefficient algebra.
   Where the module norm differs from a norm the carrier already has (products, function spaces),
   the module lives on Mathlib's type synonym `WithCStarModule`, written `C⋆ᵐᵒᵈ(Aᵐᵒᵖ, E)`.
   Mathlib's normed-space, C*-algebra, order, star-homomorphism, continuous-linear-map, quotient
   and completion APIs are used throughout, never parallel versions.
3. **Fullness and generation.** E is *full* when the closed linear span of its inner products is
   A; fullness is a separate property, never part of the definition, and is defined the same way
   for zero algebras and zero modules. Neither separability nor countable generation is a standing
   assumption; results that use them say so.
4. **Finite sums.** Finite orthogonal sums are Mathlib's: the product `C⋆ᵐᵒᵈ(Aᵐᵒᵖ, E × F)` with
   `⟨x, y⟩ = ⟨x₁, y₁⟩ + ⟨x₂, y₂⟩`, the finite product `C⋆ᵐᵒᵈ(Aᵐᵒᵖ, Π i, E i)` over a `Fintype`
   with the summed inner product, and, for a complex inner product space H, the `CStarModule ℂ H`
   instance `WithCStarModule.instCStarModuleComplex`. Layer 1 constructs only the infinite
   Hilbert direct sum.
5. **Operators.** `L_A(E, F)` is the space of adjointable maps E → F (§2.2) and
   `K_A(E, F)` the norm closure of the span of the rank-one maps `θ_(x,y) : z ↦ x⟨y, z⟩` (§2.3); it
   is not the space of Banach-space compact operators. For a Hilbert space H, `B(H)` is
   `H →L[ℂ] H` and `K(H)` is its ideal of compact operators in Mathlib's sense
   (`IsCompactOperator`). A *module unitary* is a surjective inner-product-preserving module map;
   §2.2 proves that these are the invertible adjointable maps whose inverse is the adjoint.
6. **Correspondences.** An A–B correspondence is a right Hilbert B-module E with a specified
   *-homomorphism `φ : A → L_B(E)`; it is *nondegenerate* when the linear span of `φ(A)E` is
   dense, and this is said explicitly where it is assumed. The left action is kept as explicit
   data, never installed as a competing scalar instance.
7. **Notation.** `M(A)` is the multiplier algebra, Mathlib's `DoubleCentralizer` (`𝓜(ℂ, A)`).
   `H_A = ℓ²(ℕ, A)` is the standard module (§1.6). `⊗min` is the spatial tensor product of
   C*-algebras and `K = K(ℓ²(ℕ))`. `C₀(X)` is `ZeroAtInftyContinuousMap X ℂ`, `𝕋` the circle
   group, and `T² = AddCircle (1 : ℝ) × AddCircle (1 : ℝ)`. Partial operators are Mathlib's
   `LinearPMap`, and resolvents follow the `zI − T` convention of
   [SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md).
8. **Mathlib's shape.** The adjointable-operator, tensor-product and cohomological comparison
   material that the pinned libraries lack is built here in the shapes of Mathlib's
   `CStarModule`, `WithCStarModule`, `LinearPMap` and `cechComplexFunctor`, following the Mathlib
   design discussions cited in the references, and in Mathlib's unbundled C*-algebra classes
   (`CStarAlgebra`, `NonUnitalCStarAlgebra`).

## Layer 1: modules, completions, and fibers

Raeburn–Williams, Chapter 2; Blackadar, II.7.

### 1.1 The right-module laws, Cauchy–Schwarz and Gram matrices

Prove, for a right Hilbert A-module E in the convention above, the algebraic laws of the right
action inherited from the left Aᵐᵒᵖ-action (`x(ab) = (xa)b`, `x(a + b) = xa + xb`,
`(x + y)a = xa + ya`), its compatibility with complex scalars (`λ(xa) = (λx)a = x(λa)`), the
polarization identity `4⟨x, y⟩ = Σ_(k=0..3) iᵏ⟨iᵏx + y, iᵏx + y⟩`, continuity of the inner product,
and `⟨xa, y⟩ = a*⟨x, y⟩`. The module Cauchy–Schwarz inequalities are Mathlib's
`CStarModule.inner_mul_inner_swap_le` and `CStarModule.norm_inner_le`, stated for
`CStarModule Aᵐᵒᵖ E`; prove their usual right-module forms `⟨x, y⟩*⟨x, y⟩ ≤ ‖x‖²⟨y, y⟩` in A and
`‖⟨x, y⟩‖ ≤ ‖x‖‖y‖` (Raeburn–Williams, Lemma 2.5). Norm recovery by testing inner products against
the unit ball, `‖x‖ = sup {‖⟨y, x⟩‖ : ‖y‖ ≤ 1}`, is Mathlib's `CStarModule.norm_eq_csSup`; record
its right-module form. Prove `‖xa‖ ≤ ‖x‖‖a‖`.

For a finite family `x : ι → E`, prove that the Gram matrix `(⟨xᵢ, xⱼ⟩)_(i,j)` is positive in the
C*-algebra `CStarMatrix ι ι A` (Raeburn–Williams, Lemma 2.65), together with the finite-sum
quadratic-form criterion: a matrix `m` in `CStarMatrix ι ι A` is positive if and only if
`Σ_(i,j) aᵢ* mᵢⱼ aⱼ ≥ 0` in A for every `a : ι → A`. For the Gram matrix this sum is
`⟨Σ xᵢaᵢ, Σ xⱼaⱼ⟩`.
*Needs:* Mathlib `CStarModule`, `CStarModule.inner_mul_inner_swap_le`, `CStarModule.norm_inner_le`,
`CStarModule.norm_eq_csSup`, `CStarModule.continuous_inner`, `CStarMatrix`, the `MulOpposite`
C*-algebra and order instances.

**Checks.**

- In the right self-module of `M₂(ℂ)` (§1.4), take `x₁ = E₁₁` and `x₂ = E₁₂`. The Gram matrix
  has entries `E₁₁, E₁₂, E₂₁, E₂₂`; as a 4 × 4 matrix it is `vv*` for `v = e₁ ⊗ e₁ + e₂ ⊗ e₂`, a
  positive matrix of rank one with eigenvalue 2. The transposed matrix `(⟨xⱼ, xᵢ⟩)_(i,j)` is the
  flip of `ℂ² ⊗ ℂ²`, which has eigenvalue −1 on `e₁ ⊗ e₂ − e₂ ⊗ e₁`: an index convention that
  transposes the Gram matrix loses positivity over a noncommutative A.
- In the same module, `x = E₁₁` and `y = E₁₂` give `⟨x, y⟩ = E₁₂` and
  `⟨x, y⟩*⟨x, y⟩ = E₂₂ = ‖x‖²⟨y, y⟩`, so the right-module Cauchy–Schwarz inequality is an equality;
  the reversed product `⟨x, y⟩⟨x, y⟩* = E₁₁` is not below `E₂₂`, so the inequality with the factors
  in the other order, `⟨x, y⟩⟨x, y⟩* ≤ ‖x‖²⟨y, y⟩`, is false for right modules.

### 1.2 Completion and separated quotients

Construct the completion of a pre-Hilbert A-module, and, for a positive semidefinite module (a
right A-module with an A-valued inner product satisfying every axiom except definiteness), the
separated quotient by `{x : ⟨x, x⟩ = 0}` and its completion. Prove their universal properties:
inner-product-preserving module maps and bounded module maps out of the pre-Hilbert or
semidefinite module extend uniquely to the completion. Include modules over a dense *-subalgebra
A₀ of A, where the inner product takes values in A₀ and positivity and norm are measured in the
specified C*-completion A; prove that the action extends to A on the completion, which is then a
Hilbert A-module (Raeburn–Williams, Chapter 2).
*Needs:* §1.1; Mathlib `UniformSpace.Completion`, `CStarModule.normedSpaceCore`.

### 1.3 The essential action and factorization

Prove that the action on a Hilbert A-module is essential: for a contractive approximate identity
`(e_λ)` of A, `x e_λ → x` for every x. Supply the factorization `x = ya` (Cohen–Hewitt, through
[BanachAlgebras](../BanachAlgebras/README.md) A4, §4.3) and the special factorization
`x = y⟨y, y⟩`, both used in compact-operator and separation proofs (Raeburn–Williams, Chapter 2).
*Needs:* §1.1; Mathlib `Filter.IsIncreasingApproximateUnit`, `CStarAlgebra.approximateUnit`;
CStarAlgebras C1.4; BanachAlgebras A4 (§4.3).

### 1.4 The right self-module and closed right ideals

Construct A as a right module over itself with `⟨a, b⟩ = a*b`. Its carrier is A with a
right-module instance `CStarModule Aᵐᵒᵖ A`, the right action being multiplication on the right;
Mathlib's left self-module `WithCStarModule.instCStarModule`, whose inner product is `b a*`, is not
reused on that carrier. Construct the instance explicitly or transport the left self-module of Aᵐᵒᵖ
along `MulOpposite.unop`, and prove:

- the action and inner-product formulas `a · b = ab` and `⟨a, b⟩ = a*b`, and that the module norm
  is the norm of A;
- the module is full: the products `a*b` span a dense subspace of A;
- every closed right ideal of A is a closed submodule, with the restricted inner product.

*Needs:* §1.1; Mathlib `WithCStarModule.instCStarModule`, `WithCStarModule.inner_def`, the
`MulOpposite` C*-algebra and order instances; CStarAlgebras C1.4 for fullness.

**Checks.**

- In `M₂(ℂ)` with `a = E₁₂` and `b = E₁₁`, the right self-module gives `⟨a, b⟩ = a*b = E₂₁`, while
  the left formula `b a*` gives 0: a definition that reused Mathlib's left self-module inner
  product on the same carrier would compute the wrong module.
- The norm is recovered: `‖⟨a, a⟩‖^(1/2) = ‖a*a‖^(1/2) = ‖a‖` by the C*-identity.

### 1.5 Finite orthogonal sums

The sums `E ⊕ F` and `⊕_(i∈ι) Eᵢ` for finite ι are Mathlib's product and finite-product
`CStarModule` instances at Aᵐᵒᵖ (Convention 4). Prove that each coordinate inclusion preserves
inner products and is adjoint to the corresponding projection, `⟨ιᵢ x, z⟩ = ⟨x, zᵢ⟩`, and that
the two-factor and finite-family forms agree: `C⋆ᵐᵒᵈ(Aᵐᵒᵖ, E × F)` is unitarily isomorphic to the
finite product over a two-element index set, compatibly with the coordinates.
*Needs:* §1.1; Mathlib `WithCStarModule.prod_inner`, `WithCStarModule.pi_inner`,
`WithCStarModule.inner_single_left`, `WithCStarModule.inner_single_right`.

### 1.6 Hilbert direct sums and the standard module

For a family `(Eᵢ)` of Hilbert A-modules over an arbitrary index set, construct the Hilbert direct
sum `⊕ᵢ Eᵢ`: the families `x` with `xᵢ ∈ Eᵢ` for which the net of finite sums `Σ_(i∈s) ⟨xᵢ, xᵢ⟩`
converges in the norm of A, with `⟨x, y⟩ = Σᵢ ⟨xᵢ, yᵢ⟩`. Prove that it is a Hilbert A-module, the
coordinate, inclusion and projection statements, density of the finitely supported families, and
agreement with the finite instances of §1.5 when the index set is finite.

The standard module `H_A = ℓ²(ℕ, A)` is the Hilbert direct sum of copies of the right self-module
A, so it uses this norm-summability condition. It is not the Banach space of sequences with
`Σₙ ‖aₙ‖² < ∞`; prove that the latter embeds continuously into `H_A` with dense image.
*Needs:* §§1.1, 1.4–1.5.

**Checks.**

- For `A = K(ℓ²)`, let `pₙ` be the orthogonal rank-one projections onto the standard basis
  vectors and `aₙ = pₙ/√(n+1)`. Then `Σ aₙ*aₙ = Σ pₙ/(n+1)` converges in norm, its tail beyond `N`
  having norm `1/(N+1)`, so `(aₙ) ∈ H_A`, while `Σ ‖aₙ‖² = Σ 1/(n+1)` diverges: a definition of
  `H_A` by summability of norms gives a strictly smaller space.
- For `A = ℂ`, `H_A` is `ℓ²(ℕ)` with its usual inner product.

### 1.7 The module H ⊗ A

For a complex Hilbert space H, construct the Hilbert A-module `H ⊗ A`, the completion of the
algebraic tensor product with `⟨ξ ⊗ a, η ⊗ b⟩ = ⟨ξ, η⟩ a*b`, and its identification with the
standard module when `H = ℓ²(ℕ)`, sending `ξ ⊗ a` to `(ξₙ a)ₙ`.
*Needs:* §§1.2, 1.6; Mathlib `lp`.

**Checks.**

- For `H = ℂⁿ`, `H ⊗ A` is the finite sum `Aⁿ` of §1.5; for `H = 0` it is the zero module.

### 1.8 Orthogonal complements and complemented submodules

For a closed submodule `F ⊆ E`, define `F⊥ = {y : ⟨x, y⟩ = 0 for all x ∈ F}`, and prove that it
is a closed submodule and that `F ⊆ F⊥⊥`. Call F *orthogonally complemented* when `E = F + F⊥`.
Prove that F is orthogonally complemented if and only if its inclusion `ι : F → E` has an adjoint
(a function `p : E → F` with `⟨ιx, y⟩ = ⟨x, py⟩` for x ∈ F and y ∈ E, an adjoint pair in the
sense of §2.1), equivalently F is the range of a map `P : E → E` with `P² = P` and
`⟨Px, y⟩ = ⟨x, Py⟩`; identify that projection and the decomposition `E = F ⊕ F⊥`. An arbitrary
Banach quotient `E/F` is not given an A-valued inner product.
*Needs:* §1.1.

**Checks.**

- In `A = C([0, 1])` as a module over itself, the ideal `J = {f : f(0) = 0}` is a closed submodule
  with `J⊥ = 0` (a function orthogonal to J vanishes on `(0, 1]`, hence everywhere), so
  `J⊥⊥ = A ≠ J` and J is not orthogonally complemented: closed submodules need not split.

### 1.9 Quotients by coefficient ideals

For a closed two-sided ideal `J ⊆ A`, prove
`EJ = closure(span {xa : x ∈ E, a ∈ J}) = {x : ⟨x, x⟩ ∈ J}` and construct the Hilbert A/J-module
`E/EJ` with `⟨[x], [y]⟩ = ⟨x, y⟩ + J`. Prove the quotient norm formula (the Banach quotient norm
of `[x]` is `‖⟨x, x⟩ + J‖^(1/2)`), completeness, and functoriality in E (bounded module maps and
maps with adjoints descend) and in J (for `J ⊆ J′` the quotient maps compose). Give the ideal
`I_E = closure(span ⟨E, E⟩)`, the structure of E as a full Hilbert I_E-module, and the
compatibility of these constructions: `E · I_E = E`, and the ideal of `E/EJ` is the image
`(I_E + J)/J`.
*Needs:* §§1.1, 1.3; CStarAlgebras C1.3.

**Checks.**

- For `E = A = C([0, 1])` and `J = {f : f(0) = 0}`, `EJ = J`, `A/J = ℂ`, and `E/EJ` is ℂ with
  `⟨[f], [g]⟩ = conj(f(0)) g(0)`; the quotient norm of `[f]` is `|f(0)|`, as the formula says.

### Examples

A C*-algebra is a full right Hilbert module over itself (§1.4); `Aⁿ` and `H ⊗ A` are its finite and
Hilbert sums; for `A = ℂ` every Hilbert space is a Hilbert ℂ-module. The sequence
`pₙ/√(n+1)` in `H_{K(ℓ²)}` separates the standard module from the Banach ℓ²-space, and the ideal
of functions vanishing at 0 in `C([0, 1])` is a closed submodule with zero complement.

### Dependencies

Mathlib's `CStarModule`, `WithCStarModule`, `CStarMatrix`, approximate units and completions;
CStarAlgebras C1.3 (ideals and quotients) and C1.4 (approximate units); BanachAlgebras A4 (§4.3,
Cohen–Hewitt factorization). Nothing of Layers 2–7 is used.

## Layer 2: adjointable maps and module compact operators

Raeburn–Williams, Chapter 2; Blackadar, II.7. Throughout, E, F and G are Hilbert A-modules.

### 2.1 Adjoint pairs and automatic continuity

Define `IsAdjointPair T S`, for plain functions `T : E → F` and `S : F → E`, by
`⟨Tx, y⟩ = ⟨x, Sy⟩` for all x ∈ E and y ∈ F (Raeburn–Williams, Definition 2.17). Prove that each
function of an adjoint pair determines the other. Prove `adjointPair_exists_continuousLinearMaps`:
if E and F are complete and `IsAdjointPair T S`, then T and S are complex-linear and bounded and T
commutes with the right action of A. Linearity and A-linearity come from definiteness of the inner
product; boundedness then comes from the closed graph theorem. Consequently a bounded module map is
adjointable exactly when some function satisfies this identity with it, and bounded module maps
need not have such a function (§2.9).
*Needs:* Layer 1 (§1.1); Mathlib `CStarModule`, `LinearMap.continuous_of_isClosed_graph`.

**Checks.**

- For `A = ℂ` and `E = F = ℓ²(ℕ)`, an adjoint pair `(T, T)` is an everywhere-defined symmetric
  operator and the statement is the Hellinger–Toeplitz theorem. The analogue for an operator
  defined only on a dense subspace is false: multiplication by n on finitely supported sequences
  is symmetric and unbounded, so completeness and everywhere-definedness both matter.

### 2.2 The C*-algebra of adjointable maps

Build the spaces `L_A(E, F)` of adjointable maps, with addition, composition, adjoint, operator
norm and completeness, and prove the identities `‖T*‖ = ‖T‖`, `‖T*T‖ = ‖T‖²` and `(ST)* = T*S*`.
The second is `norm_adjoint_comp_self`, stated for any adjoint pair of bounded maps (Blackadar,
II.7). In particular `L_A(E)` is a unital C*-algebra, the zero module giving the zero algebra.
Give, in `L_A(E)`:

- positivity, with `T ≥ 0` if and only if `⟨x, Tx⟩ ≥ 0` in A for every x;
- square roots and the continuous functional calculus, through Mathlib's C*-algebra API once
  `L_A(E)` carries the C*-algebra instances;
- orthogonal projections, isometries and unitaries, and the equivalence of module unitaries
  (Convention 5) with invertible adjointable maps whose inverse is the adjoint;
- the natural action on E, and the forgetful map `L_A(E, F) → (E →L[ℂ] F)`, which is isometric
  and respects composition.

*Needs:* §2.1; Mathlib `CStarAlgebra`, `ContinuousLinearMap`, the continuous functional calculus.

### 2.3 Rank-one operators and module compact operators

For x ∈ F and y ∈ E construct `θ_(x,y) : E → F`, `z ↦ x⟨y, z⟩` (Raeburn–Williams,
Definition 2.24), and prove `θ_(x,y)* = θ_(y,x)`, `‖θ_(x,y)‖ ≤ ‖x‖‖y‖` and
`θ_(x,y) θ_(u,v) = θ_(x⟨y,u⟩, v)` whenever the modules match. Develop the closed spaces
`K_A(E, F)` (Convention 5): the two-sided composition ideal property
(`L_A(F, G) K_A(E, F) ⊆ K_A(E, G)` and `K_A(F, G) L_A(E, F) ⊆ K_A(E, G)`), closure under adjoints,
the matrix blocks of `K_A(E ⊕ F)`, and approximation by finite sums of rank-one maps.
*Needs:* §2.2.

**Checks.**

- `θ_(x,y) θ_(u,v) z = x⟨y, u⟨v, z⟩⟩ = x⟨y, u⟩⟨v, z⟩`, which is `θ_(x⟨y,u⟩, v) z`. For `A = E = ℂ`,
  `x = y = v = 1` and `u = i`, the composite is multiplication by `i = ⟨1, i⟩`, while the variant
  `θ_(x⟨u,y⟩, v)` is multiplication by `⟨i, 1⟩ = −i`.
- For `A = ℂ` and `E = F = ℂ²`, `θ_(e₁,e₂)` is the matrix unit `E₁₂`, sending `e₂` to `e₁`; the
  convention `z ↦ ⟨z, y⟩x` would be conjugate-linear in z.

### 2.4 Multipliers and the identifications for A and H_A

Prove that `K_A(E)` acts nondegenerately on E and that its approximate units converge on every
vector. Prove `L_A(E) ≅ M(K_A(E))` (Raeburn–Williams, Corollary 2.54), compatibly with Mathlib's
double-centralizer multiplier algebra `DoubleCentralizer`, and that on bounded sets its strict
topology is exactly pointwise norm convergence of both T and T* on E. Identify `K_A(A) ≅ A`
(sending `θ_(a,b)` to `ab*`), `L_A(A) ≅ M(A)` and `K_A(H_A) ≅ K ⊗min A`.
*Needs:* §§1.3–1.4, 1.6, 2.3; Mathlib `DoubleCentralizer`; CStarAlgebras C1.7 (multipliers and
the strict topology) and C5.1 (`⊗min`).

**Checks.**

- `θ_(a,b)(c) = a⟨b, c⟩ = ab*c`, so `θ_(a,b)` is left multiplication by `ab*`. In `M₂(ℂ)` with
  `a = E₁₂` and `b = E₁₁`, `ab* = 0` and indeed `θ_(a,b) = 0`, whereas the formula `a*b` would give
  `E₂₁ ≠ 0`.
- For `A = C₀(ℝ)`, `id_A ∈ L_A(A)` corresponds to the unit of `M(A) = C_b(ℝ)` and is not in
  `K_A(A) ≅ C₀(ℝ)`: the identity of a module need not be module-compact.

### 2.5 Module compact operators on H ⊗ A

For every complex Hilbert space H, including nonseparable H and `H = 0`, construct the isometric
*-isomorphism `K_A(H ⊗ A) ≅ K(H) ⊗min A` sending `θ_(ξ⊗a, η⊗b)` to `θ_(ξ,η) ⊗ ab*`. Prove density
of the finite-rank operators, the comparison with the spatial norm, naturality under unitaries of
Hilbert spaces and under *-homomorphisms of the coefficients, and the extension
`L_A(H ⊗ A) ≅ M(K(H) ⊗min A)`, with the strict topology on bounded sets. This specializes to the
comparison for `H_A` in §2.4.
*Needs:* §§1.7, 2.4; CStarAlgebras C5.1.

**Checks.**

- `θ_(ξ⊗a, η⊗b)(ζ ⊗ c) = ⟨η, ζ⟩ ξ ⊗ ab*c`, which is `(θ_(ξ,η) ⊗ ab*)(ζ ⊗ c)`. For `H = ℂ` the
  isomorphism is `K_A(A) ≅ A` of §2.4, and the `M₂(ℂ)` Check there separates `ab*` from `a*b`.

### 2.6 The scalar case

For `A = ℂ`, the right Hilbert ℂ-module structure of a complex Hilbert space H is Mathlib's
`WithCStarModule.instCStarModuleComplex`, whose inner product is the Hilbert-space inner product,
conjugate-linear in the first slot, transported along the commutative identification of ℂᵐᵒᵖ
with ℂ; prove that this transport is an identification of right modules. Prove
`L_ℂ(H) ≅ B(H)` and `K_ℂ(H) ≅ K(H)`, compatibly with adjoints (Mathlib's
`ContinuousLinearMap.adjoint`), the operator norm, rank-one operators, positivity, and the strict
and strong-* topologies on bounded sets. These are the scalar interfaces consumed by IndexTheory
and OperatorKTheory.
*Needs:* §§2.2–2.4; Mathlib `WithCStarModule.instCStarModuleComplex`,
`ContinuousLinearMap.adjoint`, `IsCompactOperator`.

**Checks.**

- For `H = ℓ²(ℕ)`, the identity lies in `L_ℂ(H) = B(H)` but not in `K_ℂ(H) = K(H)`; for finite-
  dimensional H the two spaces coincide.

### 2.7 Finitely generated projective modules and finite frames

Let A be unital. Prove that `id_E ∈ K_A(E)` if and only if E is finitely generated and projective
as an algebraic right A-module, and equivalently E is unitarily isomorphic to `pAⁿ` for a
projection `p ∈ Mₙ(A)` (Roe, Proposition 10.2). Construct finite Parseval frames `x₁, …, xₙ`, with
`Σ θ_(xᵢ,xᵢ) = id_E`, their analysis map `z ↦ (⟨xᵢ, z⟩)ᵢ` and synthesis map `(aᵢ) ↦ Σ xᵢaᵢ`, and the
projection/Gram-matrix comparison: for a Parseval frame the Gram matrix `p = (⟨xᵢ, xⱼ⟩)` is a
projection in `Mₙ(A)` and the analysis map is a unitary `E ≅ pAⁿ`.

Prove `exists_parseval_frame_iff_finite_projective`: for unital A and a complete right Hilbert
A-module E, a finite Parseval frame exists if and only if E is finitely generated and projective
as an algebraic right A-module; `n = 0` covers `E = 0`, and the zero algebra forces `E = 0`.
Prove that every finitely generated projective right A-module admits a complete Hilbert-module
structure, unique up to unitary isomorphism, and that every A-linear isomorphism between two such
Hilbert modules is adjointable with unitary polar part; construct it by the frame formulas. For
the compact-identity implication, a route approximates the identity by a finite sum of rank-one
maps within norm less than 1, factors through `Aⁿ`, and uses invertibility and positive square
roots to normalize a finite frame.
*Needs:* §§1.5, 2.2–2.3; Mathlib `Module.Finite`, `Module.Projective`, `CStarMatrix`.

**Checks.**

- For a projection `p ∈ A`, the module `pA` has the one-element frame `x₁ = p`:
  `θ_(p,p)z = pp*z = pz = z` for `z ∈ pA`. The element `1` is no frame of `pA` unless `p = 1`,
  since it does not lie in `pA`.
- In `Aⁿ` the standard basis is a Parseval frame, `Σ eᵢ⟨eᵢ, z⟩ = Σ eᵢzᵢ = z`, with Gram matrix the
  identity.
- For a Parseval frame, `(p²)ᵢₖ = Σⱼ ⟨xᵢ, xⱼ⟩⟨xⱼ, xₖ⟩ = ⟨xᵢ, Σⱼ xⱼ⟨xⱼ, xₖ⟩⟩ = ⟨xᵢ, xₖ⟩`, so the Gram
  matrix is idempotent; for a frame that is not Parseval (`x₁ = 2` in `A = ℂ`) it is `4`, not a
  projection.

### 2.8 Closed range and polar decomposition

Develop the closed-range theorem: for adjointable `T : E → F`, the range of T is closed if and only
if the range of T* is closed, and then `E = ker T ⊕ range T*` and `F = ker T* ⊕ range T`
orthogonally. Give the bounded generalized inverse and its projection identities. Prove that T
admits a polar decomposition `T = V|T|`, with V a partial isometry whose initial projection is the
projection onto `closure(range T*)` and whose final projection is the projection onto
`closure(range T)`, if and only if both these submodules are orthogonally complemented, and that
the decomposition with these support projections is unique (Liu–Luo–Xu, Theorem 3.8 and
Remark 3.11). For existence, a route proves `closure(range |T|) = closure(range T*)` and extends the
inner-product-preserving map `|T|x ↦ Tx` between the range closures, using the orthogonal
complements to extend it to all of E.
*Needs:* §§1.8, 2.2.

### 2.9 Failures of Hilbert-space intuition

Prove the following directly. In `A = C([0, 1])`, the ideal `J = {f : f(0) = 0}` has `J⊥ = 0` and
is proper, so its inclusion in A is bounded and A-linear but not adjointable. The operator
`(f, g) ↦ (g, 0)` on `A ⊕ J` is another such map. Multiplication by the coordinate function on A
has range closure J and fails the supported polar-decomposition criterion of §2.8. For an
infinite-dimensional unital A, `id_A = θ_(1,1)` is module compact and is not a compact operator
on the underlying Banach space.
*Needs:* §§1.8, 2.3, 2.8.

### Examples

For `A = ℂ` the theory is that of bounded and compact operators on Hilbert spaces (§2.6). For a
unital A, `Aⁿ` and the corners `pAⁿ` are exactly the modules with module-compact identity (§2.7).
`C([0, 1])` and its ideal of functions vanishing at 0 give bounded module maps without adjoints and
an operator without a polar decomposition (§2.9).

### Dependencies

Layer 1. Mathlib's closed graph theorem, `DoubleCentralizer`, `IsCompactOperator`,
`ContinuousLinearMap.adjoint` and `Module.Finite`/`Module.Projective`; CStarAlgebras C1.7 and C5.1.

## Layer 3: tensor products, induction, and imprimitivity

Raeburn–Williams, Chapters 2–3; Blackadar, II.7.

### 3.1 Interior tensor products

For a right Hilbert B-module E and a B–C correspondence `(F, φ)`, construct the interior tensor
product `E ⊗_B F`: equip the complex algebraic tensor product with the C-valued form
`⟨x ⊗ y, x′ ⊗ y′⟩_C = ⟨y, φ(⟨x, x′⟩_B) y′⟩_C`, prove that it is positive by the Gram-matrix lemma of
§1.1 (Raeburn–Williams, Lemma 2.65), quotient its null space and complete (§1.2). Prove the
balancing identities `xb ⊗ y = x ⊗ φ(b)y`, density of the elementary tensors, and the universal
property for balanced complex-bilinear maps bounded in this seminorm.
*Needs:* §§1.1–1.2, 2.2.

**Checks.**

- Let `B = Mₙ(ℂ)`, E the row vectors `M_(1,n)(ℂ)` with `⟨x, x′⟩ = x*x′ ∈ Mₙ(ℂ)`, and F the column
  vectors `M_(n,1)(ℂ)` with the left action of `Mₙ(ℂ)` and `⟨ξ, ξ′⟩ = ξ*ξ′ ∈ ℂ`. Then
  `⟨x ⊗ ξ, x′ ⊗ ξ′⟩ = ξ*x*x′ξ′ = conj(xξ)(x′ξ′)`, so the null space is the kernel of `x ⊗ ξ ↦ xξ`
  and `E ⊗_B F ≅ ℂ`, one-dimensional, while the algebraic tensor product has dimension `n²`.

### 3.2 Induced maps, associativity and units

Prove that left adjointable actions and adjointable maps in the first factor induce adjointable
maps on the tensor product, `T ↦ T ⊗ 1` with `(T ⊗ 1)* = T* ⊗ 1` and `‖T ⊗ 1‖ ≤ ‖T‖`, so that
`E ⊗_B F` is an A–C correspondence when E is an A–B correspondence. For an adjointable map S in
the second factor, include among the hypotheses that S intertwines the B-actions; then `1 ⊗ S` is
adjointable with the corresponding estimates. Prove the associating unitaries
`(E ⊗_B F) ⊗_C G ≅ E ⊗_B (F ⊗_C G)`, pentagon coherence, and the unit unitaries `E ⊗_B B ≅ E`
(`x ⊗ b ↦ xb`) and `B ⊗_B F ≅ F` (`b ⊗ y ↦ φ(b)y`), the second for a nondegenerate action.
*Needs:* §§1.3, 3.1.

**Checks.**

- `⟨x ⊗ b, x′ ⊗ b′⟩ = b*⟨x, x′⟩b′ = ⟨xb, x′b′⟩`, so `x ⊗ b ↦ xb` preserves inner products.
- For `B = F = ℂ` with the zero action `φ = 0`, every inner product in `B ⊗_B F` vanishes and
  `B ⊗_B F = 0 ≠ F`: nondegeneracy cannot be dropped from the second unit unitary.

### 3.3 External tensor products and coefficient quotients

Construct the external spatial tensor product `E ⊗ E′` of a Hilbert B-module and a Hilbert
B′-module, a Hilbert `B ⊗min B′`-module with `⟨x ⊗ x′, y ⊗ y′⟩ = ⟨x, y⟩ ⊗ ⟨x′, y′⟩`, the interchange
unitary between external products of interior products and interior products of external
products, and its compatibility with module-compact operators. For a closed ideal J of the
coefficient algebra C of a B–C correspondence F, prove the interior quotient unitary
`(E ⊗_B F)/(E ⊗_B F)J ≅ E ⊗_B (F/FJ)`. For external spatial products, identify the quotient by
`B ⊗min J` with the external product of the quotient `E′/E′J` only when the other coefficient
algebra B is exact, using CStarAlgebras C7.1 and C9.7; this is not imposed as an unrestricted
tensor permanence.
*Needs:* §§1.9, 2.3, 3.2; CStarAlgebras C5.1, C7.1, C9.7.

### 3.4 Induced representations and state localization

A nondegenerate representation `π : B → B(H_π)` (Tau Ceti's `NonUnitalStarAlgHom.IsNondegenerate`)
gives the induced Hilbert space `E ⊗_B H_π`, and any algebra acting on E by adjointable operators
gets an induced representation on it. Prove nondegeneracy of the induced representation under
nondegeneracy of that action, functoriality on bounded intertwiners, induction in stages, and
compatibility with direct sums. For a state ω of A and a Hilbert A-module E, identify the state
localization, the completion of E modulo `{x : ω(⟨x, x⟩) = 0}` with inner product `ω(⟨x, y⟩)`,
with `E ⊗_A H_ω`, through `x ↦ x ⊗ ξ_ω` for the cyclic GNS vector `ξ_ω`.
*Needs:* §§3.1–3.2; Tau Ceti `NonUnitalStarAlgHom.IsNondegenerate`; Mathlib
`PositiveLinearMap.GNS`, `PositiveLinearMap.gnsStarAlgHom`; VonNeumannAlgebras V0 (states).

**Checks.**

- `⟨x ⊗ ξ_ω, y ⊗ ξ_ω⟩ = ⟨ξ_ω, π_ω(⟨x, y⟩)ξ_ω⟩ = ω(⟨x, y⟩)`, so the localization map is isometric,
  and `xa ⊗ ξ_ω = x ⊗ π_ω(a)ξ_ω` shows that its range is dense.

### 3.5 Imprimitivity bimodules and strong Morita equivalence

Define an A–B imprimitivity bimodule as a full right Hilbert B-module E with a specified
*-isomorphism `A ≅ K_B(E)`. Construct its left inner product `_A⟨x, y⟩` by pulling back
`θ_(x,y)`; it is linear in its first variable. Prove the equivalence with the definition by two
full inner products and the compatibility identity `_A⟨x, y⟩z = x⟨y, z⟩_B`. Develop the conjugate
B–A module E*, interior products of imprimitivity bimodules, and the evaluation unitaries
`E ⊗_B E* ≅ A`, `x ⊗ ȳ ↦ _A⟨x, y⟩`, and `E* ⊗_A E ≅ B`, `x̄ ⊗ y ↦ ⟨x, y⟩_B`, with their associativity
compatibilities. Prove that strong Morita equivalence, the existence of an imprimitivity bimodule,
is an equivalence relation, and that induction along E is an equivalence of the categories of
nondegenerate representations, with inverse induction along E* (Raeburn–Williams, Chapter 3).
*Needs:* §§2.3–2.4, 3.2, 3.4.

**Checks.**

- `ℂⁿ` is an `Mₙ(ℂ)`–ℂ imprimitivity bimodule with `_A⟨x, y⟩ = xy*`, and
  `_A⟨x, y⟩z = x(y*z) = x⟨y, z⟩` holds. The variant `yx*`, linear in the second variable, fails it:
  for `x = e₁`, `y = e₂`, `z = e₁`, `x⟨y, z⟩ = 0` while `yx*z = e₂`.

### 3.6 Linking algebras and full corners

Construct the linking algebra `K_B(E ⊕ B)` with its explicit 2 × 2 corner multiplication and
involution. For an imprimitivity bimodule its diagonal corners identify with A and B and its
off-diagonal corners with E and E*. Prove the full-corner characterization: A and B are strongly
Morita equivalent if and only if they are complementary full corners of a C*-algebra, the corner
projections being allowed in its multiplier algebra (Raeburn–Williams, Theorem 3.19).
*Needs:* §§2.4, 3.5; CStarAlgebras C1.7.

**Checks.**

- For `E = ℂⁿ` over `B = ℂ`, the linking algebra is `K(ℂⁿ⁺¹) = Mₙ₊₁(ℂ)`, with corners `Mₙ(ℂ)`, ℂ,
  the columns `ℂⁿ` and the rows; the projections `diag(1ₙ, 0)` and `diag(0, 1)` are complementary
  and full.

### 3.7 The Rieffel correspondence and Morita invariants

Prove the Rieffel correspondence (Raeburn–Williams, Theorem 3.22, Proposition 3.24 and
Corollaries 3.31–3.33). For a closed ideal J of B the corresponding ideal of A is
`closure(span _A⟨EJ, E⟩)`. Give the inverse, the lattice operations, the common submodule
`closure(IE) = closure(EJ)`, and the induced imprimitivity bimodules for the ideals and the
quotients. Prove `ker(Ind_E π) = Ind_E(ker π)`, preservation of irreducibility, and the Rieffel
homeomorphism `Prim(B) ≅ Prim(A)` with its restriction to the ideal and quotient spectra. Deduce
Morita invariance of simplicity, of being CCR, of being type I, of nuclearity and of exactness,
supplying the full-corner approximation arguments for the last two. Here A is CCR when
`π(A) = K(H_π)` for every irreducible representation π, and type I when `π(A) ⊇ K(H_π)` for every
irreducible π. σ-unitality of one algebra is not inferred from Morita equivalence with a σ-unital
algebra.
*Needs:* §§3.4–3.6; CStarAlgebras §2.6 (primitive spectra), C6.1–C6.2 (nuclearity), C7.1
(exactness).

**Checks.**

- For a nonseparable Hilbert space H, `K(H)` is Morita equivalent to ℂ through the imprimitivity
  bimodule H, and is simple and CCR as ℂ is; it is not σ-unital, while ℂ is unital.

### 3.8 The finite-factor comparison

Construct the comparison with the normal Hilbert modules of
[VonNeumannAlgebras](../VonNeumannAlgebras/README.md) V7.StandardAmplifications (Hilbert spaces
carrying a normal unital representation of a finite factor N, with a right action recorded as a
left action of the opposite algebra) by interior tensoring with a GNS representation. For a finite
factor M with faithful normal tracial state τ and a right Hilbert M-module E, the model is the
Hilbert space `E ⊗_M L²(M, τ)`: its commuting right M-action is inherited from the right action of
M on the tracial `L²(M, τ)`, which makes it a normal representation of the opposite algebra,
transported to the sidedness convention of V7.StandardAmplifications. The second-factor
intertwiners of §3.2 and the elementary-tensor coefficient formula give the construction. Prove
normality of this representation in the sense of VonNeumannAlgebras V4.Normality (a left action
induced on `E ⊗_M L²(M, τ)` from an arbitrary left action on E is not asserted to be normal), and
identify the induced intertwiners and the tensor associators. Dimension theory stays with the
normal modules of V7.StandardAmplifications; Layer 7's localization applies to this model.
*Needs:* §§3.2, 3.4; VonNeumannAlgebras V0, V4.Normality, V7.StandardAmplifications.

### Examples

`Mₙ(ℂ)` and ℂ are Morita equivalent through `ℂⁿ`, with linking algebra `Mₙ₊₁(ℂ)` (§§3.5–3.6);
`E ⊗_B B ≅ E` for every E, and balancing collapses `M_(1,n) ⊗ M_(n,1)` over `Mₙ(ℂ)` to ℂ (§3.1).
For nonseparable H, `K(H)` and ℂ are Morita equivalent, one σ-unital and the other not (§3.7).

### Dependencies

Layers 1–2. Tau Ceti's nondegenerate representations; Mathlib's GNS construction; CStarAlgebras
C1.7, §2.6, C5.1, C6.1–C6.2, C7.1 and C9.7; VonNeumannAlgebras V0, V4.Normality and
V7.StandardAmplifications.

## Layer 4: countable generation and stabilization

Raeburn–Williams, Chapter 5 (Theorem 5.49, Proposition 5.50 and Theorem 5.55 for stabilization;
Corollary 5.56 for stable classification).

### 4.1 Countable generation and σ-unitality

A Hilbert A-module E is *countably generated* when a countable subset generates it after right
multiplication, complex linear span and norm closure. Prove that this is equivalent to
σ-unitality of `K_A(E)`: construct a strictly positive element of `K_A(E)` from a normalized
generating sequence, and conversely recover a countable generating set from an approximate
identity. Prove that an adjointable map `E → F` with dense range whose adjoint also has dense range
induces a module unitary `E ≅ F`; construct the unitary through the positive-operator
approximation argument, with its domain and convergence statements.
*Needs:* §§1.3, 2.3–2.4, 2.8; CStarAlgebras C1.4.

**Checks.**

- As a module over itself, A is countably generated exactly when A is σ-unital, since
  `K_A(A) ≅ A` (§2.4). For a nonseparable Hilbert space H, `A = K(H)` is not σ-unital, so it is not
  countably generated over itself.

### 4.2 Kasparov stabilization

Prove Kasparov stabilization for every C*-algebra A and every countably generated Hilbert
A-module E: `E ⊕ H_A ≅ H_A`. Build the required dense-range adjointable maps and repeated weighted
generating sequences, and exhibit E as an orthogonally complemented submodule of `H_A`. Conversely,
every orthogonally complemented submodule of `H_A` is countably generated when A is σ-unital. Keep
this qualification: `H_A` itself need not be countably generated for arbitrary A.
*Needs:* §§1.6, 1.8, 4.1.

**Checks.**

- For `E = Aⁿ` the unitary is the shift `((a₁, …, aₙ), (bₖ)) ↦ (a₁, …, aₙ, b₀, b₁, …)`.
- For `A = K(H)` with H nonseparable, `H_A` contains A as a complemented summand, which is not
  countably generated (§4.1), so `H_A` is not countably generated.

### 4.3 Full modules, ℓ²(E) and the Brown–Green–Rieffel theorem

For σ-unital A and a full Hilbert A-module E, prove that the Hilbert direct sum `ℓ²(E)` of
countably many copies of E contains A as an orthogonally complemented summand; if E is also
countably generated, prove `ℓ²(E) ≅ H_A`. Construct the sequence of module vectors whose inner
products sum strictly to 1 in `M(A)`. Deduce the Brown–Green–Rieffel theorem: for σ-unital
C*-algebras A and B, A is strongly Morita equivalent to B if and only if `A ⊗min K ≅ B ⊗min K`.
Stable isomorphism implies Morita equivalence without σ-unitality. Construct the stable
isomorphism from an imprimitivity bimodule, and prove compatibility with a common central
`C₀(X)`-action when the bimodule respects it. Use `K(H)` for nonseparable H, Morita equivalent to ℂ
but not σ-unital, to show why σ-unitality is not an unrestricted Morita invariant.
*Needs:* §§2.5, 3.5–3.6, 4.1–4.2; CStarAlgebras C5.1.

**Checks.**

- `Mₙ(ℂ) ⊗min K ≅ K ≅ ℂ ⊗min K`, matching the Morita equivalence of §3.5.
- For a nonseparable H, `K(H) ⊗min K ≅ K(H ⊗ ℓ²)` is not isomorphic to `K = ℂ ⊗min K`, since
  `K(H′) ≅ K(H″)` forces H′ and H″ to have the same Hilbert dimension; yet `K(H)` and ℂ are Morita
  equivalent, so the σ-unitality hypothesis cannot be dropped from the forward implication.

### Examples

Every finitely generated module `Aⁿ`, and every complemented submodule of `H_A`, is absorbed by
`H_A` (§4.2); `Mₙ(ℂ)` and ℂ are stably isomorphic, while `K(H)` for nonseparable H is Morita
equivalent to ℂ without being stably isomorphic to it (§4.3).

### Dependencies

Layers 1–3; CStarAlgebras C1.4 and C5.1.

## Layer 5: continuous fields, continuous trace, and Dixmier–Douady theory

Work over locally compact Hausdorff spaces X. Raeburn–Williams, Chapters 4–6; Williams, *Crossed
Products of C*-Algebras*, Appendix C; Dixmier–Douady.

### 5.1 C₀(X)-algebras and upper semicontinuous bundles

A `C₀(X)`-algebra is a C*-algebra A with a nondegenerate *-homomorphism `C₀(X) → Z(M(A))`. Develop
the fibres `A_x = A/closure(C₀(X∖{x})A)`, restriction to open and closed subsets, the quotient
norms and upper semicontinuity of `x ↦ ‖a(x)‖`. Construct the upper semicontinuous C*-bundle whose
total space is the disjoint union of the fibres: specify a continuous open surjection to X,
C*-algebra fibres, an upper semicontinuous norm on the total space, continuous involution, addition
and multiplication on the fibre product, and continuous scalar multiplication, and require the
zero-convergence axiom (if base points converge to x and fibre norms tend to 0, the elements
converge to `0_x`). The total space of an upper semicontinuous bundle need not be Hausdorff;
construct its topology from the sections coming from A and fibre-norm neighbourhoods. Prove its
enough-sections property (each fibre value extends to a continuous section) and the isometric
`C₀(X)`-linear identification of A with the algebra `Γ₀` of sections vanishing at infinity. Construct
the converse from these axioms and enough sections, and identify its quotient fibres. Prove the
section-to-bundle theorem for a *-algebra of fibrewise dense sections with upper semicontinuous
norm functions, including uniqueness of the topology (Williams, Appendix C, Definitions C.16 and
C.21 and Theorems C.25–C.26). Distinguish a continuous field, for which the norm on the total space
is continuous, from a general `C₀(X)`-algebra, and prove that continuity is equivalent to openness
of the map `Prim(A) → X`. Use the Dauns–Hofmann action when X is the Hausdorff primitive spectrum.
*Needs:* Layer 1; Mathlib `ZeroAtInftyContinuousMap`, `DoubleCentralizer`; CStarAlgebras C1.3,
C1.7, §2.6 (primitive spectra), C2.7 (Dauns–Hofmann).

### 5.2 The commutative fibre example (H5.CommutativeFiberExample)

For a continuous surjection `h : Y → X` between compact Hausdorff spaces, view `C(Y)` as a
`C(X)`-algebra through `h*`. Prove that its fibre at x is canonically `C(h⁻¹{x})`, by restriction,
with kernel the closed ideal generated by the pullbacks of the functions vanishing at x. Prove
surjectivity of restriction by continuous extension from that closed fibre, the quotient norm
formula `‖f_x‖ = sup_(y∈h⁻¹{x}) |f(y)|`, and naturality under commuting maps of such compact spaces.
The fibre-norm functions are upper semicontinuous; prove that they are continuous for every f if
and only if h is open. In the reverse direction use functions supported inside a chosen open
subset of Y to show that its image is open. Include the empty-space case. This direct commutative
calculation is proved here from Mathlib's description of the closed ideals of `C(Y)` for compact
Hausdorff Y by their open vanishing sets (`ContinuousMap.idealOfSet`,
`ContinuousMap.idealOfSet_ofIdeal_eq_closure`), which identifies the closure of the ideal generated
by the pullbacks with the functions vanishing on `h⁻¹{x}`, and from the Tietze extension theorem
(`ContinuousMap.exists_restrict_eq`) for surjectivity of restriction. It precedes the general
primitive-spectrum criterion of §5.1; compare the two criteria afterwards on this same algebra.
*Needs:* §5.1 for the vocabulary only; Mathlib `ContinuousMap.idealOfSet`,
`ContinuousMap.idealOfSet_ofIdeal_eq_closure`, `ContinuousMap.exists_restrict_eq`.

**Checks.**

- A continuous surjection between compact spaces alone does not give a continuous field: for
  `Y = [0, 1] ⊔ {p}` mapping onto `X = [0, 1]` by the identity on `[0, 1]` and `p ↦ 0`, the
  indicator function of p has fibre norm 1 at 0 and 0 at every other point. Here h is not open,
  since the open set `{p}` has image `{0}`.
- For `h` the identity of X, every fibre is ℂ and the fibre norm of f is `|f(x)|`, continuous.

### 5.3 Hilbert C₀(X)-modules and continuous Hilbert fields

For a Hilbert `C₀(X)`-module E, construct the Hilbert-space fibres `E_x`, as the quotients of §1.9 by
the ideal of functions vanishing at x, the continuous field they form with the sections
`x ↦ ξ(x)`, and the unitary `E ≅ Γ₀(X, (E_x))`. Build the converse from a continuous Hilbert field
specified by Hilbert fibres and a `C(X)`-module Γ of sections satisfying: every norm function
`x ↦ ‖ξ(x)‖` for `ξ ∈ Γ` is continuous; every fibre vector is the value of a section in Γ; and a
section locally uniformly approximable by Γ belongs to Γ (Dixmier–Douady, Definition 1). Prove the
construction from a generating complex vector space of sections with continuous norm functions and
merely dense evaluations by taking its local uniform closure (Dixmier–Douady, Proposition 3).
Prove continuity of inner products by polarization (Dixmier–Douady, §9), and construct the
total-space topology with continuous norm and inner product. Give `Γ₀` its supremum norm and
pointwise `C₀(X)`-action, prove completeness, and prove reconstruction in both directions,
including the quotient-fibre identifications; a `C(X)`-module with a continuous, definite,
subadditive and `C(X)`-homogeneous norm function is the module of continuous sections of a
continuous field exactly when it is complete for local uniform convergence (Dixmier–Douady,
Proposition 4). In the module-to-field direction form Γ by local uniform completion of E's
sections, prove that it is a `C(X)`-module, and use compactly supported cutoffs to recover E as
`Γ₀`; a `C(X)`-module reconstruction theorem is not applied directly to the `C₀(X)`-module E.
Fullness holds exactly when every fibre is nonzero; zero fibres are permitted. Prove that the field
of module-compact operators has fibres `K(E_x)`, with the rank-one section formula, and identify
`K(E)` with its continuous sections vanishing at infinity. These fields need not be locally trivial
and their fibre dimensions may vary.

For continuous finite-rank Hermitian vector bundles use the bundle category of
[TopologicalKTheory](../TopologicalKTheory/README.md) T1: over compact X, identify their continuous
section modules with the finitely generated projective modules of §2.7, including morphisms, tensor
products and pullbacks. This is the analytic section-module comparison; group completion and
K-theoretic Bott maps belong to TopologicalKTheory and OperatorKTheory.
*Needs:* §§1.9, 2.3–2.4, 2.7, 3.2, 5.1; TopologicalKTheory T1 (items 1–3).

**Checks.**

- For an open `U ⊆ X`, `E = C₀(U)` is a Hilbert `C₀(X)`-module with fibre ℂ at points of U and 0
  elsewhere; it is full exactly when `U = X`, as the fibre criterion says.

### 5.4 The torus line modules (H5.TorusLineSections)

Let `T² = AddCircle (1 : ℝ) × AddCircle (1 : ℝ)` and `A = C(T², ℂ)`, with orientation `ds ∧ dt`
on its period-one coordinates. For k ∈ ℤ construct the Hermitian line bundle `L_k` as the lattice
quotient of `ℝ² × ℂ` by `(m, n)·(s, t, z) = (s + m, t + n, exp(2πikns)z)`. Verify the action law
using the integer phase `exp(2πiknm) = 1`, freeness and properness of the base action, and local
lift charts on rectangles of side length less than 1. Build the resulting bundle with
TopologicalKTheory T1's bundle-core carrier `TauCeti.FiniteRankBundleCore`, its transition maps and
the Hermitian metric `|z|²`. Its continuous section module is precisely

    M_k = {v ∈ C(ℝ², ℂ) : v(s + 1, t) = v(s, t), v(s, t + 1) = exp(2πiks) v(s, t)}.

Construct this section/covariant-function equivalence, the right A-action by pullback from T², and
the descending inner product `⟨v, w⟩([s, t]) = conj(v(s, t)) w(s, t)`. Prove that the norm is
`sup_([0,1]²) |v|`, independent of the fundamental rectangle, and that `M_k` is complete and full.
Consume §2.7 and the section-module comparison of §5.3 to produce a finite Parseval frame `σᵢ`, the
actual projection `pᵢⱼ = ⟨σᵢ, σⱼ⟩ ∈ M_N(A)` and the unitary `M_k ≃ pA^N`. Verify `rank p(x) = 1` for
every x. Identify the module-compact endomorphisms with A by their scalar fibre action, carrying
`Θ_(v,w)` to `⟨w, v⟩`.
*Needs:* §§2.7, 5.3; TopologicalKTheory T1; Tau Ceti `TauCeti.FiniteRankBundleCore`; Mathlib
`AddCircle`.

**Checks.**

- The action law: applying `(m, n)` and then `(m′, n′)` multiplies z by
  `exp(2πikns) exp(2πikn′(s + m))`, which equals `exp(2πik(n + n′)s)` because `kn′m ∈ ℤ`.
- `Θ_(v,w)u = v⟨w, u⟩ = v·conj(w)·u` pointwise, so the scalar function is `conj(w)v = ⟨w, v⟩`; the
  formula `⟨v, w⟩ = conj(v)w` gives its complex conjugate, which differs as soon as `v·conj(w)` is
  not real-valued.
- For `k = 0`, `M_0 = A` with the one-element frame `{1}`.

### 5.5 Smooth structure, curvature and classification of the torus lines

The lattice cocycles of §5.4 are smooth. Construct the smooth line structure with
[SmoothBundlesConnections](../SmoothBundlesConnections/README.md) B1.3 (smooth bundles from smooth
cocycles) and its dense smooth section module, and prove that the connection descends from
`∇_s v = ∂_s v − 2πikt v` and `∇_t v = ∂_t v`. Verify both lattice transformation laws for both
derivatives, the A-Leibniz and Hermitian identities, and `[∇_s, ∇_t]v = 2πikv`, so that the
curvature is `F = 2πik ds ∧ dt`. Use SmoothBundlesConnections B3.3 (the induced rank-one connection)
and B6.3 (rank-one Chern–Weil) and [DifferentialGeometry](../DifferentialGeometry/README.md) §5.2
(integration of top forms on an oriented manifold), with `∫_T² ds ∧ dt = 1`, to prove
`⟨c₁(L_k), [T²]⟩ = −k` in [CharacteristicClasses](../CharacteristicClasses/README.md)'
normalization `c₁(L) = [iF/(2π)]`. The statement is proved by the displayed computations, as the
determinant computation of §5.7 is: the action law is the integer-phase identity, the
transformation laws of `∇_s`, `∇_t` and the commutator are direct differentiation of the displayed
formulas, and the Chern number is the displayed integral, whose only external inputs are
SmoothBundlesConnections B6.3's rank-one Chern–Weil identity and DifferentialGeometry §5.2. Keep
this line class distinct from the principal-circle class of SmoothBundlesConnections B6.2, which is
defined through the dual-character line; the line associated to the standard character has the
opposite principal-class sign.

Prove that `M_k` is free if and only if `k = 0`, and that `M_k ≃ M_l` as A-modules if and only if
`k = l`, by these classes, CharacteristicClasses C1.6's classification of complex line bundles by
the first Chern class (Hatcher, *Vector Bundles and K-Theory*, Proposition 3.10) and the explicit
zero-twist model. Construct the unitary tensor and dual comparisons `M_k ⊗_A M_l ≃ M_(k+l)`, by
multiplication of covariant functions using the explicit commuting pointwise left A-action on
`M_l`, and `M_(−k) ≃ M_k*` (the module dual), by `v ↦ (w ↦ vw)`, and prove the Hermitian-dual and
connection/curvature comparisons. The tensor product is Layer 3's interior tensor product; no
second tensor completion is introduced.

`M_k` is an ordinary section module of the commutative torus, constructed separately from the
θ ≠ 0 Schwartz imprimitivity model of [HeisenbergImprimitivity](HeisenbergImprimitivity/README.md)
§6.3. The generic bundle and connection theory stays with TopologicalKTheory T1 and
SmoothBundlesConnections; K-group calculations stay with TopologicalKTheory and OperatorKTheory.
*Needs:* §§3.2, 5.4; SmoothBundlesConnections B1.3, B3.3, B6.2, B6.3; DifferentialGeometry §5.2;
CharacteristicClasses C1.6 and its normalization of Chern classes.

**Checks.**

- `∇_s` preserves the second covariance law: for `v ∈ M_k`,
  `(∇_s v)(s, t + 1) = ∂_s(e^(2πiks)v) − 2πik(t + 1)e^(2πiks)v = e^(2πiks)(∂_s v − 2πikt v)`.
  Dropping the term `−2πikt v` breaks this law by the summand `2πik e^(2πiks) v`.
- `[∇_s, ∇_t]v = ∂_s∂_t v − 2πikt ∂_t v − ∂_t∂_s v + 2πik v + 2πikt ∂_t v = 2πikv`, so
  `iF/(2π) = −k ds ∧ dt` and the Chern number is −k; the normalization `c₁ = [F/(2πi)]` would give
  +k.
- For `v ∈ M_k` and `w ∈ M_l`, `(vw)(s, t + 1) = exp(2πi(k + l)s)(vw)(s, t)`, so `vw ∈ M_(k+l)`;
  for `v ∈ M_(−k)` and `w ∈ M_k`, `vw` is doubly periodic, an element of A.

### 5.6 The torus modules Γ_(a,b) (H5.TorusFiniteRankSections)

For a ∈ ℤ and an integer b ≥ 1, construct the averaged torus module

    Γ_(a,b) = {ξ ∈ C(ℝ², ℂ) : ξ(r + 1, s) = ξ(r, s), ξ(r, s + b) = exp(2πiar) ξ(r, s)}.

Its right action of `A = C(T², ℂ)` is pointwise multiplication by period-one functions, and its
inner product is `⟨ξ, η⟩([r, s]) = (1/b) Σ_(j=0..b−1) conj(ξ(r, s + j)) η(r, s + j)`. Prove
continuity and period-one descent of this average in both variables, positivity, definiteness,
the A-module identities, and completeness for its supremum norm. In particular the norm is the
supremum over `[0, 1]²` of the square root of the averaged sum of `|ξ|²`, not the scalar supremum
norm on the unbounded plane. There is no coprimality assumption on a and b.

Construct the Hermitian rank-b bundle `E_(a,b)` by the vector coordinates
`F_ξ(r, s) = (ξ(r, s), …, ξ(r, s + b − 1))`. Their transition laws are `F(r + 1, s) = F(r, s)` and
`F(r, s + 1) = C_a(r)F(r, s)`, where `C_a(r)(z₀, …, z_(b−1)) = (z₁, …, z_(b−1), exp(2πiar)z₀)`.
Verify that this is a unitary transition for the fibre metric `(1/b) Σ conj(zⱼ)wⱼ`, construct local
lift charts on T² with TopologicalKTheory T1's bundle carrier, and prove that the first coordinate
recovers ξ from every covariant F. This yields the onto unitary section-module comparison
`Γ_(a,b) ≃ Γ(T², E_(a,b))`, including its inverse and independence of lifts. Equivalently, construct
`E_(a,b)` as the fibrewise direct sum of the line over the b points of the covering
`q_b : (ℝ/ℤ) × (ℝ/bℤ) → T²`, with line transition `ξ(r, s + b) = exp(2πiar)ξ(r, s)` and the averaged
metric; prove this comparison on the local sheets of `q_b`, with no K-theoretic transfer assumed.
Use §2.7 and §5.3's section-module theorem to obtain fullness, a finite Parseval frame, the actual
projection `p ∈ M_N(A)` and `Γ_(a,b) ≃ pA^N`, with `rank p(x) = b` for every x. Identify its
adjointable and module-compact endomorphisms with `Γ(T², End(E_(a,b)))` and their fibre adjoints.
*Needs:* §§2.7, 5.3; TopologicalKTheory T1; Tau Ceti `TauCeti.FiniteRankBundleCore`.

**Checks.**

- `F(r, s + 1) = (ξ(r, s + 1), …, ξ(r, s + b))`, and `ξ(r, s + b) = exp(2πiar)ξ(r, s)`, which is the
  displayed `C_a(r)`.
- For `a = 0` and `b = 3`, the functions `ξ_k(r, s) = exp(2πiks/3)`, `k = 0, 1, 2`, satisfy
  `⟨ξ_j, ξ_k⟩ = δ_jk` for the averaged inner product; their unaveraged pointwise product
  `conj(ξ_0)ξ_1 = exp(2πis/3)` is not even period-one in s, so the average is what makes the
  inner product descend to T².

### 5.7 Determinants and the classification of projective C(T²)-modules

Compute `det C_a(r) = (−1)^(b−1) exp(2πiar)`. Trivialize the constant-phase factor to give an
actual determinant-line isomorphism `det E_(a,b) ≃ L_a`; hence its Chern number is −a in the
orientation and normalization of §5.5. Prove the following unstable classification. Give T² the
finite two-dimensional CW structure of the CW product of two circles
([AlgebraicTopology](../AlgebraicTopology/README.md) §4.5, Tau Ceti's `TauCeti.cwComplexProd`). For
every complex rank-b bundle E on T² with b ≥ 2, obtain a nowhere-zero section from
TopologicalKTheory T1.5's section-extension theorem on finite-dimensional CW pairs, applied to the
bundle of surjections `E → ℂ`, which a Hermitian metric (T1.3) identifies with the bundle of nonzero
vectors: its fibre `ℂ^b ∖ 0 ≃ S^(2b−1)` is (2b−2)-connected (T1.5a, from Tau Ceti's
`TauCeti.subsingleton_homotopyGroup_sphere_of_lt`), hence at least 2-connected when b ≥ 2, so a
section over the empty subcomplex extends across the 1- and 2-cells. For b = 1 the fibre is
`ℂ ∖ 0 ≃ S¹` and the extension across 2-cells can fail, as `L_k` with k ≠ 0 shows. Then use the
Hermitian orthogonal complement to split off a trivial line, and iterate to split off b − 1 trivial
lines; T1.1's local trivializations and T1.4's homotopy invariance enter these steps.
CharacteristicClasses C1.6 classifies the remaining line by its first Chern class. Thus every
rank-b bundle on T² is isomorphic to `1^(b−1) ⊕ det E`, and in particular
`E_(a,b) ≃ 1^(b−1) ⊕ L_a`. This is a bundle isomorphism before group completion. Use §2.7's polar
normalization to obtain the corresponding Hilbert-module unitary.

Every nonzero finitely generated projective right A-module is therefore isomorphic to exactly one
`Γ_(a,b)`, with b ≥ 1 and a ∈ ℤ; two such modules are isomorphic if and only if both parameters
agree. Include the zero module separately: it has rank 0 and Chern number 0, and there is no
averaged formula `Γ_(a,0)`. Prove `Γ_(a,1) ≃ M_a`, `Γ_(a,b) ≃ A^(b−1) ⊕ M_a`, and that `Γ_(a,b)` is
free if and only if a = 0. For a = 0 exhibit the orthonormal A-basis `ξ_k(r, s) = exp(2πiks/b)`,
`0 ≤ k < b`, for the averaged inner product. Construct the direct-sum, dual and balanced-tensor
comparison unitaries, with the commuting pointwise left A-action explicit for tensors:
`Γ_(a,b) ⊕ Γ_(c,d) ≃ Γ_(a+c, b+d)`, `Γ_(a,b)* ≃ Γ_(−a,b)` and
`Γ_(a,b) ⊗_A Γ_(c,d) ≃ Γ_(da+bc, bd)` for b, d ≥ 1. Derive cancellation for these projective modules
from rank and determinant. These are module and bundle results; the resulting K-group and ring
calculations stay with TopologicalKTheory and OperatorKTheory. The hypotheses are an integer a and
a positive integer b, with no coprimality assumption. The line classification used is Hatcher,
*Vector Bundles and K-Theory*, Proposition 3.10: the first Chern class is an isomorphism from
isomorphism classes of complex line bundles to `H²(X; ℤ)` for X of the homotopy type of a CW
complex; §§1.1–1.2 of the same text give the bundle background.
*Needs:* §§2.7, 3.2, 5.5–5.6; TopologicalKTheory T1 (items 1, 3, 4, 5 and T1.5a);
CharacteristicClasses C1.6; AlgebraicTopology §4.5; Tau Ceti `TauCeti.cwComplexProd`,
`TauCeti.subsingleton_homotopyGroup_sphere_of_lt`.

**Checks.**

- `C_a(r)` is a cyclic shift of b coordinates with one entry multiplied by `exp(2πiar)`, so its
  determinant is the sign `(−1)^(b−1)` of a b-cycle times `exp(2πiar)`; multiplying sections of the
  determinant line by `exp(−πi(b−1)s)` removes the sign, giving the transition of `L_a`.
- Ranks and Chern numbers add under direct sum and satisfy `c₁(E ⊗ F) = rk(F)c₁(E) + rk(E)c₁(F)`
  under tensor product; for `Γ_(1,2) ⊗_A Γ_(1,3)` this gives rank 6 and parameter
  `3·1 + 2·1 = 5`, as `Γ_(da+bc, bd)` says, while the product `ac = 1` of the parameters would not.
- For b = 1 the averaged inner product is the pointwise one and the covariance laws are those of
  `M_a` with `(r, s)` in place of `(s, t)`: `Γ_(a,1) = M_a`.

### 5.8 The unitary dual, the trace and continuous trace

Construct the unitary dual Â as pure states modulo unitary equivalence of their cyclic GNS
representations, using [CStarAlgebras](../CStarAlgebras/README.md) C2.2's correspondence between
pure states and irreducible GNS representations. This gives a small carrier without quantifying
over a universe of arbitrary Hilbert spaces. Prove independence of the cyclic representative, and
equip Â with the topology induced by `[π] ↦ ker π` into `Prim(A)`; describe closed hulls and the
restrictions to ideals and quotients. Prove that this kernel map is surjective, and a homeomorphism
for CCR algebras. For positive operators use the extended positive trace `Tr` on `B(H)` of
VonNeumannAlgebras V4.Core, including nonseparable H, and prove its invariance under unitary
equivalence and its compatibility with rank-one operators. Thus `[π] ↦ Tr(π(a))` is well defined
in `ℝ≥0∞` for positive a.

Use this unitary dual to formulate Fell's condition: each `[π]` has a neighbourhood U and a
positive `a ∈ A` such that `ρ(a)` is a rank-one projection for every `[ρ] ∈ U`. A has *continuous
trace* when Â is Hausdorff and this condition holds (Raeburn–Williams, Definition 5.13). Prove that
such A is CCR, identify Â with `Prim(A)`, and prove equivalence with density of `m(A)`, the linear
span of the positive a for which `[π] ↦ Tr(π(a))` is finite and continuous. Prove that this span is
an ideal whose positive elements are precisely those positive a, and build its linear and ideal
operations and the local cutoffs needed in the equivalence; it is not assumed that every positive
element has finite trace.
*Needs:* §3.7 (CCR); Mathlib `PositiveLinearMap.GNS`; CStarAlgebras C2.2, §2.6;
VonNeumannAlgebras V0, V4.Core.

**Checks.**

- For `A = K(ℓ²)`, Â is a point, Fell's condition holds with any rank-one projection, and the
  positive operator `diag(1/(n+1))` has infinite trace: `m(A)` is the ideal of trace-class
  operators, dense and proper, so finiteness of the trace is a condition on elements, not on A.
- `C₀(X, K(ℓ²))` has continuous trace with spectrum X.

### 5.9 Local Morita equivalence over the spectrum

For local Morita theory assume that the spectrum `X = Â` is Hausdorff; prove that the kernel map is
then a homeomorphism onto `Prim(A)` (Hausdorffness forces injectivity for the induced topology),
and use the Dauns–Hofmann `C₀(X)`-action. An A–B imprimitivity bimodule is *over X* when the two
central actions agree, `fξ = ξf`, with the multiplier actions extended nondegenerately. Prove that
this is equivalent to its Rieffel homeomorphism (§3.7) being the identity under the given
identifications of the spectra with X. Prove that A has continuous trace if and only if it is
locally Morita equivalent to `C₀(X)`: each point has a compact neighbourhood F such that the
restricted algebra `A^F` is Morita equivalent over F to `C(F)` (Raeburn–Williams, Proposition 5.15).
Supply the rank-one corner and localized imprimitivity constructions, and prove Morita invariance
of continuous trace.
*Needs:* §§3.5–3.7, 5.1, 5.8; CStarAlgebras C2.7.

### 5.10 Čech cohomology of the coefficient sheaves

For the classification assume that X is also paracompact. Write `Ȟⁿ(X, 𝓕)` for the open-cover Čech
cohomology of a presheaf of abelian groups 𝓕 on X: Tau Ceti's `TauCeti.Topology.cechCohomology`,
the colimit, over the point-neighbourhood covers `TauCeti.Topology.PointOpenCover` (covers indexed
by X with `x ∈ U_x`, ordered by existence of a refinement), of the cohomology of Mathlib's
`cechComplexFunctor` evaluated on the actual tuple intersections, with repeated indices and empty
intersections retained. The fixed-cover complexes, the refinement cochain maps with their identity,
composition and naturality laws and the explicit cochain homotopies between the maps of two
refinement functions, independence of the cofinal system, functoriality in the presheaf,
restriction to open subsets and the pullback of fixed-cover complexes along continuous maps are
supplied at the Tau Ceti pin (supplier contracts below).

Construct the three sheaves used below as sheaves of abelian groups on X, each with value 0 on the
empty open set: the continuous real-valued functions `C(−, ℝ)`, the continuous circle-valued
functions `C(−, 𝕋)` and the locally constant integer-valued functions Z. Identify the circle's
additive module notation with its multiplicative cocycle notation. Construct, for each of the
three sheaves, the pullback `Ȟⁿ(Y, 𝓕) → Ȟⁿ(X, 𝓕)` along a continuous map `f : X → Y` of such bases,
by composing sections with f: cocycles pull back along the preimage cover, compatibly with sheaf
maps, refinements and common refinements. Construct the
nonabelian `Ȟ¹` with coefficients in a sheaf of groups, as the pointed set of cocycles modulo
coboundaries, used in §5.12; that cocycle and lifting theory is not an application of the abelian
cochain differential to a nonabelian group.
*Needs:* Tau Ceti `TauCeti.Topology.cechCohomology`, `TauCeti.Topology.PointOpenCover`,
`TopCat.Hom.cechComplexPullback`; Mathlib `cechComplexFunctor`.

**Checks.**

- On the discrete two-point space `{a, b}`, the cover `({a}, {b})` refines `({a}, {b}, {b})` by two
  refinement functions, sending the second index to the second or to the third member. On
  0-cochains `(c₁, c₂, c₃)` they give `(c₁, c₂)` and `(c₁, c₃)`, different cochain maps, which agree
  on cocycles, where `c₂ = c₃`: the colimit is taken only after passing to cohomology.

### 5.11 The exponential sequence

Prove local exactness of `0 → Z → C(−, ℝ) → C(−, 𝕋) → 0`, with exponential `t ↦ exp(2πit)`. Build the
connecting maps after cover refinements giving local logarithms, and prove their independence of
choices, exactness and naturality. Use locally finite partitions of unity and the resulting cochain
contraction to prove `Ȟⁿ(X, C(−, ℝ)) = 0` for n > 0. Deduce the natural isomorphism
`Ȟ²(X, C(−, 𝕋)) ≅ Ȟ³(X, Z)`. Every `H³` in this classification means this Čech group.

For the `S³` example compare it with CharacteristicClasses C1.2b's constant-coefficient Čech group
and its singular comparison `Ȟ³(S³; ℤ) ≅ H³(S³; ℤ) ≅ ℤ`: the inclusion of constants is a map from the
constant presheaf ℤ to the sheaf Z; it induces cochain maps of fixed-cover complexes compatible with
refinement, hence a map of the colimits. On a cover whose nonempty finite intersections are
connected the two complexes coincide on the tuples with nonempty intersection, and
SmoothBundlesConnections B6.0's finite smooth good covers refine every open cover of `S³`, so the
colimit map is an isomorphism. The value on empty intersections must be 0 on both sides. No
identification with singular cohomology on arbitrary paracompact spaces is asserted.
*Needs:* §5.10; Mathlib `PartitionOfUnity`; CharacteristicClasses C1.2b; SmoothBundlesConnections
B6.0.

**Checks.**

- On the circle itself, the identity map `𝕋 → 𝕋` is a global section of `C(−, 𝕋)` with no continuous
  logarithm, so `C(𝕋, ℝ) → C(𝕋, 𝕋)` is not surjective: the sequence is exact only locally, which is
  why the connecting maps need refinements.
- With the value ℤ on the empty set, the tuple complex of a cover is the cochain complex of the full
  simplex on its index set and has the cohomology of a point for every cover with a nonempty index
  set (every cover of a nonempty space): the value 0 on empty intersections is what makes the
  comparison with constant coefficients possible.

### 5.12 Compact-operator bundles and the lifting obstruction

Construct `U(H)`, `H = ℓ²(ℕ)`, as the group of surjective complex-linear isometries with the strong
operator topology, and `Aut(K(H))` as the group of *-automorphisms with the point-norm topology.
Prove joint continuity of multiplication, continuity of inversion, continuity of `Ad`, and
continuity of evaluation and of the actions on H and `K(H)`. These are the actual operator groups,
not finite-dimensional matrix unitary groups. Build locally trivial bundles with fibre `K(H)` and
structure group `Aut(K(H))`, their transition cocycles, isomorphisms, pullbacks and section
C*-algebras. Prove that every automorphism is inner and `Aut(K(H)) ≅ U(H)/𝕋`, with `U(H)` in the
strong operator topology, and construct local continuous sections of the quotient map. Develop the
nonabelian `Ȟ¹` cocycle classification of these bundles and the lifting obstruction from
`1 → 𝕋 → U(H) → Aut(K(H)) → 1`. Prove that this obstruction induces a bijection from their bundle
isomorphism classes to `Ȟ³(X, Z)` (Raeburn–Williams, Theorem 4.85 and Chapter 4). Prove
strong-topology contractibility of `U(H)`, the extension to all of a paracompact base of a
continuous map into `U(H)` defined on a neighbourhood of a closed subset, agreeing with it near
that subset, and the resulting trivialization of unitary-bundle cocycles on paracompact bases.
Construct the refinement and gluing arguments for injectivity and realization of the obstruction
map; nonabelian `Ȟ¹` is a pointed set at this stage. The topology here is the strong one, not the
norm topology of Kuiper's theorem.
*Needs:* §§5.10–5.11; Mathlib `ContinuousLinearMap.adjoint`, `IsCompactOperator`, `unitary`.

### 5.13 The Dixmier–Douady invariant

Construct `δ(A)` for every continuous-trace algebra A with identified paracompact spectrum X,
without assuming that its compact-operator field is already locally trivial. Choose local
A–`C₀(X)` imprimitivity bimodules (§5.9), refine so that their overlap isomorphisms `g_ij` exist,
and prove that on triple overlaps `g_ij g_jk = ν_ijk g_ik` for continuous scalar unitaries `ν_ijk`.
Prove the Čech 2-cocycle identity for `ν` in `C(−, 𝕋)`, giving a class in `Ȟ³(X, Z)` through §5.11,
independence of all choices and refinements, and compatibility with the compact-operator-bundle
obstruction of §5.12 (Raeburn–Williams, Proposition 5.24). A spectrum-preserving equivalence is an
imprimitivity bimodule over X as defined in §5.9.
*Needs:* §§5.9–5.12.

### 5.14 The Dixmier–Douady classification and the Brauer group

Prove the Dixmier–Douady classification: A and B are Morita equivalent over X if and only if
`δ(A) = δ(B)` in `Ȟ³(X, Z)`, and every class is realized (Raeburn–Williams, Theorem 5.29). For the
converse construct and glue local imprimitivity bimodules after a scalar coboundary adjustment; for
realization construct the compact-operator bundle and its section algebra. Give the balanced
spatial tensor product `A ⊗_X B` as the quotient of `A ⊗min B` by the closed ideal generated by the
`(fa) ⊗ b − a ⊗ (fb)`, prove its fibre and local-module formulas, and construct the Brauer group
`Br(X)` of spectrum-preserving Morita classes. Its identity is `C₀(X)`, its inverse is the conjugate
algebra, and `δ : Br(X) ≅ Ȟ³(X, Z)` is a group isomorphism (Raeburn–Williams, Theorem 6.3). Include
`δ(A ⊗_X B) = δ(A) + δ(B)`, the negative class for the conjugate algebra, and naturality under
pullback. Construct pullback algebras for arbitrary continuous maps between bases with the stated
local compactness and paracompactness, without asserting that composition always maps `C₀`
sections to `C₀` sections.
*Needs:* §§3.3, 5.13; CStarAlgebras C5.1.

### 5.15 Stable classification and examples

For σ-unital continuous-trace A and B with fixed spectrum X, deduce that `δ(A) = δ(B)` if and only
if there is a `C₀(X)`-linear isomorphism `A ⊗min K ≅ B ⊗min K` (Raeburn–Williams, Corollary 5.56).
Prove that `δ = 0` if and only if A is Morita equivalent over X to `C₀(X)`. Include `C₀(X, K(H))`,
finite-rank endomorphism bundles, and a compact-operator bundle over `S³` realizing a generator of
`Ȟ³(S³, Z)`. The last example uses the comparison of §5.11 and exhibits a nontrivial obstruction.
*Needs:* §§4.3, 5.11, 5.14.

### Examples

`C(Y)` over `C(X)` through a surjection (§5.2) is the commutative model of a `C₀(X)`-algebra, a
continuous field exactly when the surjection is open. Over the torus the modules `M_k` and
`Γ_(a,b)` exhaust the nonzero finitely generated projective `C(T²)`-modules, with rank b and
Chern number −a (§§5.4–5.7). `C₀(X, K(ℓ²))` has continuous trace and trivial Dixmier–Douady
class, and a compact-operator bundle over `S³` realizes a generator of `Ȟ³(S³, Z) ≅ ℤ` (§5.15).

### Dependencies

Layers 1–4. Tau Ceti's Čech cohomology of presheaves on spaces, its point-neighbourhood covers and
fixed-cover pullbacks, `TauCeti.FiniteRankBundleCore`, `TauCeti.cwComplexProd` and the connectivity
of spheres; Mathlib's ideals of `C(Y)`, Tietze extension, partitions of unity and
`cechComplexFunctor`. CStarAlgebras C1.3, C1.7, C2.2, §2.6, C2.7 and C5.1; VonNeumannAlgebras V0 and
V4.Core; TopologicalKTheory T1; CharacteristicClasses C1.2b and C1.6; AlgebraicTopology §4.5;
SmoothBundlesConnections B1.3, B3.3, B6.0, B6.2 and B6.3; DifferentialGeometry §5.2.

<a id="h6-closed-module-operators-and-regularity"></a>

## Layer 6: closed module operators and regularity

Kaad–Lesch, §§2–4; Blackadar, II.7. Throughout, E and F are Hilbert A-modules and operators are
complex-linear partial maps in Mathlib's `LinearPMap`.

### 6.1 Semiregular operators and their adjoints

Represent a densely defined operator `T : E → F` with `LinearPMap`, requiring its domain to be
stable under the right action and T to be A-linear there. Define the adjoint domain by existence of
a representing vector: `y ∈ dom(T*)` if and only if some `z ∈ E` satisfies `⟨Tx, y⟩ = ⟨x, z⟩` for
every `x ∈ dom(T)`. Prove uniqueness of z by density and construct T*. Continuity of the associated
functional alone is not a substitute for the existence of z; the Hilbert-space Riesz representation
theorem does not give this adjoint. Develop graph inclusion, closure, restrictions, cores, sums on
intersections of domains, and composition on its actual domain. Prove that adjoints are closed; if
T* is densely defined, T is closable and `(closure T)* = T*`. A densely defined operator with densely
defined adjoint is *semiregular*.
*Needs:* Layer 1 (§§1.1, 1.5); Mathlib `LinearPMap`, `LinearPMap.graph`.

**Checks.**

- In `A = C([0, 1])`, let T be the inclusion of the ideal `J = {f : f(0) = 0}` into A, everywhere
  defined and bounded. For `y = 1` the functional `x ↦ ⟨Tx, 1⟩ = x*` is bounded on J, but no `z ∈ J`
  satisfies `x*z = x*` for all `x ∈ J`; in fact `dom(T*) = J`, which is not dense in A. Defining the
  adjoint domain by boundedness of that functional would wrongly give all of A.
- For `A = ℂ` the module adjoint is Mathlib's Hilbert-space `LinearPMap.adjoint`, and closedness of
  adjoints is `LinearPMap.adjoint_isClosed`.

### 6.2 Regular operators and the graph module

A closed semiregular T is *regular* when `1 + T*T` has dense range. Prove the resulting
surjectivity of `1 + T*T` and its bounded adjointable inverse, regularity of T*, and `T** = T`.
Give the equivalent criterion that the graph of T is orthogonally complemented in `E ⊕ F`.
Construct the graph Hilbert-module structure on `dom(T)`, with `⟨x, y⟩_T = ⟨x, y⟩ + ⟨Tx, Ty⟩`, its norm
and completeness; prove that the inclusion of the graph module into E is adjointable if and only if
T is regular, with adjoint `(1 + T*T)⁻¹` considered as a map into the graph module.
*Needs:* §§1.8, 2.2, 6.1.

**Checks.**

- For `A = ℂ` every closed densely defined operator on a Hilbert space is regular, since
  `1 + T*T` is then surjective (von Neumann); regularity is a genuine condition only for general A.
- For regular T, `⟨ιx, y⟩ = ⟨x, (1 + T*T)⁻¹y⟩ + ⟨Tx, T(1 + T*T)⁻¹y⟩ = ⟨x, (1 + T*T)⁻¹y⟩_T`, which is
  the adjoint identity for the inclusion ι.

### 6.3 The bounded transform

Construct the bounded transform `z_T = T(1 + T*T)^(-1/2) ∈ L_A(E, F)` and prove its contraction
property. Give the inverse construction: contractions z for which `1 − z*z` has dense range
correspond to regular operators, with domain `range((1 − z*z)^(1/2))` and
`T((1 − z*z)^(1/2)x) = zx`. Prove well-definedness, adjoint compatibility, and the formulas
recovering `(1 + T*T)⁻¹` and the graph projection. Derive the polar-decomposition criterion for
regular operators from the complemented closures of the ranges, with the same initial- and
final-space convention as §2.8.
*Needs:* §§2.2, 2.8, 6.2.

**Checks.**

- For `A = E = F = ℂ` and T multiplication by a real t, `z_T = t/√(1 + t²)`, and
  `(1 − z²)^(1/2) = 1/√(1 + t²)`, so `T((1 − z²)^(1/2)x) = tx/√(1 + t²) = zx` recovers T.

### 6.4 Functional calculus and resolvents

For a selfadjoint regular T, construct its nondegenerate `C₀(ℝ)` functional calculus in `L_A(E)`,
identifying `C₀(ℝ)` with the subalgebra of `C([−1, 1])` of functions vanishing at both endpoints
under `t ↦ t/√(1 + t²)`. Prove the norm, order, composition and adjoint properties; extend
nondegenerately to bounded continuous functions, with strict convergence for uniformly bounded nets
converging uniformly on compact subsets of ℝ. Construct the associated unbounded continuous
functions of T on their domains by truncation, and prove the domain and composition identities used
for square roots and resolvents. For nonreal λ prove that the resolvent exists with
`‖(λI − T)⁻¹‖ ≤ 1/|Im λ|`; prove the resolvent identity and compatibility with the bounded transform.
Establish the symmetric-operator criterion: a closed symmetric T is selfadjoint and regular if and
only if both `T + iμ` and `T − iμ` have dense range for one μ > 0, and then they are surjective for
every nonzero real μ. For a closed semiregular `T : E → F`, prove that T is regular if and only if
the operator `[[0, T*], [T, 0]]` on `E ⊕ F` with domain `dom(T) ⊕ dom(T*)` is selfadjoint and
regular, using the graph-projection and resolvent criteria for both directions.
*Needs:* §§2.2, 2.4, 6.3; Mathlib's continuous functional calculus; SelfAdjointSpectralTheory
(the `zI − T` convention, Part D for resolvents).

**Checks.**

- For T multiplication by a real t on ℂ, `|(λ − t)⁻¹| ≤ 1/|Im λ|` with equality at `t = Re λ`, so the
  resolvent bound is sharp.

### 6.5 Deficiency theory in Hilbert space

For the scalar Hilbert-space specialization, build the deficiency-space API used in Layer 7. For a
closed densely defined symmetric S let `N_± = ker(S* ∓ i)`. Prove the graph-inner-product
decomposition `dom(S*) = dom(S) ⊕ N_+ ⊕ N_-`, the boundary-form formula, and the Cayley
partial-isometry correspondence, which extends to closed symmetric operators the Cayley transform
of a selfadjoint operator (Tau Ceti's `LinearPMap.cayley`, unitary by
`IsSelfAdjoint.cayley_mem_unitary`). Classify the selfadjoint extensions by unitaries `U : N_+ → N_-`,
with domain `dom(S) + {u + Uu : u ∈ N_+}` and action `S*(x + u + Uu) = Sx + iu − iUu`. Prove the
bijection, including that a selfadjoint extension exists if and only if the deficiency Hilbert
spaces are unitarily isomorphic. This Hilbert-space extension theory uses scalar Riesz
representation (Teschl, §2.6, Theorem 2.27; the convention `U = −V` translates his Cayley unitary
to the displayed domain).
*Needs:* Mathlib `LinearPMap.adjoint`, `LinearPMap.adjoint_isClosed`; Tau Ceti
`LinearPMap.cayley`, `IsSelfAdjoint.cayley_mem_unitary`; SelfAdjointSpectralTheory Part C (closed
graphs).

**Checks.**

- The displayed action is `S*` itself: `S*u = iu` for `u ∈ N_+` and `S*(Uu) = −iUu` for `Uu ∈ N_-`.
- For `D = −i d/dt` on `L²([0, 1])` with domain `H₀¹([0, 1])`, `N_+` is spanned by `e^(−t)` and `N_-`
  by `e^t` (solving `−if′ = ±if`), so both deficiency indices are 1 and the selfadjoint extensions
  form a circle.

### Examples

For `A = ℂ` regularity is automatic and Layer 6 specializes to the Hilbert-space theory of closed
operators (§6.2). Multiplication by a real-valued continuous function on `C₀(X)`, as an operator on
the module `C₀(X)`, is selfadjoint and regular, with bounded transform `t/√(1 + t²)` applied
pointwise. The derivative on `[0, 1]` has deficiency indices `(1, 1)` (§6.5).

### Dependencies

Layers 1–2. Mathlib's `LinearPMap` with its Hilbert-space adjoint and the continuous functional
calculus; SelfAdjointSpectralTheory Parts C–D and its resolvent convention.

## Layer 7: localization, separation, and the local–global principle

Kaad–Lesch, §§2–7, with the erratum appended to that paper; Pierrot.

### 7.1 Localization

For a representation `π : A → B(H_π)`, localize E to `E ⊗_A H_π` (§3.4) and a semiregular T to the
closure of `x ⊗ h ↦ Tx ⊗ h` on `dom(T) ⊙_A H_π`. Prove density, well-definedness, closability and
`(T*)^π ⊆ (T^π)*`. Give the equivalent state-quotient construction (§3.4), the localization of
cores, and the compatibility of regular operators, their bounded transforms, functional calculi
and resolvents with localization.
*Needs:* §§3.4, 6.1–6.4.

### 7.2 Separation

Prove the separation theorem: for a nonempty closed convex `L ⊆ E` and `x ∉ L` there is a state ω
with the image of x outside the closure of the image of L in the state localization `E^ω`
(Kaad–Lesch, §3, Theorem 3.1). For a proper closed submodule L, prove the stronger
point-separation statement with a pure state, equivalently an irreducible cyclic representation
and its cyclic vector (Kaad–Lesch, erratum, Theorem 2.1). Develop the module-compact right ideal
`K_A(E, L)` and its adjoint left ideal `K_A(L, E)`, a pure state of `K_A(E)` whose left kernel
contains `K_A(L, E)` and which does not vanish at `θ_(x,x)`, and induction through the
E–`K_A(E)` equivalence (over `I_E` when E is not full) used in that proof, including the extension
of nondegenerate representations from the ideal `I_E` to A. Retain the closure of the localized
submodule; its algebraic image need not be closed.
*Needs:* §§1.9, 2.3, 3.4–3.5, 7.1; Mathlib `geometric_hahn_banach_point_closed`;
BanachSpaceTheory B1; CStarAlgebras C2.2 and §2.6 (pure-state separation from closed left ideals);
VonNeumannAlgebras V0.

### 7.3 The local–global principle

Prove the local–global principle, including its pure-state form (Kaad–Lesch, §4, Theorem 4.2; for
pure states, Pierrot, Theorem 1.18, which is the erratum's Conjecture 1.1, and Kaad–Lesch,
Theorem 5.6, with the erratum's Theorem 2.1): for a closed semiregular T, regularity is
equivalent to `(T*)^π = (T^π)*` for every representation π, equivalent to that equality for every
state, and equivalent to it for every pure state. For a closed, densely defined, symmetric T,
selfadjoint regularity is equivalent to selfadjointness of all these localizations, with all
representations, all states or all pure states. Relate the two statements through the operator
`[[0, T*], [T, 0]]` on `dom(T) ⊕ dom(T*)` for operators `E → E` (§6.4). Prove that localization
commutes with this block construction, retaining `(T*)^π` as the top-right entry before identifying
it with `(T^π)*`. Use the strengthened separation theorem of §7.2 for the pure-state assertion.
*Needs:* §§6.4, 7.1–7.2.

### 7.4 A selfadjoint operator that is not regular

Start with `D = −i d/dt` on `H = L²([0, 1])` with domain `H₀¹([0, 1])`, prove that its deficiency
indices are `(1, 1)`, and parametrize its selfadjoint extensions `D_λ` by `λ ∈ 𝕋` using normalized
deficiency vectors `φ_±` and the condition `α_+ = λα_-` in the graph domain of D*, with §6.5's
deficiency API. Consume [PDE](../PDE/README.md) §§1.1, 1.2 and 1.6 (A1, A2, A6) for weak-derivative
Sobolev spaces, smooth density, the integration by parts on an interval and boundary traces. Prove
the interval specialization here: each `W^(1,2)` class has a unique continuous, absolutely
continuous representative with `L²` derivative, its endpoint values are the PDE traces, and `H₀¹` is
exactly their common kernel. Prove its equivalence with the domains and graph norms of the
derivative operators, using the fundamental theorem for the weak derivative. This is a comparison
API on PDE's spaces, not a second Sobolev definition.

For any locally compact Hausdorff X, construct the pointwise minimal and maximal operators on
`C₀(X, H)` with domains `C₀(X, dom(D_min))` and `C₀(X, dom(D_max))`, each domain carrying its graph
Hilbert norm. Prove that both are regular, that they are mutually adjoint, and that their
graph-domain inclusions are adjointable. For a Borel `Λ : X → 𝕋` define `T_Λ` by the boundary
equation on these graph sections. Prove its closedness and semiregularity, and determine its point
localizations: on the open set where Λ is locally continuous they are `D_Λ(x)`, and at a point
outside that set `T_Λ` localizes to `D_min`. For the adjoint distinguish the interior of the
singular set (`D_max`), its boundary points where Λ extends continuously from the regular set (the
extension's `D_λ`), and the remaining boundary points (`D_min`). Build the local extension and
section approximation arguments; a pointwise limit alone is not a neighbourhood extension
hypothesis (Kaad–Lesch, §6).

On the Hilbert `C([0, 1])`-module `C([0, 1], H)`, take the closed restriction of the pointwise
maximal operator whose graph sections satisfy this boundary condition with `Λ(s) = exp(i/s)` for
s > 0 and `Λ(0) = 1`. Prove that it is selfadjoint but not regular: its localization at 0 is the
non-selfadjoint minimal D. Its localization in the faithful representation by multiplication on
`L²([0, 1], H)` with Lebesgue measure is selfadjoint. This proves that one faithful representation
cannot replace all states in the criterion of §7.3.
*Needs:* §§6.2, 6.5, 7.1, 7.3; PDE §§1.1, 1.2, 1.6.

### 7.5 The sum criterion

Prove the following sum criterion with its actual domain hypotheses (Kaad–Lesch, Assumption 7.1
and Theorem 7.10). Let S and T be selfadjoint regular operators on E and let `𝓔 ⊆ dom(T)` be a dense
A-submodule which is a core for T. Suppose that for every real μ ≠ 0 and `ξ ∈ 𝓔`,
`(S − iμ)⁻¹ξ ∈ dom(S) ∩ dom(T)` and `T(S − iμ)⁻¹ξ ∈ dom(S)`, and that the map
`[S, T](S − iμ)⁻¹ : 𝓔 → E` extends to a bounded A-linear map `E → E`. Prove that
`[[0, S − iT], [S + iT, 0]]` on `(dom(S) ∩ dom(T))²` is selfadjoint and regular. Build the commutator
estimates, the graph-norm comparison, and the closure and localization steps needed for the
theorem. Bounded A-linearity of the commutator extension is the hypothesis; it is not replaced by
an unstated adjointability or by a common-core assumption alone.
*Needs:* §§6.4, 7.1, 7.3.

### Examples

The boundary-condition operators `T_Λ` on `C₀(X, L²([0, 1]))` localize to `D_Λ(x)` where Λ is
locally continuous and to `D_min` elsewhere (§7.4); with `Λ(s) = exp(i/s)` on `[0, 1]` they give a
selfadjoint operator that is not regular although its localization in a faithful representation is
selfadjoint. For `T = 0`, with `𝓔 = E`, every hypothesis of §7.5 holds and its conclusion is the
selfadjointness and regularity of `[[0, S], [S, 0]]`, the block criterion of §6.4 for S.

### Dependencies

Layers 1–3 and 6; Mathlib's Hahn–Banach separation; BanachSpaceTheory B1; CStarAlgebras C2.2 and
§2.6; VonNeumannAlgebras V0; PDE §§1.1, 1.2 and 1.6.

## Downstream consumers

- [OperatorKTheory](../OperatorKTheory/README.md) consumes the standard module `H_A` and the
  identifications `K_A(H_A) ≅ K ⊗min A` and `L_A(H_A) ≅ M(K ⊗min A)` (§§1.6, 2.4), the multiplier
  comparison, interior tensor products (Layer 3), stabilization (Layer 4), the section-module
  comparison (§5.3) and regular operators (Layers 6–7).
- [IndexTheory](../IndexTheory/README.md) consumes the scalar specialization of module-compact
  operators (§2.6) and the section algebras of Hermitian endomorphism bundles (§5.3).
- [NoncommutativeGeometry](../NoncommutativeGeometry/README.md) N7 consumes Layers 1–3 for its
  Heisenberg module: completion over a dense *-subalgebra, finite Parseval frames and the state
  localization.
- [CStarClassification](../CStarClassification/README.md) consumes Layers 1–4 (module-compact
  operators, stabilization, full corners, strong Morita equivalence) and the definition of type I in
  §3.7.
- [GeneralizedCohomology](../GeneralizedCohomology/README.md) builds graded Hilbert modules on
  Layers 1–4 and consumes Layers 2 and 4–6.
- [CategoricalOperatorAlgebras](../CategoricalOperatorAlgebras/README.md) and
  [FreeProbability](../FreeProbability/README.md) consume Layers 1–3.
- [AlgebraicKTheory](../AlgebraicKTheory/README.md) consumes §2.7 and the compact-X comparison of
  §5.3 between Hermitian bundles and finitely generated projective section modules.
- [SpectralManifolds](../SpectralManifolds/README.md) follows the opposite-algebra convention for
  right modules of Convention 2.
- [UnboundedOperators](../OperatorTheory/UnboundedOperators/README.md) consumes Layer 6 (adjoints,
  graph cores, sums and compositions, the deficiency decomposition and the classification of
  selfadjoint extensions) and the interval example of §7.4.
- [OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md) consumes Layers 1 and 3
  (completion over a dense *-subalgebra, induced Hilbert spaces and imprimitivity bimodules).
- [QuantumGroups](../QuantumGroups/README.md) consumes Layers 1–3 (the module `H ⊗ A`, adjointable
  and module-compact operators, the multiplier identification and interior tensor products).
- [NoncompactQuantumSymmetry](../NoncompactQuantumSymmetry/README.md) consumes Layer 3 (interior
  tensor products, induction and the Rieffel correspondence) and Layer 5 (`C₀(X)`-algebras,
  continuous Hilbert fields and the unitary dual of §5.8).
- [FactorRigidity](../FactorRigidity/README.md) consumes Layers 1–3 for the interior tensor
  product of correspondences.
- The child roadmap [HeisenbergImprimitivity](HeisenbergImprimitivity/README.md) consumes Layers 1–3.

## Scope and ownership

**This roadmap owns** the theory of Hilbert C*-modules over complex C*-algebras laid out in
Layers 1–7: the right-module forms of the basic inequalities, Gram positivity, completions,
Hilbert direct sums, the standard module, complements and quotients (Layer 1); adjointable and
module-compact operators, the multiplier and scalar identifications, finite frames and polar
decomposition (Layer 2); interior and external tensor products, induced representations,
imprimitivity bimodules, linking algebras, the Rieffel correspondence and the finite-factor
comparison (Layer 3); countable generation, Kasparov stabilization and the Brown–Green–Rieffel
theorem (Layer 4); `C₀(X)`-algebras, continuous Hilbert fields and the analytic section-module
comparison, the torus modules `M_k` and `Γ_(a,b)` with the classification of projective
`C(T²)`-modules, the unitary dual and continuous trace, the Čech cohomology of the three
coefficient sheaves with the exponential sequence, compact-operator bundles, and the
Dixmier–Douady classification with the Brauer group (Layer 5); semiregular and regular module
operators, the bounded transform, the functional calculus and the Hilbert-space deficiency theory
(Layer 6); and localization, separation, the local–global principle, the interval examples and the
sum criterion (Layer 7).

**Already in the pinned libraries, and consumed above.**

- *Mathlib*: the class `CStarModule` with its Cauchy–Schwarz inequalities and norm recovery in the
  left-module form, which §1.1 restates for right modules; the finite products, the left
  self-module and the Hilbert-space instance on `WithCStarModule`; the C*-algebra `CStarMatrix`;
  the multiplier algebra `DoubleCentralizer`; the closed graph theorem; the Hilbert-space adjoints
  of bounded and of partial operators; the closed ideals of `C(Y)` and Tietze extension; Hahn–Banach
  separation.
- *Tau Ceti*: the cover-theoretic Čech cohomology of presheaves on a topological space (fixed-cover
  tuple complexes, refinement maps with their laws and homotopies, the colimit over
  point-neighbourhood covers, independence of the cofinal system, restriction and pullback of
  fixed-cover complexes), which §5.10 consumes; nondegenerate representations and their extension
  to multipliers; the Cayley transform of a selfadjoint Hilbert-space operator, which §6.5 extends
  to symmetric operators; the finite-rank bundle core; the CW product; the connectivity of spheres.
  CharacteristicClasses C1.2b also plans a point-neighbourhood cover system; §5.10 uses Tau
  Ceti's.

**Left to named roadmaps.**

- *C*-algebra structure theory*: ideals, approximate units, hereditary subalgebras, multipliers and
  the strict topology, representations, primitive spectra and the pure-state separation of closed
  left ideals, the Dauns–Hofmann theorem, spatial tensor products, inductive limits, nuclearity and
  exactness are [CStarAlgebras](../CStarAlgebras/README.md)' (C1.3, C1.4, C1.7, C2.2, §2.6, C2.7,
  C5.1, C5.4, C6.1–C6.2, C7.1, C9.7).
- *States, traces and normal modules*: states and GNS (V0), the trace class and the extended
  positive trace on `B(H)` (V4.Core), normality of representations (V4.Normality) and the normal
  Hilbert modules of finite factors with their coupling dimension (V7.StandardAmplifications,
  V7.Dimension) are [VonNeumannAlgebras](../VonNeumannAlgebras/README.md)'. Dimension theory stays
  with those normal modules, which are distinct from the A-valued modules developed here.
- *Hilbert-space partial operators*: closed graphs, adjoints and resolvents of operators on Hilbert
  spaces are [SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md)'s,
  with Mathlib's `LinearPMap`; Layer 6 builds the module-valued adjoint and regularity theory, which
  the Hilbert-space Riesz representation theorem does not give.
- *Vector bundles and K-theory*: continuous bundles, their category, pullbacks, metrics, homotopy
  invariance and section extension are [TopologicalKTheory](../TopologicalKTheory/README.md) T1's;
  group completion and K-groups are TopologicalKTheory's, and operator K-theory, Bott maps and the
  K-group and ring calculations for the torus modules are
  [OperatorKTheory](../OperatorKTheory/README.md)'s. Layer 5 constructs the continuous section
  modules, Hilbert fields, compact-operator bundles and the analytic section-algebra comparison.
- *Cohomology*: the constant-coefficient Čech cohomology of paracompact Hausdorff spaces of CW type
  and its comparison with singular cohomology (`cechSingularCWTypeComparison`, C1.2b) and the
  classification of complex line bundles by the first Chern class (C1.6) are
  [CharacteristicClasses](../CharacteristicClasses/README.md)'; ordinary cohomology (Layer 6) and
  CW pairs, homotopy extension and CW products (§4.5) are
  [AlgebraicTopology](../AlgebraicTopology/README.md)'s. The general derived sheaf cohomology
  comparisons, with Mathlib's `CategoryTheory.Sheaf.H`, and fine-sheaf acyclicity are
  [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) §2.5 (K2)'s, and the smooth-function
  exponential sequence is [SmoothBundlesConnections](../SmoothBundlesConnections/README.md) B6.1's.
  Layer 5 owns the open-cover Čech cohomology of its three abelian sheaves on paracompact locally
  compact Hausdorff bases, the pullbacks along base maps, the continuous exponential sequence with
  its Čech connecting map, and the nonabelian and Dixmier–Douady lifting and gluing.
- *Smooth geometry*: smooth bundles from cocycles, induced connections, the first Chern class of
  circle bundles and rank-one Chern–Weil are SmoothBundlesConnections' (B1.3, B3.3, B6.2, B6.3);
  integration of top forms is [DifferentialGeometry](../DifferentialGeometry/README.md) §5.2's.
- *Sobolev spaces*: weak derivatives, smooth density and boundary traces are
  [PDE](../PDE/README.md) §§1.1, 1.2 and 1.6; §7.4 builds only the interval comparison on them.
- *The Heisenberg modules*: [NoncommutativeGeometry](../NoncommutativeGeometry/README.md) N7 keeps
  its two-torus connections, curvature and index for the Heisenberg module, and the child
  [HeisenbergImprimitivity](HeisenbergImprimitivity/README.md) develops finite-type phase-space
  lattices, Schwartz–Bruhat and Poisson analysis, positive twisted pairings, explicit
  imprimitivity, smooth frames and trace normalization, compared with N7 in its §6.3. It consumes
  Layers 1–3; these abstract foundations are independent of that example.
- K-theory and KK-theory, C*-dynamical imprimitivity theorems and categorical completions consume
  the interfaces built here; their classification and product theorems are not prerequisites of
  this roadmap.

Other roadmaps cite sections of this roadmap by the labels of its former numbering:

| Former label | Now |
|---|---|
| H1 | Layer 1 |
| H2 | Layer 2 |
| H3 | Layer 3 |
| H4 | Layer 4 |
| H5 | Layer 5 |
| H6 | Layer 6 |
| H7 | Layer 7 |

## Exact supplier contracts

### From Mathlib

- *Hilbert C*-modules* (`Mathlib/Analysis/CStarAlgebra/Module/`): the class `CStarModule A E`
  (`Defs.lean`; a left A-action with `⟪x, a • y⟫ = a * ⟪x, y⟫`, conjugate-linear in the first
  variable, and the norm axiom `‖x‖ = √‖⟪x, x⟫‖`), with `CStarModule.inner_mul_inner_swap_le`
  (`⟪x, y⟫ * ⟪y, x⟫ ≤ ‖x‖ ^ 2 • ⟪y, y⟫`), `CStarModule.norm_inner_le`, `CStarModule.norm_eq_csSup`
  (the norm is the supremum of `‖⟪w, v⟫‖` over the unit ball), `CStarModule.continuous_inner` and
  `CStarModule.normedSpaceCore`; the synonym `WithCStarModule` (`Synonym.lean`) and, in
  `Constructions.lean`, the left self-module `WithCStarModule.instCStarModule` with
  `WithCStarModule.inner_def` (`⟪x, y⟫ = y * star x`), the product and finite-product instances
  with `WithCStarModule.prod_inner`, `WithCStarModule.pi_inner`, `WithCStarModule.inner_single_left`
  and `WithCStarModule.inner_single_right`, and `WithCStarModule.instCStarModuleComplex` for a
  complex inner product space. Used in §§1.1, 1.4–1.5, 2.6, with Aᵐᵒᵖ as coefficient algebra.
- *The opposite algebra*: the instances `NonUnitalCStarAlgebra Aᵐᵒᵖ` and `CStarAlgebra Aᵐᵒᵖ`
  (`Mathlib/Analysis/CStarAlgebra/Classes.lean`), the `PartialOrder` on `αᵐᵒᵖ`
  (`Mathlib/Algebra/Order/Group/Opposite.lean`) and `StarOrderedRing Rᵐᵒᵖ`
  (`Mathlib/Algebra/Order/Star/Basic.lean`). These make `CStarModule Aᵐᵒᵖ E` well formed for every
  C*-algebra A (Convention 2).
- *Matrices and multipliers*: `CStarMatrix` with its C*-algebra instances
  (`Mathlib/Analysis/CStarAlgebra/CStarMatrix.lean`; used in §§1.1, 2.7) and the multiplier algebra
  `DoubleCentralizer`, notation `𝓜(ℂ, A)` (`Mathlib/Analysis/CStarAlgebra/Multiplier.lean`; §§2.4–2.5,
  5.1).
- *Approximate units*: `Filter.IsIncreasingApproximateUnit` and `CStarAlgebra.approximateUnit`
  (`Mathlib/Analysis/CStarAlgebra/ApproximateUnit.lean`; §1.3).
- *GNS*: `PositiveLinearMap.GNS` and `PositiveLinearMap.gnsStarAlgHom`
  (`Mathlib/Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`; §§3.4, 5.8).
- *Operators on Banach and Hilbert spaces*: the closed graph theorem
  `LinearMap.continuous_of_isClosed_graph` (`Mathlib/Analysis/Normed/Operator/Banach.lean`; for
  complete spaces, a linear map with closed graph is continuous; §2.1),
  `ContinuousLinearMap.adjoint`, `IsCompactOperator`, `unitary`, `LinearPMap` with its graph,
  `LinearPMap.adjoint` and `LinearPMap.adjoint_isClosed`
  (`Mathlib/Analysis/InnerProductSpace/LinearPMap.lean`; for a densely defined operator between
  Hilbert spaces the adjoint is closed; §§6.1, 6.5), and the continuous functional calculus
  (§§2.2, 6.4).
- *Separation*: `geometric_hahn_banach_point_closed` (`Mathlib/Analysis/LocallyConvex/Separation.lean`;
  a point outside a closed convex set is strictly separated from it by a continuous linear
  functional; §7.2).
- *Commutative algebras*: `ContinuousMap.idealOfSet` and `ContinuousMap.idealOfSet_ofIdeal_eq_closure`
  (`Mathlib/Topology/ContinuousMap/Ideals.lean`; for compact Hausdorff X every ideal of `C(X, 𝕜)`
  has closure the ideal of functions vanishing on its zero set), and the Tietze extension theorem
  `ContinuousMap.exists_restrict_eq` (`Mathlib/Topology/TietzeExtension.lean`); §5.2.
- *Spaces and coefficients*: `ZeroAtInftyContinuousMap`, `AddCircle`, `lp`, `PartitionOfUnity`, and
  `cechComplexFunctor` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean`; the Čech complex
  of a presheaf for a family of objects, in degree n the product over `Fin (n + 1)`-tuples of
  indices); `Module.Finite` and `Module.Projective` for §2.7.

### From Tau Ceti

- *Čech cohomology* (`TauCeti/CategoryTheory/Sites/SheafCohomology/Cech/` and
  `TauCeti/Topology/Sheaves/`): the refinement maps `TauCeti.CategoryTheory.cechComplexMap` with
  `TauCeti.CategoryTheory.cechComplexMap_id`, `TauCeti.CategoryTheory.cechComplexMap_comp` and
  `TauCeti.CategoryTheory.cechComplexMap_naturality`; the homotopy
  `TauCeti.CategoryTheory.cechComplexMapHomotopy` between the maps induced by two morphisms of
  families, and `TauCeti.CategoryTheory.cechComplexHomologyMap_eq` (they agree on cohomology); the
  colimit over a directed system of families `TauCeti.CategoryTheory.cechCohomology`, and
  `TauCeti.CategoryTheory.cechCohomologyIso` for two mutually cofinal systems; the
  point-neighbourhood covers `TauCeti.Topology.PointOpenCover` (indexed by the space, with
  `TauCeti.Topology.PointOpenCover.exists_refinement` refining every small open cover and
  `TauCeti.Topology.PointOpenCover.inter` giving common refinements); the Čech cohomology of
  presheaves on a space `TauCeti.Topology.cechCohomology`, a functor of the presheaf, with
  `TauCeti.Topology.toCechCohomology` from any small open cover; and the fixed-cover restriction
  and pullback maps `TopologicalSpace.Opens.cechComplexRestrict` and
  `TopCat.Hom.cechComplexPullback`, which commute with refinements
  (`TopCat.Hom.cechComplexMap_comp_cechComplexPullback`) and coefficient morphisms
  (`TopCat.Hom.cechComplexPullback_naturality`). No hypothesis on the space is made. The
  topological Čech diagrams `TauCeti.TopCat.cechOpenDiagram`, `TauCeti.TopCat.cechTopDiagram` and
  `TauCeti.TopCat.cechRefinementNatTrans` give the same tuple intersections and refinements in
  `TopCat`. Used in §§5.10–5.13.
- *Representations and multipliers* (`TauCeti/Analysis/CStarAlgebra/`):
  `NonUnitalStarAlgHom.IsNondegenerate` (the vectors `π a ξ` span a dense subspace) and
  `NonUnitalStarAlgHom.multiplierExtension` (the unique extension of a nondegenerate representation
  to `𝓜(ℂ, A)`), in `Representation/Nondegenerate.lean`; `DoubleCentralizer.congr`, the extension of
  a *-isomorphism to the multiplier algebras, in `Multiplier.lean`. Used in §§3.4, 5.9, 7.2.
- *Bundles and CW structures*: `TauCeti.FiniteRankBundleCore`
  (`TauCeti/Topology/VectorBundle/FiniteRank/Basic.lean`; finite-rank bundles glued from continuous
  matrix-valued transition functions), the product CW structure `TauCeti.cwComplexProd`
  (`TauCeti/Topology/CWComplex/Classical/Product.lean`) and the vanishing of `πₖ(Sⁿ)` for `k < n`,
  `TauCeti.subsingleton_homotopyGroup_sphere_of_lt` (`TauCeti/AlgebraicTopology/Sphere/HomotopyGroup.lean`).
  Used in §§5.4, 5.6–5.7.
- *Hilbert-space partial operators*: the Cayley transform `LinearPMap.cayley`
  (`TauCeti/Analysis/Normed/Operator/LinearPMap/Cayley.lean`; `1 + 2iR(−i)`, the bounded form of
  `(A − i)(A + i)⁻¹` when −i is a resolvent point) and `IsSelfAdjoint.cayley_mem_unitary`
  (`TauCeti/Analysis/InnerProductSpace/LinearPMap/Cayley.lean`; it is unitary for a selfadjoint
  operator on a complex Hilbert space). Used in §6.5.

### From TauCetiRoadmap.CStarAlgebras

C1.3 (closed ideals and quotient C*-algebras), C1.4 (approximate units), C1.7 (multipliers and the
strict topology), C2.2 (representations, and the correspondence between pure states and
irreducible GNS representations), §2.6, whose heading carries the label C2.AnnHull (primitive
spectra with the hull–kernel topology, and, for §7.2, the separation of closed left ideals by pure
states: every closed left ideal J is the intersection of the left kernels `{a : ω(a*a) = 0}` of
the pure states ω whose left kernels contain J, and for each a ∉ J one of them has `ω(a*a) > 0`),
C2.7 (the Dauns–Hofmann theorem `Z(M(A)) ≅ C_b(Prim(A))`), C5.1 (the spatial tensor product
`⊗min`, completed from the spatial norm of VonNeumannAlgebras), C5.4 (C*-inductive limits),
C6.1–C6.2 (nuclearity), C7.1 (exactness, by exactness of `A ⊗min −` on closed-ideal sequences) and
C9.7 (exactness passes to quotients). They are assumed as stated there, for complex C*-algebras
that need not be unital.

### From TauCetiRoadmap.BanachSpaceTheory

B1, the consequences of Hahn–Banach separation used for the separation theorem of §7.2: the bipolar
theorem and the agreement of weak and norm closures of convex sets.

### From TauCetiRoadmap.BanachAlgebras

A4 (Layer 4), §4.3: the Cohen–Hewitt factorization theorem for Banach modules over algebras with
bounded approximate units, used in §1.3 for `x = ya`.

### From TauCetiRoadmap.VonNeumannAlgebras

V0 (states of C*-algebras, with GNS through Mathlib), V4.Core (the trace `Tr` on `B(H)` with values
in `[0, ∞]`, for arbitrary, possibly nonseparable, H), V4.Normality (normal representations) and
V7.StandardAmplifications (normal Hilbert modules of a finite factor, with a right action recorded
as a left action of the opposite algebra). Used in §§3.4, 3.8, 5.8, 7.2.

### From TauCetiRoadmap.OperatorTheory.SelfAdjointSpectralTheory

The `zI − T` resolvent convention of its Notation, Part C (closed graphs, graph norms and cores of
Hilbert-space operators) and Part D (resolvents), for the scalar specializations of §§6.4–6.5.

### From TauCetiRoadmap.TopologicalKTheory

T1: continuous finite-rank bundles with their morphisms and local trivializations (item 1),
pullbacks (item 2), Hermitian metrics (item 3), numerable homotopy invariance (item 4), and the
section-extension theorem on finite-dimensional CW pairs for the bundle of surjections `E → F` with
its dimension bounds (item 5), with the connectivity of spheres recorded in T1.5a; the carrier
`TauCeti.FiniteRankBundleCore`. Used in §§5.3–5.7.

### From TauCetiRoadmap.CharacteristicClasses

C1.2b (constant-coefficient Čech cohomology and the comparison `cechSingularCWTypeComparison` with
singular cohomology for paracompact Hausdorff spaces of CW type, used for `S³` in §5.11), C1.6 (the
classification of complex line bundles over CW-type bases by the first Chern class, §§5.5, 5.7),
and the normalization `c(F) = det(1 + (i/(2π))F)` of its Conventions, which for a line gives
`c₁ = [iF/(2π)]` (§5.5).

### From TauCetiRoadmap.AlgebraicTopology

§4.5 (cofibrations, relative CW pairs, homotopy extension, and the product cell structure
`TauCeti.cwComplexProd` of finite CW complexes), giving T² its finite CW structure in §5.7; Layer 6
(ordinary cohomology), through CharacteristicClasses' comparisons.

### From TauCetiRoadmap.SmoothBundlesConnections

B1.3 (smooth bundles glued from smooth cocycles), B3.3 (induced connections on associated
bundles), B6.0 (finite smooth good covers refining every open cover of a compact manifold without
boundary), B6.2 (the first Chern class of a circle bundle through the dual-character line) and B6.3
(rank-one Chern–Weil, `c₁(P)_ℝ = [F/(2π)]`). Used in §§5.5, 5.11.

### From TauCetiRoadmap.DifferentialGeometry

§5.2: integration of top forms on an oriented manifold (Tau Ceti's `TauCeti.integralTopForm`), used
for `∫_T² ds ∧ dt = 1` in §5.5.

### From TauCetiRoadmap.PDE

§1.1 (A1, weak derivatives and the Sobolev spaces `W^(1,p)`, with integration by parts on an
interval), §1.2 (A2, smooth density and the zero-boundary spaces, `H₀¹` for p = 2) and §1.6 (A6,
boundary traces, with the kernel of the trace the zero-boundary space). Used in §7.4.

## References

- I. Raeburn and D. P. Williams, *Morita Equivalence and Continuous-Trace C*-Algebras*, Mathematical
  Surveys and Monographs 60, AMS, 1998. Chapters 2–3 for Hilbert modules, induction and
  imprimitivity: Lemma 2.5 (Cauchy–Schwarz), Definitions 2.17 and 2.24 (adjoints and rank-one
  maps), Corollary 2.54 (multipliers of `K(E)`), Lemma 2.65 (Gram positivity), Theorem 3.19
  (linking corners), Theorem 3.22, Proposition 3.24 and Corollaries 3.31–3.33 (the ideal and
  spectrum correspondence). Chapter 4 for the cocycle and bundle prerequisites. Definition 5.13 and
  Proposition 5.15 (continuous trace and local Morita equivalence); Proposition 5.24 and
  Theorem 5.29 (the Dixmier–Douady invariant and classification); Theorem 4.85 (compact-operator
  bundles); Theorem 5.49, Proposition 5.50 and Theorem 5.55 (stabilization); Corollary 5.56 (stable
  classification); Theorem 6.3 (the Brauer group).
- J. Dixmier and A. Douady, [*Champs continus d'espaces hilbertiens et de
  C*-algèbres*](https://www.numdam.org/article/BSMF_1963__91__227_0.pdf), Bull. Soc. Math. France
  91 (1963), 227–284: Definition 1 for the section axioms, Proposition 3 for the field generated by
  a family with dense evaluations, Proposition 4 for Banach-field reconstruction from a module
  complete for local uniform convergence, and §9 for Hilbert fields. §5.3 supplies the `C₀`-module
  specialization and the quotient inner-product identifications.
- D. P. Williams, *Crossed Products of C*-Algebras*, Mathematical Surveys and Monographs 134, AMS,
  2007, Appendix C: Definitions C.16 and C.21 and Theorems C.25–C.26, for upper semicontinuous
  bundles, sections and the reconstruction of `C₀(X)`-algebras.
- Liu–Luo–Xu, [*The Polar Decomposition for Adjointable Operators on Hilbert
  C*-Modules and Centered Operators*](https://arxiv.org/abs/1807.01598): Theorem 3.8 and
  Remark 3.11, for the polar-decomposition criterion with norm-closed range support projections.
- B. Blackadar, *Operator Algebras*, Encyclopaedia of Mathematical Sciences 122, Springer, 2006,
  II.7, for Hilbert modules, adjointable and compact operators, tensor products, multipliers and
  Morita equivalence.
- J. Roe, [*Lectures on K-Theory and Operator
  Algebras*](https://bpb-us-e1.wpmucdn.com/sites.psu.edu/dist/1/4020/files/2017/12/KTheoryNotes-1uvuwyz.pdf),
  Proposition 10.2, for the compact-identity and finite-projectivity criterion.
- A. Hatcher, [*Vector Bundles and K-Theory*](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf),
  Proposition 3.10, for the classification of complex line bundles over spaces of CW homotopy type
  by the first Chern class, and §§1.1–1.2 for bundle background.
- G. Teschl, [*Mathematical Methods in Quantum Mechanics*, second
  edition](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe2.pdf), §2.6, Theorem 2.27,
  for the Hilbert-space deficiency extension API; the convention `U = −V` translates his Cayley
  unitary to the displayed domain.
- J. Kaad and M. Lesch, [*A Local Global Principle for Regular Operators in Hilbert
  C*-Modules*](https://arxiv.org/abs/1107.2372): §2 for regularity and localization, §3,
  Theorem 3.1, for state separation, §4, Theorem 4.2, for the local–global principle, Theorem 5.6
  for its pure-state form given pure-state separation, §6 for the boundary-condition examples,
  Assumption 7.1 and Theorem 7.10 for the sum theorem, and the appended erratum, Theorem 2.1, for
  pure-state separation from a proper closed submodule. The pure-state principle for symmetric
  operators is Theorem 1.18 of F. Pierrot, *Opérateurs réguliers dans les C*-modules et structure
  des C*-algèbres de groupes de Lie semisimples complexes simplement connexes*, J. Lie Theory 16
  (2006), 651–689; the erratum states it as its Conjecture 1.1 and credits it to Pierrot.
- The [Mathlib discussion of the module convention](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/redefining%20%60Inner%60%20in%20%60InnerProductSpace%20%F0%9D%95%9C%20%F0%9D%95%9C%60)
  explains the use of the opposite algebra for right modules and the prevention of scalar-instance
  diamonds; the [`WithCStarModule` discussion](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/defeq%20abuse%20in%20%60WithLp%60)
  explains type synonyms for the module norm; the [sheaf-cohomology design
  discussion](https://leanprover.zulipchat.com/#narrow/stream/335062-homology/topic/Roadmap%20for%20sheaf%20cohomology)
  specifies the Ext-based cohomology and the comparison from cover complexes. Convention 8 follows
  these designs.
