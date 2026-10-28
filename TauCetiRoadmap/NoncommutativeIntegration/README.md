# Noncommutative integration and martingale inequalities

Develop the Lp spaces of von Neumann algebras as usable analytic spaces:
semifinite duality and interpolation, weight-independent Haagerup spaces,
finite-algebra reduction, their Banach-space geometry, and the row/column
inequalities governing random sums and martingales. The principal analytic
milestones are Haagerup's reduction theorem, noncommutative Khintchine,
Burkholder–Gundy, and finite-tracial H¹–BMO duality.

## Scope, conventions and dependencies

Von Neumann algebras and Hilbert spaces are complex. Semifinite spaces use
an explicitly chosen faithful normal semifinite trace τ, without assuming
τ(1)<∞. General Haagerup Lp spaces are constructed for arbitrary von Neumann
algebras. The martingale transfer theorem uses a faithful normal state and
an increasing sequence of unital subalgebras invariant under its modular
group, with ultraweakly dense union.
Finite tracial martingale theorems use τ(1)=1. Neither a faithful state nor
a trace-preserving expectation is implicit for an arbitrary algebra or
subalgebra.

Construct spaces for 0<p<∞ and put L∞(M)=M. For p≥1 use Banach-space
structures; for 0<p<1 use the p-norm and its complete translation-invariant
metric, not an instance asserting the ordinary triangle inequality.
The subunit range is needed for products and square functions even when
the principal inequalities have p≥1. The Khintchine theorem here has
1≤p<∞, Burkholder–Gundy has 1<p<∞, and H¹–BMO has its separately stated
finite-tracial scope. General subdiagonal Hardy algebras, Schur-multiplier
classification, Lp isometric-isomorphism classification, and stochastic
integration are outside this roadmap.

Use these prerequisite developments:

- [VonNeumannAlgebras](../VonNeumannAlgebras/README.md) V4–V7 for preduals,
  traces and normal maps; V2 for spatial von Neumann tensors and V8 for
  discrete crossed products and their canonical expectations; V10 for affiliated
  operators, the τ-measurable operator algebra, and basic semifinite Lp
  for 1≤p<∞, including completeness, Hölder, L¹=M_* and L²=GNS;
  V11 for weights and their tensor products, general standard forms, modular groups, cocycles and
  continuous cores, dual fixed-point identification and the
  Pedersen–Takesaki density theorem. I1 extends the measurable theory to smaller exponents
  and develops singular numbers; it does not reconstruct V10's spaces.
- [BanachSpaceTheory](../BanachSpaceTheory/README.md) B1–B2 for duality,
  weak compactness and reflexivity. I2 owns compatible Banach couples and
  interpolation functors used here.
- [CStarAlgebras](../CStarAlgebras/README.md) C3–C5 for operator spaces,
  matrix norms, CP maps and spatial tensors.
- [OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md)
  owns singular values, trace class, Hilbert–Schmidt and Schatten ideals.
  Prove the B(H) comparisons with that construction for p≥1. I1 owns
  the smaller-exponent Schatten quasi-ideal extension. For p=∞ our space
  is B(H), even when a compact-operator ideal uses a different endpoint.
- [OperatorTheory/Majorization](../OperatorTheory/Majorization/README.md)
  MAJ-A28 and MAJ-A31 for the finite-dimensional Ky Fan maximum principle
  and triangle inequality used in the I1 matrix Check.
- [PDE](../PDE/README.md) owns scalar Riesz–Thorin and Marcinkiewicz.
  Reuse its classical Lp interpolation bounds, Mathlib's Hadamard
  three-lines theorem and measure-theoretic Lp APIs. The general Banach
  couple construction and the noncommutative identifications belong here.

Use `VonNeumannAlgebra` or `WStarAlgebra` according to whether a faithful
representation is present, and the affiliated-operator interfaces from V10.
Use `MeasureTheory.Lp`, `ENNReal.HolderConjugate`, `ContinuousLinearMap`,
`ContinuousLinearEquiv`, `LinearIsometryEquiv`, `CStarMatrix` and
`UniformConvexSpace` for their existing meanings. Use ℝ≥0∞ for exponent
parameters, with p=∞ distinguished; finite positive exponents have explicit
real/NNReal conversions. Use `ENNReal.HolderTriple` and
`ENNReal.HolderConjugate` when their hypotheses match. State exponent equations
as `1/r=1/p+1/q`, with 1/∞=0, and keep positivity of finite exponents explicit.
Closed sums and products of measurable operators are the operations in V10's
measurable algebra; assertions below concern those closures.

Keep three traces distinct: τ on a semifinite base algebra, Tr_core on a
continuous core, and the canonical functional tr_H on Haagerup L¹(M).
Adopt V11's dual action convention
`θ_s(u_t)=exp(i s t)u_t`, `Tr_core∘θ_s=exp(s)Tr_core`.
Accordingly Haagerup Lp consists of measurable operators satisfying
`θ_s(x)=exp(s/p)x`. Sources using negative dual characters have the
opposite parameter s. For finite p a nonzero Haagerup Lp element has
Tr_core(|x|^p)=∞; that expression is not its Lp norm.

The README is definitive. [Suggested.lean](Suggested.lean) gives selected
interfaces and finite-dimensional tests, not an exhaustive specification.

## I1. Singular numbers, measurable convergence and the full exponent range

For a τ-measurable affiliated operator x define
`d_x(λ)=τ(1_(λ,∞)(|x|))`, λ≥0, and
`μ_t(x)=inf {λ≥0 : d_x(λ)≤t}`, t>0. Handle infinite distribution values
using extended nonnegative reals and prove μ_t is finite for t>0.
Prove equivalence with the projection-cut definition
`inf {‖x e‖ : e is a projection, τ(1−e)≤t, x e bounded}`,
including the infimum and endpoint conventions. Establish monotonicity,
right continuity, the generalized-inverse relations, and invariance under
adjoint, polar modulus and unitary multiplication.

