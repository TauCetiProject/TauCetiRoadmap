# Roadmap: Morse–Novikov homology and dynamical Reidemeister torsion

**Summary.** Build the Morse theory of closed real one-forms, from the completed group-ring
algebra to geometric trajectory complexes and their topological comparison.
Count periodic return orbits with their multiplicities and Lefschetz signs,
and prove that Novikov torsion multiplied by the dynamical zeta function equals
cellular Reidemeister torsion. The resulting library includes nonintegral period
classes, noninjective period homomorphisms, torsion in abelian deck groups,
continuation, Euler structures, and explicit circle, mapping-torus and knot-surgery
calculations.

## Scope and ownership

This roadmap develops the existing Morse–Novikov library: arbitrary abelian
period-controlled completions, closed-one-form trajectory complexes, based torsion,
periodic-orbit zeta functions, dynamical/cellular torsion equality and Euler refinement.
It owns the local fixed-point index, the Lefschetz formula and vector-field
Poincaré–Hopf theorem used in those comparisons. The algebra admits all commutative
coefficient rings; geometric torsion uses integral coefficients and characteristic-zero
field components. The period map may have a kernel or dense image.

MorseTheory M1–M4 and M6 own ordinary critical-point theory and compact-band Morse
topology. HeegaardFloer Lane M owns ordinary Morse moduli and continuation; §2.8
(F0.6) owns generic return germs, section transitions and derivative conjugacy.
Layer 5 applies those germs to −α♯ and develops their index and zeta invariants.
DifferentialGeometry Layers 0–3, 5–6, 8, 10 and 12 own forms, flows, integration,
period comparison, degree and metrics. AlgebraicTopology Stages 1–7 and
GeometricTopology Layers 1, 3–5 and 11 own the topological and smooth suppliers
specified below. Their generic constructions are consumed, not rebuilt.

The pinned libraries supply group algebras, localization, singular homology,
manifold derivatives, Morse indices and local flow APIs. The pinned Tau Ceti already
has, and this roadmap consumes as the supplier contracts below specify: the
period-controlled completion with its topology, functoriality, Laurent and Hahn
comparisons, domain theorem, exponential, logarithm and Euler products (Layer 1);
completed orbit modules and their supported kernel maps (§1.5 and the linear algebra
of §3.1); Morse closed one-forms and the periods of closed one-forms (§§2.1–2.2); the
equivariant cellular chains of a covering and the degree-one Hurewicz isomorphism
(§§2.2 and 3.3); based torsion over a field with its basis-change, exact-sequence,
mapping-cone, square-minor, homology-basis, componentwise and minor-chart continuity
laws (§§4.1, 4.3 and 4.5); nonzerodivisors, reducedness and Artinian total quotients of
the completion, and finite-index coset bases, traces and the logarithmic norm identity
(§§4.2 and 4.4); closed orbits with multiplicities, the iterate-sign formula and the
algebraic orbit zeta function with its integral Euler product (§§5.2–5.3); and
nondegenerate fixed points with their finiteness (§6.5). The closed-one-form cutoff
moduli, the Novikov complex of a closed one-form and its comparisons, the field
decomposition and topology of the total quotients, the cover norms of torsion, the
flow zeta function, the local fixed-point index, the dynamical/cellular equality and
the Euler torsor are constructions of this roadmap. No Floer complex, nonabelian
torsion, analytic Ray–Singer torsion or gauge invariant is an input.

