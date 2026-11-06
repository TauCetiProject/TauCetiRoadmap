# Roadmap: cyclic cohomology, spectral triples and noncommutative tori

**Summary.** Build the differential and cyclic theory of smooth operator algebras, its
Fredholm-module Chern characters and index pairings, and the spectral-triple
Hochschild-class theorem. Develop the logarithmic trace ideal and Dixmier
traces with their actual generalized-limit hypotheses. The smooth two-torus
is a complete example: its differential calculus, periodic cyclic cohomology,
Fourier spectral triple and Heisenberg-module index connect these constructions. Its end theorems are the
character index theorem of N3, the Hochschild-class theorem of N5, the torus
cyclic two-cocycle and periodic cyclic cohomology of N6 and the
Heisenberg-module index and K₀ range of N7.

## Scope and ownership

The independent N1.Tensor prefix concerns complex Hausdorff locally convex
vector spaces, the scalars of every algebra, cochain and spectral triple
below. The same construction for real locally convex spaces and the two
scalar-comparison maps between real and complex tensors, the
complexification isomorphism `(E⊗̂_(π,ℝ) F)_ℂ ≃ E_ℂ⊗̂_(π,ℂ) F_ℂ` and the
balancing quotient `E_ℝ⊗̂_(π,ℝ) F_ℝ → (E⊗̂_(π,ℂ) F)_ℝ`, are stated by
SmoothBanachRepresentations §7.2a and are not planned here.
N1.Tensor is the generic locally convex tensor supplier of the library and
uses nothing from the cyclic theory; N1.Cyclic owns the universal forms,
the cyclic and mixed complexes, the SBI sequence and periodic cyclic
cohomology; ordinary derived categories belong to the existing
homological-algebra developments.

The selected character theory is finite summability and the Dixmier-trace
Hochschild class. Entire cyclic cohomology and fixed-temperature θ-summable
characters are outside scope, as are foliations, the full local index formula,
geometric elliptic-symbol calculus and Standard Model constructions.
[IndexTheory](../IndexTheory/README.md) owns closed-manifold elliptic index
and the Atiyah–Singer theorem; no such theorem is a prerequisite for the
abstract or torus index computations here.

The general theory of adjointable and regular module
operators, the bounded transform of a regular operator on a Hilbert
C*-module and module tensor products belong to HilbertModules, which is
not an input here: N5's bounded transform of a self-adjoint operator with
compact resolvent is an instance of N5's own Borel calculus, and N7's
Heisenberg module carries its inner product and completion on Mathlib's
carriers. The trace on trace-class operators is stated in N3 for B(H)
with its canonical trace Tr; RandomMatrices §8.3 builds the trace
functional of trace-class integral operators on `L²(μ)` inside its
determinantal constructor, while N3's trace is on an arbitrary separable
H with its cyclicity on dual Schatten classes. The Schatten quasi-ideals
S_p for 0<p<1 with their p-triangle inequality, ideal bounds and
completeness, Hölder's inequality with constant one for all positive
exponents, and the weak Schatten classes, including the weak trace class
S_(1,∞), belong to NoncommutativeIntegration Layer 1, which obtains them
as the B(H) instances of tracial Lp and weak Lp; N3–N4 consume them
there. N4 owns the logarithmic ideal, the partial-sum norms of the weak
Schatten classes and the Dixmier traces. Tracial Lp spaces over a general
semifinite trace, with their measure topology, belong to
NoncommutativeIntegration as well, and von Neumann algebras, preduals and
normal functionals to VonNeumannAlgebras. N6 owns the identification of
the smooth two-torus with the smooth vectors of its gauge action, the
comparison of its rapid-decay and derivative seminorms and the spectral
invariance of `M_n(𝒜_θ)`; SmoothBanachRepresentations Layer 8 consumes
them for its torus specialization, and its generic inverse closure for
Banach-algebra actions is not an input here. The algebraic projective-module K₀,
the group K₁=`GL_∞(A)/E_∞(A)` and Whitehead's lemma belong to
AlgebraicKTheory; N2 states its pairings on idempotents and invertibles
and proves the relations those groups impose, so the pairings descend to
them there by quotient.

## Conventions

Algebras are complex. The algebraic cyclic theory begins for associative
unital algebras, with nonunital algebras handled by forced unitization and
relative complexes; analytic statements use continuous cochains on complete Hausdorff
locally convex algebras, and smooth dense Fréchet star subalgebras of
C*-algebras. A Fréchet algebra has a complete metrizable locally convex
complex topology with continuous multiplication; its inclusion into the
C*-algebra is injective, continuous and dense. Spectral-invariance and
summability hypotheses are stated separately. Spectral triples here have
separable complex Hilbert space, a self-adjoint densely defined closed D,
compact resolvent and bounded commutators on the specified smooth algebra.

Hilbert products conjugate the first variable. The integer Fredholm index is
kernel dimension minus cokernel dimension. Even grading γ has γ*=γ, γ²=1,
commutes with the representation and anticommutes with F or D; the even
compression goes from the positive to the negative grading. Odd compression
uses `P=(1+F)/2`, and its index is `ind(Pπ(u)P)`. Fix
`√(2i)=1+i` in the odd cyclic pairing and character constants.
Operators multiply in composition order, with the rightmost acting first.
Universal forms have degree one differential and Koszul signs.

Representations of bounded Fredholm modules can be nonunital. Normalize
their compact defects by the doubling construction in N3 before extending
to the forced unitization by `π̃(a,λ)=π(a)+λI`; use relative cyclic/K
classes for nonunital algebras. For a unital algebra represented nonunitally,
the even unit pairing compresses to π(1)H, and the odd unitary is represented
by `π(u)+I−π(1)`. The doubled, unitized cycle defines the index map;
prove agreement with the original compression wherever that compression
is already Fredholm. A compact defect relative to π(A) alone does not
define a compression index on every unitization class.
Full cyclic cochains and the normalized Hochschild mixed complex have the
same cyclic cohomology; normalization removes degeneracies, not the
degree-zero scalar cochain or its even periodicity images.
For unital A the Hochschild and mixed complexes are those of A itself.
For nonunital A use the kernel of restriction from the cochain complexes
of A⁺ to those of ℂ along its scalar-unit inclusion; the algebra
augmentation supplies a splitting in the contravariant direction.
The SBI assertion concerns this relative Hochschild theory. No
H-unitality or comparison with the naive nonunital bar complex is assumed.

## Exact supplier contracts

### From Mathlib

Hilbert C*-modules are Mathlib's `CStarModule`, and `L²(A,τ)` with its
left regular representation is Mathlib's `PositiveLinearMap.GNS` with
`gnsStarAlgHom`. Cochains are native `MultilinearMap` and continuous
multilinear maps; Mathlib `Derivation` serves the commutative
specialization; complexes use `ChainComplex`/`CochainComplex` with their
kernels, quotients and cohomology APIs. Fredholm theory is
`ContinuousLinearMap.IsFredholm`, `ContinuousLinearMap.FredholmPackage`
and `IsFredholm.index_comp`, with the native integer index through
OperatorKTheory K4; closed operator domains are never replaced by total
linear maps, nor Fredholmness by an opaque extra predicate. N1.Tensor
consumes `TensorProduct`, `Seminorm`, `WithSeminorms`,
`UniformSpace.Completion` and `PiTensorProduct`; N2 `Matrix.GeneralLinearGroup`
and `Matrix.transvection`; N5 `LinearPMap` closed operators and the compact
self-adjoint spectral theorem.

### From Tau Ceti

For noncommutative endomorphism-valued derivations consume Tau Ceti's
existing `derivationLieAlgebra ℂ A`, the Lie subalgebra of native
`Module.End` with the associative Leibniz rule; the A-bimodule-valued
universal-derivation comparison is constructed in N1.Cyclic using
commuting left/right actions.

### From TauCetiRoadmap roadmaps

| Supplier | Interface consumed here |
| --- | --- |
| [BanachAlgebras A1–A4,A6](../BanachAlgebras/README.md) | Banach-valued holomorphic calculus, spectra, bounded Hochschild cochains and the A4 dual-bimodule convention. N1 owns its resolution comparisons. |
| [CStarAlgebras C1–C5](../CStarAlgebras/README.md) | C*-ideals, matrices and the comparison with the existing continuous functional calculus. Representations are native star homomorphisms into bounded operators. |
| [OperatorTheory/SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md) | Native `LinearPMap` closed operators, adjoints, spectral calculus and graph norms. N5 constructs the compact-resolvent/summability consequences. |
| [OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md) | Compact operators, singular values with their mixed-index sum and product inequalities (OI-A17, OI-A22), the two-sided ideal inequality (OI-A20) and adjoint invariance `aₙ(T†)=aₙ(T)` (OI-A30), Schatten spaces S_p for 1≤p≤∞ and the trace-class norm. N3 adds the trace functional and its cyclicity; N4 the logarithmic ideal, the partial-sum norms of the weak Schatten classes and singular traces. |
| [NoncommutativeIntegration Layer 1](../NoncommutativeIntegration/README.md) | On B(H) with its trace Tr, whose generalized singular numbers are the approximation numbers `a_⌊t⌋`, equal to OperatorIdeals' μ_⌊t⌋ on compact operators (§1.5): the Schatten quasi-ideals S_p for 0<p<1 as Lp(B(H),Tr), with `‖T‖_p=(Σ_j μ_j(T)^p)^(1/p)`, the p-triangle inequality, the ideal bounds `‖ATB‖_p≤‖A‖‖T‖_p‖B‖`, adjoint invariance and completeness of the p-metric (§1.3, §1.5); Hölder's inequality `‖ST‖_r≤‖S‖_p‖T‖_q` with constant one for p,q>0, 1/r=1/p+1/q (§1.4); the weak Schatten classes `sup_(j≥0)(j+1)^(1/p)μ_j(T)<∞` with their quasi-norm, adjoint and ideal estimates, and the weak trace class S_(1,∞) at p=1 (§1.6). N3–N4 consume these and do not rebuild them. |
| [BanachSpaceTheory B4](../BanachSpaceTheory/README.md) | The complex completed Banach projective tensor and its universal property, consumed by N1.Tensor; the Schmidt series `Tx=Σ_j s_j⟨e_j,x⟩f_j` of a compact operator with `s_j=μ_j(T)`, consumed by N3's trace. |
| [OperatorKTheory K1–K7](../OperatorKTheory/README.md) | Idempotent/unitary K-theory, inverse-closed Fréchet comparison (K3), native Fredholm/Atkinson theory (K4), Hilbert-space KK cycles and their index products. K7 owns all real-parameter rotation C*-presentations and the irrational K-group computation. |
| [OperatorAlgebraDynamics D1–D2,D4](../OperatorAlgebraDynamics/README.md) | Rotation crossed products, Fourier coefficient maps and the dual circle action. N6 constructs the two-torus gauge action. |

