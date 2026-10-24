# Kontsevich formality and deformation quantization

Build a reusable theory of formal associative deformations, differential cochains,
filtered `L∞` morphisms, configuration-space graph integrals, and formal geometric
resolutions. Its principal application is Kontsevich's formality theorem and the
existence and classification of differential star products on smooth Poisson manifolds.
The analytic construction uses real coefficients; the algebraic foundations have
their own, weaker hypotheses.

The definitive specification is this README. `Suggested.lean` checks representative
interfaces for formal products, equivalences and graphs; it does not encode the
formality theorem or replace the geometric and analytic targets below.

## Generality, conventions and ownership

Formal associative deformation algebra starts over a commutative ring `k`, with a
unital associative `k`-algebra `A`; commutativity of `A` is required for its first
commutator to define a Poisson bracket. Differential operators start with a
commutative `k`-algebra and modules. Symmetric-coalgebra `L∞` theory and exponential
gauge use a characteristic-zero field. The geometric application uses finite-dimensional,
Hausdorff, second-countable smooth real manifolds without boundary, of fixed dimension
`d ≥ 0`. Compactness and orientability of the Poisson manifold are not required.
Configuration spaces in the proof have corners and carry specified orientations.

Write `A[[ℏ]]` for formal series, using the additive and module structure of Mathlib's
`PowerSeries A`. A deformed multiplication is new data on this carrier. All infinite
sums are justified coefficientwise or by an explicitly complete filtration; no
convergence at a nonzero numerical value of `ℏ` is asserted.

For `A=C∞(M,ℝ)`, a differential star product has the form

`f ⋆ g = fg + Σ_{r≥1} ℏ^r B_r(f,g)`,

where every `B_r` is a bidifferential operator, locally of finite order in each
argument, and `B_r(1,f)=B_r(f,1)=0`. The first-order convention is

`B_1(f,g) − B_1(g,f) = {f,g}_π = π(df,dg)`.

A formal equivalence from `⋆` to `⋆′` is `T=id+Σ_{r≥1}ℏ^r T_r`, with each `T_r`
a differential operator, `T(1)=1`, and `T(f⋆g)=T(f)⋆′T(g)`. Its inverse is constructed
recursively. There is no factor of `i` in this real convention.

Use cohomological degrees. A `(p+1)`-vector has degree `p` in `T_poly`, and a
`(p+1)`-linear differential cochain has degree `p` in `D_poly`; both start at
degree `−1`, containing functions. The differentials are `0` and `∂=[μ,−]`, where
`μ(f,g)=fg`. The Schouten convention is `[X,f]=X(f)` and the Gerstenhaber insertion
sign for inserting a `q`-linear cochain in slot `i`, numbered from zero, is
`(−1)^{i(q−1)}`. Follow [LieGroupoidsPoisson G4][poisson] for the Schouten bracket
and prove the coordinate and suspension comparisons, including degree `−1`.

The normalized Hochschild–Kostant–Rosenberg map is

`HKR(X_1∧⋯∧X_q)(f_1,…,f_q) = (1/q!) Σ_σ sgn(σ) ∏_j X_{σ(j)}(f_j)`.

For `q=0` it is the identity on functions. Thus `HKR(π)(f,g)=π(df,dg)/2` for a
bivector. Formal Poisson tensors are `α=Σ_{r≥1}ℏ^r π_r` with `[α,α]=0`.
The quantization of an ordinary Poisson tensor uses `α=ℏπ`, with no extra factor two.

| Supplier | Theory consumed; work owned here |
| --- | --- |
| [DGAInfinity Layers 0, 4 and 8](../DGAInfinity/README.md) | Signed graded operations, tensor-coalgebra and filtered deformation foundations, Hochschild braces/bracket, normalized cochains and Hochschild Maurer–Cartan theory. Here construct the symmetric-coalgebra `L∞` theory, its comparison with that theory, and the differential subcomplex. |
| [LieGroupoidsPoisson G1.3a and G4.1–2][poisson] | Multivector bundles, Schouten calculus, Poisson bivectors and restriction. Here form their graded deformation complexes and formal completions. |
| [DifferentialGeometry Layers 0–2 and 5.5](../DifferentialGeometry/README.md) | Forms, orientations, exterior derivative, integration and Stokes using the abstract boundary of a manifold with corners. Here construct the configuration spaces, their faces, angle forms and integrals. |
| [SmoothBundlesConnections B2–B4][connections] | Tensor/exterior and associated bundles, linear connections and curvature. Here construct symmetric-power bundles from the associated-bundle functor, their completions, Fedosov differentials and resolution comparisons. |

