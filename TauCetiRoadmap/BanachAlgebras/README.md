# Banach algebras

Build the spectral, module and cohomological theory of complex Banach algebras.
The depth milestones are holomorphic functional calculus, Cohen–Hewitt
factorization, automatic continuity for semisimple algebras, the equivalent
diagonal characterizations of amenability, and Johnson's theorem relating
amenability of a locally compact group to amenability of its group algebra. The finite-jet and compact-operator chapters
connect spectral calculus with Lomonosov's invariant-subspace theorem.

## Scope, conventions and prerequisites

Algebras are associative over `ℂ`, with submultiplicative norm and complete
underlying normed space. A unit is assumed only where stated. Use Mathlib's
`NonUnitalNormedRing`, scalar compatibility instances, `NormedRing`,
`NormedAlgebra`, and `CompleteSpace`, rather than a separate Banach-algebra
structure. Homomorphisms are complex linear and multiplicative; continuity and
preservation of the unit are separate requirements. Algebra ideals are
ℂ-linear as well as closed under the stated multiplication; in a nonunital
algebra this scalar condition must be carried explicitly. In automatic-continuity
statements the input homomorphism or derivation has no continuity assumption.
Use `A →ₙₐ[ℂ] B` for nonunital algebra homomorphisms. Do not impose
`NormOneClass` on general unital Banach algebras; retain factors of `‖1‖`
in norm estimates unless that additional hypothesis is stated.

For a general nonunital algebra use `WithLp 1 (Unitization ℂ A)`, whose norm is
`‖(λ,a)‖ = |λ| + ‖a‖`. Specify when a construction takes place in this unitization
and when its output lies in `A`. Use `spectrum`, `quasispectrum` and
`spectralRadius`, with explicit comparisons to unitization. In particular the
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