## How to read the build

N1 builds the completed locally convex projective tensors (N1.Tensor) and
the universal forms, cyclic complexes, SBI sequence and periodic cyclic
cohomology (N1.Cyclic). N2 pairs cyclic cocycles with idempotents and
invertibles and calibrates the pairing constants. N3 builds bounded
Fredholm modules, the trace on B(H), and the finitely summable character
with its index theorem, on the Schatten quasi-ideals and Hölder inequality
of NoncommutativeIntegration Layer 1. N4 builds the logarithmic ideal, the
partial-sum norms of the weak Schatten ideals, generalized limits and
Dixmier traces. N5
builds spectral triples, their eigenbasis calculus and bounded transform,
and the Hochschild-class theorem. N6 builds the smooth noncommutative
two-torus, its differential calculus and its cyclic cohomology, and N7 its
Fourier spectral triple, Heisenberg module and index computations. Each
section ends with its examples and with the sections and suppliers it
needs; the sections are cited as N1–N7.

## N1. Universal differential forms and cyclic complexes

### N1.Tensor. Completed locally convex projective tensors

This is the generic locally convex tensor supplier of the library; it
uses nothing from the cyclic theory below. Work over ℂ on complex
Hausdorff locally convex spaces E,F. Use the actual
algebraic `TensorProduct ℂ E F`, `Seminorm`, `WithSeminorms`, separated
quotient and `UniformSpace.Completion`, without assigning a fictitious
norm to a nonnormable space. For continuous seminorms p,q construct
`π_(p,q)(t)=inf_(t=Σx_i⊗y_i)Σp(x_i)q(y_i)`, prove the seminorm laws,
and equip the algebraic tensor with the topology generated by this
family. Construct its separated completion E⊗̂_π F and the canonical
continuous bilinear map with dense algebraic image.

Prove the universal property for jointly continuous ℂ-bilinear maps into
complete Hausdorff locally convex complex spaces, with uniqueness on pure
tensors. Prove functoriality and identity/composition laws, associativity,
tensor flip, scalar units and compatibility with finite sums, with their
pure-tensor equations and coherence. Establish Fréchet completeness and
metrizability when E,F are Fréchet; no nuclearity or approximation
hypothesis is imposed for this construction. For complex Banach factors compare
with BanachSpaceTheory B4's complex completed Banach projective tensor by the
identity on pure tensors, including the norm/universal-property and
finite-family `PiTensorProduct` comparisons. This consumes B4's tensor
contract, not its approximation-property or nuclear-operator results.

**Checks.**

- On ℓ¹⊗̂_π ℓ¹ the projective norm of a pure tensor x⊗y is ‖x‖‖y‖:
  the one-term representation gives the upper bound, and norming
  functionals f,g with f(x)=‖x‖, g(y)=‖y‖ give
  `‖x‖‖y‖=Σf(x_i)g(y_i)≤Σ‖x_i‖‖y_i‖` for every representation. The
  representation `e₀⊗e₀=(e₀+e₁)⊗e₀−e₁⊗e₀` has sum of products 3, so the
  value 1 is the infimum and a quantity read off one fixed representation is
  not a function of the tensor.
- On ℓ²⊗̂_π ℓ² the element `Σ_(i<n) e_i⊗e_i` has projective norm n (as a
  trace-class operator it is a rank-n projection, of trace norm n) while its
  Hilbert tensor norm is √n. The comparison map to the Hilbert tensor product
  is continuous and not an isometry; a construction yielding the injective or
  Hilbert norm would give √n.
- The universal property is for ℂ-bilinear maps. On ℂ⊗̂_π ℂ=ℂ the map
  (x,y)↦xy induces the identity, while (x,y)↦x·ȳ, additive in each
  variable and ℂ-linear only in x, induces no map at all: the pure tensors
  1⊗i and i⊗1 are both i·(1⊗1), equal in the complex tensor, but the two
  values are −i and i. A construction over the real scalars would keep
  them apart.
- The scalar unit ℂ⊗̂_π E ≃ E sends λ⊗x to λx: for a continuous seminorm
  p on E, `π_(|·|,p)(Σλ_i⊗x_i)=p(Σλ_ix_i)`, the triangle inequality giving
  ≥ and the one-term representation `1⊗Σλ_ix_i` giving ≤. With p=0 the
  seminorm `π_(|·|,0)` vanishes identically, so no single seminorm of the
  family separates points; the family separates the points of ℂ⊗E exactly
  because the continuous seminorms of the Hausdorff space E separate its
  points. With E={0} the completed tensor is {0}.

*Needs:* Mathlib `TensorProduct`, `Seminorm`, `WithSeminorms`, `UniformSpace.Completion` and `PiTensorProduct`; BanachSpaceTheory B4.

### N1.Cyclic. Universal forms and complexes

Build completed bar resolutions and their continuous contracting
homotopies for unital complex algebras. Identify continuous multilinear cochains with continuous
functionals on the completed tensors by the universal property, using
uniform convergence on products of bounded sets for the cochain topology
on both sides, and prove compatibility of the differentials. In the smooth
circle example prove `C^∞(S¹)⊗̂_π C^∞(S¹)≃C^∞(𝕋²)` using
rapid Fourier decay, including both topologies and inverse-closedness.

For every associative A use its forced unitization A⁺, even when A
already has a unit. Construct universal forms from the kernel of
`multiplication:A⁺⊗A⁺→A⁺`, with
`da=1_ext⊗a−a⊗1_ext`, and their graded tensor algebra. Identify
positive-degree forms with `A⁺⊗A^⊗n`; under this identification
da is `1_ext⊗a`. Prove the derivation universal property, graded
Leibniz rule, d²=0, tensor-word relations and functoriality.
A cycle has an algebra map ρ:A→Ω⁰ which need not preserve an
existing unit, and a closed graded trace. Prove every cyclic cocycle
realized by such a universal-form cycle and every cycle gives a
cyclic cocycle via
`φ(a₀,…,a_n)=∫ρ(a₀)dρ(a₁)⋯dρ(a_n)`.
For unital A separately construct the normalized form quotient
`A⊗(A/ℂ1_A)^⊗n` and its comparison with normalized Hochschild
chains. Do not replace the full cycle construction by this quotient:
`φ(a,b,c)=abc` on ℂ is a cyclic 2-cocycle nonzero on (1,1,1),
requiring a possibly nonunital cycle map and the forced unitization.

For unital A define degree-n cochains as multilinear maps A^(n+1)→ℂ.
For nonunital A apply these formulas to A⁺ and take the relative
complex specified above. A cyclic cochain
satisfies `φ(a_n,a₀,…,a_(n−1))=(−1)^nφ(a₀,…,a_n)`.
Pin the Hochschild coboundary to

`(bφ)(a₀,…,a_(n+1))`
`=Σ_(j=0)^n(−1)^j φ(a₀,…,a_j a_(j+1),…,a_(n+1))`
` +(−1)^(n+1)φ(a_(n+1)a₀,a₁,…,a_n)`.

Prove b²=0 and preservation of the cyclic subcomplex. In degree two, a
cyclic 2-cocycle `CyclicTwoCocycle` is a trilinear functional with
`φ(c,a,b)=φ(a,b,c)` and `bφ=0` for this coboundary. Construct cochain
pullbacks, addition, scalar multiplication, kernels, boundaries and cyclic
cohomology. For unital A prove the Hochschild comparison with coefficients
in its algebraic dual. In the unital Banach/bounded specialization consume
BanachAlgebras A6's Hochschild differential and cochain API; this
roadmap supplies the cyclic and Fréchet extensions and their comparison.
For unital A, currying the first argument identifies the scalar (n+1)-cochains
with n-cochains valued in A*, using `(aφb)(x)=φ(bxa)`; prove
the differentials agree under this identification.
For locally convex A use continuous multilinear cochains;
prove the finite multiplication/permutation/degeneracy formulas preserve
continuity and compare with continuous-dual tensor formulations. Give
continuous cochains the topology of uniform convergence on products of
bounded sets. Cohomology is the algebraic quotient of continuous cocycles
by continuous coboundaries, with its quotient topology; boundaries are
not replaced by their closure. These quotients need not be Hausdorff.

Construct the cyclic operator, faces, degeneracies, b′ and cyclic norm N.
Prove the cyclic/simplicial identities, Connes B, `B²=0` and `bB+Bb=0`.
On normalized chains `a₀⊗bar a₁⊗⋯⊗bar a_n` pin B to

`Σ_(i=0)^n(−1)^(ni) 1⊗bar a_i⊗⋯⊗bar a_n⊗bar a₀⊗⋯⊗bar a_(i−1)`.