These are dependencies on specified Tau Ceti developments, not assertions that their
targets are implemented. Build missing supplier material in its stated API and location;
do not wait for a supplier PR to merge or push the work to Mathlib. In particular,
generic Hochschild theory and Poisson geometry keep a single owner.

The scope is formal differential quantization and the structures above. Strict
operator-algebraic quantization, geometric quantization, holomorphic/algebraic global
quantization, associators and rational formality, cyclic formality, and the Duflo
theorem are outside this roadmap. The real graph weights alone do not give a
formality morphism over every characteristic-zero field.

## Library integration

Use Mathlib's `PowerSeries`, `LinearMap`, `MultilinearMap`, `Derivation`,
`ExteriorAlgebra`, `SymmetricAlgebra`, graded objects and cochain complexes.
Use `ContMDiffMap`, `TangentSpace`, `mfderiv` and the supplier smooth bundles for
the geometric specialization. Native module paths grounding these constructions include
`Mathlib.RingTheory.PowerSeries.Basic`, `Mathlib.RingTheory.PowerSeries.Trunc`,
`Mathlib.RingTheory.Derivation.Basic`, `Mathlib.LinearAlgebra.Multilinear.Basic`,
`Mathlib.LinearAlgebra.SymmetricAlgebra.Basic`, and
`Mathlib.Geometry.Manifold.ContMDiffMap`.

The ordinary symmetric algebra is not the graded symmetric coalgebra: Layer 3 must
construct its Koszul signs, shuffle coproduct and cofree property. Neither an arbitrary
multilinear map nor an arbitrary algebraic Hochschild cochain is automatically a
polydifferential operator. Layer 1 supplies that predicate, its order bounds and the
inclusion into the shared Hochschild complex.

Follow the Mathlib design process described in the repository README. Relevant
coordination points include the [Hochschild (co)homology Zulip discussion][zulip-hh]
and searches for [Hochschild][mathlib-hh], [Poisson][mathlib-poisson], and
[`L∞` structures][mathlib-linfinity] among Mathlib PRs. Adopt applicable existing
APIs and proposals; implement needed missing pieces in Tau Ceti with compatible
interfaces. These links are discovery points, not mathematical dependencies or
evidence that the requested structures already exist.

## Layer 0: formal products, truncation and equivalence

For a unital associative `k`-algebra, construct coefficient families
`B_r : A →ₗ[k] A →ₗ[k] A`, with `B_0=μ`, and their multiplication on formal series:

`(a⋆b)_N = Σ_{r+i+j=N} B_r(a_i,b_j)`.

Prove bilinearity over `k[[ℏ]]`, coefficient extensionality, reduction modulo `ℏ`,
and equivalence of associativity with, for all `N,a,b,c`,

`Σ_{r+s=N} B_r(B_s(a,b),c) = Σ_{r+s=N} B_r(a,B_s(b,c))`.

Include units, the undeformed product, opposite products, algebra-isomorphism
transport, and scalar extension of the coefficient operators along `k→k′`.
Construct the comparison with completed scalar extension, with explicit
hypotheses wherever an ordinary tensor product is exchanged with an infinite
product. Construct compatible products modulo `ℏ^{N+1}` and prove
their inverse-limit correspondence with formal products, using finite coefficient
tuples and the existing power-series/truncation API. Prove completeness and separation.

Construct coefficientwise composition, inversion and transport by `T=id mod ℏ`;
prove the groupoid laws for formal equivalences and their actions on products.
For commutative `A`, prove that `B_1(a,b)−B_1(b,a)` is a bilinear alternating
biderivation satisfying Jacobi, and that equivalence preserves it. This uses
associativity through order two and needs no division by two.

