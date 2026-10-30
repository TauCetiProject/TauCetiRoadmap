# Heisenberg imprimitivity for phase-space lattices

Develop the Schwartz–Bruhat analysis and Heisenberg imprimitivity bimodules for
`M=ℝ^k×ℤ^p×𝕋^q×F`, with arbitrary nonnegative k,p,q and finite abelian F.
The main theorem gives an explicit Morita equivalence between the twisted group
C*-algebras of a phase-space lattice and its symplectic annihilator. Build the
usable Fourier, lattice, smooth-algebra, pairing, completion, frame and transport
APIs as well as this theorem. This is a child of HilbertModules, under math.OA;
it has no separate metadata.toml.

The general Schrödinger operator and commutator calculations apply to every
locally compact Hausdorff abelian M. The Schwartz–Bruhat, lattice imprimitivity
and smooth-frame targets here have the finite-type M above, including zero
Euclidean dimension and trivial factors. A lattice means a **closed discrete
subgroup with compact quotient**. An arbitrary discrete subgroup is not assumed
cocompact. Two arbitrary discrete subgroups do not give commuting actions.

[HilbertModules H1–H3](../README.md) owns abstract completions, adjointable/compact module
operators, interior products, imprimitivity and induction. Its H2 finite-frame
criterion is consumed here; H4 stabilization and H5 continuous trace are not
prerequisites. [NoncommutativeGeometry N6–N7](../../NoncommutativeGeometry/README.md) retains its smooth two-torus,
connections, curvature and index theory, including its specified 0<θ<1
Schwartz module. This child supplies the general phase-space theorem and the
explicit comparison with that module, including nonzero parameters outside
that interval. [OperatorAlgebraDynamics D1–D2](../../OperatorAlgebraDynamics/README.md) supplies universal and regular
integrated representations, gauge expectations and amenability comparisons.
D1.CentralTwists, D1.TwistedBorel and D2.CentralTwists own the twisted
L¹/full/reduced completions and individual circle-weight ideal comparisons;
consume their scalar discrete specialization with counting Haar measure below.
D3's Green and symmetric imprimitivity theorems remain with that owner and are
not assumed to prove this child. D1.TwistedBorel uses only the elementary
[NoncompactQuantumSymmetry M1.ProjectiveExtensions](../../NoncompactQuantumSymmetry/README.md#m1projectiveextensions-borel-cocycles-and-circle-extensions)
interface; NQS induction, Mackey classification and M2 type-I applications
are not prerequisites.

Consume [BanachAlgebras A7](../../BanachAlgebras/README.md)'s Haar integration and L² translation prefix and
[VonNeumannAlgebras V11](../../VonNeumannAlgebras/README.md)'s independent harmonic-analysis prefix (compact-open
Pontryagin dual, dual Haar, inversion, Plancherel and biduality), without normal
crossed products or modular theory. H1 below supplies annihilator exactness,
quotient integration and lattice normal forms in the generality actually used;
these are not inferred merely from the name Pontryagin duality. Consume
Mathlib `SchwartzMap`, `SchwartzMap.seminorm`, its Fourier transform and
`SchwartzMap.tsum_eq_tsum_fourier`, `AddCircle` Fourier theory and finite abelian
character orthogonality. Use Tau Ceti's native Pontryagin evaluation,
Fourier-measure and circle-character APIs and Euclidean Schwartz cutoffs.
[SmoothBanachRepresentations SB2/SB8](../../RepresentationTheory/SmoothBanachRepresentations/README.md) supplies smooth vectors
of compact Lie group C*-actions and their all-matrix inverse/holomorphic closure.
H2 and H5 below construct the particular rapid-algebra identifications it needs.
No Stone–von Neumann theorem, measurable decomposition or Gabor-frame existence
theorem is an unlisted prerequisite.

## H1. Phase space, duality and lattice geometry

Write `e(t)=exp(2πit)`. Pair M and its dual by the **positive** character
`χ(t)`. Choose Lebesgue measure on ℝ^k, counting measure on ℤ^p and F, and
probability Haar on 𝕋^q. The dual measures are the inverse choices: Lebesgue,
probability Haar, counting, and normalized counting on F-hat. Construct the
coordinate dual identifications, including the finite pairing independently of
any noncanonical F≃F-hat. The phase group `G=M×M̂` has the product of dual
Haar measures. Under a general rescaling μ_M↦rμ_M (r>0), μ_Mhat↦r⁻¹μ_Mhat;
phase Haar and all phase covolumes stay fixed.

