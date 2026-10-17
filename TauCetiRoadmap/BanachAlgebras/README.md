# Banach algebras

Build the spectral, module and cohomological theory of complex Banach algebras.
The depth milestones are holomorphic functional calculus, Cohen–Hewitt
factorization, automatic continuity for semisimple algebras, the equivalent
diagonal characterizations of amenability, and Johnson's theorem relating
amenability of a locally compact group to amenability of its group algebra.

## Scope, conventions and prerequisites

Algebras are associative over `ℂ`, with submultiplicative norm and complete
underlying normed space. A unit is assumed only where stated. Use Mathlib's
`NonUnitalNormedRing`, scalar compatibility instances, `NormedRing`,
`NormedAlgebra`, and `CompleteSpace`, rather than a separate Banach-algebra
structure. Homomorphisms are complex linear and multiplicative; continuity and
preservation of the unit are separate requirements. In automatic-continuity
statements the input homomorphism or derivation has no continuity assumption.
Use `A →ₙₐ[ℂ] B` for nonunital algebra homomorphisms. Do not impose
`NormOneClass` on general unital Banach algebras; retain factors of `‖1‖`
in norm estimates unless that additional hypothesis is stated.

For a general nonunital algebra use `WithLp 1 (Unitization ℂ A)`, whose norm is
`‖(λ,a)‖ = |λ| + ‖a‖`. Specify when a construction takes place in this unitization
and when its output lies in `A`. Use `spectrum`, `quasispectrum` and
`spectralRadius`, with explicit bridges to unitization. In particular the
unitized spectrum of a nonunital element includes zero. A Banach bimodule has
bounded bilinear left and right actions satisfying associativity and
`(a·x)·b = a·(x·b)`; its actions need not be contractive or unital.
Represent these actions by bounded bilinear maps, curried as
`L R : A →L[ℂ] E →L[ℂ] E`, with `a·x=L a x` and `x·a=R a x`.
The laws are `L (ab) x=L a (L b x)`,
`R (ab) x=R b (R a x)`, and `L a (R b x)=R b (L a x)`.
Use this same interface for factorization, dual actions and cohomology;
prove its equivalence with compatible unital actions of the unitization.
A bimodule derivation is a complex-linear map with
`D(ab)=L a (D b)+R b (D a)`; bounded derivations additionally carry
continuity. For A in universe u define amenability using test bimodules
in universe u, then prove through the diagonal characterizations that
the same property tests bimodules in every larger universe.