Prove descent through degenerate chains and comparison with the full
cyclic bicomplex. Construct the cyclic total complex with its finite-column
truncations, and prove its cohomology agrees with the cyclic-cochain
complex. Explicitly preserve `HC^(2k)(ℂ)=ℂ` generated by `S^k[τ]`
and `HC^(2k+1)(ℂ)=0`. For a nonzero unital A, reduced cochains
are the kernel of restriction along A's own unit inclusion ℂ→A;
the reduced complex of ℂ is zero. Distinguish this from the relative
forced-unitization theory recovering the full theory of a unital A.
Treat the zero algebra by its zero complexes. Prove the SBI sequence
with `I:HC^n→HH^n`, `B:HH^n→HC^(n−1)` and
`S:HC^(n−1)→HC^(n+1)`, and exactness at every term.
Normalize S as exterior product with the scalar cyclic 2-cocycle
`σ₁(a₀,a₁,a₂)=a₀a₁a₂`. Construct the comparison maps using the
b′ contraction inserting the unit and the cyclic norm N, then normalize
them by the scalar and circle calibrations below; inclusion in a
single unnormalized (b,B) column is not the comparison map.
Define periodic cohomology by the same-parity direct limit under S and
prove its comparison with the direct-sum cochain totalization of the
stabilized (b,B) bicomplex: representatives have finitely many nonzero
components. Pin the scalar comparison: the cyclic degree-2m class
represented by `σ_m(a₀,…,a_(2m))=m!∏_j a_j` on ℂ maps to
the degree-zero functional z↦z in this totalization. Prove its
compatibility with S and N2's pairing. For a normalized cyclic
n-cocycle the homogeneous column comparison has scalar
`c_(2m)=(−1)^m/(2m)!` and
`c_(2k+1)=(−1)^k/((1+i)sqrt(π)(2k+1)!)`.
Prove these maps agree with the full cyclic-bicomplex comparison,
including its lower unit columns, and with N2's closed periodic
Chern chains and both pairings. This pins every odd degree as well as
the degree-one circle class. Prove naturality and periodic homotopy invariance for
polynomial algebra homotopies, and for continuous homomorphisms
`A→C^∞([0,1],B)` in the locally convex theory, with continuous derivatives
and the smooth-function seminorms; construct their transgressions.
Construct matrix Morita invariance and the exterior product by tensoring
differential-form cycles, with
`(ω⊗η)(ω′⊗η′)=(−1)^(deg η deg ω′)ωω′⊗ηη′` and
`d(ω⊗η)=dω⊗η+(−1)^(deg ω)ω⊗dη`. Prove the cochain shuffle
comparison, including `[φ#ψ]=binom(p+q,p)[φ]∨[ψ]` for the
Hochschild cup comparison, graded commutativity sign `(−1)^(pq)` and compatibility
with S and the K-theory exterior product. Work out
ℂ, finite matrix algebras and traces as degree-zero cocycles, and compare
commutative differential-form cycles with their cyclic characters.

**Checks.**

- The periodicity normalization on ℂ: with τ(z)=z the degree-zero trace
  and S the exterior product with σ₁, `S^mτ(1,…,1)=m!=σ_m(1,…,1)`, so
  `S^mτ=σ_m` on ℂ (Connes III.1, Lemma 14, p. 198; III.3, Proposition 2,
  p. 229, gives `Sφ(e,…,e)=(m+1)φ(e,…,e)` for a cyclic 2m-cocycle φ and an
  idempotent e). The value m! is the Koszul-signed count of orderings of m
  pairs of anticommuting degree-one generators, `∏_(k≤m)[2k,2]_(q=−1)=m!`:
  at m=2 the six orderings of two pairs carry the signs +,−,+,+,−,+ and sum
  to 2. An exterior product without the sign `(−1)^(deg η deg ω′)` would
  give 6 at m=2, and the even pairing of [1] with `S²τ` would be 6/2!=3
  instead of the value 1 that compatibility with S requires.
- The last coboundary term: in degree zero `(bφ)(a₀,a₁)=φ(a₀a₁)−φ(a₁a₀)`,
  so the 0-cocycles are the traces. On M₂(ℂ), `(b Tr)(e₁₂,e₂₁)=Tr(e₁₁)−Tr(e₂₂)=0`,
  while the matrix-entry functional `φ(a)=a₁₁` has `(bφ)(e₁₂,e₂₁)=1−0=1`.
  With the sign +1 in place of `(−1)^(n+1)` the coboundary of the trace on
  ℂ would take the value 2 at (1,1), and no trace would be a cocycle.
- The cyclic sign: a cyclic 1-cochain satisfies `φ(a₁,a₀)=−φ(a₀,a₁)`; on
  the smooth circle `ψ(a₀,a₁)=(2πi)⁻¹∫a₀da₁` has `ψ(z⁻¹,z)=1` and
  `ψ(z,z⁻¹)=(2πi)⁻¹∫z·(−z⁻²)dz=−1`. A convention with the sign +1 in odd
  degree would force ψ=0. On ℂ a cyclic n-cochain is its value c at
  (1,…,1); the sign makes every odd cyclic cochain vanish, so
  `HC^(2k+1)(ℂ)=0`, while every even cochain is a cocycle, since
  `(bc)(1,…,1)=c(Σ_(j=0)^(2k)(−1)^j+(−1)^(2k+1))=c(1−1)=0`, so
  `HC^(2k)(ℂ)=ℂ`.
- The nonunital cycle: `φ(a,b,c)=abc` on ℂ is cyclic, `φ(c,a,b)=cab=abc`,
  and a cocycle, `(bφ)(a,b,c,d)=abcd−abcd+abcd−dabc=0`, with `φ(1,1,1)=1`.
  A unital cycle, with ρ(1) the unit of Ω and d1=0, has
  `∫ρ(1)dρ(1)dρ(1)=0`, and the normalized quotient `A⊗(A/ℂ1)^⊗n` kills
  every chain with a unit in a positive slot; so neither realizes this
  cocycle, which is why cycles are built on the forced unitization with a
  possibly nonunital ρ.

*Needs:* N1.Tensor; Mathlib `MultilinearMap`, `ChainComplex`, `CochainComplex` and their homology APIs; Tau Ceti `derivationLieAlgebra ℂ A`; BanachAlgebras A4, A6.

### Examples

The rank-n projection `Σ_(i<n)e_i⊗e_i` in ℓ²⊗̂_πℓ² has projective norm n and
Hilbert norm √n. On ℂ the classes `S^mτ=σ_m`, with `σ_m(1,…,1)=m!`, span
`HC^(2m)(ℂ)` and the odd cyclic cochains vanish. On the smooth circle
`ψ(a₀,a₁)=(2πi)⁻¹∫a₀da₁` has `ψ(z⁻¹,z)=1=−ψ(z,z⁻¹)`.

### Dependencies

N1.Tensor: Mathlib tensor, seminorm and completion APIs; BanachSpaceTheory
B4. N1.Cyclic: N1.Tensor;
Mathlib complexes and their homology APIs; Tau Ceti `derivationLieAlgebra ℂ A`;
BanachAlgebras A4, A6.

## N2. Cyclic pairings with K-theory

Extend a cochain to matrices by
`(φ#Tr)(a₀,…,a_n)=Σ_(i₀,…,i_n)φ((a₀)_(i₀i₁),…,(a_n)_(i_ni₀))`.
Prove cyclicity, compatibility with b,B,S, stabilization and trace
normalizations. For a cyclic cocycle of degree 2m and an idempotent e
use the even pairing

`⟨[e],[φ]⟩=(m!)⁻¹(φ#Tr)(e,…,e)`.

For odd n and invertible u use

`⟨[u],[φ]⟩=(1+i)⁻¹ 2^(−n) Γ(n/2+1)⁻¹`
` ·(φ#Tr)(u⁻¹−1,u−1,…,u⁻¹−1,u−1)`.

There are n+1 alternating arguments. Prove independence of cocycle
representative, stabilization, conjugation, direct sums and smooth
homotopy; prove the compatible periodicity normalization and the product
formula fixing this odd constant. State both pairings on representatives,
idempotents e∈M_n(A) and invertibles u∈GL_n(A) for every n (Mathlib's
`Matrix.GeneralLinearGroup`), and prove the relations of the algebraic
K-groups before imposing any topology: invariance under the stabilizations
e↦diag(e,0) and u↦diag(u,1) and under conjugation by GL_n(A), additivity
on the block sums diag(e,f) and diag(u,v), the product law
`⟨[uv],[φ]⟩=⟨[u],[φ]⟩+⟨[v],[φ]⟩` by comparing diag(uv,1) with diag(u,v)
(Connes III.3, Propositions 2–3, pp. 229–230), hence vanishing on every
commutator and on every elementary matrix `1+aE_ij`, i≠j (Mathlib's
`Matrix.transvection`), and the complex-relative unitization versions on
the kernels of the augmentation. The even pairing therefore factors
through the idempotent monoid modulo similarity and stabilization, and the
odd one through `GL_∞(A)/E_∞(A)`; a K₀ or K₁ presented by these relations
receives the pairing by quotient, and nothing here depends on how those
groups are constructed.

**Checks.**
- On an elementary matrix u=`1+aE_ij`, i≠j, every odd pairing is zero
  before any relation is used: `u⁻¹−1=−aE_ij`, `u−1=aE_ij`, and a product
  of two or more multiples of `E_ij` vanishes, so each term of `φ#Tr` is
  zero.
- For the degree-zero trace cocycle on ℂ and an idempotent e∈M_n(ℂ) the
  even pairing is `Tr(e)=rank e`: additive on block sums, unchanged by
  conjugation and by diag(e,0); the scalar multiple `c·Tr` pairs to
  `c·rank e`, not an integer for c=1/2 on [1].
- On the circle, with the winding unitary z and the cocycle
  `ψ(a₀,a₁)=(2πi)⁻¹∫a₀da₁`, the odd pairing gives
  `⟨[z^k],[ψ]⟩=k/((1+i)sqrt(π))`: `ψ(z^(−k),z^k)=k` and the three terms
  with a constant argument vanish, so `⟨[z²]⟩=2⟨[z]⟩` and `⟨[z⁻¹]⟩=−⟨[z]⟩`,
  as the product law requires; a pairing without the (1+i)⁻¹ factor would
  not square to `1/(2πi)` on the Bott class.

For inverse-closed dense Fréchet
subalgebras transport them through K3 to C*-K₀/K₁, proving continuity
and path/transgression estimates needed for topological homotopy.
Nonunital pairings use the relative forced-unitization complex and K
kernels. Prove functoriality and compare idempotents with projections and
invertibles with unitaries using K1–K2's functional-calculus paths and
K3's inverse-closed comparison.