Prove the singular-number calculus: scalar homogeneity,
`μ_(s+t)(x+y)≤μ_s(x)+μ_t(y)`,
`μ_(s+t)(xy)≤μ_s(x)μ_t(y)`, bounded left/right multiplier estimates,
and `μ_t(f(|x|))=f(μ_t(x))` for continuous increasing f with f(0)=0.
Give the spectral truncation and projection-intersection proofs, including
the trace-dimension estimate for intersections. Prove the layer-cake and
rearrangement formulas `τ(|x|^p)=∫₀∞ μ_t(x)^p dt` for p>0.
Construct the measure topology with neighborhoods
`V(ε,δ)={x : ∃e projection, τ(1−e)≤δ, x e bounded, ‖x e‖≤ε}`
for ε,δ>0. Prove the neighborhood/filter comparisons with μ_t,
Hausdorffness, the topological-vector-space and topological *-algebra laws,
completeness and density of M by spectral cutoffs. Prove continuity of
star, sum and product in this topology.
Prove a Fatou bound for the p-gauge under convergence in measure.

Extend V10's Lp construction to 0<p<1 by the same finiteness condition.
Prove `‖x+y‖_p^p≤‖x‖_p^p+‖y‖_p^p`, completeness of
`d(x,y)=‖x−y‖_p^p`. Prove p-gauge convergence implies convergence in
measure. Prove dominated convergence: if x_n→x in measure and
`|x_n|≤y` for one positive y∈Lp, then x∈Lp and `‖x_n−x‖_p→0`.
Use `x_n=n^(1/p)1_(0,1/n)` on Lebesgue measure to show that a
bounded p-gauge alone does not supply the converse. Extend Hölder to all positive exponents with
1/r=1/p+1/q, with constant one. Prove the integrated Ky Fan and
product log-submajorization estimates, including extended logarithms,
truncation and endpoint limits. For continuous increasing concave g
with g(0)=0 prove
`∫₀ᵗ g(μ_s(x+y))ds≤∫₀ᵗ g(μ_s(x))ds+∫₀ᵗ g(μ_s(y))ds`.
Check it on `M=M_d(ℂ)` with the unnormalized trace: there
`μ_t(x)=s_⌊t⌋(x)` for the zero-indexed decreasing singular values
s₀≥s₁≥…, which is the indexing of Mathlib's `LinearMap.singularValues`,
so for g the identity and integer t=k the estimate is Ky Fan's
singular-value inequality `∑_(j<k) s_j(x+y)≤∑_(j<k) s_j(x)+∑_(j<k) s_j(y)`
(Fan 1951; see Moslehian, *Ky Fan inequalities*, §3), which
[OperatorTheory/Majorization](../OperatorTheory/Majorization/README.md)
owns as MAJ-A31 with the maximum principle MAJ-A28; the Check consumes it
from there and does not reprove it. For x=e₁₁, y=e₂₂
in M₂(ℂ) both sides are 1≤2 at k=1 and 2≤2 at k=2, while the pointwise
bound `s_1(x+y)≤s_1(x)+s_1(y)` fails (1>0): the integrated form, or the
shifted pointwise form `μ_(s+t)(x+y)≤μ_s(x)+μ_t(y)`, is what holds.
With the normalized trace tr/d instead, `μ_t=s_⌊dt⌋`, so the
identification `μ_t=s_⌊t⌋` pins the unnormalized convention.
Supply its positive-sum reduction by polar decomposition and compression,
and the projection variational formula for the integrated singular numbers.
When that formula needs a diffuse algebra, amplify by the probability
algebra L∞([0,1]) and prove x↦x⊗1 preserves the distribution and μ.
Supply the concave trace inequality
`τ((a+b)^r)≤τ(a^r)+τ(b^r)` for a,b≥0 and 0<r≤1, and the
absolute-value sum estimate yielding the displayed p-triangle for
arbitrary x,y. Pointwise μ_(s+t) bounds alone do not give sharp constants.
Prove density
of bounded finite-trace spectral truncations in Lp for finite p.

Develop the finite-trace inclusions
`‖x‖_p≤τ(1)^(1/p−1/q)‖x‖_q` for p≤q, without imposing them in the
infinite-trace case. Give counting-measure and Lebesgue-measure examples
showing why there is no unrestricted Lq⊆Lp assertion for an infinite trace.
Identify the commutative construction with ordinary measurable functions and
Lp, and B(H) with the Schatten construction, including the finite-dimensional
formula `(∑ singularValue_i(x)^p)^(1/p)` with the unnormalized matrix trace.
For 0<p<1 define S_p by summability of the p-th powers of compact-operator
singular values, prove the p-triangle, ideal estimates and completeness,
and identify it with the tracial Lp of B(H).
Use normalized matrix traces only when explicitly invoking a tracial state.

Define weak Lp by `sup_(t>0) t^(1/p) μ_t(x)<∞` and prove its basic
quasi-norm, adjoint and ideal estimates. Define the Lorentz gauge
`(∫₀∞ (t^(1/p)μ_t(x))^q dt/t)^(1/q)` and its q=∞ supremum version.
Develop embeddings and truncation rules needed by the real interpolation
identification in I2. Distinguish an equivalent Banach norm from this
particular rearrangement gauge.

## I2. Duality and interpolation of semifinite spaces

For conjugate exponents p,q with 1≤p<∞, prove the map
`y↦(x↦τ(xy))` identifies Lq(M,τ) linearly and isometrically with the
continuous complex-linear dual of Lp(M,τ). Supply the norming polar-power
construction, surjectivity from bounded finite-trace corners, and consistency
of the corner representatives. Include p=1,q=∞ and recover V10's predual
identification. For 1<p<∞ deduce reflexivity. At the other endpoint identify
L¹ as the normal functionals on M; do not identify it with the whole Banach
dual M*. Prove cyclicity of the L¹ pairing for Hölder-conjugate products.

Develop compatible Banach couples: continuous linear injections of E₀,E₁
into a common Hausdorff topological vector space, the intersection with
maximum norm, and the sum with infimum norm. Construct the sum as a quotient
of the Banach direct sum and prove completeness and independence of the
ambient realization under compatible endpoint isometries. A couple morphism
is one linear map on the sum whose endpoint restrictions are bounded.
Do not specify two unrelated maps at the endpoints.