[Banach space theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/15588952fdc156cbddda2c00f896851c90d93670/TauCetiRoadmap/BanachSpaceTheory/README.md), B1–B2 and B4–B5, supplies
dual quotients, weak compactness, completed projective tensors and scalar measure
representation. The [completed contour integration roadmap](../../Completed/ContourIntegration/README.md)
supplies scalar contour integration, winding numbers and homological Cauchy
theory; A2 extends its homology Cauchy theorem to Banach-valued functions.
Its cycle integral is already Banach-valued. Mathlib supplies Bochner integration,
Haar measure, continuous linear maps, algebraic simple modules and Jacobson
density. The [AmenableGroups roadmap, Layers 1 and 7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a4317b48d22a8317c89cf01e67b5c149055b08e1/TauCetiRoadmap/AmenableGroups/README.md)
supplies invariant means and the Haar-measure convolution foundations used in A7.
[AlgebraicTopology Stage 2, item 7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/50af6084a401dffe3db1e50dac46fe4bca36f4fd/TauCetiRoadmap/AlgebraicTopology/README.md#stage-2-relative-singular-chains-and-homology) supplies Brouwer on finite-dimensional
convex spans for A8. Mathlib supplies the compact-operator Fredholm
alternative; [VonNeumannAlgebras V11](https://github.com/TauCetiProject/TauCetiRoadmap/blob/160687f3131efb1b7b37fb6008a842b98815069c/TauCetiRoadmap/VonNeumannAlgebras/README.md#v11-weights-connes-invariants-and-continuous-cores) supplies the LCA dual conventions.
These layers own the invariant-mean and scalar-convolution prerequisites;
the complex group-algebra and cohomological constructions belong to A7.

A1–A3 and A8 consume no B4 approximation/tensor targets;
their compact, function and invariant-subspace layers are independent
suppliers for B4. Other layers use the explicit Banach-space dependencies.

This roadmap owns Banach-algebra holomorphic calculus, radicals, modules,
bounded Hochschild cohomology and Johnson amenability. It does not own
C*-representations, continuous functional calculus, C*-tensor norms, or
nuclearity. A2 owns its finite-spectrum calculi, including their continuous and star
criteria, and the isometric-calculus normality converse stated there; it consumes
the native normal-operator calculus for the comparison, rather than
constructing general Hilbert-space continuous calculus. Hilbert-space Borel spectral theory belongs to
[OperatorTheory](../OperatorTheory/README.md), and general semigroup generators
belong to [OneParameterSemigroups](../../Completed/OneParameterSemigroups/README.md).
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
subalgebra need not be inverse closed. For nilpotent a in a nonzero
unital complex Banach algebra, prove σ(a)={0} directly by the finite
geometric-series inverse, before using the spectral-radius formula.
In the zero algebra every element is invertible and its spectrum is empty.
Prove B(X) is commutative exactly when dim X≤1, with rank-one
counterexamples for dim X≥2. Identify the sup-norm completion of
polynomials on [0,1] with C[0,1], and construct a nonpolynomial limit.

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

For a nonzero unital Banach algebra construct the equivalent norm
`‖a‖_* = ‖leftMultiplication(a)‖`. Prove
`‖a‖/‖1‖≤‖a‖_*≤‖a‖`, submultiplicativity, completeness and
`‖1‖_*=1`, and the bounded algebra equivalence with the original norm.
Test the closest-scalar prescription separately. On B=ℂ³ with pointwise
multiplication and the Banach-algebra norm `N(z)=2‖z‖∞`, the identity
`e=(1,1,1)` has N(e)=2. For every z prove the unique existence of a scalar
λ_z minimizing `N(z−λe)`: use coercivity in λ and properness of ℂ for
existence, and the complex parallelogram identity at the midpoint of two
minimizers for uniqueness. Set `q(z)=N(z−λ_z e)+|λ_z|`. This formula does
not define a norm. With `a=(−1,1,i)` and `b=(1,1,i)`, prove

`λ_a=0`, `λ_b=(1+i)/2`, `λ_(a+b)=1+i`,

`q(a)=2`, `q(b)=3√2/2`, `q(a+b)=3√2>q(a)+q(b)`.

Each minimizing center is certified by half the distance of a pair of
coordinates and attainment of that bound; the third coordinate lies in the
same closed disk. Prove the scaled supremum norm is complete and
submultiplicative, so the counterexample has exactly the unnormalized-unit
setting of Short Assignment4, question2. Uniqueness makes the failure
independent of any choice of minimizers. This closest-scalar formula and
the bounded linear projection sum norm below are distinct constructions;
the preceding left-multiplication norm supplies the algebra renorming.
[ClosestScalarTargets.lean](ClosestScalarTargets.lean) illustrates the
nearest-center and triangle-failure statements.

For a closed subalgebra B of a unital algebra A with 1_A∉B, prove the
unitization map `(λ,b)↦λ1_A+b` identifies B′ with the closed algebra
B+ℂ1_A, as a bounded algebra equivalence. The inherited norm need not
be the ℓ¹ unitization norm: for c₀⊂ℓ∞, b=−e₁ and λ=1 the norms
are respectively 1 and 2. Also use B={f∈C[0,1]:f(0)=0},
b(t)=−t and λ=1: the inherited norm of 1−t is 1 while the
ℓ¹ unitization norm is 2. Construct the M₂ left ideal of matrices whose
first column is zero and show it is not a right ideal by matrix-unit
multiplication. Prove the closure of c₀₀ in ℓ∞ is c₀.

For nonzero unital B with ‖e‖=1, extend λe↦λ by Hahn–Banach,
set P(a)=φ(a)e and V=ker φ, and prove B=ℂe⊕V with bounded
projections P and I−P. Prove the sum norm |φ(a)|+‖a−φ(a)e‖
is equivalent to the original norm, using ‖P‖+‖I−P‖ as an upper
comparison constant. It need not be submultiplicative: on ℂ³ with its
sup norm and φ the coordinate average, a=(1,−1,0) has sum norm 1
while a²=(1,1,0) has sum norm4/3. This vector-space renorming is
separate from the preceding left-multiplication algebra renorming.

Construct the one-dimensional nonunital algebra ℂE₁₂⊂M₂(ℂ),
with zero multiplication and norm ‖aE₁₂‖=|a|; prove it has no
identity. With the ℓ¹ unitization norm |λ|+|a|, identify its
unitization algebra with span{I,E₁₂}⊂M₂(ℂ) and
ℂ[ε]/(ε²), sending ε to E₁₂. Prove the bounded algebra
comparison with the matrix operator norm on `EuclideanSpace ℂ (Fin 2)`, including
max(|λ|,|a|)≤‖λI+aE₁₂‖≤|λ|+|a|, and compute
σ(E₁₂)={0}. It is an algebra example, not a star subalgebra.

**A1.PositiveFunctionals.** Let A be a unital complex Banach *-algebra
with isometric involution. A positive functional is an algebraic complex-linear
φ:A→ℂ satisfying `φ(a*a)∈ℝ≥0` for every a; no continuity is assumed.
Prove Hermitian symmetry, the Cauchy–Schwarz inequality and automatic
continuity, with `|φ(a)|≤φ(1)‖a‖` and
`φ(a*a)≤φ(1)‖a‖²`. For nonzero A retain
`φ(1)/‖1‖≤‖φ‖≤φ(1)`; conclude `‖φ‖=φ(1)` when `‖1‖=1`.
Construct the self-adjoint square root of `1−h` for self-adjoint
`‖h‖<1` by the real binomial series. Apply this with a strict radius
larger than the norm and pass to the limit to obtain the closed-ball
positivity bound.

Construct the GNS space as the Hilbert completion of A modulo
`N_φ={a:φ(a*a)=0}`, using native complex inner-product conventions
`⟪[a],[b]⟫=φ(a*b)`. Prove N_φ is a left ideal and
`φ(b*a*ab)≤‖a‖²φ(b*b)`, so left multiplication gives bounded
operators with `‖π_φ(a)‖≤‖a‖`, preserves star and multiplication,
is unital, and has cyclic vector `[1]` with `φ(a)=⟪[1],π_φ(a)[1]⟫`.
Include φ=0 and uniqueness of the cyclic realization up to the unique
unitary carrying the cyclic vectors to one another. For a unital normed
*-algebra with isometric star and a **continuous** positive functional,
extend it positively to the Banach completion and obtain the same
construction and bound. Also prove that every algebraic *-homomorphism
from a possibly nonunital Banach *-algebra with isometric star to a
C*-algebra is contractive, using unitization and spectral-radius
comparison. This is the Banach-input representation interface;
VonNeumannAlgebras V0 owns the C*-algebra specialization and its general
faithful-representation theory.

Completeness cannot be dropped from automatic positivity bounds. On
`ℂ[X]` with coefficientwise conjugation and the supremum norm on
`[−1,1]`, the positive functional
`φ(p)=∫_ℝ p(t)exp(−t²)dt` is unbounded: test the polynomials `X^(2n)`,
whose algebra norms are one and whose Gaussian moments are unbounded.
In its polynomial GNS pre-Hilbert space, coordinate multiplication is
unbounded, as seen from
`‖X^(n+1)‖_φ²/‖X^n‖_φ²=n+1/2`.
Thus algebraic positivity on an arbitrary normed *-algebra does not give
a representation by bounded operators. No C*-order structure on A is
assumed in these Banach *-algebra statements.

**A1.SwappedStarExample.** On a distinct type copy S of the coordinatewise
algebra ℂ×ℂ put `star(z,w)=(conj(w),conj(z))` and
`‖(z,w)‖=max(|z|,|w|)`. Transport the native product ring, complex algebra
and Banach-space structures to this copy, then install the displayed
isometric involution. Prove the star laws, completeness and submultiplicative
norm. The default coordinatewise star on ℂ×ℂ is a different structure;
the example must not replace that native instance. This is Rieffel's
C*-algebra notes p27 example of a *-algebra with no nonzero positive functionals
or *-representations.

For `e₁=(1,0)`, `e₂=(0,1)` prove `star(e₁)=e₂`, `star(e₂)=e₁`,
`e₁e₂=e₂e₁=0` and `e₁+e₂=1`. Every algebraic complex-linear functional
positive on star-squares is zero. One proof uses `h=(1,−1)`, with
`star(h)h=−1`, to force φ(1)=0 and then applies the algebraic
Cauchy–Schwarz inequality. Hence the state space is empty and every
positive-functional GNS quotient is the zero Hilbert space.

Prove every possibly nonunital algebraic *-homomorphism from S into any
complex C*-algebra is zero, without a continuity premise. Its images of e₁,e₂
have zero adjoint-square, so vanish, and complex linearity kills the whole
algebra. In particular it has no faithful Hilbert-space *-representation.
For any native `RingSeminorm S` satisfying `q(star(a)a)=q(a)²`, prove q=0:
first apply the identity to `(z,0)` and `(0,w)`, then use the triangle
inequality. Consequently S admits no C*-norm; the zero map S→0 has the
universal property for maps to C*-algebras when morphisms need not preserve1.
This gives an explicit zero C*-envelope of a nonzero complete Banach *-algebra.
[SwappedStarTargets.lean](SwappedStarTargets.lean) states the functional,
representation and seminorm targets on the native product algebra with the
involution written explicitly, before transporting it to the type copy.

## A2. Holomorphic functional calculus

Reuse Tau Ceti's Banach-valued `Contour.Cycle.integral`, Mathlib's
Banach-valued disc Cauchy formulas, analyticity and identity theorem.
Extend the scalar homology Cauchy theorem to Banach-valued functions,
with cycle norm bounds, compatibility with bounded linear maps and
the corresponding differentiation formulas. Obtain the integral identities by
scalarization and separation by the continuous dual. Build the compact-set
neighborhood and finite-cycle constructions needed for disconnected spectra.
Include finite integer combinations of C∞ closed cycles as the smooth
case of the admissible piecewise C¹ cycles. Prove their winding-number
and Banach-valued derivative-integral comparisons, with support inside
the holomorphic domain; smooth approximation in that domain preserves
the required winding numbers and the holomorphic calculus value.
For every compact K in an open G⊆ℂ, construct the stronger smooth
contour system: finitely many pairwise disjoint simple C∞ closed curves
in G\K whose summed winding number is only0 or1, is1 on K and0 on
ℂ\G. Own the grid construction: for nonempty K choose squares of
side δ with √2δ<dist(K,ℂ\G), taking every closed square that meets K.
Their finite union contains K in its interior and lies in G. Cancel shared
edges in the sum of positively oriented square boundaries; compute its
winding as the union's indicator away from the boundary by additivity,
first off grid lines and then by local constancy. Resolve diagonal-touch
vertices by a fixed turn rule in small discs disjoint from K and ℂ\G,
producing pairwise disjoint simple closed polygons. Round all corners in
disjoint such discs to regular simple C∞ curves. For diagonal-touch resolution, prove the old and new boundary chains
differ by a cycle supported in the convex replacement disc. Its winding
vanishes off that disc and its holomorphic integral vanishes by the disc
Cauchy theorem. Corner rounding is a fixed-endpoint homotopy there;
choose joining arcs whose endpoint jets agree to all orders with the
adjoining straight segments and whose speed never vanishes, so the
result is a regular C∞ immersion. Identify winding values as 0 or1
in the modified union. Include the empty K and G=ℂ
branches. This constructive polygon/rounding argument owns simplicity,
disjointness and winding without an unprovided Jordan or 1-manifold theorem.

Extend contour integration to rectifiable paths on `ContinuousMap (Icc a b) ℂ`, extended constantly outside [a,b],
with `BoundedVariationOn γ (Icc a b)`. Construct the Banach-valued
Riemann–Stieltjes integral as the limit of tagged sums
`Σ F(γ(ξ_i))(γ(t_(i+1))−γ(t_i))` as the partition mesh tends to zero.
Prove existence for continuous F, the variation norm estimate,
additivity, reversal, concatenation and monotone reparameterization.
Compare with the supplied derivative integral for piecewise C¹ paths.
Prove polygonal approximation inside a specified open neighbourhood,
uniform convergence with bounded variation, winding-number stability
away from the image, and the corresponding Cauchy/cycle identities.
Thus rectifiable cycles have the same germ calculus as the finite
piecewise C¹ cycles used in its construction. The general Stieltjes
construction is owned here on the native bounded-variation carrier.

Prove weak holomorphy implies Banach-valued holomorphy: for open U and
f:U→E into a complete complex normed space E, if ℓ∘f is holomorphic for every bounded complex-linear ℓ:E→ℂ,
then f is holomorphic. Establish local norm boundedness by uniform
boundedness. Apply scalar Cauchy estimates and Hahn–Banach separation
to obtain local norm Lipschitz estimates, hence continuity, before
forming the Banach-valued contour integral. Recover norm derivatives from the Banach-valued Cauchy
formula; include the converse and naturality under bounded linear maps.

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
Prove that each nontrivial Riesz idempotent range is hyperinvariant
under every bounded operator commuting with T. For disconnected spectrum,
deduce a nonzero proper closed hyperinvariant subspace.
For a bounded idempotent P≠0,I, prove PTP=TP makes range(P)
invariant, while PTP=PT makes ker(P) invariant; both are nonzero proper
closed subspaces. On ℂ² take P=diag(1,0) and T=[[0,0],[1,0]] to
show PTP=PT does not require PT=TP.
For finite nonzero pairwise annihilating bounded idempotents with sum I,
prove the spectrum of T=Σ_i λ_iP_i is exactly the set of λ_i.
Group repeated coefficients first: E_λ=Σ_(λ_i=λ)P_i. Recover E_λ
from T by Lagrange interpolation on its distinct spectral values.
For S=Σ_j μ_jQ_j prove TS=ST iff these grouped E_λ,F_μ commute;
if both coefficient lists are pairwise distinct this is equivalent to
all P_i,Q_j commuting. Without that hypothesis the original equivalence
fails: T=I can have a decomposition by idempotents not commuting with S.
When T,S commute, the nonzero E_λF_μ form a finite decomposition of I;
prove simultaneous diagonalization and
σ(T+S)={λ+μ:E_λF_μ≠0}. This is a supported subset of the pairwise
sum set. For P=[[1,N],[0,0]] on Euclidean ℂ², N≠0, prove
‖P‖=√(1+|N|²)>1 although σ(P)={0,1}; idempotents here need not
be orthogonal projections.
Prove continuity of the idempotent under perturbations that preserve a fixed
resolvent contour and persistence of isolated spectral components. Reuse
Mathlib's upper hemicontinuity of the full spectrum.

Reuse `NormedSpace.exp` and its spectrum lemmas; develop holomorphic logarithms and roots when a branch exists
on a neighborhood of the spectrum, with commutation and composition identities.
Prove lifting of finite orthogonal families of idempotents modulo the Jacobson
radical. Include the distinction between an idempotent and a self-adjoint
projection; this calculus has no involution hypothesis.

For a compact set K containing σ(a), an algebra U of complex functions
on K containing constants and the coordinate, define an algebraic U
calculus to be a unital complex-algebra homomorphism U→A sending that
coordinate to a. Carry continuity only when U has a specified topology.
For finite-dimensional a let m_a be its minimal polynomial: prove the
polynomial calculus factors through a restriction quotient exactly when
the ideal of polynomials vanishing on K is contained in `(m_a)`.
For larger U, characterize extensions whose image lies in the polynomial
algebra ℂ[a]: they are precisely homomorphisms from U to
ℂ[X]/(m_a) compatible with polynomial restrictions, followed by its
isomorphism onto ℂ[a]. For general A-valued extensions, require a unital
homomorphism U→A extending the polynomial calculus; its image need not
lie in ℂ[a], so the polynomial-quotient condition is sufficient but not
necessary. On K=[0,1], let U be the algebra generated by s(x)=√x,
N=J₃(0) and a=N² in M₃(ℂ). Prove p(s)↦p(N) is such a calculus,
while ℂ[a]≅ℂ[t]/(t²) has no square root of t and hence admits no
compatible U calculus. Restriction of polynomial functions alone is
not a construction of a continuous U calculus.

For a bounded operator T on a complete complex Hilbert space, prove
that a unital isometric complex algebra homomorphism C(σ(T))→B(H)
sending the coordinate to T forces T to be normal. Images of unitary
functions and their inverses are contractions, hence unitaries. Apply this
to exp(it Re z) and exp(it Im z), differentiate at t=0 to prove the
two images self-adjoint, and use commutativity and their sum T. Compare
this converse with native normal-operator continuous functional calculus.

### Finite spectra, jets and resolvent power bounds

For every finite-dimensional complex normed space E and bounded
endomorphism T, put K=σ(T) with its finite subspace topology. Prove the
following equivalent: T is diagonalizable; E has a basis of T-eigenvectors;
there is a unital complex-algebra homomorphism
`Ψ:C(K,ℂ)→(E→L[ℂ]E)` sending the restricted coordinate to T; and
`T=Σ_(λ∈K) λP_λ` for nonzero pairwise annihilating idempotents P_λ
with `Σ P_λ=I`. Distinct λ index distinct spectral values, with repeated
eigenvalues grouped. The algebraic calculus in this statement is automatically
continuous and unique. Construct it by
`Ψ(f)=Σ_(λ∈K) f(λ)P_λ`, and prove
`‖Ψ(f)‖≤(Σ_(λ∈K)‖P_λ‖)‖f‖∞`.

Recover the idempotents from the characteristic functions of the singletons
and from the Lagrange polynomials
`P_λ=∏_(μ∈K,μ≠λ) (T−μI)/(λ−μ)`; prove range(P_λ) is exactly the
λ-eigenspace and compare these same maps with the existing Riesz/generalized
eigenspace projections. Construct the direct-sum equivalence and an eigenbasis
from bases of their ranges, with the inverse given by the P_λ. This criterion
allows arbitrary complex eigenvalues and has no normality hypothesis or
self-adjointness assertion for P_λ. For E=0, K is empty: the empty basis,
empty sums and unique map between the zero algebras give the corresponding
statements, and the calculus norm is0. Retain the separate real-interval C^r
and Hilbert-space isometric/star comparisons below.

For a finite-dimensional complex normed space and T in its bounded endomorphism
algebra, consume `Module.End.maxGenEigenspace`,
`Module.End.iSup_maxGenEigenspace_eq_top`, the minimal-polynomial API and
polynomial Chinese remainders. Follow the
[PID-module route for Jordan normal form](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/jordan.20normal.20form/near/342968538):
consume `Module.equiv_directSum_of_isTorsion` for the polynomial-module
carrier `Module.AEval'` induced by T, with its finite-generation and torsion
instances. Construct the direct sum of the generalized
eigenspaces, its bounded coordinate projections P_λ, and the finite jet quotient
`ℂ[X]/∏_λ(X−λ)^(r_λ)`, where r_λ is the nilpotence index on that component.
Prove the Hermite-interpolation isomorphism with the product of truncated
polynomial rings, agreement with the A2 Riesz projections, and
`f(T)=∑_λ∑_{j<r_λ} f^(j)(λ)/j! · (T−λ)^j P_λ` for holomorphic f.
Build nilpotent Jordan-chain bases and identify r_λ with the largest block size;
this identification is an additional theorem, not an assumption that a matrix
normal form already exists. Include the zero-dimensional space separately.

For T the all-1/3 matrix in M₃(ℂ), prove the unital algebra it generates
is span{I,T}, using T²=T. For T=diag(0,1,2), Lagrange interpolation
identifies its generated algebra with the diagonal matrices. No single
T generates all M₃, since every singly generated unital algebra is
commutative. Prove exp(tA) solves y′=Ay with prescribed initial vector,
its similarity naturality and the diagonal formula for normal matrices,
using the native exponential and spectral comparison.

For the alternating diagonal 0,1,0,1,… on ℓ², prove its spectrum
is {0,1}. Its first-n-coordinate finite sections have spectrum {0}
for n=1 and {0,1} for n≥2; n=0 is the zero-algebra branch.

For real spectrum contained in a compact interval [a,b], a<b, construct
the same formula for complex-valued C^r functions with real derivatives,
`r=max_λ(r_λ−1)`, taking r=0 for the zero-dimensional case. Use tuples of continuous derivatives through order r, with
successive derivatives on the interior and continuous endpoint extensions,
and norm the tuple by `∑_{k=0}^r ‖f^(k)‖∞/k!`. Prove completeness,
submultiplicativity and multiplication,
Leibniz formulas, polynomial density in this norm by approximation of the top
derivative and repeated integration, and uniqueness of this bounded unital
calculus sending the coordinate to T. Prove the explicit estimate
`‖f(T)‖≤∑_λ∑_{j<r_λ} ‖(T−λ)^j P_λ‖·‖f^(j)‖∞/j!`, and hence a
bounded-calculus estimate in the weighted norm. Prove sharpness: a nonzero j-th jet,
j>s, cannot extend continuously in the C^s norm, using shrinking smooth bumps
at the corresponding eigenvalue, using one-sided bumps at endpoints. Thus continuous C^0 calculus on a real
interval exists for this finite T exactly when it is diagonalizable. Under a
fixed Hilbert inner product, a star-preserving such calculus exists exactly
when T is self-adjoint; for general complex spectra the continuous star
calculus criterion is normality. Prove that similarity transports the
calculus with norm bound multiplied by `‖S‖‖S⁻¹‖`; an arbitrary similarity
need not preserve operator norms.

For smooth functions on a complex neighborhood and a nonnormal finite T,
pin the choice of derivatives used in any extension of the holomorphic jet
calculus. Build the family obtained at λ by
`D_λ=∂z+c_λ∂barz`, using `∑_{j<r_λ} D_λ^j f(λ)(T−λ)^j P_λ/j!`.
Here `∂z=(∂x−i∂y)/2` and `∂barz=(∂x+i∂y)/2`. Prove its continuity in the
real C^r topology, multiplicativity and holomorphic restriction. Use functions
`f:ℂ→ℂ` with `ContDiffOn ℝ r f U` for an open neighborhood U of the
spectrum, identified when their restrictions to U agree, with the seminorms
of real derivatives through order r on compact subsets of U. When r_λ≥2,
distinct c_λ give distinct extensions while all send z to T. These are
chosen jet calculi, not the canonical continuous star calculus. Compute
`f(J₂(0))=[[f(0),f′(0)],[0,f(0)]]` and
`f(J₂(1)⊕[2])=f(J₂(1))⊕[f(2)]` on the interval [1,2]. With the
operator norm on `EuclideanSpace ℂ (Fin 3)`, prove
`‖p(J₂(1)⊕[2])‖≤max(|p(1)|,|p(2)|)+|p′(1)|`. Prove there is no
unital algebraic U calculus for J₂(0) whenever U contains a function s
with s² equal to the coordinate. In particular √x on [0,1] gives this
obstruction: its image would be a square root of J₂(0), which no 2×2
complex matrix has by Cayley–Hamilton. No continuity assumption is needed.

For a complex Banach algebra element a, assume `z·1−a` is invertible for every
|z|>1 and `‖(z·1−a)⁻¹‖≤C/|z−1|`, with C>0. Prove the Tadmor–Ritt power bound
`∀ n, ‖a^n‖≤3C²`. First derive, for R>1, the integration-by-parts identity
`a^n=(2πi(n+1))⁻¹∮_{|z|=R} z^(n+1)(z·1−a)⁻² dz` from A2's calculus and
resolvent derivative. Compute
`∫₀^{2π}|R exp(iθ)−1|⁻² dθ=2π/(R²−1)` using the Poisson kernel or the
absolutely convergent geometric Fourier series. This gives the bound
`C² R^(n+2)/((n+1)(R²−1))`; choose R=1+1/(n+1).
Verify the elementary inequality for that radius giving `3C²`, with
the zero algebra treated separately and `C≥‖1‖≥1` derived in the
nonzero case from the resolvent estimate at infinity. For a bounded invertible S, prove
that `SaS⁻¹` has Ritt constant at most `C‖S‖‖S⁻¹‖` and power bound
`3C²‖S‖‖S⁻¹‖`. For bounded operators and a closed invariant subspace,
prove the restricted resolvent for |z|>1 is the restriction of the ambient
resolvent: first use the power bound to sum its Neumann series. Deduce
the same Ritt constant and power bound for the restriction. Distinguish the condition with denominator |z−1| from the
Kreiss condition with denominator |z|−1; do not use the former conclusion
under the latter hypothesis on an arbitrary Banach space.

## A3. Characters and examples

For every nonempty compact K⊆ℂ choose a sequence dense in K and
construct the bounded diagonal operator on ℓ² with those entries.
Prove its spectrum is their closure: outside that closure the diagonal
inverse is uniformly bounded, and points in the closure have unit
approximate eigenvectors. Thus every such K is a Hilbert-operator
spectrum. On an arbitrary infinite-dimensional Hilbert space choose a
countable orthogonal summand and put one fixed K-value on its complement;
prove the same spectrum using the finite direct-sum inverse theorem.

Use `WeakDual.characterSpace ℂ A` for nonzero continuous multiplicative
functionals. Reuse automatic continuity and norm bounds for unital scalar
characters, unital character-space compactness and `gelfandTransform`.
Extend these constructions to nonunital algebras and identify character
kernels with maximal modular ideals in a commutative Banach algebra.
The Gelfand transform's kernel is the radical;
its supremum norm is the spectral radius. On ℂ with the scaled algebra
norm ‖z‖=2|z|, prove the unique character and Gelfand transform have
operator norm 1/2 and ‖1‖=2; do not replace the character bound with
norm-one equality when the identity norm is unnormalized. The character space is locally
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

For unital commutative complex Banach algebras and a unital complex-algebra
homomorphism Φ:A→B, construct the character pullback `Φ*:B̂→Â`,
`Φ*(χ)=χ∘Φ`, on the native character spaces. Scalar automatic continuity
makes this a character even without assuming Φ continuous; evaluation at
Φ(a) proves weak-star continuity of Φ*. Prove identity and contravariant
composition laws and Gelfand naturality `Γ_B(Φ(a))=Γ_A(a)∘Φ*`.
Compare the star-homomorphism specialization with native
`WeakDual.CharacterSpace.compContinuousMap` and its functoriality lemmas.
Dense range of Φ implies injectivity of Φ*. If Φ is continuous, has dense
range, and `GL(B)∩Φ(A)=Φ(GL(A))`, prove its image is precisely
`{χ∈Â : ker Φ⊆ker χ}`, and hence it is a homeomorphism onto this hull.
For surjectivity, a character killing ker Φ factors through Φ(A); the
inverse-lifting hypothesis gives `χ(a)∈σ_B(Φ(a))`, hence
`|χ(a)|≤‖Φ(a)‖`, so this factor extends uniquely to B. Use only the scalar
character and spectrum theory above; A5's general automatic-continuity
results are downstream. This is Pedersen §4.2, Exercises11–12, with unital
maps so pullback cannot be zero.

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
* For `u(x)=exp(ix)` in `C_b(ℝ,ℂ)`, distinguish the algebraic unital
  star-subalgebra `A_alg` generated by `C₀(ℝ,ℂ)` and u from its supremum-norm
  closure A. Prove the unique decompositions `A_alg=C₀(ℝ)+ℂ[u,u⁻¹]` and
  `A=C₀(ℝ)+{h∘u:h∈C(𝕋,ℂ)}`, with zero intersections between the two
  summands in each case, and identify the quotients by the common closed ideal
  C₀ with the Laurent polynomial algebra and C(𝕋), respectively. The algebraic
  sum is not complete; prove the completed sum is closed by showing that the
  periodic summand embeds isometrically into `C_b(ℝ)/C₀(ℝ)`.
  Classify A's characters as evaluations at x∈ℝ and the boundary characters
  `f+h∘u↦h(ζ)` for ζ∈𝕋. Give their pointwise-evaluation topology by the compact
  Hausdorff model
  `Y={(x,u(x)):x∈ℝ} ∪ ({∞}×𝕋) ⊆ OnePoint(ℝ)×𝕋`, where OnePoint(ℝ) has its
  one-point compactification topology. Prove Y is closed, ℝ is open and dense
  in Y, and the Gelfand transform is the explicit isometric star-algebra
  isomorphism A≃C(Y,ℂ). For nets in the evaluation copy of ℝ, prove convergence
  to boundary ζ exactly when the net eventually leaves every compact subset
  of ℝ and u(x)→ζ. Thus the boundary circle does not have a disjoint-union
  topology. Prove instead that all unital complex-algebra homomorphisms
  `A_alg→ℂ`, without a continuity or star assumption, are evaluations at real x
  and `f+p(u)↦p(λ)` for λ∈ℂˣ. Show every algebraic maximal ideal is one of these
  kernels, using the maximal modular ideals of C₀ for ideals not containing it.
  Their pointwise-evaluation topology is
  `Y_alg={(x,u(x)):x∈ℝ} ∪ ({∞}×ℂˣ) ⊆ OnePoint(ℝ)×ℂˣ`.
  Prove the boundary character is bounded, equivalently star-preserving,
  exactly when |λ|=1; these and the real evaluations extend uniquely to A.
  Identify the bounded-character subspace of Y_alg with Y. Use Laurent powers
  and their unit supremum norms to witness unboundedness off the circle;
  distinguish this pointwise topology from the Zariski topology on ideals.
* The disk algebra, with supremum norm on the closed unit disk and holomorphy
  in its interior: characters are evaluations on the closed disk. Show its
  inclusion into the continuous functions on the boundary is not inverse
  closed, using the coordinate function.
* For any discrete group G, `ℓ¹(G)=lp (fun _ : G ↦ ℂ) 1` with
  convolution: construct the absolutely summable convolution, norm bound,
  associativity, point-mass unit and the point-mass multiplication law.
  For G=ℤ this is the Wiener algebra: identify its Gelfand transform
  with the absolutely convergent Fourier series on the circle. Prove Wiener's
  inversion theorem, including the convolution and transform comparisons.
* `C¹([0,1],ℂ)` with norm `‖f‖∞+‖f'‖∞`: evaluations and nonzero bounded point
  derivations `f ↦ f'(t)` into the scalar evaluation bimodule. Derivatives at
  endpoints are the continuous extensions of the interior derivative.
* The Volterra algebra `L¹([0,1])` with truncated convolution
  `(f*g)(s)=∫₀ˢ f(s-t)g(t) dt`: completeness, the norm inequality,
  a bounded approximate identity, and radicality. The constant function one
  has convolution powers of `L¹` norm `1/n!` for `n≥1` and is not nilpotent.
* Finite matrix algebras and upper triangular matrix algebras: compute their
  radicals and give a nonzero nilpotent matrix in a semisimple algebra.

For the Volterra operator V on native `MeasureTheory.Lp ℂ 2
(volume.restrict (Set.Icc (0:ℝ) 1))`, construct
`(Vf)(x)=∫₀ˣ f(t)dt` on almost-everywhere classes. Prove boundedness, the
iterated-kernel formula, `‖V^n‖≤1/n!` and
`‖V^n‖≥1/(n!√(2n+1))` by applying it to the constant function 1.
Use native `Algebra.elemental ℂ V` for the operator-norm closed unital
algebra generated by V, consuming its closedness, commutativity and
completeness. Prove injectivity of `p↦p(V)` and `|p(0)|≤‖p(V)‖`, then
extend polynomial constant terms to its unique bounded character. Prove
its spectrum for V
is {0} using the convergent inverse series at every nonzero scalar, and
identify `rad A=closure(V·ℂ[V])`. Build the bounded truncated-convolution
operator for every L¹ kernel, with Young's inequality and polynomial-kernel
approximation, and prove these convolution operators lie in that closed ideal;
the operator-norm closure is the definition of the whole ideal.
For k(t)=|t−1/2|, its convolution operator lies in this ideal, but is not a
power series in V with zero constant term whose sequential partial sums
converge in operator norm: terms then tend to zero, and the lower bound
on ‖V^n‖ implies that its action on 1 is analytic on (0,1), whereas
`∫₀ˣ|t−1/2|dt` is not twice differentiable at 1/2.

For c₀(S), prove coordinatewise square-root factorization `c₀(S)²=c₀(S)`.
Every maximal proper ℂ-linear ideal is modular, closed and an evaluation
kernel. Retain scalar closure in the nonunital ideal carrier; arbitrary
ring ideals need not be ℂ-linear.
For infinite S the dense proper ideal of finite-support functions lies in no
maximal ideal. Prove these claims before using a maximal-ideal existence
argument in a nonunital algebra.

For S=ℕ, define the even-support ideal by requiring only finitely many
even coordinates to be nonzero. Prove it is a ℂ-linear ideal strictly
between c₀₀ and c₀. Construct the algebraic quotient c₀/c₀₀ with its
quotient topology, prove that topology is indiscrete, and prove the
quotient has no identity. For the last assertion, any proposed representative
u tends to zero; choose an infinite-support x∈c₀ on coordinates where
|u|<1/2, so ux−x is not finitely supported. The separated quotient is
zero; do not identify it with the nonzero algebraic quotient.

Construct H∞(Ω) for any nonempty open Ω⊆ℂ as the bounded holomorphic
functions with supremum norm: use native bounded continuous functions,
prove closedness under uniform limits, completeness and the unital
Banach-algebra operations. For the disk algebra prove the coordinate
has spectrum the entire closed unit disk.

For K={0}∪{1/n:n≥1}, construct the native `ContinuousMap K ℂ`
isometric algebra equivalence with
`c={a : ℕ→ᵇℂ // ∃ L, Tendsto a atTop (𝓝 L)}`, with pointwise
operations and inherited supremum norm,
including the value at 0 as the sequence limit. The sequence a_n=1/(n+1), n∈ℕ,
has spectrum K and its C(K) calculus is evaluation at these points.
In ℓ∞ the bounded-function calculus f↦(f(1/n)) is noninjective because
the value at 0 is discarded; alternating values on 1/n give a bounded
function that cannot define a c-valued calculus. Compute row/column
operator norms 6, eigenvalues 4,2,−4,2 and Hilbert operator norm 4 for
`[[1,2,−1,2],[2,1,2,−1],[−1,2,1,2],[2,−1,2,1]]`, with explicit
eigenvectors and the comparisons of its three induced norms.

Identify A3's C¹ pair carrier with A2's r=1 derivative-tuple carrier
by a bounded algebra equivalence preserving evaluations, derivative
and the common norm. Use the general tuple API for its basic calculus.

### Absolutely continuous functions and their operator calculus

Construct AC[0,1] on the carrier `(c,g)∈ℂ×Lp(ℂ,1,μ)` with
`μ=volume.restrict(Icc 0 1)` and associated continuous function
`f(x)=c+∫₀ˣg(t)dt`. Prove representative independence, uniqueness of
the a.e. derivative, the fundamental theorem in both directions, and
bounded evaluation into C([0,1],ℂ). Compare this carrier with native
`AbsolutelyContinuousOnInterval f 0 1`, using constant extension of f
outside the interval, and prove the real/imaginary-part equivalence. Consume
native `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`,
`AbsolutelyContinuousOnInterval.intervalIntegrable_deriv` and `AbsolutelyContinuousOnInterval.integral_deriv_mul_eq_sub` and the real
integration-by-parts identities, then combine their real/imaginary instances;
only the complex/Lp/representative comparison is new here. Prove the exact
ε–δ disjoint-interval criterion through native `absolutelyContinuousOnInterval_iff`.
For a real continuous f on [0,1], prove that the swapped-tolerance
condition `∀ ε>0, ∃ C≥0, ∀ finite disjoint intervals,
Σ lengths<ε → Σ |f(v_i)−f(u_i)|≤C` is equivalent to
`BoundedVariationOn f (Icc 0 1)`: split arbitrary partitions into
finitely many short-length collections for the reverse implication.
Contrast this finite variation bound with the native AC requirement
that an arbitrarily prescribed image variation is controlled by a
sufficiently small total domain length.
Pin multiplication by
`(c,g)(d,h)=(cd, f·h+k·g)`, where k is the function associated to
(d,h). Prove the Leibniz formula, associativity and unit. Use
`‖f‖AC,0=|f(0)|+‖f′‖₁`, the native sum norm transported from
`WithLp 1 (ℂ×Lp ℂ 1 μ)`. Prove submultiplicativity using the two
triangular Fubini integrals, and completeness. Compare the equivalent
submultiplicative norm `‖f‖∞+‖f′‖₁`, with
`‖f‖AC,0≤‖f‖∞+‖f′‖₁≤2‖f‖AC,0`. Construct polynomial
approximation by approximating g in L¹ and integrating, and prove the
character space is [0,1] by evaluating the coordinate and using density.
For a nowhere-zero f prove inverse-closedness with derivative −f′/f²,
using the positive lower bound of |f| on the compact interval and the
native AC product/chain comparison. Prove the sup-norm bound for any nonzero
complex-linear multiplicative character on an inverse-closed unital function
subalgebra, then apply it here. Identify the AC Gelfand transform with its
proper dense inclusion in C([0,1],ℂ). Construct the Cantor function as a
bounded-variation, non-AC example with derivative zero a.e. but distinct
endpoint values; a.e. differentiability alone does not replace the native
AC condition.
Also construct a continuous nowhere-differentiable real function on [0,1],
using an explicit Takagi series of scaled distance-to-integer tent functions.
Prove uniform convergence, continuity and failure of a finite derivative at
every interior point from the dyadic difference quotients, with one-sided
endpoint statements. Using native a.e. differentiability of bounded-variation
functions, deduce this Takagi function is not BV, hence not AC. It supplies
the distinct non-AC example;
it is not identified with the Cantor function.
For every real a<b construct AC[a,b] and transport its algebra,
FTC, weak-derivative and completeness API from AC[0,1] by the positive
affine coordinate map. For both |f(a)|+∫_a^b|f′| and the
sup-plus-L¹-derivative norm prove this transport is isometric and
carry the preceding norm comparison to [a,b].

Prove AC[0,1] is not isomorphic to C([0,1],ℂ) as a Banach algebra:
an isomorphism induces a character-space homeomorphism, hence would make
every continuous function absolutely continuous after a homeomorphic
change of variable. Exhibit a continuous function of infinite total
variation and use invariance of that variation under interval
homeomorphisms.

On `Lp ℂ 1 μ` construct V by indefinite integration and M_x by
coordinate multiplication, and put T=M_x+V. Define the bounded unital
algebra calculus by
`(Ψ(f)h)(x)=f(x)h(x)+f′(x)∫₀ˣh(t)dt` a.e.
Prove representative independence and
`‖Ψ(f)‖≤essSup_t(|f(t)|+∫_t^1|f′(x)|dx)≤‖f‖AC,0`.
Use integration by parts to prove multiplicativity and agreement with
polynomials, then polynomial density for uniqueness. In particular
`T²h=x²h+2x∫₀ˣh`, fixing the order of the derivative and Volterra
operator in the formula. Construct normalized approximate eigenvectors supported
in shrinking intervals, with zero integral so V vanishes outside their
support and `‖Vh‖₁≤|supp h|‖h‖₁→0`, to prove `spectrum ℂ T=[0,1]`, including both
endpoints. Prove Ψ is injective and has spectral mapping
`spectrum ℂ (Ψ(f))=f([0,1])`, by approximation for the lower inclusion
and by Ψ(1/(f−λ)) for the upper inclusion. Show this calculus has no
bounded unital extension from C([0,1],ℂ): for
`f_n(x)=exp(2πinx)`, apply Ψ(f_n) to the constant function 1 and prove
`‖Ψ(f_n)‖≥πn−1` while `‖f_n‖∞=1`.

For bounded operators on a complex Banach space define point spectrum
by nonzero eigenvectors and approximate-point spectrum by unit vectors
whose residual norm tends to zero. Prove the latter is equivalent to
failure of a positive lower bound for T−λI, contains point spectrum,
is contained in spectrum, and contains the boundary of spectrum via
the resolvent norm and normalized approximate eigenvectors. Include the
zero-space case and distinguish surjectivity from being bounded below.
For the forward shift S on native ℓ²(ℕ), prove σ(S)=σ(S†) is the
closed unit disk: outside use the norm-Neumann inverse, inside use the
backward-shift eigenvectors `(1,λ,λ²,…)` and adjoint spectral transport,
and obtain the boundary by closedness. Prove the corresponding finite
first n+1-coordinate compressions are nilpotent with spectrum {0}; identify
the superdiagonal matrix `T_(i,j)=1` when j=i+1 and0 otherwise as S†. For a
finite topological direct sum of Banach spaces prove the block-diagonal
spectrum is the union of the component spectra by explicit inverse maps.
Prove σ_p(S)=∅, σ_p(S†) is the open disk, and σ_ap(S) is the unit
circle; define the approximate-point spectrum by unit approximate
eigenvectors, prove σ_p⊆σ_ap⊆σ and compute σ_ap(S†) as the closed disk.
Use matrix entries T_(i,j)=⟪e_i,T e_j⟫, matching Toeplitz's i−j convention
with the inner product conjugate-linear in its first slot.
ToeplitzOperators T3 instantiates this finite Banach direct-sum
spectrum/inverse theorem on its Hilbert-product carrier.
Strong convergence of finite sections does not imply spectral continuity;
ToeplitzOperators T5 owns finite-section stability. It owns the Hardy/shift-algebra
theorems, rather than this elementary Banach spectral comparison.
On ℓ∞ consume [BanachSpaceTheory B1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/15588952fdc156cbddda2c00f896851c90d93670/TauCetiRoadmap/BanachSpaceTheory/README.md#b1-duality-and-weak-topologies)'s norm-one functional φ
annihilating c₀ with φ(1)=1. The nonzero rank-one map x↦φ(x)e₀ has
T e_j=0 for every standard unit vector, so its coordinate matrix is zero.
Prove it cannot be represented by the corresponding coordinate-series
matrix formula on all ℓ∞; finite basis-vector data do not determine an
operator on this space.

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

**A4.DoubleCentralizers.** Consume native
[`DoubleCentralizer`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/CStarAlgebra/Multiplier.html#DoubleCentralizer)
`𝓜(ℂ,A)`, its bounded-linear components, algebra operations, norm
`max(‖S‖,‖T‖)` and completeness for a Banach algebra A.
For A with zero left and right annihilators, identify this native model
with the complex-linear pairs satisfying
`S(ab)=S(a)b`, `T(ab)=aT(b)` and `aS(b)=T(a)b`.
Prove that algebraic complex-linear pairs satisfying these identities
are automatically bounded by the closed graph theorem: a graph limit
of S at zero is annihilated on the left, and a graph limit of T at zero
is annihilated on the right. A two-sided approximate identity suffices
to make both annihilators zero; completeness of A and these annihilator
hypotheses are explicit in the automatic-boundedness assertion.
For bounded pairs under these hypotheses, the native centrality equation
implies the two module identities. Reuse the native operations to give
`(S,T)(S',T')=(SS',T'T)`, identity `(id,id)` and
`a↦(L_a,R_a)`; prove the latter is a homomorphism onto a closed
two-sided ideal when A has a bounded two-sided approximate identity.

If the approximate identity is contractive, prove
`‖S‖=‖T‖`, `‖L_a‖=‖R_a‖=‖a‖`, and that this embedding is
isometric. Its image is essential in the annihilator sense: a multiplier
annihilating A on either side is zero. For a bound `C>0` rather than one,
retain `‖a‖/C≤max(‖L_a‖,‖R_a‖)≤‖a‖`, and do not claim
isometry or equality of the component norms. For isometric star on A,
consume the native involution
`(S,T)*=(a↦T(a*)*,a↦S(a*)*)`, prove compatibility with the embedding,
and retain the Banach *-algebra norm. CStarAlgebras C1 owns the additional
C*-identity, strict-topology and maximal-essential-C*-extension targets.

For a Banach space E and a bounded algebra representation
`π:A→B(E)` with `closure(span π(A)E)=E`, assume A has a two-sided
approximate identity bounded by `C>0`. Construct the unique unital bounded
representation `π̃:𝓜(ℂ,A)→B(E)` such that
`π̃(m)π(a)x=π(S_m(a))x`. Prove the finite-sum formula is well-defined,
extends by continuity, and satisfies
`‖π̃(m)‖≤C‖π‖‖m‖`; prove intertwiner compatibility and uniqueness
from the dense span. This applies to arbitrary bounded actions on E.
For a Hilbert-space *-representation of an isometric Banach *-algebra,
prove that the extension preserves star; the preceding automatic
contractivity and a contractive approximate identity give a contractive
extension. Include the zero space and zero algebra conventions.

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

**A7.ProductDomains — product topology and the Haar domain.** Before group
algebras, supply the following elementary product-space prerequisite. For an
arbitrary index type I, including the empty type, assume every X_i is nonempty,
locally compact and Hausdorff. Prove

`LocallyCompactSpace (Π i, X_i) ↔ Set.Finite {i | ¬ CompactSpace X_i}`

for the ordinary product topology. Retain the nonempty-factor hypothesis:
an empty factor makes the product empty regardless of the remaining factors.
For necessity take a compact neighborhood of a chosen product point and a
basic cylinder contained in it, with restrictions in a finite set F. For
any i outside F, its projection contains all of X_i, so that factor is compact
as the continuous image of the compact neighborhood. For sufficiency use the
canonical product homeomorphism splitting F from its complement; the first
factor is a finite product of locally compact spaces and the tail is compact
by Tychonoff. Consume native `Pi.locallyCompactSpace_of_finite`,
`Pi.locallyCompactSpace` and the compact-product API, retaining their existing
vocabulary. Prove invariance under product reindexing and homeomorphisms of
the factors; no countability or sequence hypothesis is imposed.

In particular prove `LocallyCompactSpace (I → ℝ) ↔ Finite I` and hence
ℝ^ℕ with its product topology is not locally compact. Native compact-product
instances give compactness of Circle^I, and existing finite-product instances
give the usual ℝⁿ/Circleⁿ locally compact models. These statements distinguish
the domains to which the Haar/group-algebra construction below applies.

Use the native additive compact group `(ℕ → ZMod 2)` with the product topology.
Compose `cantorSetHomeomorphNatToBool` with the coordinatewise finite-discrete
homeomorphism Bool→ZMod2, false↦0 and true↦1, to construct the homeomorphism
from the standard real Cantor set onto that group. Pin its digit formula and
both inverse maps: for the representatives b_n∈{0,1} of the ZMod2 coordinates,
the real inverse is `Σ_n 2b_n/3^(n+1)`. Thus the binary group values0,1 correspond
to ternary Cantor digits0,2. Match this series with native base-3 `ofDigits`.
Transport the coordinate addition through this homeomorphism
and prove it is digitwise XOR, with zero the all-zero digit sequence and every
element its own inverse. Prove continuity with the inherited Cantor-set topology;
this transported law is distinct from ambient real addition. These are Conway,
*A Course in Functional Analysis*, second edition, VII.9's opening product
examples. [ProductDomainTargets.lean](ProductDomainTargets.lean) illustrates
the general criterion, real-power case and exact binary-coordinate comparison.

Let `G` be locally compact Hausdorff and `μ` a nonzero regular left Haar measure.
There is no standing second-countability or sigma-finiteness assumption. Use
the AmenableGroups Layer 7 construction of scalar convolution, its
sigma-compact-support and Baire-representative measurability comparisons. Extend these to complex `L¹(G,μ)` and establish
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

Every nonzero algebraic complex-linear multiplicative functional on
L¹(G) is automatically bounded and has operator norm one. Deduce
boundedness from A3's scalar unitization bounds; for the norm equality,
choose f with χ(f)≠0 and use χ(u_U*f)→χ(f), hence χ(u_U)→1,
together with ‖u_U‖₁=1. This applies to the nonunital group algebra
itself; it adds no augmentation character.

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
[SmoothBanachRepresentations SB0–SB1](../RepresentationTheory/SmoothBanachRepresentations/README.md)
owns compact-support integration for arbitrary strong Banach Lie-group actions
using support-dependent local operator bounds, and compares its integral with
this L¹ action when the present global uniform bound holds. Its Lie-smooth
kernels and finite-sum factorization are not prerequisites of this L¹ correspondence.

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

**A7.MeasureMultipliers.** Prove that L¹(G) is essential in M(G):
`ν*L¹(G)=0` implies ν=0, and likewise `L¹(G)*ν=0` implies ν=0.
With A7.ChosenApproximateIdentity's integral-one kernels u_U, prove
`ν*u_U→ν` and `u_U*ν→ν` against every C₀(G) test function.
Use these weak-star limits to prove both annihilator assertions;
nonvanishing at a single point of an L¹ representative does not establish
nonvanishing of its almost-everywhere class.

Prove Wendel's multiplier theorem as the isometric star-algebra
isomorphism `M(G)≃𝓜(ℂ,L¹(G))` sending ν to
`(f↦ν*f,f↦f*ν)`. Prove both components have operator norm `‖ν‖`
and identify L¹'s canonical measure embedding with A4's multiplier
embedding. Establish also the one-sided versions: every bounded left
centralizer `S(f*h)=S(f)*h` is uniquely left convolution by a finite
regular complex measure, and every bounded right centralizer is uniquely
right convolution. For surjectivity take a weak-star cluster subnet of
`S(u_U)` in `C₀(G)*`, use its uniform norm bound and regular-measure
representation, and prove the resulting convolution identity on L¹;
the right-handed construction is analogous. A4's automatic-boundedness
comparison then identifies algebraic double-centralizer pairs as well.
Give the inverse, norm identities, multiplication and involution
compatibility on these actual carriers, at the standing arbitrary locally
compact Hausdorff generality and without a global sigma-finiteness
assumption.

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

For uniqueness consume [V11](https://github.com/TauCetiProject/TauCetiRoadmap/blob/160687f3131efb1b7b37fb6008a842b98815069c/TauCetiRoadmap/VonNeumannAlgebras/README.md#v11-weights-connes-invariants-and-continuous-cores)'s inversion-free **closed topological
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

**A7.StandardDuals.** Construct the topological group isomorphism
`Multiplicative ℝ ≃ₜ* PontryaginDual (Multiplicative ℝ)` sending y to
`γ_y(x)=Circle.exp (x*y)`. For surjectivity, compose a circle-valued
character with native `Circle.toUnits` and use Tau Ceti's
`existsUnique_eq_expUnitHom_complex`; unit modulus forces the real part of
the complex exponential parameter to vanish. Prove uniqueness and both
topological directions, including recovery of y from compact-uniform
convergence of characters. One inverse-continuity test uses
`[-π/ε,π/ε]`: if `|y-y₀|≥ε>0`, evaluation at `π/(y-y₀)` separates
these characters by complex distance 2. This calculation uses no
Fourier inversion or double-dual surjectivity. With Lebesgue Haar measure,
compare `∫f(x)exp(-i*x*y)dx` with A7's positive-character transform at
`γ_(-y)`. Its kernel is Mathlib's `fourierChar (-x*y/(2π))`; the native
Fourier integral already inserts the minus sign, so its frequency is
`y/(2π)`.

Reuse Tau Ceti's `circleEquivPontryaginDualInt` for the topological group
isomorphism `Circle ≃ₜ* PontryaginDual (Multiplicative ℤ)`, whose
character at a is `n↦a^n`. For counting Haar measure, identify the
inverse-character transform with the absolutely convergent series
`Σ' n:ℤ, f(n)*a^(-n)` and its positive-character counterpart at `a⁻¹`.
For the circle's dual use Tau Ceti's `fourierPontryaginDualEquiv` on
`AddCircle (2*π)`, transport along native `AddCircle.homeomorphCircle`,
and prove the transported formula is `z↦z^n`. Transport native
`AddCircle.haarAddCircle`, whose total mass is one, to normalized Haar
measure on `Circle`. Use `fourierCoeff_eq_intervalIntegral` to prove
the inverse-character coefficient is
`(1/(2π))∫ θ in 0..2π, f(Circle.exp θ)*exp(-i*n*θ)dθ`.
Upgrade the algebraic
equivalence to a topological one using Mathlib's discrete-dual instance.
Reuse Mathlib's compact-dual-of-discrete and discrete-dual-of-compact
instances at arbitrary cardinality, with the same compact-open topology.
These standard-dual calculations precede the following unitized-circle
example and consume the earlier character correspondence, not uniqueness.

For normalized Haar measure on native `Circle`, identify the dual with
discrete ℤ and the unitized character space with native `OnePoint ℤ`, transform values
`fhat(n)+λ` and λ at infinity, and unitized spectrum
`{0}∪{fhat(n):n∈ℤ}` for f∈L¹. Give an explicit bijection
ℤ≃ℕ and use it to construct a homeomorphism
`OnePoint ℤ≃{0}∪{1/(m+1):m∈ℕ}`, mapping infinity to 0;
prove continuity in both directions from the cofinite neighbourhoods. Pin fhat(n)=∫f(z)z^n dμ to the above
convention and compare the opposite-sign Fourier convention explicitly.
Prove injectivity and failure of surjectivity L¹(circle)→c₀(ℤ): an inverse
bound would bound the L¹ norms of the Dirichlet kernels, whereas those norms
grow at least c log N for a fixed c>0. Build that elementary kernel estimate
here, using sums of exponentials and the sine quotient. For the convolution
unit, Dirac mass belongs to M(G), and belongs to L¹ only in the discrete case.

Use the invariant mean of AmenableGroups Layer 1 as the definition of group
amenability. Build the affine fixed-point comparison: a locally compact group is
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

## A8. Compact operators, transitive algebras and invariant subspaces

This layer uses A2’s contour calculus, native compact-operator APIs and
AlgebraicTopology’s finite-span Brouwer theorem; it does not use
BanachSpaceTheory B4’s approximation-property or tensor targets.
Use `IsCompactOperator`, `Module.End.invtSubmodule` and closed `Submodule ℂ E`
for bounded operators on a complex Banach space E. The initial compact
kernel/range/eigenvalue-threshold and transitive compact-commutation
sublanes are stated over RCLike fields,
including ℝ; contour and complex hyperinvariance comparisons specialize to ℂ.
Consume Mathlib's compact
operator ideal API, Tau Ceti's finite-dimensional eigenspace/range/cokernel
theorems in `Analysis/Normed/Operator/Compact`, and Mathlib's
`IsCompactOperator.hasEigenvalue_or_mem_resolventSet` and
`IsCompactOperator.hasEigenvalue_iff_mem_spectrum`. Construct the Riesz
decomposition for each nonzero spectral λ: for sufficiently large k, the
closed finite-dimensional kernel of `(T−λ)^k` and closed range of
`(T−λ)^k` are complementary, with stable ascent/descent, bounded coordinate
projections commuting with T, nilpotent restriction on the first summand
and invertible `T−λ` on the second. Relate it to A2's contour projection.
Build the eigenvalue-threshold theorem over every RCLike scalar field
on a complete normed space, before the complex contour comparison: for each ε>0 there
are finitely many eigenvalues with modulus≥ε, so the nonzero spectrum is
countable with only possible accumulation point 0. For compact operators
the native Fredholm alternative identifies these with the nonzero spectrum;
in infinite dimension 0 is
in the spectrum. Use native `Module.End.eigenvectors_linearIndependent`
and `riesz_lemma` for the separated-sequence compactness argument. Keep generalized eigenspaces and closed range statements on
the native carriers. OperatorTheory/SelfAdjointSpectralTheory SA-C86 owns the Hilbert
compact-normal orthogonal decomposition, consuming these Banach results
and the native compact self-adjoint spectral theorem.

Build Schauder's compact-map fixed-point theorem on a nonempty closed bounded
convex set C in a real Banach space: a continuous f:C→C with relatively compact
range has a fixed point. Consume AlgebraicTopology Stage 2, item 7's
`brouwerFixedPoint_compactConvex_finiteSpan`, restricting to each
finite-dimensional vertex span. Construct continuous approximations with
finite-dimensional range consisting of convex combinations
on the compact closure of f(C) using finite covers and a partition of unity,
apply Brouwer on each finite convex hull, and extract approximate fixed
points using compactness of f(C). Prove the compact-convex specialization and
transport under affine homeomorphisms. Do not assume a linear finite-rank
approximation property for the Banach space; the approximations here are
nonlinear convex combinations.

Over each RCLike field 𝕜, a unital operator algebra A⊆B_𝕜(E) is transitive if closure(Ax)=E for every nonzero x;
prove equivalence with absence of nonzero proper closed A-invariant subspaces.
For any transitive unital 𝕜-subalgebra and nonzero compact K, prove
Lomonosov's lemma: there exist a∈A and x≠0 with aKx=x. Build the finite-cover
construction on a closed ball disjoint from 0, choosing algebra elements whose
images of Kx enter that ball, and combine them with continuous partitions of
unity. Apply the compact-map fixed-point theorem; the algebra element at a
fixed point is the finite scalar combination of those chosen elements.
Treat kernel points by first choosing a ball on which Kx stays away from 0.

Deduce that a nonscalar T commuting with a nonzero compact K has a nonzero
proper closed hyperinvariant subspace (invariant under every bounded operator
commuting with T). If its commutant were transitive, the lemma gives an AK
with eigenvalue 1; T preserves the finite-dimensional nonzero eigenspace,
so has an eigenvalue λ there. Its full λ-eigenspace is closed, nonzero,
proper by nonscalarity, and invariant under the commutant, a contradiction.
Use native finite-dimensional complex eigenvalue existence. For a scalar T,
give an invariant line when dim E≥2; do not claim a hyperinvariant subspace.
Include compact and polynomially compact specializations, retaining the
nonzero-polynomial and nonscalar hypotheses. If p(T)=0, obtain an
eigenvalue of the algebraic operator and its proper closed eigenspace; if
p(T)≠0, apply the compact-commutation theorem. In finite dimension at
least 2, use native eigenvalue existence; dimension 0 or 1 has no
nonzero proper subspace.

Prove the real compact-commutation invariant-subspace theorem on an
infinite-dimensional real Banach space: if T commutes with nonzero compact K,
then T has a nonzero proper closed invariant subspace. If no such subspace
existed, the unital real algebra generated by T would be transitive; the
same real Schauder argument gives A with AKx=x. Its nonzero finite-dimensional
1-eigenspace is T-invariant and proper, a contradiction. This supplies the
real Aronszajn–Smith compact case and the real Argyros–Haydon consequence;
the complex hyperinvariant conclusion remains in its complex scalar scope.

State the complex Hilbert invariant-subspace question precisely: for every
bounded T on native `lp (fun _ : ℕ=>ℂ) 2`, is there a nonzero proper
closed T-invariant subspace? It is a question, with no unconditional theorem
target. Prove reduction from arbitrary infinite-dimensional complex Hilbert
spaces by taking a cyclic closed span: if that span is proper it is already
invariant, otherwise it is separable and has an ℓ² isometric model.
Distinguish this question from Banach-space counterexamples and from the
compact-commutation theorem just proved.

## Sources and API alignment

* Rieffel, *C*-algebras* course notes, physical pages
  [26–30](../../sources/course-notes/transcripts/rieffel-main-luna-01a137d1/page-026.md)
  (positive functionals and Banach *-algebra GNS),
  [49–50](../../sources/course-notes/transcripts/rieffel-main-luna-01a137d1/page-049.md)
  and [109–111](../../sources/course-notes/transcripts/rieffel-main-luna-01a137d1/page-109.md)
  (Banach double centralizers and extensions), and
  [126–128](../../sources/course-notes/transcripts/rieffel-main-luna-01a137d1/page-126.md)
  (measure convolution and essentiality).
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

Supplementary spectral and invariant-subspace sources: Conway, *A Course in
Functional Analysis*, second edition, VII (functional calculus and examples);
[Schwenninger, *Functional calculus estimates for Tadmor–Ritt operators*](https://arxiv.org/abs/1507.00049), §1.1, for the resolvent distinction;
[Lomonosov, *Invariant subspaces for the family of operators which commute with
a completely continuous operator*](https://www.mathnet.ru/eng/faa2433),
Functional Analysis and Its Applications 7 (1973), 213–214.