Existing work includes [Dongryul Kim's Novikov-series development](https://github.com/dongryul-kim/lean4-novikov),
with its coefficient/support carrier in Novikov/Series/Basic.lean (revision
d5e705bd46bca9cb1622a260425388500d7697c2, coefficient and support definitions).
It treats real additive-submonoid exponents and, in several variables,
finiteness for every positive weight vector. N1 instead permits an arbitrary
abelian exponent group with a specified, possibly noninjective period map.
For injective N, construct the coefficient-preserving comparison with the
one-variable carrier on the image of N, including convolution and the period
topology. For noninjective N, retain the finite ties in each period fiber and
compare through the supplied kernel splitting below. This general construction
and its comparison are independent of the descent theorem in that project.
Coordinate with its authors before code integration and follow the repository's
licensing and reuse requirements for any copying or adaptation.

## Conventions

The geometric setting is a finite-dimensional real smooth Hausdorff second-countable
closed connected manifold X. The Novikov complex does not require X to be oriented.
The torsion comparison assumes χ(X)=0; retain the zero convention when a field
component is not acyclic. Smooth one-forms use
[DifferentialGeometry 0–1](../DifferentialGeometry/README.md)'s common smooth-form
carrier and exterior derivative, with its pullback and de Rham comparisons.
A closed one-form α is Morse if its local potentials have nondegenerate critical
points. This predicate includes neither Morse–Smale transversality nor periodic-orbit
nondegeneracy. Use the metric dual V=α♯, and count trajectories of **−V**.

Choose a connected regular abelian covering π:X̃→X on which π*α is exact, with
specified deck-group identification H. Periods factor as
`π₁(X)→H₁(X;ℤ)→H→ℝ`; denote the final homomorphism by P. Write H additively,
monomials as e^h, and use **N=−P** in the Novikov completion. A primitive f̃ satisfies
`f̃(h·x)=f̃(x)+P(h)`. Thus e^h shifts critical values by P(h), and completed chains
are finite above each potential threshold. A downward closed orbit γ has
`N([γ])=−∫γ α>0`. Neither injectivity nor discreteness of N is assumed.
For S¹ use ℝ/ℤ, identified with `Circle` by t↦exp(2πit), and pull back
DG's `circleAngularForm/(2π)` to obtain the angular form with integral 1. The Laurent variable t is the
monomial of the generator of H≅ℤ with **N(h)>0**, not a silently chosen positive
angular deck generator. In the exact N=0 circle example, separately fix
t as the positive angular deck generator; no N(t)>0 condition applies.

The algebraic coefficient ring R is any commutative ring. Torsion over ℤ and
rational characteristic-zero field components is its own layer; do not assume a
Novikov ring over an arbitrary ring is a field. Every geometric deck group H is
finitely generated, proved using a finite CW model of X. N1's completion algebra
also treats arbitrary abelian groups, without claiming a finite field decomposition
in that generality.

Lean targets use small types, a real finite-dimensional model E, a boundaryless
model with corners I, and rational singular homology. The Lefschetz and
Poincaré–Hopf statements also allow disconnected and empty compact manifolds;
the connectedness convention above belongs to the covering/torsion development.
The determinant of the endomorphism of the zero-dimensional vector space is 1.

## Exact supplier contracts

### From Mathlib

Consume `AddMonoidAlgebra` and `Finsupp` for finite coefficients,
`HahnSeries` (RingTheory/HahnSeries/Basic.lean) and `LaurentSeries`
(RingTheory/LaurentSeries.lean) for ordered series. Hahn support is partially
well-ordered; this does not imply finiteness below each real threshold.
Use `Localization (nonZeroDivisors R)` for total quotients, and
`ChainComplex (ModuleCat R) ℤ` with native homology and homotopies.
Use `IsAddQuotientCoveringMap` (Topology/Covering/Quotient.lean) for orbit fibers
and disjoint translates; it does not include connectedness or nonemptiness.
Use `mfderiv`, `fderiv`, `extChartAt`, `TangentSpace`, `TangentBundle` and
`VectorField.mpullback` for the two headline statements. The pullback uses an
inverse derivative and is zero when that derivative is not invertible; Layer 7
uses it only on the open target of a boundaryless chart.
Use `AlgebraicTopology.singularHomologyFunctor`
(AlgebraicTopology/SingularHomology/Basic.lean) and `LinearMap.trace`
(LinearAlgebra/Trace.lean). Trace is defined to be zero without a finite basis;
the closed-manifold theorem must prove finite-dimensionality and vanishing above
the manifold dimension from the finite triangulation comparison.

### From Tau Ceti

Consume `IsManifoldNondegenerateCriticalPoint` and `manifoldMorseIndex`
(Geometry/Manifold/Morse/Basic.lean and Index.lean), `MorseChart`
(Geometry/Manifold/Morse/Lemma.lean), and `MorseChart.field`
(Geometry/Manifold/Morse/PseudoGradient/Existence.lean), with quadratic potential
normalized by 1/2. Consume `Riemannian.Tensor.rieszDual` and
`Riemannian.Tensor.inner_rieszDual`
(Geometry/Manifold/VectorBundle/Riemannian/Riesz.lean), with their finite-dimensional
fiber hypotheses, and `exists_contMDiffAt_localFlow`
(Geometry/Manifold/IntegralCurve/SmoothFlow.lean), with its boundaryless and
finite-dimensional hypotheses. Global completeness in the compact application
is a consequence to establish using the maximal-flow supplier.
The vector-space `stableSet_eq_biUnion_orbit_localInvariantSet_Ici`
(Analysis/Calculus/Morse/LocalToGlobal.lean) retains its Lipschitz and convergence
hypotheses. The Banach-domain `isMeagre_image_criticalPoints_of_isFredholm`
(Analysis/Fredholm/SardSmale.lean) retains its separability and stated regularity
bound; HeegaardFloer F0 supplies the manifold/parameter adapters.

Consume the period-controlled completion of RingTheory/NovikovSeries for an additive
group H and a period homomorphism `N : H →+ ℝ`, neither injective nor discrete:
the carrier `TauCeti.NovikovSeries R H N` (Basic.lean) with its convolution ring and
algebra structures and the group-ring embedding `TauCeti.NovikovSeries.ofAddMonoidAlgebra`
(Multiplication.lean); the period filtration `TauCeti.NovikovSeries.periodFiltration`,
its separated complete topology and the abstract completion
`TauCeti.NovikovSeries.completionPkg` of the group ring (Topology.lean); the
topological-ring structure, the nonnegative subring `TauCeti.NovikovSeries.nonnegSubring`,
its positive ideal `TauCeti.NovikovSeries.posIdeal` and the geometric inverses
`TauCeti.NovikovSeries.unitsOneSub` (TopologicalRing.lean); the pushforward
`TauCeti.NovikovSeries.map` and the finite-kernel restriction `TauCeti.NovikovSeries.comap`
(Map.lean) with `TauCeti.NovikovSeries.mapRingHom`, `TauCeti.NovikovSeries.mapAlgHom`,
`TauCeti.NovikovSeries.mapNonnegSubring` and `TauCeti.NovikovSeries.map_mem_periodFiltration`,
for exponent maps rescaling periods by a constant c>0 (Functoriality.lean); the
rescaling and reversal equivalences `TauCeti.NovikovSeries.domCongr` and
`TauCeti.NovikovSeries.continuousDomCongr` (Equiv.lean); `TauCeti.NovikovSeries.expMulEquiv`
over a commutative ℚ-algebra (ExpLog.lean); `TauCeti.NovikovSeries.multipliable_of_finite_cutoffs`
and `TauCeti.NovikovSeries.eulerProduct` (InfiniteProduct.lean);
`TauCeti.NovikovSeries.toLaurentSeries`, a ring isomorphism for every R, with its
topological form `TauCeti.NovikovSeries.toLaurentSeriesUniformEquiv` over a field
(LaurentSeries.lean); `TauCeti.NovikovSeries.PeriodKernelSplitting`,
`TauCeti.NovikovSeries.toHahnSeries` and `TauCeti.NovikovSeries.hahnSeriesEquiv`
(HahnSeries.lean); `TauCeti.NovikovSeries.leadingTerm` and
`TauCeti.NovikovSeries.isDomain_of_fg` (LeadingTerm.lean); for a finite-index subgroup,
`TauCeti.NovikovSeries.cosetBasis`, `TauCeti.NovikovSeries.finrank_eq_index` and
`TauCeti.NovikovSeries.trace_eq_index_smul_comap` (FiniteIndex.lean) and
`TauCeti.NovikovSeries.log_normNonnegSubring` (Norm.lean); for finitely generated H,
`TauCeti.NovikovSeries.ofAddMonoidAlgebra_mem_nonZeroDivisors` and
`TauCeti.NovikovSeries.map_ofAddMonoidAlgebra_injective` over coefficients without zero
divisors (NonZeroDivisors.lean), `TauCeti.NovikovSeries.isReduced_iff` (Reduced.lean),
and `TauCeti.NovikovSeries.isArtinianRing_of_isFractionRing` and
`TauCeti.NovikovSeries.charZero_quotient_of_isFractionRing` over a domain
(TotalQuotient.lean); and `TauCeti.NovikovSeries.orbitLog`, `TauCeti.NovikovSeries.orbitZeta`,
`TauCeti.NovikovSeries.isUnit_orbitZeta`, `TauCeti.NovikovSeries.orbitZeta_sub_one_mem_periodFiltration`,
`TauCeti.NovikovSeries.orbitZeta_eq_eulerProduct`
and `TauCeti.NovikovSeries.orbitZeta_eq_mapRingHom_eulerProduct` (OrbitZeta.lean), whose
hypotheses are positive orbit periods tending to infinity along the cofinite filter
and, for the product formula, iterate signs forming a geometric sequence of ratio ±1.
Consume the matrix cutoff estimates of RingTheory/NovikovSeries/Matrix.lean, including
`Matrix.continuous_mulVec_extension_iff`.

Consume the completed orbit modules of RingTheory/NovikovModule: `TauCeti.NovikovModule R F`
for a potential F (Basic.lean), finite above every potential threshold, with the lift
coordinates `TauCeti.NovikovModule.coordinatesLinearEquiv` and the change-of-lift formula
`TauCeti.NovikovModule.coordinates_apply_eq_mul_single` when the generators form finitely
many H-torsors with `F(h+ᵥp)=F(p)−N(h)`; the potential-cutoff topology
`TauCeti.NovikovModule.potentialFiltration` (Topology.lean); and the maps
`TauCeti.NovikovModule.kernelMap` of kernels with a potential bound, their composites
`TauCeti.NovikovModule.kernelComp` with `TauCeti.NovikovModule.kernelMap_kernelMap`, and the
Nov-linear map `TauCeti.NovikovModule.novikovKernelMap` of a deck-invariant kernel
(KernelMap.lean).

Consume the based torsion of Algebra/Homology/ReidemeisterTorsion, for ℤ-graded
complexes of finite-dimensional vector spaces over a field with ordered chain bases:
`HomologicalComplex.reidemeisterTorsion` (Basic.lean), 0 off bounded acyclic complexes and
normalized by `HomologicalComplex.reidemeisterTorsion_eq_det_zpow` so that a differential
a from degree 1 to degree 0 has torsion a⁻¹;
`HomologicalComplex.reidemeisterTorsionWithHomology` (Homology.lean);
`HomologicalComplex.reidemeisterTorsion_homotopyCofiber` and
`HomologicalComplex.reidemeisterTorsion_eq_mul_of_quasiIso` (MappingCone.lean);
`HomologicalComplex.torsionMinor` and
`HomologicalComplex.reidemeisterTorsion_eq_finprod_det_torsionMinor` (SquareMinor.lean);
`HomologicalComplex.componentwiseReidemeisterTorsion` in a reduced Artinian ring
(Componentwise.lean); and `HomologicalComplex.tendsto_reidemeisterTorsion_of_det_torsionMinor_ne_zero`
on a fixed nonvanishing minor chart over a topological field (Topology.lean).

Consume `Flow.ClosedOrbit`, `Flow.ClosedOrbit.iterate` and `Flow.ClosedOrbit.multiplicity`
(Dynamics/Flow/ClosedOrbit.lean); `LinearMap.sign_det_one_sub_pow`
(LinearAlgebra/Matrix/Charpoly/DetSign.lean); `TauCeti.IsMorseOneForm`,
`TauCeti.IsPrimitiveOn.criticalHessian_eq`, `TauCeti.IsPrimitiveOn.manifoldMorseIndex_eq`
and `TauCeti.IsMorseOneForm.finite_zeroSet` (Geometry/Manifold/Morse/OneForm.lean);
`TauCeti.periodHom` and `TauCeti.mpullback_mem_exactForms_one_iff_periodHom_map_eq_zero`
(Geometry/Manifold/DeRham/Period.lean), the latter for a smooth map out of a connected
manifold; `TauCeti.IsNondegenerateFixedPt` and
`TauCeti.finite_fixedPoints_of_isNondegenerateFixedPt`
(Geometry/Manifold/MFDeriv/FixedPoint.lean), for a finite-dimensional model over a
complete field and a compact Hausdorff manifold; the equivariant cellular chain complex
`TauCeti.cellularChainComplexRep` (AlgebraicTopology/Cellular/Covering.lean) of the
lifted CW structure `TauCeti.cwComplexPreimage` (Topology/CWComplex/Classical/Covering.lean)
along a quotient covering map by a group acting freely, free over the group ring on
chosen lifts by `TauCeti.cellularChainRepIsoFree`, with the cellular differential
`TauCeti.cellularDifferential` (AlgebraicTopology/Cellular/Chains.lean) and the
cellular/singular comparison `TauCeti.cellularSingularHomologyIso`
(AlgebraicTopology/Cellular/Comparison.lean); and the degree-one Hurewicz isomorphism
`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` of a path-connected space
(AlgebraicTopology/Homotopy/Hurewicz/One/Basic.lean), natural by
`TauCeti.HurewiczOne.homologyMap_hurewiczHomologyAddEquiv`
(AlgebraicTopology/Homotopy/Hurewicz/One/Naturality.lean). The cellular chains are
indexed by a multiplicative group: the additive deck group H enters through
`Multiplicative H` and Mathlib's `IsAddQuotientCoveringMap.toMultiplicative`.

### From TauCetiRoadmap.MorseTheory

Consume M1–M4 and M6: critical Hessians, indices and charts, finite compact-band
handles and CW models, inequalities and gradient convergence. Apply them to local
potentials; the closed-one-form period control is Layer 2's additional assertion.

### From TauCetiRoadmap.HeegaardFloer

Consume Lane M §§1.1–1.5: stable/unstable manifolds, the λ-lemma, broken ordinary
trajectories, coherent orientations, ordinary Morse/singular comparison and
continuation. Consume §1.5 (M.5) for the relative A₂ fold and signed elementary
chain change. Consume Lane F0 for Banach-manifold Fredholm/transversality and
§2.8 (F0.6) for C^k local return germs, k≥1, including reverse branches,
section conjugacy, all positive iterates and the normal-derivative comparison.
The latter uses a compact periodic orbit, not a complete flow or compact ambient
manifold. Layer 5's fixed-cohomology perturbations must preserve closedness.

### From TauCetiRoadmap.DifferentialGeometry

Consume Layers 0–1 for forms, exterior derivative, pullbacks and local primitives;
Layers 2–3 for orientations and maximal flows; Layers 5–6 and 8 for integration,
de Rham cohomology and the period comparison; Layer 10 for degree and relative
homotopies; Layer 12 for metrics and musical maps. Normalize `circleAngularForm`
by dividing by 2π under the map ℝ/ℤ→Circle, t↦exp(2πit).

### From TauCetiRoadmap.AlgebraicTopology and UniversalCovers

Consume AlgebraicTopology Stages 1–3 for fundamental groups, relative singular
chains, subdivision and excision; Stage 4 items 2–3 (AT4.2–AT4.3) for cellular
chains and the cellular/singular comparison, natural on homology; Stages 5–7
for covers, local systems, products, orientation coefficients and Euler
characteristic; Stage 8 item 3 (AT8.3) for the natural degree-one Hurewicz
isomorphism H₁=π₁ᵃᵇ, which is the native `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`
with its naturality. Consume UniversalCovers Stage 2 item 8 for
normal-subgroup/deck-quotient classification.
No strict cellular-to-singular chain map is assumed.

### From TauCetiRoadmap.GeometricTopology

Consume Layer 1 for collars and smooth gluing; Layer 3 for the C∞ family topology;
Layers 4–5 for meridian/Seifert longitude, Conway-normalized Alexander polynomial
and zero-slope surgery; Layer 11 and the smoothing-and-triangulation comparison
for smooth triangulations, simplex-cell structures, signed boundaries and
cellularity of simplicial maps. Layer 6 below constructs the equivariant
knot/surgery chain comparison and the finite simplicial chain adapter.

## How to read the build

Layers 1–7 retain the names N1–N7. Layer 1 fixes the coefficient algebra on the
pinned Novikov-series library; it is independent of geometry. Layer 2 builds
bounded-period geometry on native Morse and flow topology and HeegaardFloer Lanes M
and F0. Layer 3 consumes Layers 1–2 and the AlgebraicTopology, GeometricTopology and
native cellular suppliers to build the Novikov complex and its comparisons. Layer 4's
torsion algebra runs independently of Layers 2–3, on the pinned based torsion, and
then applies to their based complexes. Layer 5 consumes Layers 1–2 and counts return
orbits. Layer 6 uses all five, including its own Lefschetz and knot/surgery adapters,
to prove unrefined dynamical invariance and cellular equality; Layer 7 constructs the
Euler carrier before using it to refine Layer 6. Generic ordinary Morse homology is
not proved using the dynamical torsion theorem, and the Novikov homology comparison
is not used to infer torsion invariance without its based comparison factor. The two
native headline signatures are in Suggested.lean; its docstring names the pinned
declarations that already prove the algebraic headlines and the carriers missing for
the others.

## Layer 1: Period-controlled completed group rings and modules

### 1.1 Completion coefficients and convolution

For an abelian group H, a homomorphism N:H→ℝ and a commutative ring R, Nov(R,H,N)
is `TauCeti.NovikovSeries R H N` (RingTheory/NovikovSeries/Basic.lean): coefficient
functions a:H→R satisfying
`∀ C:ℝ, {h | a(h)≠0 ∧ N(h)<C}.Finite`.
Consume its equivalence with ≤C in place of <C
(`TauCeti.NovikovSeries.forall_finite_lt_iff_forall_finite_le`), the least N-value of a
nonzero support (`TauCeti.NovikovSeries.exists_isLeast_image_support`), the finiteness of
the pairs `(u,v)` with u+v=h and a(u)b(v)≠0 (`TauCeti.NovikovSeries.finite_setOf_add_eq`)
and the uniform cutoff lemma for associativity
(`TauCeti.NovikovSeries.finite_setOf_period_add_add_lt`); the commutative-ring and
R-algebra structures of Multiplication.lean, with monomials multiplying by adding
exponents (`TauCeti.NovikovSeries.single_mul_single`) and monomials with unit
coefficient units with inverse at −h (`TauCeti.NovikovSeries.isUnit_single`); and the
group-ring embedding `TauCeti.NovikovSeries.ofAddMonoidAlgebra` by the coefficient map,
injective by `TauCeti.NovikovSeries.ofAddMonoidAlgebra_injective` and, for nontrivial R,
onto exactly when N=0 by `TauCeti.NovikovSeries.ofFinsupp_surjective_iff`. Every later
layer uses this carrier and no other model of the completion.

The integral support model is rt3 §1.2, p. 211.

Later layers use:

- Equality is coefficientwise, with zero, addition and negation evaluated in the specified R.
- Every convolution coefficient is a finite sum, and associativity uses a common finite cutoff.
- Monomials are units and the finite group-ring inclusion is injective; for nontrivial R it is onto exactly when N=0.

**Checks.**

- For H=0 there is one coefficient, so Nov(R,0,0)=R; for the zero ring every support is empty.
- For H=ℤ and N=0, the support of 1+t is allowed but Σ(k≥0)t^k is excluded: below C=1 the latter has infinitely many terms.
- For N(k)=k, Σ(k≥0)t^k has three terms below C=3; its square has coefficient 3 at t² and 0 at t⁻¹.
- For H=ℤ², N(a,b)=a, infinitely many coefficients at (1,b) fail the cutoff C=2; finite ties 1+e^(0,1) are allowed.
- Transporting the ring on ℤ by negation changes the monomial coefficient at its exponent from 1 to −1; the coefficient operations must be parameters of the construction.

*Needs:* Tau Ceti RingTheory/NovikovSeries/Basic.lean and Multiplication.lean; Mathlib `AddMonoidAlgebra`.

### 1.2 Filtration, completion and functoriality

The subgroups U_C={a | ∀h, N(h)<C→a(h)=0} are
`TauCeti.NovikovSeries.periodFiltration` (RingTheory/NovikovSeries/Topology.lean).
Consume their separated complete group topology, the density of finite truncations
(`TauCeti.NovikovSeries.denseRange_ofFinsupp`), the universal completion property of
the group ring with this filtration (`TauCeti.NovikovSeries.completionPkg`), continuity
of the ring operations and the cutoff/convolution compatibility
`TauCeti.NovikovSeries.mul_sub_mul_trunc_mem_periodFiltration` (TopologicalRing.lean).
Scalar change is coefficientwise; do not identify base change of completed rings with
a tensor product without its own proof. Positive rescaling of N gives the same ring
and topology, and −N reverses the completion and is related by h↦−h, not the
identity: both are `TauCeti.NovikovSeries.domCongr` and its homeomorphism form
`TauCeti.NovikovSeries.continuousDomCongr` (Equiv.lean). For commutative ground rings
R,S, a unital homomorphism ρ:R→S, an exponent homomorphism φ:H→H′ and c>0
satisfying N′∘φ=cN, the continuous unital ring homomorphism
P_(ρ,φ):Nov(R,H,N)→Nov(S,H′,N′) with coefficient
`P_(ρ,φ)(a)(h′)=Σ_(φ(h)=h′)ρ(a(h))`, summing over nonzero source coefficients, is
`TauCeti.NovikovSeries.mapRingHom` (Functoriality.lean), built on the additive
pushforward `TauCeti.NovikovSeries.map` (Map.lean). Consume its multiplicativity,
preservation of 1 and monomials, identity and composition laws
(`TauCeti.NovikovSeries.mapRingHom_id`, `TauCeti.NovikovSeries.mapRingHom_comp`), the
bound `P_(ρ,φ)(U_C)⊆U′_(cC)` (`TauCeti.NovikovSeries.map_mem_periodFiltration`), its
continuity (`TauCeti.NovikovSeries.continuous_mapRingHom`), its restriction
`TauCeti.NovikovSeries.mapNonnegSubring` to the nonnegative subrings, which maps positive
ideals into positive ideals (`TauCeti.NovikovSeries.mapNonnegSubring_mem_posIdeal`), and
the algebra-homomorphism form `TauCeti.NovikovSeries.mapAlgHom` for a fixed ground ring.
Finite kernel is not required for this pushforward. With finite kernel, the
restriction φ^* by coefficient precomposition and its support bound are
`TauCeti.NovikovSeries.comap`. The inclusion/restriction cases used in finite cyclic
covers are the algebra `TauCeti.NovikovSeries.instAlgebraAddSubgroup` over the
subgroup ring and the projection formula
`TauCeti.NovikovSeries.comap_subtype_algebraMap_mul`. A pushforward with a finer grading additionally
requires a target degree map commuting with φ, or an explicit degree quotient;
the period identity alone supplies the ungraded map. Do not claim an unrestricted
series pushforward for arbitrary φ or infer flatness, injectivity, or a completed
tensor-product identification from this construction.

The filtration extends the support definition of rt3 §1.2, p. 211; finite-cover restriction is rt3 §3.4, pp. 226–227.

Later layers use:

- The neighborhoods U_C give a separated complete additive topology, with continuous ring operations and dense finite sums.
- Period-compatible pushforward preserves products, monomials and composition and sends U_C into U′_(cC).
- Finite-kernel coefficient precomposition preserves support; it is not asserted to be a unital ring map.

**Checks.**

- The tail Σ(k>m)t^k vanishes below any fixed C once m≥C, and t² lies in U₂ but not U₃.
- Projection ℤ²→ℤ, (a,b)↦a, sends 1+e^(0,1) to 2 although the kernel is infinite; period fibers in an allowed support are finite.
- Precomposition along ℤ⊕ℤ/2→ℤ sends 1 to 1+g; its square is 2+2g, not 1+g, excluding ring-homomorphism language.
- N and 2N admit Σt^k; −N excludes it but admits Σt^(−k), so reversal uses h↦−h.

*Needs:* §1.1; Tau Ceti RingTheory/NovikovSeries/Topology.lean, TopologicalRing.lean, Map.lean, Functoriality.lean, Equiv.lean and FiniteIndex.lean.

### 1.3 Positive series and convergent operations

The subring of series supported on N≥0 and its strictly positive ideal of series
supported on N>0 are `TauCeti.NovikovSeries.nonnegSubring` and
`TauCeti.NovikovSeries.posIdeal` (RingTheory/NovikovSeries/TopologicalRing.lean). Consume
the geometric inverse `TauCeti.NovikovSeries.unitsOneSub` of 1−a for a in the positive
ideal, over any R; the monomial identities `TauCeti.NovikovSeries.one_sub_single_mul_tsum`
and `TauCeti.NovikovSeries.tsum_mul_one_sub_single`, which give
`(1−e^h)^−1=Σ(k≥0)e^(kh)` when N(h)>0; the exponential `TauCeti.NovikovSeries.expMulEquiv`
from the positive ideal onto the units 1+a with a in it, inverse to the logarithm, over
a commutative ℚ-algebra (ExpLog.lean); and the convergence of infinite products in which
only finitely many factors differ from 1 below each cutoff,
`TauCeti.NovikovSeries.multipliable_of_finite_cutoffs` (InfiniteProduct.lean).

Use rt3 §1.3, equations (1.1)–(1.2) and Remark 1.4, p. 212.

Later layers use:

- The nonnegative subring contains a strictly positive ideal; geometric inversion works over any R.
- Over a ℚ-algebra, exponential and logarithm are mutually inverse between the positive ideal and 1 plus that ideal.
- Infinite products converge when only finitely many factors contribute below each cutoff.

**Checks.**

- For N(t)=1, (1−t)(1+t+t²+⋯) has coefficients 1,0,0 in degrees 0,1,2.
- A constant series 1 is nonnegative but not positive: 1−1=0 has no inverse in a nonzero ring.
- Over ℚ, exp(t) starts 1+t+t²/2 and log(1+t) starts t−t²/2; in characteristic 2 division by 2 is unavailable.

*Needs:* §§1.1–1.2; Tau Ceti RingTheory/NovikovSeries/TopologicalRing.lean, ExpLog.lean and InfiniteProduct.lean.

### 1.4 Laurent, Hahn and leading-term comparisons

For H=ℤ with N(k)=k, the coefficient-preserving ring isomorphism with native
`LaurentSeries R` is `TauCeti.NovikovSeries.toLaurentSeries`
(RingTheory/NovikovSeries/LaurentSeries.lean); it restricts to the group-ring
Laurent-polynomial inclusion, and over a field it is a uniform equivalence for the
period and X-adic topologies (`TauCeti.NovikovSeries.toLaurentSeriesUniformEquiv`).
For a general H and a supplied splitting `TauCeti.NovikovSeries.PeriodKernelSplitting`
of the period kernel, the comparison with Hahn series whose coefficients lie in the
kernel group ring is the injective ring homomorphism `TauCeti.NovikovSeries.toHahnSeries`,
with image the locally finite Hahn series (`TauCeti.NovikovSeries.hahnSeriesEquiv`) and
coefficient and topology formulas
`TauCeti.NovikovSeries.mem_periodFiltration_iff_coeff_toHahnSeries` and
`TauCeti.NovikovSeries.tendsto_nhds_iff_coeff_toHahnSeries` (HahnSeries.lean). The
splitting and ordered period group are data, and this comparison is not the
definition. For finitely generated torsion-free H and a domain R, Nov is a domain by
`TauCeti.NovikovSeries.isDomain_of_fg`, through the leading coefficients
`TauCeti.NovikovSeries.leadingTerm` in the group ring, which retain finite ties in N
(LeadingTerm.lean).

The cyclic case is rt3 Example 1.3, p. 211; the leading-coefficient domain argument is in the proof of Lemma A.4, p. 240.

Later layers use:

- The cyclic comparison preserves each coefficient; over a field it also identifies the period topology with the X-adic topology.
- The split-kernel comparison retains finite group-ring coefficients in each period fiber.
- For finitely generated torsion-free H and a domain R the least-period coefficient proves the product of two nonzero series is nonzero.

**Checks.**

- The Laurent element t⁻²+3+t³ has minimum exponent −2 on both sides of the comparison.
- For N(a,b,c)=a+√2b, 1+e^(0,0,1) has two leading terms of period 0; collapsing them to one exponent loses a coefficient.
- For H=ℤ/2 and R=ℤ, (1−g)(1+g)=0 with both factors nonzero; the domain theorem must exclude torsion.

*Needs:* §§1.1–1.3; Tau Ceti RingTheory/NovikovSeries/LaurentSeries.lean, HahnSeries.lean and LeadingTerm.lean; Mathlib `LaurentSeries`, `HahnSeries` and group algebras.

### 1.5 Completed orbit modules

For a free H-set S with finitely many orbits and an equivariant potential
F(hs)=F(s)−N(h), the completed R-linear combinations of S finite above every
F-threshold are `TauCeti.NovikovModule R F` (RingTheory/NovikovModule/Basic.lean).
Consume the identification of this module with a finite free Nov-module on chosen
orbit lifts (`TauCeti.NovikovModule.coordinatesLinearEquiv`), the diagonal monomial
change-of-lift formula (`TauCeti.NovikovModule.coordinates_apply_eq_mul_single`), the
cutoff topology `TauCeti.NovikovModule.potentialFiltration` (Topology.lean), and the
uniform support estimates for differentials, continuation maps, homotopies and
compositions in the form of kernel maps: `TauCeti.NovikovModule.kernelMap` for a kernel
with a potential bound C shifts cutoffs by C, composites are
`TauCeti.NovikovModule.kernelComp` with constants adding
(`TauCeti.NovikovModule.kernelMap_kernelMap`), and a deck-invariant kernel gives the
Nov-linear map `TauCeti.NovikovModule.novikovKernelMap` (KernelMap.lean). Equivariant
group-ring matrices extend uniquely to continuous maps by
`Matrix.continuous_mulVec_extension_iff` (RingTheory/NovikovSeries/Matrix.lean).

The critical-lift model is rt3 §1.4, pp. 212–213.

Later layers use:

- Chosen orbit lifts give a finite free module over the completion.
- Changing a lift by h multiplies its basis vector by e^h.
- Equivariant finite matrices extend continuously with uniform cutoff bounds.

**Checks.**

- One orbit with lift s and F(s)=0 identifies e^h s with potential −N(h), giving the same finite-below condition as the ring.
- Replacing s by h·s multiplies its basis by e^h; the empty orbit set gives the zero module.
- Multiplication by t² sends U₃ into U₅, since 2+3=5; reversing the potential sign would give the wrong direction.

*Needs:* §§1.1–1.2; Tau Ceti RingTheory/NovikovModule/Basic.lean, Topology.lean and KernelMap.lean, and RingTheory/NovikovSeries/Matrix.lean.

### Examples

Use the irrational period N(a,b,c)=a+√2b with a nontrivial kernel, not only discrete injective periods.

### Dependencies

N1 consumes the pinned Novikov-series and Novikov-module libraries and the Mathlib algebra they rest on. It does not depend on geometry.

## Layer 2: Morse closed one-forms, covers and bounded-period moduli

### 2.1 Closed forms and critical geometry

The Morse condition is `TauCeti.IsMorseOneForm` (Geometry/Manifold/Morse/OneForm.lean),
stated on the actual cotangent fibers through local primitives. Consume local-primitive
independence of the critical Hessian and index (`TauCeti.IsPrimitiveOn.criticalHessian_eq`,
`TauCeti.IsPrimitiveOn.manifoldMorseIndex_eq`) and the isolation and finiteness of zeros
on a compact manifold (`TauCeti.IsMorseOneForm.finite_zeroSet`). Compare a nondegenerate
zero with transversality of the section α to the zero section and establish local
normal forms. Define negative dual trajectories, stable/unstable
manifolds and Morse–Smale transversality separately. Specify descending orientation
lines over critical points and their deck transport; the sign convention is
`TD(p)=TM(p,q)⊕R(negative-flow tangent)⊕TD(q)`. Compare it with Lane M's
integer boundary convention rather than counting unsigned trajectories.

Use rt3 §1.1, pp. 210–211 and §1.4, pp. 212–213 for the local potential and orientation conventions.

The API includes:

- Local primitives differing by a constant have the same Hessian and index.
- Nondegenerate zeros are isolated and hence finite on the compact manifold.
- Stable/unstable intersections and descending orientation lines use the negative metric-dual flow, separately from the Morse condition.

**Checks.**

- On ℝ, potentials x²/2 and x²/2+7 give α=x dx, Hessian 1 and index 0; −x²/2 gives index 1.
- The form x² dx has a degenerate zero since its derivative there is 0, even though the zero is isolated.
- For f=cos θ on S¹ with maximum unstable direction +∂θ, the two downward paths have signs +1 and −1, so their ordinary incidence sum is 0.

*Needs:* DifferentialGeometry Layers 0–3 and 12; MorseTheory M1 and M6; HeegaardFloer Lane M; Tau Ceti `TauCeti.IsMorseOneForm`.

### 2.2 Periods and connected abelian covers

The period homomorphism on π₁ is `TauCeti.periodHom` (Geometry/Manifold/DeRham/Period.lean):
consume its homotopy invariance, additivity under concatenation, dependence only on the
de Rham class and pullback naturality, and factor it through H₁ by the native Hurewicz
isomorphism `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` with its naturality.
Specialize the regular-cover classification to surjections π₁(X)→H, using
π₁-abelianization; π*α is exact iff periods vanish on that kernel, which is
`TauCeti.mpullback_mem_exactForms_one_iff_periodHom_map_eq_zero` for the connected
cover. Build the lifted smooth structure, metric/vector field and primitive,
with deck-equivariance and positive/negative flow comparison. For a connected
regular cover with abelian deck group H, prove that
`H₁(X̃;ℤ) → H₁(X;ℤ) → H → 0` is exact at H₁(X;ℤ) and surjective onto H,
using the subgroup of π₁(X) defining the cover and the natural abelianization
maps. The first arrow need not be injective.

The cover and exactness hypothesis are rt3 Choice 1.2, p. 211. Exactness on H₁ follows from the defining subgroup and natural abelianization; no initial zero is asserted.

The API includes:

- Loop integration factors through H₁ and through H precisely when it vanishes on the covering subgroup.
- A primitive upstairs obeys f̃(h·x)=f̃(x)+P(h), and the negative flow has positive N-drop.
- The H₁ sequence is exact at the base and surjective onto H, without an injective first arrow.

**Checks.**

- For α=dθ on ℝ/ℤ, P(1)=1 and N(1)=−1; the downward deck generator −1 has N=1.
- For an exact form P=0, the pulled-back potential is invariant under every deck transformation.
- For the universal cyclic cover of S¹, H₁(upstairs)=0 and H₁(base)→ℤ is the identity; its kernel is 0.

*Needs:* DifferentialGeometry Layers 5–6 and 8; AlgebraicTopology Stages 1 and 5 and Stage 8 item 3 (AT8.3), with the native `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` and `TauCeti.HurewiczOne.homologyMap_hurewiczHomologyAddEquiv`; Tau Ceti `TauCeti.periodHom`; UniversalCovers Stage 2 item 8.

### 2.3 The Klein-bottle cover and period kernel

Make that failure explicit on the Klein bottle
`X=([0,1]×(ℝ/ℤ))/((1,y)∼(0,−y))`. Use GT's smooth gluing and AT's
fundamental-group/abelianization APIs to construct the connected smooth cover `C=ℝ_s×(ℝ_y/2ℤ)` and its commuting
deck transformations `A(s,y)=(s+1,−y)`, `B(s,y)=(s,y+1)`. Prove B has
order2 and that these generate a free proper action of `H=ℤ⊕ℤ/2`, with
quotient the same Klein bottle X. The integral closed form α=ds descends
to X, its pullback has primitive s, and `P(n,e)=n`, `N(n,e)=−n`.
Prove that this cover is the universal abelian cover: for the based section
a at y=0 and fiber loop b, use `π₁(X)=⟨a,b | aba⁻¹=b⁻¹⟩`, identify the
cover subgroup with ⟨b²⟩, and identify its deck quotient with H₁(X;ℤ).

The cover retracts onto its length-two fiber circle, so H₁(C;ℤ)=ℤ. Its
positive fiber generator maps to b² on π₁ and to `2[b]=0` on H₁(X;ℤ).
Thus the induced H₁ map is zero on a nonzero group, although the covering
map induces an injective map of fundamental groups. Identify
H₁(X;ℤ)→H with the isomorphism sending [a] to (1,0) and [b] to (0,1).
The coordinate calibration sends n to 2n upstairs and to (0,2n mod 2)=(0,0)
downstairs; it does not by itself construct the cover.

For integral period classes construct the circle-valued map and its pullback
cover, then identify a connected component and the divisibility of its deck
generator. Every real class, including irrational ones, has a period-kernel
cover. In the preceding example the minimal period-kernel cover instead has
deck group ℤ and kills b; distinguish it from the larger abelian cover C,
whose period map has kernel ℤ/2. With downward monomial t=A⁻¹ and g=B,
compare N1's completion to `(ℤ[ℤ/2])((t))`, retaining both coefficients at
each period. Exhibit the nonzero factors 1−g and 1+g with product0. This
geometric cover realizes a deck group with torsion. Apply N4's total-quotient
construction to this ring with zero divisors.

This example is derived from the covering classification in the supplier contracts and the Klein-bottle presentation; compare Hatcher §1.2, the Klein-bottle van Kampen calculation, pp. 51–52.

The API includes:

- The commuting transformations A and B act freely and properly with quotient X and deck group ℤ⊕ℤ/2.
- The cover subgroup is generated by b², whereas the minimal period cover also kills b.
- The completion retains both torsion coefficients and has nonzero zero divisors.

**Checks.**

- AB(s,y)=(s+1,−y−1) and BA(s,y)=(s+1,−y+1) agree modulo 2; B²(s,y)=(s,y+2)=(s,y).
- The subgroup generator b² maps injectively as 2 in the fiber subgroup of π₁(X), but maps to 2[b]=0 in H₁(X); thus 0 and 1 in H₁(C)=ℤ both map to 0.
- P(A)=1, P(B)=0 and N(A⁻¹)=1; (1−g)(1+g)=1−g²=0, with both factors nonzero over ℤ.

*Needs:* §2.2; GeometricTopology Layer 1; AlgebraicTopology Stage 1; Layer 1 Laurent comparison.

### 2.4 Cutoff trajectory spaces

For a Morse–Smale pair on compact X, establish a lifted moduli space
for each pair of lifted critical points, with translation quotient and expected
dimension equal to the index difference minus one. Construct compactification, evaluation and gluing under a
fixed upper bound on **potential drop**. Compactness on X is not compactness on X̃:
prove that outside disjoint small critical neighborhoods, drop controls trajectory
length; passages near hyperbolic critical points have controlled entry/exit, and
only finitely many compatible lifts/connecting pieces occur below a fixed drop.
Exclude equal/higher-index broken cycles by Morse–Smale transversality. Prove
index-one signed trajectories are finite at a fixed cutoff, index-two boundary
products give the coherent square-zero identity, and all estimates are uniform on
the compact parameter sets needed in N3. Retain empty and constant-trajectory
cases separately from the free translation quotient.

Use the compactness argument in rt3 §1.4, p. 213 and the uniform bounds of Lemma 2.2, pp. 218–219; build the full cutoff compactification and orientation/gluing interfaces.

The API includes:

- Translation is free only on nonconstant trajectories; quotient dimension is ind(p)−ind(q)−1.
- Bounded drop controls the finitely many lift contributions in index difference one.
- The oriented boundary in index difference two is the sum of broken trajectory products.

**Checks.**

- An index-one-to-index-zero path has quotient dimension 0; an index-zero-to-index-zero nonconstant path would have dimension −1 and is absent under transversality.
- For an exact potential, a nonconstant closed trajectory would satisfy both drop>0 and drop=0, hence none exists.
- An oriented interval compactification has endpoints +1 and −1, whose sum 0 gives the two-term square-zero cancellation; a constant trajectory has a full translation stabilizer.

*Needs:* §§2.1–2.3; HeegaardFloer Lane M stable manifolds, compactification and gluing; Layer 1 module support estimates.

### Examples

The Klein-bottle cover realizes torsion in the deck group while its potential is the genuine coordinate s.

### Dependencies

N2 consumes N1 support estimates and the named ordinary geometric suppliers; it does not depend on dynamical torsion.

## Layer 3: The Novikov complex, continuation and cellular comparison

### 3.1 The Novikov differential

Take coefficients in ℤ first and scalar-extend coefficientwise to R. Define
`CN_i=Nov(R,H,N)⟨chosen lifts of Crit_i(α)⟩` as the completed module
`TauCeti.NovikovModule` of the lifted index-i critical points with potential f̃; its
differential is the kernel map `TauCeti.NovikovModule.kernelMap` of the signed
index-one trajectory counts to **all** lifts of each lower critical point. Use N2 to
prove that this kernel has potential bound 0 and finite output above every threshold;
continuity and Nov-linearity (`TauCeti.NovikovModule.novikovKernelMap`) follow, and d²=0
reduces through `TauCeti.NovikovModule.kernelMap_kernelMap` to N2's index-two boundary
identity. Change
of lifts and descending orientations gives specified chain isomorphisms. Define
homology through native chain complexes, not a private ker/im quotient.

Use rt3 §1.4, equation (1.3), pp. 212–213.

The API includes:

- Signed counts over all target lifts define a continuous Nov-linear differential with square zero.
- Lift and orientation changes give specified chain isomorphisms.
- Homology is the homology of the native complex, with coefficient changes induced at chain level.

**Checks.**

- On the nonzero-period circle with a critical pair, the adjacent-lift differential is ±(1−t), not 0.
- After setting t=1 in the finite exact-circle differential, 1−t becomes 0, recovering the ordinary incidence count.
- For a zero critical set, every chain group and differential is 0; homology is 0, while the empty-complex torsion is 1.

*Needs:* Layers 1–2; Tau Ceti RingTheory/NovikovModule/KernelMap.lean; Mathlib chain complexes and homology.

### 3.2 Continuation with controlled support

For cohomologous α₀,α₁ on the same cover, construct continuous continuation chain
maps and degree-one homotopies with uniform period estimates; prove constant
identity, concatenation up to homotopy, inverse and independence on homology.
Genericity must concern the full function/metric path, or a generic horizontal
lift on the parameter product. A fixed arbitrary function homotopy with generic
metrics alone need not be transverse. Build genericity in each fixed cohomology
class, relative to prescribed endpoint data, with the actual finite regularity/Baire
and local-perturbation suppliers. Do not require every member of a generic path
to be individually Morse–Smale.

Use rt3 §2.1, Lemmas 2.2 and 2.5, pp. 218–219; the function/metric versus fixed-function correction is Hutchings, family-Floer erratum, discussion of §2.2 and Proposition 3.4.

The API includes:

- Constant families induce the identity, and concatenation agrees with composition up to controlled chain homotopy.
- Reverse continuation is a chain-homotopy inverse and the induced map on homology is independent of endpoint-fixed generic choices.
- Uniform support estimates survive compositions and homotopies.

**Checks.**

- The constant family on a one-generator zero-differential complex induces matrix [1], not [0].
- For a change of lift by t², continuation and its inverse have matrices [t²] and [t⁻²], with product [1].
- An index-one interval of parameterized solutions contributes opposite endpoint signs +1 and −1, giving chain-homotopic endpoint maps.

*Needs:* §3.1; HeegaardFloer §1.5 (M.5) and F0; DifferentialGeometry relative smooth perturbations; Layer 2 uniform cutoff gluing.

### 3.3 Completed cellular and controlled singular comparison

Consume the equivariant cellular chain complex `TauCeti.cellularChainComplexRep` of X̃,
for the lifted CW structure `TauCeti.cwComplexPreimage` of a finite CW model of X along
the deck quotient map, free over ℤ[H] on chosen lifts of the cells by
`TauCeti.cellularChainRepIsoFree`. Its completed version is
`Nov(R,H,N)⊗_(ℤ[H]) Ccell_*(X̃;ℤ)` with the displayed group-ring scalar map.
Prove a chain homotopy equivalence with CN, compatible with subdivisions, cell
models, orientation/lift changes and continuation. Build the alternative controlled
singular-chain model: locally finite chains upstairs with only finitely many
simplices meeting any region {f̃>C}, including the controlled subdivision,
prism and comparison operations. Require the comparison to this carrier, not
merely an isomorphism with an unnamed completed homology.

Prove the exact-form specialization is the group-ring equivariant ordinary Morse
complex. Prove the large-gradient comparison for β=α+C df with C sufficiently
large and a chosen Morse–Smale f: after positive rescaling to df+C⁻¹α, the relevant
critical points and lifted incidence counts correspond, and the flow has no periodic
orbits. Supply the structural-stability/entry-exit and support argument; cohomology
equality and a formal small-perturbation sentence are not proofs. Complete the
Morse-to-cellular chain identification for the triangulation-adapted model and
compare it with ordinary singular homology.

The homology comparison is rt3 equation (1.4), p. 213. The controlled chain-homotopy equivalence, subdivision and prism estimates are stronger targets whose construction is specified here.

The API includes:

- Completed cellular chains use the explicit group-ring scalar map, not an assumed tensor/completion interchange.
- Controlled subdivision and prisms give chain homotopy equivalences with the locally finite upstairs carrier.
- The exact and large-gradient comparisons respect the based chain model and its support.

**Checks.**

- For the exact circle on its universal cover, d=1−t over ℤ[t,t⁻¹], so H₀=ℤ and H₁=0.
- For nonzero circle period, 1−t is invertible and both completed homology groups vanish.
- The infinite sum of translates at increasing positive potential fails the finite-above condition; translates with potential −k pass every fixed upper cutoff.

*Needs:* §§3.1–3.2; Layer 1 modules; Tau Ceti `TauCeti.cellularChainComplexRep`, `TauCeti.cwComplexPreimage`, `TauCeti.cellularChainRepIsoFree` and `TauCeti.cellularSingularHomologyIso`; AlgebraicTopology Stages 2–4; GeometricTopology Layer 11; HeegaardFloer ordinary Morse/singular comparison.

### 3.4 Naturality and top degree

Derive coefficient-change and homotopy naturality through these chain maps. For n=dim X and [α]≠0 prove H_n^Nov(X;ℤ)=0, with the orientation-local-system
argument valid for nonorientable X as well. Give nonexact classes with zero complex
and examples where Novikov homology is not H_*(X)⊗Nov.

Use rt3 §1.4, equation (1.4), p. 213 and the finite based field-complex reduction of Appendix A, pp. 239–240; top-degree vanishing follows from that comparison and the orientation-local-system argument.

The API includes:

- For connected X and nonzero class, top-degree integral Novikov homology vanishes, including nonorientable X.
- Coefficient and homotopy naturality are induced by the constructed chain comparisons.

**Checks.**

- A two-term field complex with differential 2 has chain ranks (1,1), Betti numbers (0,0) and Euler sums 0=0.
- For the critical-free nonzero-period circle, all Betti and critical counts vanish; ordinary circle Betti numbers (1,1) would give the wrong answer.
- For exact α=0 on an oriented circle with trivial cover, H₁=ℤ, so omitting the nonzero-class hypothesis would be false.

*Needs:* §3.3; AlgebraicTopology Stage 6 orientation coefficients.

### Examples

The three circle calculations distinguish exact group-ring homology from the acyclic nonzero-period completion.

### Dependencies

N3 uses N1–N2 and the ordinary cellular/Morse suppliers. Its field-rank consequences are developed in §4.6 after the independent component algebra.

## Layer 4: Based chain torsion and abelian total quotient rings

### 4.1 Determinant lines and based torsion

Consume the scalar torsion of a based complex over a field F,
`HomologicalComplex.reidemeisterTorsion` (Algebra/Homology/ReidemeisterTorsion/Basic.lean):
a nonzero scalar from the chosen ordered chain bases of a bounded acyclic complex, and
0 for a nonacyclic one (`HomologicalComplex.reidemeisterTorsion_eq_zero_iff`),
independent of boundary bases and lifts (`HomologicalComplex.reidemeisterTorsion_eq_finprod`).
Its homological convention is that the elementary two-term complex with differential
a from degree 1 to degree 0 has torsion a⁻¹ for a≠0
(`HomologicalComplex.reidemeisterTorsion_eq_det_zpow`). This is Hutchings rt3,
Definition A.1 and Proposition A.2, p. 239; it is the inverse of Milnor's
multiplicative convention in Whitehead torsion, §3, p. 365. Consume the
permutation/sign rule `HomologicalComplex.reidemeisterTorsion_reindex`, the graded
basis-change formula `HomologicalComplex.reidemeisterTorsion_eq_mul_finprod_det`, scalar
extension `HomologicalComplex.map_reidemeisterTorsion`, direct sums
`HomologicalComplex.reidemeisterTorsion_biprod`, multiplicativity for a degreewise based
short exact sequence of acyclic complexes with compatible chain bases and the explicit
Koszul sign (`HomologicalComplex.reidemeisterTorsion_eq_mul_of_shortExact`), the
homology-basis torsion `HomologicalComplex.reidemeisterTorsionWithHomology` with its
chain- and homology-basis change laws (Homology.lean), and the transformation of torsion
under a chain map by the torsion of its based mapping cone
(`HomologicalComplex.reidemeisterTorsion_homotopyCofiber`,
`HomologicalComplex.reidemeisterTorsion_eq_mul_of_quasiIso`, MappingCone.lean).

Build the determinant line of a bounded finite-dimensional chain complex over F and
its canonical comparison with the alternating determinant of homology, using bases of
boundaries and lifts through the short exact sequences. For a nonacyclic complex it
retains the homology-basis determinant line where the scalar torsion is 0; after a
choice of homology bases it is `HomologicalComplex.reidemeisterTorsionWithHomology`.
For general complexes, prove determinant-line multiplicativity through the long exact
homology sequence, including its torsion correction with chosen homology bases. Regard
that sequence as an acyclic homological complex with H_i(A), H_i(B), H_i(D) in degrees
3i+2,3i+1,3i respectively, using the same alternating determinant order and
subspace-first lifts. Derive the scalar formula from this comparison; the
zero-extended scalar torsions do not replace the determinant-line formula. Prove
contraction and subdivision identities used below. Do not assert torsion is invariant
under every chain homotopy equivalence: use its transformation by the based
mapping-cone torsion.

For an acyclic complex choose coordinate subspaces D_i,E_i for which the
**projection** `p_(E_(i−1))∘d|_(D_i)` is an isomorphism; rt3 Proposition A.2 proves
that such a choice exists. The differential need not map D_i into E_(i−1) itself.
When each E_i precedes D_i in the chain basis, the alternating product of these minor
determinants is `HomologicalComplex.reidemeisterTorsion_eq_finprod_det_torsionMinor`
for the minors `HomologicalComplex.torsionMinor` (SquareMinor.lean). For blocks in
other positions, reconcile it with the determinant-line convention, including the
overall sign: `τ=±Π_i det(d_s:D_i→E_(i−1))^((-1)^i)`, where `d_s=p_(E_(i−1))∘d|_(D_i)`
is the square minor and the sign is that of reordering the chain bases. For degreewise
basis changes A_i, the exact equality `τ(A⁻¹dA)=τ(d)·Π_i det(A_i)^((-1)^i)` for
grading-preserving A is `HomologicalComplex.reidemeisterTorsion_eq_mul_finprod_det_toMatrix`.

Use rt3 Definition A.1 and Proposition A.2, p. 239, and Proposition A.5, p. 240; transport Milnor §3, pp. 365–368 by inversion.

The API includes:

- The determinant comparison is independent of boundary bases and lifts and retains the homology determinant line in the nonacyclic case.
- Square minors use projection to the selected target coordinate subspace.
- Based exact-sequence, scalar-change, direct-sum and mapping-cone formulas retain their determinant order and signs.

**Checks.**

- For ℚ —2→ ℚ in degrees 1,0, torsion is 1/2; Milnor gives 2. With A₀=3 and A₁=5, the new differential is 10/3 and torsion 3/10=(1/2)·3/5.
- Differential 0 over ℚ has two nonzero homology groups, so its zero-extended scalar torsion is 0, not an acyclic determinant quotient. The zero complex has torsion 1.
- The column d(1)=(1,1) does not land in span(e₁), but projection to span(e₁) is [1], an invertible minor.

*Needs:* Tau Ceti Algebra/Homology/ReidemeisterTorsion Basic.lean, Homology.lean, MappingCone.lean and SquareMinor.lean; Mathlib finite-dimensional linear algebra, exterior powers, chain complexes and homology.

### 4.2 Abelian total quotient components

Use Mathlib `Localization (nonZeroDivisors A)` for total quotients. For a finitely
generated abelian H, consume that the group-ring inclusion sends nonzerodivisors to
nonzerodivisors and induces an injective total-quotient map
(`TauCeti.NovikovSeries.ofAddMonoidAlgebra_mem_nonZeroDivisors`,
`TauCeti.NovikovSeries.map_ofAddMonoidAlgebra_injective`, RingTheory/NovikovSeries/NonZeroDivisors.lean),
that Nov(ℤ,H,N) is reduced because ℤ[H] is (`TauCeti.NovikovSeries.isReduced_iff`), and
that the total quotient of Nov over a domain is Artinian, with characteristic-zero
residue fields when the coefficients have no additive torsion
(`TauCeti.NovikovSeries.isArtinianRing_of_isFractionRing`,
`TauCeti.NovikovSeries.charZero_quotient_of_isFractionRing`, TotalQuotient.lean). Prove
that the total quotient rings of ℤ[H] and Nov(ℤ,H,N) are finite products of
characteristic-zero fields, through Mathlib's `IsArtinianRing.equivPi` once reducedness
passes to the localization. Construct the finite-torsion/free splitting and cyclotomic
components and the componentwise field/localization statements; show the answer is
independent of that splitting. Prove the injective total-quotient map is compatible
with the field components. In the
torsion-free case recover native fraction fields and the leading-term domain proof.
Do not replace the general deck group by its free quotient.

Use rt3 Lemma A.4 and its proof, p. 240, retaining the finite-generation and characteristic-zero hypotheses.

The API includes:

- Group-ring inclusion preserves nonzerodivisors and induces an injective total-quotient map.
- The finitely many characteristic-zero field components are independent of a chosen splitting.
- Torsion-free H gives a domain; finite torsion is retained in the component decomposition.

**Checks.**

- For H=0, the total quotient of ℤ is ℚ.
- For H=ℤ/2 and N=0, Q(ℤ[H])=ℚ×ℚ with g↦(1,−1); 1−g maps to (0,2).
- Over 𝔽₂, (1+g)²=0 with 1+g≠0, so the characteristic-zero component statement cannot be exported unchanged.

*Needs:* Layer 1 leading coefficients; Tau Ceti RingTheory/NovikovSeries/NonZeroDivisors.lean, Reduced.lean and TotalQuotient.lean; Mathlib `Localization`, `nonZeroDivisors` and `IsArtinianRing.equivPi`; finite abelian groups and cyclotomic fields.

### 4.3 Total-quotient topology and continuity

Construct the period-order topology on each total-quotient field component:
after a free/torsion and period-kernel splitting, embed it into the Novikov
field with coefficients in the fraction field of the corresponding
characteristic-zero kernel group algebra. Define O(C) by order>C and prove
independence of the splitting, continuity of addition/multiplication and
inversion at nonzero elements. The total quotient has the product topology
over its finitely many field components; completeness of Nov alone is not a
completeness claim for this quotient. Prove rt3 Lemma 2.8's cutoff continuity
of based torsion when the acyclic component set is fixed, by applying in each field
component, with this topology, the minor-chart continuity
`HomologicalComplex.tendsto_reidemeisterTorsion_of_det_torsionMinor_ne_zero`
(Algebra/Homology/ReidemeisterTorsion/Topology.lean): a nonzero limiting minor remains
nonzero, and high-order changes in its inverse remain high order.

Use rt3 §2.1, Definition 2.6 and Lemmas 2.7–2.9, pp. 220–221; in particular the proof of Lemma 2.8 fixes the acyclic component set.

The API includes:

- Splitting-independent orders give a product topology on the finite total quotient.
- Inversion is continuous at nonzero elements in each field component.
- Torsion has the cutoff continuity formula on a fixed acyclic-component stratum.

**Checks.**

- For a=2 and perturbation t^m, (2+t^m)⁻¹ begins 1/2−t^m/4, so the difference has order m.
- In the two components (0,2), the zero component remains zero under a perturbation confined to the second component, whose torsion tends to 1/2.
- At a=0 the zero-extended two-term torsion is 0 but for a=t^m it is t^(−m); continuity across the acyclic/nonacyclic change is false.

*Needs:* §4.2; Layer 1 period filtration; §4.1 minor formula; Tau Ceti Algebra/Homology/ReidemeisterTorsion/Topology.lean.

### 4.4 Finite cyclic norms and traces

For a cyclic quotient μ:H→ℤ/k with kernel K, Nov(ℤ,H,N) is free of rank k over
Nov(ℤ,K,N|K) on the coset monomials (`TauCeti.NovikovSeries.cosetBasis`,
`TauCeti.NovikovSeries.finrank_eq_index`, RingTheory/NovikovSeries/FiniteIndex.lean, for
every finite-index subgroup). Norm and Tr are Mathlib's `Algebra.norm` and
`Algebra.trace`, the determinant and trace of multiplication, with their basis
independence and the multiplicativity of Norm. Consume Tr=k·coefficient restriction
(`TauCeti.NovikovSeries.trace_eq_index_smul_comap`) and, over a ℚ-algebra,
log Norm(1+x)=Tr log(1+x) for x in the positive ideal
(`TauCeti.NovikovSeries.log_normNonnegSubring`, Norm.lean). If μ kills the torsion
subgroup of H, extend Norm to the total quotients, identify corresponding
field components and prove a nonzero component stays nonzero under Norm.
Under this same hypothesis prove cellular and Novikov torsion transform by
Norm, retaining zero on nonacyclic components and pullback Euler structures.
The ring-level Norm and zeta formula do not require this additional
hypothesis; the asserted quotient/torsion comparison does.

Use rt3 Lemma 3.5 and Proposition 3.6, pp. 227–228, including condition (3.8).

The API includes:

- Coset monomials give a rank-k free extension; multiplication defines basis-independent norm and trace.
- Trace equals k times coefficient restriction and log Norm equals Tr log in the positive rational ideal.
- If the quotient kills deck torsion, the norm preserves nonzero field components and transforms based torsion.

**Checks.**

- For ℤ→ℤ/2 with s=t², multiplication by t has matrix [[0,s],[1,0]], trace 0 and norm −s; Norm(1−t)=1−s.
- For 1+t², Tr=2+2s, matching twice restriction; restriction alone would miss the factor 2.
- For H=ℤ/2 mapping identically to ℤ/2, the component idempotent (1,0) is nonzero but has norm 0; this quotient does not kill torsion.

*Needs:* §§4.1–4.3; Layer 1 coset modules and positive logarithms; Tau Ceti RingTheory/NovikovSeries/FiniteIndex.lean and Norm.lean.

### 4.5 Partial acyclicity and lift ambiguity

For a based finite free complex over either ring, componentwise torsion is
`HomologicalComplex.componentwiseReidemeisterTorsion`
(Algebra/Homology/ReidemeisterTorsion/Componentwise.lean) in the reduced Artinian total
quotient of §4.2: a component is 0 exactly when that component complex is nonacyclic
(`HomologicalComplex.mk_componentwiseReidemeisterTorsion_eq_zero_iff`), and the value is
natural in the ring (`HomologicalComplex.map_componentwiseReidemeisterTorsion`). Retain
partial acyclicity; a single global zero convention would lose information. Define
the ambiguity action by signs and deck monomials on the **whole** total quotient
ring, including 0, and pass to its orbit quotient. Prove torsion's formulas under
ordered orientation/lift changes, regular cellular subdivision and triangulation
changes. Use GT's smooth triangulation/PL comparison and explicit subdivision
mapping cones. Cellular torsion is a simple-homotopy invariant with the stated
based structure, not an invariant of arbitrary unbased homotopy equivalence.

Use rt3 Definitions A.1 and A.3, pp. 239–240 and §1.5, pp. 213–214, with subdivision comparison constructed from the stated topological suppliers.

The API includes:

- Componentwise torsion vanishes exactly on nonacyclic components.
- Signs and deck monomials act on the whole total quotient, including zero.
- Orientation, lift and simple subdivision changes have the prescribed based torsion factors.

**Checks.**

- For H=ℤ/2 and d=1−g, the two components have d=0 and d=2, hence torsions (0,1/2), not global zero.
- The ambiguity action fixes 0 and sends a nonzero scalar a to ±e^h a; it cannot turn 0 into 1.
- Changing only the degree-zero lift by t multiplies torsion by t; changing only the degree-one lift multiplies it by t⁻¹.

*Needs:* §§4.1–4.4; Tau Ceti Algebra/Homology/ReidemeisterTorsion/Componentwise.lean; GeometricTopology Layer 11; Layer 3 when applying torsion to its complexes.

### 4.6 Novikov inequalities

For a Morse–Smale closed one-form on the standing compact connected manifold
and a specified connected abelian period cover, prove the weak and strong
Novikov inequalities in each field component of the total quotient. Write c_i
for the number of index-i critical points and b_i for the dimension of the
component Novikov homology. Prove b_i≤c_i and, for each q≥0,
Σ(i=0,…,q)(−1)^(q−i)b_i≤Σ(i=0,…,q)(−1)^(q−i)c_i, with equality for
q=dim X. These are dimensions over an actual field, not ranks over an assumed
Novikov field (rt3 §1.4, equation (1.4), p. 213 and Appendix A, pp. 239–240;
the inequalities follow from splitting the resulting finite field complex).

**Checks.**

- A two-term complex with nonzero scalar differential has c₀=c₁=1 and b₀=b₁=0: at q=0, 0≤1, and at q=1, 0=1−1.
- A point has c₀=b₀=1, so both weak and top-degree alternating inequalities are equalities 1=1.
- For the zero differential in ranks (1,1), b₀=b₁=1; for differential 2 over ℚ they are 0,0. Chain ranks alone do not fix the Betti numbers.

*Needs:* §3.1 Novikov complex and §3.3 cellular comparison; §4.2 field components;
Mathlib finite-dimensional linear algebra and homology.

### Examples

The two-term complex over ℤ[ℤ/2] detects both the torsion convention and partial acyclicity.

### Dependencies

N4 algebra depends on N1, the pinned based torsion and pinned linear/homological algebra; applications consume N3 complexes. No torsion construction depends on N6 invariance.

## Layer 5: Periodic return orbits and the dynamical zeta function

### 5.1 The closed-form return germ

Apply HeegaardFloer §2.8 (F0.6)'s local return germ to −α♯. A transverse
section through a nonstationary periodic orbit gives a germ P, its derivative
on the normal quotient, and conjugacies under section/basepoint changes.
Check the nonvanishing-field hypothesis along that orbit; the application uses
local flow near its compact image. No invariant transverse disk is required.

Use HeegaardFloer §2.8 (F0.6) for the germ and rt3 §1.1, p. 210 for its closed-one-form use.

The API includes:

- The normal return derivative and its spectrum are independent of the chosen section and basepoint.
- Every positive iterate uses the supplied iterate conjugacy.
- The zero-dimensional transverse space is retained for circle flows.

**Checks.**

- For P(x)=2x and section transition h(x)=3x, hPh⁻¹(x)=2x, the derivative is 2 and det(1−DP)=−1 in either section.
- For a critical-free circle orbit the transverse space has dimension 0, so its determinant and return sign are 1.
- At a critical point α♯=0, no transverse return germ of a nonstationary orbit is claimed.

*Needs:* HeegaardFloer §2.8 (F0.6); Layer 2 negative dual flow.

### 5.2 Orbit multiplicity and local fixed-point index

Closed orbits of the complete flow of −α♯ on compact X up to rotation, their primitive
orbits with least real return time, k-fold iterates and integer multiplicity p(γ) are
`Flow.ClosedOrbit`, `Flow.ClosedOrbit.iterate` and `Flow.ClosedOrbit.multiplicity`
(Dynamics/Flow/ClosedOrbit.lean). The multiplicity is the covering degree over the
primitive orbit; it is not the return time. Apply the supplied return germs and their normal-derivative conjugacies. An
isolated return fixed point has local index defined by perturbing the return map
on an isolating transverse chart neighbourhood to have nondegenerate fixed points
and summing `sgn det(1−dg)` over them. Use a generic relative homotopy's
one-dimensional zero cobordism to prove independence of the perturbation.
In transverse dimension zero the isolated point has index 1; in dimension one
the same signed sum applies, with no positive-dimensional boundary sphere assumed.
In dimensions at least two compare with DG 10's degree on the boundary sphere
of `x↦x−return(x)`. Build independence
of chart/isolating neighbourhood, additivity and restriction
and homotopy invariance while the boundary remains fixed-point free. At a
nondegenerate point prove the index is ε below, including transverse dimension 0.
These are the local-index suppliers for N6's closed-orbit degeneration argument.
Extend the index to continuous maps with compact isolated fixed set by a
C⁰-small smooth approximation that stays fixed-point-free on the isolating
boundary. Prove independence by relative approximation of a boundary-avoiding
homotopy; compare this extension with the smooth index. Construct its homological
graph/diagonal intersection description using AT's relative homology, excision
and orientation local system; normalize the two local orientation factors by
their canonical square pairing, so the integer needs no orientation of the
ambient manifold. Prove agreement with the approximation definition and
the partial-domain commutativity formula. For open subsets `U⊆Y₁`,
`V⊆Y₂` of smooth manifolds Y₁,Y₂ and continuous maps `f:U→Y₂`, `g:V→Y₁`, the composites g∘f and f∘g
have domains `f⁻¹(V)⊆U` and `g⁻¹(U)⊆V`. When their fixed sets are compact
and isolated, prove `i(g∘f)=i(f∘g)`; f identifies these fixed sets with inverse g.
No assumption that either composite preserves its isolating neighbourhood is
made. Derive invariance under
conjugation by a homeomorphism of isolating neighbourhoods, including the
piecewise smooth homeomorphisms of a smooth triangulation. This proves
independence of topological as well as smooth charts. This is the interface
for N6's cellular/simplicial Hopf construction. Iterate formulas below apply
to nondegenerate return maps; no universal degenerate-iterate formula is assumed.
An
admissible pair requires every iterate nondegenerate in addition to N2's critical
and trajectory conditions. Define ε(γ)=sgn det(1−dreturn_γ). Establish generic
admissible pairs in each fixed cohomology class by local return-map perturbations
and the countable intersection over bounded-period/iterate windows.

Use rt3 §1.1 and §1.3, pp. 210–212, and Lemma 3.2, p. 223 for index conservation. The continuous, chart-independent and partial-domain index interfaces are constructed here from degree.

The API includes:

- Multiplicity is an integer covering degree, independently of the real return time.
- The local index is additive, invariant through boundary-avoiding homotopies and agrees with the determinant sign at nondegenerate fixed points.
- Continuous approximation, graph/diagonal pairing and partial-domain commutativity extend the same index without an orientation of the ambient manifold.
- Fixed-cohomology genericity preserves the closed-form condition and treats every iterate.

**Checks.**

- A primitive orbit of real period 7 has multiplicity 1; its double has period 14 and multiplicity 2.
- For local maps P(x)=x/2 and P(x)=2x at 0, det(1−DP)=1/2 and −1, giving indices +1 and −1.
- On an interval, P(x)=x+x²−ε has for ε>0 two fixed points with determinant signs +1 and −1, total 0; ε<0 has no fixed point, also total 0.
- Conjugation by h(x)=−x leaves the derivative of P(x)=2x equal to 2; chart reversal must not reverse its index −1.

*Needs:* §5.1; Tau Ceti `Flow.ClosedOrbit`; DifferentialGeometry Layer 10 and relative smooth approximation; AlgebraicTopology Stages 2–3 and 6; Layer 2 critical transversality.

### 5.3 The zeta series, integrality and cover norm

Prove only finitely many closed orbits up to rotation, with iterates included,
have N([γ]) below any prescribed positive threshold. Rule out accumulation on a degenerate orbit and on a broken
cycle through critical points; the latter needs an equal/higher-index segment,
excluded by N2. Include all iterates and prove multiplicity support estimates.
The rational log series `Σγ ε(γ)/p(γ) · e^[γ]` in the positive period ideal and its
exponential ζ are `TauCeti.NovikovSeries.orbitLog` and `TauCeti.NovikovSeries.orbitZeta`
(RingTheory/NovikovSeries/OrbitZeta.lean), applied to the classes of the primitive
orbits and the signs of their iterates; the finiteness just proved is their hypothesis
that the periods tend to infinity. This uses the completion over ℚ, not an assumed
tensor-product commutation with completion over ℤ. Write i_− for the number of real
return eigenvalues below −1, i_+ for those above 1, and i_0 for those in (−1,1), with
algebraic multiplicity. The iterate signs ε(γ^k)=(−1)^i_+ · (−1)^((k+1)i_−) are
`LinearMap.sign_det_one_sub_pow` (LinearAlgebra/Matrix/Charpoly/DetSign.lean) for the
normal return derivative, so the signs of the iterates of γ form a geometric sequence
of ratio (−1)^i_−. Then `TauCeti.NovikovSeries.orbitZeta_eq_eulerProduct` and
`TauCeti.NovikovSeries.orbitZeta_eq_mapRingHom_eulerProduct` give integral coefficients
through the convergent product over primitive orbits

`ζ=Πγ (1−(−1)^i_−(γ)e^[γ])^(−ε(γ)(−1)^i_−(γ))`,

and `TauCeti.NovikovSeries.isUnit_orbitZeta` with
`TauCeti.NovikovSeries.orbitZeta_sub_one_mem_periodFiltration` makes ζ a unit congruent
to 1 above a positive cutoff, hence with constant term 1.
Prove that the exponent is −(−1)^(i_++i_−)=(−1)^(dim X−i_0): the transverse space has
dimension dim X−1 and no return eigenvalue is ±1. It specializes to −(−1)^i_0 only in
odd dimension. Prove naturality for valid period-support exponent maps from
`TauCeti.NovikovSeries.mapRingHom_eulerProduct`, and the finite cyclic cover norm
formulas needed for N6, retaining the individual lift/iterate multiplicities. For
0→K→H→[μ]ℤ/k→0, prove ζ(X̂)=Norm(ζ(X)) with no torsion-annihilation hypothesis, from
`TauCeti.NovikovSeries.log_normNonnegSubring` and Tr=k·restriction on each orbit term,
including shorter primitive lifts.

Use rt3 §1.3, equations (1.1)–(1.2), p. 212 and Proposition 3.6(a), p. 228; derive the dimension-correct iterate/product signs from real eigenvalue blocks.

The API includes:

- Every cutoff receives finitely many orbit/iterate contributions; multiplicity denominators are taken in the rational completion.
- The primitive product gives integral coefficients and constant coefficient 1.
- Period-compatible coefficient maps and all finite cyclic covers obey the norm formula, without imposing the extra torsion-annihilation condition.

**Checks.**

- For a critical-free circle, log ζ=t+t²/2+t³/3+⋯ and ζ=1+t+t²+⋯; the constant coefficient 1 excludes zero.
- On a surface an attracting return multiplier 1/2 has all signs +1 and factor (1−t)⁻¹; a repelling multiplier 2 has all signs −1 and factor 1−t.
- For multiplier −2, signs are +1 on odd iterates and −1 on even iterates, giving factor 1+t; (1+t)/(1−t²)=1/(1−t) checks period doubling.
- For the double cyclic circle cover with s=t², Norm((1−t)⁻¹)=(1−s)⁻¹; no missing factor 2 is allowed in the exponent.

*Needs:* §§5.1–5.2; Layer 2 cutoff compactness; Layer 1 positive series; §4.4 norms; Tau Ceti RingTheory/NovikovSeries/OrbitZeta.lean and `LinearMap.sign_det_one_sub_pow`.

### Examples

Return signs in transverse dimensions 0 and 1 distinguish ambient odd and even dimensional product exponents.

### Dependencies

N5 uses N1–N2, HeegaardFloer §2.8 and N4 norms. Its index construction precedes the Lefschetz theorem and uses no global trace formula.

## Layer 6: Dynamical torsion, bifurcations and geometric calculations

### 6.1 The dynamical invariant and generic events

For χ(X)=0 and an admissible pair set
`I(α,g,π)=τ(CN)·ζ ∈ Q(Nov(ℤ,H,N))/(±e^H)`.
Prove that it depends only on [α] and the specified cover, and prove
`I=i(τ(Ccell(X̃)))`, with i the N4 total-quotient map. Include arbitrary real
cohomology classes and all finitely generated abelian deck groups, not just
integral classes or the torsion-free acyclic case.

Construct a generic fixed-cohomology one-parameter family with prescribed
admissible endpoints, at every period cutoff: transverse critical-point slides,
ordinary trajectory tangency/cancellation, isolated critical birth/death and
closed-orbit degenerations, with the semi-isolation and good-parameter conditions
of Hutchings rt3 §2. Consume [HeegaardFloer §1.5 (M.5)](../HeegaardFloer/README.md)'s ordinary local A₂
fold, relative partial-jet transversality and signed elementary chain change.
Construct the closed-one-form specialization using local exact potentials
and exact cutoff perturbations, retaining the global cohomology class,
period cutoffs and cover/lift comparisons. Choose the metric Euclidean in
the resulting Cerf chart and pin the potential and positive metric dual
with precisely that local normalization:
`α_t=d(x₁³/3 ± (t−t₀)x₁ − Σ_(j=2)^i x_j²/2 + Σ_(j>i)x_j²/2)` and
`V_t=(x₁² ± (t−t₀),−x₂,…,−x_i,x_(i+1),…,x_n)`.
The two critical points have indices i and i−1; trajectories use −V_t.
For closed-orbit-only degenerations use rt3 Lemma 3.2's local fixed-point-index
invariance on transverse return discs; a full classification of periodic-orbit
bifurcations is not an assumed supplier. Prove the bifurcation analysis:
opposite trajectory cancellations; closed-orbit local-index conservation; handle slides
between distinct critical points; same-critical-point deck slides; and critical
birth/death with multiply broken return trajectories. Compare the based complex
matrices, determinant/minor factors and zeta factors at each event.

The unrefined invariance and cellular equality are rt3 Theorems A and B, pp. 214–215; the generic event framework is §2, pp. 218–222 and the ordinary events are §3.1–3.3, pp. 223–226.

The API includes:

- The invariant lives in the whole total-quotient orbit space and retains partial acyclicity.
- Generic fixed-cohomology families are relative to admissible endpoints and are controlled at each period cutoff.
- Closed-orbit local-index conservation and ordinary critical events have the specified chain and zeta factors.

**Checks.**

- For the critical-free nonzero-period circle, τNov=1 and ζ=(1−t)⁻¹, so I=(1−t)⁻¹.
- In the local fold x³/3−εx, ε>0 gives zeros ±√ε with Hessians ±2√ε, hence indices 1 and 0; ε<0 has no zeros.
- An elementary distinct-critical-point slide matrix [[1,a],[0,1]] has determinant 1, hence introduces no torsion factor.

*Needs:* Layers 1–5; HeegaardFloer §1.5 (M.5) and F0; DifferentialGeometry relative exact perturbations.

### 6.2 Self-slides and all-order cancellation

For self-slides,
prove the all-order identity using the finite cyclic cover/norm argument. If
h is the slide class, let d be the divisibility of its nonzero image in H/T,
where T is the torsion subgroup. Use two explicitly distinguished cover families:
for k coprime to d, `μ_k:H→ℤ/k` kills T and sends h to 1, for the chain
stabilization; for every k≥2, `ν_k:H→ℤ/(dk)` kills T and sends h to d,
for norm elimination. In the latter `nh∈ker ν_k` iff k divides n.
Construct both from an integral functional equal to 1 on the primitive
class h̄/d, reducing modulo dk for ν_k and multiplying by d⁻¹ modulo k
for μ_k. Both quotients are surjective.
For a slide at p of index i, construct `x=1+Σ_(n≥1)a_n e^(nh)`
with `a₁=±1` the geometric sign of the h-class self-slide trajectory from p
to p: extend N2's determinant-line orientation to the parameterized trajectory
space, with the parameter axis oriented by increasing t. This gives the signed
zero-dimensional family crossing. Prove `d₊=A_p(x)⁻¹d₋A_p(x)`, where A_p(x) multiplies
the chosen p-generator by x and fixes the other generators. Prove this all-order
chain identity using the μ_k covers, with cutoff `R_k=N(kh)` and only events
of drop strictly less than R_k. Let k tend to infinity through values coprime
to d, so these cutoffs exhaust all finite drops and no class kh self-slide is
used in the elementary-matrix step. For each such cutoff choose a semi-isolated
parameter window with admissible endpoints, then perturb its pullback family
non-equivariantly relative to those endpoints. Apply the generic-family theorem
on the compact finite cover and prove the perturbation is small enough that
below that cutoff only the lifted slides occur. Their conjugator is a product
of elementary slide matrices. Recover its equivariance modulo the cutoff by
comparing rows/columns with the endpoint differentials, which are restrictions
of Nov(H)-linear maps: the relevant one-variable series are nonzerodivisors
on Nov(ℤ,H,N), as proved cosetwise over ℤh. The equivariant conjugator has
twisted circulant form, with shift `S^k=e^(kh)` over the kernel Novikov ring.
In the non-split case prove x is determined modulo each cutoff (accounting for
the fixed order shifts of the nonzero baseline row/column); hence every
coefficient a_(n,k) stabilizes as k tends to infinity through coprime values.
Include the case where both the
outgoing boundary of p and every incoming p-coefficient vanish: p splits off
as a homology summand in every field component, and the chain identity is
independent of higher coefficients of x; choose them arbitrarily while retaining
the geometric a₁. Treat event invariance there directly as 0=0.
Define `y=ζ₊/ζ₋` and prove it lies in `1+Σ_(n≥1)ℤ e^(nh)` by showing that
only orbit classes nh are created or destroyed. Write its coefficients b_n.
Construct the compactified return-map graph and prove its leading-coefficient
identity b₁=(−1)^(i+1)a₁ with the fixed orientation convention, then eliminate
every higher coefficient by the ν_k covers and N4's nonvanishing norm lemma
when τ₋ has a nonzero field component, obtaining `y=x^((-1)^(i+1))` by
injectivity of the one-variable slide series in that component. Explicitly,
for `z=x^((-1)^i)y`, prove the e^(kh) coefficient of
`log Norm_(ν_k)(z)` vanishes. Perturb the ν_k pullback family relative to
endpoints below a sufficiently large cutoff. Lifted slides with k not dividing
the lift-index difference are distinct-point slides, which preserve I; a
first self-slide in class kh has no linear term by the already proved chain
and geometric leading-coefficient identities. Thus the cover changes I by
`1+O(e^(2kh))`, without assuming full event invariance in that cover.
Cancel in a nonzero cover component using N4's norm lemma and prove the
injectivity of one-variable series in e^(kh) in that component. Use
`log Norm_(ν_k)(z)=dk·Σ_(k∣n)(log z)_n e^(nh)`:
its e^(kh) coefficient is dk·(log z)_k, hence (log z)_k=0 over ℚ.
Taking k=n kills every coefficient n≥2. The geometric leading-coefficient
identity kills n=1. If all components
are nonacyclic, use preservation of acyclicity under chain conjugation to prove
I₊=I₋=0 without cancelling zero torsion. Thus the event theorem is I₊=I₋ in
the whole total-quotient orbit space. Agreement
of only the linear coefficient is insufficient. Birth/death requires the explicit
entry/exit/gluing analysis and the geometric-series algebra of its return chains.

Use rt3 §3.4–3.5, Lemmas 3.5 and 3.7–3.10, pp. 227–231. The two quotient families and the split-homology case make the divisibility and cancellation conditions explicit.

The API includes:

- The coprime quotient family constructs the chain conjugator coefficient by coefficient.
- The second quotient family tests every logarithmic coefficient, including indices not coprime to the divisibility.
- Cancellation occurs only in a nonzero field component; entirely nonacyclic complexes give event equality 0=0.

**Checks.**

- For H=ℤ⊕ℤ/2 and h=(2,1), d=2. With k=3, μ(n,e)=2n mod 3 sends h to 1; with k=2, ν(n,e)=n mod 4 sends h to 2 and nh lies in its kernel exactly for even n.
- For i=1 and x=1+t, y=x gives x^(−1)y=1; for i=2, y=x⁻¹ gives xy=1. The leading coefficients have signs +a₁ and −a₁ respectively.
- For z=1+c₂t²+O(t³), d=2 and k=2, the degree-two logarithmic norm coefficient is 4c₂; vanishing forces c₂=0 over ℚ.

*Needs:* §6.1; §4.4 component norms; Layer 2 parameterized orientations; Layer 1 nonzerodivisors of one-variable series.

### 6.3 Cutoff limits and topological equality

A generic compact parameter interval can contain infinitely many events: prove
finiteness/isolation at each fixed period cutoff, compatibility of successive
cutoffs and convergence in N4's componentwise total-quotient topology, with
fixed critical lifts or a fixed Euler-structure representative throughout.
Before applying N4's torsion continuity, construct the cutoff limits of
continuation maps and their homotopies to give chain homotopy equivalences
from each one-sided event-limit complex to a neighbouring regular complex.
This proves the acyclic component set is preserved, including at the limits.
Do not assume a
finite event list globally.

Prove topological equality first in the exact triangulation-adapted case, then
apply N3's large-gradient comparison and N6's invariance to α+C df. Positive
rescaling preserves N1's completion. Keep the torsion of the comparison map
visible; an arbitrary quasi-isomorphism cannot substitute for the based calculation.

Use rt3 Lemmas 2.7–2.9, pp. 220–221 and §4, pp. 237–238; based large-gradient comparison is part of the construction, not a consequence of an unbased quasi-isomorphism.

The API includes:

- Successive cutoff event calculations are compatible and converge with fixed lift/Euler data.
- Continuation limits preserve the acyclic component set before applying torsion continuity.
- The exact triangulation calculation and large-gradient comparison identify the invariant with cellular torsion.

**Checks.**

- Events with drops 1,2,3,… are infinite globally but only finitely many lie below any fixed C.
- For d=2+t^m, torsion differs from 1/2 first in degree m; fixed acyclicity permits the limit.
- For the scalar differential t^m→0 in the period topology, inverse torsion t^(−m) does not tend to 0; this limit cannot be used without the acyclicity comparison.

*Needs:* §§6.1–6.2; §3.2 controlled continuation; §3.3 based cellular comparison; §4.3 torsion continuity.

### 6.4 Circle, mapping-torus and surgery calculations

Include these explicit calculations as theorems:

* S¹ with nonzero period, no critical points: CN=0, τNov=1,
  ζ=(1−t)⁻¹, and τcell=(1−t)⁻¹.
* A nonzero-period circle form perturbed to one maximum/minimum:
  for adjacent chosen lifts, d p̃=±(1−t)q̃; for arbitrary lifts include the
corresponding monomial unit factor. CN acyclic, τNov=(1−t)⁻¹ modulo signs and deck monomials, and ζ=1. The critical-free and
  two-critical-point flows have the same I, while their separate torsions differ.
* Exact α=df on S¹ with universal cyclic cover: N=0, coefficients ℤ[t,t⁻¹],
  d=±(1−t), H₀=ℤ with trivial deck action and H₁=0. Contrast both nonzero-period
  examples with ordinary H_*(S¹) tensored with the coefficient ring.
* Mapping torus of a diffeomorphism of a closed connected fiber S, with the
  downward return-map monodromy φ and the corresponding deck t. Build its
  equivariant cone `1−tφ#`; prove Lefschetz signed fixed-point counts for every
  iterate with nondegenerate fixed points and the trace/determinant identity
  `ζ=Πi det(1−tφ*|H_i(S;ℚ))^((-1)^(i+1))`.
  Here the orbit-counting ζ requires all iterates nondegenerate. For arbitrary
  monodromy define the homological zeta by its Lefschetz-number exponential;
  the same determinant formula holds, without interpreting a degenerate fixed
  set as a sum of determinant signs. Construct the Lefschetz fixed-point formula here by simplicial approximation
  on a smooth triangulation and Hopf's barycentric modification (Hopf, Math. Z. 29 (1929),
  pp. 493–524; the resulting index equality is Granas, Theorem 10.1, p. 224),
  the Hopf trace lemma and N5's continuous local fixed-point index, valid also for nonorientable
  S. Choose a finite smooth triangulation K and construct its local PL charts
  from subdivision stars and the link-sphere property of GT11's smooth
  triangulation comparison. Choose a simplicial approximation
  `a:sd^r K→K` of φ and its homotopic Hopf modification ψ. Define the finite
  chain endomorphism `T_q=a_#,q∘Sd^r_q:C_q(K;ℚ)→C_q(K;ℚ)`.
  Prove ψ has isolated fixed points and, for each q-simplex σ, its total
  interior fixed-point index is `(−1)^q (T_q)_(σ,σ)`.
  Compute the unit local contribution as `(−1)^q ε`, where ε is the oriented
  local degree (expansion along the simplex and transverse contraction).
  Include the reflected 1-simplex: ε=−1 gives index +1. Thus prove
  `Σ index(ψ)=Σ_q (−1)^q tr(T_q)` before applying the Hopf trace lemma.
  Build the finite-triangulation chain adapter here. For each finite simplicial
  complex K and commutative coefficient ring R, construct the native
  `ChainComplex (ModuleCat R) ℕ` free on the q-simplices, with basis orientations
  fixed by a vertex order and orientation reversal acting by −1, with the
  alternating face differential, basis equations, scalar extension and its
  extension by zero to `ChainComplex (ModuleCat R) ℤ`. Consume GT11's chosen
  simplex-cell CW structure on |K|, ordered characteristic maps and signed
  simplicial/cellular boundary identification. Prove this native chain adapter
  agrees with that structure and AT4.2's cellular complex and chain maps. Compose with AT4.3's cellular/singular
  comparison to obtain the homology isomorphism. Prove independence of vertex
  ordering via the orientation-change chain isomorphism, and functoriality
  for simplicial maps f. Consume GT11's cellularity of |f| for these same
  simplex-cell structures, and identify AT4.2's cellular chain map with f_#,
  with degree zero on degenerate images and
  the orientation sign otherwise. AT4.3's naturality on homology then identifies
  f_# with |f|_*, without claiming a strict cellular-to-singular chain map.
  Construct the canonical affine homeomorphism `b_r:|sd^r K|≃ₜ|K|`, mapping
  each subdivision vertex to its barycenter. Use b_r to identify the realizations
  when choosing a as an approximation of φ. Construct simplicial subdivision,
  the last-vertex chain inverse `λ_r#` and both
  composite-to-identity homotopies. Build the finite acyclic-carrier homotopy
  lemma using augmented simplex cone contractions to supply those homotopies.
  Define `λ_r:sd^r K→K` by composing one-step last-vertex maps with fixed
  vertex orders at every subdivision level, and prove it is a simplicial approximation
  of b_r: their images lie in a common original simplex, so straight-line
  interpolation within that simplex gives `|λ_r|≃b_r`. Under the homology
  comparisons, λ_r therefore induces `(b_r)_*`; the chain inverse identities
  force Sd^r to induce `(b_r)_*⁻¹`. Since `|a|≃φ∘b_r`, prove
  T induces φ_* on H_*(S;ℚ). This identifies the
  alternating homology trace with the Lefschetz number of φ.
  Use N5's chart-independent continuous index to compute ψ in its PL charts;
  compare with the smooth index through C⁰-small approximation preserving
  every isolating boundary. Prove global homotopy invariance of the total
  fixed-point index on compact S for continuous homotopies, by approximating
  them and their ends smoothly and applying the generic smooth homotopy's
  fixed-point one-manifold in S×[0,1]: its end signs `sgn det(1−df)` cancel
  without an orientation of S. Thus the PL ψ and smooth φ have the same total.
  Compare graph/diagonal intersection using AT 6's orientation local system
  in the oriented specialization. Reconcile
  the homology determinant with chain torsion and prove an equivariant version
  for a larger abelian cover under its actual support hypotheses.