Consume DGAInfinity Layer 8 to identify the associativity equations with its brace
equation. In characteristic zero identify them with the Hochschild Maurer–Cartan
equation. Relate infinitesimal classes and lifting obstructions to the actual
normalized `HH²` and `HH³` groups of that complex. The new content is the
power-series, truncation, unit and equivalence comparison, not another Hochschild theory.

## Layer 1: differential operators and differential Hochschild cochains

For a commutative `k`-algebra `A` and `A`-modules `P,Q`, define differential
operators `P→Q` as `k`-linear maps with finite order under iterated commutators
`[D,a](p)=D(ap)−aD(p)`. Order zero means `A`-linear. Develop increasing order
filtrations, sums, composition and its order bound, restriction/localization,
and the principal-symbol map defined by iterated commutators. Prove symbol
symmetry, `A`-multilinearity and that its kernel is the preceding order filtration.

Construct the multilinear version with an order bound in each argument. Define
insertion, permutations, products, and the resulting multiorder bounds. Specialize
to the sheaf of smooth functions using locally finite order, and prove equivalence
on a coordinate neighborhood with finite sums of products of partial derivatives
with smooth coefficients. Construct restriction and gluing; do not impose a
uniform bound on all of a noncompact manifold.

Show that the shared Hochschild differential, insertions and Gerstenhaber bracket
preserve polydifferential cochains. Build `D_poly` and its normalized subcomplex,
where a positive-arity cochain vanishes when any argument is `1`; retain functions
in arity zero. Prove normalization is a quasi-isomorphism inside differential
cochains, using degeneracies that preserve differential order. Prove that formal
differential equivalences and their recursive inverses stay differential.

## Layer 2: differential HKR and the Poisson deformation complex

Assemble the supplier multivectors into `T_poly(M)` and its Schouten dg Lie algebra.
Construct the displayed HKR map into the Layer 1 differential Hochschild complex;
prove its naturality under restriction and diffeomorphisms and its compatibility
with normalization and the differential. Prove it is a quasi-isomorphism in every
degree, including functions. The proof must supply the local differential-symbol
or Koszul computation and its homotopy, then the sheaf/global-sections comparison
using smooth partitions of unity. An algebraic HKR statement for smooth affine
algebras does not by itself establish this smooth differential version.

Identify the cohomological bracket with Schouten. Exhibit the cochain-level
failure of strict bracket preservation and its exact defect; the binary component
constructed in Layer 6 will provide the corresponding homotopy. This distinction
is the reason the target is an `L∞` morphism, not a strict dg Lie morphism.

Construct formal multivectors, `α=Σ_{r≥1}ℏ^rπ_r`, their Maurer–Cartan equation
`[α,α]=0`, and the formal-vector-field action `exp(ad ξ)` for
`ξ∈ℏ T_poly^0(M)[[ℏ]]`. Prove every coefficient is a finite expression, the
action preserves the equation, and `ℏπ` is Maurer–Cartan exactly when `π` is
Poisson. Formal vector fields need no complete flow at a nonzero real time.

Sources: [K] §§3, 4.6.1; [D] §2.

## Layer 3: filtered `L∞` algebra and Maurer–Cartan comparison

Over a characteristic-zero field, construct the reduced conilpotent graded
symmetric coalgebra `Sᶜ(V[1])`, whose underlying object is a direct sum, with
Koszul shuffle coproduct. The shift lowers element degrees by one. Prove its
cofree property, the correspondence between coderivations and their Taylor
components, and composition of coalgebra maps. Degree-one square-zero
coderivations define uncurved `L∞` algebras; commuting coalgebra maps define
`L∞` morphisms. Unsuspended brackets have degrees `2−n` and morphism components
degrees `1−n`. With `s:V→V[1]`, fix the conversion on homogeneous inputs by
`q_n(sx₁⋯sx_n)=(−1)^{1+Σ_i(n−i)(|x_i|−1)}s ℓ_n(x₁,…,x_n)` and
`F_n(sx₁⋯sx_n)=(−1)^{Σ_i(n−i)(|x_i|−1)}s U_n(x₁,…,x_n)`, where `i=1,…,n`.
Thus `q₁(sx)=−s dx` and `q₂(sx sy)=(−1)^{|x|}s[x,y]` in the dg Lie case.
Prove the suspension equivalence and the arity-one, two and three identities
explicitly, agreeing with the bracket conventions above and translating the
graph conventions of [K] to this suspension.

