# Cyclic cohomology, spectral triples and noncommutative tori

Build the differential and cyclic theory of smooth operator algebras, its
Fredholm-module Chern characters and index pairings, and the spectral-triple
Hochschild-class theorem. Develop the logarithmic trace ideal and Dixmier
traces with their actual generalized-limit hypotheses. The smooth two-torus
is a complete example: its differential calculus, periodic cyclic cohomology,
Fourier spectral triple and Heisenberg-module index connect these constructions.

## Scope, conventions and suppliers

Algebras are complex. The independent N1.Tensor prefix concerns Hausdorff locally convex vector spaces over either ℝ or ℂ; this scalar generality does not change the complex algebras, cyclic cochains or spectral triples below. The algebraic cyclic theory begins for associative
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

| Supplier | Interface consumed here |
| --- | --- |
| [BanachAlgebras A1–A4,A6](../BanachAlgebras/README.md) | Banach-valued holomorphic calculus, spectra, bounded Hochschild cochains and the A4 dual-bimodule convention. N1 owns its resolution comparisons. |
| [CStarAlgebras C1–C5](../CStarAlgebras/README.md) | C*-ideals, matrices and the comparison with the existing continuous functional calculus. V0 supplies representations/GNS. |
| [OperatorTheory/SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md) | Native `LinearPMap` closed operators, adjoints, spectral calculus and graph norms. N5 constructs the compact-resolvent/summability consequences. |
| [OperatorTheory/OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md) | Compact operators, singular values, Schatten spaces and trace-class norm. N4 adds the logarithmic ideal and singular traces. |
| [OperatorKTheory K1–K7](../OperatorKTheory/README.md) | Idempotent/unitary K-theory, inverse-closed Fréchet comparison (K3), native Fredholm/Atkinson theory (K4), Hilbert-space KK cycles and their index products. K7 owns all real-parameter rotation C*-presentations and the irrational K-group computation. |
| [HilbertModules H1–H6](../HilbertModules/README.md) | Module inner products, completions, compact endomorphisms, projective-module frames, tensoring representations and regular-operator bounded transforms (H6). N6–N7 supply smooth connections and their torus instances. |
| [NoncommutativeIntegration I1](../NoncommutativeIntegration/README.md) | Tracial Lp, including 0<p<1, Hölder/quasi-norm inequalities and weak Lp; specialize to B(H) and compare with the Schatten scale. |
| [VonNeumannAlgebras V0,V4,V6,V10](../VonNeumannAlgebras/README.md) | Representations/GNS, basis-independent Hilbert trace, cyclicity, normal tracial weights and the tracial Lp comparison; no general nontracial Dixmier-trace theory is asserted here. |
| [OperatorAlgebraDynamics D1–D2,D4](../OperatorAlgebraDynamics/README.md) | Rotation crossed products, Fourier coefficient maps and the dual circle action. N6 constructs the two-torus gauge action. |

Use native `MultilinearMap`, continuous multilinear maps, and Mathlib
`Derivation` for the commutative specialization. For noncommutative
endomorphism-valued derivations consume Tau Ceti's existing
`derivationLieAlgebra ℂ A`, the Lie subalgebra of native `Module.End`
with the associative Leibniz rule; construct the A-bimodule-valued
universal-derivation comparison using commuting left/right actions. Use
`ChainComplex`/`CochainComplex`, kernels, quotients and cohomology APIs.
Use `ContinuousLinearMap.IsFredholm`, `FredholmPackage` and the native
integer index through K4. Do not replace closed operator domains by total
linear maps, or Fredholmness by an opaque extra predicate. N1 owns the
cyclic/mixed-complex structure; ordinary derived categories belong to the
existing homological-algebra developments.

The selected character theory is finite summability and the Dixmier-trace
Hochschild class. Entire cyclic cohomology and fixed-temperature θ-summable
characters are outside scope, as are foliations, the full local index formula,
geometric elliptic-symbol calculus and Standard Model constructions.
[IndexTheory](../IndexTheory/README.md) owns closed-manifold elliptic index
and the Atiyah–Singer theorem; no such theorem is a prerequisite for the
abstract or torus index computations here.