Pin comparison with the normalized mixed complex by its closed periodic
Chern chains. The even components are `ch₀(e)=e` and, for k≥1,
`ch_(2k)(e)=(−1)^k(2k)!/k! · (e−1/2)⊗bar e^⊗(2k)`;
the odd components are
`ch_(2k+1)(u)=(−1)^k k! · u⁻¹⊗bar u⊗bar u⁻¹⊗⋯⊗bar u`,
with 2k+2 factors. Prove `(b+B)ch=0`, the relative-unitization
versions and invariance under stabilization and homotopy. Pair a
finite-support periodic cochain with these chains by the finite sum,
and prove the cyclic-to-mixed comparison gives exactly the displayed
N2 pairings.
For a normalized cyclic cocycle, pin the degree-2k component of
its mixed image to `(−1)^k φ/(2k)!`, and its degree-(2k+1)
component to `(−1)^k φ/((2k+1)!(1+i)sqrt(π))`.
For full cyclic cochains construct the lower components using the
unit/degeneracy comparison; the scalar σ_m class retains the
degree-zero component specified in N1. Prove that evaluating on
the displayed Chern chains gives N2's factorial/Gamma factors.
In odd parity calibrate on the circle cocycle
`ψ(a₀,a₁)=(2πi)⁻¹∫_(S¹)a₀ da₁`: its normalized mixed image
has degree-one component `ψ/((1+i)sqrt(π))`, so its pairing with
the positive winding class is `1/((1+i)sqrt(π))`.

Pin the odd-by-odd product on C(𝕋²): with coordinates (x,y) in
that order and winding unitaries z₁,z₂, require
`[z₁]×[z₂]=q*β`, where q collapses the coordinate circles and
has degree +1 onto the oriented two-sphere. Compare K3's chosen
tautological β with N2's smooth Bott cocycle, whose value is +1.
The product circle cocycle has coefficient `(2πi)⁻²` on dx∧dy;
compute its value on q*β as `1/(2πi)`, equal to the square of
`1/((1+i)sqrt(π))`. This calibrates the odd pairing constant and
the exterior product together, including the ordered suspension sign.

An arbitrary complex cyclic class need not pair integrally. N3 proves
integrality for the normalized Fredholm Chern character. Give the trace
pairing and a scalar multiple of it that has a noninteger value on [1].
Include matrix Morita invariance and the point normalization. For Bott
use the inverse-closed dense Fréchet algebra `𝒮(ℝ²)⊂C₀(ℝ²)` with
ordered coordinates (s,t), orientation ds∧dt and the cyclic cocycle
`φ_B(f₀,f₁,f₂)=(2πi)⁻¹∫_ℝ² f₀ df₁∧df₂`.
Build its continuity, inverse-closedness and K3 comparison. Replace
K3's tautological projection by a smoothly flattened radial pullback
equal to p(∞) off a compact disk, so its difference from p(∞) has
Schwartz entries; prove that the pullback preserves β. Compute
`⟨β,[φ_B]⟩=+1` and the scalar constant-projection contribution zero.
These formulas fix the comparison with the chosen Bott generator and
keep the sign distinct from a separately chosen geometric Chern–Weil convention.

### Examples

The elementary matrix `1+aE_ij` pairs to zero with every odd cocycle; the
trace on ℂ pairs an idempotent of M_n(ℂ) to its rank; the circle cocycle ψ
pairs `[z^k]` to `k/((1+i)sqrt(π))`; the Bott projection pairs to +1 with
φ_B and the product circle cocycle takes the value `1/(2πi)` on q*β.

### Dependencies

*Needs:* N1.Cyclic; OperatorKTheory K1–K3; CStarAlgebras C1–C5 for matrices and the continuous functional calculus; Mathlib `Matrix.GeneralLinearGroup` and `Matrix.transvection`.

## N3. Fredholm modules and their finite characters

Consume K5–K6's Hilbert-space specialization of KK cycles. For a cycle
whose `(F−F*)π(a)` is compact, construct the self-adjoint replacement
`(F+F*)/2` and its class-preserving compact-perturbation homotopy.
Define even
and odd Fredholm modules with bounded representation π, F*=F,
`[F,π(a)]` compact and `(F²−1)π(a)` compact; even modules carry the
specified γ. In the unital normalized case an even cycle on a separable
Hilbert space is a self-adjoint involution F, odd for a self-adjoint
involutive grading commuting with π, with every `[F,π(a)]` compact.
Develop unitary equivalence, direct sums, degenerate cycles,
compact perturbation, homotopy and the K4 Fredholm compressions. Build
normalization to F²=1 by first applying functional calculus to replace F
by the self-adjoint contraction `sin(πF/2)`, preserving the essential
values ±1 and its cycle class, and then doubling
on H⊕H with representation π⊕0 and operator
`F′=[[F,sqrt(1−F²)],[sqrt(1−F²),−F]]`.
In even parity use grading `diag(γ,−γ)`. Prove the off-diagonal
terms multiplied by π(a) compact, the cycle homotopy, F′²=1 and
agreement of the index with the original compression wherever that
compression is Fredholm. Extend this normalized cycle to the
forced unitization. Finite-dimensional augmentation suffices when the
defect has finite rank, including the finite kernel in N5; it is not
the general normalization construction. Construct the K6 product
comparison with the unitization conventions specified here,
including the even compression to π(1)H and the odd extension of a
unitary by the identity on the complement of π(1)H.

The trace, characters and Dixmier traces below live on B(H) with
OperatorIdeals' singular values μ_j and its Schatten classes S_p,
1≤p≤∞, and with NoncommutativeIntegration Layer 1's Schatten
quasi-ideals for 0<p<1. By its §1.5 the quasi-ideal
`S_p={T compact : Σ_j μ_j(T)^p<∞}` with `‖T‖_p=(Σ_j μ_j(T)^p)^(1/p)` is
Lp(B(H),Tr), so the p-triangle inequality `‖S+T‖_p^p≤‖S‖_p^p+‖T‖_p^p`,
the ideal bounds `‖ATB‖_p≤‖A‖‖T‖_p‖B‖`, adjoint invariance
`‖T*‖_p=‖T‖_p` and completeness of the p-metric `(S,T)↦‖S−T‖_p^p` are
the B(H) instances of its §1.3, and Hölder's inequality
`‖ST‖_r≤‖S‖_p‖T‖_q` for p,q>0 with 1/r=1/p+1/q and constant one is the
B(H) instance of its §1.4; N3 consumes these and does not prove them
again. Deduce here `S_(p₁)⋯S_(p_k)⊆S_p` for 1/p=Σ_j 1/p_j, and the
inclusions S_p⊆S_q for p≤q with `‖T‖_q≤‖T‖_p`, from `μ_j(T)≤‖T‖_p` for
every j; these inclusions are particular to B(H), whose minimal
projections have trace one, and NoncommutativeIntegration asserts none for
an infinite trace. Define the trace of a trace-class
operator as `Tr(T)=Σ_j⟨e_j,Te_j⟩` over an orthonormal basis; prove its
absolute convergence and independence of the basis by summing the
Schmidt series of BanachSpaceTheory B4 term by term, which gives
`Tr T=Σ_j μ_j(T)⟨e_j,f_j⟩` for the Schmidt pair `(e_j),(f_j)`; prove
`|Tr T|≤‖T‖₁`, `Tr(T*)=conj(Tr T)`, `Tr T=Σ_j μ_j(T)` for positive T,
`Tr(AT)=Tr(TA)` for bounded A and trace-class T, and the cyclicity
`Tr(ST)=Tr(TS)` for S∈S_p, T∈S_q with 1/p+1/q=1, 1≤p≤∞ (Connes IV.1,
p. 300), from the bounded case by Hölder and the S_p-density of
finite-rank operators for p<∞.

**Checks.**
- Direction of the inclusions: T=diag(1,1) has `‖T‖_(1/2)=(1+1)²=4`,
  `‖T‖₁=2` and `‖T‖₂=sqrt 2`, decreasing in p, and `diag((j+1)^(−2))`
  lies in S₁, with trace `π²/6`, but not in S_(1/2), since
  `Σ_j(j+1)^(−1)` diverges: the inclusion runs from small to large p, and
  `S_q⊆S_p` for p<q is false.
- For S=T=diag(1/(j+1)), each in S_p exactly when p>1, the product
  `ST=diag(1/(j+1)²)` lies in S_r exactly when r>1/2. The ideal property
  alone places ST in S_p for p>1 only; Hölder with p=q↓1 gives every
  r>1/2, and r=1/2 itself fails, so the exponent law is sharp on this
  example.
- For the rank-one projection onto e₀ the standard basis gives `Tr=1`
  and the basis `(e₀±e₁)/sqrt 2, e₂, e₃, …` gives `1/2+1/2=1`; for
  T=diag(1/(j+1)²) the trace is `π²/6=Σ_j μ_j(T)=‖T‖₁`. The unilateral
  shift has `⟨e_j,Se_j⟩=0` for every j, an absolutely convergent diagonal
  series, and is not compact: convergence of the diagonal series in one
  basis is not the definition.
- Cyclicity needs a trace-class factor: for the unilateral shift S on
  ℓ²(ℕ), `S*S−SS*` is the rank-one projection onto e₀, of trace 1, so
  `Tr(AB)=Tr(BA)` fails for bounded A, B whose commutator is trace
  class; this is why the conditional trace Tr′ below is not Tr.

For normalized F and a chosen dense smooth algebra require
`[F,π(a)]∈S_p` for every a, and continuity of this commutator map
into its Schatten norm or quasi-norm. Prove matrix, sum, algebra-product,
dagger and perturbation estimates. Construct the conditional trace
`Tr′(T)=½Tr(F(FT+TF))` when FT+TF is trace class. Establish its
linearity and the graded commutator identities on its precise domain.
For integer n with the correct parity and n+1≥p define

`τ_n(a₀,…,a_n)=Tr′(π(a₀)[F,π(a₁)]⋯[F,π(a_n)])`,

with γ inserted before π(a₀) in even parity. For the displayed operator
T prove FT+TF trace-class by Hölder and the n+1-commutator identity;
T itself need not be trace-class. Establish
continuity, cyclicity and bτ_n=0. Construct transgressions between
same-parity degrees and smooth homotopies. Normalize the periodic
character by `Ch_n=λ_n τ_n`, where

`λ_n=(−1)^(n(n−1)/2)Γ(n/2+1)` in even parity,