Construct complex interpolation `[E₀,E₁]_θ`, 0<θ<1, from bounded continuous
sum-valued functions on the closed vertical strip, holomorphic inside, whose
boundary values lie continuously in the appropriate endpoints and vanish at
vertical infinity. Use the maximum of the two boundary sup norms and the
quotient norm under evaluation at θ. Prove evaluation boundedness using
Hadamard three-lines and scalar duality, completeness, density for regular
couples, functoriality and the estimate
`‖T‖_θ≤‖T‖₀^(1−θ)‖T‖₁^θ`. Include the equivalent nonvanishing boundary
formulation with the Gaussian approximation argument, symmetry θ↔1−θ,
and regularization by the endpoint closures of E₀∩E₁.
Develop Calderón's upper method from continuous sum-valued strip functions
with at most linear growth, holomorphic inside, whose differences on each
boundary line lie in that endpoint with uniformly bounded Lipschitz
quotients. Use g′(θ) and the infimum of the boundary Lipschitz norm to
define `[E₀,E₁]^θ`. For a regular couple, embed the endpoint duals into
the dual of E₀∩E₁ and prove
`([E₀,E₁]_θ)*=[E₀*,E₁*]^θ` isometrically. Prove lower and upper
methods coincide with equal norms when one endpoint is reflexive;
keep them distinct without that hypothesis.
For a regular couple and X_j=[E₀,E₁]_(θ_j), 0≤θ₀<θ₁≤1,
with E₀∩E₁ dense also in X₀∩X₁, prove
`[X₀,X₁]_η=[E₀,E₁]_((1−η)θ₀+ηθ₁)` with equal norms, 0<η<1.
At θ_j=0 or 1 use the corresponding original endpoint. Supply the
affine strip-composition and duality arguments for both inequalities.

Construct real interpolation with
`K(t,x)=inf_(x=x₀+x₁)(‖x₀‖₀+t‖x₁‖₁)` and norm
`‖t^(−θ)K(t,x)‖_(Lq(dt/t))`, 1≤q≤∞. Prove the sum/intersection estimates,
monotonicity and concavity of K, completeness, interpolation of operators,
and compatibility under endpoint isomorphisms. Own the scalar Lp/Lorentz
identifications needed for these functors, while reusing PDE's scalar
operator-interpolation theorems.

For a semifinite algebra, use the common measurable-operator space as the
ambient space and prove, with 1/p=(1−θ)/p₀+θ/p₁,
`[Lp₀(M,τ),Lp₁(M,τ)]_θ=Lp(M,τ)` isometrically for
1≤p₀,p₁≤∞. For p₀<p₁ prove real interpolation gives Lp,q with equivalent
norms for 1≤q≤∞; q=p gives Lp with equivalent norms. Prove the
scalar weighted Hardy estimates for nonincreasing rearrangements in this
full fine-index range, using dyadic integral/sum comparison rather than
imposing q>p₀. Prove the finite-vector-valued
sequence identity `[ℓ_(q₀)(E₀),ℓ_(q₁)(E₁)]_θ=ℓ_q([E₀,E₁]_θ)`
with equal norms, using the compatible product couple and
`1/q=(1−θ)/q₀+θ/q₁`; include the endpoint q_j=∞ on finite index sets.
This is the interpolation lemma for the two-term Clarkson map.
Include the constant couple when
p₀=p₁. Construct analytic families from polar decomposition and spectral
powers with cutoffs, and prove the reverse estimate by duality. Also build
the singular-number retraction for a fixed x∈L¹+M: compatible linear
endpoint contractions T,S with T(x)=μ(x) and S(μ(x))=x. This transfers the
real K-functional comparison to the scalar couple; the maps depend on x.

Deduce noncommutative Riesz–Thorin bounds for compatible maps between two
semifinite Lp couples. Explain agreement with scalar Riesz–Thorin and with
finite-dimensional Schatten interpolation through the established isometries.

## I3. Haagerup spaces and their intrinsic operations

For an arbitrary M choose an n.s.f. weight φ using V11, form its continuous
core R=M⋊_(σ^φ)ℝ and canonical trace Tr_core, and extend the dual action
to the Tr_core-measurable operator algebra. For finite p>0 define Lp(M,φ)
by the covariance equation in the conventions. Prove it is closed under
addition and scalars, that adjoint preserves p, and that products carry
Lp×Lq into Lr for 1/r=1/p+1/q. Show the polar partial isometry of an
Lp element lies in M and its modulus satisfies the same covariance.

Consume V11's dual-action fixed-point theorem R^θ=M and its
Pedersen–Takesaki trace-density theorem. Compare the specified coefficient
inclusion and the normalized Tr_core density, including supported,
nonfaithful weights and their domains. Prove the dual-weight characterization: every
θ-invariant normal semifinite weight on R is the dual of a unique normal
semifinite weight on M. Prove the faithful case first. For a nonfaithful
weight its support p is θ-fixed, hence lies in M. Choose a new n.s.f.
reference weight whose centralizer contains p by summing faithful weights
on pMp and (1−p)M(1−p); use V11's cocycle core isomorphism and
identify pRp with the core of pMp. Apply the faithful theorem there
and extend the resulting weight by x↦ω_p(pxp). Prove compatibility
of dualization with the corner and semifiniteness of this extension.
Construct the inverse through the canonical operator-valued weight,
and prove uniqueness and support correspondence.
For ω∈M_*⁺ use these theorems to construct the density h_ω of its dual weight. Prove that ω↦h_ω extends to a linear order isomorphism
`M_*≃L¹(M,φ)`, independent of decomposing a functional into positive parts.
For a normal semifinite base weight ω prove
`Tr_core(1_(λ,∞)(h_ω))=ω(1)/λ` for λ>0. Deduce h_ω is
Tr_core-measurable iff ω is bounded; this supplies the surjectivity
step for positive elements of L¹ before the linear extension.
Define `tr_H(h_ω)=ω(1)`, prove positivity, faithfulness and
`‖x‖₁=tr_H(|x|)`, and define
`‖x‖_p=tr_H(|x|^p)^(1/p)`. Prove definiteness, the triangle inequality
for p≥1, the p-triangle inequality for 0<p<1, and completeness. Prove explicitly
`Tr_core(1_(λ,∞)(|x|))=λ^(−p)‖x‖_p^p` for finite p and λ>0,
or equivalently `μ_t(x)=t^(−1/p)‖x‖_p`. This also proves the core trace
of |x|^p is infinite for x≠0. Derive constant-one Hölder from product
log-submajorization, where the logarithmic t terms cancel, and the triangle
for p>1 from the integrated Ky Fan estimate; p=1 uses the predual norm.
For 0<p<1 apply I1's concave integrated inequality with
`g(s)=s^r`, 0<r<p, insert the μ formula, cancel the finite integral
factor and let r increase to p. Supply the measure-topology/gauge
completeness estimates; ordinary core Lp integrability cannot replace them.

