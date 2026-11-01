# Roadmap: Morse–Novikov homology and dynamical Reidemeister torsion

**Summary.** Build the Morse theory of closed real one-forms on closed manifolds: the
period-controlled completion Nov(R,H,N) of a group ring (Layer 1), Morse closed one-forms,
their abelian covers and the lifted trajectory moduli (Layer 2), the Novikov complex with its
continuation maps and its comparison with the completed cellular chains of the cover (Layer 3),
based chain torsion over fields and over the total quotient rings of Nov (Layer 4), periodic
return orbits with their Lefschetz signs and the dynamical zeta function (Layer 5), and the
main comparison (Layer 6): for an admissible pair (α,g) on a closed connected manifold X with
χ(X)=0 and a connected regular abelian cover X̃ on which α becomes exact, the torsion of the
Novikov complex times the zeta function of the negative dual flow equals the cellular
Reidemeister torsion of X̃ in the total quotient ring of Nov modulo signs and deck monomials
(Hutchings, Forum Math. 14 (2002), Theorem B, p. 215). Layer 7 refines everything by Euler
structures. On the way the build proves the Novikov isomorphism, the Novikov inequalities and
top-degree vanishing, integrality and the product formula of the zeta function, the Lefschetz
fixed-point formula for smooth self-maps of closed manifolds with nondegenerate fixed points,
the vector-field Poincaré–Hopf theorem, and explicit circle, mapping-torus and zero-surgery
calculations. `Suggested.lean` states the two headlines that are statable against the pinned
libraries, the Lefschetz fixed-point formula `lefschetz_fixed_point_formula` and the
vector-field Poincaré–Hopf theorem `poincare_hopf`; its module docstring names the other
headlines and the carrier each one lacks.

## Scope and ownership

This roadmap owns:

- Layer 1: the completion Nov(R,H,N) for an arbitrary abelian group H and an arbitrary
  homomorphism N:H→ℝ, its period filtration and completeness, pushforwards along
  period-compatible exponent maps, geometric series, exp/log and infinite products, the
  comparison with `LaurentSeries` and with locally finite Hahn series, the domain property for
  torsion-free finitely generated H, and completed modules over free H-sets. Dongryul Kim's
  Novikov-series development
  ([repository](https://github.com/dongryul-kim/lean4-novikov), with its
  [coefficient/support carrier](https://github.com/dongryul-kim/lean4-novikov/blob/d5e705bd46bca9cb1622a260425388500d7697c2/Novikov/Series/Basic.lean))
  treats real additive-submonoid exponents and, in several variables, finiteness for every
  positive weight vector; Layer 1 instead permits an arbitrary abelian exponent group with a
  specified, possibly noninjective period map, and §1.4 constructs the comparison with that
  one-variable carrier on the image of N. Any adaptation of that code follows its licence.
- Layer 2: the zero locus and Morse condition of a closed one-form, the period homomorphism and
  the period-kernel cover with its lifted smooth structure, lifted trajectory moduli with
  compactness under a potential-drop bound, and the determinant-line sign convention for
  trajectories.
- Layer 3: the Novikov complex, continuation maps and homotopies in a fixed cohomology class,
  the equivariant cellular complex of the cover and the Morse-to-cellular comparison, the
  exact-form and large-gradient specializations, the Novikov inequalities and the top-degree
  vanishing theorem.
- Layer 4: determinant lines and based torsion of finite complexes over a field, the minor
  formula and the basis-change formula, the field decomposition of the total quotient rings of
  ℤ[H] and Nov(ℤ,H,N), the period-order topology and cutoff continuity of torsion, Norm and
  trace for finite cyclic quotients, and torsion of based complexes over Nov modulo signs and
  deck monomials.
- Layer 5: local return germs of periodic orbits, multiplicities and Lefschetz signs, the
  fixed-point index of isolated fixed points of smooth and continuous maps, admissible pairs
  and their genericity, finiteness of orbits below a period cutoff, and the zeta function with
  its integrality, product formula and finite-cover norm formula.
- Layer 6: the invariant I, its invariance (Theorem A) and its identification with cellular
  torsion (Theorem B), the generic one-parameter families and bifurcation analysis, the
  Lefschetz fixed-point formula and the finite-triangulation chain adapter, and the circle,
  mapping-torus and zero-surgery calculations.
- Layer 7: Euler chains, the vector-field Poincaré–Hopf theorem, Euler structures and the
  refined torsions.

This roadmap leaves to named roadmaps:

- Intrinsic critical Hessians, indices and standard Morse charts, compact-band handles and CW
  models, Morse inequalities and gradient convergence: MorseTheory M1–M4 and M6. Local
  potentials in §2.1 consume these.
- Smooth stable and unstable manifolds, the λ-lemma, ordinary broken trajectories and gluing,
  coherent orientations, the ordinary Morse/singular comparison, the Banach-manifold Fredholm
  and transversality substrate, ordinary Cerf families and the closed-return genericity germ:
  HeegaardFloer Layer 1 (Lane M), Layer 2 (F0), §1.5 (M.5) and §2.8 (F0.6). §§2.3, 3.2, 5.1
  and 6.2 build the closed-one-form, cover and period-cutoff versions on top of them.
- Differential forms, the exterior derivative, local primitives, metrics and musical maps,
  maximal flows, integration, de Rham theory and the period comparison, smooth homotopies, the
  Brouwer degree and sharp finite-dimensional Sard: DifferentialGeometry Layers 0–3, 5, 6, 8,
  10 and 12.
- The fundamental groupoid, local systems, relative singular and cellular chains, excision,
  mapping cones, the orientation local system and the Euler characteristic: AlgebraicTopology
  Stages 1–7. The degree-one Hurewicz isomorphism `π₁(X)ᵃᵇ ≅ H₁(X;ℤ)`: DGFloer Layer 1 item 1.
  The classification of connected and regular covers by subgroups of π₁ and the deck-group
  quotient: UniversalCovers Stage 2, items 7–8.
- Tubular neighbourhoods, collars and gluing, the C^∞ topology on diffeomorphism groups, knot
  presentations, the Seifert-normalized Alexander polynomial, zero-slope surgery, smooth
  triangulations and the PL comparison: GeometricTopology Layers 1, 3–5 and 11. §6.9 owns only
  the equivariant knot/surgery chain adapter and the torsion calculation on top of these.
- Already in the pinned Tau Ceti and consumed as is: nondegenerate critical points of functions
  on manifolds (`TauCeti.IsManifoldNondegenerateCriticalPoint`), the manifold Morse index
  (`TauCeti.manifoldMorseIndex`), the Riesz dual on a Riemannian tangent bundle
  (`Riemannian.Tensor.rieszDual`), and relative singular homology on topological pairs
  (`TopPair.singularHomology`, `TopPair.singularHomologyMap`). The standard-model Morse chart
  and the adapted pseudo-gradient family of the library are consumed through MorseTheory M1
  with their chart and normalization conventions.

No Floer complex, spectral sequence, nonabelian torsion, analytic Ray–Singer torsion or gauge
invariant is an input to this development. The implemented local invariant graphs, the
orbit-union and global C¹ vector-space stable sets and the Banach-subset Sard–Smale theorem of
the libraries do not by themselves give the manifold, sharp-regularity or completed-cover
statements of Layers 2, 3 and 5; the adapters are built here under the libraries' actual
hypotheses.

## Conventions

The geometric setting is a finite-dimensional real smooth Hausdorff second-countable closed
connected manifold X without boundary. The Novikov complex does not require X to be oriented.
The torsion comparison of Layer 6 assumes χ(X)=0; when a field component of a complex is not
acyclic its torsion component is 0 (the zero convention of Hutchings rt3, Definition A.1,
p. 239). Smooth one-forms use DifferentialGeometry Layers 0–1's common smooth-form carrier
(`closedForms`, `RoughForm`) and exterior derivative, with its pullback and de Rham comparisons.

A closed one-form α is Morse if its local potentials have nondegenerate critical points. This
predicate includes neither Morse–Smale transversality nor periodic-orbit nondegeneracy; the
admissible pairs of §5.3 add both. The metric dual is V=α♯, and trajectories and closed orbits
are those of **−V** (rt3 §1.1, p. 210, where flow lines of −V are counted).

Choose a connected regular abelian covering π:X̃→X on which π*α is exact, with a specified
identification of its deck group with an abelian group H. Periods factor as
`π₁(X)→H₁(X;ℤ)→H→ℝ`; the final homomorphism is P. Write H additively, monomials as e^h, and
use **N=−P** in the Novikov completion (rt3 §1.2, p. 211: the ring is Nov(H,−[α])). A primitive
f̃ of π*α satisfies `f̃(h·x)=f̃(x)+P(h)`, so e^h shifts critical values by P(h), and completed
chains are finite above each potential threshold. A downward closed orbit γ has
`N([γ])=−∫γ α>0`. Neither injectivity nor discreteness of N is assumed.

For S¹ use ℝ/ℤ, identified with `Circle` by t↦exp(2πit), and pull back DifferentialGeometry's
`circleAngularForm/(2π)` to obtain the angular form with integral 1. The Laurent variable t is
the monomial of the generator of H≅ℤ with **N(h)>0**, not a silently chosen positive angular
deck generator. In the exact N=0 circle example t is separately fixed as the positive angular
deck generator; no N(t)>0 condition applies there.

The trajectory sign convention is `TD(p)=TM(p,q)⊕ℝ(negative-flow tangent)⊕TD(q)`: orient the
descending manifolds of the critical points of X, lift the orientations to X̃, and declare a
trajectory from p̃ to q̃ positive when the orientation of the descending manifold at p̃ agrees
with the outward flow direction followed by the descending orientation at q̃ transported along
the trajectory (rt3 §1.4, p. 213). No orientation of X is used.

Torsion convention: the elementary two-term complex with differential a from degree 1 to
degree 0 has torsion a⁻¹. This is the convention of rt3 Definition A.1 and Proposition A.2,
p. 239, `τ=±Π_i det(∂_s:D_i→E_(i−1))^((−1)^i)`, and it is the one every Check below uses;
Milnor's definition `τ(C)=Σ_i (−1)^i [b_i h_i b_(i−1)/c_i]` (Milnor 1966, §3, p. 365) assigns
the inverse, so an elementary operation transported from Milnor inverts the value.

The algebraic coefficient ring R is any commutative ring. Torsion over ℤ and over rational
characteristic-zero field components is its own layer; a Novikov ring over an arbitrary ring
is not assumed to be a field. Every geometric deck group H is finitely generated, proved from
a finite CW model of X. Layer 1 also treats arbitrary abelian groups, without a finite field
decomposition in that generality. Universes: coefficient objects of singular homology are
taken in the universe of the space (`ULift ℚ` in `Suggested.lean`).

## Exact supplier contracts

### From Mathlib

- `AddMonoidAlgebra R H` and `Finsupp`: finite group-ring coefficients and the finitely
  supported functions embedded into Nov by their coefficient map (§1.1).
- `HahnSeries` and `LaurentSeries R`: the ordered-support series rings compared with Nov in
  §1.4; a Hahn well-founded support alone is weaker than finite support below every real
  threshold, so neither replaces the definition of §1.1.
- `Localization (nonZeroDivisors A)`: total quotient rings (§4.3).
- `ChainComplex (ModuleCat R) ℤ`, its homology and chain homotopies: all chain complexes of
  Layers 3, 4, 6 and 7 are native complexes; no private kernel/image quotient is used.
- `IsAddQuotientCoveringMap`: the quotient covering map of a free properly discontinuous
  additive action, used for the period-kernel cover of §2.2.
- `Flow`, `mfderiv`, `ContMDiff`, `IsManifold`, `ModelWithCorners`: manifold calculus for the
  flows of §2.3 and §5.1 and for the statements of the Lefschetz formula in §6.7 and of the
  Poincaré–Hopf theorem in §7.1; `TangentBundle`, `TangentSpace` and `ContinuousLinearMap.snd`
  read the vertical derivative of a vector field at a zero (§7.1).
- `LinearMap.det`, `LinearMap.trace`, `Function.fixedPoints`, `Module.finrank`, `TopPair.incl`,
  `TopCat.ofHom`, `ModuleCat.of`: the carriers of `lefschetz_fixed_point_formula` and
  `poincare_hopf`.

### From Tau Ceti

- `TauCeti.IsManifoldNondegenerateCriticalPoint` and `TauCeti.manifoldMorseIndex`
  (Geometry/Manifold/Morse): nondegeneracy and index of a critical point of a function on a
  manifold; §2.1 proves that the index of a zero of a Morse form is the index of any local
  potential.
- `Riemannian.Tensor.rieszDual` (Geometry/Manifold/VectorBundle/Riemannian/Riesz): the metric
  dual V=α♯ of §2.1.
- `TopPair.singularHomology`, `TopPair.singularHomologyMap` (AlgebraicTopology/Singular/
  Relative): relative singular homology of topological pairs and its functoriality; absolute
  homology is the pair (X,∅) through `TopPair.incl`, and the Betti numbers of `poincare_hopf`
  are the ranks of the same carrier.

### From TauCetiRoadmap.MorseTheory

M1 (critical Hessians, indices and normal forms), M2 (compact-band deformation, handles and
cells), M3 (approximation and proper Morse exhaustions), M4 (strong inequalities and topology
tests) and M6 (gradient convergence and exponential decay). §2.1 consumes M1 for the local
potentials, §3.3 consumes M2 for the finite CW model, §7.1 consumes M4 and §2.3 consumes M6.

### From TauCetiRoadmap.HeegaardFloer

Layer 1 (Lane M): smooth stable/unstable manifolds, the λ-lemma, ordinary broken
trajectories and gluing, coherent orientations, the ordinary Morse/singular comparison and
§1.9 (M.9)'s Morse Euler/index identity.
Layer 2 (F0): the Banach-manifold Fredholm and transversality substrate and sharp
finite-dimensional Sard. §1.5 (M.5): the ordinary local A₂ fold, relative partial-jet
transversality and the signed elementary chain change at a birth/death. §2.8 (F0.6): the
closed-return genericity theorem for C^k vector fields and its return-map germ, which §5.1
applies to −α♯. Layers 2, 3, 5 and 6 build the closed-one-form, cover and period-cutoff
versions; they do not posit moduli spaces as unexplained input fields.

### From TauCetiRoadmap.DifferentialGeometry

Layers 0–1 (forms, `closedForms`, `RoughForm`, the exterior derivative, local primitives),
Layer 2 (orientations), Layer 3 (flows: `flowOf`, `toFlow`,
`isCompleteVectorField_of_compactSpace`; compactness supplies completeness here), Layer 5
(integration, with `circleAngularForm` and its integral 2π over the circle), Layer 6 (de Rham
cohomology), Layer 8 (de Rham theorem and period comparison, where the de Rham class of
`circleAngularForm` is nonzero), Layer 10 (Brouwer degree) and Layer 12 (metrics and musical
maps).

### From TauCetiRoadmap.AlgebraicTopology

Stage 1 (fundamental groupoid), Stage 2 (relative singular chains and homology), Stage 3
(subdivision, excision, Mayer–Vietoris), Stage 4 (CW pairs and cellular homology: item 2's
cellular differential and item 3's cellular/singular comparison), Stage 5 (local systems,
covers and finite-cover descent), Stage 6 (orientation local system and manifold duality) and
Stage 7 (Euler characteristic). The §6.8 chain adapter identifies its simplicial complex with
Stage 4's cellular complex and composes with Stage 4's cellular/singular comparison.

### From TauCetiRoadmap.DGFloer

Layer 1 item 1: the degree-one Hurewicz isomorphism `π₁(X)ᵃᵇ ≅ H₁(X;ℤ)` for path-connected
X, natural in X. §2.2 uses it to factor periods through H₁(X;ℤ) and §7.2 to compare the
Euler-structure torsor with deck groups.

### From Completed UniversalCovers

Stage 2 items 7–8: the pointed cover attached to a subgroup of π₁(X,x₀), the regular-cover
criterion and the identification of the deck group with the quotient π₁(X,x₀)/K for a normal
subgroup K. §2.2 specializes it to the kernel of a surjection π₁(X)→H.

### From TauCetiRoadmap.GeometricTopology

Layer 1 (tubular neighbourhoods, collars, gluing), Layer 3 (C^∞ family topology), Layer 4
(knot presentations, meridian and Seifert longitude, Conway-normalized Alexander polynomial),
Layer 5 (zero-slope Dehn surgery) and Layer 11 (smooth triangulations, the simplex-cell CW
structure on |K|, cellularity of simplicial maps and the PL comparison).

## How to read the build

Layer 1 is pure algebra and independent of geometry. Layer 2 uses the native Morse and flow
topology and HeegaardFloer's Lane M and F0. Layer 3 consumes Layers 1–2 and the cellular
suppliers. Layer 4 is algebra again, independent of Layers 2–3, and is then applied to their
based complexes. Layer 5 consumes Layers 1–2 and the return-germ of HeegaardFloer F0.6.
Layer 6 uses all five, together with its own Lefschetz and knot/surgery adapters, and proves
the main theorem. Layer 7 constructs the Euler carrier and refines Layer 6. Generic ordinary
Morse homology is not proved from the dynamical torsion theorem, and the Novikov homology
comparison is not used to infer torsion invariance without its based comparison factor.

## Layer 1: period-controlled completed group rings and modules (N1)

### 1.1 The completion and its ring structure

For an abelian group H and a homomorphism N:H→ℝ, define Nov(R,H,N) as the set of coefficient
functions a:H→R satisfying `∀ C:ℝ, {h | a(h)≠0 ∧ N(h)<C}.Finite` (rt3 §1.2, p. 211, where
Nov(G,N) is the set of such sums; rt2 §1, p. 371 for H=H₁ and N=−θ). Use this exact support
condition. Prove it is equivalent with ≤C in place of <C, and that a nonzero support has a
lower bound and a least N-value. Prove equality coefficientwise; construct zero, addition,
negation, coefficient scalar maps and convolution. For each h the pairs `(u,v)` with u+v=h and
a(u)b(v)≠0 are finite; prove this before interpreting the coefficient sum. Prove all
commutative-ring and R-algebra laws by finite support arguments, including the uniform cutoff
lemma needed for associativity. Monomials multiply by adding exponents and are units with
inverse e^(−h). Embed `AddMonoidAlgebra R H` by its actual coefficient map. For nontrivial R
prove this embedding is onto iff N=0. *Needs:* Mathlib `AddMonoidAlgebra`, `Finsupp`,
`Set.Finite`.

API of the completion:

- Membership of a coefficient function is the finiteness of its support below every real
  cutoff; the <C and ≤C forms agree.
- Addition, negation and scalar multiplication act coefficientwise; multiplication is the
  convolution `(ab)(h)=Σ_(u+v=h) a(u)b(v)`, a finite sum for each h.
- The group ring embeds coefficient-preservingly as a subring; monomials e^h are units with
  `e^h e^k=e^(h+k)` and `(e^h)⁻¹=e^(−h)`.
- Positive rescaling of N gives the same ring; −N gives the completion in the opposite
  direction, related to the first by h↦−h and not equal to it.

**Checks.**

- H=ℤ, N(k)=k, R=ℤ: the function with a(k)=1 for all k≥0 and 0 otherwise is in Nov (below any
  C only finitely many k≥0 lie), while the function with a(k)=1 for all k∈ℤ is not (infinitely
  many k<0). A definition requiring only well-ordered support would accept the first and reject
  the second as well, but a definition requiring finite support in total would reject both.
- N=0: Nov(R,H,0) is exactly the finitely supported functions, so the group-ring embedding is
  onto; for N≠0 pick h with N(h)>0, and `Σ_(k≥0) e^(kh)` lies in Nov but not in the image. A
  definition with the inequality reversed (support finite above every cutoff) would make
  `Σ_(k≥0) e^(kh)` fail membership and `Σ_(k≤0) e^(kh)` succeed.
- H=ℤ³, N(a,b,c)=a+√2b (noninjective, irrational, kernel generated by (0,0,1)):
  `Σ_(n≥0) (e^((n,0,0))+e^((n,0,n)))` is in Nov with two tied coefficients at each period n,
  while the function supported on the whole kernel {(0,0,c)} is not (infinitely many h with
  N(h)=0<1).
- Convolution with H=ℤ, N(k)=k: `(Σ_(k≥0) t^k)(1−t)=1`, each coefficient a finite sum of two
  terms; the product of two series supported on k≥0 has coefficient at t^n equal to a finite
  sum of n+1 terms.

### 1.2 The period filtration, completeness and pushforwards

Put `U_C={a | ∀h, N(h)<C→a(h)=0}`. These additive subgroups define the separated period-filtration
topology (rt3 §2.1, p. 220: a series is O(R) when every coefficient below period R vanishes, and
limits in Nov are taken in this sense). Prove completeness and the universal completion property
for the group ring with this filtration, density of finite truncations, continuity of ring
operations, and cutoff/convolution compatibility. Scalar change is coefficientwise; base change of
completed rings is not identified with a tensor product without its own proof. Positive rescaling
of N gives the same topology.

For commutative ground rings R,S, a unital homomorphism ρ:R→S, an exponent homomorphism
φ:H→H′ and c>0 satisfying N′∘φ=cN, construct the continuous unital ring homomorphism
P_(ρ,φ):Nov(R,H,N)→Nov(S,H′,N′) with coefficient
`P_(ρ,φ)(a)(h′)=Σ_(φ(h)=h′) ρ(a(h))`, summing over nonzero source coefficients. Prove this sum
and every target sublevel support finite using the period identity. Prove additivity,
multiplication, preservation of 1 and monomials, ground-coefficient naturality, identity and
composition laws by reindexing the actual finite sums. If U_C and U′_D are the declared period
neighbourhoods, prove `P_(ρ,φ)(U_C)⊆U′_(cC)` and deduce continuity. Construct its restrictions
to the nonnegative subrings and strictly positive ideals. With fixed ground ring export the
R-algebra homomorphism specialization. Finite kernel is not required for this pushforward.
With finite kernel also construct the restriction φ^* by coefficient precomposition and prove
its support bound (rt3 §3.4, p. 227: the pullback ι^* along an inclusion with finite kernel,
beside the pushforward ι_*). Export the inclusion/restriction cases used in finite cyclic covers. A
pushforward with a finer grading additionally requires a target degree map commuting with φ,
or an explicit degree quotient; the period identity alone supplies the ungraded map. This
construction does not give an unrestricted series pushforward for arbitrary φ, nor flatness,
injectivity, or a completed tensor-product identification. *Needs:* §1.1.

**Checks.**

- U_C is an additive subgroup but not an ideal: with H=ℤ, N(k)=k, `t²∈U_2` while
  `t⁻³·t²=t⁻¹∉U_2`. A filtration by ideals would be the wrong object.
- φ:ℤ²→ℤ, (a,b)↦a, N(a,b)=a, N′(a)=a, c=1: the pushforward of a series is the sum over b in
  each fibre, and the fibre of each h′ meets the support in finitely many points because all of
  them have N=h′<h′+1. The restriction φ^* is not available (infinite kernel): the series
  a′(a)=1 for all a≥0 pulls back to a function supported on {(a,b) | a≥0}, which has infinitely
  many terms with N<1.
- φ: the inclusion 2ℤ→ℤ with N the identity and c=1: the pushforward is the inclusion
  Nov(ℤ,2ℤ,N)→Nov(ℤ,ℤ,N), and the restriction φ^* (kernel trivial) sends a series to its
  even-exponent part; both are continuous and φ^*∘P is the identity.
- φ:ℤ→ℤ/2 with N′=0 and N the identity: no c>0 satisfies N′∘φ=cN, so no pushforward is
  claimed; the map that would sum coefficients over cosets sends `Σ_(k≥0) t^k` to a divergent
  sum.

### 1.3 Nonnegative subring, geometric series, exp/log and infinite products

Construct the nonnegative-period subring of series supported on N≥0 and its strictly positive
ideal of series supported on N>0 (rt3 §1.3, p. 212: Λ⁺, the series supported on N>0, and Λ⁺⊗ℚ). Construct
geometric series for such a, prove both inverse identities for 1−a, and build exp/log between
this ideal and units of the form 1+a over a ℚ-algebra, with convergence and formal identities
in the period topology (rt3 §1.3, p. 212, and Remark 1.4). Prove filtered infinite products
converge for families whose nonconstant supports escape every cutoff. Include the monomial
identity `(1−e^h)^(−1)=Σ_(k≥0) e^(kh)` when N(h)>0. *Needs:* §§1.1–1.2.

**Checks.**

- H=ℤ, N(k)=k: `(1−t)·Σ_(k≥0) t^k=1` and `Σ_(k≥0) t^k·(1−t)=1`; the same computation with
  N(k)=−k has `Σ_(k≥0) t^k` outside the ring, so no inverse of 1−t is claimed there (the inverse
  is `−t⁻¹Σ_(k≥0) t^(−k)`).
- Over ℚ, `exp(t)=Σ t^k/k!` and `log(1+t)=Σ_(k≥1) (−1)^(k+1) t^k/k` satisfy
  `exp(log(1+t))=1+t` coefficient by coefficient; the identity `(1+x)/(1−x²)=1/(1−x)` holds
  in the ring and is the algebraic form of the period-doubling relation used in §5.4.
- The infinite product `Π_(n≥1) (1−t^n)^(−1)` converges in the period topology (the n-th
  factor is 1 modulo U_n) and its coefficient at t^4 is the number of partitions of 4, namely 5;
  the family `(1−t^n)^(−1)` with N(t)<0 does not escape the cutoffs and no convergence is
  claimed.

### 1.4 Comparisons: Laurent series, Hahn series and domains

For H=ℤ with N(k)=k, construct the coefficient-preserving ring/topological comparison with
native `LaurentSeries R`, retaining the group-ring Laurent-polynomial inclusion. For a general H
and a supplied splitting of the period kernel, give the comparison with the locally finite
subring of Hahn series whose coefficients are finite sums in the kernel group ring; prove
coefficient and topology formulas. The splitting and the ordered period group are data, and
this comparison is not the definition. For injective N construct the coefficient-preserving
comparison with Kim's one-variable carrier on the image of N, including convolution and the
period topology; for noninjective N retain the finite ties in each period fibre and compare
through the supplied kernel splitting. For finitely generated torsion-free H and a domain R
prove Nov is a domain using leading coefficients in the period-kernel group ring (rt3 Lemma
A.4, p. 240: the leading-coefficients argument for ℤF and Nov(F,N)); finite ties in N are
retained. *Needs:* §§1.1–1.2, Mathlib `LaurentSeries`, `HahnSeries`.

**Checks.**

- H=ℤ, N(k)=k: the comparison sends `Σ_(k≥0) t^k` to the Laurent series `(1−t)⁻¹` and
  `t⁻³` to `X⁻³`; with N(k)=−k the ring is instead identified with series in t⁻¹ through
  h↦−h, and the identity map is not a ring isomorphism between the two.
- H=ℤ², N(a,b)=a+√2b (injective, image a dense subgroup of ℝ): Nov(ℤ,ℤ²,N) is a domain; the
  least N-value of a nonzero series is attained at exactly one exponent and leading terms
  multiply. H=ℤ/2, N=0: `(1−g)(1+g)=1−g²=0` with both factors nonzero, so Nov is not a domain,
  as the torsion-free hypothesis demands.
- H=ℤ³ with N(a,b,c)=a+√2b and kernel splitting H=ℤ²⊕ℤ: the Hahn comparison sends a series
  to a Hahn series over the ordered group ℤ+√2ℤ with coefficients in ℤ[ℤ]; the tied pair
  `e^((n,0,0))+e^((n,0,n))` becomes the single coefficient `1+u^n` at period n.

### 1.5 Completed modules over free H-sets

For a free H-set S with finitely many orbits and an equivariant potential F(hs)=F(s)−N(h),
construct completed R-linear combinations of S finite above every F-threshold. Chosen orbit
lifts identify this module with a finite free Nov-module (rt3 §1.4, p. 213: the completed
chains on the lifted critical points of one index are free over the Novikov ring, with a
basis given by a chosen lift of each critical point). Prove change-of-lift matrices are
diagonal monomials, cutoff convergence, and the extension of equivariant matrices to
continuous maps. Export the uniform support estimates for differentials, continuation maps,
homotopies and compositions. *Needs:* §§1.1–1.2.

**Checks.**

- S=H with F(h)=−N(h): the module is Nov itself and the lift 0∈H gives the identity
  identification; the lift h gives the identification multiplied by e^(−h).
- Two orbits with lifts s₁,s₂ and the lift change s₂↦h·s₂: the change-of-lift matrix is
  diag(1,e^h); a non-diagonal matrix would mix orbits, which no lift change does.
- An equivariant matrix with entries in ℤ[H] extends to a continuous Nov-linear map; the entry
  `Σ_(k≥0) e^(kh)` with N(h)>0 is allowed as a limit of truncations, and the entry
  `Σ_(k≥0) e^(−kh)` is not a coefficient of any completed combination.

### Examples

The circle ℝ/ℤ with H=ℤ, N(k)=k: Nov(ℤ,ℤ,N)≅ℤ((t)) with `(1−t)⁻¹=Σ_(k≥0) t^k` (§§1.3–1.4).
The torus with H=ℤ² and N(a,b)=a+√2b: a domain with dense period image (§1.4). The Klein
bottle's abelian cover of §2.2 with H=ℤ⊕ℤ/2 and N(n,e)=−n: the completion is
`(ℤ[ℤ/2])((t))` with t=e^((−1,0)), containing the zero divisors 1−g and 1+g (§§1.4, 4.3).

### Dependencies

Mathlib `AddMonoidAlgebra`, `Finsupp`, `HahnSeries`, `LaurentSeries`, `Set.Finite`. No
geometry and no other layer.

## Layer 2: Morse closed one-forms, covers and bounded-period moduli (N2)

### 2.1 Zero locus, local potentials and the index

Define the zero locus of a closed one-form α using the actual cotangent bundle. Prove that the
critical Hessian and index of a local potential are independent of the potential; compare a
nondegenerate zero with transversality of the section α to the zero section. Establish local
normal forms, isolation and finiteness of the critical set on compact X. Define the negative
dual field −V=−α♯ through `Riemannian.Tensor.rieszDual`, its trajectories, stable and unstable
manifolds, and Morse–Smale transversality, each separately (rt3 Definition 1.1, p. 211, the
admissibility conditions (a) and (b)). Specify descending orientation lines over critical
points and their deck transport, with the sign convention of the Conventions section, and
compare it with HeegaardFloer Lane M's integer boundary convention rather than counting
unsigned trajectories. *Needs:* MorseTheory M1; Tau Ceti
`TauCeti.IsManifoldNondegenerateCriticalPoint`, `TauCeti.manifoldMorseIndex`,
`Riemannian.Tensor.rieszDual`; DifferentialGeometry Layers 0–1 and 12; HeegaardFloer Lane M.

**Checks.**

- α=df exact: the zero locus is the critical set of f and the index of a zero is
  `TauCeti.manifoldMorseIndex` of f there; f and f+c give the same Hessian, as every local
  potential of α differs locally from f by a constant.
- α=dθ on S¹: the zero locus is empty, so α is Morse vacuously; the Morse–Smale condition is
  vacuous too.
- The one-form d(x³) on ℝ pulled back to a chart: its zero at 0 is degenerate, so the Morse
  predicate fails; a predicate that only asked for a nondegenerate zero of α as a section
  (transversality to the zero section) agrees with the Hessian criterion and also rejects it.
- Nondegenerate zeros are isolated, so a Morse form on compact X has finitely many zeros; on
  the noncompact ℝ the form d(sin x) has infinitely many nondegenerate zeros, which is why
  compactness is a hypothesis.

### 2.2 Periods, abelian covers and the Klein-bottle counterexample

Construct the period homomorphism by integrating loops, with homotopy, concatenation,
homology and de Rham naturality (DifferentialGeometry Layers 5 and 8). Specialize the
regular-cover classification to surjections π₁(X)→H, using π₁-abelianization; π*α is exact iff
the periods vanish on that kernel (rt3 Choice 1.2, p. 211). Build the lifted smooth structure,
metric, vector field and primitive, with deck-equivariance and positive/negative flow
comparison. For a connected regular cover with abelian deck group H, prove that
`H₁(X̃;ℤ) → H₁(X;ℤ) → H → 0` is exact at H₁(X;ℤ) and surjective onto H, using the subgroup of
π₁(X) defining the cover and the natural abelianization maps. The first arrow need not be
injective.

Make that failure explicit on the Klein bottle `X=([0,1]×(ℝ/ℤ))/((1,y)∼(0,−y))`. Use
GeometricTopology's smooth gluing and AlgebraicTopology's fundamental-group and abelianization
APIs to construct the connected smooth cover `C=ℝ_s×(ℝ_y/2ℤ)` and its commuting deck
transformations `A(s,y)=(s+1,−y)`, `B(s,y)=(s,y+1)`. Prove B has order 2 and that these
generate a free proper action of `H=ℤ⊕ℤ/2`, with quotient the same Klein bottle X. The
integral closed form α=ds descends to X, its pullback has primitive s, and `P(n,e)=n`,
`N(n,e)=−n`. Prove that this cover is the universal abelian cover: for the based section a at
y=0 and the fibre loop b, use `π₁(X)=⟨a,b | aba⁻¹=b⁻¹⟩`, identify the cover subgroup with
⟨b²⟩, and identify its deck quotient with H₁(X;ℤ). The cover retracts onto its length-two
fibre circle, so H₁(C;ℤ)=ℤ. Its positive fibre generator maps to b² in π₁(X) and to `2[b]=0` in
H₁(X;ℤ). Thus the induced H₁ map is zero on a nonzero group, although the covering map induces
an injective map of fundamental groups. Identify H₁(X;ℤ)→H with the isomorphism sending [a] to
(1,0) and [b] to (0,1).

For integral period classes construct the circle-valued map and its pullback cover, then
identify a connected component and the divisibility of its deck generator. Every real class,
including irrational ones, has a period-kernel cover. In the preceding example the minimal
period-kernel cover instead has deck group ℤ and kills b; distinguish it from the larger
abelian cover C, whose period map has kernel ℤ/2. With the downward monomial t=A⁻¹ and g=B,
compare Layer 1's completion to `(ℤ[ℤ/2])((t))`, retaining both coefficients at each period.
Exhibit the nonzero factors 1−g and 1+g with product 0. This geometric cover realizes a deck
group with torsion, to which §4.3's total-quotient construction applies. *Needs:* §1.1;
DifferentialGeometry Layers 5 and 8; AlgebraicTopology Stages 1, 2 and 5; DGFloer Layer 1
item 1; UniversalCovers Stage 2 items 7–8; GeometricTopology Layer 1; Mathlib
`IsAddQuotientCoveringMap`.

**Checks.**

- S¹=ℝ/ℤ with α the angular form of integral 1: P sends the positive generator to 1, the
  period-kernel cover is ℝ→ℝ/ℤ with H=ℤ, and N sends the positive angular generator to −1, so
  t is the monomial of the negative angular generator; for α=df exact, P=0 and the period-kernel
  cover is X itself.
- Klein bottle: `AB(s,y)=(s+1,−y−1)` and `BA(s,y)=(s+1,−y+1)` agree modulo 2, so A and B
  commute; `A^nB^e(s,y)=(s,y)` forces n=0 and e even, so the action is free; the quotient by B
  is `ℝ×(ℝ/ℤ)` and the quotient by A then identifies (s,y) with (s+1,−y), the Klein bottle.
- Klein bottle: `[a,b]=aba⁻¹b⁻¹=b⁻²`, so the commutator subgroup contains b² and the quotient
  by ⟨b²⟩ is abelian, hence equal to it; the cover with subgroup ⟨b²⟩ is C and its deck group
  is ℤ⊕ℤ/2.
- Torus with α=dx+√2dy: P:ℤ²→ℝ is injective with dense image, the period-kernel cover is the
  universal cover ℝ², and N is not discrete; a construction that demanded a circle-valued map
  would fail here, which is why the period-kernel cover is defined for every real class.

### 2.3 Lifted trajectory moduli and compactness under a drop bound

For a Morse–Smale pair on compact X, establish a lifted moduli space for each pair of lifted
critical points, with translation quotient and expected dimension equal to the index
difference minus one (rt3 §1.1, p. 211, the expected dimension, and §1.4, p. 213, the lifted
count). Construct compactification, evaluation and gluing
under a fixed upper bound on **potential drop**. Compactness on X is not compactness on X̃:
prove that outside disjoint small critical neighbourhoods, drop controls trajectory length;
passages near hyperbolic critical points have controlled entry and exit, and only finitely
many compatible lifts and connecting pieces occur below a fixed drop (rt3 §1.3, p. 212, the
length bound by a multiple of the drop, and §1.4, p. 213). Exclude equal- and higher-index
broken cycles by Morse–Smale transversality. Prove index-one signed trajectories are finite at
a fixed cutoff, index-two boundary products give the coherent square-zero identity, and all
estimates are uniform on the compact parameter sets needed in Layer 3. Retain empty and
constant-trajectory cases separately from the free translation quotient. *Needs:* §§2.1–2.2;
HeegaardFloer Lane M (M.1–M.3) and F0; MorseTheory M6; DifferentialGeometry Layer 3.

**Checks.**

- The circle with two critical points p (maximum) and q (minimum) and nonzero period: on the
  cover ℝ the lift p̃ has exactly one trajectory to each of the two adjacent lifts of q, and
  none to any other lift; the number of trajectories from p̃ with drop below any bound is
  finite (at most 2).
- Two critical points of equal index: the expected dimension −1 and transversality give an
  empty moduli space; a theory that counted such trajectories would break d²=0.
- The constant curve at a critical point is not a trajectory from p̃ to q̃ with p̃≠q̃, and it
  is excluded separately rather than quotiented by translation.
- On the cover ℝ of the circle, the trajectory from p̃ to the adjacent lift of q has drop
  f̃(p̃)−f̃(q̃), and translating the curve by s changes nothing in the quotient; two trajectories
  with the same image and different parametrizations are one point of the moduli space.

### Examples

The angular form on S¹ (no zeros, one closed orbit); the exact two-critical-point circle; the
Klein bottle with its two covers of §2.2; the torus with an irrational class.

### Dependencies

§1.1; MorseTheory M1 and M6; HeegaardFloer Lane M and F0; DifferentialGeometry Layers 0–3, 5,
8 and 12; AlgebraicTopology Stages 1, 2 and 5; DGFloer Layer 1 item 1; UniversalCovers
Stage 2; GeometricTopology Layer 1; Tau Ceti Morse index and Riesz dual.

## Layer 3: the Novikov complex, continuation and cellular comparison (N3)

### 3.1 The Novikov complex

Take coefficients in ℤ first and scalar-extend coefficientwise to R. Define
`CN_i=Nov(R,H,N)⟨chosen lifts of Crit_i(α)⟩`; its differential sums signed index-one
trajectories to **all** lifts of each lower critical point (rt3 §1.4, p. 213, equation (1.3)).
Use Layer 2 to prove the output support condition, continuity, Nov-linearity and d²=0 (rt3
§1.4, p. 213). Change of lifts and descending orientations gives specified chain
isomorphisms. Define homology through native chain complexes. *Needs:* §§1.1, 1.5, 2.3;
Mathlib `ChainComplex (ModuleCat R) ℤ`.

**Checks.**

- The two-critical-point circle with nonzero period and adjacent chosen lifts: `d p̃=±(1−t) q̃`,
  where the two terms are the two adjacent lifts of q and the signs differ because the two
  trajectories leave p̃ in opposite directions; with the lift t^k q̃ chosen instead the
  coefficient is `±(1−t)t^(−k)`.
- Exact α=df with the trivial cover: CN is the ordinary integral Morse complex, with no
  completion.
- Changing the lift of one generator by h multiplies its row and column by e^(∓h); the complex
  changes by a diagonal monomial conjugation (§1.5), never by a non-monomial matrix.

### 3.2 Continuation

For cohomologous α₀,α₁ on the same cover, construct continuous continuation chain maps and
degree-one homotopies with uniform period estimates; prove constant identity, concatenation
up to homotopy, inverse and independence on homology. Genericity must concern the full
function/metric path, or a generic horizontal lift on the parameter product; a fixed arbitrary
function homotopy with generic metrics alone need not be transverse (Hutchings, family-Floer
transversality erratum). Build genericity in each fixed cohomology class, relative to
prescribed endpoint data, with the actual finite-regularity Baire and local-perturbation
suppliers; every member of a generic path need not be individually Morse–Smale. *Needs:*
§§2.3, 3.1; HeegaardFloer F0 and M.5.

**Checks.**

- The constant path gives the identity chain map; the concatenation of a path with its
  reverse is homotopic to the identity.
- On S¹ with nonzero period, the critical-free form (CN=0) and the two-critical-point form
  (CN acyclic, §3.1) are cohomologous, and the continuation maps between them are chain
  homotopy equivalences, consistent since both complexes are acyclic.
- A path of exact forms df_t on a closed manifold with a birth/death at t₀: the continuation
  across t₀ is the signed elementary chain change of HeegaardFloer M.5, not the identity on
  generators.

### 3.3 The equivariant cellular complex and the Morse-to-cellular comparison

Construct an equivariant finite cellular chain complex of X̃ over ℤ[H] from a finite CW model
of X and actual lifted attaching maps. Its completed version is
`Nov(R,H,N)⊗_(ℤ[H]) Ccell_*(X̃;ℤ)` with the displayed group-ring scalar map. Prove a chain
homotopy equivalence with CN, compatible with subdivisions, cell models, orientation/lift
changes and continuation; on homology this is the Novikov isomorphism (rt3 §1.4, equation
(1.4), p. 213). Build the alternative controlled singular-chain model: locally finite chains
upstairs with only finitely many simplices meeting any region {f̃>C}, including the controlled
subdivision, prism and comparison operations. The comparison is with this carrier, not merely
an isomorphism with an unnamed completed homology. *Needs:* §§1.5, 3.1–3.2; MorseTheory M2;
AlgebraicTopology Stages 2–5; GeometricTopology Layer 11.

**Checks.**

- The circle with one 0-cell and one 1-cell, cover ℝ, N(t)>0: the completed cellular complex is
  `Nov →(1−t) Nov`, and 1−t is a unit (§1.3), so the completed cellular homology vanishes, in
  agreement with CN=0 for the critical-free form.
- Exact α=df on S¹ with the universal cyclic cover and N=0: coefficients ℤ[t,t⁻¹],
  differential ±(1−t), H₀=ℤ with trivial deck action and H₁=0; this differs from H_*(S¹)⊗ℤ[t,t⁻¹].
- The torus with α the pullback of dx and cover ℝ×S¹: the completed cellular complex is the
  tensor product of `Nov →(1−t) Nov` with the cellular complex of S¹, acyclic because 1−t is a
  unit; Novikov homology is not H_*(T²)⊗Nov.

### 3.4 Exact forms and the large-gradient comparison

Prove the exact-form specialization is the group-ring equivariant ordinary Morse complex.
Prove the large-gradient comparison for β=α+C df with C sufficiently large and a chosen
Morse–Smale f: after positive rescaling to df+C⁻¹α, the relevant critical points and lifted
incidence counts correspond, and the flow has no periodic orbits. Supply the
structural-stability/entry-exit and support argument. Complete the Morse-to-cellular chain
identification for the triangulation-adapted model and compare it with ordinary singular
homology (rt3 Example 1.8, p. 215, the triangulation vector field of Appendix B). *Needs:*
§§3.1–3.3; HeegaardFloer Lane M (M.4); MorseTheory M2.

**Checks.**

- α=df on any closed X: the Novikov complex is the Morse complex of f with ℤ[H]-coefficients,
  and for the trivial cover it is the ordinary Morse complex.
- S¹ with α the angular form and f a height function with one maximum and one minimum: for
  large C the form α+C df has two zeros near the critical points of f, and its Novikov
  complex is the acyclic two-term complex of §3.1.
- S¹=ℝ/2πℤ with α=dθ, f=cos θ and the flat metric: the field −∇(f+C⁻¹θ) is
  `(sin θ−C⁻¹)∂_θ`, which vanishes at the two solutions of sin θ=C⁻¹ when C>1 and nowhere when
  C<1; so for C>1 there is no closed orbit and the rescaled form has two zeros, while for C<1
  the whole circle is a closed orbit, which is why C must be large.

### 3.5 Novikov inequalities and top-degree vanishing

Derive coefficient-change and homotopy naturality through the chain maps of §§3.2–3.3. Prove the
Novikov inequalities using field-component ranks and finite critical counts (they follow from the
Novikov isomorphism of §3.3, rt3 equation (1.4), p. 213, by field-component ranks); the rank is a
dimension over an actual field component, never over an assumed Novikov field. For n=dim X and
[α]≠0 prove `H_n^Nov(X;ℤ)=0`, with the orientation-local-system argument valid for nonorientable X
as well. Give nonexact classes with zero complex and examples where Novikov homology is not
H_*(X)⊗Nov. *Needs:* §§3.1–3.4, 4.3; AlgebraicTopology Stage 6.

**Checks.**

- S¹ with a nonzero class: Novikov homology vanishes, the inequality reads 0≤#Crit_i, and the
  angular form attains it with no zeros.
- The torus with the class of dx: H_2^Nov=0 (§3.3), while H₂(T²;ℤ)=ℤ; the vanishing theorem
  is a statement about nonexact classes, and for α=0 the Novikov homology is H_*(X)⊗ℤ[H] with
  H₂≠0.
- The Klein bottle with the class of ds (§2.2): the top Novikov homology vanishes although the
  surface is nonorientable, as the local-system argument requires.

### Examples

The three circle complexes (critical-free, two critical points, exact); the torus with the
class of dx; the Klein bottle with the class of ds.

### Dependencies

Layers 1–2; MorseTheory M2; HeegaardFloer Lane M, F0 and M.5; AlgebraicTopology Stages 2–6;
GeometricTopology Layer 11; §4.3 for field-component ranks.

## Layer 4: based chain torsion and abelian total quotient rings (N4)

### 4.1 Determinant lines and based torsion over a field

Build the determinant line of a bounded finite-dimensional chain complex over a field F and
its canonical comparison with the alternating determinant of homology, using bases of
boundaries and lifts through the short exact sequences (Milnor 1966, §3, p. 365; rt3
Appendix A, equation (A.1), p. 239). Fix the convention of the Conventions section: the
elementary two-term complex with differential a from degree 1 to degree 0 has torsion a⁻¹.
For acyclic complexes obtain a nonzero scalar from the chosen ordered chain bases; for
nonacyclic complexes define the scalar to be 0 while retaining the more informative
homology-basis determinant line (rt3 Definition A.1, p. 239). Prove independence of boundary
bases and lifts, permutation and sign rules, the graded basis-change formula, scalar extension
and direct sums. For a degreewise based short exact sequence of acyclic complexes, prove
scalar-torsion multiplicativity with compatible chain bases and the explicit Koszul sign
(Milnor 1966, §3, p. 365, Theorem 3.1, which is an identity in K₁ modulo ±1, so the sign is
fixed here and not taken from the source). For general complexes, prove determinant-line
multiplicativity through the long exact homology sequence, including its torsion correction
with chosen homology bases. Regard that sequence as an acyclic homological complex with
H_i(A), H_i(B), H_i(D) in degrees 3i+2, 3i+1, 3i respectively, using the same alternating
determinant order and subspace-first lifts. Derive the scalar formula from this comparison;
the zero-extended scalar torsions do not replace the determinant-line formula. Prove
contraction and subdivision identities used below. Torsion is not invariant under every chain
homotopy equivalence: prove its transformation by the based mapping-cone torsion. *Needs:*
Mathlib `ChainComplex (ModuleCat F) ℤ`, `Basis`, `LinearMap.det`.

**Checks.**

- The two-term complex `F →a F` with a≠0 and the standard bases: torsion a⁻¹ (rt3
  Proposition A.2, p. 239, with D₁=C₁, E₀=C₀ and exponent (−1)¹); Milnor's formula gives
  `[a·e₁/e₀]=a`, the inverse, which fixes which convention is in force.
- The same complex with a=0 is not acyclic: scalar torsion 0, while its determinant line is
  `det(H₁)⊗det(H₀)⁻¹` with the homology bases e₁ and e₀.
- The direct sum of `F →a F` and `F →b F`: torsion `a⁻¹b⁻¹`; a convention multiplying
  rather than inverting would give ab and fail the two-term witness.
- The three-term acyclic complex `F →(1,0)ᵀ F² →(0,1) F` with standard bases: choosing D₂=C₂,
  E₁ the first coordinate, D₁ the second coordinate and E₀=C₀, the minor formula gives
  `1^((−1)²)·1^((−1)¹)=1` up to the overall sign.

### 4.2 The minor formula and basis change

For acyclic complexes give the square-minor formula by choosing coordinate subspaces D_i,E_i
and using the **projection** `p_(E_(i−1))∘d|_(D_i)`; these projected maps are isomorphisms
(rt3 Proposition A.2, p. 239). The differential need not map D_i into E_(i−1) itself. Compute
the alternating product of these minor determinants and reconcile it with the
determinant-line convention, including the overall sign: `τ=±Π_i det(d_s:C_i→C_(i−1))^((−1)^i)`.
For degreewise basis changes A_i, prove `τ(A⁻¹dA)=τ(d)·Π_i det(A_i)^((−1)^i)` as an exact
equality for grading-preserving A (rt3 Proposition A.5, p. 240). *Needs:* §4.1; Mathlib
`Matrix.det`.

**Checks.**

- Two-term complex `F →a F` with A₁=λ, A₀=1: the conjugated differential is aλ, its torsion
  (aλ)⁻¹, and the formula gives `a⁻¹·λ^((−1)¹)=a⁻¹λ⁻¹`; the formula with exponent (−1)^(i+1)
  would give a⁻¹λ, refuted by the direct computation.
- The complex `F² →d F²` with `d=[[1,1],[0,1]]`: D₁=C₁, E₀=C₀ give det 1; choosing D₁ the
  first coordinate alone would not make the projected map an isomorphism onto a
  one-dimensional E₀ with the second coordinate missing, so the decomposition condition (ii)
  is not vacuous.
- The sign: the two-term complex `F² →id F²` with the standard basis in degree 1 and the
  swapped basis order in degree 0 has basis change A₁=1 and A₀ the transposition, so
  `det A₀=−1` and the formula gives `τ·det(A₀)^((−1)^0)=1·(−1)=−1`, the permutation sign;
  the direct computation agrees, since the differential in the new bases is the transposition
  with determinant −1 and two-term torsion (−1)⁻¹=−1. The one-dimensional complex `F →a F`
  admits no basis swap in degree 0, so it cannot witness the sign.

### 4.3 Total quotient rings and their field decomposition

Use Mathlib `Localization (nonZeroDivisors A)` for total quotients. For a finitely generated
abelian H prove that the total quotient rings of ℤ[H] and Nov(ℤ,H,N) are finite products of
characteristic-zero fields (rt3 Lemma A.4, p. 240). Construct the finite-torsion/free
splitting and cyclotomic components, prove reducedness and the componentwise
field/localization statements; show the answer is independent of that splitting (rt3
Appendix A, p. 240: the fields are the minimal ideals of the total quotient ring). Prove the
group-ring inclusion sends nonzerodivisors to nonzerodivisors and induces an injective
total-quotient map compatible with the field components (rt3 §1.6, p. 214, the map ι). In the
torsion-free case recover native fraction fields and the leading-term domain proof of §1.4.
The general deck group is not replaced by its free quotient. *Needs:* §1.4; Mathlib
`Localization`, `nonZeroDivisors`, `IsFractionRing`.

**Checks.**

- H=ℤ/2, N=0: ℤ[ℤ/2] has total quotient ring ℚ×ℚ through g↦1 and g↦−1; the zero divisor
  1−g maps to (0,2), and 1+g to (2,0).
- H=ℤ/3: ℚ×ℚ(ζ₃), two fields of different degrees; H=ℤ: the fraction field ℚ(t) of a domain,
  one component.
- H=ℤ⊕ℤ/2 with N(n,e)=−n: Q(Nov) is `ℚ((t))×ℚ((t))` and the inclusion from Q(ℤ[H]) is
  componentwise `ℚ(t)→ℚ((t))`, injective on each component; a splitting H=ℤ⊕ℤ/2 chosen with
  generator (1,1) instead of (1,0) gives the same two minimal ideals.

### 4.4 The period-order topology and cutoff continuity of torsion

Construct the period-order topology on each total-quotient field component: after a
free/torsion and period-kernel splitting, embed it into the Novikov field with coefficients in
the fraction field of the corresponding characteristic-zero kernel group algebra. Define O(C)
by order>C and prove independence of the splitting, continuity of addition, multiplication and
inversion at nonzero elements (rt3 §2, p. 220: an element is O(R) when each field projection
is). The total quotient has the product topology over its finitely many field components;
completeness of Nov alone is not a completeness claim for this quotient. Prove rt3 Lemma 2.8's
cutoff continuity of based torsion when the acyclic component set is fixed (rt3 Lemma 2.8,
p. 221): a nonzero limiting minor remains nonzero, and high-order changes in its inverse
remain high order. *Needs:* §§4.1–4.3.

**Checks.**

- H=ℤ, N(k)=k: the component field is ℚ((t)) with order the t-adic valuation; O(C) is the
  t-adic ball, and inversion is continuous at 1−t with `(1−t+t^R)⁻¹−(1−t)⁻¹=O(t^R)`.
- A minor m_t=m+O(e^(Rh)) with m≠0 has inverse `m⁻¹+O(e^(Rh))`; for m=0 no such statement is
  made, which is why the acyclic component set is fixed in the continuity lemma.
- With two components, convergence means convergence in each; a sequence converging in one
  component and constant in the other converges in the product topology.

### 4.5 Norm and trace for finite cyclic quotients

For a cyclic quotient μ:H→ℤ/k with kernel K, prove Nov(ℤ,H,N) is finite free of rank k over
Nov(ℤ,K,N|K), with coset-monomial basis (rt3 §3, p. 227). Define Norm and Tr as the
determinant and trace of multiplication, prove basis independence, multiplicativity of Norm,
`Tr=k·coefficient restriction`, and over ℚ prove `log Norm(1+x)=Tr log(1+x)` in the positive
ideal (rt3 Lemma 3.5 (a) and (b), p. 227). If μ kills the torsion subgroup of H (rt3
assumption (3.8), p. 227), extend Norm to the total quotients, identify corresponding field
components and prove a nonzero component stays nonzero under Norm (rt3 Lemma 3.5 (c), p. 227).
Under this same hypothesis prove cellular and Novikov torsion transform by Norm, retaining
zero on nonacyclic components and pullback Euler structures (rt3 Proposition 3.6 (b),
p. 228). The ring-level Norm and the zeta formula of §5.4 do not require this additional
hypothesis; the torsion comparison does. *Needs:* §§1.1, 1.3, 4.3.

**Checks.**

- H=ℤ, K=2ℤ, μ the reduction mod 2: basis {1,t} over ℤ((t²)); multiplication by 1−t has
  matrix `[[1,−t²],[−1,1]]`, so `Norm(1−t)=1−t²=(1−t)(1+t)` and `Tr(1−t)=2`, which is k=2
  times the restriction of 1−t to even exponents, namely 1.
- `log Norm(1+ct)=log(1−c²t²)=−c²t²−c⁴t⁴/2−…` equals `Tr log(1+ct)` computed as 2 times the
  even part of `ct−c²t²/2+c³t³/3−c⁴t⁴/4+…`.
- H=ℤ⊕ℤ/2 with μ(n,e)=n mod 2: μ kills the torsion (0,1), so (3.8) holds; with
  μ′(n,e)=e, it does not, and no torsion comparison is claimed along μ′ although Norm is still
  defined on the ring.
- With h=(2,1), the divisibility of its image in H/T=ℤ is d=2; the functional λ(n,e)=n is 1 on
  the primitive class (1,0), so `μ_k=2⁻¹λ mod k` for k odd sends h to 1 and `ν_k=λ mod 2k`
  sends h to 2, and `nh∈ker ν_k` iff k divides n, as §6.3 requires.

### 4.6 Torsion of based complexes over Nov and the ambiguity quotient

For a based finite free complex over ℤ[H] or Nov(ℤ,H,N), define torsion componentwise,
setting a component to 0 exactly when that component complex is nonacyclic (rt3 Appendix A,
p. 240). Retain partial acyclicity; a single global zero convention would lose information.
Define the ambiguity action by signs and deck monomials on the **whole** total quotient ring,
including 0, and pass to its orbit quotient `Q(Nov)/±e^H` (rt3 Definition 1.5, p. 214).
Prove torsion's formulas under ordered orientation/lift changes, regular cellular subdivision
and triangulation changes, using GeometricTopology's smooth triangulation/PL comparison and
explicit subdivision mapping cones. Cellular torsion is a simple-homotopy invariant with the
stated based structure, not an invariant of arbitrary unbased homotopy equivalence. *Needs:*
§§4.1–4.3; GeometricTopology Layer 11; AlgebraicTopology Stage 4.

**Checks.**

- The algebraic two-term complex over H=ℤ/2, N=0, with differential 1−g from degree 1 to
  degree 0: its two rational components have differentials 0 and 2, so its torsion components
  are 0 and 1/2; a global zero convention would record only 0.
- The orbit of 0 under signs and monomials is {0}; the orbit of (1−t)⁻¹ contains −t³(1−t)⁻¹.
- The circle with one 0-cell and one 1-cell and the circle with two 0-cells and two 1-cells
  (`d e₁=v₂−v₁`, `d e₂=t v₁−v₂`) both have cellular torsion (1−t)⁻¹ modulo sign, the second
  from the determinant `1−t` of `[[−1,t],[1,−1]]`.
- Replacing the degree-1 generator p̃ by t p̃ in the two-term complex `d p̃=(1−t) q̃` gives
  the conjugated differential t(1−t) and torsion `t⁻¹(1−t)⁻¹`, the original torsion times
  `det(A₁)^((−1)¹)=t⁻¹` (rt3 Proposition A.5), which is a deck monomial and so the same class.

### Examples

The two-term field complexes; the ℤ/2 partial-acyclicity example; the two cellular models of
the circle; the Norm computation for the double cover of the circle.

### Dependencies

§§1.1–1.4; Mathlib `ChainComplex`, `Basis`, `LinearMap.det`, `Matrix.det`, `Localization`;
GeometricTopology Layer 11; AlgebraicTopology Stage 4. Independent of Layers 2–3.

## Layer 5: periodic return orbits and the dynamical zeta function (N5)

### 5.1 Local return germs

The following local return construction is stated for every finite-dimensional Hausdorff
second-countable boundaryless smooth manifold Y, independently of the standing
closed-manifold hypotheses. Let V be a C^k vector field on Y, k≥1, nonzero along a compact
periodic orbit. Choose transverse local sections D_p,D_q through orbit points p,q. Consume
DifferentialGeometry's local flows and the transverse implicit function theorem to construct
the C^k scalar hitting-time branch τ:D_p→ℝ near the fixed travel time from p to q. On
sufficiently small open section neighbourhoods, the induced transition h(z)=Φ_(τ(z))(z) is a
C^k local diffeomorphism, with inverse from the reverse hitting branch. For the primitive
return germs prove P_q=h∘P_p∘h⁻¹, and the corresponding identity for each positive iterate.
Thus DP_q=Dh DP_p (Dh)⁻¹; equivalently these are the derivative-flow return maps on
T_pY/ℝV(p) and T_qY/ℝV(q) (rt3 §1.1, p. 210: the linearized return map on T_qX/T_q(γ) does
not depend on the section, and its eigenvalues do not depend on q). Spectrum and the
eigenvalue-1 test are independent of section and basepoint. Only local flows around this
compact orbit are required; sections are open germs, and an invariant transverse disk is not
assumed. This is the germ of HeegaardFloer F0.6 applied to −α♯. *Needs:* HeegaardFloer §2.8
(F0.6); DifferentialGeometry Layer 3; Mathlib `Flow`.

**Checks.**

- The flow ∂_θ−r∂_r on S¹×ℝ with the attracting orbit r=0: the return map on the section
  θ=0 is r↦e^(−2π)r, with derivative e^(−2π)∈(0,1); the section θ=θ₀ gives the same
  derivative, conjugate by the flow.
- The constant flow ∂_θ on S¹ (transverse dimension 0): the hitting time is the constant 2π
  and the return map is the identity of a point, with no eigenvalues.
- The irrational linear flow on T²: it has no periodic orbit, so the construction has nothing
  to apply to; the rational linear flow has a circle of periodic orbits, each with return
  derivative 1, which the eigenvalue-1 test rejects.

### 5.2 Orbits, multiplicities and the local fixed-point index

Define a primitive periodic orbit of −α♯ up to rotation, with its least real return time, and
define the k-fold iterate separately. The integer multiplicity p(γ) is its covering degree over
the primitive orbit; it is not the return time (rt3 §1.1, p. 210). Apply §5.1 to −α♯ for its
transverse return germs. An isolated return fixed point has local index defined by perturbing
the return map on an isolating transverse chart neighbourhood to have nondegenerate fixed
points and summing `sgn det(1−dg)` over them; a generic relative homotopy's one-dimensional
zero cobordism proves independence of the perturbation. In transverse dimension zero the
isolated point has index 1; in dimension one the same signed sum applies, with no
positive-dimensional boundary sphere assumed; in dimensions at least two compare with
DifferentialGeometry Layer 10's degree on the boundary sphere of `x↦x−return(x)`. Build
independence of chart and isolating neighbourhood, additivity, restriction and homotopy
invariance while the boundary remains fixed-point free. At a nondegenerate point prove the
index is `ε=sgn det(1−dreturn)` (rt3 §1.1, p. 210: the Lefschetz sign), including transverse
dimension 0. These are the local-index suppliers for §6.2's closed-orbit degeneration
argument.

Extend the index to continuous maps with compact isolated fixed set by a C⁰-small smooth
approximation that stays fixed-point-free on the isolating boundary. Prove independence by
relative approximation of a boundary-avoiding homotopy; compare this extension with the smooth
index. Construct its homological graph/diagonal intersection description using
AlgebraicTopology's relative homology, excision and orientation local system; normalize the two
local orientation factors by their canonical square pairing, so the integer needs no
orientation of the ambient manifold. Prove agreement with the approximation definition and the
partial-domain commutativity formula: for open subsets `U⊆Y₁`, `V⊆Y₂` of smooth manifolds and
continuous maps `f:U→Y₂`, `g:V→Y₁`, the composites g∘f and f∘g have domains `f⁻¹(V)⊆U` and
`g⁻¹(U)⊆V`; when their fixed sets are compact and isolated, `i(g∘f)=i(f∘g)`, f identifying the
fixed sets with inverse g, with no assumption that either composite preserves its isolating
neighbourhood. Derive invariance under conjugation by a homeomorphism of isolating
neighbourhoods, including the piecewise smooth homeomorphisms of a smooth triangulation; this
is the interface for §6.8. *Needs:* §5.1; DifferentialGeometry Layer 10; AlgebraicTopology
Stages 2, 3 and 6; HeegaardFloer F0.

**Checks.**

- An attracting orbit on a surface with transverse derivative λ∈(0,1): `det(1−λ^k)>0` for
  every k, so ε(γ^k)=+1 for all iterates; a repelling orbit with λ>1 has ε(γ^k)=−1 for all k.
- An orientation-reversing return with λ<−1: `1−λ^k` is positive for odd k and negative for
  even k, so `ε(γ^k)=(−1)^(k+1)`; this is the formula of §5.4 with i_−=1 and i_+=0.
- Transverse dimension 1, the degenerate return map g(x)=x+x³ at 0: the perturbation
  x+x³−εx has fixed points 0 (sign of 1−g′=ε: +1) and ±√ε (sign of −2ε: −1 each), total −1;
  the perturbation x+x³+εx has the single fixed point 0 with sign −1; both give index −1.
- Transverse dimension 0 (a flow on a circle): the index of the unique fixed point of the
  return map of a point is 1, and the multiplicity of the k-fold iterate is k while its return
  time is k times the primitive period, two different integers in general.

### 5.3 Admissible pairs and their genericity

An admissible pair (α,g) is a Morse–Smale pair all of whose closed orbits of −α♯, iterates
included, are nondegenerate (rt3 Definition 1.1, p. 211). Define ε(γ)=sgn det(1−dreturn_γ).
Establish generic admissible pairs in each fixed cohomology class by local return-map
perturbations and the countable intersection over bounded-period/iterate windows (rt3 §1.1,
p. 211, the transversality remark after Definition 1.1; HeegaardFloer F0.6). Iterate formulas
apply to nondegenerate return maps; no universal degenerate-iterate formula is assumed.
*Needs:* §§2.1, 5.1–5.2; HeegaardFloer F0 and §2.8.

**Checks.**

- The angular form on S¹ with the standard metric: the flow is a rotation, with one primitive
  orbit in transverse dimension 0, nondegenerate, so the pair is admissible with no critical
  points.
- The exact two-critical-point circle: the flow has no closed orbits, so admissibility
  reduces to the Morse–Smale condition, which holds.
- The rational linear flow on T² for the form dx with the flat metric: a circle of periodic
  orbits with return derivative 1, so the pair is not admissible; the form dx+√2dy with the
  same flat metric has the irrational linear flow, with no periodic orbits, and is admissible
  vacuously, but it lies in a different cohomology class. Within the class of dx itself a
  generic metric makes the pair admissible (rt3 §1.1, p. 211, the genericity remark after
  Definition 1.1) while the flat metric does not, so admissibility depends on the metric and
  not only on the class.

### 5.4 Finiteness, the zeta function, integrality and norms

Prove only finitely many closed orbits up to rotation, with iterates included, have N([γ])
below any prescribed positive threshold (rt3 §1.3, p. 212). Rule out accumulation on a
degenerate orbit and on a broken cycle through critical points; the latter needs an
equal- or higher-index segment, excluded by §2.3. Include all iterates and prove multiplicity
support estimates. Construct the rational log series `Σγ ε(γ)/p(γ) · e^[γ]` in the positive
period ideal and its exponential ζ (rt3 equation (1.1), p. 212; rt2 Definition 1.3, p. 371).
This uses the completion over ℚ of §1.3, not an assumed tensor-product commutation with the
completion over ℤ. Prove ζ has integral coefficients by the convergent product over primitive
orbits

`ζ=Πγ (1−(−1)^i_−(γ)e^[γ])^(−ε(γ)(−1)^i_−(γ))`,

where i_− counts real return eigenvalues below −1, i_+ those above 1, and i_0 those in
(−1,1), with algebraic multiplicity (rt3 equation (1.2), p. 212). Prove
`ε(γ^k)=(−1)^i_+ · (−1)^((k+1)i_−)`, so the exponent is `−(−1)^(i_++i_−)=(−1)^(dim X−i_0)`.
It specializes to −(−1)^i_0, the exponent printed in rt2 equation (2), p. 371, only in odd
dimension; the Klein-bottle Check below is an even-dimensional case where that exponent
fails. Prove these identities from real/complex conjugate eigenvalue blocks, then log/product
equality and integrality. Show ζ is a unit with constant term 1. Prove naturality for valid
period-support exponent maps and the finite cyclic cover norm formulas needed for Layer 6,
retaining the individual lift/iterate multiplicities. For 0→K→H→[μ]ℤ/k→0, prove
`ζ(X̂)=Norm(ζ(X))` with no torsion-annihilation hypothesis (rt3 Proposition 3.6 (a), p. 228);
use `Tr=k·restriction` on each orbit term, including shorter primitive lifts. *Needs:*
§§1.3, 2.3, 4.5, 5.2–5.3.

**Checks.**

- The angular form on S¹: one primitive orbit of class t with ε=+1 and p(γ^k)=k, so
  `log ζ=Σ_(k≥1) t^k/k` and `ζ=(1−t)⁻¹` (rt3 Example 1.7, p. 215); the product formula with
  i_−=i_0=0 in dimension 1 gives exponent −1 and the same factor.
- The mapping torus of an orientation-reversing circle diffeomorphism f(θ)=−θ+ε sin θ (the
  Klein bottle): two primitive orbits of class t, with transverse derivatives −1+ε∈(−1,0)
  (i_−=0, i_0=1) and −1−ε<−1 (i_−=1, i_0=0). The sign formula gives ε(γ₀^k)=+1 for all k and
  ε(γ_π^k)=(−1)^(k+1), so `log ζ=Σ t^k/k+Σ (−1)^(k+1)t^k/k` and `ζ=(1+t)/(1−t)`. The product
  formula with exponent (−1)^(2−i_0) gives `(1−t)^(−1)(1+t)^(+1)`, the same; the exponent
  −(−1)^i_0 would give `(1−t)^(+1)` for γ₀ and fail.
- Period doubling: a single primitive orbit with ε≡+1 contributes `(1−x)⁻¹`, and
  `(1+x)/(1−x²)=1/(1−x)` is the identity between its odd-iterate and even-iterate parts.
- The double cover of the circle along μ:ℤ→ℤ/2: the lifted flow has one primitive orbit of
  class t̂=t², so ζ(X̂)=(1−t²)⁻¹, which is `Norm((1−t)⁻¹)` by the Norm computation of §4.5.

### Examples

The circle rotation; the Klein-bottle mapping torus; the double cover of the circle.

### Dependencies

§§1.3, 2.1–2.3, 4.5; HeegaardFloer F0 and §2.8; DifferentialGeometry Layers 3 and 10;
AlgebraicTopology Stages 2, 3 and 6.

## Layer 6: dynamical torsion, bifurcations and geometric calculations (N6)

### 6.1 The invariant I, invariance and the topological identification

For χ(X)=0 and an admissible pair set `I(α,g,π)=τ(CN)·ζ ∈ Q(Nov(ℤ,H,N))/(±e^H)` (rt3
Definition 1.5, p. 214). Prove that it depends only on [α] and the specified cover (rt3
Theorem A, p. 214), and prove `I=ι(τ(Ccell(X̃)))`, with ι the §4.3 total-quotient map (rt3
Theorem B, p. 215; rt2 Theorem 1.7, p. 373, for real multiples of integral classes). Include
arbitrary real cohomology classes and all finitely generated abelian deck groups, not just
integral classes or the torsion-free acyclic case. The proof route is Theorem A first by the
bifurcation analysis of §§6.2–6.4, then Theorem B by the exact triangulation-adapted case and
§3.4's large-gradient comparison (§6.5). *Needs:* §§3.1, 4.6, 5.4, 6.2–6.5.

**Checks.**

- The critical-free circle: τ(CN)=1 and ζ=(1−t)⁻¹; the two-critical-point circle:
  τ(CN)=(1−t)⁻¹ and ζ=1; both have I=(1−t)⁻¹, while the separate factors differ (rt3
  Example 1.7, p. 215).
- Exact α=df: ζ=1 and I=τ(CN), the classical statement that Morse torsion equals cellular
  torsion (rt3 Example 1.8, p. 215).
- S² with any form: χ≠0, and no statement is made; a version without the χ=0 hypothesis would
  have to compare torsions of complexes whose Euler characteristics force nonacyclicity in a
  way the ambiguity quotient does not absorb.

### 6.2 Generic families and the bifurcation events

Construct a generic fixed-cohomology one-parameter family with prescribed admissible
endpoints, at every period cutoff: transverse critical-point slides, ordinary trajectory
tangency/cancellation, isolated critical birth/death and closed-orbit degenerations, with the
semi-isolation and good-parameter conditions of rt3 §2 (rt3 Definition 2.6, p. 220). Consume
HeegaardFloer §1.5 (M.5)'s ordinary local A₂ fold, relative partial-jet transversality and
signed elementary chain change. Construct the closed-one-form specialization using local exact
potentials and exact cutoff perturbations, retaining the global cohomology class, period
cutoffs and cover/lift comparisons. Choose the metric Euclidean in the resulting Cerf chart and
pin the potential and positive metric dual with precisely that local normalization:
`α_t=d(x₁³/3 ± (t−t₀)x₁ − Σ_(j=2)^i x_j²/2 + Σ_(j>i)x_j²/2)` and
`V_t=(x₁² ± (t−t₀),−x₂,…,−x_i,x_(i+1),…,x_n)`. The two critical points have indices i and
i−1; trajectories use −V_t. For closed-orbit-only degenerations use rt3 Lemma 3.2's local
fixed-point-index invariance on transverse return discs (rt3 Lemma 3.2, p. 223); a full
classification of periodic-orbit bifurcations is not an assumed supplier. Prove the
bifurcation analysis: opposite trajectory cancellations; closed-orbit local-index conservation;
handle slides between distinct critical points; same-critical-point deck slides; and critical
birth/death with multiply broken return trajectories. Compare the based complex matrices,
determinant/minor factors and zeta factors at each event. *Needs:* §§2.3, 3.2, 5.2–5.4;
HeegaardFloer §1.5 (M.5) and F0.

**Checks.**

- The normal form with the sign +: for t<t₀ the critical points are x₁=±√(t₀−t), with
  Hessian entry 2x₁ in the first direction, so the point with x₁>0 has index i−1 and the point
  with x₁<0 has index i; at t=t₀ they coalesce and for t>t₀ there are none.
- The single trajectory of −V_t between the two points runs along the x₁-axis from the index-i
  point to the index-(i−1) point, so the elementary chain change at the death is the signed
  cancellation of a pair with coefficient ±1.
- A closed-orbit degeneration at which an orbit of class h becomes degenerate: the Novikov
  complex is unchanged and ζ is unchanged, because the total local index on the transverse
  disc is conserved (rt3 Lemma 3.2); the perturbation Checks of §5.2 show the total index −1
  before and after a cubic degeneration.

### 6.3 Self-slides: the all-order chain identity and the zeta ratio

For self-slides, prove the all-order identity using the finite cyclic cover/norm argument of
§4.5. If h is the slide class, let d be the divisibility of its nonzero image in H/T, where T
is the torsion subgroup. Use two explicitly distinguished cover families: for k coprime to d,
`μ_k:H→ℤ/k` kills T and sends h to 1, for the chain stabilization; for every k≥2,
`ν_k:H→ℤ/(dk)` kills T and sends h to d, for norm elimination. In the latter `nh∈ker ν_k` iff
k divides n. Construct both from an integral functional equal to 1 on the primitive class
h̄/d, reducing modulo dk for ν_k and multiplying by d⁻¹ modulo k for μ_k. Both quotients are
surjective.

For a slide at p of index i, construct `x=1+Σ_(n≥1)a_n e^(nh)` with `a₁=±1` the geometric sign
of the h-class self-slide trajectory from p to p (rt3 Lemma 3.7, p. 229): extend §2.1's
determinant-line orientation to the parameterized trajectory space, with the parameter axis
oriented by increasing t. This gives the signed zero-dimensional family crossing. Prove
`d₊=A_p(x)⁻¹d₋A_p(x)`, where A_p(x) multiplies the chosen p-generator by x and fixes the other
generators. Prove this all-order chain identity using the μ_k covers, with cutoff `R_k=N(kh)`
and only events of drop strictly less than R_k. Let k tend to infinity through values coprime
to d, so these cutoffs exhaust all finite drops and no class kh self-slide is used in the
elementary-matrix step. For each such cutoff choose a semi-isolated parameter window with
admissible endpoints, then perturb its pullback family non-equivariantly relative to those
endpoints. Apply the generic-family theorem on the compact finite cover and prove the
perturbation is small enough that below that cutoff only the lifted slides occur. Their
conjugator is a product of elementary slide matrices. Recover its equivariance modulo the
cutoff by comparing rows and columns with the endpoint differentials, which are restrictions
of Nov(H)-linear maps: the relevant one-variable series are nonzerodivisors on Nov(ℤ,H,N), as
proved cosetwise over ℤh. The equivariant conjugator has twisted circulant form, with shift
`S^k=e^(kh)` over the kernel Novikov ring. In the non-split case prove x is determined modulo
each cutoff (accounting for the fixed order shifts of the nonzero baseline row/column); hence
every coefficient a_(n,k) stabilizes as k tends to infinity through coprime values. Include the
case where both the outgoing boundary of p and every incoming p-coefficient vanish: p splits
off as a homology summand in every field component, and the chain identity is independent of
higher coefficients of x; choose them arbitrarily while retaining the geometric a₁. Event
invariance there is the identity 0=0.

Define `y=ζ₊/ζ₋` and prove it lies in `1+Σ_(n≥1)ℤ e^(nh)` by showing that only orbit classes
nh are created or destroyed (rt3 Lemma 3.8 (a), p. 230). Write its coefficients b_n.
Construct the compactified return-map graph and prove its leading-coefficient identity
`b₁=(−1)^(i+1)a₁` with the fixed orientation convention (rt3 Lemma 3.8 (b), p. 230), then
eliminate every higher coefficient by the ν_k covers and §4.5's nonvanishing norm lemma when
τ₋ has a nonzero field component, obtaining `y=x^((−1)^(i+1))` by injectivity of the
one-variable slide series in that component. Explicitly, for `z=x^((−1)^i)y`, prove the
e^(kh) coefficient of `log Norm_(ν_k)(z)` vanishes. Perturb the ν_k pullback family relative
to endpoints below a sufficiently large cutoff. Lifted slides with k not dividing the
lift-index difference are distinct-point slides, which preserve I; a first self-slide in class
kh has no linear term by the already proved chain and geometric leading-coefficient
identities. Thus the cover changes I by `1+O(e^(2kh))`, without assuming full event invariance
in that cover. Cancel in a nonzero cover component using §4.5's norm lemma and prove the
injectivity of one-variable series in e^(kh) in that component. Use
`log Norm_(ν_k)(z)=dk·Σ_(k∣n)(log z)_n e^(nh)`: its e^(kh) coefficient is dk·(log z)_k,
hence (log z)_k=0 over ℚ. Taking k=n kills every coefficient n≥2. The geometric
leading-coefficient identity kills n=1. If all components are nonacyclic, use preservation of
acyclicity under chain conjugation to prove I₊=I₋=0 without cancelling zero torsion. Thus the
event theorem is I₊=I₋ in the whole total-quotient orbit space. Agreement of only the linear
coefficient is insufficient. Birth/death requires the explicit entry/exit/gluing analysis and
the geometric-series algebra of its return chains. *Needs:* §§1.3, 4.2, 4.5, 5.4, 6.2.

**Checks.**

- H=ℤ⊕ℤ/2, h=(2,1): d=2 (§4.5's Check), μ_k and ν_k as computed there; for H=ℤ and h=3, d=3,
  μ_k for k coprime to 3 is `n↦3⁻¹n mod k` and ν_k is `n↦n mod 3k`.
- First order: `x=1+a₁e^h+…` gives `x^(±1)=1±a₁e^h+…`, so `y=x^((−1)^(i+1))` has
  `b₁=(−1)^(i+1)a₁`, consistent with the geometric identity; the opposite sign convention
  `b₁=(−1)^i a₁` would force y=x^((−1)^i).
- H=ℤ, d=1, k=2, z=1+ct: `Norm_(ν_2)(z)=(1+ct)(1−ct)=1−c²t²`, whose logarithm
  `−c²t²−c⁴t⁴/2−…` equals `2·Σ_(2∣n)(log z)_n t^n` with `(log z)_2=−c²/2` and
  `(log z)_4=−c⁴/4`; the e^(2h) coefficient vanishes iff c=0, so a nonvanishing linear term is
  detected by the k=2 norm, as the elimination uses.
- The conjugation `d₊=A_p(x)⁻¹d₋A_p(x)` changes the based torsion by
  `det(A_p(x))^((−1)^i)=x^((−1)^i)` (§4.2), so `τ₊ζ₊=τ₋ζ₋` is equivalent to
  `y=x^((−1)^(i+1))`.

### 6.4 Cutoff limits and the event-free convergence

A generic compact parameter interval can contain infinitely many events: prove
finiteness/isolation at each fixed period cutoff, compatibility of successive cutoffs and
convergence in §4.4's componentwise total-quotient topology, with fixed critical lifts or a
fixed Euler-structure representative throughout (rt3 Lemma 2.7, p. 220, and Lemma 2.8,
p. 221). Before applying §4.4's torsion continuity, construct the cutoff limits of
continuation maps and their homotopies to give chain homotopy equivalences from each
one-sided event-limit complex to a neighbouring regular complex. This proves the acyclic
component set is preserved, including at the limits. A finite event list is not assumed
globally. *Needs:* §§3.2, 4.4, 6.2–6.3.

**Checks.**

- A good time t₀ in the sense of rt3 Definition 2.6 has well-defined one-sided limits of ζ and
  of the complex; a time that is a limit of bifurcations of bounded length is not good, and no
  limit is claimed there.
- Below a cutoff R the events in a compact parameter interval are finitely many; the events
  of drop ≥R may accumulate, which is why the limits are taken cutoff by cutoff.
- For the circle family interpolating between the critical-free and the two-critical-point
  forms there is one birth event and I is constant across it, equal to (1−t)⁻¹ on both sides.

### 6.5 The topological identification

Prove topological equality first in the exact triangulation-adapted case (rt3 Example 1.8,
p. 215), then apply §3.4's large-gradient comparison and §§6.2–6.4's invariance to α+C df.
Positive rescaling preserves §1.1's completion. Keep the torsion of the comparison map
visible; an arbitrary quasi-isomorphism cannot substitute for the based calculation. *Needs:*
§§3.3–3.4, 4.6, 6.1–6.4.

**Checks.**

- Exact triangulation-adapted case on S¹ with the two-cell model: the Morse complex and the
  cellular complex are the same based complex `ℤ[t,t⁻¹] →(1−t) ℤ[t,t⁻¹]` with the Euler
  structure's basis, torsion (1−t)⁻¹.
- The comparison chain map between CN and the completed cellular complex has its own based
  torsion, which is a sign times a monomial exactly when the bases correspond under an Euler
  structure; a quasi-isomorphism rescaling a generator by 2 would change torsion by 2^(±1).
- α and 2α give the same completion, the same cover, the same complex and the same ζ.

### 6.6 The circle calculations

Include these explicit calculations as theorems (rt3 Example 1.7, p. 215):

- S¹ with nonzero period, no critical points: CN=0, τNov=1, ζ=(1−t)⁻¹, and τcell=(1−t)⁻¹.
- A nonzero-period circle form perturbed to one maximum and one minimum: for adjacent chosen
  lifts, `d p̃=±(1−t)q̃`; for arbitrary lifts include the corresponding monomial unit factor.
  CN is acyclic, τNov=(1−t)⁻¹ and ζ=1. The critical-free and two-critical-point flows have the
  same I, while their separate torsions differ.
- Exact α=df on S¹ with the universal cyclic cover: N=0, coefficients ℤ[t,t⁻¹], d=±(1−t),
  H₀=ℤ with trivial deck action and H₁=0. Both nonzero-period examples differ from ordinary
  H_*(S¹) tensored with the coefficient ring.

*Needs:* §§3.1, 3.3, 4.6, 5.4, 6.1.

**Checks.**

- In the first calculation 1−t is a unit of Nov (N(t)>0), so τcell=(1−t)⁻¹ is a unit and the
  completed cellular complex is acyclic; in the third calculation N=0, 1−t is not a unit of
  ℤ[t,t⁻¹], and the complex is not acyclic over the group ring.
- The second calculation with lift t^k q̃ instead of q̃: `d p̃=±(1−t)t^(−k) q̃`, torsion
  `±t^k(1−t)⁻¹`, the same class modulo ±e^H.
- Reversing the orientation of the descending manifold of p flips the sign of d and leaves the
  class of the torsion unchanged.

### 6.7 Mapping tori and the Lefschetz fixed-point formula

For the mapping torus of a diffeomorphism φ of a closed connected fibre S, with the downward
return-map monodromy φ and the corresponding deck t, build its equivariant cone `1−tφ#`, prove
Lefschetz signed fixed-point counts for all iterates and the trace/determinant identity
`ζ=Πi det(1−tφ*|H_i(S;ℚ))^((−1)^(i+1))` (rt3 Example 1.9, equation (1.6) and the determinant
formula, p. 215). Reconcile the homology determinant with chain torsion and prove an
equivariant version for a larger abelian cover under its actual support hypotheses (rt3
Example 1.9, p. 216, the equivariant Lefschetz theorem).

The Lefschetz fixed-point formula is constructed here, by simplicial approximation on a smooth
triangulation and Hopf's barycentric modification, the Hopf trace lemma and §5.2's continuous local
fixed-point index, valid also for nonorientable S (the simplicial approximation theorem and the
Lefschetz fixed-point theorem for finite simplicial complexes: Hatcher, Algebraic Topology, §2.C,
Theorems 2C.1 and 2C.3, pp. 177 and 179; the Hopf trace formula
`Σ_q (−1)^q tr(f_q)=Σ_q (−1)^q tr(f_*|H_q)`: the chain-level trace formula in the proof of Theorem
2C.3, p. 181; the local-index form `Σ ind=L(f)` for compact Euclidean neighbourhood retracts: Dold,
Lectures on Algebraic Topology, Chapter VII, §6, the Lefschetz–Hopf theorem, cited by locator; rt3
Example 1.9, p. 215, names the Lefschetz theorem for the iterates as the content of its
mapping-torus formula (1.6) and does not prove it). For a smooth self-map f of a closed manifold M
of dimension n all of whose fixed points are nondegenerate, `fixedPointDet` is `det(1−df_x)` read
in the chart at x (intrinsic at a fixed point, where the charts at x and f(x) coincide),
`fixedPointSign` is its sign, `rationalHomologyMap` is the induced map on rational singular
homology of the pair (M,∅), and `lefschetz_fixed_point_formula` states that the sum of the signs
over the fixed points equals `Σ_(i=0)^n (−1)^i tr(f_*|H_i(M;ℚ))`. The route: choose a finite smooth
triangulation K and construct its local PL charts from subdivision stars and the link-sphere
property of GeometricTopology Layer 11's smooth triangulation comparison. Choose a simplicial
approximation `a:sd^r K→K` of f and its homotopic Hopf modification ψ. Define the finite chain
endomorphism `T_q=a_#,q∘Sd^r_q:C_q(K;ℚ)→C_q(K;ℚ)`. Prove ψ has isolated fixed points and, for each
q-simplex σ, its total interior fixed-point index is `(−1)^q (T_q)_(σ,σ)`. Compute the unit local
contribution as `(−1)^q ε`, where ε is the oriented local degree (expansion along the simplex and
transverse contraction). Include the reflected 1-simplex: ε=−1 gives index +1. Thus prove
`Σ index(ψ)=Σ_q (−1)^q tr(T_q)` before applying the Hopf trace lemma (Hatcher, §2.C, p. 181). Use
§5.2's chart-independent continuous index to compute ψ in its PL charts; compare with the smooth
index through C⁰-small approximation preserving every isolating boundary. Prove global homotopy
invariance of the total fixed-point index on compact S for continuous homotopies, by approximating
them and their ends smoothly and applying the generic smooth homotopy's fixed-point one-manifold in
S×[0,1]: its end signs `sgn det(1−df)` cancel without an orientation of S. Thus the PL ψ and smooth
f have the same total. Compare graph/diagonal intersection using AlgebraicTopology Stage 6's
orientation local system in the oriented specialization. *Needs:* §§5.2, 6.8; GeometricTopology
Layer 11; AlgebraicTopology Stages 4 and 6; Tau Ceti `TopPair.singularHomologyMap`; Mathlib
`mfderiv`, `LinearMap.det`, `LinearMap.trace`, `Function.fixedPoints`.

API of the Lefschetz statement:

- `fixedPointDet` at a fixed point x is the determinant of `1−df_x` on T_xM and does not
  depend on the chart; `fixedPointSign` is 1 when it is positive and −1 otherwise, so under
  the nondegeneracy hypothesis it is `sgn det(1−df_x)`.
- `rationalHomologyMap` is functorial: the identity induces the identity and a composite
  induces the composite, by the functoriality of `TopPair.singularHomologyMap`.
- `lefschetz_fixed_point_formula`: for compact Hausdorff boundaryless M, smooth f and all
  fixed points nondegenerate, the signed count of fixed points equals the alternating sum of
  the rational homology traces in degrees 0 to dim M; the fixed set is finite under these
  hypotheses, so the sum is a finite sum.

**Checks.**

- The identity of a point: one fixed point with `det(1−0)=1` on the zero space, sign +1; the
  right side is the trace of the identity on H₀=ℚ, namely 1.
- The reflection z↦z̄ of S¹: fixed points ±1 with df=−1, so `det(1−(−1))=2` and sign +1 at
  each, left side 2; on homology the trace on H₀ is 1 and on H₁ is −1, right side 1−(−1)=2.
- z↦z² on S¹: the only fixed point is 1 with df=2, `det(1−2)=−1`, sign −1; right side 1−2=−1.
  A rotation by a nonzero angle has no fixed points and trace 1 on both H₀ and H₁, both sides 0.
- A rotation of S² about an axis by an angle θ∉{0,π} descends to RP² with exactly one fixed
  point, where `det(1−R_θ)=2−2cos θ>0`; the rational homology of RP² is ℚ in degree 0 only,
  so both sides are 1, on a nonorientable manifold.
- The Klein bottle as the mapping torus of the orientation-reversing circle map of §5.4:
  `det(1−t·1|H₀)^(−1)·det(1−t·(−1)|H₁)^(+1)=(1+t)/(1−t)`, agreeing with the orbit count; for
  the identity of T² the formula gives `(1−t)^(−1)(1−t)^2(1−t)^(−1)=1`, and all Lefschetz
  numbers of the identity of T² vanish.
- The reflected 1-simplex in the Hopf modification: ε=−1 and q=1 give local index
  `(−1)^1·(−1)=+1`; a definition without the (−1)^q factor would give −1 and fail the Hopf
  trace identity on the circle.

### 6.8 The finite-triangulation chain adapter

For each finite simplicial complex K and commutative coefficient ring R, construct the native
`ChainComplex (ModuleCat R) ℕ` free on the q-simplices, with basis orientations fixed by a vertex
order and orientation reversal acting by −1, with the alternating face differential, basis
equations, scalar extension and its extension by zero to `ChainComplex (ModuleCat R) ℤ`. Consume
GeometricTopology Layer 11's chosen simplex-cell CW structure on |K|, ordered characteristic maps
and signed simplicial/cellular boundary identification. Prove this chain adapter agrees with that
structure and AlgebraicTopology Stage 4's cellular complex and chain maps, and compose with Stage
4's cellular/singular comparison to obtain the homology isomorphism. Prove independence of vertex
ordering via the orientation-change chain isomorphism, and functoriality for simplicial maps f,
consuming Layer 11's cellularity of |f| for these simplex-cell structures and identifying Stage 4's
cellular chain map with f_#, with degree zero on degenerate images and the orientation sign
otherwise; Stage 4's naturality on homology then identifies f_# with |f|_*, without claiming a
strict cellular-to-singular chain map. Construct the canonical affine homeomorphism
`b_r:|sd^r K|≃ₜ|K|`, mapping each subdivision vertex to its barycentre, and use it to identify the
realizations when choosing the approximation a of §6.7 (a simplicial approximation exists on a
sufficiently fine barycentric subdivision: Hatcher, §2.C, Theorem 2C.1, p. 177). Construct
simplicial subdivision, the last-vertex chain inverse `λ_r#` and both composite-to-identity
homotopies, with the finite acyclic-carrier homotopy lemma proved by augmented simplex cone
contractions. Define `λ_r:sd^r K→K` by composing one-step last-vertex maps with fixed vertex orders
at every subdivision level, and prove it is a simplicial approximation of b_r: their images lie in
a common original simplex, so straight-line interpolation within that simplex gives `|λ_r|≃b_r`.
Under the homology comparisons λ_r induces `(b_r)_*`, and the chain inverse identities force Sd^r
to induce `(b_r)_*⁻¹`. Since `|a|≃f∘b_r`, T induces f_* on H_*(S;ℚ), which identifies the
alternating homology trace with the Lefschetz number of f. *Needs:* GeometricTopology Layer 11;
AlgebraicTopology Stages 3–4; Mathlib `ChainComplex (ModuleCat R) ℕ`.

**Checks.**

- The boundary of a triangle (3 vertices, 3 edges): the simplicial complex has H₀=R and H₁=R;
  reversing the vertex order of one edge multiplies its basis element by −1 and leaves the
  homology isomorphic.
- A simplicial map collapsing an edge to a vertex sends that edge's basis element to 0 (degree
  zero on degenerate images), and a map reversing an edge sends its basis element to minus the
  image edge.
- One barycentric subdivision of a 1-simplex: `Sd(e)=e₁+e₂` and the last-vertex map sends
  e₁↦0 (degenerate) and e₂↦e (or the reverse, by the vertex order), so `λ_#∘Sd=id` on chains
  and `Sd∘λ_#` is chain homotopic to the identity by the cone contraction.

### 6.9 Zero-slope surgery

For zero-slope surgery X_K on an oriented knot in S³, using GeometricTopology Layer 4's
meridian/Seifert longitude and Conway-normalized Δ_K and Layer 5's surgery: construct H₁(X_K)=ℤ and
the corresponding infinite cyclic cover. Build the knot-complement cellular/Fox or Seifert-matrix
Alexander module, prove the polynomial/module presentation comparison, and attach the filling chain
complex. Prove `τcell(X̃_K)=Δ_K(t)/(1−t)^2 mod ±t^ℤ` (rt1 Example 1.9, p. 863: for zero-surgery on
a knot the topological torsion of the infinite cyclic cover is the Alexander polynomial divided by
(1−t)², up to ±t^k, by its Lemma 2.6; rt3 §1.5, p. 214, records the relation with the Alexander
polynomial without the formula). Thus the total dynamical invariant for every admissible
integral-period form representing the generator has this value in the correctly directed
completion. Verify the unknot and the right-handed trefoil, including t↦t⁻¹ and lift changes.
*Needs:* §§4.6, 6.1; GeometricTopology Layers 4–5; AlgebraicTopology Stages 4–5.

**Checks.**

- The unknot: X_K=S¹×S² with cover ℝ×S²; the cellular complex is the tensor product of
  `ℤ[t,t⁻¹] →(1−t) ℤ[t,t⁻¹]` with the cellular complex of S² (cells in degrees 0 and 2), two
  two-term acyclic pieces in degrees (1,0) and (3,2), each of torsion (1−t)⁻¹; the total
  (1−t)⁻² equals Δ/(1−t)² with Δ=1.
- The right-handed trefoil: Δ=t−1+t⁻¹ (Conway-normalized, symmetric), so
  τ=(t−1+t⁻¹)/(1−t)²; under t↦t⁻¹ the numerator is unchanged and (1−t⁻¹)²=t⁻²(1−t)², a
  change by a monomial, so the class is symmetric, as the orientation reversal of the cover
  requires.
- A lift change of one cell multiplies τ by a monomial (§4.6), which the ambiguity quotient
  absorbs; a Seifert-matrix presentation with a different Seifert surface gives the same
  Conway-normalized Δ, so the same class.

### Examples

The three circle calculations; the Klein bottle and T³ mapping tori; the unknot and trefoil
zero surgeries.

### Dependencies

Layers 1–5; HeegaardFloer §1.5 (M.5) and F0; GeometricTopology Layers 4, 5 and 11;
AlgebraicTopology Stages 3–6; Tau Ceti singular homology; Mathlib `mfderiv`, `LinearMap.det`,
`LinearMap.trace`.

## Layer 7: Euler structures and coherent lift normalization (N7)

### 7.1 Euler chains and the vector-field Poincaré–Hopf theorem

For χ(X)=0 define Euler chains using a nondegenerate vector field's signed zero 0-cycle:
their boundary is that cycle, and two are equivalent modulo boundaries (rt3 Appendix B,
p. 241; Turaev 1990). Construct nonemptiness from Euler=χ and H₀, the H₁(X;ℤ)-torsor action,
and the canonical comparison between different fields via the transverse zero locus of a
parameter family (rt3 Definition B.1, p. 241). Prove independence, identity and cocycle laws;
no preferred zero of this torsor is assumed. Build the combinatorial Euler-chain model from
oriented lifted cells, its subdivision transport and comparison with the smooth model (rt3
Definitions B.3–B.4, pp. 241–242). The construction includes dimension 1 and nonorientable X.
The local index sgn det(dV_p) is independent of local orientation because domain and target
orientations change together; its signed zero-cycle is an ordinary integral 0-cycle and Euler
chains are ordinary integral 1-chains. Use the positive dual field V=α♯, whose Morse-zero sign
is (−1)^ind(p), matching the alternating cell weights. Construct the vector-field
Poincaré–Hopf theorem here: compare zero cycles through a transverse parameter cobordism with
a Morse gradient, then use MorseTheory M4 and AlgebraicTopology Stage 7 to prove
Σind(V,p)=χ(X), on nonorientable X as well. Compare the result, for the gradient of a Morse
function, with HeegaardFloer §1.9 (M.9)'s Morse Euler/index identity. *Needs:* §§2.1, 5.2;
MorseTheory M4; AlgebraicTopology Stages 2 and 7; DifferentialGeometry Layers 2–3; DGFloer
Layer 1 item 1; HeegaardFloer §1.9 (M.9); Mathlib `mfderiv`, `TangentBundle`, `LinearMap.det`,
`Module.finrank`; Tau Ceti `TopPair.singularHomology`.

API of the Poincaré–Hopf statement:

- `zeroDet` at a point p of a smooth vector field v is the determinant of the derivative of
  the section x↦(x,v(x)) of the tangent bundle at p, read in the tangent-bundle chart at
  (p,v(p)) and projected to the fibre; at a zero p this is the determinant of the
  linearisation dV_p on T_pM and does not depend on the chart, because at a zero the
  linearisation transforms by conjugation under a change of chart. `zeroSign` is 1 when it is
  positive and −1 otherwise, so at a nondegenerate zero it is the local index sgn det(dV_p).
- `rationalBetti` is the dimension over ℚ of the rational singular homology of the pair (M,∅)
  in each degree, so its alternating sum over degrees 0 to dim M is χ(M) (AlgebraicTopology
  Stage 7).
- `poincare_hopf`: for compact Hausdorff boundaryless M, orientable or not, and a smooth
  vector field v, as a smooth section of the tangent bundle, all of whose zeros are
  nondegenerate, the sum of the local indices over the zeros equals the alternating sum of the
  rational Betti numbers in degrees 0 to dim M; the zero set is finite under these hypotheses,
  so the sum is a finite sum. No hypothesis χ(M)=0 enters.

**Checks.**

- S¹ with the nonsingular field ∂_θ: the zero cycle is empty, Euler chains are integral
  1-cycles, and the torsor is H₁(S¹;ℤ)=ℤ.
- S²: χ=2, the zero cycle of any field has degree 2, and no 1-chain has it as boundary, so
  there are no Euler chains; the χ=0 hypothesis is necessary.
- The gradient of a height function on T² with four critical points: indices +1, −1, −1, +1
  sum to 0=χ(T²); on RP² a Morse function with three critical points gives +1−1+1=1=χ(RP²),
  with no orientation used.
- At a local maximum of f (index n) the positive gradient V=∇f points inward and dV_p is
  negative definite, so `sgn det(dV_p)=(−1)^n`; at a minimum it is +1; a convention using the
  negative gradient would give (−1)^(n−ind) instead and fail to match the cell weights.
- S² with the gradient of a height function: two zeros, the minimum and the maximum, of index
  +1 each by the previous Check, total 2=χ(S²); the Poincaré–Hopf count holds although there
  are no Euler chains, so the theorem carries no χ=0 hypothesis.
- A finite set of points, a compact manifold of dimension 0: the only vector field is zero,
  every point is a zero whose linearisation is the empty matrix with determinant 1, so every
  zero is nondegenerate of index +1 and the count is the number of points, which is b₀; on a
  manifold of positive dimension the zero field has linearisation 0 at every point, no zero is
  nondegenerate, and the theorem makes no claim about it.

### 7.2 Euler-structure normalization and the refined torsions

Construct the Euler-structure normalization on the alternating determinant line, using
coherent critical/cell lifts when critical points/cells are present (rt3 Definitions B.3 and
B.4, pp. 241–242). The normalization is a determinant **volume**, not only a literal ordered
basis of an empty chain module. In the zero-critical-point case CN=0 has determinant line
canonically Nov; a nonsingular field supplies its Euler structure ξ₀, the volume at ξ₀ is 1,
and the volume at ξ₀+h is e^(image h) (rt3 Definition B.3, p. 241, and Example 1.9, p. 215:
T_m(ξ₀)=1). This preserves the nontrivial Euler-structure information even for the zero
complex. Pin the action convention `τ(ξ+h)=e^(image h)τ(ξ)` and prove its comparison with
Euler-chain/lift changes. Define refined τNov, τcell and I as H₁-equivariant maps from the
Euler-structure torsor to Q(Nov)/±1 with this action (rt3 Definition 1.5, p. 214, the refined
I:E(X)→Q(Λ)/±1). Prove the refined equality (rt3 equation (1.5), p. 215) and continuation,
birth/death and triangulation compatibility. A nonsingular positive dual field supplies its
particular Euler structure, even though trajectory counts use its negative flow; this choice
normalizes the mapping-torus calculation. Sign removal by a homology orientation for dynamical
torsion is a separate comparison that is not built here; the definite theorem retains ±1 (rt3
Remark 1.6, p. 214). *Needs:* §§4.6, 6.1, 6.7, 7.1; DGFloer Layer 1 item 1.

**Checks.**

- The critical-free circle: ξ₀ from ∂_θ, τNov(ξ₀)=1, I(ξ₀)=(1−t)⁻¹ and τcell(ξ₀)=(1−t)⁻¹;
  at ξ₀+h, with h the negative angular generator of H₁(S¹;ℤ), whose image in H is the deck
  generator with N>0 and whose monomial is t (Conventions; the first Check of §2.2), all three
  are multiplied by t, with the sign ambiguity alone remaining; at ξ₀+1, the change by the
  positive angular generator, they are multiplied by t⁻¹, which a reading of t as the positive
  angular generator would get wrong.
- The two-critical-point circle with the lift of p moved by t: the torsion changes by t⁻¹
  (§4.6's Check), and the Euler chain changes by the lifted path class; the action convention
  assigns the same monomial to the Euler-structure change, so the refined τNov is well defined
  on the torsor.
- The zero complex on a manifold with χ=0 and two different nonsingular fields differing by an
  Euler-structure change h: the volumes differ by e^(image h), nontrivial information that a
  definition through ordered bases of the empty module would lose.

### Examples

The circle with its three forms; the mapping torus of §6.7 with the Euler structure of the
suspension field.

### Dependencies

§§2.1, 4.6, 5.2, 6.1, 6.7; MorseTheory M4; AlgebraicTopology Stages 2 and 7;
DifferentialGeometry Layers 2–3; DGFloer Layer 1 item 1; Turaev 1990 for the Euler-structure
definitions; Mathlib `mfderiv`, `TangentBundle`, `LinearMap.det`, `Module.finrank`; Tau Ceti
singular homology.

## Downstream consumers

- DGFloer consumes Layer 1 (the generic period-controlled completion, support condition,
  convolution and geometric-series inverse) and Layer 4 (based torsion over total quotient
  rings) for its Floer–Novikov torsion.
- TaubesGromov consumes Layers 1 and 4–6: the completion for H=H₁(Y;ℤ) with a noninjective
  period map, and §6.7's mapping-torus trace/local-index theorem for its orbit expansions.
- HamiltonianFloerOperations consumes Layer 1's completion and continuous coefficient maps.
- AlgebraicTopologyPartII consumes §6.7's Lefschetz fixed-point formula for self-maps of
  closed connected smooth manifolds, including nonorientable ones, in its fixed-point-free
  involution argument.

## References

* M. Hutchings and Y.-J. Lee, [Circle-valued Morse theory and Reidemeister torsion](https://math.berkeley.edu/~hutching/pub/rt2/rt2_published.pdf), Geometry & Topology 3 (1999), 369–396 (rt2): completed chains, orbit signs, product formula, topological torsion and Euler structures.
* M. Hutchings, [Reidemeister torsion in generalized Morse theory](https://math.berkeley.edu/~hutching/pub/rt3/rt3.pdf), Forum Mathematicum 14 (2002), 209–244 (rt3): arbitrary closed forms and abelian covers, cutoff bifurcations, finite cyclic covers and the refined comparison.
* M. Hutchings and Y.-J. Lee, [Circle-valued Morse theory, Reidemeister torsion, and Seiberg–Witten invariants](https://math.berkeley.edu/~hutching/pub/rt1/rt1_published.pdf), Topology 38 (1999), 861–888 (rt1): original circle-valued calculations and context. Gauge-invariant comparisons belong to their gauge-theory supplier and are not assumed here.
* V. Turaev, Introduction to Combinatorial Torsions, Birkhäuser 2001; Euler structures, nonsingular vector fields, and Reidemeister-type torsions, Math. USSR-Izvestiya 34 (1990), 627–662: based torsion and the lift refinement.
* A. Pajitnov, Circle-valued Morse Theory, de Gruyter 2006: the completed cellular comparison.
* A. Hatcher, [Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), Cambridge University Press 2002 (author's copy): simplicial approximation, the Lefschetz fixed-point theorem and the Hopf trace formula (§2.C).
* A. Dold, Lectures on Algebraic Topology, Springer 1972 (Classics in Mathematics 1995): the fixed-point index on Euclidean neighbourhood retracts and the Lefschetz–Hopf theorem (Chapter VII, §6).
* J. Milnor, [Whitehead torsion](https://www.ams.org/journals/bull/1966-72-03/S0002-9904-1966-11484-2/S0002-9904-1966-11484-2.pdf), Bull. AMS 72 (1966), 358–426: based elementary chain operations and the torsion of a based acyclic complex (§3).
* M. Hutchings, [family-Floer transversality correction](https://floerhomology.wordpress.com/2011/06/30/erratum-family1/): generic function/metric paths or generic horizontal connections, not arbitrary fixed function homotopies with metric variations alone.