Develop complete separated descending filtrations `L=F¹L` with
`ℓ_n(F^{i₁},…,F^{i_n})⊆F^{i₁+⋯+i_n}` and continuous filtered morphisms. Construct
nilpotent quotients and inverse limits, and prove convergence of

`Σ_{n≥1} (1/n!) ℓ_n(α,…,α)=0`,
`U_*(α)=Σ_{n≥1} (1/n!) U_n(α,…,α)`.

Construct twisting of algebras and morphisms, its differential and composition
identities, and `L∞` homotopy using the completed polynomial de Rham interval
`k[t,dt]`. Also treat twisting by a nilpotent coefficient ideal, needed for the
positive exterior-degree ideal in Layer 7. This is distinct from assuming
positive `ℏ`-order.

Prove that a filtered `L∞` morphism whose linear term restricts to a
quasi-isomorphism on every `F^p` induces a bijection on Maurer–Cartan homotopy
classes. Also prove the sufficient associated-graded criterion by lifting
through finite quotients and the complete inverse limit. Supply the obstruction
lifting, homotopy lifting and compatible-limit
arguments; include degrees `−1` and higher. For dg Lie algebras prove agreement
of this equivalence relation with exponential degree-zero gauge. Compare with
the Hochschild gauge theory of DGAInfinity Layer 8 and with the formal equivalences
in Layer 0. Do not infer an equivalence of ordinary action groupoids solely from
the bijection of classes in the presence of degree `−1`.

Sources: [K] §§3–4; [DR], main theorem, for filtered Maurer–Cartan invariance.

## Layer 4: graphs and compactified configuration spaces

Define finite admissible directed graphs with labelled internal vertices `1,…,n`,
ordered external vertices `1,…,m`, and ordered outgoing edges at each internal
vertex. Edges start only at internal vertices; exclude loops and repeated edges.
Develop relabelling, sign under reordering outgoing edges, subgraphs, admissible
contraction, insertion and finite enumeration with fixed valences. Graphs with
`2n+m−2` edges index Taylor components; graphs with `2n+m−3` edges index their
Stokes relations. Keep the stability condition `2n+m≥2` explicit.

Construct `C⁺_{n,m}` from configurations of distinct points `z_i` in the upper
half-plane and ordered distinct real points `q₁<⋯<q_m`, modulo simultaneous
`z↦az+b`, `a>0`, `b∈ℝ`. Its dimension is `2n+m−2`. Also construct `C_n` from
configurations in the complex plane modulo translations and positive dilations;
it has dimension `2n−3` for `n≥2`.

Construct their real compactifications as manifolds with corners using nested
collision clusters and relative positions/scales, including escape to infinity
in normalized coordinates. Prove compactness, the dense-interior identification,
compatible cluster-tree charts and smooth transition maps. Extend forgetting
maps and record orientations: external coordinates first, then the complex
coordinates in vertex order, with the quotient-group orientation used in [K] §6.2.
Boundary orientations are outward-normal first.

Classify all codimension-one faces, with stability conditions for every factor:
an interior collision of `s≥2` points gives
`C_s × C⁺_{n−s+1,m}`; a cluster of `s` internal and `t` consecutive external
points meeting the real axis gives `C⁺_{s,t} × C⁺_{n−s,m−t+1}`. These formulas
denote the compactified factors on closed faces. Construct the actual face maps,
their orientation signs, intersections and forgetting-map compatibilities.
Use abstract boundary faces with multiplicity when applying Stokes.