Develop polar powers, factorization x=yz with y∈Lp,z∈Lq and
`‖x‖_r=‖y‖_p‖z‖_q`, Hölder and tr_H(xy)=tr_H(yx) for conjugate products.
Prove the duality `Lp(M)*≃Lq(M)` for 1≤p<∞, reflexivity for 1<p<∞,
and identify L² with V11's canonical standard form, including conjugation,
positive cone and left/right actions. Build bounded bimodule actions,
positivity, supports, corners, matrices and functorial transport by normal
*-isomorphisms. Prove the left and right supports of every finite-p element
are σ-finite, and the identity `Lp(M)=⋃_e eLp(M)e` over σ-finite projections.
The embeddings and norms for these corners must be compatible.

Consume V11's Connes-cocycle isomorphism between the cores of two
n.s.f. weights, preserving the embedded M, dual action and canonical
core trace. Extend it to measurable operators; show it carries
h_ω to h_ω and induces isometries on every Lp, with identity and cocycle
composition laws. Define weight-independent Lp using this coherent family.
For a semifinite trace τ identify its tracial Lp with the Haagerup model
by the closed product `x h_τ^(1/p)` in the trivial-action core; prove the
norm, star, product and duality compatibilities, with L∞ identified by the
fixed-point inclusion. Here h_τ is the dual-weight density, possibly
unbounded and not necessarily Tr_core-measurable. Form this product
using common affiliated spectral truncations and prove the resulting
product is Tr_core-measurable; h_τ is not assumed to lie in Haagerup L¹.

## I4. State interpolation, inclusions and expectations

For a faithful normal state φ define the left embedding
`j_φ:M→M_*`, `j_φ(x)(y)=φ(yx)`, prove it is contractive, injective
and has dense range, and form the compatible couple (M,M_*) using j_φ.
Construct Kosaki's isometric identification of its complex interpolation
space at 1/p with Lp(M), 1<p<∞. On the dense embedded copy, identify
`j_φ(x)` with `x h_φ^(1/p)` and prove compatibility with the GNS norm at
p=2. Develop the right-embedding and symmetric-embedding versions and their
explicit identifications; in the symmetric convention the dense elements
are `h_φ^(1/(2p)) x h_φ^(1/(2p))`.

Prove the weighted analytic-family and modular-translation estimates used
by these identifications, including approximation by analytic elements.
Establish compatible re-embedding into one reference L¹ space before
interpolating two finite Haagerup exponents; different covariance degrees
inside the core do not give their usual interpolation couple by mere
inclusion in the measurable-operator algebra. Prove the reiteration and
operator-interpolation formulas with those specified embeddings. Do not
assert that ordinary real interpolation of an arbitrary state couple is
the same isometric construction.

For a unital von Neumann subalgebra N⊆M preserved by σ^φ,
consume V11's normal φ-preserving expectation and its modular
commutation. This includes every unital subalgebra of a finite tracial
algebra and its restricted state. Construct the core inclusion and its expectation, and hence consistent
isometric inclusions Lp(N)→Lp(M) and positive contractive projections
E_p:Lp(M)→Lp(N), 1≤p≤∞. On symmetric dense elements require
`E_p(h_φ^(1/(2p)) x h_φ^(1/(2p)))
 =h_(φ|N)^(1/(2p)) E(x) h_(φ|N)^(1/(2p))`.

Prove composition, idempotence, star preservation, duality and the bimodule
identity with Hölder exponents whose product belongs to Lr with r≥1.
The p=1 map is the preadjoint of the inclusion; distinguish it from the
inclusion of preduals implemented by E. Finite-p inclusions can also be
constructed for 0<p<1 through the core; do not claim a contractive
conditional expectation in that range. Give a two-point commutative
counterexample to such contractivity.

For 1≤p<∞ identify Bochner `Lp(Ω;Lp(M))` with `Lp(L∞(Ω)⊗̄M)` for a probability space,
with V11's product state or weight. Prove the density formulas and
the finite-matrix and row/column
versions used below. Give the density of simple tensors, norm formula and
compatibility with conditional expectations and finite sign averages.

## I5. Finite-algebra reduction and Lp geometry

For σ-finite M with faithful normal state φ, put
`G=⋃_(n≥1) 2^(−n)ℤ` with the discrete topology and
`R=M⋊_(σ^φ|G)G`. This is a discrete crossed product, distinct from the
continuous core. Construct the normal faithful state φ̂=φ∘E_M.
Prove σ^φ̂ restricts to σ^φ on M, fixes each λ(g), and
`σ_g^φ̂=Ad(λ(g))` for g∈G. Let b_n=f(λ(2^(−n))) by Borel
functional calculus, with `f(exp(iθ))=θ` for 0≤θ<2π, so f(1)=0.
Put a_n=2^n b_n and φ_n(x)=φ̂(exp(−a_n)x).
Prove b_n belongs to the center of the centralizer of φ̂, derive the
modular action for φ_n and its period 2^(−n), and set R_n=R_(φ_n).

