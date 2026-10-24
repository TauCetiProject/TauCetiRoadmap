# Subfactors, Jones index, and planar standard invariants

Build the theory of finite-index inclusions of II₁ factors, their Hilbert
bimodules, basic constructions, relative inclusion entropy and standard invariants. Prove Jones index
quantisation by constructing a trace-compatible Temperley–Lieb action and
applying the independent algebraic positivity theorem. Develop planar
algebras as usable libraries, reconstruct standard invariants analytically,
and prove completeness for finite-depth hyperfinite inclusions. Include a
separate extended-positive-cone and rotation theory for infinite-dimensional
bimodules; its conclusions retain their actual extremality hypotheses.

## Scope, conventions, and dependencies

Unless a milestone explicitly states otherwise, N⊆M are unital inclusions
of II₁ factors with separable predual, represented normally. Their normalized
traces are τ_N and τ_M, and τ_M restricts to τ_N. The index is
`[M:N]=dim_N L²(M)` in [0,∞]; finite index is an additional assumption.
The finite-index tower is `M_(−1)=N`, `M_0=M`,
`M_(k+1)=⟨M_k,e_(k+1)⟩`, k≥0. The projection e_(k+1) implements
expectation from M_k to M_(k−1). Every tower trace is normalized.
Inner products are conjugate-linear in the first variable.

For a finite index d let δ=√d>0. Algebraic TL generators U_i satisfy
`U_i²=δU_i` and `U_i U_(i±1) U_i=U_i`; they are δ times the
Jones projections, whose adjacent triple-product coefficient is d⁻¹.
TL prose labels are one-based, as in the analytic TL roadmap; the native
`TauCeti.TemperleyLieb` index is i−1. Closure trace T_n has value δⁿ
on 1; the tower trace pulls back to δ⁻ⁿT_n. Injectivity of a TL action
is a separate conclusion and is not assumed for the index restriction.

Use shaded box spaces `P_(n,+)=N'∩M_(n−1)` and
`P_(n,−)=M'∩M_n` for n≥1, with both zero-box spaces ℂ in the
connected case. The distinguished interval and shading fix the boundary
order. Reflection conjugates coefficients. A closed contractible circle
has value δ in the extremal spherical case. An isomorphism of standard
invariants preserves the distinguished inclusion, both shadings, traces,
expectations, Jones projections and all tangle operations; an unlabelled
principal graph is substantially weaker data.

- [VonNeumannAlgebras V0–V7](../VonNeumannAlgebras/README.md) supplies
  normal representations, tracial L², commutants, dimension and the
  initial index identities. The basic-construction APIs are built in S2.
  V10–V11 supplies modular
  theory, general standard forms and extended positive cones;
  V13 supplies the hyperfinite II₁ factor R and its corner comparisons;
  V8 supplies the normal discrete crossed products used in S10.
  Consume these foundations; S2 supplies the inclusion/tower APIs and
  finite bases required below; S9 supplies connections.