For the harmonic angle
`φ(z,w)=arg((w−z)/(w−conj(z)))` valued in `ℝ/(2πℤ)`, construct the global
one-form `dφ`, rather than choosing a discontinuous real argument. Prove its
smooth extension to the two-point compactification and pull it back along each
edge. Include the external-target limit. Prove wedge products are integrable
and their face restrictions factor as required for Stokes.

Source: [K] §§5, 6.1–2. The compactification and its face calculus are construction
targets here, not implicit consequences of the supplier Stokes theorem.

## Layer 5: graph operators and weights

First construct graph evaluation over a commutative `k`-algebra equipped with
`d` pairwise commuting `k`-derivations, on alternating coefficient arrays indexed
by `Fin d`. This operation uses no integrals or division. Prove its functoriality
under algebra maps intertwining the derivations. Instantiate it with polynomial
partial derivatives over every commutative base ring, and with smooth partial
derivatives on real coordinate neighborhoods, comparing the coefficient arrays
with the native polyvector carriers.

For `Γ` and polyvectors `γ_i` of rank equal to the outgoing valence of vertex `i`,
construct `U_Γ(γ₁,…,γ_n)` as follows. Assign a coordinate index to each edge.
At an internal vertex evaluate the alternating tensor `γ_i` on the outgoing
covectors in their specified order; at external vertex `j` place `f_j`.
Differentiate each vertex's coefficient by the indices of its incoming edges,
multiply the results and sum over edge indices. Use the unnormalized embedding
`X₁∧⋯∧X_q ↦ Σ_σ sgn(σ) X_{σ(1)}⊗⋯⊗X_{σ(q)}` at this step.

Prove multilinearity, differential order bounds, restriction, affine coordinate
equivariance, and the graph insertion/contraction identities with all signs.
Define the real weight, when `E=2n+m−2`, by

`W_Γ = (∏_{i=1}^n 1/(outdeg(i)!)) (2π)^(−E) ∫_{C̄⁺_{n,m}} ∧_{e∈E_Γ} dφ_e`.

The wedge order is by source vertex and then outgoing slot. Prove invariance of
`W_Γ U_Γ` under outgoing-edge reorderings and its internal-vertex Koszul rule.
Compute the one-vertex weights and operators, including the arity-zero case, to
recover exactly HKR. Keep vertex factorials in `W_Γ` separate from the `1/n!`
in Maurer–Cartan pushforward.

Prove the boundary-weight identities by Stokes. Interior two-point collisions
produce the Schouten terms; the admissible real-boundary clusters produce the
Hochschild/inserted-operator terms. Prove the interior-cluster vanishing lemma
for more than two colliding points with `2s−3` angle forms, as well as the
dimension and repeated-form vanishings that discard all other terms. Supply
the analytic vanishing argument of [K] §6.6, including its auxiliary integration
lemmas. Neither numerical quadrature nor checks at finitely many graph orders
replace these identities.

Sources: [K] §§6.2–6.6.

## Layer 6: local formality and the star product

On `ℝ^d` and every open subset, define
`U_n=Σ_m Σ_{Γ∈G_{n,m}} W_Γ U_Γ`. For fixed homogeneous input ranks, the edge
count determines `m`; prove the remaining sum is finite. Prove graded skew
symmetry, degree `1−n`, all `L∞` identities from Layer 5, and `U_1=HKR`.
Layer 2 then proves quasi-isomorphism. Prove preservation of normalized cochains,
including the vanishing needed for the unit of the resulting star product.

Extend the construction to formal coordinate series coefficientwise. Prove the
properties needed by globalization: `GL_d(ℝ)` equivariance; vanishing of `U_n`
on vector-field inputs for `n≥2`; and vanishing for `n≥2` when one input is a
linear vector field. These require the additional weight vanishings of [K]
§7.3, not just affine equivariance of individual graph operators.

For a formal Poisson tensor `α`, define

`μ_α = μ + Σ_{n≥1} (1/n!) U_n(α,…,α)`.