* Zero-slope surgery X_K on an oriented knot in S³, using GT's meridian/Seifert
  longitude and Conway-normalized Δ_K. Construct H₁(X_K)=ℤ and the corresponding
  infinite cyclic cover. Build the knot-complement cellular/Fox or Seifert-matrix
  Alexander module, prove the polynomial/module presentation comparison, and
  attach the filling chain complex. Prove
  `τcell(X̃_K)=Δ_K(t)/(1−t)^2 mod ±t^ℤ`.
  Thus the total dynamical invariant for every admissible integral-period form
  representing the generator has this value in the correctly directed completion.
  Verify the unknot and right-handed trefoil, including t↦t⁻¹ and lift changes.

Use rt3 Examples 1.7–1.9, pp. 215–216 for the circle and mapping torus, and rt2 Example 1.4, p. 372 for zero surgery. The chain adapters and local-index proof below supply the comparisons.

The API includes:

- Mapping-torus chains are the equivariant cone of 1−tφ#, with downward monodromy fixed.
- The simplicial chain adapter, subdivision homotopies and homology comparison identify the native homology endomorphism.
- The knot-surgery complex realizes the Alexander module and the filling contributions, with the stated meridian/longitude normalization.

**Checks.**

- Circle reflection has fixed-point sum 1+1=2 and Lefschetz trace 1−(−1)=2; nontrivial rotation gives 0=1−1.
- For circle reflection monodromy, the homological mapping-torus zeta is (1+t)/(1−t); identity monodromy gives 1 for the torus. Both raw maps have degenerate iterates, so these values use the continuous-index extension, not an admissible raw orbit sum.
- The unknot has Δ=1 and surgery torsion (1−t)⁻². The Conway-normalized right-handed trefoil has Δ=t⁻¹−1+t, giving (t⁻¹−1+t)/(1−t)².