- [TemperleyLiebOperatorAlgebras A1–A5](../TemperleyLiebOperatorAlgebras/README.md)
  supplies complex diagram theory, the analytic adjoint, positive Jones
  quotients and the independent Hermitian trace-positivity theorem.
  Its ordinary algebraic suppliers are [TemperleyLieb #58](https://github.com/TauCetiProject/TauCetiRoadmap/pull/58)
  and [PivotalSpherical #57](https://github.com/TauCetiProject/TauCetiRoadmap/pull/57).
  S3 supplies the actual trace-compatible operator-algebra action.
- [CStarAlgebras C1–C5](../CStarAlgebras/README.md) supplies finite
  C*-algebras, tensors and inductive limits. [HilbertModules H1–H3](../HilbertModules/README.md)
  supplies the C*-module tensor products and compact-operator comparisons; normal Hilbert
  correspondences and Connes fusion belong to S1.
- [FreeProbability F3–F4](../FreeProbability/README.md) supplies scalar Fock and tracial amalgamated-free-product models.
  S8 constructs the planar graded completions themselves.
- [OperatorAlgebraDynamics D8](../OperatorAlgebraDynamics/README.md) supplies
  CAR Fock/Bogoliubov input for S10's concrete example; the new
  Hilbert–Schmidt outerness/implementation criterion is a target in S10.
- [GeometricTopology](../GeometricTopology/README.md) owns knot/link
  invariants. [CategoricalOperatorAlgebras](../CategoricalOperatorAlgebras/README.md)
  consumes this roadmap's bimodules and planar invariants for Q-systems,
  module-category interpretations and planar-to-C*-algebra completions.
  Those later categorical constructions are not prerequisites here.

The inclusion/standard-invariant scope is II₁; S2a also defines relative
entropy for arbitrary finite von Neumann algebras with a chosen faithful
normal tracial state. S1 develops correspondences
for arbitrary von Neumann algebras so its fusion API also supports
categorical applications over type III factors. General Kosaki-index
classification for other factor types, the complete exceptional enumeration
through index 5¼, arbitrary infinite-index reconstruction, and unrestricted
classification of inclusions with a given standard invariant are outside
scope. Graph restrictions, ADE below 4, graph embeddings and evaluability
tools are included. No historical conjecture is a theorem target.

[Suggested.lean](Suggested.lean) is a representative prototyping aid;
this README is the definitive specification.

## S1. Normal correspondences and relative tensor products

An M–N correspondence is a complex Hilbert space H with commuting normal
unital *-representations of M and Nᵐᵒᵖ. Build intertwiner spaces, closed
invariant subspaces, orthogonal direct sums, conjugate correspondences,
unitary equivalence and functorial changes of coefficients. Compare the
right-action notation with Mathlib's opposite-algebra convention. Construct
L²(M) as the identity correspondence using the general standard form,
including nonsigma-finite M. The conjugate flips the two actions and
complex scalars; prove the double-conjugate and intertwiner-adjoint laws.

Construct Connes fusion `H ⊗_N K`. For a faithful normal semifinite weight
ψ on N, use the opposite weight ψ^op on N^op: right boundedness
means `Λ_(ψ^op)(y^op)↦ξ·y` extends to a bounded right-N-linear
map. Identify its domain with L²(N,ψ) using
`Λ_(ψ^op)(y^op)↦JΛ_ψ(y*)`, and denote the resulting operator
by R_ξ. This fixes the modular right action; Λ_ψ(y)↦ξy is
not the bounded-vector definition for a nontracial weight. Set
`⟨ξ⊗η,ξ'⊗η'⟩=⟨η,(R_ξ*R_ξ')η'⟩`, interpreting the operator
in `(N^op)'=N` by the standard form and K's left action. Prove positivity on
finite sums, quotient by the null space and complete; build both normal
outer actions. Prove density of the bounded-vector domain and independence
of the weight through canonical unitary comparisons. Supply the
associator, left/right unitors and conjugation comparison with their
pentagon/triangle identities, and fusion of bounded intertwiners with
norm estimates and adjoint compatibility. Compare with H3's interior
C*-tensor product when a normal completion is present.


## S2. Expectations, bases, and the Jones tower

Consume the trace-preserving expectation E_N and orthogonal Jones
projection e_N on L²(M). Develop their defining identities,
`e_N x e_N=E_N(x)e_N`, `e_N∈N'`,
`⟨M,e_N⟩=JN'J`, and the identification with bounded right-N
endomorphisms of L²(M). Build the canonical semifinite trace on the
basic construction by `Tr(xe_N y)=τ_M(yx)`, with its normality,
faithfulness and finite-trace ideal. Prove `Tr(1)=[M:N]`, so finite
index exactly makes this factor finite. Give the inclusion/fusion
comparison and commutant/corner dimension identities, rather than
postulating finite-dimensionality of relative commutants.

For finite index construct a finite right basis b_i with
`x=Σ_i b_i E_N(b_i* x)` and the adjoint formula. Develop the matrix
projection encoding the module, independence of basis, and
`Σ_i b_i b_i*=d1`. Establish the Pimsner–Popa inequality
`E_N(x)≥d⁻¹x` for positive x and optimality of d⁻¹ for factor
inclusions; at infinite index the optimal uniform coefficient is zero.
Compare the basis, dimension and expectation formulations. Prove
V7's multiplicativity through intermediate factors, `[M:N]≥1`,
and index1/equality criterion in the new tower API. Prove finite-dimensionality of N'∩M at finite index,
and relative-commutant dimension bounds. Prove the local-index
formula for p∈N'∩M nonzero:
`[pMp:Np]=tr_(N')(p) τ_M(p) [M:N]`, where tr_(N') is
the normalized commutant trace in the L²(M) representation;
For a nonzero finite left-M module H also prove
`dim_N(pH)=tr_(N′ on H)(p) dim_N(H)` and
`dim_(pMp)(pH)=dim_M(H)/τ_M(p)`, hence the same local-index
formula with H's normalized commutant trace. These two
traces are not identified in a nonextremal inclusion.

Iterate the basic construction with explicit embeddings, expectations and
normalized traces. Prove constant consecutive index d,
`τ_(k+1)(e_(k+1))=d⁻¹`,
`E_(M_k)(e_(k+1))=d⁻¹1`, all Jones projection relations,
and trace/expectation compatibility at every level. Give the dense spans
by alternating words and finite basis expansions, tensor-power
identifications with L²(M_k), and corner/canonical-shift isomorphisms
on relative commutants. Develop intermediate-factor expectations and
Jones projections, with inclusion reversal and lattice comparisons.
Supply finite group fixed-point and crossed-product examples: for an outer
action of a finite group G, compute index |G| and relative commutants,
including duality between the two examples.

For finite factors compare left/right von Neumann dimensions, standard
module realizations and commutant traces from V7. Define bifiniteness by
finiteness on both sides, and construct conjugate/coevaluation/evaluation
maps for bifinite correspondences. Prove the conjugate equations,
standard-solution normalization, statistical dimension, its invariance,
additivity and multiplicativity under fusion, and equality of the two
standard traces on endomorphisms. Do not identify statistical dimension
with either one-sided von Neumann dimension for an arbitrary bimodule.
Build irreducible decomposition of bifinite correspondences, finite
multiplicity Hom spaces and rigidity; this is the concrete analytic
bimodule category, rather than a duplicate abstract tensor-category theory.

Build the index of a chosen faithful normal finite-index expectation E
using its dual operator-valued weight and V11's spatial derivative;
for factors `Ind(E)=E^(-1)(1)` is a scalar. Prove
`Ind(E_N)=[M:N]`. For positive invertible h∈N'∩M with E_N(h)=1,
construct `E_h(x)=E_N(h^(1/2)xh^(1/2))` and prove
`Ind(E_h)=[M:N] tr_(N')(h^(-1))`; develop uniqueness of this
Radon–Nikodym parametrization and the weighted GNS/tower comparison.
At finite Jones index, prove every normal conditional expectation E:M→N
has a unique positive h∈N′∩M with E_N(h)=1 and `E(x)=E_N(hx)`; this equals the
half-density formula above. Use N-centrality of τ_N∘E to locate its
Radon–Nikodym density in the finite-dimensional relative commutant.
Prove E faithful iff h is invertible, and then finite index holds.
Thus the minimum below ranges over all faithful normal expectations.
Define the minimal index as the infimum over these expectations,
prove it is achieved by a unique minimal expectation E_0, and prove
`Ind(E_0)=d(X)^2≤[M:N]` for X=_N L²(M)_M with S2's standard
duality. Construct E_0 and its density from the central block dimension
ratios, so minimality and uniqueness are theorems, not assumptions.
Explicitly, for the minimal central projections z_i of N'∩M put
r_i=τ_M(z_i), s_i=tr_(N')(z_i), and c=Σ_i√(r_i s_i).
Prove `h_0=Σ_i c⁻¹√(s_i/r_i) z_i`,
`Ind(E_0)=[M:N] c²`, and `d(X)=√[M:N] c`.
Use the finite-dimensional weighted Cauchy–Schwarz inequality and
strict convexity of inversion for the minimum, and compare with
standard conjugate solutions for the statistical-dimension formula. Develop
the distortion ratio of an irreducible bifinite sector Y as
`ρ(Y)=dim_left(Y)/dim_right(Y)`. Prove its inversion under conjugation,
multiplicativity along nonzero fusion constituents of irreducible
sectors, and the criterion that a bifinite bimodule is extremal exactly
when its irreducible constituents have a common ratio. Prove the
standard-trace comparison and preservation of extremality under fusion
needed for these identities. In a finite generated even-sector family
a positive ratio and all its powers take only finitely many values,
so that ratio is1. Applied to constituents of X_i⊗X̄_j this gives
a common ratio for the distinguished odd sectors. S5 uses this
argument to prove finite-depth extremality.

### S2a. Relative entropy of finite tracial inclusions

For a unital inclusion N⊆M of finite von Neumann algebras carrying a
faithful normal normalized trace τ_M, consume V6's trace/L² construction
and V11's trace specialization of Takesaki's expectation theorem.
These supply the unique normal trace-preserving conditional expectation
E_N:M→N, its positivity, bimodularity, projection and composition laws.
S2 develops its II₁ inclusion and Jones-tower applications. No factor
hypothesis is imposed on the entropy definition below.

Put η(t)=−t log t for t≥0, η(0)=0, using natural logarithms and continuous
functional calculus on positive elements. For finite positive partitions
of unity x₁,…,x_n∈M₊, Σ_i x_i=1, define

`H(M|N)=sup_(x_i) Σ_i [τ_M(η(E_N(x_i)))−τ_M(η(x_i))] ∈ [0,∞]`.

Prove trace Jensen for η under E_N, using spectral approximation and
scalar Jensen on compressed states, or operator Jensen. Handle the zero
spectral endpoint by continuity; no commutativity of M is assumed.
Prove that each partition value is real and nonnegative, that the identity
inclusion has value zero, and that each partition value is bounded by the
extended supremum. Prove invariance under trace-preserving inclusion
*-isomorphisms and conditioning monotonicity: N⊆P⊆M gives
`H(M|P)≤H(M|N)`. For II₁ subfactors prove `0≤H(M|N)≤log[M:N]`,
allowing ∞. Build operator-log monotonicity on positive invertible
elements and use S2's optimal Pimsner–Popa inequality for this bound,
regularizing noninvertible partition elements before passing to the limit.

Prove Pimsner–Popa Theorem4.4 for a II₁ factor M and subfactor N⊆M.
A diffuse part of N′∩M gives H(M|N)=∞. If N′∩M is atomic with minimal
projections f_k summing to1, then

`H(M|N)=Σ_k τ_M(f_k) log([f_kMf_k:Nf_k]/τ_M(f_k)^2)`.

There is no finite-index hypothesis in this formula. An infinite corner
index gives an infinite extended value. At finite index d=[M:N], prove
Corollary4.5's equivalence of the following conditions:

- H(M|N)=log d;
- every minimal relative-commutant projection f has
  `[fMf:Nf]/τ_M(f)^2=d`;
- τ_M and S2's normalized commutant trace tr_(N′) agree on N′∩M;
- the linear anti-isomorphism `x↦Jx*J` from N′∩M to M′∩M₁
  preserves the normalized traces; equivalently `x↦JxJ` conjugates
  their complex trace values.

Use S2's explicit h_0 and block-trace formula to prove these conditions
equivalent to minimality of the trace-preserving expectation. Given any projection
e∈M with E_N(e)=d⁻¹1 from a downward basic construction, prove these
conditions are also equivalent to `E_(N′∩M)(e)=d⁻¹1`: the criterion
holds for one such projection exactly when it holds for every such
projection. This is a projection in M, distinct from e_N∈M₁.

Prove N′∩M=ℂ implies H(M|N)=log[M:N] at finite index. The converse
in Corollary4.6 additionally requires `4<[M:N]<8` and exclusion of
every value `(1+2cos(π/n))²`, n≥3. A global equality-iff-irreducible
claim is not asserted.

## S3. The TL action and index restriction

For every finite-index inclusion construct the compatible unital algebra
maps `TL_n(ℂ,δ)→M_(n−1)` by `U_i↦δe_i`, i=1,…,n−1.
Here the native `TauCeti.TemperleyLieb.e δ i`, with zero-based i,
is U_(i+1); its image is δ times the Jones projection e_(i+1).
Check the native universal property's relations and conjugate adjoint.
Prove the diagram closure trace pulls back from the normalized tower
trace as `τ∘ρ_n=δ⁻ⁿT_n`, using its value on1, strand inclusions,
Markov relation and trace uniqueness. No extremality or irreducibility
is required for this tower calculation.

Apply A4's positivity theorem to deduce

```
[M:N] ∈ {4cos²(π/m) : m≥3} ∪ [4,∞]
```

for all II₁ inclusions: the infinite case belongs to the extended
interval, and only the finite case uses δ and the TL action. Prove the
restriction independently of realization. At finite index prove the
kernel of each TL action is exactly its trace radical, using faithfulness
of the receiving trace after passing to the positive quotient. In
particular obtain faithful actions of the Jones quotients; never assert
faithfulness of unquotiented root-parameter TL. Prove index below4
forces irreducibility from the relative-commutant bounds.

## S4. Finite-dimensional towers and realization of all indices

For finite-dimensional C*-inclusions with connected Bratteli graph
build inclusion matrices,
Markov traces, basic constructions and weighted path-algebra towers.
Prove the Perron–Frobenius dimension equations, positivity and uniqueness
of the normalized Markov weights and index equal to the squared graph
norm. For a finite-dimensional square with one faithful normalized trace,
whose restrictions are Markov for all four inclusions,

```
A_0 ⊆ A_1
 ∩     ∩
B_0 ⊆ B_1,
```

For each unital subalgebra C of B_1 let E_C be its trace-preserving
conditional expectation, viewed as an operator on B_1. Define the square
to be commuting by `E_(A_1) ∘ E_(B_0)=E_(A_0)`. Prove equivalence with
`E_(B_0) ∘ E_(A_1)=E_(A_0)`, with the restriction identity
`E_(B_0)|_(A_1)=E_(A_0)|_(A_1)`, and with commutation of the two
expectations together with `A_1∩B_0=A_0`. Construct their L² orthogonal
projections and prove the corresponding projection-product identities.
Give transport under trace-preserving isomorphisms of squares and the
restriction and inclusion compatibility of these expectations.

Define symmetry separately by `span(B_0 A_1)=B_1`. For a commuting
symmetric square prove propagation through basic constructions, retaining
the equality with the expectation onto each designated smallest corner. Prove
equivalence of the spanning condition with Jones–Sunder
5.3.4(b),5.3.6's
symmetry under the all-four-connected hypotheses.

Include the tensor-leg example with normalized product trace,
`B_1=M₂⊗M₂⊗M₂`, `A_1=M₂⊗M₂⊗1`, `B_0=M₂⊗1⊗M₂` and `A_0=ℂ1`.
Compute the intersection `A_1∩B_0=M₂⊗1⊗1` and
`E_(A_1)E_(B_0)=E_(M₂⊗1⊗1)`, and verify the spanning condition.
All four inclusions are connected and Markov, but this is not a commuting
square over A_0; compute the horizontal parameters as `1/16` and `1/4`.
Build the two horizontal basic-construction towers (A_j)_j and (B_j)_j
and their vertical inclusions A_j⊆B_j. Define the higher-row grid
A_j^r by A_j^0=A_j, A_j^1=B_j and the vertical basic construction
`A_j^(r+1)=⟨A_j^r,f_(j,r)⟩` for r≥1. Prove every new grid square
commuting, symmetric and Markov, with compatible expectations/projections.
For a commuting symmetric square prove equality of the two horizontal
Markov parameters and of the two vertical ones. Assume connected horizontal
and vertical inclusions and common horizontal graph norm >1 for the II₁
weak-limit construction. Prove path-tail ergodicity and unbounded matrix-
size growth from these assumptions, and show
`R_r=(⋃_j A_j^r)''` is the hyperfinite II₁ row factor. Horizontal
norm1 cases have finite matrix limits; handle their tensor product
with R as a separate factor model. Establish the normal expectations
and index of R_0⊆R_1 from the vertical inclusion matrix.

Prove Ocneanu compactness with exact column indices:
`R_0'∩R_1=A_1'∩B_0`, and for r≥1,
`R_0'∩R_r=(A_1^0)'∩A_0^r`. Identify each finite-column algebra,
its trace, expectation, Jones projections and embeddings. Supply the
finite-stage relative-commutant calculation, conditional-expectation
convergence in L² and the boundedness passage to the weak limits.
Pass vertical Jones projections, expectations and dense basic-
construction spans to the weak limits and prove
`R_(r+1)=⟨R_r,f_r⟩`. Only then identify S2's M_(r−1) with R_r
for N=R_0,M=R_1. Include a square that
commutes but is not symmetric and show why its relative-commutant
comparison fails; symmetry is a substantive hypothesis.

Consume A2–A3's weighted A_(m−1) paths and A5's C*-tower/trace
completion. For m>3 construct the trace-preserving first-strand shift
`U_i↦U_(i+1)` and its tail subalgebra. Prove its weak closure N_δ
and the full tower closure M_δ are hyperfinite II₁ factors.
Begin the two-row square at n₀=m−1, after the quotient path diagram
has reached every allowed parity vertex: use
`A_j=Alg{e₂,…,e_(n₀+j)}`, `B_j=Alg{e₁,…,e_(n₀+j)}`.
Prove this range has the stabilized A_(m−1) inclusion graph, the
restricted TL trace is Markov, and the initial/all propagated squares
are commuting, symmetric and connected. Compare their weak limits
with N_δ⊆M_δ and compute index δ². The small initial TL levels
need not have Markov weights, and are not used as the initial square.
Realize `4cos²(π/m)` in R for every
m≥3, including m=3 as the identity inclusion. For each real d≥4 choose
t∈(0,1) with `d=t⁻¹+(1−t)⁻¹`, a trace-t projection p∈R, and an
isomorphism θ:pRp→(1−p)R(1−p) from V13. Show
`N={x+θ(x):x∈pRp}` is a unital II₁ subfactor and compute its index d
from the corner/module formula. This construction is allowed to be
reducible. For t≠1/2, equivalently d>4, identify its relative commutant
as Cp⊕C(1−p), its two corner inclusions as identities, and apply S2a
to prove `H(R|N)=2η(t)+2η(1−t)<log d`, where η(u)=−u log u.
At d=4 prove H(R|N)=log4.
Realize infinite index by `R⊗1⊂R⊗̄R`: prove both algebras
II₁ factors and use `L²(R⊗̄R)=L²(R)⊗L²(R)` to compute its
left R-dimension as infinity. Conclude every allowed extended
index occurs, without claiming every value has an irreducible R⊆R model.

## S5. The standard invariant and principal graphs

Construct the finite-index relative-commutant grid, both towers and traces,
conditional expectations, Jones projections, canonical shifts and their
commuting squares. Define its trace-preserving isomorphisms with all
structure maps and prove functoriality under inclusion isomorphisms.
Identify its entries with intertwiner spaces between alternating tensor
powers of the distinguished N–M correspondence and its conjugate.
Prove these identifications respect compositions, adjoints, fusion,
expectations and the two canonical traces.

Define extremality by equality of the left and right canonical normalized
traces on End_N–M(L²(M)), equivalently N'∩M in the fixed conventions.
Prove independence of representations and the trace criteria; S6
adds rotation equivalences after constructing rotations. Irreducibility implies extremality. In S4's diagonal-corner example
with t≠1/2, compute tr_(N')(p)=1−t and τ_M(p)=t to prove
nonextremality despite finite index. Prove E_N is minimal iff the
inclusion is extremal, equivalently d(X)^2=[M:N]. By S2a these are
also equivalent to H(M|N)=log[M:N].
Define finite depth by finiteness of the irreducible bimodule sectors
generated by the inclusion, equivalently no new principal-graph vertices after some finite
depth, equivalently the relative-commutant tower becomes a basic
construction after a finite stage. This is distinct from S7's
nonbranching graph-stability condition. Give the concrete decomposition and equivalence
proofs and graph finiteness criterion. Prove finite depth forces
extremality by tensor-power dimension ratios and finiteness of the
generated sectors; do not assume it merely from finite index.

Construct the rooted principal and dual principal bipartite multigraphs
from fusion by the distinguished bimodule. Vertices are irreducible sectors
of the appropriate parity; edges are fusion multiplicities. Develop path
counts, first occurrence/depth, truncations, adjacency on ℓ² of vertices,
positive dimension vectors and root normalization. Identify relative-
commutant block sizes with path counts. For the distinguished bimodule X prove
`‖Γ‖≤d(X)≤δ`; finite depth gives equality throughout. Define an amenable graph in the extremal case by equality of its norm
with δ; finite depth supplies that equality without
an extra graph-amenability assumption. Do not equate principal and dual graphs or infer the invariant
from either graph alone. Compare finite group examples and TL A-series.

## S6. Shaded planar algebras and nonextremal data

Define shaded tangles by oriented boundary circles, distinguished intervals,
checkerboard shading, and nonintersecting strings, modulo isotopy preserving
that data. Develop a combinatorial encoding with gluing, units, reflection,
rotation and the operadic associativity/equivariance laws; explain how the
geometric isotopy and discrete encoding compare by a bijection respecting composition,
reflection and distinguished intervals; its inverse realizes the
combinatorial matching as a tangle up to the specified isotopy. Define a complex planar
algebra by linear tangle operations on both shaded box families and their
composition laws. Construct morphisms, kernels, subalgebras, ideals,
quotients, direct sums and tensor products with their operation formulas.

Build the named multiplication, inclusion, left/right closure,
expectation, trace, Jones projection and rotation tangles and prove their
relations. Prove that the elementary tangles and the explicit local
isotopy/gluing relations present the entire shaded planar operad;
include multiplication associativity/unit, inclusion–multiplication
exchange, the two cup–cap cancellation laws, nested-expectation laws,
rotation with its boundary-order action, disjoint-disc exchange and
reflection compatibility, with all colors/subscripts specified. Give
normal forms and prove completeness of those relations. Define connectedness, finite-dimensional boxes, evaluability,
the conjugate-linear reflection, positive definite closure pairings and
sphericality as invariance of closed evaluations under spherical isotopy.
A subfactor planar algebra here is connected, finite dimensional at each
level, positive and spherical, with common circle modulus δ. Derive its
finite C*-box algebras and Markov tower. Construct the universal TL
box action, compare its closure trace, and apply A4 directly for the
parameter restriction, in parallel with S3's operator-algebra action.
These definitions do not assume a reconstructed inclusion.
Build TL and finite-group planar algebras as actual tangle-algebra examples.

Define the rigid shaded operad by the same boundary data with internal
discs restricted to scaling and translation during isotopy; internal-disc
orientations stay fixed. Use Burns's left distinguished interval: positive
shading means its adjacent distinguished region is white, negative means
black. Work in the oriented plane with counterclockwise angles positive.
Orient strings with the black region on their right; Θ is the signed
change of tangent angle, including its winding multiple of2π. Use this
same angular convention for disc rotations, composition and reflection.

A rigid C*-planar algebra is an action of this operad with conjugate-linear
reflection, connected zero-box spaces, finite-dimensional boxes, identity
action of the radial-string annulus, equal positive circle modulus δ_rig,
and positive definite left/right closure pairings. Construct the rescaling
equivalence arranging equal moduli from the nonzero two-modulus convention.
Develop morphisms, kernels, subalgebras and operation identities.

Use Φ_k for the closure pictured on the right of the marked disc in
Burns §2.2.2 and Φ'_k for the one on its left, with the distinguished
interval on the left. Normalize `φ_k=δ_rig^(−k)Φ_k` and
`φ'_k=δ_rig^(−k)Φ'_k` as faithful states.
Write P_k^(0)=P_(k,+), P_k^(1)=P_(k,−), with superscripts modulo2.
Construct the left-string embeddings
`γ⁺:P_(k,+)→P_(k+1,−)` and `γ⁻:P_(k,−)→P_(k+1,+)`.
Let V_(j,k)^(r) be the image of P_(k−j)^(r+j) in P_k^(r) obtained by
adding j strings on the left. Construct the unique Radon–Nikodym
element w_(j,k) satisfying `φ'_k(x)=φ_k(w_(j,k) x)` there. Prove
from the closure-tangle identities that it is positive invertible and
belongs to the φ_k-centralizer, retaining the shading. Put `w_k=w_(k−1,k)`, `z_k=w_(0,k)`, suppressing
positive shading below.

Construct the action of the specified annular tangle T𝒥_k^(r) in
Burns Definition2.2.10, with its inner and outer marked intervals on the
left, as algebra anti-isomorphisms `𝒥_k^(r):P_k^(r)→P_k^(r+k)`.
Use that tangle itself and prove its state-interchange and adjoint laws. Independently of the weight formulas, define
`Δ_k^(r)=𝒥_k^(r+k)∘𝒥_k^(r)` as in Definition2.2.15. Prove Δ is
positive definite on `L²(P_k^(r),φ_k)`; define its real powers by finite-
dimensional functional calculus. Script 𝒥 is a tangle map, distinct from
standard-form modular conjugation J.

Set w=w_(0,1) and `w̃=(𝒥_1^(1))⁻¹(w⁻¹)∈P_(1,−)`.
Prove Lemma2.2.14 in the common higher-box embeddings:

`w_(2r+1)=(γ⁻γ⁺)^r(w)` for r≥0,
`w_(2r)=(γ⁻γ⁺)^(r−1)γ⁻(w̃)` for r≥1,
and `z_k=w₁w₂⋯w_k`.

Derive Corollary2.2.18: for x∈V_(j,k)^(0), real t and the GNS map x↦x̂,
`Δ_k^(0)^t x̂=(w_(j,k)^(−t/2) x w_(j,k)^(t/2))̂`.
The full-box formula uses z_k. Prove
`Δ_k^(0)=I ↔ z_k∈Z(P_(k,+))` and the negative-shading analogue.
These statements concern the resulting rigid data; state centralizers
and algebra centers are distinct. Construct §2.2.3's modular extension:
an isotopy rotating an internal input of color (r,k) by θ corrects that
input by `Δ_k^(r)^(−θ/(2π))`. Prove the gluing/isotopy comparisons
and recover ordinary planar rotations when Δ=I.

Prove Burns2.2.36: sphericalize every rigid object above by inserting
`w^(−Θ/(4π))` on each oriented string. Prove the induced box
involution and all operation comparisons, equality of its two closure
states, traciality and sphericality. With λ=φ_1(w^(1/2)) in the starting
rigid data, prove `δ_sph=λ δ_rig` from the circle evaluation.

Conversely, take any positive invertible w∈P_(1,+) in spherical data.
Rescale by its unique positive scalar to arrange
`tr_sph(w^(1/2))=tr_sph(w^(−1/2))=a`, with tr_sph the normalized
first-box trace. Prove a≥1 by Cauchy–Schwarz:
`tr_sph(w^(1/4)w^(−1/4))²≤tr_sph(w^(1/2))tr_sph(w^(−1/2))`,
with equality exactly when balanced w is1. Insert `w^(Θ/(4π))` and
restrict to the rigid operad. Prove its first RN weight is w and its
shifted weights are those above. A full positive turn has Θ=2π;
compute both rigid circle moduli as `a δ_sph`. Prove the two angle
constructions inverse on weighted data, with λ=a⁻¹ and
`δ_sph=δ_rig/a`. Prove the allowed rigid-isotopy, composition,
reflection, positivity and loop/trace identities. Reflection reverses
both string parameter and planar orientation, preserving Θ. The
original conjugate-linear box involution is preserved.

For extremal finite-index N⊆M construct the spherical action on S5's
relative commutants. Verify every generating tangle, isotopy and
positivity law from the operator-algebra maps, identify all traces and
projections, and prove sphericality precisely from extremality.
For any chosen faithful normal finite-index expectation E:M→N construct
the rigid action of common modulus √Ind(E) on its expectation-weighted
GNS/Jones tower. Pin the first unprimed positive closure by
`φ_1(x)=τ_N(E(x))`, x∈N′∩M; φ'_1 is the dual/commutant closure.
Use iterated expectation closures for higher boxes and identify them
with the abstract closure tangles above. Compare both rotation
conventions by their constructed modular operators, and prove equality
of the canonical states gives the spherical specialization.
Sphericalization of the trace-expectation rigid data has modulus d(X).
A change of expectation carries its weight data. In the spherical
reconstruction with `h=a⁻¹w^(−1/2)`, verify
`φ_1(x)=tr_sph(hx)` and
`φ'_1(x)=tr_sph(h⁻¹x)/tr_sph(h⁻¹)=φ_1(wx)`;
identify the chosen-expectation index as `a² δ_sph²`. S8 constructs
the reconstructed inclusion and transports these operation comparisons.

Include `N=R⊗1⊂M=R⊗M₂`, `w=diag(4,1/4)`, a=5/4 and
`h=diag(2/5,8/5)`. The unprimed state density is h; the dual state
density relative to normalized matrix trace is diag(8/5,2/5). Verify
their RN derivative is w, Δ_1^(0) sends E₁₂ to E₁₂/4, and
`Ind(E_h)=25/4` while `[M:N]=4`. In the Hilbert–Schmidt second-box
model identify `z₂=L_w R_(w⁻¹)`, with eigenvalues 1,16,1/16,1 on
E₁₁,E₁₂,E₂₁,E₂₂. Verify z₁ and z₂ are noncentral. Apply S2a to the
trace inclusion to compute H(M|N)=log4, independently of h. Centrality
holds precisely when the corresponding Δ is I.


## S7. Graph planar algebras, embeddings, and evaluation

For a finite connected bipartite graph Γ with positive Perron–Frobenius
weights, construct its graph planar algebra from based even loops and
weighted state sums. For an oriented edge e from a region labeled v to a region labeled w,
pin its local extremum weight as `sqrt(μ(w)/μ(v))`; reversing the
region order gives the reciprocal. State cups/caps by the oriented
region order, with positive Real.sqrt throughout.
Prove finite-box basis and matrix-block formulas, tangle composition,
reflection, positive trace, and independence of vertex-weight scaling.
Its zero-box spaces consist of functions on vertices of each parity and
are generally larger than ℂ. A connected planar subalgebra need not be
the full graph planar algebra.

Fix a spherical subfactor planar algebra P from S6 with modulus δ>0.
Define the shaded right planar-module operad: replace the output disk's
marked interval by a left wall with unshaded adjacent region; full-disk
inputs carry P boxes and wall-attached semidisk inputs carry module boxes.
An output or input semidisk with 2k string endpoints has type k and
carries Mₖ; this fixes the exponent in its closure normalization.
Its action is multilinear
`(⊗ᵢ M_(kᵢ))⊗(⊗ⱼ P_(ℓⱼ,±ⱼ))→M_(k₀)` in the prescribed input order.
Specify typed plugging, identities, reflection and input permutations.
A right planar module has finite-dimensional spaces Mₖ, conjugate-linear
dagger and this operad action extending P's action. Multiplication tangles
make Mₖ finite-dimensional C*-algebras; closure maps
`Trₖ:Mₖ→M₀` are positive, faithful and tracial.
Connectedness means `dim M₀=1`; identify M₀ with ℂ and normalize
`trₖ=δ⁻ᵏTrₖ` as faithful tracial states. Define morphisms by linear
dagger-preserving box maps intertwining every module tangle, and prove
identity, composition and isomorphism transport. Connectedness fixes the
unique level-zero root of the tower graph.

Construct its Markov tower `M₀⊂M₁⊂⋯` using strand addition, with
compatible tracial states and projections `eₙ∈M_(n+1)` for n≥1.
These are the module-tower indices of the source: eₙ implements Eₙ.
When comparing with S2's algebra tower, the projection implementing
Mₙ→M_(n−1) there is labeled e_(n+1); keep this index shift explicit.
Prove the normalized TL relations, `eₙxeₙ=Eₙ(x)eₙ` for x∈Mₙ,
`E_(n+1)(eₙ)=δ⁻²`, and pull-down `M_(n+1)eₙ=Mₙeₙ`, where
`Eₙ:Mₙ→M_(n−1)` is the trace-preserving expectation.
Prove `tr_(n+1)(xeₙ)=δ⁻²trₙ(x)` and the matrix-block decomposition
into the old ideal MₙeₙMₙ and its new simple summands Y_(n+1), with
Y₀=M₀ and Y₁=M₁. Define the
pointed principal graph from those new summands and their Bratteli
edges, and vertex dimensions `μ(v)=δᵏtrₖ(p)` for a minimal projection
p representing v first at level k. Prove `δμ(v)=Σ_(w∼v)μ(w)`.
Define the planar module's fusion graph as this tower graph. A tower
has finite depth when this pointed graph is finite, equivalently Yₙ=0
at some level; prove vanishing then persists. Its depth is the largest
k with Yₖ≠0. Construct P's regular right planar module Mₖ=P_(k,+)
and define P's principal graph and depth by this tower, independently
of S8's operator-algebra reconstruction. CA2b compares module tower
graphs with the strand action on the module projection category.
For finite-depth P prove the module tower has finite depth, bounded by
the depth of P (Coles–Huston–Penneys–Srinivas Lemma3.12).

Prove every finite-depth subfactor planar algebra embeds as a planar
*-subalgebra in the graph planar algebra of its principal graph. Build
the sufficiently shifted standard finite-dimensional inclusion, the
canonical relative-commutant planar algebra, its graph-loop identification
and the string-adding embedding; prove injectivity and all operation
comparisons. For a finite-depth subfactor planar algebra P and a connected
right planar P-module, construct a planar *-algebra embedding
`P→GPA(Γ_M)` via the Markov tower just built. Prove Γ_M is finite
and connected and its positive δ-eigenvector μ is a Perron–Frobenius
vector, hence `‖Γ_M‖=δ`; use this vector in the target state sums.
Normalize μ at the module root to one. Define a strongly Markov
finite-dimensional tracial inclusion of modulus δ by its canonical
basic-construction trace: multiplication by δ⁻² normalizes that trace
and its restriction is the given trace, and there is a finite
Pimsner–Popa basis (bᵢ) with `Σᵢbᵢbᵢ*=δ²1`.
Prove the equivalent conditional-expectation/basis identities.
Choose a sufficiently large even
shift so the adjacent finite-dimensional tower inclusion is strongly
Markov. Construct its canonical relative-commutant planar algebra from
the iterated basic construction, and identify it with GPA(Γ_M) using
path matrix units. The right planar-module action with added strings
defines the maps from P's boxes to these relative commutants. Prove
injectivity and compatibility with every tangle, dagger and trace.
Abstract pivotal
module C*-categories and their equivalence with these modules belong to
CategoricalOperatorAlgebras; the tower/planar-module construction here
has no dependence on that later equivalence.

Develop trains, caps, rotational eigenvectors, jellyfish relations and
trace evaluation algorithms. Given a finite generating set and verified
jellyfish/closure relations, prove terminating reductions evaluate closed
diagrams, and that the relations and positive trace determine the generated
planar algebra. Do not assume candidate relations are valid or positive;
these are explicit proof obligations for concrete examples.
Define graph stability at depth n by simple, nonbranching edges to n+1
with no mergers, and prove its tower/train-spanning equivalents. Prove
Bigelow–Penneys Theorems1.2–1.3 separately: for δ>2, paired-graph
stability at n and `Γ_+(n+1)≠A_(n+2)` gives both graphs finite and
stable at every k≥n; single-graph stability at both n,n+1 with the same
A-tail exclusion gives both graphs finite and paired stability for k≥n+1. Preserve the two
inputs, and give the spoke-graph/jellyfish equivalences with their precise
supertransitivity and shading hypotheses.

## S8. Analytic reconstruction and model comparisons

For a subfactor planar algebra P with δ>1 first construct the
Jones–Shlyakhtenko–Walker orthogonal model. Write
`F_k=⨁_(r≥0) P_(r+k,+)` with k through strings distinguished.
For homogeneous degrees r,s define its product by the sum of the
source's cup-contraction tangles with i=0,…,min(2r,2s), the ith
term of degree r+s−i. Pin each tangle by its marked interval and
k through strings; use the planar involution with that interval
convention. Prove unit, associativity and the conjugate-linear *-law.
Define `τ_k(x)=δ⁻ᵏT_k(x_0)` using the degree-zero box closure.
Thus τ_k(1)=1; degrees r>0 have trace zero. Prove
`⟨a,b⟩=τ_k(a*⋆b)` and orthogonality of unequal degrees, with
the same normalized closure factor in the equal-degree pairing.
There is one normalization factor δ⁻ᵏ, and inner products are
conjugate-linear in a. Prove τ_k faithful, positive and tracial.

Prove left multiplication by each homogeneous a bounded uniformly
in the input degree: split it into its at most 2r+1 contraction
operators and bound each through the finite C*-box norm. Construct
the Hilbert completion, adjoint/right multiplications, inclusions
and the generated finite von Neumann algebras W_k, with cyclic
separating trace vector. Call the cup-generated abelian algebra C_k (JSW's A). Analyze it:
build the normalized iterated-cup basis, its Jacobi matrices with
endpoint corrections, and the cup–cup bimodule decomposition into
the degree-zero part and the coarse summands of JSW Theorem4.9.
Prove the relative-commutant identities and factoriality/diffuseness
from that decomposition. This proves the II₁ assertion at δ>1
without a graph-planar embedding or a reconstruction theorem input.

Construct Jones projections and trace-preserving expectations by
the specified tangles. Prove `W_0⊆W_1⊆W_2⊆…` is a basic-
construction tower of index δ² and
`W_0'∩W_k≃P_(k,+)` with matching subscripts. For N=W_0,M=W_1,
S2's tower satisfies M_j=W_(j+1), so this is S6's
`N'∩M_(k−1)` convention. Prove the dual shading identification
and every inclusion/trace/expectation/Jones-projection/tangle
comparison (JSW Theorems4.20–4.21). Handle δ=1 separately:
prove connected positive subfactor planar data has the trivial
invariant and realize it by R=R. This realizes the standard invariant,
and asserts neither hyperfiniteness of the constructed inclusion
nor recovery of a prescribed input inclusion.

Now construct GJS's concatenation products ∧_k on the same direct
sums: homogeneous box indices m,n produce index m+n−k. Use
GJS Definition7's graded † and its comparison with box reflection.
Construct the triangular maps X,Y of JSW §5 by epi TL diagrams
and signed nonnested epi diagrams; prove XY=YX=id, multiplicativity,
*-compatibility and isometry. Transport the normalized trace to
obtain GJS's TL-pairing formula, proving the Markov/degree-zero
normalizations agree. Compare the GNS closures and towers through
these explicit maps. Positivity and reconstruction are already
proved in the orthogonal picture, so this comparison has no dependence
on a general graph-embedding theorem.

For the graph/Fock comparison, use the just-realized inclusion's
extremality and S2's concrete rigid bimodule category, following
Chen2024 §7. Its countably many principal sectors Y_v, finite
intertwiner spaces and the regular right-tensor action give a faithful
pivotal dagger action on their semisimple Hilbert-multiplicity category.
Construct the action, its tensorators/unitors and norm-preserving
path-matrix realization from S1's associator and S2's standard traces;
verify their coherence and duality rather than assuming an abstract
endofunctor-embedding theorem.

Normalize μ(v)=d(Y_v). For each edge v→w choose orthonormal
isometries `f:Y_w→Y_v⊗X`. Choose the reverse-edge basis by
Frobenius reciprocity, not independently:
`f̄=√(μ(v)/μ(w)) (f*⊗id_X̄)(id_(Y_v)⊗coev_X)`.
Prove the unrescaled reciprocal map has squared norm μ(w)/μ(v)
and these reverse maps are orthonormal; this pins the graph cup/cap
coefficient as √(μ(w)/μ(v)). Iterate these bases on based paths
to define every box matrix coefficient. Prove injectivity, uniform
operator-norm bounds and all elementary tangle comparisons, especially
rotation and reflection. Use S6's presentation for full tangle
compatibility. This proves the infinite-depth principal-graph embedding
without finite-depth stabilization (Chen Theorem7.9).

Extend S7's graph algebra to the connected locally finite graph with
bounded adjacency norm and positive δ-eigenvector μ. Prove the
degree bound δ² from fairness and reciprocal edge weights. The
eigenvector may be globally unbounded; adjacent ratios are controlled
by δ. Box algebras are uniformly bounded products of finite path-
endomorphism blocks, with norm the supremum of block norms; they
are not algebraic direct sums over all vertices. Construct bounded
loop functions, center-valued expectations and graph-edge Hilbert
modules over ℓ∞(vertices).
Build the relative-tensor Fock module, creation/annihilation operators,
edge-reversal weights and the represented loop algebra. At a chosen
root vertex use its normalized vacuum state for k=0; for each k
construct the through-path corner and the corresponding weighted
closure state, and prove its restriction to P is τ_k. A globally
finite graph weight is not assumed. Compare
this GNS representation with the preceding GJS/orthogonal models,
including independence of the fusion bases and chosen root.
These are representation comparisons after reconstruction, rather
than an assumption used to prove reconstruction.

Finally prove Burns's realization theorem: every connected positive
finite-box rigid C*-planar algebra arises from a finite-index II₁
inclusion (N,M,E) with a chosen faithful normal expectation. Sphericalize,
apply the spherical reconstruction, and transport the weight back by
the weighted standard-form/tower comparisons of S2 and S6. In the
spherical extremal model use positive invertible `h=a⁻¹w^(−1/2)`
and `E_h(x)=E_N(h^(1/2)xh^(1/2))`. Prove E_N(h)=1,
`Ind(E_h)=a²δ_sph²`, and all rigid-tangle operation comparisons.
S6's Cauchy–Schwarz comparison gives a≥1, with equality exactly
when normalized w=1. This theorem is realization of weighted data,
not uniqueness of an arbitrary input inclusion.

## S9. Finite-depth hyperfinite completeness and index below 4

Construct Popa's standard model with its orientation fixed. Extend S2's
tower to a tunnel `N_(−1)=M⊃N_0=N⊃N_1⊃…`. For k≥i≥−1
build the canonical anti-isomorphisms
`N_k′∩N_i ≃ (M_(i+1)′∩M_(k+1))^op`, carrying the tunnel
Jones projection e_(−i) to e_(i+2). Prove compatibility with the
entire grid and trace preservation in the extremal case. Define the
standard-model orientation by
`N^st=(⋃_k N_k′∩N)''⊂M^st=(⋃_k N_k′∩M)''`.
Construct these finite-dimensional systems from the oriented invariant
itself using its path/relative-commutant algebras and S4's Markov-square
construction. Prove the model is hyperfinite, independent up to inclusion
isomorphism of the tunnel, and its full shaded invariant is P. The
tower-side inclusion `M_1′∩M_∞⊂M′∩M_∞` is the opposite model:
prove its anti-isomorphism with the standard model under extremality,
retaining the opposite on the algebras and conjugation on coefficients.
This distinguishes the complex-conjugate E₆/E₈ cases below.

Prove functoriality: an isomorphism of oriented trace-compatible invariants
induces a trace-preserving isomorphism of their standard models by its
compatible finite-stage maps and normal extension. For reducible invariants
retain all relative-commutant blocks and their weights in this same model,
and prove `N^st′∩M^st` recovers `N′∩M` with its trace. No separate
model formed by forgetting the block connections is used.

Supply the entry into Popa's strong-amenability theorem for finite depth
and hyperfinite M. Prove the finite Perron–Frobenius two-step chains
ergodic, and both the standard and opposite models extremal. Prove
finite depth passes to M⊂M_1, including the expectation comparison
`E_M(Z(N_k′∩M_1))⊂Z(N_k′∩M)` and its dimension/basis bound.
Use the two successive extremal opposite models to prove the tower-tail
expectation identities in Popa5.1.2's proof. Establish the following
Skau lemma (Popa4.5.1): for B⊂M′∩M_∞ put
`B_k=B∩(M_k′∩M_∞)`. If
`E_B E_(M_k′∩M_∞)=E_(B_k)` and
`E_(B_k′∩M_∞)(e_(k+1))=d⁻¹1` for every k≥0, then
`B′∩M_∞=M`. Prove it by the basic-construction spans and the
expectation-range descent from M_(j+1) to M_j. Verify these hypotheses
for B=M′∩M_∞ using the finite-depth trace comparisons, hence prove
`(M′∩M_∞)′∩M_∞=M`. V13's injectivity/hypertrace theorem for
hyperfinite M supplies ambient amenability. Prove Popa4.1.2(vi)⇒(i)
from that hypertrace and the bicommutant condition, yielding strong
amenability. Handle the identity inclusion separately. Graph norm
equality or ambient injectivity alone does not replace these steps.

Develop the standard core/tunnel representations and their hypertraces,
relative Følner finite projections, and local-to-global approximation
used in Popa4.1.2,5.1.1 and AppendixA. First supply local quantization:
for a separable II₁ factor B construct a hyperfinite subfactor R⊆B
with R′∩B=ℂ by iterative matrix construction and dense-set commutator
control. Prove the central-decomposition variant with R′∩B=Z(B)
when B has finite-dimensional center. For B⊆M factors, finite Y⊂M
and ε>0 construct nonzero q∈B with
`‖qyq−E_(B′∩M)(y)q‖₂<ε‖q‖₂` for y∈Y.
Establish its finite-dimensional vector/matrix-unit version, exact common
supports after expectation-preserving partial-isometry perturbation, and
tunnel-alignment lemmas, using V13's matrix/L² perturbation API.

From the relative Følner condition obtain local relative-commutant
approximation. Extend it by orthogonal-support maximality to global
approximation along a tunnel, controlling both factors and expectations
simultaneously. Use separability to align a countable dense family and
prove `⋁_j(N_j′∩M)=M` and `⋁_j(N_j′∩N)=N`. Define strong
amenability by the hypertrace-plus-ergodic-core criterion and prove its
equivalence with this generation/model criterion under these hypotheses.
This proves every finite-depth hyperfinite inclusion is isomorphic to
its standard model; ordinary factor uniqueness does not give the pair
isomorphism. Combine generation with model functoriality to prove two
finite-index finite-depth hyperfinite II₁ inclusions with isomorphic
trace-compatible shaded invariants are isomorphic as inclusions.
Both factors are hyperfinite; completeness for arbitrary factors is
outside this theorem's conclusion.

First prove index below4 implies finite depth from the graph norm
bound and the theorem that connected, possibly infinite, locally finite rooted
graphs of norm<2 are finite ADE graphs.
Classify the subfactor standard invariants of index below4 by rooted
ADE data with their connection/duality constraints. Prove the norm<2
bipartite-graph theorem, positivity/integrality obstructions, and the
exclusion of the inadmissible D/E candidates; construct the allowed
A-series, even-D and E₆/E₈ planar/commuting-square examples and
verify their indices and invariants. For A_n, n≥2, the index is
4cos²(π/(n+1)); for D_(2n), n≥2, it is 4cos²(π/(4n−2));
for E₆ and E₈ it is 4cos²(π/12) and 4cos²(π/30). Root the graph
at the trivial bimodule vertex, and prove it has statistical dimension1
and minimal Perron–Frobenius weight; identify the endpoint up to graph
automorphism, including its dual
graph and distinguished basepoint data. Build biunitary connections
on the four-partite principal/dual graph square, their gauge action,
flatness equations and string-algebra reconstruction. Classify the flat
connections modulo gauge and rooted-graph isomorphisms, proving one invariant for each A_n and D_(2n), and two mutually
complex-conjugate invariant classes for each E₆ and E₈. Prove the
forward passage from a finite-depth invariant to a flat connection,
unique up to gauge, and that gauge/rooted graph equivalences induce
exactly the invariant isomorphisms. Distinguish graph classification
from the full standard-invariant list and prove the counts and complex-conjugate distinctions just stated. Apply hyperfinite completeness only
to the finite-depth hyperfinite realizations. This requires verified
connection or planar relations, not just a graph with the correct norm.

## S10. Infinite-dimensional bimodule cones and rotations

For a separable II₁ factor A and an A–A correspondence H of arbitrary
left and right dimension, construct H^n by S1 fusion, its central-vector
Hilbert subspace `P_n={ξ:aξ=ξa for all a∈A}` and its bimodule
commutant `Q_n=A'∩(Aᵐᵒᵖ)'∩B(H^n)`. Construct left/right bounded
vector bases and canonical semifinite commutant traces, basis independence,
strong sum formulas and operator-valued trace/weight maps. Use V11's
extended positive cones to interpret unbounded sums as genuine cone
operations. Construct the connected normal self-dual bimodule planar-algebra
structure of Penneys Theorem3.18 and its extended-positive-cone
tangle action (Theorem3.28), with gluing, normality and evaluation
identities on `Q̂_n⁺`. Central L² vectors and commutant cone elements
are different carriers; neither replaces the other at infinite index.

Call H approximately extreme when its two canonical traces on Q_1
are comparable above and below by fixed positive constants, and extreme
when they agree. Build the left/right creation contractions L_β,R_β,
central projections p_n and finite-basis-sum compression estimates.
Prove Penneys Theorem4.20: approximate extremality makes
`ρ=Σ_β L_β R_β*` converge strongly on P_n; extremality makes
it unitary. Construct the opposite rotation, its adjoint/periodicity
relations in their proper domains, and independence of basis. Prove the
exact tensor-power converse: for symmetric H, meaning a bimodule unitary H≃H̄, existence of this
rotation on P_(2n) implies H^n approximately extreme; unitarity
implies H^n extreme
(Theorem4.28). Do not replace H^n by H in this conclusion.

Compare the calculus with H=L²(M) for an infinite-index II₁ inclusion
and with the finite-index rigid/spherical constructions. Construct Burns §3.4's example (printed116–121): take the quasi-free
CAR trace of covariance1/2 and its GNS factor R; choose a representation
of F_∞ generating a type III factor, tensor it with the identity on
ℓ²(ℕ), and build its Bogoliubov action α on R. Prove the
Hilbert–Schmidt-perturbation criterion and outerness of each nonidentity
automorphism. For `N=L(F_∞)⊂M=R⋊_αF_∞` identify
`M_1=B(L²R)⋊_αF_∞` and compute the type III central summand
of N'∩M_1 via the implementing representation. Supply the CAR
Fock/Bogoliubov implementability lemmas from Dynamics D8 and the
normal crossed-product APIs from V8. Show why central L² data can miss
that summand of the operator-algebra invariant. The sufficient convergence/unitarity theorem is valid without this
symmetry assumption; the converse retains it. No reconstruction or completeness
theorem for all infinite-index standard invariants is asserted.

## Sources and interface evidence

- Pimsner–Popa, [*Entropy and index for subfactors*](https://doi.org/10.24033/asens.1504),
  Ann.Sci.É.N.S.19 (1986),57–106, §3 and Theorem4.4, Corollaries4.5–4.6, for S2a's
  relative inclusion entropy, atomic corner formula and qualified equality criterion.
- Jones–Sunder, *Introduction to Subfactors*, Chapters2–5, especially
  2.3.8–2.3.10, 3.1.2, 3.3.2 and §§5.3–5.7, for dimension, index,
  towers, commuting squares and compactness. The finite realization
  clause of 2.3.8 is distinct from its extended-index restriction.
- Anantharaman–Popa, *An Introduction to II₁ Factors*, Chapters8–9,13,
  for dimensions, expectations, bases and correspondences.
- Jones, [*Planar Algebras I*](https://arxiv.org/abs/math/9909027), §§1,3–4,
  Theorems4.2.1 and4.3.1, for extremal forward construction and
  standard-invariant realization; the latter uses Popa's realization input.
- Jones–Shlyakhtenko–Walker, [*An orthogonal approach to the subfactor
  of a planar algebra*](https://arxiv.org/abs/0807.4146), Theorem3.3,
  Theorem4.9, Corollaries4.10–4.19, Theorems4.20–4.21 and §5,
  for the noncircular reconstruction and GJS comparison.
- Popa, [*Classification of amenable subfactors of type II*](https://doi.org/10.1007/BF02392646),
  Acta Math. 172 (1994), 163–255, §§4.1–4.4,5.1 and AppendixA,
  for finite-depth completeness including reducible inclusions;
  the separate strong-amenability qualification is retained.
- Kosaki, [*Type III factors and index theory*](https://pages.uoregon.edu/njp/lec-f.pdf),
  §§2–3 and the statistical-dimension discussion, Theorems3.7–3.8,
  for the minimal expectation and its distinction from tracial index.
- Guionnet–Jones–Shlyakhtenko, [*Random matrices, free probability,
  planar algebras and subfactors*](https://arxiv.org/abs/0712.2904),
  §§2,4–5 and Theorem8, for S8's graph/Fock and graded-model comparisons.
- Burns, [*Subfactors, Planar Algebras and Rotations*](https://arxiv.org/abs/1111.1362),
  §§2.2,3.3, Definitions2.2.10,2.2.15, Lemma2.2.14, Corollary2.2.18
  and Theorems2.2.36,2.2.40,2.2.42–2.2.43,
  for rigid weights and rotations. In Theorem2.2.40 the printed conclusion
  uses λδ_sph, whereas its proof computes λ⁻¹δ_sph for both circle moduli;
  S6 uses the explicit circle computation with a=λ⁻¹. Remark2.2.39's
  centrality statement assumes Δ=I.
- Penneys, [*Introduction to Subfactors*](https://people.math.osu.edu/penneys.2/archive/talks/PenneysNCGOA2014.pdf),
  §§1.4–1.5,2–3, for invariants, finite-depth completeness and graph models.
- Jones–Penneys, [*The embedding theorem for finite depth subfactor
  planar algebras*](https://arxiv.org/abs/1007.3173), §§3–4;
  Coles–Huston–Penneys–Srinivas, [*The module embedding theorem via
  towers of algebras*](https://arxiv.org/abs/1810.07049), Theorems1.1,5.1
  and Corollary5.2, for the graph and module embeddings.
- Quan Chen, [*Standard λ-lattices, rigid C*-tensor categories, and (bi)modules*](https://doi.org/10.4171/DM/944),
  §§5.1–5.4,7 and Theorem7.9, for the infinite graph/path-matrix
  embedding after reconstruction. The concrete regular tensor action
  and every tangle comparison are proof targets in S8.
- Bigelow–Penneys, [*Principal graph stability and the jellyfish
  algorithm*](https://arxiv.org/abs/1208.1564), Theorems1.1–1.3 and §3.
- Evans–Kawahigashi, *Quantum Symmetries on Operator Algebras*,
  Chapter11, Theorems11.22–11.24 (printed578), for flat connection
  classification and the allowed rooted ADE graphs. Construct the
  E₈ flatness computation cited there, rather than assuming it from
  the graph norm.
- Penneys, [*A planar calculus for infinite index subfactors*](https://arxiv.org/abs/1110.3504),
  Theorems3.18,3.28,4.20,4.28, for extended cones and qualified rotations.

Use Mathlib's concrete `VonNeumannAlgebra`, abstract `WStarAlgebra`,
`StarAlgHom`, opposite actions, continuous linear maps and existing weak
operator topology wrappers. Native `TauCeti.Algebra.TemperleyLieb.Basic`
and `.MarkovTrace` determine the TL universal property and signed trace.
Required new correspondence, tower and tangle interfaces are built in
Tau Ceti in this vocabulary; existing or open Mathlib work determines
API shape and never removes a required prerequisite from scope.