and multiply this by −(1+i) in odd parity. With N2's positive odd
pairing factor, this sign makes the character agree with the index of
compression by P=(1+F)/2. Pin the degree-one calibration on the circle:
for F=2P_Hardy−1 and the positive winding unitary u,
`τ₁(u⁻¹−1,u−1)=2`, while `ind(P_Hardy u P_Hardy)=−1`,
so `⟨[u],Ch₁⟩=−1`. Prove independence of the
sufficiently large same-parity representative and compatibility with S.
For nonexact self-adjoint contraction cycles impose explicitly
`[F,π(a)]∈S_p` and `sqrt(1−F²)π(a), π(a)sqrt(1−F²)∈S_p`,
continuously in a. Prove these bounds give p-summable doubled cycles.
These are additional summability hypotheses, distinct from the compact
defects of an arbitrary Fredholm cycle.
Also prove that the usual bounds `[F,π(a)]∈S_p` and
`(F²−1)π(a)∈S_p`, with their adjoint/continuity bounds, give an
S_(2p)-summable doubled cycle by square-root estimates. Prove the
power-series commutator bounds for the sine replacement, using
the p-triangle inequality of NoncommutativeIntegration §1.3 when p<1,
before applying these square-root estimates.
Use a sufficiently large same-parity degree n+1≥2p in that case.

Prove the character index theorem: the even pairing with a projection e
is the index of `π(e)F⁺π(e):π(e)H⁺→π(e)H⁻`; the odd pairing with
an invertible u is `ind(Pπ̃(u)P)` on PH, with P=(1+F)/2 and forced
unitization where needed. For a unital algebra acting nonunitally replace
π(u) by `π(u)+I−π(1)`. Construct the trace index identity and its
perturbation/finite-kernel argument before proving integrality. Compare
with K4's native index and, under K5–K6's separable C*-algebra
hypotheses, the KK product. Construct both ordered reductions of the external product of the two
smooth circle Fredholm modules. Write x⊠_u y for the unswapped
Clifford tensor/Morita reduction and x×_K5 y for K5's fixed swapped
period reduction. Represent each Hardy class by the unbounded circle
operator `D_j=−iδ_j` on ℓ²(ℤ), with eigenvalue 2πm on e_m, whose phase
with the zero mode sent to +1 is `2P_Hardy−1`. With K5's matrices
`e₁=σ₁`, `e₂=−σ₂` on ℓ²(ℤ)⊗ℓ²(ℤ)⊗ℂ², x⊠_u y is represented by
`D₁⊗1⊗σ₁−1⊗D₂⊗σ₂=−i(σ₁δ₁−σ₂δ₂)` with grading σ₃, which is N7's D,
and x×_K5 y by `−D₁⊗1⊗σ₂+1⊗D₂⊗σ₁` with grading σ₃. The odd
self-adjoint unitary `(σ₁−σ₂)/√2` conjugates σ₁ to −σ₂ and σ₂ to −σ₁,
so it carries the second operator to the first with grading −σ₃.
The bounded tensor `F₁⊗1⊗σ₁−1⊗F₂⊗σ₂` is not a Fredholm module for
C(𝕋²): its commutator with z₁ is `[F₁,z₁]⊗1⊗σ₁`, rank one tensored
with the identity of ℓ²(ℤ), hence not compact; the product is formed
from the unbounded operators and their bounded transform. For the Hardy classes, each with circle index −1,
identify x⊠_u y with N7's Fourier Dirac operator at θ=0 and x×_K5 y
with its reversed grading. Prove `Ch(x⊠_u y)=Ch(x)#Ch(y)` and
`Ch(x×_K5 y)=−Ch(x)#Ch(y)`, distinguishing the two reductions
throughout the graded index-interchange comparison. For N2's fixed
positive ordered Bott class β=[z₁]×[z₂], calculate the pairings +1
and −1 respectively; the positive N7 Dirac has the first value.
The arithmetic is: `τ₁=2ψ` on the circle and `λ₁=−(1+i)sqrt(π)/2`, so
`Ch(x)=−(1+i)sqrt(π)ψ₁`; N2's value `1/(2πi)` of ψ₁#ψ₂ on β gives
`⟨β,Ch(x)#Ch(y)⟩=((1+i)sqrt(π))²/(2πi)=+1`. Directly,
`Tr₂(σ₃[D,a][D,b])=2i(δ₁aδ₂b−δ₂aδ₁b)`, and N5 with λ₂=−1 and N7's
spin factor 1/(4π) gives the Hochschild class `(−1)(2i)/(4π)·τ(⋯)=φ`,
which pairs +1 with β.
K5's matrices e₁=σ₁, e₂=−σ₂, its swapped reduction and N2's Bott
orientation are the conventions used here. Point factors contribute no
additional adapter sign. These
computations concern the explicitly finitely summable point/circle
products. A general KK product is not assumed to have a finitely
summable representative on the given smooth algebra. Work out point cycles,
the circle Hardy/shift compression with index −1 for the forward
shift and +1 for its adjoint, a finite matrix
amplification and a nonsummable compact-commutator cycle. Summability
is a condition on the specified smooth algebra, not automatically on
the whole C*-completion.

### Examples

The point cycle; the circle Hardy compression with `ind(P_Hardy u P_Hardy)=−1`
and `⟨[u],Ch₁⟩=−1`; the product of two Hardy classes, pairing +1 with β
under the unswapped reduction and −1 under K5's; a nonsummable
compact-commutator cycle. On B(H): `diag(1/(j+1))²` in S_r exactly for
r>1/2, `diag((j+1)^(−2))` in S₁ but not in S_(1/2), and the shift with
`Tr(S*S−SS*)=1`.

### Dependencies

*Needs:* N1.Cyclic, N2; OperatorKTheory K4–K6; OperatorTheory/OperatorIdeals Parts A–B (OI-A17, OI-A20, OI-A22, OI-A30, OI-B29–B30); BanachSpaceTheory B4's Schmidt series; NoncommutativeIntegration Layer 1 (§1.3–§1.5: the B(H) Schatten quasi-ideals and Hölder's inequality); Mathlib `ContinuousLinearMap.IsFredholm`, `ContinuousLinearMap.FredholmPackage` and `IsFredholm.index_comp`.

## N4. Weak ideals, generalized limits and Dixmier traces

Using OperatorIdeals' singular values, construct the Marcinkiewicz
logarithmic trace ideal

`L^(1,∞)={T compact : sup_(N≥1) (log(1+N))⁻¹ Σ_(j<N)μ_j(T)<∞}`.

Prove its ideal/quasi-norm structure, completeness, adjoint/unitary
invariance, finite-rank and trace-class inclusions and bounded left/right
multiplication, from OperatorIdeals' singular-value inequalities OI-A17,
OI-A20, OI-A22 and OI-A30. Distinguish it from the weak trace class
`S_(1,∞)={T: sup_(j≥0)(j+1)μ_j(T)<∞}` of NoncommutativeIntegration
§1.6, defined from the same singular values, and construct a diagonal
operator in the former but not the latter. For p>1 write `L^(p,∞)` for
the weak Schatten class `sup_(j≥0)(j+1)^(1/p)μ_j(T)<∞` of
NoncommutativeIntegration §1.6, which supplies its quasi-norm, adjoint
and ideal estimates; prove here its equivalent partial-sum description
`sup_(N≥1)N^(1/p−1)Σ_(j<N)μ_j(T)<∞`, which is a Banach norm (Connes IV,
Appendix C, p. 453), with the comparison constants `p/(p−1)` one way and
1 the other, and compare its power/product estimates with the logarithmic
ideal. In particular `T∈L^(n,∞)` implies `|T|^n∈L^(1,∞)`, since
`μ_j(|T|^n)=μ_j(T)^n≤C^n/(j+1)`.
For n=1 use the logarithmic ideal itself. Do not replace the logarithmic p=1
ideal by the smaller pointwise singular-value condition.

Construct positive generalized limits on bounded real sequences which
extend ordinary limits and are invariant under integer dilations,
including duplicating entries. Prove existence by positive extension
and an invariant-mean/compactness argument, and develop restrictions,
rescalings and complex linear extension. For positive T define

`Tr_ω(T)=Lim_ω((log(1+N))⁻¹ Σ_(j<N)μ_j(T))`.

Prove additivity on the positive cone with the dilation-invariance
hypothesis, positive homogeneity and extension to a linear trace on
L^(1,∞). Prove unitary invariance, `Tr_ω(AT)=Tr_ω(TA)` for bounded A,
boundedness and vanishing on trace class. Call a linear functional on
B(H) normal when it is `T↦Tr(ρT)` for a trace-class ρ; prove that no
Dixmier trace is normal: a functional of that form vanishing on every
rank-one operator has ρ=0, while Tr_ω vanishes on finite-rank operators
and is nonzero.
A general positive extension of limits
without dilation invariance is not asserted to give an additive trace.
Call T measurable when all Tr_ω with dilation-invariant ω agree; prove
ordinary convergence of the logarithmic means a sufficient condition.

**Checks.** Write `N_k=2^(2^k)`, so that `log N_(k+1)=2 log N_k`, and
`σ_N(T)=Σ_(j<N)μ_j(T)`.
- For `T=diag(1/(j+1))`, `σ_N=H_N=log N+γ+o(1)`, so
  `σ_N/log(1+N)→1` and `Tr_ω(T)=1` for every ω; T is measurable and not
  trace class. For any finite-rank R, `Tr_ω(T+R)=Tr_ω(T)=1`, since Tr_ω
  vanishes on trace class; a functional of the form `Tr(ρ·)` would see R.
- The diagonal operator with `μ_j=1` for j<4 and, for k≥1, `μ_j=k/N_k` on
  `[N_k,2N_k)` and `μ_j=(k+1)/N_(k+1)` on `[2N_k,N_(k+1))` is
  non-increasing, has `(j+1)μ_j=2k` at `j=2N_k−1`, hence lies outside
  `S_(1,∞)`, while `σ_N≤4+Σ_(i≤k)(2i+1)≤(k+2)²` for `N<N_(k+1)` and
  `log(1+N)≥2^k log 2` for `N≥N_k`, so `σ_N/log(1+N)` is bounded and T
  lies in `L^(1,∞)`: the two ideals differ, and a definition of `L^(1,∞)`
  by the pointwise condition would exclude this T.
- For `T=diag(1/((j+2)log(j+2)))`, `σ_N=log log N+O(1)` while
  `Σ_j μ_j=∞`: T is not trace class, yet `Tr_ω(T)=0` for every ω.