*Needs:* §6.3; Layer 5 local index; AlgebraicTopology Stages 2–7; GeometricTopology Layers 4–5 and 11.

### 6.5 Native Lefschetz signature

For a finite-dimensional smooth compact Hausdorff second-countable manifold M
modeled on a boundaryless model with corners I, and a smooth self-map f, assume
det(1−df_x)≠0 at every fixed point. Prove `lefschetz_fixed_point_formula`:
the finite sum of these determinant signs equals
Σ(i=0,…,dim M)(−1)^i tr(f_*:H_i(M;ℚ)→H_i(M;ℚ)). Neither orientability,
connectedness nor nonemptiness is required. Apply it to every positive iterate
whose fixed points are nondegenerate; the identity on a positive-dimensional
manifold is treated by §5.2's continuous index, not by dropping nondegeneracy.
In finite dimensions det(1−df_x)≠0 says that x is a `TauCeti.IsNondegenerateFixedPt`,
so the sum is finite by `TauCeti.finite_fixedPoints_of_isNondegenerateFixedPt`.

The formula is the Lefschetz–Hopf theorem for compact metric ANRs, which include
compact manifolds (Granas, Example 9.1(iv), p. 221): the total fixed-point index
equals the rational Lefschetz number (Granas, Theorem 10.1, p. 224, with the
excision, additivity and normalization properties (I), (II) and (VII) of §5,
p. 214; the rational Lefschetz number is defined in §§2–3, pp. 210–211). The same
theorem makes the index a topological invariant, so excision reduces the index of
an isolated fixed point to that of its chart expression, which is the local
homological degree of x↦x−f(x) (Granas §6, p. 215). §5.2 proves that this degree
is sgn det(1−df_x) at a nondegenerate fixed point. Hatcher §2.C, proof of
Theorem 2C.3, pp. 180–181 supplies the chain/homology trace argument of §6.4's
simplicial route; Hatcher's theorem itself asserts only that a map with nonzero
Lefschetz number has a fixed point.