## N1. Universal differential forms and cyclic complexes

### N1.Tensor. Completed locally convex projective tensors

This is the sole generic locally convex tensor supplier, independent of
cyclic theory and of every SmoothBanachRepresentations result. Work over
𝕜=ℝ or ℂ on Hausdorff locally convex 𝕜-spaces E,F. Use the actual
algebraic `TensorProduct 𝕜 E F`, `Seminorm`, `WithSeminorms`, separated
quotient and `UniformSpace.Completion`, without assigning a fictitious
norm to a nonnormable space. For continuous seminorms p,q construct
`π_(p,q)(t)=inf_(t=Σx_i⊗y_i)Σp(x_i)q(y_i)`, prove the seminorm laws,
and equip the algebraic tensor with the topology generated by this
family. Construct its separated completion E⊗̂_π F and the canonical
continuous bilinear map with dense algebraic image.

Prove the universal property for jointly continuous 𝕜-bilinear maps into
complete Hausdorff locally convex 𝕜-spaces, with uniqueness on pure
tensors. Prove functoriality and identity/composition laws, associativity,
tensor flip, scalar units and compatibility with finite sums, with their
pure-tensor equations and coherence. Establish Fréchet completeness and
metrizability when E,F are Fréchet; no nuclearity or approximation
hypothesis is imposed for this construction. For Banach factors compare
with BanachSpaceTheory B4's completed Banach projective tensor by the
identity on pure tensors, including the norm/universal-property and
finite-family `PiTensorProduct` comparisons. This consumes B4's tensor
contract, not its approximation-property or nuclear-operator results.

Give the real/complex scalar dictionary as part of this same supplier.
For a real locally convex E, use the existing algebraic
`TauCeti.Complexification E` carrier with its product locally convex
topology on a type synonym, E_ℂ=E⊕iE. Prove the continuous real inclusion,
real/imaginary projections, complex-linear extension and complete-space
comparisons. In the normed/Banach case identify this topology with the
native Taylor-norm construction via its `equivProd`, `ofRealLI`, `reCLM`
and `ContinuousLinearMap.complexify`; do not assert a false isometry of
different tensor or product norms. For real Fréchet E,F construct the natural topological
complex-linear equivalence
`(E⊗̂_(π,ℝ) F)_ℂ ≃ E_ℂ⊗̂_(π,ℂ) F_ℂ`, agreeing on real pure tensors,
and prove compatibility with functorial maps, associativity and flip.
For complex Fréchet E,F construct instead the canonical real-linear quotient
`E_ℝ⊗̂_(π,ℝ) F_ℝ → (E⊗̂_(π,ℂ) F)_ℝ`: its kernel is the closed span
of `(ix)⊗y−x⊗(iy)`, and the induced quotient is a topological real-linear
equivalence. Do not identify the unquotiented real and complex tensors.
These maps and pure-tensor equations supply scalar restriction and
extension for SmoothBanachRepresentations SB7, which owns the diagonal
action, shuffle derivatives, smooth tensor comparison and dense range.
N1.Tensor precedes SB7; the later SB8→N6 Fourier application creates no
reverse dependency.

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

Prove b²=0 and preservation of the cyclic subcomplex. Construct cochain
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
formula fixing this odd constant. Consume [AlgebraicKTheory A0–A3](../AlgebraicKTheory/README.md) for the
single algebraic projective-module K₀ and its stable-idempotent comparison,
algebraic K₁=`GL_∞(A)/E_∞(A)`, the stable commutator/elementary
identification, functoriality and the appropriate complex-relative unitization
versions. Own their cyclic pairings here.
Prove the pairings descend through these relations, including vanishing
on elementary matrices, before imposing topological homotopy.
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

## N3. Fredholm modules and their finite characters