- Dependence on ω: let `μ_j=1/(j+1)` on `[N_(2k),N_(2k+1))`,
  `μ_j=1/(2(j+1))` on `[N_(2k+1),N_(2k+2))`, replaced on
  `[N_(2k+2),2N_(2k+2))` by the constant `1/(2N_(2k+2))` so that the
  sequence is non-increasing, with `μ_0=μ_1=1`. With `r_k=σ_(N_k)/log N_k`
  and `c_k=1` for even k, `1/2` for odd k, one has `r_(k+1)=(r_k+c_k)/2+o(1)`,
  so `r_(2k)→2/3` and `r_(2k+1)→5/6`: the logarithmic means do not converge.
  Composing the logarithmic Cesàro mean `M` with a generalized limit along
  `N_(2k)`, respectively `N_(2k+1)`, gives two dilation-invariant ω, and
  the block integrals `∫_(L)^(2L)(r L+c(t−L))/t dt=(r−c)L log 2+cL` give
  `Tr_ω(T)=2/3+(log 2)/9≈0.744` for the first and
  `5/6−(log 2)/9≈0.756` for the second. T lies in `L^(1,∞)` and is not
  measurable; a definition of Tr_ω by an ordinary limit would be undefined
  on it.

Prove the logarithmic Hardy–Littlewood/Karamata Tauberian bridge used
here, including its monotonicity/positivity and summation-by-parts
estimates: for positive T∈L^(1,∞),
`lim_(s↓1)(s−1)Tr(T^s)=L` iff the logarithmic partial-sum means
converge to L. Deduce Tr_ω(T)=L and the simple-pole residue formula.
This elementary Tauberian theorem is built here; the Wiener–Ikehara
supplier in ArithmeticDirichletSeries is not a substitute. Work out
the diagonal sequence 1/(j+1) and finite-rank perturbations. N7 owns
the Fourier lattice example using this Tauberian bridge. No general pseudodifferential residue
formula is imposed on arbitrary members of this ideal.

### Examples

`diag(1/(j+1))` with `Tr_ω=1` for every ω; the block-diagonal operator in
`L^(1,∞)∖S_(1,∞)`; `diag(1/((j+2)log(j+2)))` with `Tr_ω=0` and divergent
trace; the non-measurable operator with Dixmier traces `2/3+(log 2)/9` and
`5/6−(log 2)/9`.

### Dependencies

*Needs:* N3's trace; NoncommutativeIntegration Layer 1 (§1.4 Hölder's inequality, §1.5 the Schatten quasi-ideals, §1.6 the weak Schatten classes and S_(1,∞)); OperatorTheory/OperatorIdeals Part A (OI-A17, OI-A20, OI-A22, OI-A30) and Part B.

## N5. Spectral triples and the Hochschild class

For a self-adjoint D, compact resolvent means that its bounded inverse
`(D−i)⁻¹` is compact; compare this with the native `(i−D)⁻¹`
convention. Prove compactness of one nonreal resolvent equivalent to
compactness at all nonreal parameters by the resolvent identity.
Construct the compact positive injective operator
`K=(1+D²)⁻¹=((D−i)⁻¹)* (D−i)⁻¹` and apply Mathlib's compact
self-adjoint spectral theorem. Prove its nonzero eigenspaces finite-dimensional,
contained in Dom(D²) and invariant under D. Diagonalize D on each
such space to obtain a complete orthonormal eigenbasis, using ker K=0.
Prove every bounded interval contains only finitely many eigenvalues,
counting multiplicity, and give the graph-domain series criterion
`Σ_j(1+|λ_j|²)|ξ_j|²<∞`.
In this basis define f(D) on
`{ξ:Σ_j |f(λ_j)|²|ξ_j|²<∞}` for Borel f, proving domain,
closedness, adjoint and composition laws and independence of the
eigenbasis. Compare its spectral projections with the spectral measure of
SelfAdjointSpectralTheory SA-E.
This supplies |D|, sign D, heat operators and inverse powers, including
their kernel conventions, for the compact-resolvent triples here.

A unital spectral triple on a separable Hilbert space consists of a
self-adjoint `LinearPMap` D whose resolvent at i is compact, whose domain
π(A) preserves, with `[D,π(a)]` agreeing on that domain with a bounded
operator depending linearly on a.
Develop spectral triples (𝒜,H,D), their even/odd versions, operator-domain
invariance, bounded commutator extension, graph-norm estimates and
unitary/smooth-algebra transport. Build `[D,ab]=[D,a]b+a[D,b]`
and dagger identities on the common domain before extending boundedly.
Construct the bounded transform `F_D=D(1+D²)^(−1/2)` from this
calculus, `F_Dξ_j=λ_j(1+λ_j²)^(−1/2)ξ_j` on the eigenbasis: a self-adjoint
contraction with `1−F_D²=(1+D²)⁻¹` compact. Prove `[F_D,π(a)]` compact for
every a, so that (H,F_D), with γ in the even case, is a Fredholm module of
N3, and compare the resulting Fredholm class with N3; prove the Schatten
bounds `[F_D,π(a)]∈S_p` from stated spectral summability.

**Checks.**
- For D=diag(0,1,−1), `F_D=diag(0,1/√2,−1/√2)` and
  `1−F_D²=diag(1,1/2,1/2)=(1+D²)⁻¹`; the phase `sign D=diag(0,1,−1)` has
  `1−(sign D)²=diag(1,0,0)`, the kernel projection, so it is not the
  bounded transform.
- On the same D, `(D−i)⁻¹=diag(i,(1+i)/2,(−1+i)/2)` and
  `((D−i)⁻¹)*(D−i)⁻¹=diag(1,1/2,1/2)=(1+D²)⁻¹`; the native `(i−D)⁻¹` is
  its negative and gives the same K. For D=diag(j), j∈ℕ, the eigenvalues
  of K are `1/(1+j²)`, each simple, and ker K=0, since `Kξ=0` forces
  `‖(D−i)⁻¹ξ‖²=⟨ξ,Kξ⟩=0`.
- Compact resolvent against bounded D: for D=diag(j) on ℓ²(ℕ) the interval
  [−R,R] contains ⌊R⌋+1 eigenvalues and `(D−i)⁻¹` has singular values
  `(1+j²)^(−1/2)→0`, so it is compact; for the bounded self-adjoint
  D=diag(1−1/(j+1)) every eigenvalue lies in [0,1] and `(D−i)⁻¹` has
  singular values `|1−1/(j+1)−i|⁻¹→1/√2`, so it is not compact; for D=0
  on an infinite-dimensional H, `(D−i)⁻¹=iI` is not compact. No bounded
  D on an infinite-dimensional space has compact resolvent, and a
  definition of compact resolvent by compactness of `(D−i)⁻¹` on the
  eigenvectors alone would not exclude these.
- The graph-domain criterion for D=diag(j): `ξ_j=1/(j+1)` has
  `Σ_j(1+j²)/(j+1)²=∞`, so ξ∈ℓ² is not in Dom(D), while
  `ξ_j=1/(j+1)²` has `Σ_j(1+j²)/(j+1)⁴<∞` and lies in Dom(D). The form
  criterion `Σ_j|λ_j||ξ_j|²<∞` is weaker: `ξ_j=(j+1)^(−3/2)` has
  `Σ_j j/(j+1)³<∞` but `Σ_j(1+j²)/(j+1)³=∞`, and `Dξ=(j(j+1)^(−3/2))_j`
  is not in ℓ².

Develop resolvent, heat-functional-calculus and truncation
estimates needed for these assertions without invoking manifold
elliptic theory.

Let δ(T) be the bounded extension of `[|D|,T]` for operators preserving
Dom|D|. Define its closed derivation domain, iterated domains and smooth
intersection; prove completeness for graph seminorms, Leibniz, star,
inverse and matrix rules and functional-calculus stability, with
`δ(T*)=−δ(T)*` and the corresponding iterated signs. Regularity
requires both π(a) and `[D,π(a)]` in every δ-domain, with continuous
maps from the selected Fréchet algebra. Establish the commutator and
resolvent estimates used in the character comparison; regularity is
not only smoothness of π(a).

For integer n≥1 of the module's parity, initially invertible D, assume
D⁻¹∈L^(n,∞), F=sign D, and the preceding regularity and bounded
commutators. Prove finite summability in every larger exponent and
construct N3's character. Prove the Hochschild-class theorem: for

`φ_ω(a₀,…,a_n)=λ_n Tr_ω(π(a₀)[D,π(a₁)]⋯[D,π(a_n)]|D|⁻n)`,

with γ inserted in even parity and N3's λ_n, prove bφ_ω=0 and equality
with the Chern-character evaluation on every Hochschild n-cycle.
Develop the trace-ideal/domain estimates, resolvent transgression and
finite truncations that prove the comparison. The cochain can depend
on ω, while its cycle evaluation is independent of ω. State the
character as a periodic cyclic class and its Hochschild image; do not
identify arbitrary representatives as equal cochains.

Extend to finite-dimensional kernel by defining |D|⁻n to be zero on
the kernel and constructing the finite-dimensional augmentation and
character comparison explicitly. Pin the finite-rank corrections and
index contribution; simply writing sign(0)=0 does not make F²=1.
Compare diagonal spectral models with different summability exponents.
This is the Hochschild class of the index character, not the full
local index formula.

### Examples

D=diag(0,1,−1) with `F_D=diag(0,1/√2,−1/√2)` and `K=diag(1,1/2,1/2)`;
D=diag(j) on ℓ²(ℕ) with compact resolvent, ⌊R⌋+1 eigenvalues in [−R,R]
and the graph-domain witnesses `1/(j+1)∉Dom(D)`, `1/(j+1)²∈Dom(D)`; the
bounded D=diag(1−1/(j+1)) without compact resolvent.

### Dependencies

*Needs:* N3, N4; OperatorTheory/SelfAdjointSpectralTheory SA-E and its `LinearPMap` closed operators; Mathlib's compact self-adjoint spectral theorem; OperatorKTheory K4.

## N6. Smooth noncommutative two-tori and differential calculus