On L²(M) use the second-variable-linear scalar inner product and

```
π_(m,χ) ξ(t) = χ(t) ξ(t+m)
β((m,χ),(n,ψ)) = ψ(m)
σ(x,y) = β(x,y) conjugate(β(y,x)).
```

Consume D1.CentralTwists' arbitrary-LCA strongly continuous Schrödinger
family, projective law and vector-integral comparison. Prove equality of its
native bounded linear unitaries with the displayed convention, and reuse its
normalized cocycle and adjoint identities
`π_xπ_y=β(x,y)π_(x+y)`, `π_x*=conjugate(β(x,-x))π_(-x)`.
In the finite-type setting prove preservation and continuous action on the
Schwartz–Bruhat carrier below; develop the commutator, duality and lattice APIs here.
Prove σ is a nondegenerate continuous alternating bicharacter, so π_d and
π_e commute exactly when σ(d,e)=1. No choice of square root of a character or
factor 1/2 on a group with 2-torsion is used.

For a closed subgroup L define `L^⊥={x:∀l∈L,σ(l,x)=1}`. Prove closedness,
order reversal, double annihilator, annihilators of sums/intersections with
the necessary closures, and functoriality. Construct the character restriction
maps, extension of characters from closed subgroups, and the quotient-dual
identifications, including `G/L^⊥≃L̂`. Prove that discrete and cocompact are
dual conditions. In particular if D is a lattice, E=D^⊥ is a lattice,
E^⊥=D, and every character of E is the restriction of `σ(x,·)` for some x∈G.

Construct quotient Haar by the Weil formula with counting measure on a
discrete L. Define `c_L=μ_(G/L)(G/L)` for a lattice, prove it is positive and
finite, independent of a fundamental-domain representative, and compute
`c_D c_(D^⊥)=1`. Construct Borel fundamental domains and the integration
formula, rather than presuming a rectangular basis for an arbitrary lattice.
For the finite-type groups prove discrete subgroups are finitely generated
abelian, with finite torsion, and establish polynomial counting bounds in the
noncompact coordinate weight. Give their generator relations, Smith-normal-form
and real-coordinate comparisons and the corresponding finite-type abelian Lie
quotient descriptions; the quotient is compact when the subgroup is a lattice.
These supply the summation bounds and, for lattices, the compact-quotient
smooth-Fourier inputs in H2, including lattices mixing real, integer, torus
and finite coordinates.

## H2. Schwartz–Bruhat spaces and Poisson summation

Construct S(M) as an actual complete locally convex complex function space.
A concrete Fourier-coordinate model is the families
`a_(z,n,f)∈SchwartzMap(ℝ^k,ℂ)`, indexed by
`z∈ℤ^p,n∈ℤ^q,f∈F`, for which every Euclidean Schwartz seminorm is uniformly
rapidly decreasing jointly in z,n. Fourier synthesis is
`ξ(x,z,t,f)=Σ_n a_(z,n,f)(x)e(n·t)`.
Prove absolute locally uniform convergence of all derivatives, uniqueness,
continuity of synthesis and coefficient extraction, and equivalence with the
smooth-function definition having uniform rapid decay in x,z and every torus
and Euclidean derivative. Retain all seminorms; finite Fourier sums are dense,
not equal to the whole space. Prove independence of finite presentations and
coordinate identifications by explicit continuous linear equivalences.

Develop conjugation, translations, character multiplication, pointwise
products, convolution, continuous inclusions into L¹ and L², density in L²,
Fubini and tensor/product identifications. Identify S(ℝ^k) with native
SchwartzMap, S(ℤ^p) with rapid sequences, S(𝕋^q) with smooth functions or
rapid Fourier coefficients, and S(F) with all functions on F. Construct the
positive Fourier isomorphism S(M)≃S(Mhat), its inverse and square/reflection,
and compare native Euclidean negative Fourier transform by argument negation.
Track normalized counting in every finite transform.