Prove it is a unital differential star product, its first commutator is `π₁`,
and gauge-equivalent tensors give differentially equivalent products. Prove
`ℏ`-adic well-definedness, finite differential order locally at every coefficient,
restriction compatibility and compatibility with affine changes of coordinates.
An arbitrary nonlinear coordinate change is handled by Layer 7.

Sources: [K] §§2, 6.4–6.5, 7.3; [D] §2, Theorem 1.

## Layer 7: formal bundles and Fedosov resolutions

Construct the bundle of completed symmetric covariant tensors
`Ŝ(T*M)=∏_{r≥0} Sym^r(T*M)`, its formal fiberwise polyvectors and polydifferential
operators, and differential forms with values in these bundles. Establish
transition maps, products, brackets, filtrations, complete sections and
coefficientwise evaluation. Keep formal fiber degree, exterior-form degree and
`ℏ`-degree separate.

Choose a torsion-free smooth connection on `TM`; construct one using local
connections and smooth partitions of unity and prove the torsion symmetrization
formula. Extend it to the formal bundles. Define
`δ=dx^i ∂/∂y^i` and its contraction `δ⁻¹`, which on positive total fiber-plus-form
degree is contraction with `y^i ∂/∂x^i` divided by that degree. Prove
`δδ⁻¹+δ⁻¹δ=id−σ`, with `σ` the fiber-and-form-degree-zero projection.

Represent the connection curvature by the fiberwise vector-field-valued two-form
`R` satisfying `∇²=[R,−]`. Construct the unique correction `A` of fiber degree at
least two, with `δ⁻¹A=0`, by

`A=δ⁻¹(R+∇A+(1/2)[A,A])`.

Prove convergence by fiber degree and `D=−δ+∇+[A,−]` satisfies `D²=0`. Construct
flat lifts recursively, prove acyclicity in positive exterior degrees, and
identify degree-zero flat sections with smooth functions, polyvectors and
polydifferential operators, respectively. For operators, construct their action
on flat lifts and prove compatibility with composition and Hochschild differential;
projection of raw coefficients alone is not that comparison.

Extend the local formality maps fiberwise and twist by the local one-form
`B=−dx^i∂/∂y^i−dx^i Γ^k_{ij}y^j∂/∂y^k+A`.
The twisting sum is finite in exterior degree; `B` is not assumed to have
positive `ℏ`-order. Prove that coordinate changes add the linear-vector-field
term killed by Layer 6, so the twisted maps glue. Construct the contraction of
this map to the degree-zero resolution and obtain a global `L∞` quasi-isomorphism
`U^∇:T_poly(M)→D_poly(M)` with linear term HKR. A zigzag with no constructed
Maurer–Cartan comparison is not the final interface.

Construct convolution dg Lie algebras representing `L∞` morphisms with dg Lie
target and compare
their gauge homotopies with the interval homotopies of Layer 3. Prove the
compatibility of homotopy with composition and twisting by gauge-equivalent
Maurer–Cartan elements. Apply this to the Fedosov resolutions for two torsion-free
connections, constructing the gauge comparison, the projection `L∞` morphisms
and the induced homotopy as in [KS] §§3–4. Prove the induced map on
Maurer–Cartan classes is independent of the connection. Also prove naturality
under diffeomorphisms carrying the chosen connection to the other one. Fix the
harmonic local formality construction throughout this independence statement.

Source: [D] §§3–4, in particular the Fedosov recursion, resolution isomorphisms,
twisting and contraction; [K] §7 for the local vanishing and globalization conditions;
[KS] Proposition 3.10 and Theorem 4.12 for connection independence.

## Layer 8: quantization, classification and acceptance examples

Apply the global morphism to `α=ℏπ`: every smooth real Poisson manifold admits
a unital differential star product with first commutator `π`. For arbitrary
formal `α`, construct the bijection

`{α∈ℏ T_poly¹(M)[[ℏ]] : [α,α]=0}/exp(ℏ T_poly⁰(M)[[ℏ]])`
`≃ {unital differential star products}/differential equivalence`.

Prove injectivity and surjectivity using Layer 3 on the positive `ℏ` filtration,
and verify the associated graded quasi-isomorphism hypotheses. This classifies
formal Poisson tensors, including all their higher coefficients, rather than
asserting uniqueness of quantization from the first coefficient alone.