For every real θ consume K7's universal rotation algebra
`A_θ=C(𝕋)⋊_αℤ`, with `α(f)(z)=f(exp(2πiθ)z)` and
`U₁=v,U₂=u`. Its presentation has no irrationality restriction.
Construct the commuting coordinate-rotation and D4 dual actions, giving
`β_(z₁,z₂)(U_j)=z_j U_j`, and prove their joint strong continuity.
Construct 𝒜_θ, the rapidly decreasing Fourier series
`Σ_(m,n∈ℤ) a_mn U₁^m U₂^n` with
`U₂U₁=exp(2πiθ)U₁U₂`. Pin the ordered product multiplier to
`exp(2πiθ n m′)` and derive the star multiplier by reversing the word.
Develop rapid-decay seminorms, convergence, complete Fréchet star-algebra
structure, the injective dense map into A_θ and Fourier coefficient
uniqueness. Identify 𝒜_θ with the smooth vectors of the two-torus gauge
action β: the elements a of A_θ for which `z↦β_z(a)` is a smooth map into
A_θ, with the derivative seminorms `P_m(a)=Σ_(|w|≤m)‖∂^w a‖` over words
w in the two coordinate generators of the action. Compare the two
seminorm families by explicit finite-order estimates in both directions:
for `Q_k(a)=sup_(r,s)(1+|r|+|s|)^k|a_(r,s)|` prove `Q_k≤C_k P_k` and
`P_m≤D_m Q_(m+3)`, with constants independent of a and θ. The first
uses contractive Fourier coefficient extraction, `|a_(r,s)|≤‖a‖`, applied
to the derivatives with their actual 2πi multipliers; the second uses the
absolute summability of `(1+|r|+|s|)^(−3)` over ℤ². These establish the
same Fréchet topology, not equality of individual seminorms: at θ=0,
a=1+U₁ gives Q_0=1 and P_0=2. Prove spectral invariance in all matrix
levels by differentiating inverses, `δ_j(a⁻¹)=−a⁻¹δ_j(a)a⁻¹` and its
iterates, so that `M_n(𝒜_θ)` is closed under inversion and holomorphic
functional calculus in `M_n(A_θ)`; K3 supplies the K-theory comparison
for this inverse-closed algebra. For every real θ identify the underlying
C*-algebra with K7's rotation crossed product by `U₁=v,U₂=u`.

Construct the canonical faithful trace τ(a)=a_00 and the derivations
`δ_j(U₁^mU₂^n)=2πi n_j U₁^mU₂^n`, n₁=m,n₂=n.
Prove continuity, Leibniz, star compatibility, commuting derivations and
τδ_j=0. Construct the two-dimensional differential calculus, orientation,
closed graded trace and its character

`φ(a₀,a₁,a₂)=(2πi)⁻¹ τ(a₀(δ₁a₁ δ₂a₂−δ₂a₁ δ₁a₂))`.

The same formula `torusTwoCochain` makes sense for any linear functional
τ and two endomorphism-valued derivations of a unital algebra; prove
(`exists_cyclicTwoCocycle_torusTwoCochain`) that it is a cyclic 2-cocycle
when τ is a trace killed by both derivations and the derivations commute.
Prove cyclicity, bφ=0 and gauge/parameter-isomorphism transport. Build
connections on finite projective smooth right modules: ∇_j(ξa)=
(∇_jξ)a+ξδ_j(a), curvature `[∇₁,∇₂]`, Hermitian compatibility,
change of connection and gauge transformation. For a projection e
construct its Grassmann connection and prove the curvature-trace
formula equals `(φ#Tr)(e,e,e)`, including the (2πi)⁻¹ normalization.
Prove independence of connection by transgression. N7 supplies its
identification with an integer Fredholm index; cyclicity alone does not.

**Checks.**
- The ordered product multiplier: from `U₂U₁=exp(2πiθ)U₁U₂`,
  `U₂^n U₁^(m′)=exp(2πiθnm′)U₁^(m′)U₂^n`, so
  `(U₁^mU₂^n)(U₁^(m′)U₂^(n′))=exp(2πiθnm′)U₁^(m+m′)U₂^(n+n′)`. On the
  witness `(m,n)=(0,1)`, `(m′,n′)=(1,0)` this is the defining relation
  `U₂U₁=exp(2πiθ)U₁U₂`; the reversed multiplier `exp(2πiθmn′)` gives
  `U₂U₁=U₁U₂` there and is wrong for every θ∉ℤ.
- τ is a trace: `τ((U₁^mU₂^n)(U₁^(m′)U₂^(n′)))` is `exp(2πiθnm′)` when
  `(m′,n′)=(−m,−n)` and 0 otherwise, and the reversed product gives
  `exp(2πiθn′m)=exp(2πiθnm′)` in the same case; at `θ=1/2`, `m=n=1`,
  both equal −1. The functional `a↦a_(0,1)` is not a trace: for a=U₁ and
  `b=U₂U₁⁻¹`, `ab=exp(−2πiθ)U₂` while `ba=U₂`.
- `τδ_j=0`: `δ_j(U₁^mU₂^n)=2πin_jU₁^mU₂^n` has zero (0,0)-coefficient
  unless `(m,n)=(0,0)`, where `n_j=0`; so `τδ_j=0` on every monomial and,
  by continuity, on 𝒜_θ. The functional `a↦a_(1,0)` is not killed by
  δ₁: it takes the value 2πi on `δ₁(U₁)=2πiU₁`.
- The seminorm families: at θ=0 the element `a=1+U₁` has `Q_0=1` and
  `P_0=‖a‖=2`, so the two families define the same topology without
  being equal.

Compute continuous periodic cyclic cohomology for all θ:
`HP^even(𝒜_θ)≃ℂ²` with classes Sτ,φ, and
`HP^odd(𝒜_θ)≃ℂ²` with classes
`φ_j(a₀,a₁)=τ(a₀δ_j(a₁))`, j=1,2, with their periodic comparison.
Construct the Fourier resolutions, invariant/noninvariant cochain
contractions and comparisons proving completeness and independence.
Keep periodic cohomology distinct from fixed-degree ordinary cyclic
cohomology. Construct a continuous two-step bimodule resolution and its
comparison with the completed bar resolution, including the continuous
splittings needed to compute cohomology with continuous-dual coefficients.
For irrational θ set `λ=exp(2πiθ)`. The Diophantine condition is that
there exist C>0 and k∈ℕ with `|1−λ^n|⁻¹≤C(1+|n|)^k` for every
nonzero integer n. Prove
`dim H^j(𝒜_θ,𝒜_θ*)=1,2,1,0` for j=0,1,2,≥3 under this
condition, where 𝒜_θ* is the continuous dual. Without this condition
prove H¹ and H² infinite-dimensional and non-Hausdorff in N1's
quotient topology; H⁰ remains ℂ and the two-step resolution gives
vanishing above degree two.
Do not apply the Diophantine hypothesis to the periodic result.

### Examples

The multiplier witness `U₂U₁=exp(2πiθ)U₁U₂` at `(m,n)=(0,1)`,
`(m′,n′)=(1,0)`; the trace at θ=1/2 with both products equal to −1 on
`U₁U₂·U₁⁻¹U₂⁻¹`; the seminorm witness `1+U₁` at θ=0 with `Q₀=1`, `P₀=2`;
the torus character `φ` as `torusTwoCochain` on `τ`, `δ₁`, `δ₂`.

### Dependencies

*Needs:* N1.Cyclic, N2; OperatorKTheory K3, K7; OperatorAlgebraDynamics D1–D2, D4; Tau Ceti `derivationLieAlgebra ℂ A`.

## N7. Fourier spectral triples and Heisenberg indices

Take L²(A_θ,τ) to be Mathlib's GNS space `τ.GNS` of the trace τ, with
inner product `⟪a,b⟫=τ(a*b)` and left regular representation
`τ.gnsStarAlgHom`; identify it with ℓ²(ℤ²) by the ordered Fourier basis,
orthonormal because `τ((U₁^mU₂^n)*U₁^(m′)U₂^(n′))=δ_(mm′)δ_(nn′)`, and use
left multiplication for π. On its tensor product with ℂ² take
`D=−i(σ₁δ₁−σ₂δ₂)`, `γ=σ₃`, with the usual Pauli matrices.
Thus D⁺=−i(δ₁−iδ₂); this pins the orientation of the index and φ.
Construct the closed domain, self-adjointness, compact resolvent,
bounded smooth commutators and regularity. Prove |D| has nonzero
Fourier eigenvalues `2πsqrt(m²+n²)`, with spin multiplicity two per
lattice point and a two-dimensional kernel at (0,0). Combine lattice
points of equal radius when computing eigenvalue multiplicities.
Prove p-summability for p>2 and failure
at p=2. Build the lattice-counting estimates and derive
`Tr_ω(|D|⁻²)=1/(2π)`, with zero on the kernel. More generally prove
`Tr_ω(π(a)|D|⁻²)=τ(a)/(2π)`. For a spin matrix M∈M₂(𝒜_θ),
prove `Tr_ω(π₂(M)|D|⁻²)=τ(Tr₂ M)/(4π)`.
Construct the gauge implementing unitaries commuting with |D|; unitary
invariance makes the trace of every nonzero Fourier mode vanish.
Use `|Tr_ω(AT)|≤‖A‖Tr_ω(T)` for positive T and rapid Fourier
convergence to pass from polynomials to smooth a and spin matrices.
Use N5's
λ₂=−1 and this orientation to compute the Hochschild character φ;
compare the periodic character using N6's basis and its value on [1].

For 0<θ<1 construct the smooth Heisenberg right module on 𝒮(ℝ) with
`(ξU₁)(s)=ξ(s+θ)` and `(ξU₂)(s)=exp(2πis)ξ(s)`.
Build its A_θ-valued inner product `⟨ξ,η⟩`, conjugate-linear in ξ and
right A_θ-linear in η, and prove its positivity and definiteness, so that
with `op(a)•ξ=ξa` the module is a `CStarModule` over the opposite algebra
of A_θ in Mathlib's convention `⟪ξ,a•η⟫=a⟪ξ,η⟫`; complete it for the
module norm `‖⟨ξ,ξ⟩‖^(1/2)`. Build finite smooth projective frames and the
identification with a smooth Powers–Rieffel projection of trace θ. Prove the frame/trace dictionary
and, for irrational θ, compare its K₀ class with K7's positive-trace
generator. Construct
`∇₁ξ=−2πis ξ/θ`, `∇₂ξ=dξ/ds`, prove the right Leibniz and
Hermitian laws, and curvature `2πi/θ`. Complete the module after
tensoring with L²(A_θ,τ), identify it with the scalar L²(ℝ) model
with its correct norm, and construct the closed coupled Dirac operator.
Its chiral part is `−i(∇₁−i∇₂)=−d/ds−2πs/θ`. Prove its
Gaussian kernel is one-dimensional, adjoint kernel zero and range
closed using the harmonic-oscillator estimates. Thus its index is +1.
Establish the comparison of this coupled compression with N3/K6's
pairing and with the curvature trace, giving φ(generator)=1 and
φ([1])=0. This explicit calculation fixes the sign; changing the
second Clifford generator reverses the orientation.

