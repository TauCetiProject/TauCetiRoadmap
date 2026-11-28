# Roadmap: q-difference equations and isomonodromic deformations

**Summary.** For a fixed complex `q` with `0 < |q| < 1`, this roadmap develops rational
`q`-connections of arbitrary finite rank, their local analytic classification, and deformations
that preserve their connection data. The algebra uses the
shared category of linearized modules and compares it with invertible semilinear operators for an
automorphic shift. On the projective line a
rational `q`-connection is a vector bundle `E` with a rational isomorphism
`A: E ⇢ σ_q^*E`, where `σ_q(z) = qz`. Choosing a rational frame gives the system
`Y(qz) = A(z)Y(z)`.

The local classification includes resonance, nonsemisimple regular singular factors, and arbitrary
rational slopes. It constructs the slope filtration and formal decomposition, then classifies
analytic modules with a marked formal type by torsors for the `q`-Stokes sheaf on the elliptic curve
`E_q = ℂˣ/q^ℤ`. The marked coefficient functor is represented by an affine
space, and a quotient stack describes the same coefficient families with locally specified graded
type. A second description of local analytic modules uses holomorphic bundles on `E_q` with a
specified rational anti-Harder–Narasimhan filtration.

The global comparison is an equivalence of categories over `ℂ`. Its data are the local
analytic modules at `0` and `∞` and a meromorphic isomorphism between their associated elliptic
bundles. It is constructed by extending local maps, factoring a meromorphic transition matrix, and
gluing objects and morphisms. In the regular singular case it gives the classification by local
constant systems and the Birkhoff connection matrix. Relative connections on schemes and complex
analytic spaces with an automorphism use finite locally free sheaves and divisors that control the
support of poles. The relative
targets include endpoint localization and completed base change, as well as specific analytic family
theorems under stated bounds.

The global equivalence lifts coherent isomorphisms of connection data along a time groupoid to
rational horizontal gauges. For several time directions, these gauges satisfy both the `q`-Lax
equations and the square identities. For polynomial systems with separated spectral groups, factor
reordering gives commuting discrete Schlesinger transformations in every rank and degree, on a
nonempty Zariski-open set for each prescribed finite range of times.

## How to read the build

Layers 0 and 1 build the algebra and the geometry of bundle models, relative objects, and local
lattices. Layer 2 constructs the elliptic curve and regular singular solutions. Layers 3 and 4 give
the formal and analytic local classifications. Layer 5 reconstructs rational systems and all their
horizontal maps from connection data. Layer 6 treats time transport and analytic families. Layer 7
starts with algebraic matrix refactorization and uses Layers 5 and 6 to interpret its gauges as
connection-preserving transport. Each *Needs* line gives the suppliers for the corresponding target.

## Conventions

Write `ℂˣ` for the nonzero complex numbers. Composite indices and exponents use parentheses,
as in `x_(i,j)` and `q^(−kᵢ)`.

- **Base rings and ranks.** For a commutative ring `R` and a unital endomorphism `σ`, a
  linearized module has an isomorphism `L: R ⊗_(R,σ) M ≃ M`. The shared category is
  [PhiGammaModulesAndIwasawaCohomology §0.1][pg-linear]. Here a *difference module* means the
  automorphism case, with the equivalent invertible semilinear presentation of §0.1.
  The scalar extension and model constructions of §0.2 also apply to endomorphisms. The finite
  projective category includes rank zero, and over a field this means finite dimension.
  Spectral, cyclic-vector and polynomial-factorization statements use positive rank. Geometric
  ranks may be locally constant and may be fixed on the components used in a given statement.
- **The shift.** Write `σ_q f(z) = f(qz)`. Fix `0 < |q| < 1` for the complex analytic
  classification and comparison. Algebraic targets state their own hypotheses, including
  infinite multiplicative order where used.
- **Matrices.** A system `σ_q Y = AY` has semilinear operator `Φ_A = A⁻¹σ_q`. A
  horizontal matrix `H: A → A′` satisfies `(σ_q H)A = A′H`. An invertible horizontal matrix `G`
  gives `A′ = (σ_q G)AG⁻¹`. On bundles the fibre map of `A` goes from `E_z` to `E_qz`.
- **Endpoints.** At `0` use `K = ℂ({z})`, the field of meromorphic germs, and
  `K̂ = ℂ((z))`. At `∞` first use `w = z⁻¹` and write the system as
  `Z(q⁻¹w) = C(w)Z(w)`. For local classification use `Z(qw) = C(qw)⁻¹Z(w)`. A raw slope at
  infinity refers to the original action in coordinate `w`. For `A = cz^(−m)`, the slopes at
  zero, at infinity before reversal, and at infinity after reversal are `m, −m, m`. The order of
  `det A` at infinity is taken before reversal.
- **Slopes and ramification.** A slope is the negative of the geometric slope of a lower Newton
  edge for the annihilator of `Φ_A`. Thus `A = z^(−μ) C` has slope `μ`. To ramify by
  `z = u^r`, choose `p` with `p^r = q` and let `u ↦ pu`. Record changes of root using descent.
- **Transport.** The time shift `T` preserves `q`. For `Y(z,Tt) = B(z,t)Y(z,t)` the compatibility
  equation is `A(z,Tt)B(z,t) = B(qz,t)A(z,t)`. Connection preservation specifies isomorphisms and
  their composition. Local lattices, formal markings, fundamental-solution normalizations, and time
  isomorphisms are separate data.

## Layer 0: Difference modules and coefficient fields

### 0.1 Linearized modules, semilinear presentations, and horizontal maps

Let `R` be a commutative ring and `σ` an automorphism. Use the objects, horizontal maps and
finite projective subcategory of [PhiGammaModulesAndIwasawaCohomology §0.1][pg-linear]. Compare
the isomorphism `L: R ⊗_(R,σ) M ≃ M` with an invertible `σ`-semilinear operator
`Φ_M: M → M` by `Φ_M(m) = L(1 ⊗ m)` and `L(a ⊗ m) = a Φ_M(m)`. Prove that the two
invertibility conditions are equivalent under the automorphism hypothesis. Give the comparison on
all modules, on finite projective modules and on finite-dimensional modules over fields.
[KL15, Convention 1.5.1][KL15], [RSZ13, §2.1.1][RSZ13].

A morphism is an `R`-linear map `f: M → N` with `f ∘ Φ_M = Φ_N ∘ f`. Identify this
condition with the square for `L`. Compare identities, composition, isomorphisms and the
forgetful functor. In the automorphism case construct zero, direct sums, kernels and cokernels.
Prove that forgetting the action is faithful and reflects isomorphisms and that the category on
all modules is abelian. Use the underlying short exact sequences for the exact structure on finite
projectives. Over a field the finite-dimensional subcategory is abelian. For `σ = id` recover
modules with a linear automorphism.

*Needs:* [PhiGammaModulesAndIwasawaCohomology §0.1][pg-linear], Mathlib's semilinear
[`LinearMap`][ml-semilinear-map] and [`LinearEquiv`][ml-linear], module categories and short
exact sequences. Use the two inverse identities for `σ` and `σ⁻¹` in the semilinear API.

### 0.2 Tensor products, duals, scalar change, and models

Use tensor, unit and dual on finite projective linearized modules from
[PhiGammaModulesAndIwasawaCohomology §0.1][pg-linear]. Compare their rigid symmetric monoidal
structure with the invertible semilinear presentation. Its unit is `(R,σ)`, its tensor operator
sends `m ⊗ n` to `Φ_M(m) ⊗ Φ_N(n)`, and its internal Hom operator sends `f` to
`Φ_N ∘ f ∘ Φ_M⁻¹`. On the dual this is `σ ∘ f ∘ Φ_M⁻¹`. Compare evaluation and
coevaluation, exterior powers, determinant and the determinant of a short exact sequence.
Identify horizontal elements in internal Hom with morphisms.

For a ring map `f: R → S` with `τ ∘ f = f ∘ σ`, use the supplied scalar extension
`f*` for unital endomorphisms. For automorphisms compare it with the operator
`s ⊗ m ↦ τ(s) ⊗ Φ_M(m)` on `S ⊗_R M`. Give the unit, composition and tensor comparisons
and their coherence, including the comparison with duals and exterior powers. Scalar extension
preserves finite projectivity and admissible short exact sequences, whose underlying module
sequences split. Preservation of arbitrary kernels and short exact sequences uses flatness.
With automorphisms, give restriction of scalars, preservation of finite projectivity when
`S` is finite projective over `R`, and the rank formula for finite field extensions.
[RSZ13, §2.1.1][RSZ13].

**Models along scalar extension.** For unital endomorphisms and a commuting map `f` as above,
apply the native [categorical pullback][ml-cat-pullback] to `f*` on finite projective linearized
modules and the identity functor of the target category. An object is `(N,M,α)` with
`α: f*N ≃ M`. A map to `(N′,M′,α′)` is a pair of horizontal maps `(u,v)` with
`v ∘ α = α′ ∘ f*u`. For models of a fixed `M`, use the pullback of the induced functor on
[cores][ml-core] along the functor selecting `M` from the terminal groupoid. Its maps are
isomorphisms `u` with `α′ ∘ f*u = α`.

Compose comparisons along `R → S → T` using the identity and composition isomorphisms for
scalar extension. For a commutative square of maps compatible with the endomorphisms, base change
the model and both maps and compare direct sums, tensor and dual. Compare determinant on the
fixed-rank core. Apply the construction to generic-fibre and localization functors in
§§1.1 and 1.6–1.8. Section 3.6 supplies realization by a submodule and freeness for the
pure Laurent case. Section 5.1 supplies existence and uniqueness for filtered Laurent models.

**Check.** Take `R = (ℂ[ε]/(ε²))[z,z⁻¹]`, `S = ℂ({z})`, and the map sending `ε`
to zero and `z` to `z`. Let the shift fix `ε` and send `z` to `qz`, with `q ≠ 0`.
The standard rank-one modules `N = R` and `M = S` have the usual scalar extension
comparison. The map `N → M` kills `εR`. Multiplication by `1 + ε` is a nonidentity
automorphism of the model whose extension is the identity on `M`.

*Needs:* §0.1, [PhiGammaModulesAndIwasawaCohomology §0.1][pg-linear], Mathlib's module tensor
structure and scalar extension pseudofunctor, Tau Ceti's finite projective duality, and Mathlib's
[categorical pullback][ml-cat-pullback] and [core][ml-core].

### 0.3 Matrix presentations, gauge, and reversal

Over a field `K`, identify the category of matrix systems with arbitrary rectangular horizontal
matrices with the category of finite-dimensional difference modules. Use a basis to write
`Φ = A⁻¹σ`. In the basis and its scalar extension, the matrix of the linearization `L` is
`A⁻¹`. Show that horizontal maps compose by matrix multiplication and that the core is
the gauge groupoid. Give the matrix rules for direct sum, tensor, dual (inverse transpose),
determinant and scalar change. In particular, `det A′ = σ(det G)det A/det G`. Over a general
ring use local frames of the module and its twist. A localization used as a difference ring must be
`σ`-stable. [S03, §1.1.2][S03], [K16, Remark 1.8][K16].

For a ring automorphism `σ`, reversal sends `(M,Φ)` to `(M,Φ⁻¹)`, replaces
`σ` by `σ⁻¹`, and acts
identically on horizontal maps. In matrices it sends `A` to `σ⁻¹(A)⁻¹`. Construct the
involutive exact symmetric monoidal equivalence and its compatibility with scalar change. For the
`r`-shift, reversal sends `cz^m` to `c⁻¹r^mz^(−m)` and transports the singular support by
multiplication by `r`.

*Needs:* §§0.1–0.2, bases, matrices, and determinants.

### 0.4 Rational, analytic, and formal coefficient fields

For `q ≠ 0` construct the shift on `ℂ(z)`, `K`, `K̂`, and the meromorphic function
field of `ℂˣ`. Construct the equivariant embeddings
`ℂ(z) → K → K̂` by localization and Laurent expansion, and compare them with
localization at infinity and reversal. The local shifts preserve valuation and are continuous for
the formal valuation topology. If `q` has infinite order, coefficient comparison gives constants
`ℂ` for the rational, analytic local and formal fields.

For `z = u^r` and `p^r = q`, construct equivariant finite Galois extensions in the analytic and formal
cases. The basis is `1,u,…,u^(r − 1)` and the deck group is `μᵣ`. In the analytic case, group
Laurent coefficients by exponent modulo `r` and prove convergence of each grouped series.
[RSZ13, §2.1.1][RSZ13], [VPR07, §1][VPR07].

*Needs:* §0.2, Mathlib's [`RatFunc`][ml-rat] and [`LaurentSeries`][ml-laurent], Tau Ceti's
meromorphic germs and pullback, FormalLaurentPuiseux Layers 1, 4 and 6, and ComplexKahlerGeometry
§§3.2–3.3.

### 0.5 Skew Laurent operators and cyclic vectors

Use [`SkewMonoidAlgebra R (Multiplicative ℤ)`][ml-skew] with the action by powers of `σ` for
`D = R[Φ,Φ⁻¹;σ]`. Its relation is `Φ a = σ(a)Φ`. Compare the nonnegative
exponents with [`SkewPolynomial R`][ml-skewpoly] and prove the universal property of adjoining the
inverse of `Φ` using `liftNCRingHom`. The action is supplied explicitly. If a coefficient ring is
fixed by `σ`, use its central action.