**Checks.**

- A point has fixed-point contribution 1 and H₀-trace 1; the empty manifold gives 0 on both sides.
- Circle reflection has two contributions +1,+1, hence 2=1−(−1); a nontrivial rotation has no contributions and 0=1−1.
- Translation on ℝ has no fixed points but H₀-trace 1; compactness excludes this false 0=1 test.

Define `fixedPointDerivative` using `mfderiv` and transport along f(x)=x,
so it is an endomorphism of T_xM, not a map between unconnected fibers.
Its API includes:

- For a smooth f it is the intrinsic derivative with the fixed-point target identification.
- A chart change conjugates its matrix and preserves det(1−df_x).
- At a fixed point of f, the derivative of an iterate is the corresponding power.

**Checks.**

- For f(x)=−x at 0 in ℝ, the endomorphism is [−1], hence det(1−df)=2 and sign +1.
- For f(x)=2x, the determinant is −1; conjugating by x↦3x leaves it −1.
- On a zero-dimensional tangent space, the determinant is 1 even though the unique derivative is also the zero map; in positive dimension the identity gives determinant 0 and fails the hypothesis.

Define `rationalHomologyMap` as the underlying linear map of the native
singular-homology functor applied to a continuous self-map. Its API includes:

- Identity and composition agree with the native functor's maps.
- Homotopic self-maps induce equal maps.
- The finite-triangulation homology comparison intertwines this map with the simplicial chain map.