Prove the short-time matrix coefficient `(x↦⟨ξ,π_xη⟩)` belongs to S(G).
Prove restriction of a Schwartz–Bruhat function to any discrete subgroup is
rapid in its word length and absolutely summable, with continuous seminorm
bounds; the restriction need not have finite support. Give bilinear estimates
for actions of rapid twisted sequences on S(M), and all changes of sum,
integral and derivatives used below.

For every lattice D prove Poisson summation

```
Σ_(d∈D) F(d) = (1/c_D) Σ_(e∈D^⊥) (F_s F)(e),
(F_s F)(e) = ∫_G F(x) σ(x,e) dx.
```

Both sums converge absolutely. Construct periodization on G/D, compute its
Fourier coefficients using Weil integration, prove smooth Fourier inversion
on its torus/finite quotient description, and obtain this formula. Include
uniform convergence on compact sets and translations. Prove the needed
four-vector transform identity, with the above plus sign:

```
F(x)=⟨π_xη,ξ⟩⟨ω,π_xζ⟩
(F_s F)(e)=⟨η,π_eζ⟩⟨ω,π_e*ξ⟩.
```

This produces the operator fundamental identity, first weakly on Schwartz
vectors and then as an absolutely convergent Schwartz identity:

```
Σ_d ⟨π_dη,ξ⟩π_dζ = (1/c_D)Σ_e ⟨η,π_eζ⟩π_e*ξ.
```

Prove the four-vector identity directly by Plancherel/Fubini and character
orthogonality, checking real, discrete, torus and finite factors and their
products. This analysis is part of the child, not an assumed general-LCA
Poisson theorem beyond the native one-dimensional theorem.

## H3. Twisted actions, pairings and positivity

For a discrete subgroup L use counting measure and OperatorAlgebraDynamics
D1.CentralTwists' scalar twisted full algebra `C*(L,c)`. Its dense ℓ¹ algebra has

```
(f*_c g)(x)=Σ_y f(y)g(x-y)c(y,x-y)
f^*(x)=conjugate(f(-x)) conjugate(c(-x,x)).
```

Prove the finite-sum and ℓ¹ action formulas and identify them with its
universal completion. Give regular representations, coefficient maps,
faithful coefficient-at-zero trace, gauge action and full=reduced comparison
for these abelian L. Consume D1.TwistedBorel's
individual central-circle-weight sector comparison and D2.CentralTwists'
amenability theorem, and prove their counting-Haar/generator comparisons here;
ordinary untwisted group amenability is not silently asserted to be the
twisted theorem. For
`K=𝕋×_cL` with product circle-probability/counting Haar, use the central
projection `p₁=∫_𝕋 conjugate(z)u_(z,0) dz`. Prove that its ideal has
unit p₁, generators `p₁u_(1,l)` with multiplier c, and exactly the twisted
universal property. Prove K amenable by averaging first over its compact
central circle and then the abelian quotient. Identify its regular weight-one
sector with twisted ℓ²(L). This transfers D2 full=reduced to the required
sector without any NQS induction or type-I theorem.

Put `B=C*(D,β)` and `A=C*(E,conjugate β)`. Finite and rapid sequences act by

```
b ξ = Σ_d b(d)π_dξ,                 ξ a = Σ_e a(e)π_e*ξ.
⟨ξ,η⟩_A(e)=⟨ξ,π_eη⟩,
{}_B⟨ξ,η⟩(d)=c_D⟨π_dη,ξ⟩.
```

The left pairing is linear in ξ; the right pairing is linear in η. Prove
all complex/module linearity, involution, covariance and adjoint identities
by the displayed cocycle, including the *opposite* algebra for the right
action. For independent discrete D,E the separate actions exist; they
commute iff E⊆D^⊥. The two-inner-product compatibility and imprimitivity
assertions below use **E=D^⊥ and D a lattice**.

Prove C*-positivity rather than impose it as an extra hypothesis. For the
right diagonal a(e)=⟨ξ,π_eξ⟩ the regular convolution kernel is
`a(x-y)conjugate(β(x-y,y))=⟨π_x*ξ,π_y*ξ⟩`.
Thus every finitely supported quadratic form is nonnegative. For the left
diagonal use the conjugate Hilbert-space vectors to obtain the conjugate
kernel, multiplied by c_D>0. Absolute summability makes these bounded
regular operators; full=reduced lifts positivity to A and B. Prove the
finite Gram-matrix version by the same argument. The faithful traces give
`τ_A(⟨ξ,ξ⟩)=‖ξ‖₂²` and
`τ_B({}_B⟨ξ,ξ⟩)=c_D‖ξ‖₂²`, proving definiteness. Do not infer positivity
from a purported Hilbert-module norm defined before this step.