For irrational θ conclude the joint trace/Chern map takes
`[1]↦(1,0)` and the positive-trace generator to `(θ,1)`, hence
identifies K₀ with the lattice `{(m+nθ,n):m,n∈ℤ}`. Compute the odd
cyclic pairings on U₁,U₂ with N2's constants: the rescaled classes
`ν_j=((1+i)sqrt(π)/(2πi))φ_j` pair as `ν_j(U_k)=δ_jk`.
Construct the two odd Fredholm modules on ℓ²(ℤ): write Se_k=e_(k+1),
`V_±e_k=exp(±2πikθ)e_k`, and let P_H be the projection onto k≥0.
Set `ρ₁(U₁)=S`, `ρ₁(U₂)=V_+`, `ρ₂(U₁)=V_-`,
`ρ₂(U₂)=S` and F=1−2P_H in both modules. Verify the defining
rotation relation, extend the representations to A_θ, and prove the
smooth commutators are Schatten-class using finite-rank shift
commutators and rapid Fourier decay. The positive F-projection is
1−P_H, so compression of S has index +1; the diagonal unitary has
index zero. Compare their periodic characters with ν₁,ν₂ by these
pairings and N6's cohomology basis, and with K7's K₁ generators.
Treat θ=0 as the ordinary smooth torus and compare
with its Fourier/de Rham calculations. Rational parameters retain the
periodic cyclic theorem and Fourier triple; the irrational unique-trace
and K-generator assertions are not imposed on them.

**Checks.**
- The opposite-algebra dictionary: for a C*-algebra A as a right module
  over itself with `⟨x,y⟩=x*y`, the matrix units x=e₁₂, y=e₁₁ of M₂(ℂ)
  give `⟨x,y⟩=e₂₁`, while Mathlib's self-module instance `⟪x,y⟫=y x*`
  gives 0; the transport `⟪x,y⟫=op(x*y)` satisfies
  `⟪x,op(a)•y⟫=op(x*ya)=op(a)·op(x*y)`, Mathlib's law, whereas keeping
  `⟪x,y⟫=x*y` in A with `a•y=ya` gives `⟪x,a•y⟫=⟪x,y⟫a`, the wrong side
  for noncommutative A.
- Orthonormality of the ordered Fourier basis: `(U₁^mU₂^n)*=U₂^(−n)U₁^(−m)`
  and the ordered multiplier gives
  `U₂^(−n)U₁^(m′−m)=exp(−2πiθn(m′−m))U₁^(m′−m)U₂^(−n)`, so
  `τ((U₁^mU₂^n)*U₁^(m′)U₂^(n′))=exp(−2πiθn(m′−m))τ(U₁^(m′−m)U₂^(n′−n))`,
  which is 1 when (m,n)=(m′,n′) and 0 otherwise. The reversed word is a
  different unit vector: `⟪U₂^nU₁^m,U₁^mU₂^n⟫=exp(−2πiθnm)`, equal to −1
  at θ=1/2, m=n=1, so the identification with ℓ²(ℤ²) depends on the
  ordering of the words.
- On the Fourier mode `(m,n)⊗ℂ²` the Dirac operator is `2π(mσ₁−nσ₂)`,
  with square `4π²(m²+n²)`; its kernel is the mode (0,0) tensored with
  ℂ², of dimension 2, and `D⁺=−i(δ₁−iδ₂)` acts on the mode by
  `2π(m−in)`, so `ind(D⁺)=1−1=0`, the pairing of [1] with the Fourier
  triple. The multiplicities of |D| at `2πr` for `r²=0,1,2,5,25` are
  `2,8,8,16,24`, the lattice-point counts `1,4,4,8,12` doubled by spin.
  With `N(R)≈2πR²` eigenvalues of |D| in [0,2πR] and
  `σ_(N(R))(|D|⁻²)≈(1/π)log R`, the logarithmic mean is
  `(1/π)/2=1/(2π)`; counting each lattice point once gives `1/(4π)`.
- The odd modules satisfy the rotation relation:
  `(V₊S)e_k=exp(2πi(k+1)θ)e_(k+1)=exp(2πiθ)(SV₊)e_k`, so
  `ρ₁(U₂)ρ₁(U₁)=exp(2πiθ)ρ₁(U₁)ρ₁(U₂)`, and
  `(SV₋)e_k=exp(−2πikθ)e_(k+1)=exp(2πiθ)(V₋S)e_k`, so ρ₂ satisfies the
  same relation; with V₊ in place of V₋ in ρ₂ the relation would carry
  `exp(−2πiθ)`. The compression of S to the range of 1−P_H, the span of
  the e_k with k<0, kills e₋₁ and maps e_k to e_(k+1) for k≤−2, so it has
  kernel of dimension 1 and cokernel 0: index +1; the diagonal V_±
  compress to unitaries of index 0.
- The Heisenberg chiral operator `−d/ds−2πs/θ` annihilates `exp(−πs²/θ)`,
  Schwartz for θ>0, while its adjoint `d/ds−2πs/θ` annihilates only
  `exp(πs²/θ)`, not in L²: kernel 1, cokernel 0, index +1. Reversing the
  second Clifford generator gives `−d/ds+2πs/θ`, whose kernel
  `exp(πs²/θ)` is not in L² while its adjoint has the Gaussian kernel:
  index −1.

### Examples

The Fourier triple with |D|-multiplicities `2,8,8,16,24` at
`r²=0,1,2,5,25`, `ind(D⁺)=0` and `Tr_ω(|D|⁻²)=1/(2π)`; the Heisenberg
module with curvature `2πi/θ` and chiral index +1; the two odd modules on
ℓ²(ℤ) with S compressed to index +1 and V_± to index 0; the matrix units
`e₁₂`, `e₁₁` separating the two inner-product conventions.

### Dependencies

*Needs:* N3–N6; Mathlib `PositiveLinearMap.GNS`, `gnsStarAlgHom` and `CStarModule`; OperatorKTheory K6–K7.

## Downstream consumers

- SmoothBanachRepresentations §7.3 consumes N1.Tensor's complex completed
  locally convex projective tensor for its smooth tensor comparison, and
  its §7.2a owns the real construction and the scalar-comparison maps;
  its Layer 8 consumes N6's identification of 𝒜_θ with the gauge smooth
  vectors, the seminorm comparisons `Q_k≤C_kP_k`, `P_m≤D_mQ_(m+3)` and
  the spectral invariance of `M_n(𝒜_θ)`;
  AutomorphicSpectralTheory, GanGrossPrasadUnitaryGroups and
  RefinedTraceMethods consume N1's completed tensors and cyclic complexes.
- SpectralManifolds consumes N1–N2 and N4–N5; CompactQuantumMetricSpaces
  consumes N6's smooth two-torus; HilbertModules/HeisenbergImprimitivity
  consumes N6–N7's torus connections and Heisenberg modules.

## References

- Connes, [*Noncommutative Geometry*](https://alainconnes.org/wp-content/uploads/book94bigpdf.pdf).
  Chapter III §1: universal forms and the cycle characterization of cyclic
  cocycles, Propositions 3–4, pp. 190–191; the cup product, Theorem 12,
  p. 197; the periodicity operator S, Lemma 14, p. 198; the SBI exact
  triangle, Theorem 26, p. 208. III §2: the torus Hochschild and periodic
  computations, Proposition 5 and Theorem 7, pp. 217–218. III §3: the even
  and odd K-theory pairings, Propositions 2–3, pp. 229–230. Chapter IV §1:
  p-summability for p≥1 and the Hölder corollary, Definition 3, p. 296;
  matrix amplification, Proposition 2, p. 295; the trace cyclicity on
  dual Schatten classes, p. 300; the conditional trace and
  its cycle, Proposition 1, p. 299; compatibility with S, Proposition 2,
  p. 300; the character normalization, Definition 3, p. 302; the index
  theorem, Proposition 4, p. 303. IV §2: the Dixmier trace, Definition 2,
  p. 312; the Tauberian criteria, Propositions 3–4, pp. 312–313; the
  Hochschild class, Theorem 8, p. 315. IV §6: the Heisenberg module and
  its connection, pp. 356–357; its elliptic index formula, pp. 358–361, is
  cited for comparison only. IV Appendix C: the partial-sum norms of
  `L^(p,∞)` and `L^(1,∞)`, p. 453.
- N3's odd character coefficient is minus the coefficient printed in
  Connes IV §1, Definition 3, p. 302, while N2's odd pairing constant is
  positive; the Hardy compression calculation fixes agreement with
  the kernel-minus-cokernel index and OperatorKTheory K6.
- The ordered Fourier triple, its chosen second Clifford sign and its
  Gaussian chiral calculation in N7 specify the comparison required
  here; they are not left to a convention implicit in the elliptic
  formula of Connes IV §6.
- Mathlib's multilinear, derivation, homological-complex, compact-operator
  and Fredholm APIs fix the foundational vocabulary. Tau Ceti's
  `Algebra/Lie/Derivation/Basic` supplies the noncommutative derivation
  carrier and its Leibniz/inner/conjugation API. Its
  `Analysis/Fredholm/{SmallPerturbation,CompactPerturbation,ContinuousFamily}`
  modules and the K4 index comparisons are suppliers, not private
  substitutes. Mathlib's `ContinuousLinearMap.IsFredholm`,
  `ContinuousLinearMap.FredholmPackage` and `IsFredholm.index_comp` in
  `Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean` fix the native
  operator/index interface.