Prove each R_n is finite with faithful finite trace φ_n|R_n, that
R_n⊆R_(n+1), and that their union is ultraweakly dense in R. Construct
Φ_n:R→R_n by averaging σ^(φ_n) over a period. Prove it preserves φ̂,
commutes with σ^φ̂, and satisfies Φ_nΦ_m=Φ_min(n,m). Supply the spectral
logarithm compatibility and Gaussian/modular approximation estimates which
give nestedness and density; these conclusions do not follow just from
periodicity. The canonical expectation R→M and every Φ_n give the
Lp maps of I4.

Deduce that Lp(M), 0<p<∞, embeds isometrically in an X_p containing an
increasing dense union of finite-tracial Lp spaces. For 1≤p<∞, make both
Lp(M) and each finite-stage space 1-complemented in X_p. For 1≤p<∞ prove convergence
of Φ_n in Lp using dense bounded state-weighted elements, contractivity and
truncation, including row/column matrix amplifications. For 0<p<1 the
expectations act only on the bounded coefficients: for x∈R use
`y_n=Φ_n(x)−x`, weighted L² convergence and
`‖y_n h_φ̂^(1/p)‖_p≤‖y_n h_φ̂^(1/2)‖₂‖h_φ̂^(1/r)‖_r`
with `1/p=1/2+1/r` to prove density of the finite-stage images.
Do not extend Φ_n as contractions below p=1. Transfer the finite-tracial
p-norm geometry to the dense union and its completion using I3's metric.
For arbitrary M,
prove the directed-family version, using σ-finite corners and the
amplification/central-sum decomposition into σ-finite algebras. Supply those
projection and decomposition arguments from V5's comparison theory, and
prove the embeddings and finite-corner approximations agree on overlaps.
The index set need not be a sequence. Its finite stages can have units
p_i≠1; require `φ̂∘Φ_i=p_iφ̂p_i`, modular commutation and
`Φ_iΦ_j=Φ_i` for i≤j. Establish the p_i-corner inclusions before
claiming their Lp isometry or 1-complementation. Finite here does not mean
finite-dimensional; this theorem does not assert M is hyperfinite.
When applying normalized-trace inequalities, normalize each finite trace
and transport the Lp norms by the corresponding scalar isometry.

Prove the noncommutative Clarkson inequalities and uniform convexity and
smoothness of Lp(M) for 1<p<∞. Obtain explicit moduli with exponents
max(p,2) for convexity and min(p,2) for smoothness. Include the sharper
quadratic estimates `δ(ε)≥(p−1)ε²/8` for 1<p≤2 and
`ρ(t)≤(p−1)t²/2` for 2≤p<∞. Prove the Ball–Carlen–Lieb inequality
`(‖x+y‖_p²+‖x−y‖_p²)/2≥‖x‖_p²+(p−1)‖y‖_p²`
for 1<p≤2 and the reversed inequality for 2≤p<∞. For finite
tracial algebras build the resolvent functional calculus, second pseudo-
derivative bound, abelian conditional-expectation/Kadison–Schwarz estimate,
support cuts and diffuse perturbation used to justify differentiating the
trace power. Reduce nonselfadjoint elements by the 2×2 trick. Pass to
arbitrary Haagerup spaces through I5's finite-algebra approximation, and
derive the high-p form from the low-p dual convexity estimate. This does
not approximate a general finite algebra by matrix algebras.
Pin `δ(ε)=inf {1−‖(x+y)/2‖ : ‖x‖≤1, ‖y‖≤1, ε≤‖x−y‖}`
for 0<ε≤2, assigning value 1 to an empty constraint set, and
`ρ(t)=sup {(‖x+t y‖+‖x−t y‖)/2−1 : ‖x‖=‖y‖=1}` for t≥0,
assigning value 0 in the zero space. Connect the convexity conclusion
to `UniformConvexSpace`.

## I6. Row and column spaces and the p=1 random-sum estimate

For a finite sequence a=(a_k) in Lp(M), define
`C_p(a)=‖(∑ a_k* a_k)^(1/2)‖_p` and
`R_p(a)=‖(∑ a_k a_k*)^(1/2)‖_p`. Realize them as the first column and
row in `Lp(M⊗̄B(ℓ²))`, using the unnormalized matrix trace. For finite p
construct the completed sequence spaces with truncations, coordinate maps,
and norm formulas. At p=∞ use bounded finite partial-square sums and
their strong limits; finite sequences are not asserted norm dense there.
For p≥2 define their intersection with norm max(C_p,R_p);
for 1≤p<2 define the sum with norm
`inf_(a=b+c)(C_p(b)+R_p(c))`.
Prove these are Banach spaces, identify duals for 1≤p<∞ with the
corresponding conjugate-exponent row/column spaces and sum/intersection
interchange, and prove compatibility of interpolation and conditional
expectations. At p=2 both square functions give the same norm.

For independent symmetric signs ε_k define the random-sum norm
`K_p(a)=(E ‖∑ ε_k a_k‖_p^p)^(1/p)`.
Use the uniform measure on the finite sign cube for finite sequences.
Prove invariance under indexing and sign choices, finite-to-infinite
truncation, and Banach-valued Kahane moment comparison between any two
positive finite moments, with constants independent of the number of signs
or the Banach space. Supply Lévy's reflection bound and the symmetric-sum tail iteration
(or the equivalent Hoffmann–Jørgensen argument), then tail integration.
The coefficient contraction principle is a separate result.
This compares sources using a second
moment with the displayed p-th moment.

Prove the p=1 Khintchine estimate with universal positive constants:
`c inf_(a=b+c)(C₁(b)+R₁(c))≤K₁(a)
 ≤inf_(a=b+c)(C₁(b)+R₁(c))`.