H2 gives `{}_B⟨ξ,η⟩ζ=ξ⟨η,ζ⟩_A`, including the covolume factor.
Right multiplication satisfies the usual a*⟨ξ,ξ⟩a estimate. Each π_d,
d∈D, is an adjointable isometry for the right pairing because it commutes
with π_e, e∈E. Extend this projective-unitary representation by the full
universal norm to B→L_A; prove `‖bξ‖_A≤‖b‖‖ξ‖_A`. Give the symmetric
left-norm bound and prove the two module norms agree, using compatibility
and the norming pairings or the linking-algebra argument. Extend all
pairings/actions by continuity. These are conclusions, not input norm bounds.

## H4. Completion, fullness and imprimitivity

Apply HilbertModules H1 to complete S(M) in
`‖ξ‖_A=√‖⟨ξ,ξ⟩_A‖`, retaining the injective L² comparison
`‖ξ‖₂≤‖ξ‖_A`; identify the Hilbert-module completion with its continuous
injective dense image in L² by the faithful-trace localization argument.
In particular prove injectivity on the completion, not just on Schwartz
vectors: tensor with the trace GNS module and use faithfulness to show
zero localization forces zero module vector. The image is not asserted to
be all L² with its Hilbert-space norm. Use Mathlib `CStarModule Aᵐᵒᵖ` and
its opposite-valued inner product; no competing native norm is installed on
SchwartzMap or L². Prove completion universal properties and uniqueness.

Prove both pairings full. Conjugation of the matrix coefficients by every
phase shift π_x realizes gauge characters. H1 character restriction gives
all gauge characters on E and D. Thus each closed pairing ideal is gauge
invariant. Average any nonzero positive diagonal pairing over the compact
dual group; coefficient uniqueness gives its strictly positive scalar trace
times the unit in the ideal. This proves fullness even at rational and
finite parameters, without assuming simplicity.

Compatibility identifies the left action of each pairing with
`θ_(ξ,η):ζ↦ξ⟨η,ζ⟩_A`. Use density and left fullness to prove the complete
image is precisely K_A, and prove injectivity: an element acting as zero
annihilates every left pairing, hence B by fullness. Construct the isometric
star isomorphism `B≃K_A(𝓔)`, the conjugate module and
`𝓔⊗_A𝓔*≃B`, `𝓔*⊗_B𝓔≃A`, with the actual pairings as evaluation maps.
Prove H3's induced representation equivalences agree with the displayed
Schrödinger actions after trace localization. This supplies the genuine
Heisenberg imprimitivity theorem.

## H5. Smooth finite frames, traces and transport

Both lattice algebras are unital, so the identified identity is compact.
Consume H2's finite-projective/compact-identity criterion. Strengthen it to
finite Parseval frames with entries in S(M). Identify each rapid twisted
algebra with the smooth vectors of its compact Lie gauge group, including
finite torsion components; prove complete Fréchet star-algebra structure,
dense inclusion and action estimates. Consume SB8 for its matrix inverse
and holomorphic closure. Approximate the identity by finite sums of
Schwartz rank-one operators, obtain a positive invertible frame operator,
and normalize by its inverse square root in the rapid left algebra.
Prove the resulting windows stay Schwartz and reconstruct every vector.
This proves smooth frame existence for every lattice; a single window is
not asserted for every covolume.

For a right Parseval frame (ξ_j), form
`p_ij=⟨ξ_i,ξ_j⟩_A`, prove p is a projection and give the mutually inverse
maps `ξ↦(⟨ξ_j,ξ⟩)_j` and `(a_j)↦Σ_jξ_j a_j` onto pA^n. Prove frame
independence of the induced trace and

```
Tr_𝓔(L_b) = c_E τ_B(b),
Σ_j τ_A(⟨ξ_j,ξ_j⟩)=Σ_j‖ξ_j‖₂²=c_E=1/c_D.
```