Consume K5–K6's Hilbert-space specialization of KK cycles. For a cycle
whose `(F−F*)π(a)` is compact, construct the self-adjoint replacement
`(F+F*)/2` and its class-preserving compact-perturbation homotopy.
Define even
and odd Fredholm modules with bounded representation π, F*=F,
`[F,π(a)]` compact and `(F²−1)π(a)` compact; even modules carry the
specified γ. Develop unitary equivalence, direct sums, degenerate cycles,
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
p-subadditivity when p<1, before applying these square-root estimates.
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
period reduction. For the Hardy classes, each with circle index −1,
identify x⊠_u y with N7's Fourier Dirac operator at θ=0 and x×_K5 y
with its reversed grading. Prove `Ch(x⊠_u y)=Ch(x)#Ch(y)` and
`Ch(x×_K5 y)=−Ch(x)#Ch(y)`, distinguishing the two reductions
throughout the graded index-interchange comparison. For N2's fixed
positive ordered Bott class β=[z₁]×[z₂], calculate the pairings +1
and −1 respectively; the positive N7 Dirac has the first value.
Keep K5's matrices and swapped adapter and N2's Bott orientation
unchanged. Point factors contribute no additional adapter sign. These
computations concern the explicitly finitely summable point/circle
products. A general KK product is not assumed to have a finitely
summable representative on the given smooth algebra. Work out point cycles,
the circle Hardy/shift compression with index −1 for the forward
shift and +1 for its adjoint, a finite matrix
amplification and a nonsummable compact-commutator cycle. Summability
is a condition on the specified smooth algebra, not automatically on
the whole C*-completion.

## N4. Weak ideals, generalized limits and Dixmier traces

Using OperatorIdeals' singular values, construct the Marcinkiewicz
logarithmic trace ideal

`L^(1,∞)={T compact : sup_(N≥1) (log(1+N))⁻¹ Σ_(j<N)μ_j(T)<∞}`.

Prove its ideal/quasi-norm structure, completeness, adjoint/unitary
invariance, singular-value inequalities, finite-rank and trace-class
inclusions and bounded left/right multiplication. Distinguish it from
`S_(1,∞)={T: sup_(j≥0)(j+1)μ_j(T)<∞}`, supplied by I1's weak L₁
specialization, and construct a diagonal operator in the former but not
the latter. For p>1 write `L^(p,∞)` for I1's weak Schatten space
`sup_(j≥0)(j+1)^(1/p)μ_j(T)<∞`; prove its equivalent partial-sum
description and compare its power/product estimates with the logarithmic
ideal. In particular `T∈L^(n,∞)` implies `|T|^n∈L^(1,∞)`.
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
boundedness, vanishing on trace class and its singularity/non-normality.
Give diagonal examples with nonzero trace, zero trace outside trace
class, and dependence on ω. A general positive extension of limits
without dilation invariance is not asserted to give an additive trace.
Call T measurable when all Tr_ω with dilation-invariant ω agree; prove
ordinary convergence of the logarithmic means a sufficient condition.

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
eigenbasis. Compare its spectral projections with
SelfAdjointSpectralTheory SA-E and its continuous calculus with H6.
This supplies |D|, sign D, heat operators and inverse powers, including
their kernel conventions, for the compact-resolvent triples here.

Develop spectral triples (𝒜,H,D), their even/odd versions, operator-domain
invariance, bounded commutator extension, graph-norm estimates and
unitary/smooth-algebra transport. Build `[D,ab]=[D,a]b+a[D,b]`
and dagger identities on the common domain before extending boundedly.
Specialize H6's bounded transform to Hilbert spaces and compare the
resulting Fredholm class with N3; prove compactness and the Schatten bounds from stated spectral
summability. Develop resolvent, heat-functional-calculus and truncation
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
action, comparing the two seminorm families by explicit finite-order estimates in
both directions with
[SmoothBanachRepresentations SB2/SB8](../RepresentationTheory/SmoothBanachRepresentations/README.md).
For Q_k(a)=sup_(r,s)(1+|r|+|s|)^k|a_(r,s)| and the coordinate-word
sums P_m, prove Q_k≤C_k P_k and P_m≤D_m Q_(m+3), with constants
independent of a and θ. Use contractive Fourier coefficient extraction
for the first inequality and absolute Fourier summability for the
second, keeping the actual 2πi derivative multipliers. These establish
the same Fréchet topology, not equality of individual seminorms;
at θ=0, a=1+U₁ gives Q_0=1 and P_0=2.
Consume that roadmap's generic density, complete Fréchet star-algebra,
Lie-derivation and all-matrix inverse/holomorphic-closure theorems through
this identification. Retain the torus Fourier proof and the explicit inverse
derivative comparison here; K3 supplies the K-theory comparison for this
inverse-closed algebra. For every real θ identify the underlying
C*-algebra with K7's rotation crossed product by `U₁=v,U₂=u`.