Identify all difference modules with left `D`-modules via `(aΦ^j)m = aΦ_M^j(m)`, with the finite
projective or finite-dimensional condition on restriction to `R`. Compare reversal with
`j ↦ −j`. Over each field in §0.4 with constants `ℂ`, prove the cyclic vector theorem
for infinite-order `q` and rank `n > 0`. The vectors `e,Φ e,…,Φ^(n − 1)e` give a basis and a
presentation `D/DP`, with `P` monic of degree `n` and with nonzero constant coefficient. Give the
companion matrix construction and its inverse on cyclic presentations. [RSZ13, Lemma 2.1.1][RSZ13].

*Needs:* §§0.1–0.4 and Mathlib's skew monoid algebra product, coefficient inclusion and lifting API.

### Examples

- In rank one, `G = z^m` sends `A = c` to `q^mc`. For `q = 1/2` and `A = z − 1`, the
  matrix for the inverse action is `(2z − 1)⁻¹`.
- For `q = 1`, the identity on a two-dimensional space has no cyclic vector. Over `ℂ[x]`,
  multiplication by `x` has a nonprojective cokernel.

### Dependencies

The matrix and operator descriptions use the intrinsic category and scalar change. The local fields
use the existing analytic and formal coefficient carriers.

## Layer 1: Connections on bundles, lattices, and singularities

### 1.1 Rational difference connections and the generic fibre

Let `X` be a smooth projective integral curve over a field `k`, with a `k`-automorphism `σ_X`.
Use a finite locally free sheaf `E` and a rational isomorphism `A: E ⇢ σ_X^*E`. A
regular horizontal map `f: E → F` satisfies `(σ_X^*f)A_E = A_F f` as a rational equality. Form
also the category with rational horizontal maps. Generic fibre is an equivalence from the latter
category to difference modules over `k(X)`, via `Φ = A⁻¹σ_X`. Construct the quasi-inverse
from rational bases and trivial bundles, and give the comparisons for tensor, dual, determinant, and
pullback. Specialize to `(ℙ¹_ℂ,z ↦ qz)`. [K16, Definition 1.5][K16].

*Needs:* Layer 0, AlgebraicVectorBundles §§1.1–1.2 and 3.1–3.2, and AlgebraicCurves §§1.1–1.2 and
Layer 12.

### 1.2 Bundle models and local lattices

Fix a generic module `V`. Identify bundle models with full `𝒪_(X,p)`-lattices
`Λₚ ⊂ V` at the closed points, standard in one rational basis outside a finite set.
Reconstruct the bundle by gluing and show that a generic map extends regularly exactly when it
carries each lattice into the corresponding lattice. For isomorphisms use equality of lattices.
Transport `A` to the maps from `Λₚ` to the pullback lattices, and compare with completed
lattices, finite changes and the tensor, dual and determinant lattice operations.

*Needs:* §1.1, AlgebraicCurves §§1.1–1.2, 5.7 and Layer 12.

### 1.3 Smith type and determinant divisor

At `p` let `ν₁ ≤ ⋯ ≤ νₙ` be the Smith exponents of `A` between its two lattices. Prove
independence of uniformizer and regular frames. All exponents vanish exactly at regular isomorphism
points. A negative exponent records a pole of `A` and a positive exponent a pole of its inverse.
Construct the finite singular support and the determinant divisor with coefficient
`d_A(p) = Σᵢ νᵢ(p)`. Its degree is zero because `σ_X` preserves bundle degree. Give the
direct sum and dual rules and compatibility with pullback and regular gauges.
[K16, Definition 1.6][K16].

*Needs:* §§1.1–1.2, Mathlib's DVR Smith normal form after clearing denominators, AlgebraicCurves
§§3.1–3.2, and AlgebraicVectorBundles §3.2.

### 1.4 Modifications and transport along singular orbits

A rational isomorphism `G: E ⇢ E′` gives the modified connection with
`A′ = (σ_X^*G)AG⁻¹`. Compare this with finite changes of lattices in a fixed generic fibre,
including compositions, inverses, and commutation of changes at disjoint points. On
`ℙ¹_ℂ` with the `q`-shift, set `r_G(p) = ordₚ det G` and prove

```
d_(A′)(p) = d_A(p) + r_G(qp) − r_G(p).
```

The determinant sum on any nonzero `q`-orbit, and the endpoint determinant orders, are invariant.
Compare endpoint exponent shifts with analytic and formal isomorphisms.
[K16, Definition 1.7 and Remark 1.8][K16].

*Needs:* §0.3 and §§1.2–1.3.

### 1.5 Elementary modifications at simple zeros and poles

At `a ≠ 0`, let `A` have a simple determinant zero, rank `n − 1`, and a regular isomorphism at `a/q`.
For `t = z − a`, enlarge `Λ_a` by `t⁻¹` times the lift of `ker A(a)`, keeping the other
lattices. Prove independence of the lift and check in a compatible frame that the gauge is
`diag(z − a,1,…,1)`. The zero moves to `a/q`, the determinant ratio is
`(qz − a)/(z − a)`, and the bundle degree increases by one. In the pole case use Smith type
`(−1,0,…,0)` and shrink the lattice using the kernel of the principal part. The simple pole
moves by the same shift and the bundle degree decreases by one. Construct the inverse changes, and
track regularity and disjointness hypotheses at every step of a finite composition.

*Needs:* §§1.2–1.4 and the finite-length quotient description of degree.

### 1.6 Relative difference connections, base change, and descent

Fix a scheme `X → B` with a `B`-automorphism `σ_X`. Use the same data in complex analytic
spaces for the analytic construction, allowing nonreduced bases. For each test base `S → B` put
`X_S = X ×_B S` and write `σ_S` for the induced automorphism. Let `D ⊂ X_S` be an
effective Cartier divisor that stays effective Cartier under the allowed base changes.
Write `𝒪_X` for the structure sheaf on `X_S` in the following localization formulas. A
relative difference connection consists of a finite locally free sheaf `E` and an
`𝒪_X(*D)`-linear isomorphism `A` in

```
𝒪_X(*D) = colimₘ 𝒪_X(mD),
E(*D) = E ⊗_(𝒪_X) 𝒪_X(*D),
A: E(*D) ≃ (σ_S^*E)(*D).
```

The allowed divisor gives the support of the poles of `A` and `A⁻¹`, with locally finite
orders. The same localization is obtained from `2D`. To prescribe fixed pole orders, keep
separate regular extensions `A: E → (σ_S^*E)(mD)` and `A⁻¹: σ_S^*E → E(nD)`.
A global order bound or finiteness of `D → S` is an additional hypothesis when used.
Write `Q_D(S)` for the category whose maps are all regular sheaf maps satisfying
`(σ_S^*f)A_E = A_F f` after localization. Its core is the moduli groupoid.
Use locally split underlying short exact sequences for the exact structure. Show that enlarging
`D` to `D′ ≥ D` gives a fully faithful functor on regular horizontal maps and use a common
divisor to compare two presentations. On schemes compare the localization definition with an
isomorphism `E|_U ≃ (σ_S^*E)|_U` for `U = X_S ∖ D`, regardless of whether `U`
is invariant. On analytic spaces use the finite-order meromorphic condition along `D`.
[K16, Definition 1.5][K16], [SPD, Lemmas 31.19.1 and 31.19.3][SPD].

On `ℙ¹_B` with `σ_X(z) = qz` for a unit `q ∈ Γ(B,𝒪_B)ˣ` this is the relative
rational `q`-connection. On `𝔾_(m,B)` with `D = 0` it is the Laurent system
`A: E ≃ σ_S^*E` on the multiplicative group. For an algebraic test base `S = Spec C`
with `C` any commutative coefficient ring, use the affine bundle equivalence to identify
such systems with finite projective linearized modules over `C[z,z⁻¹]`. The correspondence
sends `A` to the inverse of the linearization `L`. Compare all horizontal maps, base
change, tensor and dual. The geometric Laurent system is defined on `𝔾_m` itself.

Construct pullback along `S′ → S` by pulling back both the sheaf and the divisor. The same
construction works for an equivariant map `h: X′ → X_S` when `h^*D` is effective
Cartier. Include restriction to invariant open sets and equivariant ramification, and give
the identity and composition comparisons and their coherence with the exact structure,
tensor, dual and determinant.

The sheaf `σ_S^*(E(*D))` is `(σ_S^*E)(*σ_S^*D)`, whereas the target of `A` uses
`D`. The support of `σ_S^*D` is `σ_S⁻¹(Supp D)`. For example, compose
`(σ_S^*A)A` after localization at `D + σ_S^*D`. Use the corresponding finite sum of
pullback divisors for longer composites. An action on a single localized coefficient ring
requires an invariant localization. If `τ = σ_S⁻¹`, reversal is `τ^*(A⁻¹)` with allowed
divisor `τ^*D`, whose support is `σ_S(Supp D)`. Compare reversal with horizontal
maps, base change, markings and enlargement.

For fixed data `(X,σ_X,D_B)` over `B`, prove fpqc descent for the category and its core
on the algebraic side and open-cover descent on the analytic side. Descend the sheaf, the
isomorphism after localization and the horizontal commuting square. When both `S` and
`X_S` are locally of finite type over `ℂ`, apply coherent analytification at each finite
pole order and compare horizontal maps, composition, tensor and base change. Construct the
restriction, determinant, framing and flag functors used by §1.7, including restriction to
the endpoint sections on `ℙ¹` when the connection is regular there. Use locally free kernels
and quotients on the loci where modifications are made.

**Check.** Take `B = ℙ¹_ℂ`, `X = 𝔾_m × B`, `σ_X(z,b) = (qz,b)` and `D = 0`.
For the projection `π: X → B` the bundle `π^*𝒪_B(1)` has its natural shift
isomorphism. Its restriction along the section `z = 1` is `𝒪_B(1)`, so the Laurent
system has a nontrivial underlying bundle.