Prove the first identity on rapid coefficients using cyclicity/compatibility
and then by continuity; it includes b=1. Give the reciprocal left-dimension
formula, conjugate-module trace and interior-product trace comparisons.
A nonzero scalar multiple of Haar does not give a new dimension: its module
unitary multiplies vectors by r^(-1/2).

Develop naturality under lattice reindexing, group isomorphisms with their
Haar Jacobians, product decompositions, finite dual identifications,
annihilator exchange and conjugation. For a normalized continuous unitary
cochain u on phase space, rephase π'_x=u(x)π_x and
`β'=δu β`, where `δu(x,y)=u(x)u(y)/u(x+y)`.
Construct coefficient maps, pairings and module unitaries explicitly:
left coefficients change by u(d)^(-1), right coefficients by u(e), to
represent the same operators. Check composition and identity coherences.
For symplectic coordinate changes preserving σ, require and construct the
matching cocycle cochain and intertwining operator when used; a symplectic
map is not declared to have a canonical metaplectic lift. Prove explicitly
the Fourier-exchange, translation, character and group-coordinate
intertwiners, including cochains and Haar factors. In particular for positive
Fourier transform, identify the phase change
`(m,χ)↦(χ,ev_(-m))` and prove
`F₊π_(m,χ)=conjugate(χ(m))π'_(χ,ev_(-m))F₊`.
For f:M≃M' with `f_*μ_M=J μ_M'`, J>0, its scalar unitary is
`ξ↦sqrt(J)ξ∘f⁻¹`; derive the dual and pairing transports from this formula.
Compare the induced
Morita equivalences and tensor associators through H3's canonical transports.

## H6. Complete factor examples and the two-torus dictionary

Compute M=ℝ^k with rectangular `D=Aℤ^k×Bℤ^k` (A,B invertible):
`E=B^(-T)ℤ^k×A^(-T)ℤ^k`,
`c_D=|det A det B|`, `dim_A𝓔=|det A det B|^(-1)`.
Then treat every real full lattice Pℤ^(2k). With coordinates (m,s) and
`J=[[0,I],[-I,0]]`, its annihilator is `J⁻¹P^(-T)ℤ^(2k)` and
the covolumes are `c_D=|det P|` and `c_E=|det P|⁻¹`; prove these formulas
and their change-of-basis laws. No rectangular
restriction is retained in the theorem.

Compute M=ℤ^p and D=M×{0}, E=D, yielding the usual equivalence of its
commutative Fourier algebra with itself; compute M=𝕋^q and
D={0}×Mhat analogously. Give proper finite-index variants, including their
annihilator finite character groups and matrix/corner descriptions. For
finite M=F, all subgroups of F×Fhat are lattices. Phase mass is |F|,
`c_D=|F|/|D|`, `|D||E|=|F|²`, and right dimension |D|/|F|.
Compute D=0,E=G (the ℂ–M_|F|(ℂ) row module), D=G,E=0 (the column
module), and maximal isotropic D (commutative Fourier/fiber decomposition).
Prove the finite twisted matrix-algebra identifications by actual matrix
units. For products prove external tensor-product unitary, pairings,
covolume and traces multiply. Include mixed lattices, not only products.

In M=ℝ×ℤ/qℤ, q≥1, use the independently specified honest embedding

```
φ(m,n)=((a n,[c n]),(b m,[d m])),
β(φ(m,n),φ(r,s))=e((ab+cd/q)nr),   a b≠0,
```

with c,d integers and the finite pairing e(uv/q). Its image E is a lattice
of covolume q|ab| with the fixed measures. Compute E^⊥ by the two generator
character equations, all cocycles and resulting rotation parameter after
word-order/relabeling. Choose ab+cd/q to realize the desired nonintegral
parameter when possible, and describe the nonzero ab choices for each
parameter. This is a fully specified worked construction; it does not claim
to reconstruct an overwritten source map. Verify q=1 and all finite factors.

For the source real-line model use χ_m(t)=e(-mt) and
`E_θ={(nθ,χ_m):m,n∈ℤ}`, θ≠0. Then
`conjugate β(φ(m,n),φ(r,s))=e(θnr)`,
`D_θ=E_θ^⊥={(l,χ_(j/θ)):l,j∈ℤ}`,
`c_E=|θ|`, `c_D=1/|θ|`. The right action and pairing are exactly

```
(ξδ_(m,n))(r)=e((r-nθ)m)ξ(r-nθ)
⟨ξ,η⟩_A(m,n)=∫ conjugate(ξ(r))e(-rm)η(r+nθ)dr.
```

Identify these ordered source generators with NCG U₂ and U₁⁻¹, where
`ξU₁(r)=ξ(r+θ)` and `ξU₂(r)=e(r)ξ(r)`; compare the ordered cocycle
and the original N7 inner product by coefficient uniqueness. Partial Fourier
series gives `Σ_k conjugate ξ(t+k)η(t+k+nθ)`. The left algebra is
`C(ℝ/θℤ)⋊ℤ`, represented by `Σ_l h(r,l)ξ(r+l)`, with
`h_(ξ,η)(r,l)=Σ_n ξ(r-nθ)conjugate η(r+l-nθ)`.
Prove that its Fourier coefficients are exactly c_D times the left scalar
coefficients, including negative θ via probability Haar on ℝ/θℤ.
With Z(r)=e(r/θ) and Tξ(r)=ξ(r+1), `TZT*=e(1/θ)Z`;
the ordered pair (T,Z) has parameter -1/θ. State the generator isomorphisms
when calling the left algebra A_(1/θ) instead.

For 0<θ<1 construct the smooth single window by choosing a real bump ρ
supported in an interval of length l with θ<l<1 and positive on a
θ-length subinterval, and normalizing by
`(Σ_n|ρ(r-nθ)|²)^(-1/2)`. Prove its periodization is 1, nonzero integer
translates have disjoint supports, and hence E≃pA with τ(p)=θ. Compare
this p and frame with N7; connections and index are consumed from N7.
For every θ>0 choose integer q>θ, δ=θ/q, and use the q translated
δ-windows to obtain a finite frame of trace θ; also prove the finite
cyclic-gauge restriction/expectation comparison A_θ⊂A_δ, norm equivalence
and finite free basis. For θ<0 use reflection r↦-r and the modulation
inversion isomorphism; dimension is |θ|. At θ=0 φ is not injective and
the proposed coefficient at (0,n) is constant for ξ=η≠0, contradicting
Fourier decay in C(𝕋²); the literal nonzero Schwartz module does not extend
through that failed embedding. The ordinary θ=0 torus has its usual
projective section modules, with algebraic and topological classification
supplied by AlgebraicKTheory A0/A7 and HilbertModules H5.

Prove the subgroup qℤ inclusion by its actual generator map and faithful
reduced coset comparison. Distinguish the rotation action modulo one from
the translation size of a Schwartz module; using fractional part {qθ}
for the single-window construction requires 0<{qθ}<1. Compare the
extension-of-scalars module with `M⊗_C A` and
`⟨x⊗a,y⊗b⟩=a*⟨x,y⟩b` through H3, including finite projection models.

## References and native design

Rieffel, [Projective Modules over Higher-Dimensional Non-Commutative Tori](https://www.cambridge.org/core/journals/canadian-journal-of-mathematics/article/projective-modules-over-higherdimensional-noncommutative-tori/4DC0865D5E9FB47AF2430EDB16B4C282)
(1988), supplies the classical lattice construction. Austad–Enstad,
[Heisenberg Modules as Function Spaces](https://link.springer.com/article/10.1007/s00041-020-09729-7)
(2020), provides the faithful-trace localization comparison; convert its minus
translation and first-variable-linear Hilbert convention to the explicit
conventions above. Its general-LCA Feichtinger-space construction does not
replace H2's finite-type Schwartz–Bruhat targets.

Follow the [Mathlib discussion of CStarModule and opposite actions](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/redefining.20.60Inner.60.20in.20.60InnerProductSpace.20.F0.9D.95.9C.20.F0.9D.95.9C.60/near/487305019)
and native `WithCStarModule`. Mathlib's proposed
[compact-support density in Schwartz space #43046](https://github.com/leanprover-community/mathlib4/pull/43046)
and [test-function-to-Schwartz map #37350](https://github.com/leanprover-community/mathlib4/pull/37350)
guide the cutoff interfaces. Build the needed results in Tau Ceti with those
shapes and adopt Mathlib declarations when available. [Suggested.lean](Suggested.lean)
prototypes native carriers and representative formulas; this README is the
definitive specification.