Develop the following explicit examples as consumers of the library:

- Zero tensor: the constructed product is the ordinary product. Include
  dimension zero and restriction to disconnected components.
- Constant tensor `π=(1/2)Σ_{i,j}π^{ij}∂_i∧∂_j`: show the graph product is
  `μ exp((ℏ/2)Σ_{i,j}π^{ij}∂_i⊗∂_j)`. Thus
  `x_i⋆x_j−x_j⋆x_i=ℏπ^{ij}`. Prove the full formal equality, not just the
  first-order check; on polynomials prove coefficientwise local finiteness.
- On `ℝ²` with `π=x ∂_x∧∂_y`, prove Poisson directly, calculate the product
  through order two from the graphs, and verify the unit, commutator and
  associativity modulo `ℏ³`. This exercises derivatives of the Poisson tensor.
- On a manifold covered by coordinate charts, compare the globally constructed
  product on each chart with the local graph product by actual formal
  differential equivalences. Construct the homotopies relating overlap
  comparisons; do not claim the raw coordinate formulas agree on overlaps.

## Dependency order

Layer 0 and the algebraic part of Layer 1 start from native linear algebra and
power series. Layer 2 uses Layer 1 and the Poisson supplier. Layer 3 uses the
shared signed/Hochschild infrastructure and supplies the abstract deformation
comparison. Layer 4 uses smooth forms and corner Stokes; Layer 5 joins its
geometry to Layer 1's operators. Layer 6 uses Layers 2–5. Layer 7 uses the bundle
supplier, Layers 2–3 and the local vanishing properties of Layer 6. Layer 8 uses
Layers 0, 3, 6 and 7. Every construction includes extensionality, transport,
restriction or functoriality at its applicable generality and examples of its use.

## References

- **[K]** M. Kontsevich, [*Deformation quantization of Poisson manifolds, I*](https://arxiv.org/abs/q-alg/9709040),
  arXiv version 1: §§1–2 for star products, §§3–4 for deformation and `L∞` theory,
  §4.6.1 for differential HKR, §§5–6 for configuration spaces and local formality,
  §6.5 for normalization and §7 for globalization. Section numbers here refer
  to that version, not an assumed identical pagination in the journal article.
- **[D]** V. Dolgushev, [*Covariant and Equivariant Formality Theorems*](https://arxiv.org/abs/math/0307212),
  version 2, §§2–4: local formality properties, Fedosov resolutions, and the
  global formality construction. No arbitrary-group equivariant theorem is an
  assumption of this roadmap.
- **[DR]** V. Dolgushev and C. L. Rogers, [*A Version of the Goldman–Millson Theorem for Filtered L-infinity Algebras*](https://arxiv.org/abs/1407.6735):
  filtered Maurer–Cartan homotopy invariance; its consequence on connected
  components supplies the class bijection required here.
- **[KS]** A. Kraft and J. Schnitzer, [*The Homotopy Class of twisted L-infinity-morphisms*](https://arxiv.org/abs/2102.10645),
  version 1, Proposition 3.10 and Theorem 4.12: homotopy under twisting and
  independence of the connection in Dolgushev's globalization.

[poisson]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/f1e1e4c2969cf6e384596be670a7990e05fcc575/TauCetiRoadmap/LieGroupoidsPoisson/README.md#g4-poisson-structures-cotangent-algebroids-and-leaves
[connections]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/e3abb0d30aff607a392b1d2d8a3f7c9daccbbb33/TauCetiRoadmap/SmoothBundlesConnections/README.md
[zulip-hh]: https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Hochschild.20(co)homology.html
[mathlib-hh]: https://github.com/leanprover-community/mathlib4/pulls?q=is%3Apr+Hochschild
[mathlib-poisson]: https://github.com/leanprover-community/mathlib4/pulls?q=is%3Apr+Poisson
[mathlib-linfinity]: https://github.com/leanprover-community/mathlib4/pulls?q=is%3Apr+%22L-infinity%22