[Banach space theory](../BanachSpaceTheory/README.md), B1–B2 and B4–B5, supplies
dual quotients, weak compactness, completed projective tensors and scalar measure
representation. The [completed contour integration roadmap](../../Completed/ContourIntegration/README.md)
supplies scalar contour integration, winding numbers and homological Cauchy
theory; A2 extends its homology Cauchy theorem to Banach-valued functions.
Its cycle integral is already Banach-valued. Mathlib supplies Bochner integration,
Haar measure, continuous linear maps, algebraic simple modules and Jacobson
density. The [AmenableGroups roadmap, Layers 1 and 7](https://github.com/TauCetiProject/TauCetiRoadmap/pull/821)
supplies invariant means and the Haar-measure convolution foundations used in A7.
These layers own the invariant-mean and scalar-convolution prerequisites;
the complex group-algebra and cohomological constructions belong to A7.

This roadmap owns Banach-algebra holomorphic calculus, radicals, modules,
bounded Hochschild cohomology and Johnson amenability. It does not own
C*-representations, continuous functional calculus, C*-tensor norms, or
nuclearity. Hilbert-space Borel spectral theory belongs to
[OperatorTheory](../OperatorTheory/README.md), and general semigroup generators
belong to [OneParameterSemigroups](../OneParameterSemigroups/README.md).
Set-theoretic constructions of discontinuous homomorphisms and classification
of radical valuation algebras are outside this scope.

## A1. Constructions, ideals and the radical

Develop continuous algebra maps and equivalences, closed subalgebras, opposite
algebras, finite products, completions, unitization, and quotients by closed
two-sided ideals. Give their universal properties, induced maps, norm estimates,
kernel/range identities and compatibility with composition. A quotient carries
its quotient norm; prove completeness and the continuous first-isomorphism
theorem, distinguishing a bounded inverse from an isometry. Closed ideals are
nonunital Banach algebras even when the ambient algebra is unital. Relate
`TwoSidedIdeal`, its underlying scalar submodule, and its quotient construction.

Extend Mathlib's inverse and spectrum APIs with the resolvent identity, its
local norm estimates and complex analyticity, and functoriality under unital
continuous homomorphisms. Reuse nonemptiness and compactness of the spectrum
for a nonzero unital complex Banach algebra, the spectral-radius formula and
Gelfand–Mazur. Reuse polynomial spectral mapping and the existing comparison between
the spectrum in a subalgebra and the spectrum in the ambient algebra. A closed
subalgebra need not be inverse closed.

For a unital algebra use `Ring.jacobson A`. For a nonunital algebra define
`rad A={a : A | inr a ∈ Ring.jacobson (Unitization ℂ A)}` and prove
it is a complex two-sided ideal. Compare the two definitions when A has
a unit. Semisimplicity here means `rad A=⊥`; it is distinct from
Mathlib's `IsSemisimpleRing`, the semisimple-module condition.
Develop maximal modular left ideals, simple modules and primitive ideals
(annihilators of simple nonzero modules on which the algebra acts nontrivially).
Prove the radical is their intersection, is a closed two-sided ideal, and the
quotient by it is semisimple. Here semisimple means zero Jacobson radical.
For a unital algebra prove `a ∈ rad A` iff `1-ba` is invertible for every `b`;
give the nonunital formulation through unitization and the equivalent
quasinilpotence of every `ba`. Do not identify all quasinilpotent elements with
the radical in a noncommutative algebra.

Construct the Banach simple-module realization from a maximal modular left
ideal. Prove Rickart's theorem: a simple complex Banach A-module has a
unique compatible Banach-module norm up to equivalence; every algebraic
A-module endomorphism is bounded and is a scalar multiple of the identity.
Supply the automatic-boundedness argument and apply Gelfand–Mazur to the
endomorphism division Banach algebra. Use that scalar-commutant result
to specialize Mathlib's algebraic Jacobson density theorem to simultaneous
prescription on finitely many complex-linearly independent vectors.
Develop ideal annihilators and the primitive hull–kernel topology, including
the closure operator, quotient correspondence, and compatibility with algebra
isomorphisms. These are the algebraic and analytic inputs to A5, not assumptions
that separating ideals vanish.
For C*-algebras, CStarAlgebras C2 owns the comparison between these primitive
ideals and kernels of irreducible *-representations, and uses this topology.

## A2. Holomorphic functional calculus

Reuse Tau Ceti's Banach-valued `Contour.Cycle.integral`, Mathlib's
Banach-valued disc Cauchy formulas, analyticity and identity theorem.
Extend the scalar homology Cauchy theorem to Banach-valued functions,
with cycle norm bounds, compatibility with bounded linear maps and
the corresponding differentiation formulas. Obtain the integral identities by
scalarization and separation by the continuous dual. Build the compact-set
neighborhood and finite-cycle constructions needed for disconnected spectra.

For `a` in a nonzero unital algebra, construct the calculus of holomorphic germs
near `σ(a)` by

`f(a) = (2πi)⁻¹ ∫Γ f(z) (z1-a)⁻¹ dz`.

For open U⊆ℂ use the subalgebra O(U) of `C(U,ℂ)` consisting of
functions whose extension by zero outside U is `DifferentiableOn ℂ`
on U, with the inherited compact-open topology. Prove that the condition
is independent of the values outside U and develop restriction, algebra
operations and locally uniform convergence. The germ algebra is the
subalgebra of `Filter.Germ (𝓝ˢ (spectrum ℂ a)) ℂ` represented by
functions holomorphic on some open neighborhood of the spectrum. Prove
the representative-independent algebra operations and the restriction
maps from each O(U) with σ(a)⊆U.

Here `Γ` is a finite integer combination of closed piecewise `C¹` paths in
`U \ σ(a)`, null-homologous in `U`, whose winding number is one on `σ(a)`;
`f` is holomorphic on the open neighborhood `U`. Prove existence of such cycles,
independence of the cycle and of the germ representative, and compatibility
with restriction to smaller neighborhoods. On each `O(U)`, use uniform
convergence on compact sets for continuity of the calculus.

Prove that this is the unique unital algebra homomorphism on germs sending the
coordinate function to `a` whose restriction to every `O(U)` is continuous;
give the explicit contour bound. For uniqueness, construct Cauchy Riemann
sums converging in O(V) on a smaller neighborhood V of σ(a) avoiding
the contour, and identify the images of the resolvent kernels. Prove
agreement with polynomials, rational functions with poles off the spectrum,
and convergent power series; naturality for continuous unital homomorphisms;
`σ(f(a)) = f(σ(a))`; and `g(f(a)) = (g ∘ f)(a)` when f is holomorphic
on an open U containing σ(a), g is holomorphic on an open V containing
f(σ(a)), and composition is taken on an open neighborhood U' of σ(a)
with `U'⊆U` and `f(U')⊆V`. Prove such a restriction exists.
Every element commuting with `a` commutes with `f(a)`. For a
nonunital algebra, `f(0)=0` ensures that the unitized calculus has value in `A`.

For a finite partition of `σ(a)` into nonempty disjoint compact sets, construct
the Riesz idempotents. Prove orthogonality, sum one, commutation with `a`,
nonzeroness and the exact corner spectra. For a bounded operator on a Banach
space obtain the corresponding closed invariant direct-sum decomposition.
Prove continuity of the idempotent under perturbations that preserve a fixed
resolvent contour and persistence of isolated spectral components. Reuse
Mathlib's upper hemicontinuity of the full spectrum.

Reuse `NormedSpace.exp` and its spectrum lemmas; develop holomorphic logarithms and roots when a branch exists
on a neighborhood of the spectrum, with commutation and composition identities.
Prove lifting of finite orthogonal families of idempotents modulo the Jacobson
radical. Include the distinction between an idempotent and a self-adjoint
projection; this calculus has no involution hypothesis.

## A3. Characters and examples

Use `WeakDual.characterSpace ℂ A` for nonzero continuous multiplicative
functionals. Reuse automatic continuity and norm bounds for unital scalar
characters, unital character-space compactness and `gelfandTransform`.
Extend these constructions to nonunital algebras and identify character
kernels with maximal modular ideals in a commutative Banach algebra.
The Gelfand transform's kernel is the radical;
its supremum norm is the spectral radius. The character space is locally
compact, becomes compact on adjoining the zero functional, and is compact
without that extra point in the unital case. Nonemptiness in the unital case
requires a nonzero **commutative** algebra. Prove the unitization/character-space
correspondence and vanishing at infinity of Gelfand transforms.

For a commutative complex C*-algebra A, compare its nonzero continuous
character space Ω with that of the native external `Unitization ℂ A`.
The augmentation is the scalar projection `Unitization.fstHom` (underlying
function `Unitization.fst`). Reuse `Unitization.lift` for the unique
extension `χ⁺(c,a)=c+χ(a)`, with its star version when needed. Prove
that restriction identifies every character other than augmentation with
exactly one χ∈Ω, and prove the weak-star topology comparison by these
evaluation formulas and the automatic character bounds. Thus Ω is the open
complement of augmentation in the compact unitized character space. For A
with no identity this is its one-point compactification; if A already has
an identity, the external unitization still adds an isolated augmentation
point. For A=0 the unitized space is just that point. In the latter unital
case evaluation at the internal identity separates augmentation from Ω;
conversely, prove that an isolated augmentation would give an identity of A
by the commutative C*-Gelfand transform. Compare the product topology and
equivalent Banach `UnitizationL1` and C*-unitization norms, not identical
native norm instances. VonNeumannAlgebras V11 consumes this comparison
before Fourier uniqueness or inversion.

For commutative unital algebras reuse the character description of the spectrum,
invertibility iff the transform has no zeros, and the Šilov idempotent theorem:
clopen subsets of the character space correspond bijectively to idempotents.
Develop hulls and kernels of ideals and closed subsets with their Galois
connection. Do not assert that every closed ideal is determined by its hull.

Build the following examples with their norms, completeness, products, units
or approximate units, and the indicated identifications.
Use the entrywise ℓ¹ norm `∑ᵢⱼ ‖a_ij‖` for the finite Banach matrix
examples; prove submultiplicativity and finite-dimensional norm equivalence.
For c₀(S) give S the discrete topology and use `ZeroAtInftyContinuousMap S ℂ`.
For the Volterra algebra use `MeasureTheory.Lp ℂ 1
(volume.restrict (Set.Icc (0:ℝ) 1))`. For C¹([0,1]) use pairs of
continuous functions (f,g) on the closed interval with g equal to f's
derivative on its interior, proving uniqueness of g and the product rule.
Realize the disk algebra as the closed subalgebra of continuous functions
on the closed disk whose extensions are holomorphic on the open disk.

* `C(K,ℂ)` and `C₀(X,ℂ)`, for compact Hausdorff `K` and locally compact
  Hausdorff `X`: characters are evaluations; closed ideals are exactly the
  functions vanishing on a closed set. Reuse
  `WeakDual.CharacterSpace.homeoEval` and `ContinuousMap.idealOpensGI`
  for the compact case and build their locally compact counterparts.
* The disk algebra, with supremum norm on the closed unit disk and holomorphy
  in its interior: characters are evaluations on the closed disk. Show its
  inclusion into the continuous functions on the boundary is not inverse
  closed, using the coordinate function.
* For any discrete group G, `ℓ¹(G)=lp (fun _ : G ↦ ℂ) 1` with
  convolution: construct the absolutely summable convolution, norm bound,
  associativity, point-mass unit and the point-mass multiplication law.
  For G=ℤ this is the Wiener algebra: identify its Gelfand transform
  with the absolutely convergent Fourier series on the circle. Prove Wiener's
  inversion theorem, including the convolution and transform bridges.
* `C¹([0,1],ℂ)` with norm `‖f‖∞+‖f'‖∞`: evaluations and nonzero bounded point
  derivations `f ↦ f'(t)` into the scalar evaluation bimodule. Derivatives at
  endpoints are the continuous extensions of the interior derivative.
* The Volterra algebra `L¹([0,1])` with truncated convolution
  `(f*g)(s)=∫₀ˢ f(s-t)g(t) dt`: completeness, the norm inequality,
  a bounded approximate identity, and radicality. The constant function one
  has convolution powers of `L¹` norm `1/n!` for `n≥1` and is not nilpotent.
* Finite matrix algebras and upper triangular matrix algebras: compute their
  radicals and give a nonzero nilpotent matrix in a semisimple algebra.

## A4. Modules, factorization and bidual products

Develop bounded module maps, closed submodules, quotients, finite direct sums,
and restriction/extension along bounded algebra maps. Give dual actions by
`(a·φ)(x)=φ(x·a)` and `(φ·a)(x)=φ(a·x)`, their bounds, weak-star continuity
in the dual variable, and the dual-submodule/annihilator identifications.
Relate nonunital modules to unital modules over the unitization. An essential
left module satisfies `closure(span(A·E))=E`; an essential bimodule satisfies
`closure(span(A·E·A))=E`. Keep one-sided and two-sided essentiality separate.

Use `Filter.IsApproximateUnit` for two-sided approximate identities and the
corresponding one-sided convergence conditions with a proper filter. A bound
is an explicit finite constant `C` with `‖e‖≤C` on a filter-large set; pass to
the restricted filter when a globally bounded net is needed. Prove the
equivalence with nets and approximation on finite sets, transport to quotients,
and combination of left and right bounded approximate identities, with bound
`C+D+CD`. Prove convergence of a bounded approximate identity on the appropriate
essential module.

Prove Cohen–Hewitt factorization: if `A` has a left approximate identity bounded
by `C>0`, `E` is a Banach left module, and `x∈closure(span(A·E))`, then for every
`ε>0` there are `a∈A`, `y∈closure(A·x)` with `x=a·y`, `‖a‖≤C` and
`‖y-x‖<ε`. Include right and bimodule versions; an essential bimodule over an
algebra with bounded approximate identity is pseudo-unital, meaning every
element is a single `a·x·b`. Build the convergent unitization construction and
its estimates. This theorem applies to bounded, not just contractive, actions.

For a right module `E` and left module `F`, construct `E ⊗̂_A F` as the completed
projective tensor product modulo the closed linear span of
`(x·a)⊗y-x⊗(a·y)`. Prove its normed universal property for bounded balanced
bilinear maps, induced maps, associativity under the appropriate commuting
actions, and the dual description by balanced bilinear forms. Extend products
and outer module actions to completed projective algebra tensors.

Construct both Arens products on `A**` by successively taking adjoints of
multiplication. Pin their order by
`⟨F □ G,f⟩ = F(a ↦ G(b ↦ f(ab)))` and
`⟨F ◇ G,f⟩ = G(b ↦ F(a ↦ f(ab)))`.
Prove associativity, norm bounds, extension of multiplication under `J_A`,
weak-star continuity of `F↦F□G` for every G and of `G↦F□G` for
`F∈J_A(A)`, with the mirror statements for ◇, and functoriality
under second adjoints. Arens regularity means equality of the two products.
Prove equivalence with weak compactness of all maps `a ↦ (b ↦ f(ab))`,
and the double-limit criterion for bounded sequences whenever both iterated
limits exist. Develop the topological centre and weakly almost periodic
functionals, and inheritance of Arens regularity by closed subalgebras and
quotients. Relate bidual identities to weak-star cluster points of bounded
approximate identities, retaining which side and which product each identity
uses.

## A5. Automatic continuity

For a linear map `T:E→F` between Banach spaces, construct its separating space
`S(T)={y : ∃ xₙ→0, Txₙ→y}` as a closed linear subspace. Identify it with the
vertical fibre of the closure of the graph. Prove that `T` is continuous iff
`S(T)=0`, that the induced map into `F/S(T)` is continuous, and the composition
and continuous-perturbation formulas, with closures where images need them.

Prove the stability lemma: for Banach spaces `E₀=E,E₁,…` and bounded maps
`Rₙ:Eₙ→Eₙ₋₁`, the decreasing sequence `S(T R₁⋯Rₙ)` eventually stabilizes.
Develop its gliding-hump proof and the intertwining consequence: when all
commutators with the module actions are continuous, the separating space is a
submodule and the closures of the images under successive multipliers
stabilize. For a closed two-sided ideal J in B, call it separating when,
for every sequence (b_n), both nests
`closure(b₁⋯b_n J)` and `closure(J b_n⋯b₁)` stabilize. Prove that
S(θ) is such an ideal for a surjective algebra homomorphism θ:A→B.
For a bounded B-bimodule E and linear T:E→B, assume each map
`x↦T(b·x)−bT(x)` and `x↦T(x·b)−T(x)b` is continuous for each
fixed b; prove that S(T) is likewise a separating ideal.

Prove the structure theorem for separating ideals: either `J⊆rad B`,
or `J=D⊕rad J` for a nonzero finite-dimensional subalgebra D, and
J contains a nonzero idempotent. Supply the primitive-module reduction,
the finite-dimensional idempotent construction and the identity
`rad J=J∩rad B` used here. Deduce that semisimple B has no
infinite-dimensional separating ideals and no nonzero finite-dimensional
nilpotent ideals. Prove continuity into any B with those two properties:
its separating ideal must be finite-dimensional; if nonzero it contains
a nonzero idempotent. Exclude that idempotent for surjective homomorphisms
by the spectral-radius obstruction for their separating spaces. For a
derivation, use `D(pb_n)=pD(b_n)+D(p)b_n`, with `b_n→0` and
`D(b_n)→p`, and continuity on the finite-dimensional separating ideal
to obtain the contradiction. These are the intermediate results used
in the following automatic-continuity theorems.

Prove these automatic-continuity theorems for complex Banach algebras, including
nonunital versions via unitization:

* Every homomorphism into a commutative semisimple Banach algebra is continuous.
* Every surjective homomorphism onto a semisimple Banach algebra is continuous.
  Surjectivity is required when the target is noncommutative.
* Every algebraic derivation `A→A` on a semisimple Banach algebra is continuous.
* Every algebra isomorphism from a complex Banach algebra to a semisimple
  complex Banach algebra is a homeomorphism. Derive uniqueness of the complete
  algebra norm up to equivalence by putting the second norm on a type synonym.

Also prove the continuous Singer–Wermer theorem: a bounded derivation on a
commutative Banach algebra has range in its radical. Develop the exponential
of a bounded derivation, its automorphism identity, and the character/Liouville
argument. For a bounded derivation into a unital symmetric Banach module over
a commutative unital algebra prove `D(f(a))=f'(a)·Da`. No claim about arbitrary
derivations preserving primitive ideals is part of these targets.

## A6. Bounded Hochschild cohomology and amenability

Use `ContinuousMultilinearMap ℂ (fun _ : Fin n ↦ A) E` for `Cⁿ(A,E)`,
and identify `C⁰(A,E)` with E by evaluation on the empty tuple.
Construct the bounded Hochschild differential

`δT(a₁,…,aₙ₊₁) = a₁·T(a₂,…,aₙ₊₁)`
`  + Σⱼ₌₁ⁿ (-1)^j T(a₁,…,aⱼaⱼ₊₁,…,aₙ₊₁)`
`  + (-1)^(n+1) T(a₁,…,aₙ)·aₙ₊₁`.

Prove its norm bound, `δ²=0`, coefficient functoriality and compatibility with
currying/projective tensors. Define `Zⁿ=ker δ`, `B⁰=0`, `Bⁿ=range δ` for
`n≥1`, and `Hⁿ=Zⁿ/Bⁿ` as a vector-space quotient. The coboundaries need not be
closed, so this is not automatically a Hausdorff Banach quotient. Identify
`H⁰` with the centre of the bimodule and `H¹` with bounded derivations modulo
inner derivations `a↦a·x-x·a`.

Construct the universal bounded derivation using
`Ω¹(A)=ker(m:A⁺⊗̂π A⁺→A⁺)` and `da=1⊗a−a⊗1`, with outer
actions of A⁺. For a Banach A-bimodule E extend its actions unitally
to A⁺. Prove every bounded derivation D:A→E factors uniquely through
a bounded A⁺-bimodule map `Ω¹(A)→E`, including the norm estimate
and the identity on finite tensors that determines this map.

Construct square-zero extensions `E⊕A` from bounded two-cocycles with product
`(x,a)(y,b)=(a·y+x·b+c(a,b),ab)`. Supply an equivalent complete algebra norm
from the action and cocycle bounds. Prove associativity iff the cocycle identity,
equivalence under change of bounded linear section by coboundaries, and the
classification by `H²(A,E)` of singular Banach extensions with a bounded
linear section and fixed identifications of ideal and quotient: the ideal
is square-zero and its induced A-bimodule structure is the specified E.
Prove that the induced actions are independent of the section.
In particular, splitting as a
continuous algebra map is equivalent to vanishing of the class.

A Banach algebra is amenable when every bounded derivation `A→E*` is inner
for every Banach bimodule `E`. Prove it has a bounded approximate identity,
and prove reduction of this test to essential bimodules once such an identity
exists, using first the left-essential part and then its right-essential part
and the dual exact sequences. For `Δ:A⊗̂π A→A`, `Δ(a⊗b)=ab`, use outer actions
`c·(a⊗b)=ca⊗b` and `(a⊗b)·c=a⊗bc`. Prove equivalence of amenability with:

* a bounded approximate diagonal `(mᵢ)`, with `a·mᵢ-mᵢ·a→0` and
  `aΔ(mᵢ)→a` in norm for every `a`;
* a virtual diagonal `M∈(A⊗̂π A)**`, with `a·M=M·a` and
  `a·Δ**(M)=J_A(a)` for every `a`;
* `Hⁿ(A,E*)=0` for every Banach bimodule `E` and every integer `n≥1`.

For the amenability-to-virtual-diagonal construction take a weak-star
cluster point E₀ of `e_i⊗e_i` in `(A⊗̂π A)**` for a bounded approximate
identity. Prove `a↦a·E₀−E₀·a` is a bounded derivation with values in
`ker Δ**`. Use Cohen–Hewitt to prove Δ surjective and identify this
kernel with `(ker Δ)**` by the dual exact sequence. Innerness supplies
N in that kernel; prove `M=E₀−N` is a virtual diagonal. This is the
universal-derivation argument whose normal-dual variant is used in
CStarAlgebras C6.

Build the cochain-module actions and their projective-tensor preduals used
for dimension reduction in positive degrees, and prove the chain identities;
ordinary pointwise module actions are not the required actions. Include the
Goldstine/convex-combination passage from a virtual to an approximate diagonal.

Prove preservation of amenability under continuous homomorphisms with dense
range, quotients by closed ideals, finite products and completed projective
tensor products. Prove `A` amenable iff its unitization is amenable. For a
closed ideal `I` in an amenable algebra, prove the equivalence of amenability
of `I`, existence of a bounded approximate identity in `I`, and weak
complementation (its annihilator is complemented in `A*`). If both `I` and
`A/I` are amenable, prove `A` amenable. Give the matrix diagonal
`n⁻¹Σᵢⱼ eᵢⱼ⊗eⱼᵢ` for `n≥1`, and prove amenability of `c₀(S)` for arbitrary
index sets using finite-support diagonals with uniform projective-norm bounds.
Use the nonzero point derivations of A3 to prove `C¹([0,1],ℂ)` is
not amenable.

## A7. Group algebras and Johnson's theorem

Let `G` be locally compact Hausdorff and `μ` a nonzero regular left Haar measure.
There is no standing second-countability or sigma-finiteness assumption. Use
the AmenableGroups Layer 7 construction of scalar convolution, its
sigma-compact-support and Baire-representative measurability bridges, and its
approximate-identity kernels. Extend these to complex `L¹(G,μ)` and establish
the Banach algebra and involution APIs. With
`c(g)=(Measure.modularCharacter g : ℝ)`, so
`∫ f(xg)dμ(x)=c(g)∫ f(x)dμ(x)`, fix

`(f*h)(x)=∫ f(y)h(y⁻¹x)dμ(y)`,
`f*(x)=c(x) overline(f(x⁻¹))`.

Prove well-definedness on almost-everywhere classes, associativity, the norm
bound, the isometric involution and its reversal of products, and continuity
of translations, including right-translation L¹ continuity. Retain
AmenableGroups7.1–2's Haar/modular convention and its sigma-compact-support,
Baire-representative and localized Fubini bridges; do not add global
sigma-finiteness or second countability.

**A7.ChosenApproximateIdentity.** Index by all identity neighbourhoods,
ordered by reverse inclusion. Choose nonnegative continuous compactly
supported u_U with support in U and integral one, using relatively compact
neighbourhoods and compact-continuous Urysohn functions, positivity of Haar
measure on nonempty open sets, and normalization. Prove u_U∈L¹∩L² and
‖u_U‖₁=1. For these chosen kernels prove both u_U*f→f and f*u_U→f in
L¹. In the right-hand formula use
`(f*u_U)(x)=∫ c(z)u_U(z)f(xz⁻¹)dμ(z)` and
`∫c(z)u_U(z)dμ(z)=∫u_U(z⁻¹)dμ(z)→1`;
the latter limit uses modular continuity and shrinking support, not exact
inversion invariance for a general group. Use nets, not an assumed countable
neighbourhood basis.

**A7.IntegratedRepresentations.** Integrate uniformly bounded strongly
continuous representations π of G on a Banach space to nondegenerate
bounded representations `ρ(f)ξ=∫f(x)π(x)ξ dμ(x)` of L¹(G), and construct
the inverse correspondence, including intertwining maps and explicit norm
estimates (`‖ρ(f)‖≤sup_x‖π(x)‖·‖f‖₁`). Prove the needed Bochner
measurability on supports: the essential sigma-compact localization and
separable images of compact sets supply it without a separability
assumption on the whole Banach space. Prove multiplicativity with the
stated convolution, and nondegeneracy by ρ(u_U)ξ→ξ. In the reverse
direction define the group action first on the span of ρ(L¹)E by
`π(x)ρ(f)ξ=ρ(L_x f)ξ`, `L_x f(y)=f(x⁻¹y)`; prove presentation
independence, its uniformly bounded extension, strong continuity and
recovery of ρ, using the bounded approximate identity. This construction
precedes M(G), the regular representation and Fourier theory.

**A7.RegularL2.** On L²(G) construct `λ_xξ(y)=ξ(x⁻¹y)`, prove
unitarity by left Haar invariance and strong continuity by C_c density,
and apply A7.IntegratedRepresentations. Prove the integrated involution
law `λ(f*)=λ(f)*` and `‖λ(f)‖≤‖f‖₁`. Own the common-representative
comparison: for f∈L¹ and h∈L¹∩L², the convolution integral represents
both the L¹ convolution and λ(f)h in L², with Young bounds
`‖f*h‖₁≤‖f‖₁‖h‖₁` and `‖λ(f)h‖₂≤‖f‖₁‖h‖₂`.
Prove the almost-everywhere representative compatibility using the same
localized integration bridges, rather than identifying the two Lp quotient
types. Prove λ(u_U)ξ→ξ, hence nondegeneracy, using the chosen kernels
and C_c density. For every G prove faithfulness: λ(f)=0 makes all
λ(f)u_U zero in L²; the common-representative comparison makes f*u_U
zero in L¹; its L¹ limit is f. These results precede V11's reduced
C*-algebra and use no character correspondence or Fourier uniqueness.
For abelian G prove unimodularity, inversion invariance of Haar measure
and commutativity of L¹ convolution. Identify the discrete case with `ℓ¹(G)`. The algebra is
unital iff `G` is discrete; account for the normalization of Haar measure in
the function representing the identity.

Construct `M(G)`, finite regular complex Borel measures with total-variation
norm, and its convolution and involution. Extend the measure representation
from compact spaces in BanachSpaceTheory B5 to `C₀(G)*`, and supply the regular
product-measure/iterated-integral results needed for convolution without
assuming the Borel sigma-algebra of a product equals the product sigma-algebra.
Construct the regular product through its integration functional on
compactly supported continuous functions, first on finite sums of tensor
products and then by compact-set approximation. Use tightness of finite
regular measures to extend the needed Fubini identities to bounded
continuous functions and push the product forward by multiplication.
Prove completeness, associativity, norm bounds, the unit `δ₁`, the embedding
of `L¹(G)` as a closed two-sided ideal, and `δ_g*δ_h=δ_gh`. The measure
involution is conjugation followed by inversion; its restriction gives the
displayed modular formula on `L¹`.

Extend essential
`L¹(G)` bimodules to `M(G)` by factorization. For a Banach algebra with bounded
approximate identity embedded as a closed ideal in `B`, define the strict
topology by `b↦‖ba‖+‖ab‖`; prove unique strict-to-weak-star continuous extension
of bounded derivations into duals of essential bimodules. Apply this to `M(G)`
and prove the strict density of finite linear combinations of point masses.
For a finite collection of L¹ test functions, use norm continuity of their
left and right translation orbits on compact sets and regular-measure
approximation to construct finite atomic measures with simultaneous strict
error bounds. Control their total variation uniformly and pass to the net
over finite test sets and positive error tolerances.

**A7.CharactersAndUniqueness.** For every locally compact Hausdorff
abelian G, identify all nonzero bounded characters of L¹(G) with continuous
unitary group characters by `χ_γ(f)=∫f(x)γ(x)dμ(x)`, with no conjugation.
Own the integrated character correspondence here. From a nonzero character
χ choose f₀ with χ(f₀)≠0, construct γ from
`χ(L_x f₀)/χ(f₀)`, prove independence of f₀, multiplicativity,
continuity from L¹ translation continuity, and unit modulus from uniform
boundedness on all powers and inverses. Derive the inverse integral formula
by applying χ to the convolution integral. Prove the resulting
homeomorphism from the compact-open dual to the Banach-algebra weak-star
character space: use C_c approximation in one direction and the norm-compact
translation orbit of f₀ over each compact set in the other. Consume A3's
vanishing-at-infinity Gelfand transform to obtain Riemann–Lebesgue. This
character correspondence and its topology proof do not use Fourier
uniqueness, inversion or double-dual surjectivity.

For uniqueness consume V11's inversion-free **closed topological
embedding** of G into its double dual, with its compact-open topology and
positive-character Fourier convention. Extend Tau Ceti's native
`MeasureTheory.FiniteMeasure.ext_of_forall_pontryaginMeasureTransform_eq_of_innerRegular`
from finite positive inner regular measures on a Pontryagin dual to finite
signed/complex regular measures by Jordan decomposition of real and
imaginary parts and the transform identities at γ and its conjugate.
For `H=Additive (PontryaginDual G)`, explicitly transport V11's evaluation
embedding to `G→PontryaginDual (Multiplicative H)` through the canonical
topological group equivalence; do not identify the wrapper types by fiat.
Push a finite complex regular measure ν forward along this embedding.
Its native evaluation transform at h∈H is precisely `∫γ_h(x)dν(x)`.
Supply finite total variation, inner regularity of the positive variations
and pushforwards, and injectivity of pushforward: the image is closed,
and its homeomorphism with G takes Borel sets to Borel sets of that closed
image. Native positive-measure uniqueness, applied to each pair of Jordan
parts, therefore gives ν=0 when all these integrals vanish. This proves
the signed/complex comparison, not just the positive special case.

Apply this to the regular complex measure f·μ from the L¹→M(G)
embedding and identify zero measure with f=0 almost everywhere. Prove its
finite variation and regularity by essential sigma-compact localization
and compact approximation; no globally sigma-finite Haar measure or global
`L∞=(L¹)*` identification is assumed. This single A7 uniqueness theorem
precedes V11's Fourier inversion, Fourier–Plancherel and double-dual
surjectivity; only V11's earlier closed-embedding stage is consumed.
Compare the source convention `h_γ(x)=γ(x⁻¹)` with the displayed convention
by inverse/conjugate characters, including the corresponding transform
identities.

Use the invariant mean of AmenableGroups Layer 1 as the definition of group
amenability. Build the affine fixed-point bridge: a locally compact group is
amenable iff every jointly continuous affine action on a nonempty compact
convex subset of a Hausdorff locally convex real space has a fixed point.
State the fixed-point theorem universe-polymorphically in its ambient
real space; the definition of amenability remains the invariant mean on G.
Construct averaging by a mean and the converse action on the compact space of
means, with the required uniform-continuity checks.

Prove **Johnson's theorem**: `G` is amenable iff the complex Banach algebra
`L¹(G)` is amenable. For the forward implication construct the bounded affine
action from an extended derivation and its weak-star compact convex orbit
hull. Prove strong continuity of the predual left and right G-actions by
factorization and L¹ translation continuity. On the norm-bounded dual
hull, combine those norm estimates with weak-star continuity in the
functional variable to prove joint continuity; include the affine
derivation term using its strict-to-weak-star extension. For the reverse
implication use the complexified `UCB(G)` module with left action by
convolution and right action `u·f=(∫ f dμ)u`. Choose `η∈UCB(G)*` with `η(1)=1`;
`D(f)=f·η-η·f` takes values in `(UCB(G)/ℂ1)*`. Innerness there produces an
invariant functional with value one on the constants; use factorization and
approximate identities to pass from `L¹` invariance to translation invariance.
Do not assume a global
`L∞=(L¹)*` identification for non-sigma-finite Haar measure. Prove also that
`G` is amenable iff the augmentation ideal
`{f∈L¹(G) : ∫f dμ=0}` has a bounded right approximate identity, including the
factorization and positivity-normalization steps. Recover finite, compact and
discrete abelian examples from the group roadmap and the explicit discrete virtual
diagonal induced by an invariant mean.

For positivity normalization first restrict the real part of the complex
invariant functional to real UCB(G), preserving invariance and its value
one on constants. Construct the modulus of a bounded real
functional on the function lattices used here, with
`|m|(f)=sup {|m(h)| : |h|≤f}` for `f≥0`; prove additivity on the positive
cone, bounded extension and preservation of invariance under lattice
automorphisms. A nonzero invariant functional with value one on the constant
one then yields the invariant mean `|m|/|m|(1)`. This supplies the step without
using a C*-algebra representation theorem as an extra prerequisite.

## Sources and API alignment

* Dales, *Banach Algebras and Automatic Continuity*: §§1.3–1.5 and 2.1–2.3
  (ideals, radicals, spectra and characters), §2.4 (holomorphic calculus,
  Theorem 2.4.4 and Corollaries 2.4.5–2.4.6), §2.6 (Arens products,
  Theorem 2.6.17), §2.7 (derivations), §2.9 (factorization, Theorem 2.9.24),
  Chapters 3–4 (group and function algebras, Volterra Theorem 4.7.40), and
  §5.2 (separating space, stability Theorem 5.2.5, separating ideals
  5.2.22–5.2.26 and Theorem 5.2.28); Rickart's Theorem 2.6.26 supplies
  the scalar-commutant step in A1.
* Runde, *Lectures on Amenability*: §§2.1–2.4 (Johnson Theorem 2.1.8,
  diagonals Theorem 2.2.4, ideals Theorem 2.3.7, augmentation Theorem 2.3.9,
  extensions Theorem 2.3.10, dual cohomology Theorem 2.4.7), §1.3
  (fixed points), and Appendices A–B (group algebras and projective tensors).

Mathlib already provides the general `UnitizationL1` norm, weak-dual character
space, the spectral-radius formula and upper hemicontinuity of spectrum.
Reuse `WeakDual.CharacterSpace.norm_le_norm_one`, the compactness
instance for unital character spaces, the commutative-Banach-algebra
part of `GelfandDuality` (including `mem_spectrum_iff_exists` and
`spectrum.gelfandTransform_eq`), `spectrum.map_polynomial_aeval`,
`Subalgebra.frontier_spectrum` and
`Subalgebra.spectrum_eq_of_isPreconnected_compl`. Their stated
hypotheses remain in force; the nonunital and homological extensions
specified above are additional targets.
The [Zulip spectrum-continuity discussion](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/upper%20hemicontinuity%20vs.%20upper%20semicontinuity)
and [Mathlib PR #32521](https://github.com/leanprover-community/mathlib4/pull/32521)
explain the latter API. For closed two-sided ideals follow
[PR #42093](https://github.com/leanprover-community/mathlib4/pull/42093)'s
`TwoSidedIdeal.closure`, closure lemmas and proper-closure interface. The
projective tensor dependency follows the Mathlib designs cited in
BanachSpaceTheory B4. Mathlib's current `Derivation` is for commutative algebras
and symmetric modules; general bimodule derivations must support distinct
left and right actions, with comparison to `Derivation` in its existing scope.
Implement missing required APIs in Tau Ceti in the established shape, and
adopt Mathlib implementations when available.