**Checks.**

- Circle reflection acts by 1 in degree 0 and −1 in degree 1, giving trace sum 2.
- A circle rotation acts by 1 in both degrees, giving trace sum 0.
- A map interchanging two points acts on H₀ by [[0,1],[1,0]], with trace 0; a constant map of the two points has trace 1, equal to its single fixed point count.

*Needs:* §6.4 finite-triangulation adapter and Hopf trace route; §5.2 local index;
Mathlib `mfderiv`, `AlgebraicTopology.singularHomologyFunctor` and `LinearMap.trace`;
Tau Ceti `TauCeti.IsNondegenerateFixedPt` and `TauCeti.finite_fixedPoints_of_isNondegenerateFixedPt`.

### Examples

The exact circle, critical-free nonexact circle and nonexact circle with a critical pair have the chain groups and torsions displayed in §6.4.

### Dependencies

N6 uses N1–N5 and the stated topology suppliers. Its unrefined comparison precedes N7; Euler-refined equality is a target of N7 only.

## Layer 7: Euler structures and coherent lift normalization

### 7.1 Euler chains and the vector-field index theorem

For χ(X)=0 define Euler chains using a nondegenerate vector field's signed zero
0-cycle: their boundary is that cycle, and two are equivalent modulo boundaries.
Construct nonemptiness from Euler=χ and H₀, the H₁(X;ℤ)-torsor action, and the
canonical comparison between different fields via the transverse zero locus of a
parameter family. Prove independence, identity and cocycle laws; no preferred
zero of this torsor is assumed. Build the combinatorial Euler-chain model from
oriented lifted cells, its subdivision transport and comparison with the smooth
model. The construction includes dimension 1 and nonorientable X. The local index
sgn det(dV_p) is independent of local orientation because domain and target
orientations change together; its signed zero-cycle is an ordinary integral
0-cycle and Euler chains are ordinary integral 1-chains. Use the positive dual
field V=α♯, whose Morse-zero sign is (−1)^ind(p), matching the alternating
cell weights. Construct the vector-field Poincaré–Hopf theorem here: compare
zero cycles through a transverse parameter cobordism with a Morse gradient,
then use MorseTheory M4 and AT Stage 7 to prove Σind(V,p)=χ(X).