*Needs:* §§0.1–0.2, [Tau Ceti's affine bundle equivalence][tc-bundle-affine],
AlgebraicVectorBundles §§1.1–1.2 and 2.1–2.2, SchemeAndStackFoundations §§1.1 and 1.18,
ComplexComparisonPartII §§C-1.1, C0.1–C0.2 and C0.4. Use §§1.1–1.4 for the comparison
with rational connections, lattices and modifications.

### 1.7 Local conditions, markings, and modification groupoids

Let `Q` be the core of the relative connection category, with a restriction `r: Q → L`, and let
`P → L` specify allowed data. Use `Q×_L^hP` for connections equipped with an isomorphism
`r(E,A) ≃ p(η)` for `η ∈ P`. A morphism is a pair of isomorphisms compatible with that
identification. Construct the change-of-base and forgetting maps. Instantiate with a fixed
determinant connection, a frame along a section, and flags with locally free successive quotients.
A marked fibre specifies the identification. The allowed-type groupoid retains its own automorphisms.

Construct `Q_mer` by allowing horizontal maps with finite relative pole bounds, using
common enlargements and also bounding the inverse for isomorphisms. For decorated groupoids
`Q_α,Q_β`, use `Q_α×^h_(core(Q_mer))Q_β` for their modifications.
Prove the base-change and composition laws. Within a common localization a meromorphic gauge is a
regular isomorphism exactly when it carries the source subsheaf onto the target. Over a field
recover the criterion at all closed-point lattices. A modification rule gives a functor from source
to target when the source projection of its groupoid is an equivalence. If the target projection is
an equivalence too, the reverse rule gives the inverse functor.

*Needs:* §§1.1–1.6, SchemeAndStackFoundations §1.18, and [SPF, Lemma 8.5.6][SPF].

### 1.8 Relative endpoint localization and formal completion

Let `i₀:S → X_S` be the zero section, `I₀` its ideal, and `z` the transverse coordinate. Assume
that locally on `S` the pole bound fits into `m₀[0] + m_∞[∞] + D_fin` with
`D_fin` disjoint from the endpoints and stable as a relative Cartier divisor under base
change. Thus both `A` and its inverse can be regularized by finite powers of the endpoint coordinate
near either section.

On analytic bases use `i₀⁻¹𝒪_X[z⁻¹]` and the corresponding localization of
`i₀⁻¹E`. On both kinds of bases, form the finite jets `i₀⁻¹(𝒪_X/I₀^(m + 1))` and
`i₀⁻¹(E/I₀^(m + 1)E)` with their transition maps. Take their inverse limits, then invert `z`. The
`q`-shift acts on each construction. Give the comparison from analytic germs to the completed
punctured module. At infinity use `w = z⁻¹` and reverse the raw shift by the matrix rule in
Conventions.

Prove analytic base change by scalar extension along the map of germ rings. For formal base change
compare the pullbacks at each finite jet, take their limit, and then localize. Prove these
comparisons in local frames, with the coherence for composites, and compare them with horizontal
maps, tensor, determinant, and locally split short exact sequences. For a meromorphic horizontal
isomorphism require endpoint regularization for it and its inverse. On the complex point recover `K`
and `K̂`. Apply §1.7 to the resulting endpoint functors to specify analytic or formal local types
and their markings.

*Needs:* §§0.1–0.4, 1.6–1.7, AlgebraicVectorBundles §§1.1–1.2, SchemeAndStackFoundations §§4.7–4.8,
and ComplexComparisonPartII §§C-1.1 and C0.1–C0.4.

### Examples

- `diag(t,t⁻¹)` has determinant one and Smith type `(−1,1)`. For
  `E = 𝒪(d∞)` with `e_∞ = z^de₀`, a constant coefficient `c` in the zero frame
  becomes `q^(−d)c` in the infinity frame.
- Over `ℂ[ε]/(ε²)` the trivial connection has automorphisms
  `I + ε H` for constant `H`. The rank-one system `A = 1 + ε` is distinct from `A = 1`
  up to rational gauge. A gauge would give `h(qz) − h(z) = 1` in its first-order part, which is
  impossible by the constant Laurent coefficient.
- `exp(1/z)` has an essential singularity at zero. The moving pole `1/(z − s)` cannot be regularized
  near `(0,0)` by a power of `z`. Inverting `z` in a finite jet kills the jet ring, whereas
  completing first gives `𝒪_S[[z]][z⁻¹]` in the endpoint chart.

### Dependencies

Generic fibre, lattices, and Smith type precede modifications. Relative connections use the existing
sheaf and descent carriers. Endpoint localization uses finite pole bounds and the finite-jet
comparison, and gives the endpoint restriction functors used for the corresponding decorated
groupoids.

## Layer 2: Elliptic quotients, theta functions, and regular singular systems

### 2.1 The multiplicative elliptic curve and equivariant bundles

Prove that the `q^ℤ`-action on `ℂˣ` is free and properly discontinuous.
The exponential map identifies `E_q` with `ℂ/(2π iℤ + log(q)ℤ)`, a
compact complex Lie group. Compare logarithm choices and the pullback and descent of holomorphic
bundles. A holomorphic invertible matrix `B` on `ℂˣ` defines a bundle `V_B` by
`(z,v)∼(qz,B(z)v)`. Sections satisfy `s(qz) = B(z)s(z)`. Descend equivariant holomorphic and
meromorphic maps and compare gauge, tensor, dual, determinant and exact sequences. Replacing the
generator by `q⁻¹` uses the factor `B(q⁻¹z)⁻¹` for the same quotient. Identify
`ℳ(E_q)` with `ℳ(ℂˣ)^(σ_q)`. [S03, §1.2][S03],
[VPR07, §2][VPR07].

*Needs:* §§0.3–0.4, ComplexManifolds Milestones 4 and 7, ComplexTori Milestones 1 and 3, and
ComplexKahlerGeometry §§4.1 and 4.4.

### 2.2 Multiplicative theta, characters, and the q-logarithm

Use the multiplicative theta function, character and logarithm

```
Θ_q(z) = Σ_(m ∈ ℤ) q^(m(m − 1)/2) z^m,
e_c(z) = Θ_q(z)/Θ_q(cz),
ℓ_q(z) = −z Θ′_q(z)/Θ_q(z).
```

For `c ∈ ℂˣ`, prove `σ_q Θ_q = z⁻¹Θ_q`, `σ_q e_c = ce_c`, and
`σ_q ℓ_q = ℓ_q + 1`. The series converges locally uniformly on `ℂˣ`, and its
zeros are the simple zeros `−q^ℤ`. Compute the polar behavior of `ℓ_q` and the
character shift `e_(qc) = cz e_c`. Give the tensor comparison using the elliptic factor
`e_ce_d/e_cd`. Right multiplication by an invertible matrix of elliptic functions is the freedom
in a meromorphic fundamental solution. [S00, §1.1.2][S00], [S03, §1.2.2][S03].

*Needs:* §§0.4, 2.1, and SpecialFunctionsTheta §§1.1–1.3, 4.1–4.2 and 5.1.

### 2.3 Constant systems and their Jordan factors

For `C = CₛC_u ∈ GLₙ(ℂ)` in its multiplicative Jordan decomposition, use `e_c` on
the `c`-eigenspace of `Cₛ` and `exp(ℓ_qlog C_u)` on the unipotent part. The logarithm and
exponential are finite nilpotent sums. The product `E_C` is meromorphically invertible on
`ℂˣ` and solves `σ_q E_C = CE_C`. Give conjugacy and direct-sum comparisons, and
the tensor and dual comparisons with the elliptic character factors. [S00, §1.1.2][S00],
[S03, §1.2][S03].

*Needs:* §§0.3, 2.2, and Tau Ceti's multiplicative Jordan decomposition.

### 2.4 Regular singularity and convergent constant reduction

A local module is regular singular if it has a full `ℂ{z}`-lattice stable under `Φ`
and `Φ⁻¹`. Equivalently, some local meromorphic gauge makes `A` and its inverse regular at
zero. Prove reduction to an invertible constant `C`, including resonances and nontrivial Jordan
blocks. Use shearing to shift eigenvalues by integral powers of `q`. For the nonresonant constant
reduction of `A = C + Σ_(m ≥ 1) Aₘ z^m`, assume all operators `X ↦ q^m XC − CX` for `m ≥ 1` are
invertible. For the gauge from `C` to `A`, solve with `H₀ = I`

```
q^m HₘC − CHₘ = Σ_(j = 1)^m Aⱼ H_(m − j).
```

For large `m` the coefficient operator tends to `X ↦ −CX`, so its inverse is bounded.
Use the finitely many remaining inverses and a convergent majorant to prove convergence and local
invertibility. Give uniqueness with that normalization, and the regular singular subcategory's closure under direct sums, tensor, dual,
subobjects, and quotients. [S00, §§1.1.1, 1.1.3–1.1.4, 1.3][S00], [S03, §§1.2 and 2.1][S03].

*Needs:* Layer 0, §2.3, and convergent Laurent expansions and finite-dimensional estimates.

### 2.5 The regular singular category and resonant morphisms

For constant systems `C,D`, classify horizontal maps by finite Laurent sums `H = Σₘ Hₘ z^m` with
`q^mHₘ C = DHₘ`. Only finitely many `m` contribute by eigenvalue comparison. With these morphisms
the constant systems are equivalent to the regular singular category. Produce a quasi-inverse and
the tensor and exact comparisons. If eigenvalues are chosen in `|q| < |c| ≤ 1`, maps between these
normalized systems are constant. Account for normalization and the induced comparisons on tensor
products. [S03, Lemma 2.1.3.2 and §2.1][S03].

*Needs:* §§0.3–0.4 and 2.4.

### Examples

- For `C = [[1, 1], [0, 1]]` the fundamental solution is
  `[[1, ℓ_q], [0, 1]]`. From `c` to `qc` the map `z`
  is horizontal.
- At `q = 1/2`, `Θ_q(3z)Θ_q(5z)/(Θ_q(z)Θ_q(15z))` is an elliptic function with
  distinct zero and pole orbits.

### Dependencies

The elliptic quotient and theta theory supply the global solutions of the local constant models. The
slope-zero characterization of regular singularity is proved in Layer 3.

## Layer 3: Local slopes and formal types

### 3.1 Newton polygons and degree

For a cyclic presentation `D/DP`, with `P = Σᵢ aᵢΦ^i`, take the lower convex hull of the
upward rays at `(i,v₀(aᵢ))`. Define `r_M(μ)` as the horizontal length at geometric slope
`−μ`, with empty support for the zero module. Prove independence of cyclic presentation and invariance under
translation by multiplication of the operator by a unit. Prove additivity in short exact sequences,
convolution for tensor products, and the sign rule for duals. Show

```
Σ_μ r_M(μ) = rank M,
deg M = Σ_μ μ r_M(μ) = −v₀(det A).
```

The denominator of `μ` divides `r_M(μ)`. Ramification of degree `r` multiplies slopes by `r` and
preserves their multiplicities. Reversal at a fixed valuation negates slopes. The annihilator of the
module and the scalar operator on solutions have opposite slopes under the companion-system
comparison. The upper edges in [VPR07, §1.3][VPR07], using ordinates `−v₀(aᵢ)`, give
the same slope labels. [RSZ13, §2.2.1 and Theorem 2.2.1][RSZ13].

*Needs:* §§0.1–0.5 and Laurent valuations.

### 3.2 Analytic slope filtration and formal decomposition

Call a nonzero module pure of slope `μ` if its only slope is `μ`. Construct the unique finite
filtration `M_(≤ μ)` with pure quotients in strictly increasing slope order. Characterize
`M_(≤ μ)` by the separation of slopes of the submodule and quotient at `μ`. In a cyclic
presentation, a right factor for the greatest slope gives the pure quotient at that slope.
Use the convergent factorization in increasing slope order to obtain the filtration, and formal
factorization at all slopes for the formal decomposition. Show that every map is
strict and that the associated graded functor is exact, faithful, and compatible with tensor,
internal Hom, and dual. Over `K̂` give the natural direct-sum decomposition by maximal pure
submodules, identified with the completed associated graded. For pure modules, analytic-to-formal
scalar extension is fully faithful and every pure formal module has an analytic model. Prove regular
singularity exactly in the all-zero slope case. [RSZ13, §§2.2.2–2.3, Theorem 2.2.4][RSZ13],
[VPR07, §§1.3–1.4, Proposition 1.3 and Corollaries 1.5–1.6][VPR07].

*Needs:* §3.1, Layer 0's subobjects and scalar changes, and Layer 2's regular singular
classification.

### 3.3 Pure normal forms

For integral slope `μ`, give the normal form `A = z^(−μ) C`, with `C` determined up to similarity
after normalizing eigenvalues in the fundamental annulus. For slope `a/r` in lowest terms, fix
`p^r = q`, use `z = u^r`, and restrict scalars on the rank-one system `Y(pu) = cu^(−a)Y(u)`. This gives a
simple rank-`r` module `E(r,a,c)` whose isomorphism type for the fixed root is determined by `r,a`
and the class of `c^r` in `ℂˣ/q^ℤ`. The indecomposables of this slope are
`E(r,a,c) ⊗ Uₘ`, where `Uₘ` is one unipotent Jordan block of rank `m`. Give the direct-sum
classification, its uniqueness up to permutation and isomorphism, the Hom calculation, and the
tensor and dual comparisons. The rank and degree of the indecomposable are `rm` and `am`.
[RSZ13, §2.2.2][RSZ13], [VPR07, Proposition 1.3 and Corollaries 1.5–1.7][VPR07].

*Needs:* §§3.1–3.2, Layer 2's constant classification and Layer 0's restriction of scalars.

### 3.4 Ramification and finite descent

Use the analytic and formal Galois extensions in §0.4. Descend a ramified module with a semilinear
`μᵣ`-action commuting with `Φ` by taking invariants. Prove the comparison
`Kᵣ ⊗ _K N^(μᵣ) ≃ N`, all-morphism descent, and compatibility with tensor, exact
sequences and slope filtrations. Give comparisons for iterated ramification using compatible roots.
Changing `p` to `ζ p` on a module with descent maps `D_ζ` changes the semilinear operator to
`D_ζΦ` and preserves the descended module. [VPR07, Proposition 1.9][VPR07],
[RSZ13, Theorem 2.2.1(iv)][RSZ13], [S24, §§1.4 and 2.3.2][S24].

*Needs:* §§0.2, 0.4, 3.1–3.3 and Tau Ceti's finite Galois descent for vector spaces.

### 3.5 Difference cohomology and extensions

Specialize the two-term complex of [PhiGammaModulesAndIwasawaCohomology §0.2][pg-complex]
to the local field `K` with automorphism `σ_q` and fixed field `ℂ`. Write `Γ⁰(M)`
and `Γ¹(M)` for its kernel and cokernel of `Φ_M − 1`. The supplier's Ext comparison
uses the skew polynomial ring. For the invertible action write `D = K[Φ,Φ⁻¹;σ_q]` and
use native `Ext¹_D` in the category of all left `D`-modules. For finite-dimensional
`N`, put `P_N = D ⊗ _K N`, using the right `K`-action on `D`, and prove exactness of

```
0 → P_N —(δ_N)→ P_N —(ε_N)→ N → 0,
δ_N(d ⊗ v) = dΦ ⊗ Φ_N⁻¹v − d ⊗ v, ε_N(d ⊗ v) = dv.
```

Verify balancing with the skew relation, injectivity by the extreme Laurent coefficient, and
exactness by telescoping finite Laurent sums. The `P_N` are free over `D`. Applying Hom identifies
precomposition by `δ_N` with `f ↦ Φ_M fΦ_N⁻¹ − f`. Use this presentation to compare
`Ext¹_D(N,M)` with `Γ¹(N^∨ ⊗ M)` and with extensions having
finite-dimensional middle term. The cocycle from a `K`-linear splitting `s` is
`(Φ_Es − sΦ_N)Φ_N⁻¹` valued in `M`. Compare the change of splitting, inverse construction,
connecting maps, zero class and Baer sum.

For a pure analytic module of slope `μ < 0`, prove `Γ⁰ = 0` and
`dim_ℂ Γ¹ = −μ rank M`. In the integral case put `d = −μ` and use `A = z^d C`.
Multiplication by `z^d C` changes `Φ − 1` into `σ_q − z^d C`. On Laurent coefficients
the equation is `q^n xₙ − C x_(n − d) = yₙ`. Solve the principal part with finite negative
support and solve the positive tail backwards, using `q^n → 0`. Match the two solutions
over the band `0 ≤ n < d`. This band gives the cokernel and the homogeneous equation has
no nonzero meromorphic germ solution. For slope `d > 0` use `Φ = z^d C⁻¹σ_q`.
The forward recurrence starts at the lowest Laurent exponent and defines a convergent solution,
since its coefficient multiplying `x_(n − d)` tends to zero. At slope zero give Euler characteristic
zero with the resonant terms. Use ramification
and finite descent for rational slopes. In the formal case give vanishing of both groups at
nonzero slope. Thus for pure `Pᵢ,Pⱼ` of ranks `rᵢ,rⱼ` and slopes `μᵢ < μⱼ`,

```
Hom(Pⱼ,Pᵢ) = 0,
dim_ℂ Ext¹(Pⱼ,Pᵢ) = rᵢ rⱼ(μⱼ − μᵢ).
```

The reverse extensions split by the slope filtration.
[RSZ13, Proposition 2.1.3, Theorem 3.1.1, §§3.1–3.2 and Appendix A.7][RSZ13].

*Needs:* [PhiGammaModulesAndIwasawaCohomology §0.2][pg-complex] for the complex over fixed
scalars, §§0.1–0.5 and 3.1–3.4, Layer 2, Mathlib's derived-category Ext and Tau Ceti's
projective presentation and Baer sum comparisons.

### 3.6 Laurent-polynomial models of pure modules

For `R = ℂ[z,z⁻¹]` and `K = ℂ({z})`, use the model category of §0.2 along `R → K`.
For pure `P` of slope `a/r` in lowest terms, construct a model `(P_global,P,α)`.
Finite projective modules over the Laurent PID `R` are free, and
`P_global → K ⊗_R P_global` is injective. Use `α` to realize the model in `P` as the
submodule of elements whose orbits under `z^(−a) Φ^r` span finite-dimensional complex vector
spaces. Prove this characterization using pure normal forms and generalized eigenspaces,
and show stability under `Φ` and `Φ⁻¹`. A nonzero constant multiple of the orbit
operator gives the same condition. [VPR07, Definition 1.8][VPR07].

Compare all maps of pure modules with the Laurent models, and give the tensor, dual,
split direct-sum, ramification and descent comparisons. A matrix of the model belongs to
`GLₙ(R)` and has determinant `cz^d` with `c ≠ 0`.

*Needs:* §§0.2 and 3.1–3.4, the PID property of the Laurent polynomial ring over a field, and
generalized eigenspaces.

### 3.7 Pure elliptic bundles and their cohomology

Descend the pure Laurent model to a holomorphic bundle `V(P)` on `E_q`. Give the faithful tensor
comparison on pure blocks and their split sums. Its rank is the module rank, and the bundle degree
for slope `μ` and rank `r` is `rμ`. The equation `σ_q Θ_q = z⁻¹Θ_q` gives a
section of the line with factor `z⁻¹` and one simple zero on `E_q`. Derive the degree formula
from this line, determinant and ramification. Prove `H⁰(E_q,V(P)) = 0` for `μ < 0` by the
section equation. Use the Dolbeault comparison and the Cauchy–Riemann index to prove
`χ(V(P)) = deg V(P)` and `H² = 0`. Compare the difference extension cokernel with `H¹` of the
negative-slope Hom bundle for integral gaps. [VPR07, §2, Lemma 2.1 and Theorem 2.5][VPR07],
[RSZ13, §§6.2–6.3][RSZ13].

*Needs:* §§2.1–2.2, 3.1–3.6, ComplexKahlerGeometry §§2.5, 4.1, 5.10 and 7.6–7.8, and
PseudoholomorphicCurveAnalysis §§6.3–6.4 and 7.2.

### 3.8 Pure modules and semistable elliptic bundles

For each `μ ∈ ℚ`, prove that `V` is an exact equivalence between the pure local category
of slope `μ` and the semistable elliptic bundles of that slope, with zero objects and all maps.
Semistability is the bound `deg W/rank W ≤ μ` for nonzero subbundles. For full
faithfulness apply the finite-orbit characterization to the holomorphic section equation in the Hom
model.

For essential surjectivity, first prove that an indecomposable degree-zero bundle is a degree-zero
line tensored with a bundle filtered by copies of the trivial line. Use the filtration argument of
[A57, Lemmas 2, 5, 6′ and 8–11][A57] after twisting by a line of degree one. For an indecomposable
of slope `t/n` in lowest terms, pull back by the cyclic degree-`n` isogeny. The deck group permutes
the isomorphism types of the indecomposable summands transitively: it acts on the central primitive
idempotents of `End(π^*V)/rad`, and Reynolds averaging gives a
surjection from the invariant endomorphism ring to the invariant quotient. A second orbit would give
a nontrivial idempotent in a quotient of the local ring `End(V)`. Rank and degree are
constant along this action, so all pulled-back summands have integral slope `t`.

Twist those summands to degree zero. Realize the line factors by constant characters and the
filtered factors by unipotent constant matrices. For the latter, split the pulled-back filtration on
`ℂˣ` using `H¹(ℂˣ,𝒪) = 0`, then remove nonconstant Laurent
coefficients successively by division by `p^k − 1` on each superdiagonal. Undo the twist. The
intrinsic finite-orbit Laurent model is stable under the deck group and descends to a finite
projective, hence free, module over the Laurent polynomial ring. Negative-slope Hom vanishing gives
semistability of the pure images. Decompose a semistable bundle to obtain essential surjectivity on
its fixed slope. Construct unit and counit and compare tensor and dual across slopes. Extend the
comparison of `Ext¹(Pⱼ,Pᵢ)` with `H¹(Hom(V(Pⱼ),V(Pᵢ)))` to
rational slopes by equivariant descent. [VPR07, Theorems 2.3 and 2.5][VPR07], [M19, §10.1.3][M19].

*Needs:* §§2.1–2.5 and 3.1–3.7, ArtinAlgebras §§0.1–0.4 and 0.6, SemisimpleAlgebras Layers 0–2,
ComplexKahlerGeometry §§2.3, 2.5, 4.1, 5.10 and 7.8, and finite descent along the isogeny.

### Examples

- `A = [[0, z⁻¹], [1, 0]]` has cyclic operator `Φ² − qz`, slope `1/2` twice, and
  degree one. Ramifying by degree two preserves rank and gives slope one.
- From `diag(1,z⁻¹)` to `[[1, z⁻¹], [0, z⁻¹]]` the upper unipotent gauge solves
  `σ_q f − zf = 1`. Its formal solution is `Σ_(m ≥ 0) q^(−m(m + 1)/2) z^m` and has
  radius zero. In the reverse slope order the extension splits.
- The trivial rank-one module has both difference cohomology spaces of dimension one. For ranks
  `1,2` and slopes `0,1/2` the increasing-slope extension space has dimension one.
- The degree-one theta bundle has a nonzero section from the trivial bundle. The local pure modules
  of slopes zero and one have zero Hom. The elliptic bundle of slope `1/2` above has rank two and
  degree one.

### Dependencies

Newton and slope theory use cyclic operators and convergent factorization. Pure models use regular
singular normal forms and finite descent. The elliptic comparison uses the pure Laurent models and
the cited bundle cohomology and decomposition results.

## Layer 4: q-Stokes data and local analytic classification

### 4.1 Marked formal type

Fix distinct rational slopes `μ₁ < ⋯ < μₖ` and pure analytic modules `Pᵢ` of ranks `rᵢ`.
Let `M₀ = ⊕ᵢ Pᵢ`. The marked objects are local analytic modules `M` with an isomorphism
`g: gr M → M₀`. A marked map satisfies `g′gr(f) = g`. It is an
isomorphism, unique when it exists. Write `F(M₀)` for the classes, pointed by `(M₀,id)`.

For a commutative `ℂ`-algebra `R`, define `F(M₀)(R)` using finite projective filtered
difference modules over `R ⊗ _ℂ K` with the successive quotients identified with
`R ⊗ _ℂ Pᵢ`. Use the given filtration in this functor. Prove its naturality in `R`
and construct the change of marking action.
[RSZ13, Definition 2.3.1, §3.1.2 and Appendices A.3 and A.6][RSZ13].

*Needs:* §§0.2, 3.2 and 3.5.

### 4.2 Birkhoff–Guenther normal form and representability

For integral slopes choose systems `z^(−μᵢ)Cᵢ` for the graded factors and write `A₀` for the
block diagonal matrix. Each marked class has a unique Birkhoff–Guenther matrix `A_U`, with
diagonal `A₀` and upper blocks `U_ij` supported at exponents `−μⱼ ≤ ℓ < −μᵢ`.
Construct the unique change to this form with identity diagonal in compatible filtered frames.
At the gap `δ = μⱼ − μᵢ`, multiply the block gauge equation by `z^(μⱼ)` to use the
operator `X ↦ (σ_q X)Cⱼ − z^δ CᵢX`. Its Laurent coefficient equation has the same
two tails as §3.5, with cokernel represented by degrees `0 ≤ n < δ`. Increasing the
gap makes the cross terms depend on blocks already determined. In the formal Laurent field
the coefficient equation is invertible by the forward recurrence.

Show that the coefficient functor of §4.1 for arbitrary rational slopes is represented by a scheme
isomorphic to affine space of dimension

```
N = Σ_(i < j) rᵢ rⱼ(μⱼ − μᵢ).
```

Use the successive extension computation of §3.5 and compare the normal forms with scalar extension
on all `R`. For integral slopes the normal-form coefficients are coordinates. Relate choices of
coordinates via their common marked class. For two steps compare the extension parameter with Baer
sum. For more than two steps retain the upper triangular gauge multiplication, which has cross
terms. [RSZ13, Theorems 3.1.4 and 3.3.5, Propositions 3.3.1 and 3.3.4, and Appendix A.6][RSZ13].

*Needs:* §§3.3–3.5 and 4.1, and Mathlib's affine-space functor of points.

### 4.3 Meromorphic summation and admissible directions

For integral slopes and the models of §4.2 there is a unique upper block unipotent formal gauge
`F̂` from `A₀` to `A_U`. For `c ∈ E_q` exclude the directions for which there are `i < j`
and eigenvalues `α` of `Cᵢ` and `β` of `Cⱼ` with `c^(μⱼ − μᵢ) α ≡ β mod q^ℤ`.
The excluded set is finite since multiplication by each nonzero integral gap has finite fibres
on `E_q`. For every other `c`, construct the unique upper block unipotent gauge `F_c` from
`A₀` to `A_U` meromorphic on `ℂˣ`, with the `(i,j)` block's poles on `−c q^ℤ` of order
at most `μⱼ − μᵢ`.

For a representative `c` put `θ_c(z) = Θ_q(z/c)`, so that `σ_q θ_c = (c/z)θ_c`.
On a block of gap `δ = μⱼ − μᵢ` write `X_ij = θ_c^δ (F_c)_ij`. In increasing gap order,
the equation for `X_ij` is

```
(σ_q X_ij)Cⱼ − c^δ Cᵢ X_ij = c^δ z^(μᵢ) θ_c^δ Σ_(i < k ≤ j) U_ik (F_c)_kj .
```

Here `(F_c)_jj = I`. The right side is holomorphic on `ℂˣ` by the bounds on smaller gaps.
The operator on its `n`-th Laurent coefficient is `X ↦ q^n XCⱼ − c^δ Cᵢ X`.
It is invertible by admissibility. Its inverse stays bounded as `n → +∞` and is
`O(|q|^(−n))` as `n → −∞`. Laurent coefficient estimates on compact annuli give a
holomorphic solution. Dividing by `θ_c^δ` gives the required poles. Check independence
of the representative and the pole bounds under multiplication and inversion. If `A_U,A_V`
have the same graded model, their corresponding gauge is `F_(V,c)F_(U,c)⁻¹`.
[S24, Theorem 3.1 and Lemma 3.2][S24], [RSZ13, Chapters 5–6][RSZ13].

*Needs:* §§2.2, 3.6 and 4.2.

### 4.4 The q-Stokes sheaf and its cocycle

For `π:ℂˣ → E_q`, define the group sheaf `Λ_I(A₀)` on `U ⊂ E_q` by
holomorphic upper block unipotent matrices `S` on `π⁻¹(U)` satisfying `(σ_q S)A₀ = A₀S`.
The `(i,j)` block satisfies `σ_q S_ij = z^(μⱼ − μᵢ) Cᵢ S_ij Cⱼ⁻¹` in the integral
model. For admissible directions put `U_c = E_q ∖ {−c}` and use `S_cd = F_c⁻¹F_d` on
`U_c ∩ U_d`. Verify its cocycle, the comparison under changes of trivialization, covering
refinement, and its pointed torsor class in `H¹(E_q,Λ_I(A₀))`. Show that the sheaf is the
sheaf of automorphisms of the split filtered elliptic bundle acting identically on the graded
pieces. [S24, after Corollary 3.4][S24], [RSZ13, §4.4][RSZ13].

*Needs:* §§2.1, 3.7, 4.2–4.3, and SchemeAndStackFoundations §§1.15 and 2.3.

### 4.5 The gap filtration and realization of Stokes classes

Filter the sheaf by vanishing of blocks of gap less than `δ > 0`. The successive additive
quotient at gap `δ` consists of the horizontal Hom blocks of that gap. The commutator adds the
gap bounds, giving a finite central filtration. For a block `(i,j)` use the Hom bundle of rank
`rᵢ rⱼ` and degree `rᵢ rⱼ(μᵢ − μⱼ)`. It has `H⁰ = H² = 0`, and `H¹` of dimension
`rᵢ rⱼ(μⱼ − μᵢ)` identified with the difference extension space.

For integral slopes prove that the torsor map is a bijection: realize torsors by lifting
successively through the gap quotients using the additive cohomology comparison, and recover a
marked analytic gauge from equality of torsor classes. Compare the resulting affine coordinates with
the Birkhoff–Guenther coordinates and identify the split module with the trivial torsor.
[RSZ13, Theorem 4.4.1 and §§6.2–6.3][RSZ13], [S24, Theorem 3.5 and §3.2.2][S24].

*Needs:* §§3.5, 3.7 and 4.2–4.4, SchemeAndStackFoundations §§1.15 and 2.3, and
TopologicalSheafCohomology §§1.1–1.3.

### 4.6 Birkhoff–Malgrange–Sibuya correspondence for rational slopes

Use pure Laurent models `Bᵢ` for the graded factors. Define `Λ_I(A₀)` by the same horizontal
upper block condition for `A₀ = diag(Bᵢ)`. Choose a common denominator `r` and
`p^r = q`, and pull back by `z = w^r`. The resulting slopes are integral and `Eₚ → E_q`,
`[w] ↦ [w^r]`, is a degree-`r` unramified cover with deck group `μᵣ`. Prove that ramification
identifies the marked classes and the torsor classes downstairs with the respective invariant
classes upstairs, and makes the classification maps commute. This gives the pointed bijection

```
F(M₀)(ℂ) ≃ H¹(E_q,Λ_I(A₀)).
```

Prove compatibility with changes of roots, common denominators and refinement.
[S24, Propositions 3.9–3.11 and Theorem 3.13][S24].

For descent of a marked class invariant under the generator `j` of `μᵣ`, the marked gauge
`G: B → B^j` is unique. The iterates `G₀ = I`, `G_(k + 1) = Gₖ^jG` satisfy `Gᵣ = I`. The average
`H = r⁻¹Σ_(k = 0)^(r − 1) Gₖ` remains upper block unipotent and satisfies `H^jG = H`. Consequently
`(σₚH)BH⁻¹` has invariant coefficients. For the torsors give the comparison of cocycles
using the finite central filtration and its additive quotients.

*Needs:* §§3.4, 3.6, 3.8 and 4.3–4.5, and descent along the finite analytic cover.

### 4.7 Morphisms, changes of marking, and the quotient stack

Prove naturality of the classification under graded isomorphisms `h: M₀ → N₀`, using `g ↦ hg`
and conjugation of the Stokes sheaf. Over `ℂ`, forgetting the marking gives the action
groupoid of `Aut(M₀)` on `F(M₀)(ℂ)`, with automorphism groups given by the
stabilizers. For integral-slope modules, descend their Laurent normal forms with the increasing
slope filtration. Prove the exact, fully faithful tensor comparison with filtered holomorphic
bundles using all filtration-preserving maps. [S09, §2.3.2, Theorem 2.4 and Lemma 2.5][S09].

For coefficient families, put `B = End_diff(M₀)` and
`G(R) = (R ⊗ _ℂ B)^×`. Prove that this is the automorphism functor of the
scalar-extended graded object using flatness over `ℂ`, and represent it by the open locus
where left multiplication has invertible determinant. The marking action is algebraic by naturality
in `R`. Using horizontal maps preserving the filtration, form the groupoid of coefficient families
whose graded object is fppf locally the specified one. Show that it is the quotient stack
`[F(M₀)/G]` by sending a family to its graded-marking torsor and equivariant classifying map, and
descending the marked family in the other direction. Give the pullback comparisons and check
coherence. Globally trivialized graded type gives the objectwise action groupoid. The torsor
description includes nontrivial graded forms. [RSZ13, §3.1.2 and Appendices A.5–A.6][RSZ13],
[SPQ, Proposition 95.15.3][SPQ].

*Needs:* §§4.1–4.6, Mathlib's action category, and SchemeAndStackFoundations §§1.18 and 1.21.

### Examples

- For ranks `(1,1)` and slopes `(0,3)` the upper block has exponents `−3, −2, −1`.
  For ranks `(1,1,1)`
  and slopes `(0,1,2)` there are four coefficients, and the product in the `(1,3)` block contains
  the cross term `S₁₂S′₂₃`.
- With ranks `(1,1)` and slopes `(0,1)` the marked parameters `u = 1,2` are related by a change of
  marking. Over the dual numbers `u = 0,ε` are distinct with the same reduction. For a
  single slope the marked classes form a point and the unmarked groupoid retains the full
  automorphism group.
- For `A₀ = diag(1,a/z)` the forbidden direction is `a mod q^ℤ`. With upper block
  `z⁻¹` and representative `c = a`, the constant coefficient of the right side in §4.3 is
  one and the constant coefficient of the left side is zero. For ranks `(1,2)` and slopes `(0,1/2)` the marked space has dimension one, whereas the ramified space
  for `r = 2` has dimension two before taking invariants.

### Dependencies

Layer 3 supplies the local extension calculation and pure Laurent models. The analytic torsor
comparison is over `ℂ`. The quotient stack uses the coefficient functor over
`R ⊗ _ℂ K` and algebraic descent.

## Layer 5: Global connection data and reconstruction

### 5.1 Laurent models for mixed local modules and extension of maps

Use the models of §0.2 for `R = ℂ[z,z⁻¹]` and `K = ℂ({z})`. Over the PID `R`
a finite projective module is free. Call such a difference module globally pure of slope
`μ` if its localizations are pure of slope `μ` at zero and raw slope `−μ` at infinity.
At infinity, the same subobjects indexed by decreasing raw slopes are indexed by increasing slopes
after reversal. Form
the category of Laurent modules with a specified finite filtration by globally pure quotients in
increasing slope order at zero. Prove that localization at zero is an equivalence with the local
analytic category for all rational slopes, with all horizontal maps preserving the specified
filtration. Give the comparison of models and their morphisms, the quasi-inverse and the tensor
and exact comparisons. For each fixed local analytic module the groupoid of models with their
comparison isomorphisms, restricted to this filtered subcategory, is equivalent to the terminal
groupoid. Use full faithfulness to compare all choices and give the cocycle law.
At infinity use the reversed shift: a normalized Laurent matrix `D(w)` gives the
original-shift model `B_∞(z) = D(1/(qz))⁻¹`.
[VPR07, §4, Lemma 4.2, Theorem 4.3 and Observations 4.5][VPR07].

For rational `A` and Laurent model `B`, extend a local horizontal meromorphic map `H` from zero
using `H(z) = B(z)⁻¹H(qz)A(z)`. Iterate from a sufficiently small `q^k z` to obtain a unique
meromorphic map on `ℂ`. From infinity use `H(qz) = B(z)H(z)A(z)⁻¹` to extend to `ℙ¹ ∖ {0}`. Include maps of arbitrary ranks
and compare their compositions and inverses where defined.

*Needs:* §§0.2–0.4, 3.2–3.6 and 4.1–4.2, and meromorphic continuation by the identity principle.

### 5.2 Meromorphic Birkhoff factorization

For `R ∈ GLₙ(ℳ(ℂˣ))` construct

```
R = F_∞⁻¹F₀,
F₀ ∈ GLₙ(ℳ(ℂ)),
F_∞ ∈ GLₙ(ℳ(ℙ¹ ∖ {0})).
```

Glue a holomorphic bundle on `ℙ¹` across a small annulus on which `R` and `R⁻¹` are
holomorphic. Apply projective GAGA and choose a rational frame of its generic fibre. Extend the two
frame matrices across `ℂˣ` using `R`. Show that two factorizations differ by the same
rational gauge on the left, since meromorphic functions extending over both endpoints are rational.
Include the rank-zero, scalar, and direct-sum cases. [S00, §§2.2–2.3][S00],
[S03, proof of Proposition 3.1.1.3][S03].

*Needs:* ComplexManifolds Milestones 5 and 7, ComplexComparisonPartII §§C1.9 and C2.2, and the
function field of `ℙ¹`.

### 5.3 Local analytic modules and filtered elliptic bundles

On `E_q` use holomorphic bundles with a finite subbundle flag whose nonzero graded quotients are
semistable of strictly increasing rational slopes. For any rational `μ`, take the filtration step
of largest slope `≤ μ`, or zero if there is none. The zero bundle has the empty flag. Use all
filtration-preserving holomorphic maps. This specified filtration is the rational
anti-Harder–Narasimhan filtration in [M19, §§1.5.1 and 10.1.3][M19].

Prove the exact symmetric monoidal equivalence with local analytic difference modules. Realize the
Laurent model of §5.1 as a shift-equivariant bundle on `𝔾_m` by §1.6, analytify, and use §2.1 to
descend it with its slope filtration. Use §0.2 to retain the model and its local comparison.
Full faithfulness in §5.1 gives the comparison under changes of model, basis and local comparison,
including the identity and cocycle laws. For full faithfulness, apply §4.7 after ramifying to
integral slopes, then descend the maps. For essential surjectivity, realize the semistable graded
quotients by §3.8. Local filtered splittings compatible with the graded identifications form a
torsor under the sheaf in §4.4. Compare the cocycle of the Laurent model with this torsor using
summation and descent in §§4.3–4.6, and reconstruct the filtered bundle from the resulting local
module. Give unit, counit and their triangular identities. [S09, Theorem 2.4 and Lemma 2.5][S09],
[VPR07, Theorems 2.3 and 2.5][VPR07], [RSZ13, Theorem 4.4.1][RSZ13].

Compare strictness, kernel, image and cokernel with the local category. On Laurent models, the
torsion support of the cokernel of a horizontal map is finite and `q`-invariant in
`ℂˣ`, hence empty. This yields exactness after passage to bundles for the local short
exact sequences. Give tensor filtration by adding slopes and dual filtration by negating slopes.
Denote the endpoint functors by `V₀,V_∞`, using the same `z`-coordinate on `ℂˣ`
for the descended bundles. In Laurent frames, a meromorphic map from `V₀(L₀)` to
`V_∞(L_∞)` corresponds to a matrix `R` satisfying `(σ_q R)B₀ = B_∞ R`.

*Needs:* §§0.2, 1.6, 2.1, 3.2–3.8, 4.1–4.7 and 5.1, and finite analytic descent. Use the
local splitting of filtered locally free sheaves and the torsor comparison.

### 5.4 Rational modules and their connection data

Define the category of triples `(L₀,φ,L_∞)` with endpoint local analytic modules and a
meromorphic isomorphism `φ:V₀(L₀) ⇢ V_∞(L_∞)` of the underlying
bundles. A map to `(L′₀,φ′,L′_∞)` is a pair of local horizontal maps with
`φ′ V₀(f₀) = V_∞(f_∞)φ`. The corresponding description by §5.3 keeps the
filtrations on the endpoint bundles. The endpoint maps preserve their respective filtrations, while
the gluing isomorphism is meromorphic between the underlying bundles.

Construct the `ℂ`-linear exact tensor equivalence with all finite-dimensional rational
`q`-difference modules. From a rational system extend the local gauges to Laurent models by §5.1 and
form the connection isomorphism on the overlap. In the other direction, choose Laurent models
`B₀,B_∞` and a lift `R` of `φ`. With `R = F_∞⁻¹F₀` from §5.2, reconstruct

```
A = (σ_q F₀)B₀ F₀⁻¹
= (σ_q F_∞)B_∞ F_∞⁻¹.
```

The two expressions extend meromorphically over the endpoints and agree on the overlap. For a map of
triples, use the factorizations `Fⱼ,Nⱼ` of source and target to glue
`H = N₀ f₀ F₀⁻¹ = N_∞ f_∞ F_∞⁻¹` to a rational horizontal map. This comparison
includes rectangular maps. Prove its inverse by localization, then compare choices, tensors and
exact sequences, and identify the endpoint functors of the equivalence with localization.
[VPR07, Theorem 4.3][VPR07], [S03, the Birkhoff factorization used in Proposition 3.1.1.3][S03].

*Needs:* §§5.1–5.3 and Layer 0.

### 5.5 Birkhoff connection matrices in the regular singular case

Specialize to modules regular singular at both endpoints. Use constant matrices `C₀,C_∞` for
the Laurent models expressed in the original `z`-shift; at infinity the constant in the reversed
local system is `C_∞⁻¹`. The gluing matrix satisfies `M(qz)C₀ = C_∞ M(z)`. Maps are
pairs of the endpoint Laurent horizontal maps subject to `M′f₀ = f_∞ M`. For the fundamental
solutions `Yⱼ = FⱼE_(Cⱼ)` define

```
P = Y_∞⁻¹Y₀ = E_(C_∞)⁻¹M E_(C₀).
```

Show that `P` descends to a meromorphic matrix on `E_q`. Track resonance, shearing and the changes
`Yⱼ ↦ YⱼDⱼ`, which give `P ↦ D_∞⁻¹PD₀`. Give the tensor comparison including
the elliptic character factors. The classification data in these coordinates include the local
constant systems and the allowed endpoint maps. [S03, Proposition 3.1.1.3 and §3.2.1][S03].

*Needs:* §§2.2–2.5 and 5.4.

### 5.6 Forgetful functors and comparison of decorated modifications

Compare bundle models, lattice families, rational modules, connection data, the endpoint filtered
bundles, and the regular singular presentation by fundamental solutions. Identify the morphisms
carried by the functors. Use the theta section from §3.7 to show that passing from the local module
to its underlying elliptic bundle is in general non-full. Compare the change-of-marking groupoid of
§4.7 with forgetting a formal marking.

For decorated groupoids `Q_α,Q_β` over the complex point, use the equivalence `D` of §5.4
to compare `Q_α×^h_G Q_β` with `Q_α×^h_C Q_β`, where `G` and `C` are the
cores of rational modules and of connection data. The functor sends a horizontal isomorphism `B` to
`D(B)` and keeps the decorated source and target. Use full faithfulness to construct its inverse and
preserve unit, composition and inverse. Restrict the global equivalence to marked endpoint
conditions using the natural comparisons of endpoint localization and formal type.

*Needs:* §§1.1–1.2, 1.7–1.8, 3.7, 4.7 and 5.3–5.5.

### Examples

- For `A = z − a`, `a ≠ 0`, the endpoint slopes after normalization are zero and minus one. A rank-two
  extension `0 → 𝒪 → V → L → 0` for a degree-one line `L`, if nontrivial, has stable
  underlying bundle of slope `1/2`. Its specified filtration has slopes zero and one, and the pure
  object with underlying bundle `V` has only the slope `1/2`.
- At `q = 1/2`, the constant systems `1` and `3` have `P = 1` if the same fundamental solution
  is used at both endpoints of each system. Rational gauge equivalence would require
  `3 ∈ (1/2)^ℤ`.

### Dependencies

The Laurent models and Stokes realization supply the endpoint functors. Meromorphic factorization
and gluing prove the global equivalence on objects and every horizontal map. This layer's
classifications are over `ℂ`.

## Layer 6: Connection-preserving deformation and time transport

### 6.1 Transport along a time groupoid

Let `𝒯` be a small groupoid, `Mₜ` rational modules, and `D` the equivalence of §5.4. A
coherent transport of connection data is a choice of isomorphism `b_g: D(Mₜ) → D(M_(t′))` for each
`g: t → t′`, with identity and composition laws. Full faithfulness gives its unique horizontal lift
`B_g` once `b_g` has been specified. Compare the groupoids of coherent transports and their natural
isomorphisms. If the input specifies only the connection data, use a quasi-inverse and its
comparisons to reconstruct both objects and transport. Give restriction and pullback along time
functors and keep the actions of time stabilizers by automorphisms.

For relative connections use the meromorphic isomorphisms of §1.7 and their base-change laws. State
the lift for a relative comparison functor wherever it is fully faithful and has coherent
base-change comparisons. Lifting the objects themselves uses a relative equivalence on the chosen
domain. Decorated transports use the modification comparison in §5.6 over the complex point.

*Needs:* §§0.1–0.3, 1.6–1.7 and 5.4–5.6, and functor categories.

### 6.2 Commuting time directions and q-zero curvature

Let `Tᵢ` be commuting bijections on the time set, and let `A(z,t)` be the systems on a rank-`n`
component. Show that the `Bᵢ(z,t) ∈ GLₙ(ℂ(z))` define transport on the
`ℤ^r` action groupoid exactly when

```
A(z,Tᵢ t)Bᵢ(z,t) = Bᵢ(qz,t)A(z,t),
Bⱼ(z,Tᵢ t)Bᵢ(z,t) = Bᵢ(z,Tⱼ t)Bⱼ(z,t).
```

Use `B_(−i)(z,t) = Bᵢ(z,Tᵢ⁻¹t)⁻¹` to construct transport along any word. Prove independence of
the word for a given displacement and the cocycle `B_(k + ℓ)(z,t) = Bₖ(z,T_ℓ t)B_ℓ(z,t)`. For
other groups impose the relations in the presentation. For birational actions use equality in the
function field and restrict each finite family of paths to a common domain. Compare time-dependent
gauges and reversal of the spatial shift, which changes `A` to `A(q⁻¹z,t)⁻¹` and keeps `Bᵢ`
and `Tᵢ`. [B04, Introduction (3q)–(7q)][B04].

For an algebraic or analytic parameter space `S` with commuting automorphisms `Tᵢ`, formulate the
two equations using `Bᵢ:E ⇢ Tᵢ^*E`, the equation `(σ_q^*Bᵢ)A = (Tᵢ^*A)Bᵢ`, and
`(Tᵢ^*Bⱼ)Bᵢ = (Tⱼ^*Bᵢ)Bⱼ`. Use a common finite pole bound and the pullback comparisons in each
equation. Pull back along `f: S′ → S` to transport from `f^*E` to `(Tᵢ ∘ f)^*E`. When `S′` has
time actions `T′ᵢ`, use equivariance `fT′ᵢ = Tᵢ f` to identify the targets.

More generally, use a groupoid object `𝒯₁ ⇉ 𝒯₀` in the respective
base category. For source and target `s,t`, assume their pullbacks of `q` agree. Give transport by a
finite-pole horizontal isomorphism `B: s^*E ⇢ t^*E` on `𝒯₁`, with unit and
`m^*B = (pr₁^*B)(pr₂^*B)` for composable pairs `(h,g)` with
`m(h,g) = hg`. Construct pullback to the inverse-image groupoid along a map to `𝒯₀` and
compare its matrix form.

*Needs:* §§0.3, 1.6–1.7 and 6.1, SchemeAndStackFoundations §§1.14 and 1.18, and
ComplexComparisonPartII §C-1.1.

### 6.3 Bundle models, framings, and uniqueness of transport

Given a rational transport and bundle models, prove that it is a regular bundle isomorphism exactly
when it takes each source lattice onto its target lattice. In general use the modification of §1.4
and its determinant divisor formula. For `q` of infinite order, choose `z₀ ∈ ℂˣ`
whose orbit avoids both singular supports. Two rational horizontal maps with the same value at `z₀`
coincide, by propagation around the orbit and finiteness of the zero set of a nonzero rational
function. This gives uniqueness for transport respecting a specified framing, conditional on
existence. For one time arrow, the nonempty set of horizontal isomorphisms is a right torsor for
source automorphisms and a left torsor for target automorphisms. Give the conditions for a lift to
preserve prescribed determinant, local type, and flags.

*Needs:* §§1.2–1.7 and 6.1–6.2.

### 6.4 Testing rational gauge equivalence with connection matrices

For regular singular systems at both endpoints, fix the choices in §5.5 for two systems `A,A′`. A
rational horizontal gauge `B` with `Y′ⱼ = BYⱼ` gives `P′ = P`. Conversely, assume `P′ = P` and that both
endpoint ratios `Y′ⱼYⱼ⁻¹` and their inverses extend meromorphically over their respective
endpoints. They agree on the overlap and glue to an invertible rational horizontal gauge. Under
changes `Y′ⱼ = BYⱼDⱼ`, use `P′ = D_∞⁻¹PD₀`. Account for choices of local constants and
resonant maps by the endpoint conditions. For arbitrary slopes use the triples of §5.4 for the
transport criterion. [S03, §3.1][S03].

*Needs:* §§2.3–2.5, 5.2, 5.4–5.6 and 6.1.

### 6.5 Analytic parameter dependence of a local constant reduction

On a complex manifold `S`, assume `A(z,s)` is jointly holomorphic near `{0}× S`,
`C(s) = A(0,s)` is invertible, and each operator `X ↦ q^mXC(s) − C(s)X` is invertible for `m ≥ 1`.
Near each `s` construct the unique jointly holomorphic gauge `H` with `H(0,s) = I` and
`(σ_q H)C = AH`, on a common positive-radius `z`-disk. Apply the recurrence in §2.4 with Cauchy
bounds. The operators tend uniformly to `X ↦ −C(s)X` on compact parameter neighborhoods.
Use the local bound on `C(s)⁻¹` to bound the inverses for large `m`, and use nonresonance for
the finitely many small `m`. Prove local openness of the nonresonance locus and naturality under
holomorphic pullback. The proof allows Jordan blocks and repeated eigenvalues. [S00, §§1.1.1 and 1.1.3][S00].

*Needs:* §2.4, finite-dimensional holomorphic families, Cauchy estimates, and ComplexKahlerGeometry
§3.1.

### 6.6 Gluing endpoint gauges with uniform pole bounds

Let `S` be a complex manifold. For two relative systems in matrix form, assume jointly meromorphic
horizontal gauges on the two endpoint charts whose restrictions agree on
`ℂˣ× S`. Assume their glued matrix and its inverse have entries in
`𝒪(D)` and `𝒪(D′)`, respectively, for finite flat relative effective Cartier
divisors `D,D′` on `ℙ¹× S`. Prove that locally on `S` both matrices are rational in
`z` with holomorphically varying coefficients. Choose a fixed affine chart containing the supports
near a parameter, use a monic polynomial `p(z,s)` defining `D`, and show that `pB` is polynomial in
`z` of bounded degree with holomorphic coefficients. Apply the same argument to the inverse using
`D′`. Use Weierstrass preparation to obtain the divisors with multiplicities and allow collisions.
Compare changes of chart, base change, composition, inversion and the relative modification of §1.7.
This theorem takes joint gauges and uniform pole bounds as inputs.

*Needs:* §§1.6–1.7 and 5.2, ComplexKahlerGeometry §§3.1–3.2 and 4.1, ComplexManifolds Milestone 7,
and ComplexComparisonPartII §C0.4 for the analytification comparison.

### 6.7 Analytically trivialized families and continuous-time equations

Suppose `B(z,s₀) = I` and `A(z,s)B(z,s) = B(qz,s)A(z,s₀)`, with the hypotheses of §6.6. Give the
transport on the pair groupoid by `B(z,s′)B(z,s)⁻¹`. In local coordinates set
`Ωᵢ = (∂ᵢB)B⁻¹`. Show rationality in `z` and

```
∂ᵢ A = Ωᵢ(qz,s)A − AΩᵢ(z,s),
∂ᵢΩⱼ−∂ⱼΩᵢ = [Ωᵢ,Ωⱼ].
```

Give the coordinate, base-point, pullback, time-dependent gauge and spatial reversal comparisons.
Conversely, assume a solution of the displayed equations integrates to a normalized fundamental
matrix satisfying the joint meromorphic and finite-pole conditions of §6.6. Show that
`B(qz,s)⁻¹A(z,s)B(z,s)` has all parameter derivatives zero and hence equals its value at `s₀`.
This proves the horizontal transport statement on a connected neighborhood.

*Needs:* §§6.1–6.2 and 6.5–6.6, holomorphic differentiation, and uniqueness of the normalized
fundamental matrix.

### Examples

- For `A = I₂` and two identity time shifts, the constant gauges `I + E₁₂,I + E₂₁` satisfy the
  spatial equations. Their different products show that they fail the time square.
- For `q = 1/2`, take `B = z²/(z² − s)`, `A = (z² − s)/(z² − 4s)` and
  `Ω = 1/(z² − s)`. Check `AB = B(z/2,s)`
  and the compatibility derivative. The pole bounds `z² − s = 0` and `2[0]` satisfy §6.6 even at the
  collision. The moving divisor meets the zero section, so the endpoint hypothesis of §1.8 fails
  there.
- For `B = (I + sE₁₂)(I + tE₂₁)` the coefficient `Ωₜ` is
  `[[s, −s²], [1, −s]]` and `Ωₛ = E₁₂`.
  Differentiating and taking the commutator give the same matrix
  `[[1, −2s], [0, −1]]`.

### Dependencies

The global comparison supplies the transport of individual systems. Relative transport uses finite
pole bounds and pullback laws. The family results use parameter estimates, jointly meromorphic
endpoint data, and a normalized trivialization in the stated domains.

## Layer 7: Discrete Schlesinger transformations of polynomial systems

Let `n,d ≥ 1` and `L ∈ GLₙ(ℂ)`. Fix `d` labelled spectral groups
`Sᵢ = {a_(i,α) | 1 ≤ α ≤ n} ⊂ ℂˣ` whose distinct labels belong to
distinct `q^ℤ`-orbits. The algebraic statements use any nonzero infinite-order `q`, with
no semisimplicity assumption on `L`. The analytic interpretation uses `0 < |q| < 1`.

### 7.1 Reordering linear matrix factors

For disjoint `n`-element spectral sets, prove that each permutation of the monic linear factors of
`∏_(i = 1)^d (zI − Xᵢ)` has a unique refactorization with spectra in the permuted order on a
nonempty Zariski-open set. The factors depend rationally on the initial ones. In the two-factor case
solve `YΛ − Λ X = I` by invertibility of the Sylvester operator from spectral separation. On
`det Λ ≠ 0` set `S = X + Λ⁻¹ = Λ⁻¹YΛ` and
`T = Y − Λ⁻¹ = Λ XΛ⁻¹`. Verify

```
(zI − X)(zI − Y) = (zI − S)(zI − T).
```

Show uniqueness by comparing factorizations with the same ordered spectra, using disjoint
determinant supports and the value at infinity. Prove rationality, inverse and composition laws for
adjacent swaps, and comparison with conjugation and products of blocks.

For `A = L∏ᵢ (zI − Cᵢ)` with the specified spectra, a monic right factor for group `i` comes from
the kernel lines of `A(a_(i,α))`. If the matrix `V` of their generators is invertible, the
factor is `zI − Bᵢ` with `Bᵢ = V diag(a_(i,α))V⁻¹`. Prove independence of
generator scaling and uniqueness and rationality of the factor and monic quotient by matrix
polynomial division. [B04, Lemmas 3.2–3.4, 3.11, 4.2–4.3 and Proposition 4.8][B04].

*Needs:* §0.3, matrix polynomials, and Mathlib's generalized eigenspaces, determinant and adjugate,
and finite-dimensional linear algebra.

### 7.2 Gauge shifting one spectral group

Write `A = L Dᵢ(z)(zI − Bᵢ)` by §7.1 and put `Rᵢ(z) = I − z⁻¹Bᵢ`. Prove

```
A^(i)(z) = Rᵢ(qz)A(z)Rᵢ(z)⁻¹ = (zI − q⁻¹Bᵢ)L Dᵢ(z).
```

This has the same degree and leading coefficient `L`, and moves exactly group `i` by
`a_(i,α) ↦ q⁻¹a_(i,α)`. At the endpoints verify
`A^(i)(0) = q⁻¹Bᵢ A(0)Bᵢ⁻¹` and `Rᵢ(∞) = I`. Compute `Rᵢ⁻¹ = z(zI − Bᵢ)⁻¹`, its
determinant divisor, and the Smith types of `Rᵢ`: `(−1,…,−1)` at zero, `(0,…,0,1)` at
each `a_(i,α)`, and zero at infinity. Match these to the lattice modification and the induced
determinant change. Refactor `A^(i)` in the prescribed order to define the rational step `Tᵢ`.
[B04, Introduction (3q)–(7q) and Remark 4.14][B04].

*Needs:* §§0.3, 1.3–1.5 and 7.1.

### 7.3 Commuting transformations on finite time ranges

For every integer `N ≥ 0`, construct a nonempty Zariski-open subset of the initial factor space on
which the iterates `Cᵢ(k)` exist uniquely for `maxⱼ|kⱼ| ≤ N`. They are rational in the initial
factors and have `Sp Cᵢ(k) = q^(−kᵢ)Sᵢ`. Set `Cⱼ = Cⱼ(k)`, `C′ⱼ = Cⱼ(k + eᵢ)` and
require the step equation whenever its indices are in range, with products in increasing index
order:

```
(∏_(j = i)^d (zI − q⁻¹Cⱼ))L (∏_(j = 1)^(i − 1) (zI − Cⱼ))
= (∏_(j = i + 1)^d (zI − q⁻¹C′ⱼ))L (∏_(j = 1)^i (zI − C′ⱼ)).
```

Prove path independence and invertibility, commutation as birational maps between the indicated
spectral types, and the simultaneous shift `Cᵢ(k + 𝟙) = q⁻¹L⁻¹Cᵢ(k)L`.

Use the twisted sequence `zI − Qⱼ` with `Q_(j + d) = qLQⱼL⁻¹` and unique refactorization. The
semigroup automorphism on monic polynomials of degree `m` is `P(z) ↦ q^m L P(q⁻¹z)L⁻¹`.
On a finite time range require every denominator in the selected finite forward and backward
refactorizations to be nonzero. To prove nonemptiness, triangularize `L` and take the initial `Cᵢ`
diagonal in that basis. The twisted factors stay triangular under adjacent refactorization: the
Sylvester operator preserves triangular matrices, and its solution there has diagonal entries given
by inverses of differences of distinct spectral labels after shifting. Thus every required `Λ`
is invertible at this initial point. Prove compatibility of the finite constructions by restriction
and uniqueness.
[B04, Introduction (7q), §4(a)–(c), Proposition 4.8, Theorem 4.9 and Remark 4.14][B04].

*Needs:* §§7.1–7.2, finite-dimensional triangularization, and nonempty Zariski-open loci for
rational maps.

### 7.4 The q-Schlesinger equations

For `Aₖ = L∏ⱼ (zI − Cⱼ(k))`, let `zI − Bᵢ(k)` be its monic right factor of group `i`. Prove

```
Bᵢ(k) − Bᵢ(k + eⱼ) = Bⱼ(k) − Bⱼ(k + eᵢ),
Bⱼ(k + eᵢ)Bᵢ(k) = Bᵢ(k + eⱼ)Bⱼ(k),
Bᵢ(k + 𝟙) = q⁻¹L⁻¹Bᵢ(k)L, Sp Bᵢ(k) = q^(−kᵢ)Sᵢ.
```

For `Rᵢ(z,k) = I − z⁻¹Bᵢ(k)` the first two equations are the coefficients of `z⁻¹` and `z⁻²`
in the transport square. Together with §7.2 the square gives flat transport. Compare
`Cᵢ(k) = Bᵢ(k + e_(i + 1)+⋯+e_d)` and prove the converse reconstruction for generic initial data on
its domain. Use a finite time range containing all auxiliary shifted indices for this comparison and
then restrict to the desired indices. Give the negative time gauge `Rᵢ(z,k − eᵢ)⁻¹` and
compatibility with changing the time origin. [B04, Introduction (3q)–(7q), §4 and Remark 4.14][B04].

*Needs:* §§0.3, 6.2 and 7.1–7.3.

### 7.5 Birational lattice action and preservation of connection data

Assemble the `Tᵢ` into a `ℤ^d`-action by birational maps between the labelled spectral
spaces, sending `a_(i,α)` to `q^(−kᵢ)a_(i,α)` at displacement `k`. Products of the `Rᵢ`
give path-independent gauges `Rₖ` with

```
R_(k + ℓ)(z,t) = Rₖ(z,T_ℓ t)R_ℓ(z,t).
```

For `0 < |q| < 1`, apply §§5.4 and 6.1 to these systems and gauges to obtain coherent
isomorphisms of the connection data, including all endpoint analytic invariants. Prove the endpoint spectral scaling `q^(−Σᵢ kᵢ)` at zero and
preservation of `L`. In the sum-zero sublattice the zero spectrum and `det A(0)` are fixed. On each
finite time range provide uniform bounds on the poles of both gauge directions from zero and the
finitely many shifted roots. Compare this family with §6.6.

*Needs:* §§5.4, 6.1–6.2, 6.6 and 7.2–7.4.

### Examples

- In rank one, `A = λ∏ⱼ (z − aⱼ)` and `Rᵢ = (z − aᵢ)/z`. The step changes the single factor to
  `z − q⁻¹aᵢ`. For degree one, `C(k) = q^(−k)L^(−k)C(0)L^k` for every integer `k`.
- For a noncommuting rank-two, degree-two check, use `q = 1/2` and

  ```
  L = [[1, 1], [0, 1]],
  C₁ = [[3, 1], [0, 5]],
  C₂ = [[7, 0], [2, 11]].
  ```

  The first right factor has
  `B₁ = (1/7) [[27, 24], [2, 29]]`. Check both
  spatial equations and the square. Both orders of the two steps give
  `C′₁ = [[6, −2], [0, 10]]` and `C′₂ = [[10, −12], [4, 26]]`, in agreement with `2L⁻¹CᵢL`.

### Dependencies

Refactorization and the polynomial action use the algebra and lattice calculations. Coherent
connection preservation uses the comparison over `ℂ`. The Zariski-open domain is
constructed for each finite range of times.

## Downstream consumers

Specific `q`-isomonodromic systems can use Layer 1 for singularity types and modifications, Layers
3–4 for endpoint data, and §§5.4 and 6.1–6.2 for connection-preserving transport. Polynomial systems
in the domain of Layer 7 can use its transformations and finite-time existence theorem. A relative
problem uses §§1.6–1.8 for its underlying groupoids and endpoint data, §4.7 for fixed graded-type
coefficient families, and §§6.5–6.7 when the stated analytic family hypotheses hold. A comparison
over a general parameter base has its own existence, base-change and regularity hypotheses.

## Scope and ownership

This roadmap owns the automorphism comparison with invertible semilinear operators, the
model construction along difference scalar extension, and the relative difference connections of
§1.6. It supplies the `q`-shift, local slope and Stokes theory, the global comparison, coherent
transport and polynomial transformations. Its analytic classification and global comparison allow resonance,
nonsemisimple factors, and arbitrary rational slopes. The separated spectral type is the domain of
the polynomial transformation theorem. Individual `q`-Painlevé equations, stability conditions and
the geometry of particular moduli surfaces, cluster realizations, tau functions, confluence and
difference Galois density lie outside this scope. The differential theory in
[PainleveEquations](../PainleveEquations/README.md) is the counterpart for ordinary connections. The
present roadmap uses the indicated algebraic, analytic and geometric suppliers directly.

### Reuse of the foundations

The linearized algebra and the two-term complex over the fixed scalars come from
[PhiGammaModulesAndIwasawaCohomology §§0.1–0.2][pg-linear]. The reuse in other settings is
described by the following inputs and hypotheses.

| Setting | Shared input | Further data or results in that setting |
| --- | --- | --- |
| Complex linear `q`-difference systems | Local and global comparison in arbitrary finite rank, with resonance, nonsemisimple factors and rational slopes | A specified singular type, framing, stability condition or polynomial condition supplies the corresponding restriction. |
| Relative `q`-connections on possibly nonreduced bases and nontrivial bundles | Linearized algebra, scalar extension models, and §§1.6–1.8 for finite-pole connections, decorations, descent and endpoint constructions | §4.7 gives fixed-graded-type coefficient families. The analytic family results of §§6.5–6.7 use their stated hypotheses. A relative local or global classification requires its own comparison theorem. |
| Additive differences and other automorphisms of curves | The algebra of §§0.1–0.3, rational difference connections of §1.1, and relative finite-pole connections of §1.6 | Each shift has its own local and global analytic theory. The elliptic quotient, the `q`-Stokes sheaf and the comparison using zero and infinity belong to the multiplicative shift. |
| Mahler systems `z ↦ z^ℓ` with `ℓ ≥ 2` | Linearized modules for a unital endomorphism over the rational coefficient ring. The germ at `z = 1` uses `z = exp(u)`; the inverse local action has shift `u ↦ u/ℓ` at zero. [R16, §1, p. 2][R16] | At zero and infinity the local classification and the Puiseux and Hahn extensions are Mahler-specific. |
| Frobenius modules, isocrystals and (φ,Γ)-modules | Finite projective linearized modules, their tensor, dual and scalar extension, and the two-term complex over fixed scalars | Coefficient topologies, étaleness, Frobenius slopes and the Γ-action with its cohomology come from the respective theories. |

The Laurent models of §§3.6 and 5.1 globalize local analytic modules. To retain finite singularities
of the original rational system, use the lattices and modifications of §§1.2–1.7 together
with the global connection data of §5.4. In the general model groupoid, a model is specified by
its comparison isomorphism after scalar extension. Freeness and realization as a submodule are
conclusions in §3.6. Existence and uniqueness for the filtered Laurent category are theorems in
§5.1. For an integral lattice whose linearization becomes invertible only after localization,
apply the model construction to the actual localization functor on the category of those
integral lattices. The coefficient algebra for a shift of infinite order on the unit circle
is included, with the analytic classification using the modulus hypothesis in Conventions.

Section 1.6 uses an automorphism of the underlying space. Geometric constructions for
noninvertible endomorphisms also require hypotheses on the pullback of the divisors.
Connections for a general algebraic group would require torsors and tensor-compatible
structure. Several spatial shifts would require commuting structure maps. The several
time directions in Layer 6 act on a system with a single spatial shift.

## Exact supplier contracts

### From Mathlib and Tau Ceti

| Supplier | Contract used here |
| --- | --- |
| [Mathlib semilinear equivalences][ml-linear] and [module scalar change][ml-scalars] | `LinearMap` and `LinearEquiv` implement semilinearity with a `RingHomInvPair` for the inverse. `ModuleCat` supplies tensor operations, scalar restriction and extension, and the scalar change comparisons for §0.2. |
| [Mathlib skew monoid algebras][ml-skew], [lifting][ml-lift], and [skew polynomials][ml-skewpoly] | `single_mul_single`, `singleOneRingHom`, `of` and `liftNCRingHom` supply the carrier and universal map. §0.5 supplies the action, its module comparison, and the cyclic-vector theorem. |
| [Mathlib categorical pullback][ml-cat-pullback] and [core][ml-core] | The categorical pullback has both projections and a comparison natural isomorphism, and carries every compatible pair of maps. The core gives isomorphism groupoids and the induced functors. Section 0.2 applies these to scalar extension, and §1.6 uses the same comparisons for geometric pullback. |
| [Tau Ceti's affine bundle equivalence][tc-bundle-affine] | `FiniteLocallyFreeSheaf.finiteProjectiveEquiv` identifies finite projective modules over a commutative ring with finite locally free sheaves on its spectrum, with all linear maps. Section 1.6 uses the associated sheaf and global sections, the pullback and scalar extension comparison, and the inverse orientation for the connection. |
| [Tau Ceti dualizability][tc-fpd] and [dual tensor and internal Hom][tc-dual-ihom] | `ModuleCat.hasLeftDualOfFiniteProjective` and `ModuleCat.hasRightDualOfFiniteProjective` give categorical duals. `ModuleCat.dualTensorIhom_app_eq` identifies the comparison with contraction on modules. Section 0.2 uses these comparisons for the horizontal structures. |
| [Mathlib rational functions][ml-rat] and [Laurent series][ml-laurent] | Use `RatFunc` and `LaurentSeries`, the fraction-field, coefficient and valuation structures, and the rational-to-formal embedding. §0.4 supplies the analytic intermediate field comparison and equivariance. |
| [Tau Ceti meromorphic germs][tc-germ], [pullback][tc-pullback] and [stalk comparison][tc-stalk] | `TauCeti.meromorphicGerms ℂ 0` carries the field of one-variable germs. Pullback along the local biholomorphism `z ↦ qz` gives the shift. The holomorphic stalk and its fraction field give the valuation and regularity comparisons. |
| [Mathlib derived Ext][ml-ext], [Tau Ceti projective presentations][tc-ext] and [Baer sum][tc-baer] | Use `CategoryTheory.Abelian.Ext` and the short exact sequence class. `TauCeti.homCokernelEquivExt` consumes the explicit left-`D` presentation of §3.5 and identifies the cokernel with Ext compatibly with pushout. |
| [Tau Ceti finite Galois descent][tc-galois] | Invariants span after scalar extension and the canonical comparison is injective. §§0.4 and 3.4 identify the field action and prove horizontality and the corresponding functorial comparisons. |
| [Tau Ceti Jordan decomposition][tc-jordan] | `LinearMap.GeneralLinearGroup.jordanDecomposition` and its specification give commuting semisimple and unipotent factors, applied to the constant model in §2.3. |
| [Tau Ceti finite locally free sheaves][tc-bundle], [pullback][tc-bundle-pull] and [determinant][tc-det] | Use `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf`, with fixed rank when specified, the canonical pullback, and the rankwise determinant. [Monoidal pullback][tc-monoidal] gives the unit, tensor and composition comparisons for relative connections. |
| [Tau Ceti Krull–Schmidt input][tc-ks] and [local endomorphism rings][tc-localend] | Use the finite Artinian-linear decomposition and local endomorphism inputs after verifying Hom finiteness and idempotent splitting for holomorphic bundles. |
| [Mathlib affine space][ml-affine] and [action groupoids][ml-action] | `AffineSpace.homOverEquiv` supplies the functor of points. `ActionCategory` supplies the action groupoid and stabilizers. Layers 3–4 supply the comparison with difference modules. |
| [Mathlib generalized eigenspaces][ml-eigenspace] and [triangularization inputs][ml-triangular] | Use the spanning result and the behavior under intertwiners for the Sylvester map. §7.1 adds the factorization, and §7.3 applies triangularization to `L`. |

### From other roadmaps

[PhiGammaModulesAndIwasawaCohomology §0.1][pg-linear] supplies the linearized module category for
a commutative ring with a unital endomorphism, its horizontal maps and finite projective
subcategory, tensor, unit, dual, and scalar extension. For example, on the standard line
over `𝔽_p[t]` with `σ(t) = t^p` the linearization is invertible and `t` lies outside
the image of the semilinear map. Sections 0.1–0.2 supply the comparison for automorphisms
and the models along scalar extension. The inverse-action, abelian-category and skew Laurent
results use automorphisms.

[PhiGammaModulesAndIwasawaCohomology §0.2][pg-complex] supplies the two-term complex with
differential `Φ − 1` over the fixed scalars. Its skew polynomial interpretation uses right
multiplication by `Φ − 1` in the resolution of the unit among left modules. Section 3.5
uses its own free presentation and internal Hom to compute Ext for the skew Laurent ring.
These inputs are the general algebra of the cited sections.
[KL15, Convention 1.5.1, Definition 1.5.4 and Remark 1.5.6][KL15].

| Roadmap | Sections and supplied structures |
| --- | --- |
| [FormalLaurentPuiseux](../FormalLaurentPuiseux/README.md) | Layers 1, 4 and 6 give coefficient fields, substitution, bounded-denominator levels, the degree-`r` basis and valuation rescaling, and formal Galois ramification. |
| [AlgebraicVectorBundles](../AlgebraicVectorBundles/README.md) | §§1.1–1.2 give pullback and tensor coherence, §§2.1–2.2 supply exactness and base change with their stated hypotheses, and §§3.1–3.2 give exterior powers and determinants. |
| [AlgebraicCurves](../AlgebraicCurves/README.md) | §§1.1–1.2, 3.1–3.2, 5.7 and Layer 12 give the function field, local DVRs and completions, divisors, and their degrees on curves. |
| [ComplexManifolds](../ComplexManifolds/README.md) and [ComplexTori](../ComplexTori/README.md) | ComplexManifolds Milestones 3–5 and 7 give the sphere, analytic quotients, gluing, and bundle descent. ComplexTori Milestones 1 and 3 give the full lattice quotient and finite isogeny comparisons used in §§2.1, 3.8 and 4.6. |
| [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) | §§2.3 and 2.5 give planar `∂̄` solvability and Dolbeault comparison. §§3.1–3.3 give analytic germs, the regularity and Laurent comparisons, and parameter analysis and Weierstrass preparation. §§4.1 and 4.4 give bundle and section sheaf comparisons. §§5.10 and 7.6–7.8 supply finite-dimensional cohomology, duality, degree and degree-zero characters on an elliptic curve. |
| [ArtinAlgebras](../RepresentationTheory/ArtinAlgebras/README.md) and [SemisimpleAlgebras](../RepresentationTheory/SemisimpleAlgebras/README.md) | ArtinAlgebras §§0.1–0.4 and 0.6 give Fitting, Krull–Schmidt and the categorical radical. SemisimpleAlgebras Layers 0–2 give the radical quotient, matrix blocks and their central idempotents over `ℂ`. §3.8 applies these to deck descent. |
| [PseudoholomorphicCurveAnalysis](../PseudoholomorphicCurveAnalysis/README.md) | §§6.2–6.4 compare the kernel and cokernel of the Cauchy–Riemann operator with the analytic ones. §7.2 gives real index `rχ_top + 2deg V`, which yields `χ(V) = deg V` on `E_q`. |
| [SpecialFunctionsTheta](../SpecialFunctionsTheta/README.md) | §§1.1–1.3, 4.1–4.2 and 5.1 give theta convergence, quasi-periodicity, zeros and the logarithmic derivative. §2.2 converts them to the multiplicative convention. |
| [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) | §§1.1, 1.14–1.16, 1.18, 1.21 and 2.3 give sheaf descent, groupoid objects, torsors, stacks, 2-fibre products, quotient stacks and nonabelian `H¹`. §§4.7–4.8 give jets and completion. §1.8 uses finite locally free frames for the relative completion comparison, with the supplier's Noetherian hypotheses retained for general coherent completion. |
| [TopologicalSheafCohomology](../TopologicalSheafCohomology/README.md) | §§1.1–1.3 give Čech refinement and its comparison with derived cohomology on a compact Hausdorff base for the additive Stokes quotients. |
| [ComplexComparisonPartII](../ComplexComparisonPartII/README.md) | §§C-1.1 and C0.1–C0.4 give possibly nonreduced complex analytic spaces, fibre products, analytic module sheaves and coherent analytification. §§C1.9 and C2.2 give projective GAGA for the bundle gluing and rational frame in §5.2. |

## References

- **KL15.** K. S. Kedlaya and R. Liu, *Relative p-adic Hodge theory: Foundations*,
  arXiv:1301.0792v5 (2015), Convention 1.5.1, Definition 1.5.4 and Remark 1.5.6.
  [Preprint][KL15]
- **R16.** J. Roques, *On the local structure of Mahler modules*, §1, p. 2, author's
  manuscript dated November 30, 2016. [Author's text][R16]
- **S00.** J. Sauloy, *Systèmes aux q-différences singuliers réguliers : classification, matrice de
  connexion et monodromie*, Ann. Inst. Fourier **50** (2000), 1021–1071. [Published text][S00]
- **S03.** J. Sauloy, *Galois theory of fuchsian q-difference equations*, Ann. Sci. ENS **36**
  (2003), 925–968. [Published text][S03]
- **VPR07.** M. van der Put and M. Reversat, *Galois theory of q-difference equations*, Ann. Fac.
  Sci. Toulouse **16** (2007), 665–718. The slope comparison is in §3.1. [Published text][VPR07]
- **S09.** J. Sauloy, *Équations aux q-différences et fibrés vectoriels holomorphes sur la courbe
  elliptique ℂ×/q^ℤ*, Astérisque **323** (2009), 397–429. [Published text][S09]
- **RSZ13.** J.-P. Ramis, J. Sauloy, and C. Zhang, *Local analytic classification of q-difference
  equations*, Astérisque **355** (2013). [Published text][RSZ13]
- **S24.** J. Sauloy, *Classification analytique locale des équations aux q-différences de pentes
  arbitraires*, Ann. Fac. Sci. Toulouse **33** (2024), 647–679. The summation formulas use an expanding shift. The contracting coefficient equation is in §4.3.
  §4.6 uses the average of the `r` distinct iterates in Proposition 3.11. [Published text][S24]
- **B04.** A. Borodin, *Isomonodromy transformations of linear systems of difference equations*,
  Ann. Math. **160** (2004), 1141–1182. Layer 7 uses the refactorization theorem and its
  multiplicative version in Remark 4.14.
  [Published article](https://annals.math.princeton.edu/2004/160-3/p08) · [Preprint][B04]
- **K16.** A. Knizel, *Moduli spaces of q-connections and gap probabilities*, IMRN **2016**,
  6921–6954. Layer 1 uses the numbering of arXiv:1506.06718v2.
  [Published article](https://doi.org/10.1093/imrn/rnv366) · [Preprint][K16]
- **A57.** M. F. Atiyah, *Vector bundles over an elliptic curve*, Proc. London Math. Soc. **7**
  (1957), 414–452. See pp. 420–423 and 427–428 for §3.8. [Published text][A57]
- **M19.** T. Mochizuki, *Doubly periodic monopoles and q-difference modules*, arXiv:1902.03551v1
  (2019), §§1.5.1 and 10.1.2–10.1.3. [Preprint][M19]
- **SPF, SPQ, SPD.** The Stacks Project, [Stacks in groupoids][SPF],
  [Quotients by group actions][SPQ], and [Relative effective Cartier divisors][SPD].

[KL15]: https://arxiv.org/pdf/1301.0792v5
[R16]: https://math.univ-lyon1.fr/~roques/OTLSOMM.pdf
[pg-linear]: ../PhiGammaModulesAndIwasawaCohomology/README.md#01-linearized-frobenius-modules
[pg-complex]: ../PhiGammaModulesAndIwasawaCohomology/README.md#02-free-covers-and-frobenius-cohomology

[S00]: https://www.numdam.org/item/AIF_2000__50_4_1021_0/
[S03]: https://www.numdam.org/item/10.1016/j.ansens.2002.10.001/
[VPR07]: https://www.numdam.org/item/AFST_2007_6_16_3_665_0/
[S09]: https://www.numdam.org/item/AST_2009__323__397_0/
[RSZ13]: https://www.numdam.org/item/AST_2013__355__R1_0/
[S24]: https://www.numdam.org/articles/10.5802/afst.1784/
[B04]: https://arxiv.org/abs/math/0209144v2
[K16]: https://arxiv.org/abs/1506.06718v2
[A57]: https://math.berkeley.edu/~nadler/atiyah.classification.pdf
[M19]: https://arxiv.org/abs/1902.03551v1
[SPF]: https://stacks.math.columbia.edu/tag/02ZH
[SPQ]: https://stacks.math.columbia.edu/tag/04UV
[SPD]: https://stacks.math.columbia.edu/tag/056P

[ml-semilinear-map]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Algebra/Module/LinearMap/Defs.lean
[ml-linear]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Algebra/Module/Equiv/Defs.lean
[ml-scalars]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Algebra/Category/ModuleCat/Pseudofunctor.lean
[ml-skew]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Algebra/SkewMonoidAlgebra/Basic.lean
[ml-lift]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Algebra/SkewMonoidAlgebra/Lift.lean
[ml-skewpoly]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Algebra/SkewPolynomial/Basic.lean
[ml-rat]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/FieldTheory/RatFunc/Basic.lean
[ml-laurent]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/RingTheory/LaurentSeries.lean
[ml-ext]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean
[ml-affine]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/AlgebraicGeometry/AffineSpace.lean
[ml-action]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/CategoryTheory/Action.lean
[ml-eigenspace]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/LinearAlgebra/Eigenspace/Basic.lean
[ml-triangular]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean
[tc-germ]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Analysis/Meromorphic/Germ.lean
[tc-pullback]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Analysis/Meromorphic/Pullback.lean
[tc-stalk]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Geometry/Manifold/Complex/StructureSheaf/MeromorphicGerm.lean
[tc-ext]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Algebra/Homology/Ext/Presentation.lean
[tc-baer]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Algebra/Homology/Ext/BaerSum.lean
[tc-galois]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/RepresentationTheory/GaloisDescent/Span.lean
[tc-jordan]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/LinearAlgebra/JordanChevalley/Multiplicative.lean
[tc-bundle]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean
[tc-bundle-pull]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/AlgebraicGeometry/VectorBundle/Functoriality.lean
[tc-det]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/AlgebraicGeometry/VectorBundle/Determinant/LocallyConstantRank.lean
[tc-monoidal]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/AlgebraicGeometry/Modules/Pullback/Monoidal/Basic.lean
[tc-ks]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/CategoryTheory/Preadditive/KrullSchmidt.lean
[tc-localend]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/CategoryTheory/Preadditive/Indecomposable.lean
[ml-cat-pullback]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean
[ml-core]: https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/CategoryTheory/Core.lean
[tc-bundle-affine]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/AlgebraicGeometry/VectorBundle/Affine/Basic.lean
[tc-fpd]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Algebra/Category/ModuleCat/FiniteProjective/Dualizable.lean
[tc-dual-ihom]: https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Algebra/Category/ModuleCat/DualTensorIhom.lean