Construct the canonical faithful trace τ(a)=a_00 and the derivations
`δ_j(U₁^mU₂^n)=2πi n_j U₁^mU₂^n`, n₁=m,n₂=n.
Prove continuity, Leibniz, star compatibility, commuting derivations and
τδ_j=0. Construct the two-dimensional differential calculus, orientation,
closed graded trace and its character

`φ(a₀,a₁,a₂)=(2πi)⁻¹ τ(a₀(δ₁a₁ δ₂a₂−δ₂a₁ δ₁a₂))`.

Prove cyclicity, bφ=0 and gauge/parameter-isomorphism transport. Build
connections on finite projective smooth right modules: ∇_j(ξa)=
(∇_jξ)a+ξδ_j(a), curvature `[∇₁,∇₂]`, Hermitian compatibility,
change of connection and gauge transformation. For a projection e
construct its Grassmann connection and prove the curvature-trace
formula equals `(φ#Tr)(e,e,e)`, including the (2πi)⁻¹ normalization.
Prove independence of connection by transgression. N7 supplies its
identification with an integer Fredholm index; cyclicity alone does not.

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

## N7. Fourier spectral triples and Heisenberg indices

Identify L²(A_θ,τ) with ℓ²(ℤ²) by the ordered Fourier basis and use
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
Build its A_θ-valued inner product, positivity, complete Hilbert module,
finite smooth projective frames and identification with a smooth
Powers–Rieffel projection of trace θ. Prove the frame/trace dictionary
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

## Sources and API evidence

- Connes, [*Noncommutative Geometry*](https://alainconnes.org/wp-content/uploads/book94bigpdf.pdf),
  Chapter III §§1–3, pp.187–205,216–218,229–231, for cycles, the cyclic
  bicomplex/SBI, torus cohomology and pairings; Chapter IV §1,
  pp.295,299–303, for the conditional trace, character normalization
  and index theorem; IV §2, pp.310–317, for Dixmier traces,
  Tauberian criteria and Theorem8's Hochschild class; IV §6,
  pp.356–362, for the smooth torus and Heisenberg connection.
- N3's odd character coefficient is minus the coefficient printed in
  Connes IV §1, Definition 3, p.302. The positive N2 odd pairing is
  retained; the Hardy compression calculation fixes agreement with
  the kernel-minus-cokernel index and OperatorKTheory K6.
- The ordered Fourier triple, its chosen second Clifford sign and its
  Gaussian chiral calculation in N7 specify the comparison required
  here; they are not left to a convention implicit in the elliptic
  formula of Connes IV §6.
- Mathlib's multilinear, derivation, homological-complex, compact-operator
  and Fredholm APIs fix the foundational vocabulary. Tau Ceti's
  `Algebra/Lie/Derivation/Basic` supplies the noncommutative derivation
  carrier and its Leibniz/inner/conjugation API. Its existing
  `Analysis/Fredholm/{SmallPerturbation,CompactPerturbation,ContinuousFamily}`
  and the K4 index comparisons are suppliers, not private substitutes.
  [Mathlib's Fredholm design discussion](https://leanprover.zulipchat.com/#narrow/channel/144837-PR-reviews/topic/.2341189.3A.20define.20Fredholm.20operators.20between.20TVSs/near/609444718)
  fixes the native operator/index interface.