Use rt3 Appendix B, Definition B.1, p. 241 for Euler-chain transport, and Milnor, Topology from the Differentiable Viewpoint, §6, p. 35 for Poincaré–Hopf.

The API includes:

- Euler-chain classes form an H₁-torsor when X is connected and χ(X)=0.
- Parameterized zero loci give choice-independent identity and cocycle comparisons.
- The Poincaré–Hopf count is valid without orientability and without χ(X)=0; that extra condition is needed for Euler chains.

**Checks.**

- The nonsingular field on S¹ has empty zero cycle, so Euler-chain classes form H₁(S¹)=ℤ with the zero chain as the field-dependent origin.
- The height gradient on S² has two zeros with determinant signs +1,+1, so the sum is 2=χ(S²); the resulting zero cycle is not a boundary.
- For V=sin θ ∂θ on S¹, derivatives at 0 and π are 1 and −1, giving 0=χ(S¹); chart reversal conjugates these derivatives and preserves their signs.

*Needs:* AlgebraicTopology Stages 2, 6 and 7; MorseTheory M4; HeegaardFloer parameter transversality; DifferentialGeometry degree.

### 7.2 Determinant volumes and refined equality

Construct the Euler-structure normalization on the alternating determinant line,
using coherent critical/cell lifts when critical points/cells are present. The
normalization is a determinant **volume**, not only a literal ordered basis of an
empty chain module. In the zero-critical-point case CN=0 has determinant line
canonically Nov; a nonsingular field supplies its Euler structure ξ₀, the volume
at ξ₀ is1, and the volume at ξ₀+h is e^(image h). This preserves the nontrivial
Euler-structure information even for the zero complex. Pin the action convention
`τ(ξ+h)=e^(image h)τ(ξ)` and prove its comparison with Euler-chain/lift changes.
Define refined τNov, τcell and I as H₁-equivariant maps from the Euler-structure
torsor to Q(Nov)/±1 with this action. Prove the refined equality and continuation,
birth/death and triangulation compatibility. A nonsingular positive dual field supplies its
particular Euler structure, even though trajectory counts use its negative flow; this choice normalizes the mapping-torus calculation.
Do not assert sign removal by a homology orientation for dynamical torsion without
building that separate sign comparison; the definite theorem here retains ±1.