This holds for every von Neumann algebra M and every finite family a in
L¹(M)=M_*, and the route below gives c=3^(−1/2). It is a duality argument
from an L⁴ estimate in M (Pisier, *Grothendieck's theorem, past and
present*, Lemma 9.2 and the proof of Theorem 9.1; the L⁴-to-L¹ method is
Haagerup–Musat's). It uses neither a cotype-2 theorem for M_* nor
2-summing factorization, so it does not depend on the type/cotype
consequences of I7, and it does not assume finite-dimensional
approximation of M. Its steps are:

- Sign-cube duality. Let Ω_n be the sign cube with uniform probability and
  `L∞(Ω_n;M)=ℓ∞(Ω_n)⊗M`, the dual of `ℓ¹(Ω_n;M_*)`. For x=(x_k) in Mⁿ
  put `[x]=inf{‖Φ‖_∞ : Φ∈L∞(Ω_n;M), E(ε_kΦ)=x_k for every k}`. Prove from
  this isometric duality that `K₁(a)=sup{|∑⟨x_k,a_k⟩| : [x]≤1}`.
  By the p=1 case of the row/column duality above,
  `inf(C₁(b)+R₁(c))=sup{|∑⟨x_k,a_k⟩| : ‖x‖_RC≤1}`, where
  `‖x‖_RC=max(‖∑x_k*x_k‖^(1/2),‖∑x_kx_k*‖^(1/2))` in M. So the lower
  estimate is equivalent to `[x]≤c⁻¹‖x‖_RC` for all n and x∈Mⁿ.
- Orthogonality. If `Φ=∑ε_k y_k+Φ′` with `E(ε_kΦ′)=0` for every k, then
  `∑y_k*y_k≤E(Φ*Φ)` and `∑y_ky_k*≤E(ΦΦ*)`. Hence `‖x‖_RC≤[x]`, which by
  the two dualities gives `K₁(a)≤min(C₁(a),R₁(a))`; the triangle
  inequality for K₁ then gives the upper estimate.
- Fourth moment. For self-adjoint x₁,…,x_n in a C*-algebra and
  `S=∑ε_kx_k`, prove `‖E(S⁴)‖≤3‖∑x_k²‖²`. Expanding over pairings gives
  `E(S⁴)=A+B+C−2D` with `A=(∑x_i²)²`, `B=∑_i x_i(∑_j x_j²)x_i`,
  `C=∑_(i,j) x_ix_jx_ix_j` and `D=∑x_i⁴≥0`. Bound A and B by
  `‖∑x_k²‖²` in the operator order and ‖C‖ by the same quantity by the
  operator Cauchy–Schwarz inequality
  `‖∑u_αv_α‖≤‖∑u_αu_α*‖^(1/2)‖∑v_α*v_α‖^(1/2)` with `u_(ij)=v_(ij)=x_ix_j`.
- Truncation and iteration. Reduce to self-adjoint families by
  `z_k=[[0,x_k],[x_k*,0]]` in `M₂(M)`, for which
  `∑z_k²=diag(∑x_kx_k*,∑x_k*x_k)`, and compress a solution for z to its
  off-diagonal corner. For self-adjoint x with `‖∑x_k²‖<1`, put
  `c₀=√3/2` and `Φ=h(S)`, with h(t)=t on [−c₀,c₀] and h(t)=±c₀ beyond. Then
  `‖Φ‖≤c₀` and `F=S−Φ` satisfies `F²≤S⁴/(16c₀²)=S⁴/12`, because
  `(|t|−c₀)²≤t⁴/(16c₀²)` is `(|t|−2c₀)²≥0`. So `‖E(F²)‖<1/4`, and by
  orthogonality `x̂_k=E(ε_kΦ)` satisfies `‖x−x̂‖_RC<1/2`. Iterating on the
  remainder gives `[x]≤2c₀‖x‖_RC=√3‖x‖_RC`.

Check the pairing expansion on two families with the same `∑x_k²=2`.
For scalars x₁=x₂=1, S takes the values ±2, 0, 0 and `E(S⁴)=8=4+4+4−4`.
For the anticommuting Pauli matrices x₁=σ_x, x₂=σ_z, `S²=2` for every
sign, so `E(S⁴)=4`, and the expansion gives A=B=4, C=2−2=0 (since
`(σ_xσ_z)²=−1`), D=2; a commutative formula `3(∑x_k²)²−2∑x_k⁴=8` would
be wrong here. For scalars x_k=1, `E(S⁴)=3n²−2n`, so the constant 3 is
optimal as n→∞.

Compute the row and column norms of matrix-unit sequences such as
(e_(1,k)) and (e_(k,1)). Use these examples to show why one square function
alone cannot give a dimension-independent theorem. Identify the commutative
specialization with classical scalar/Hilbert-valued Khintchine.

## I7. Tracial martingales and Burkholder–Gundy

Let M have a faithful normal normalized trace and M_n be an increasing
sequence of unital von Neumann subalgebras with ultraweakly dense union.
Construct E_n by I4's tracial specialization. Prove the tower laws,
Lp contractivity, duality, and E_n x→x in Lp for 1≤p<∞, using L² density
and interpolation/truncation. A finite Lp martingale satisfies
x_n∈Lp(M_n) and E_n(x_(n+1))=x_n and is eventually constant. Put
`dx₀=x₀`, `dx_n=x_n−x_(n−1)`, and E_(−1)=0.
Prove terminal-value representation, difference reconstruction, and
orthogonality of the differences in L².

Define H_C^p and H_R^p as completions of finite martingales in the column
and row norms of their differences. For p≥2 use their intersection with
maximum norm; for 1≤p<2 use their sum with the infimum over decompositions
into martingales. Distinguish this adapted decomposition from an arbitrary
sequence decomposition. Develop terminal/difference maps, dense finite
subspaces, dual pairings and bounded coordinate projections.

For 1<p<∞ prove Burkholder–Gundy:
`α_p^(−1)‖x‖_(H^p)≤sup_n ‖x_n‖_p≤β_p‖x‖_(H^p)`
with constants depending only on p, uniformly over finite algebras and
filtrations. Build the following proof tools and their dependencies.

- The Stein projection `Q(a)_n=E_n(a_n)` is bounded on column and row
  sequence spaces for 1<p<∞. It projects onto adapted sequences.
  The martingale-difference projection is `(E_n−E_(n−1))(a_n)`;
  prove its bounds separately by the two Stein bounds.
- Establish the randomized triangular double-sum estimate from a BG
  estimate at the same exponent, by alternating the two independent
  sign filtrations. Encode columns with matrix units, using the factor
  d^(1/p) if the auxiliary d×d matrix trace is normalized. This gives
  the Stein bound from BG at that exponent; it is not an independent
  assumption used circularly to begin the proof.
- Prove the fourth-power square-function estimates using Hölder and
  the column matrix realization. Use the identity
  `x_n*x_n=∑_(k≤n) dx_k*dx_k
   +∑_(k≤n) dx_k*x_(k−1)+∑_(k≤n) x_(k−1)*dx_k`,
  with x_(−1)=0, and estimate the two cross terms by Stein and the
  previous-exponent BG bounds. This is the exponent-doubling step.
- Start at p=2 with equality, iterate the doubling step, interpolate
  the difference maps between the resulting exponents, and use the
  sum/intersection duality and self-adjoint expectation projections
  to obtain the dual range. Prove both estimates at every 1<p<∞.

Extend the finite theorem to Lp-bounded martingales for 1<p<∞, proving
existence and uniqueness of a terminal Lp element and norm convergence.
For scalar predictable signs, prove boundedness of the martingale transform.
For operator-valued adapted coefficients retain the needed commutation
hypothesis; include the sufficient condition that each coefficient at stage
n−1 commutes with M_n. No arbitrary bounded operator-valued transform
inequality is asserted.

Apply BG to the sign-filtration martingale with differences ε_k a_k to
prove Khintchine for 1<p<∞. In the low range, extract deterministic
row/column decompositions by the first-sign coefficient projections and
prove their contraction bounds. Obtain constants depending only on p:
for p≥2, `max(C_p,R_p)≤K_p≤B_p max(C_p,R_p)`; for 1<p<2,
`A_p inf(C_p+R_p)≤K_p≤inf(C_p+R_p)`.
The p=1 case is I6. No uniform p=∞ Khintchine theorem is claimed.
Prove the McCarthy trace power superadditivity for positive elements,
`∑τ(a_k^r)≤τ((∑a_k)^r)` for r≥1, and its reverse for 0<r≤1,
with truncation and the required finiteness assumptions. Combine these
estimates with the random-sum inequalities and scalar moments to prove
type min(p,2) and cotype max(p,2) for Lp, with dimension-independent constants.

## I8. Nontracial transfer and the finite-tracial endpoint

For M with a faithful normal state φ and a modular-invariant increasing
filtration M_n with ultraweakly dense union, construct the φ-preserving expectations and their consistent
Haagerup Lp extensions using I4. Define the same martingale/difference and
Hardy-space objects using these maps. Prove tower laws and finite-p mean
convergence. Nontracial square-function products live in Haagerup L^(p/2);
use its multiplication and square-root calculus rather than pretending
all elements are bounded operators in M.

Extend the filtration to the discrete reduction algebra
`R=M⋊_(σ^φ|G)G` from I5 by `R(M_n)=M_n⋊G`. Construct the expectations
Ê_n and prove they commute with the canonical expectation R→M and
with every finite-reduction expectation Φ_m. Prove this on covariant
generators and extend by normality; the common spectral logarithms defining
Φ_m are essential to the assertion. The restrictions give filtrations on
the finite R_m. Prove that their conditional expectations preserve the
finite traces φ_m|R_m, not only the ambient dual state.

Prove row/column spaces and martingale Hardy spaces of M and of R_m embed
isometrically as 1-complemented subspaces of their counterparts for R, for
p≥1. For finite p prove Φ_m convergence in the square-function and Hardy
norms, first on finite bounded state-weighted martingales and then by
density. Apply the finite-tracial estimates and pass to the limit, giving
Stein and Burkholder–Gundy for the state-preserving nontracial filtration
with the same valid constants. Show the contractions preserve the required
martingale decompositions in the low-p sum norm.

Transfer finite-sequence Khintchine to arbitrary Haagerup Lp using I5 and
its row/column-compatible inclusions and projections; the σ-finite-support
reduction removes the faithful-state assumption for this random-sum theorem.
The nontracial martingale assertion retains its stated state and filtration
hypotheses. Deduce the UMD property of Lp(M), 1<p<∞: ordinary Banach-valued
martingale differences are unconditional under scalar signs. First prove
it at outer exponent p via the commutative tensor-product realization;
prove the classical one-exponent-to-all-exponents implication using
stopping times and good-λ estimates on ordinary probability spaces.
For arbitrary M, reduce finite simple-function martingales through a
common σ-finite corner containing their finitely many values, using I3's
support theorem. Approximation then proves the same UMD bound for M.
Relate its ordinary filtration to Mathlib's `MeasureTheory.Filtration`
and martingale API; it is distinct from a chain of von Neumann subalgebras.

For the finite normalized-trace setting of I7, develop the endpoint
H¹–BMO theory. With E_(−1)=0 define
`‖a‖_(BMO_C)=sup_n ‖E_n(|a−E_(n−1)a|²)‖_∞^(1/2)`,
initially for terminal a∈L²; use boundedness of these measurable conditional
squares to define the BMO_C space. Put BMO_R={a:a*∈BMO_C} and
BMO=BMO_C∩BMO_R with maximum norm. Prove completeness, compatibility with
terminal approximations and independence of adding stationary tail stages.
The n=0 term keeps constants visible, so no quotient by constants is taken.

Prove `(H_C¹)*≃BMO_C` and the row version with equivalent norms under
`(a,x)↦τ(a*x)`, interpreted as a continuous extension of the finite pairing;
this parameterization is conjugate-linear in a. Establish the norm estimates
`‖φ_a‖≤√2‖a‖_BMO_C` and `‖a‖_BMO_C≤√3‖φ_a‖` for the representing
element. Use increasing column square functions for the weighted
Cauchy–Schwarz estimate, and Hahn–Banach extension to the column L¹
space plus conditional-expectation differences for surjectivity. Deduce
`(H¹)*≃BMO`, the endpoint bound `‖x‖₁≤√2‖x‖_H¹`, and L¹ convergence
of H¹ martingales. Do not assert the reverse H¹ estimate for every
L¹ martingale. Compare scalar, finite-matrix and genuinely noncommuting
examples through the same definitions.

## References and design evidence

- Bergh–Löfström, *Interpolation Spaces: An Introduction*, §§3.4–3.5
  for the real K-method, §§4.1–4.3 and Theorem 4.6.1 for the complex
  methods and precise reiteration hypotheses; Theorems 5.1.2 and 5.6.3
  for vector-valued Lp and sequence interpolation.
- Fack–Kosaki, [*Generalized s-numbers of τ-measurable operators*](https://msp.org/pjm/1986/123-2/p03.xhtml),
  Proposition 2.2 and Lemma 2.5 for singular numbers; Lemma 3.4 and
  Theorems 3.5–3.6 for Fatou and dominated convergence; Theorem 4.9
  for Hölder and the p-triangle inequality.
- Cwikel, [*Lecture notes on duality and interpolation spaces*](https://arxiv.org/abs/0803.3558),
  §1 for compatible couples and their sum/intersection norms, and §2
  for Calderón's strip model, regularization and method distinctions.
- Pisier–Xu, *Non-Commutative Lp-Spaces*, Handbook of the Geometry of Banach
  Spaces 2, §§1–3 (singular numbers, interpolation and Haagerup spaces),
  §5 (Clarkson and geometry), §§6–7 (Khintchine and martingales).
- Haagerup–Junge–Xu, [*A reduction method for noncommutative Lp-spaces and
  applications*](https://arxiv.org/abs/0806.3635), Theorem 2.1 and
  Remark 2.8, Theorem 3.1 and Remarks 3.2–3.4, and §6, especially
  Theorem 6.8 and Lemmas 6.10–6.12. I5 constructs the reduction;
  I8 supplies the final approximation arguments for martingales.
- Pisier–Xu, [*Non-commutative martingale inequalities*](https://arxiv.org/abs/math/9704209),
  Theorems 2.1 and 2.3, Lemmas 2.5–2.7, Theorem 2.8, and Appendix A.
  The finite-tracial proof supplies I7 independently of a general UMD claim.
- Lust-Piquard–Pisier, *Non commutative Khintchine and Paley inequalities*,
  Arkiv för Matematik 29 (1991), 241–260, Appendix IV, for the first proof
  of the p=1 theorem for arbitrary preduals. That proof passes through the
  cotype-2 property of M_* and is not the route of I6. Its circle/Schatten
  Paley proof is a separate route; I6 does not require a general
  subdiagonal Hardy factorization theorem.
- Pisier, [*Grothendieck's theorem, past and present*](https://arxiv.org/abs/1101.4195)
  (arXiv version 3), §9: Lemma 9.2 for the fourth-moment estimate,
  Theorem 9.1 and its proof for the sign-cube duality, orthogonality and
  truncation route of I6, and Definition 9.6 for cotype 2. The L⁴-to-L¹
  method is due to Haagerup–Musat, *The Effros–Ruan conjecture for
  bilinear forms on C*-algebras*, Invent. Math. 174 (2008), 139–163, and
  the constant √3 to Haagerup–Musat, *On the best constants in
  noncommutative Khintchine-type inequalities*, J. Funct. Anal. 250
  (2007), 588–624.
- Ky Fan, *Maximum properties and inequalities for the eigenvalues of
  completely continuous operators*, Proc. Natl. Acad. Sci. USA 37 (1951),
  760–766, for the matrix partial-sum singular-value inequality checked in
  I1; Moslehian, [*Ky Fan inequalities*](https://arxiv.org/abs/1108.1467),
  §3, states it with this attribution.
- Takesaki, *Theory of Operator Algebras II*, Chapters VII–IX, for the
  weight, standard-form and modular-expectation inputs owned by V11 and I4.
  In particular VIII.3.14 gives trace densities for normal semifinite
  weights, IX.4.2 gives the expectation criterion, and X.2.3 gives the
  dual-action fixed points and faithful invariant-weight characterization.
- Haagerup, *On the dual weights for crossed products of von Neumann
  algebras II*, and *Lp spaces associated with an arbitrary von Neumann
  algebra*, for the invariant-weight characterization and Haagerup density
  construction in I3; the latter paper's Theorems 1.2–1.3 and
  Definition 1.4/Proposition 1.5 supply the density and isometric L¹ map.
- Ball–Carlen–Lieb, *Sharp uniform convexity and smoothness inequalities
  for trace norms*, Invent. Math. 115 (1994), 463–482, for the sharp
  Schatten inequalities; Ricard–Xu,
  [*A noncommutative martingale convexity inequality*](https://arxiv.org/abs/1405.0431),
  Theorem 2 and its finite-tracial proof, for the general-von-Neumann
  inequality used in I5.

The LPP appendix calls the x*x sequence convention a row convention;
our column/row names follow the displayed matrix realization in I6.
Transport its estimates by the formulas, rather than by the names alone.

Reuse Mathlib's `Complex.HadamardThreeLines`, scalar Lp and conditional
expectations, finite-dimensional singular values (`LinearMap.singularValues`)
and the matrix C*-norm.
The [interpolation discussion](https://leanprover.zulipchat.com/#narrow/stream/113489-new%20members/topic/Ryan%20Martinez/with/575216722)
points toward abstract compatible couples and identifies the scalar analysis
work. Neither the pinned Mathlib nor the pinned Tau Ceti contains the
Riesz–Thorin theorem; consume it from PDE, which owns it. Follow
Mathlib's trace, modulus and extended p-gauge conventions through the
OperatorIdeals comparison, together with its Hilbert–Schmidt conventions.
Develop missing required APIs in Tau Ceti with these shapes; replace local
adapters by imports when the corresponding upstream implementations are
available. No upstream merge is a prerequisite for this development.