Use rt3 Appendix B, Definitions B.3–B.4, pp. 241–242 and Theorem B, p. 215; the determinant-volume formulation retains the torsor action when the complex is zero.

The API includes:

- An Euler structure determines a determinant volume, compatible with critical and cell lifts.
- Translation by h multiplies refined torsion by e^(image h), with only the sign ambiguity remaining.
- Refined equality is compatible with continuation, birth/death and triangulation transport.

**Checks.**

- For CN=0, the distinguished volume is 1 but the volume at ξ₀+h is e^h; literal bases of the zero module would give 1 in both cases and lose the action.
- For a degree-zero lift change by t, the volume and torsion both acquire t; for a degree-one change both acquire t⁻¹.
- On the critical-free circle, translating the Euler structure by its downward generator sends (1−t)⁻¹ to t(1−t)⁻¹, which differs modulo sign but agrees modulo deck ambiguity.

*Needs:* §7.1; Layers 3–4 based complexes and torsion; §6.3 unrefined comparison.

### 7.3 Native vector-field index signature

Define `vectorFieldChartDerivative` by pulling the field back through the inverse
extended chart and taking its ordinary derivative at the chart coordinate of x.
The definition has a real body using `VectorField.mpullback` and `fderiv`;
its geometric API assumes a smooth field on a boundaryless smooth manifold:

- Near x the inverse chart is a local diffeomorphism, so the pullback is the actual coordinate field.
- At a zero of V, another chart conjugates this derivative; its determinant sign is intrinsic.
- For a Morse gradient the determinant sign is (−1)^index, agreeing with the signed zero cycle of §7.1.

**Checks.**

- V(x)=x and V(x)=−x on ℝ have derivatives 1 and −1 at their zeros, giving indices +1 and −1.
- For V(x)=x² the derivative is 0 at 0, so nondegeneracy fails despite isolation of the zero.
- For V(x,y)=(−x,y), the derivative has determinant −1; conjugation by (x,y)↦(−x,y) preserves −1. A model that reverses the sign under orientation reversal is excluded.

Prove `poincare_hopf` for every smooth vector field V on a finite-dimensional
compact Hausdorff second-countable smooth manifold M with a boundaryless model I:
if det(`vectorFieldChartDerivative` I V x)≠0 at every zero, then
Σ(V(x)=0) sgn det(dV_x)=Σ(i=0,…,dim M)(−1)^i dim_ℚ H_i(M;ℚ).
The derivative here is the chart derivative just defined. The sum is finite by
compactness and nondegeneracy. No connectedness, orientation or χ(M)=0 is assumed
(Milnor, Topology from the Differentiable Viewpoint, §6, Poincaré–Hopf theorem, p. 35).

**Checks.**

- The empty manifold gives 0=0; a zero-dimensional manifold of two points has two determinant-one zeros and H₀-dimension 2, hence 2=2.
- V=sin θ ∂θ on S¹ gives +1−1=0=1−1; the constant nonzero field has no zeros and the same sum 0.
- A height gradient on S² has signs +1,+1, giving 2=1+1; on the noncompact line the constant nonzero field would give 0≠1, so compactness cannot disappear from the signature.

*Needs:* §7.1 zero-locus comparison and Morse/Euler route; Mathlib tangent bundles,
extended charts, `VectorField.mpullback`, `fderiv` and rational singular homology.

### Examples

Dimension one and the zero-critical-point complex test Euler refinement independently of a nonempty chain basis.

### Dependencies

N7 first constructs the Euler torsor from index theory and ordinary homology, then uses N3–N6 for the refined dynamical/cellular comparison.

## Downstream consumers

DGFloer §7.C and §7.T consume the general completion and period-controlled complexes;
FukayaTheory's coefficient contracts and GromovWittenTheory's Novikov layer consume
N1. AlgebraicTopologyPartII §13.3 and the MorseNovikov supplier contract of
K3SurfacesAndSymplecticBoundedness consume N6's Lefschetz comparison. These consumers do not supply prerequisites here.

## Worked examples

Acceptance requires all three circle chain calculations, an irrational-period
noninjective-kernel completion example with finite tied leading coefficients,
a deck group with finite torsion and partially acyclic total-quotient components,
return-map iterate signs in both dimension parities (the three circle calculations supply odd dimension): an attracting and a
repelling orbit on a surface, and the orientation-reversing circle mapping
torus (Klein bottle) with homological ζ=(1+t)/(1−t). Check period doubling algebraically
by (1+x)/(1−x²)=1/(1−x), and the algebraic cyclic-cover norm/self-slide identities for
H=ℤ⊕ℤ/2 and h=(2,1), using divisibility 2 in H/T. For the
irrational noninjective example fix H=ℤ³ and N(a,b,c)=a+√2b,
with coefficient ring ℤ and kernel generated by (0,0,1); verify finite tied
leading supports and an infinite series whose periods escape each cutoff.
For partial acyclicity use the algebraic two-term complex over H=ℤ/2,
N=0, differential 1−g from degree 1 to degree 0: its two rational components have differential 0 and 2,
so its torsion components are 0 and 1/2. This is explicitly an algebraic
acceptance example, not an asserted geometric fibred example. Include the mapping-
torus Lefschetz/determinant comparison and the two knot-surgery examples. Every
coefficient, lift, orientation and monodromy change is checked by its naturality
formula. Suggested.lean states `lefschetz_fixed_point_formula` and `poincare_hopf`
on native manifold and singular-homology carriers. Its three supporting definitions
are `fixedPointDerivative`, `rationalHomologyMap` and `vectorFieldChartDerivative`;
all other constructions and API targets are specified in this README.

## References

* M. Hutchings and Y.-J. Lee, [Circle-valued Morse theory and Reidemeister torsion](https://math.berkeley.edu/~hutching/pub/rt2/rt2_published.pdf), Geometry & Topology 3 (1999), 369–396: completed chains, orbit signs, product formula, topological torsion and Euler structures.
* M. Hutchings, [Reidemeister torsion in generalized Morse theory](https://math.berkeley.edu/~hutching/pub/rt3/rt3.pdf), Forum Mathematicum 14 (2002), 209–244: arbitrary closed forms/abelian covers, cutoff bifurcations, finite cyclic covers and refined comparison.
* M. Hutchings and Y.-J. Lee, [Circle-valued Morse theory, Reidemeister torsion, and Seiberg–Witten invariants](https://math.berkeley.edu/~hutching/pub/rt1/rt1_published.pdf), Topology 38 (1999), 861–888: original circle-valued calculations and context. Gauge-invariant comparisons belong to their gauge-theory supplier, rather than being assumed here.
* A. Hatcher, [Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), 2002, §2.C, Theorems 2C.1 and 2C.3, pp. 177–181: simplicial approximation and the alternating chain/homology trace argument; Theorem 2C.3 asserts only the existence of a fixed point.
* A. Granas, [The Leray–Schauder index and the fixed point theory for arbitrary ANRs](http://www.numdam.org/item/BSMF_1972__100__209_0/), Bull. Soc. Math. France 100 (1972), 209–228: the rational Lefschetz number, §§2–3, pp. 210–211; the index axioms (I)–(VII), §5, p. 214; the index in ℝⁿ as a local homological degree, §6, p. 215; manifolds are ANRs, Example 9.1(iv), p. 221; total index equals Lefschetz number on metric ANRs, Theorem 10.1, p. 224.
* H. Hopf, Über die algebraische Anzahl von Fixpunkten, Math. Z. 29 (1929), 493–524: the barycentric modification of a simplicial approximation and the local fixed-point count of §6.4.
* J. Milnor, Topology from the Differentiable Viewpoint, 1965, §6, Poincaré–Hopf theorem, p. 35: the vector-field index sum.
* V. Turaev, Introduction to Combinatorial Torsions, Birkhäuser 2001; Euler structures, nonsingular vector fields, and Reidemeister-type torsions, Math. USSR-Izvestiya 34 (1990), 627–662: based torsion and lift refinement.
* A. Pajitnov, Circle-valued Morse Theory, de Gruyter 2006; J. Milnor, Whitehead torsion, Bull. AMS 72 (1966), 358–426: completed cellular comparison and based elementary chain operations.
* M. Hutchings, [family-Floer transversality correction](https://floerhomology.wordpress.com/2011/06/30/erratum-family1/): generic function/metric paths or generic horizontal connections, not arbitrary fixed function homotopies with metric variations alone.
