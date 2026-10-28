# Roadmap: Heegaard Floer homology, analytically

Heegaard Floer homology (Ozsváth–Szabó) and its knot-theoretic sibling knot Floer
homology are among the most consequential inventions of twenty-first-century
low-dimensional topology: they categorify the Alexander polynomial, detect Seifert
genus and fiberedness, bound the slice genus and unknotting number, and power most
modern progress on surgery, concordance, and contact geometry.
This roadmap is the **analytic half**: the full holomorphic
tower — Morse homology, Fredholm theory, transversality and Sard–Smale, the
Cauchy–Riemann elliptic package, Gromov compactness, gluing, Lagrangian Floer
homology, and `HF̂` via holomorphic disks in `Sym^g(Σ)`. The theories that are
combinatorial all the way down (grid homology, lattice homology, the
Ozsváth–Stipsicz–Szabó stable `HF̂`) are its companion
[Combinatorial Heegaard Floer roadmap](../CombinatorialHeegaardFloer/README.md);
the two meet at precisely-stated reconciliation theorems, which this roadmap owns
(they depend on the analytic tower, the long pole).

This is **not a linear roadmap**. It is a family of lanes with several independent
on-ramps. Suggested homes: `TauCeti/Analysis/` and
`TauCeti/Geometry/Symplectic/` (the analytic lanes), with `TauCeti/LowDimTopology/`
holding the Heegaard-diagram geometry where the analytic tower lands.

## Why this is less hopeless than folklore says

The analytic track has a reputation as a "major research project" (Patrick Massot),
and it is — but two findings, both verified against the sources, make it materially
less hopeless than the folklore suggests:

- Heegaard Floer needs **no virtual machinery**. Ozsváth–Szabó's transversality
  ([arXiv:math/0101206](https://arxiv.org/abs/math/0101206), Theorem 3.4) is
  classical Sard–Smale over nearly-symmetric almost complex structures, with Oh's
  boundary-injectivity as input, so polyfolds and virtual fundamental cycles are off
  the critical path entirely.
- The **`Sym^g` route is analytically lighter for a formalizer than the cylindrical
  one**: fixed strip domain, genus-zero disk-tree bubbling only, no Riemann mapping
  theorem, no Deligne–Mumford, no SFT compactness. The only index theorem the whole
  tower needs is Riemann–Roch-with-boundary via Robbin–Salamon spectral flow;
  Atiyah–Singer never appears.

Armstrong–Kempe's De Giorgi–Nash–Moser formalization
([arXiv:2604.05984](https://arxiv.org/abs/2604.05984), ~56k lines of Lean 4 built in
weeks from human blueprints) is an existence proof that this kind of analytic
substrate yields quickly to blueprint-driven effort.

## The end goals

- **v3 (the long game, analytic).** Morse homology; Lagrangian Floer homology of
  exact Lagrangians; `HF̂(Y)` over 𝔽₂ via holomorphic disks in `Sym^g(Σ)`.
- **Reconciliations (this roadmap owns them).** The three "the two definitions
  agree" theorems that join each combinatorial invariant to its holomorphic
  counterpart. They depend on the analytic tower, which is the long pole, so they
  live here rather than being split across both roadmaps; see the
  [Reconciliations](#reconciliations-the-seams-and-the-long-pole) section below for
  the precise statements.

```lean
-- the shape we are building toward (state in Suggested.lean as the types land):
--
-- v3: the analytic invariant for a pointed Heegaard diagram, over 𝔽₂:
-- def HFhat (D : PointedHeegaardDiagram) (hD : D.WeaklyAdmissible) (J : ...) :
--     ModuleCat (ZMod 2) := ...     -- initial ungraded homology in Sym^g
-- F4.B adds the actual relative grading; F4.5q adds its normalized torsion-Spinᶜ ℚ lift.
-- theorem HFhat_invariant : ...      -- diagram moves + J-independence, naturality-ready
```

## Standing conventions (spell them out; never bake in)

- **Ordinary Morse theory over ℤ; holomorphic theories over 𝔽₂ and then ℤ.**
  Lane M constructs integral orientation lines and signed counts, without
  requiring an orientation of the ambient manifold. The holomorphic theory has orientation systems (an
  affine torsor of choices, and a historical source of errata). State every 𝔽₂
  theorem so the coefficient ring can be generalized without restating the geometry.
- **State invariance naturality-ready.** In a proof assistant you must decide on
  day one whether "the invariant" is an isomorphism class, a group, or a transitive
  system of groups and isomorphisms (Juhász–Thurston–Zemke
  [arXiv:1210.4996](https://arxiv.org/abs/1210.4996)). Phrase invariance as
  specified isomorphisms attached to elementary moves, with composition laws stated
  as separate (later) targets, even while the first theorems prove only the
  isomorphism class. ⚠ Basepoint-moving maps act nontrivially (Zemke); do not
  quotient them away silently.
- **In the analytic lanes, hypotheses stay unbundled** exactly as in the PDE
  roadmap: totally real vs Lagrangian boundary conditions, tame vs compatible `J`,
  weak vs strong admissibility are separate named hypotheses, never a bundled
  structure.
- **Do every analytic move once, in the cleanest setting first.** Morse homology
  (Lane M) is the full Floer proof architecture at ODE cost; exact Lagrangian Floer
  (Lane F3) is the first genuine Floer homology with bubbling switched off. Each is
  a deliberate rehearsal of the moves the `Sym^g` theory needs, not a detour.

## Existing substrate (consume)

- **Singular homology** (`Mathlib/AlgebraicTopology/SingularHomology/*`, with
  homotopy invariance): the comparison target for Morse homology in Lane M.
- **Homological algebra:** `Mathlib/Algebra/Homology/*`, complexes over any
  `ComplexShape ι`, homology via `ShortComplex`, homotopies and
  `HomotopyEquiv.toHomologyIso`, **mapping cones** (`HomotopyCofiber.lean`,
  `HomotopyCategory/MappingCone.lean`), long exact sequences, Euler characteristics:
  the bookkeeping for every Floer complex and continuation map.
- **Fredholm theory:** Mathlib's
  [`ContinuousLinearMap.IsFredholm`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean)
  includes closed range, finite-dimensional kernel/cokernel, complemented kernel,
  `FredholmPackage` decompositions and continuous quasi-inverses modulo finite-rank
  errors. Consume Mathlib's `IsFredholm.index_comp`,
  `IsFredholm.eventually_nhds_index_eq` and `index_continuousOn_isFredholm`
  in [Fredholm/Open.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Analysis/Normed/Operator/Fredholm/Open.lean).
  Tau Ceti's `Analysis.Fredholm` modules add direct-sum and compact-perturbation
  formulas, continuous-family/path and Hilbert adjoint/cokernel comparisons. The strip-operator and
  nonlinear Fredholm-section constructions in F0 are new geometric consumers.
- **Sard and nonlinear Fredholm maps:** consume Tau Ceti's
  `ContDiff.addHaar_image_criticalPoints_eq_zero`, `Fredholm.NormalForm`,
  `Fredholm.Proper`, `isMeagre_image_criticalPoints_of_isFredholm`,
  `dense_compl_image_criticalPoints_of_isFredholm`, `levelSetChartedSpace`,
  `isManifold_levelSet`, and the parametric regular-value APIs. Their existing
  finite-order Sard bounds are `k≥(dim E)²+1` and, in the Fredholm reduction,
  `k≥(dim ker)²+1`; the smooth specializations are direct suppliers. F0 owns
  the sharp Fredholm bound and Banach-manifold/bundle adapters;
  DifferentialGeometry10.2 owns the sharp finite-dimensional bound and chart transfer.
- **Analysis, genuinely ready:** Banach-space calculus with **inverse and implicit
  function theorems in Banach generality**
  (`Mathlib/Analysis/Calculus/InverseFunctionTheorem/*`, `Implicit.lean`);
  **manifolds over arbitrary Banach model spaces by design** (`ModelWithCorners`,
  tangent bundles, smooth vector bundles, manifolds with boundary/corners), with
  integral curves and flows on Banach manifolds; compact operators and the
  **Fredholm alternative** (`Operator/Compact/FredholmAlternative.lean`); Arzelà–Ascoli;
  Banach–Alaoglu; Lax–Milgram; strong one-variable complex analysis (Cauchy
  integral, removable singularity, identity theorem, Schwarz lemma); Hofer's lemma
  (`Mathlib/Analysis/Hofer.lean`, whose docstring already names bubbling-off
  analysis for holomorphic curves as its purpose); Bessel-potential Sobolev spaces
  `H^{s,p}(ℝⁿ)` on tempered distributions.
  ⚠ Partitions of unity and smooth approximation require `FiniteDimensional`;
  fine for our purposes, but check before citing them in a Banach context.

## Inventory: what is missing (build here)

Consume DifferentialGeometry10.2's sharp finite-dimensional Sard refinement.
Build F0's sharp Fredholm Sard–Smale theorem and its Banach-manifold/bundle
comparisons on the existing native normal-form, level-set and parameter APIs,
and the nonlinear Fredholm-section and asymptotic-strip operator theory;
Sobolev spaces in the shape PDE needs them (`W^{k,p}`
on domains, embeddings, multiplication, Rellich: the **shared spine with the PDE
roadmap**, which builds exactly this in its Lane A); elliptic estimates for the
first-order operator ∂̄ (Calderón–Zygmund inequality, boundary regularity for
totally real boundary conditions, bootstrapping); almost complex structures and
the generic symplectic form-calculus adapters in F2.1; Morse–Smale trajectory
dynamics, stable manifolds and Morse homology. Consume MorseTheory's finite
function/sublevel theory and DG's smooth flow. Manifold orientations and degree theory are built by
the [differential-geometry roadmap](../DifferentialGeometry/README.md) (its layers 2 and 10) and
consumed here.

Consume the native incidence/domain algebra and the
[combinatorial roadmap](../CombinatorialHeegaardFloer/README.md)'s Lane H
carriers, nice moves and combinatorial complexes. F4.A–C here own their
smooth pointed cut-system realization, represented-manifold reconstruction,
Spinᶜ/Chern comparison and globally admissible presentation/connectivity.
F4.M owns the balanced multipointed geometric and analytic bridges used by
reconciliation1. These constructions consume the combinatorics and GT's
ordinary splitting theory; neither supplier asserts these smooth identifications.

---

## The lanes

The analytic foundation is PDE/domain Sobolev theory and F1's linear estimates,
then F0's nonlinear sections and genericity. M.0a's local dynamics and λ-lemma
precede F0.4, the sole owner of metric existence/genericity. M.0b consumes
that theorem; comparison with arbitrary Morse–Smale metrics is in M.5. Ordinary M.1–M.5 then precede Bott
M.6's conditional trajectory/normal-bundle constructions then precede
F0.7's Bott genericity, which precedes M.7 gluing/complex/continuation and
M.8–M.10 comparisons. F0.5 follows F1's surface estimates and precedes
the holomorphic moduli lanes; F0.6 follows M.0a's dynamics and F0.1–3,
independently of Bott complexes. The holomorphic lanes consume
these foundations; F1 is shared with the PDE roadmap. Canonical
references are named per stage because "follow the canonical text" is the only
sane formalization mode here, and every "standard gluing argument" citation in
the literature is treated as a stub to be re-proved.

### Lane M: Morse homology (Stage 0)

Work on a closed smooth real manifold with a smooth Morse function f and
metric g, using the flow of −grad f. Compactness, Morse–Smale transversality
and choices of unstable orientation are separate hypotheses. Noncompact
compact-band and relative versions carry explicit trapping/completeness
hypotheses. Consume [MorseTheory M1–M6](../MorseTheory/README.md) for native
critical points, Hessian/index, normalized charts, finite attachments,
Morse–Bott negative bundles and convergence/decay, and DG3 for maximal flows.
This lane owns ordinary Morse homology and the Bott trajectory/cascade
complexes under the transversality hypotheses specified in M.6 and F0.7. MorseTheory's attachment CW model and its
inequalities do not assume a trajectory complex.

**M.0a Local stable dynamics.** Extend the native local invariant-manifold
and exponential-dichotomy results to general C^k vector fields at hyperbolic
zeros on finite-dimensional manifold models, for each integer k≥1. Construct
C^k stable/unstable manifolds and prove C¹-continuous dependence of fixed
compact graph pieces on the vector field in the C¹ topology; for smoother
parameter families record the smooth finite-dimensional parameter theorem when the field and
parameter family are smooth. At the C¹ metric threshold, F0.4 consumes
only the stated C¹-continuity of compact graph pieces, not differentiability
of a Banach-C¹ graph assignment. Apply this to −g⁻¹df for C^k metrics and fixed C^(k+1) f
with nondegenerate critical Hessian (F0.4), without presupposing smooth
Morse-coordinate metric germs, and to
smooth metrics. Prove
their injectively immersed open-ball parametrizations, tangent eigenspaces,
flow invariance and local embedded charts; establish the global embedding
properties used for a Morse gradient, rather than inferring them from a
local graph. Prove the λ-lemma and the transverse intersection theorem.
**M.0b Standard metrics.** Consume F0.4's separate C∞ relative theorem
`smoothRelative_morseSmale_residual`, for fixed smooth f, for existence
of Morse–Smale metrics equal to the Euclidean models on fixed closed Morse
balls contained in chart neighborhoods with pairwise disjoint closures.
All-corner smooth gluing/evaluation below is first constructed for those
standard-near-critical models. M.5 owns continuation/metric comparison to
arbitrary smooth Morse–Smale metrics. Do not silently assume a smooth
compactified evaluation theorem for every metric from the local C¹ result.
In MorseTheory's normalized charts use
`f=f(p)−|x⁻|²+|x⁺|²` and the Euclidean metric, so the linear flow is
`(x⁻,x⁺)↦(e^(2t)x⁻,e^(−2t)x⁺)`. Convert the half-quadratic convention
and time/gluing parameters in
[Wehrheim's construction](https://arxiv.org/html/1205.0713v1#S1) explicitly.
For arbitrary Morse–Smale metrics, topological conjugacy transports a
chosen corner structure; it does not make the original level evaluations
smooth automatically.

**M.1 Parametrized and unparametrized trajectories.** Define entire negative
gradient trajectories with limits p at −∞ and q at +∞, the translation
action and its comparison with `W^u(p)∩W^s(q)`. For p≠q prove this action
free and proper, construct quotient charts of dimension ind(p)−ind(q)−1,
evaluation on regular level slices, and independence of those slices.
Treat empty spaces and p=q constant trajectories separately. Prove
sequential broken compactness with ordered time shifts, convergence on
compact time windows and exponential estimates uniform on compact families.
Lyapunov decrease and index drop exclude cycles of nonconstant breaks.

**M.2 Corners and gluing.** Construct compactified moduli with every
codimension-k stratum the ordered product of k+1 nonconstant trajectory
quotients through intermediate critical points. Prove Hausdorffness,
compactness and compatibility of broken convergence with this topology.
Build pregluing, uniformly bounded right inverses and nonlinear quadratic
estimates; prove the Newton correction, uniqueness and surjectivity onto
neighborhoods of each stratum. Specify the gluing profiles and corner
parameters, and prove smooth overlap maps, iterated-gluing associativity
and evaluation compatibility. Construct both the finite-dimensional
flow/slice proof and its F0 `W¹,²` Fredholm-section realization, with an
actual diffeomorphism between their regular moduli. Prove that it carries
M.3's finite-dimensional orientation to F1.4's determinant-line orientation,
including the translation factor. Use Audin–Damian,
Schwarz and Wehrheim's corner/gluing construction as proof references.

**M.3 Integral orientations and the complex.** Choose orientations of
descending spaces D(p)=W^u(p). Orient the quotient by the determinant
isomorphism with ordered factors
`TD(p)=T𝓜(p,q)⊕ℝ(negative-flow tangent)⊕TD(q)`.
Construct the line isomorphism, local-system transport and its changes under
orientation reversal. With outward-first boundary orientation prove
`∂ overline𝓜(p,q)=Σ_r (−1)^(ind(p)+ind(r)−1)`
`overline𝓜(p,r)×overline𝓜(r,q)` for the codimension-one faces;
derive higher-face signs from this same order. Construct finite signed
zero-dimensional counts, the free integral chain group on index-i critical
points and its degree−1 differential; prove d²=0 from compact oriented
one-manifolds. Give coefficient change, orientation-change chain
isomorphisms and the coefficient-free orientation-line version. Compute
the sphere with two maxima/one saddle/one minimum (including the signed
sum of maxima), the torus's opposite-pair cancellations and its integral
homology, and the nongeneric saddle connection with its perturbation.
Compute the ordinary Morse complex of ℝP² over ℤ with one generator in
each degree0,1,2, differential d₂=±2 and d₁=0, recovering H₁=ℤ/2.

**M.4 Integral geometric comparison.** Consume
[GeometricCurrents G1–G4a](../GeometricCurrents/README.md)'s integral carriers,
boundary/pushforward, transverse pullback, dimension-drop and homology
comparison, and CalibratedGeometry C2's integral smooth-chain comparison.
Construct a face-transverse smooth/geometric chain subcomplex for the
stable manifolds and all broken strata. Prove its inclusion is a
quasi-isomorphism by relative moving/approximation and prove the counting
maps respect the actual integral geometric relations. Neither real currents
nor normalized cubical coordinate degeneracies replace these integral APIs.

Construct compactified unstable manifolds with corner strata, their
fundamental integral chains and smooth evaluation maps. Prove the
compactified unstable-disc/characteristic-map theorem and the resulting
actual unstable-cell CW decomposition; compare it to MorseTheory M2's
homotopy CW tower. Construct simplex-to-critical half-trajectory spaces,
including all simplex-face and broken strata, and maps A from geometric
chains to Morse chains and D in the reverse direction. Prove
`∂ overlineD(p)=Σ_r(−1)^(ind(p)+ind(r)+1)`
`overline𝓜(p,r)×overlineD(r)`, the dimension-drop evaluation terms,
the two chain-map identities and AD=id from the positive constant
intersection. Construct the compactified forward-orbit homotopy F and
prove `dF+Fd=DA−id`. The quartic-cube truncations and octagon faces
test these identities; they are not prerequisites of the generic comparison.
Deduce the
integral Morse/singular comparison by these actual maps, with naturality.

For the Euclidean quartic `f=Σ(x_i²−1)²/4` on ℝⁿ, work on the invariant
cube [−1,1]ⁿ with face-transverse chains supported there. Its captured
trajectories and all forward-flow spaces stay in that cube; no completeness
of the flow outside the cube is used. Construct the all-broken
compactification and its actual evaluation charts using
`x'=x(1−x²)` and
`x(t)=sgn(x₀)/sqrt(1+(x₀⁻²−1)e^(−2t))` for nonzero x₀ in (−1,1).
The rates are1 at0 and2 at±1; these are not M.0b's all-rate2 germs.
Use `u=log|x|−(1/2)log(1−x²)`, with u'=1, and gluing parameter e^(−T),
checking integer-power smoothness at both ends. Identify the compactified
2-cell with the vertex-truncated square (octagon). In dimension3 truncate
vertices then edges at separated scales, proving the flag-labelled face
maps: six octagons, twelve quadrilaterals, eight hexagons, 48 vertices and
72 edges. Prove every face inclusion and its outward-first M.3 sign,
including iterated flags, and compare them with the A,D,F identities;
the f-vector alone is not the compactification theorem.

**M.5 Continuation and ordinary Cerf families.** Construct endpoint-fixed function/metric paths and
admissible parameter vector fields with positive parameter component.
Specify endpoint critical-index shifts and the universal transversality
condition; slice-wise Morse–Smale is not the parameterized condition.
Use signed compactified spaces to construct the continuation chain map,
constant-path identity and reverse-path inverse up to specified homotopy.
Construct the digon degree-one chain homotopy and the triangle composition
homotopy, together with the singular-comparison square and endpoint-relative
parameter independence. Prove the ordinary contractible-parameter-space
invariance theorem without imposing trivial monodromy on unrelated Floer
parameter spaces.

**Circle continuation counterexamples.** For θ modulo2π and δ>0 use
`f_r(θ)=δ cos(2(θ−r))`, g=dθ². Label maxima `p_j(r)=r+jπ` and minima
`q_j(r)=r+π/2+jπ`, j=0,1, and orient both maximum unstable lines by +∂_θ.
In these ordered bases prove that the Morse differential is
`D=I−S=[[1,−1],[−1,1]]`, where S exchanges the two generators. Each slice
is Morse–Smale. Fix a smooth nondecreasing ρ:[0,1]→[0,1], zero for t≤1/3
and one for t≥2/3. Use the positive parameter field
`W=t(1−t²)∂_t+2δ sin(2(θ−r(t)))∂_θ`.
For `r(t)=r₀+(r₁−r₀)ρ(t)`, and for its smooth two-piece concatenations,
all variation lies in 1/6≤t≤5/6. Put
`T=∫_(1/6)^(5/6) (t(1−t²))⁻¹dt` and choose `2δT<π/12`.
Prove that the transition diffeomorphism across this window moves every
lifted angle by less than π/12; the same estimate holds backwards.
For the specific small-δ paths below, classify the index-preserving
trajectories by endpoint basin membership.
Prove admissibility by excluding source-minimum/target-maximum connections,
and check that the remaining equal-index counts are +1 with these orientations.

For the path r=πρ, use the fixed spatial bases of the identical endpoint
function f₀=f_π. The continuation map is I in both degrees, while tracking
the critical points gives S in both degrees. Also exhibit a path with all
slices Morse–Smale that is not admissible. Keep r=πρ and vary δ. In the
flow time s, the relative angle ψ=θ−r satisfies
`ψ′=2δ sin(2ψ)−πρ′(t)t(1−t²)`. If
`2δ>max_t πρ′(t)t(1−t²)`, the strip π/4≤ψ≤π/2 traps the trajectory
starting at q₀(0). At t=5/6 its lifted angle exceeds π, whereas the small-δ
trajectory ends below π. Continuous dependence on δ gives an intermediate
value landing exactly at θ=π, a target maximum. The resulting connection
between total-field index1 critical points violates transversality. Prove
the trapping and parameter-continuity steps on the fixed finite time window.

For strict composition put β=π/3. Let Γ₁ have r=βρ and Γ₂ have
r=β+βρ, and concatenate them by r(t)=βρ(2t) for t≤1/2 and
r(t)=β+βρ(2t−1) for t≥1/2. The flat endpoint germs make this smooth.
Use the moving labels p_j(r),q_j(r) at each endpoint. Under the same
small-δ bound prove Φ₁=Φ₂=I but Φ_(Γ₂*Γ₁)=S in both degrees. The
concatenation has a finite middle plateau; it does not insert an infinite
flow time at the intermediate Morse pair. Verify these counts by the
π/6 separation from each relevant basin boundary. Construct the degree1
chain homotopy K=−I, for which `DK=KD=S−I` in the two relevant degrees.
Thus the maps agree on homology, with H₀=H₁=ℤ. The native matrix calibration
is in [`CircleContinuationTargets.lean`](CircleContinuationTargets.lean).
These examples use the positive-field construction; compare them with the
large-constant product realization through the stated M.5 comparison.

Give the birth/death and handle-slide chain changes and their comparison
with these continuation maps. Own the ordinary one-parameter Cerf theorem
here. Construct relative transversality for partial spatial jets through
order3 of smooth families f_t, fixed in endpoint germs, using localized
polynomial perturbations, finite-dimensional Sard and compact exhaustion
of jet charts. Prove a residual set has only isolated A₂ degeneracies:
`d_xf_t=0`, spatial Hessian corank1, and for a kernel vector v≠0,
`D_x³ f_t(v,v,v)≠0` and `∂_t(d_xf_t)(v)≠0`. Exclude the higher-corank
and higher-degeneracy strata by their codimensions, and prove the
parameterized normal form. This produces birth/death folds with
local potential `x₁³/3±(t−t₀)x₁−Σ_(j=2)^i x_j²/2+Σ_(j>i)x_j²/2`;
full function/metric or horizontal-lift variation gives transverse handle
slides. In that normal form require i≥1; its half-quadratic transverse
coordinates convert to M.0b's unhalved coordinates by rescaling by√2,
and the Euclidean metric/flow is transported with them. Prove the local trajectory/gluing and signed elementary chain
changes at each event. This exact-function theorem uses M.0a/F0 and M.2,
not MorseNovikov N6. Also construct comparison from standard metrics to
arbitrary smooth Morse–Smale metrics through these continuation maps.

Construct `largeConstantProductContinuation` as a second realization for
endpoint-germ-constant paths f_t,g_t on compact X. Extend them constantly
to an open interval across t=0,1. Put h(t)=(t²−1)²/4,
F(x,t)=C h(t)+f_t(x), G=dt²+g_t. On a closed inner interval choose C
larger than sup|∂_t f_t|/min t(1−t²); in the endpoint germs ∂_t f_t=0.
Thus the negative time component C t(1−t²)−∂_t f_t is positive for
0<t<1. Prove the endpoint critical/Hessian statements in the open ambient
product: the time eigenvalue is −C at0 and2C at1, giving index shifts +1
and0. Prove invariance of the compact slab X×[0,1] and completeness of
the counted trajectories there, without asserting global completeness
outside it. Take Morse–Smale endpoint pairs and apply F0.4's
`smoothSlabPotential_relativeTransversality`: retain the product metric G,
vary full potentials f_t in the inner slab with fixed whole endpoint germs,
and preserve the strict scalar inequality by C¹-smallness. This theorem
includes parameter families and compatible prescribed regular face data;
slice-wise Morse–Smale is not its conclusion.

For the positive-field comparison, rescale the product field by
`λ(x,t)=C t(1−t²)/(C t(1−t²)−∂_t f_t(x))`. It is positive, equals1
in the endpoint germs and has a smooth extension there. The rescaled field
projects to `a(t)=C t(1−t²)` and has the same oriented unparameterized
trajectories. Prove the identification of moduli, normal germs and endpoint
maps. Construct the interval base a and the ordered-triangle base
`0≤v≤u≤1`, with field `(a(u),a(v))`. Prove face invariance, hyperbolic
vertex indices2,1,0, and the compact interval of source-to-sink base orbits:
`U(u)−U(v)∈[0,∞]`, where `U(t)=log t−(1/2)log(1−t²)` and Udot=C.
Its finite endpoint0 is the direct diagonal edge; infinity is the broken
pair of the other edges. Construct the actual base charts and regularity.
This explicit two-dimensional parameter model is constructed here.

Verify regularity of the actual scalar base operators: on a0→1 orbit,
∂_s−a′(q) has index1, kernel span(qdot) and zero adjoint kernel;
on a constant coordinate it is ∂_s−C or ∂_s+2C, hence invertible.
The ordered-triangle base is their direct sum; verify every face tangent
operator and the positive diagonal normal kernel ray. Construct compatible
regular edge/face data and their whole regular closed collars, including
off-face base orbits lying entirely in those collars. Near the diagonal
use compact openness over all broken face configurations. Near the broken
two-edge face use M.0a's uniform λ-lemma and M.2's fixed-normal gluing,
right inverses, Newton correction and uniqueness/onto neighborhoods.
Use the conditional fixed-normal gradient-like gluing precursor for these
already-regular face configurations, not the later generic triangle
comparison. Make all estimates uniform over relevant critical pairs,
compact broken face strata and auxiliary faces; choose the closed collar
thicknesses only after these uniform thresholds. Regularity of the base
normal operator alone does not prove off-face collar regularity.
Construct nonempty fixed-base lift spaces by spatial patching of the
given smooth open references. All lift and comparison fields are W_Y=(Y,b)
for this same b; vary only Y, with the
specified vertex/face germs fixed. Apply F0.4's separate
`fixedRegularBaseLift_relativeTransversality`, including its auxiliary
parameter families. Do not restrict ambient residuality to this closed
lift space without that theorem's block-triangular proof.

Own `fixedBaseLift_compactifiedComparison`: construct an actual strict
Lyapunov function Mℓ−f_ext, ℓ=t or u+v. Choose f_ext=f_i on whole
vertex germs where Y=−grad_(g_i) f_i is independent of q. Bound
|df_ext(W_Y)| on the compact complement, where ℓdot has a uniform
positive minimum, and choose M sufficiently large. Prove confinement,
hyperbolic limits, all broken spaces and the fixed-normal-model
gradient-like gluing adapter.
The base orbit interval alone does not prove spatial compactification.
For the first smooth all-corner construction use M.0b's unhalved models
and a sufficiently large positive even integer C; retain the separate
comparison to arbitrary smooth Morse–Smale end metrics. Compare the
rescaled product and the reference edge by varying spatial components
with b fixed. Construct the digon/triangle spaces and endpoint maps:
edge dimensions μ(p)−μ(q), triangle dimensions μ(p)−μ(q)+1. Prove the
direct, broken-two-edge and ordinary-breaking faces, giving
∂H+H∂=F_12 F_01−F_02 with the same M.3 outward-first signs. No field
in these applications silently changes its base projection.


**M.5a Relative Morse-cobordism application.** Let X be a compact smooth
n-manifold whose boundary is partitioned into disjoint unions of connected
components X₀ and X₁, and let f:X→[0,1] satisfy f⁻¹(i)=Xᵢ, with every
critical point nondegenerate and in the interior. Let g be any Morse–Smale
metric; no orientability assumption is imposed. Attach collars at X₀ and X₁
to realize this as a compact regular band in a boundaryless manifold, and
prove the extension and its agreement with the original cobordism. For
V=−grad_g f, trajectories exit through X₀ and enter through X₁; define
stopped forward trajectories at their first X₀ exit, rather than assuming
an unstopped flow preserves X. Consume [MorseTheory M2](../MorseTheory/README.md#m2-compact-band-deformation-handles-and-cells)
for the incoming-boundary relative handle/CW model and the opposite-function
complementary-index model for the outgoing boundary. Use M.4's face-transverse relative chain subcomplex, prove its inclusion into
relative singular chains is a quasi-isomorphism by relative moving and
approximation, and track simplex faces and first-X₀-exit terms. Define A_rel
by transverse stable-manifold incidence on that moved model; define D_rel by
compactified descending manifolds modulo X₀. Prove the compactified broken
faces give the relative Morse differential and every exit face lands in X₀.
Construct the stopped forward-orbit prism F_rel and prove A_rel D_rel=id and
dF_rel+F_rel d=D_rel A_rel−id in this coherent model, then identify the
induced map with the relative singular comparison. Do not assert incidence on
every unmoved continuous singular simplex. Compare the standard-near-critical
construction to arbitrary g by M.5 relative continuation. For reversed f,
construct the complementary-index determinant-line chain/cochain comparison.
For every module-valued local system L, identify
`H^k(X,X₀;L) ≅ H_(n−k)(X,X₁;L⊗_ℤ or_X)` with cap product by `[X,∂X]`.
Consume AT6.4’s compactTriadPoincareLefschetz map with its fixed degree,
cap-boundary sign and coefficient-pairing conventions, retaining the constant
integral case. Construct direct L-valued cochains with no flatness or
reflexivity restriction. If a dual-complex model is used, distinguish L*
from L and state the actual hypotheses for an L** identification. The
comparison is between cochain/chain maps, without replacing cohomology by
Hom of homology over arbitrary rings. AT owns the generic relative cap/duality
construction.

**M.6 Bott trajectories and orientation coefficients.** For a compact
Morse–Bott function consume MorseTheory M5's normal form and negative bundle ν⁻_C
of rank λ_C. Use its determinant orientation local system o(ν⁻_C),
including rank>1 and nonorientable bundles. Construct standard normal
metrics/connections whose local negative flow fixes the base point and is
linear on the normal fibers. Build trajectory quotients with source/target
maps to critical components and dimension
`λ_C−λ_D+dim C−1`. Specify component-wise unstable/stable
transversality and transverse iterated endpoint fiber products as hypotheses
on the Bott data; prove the broken-stratum and gluing theorems under them.
The stronger condition W^u(x) transverse to W^s(D) for every x∈C is a
separate hypothesis, verified for the adapted bundle data in M.8; it is
not asserted generic. Endpoint maps need not be submersions. F0.7 owns
the permitted auxiliary-data/moving-chain transversality theorems.
Orient unstable bundles fiber first, `det TW^u(C)=det ν⁻_C⊗det TC`.
Pin the trajectory determinant identification, with negative flow orienting ℝ_flow,

`s*(det ν⁻_C⊗det TC) ≃ det T𝓜(C,D)⊗ℝ_flow⊗t*det ν⁻_D`.

Construct it from the transverse unstable/stable intersection, transporting the
normal of W^s(D) from ν⁻_D along stable fibers. Determinant lines have their
rank parity and tensor swaps use Koszul signs. For transverse α:X→T and
β:Y→T define Q=X×_T Y by the exact sequence with quotient map
`(ξ,η)↦dα ξ−dβ η`. Use subspace-first lifts and pin
`[TX][TY]=(-1)^(dim Y·dim T)[TQ][TT]`; this defines the trajectory-first
order `[TX][TT]^∨[TY]`. Prove associativity, the swap exponent
`dim X·dim Y+dim T·(dim X+dim Y)+dim T`, and the boundary formula
`∂Q=(∂X)×_T Y+(-1)^(dim X+dim T)X×_T∂Y`.
Construct all pullback/pushforward coefficient transports from these identities.
For a broken trajectory through E put `m_CE=dim 𝓜(C,E)` and e=dim E;
prove the outward-first face of the compactified trajectory space has sign
`(-1)^(m_CE+e λ_E)` on `𝓜(C,E)×_E𝓜(E,D)`.
Build the C¹ collar charts in the standard normal flow, using
`s=exp(-2t)` and the rescaled unstable coordinate, and prove that its incoming
negative-flow line gives the outward collar direction. Compare the resulting
determinant identification with the free-endpoint Fredholm determinant
precursors in F0.7/F1.4, compatibly with endpoint evaluation, translation,
parameter families and broken gluing; its isolated-point specialization is M.2.

**Oriented ambient manifold with nonorientable trajectories.** Realize the
orientation warning with `Y=S²×S¹`, `τ((x,y,z),e^(iθ))=((x,−y,z),e^(−iθ))`,
and `X=([0,1]×Y)/((1,q)∼(0,τ(q)))`. Construct the smooth mapping torus;
the two fiber orientation reversals make τ orientation-preserving, so X is
an oriented closed four-manifold. Fix 0<ε<1 and let
`f([t,p,θ])=z(p)+ε cos θ`. The four critical circles are the north/south
pole paired with θ=0,π; their negative-normal ranks are respectively3,2,1,0
in the order (N,0),(N,π),(S,0),(S,π).

Choose τ-invariant product metrics for the sphere height and scaled circle
function ε cos θ, standard in their Morse coordinates near the extrema.
Require the sphere metric to be invariant under axial rotations and meridian
reflection; construct its diagonal patching with those symmetries. Descend
the orthogonal sum with dt². Prove the product flow, M.6 regularity and standard normal
form; in particular the unstable manifold of C={(N,π)} has θ=π.
Put D={(S,π)}. Its negative bundle has rank0, whereas ν⁻_C is the rank2
sphere tangent plane with transition diag(1,−1). Its determinant orientation
line has monodromy−1. The remaining positive normal line also has
monodromy−1, so the full normal bundle is oriented, consistently with X
and the critical-circle orientation. Retain this distinction between the
negative summand and the whole normal bundle.

Prove that trajectories from C to D keep t and θ=π fixed, and that the
sphere meridians parametrize each quotient fiber by longitude φ∈S¹.
There are no broken ends in this trajectory space. The seam acts by
`(t,φ)↦(t+1,−φ)`, giving a diffeomorphism of 𝓜(C,D) with the Klein bottle.
Both endpoint maps are its projection to the base circle. Thus X,C,D are
oriented but 𝓜(C,D) is not. Identify its orientation local system with
`s*o(ν⁻_C)` through M.6's determinant identity, with the flow line oriented
by the negative-gradient flow parameter. The finite normal-monodromy
calibration is in
[`NonorientableBottModuliTargets.lean`](NonorientableBottModuliTargets.lean).
This rank2 negative-bundle example is distinct from M.7's Klein-bottle
ambient surface and its rank1 negative line.

**M.7 Bott complexes and cascades.** Construct the integral geometric-chain
complex on critical components with coefficients o(ν⁻_C) and total degree
`chain degree+λ_C`, with internal differential `(-1)^λ_C ∂` and the signed
trajectory correspondences. Identify o(ν⁻_C) explicitly with GC's rank-one
free integral local system by determinant-frame signs and prove path
transport/cocycle and orientation-reversal compatibility. Put this graded
line of degree λ_C to the left of the geometric chain. Use trajectory-first
fiber products `𝓜(C,D)×_C σ`, with M.6's exact-sequence orientation
`det T𝓜 ⊗ (det TC)^∨ ⊗ det Tσ` and its negative-bundle coefficient
transport. For `m_CD=dim 𝓜(C,D)` set `g_CD=(λ_D+1)m_CD`.
Define F_CD as `(-1)^g_CD` times the endpoint pushforward, with the output
negative-bundle line placed on the left. Equivalently, it is the outward-first
face of the unstable flowout of σ, read fiber first. Prove this equivalence;
the scalar is independent of the degree of σ. It changes unshifted chain degree
by `d_CD=λ_C−λ_D−1` and total degree by−1. The input-boundary face of
∂F_CD(σ) is `(-1)^d_CD F_CD(∂σ)`, so the internal cross-term has coefficient
`(-1)^λ_D (-1)^d_CD+(-1)^λ_C=0`, including λ_C=λ_D.
For a broken face through E put a=m_CE, b=m_ED and e=dim E. Prove
`g_CD+λ_D+a+e λ_E ≡ g_CE+g_ED+ab+e(a+b)+e+1 (mod 2)`.
This compares M.6's outward-first face with the swap of the two trajectory
factors, proving cancellation of Σ_E F_ED F_CE. Derive the same signs from
the codimension-two boundary of the unstable flowout.
Consume GeometricCurrents G3's ungraded rank-one orientation-line current
extension and F0.7's moving/genericity theorem. Its twisted boundary is the
ordinary chain boundary with flat coefficient transport; apply the shift
`(-1)^λ_C` once in the Bott complex.
Before any Bott grading shift, check the rank-one integral local system on
S¹ with generator monodromy −1. Use one vertex and one positively oriented
edge, with chosen coefficient frames, and prove its cellular differential is
`ρ(g)−id=−2`; reversing the edge changes the sign. Compare with the actual
twisted singular complex through AlgebraicTopology's local-coefficient
cellular comparison. Prove H₀=ℤ/2, H₁=0 and higher homology zero; for the
dual cochain complex prove H⁰=0, H¹=ℤ/2 and higher cohomology zero.
A twice-around traversal has coefficient `a+ρ(g)a=0`, so prove that it gives
no nonzero twisted H₁ class. Use this test for the orientation-line transport
in the reflection mapping-torus example, separately from its Bott degree shift.
Here prove
the dimension-drop identities, D²=0, and the continuation maps and
natural homotopies from F0.7's endpoint-relative parameter spaces.
Independently construct the cascade complex using auxiliary Morse–Smale
functions on the critical components, with compactification/gluing of all
intermediate cascades and coherent zero-length identifications. Prove its
comparison with a small cutoff perturbation of f, including normal-constant
extensions, uniform estimates and orientations. The cascade construction
does not require currents. Compare both constructions after their proofs.

Check the constant-function and ordinary-Morse specializations and the product
with an auxiliary manifold N, obtaining `d_Morse⊗1+(-1)^λ 1⊗∂_N`.
For the preliminary sphere example use S²⊂ℝ³ with f=z²: critical equator C
has negative-normal rank0 and the two poles have index2. Choose a metric
invariant under rotations and meridian reflection, standard near these
critical components and diagonally interpolated on the regular cylinder.
The reflection removes angular/normal cross terms; rotation alone does not.
Prove meridian flow, identify each pole-to-equator quotient with S¹ by its
endpoint diffeomorphism, and identify descending compactifications with
hemispherical disks. Choose the two unstable orientations so both signed endpoint
correspondences F_CD send their pole generator to +[C]. The component-homology differential is
ℤ²_(degree2)→ℤ_(degree1), (a,b)↦a+b; prove H₂=ℤ⟨(1,−1)⟩, H₁=0,
H₀=ℤ and the comparison with an oriented sphere fundamental class.
This two-cap example is separate from the torus arc and surgery-sphere models.
For the torus use angular coordinates (θ,φ), both modulo2π, and
`f(θ,φ)=cos θ`, with minimum circle C₀={θ=π} and maximum C₁={θ=0}.
The two negative orientation systems are trivial, with ranks0 and1. Fix
0<A<2π and a smooth periodic a supported in the upper semicircle (0,π),
with `∫₀^π a(θ)dθ=A`; construct it by normalizing a nonnegative bump.
Choose smooth positive even periodic h so that
`g=h(θ)dθ²+(dφ−a(θ)dθ)²` is standard in the signed Morse coordinates
near C₀,C₁. Prove existence of this patching and positivity (the coordinate
Gram determinant is h). Its negative gradient is
`(sin θ/h(θ))(∂_θ+a(θ)∂_φ)`. Prove the complete flow, limits and M.6
regularity, and parametrize the two trajectory components by their source φ.
Since dφ/dθ=a(θ), the upper family ends at φ+A and the lower at φ.
Thus the endpoint maps differ even though both critical circles are unchanged.
Choose the maximum-circle orientation-line frame so that the signed
correspondence is `F=(R_A)_*−id`, where `R_A(φ)=φ+A`. For a=0 the two
contributions cancel already on chains, giving the symmetric example.

On M.7's current chain carrier use the explicit rotation homotopy
`H(s,φ)=φ+sA`, 0≤s≤1, and define `P c=H_*([0,1]×c)` with the interval
factor first. Consume GC G3's interval product, pushforward and Stokes API;
prove `∂P+P∂=F`, including the smooth-chain/current comparison. The total
Bott differential is `D(x,y)=(∂x+Fy,−∂y)`. Construct the chain isomorphism
`Φ(x,y)=(x+Py,y)` to `D₀(x,y)=(∂x,−∂y)`, with inverse `(x−Py,y)`.
Check the intertwining with the actual degree shifts. The corresponding
native linear-map sign calibration is suggested in
[`TorusBottShearTargets.lean`](TorusBottShearTargets.lean).

Compute H₀=ℤ, H₁=ℤ², H₂=ℤ and zero higher homology. A cycle y in the
shifted maximum summand lifts as `(−Py,y)`; identify the resulting two H₁
generators and the H₂ generator under the ordinary torus comparison,
retaining the product-orientation sign. Extend the comparison to every
regular metric covered by M.7's continuation theorem. The explicit shear
metric supplies the nonsymmetric worked model, and the rotation prism
explains why its nonzero chain correspondence induces zero on component
homology. Check the surgery-sphere component differential separately.

For the nontrivial-orientation-line exercise use the Klein bottle
`K=([0,1]×S¹)/((1,e^(iθ))∼(0,e^(−iθ)))` and `f([t,θ])=cos θ`.
Construct its smooth quotient charts and the descended function. Its critical
circles are C₀={θ=π} of negative-normal rank0 and C₁={θ=0} of rank1.
The negative line over C₁ has reflection monodromy−1, hence is the Möbius
line; o(ν⁻_C₀) is trivial. Choose a reflection-invariant product metric,
with no dt dθ term, patched to the standard normal metrics in the signed
Morse coordinates near the two circles. Prove that it descends, satisfies
M.6's regularity conditions, and has trajectories with t constant. The two
open semicircle families are exchanged at the mapping-torus seam, so the
trajectory quotient is the connected double cover of the base circle.
Both endpoint maps are that same covering after identifying C₀ and C₁
with the base. Prove that the two sheets over each local base arc have
opposite signed endpoint contributions, using the input orientation line.
Thus the correspondence C_*(C₁;o(ν⁻))→C_*(C₀;ℤ) vanishes as a current
map, and the Bott complex is the direct sum of the ordinary circle complex
and the sign-local-system circle complex shifted by1.

Use the vertex and edge frames fixed in the preceding sign-circle test.
Its boundary−2 changes to +2 after the rank1 shift. Construct the comparison
to the finite complex `ℤ → ℤ² → ℤ` in degrees2,1,0, with
`d₂(n)=(0,2n)` and d₁=0; the degree1 basis is the C₀ edge followed by the
C₁ vertex. Compute H₀=ℤ, H₁=ℤ⊕ℤ/2 and H_k=0 for k≥2. Orient both
critical circles along increasing t. Identify [C₀] with (1,0), the fiber-circle
class with (0,1), and [C₁] with (1,1), using the unstable-interval attachment
and the mapping-torus cell structure. Thus the two sections agree modulo
torsion but differ by the nonzero torsion class. Construct the actual chain
maps and their homology identification in this comparison.
The finite quotient calibration is suggested in
[`KleinBottleBottTargets.lean`](KleinBottleBottTargets.lean).

For the four-component sphere use the unit round S² in ℝ³, height z, and
`f(z)=5z/4−z³`. Put a=√(5/12). Prove that its critical components in
increasing value order are the circle C₀ at z=−a, the south pole S,
the north pole N, and the circle C₃ at z=a. Their negative-normal ranks
are0,2,0,1 and values are `−5a/6,−1/4,1/4,5a/6`.
Use a metric invariant under rotations and meridian reflection, standard
near these components, and compare its meridian flow with the round flow.
Orient both circles by increasing longitude θ and orient ν⁻_(C₃) by +∂_z.
Orient ν⁻_S by dx∧dy in the south-pole chart given by the first two ambient
coordinates. Identify φ:C₃→C₀ by longitude, so φ_*[C₃]=[C₀].
Derive from M.6/M.7 the signed correspondences −φ_* from C₃ to C₀,
augmentation from C₃ to N, and `1↦[C₀]` from S to C₀; the two ends of
the rank-one unstable fiber have forced opposite signs. Construct the
reduction of the full geometric complex to the finite model with ordered
bases `(H₁(C₃),S)`, `(H₀(C₃),H₁(C₀))`, `(H₀(C₀),N)` in degrees2,1,0:
`D₂(a,b)=(0,−a+b)`, `D₁(c,d)=(−c,c)`.
Prove its homology is ℤ in degrees0,2 and zero otherwise, and compare
`(1,1)` with the negative of the outward-oriented sphere fundamental class.
There is no trajectory component that both receives and emits trajectories;
prove that the reduction introduces no higher transfer corrections. This is a different
function from the preceding two-cap example.

**Invariant regular-current specialization.** For a closed smooth symplectic
manifold (M,ω), a smooth circle action preserving ω, its fundamental field X
for the parameter t∈ℝ/(2πℤ), and a smooth real f with df=ι_Xω, assume f is
Morse–Bott with critical components equal to the fixed components. Supply
each negative Hessian bundle with any specified complex vector-bundle
structure on that underlying real bundle. Its complex orientation fixes the
trivialization of the negative orientation line below, and λ_C is even.
Suppose an actual invariant
smooth standard-normal Bott metric has componentwise transverse stable/unstable
manifolds and all iterated endpoint fiber products transverse. Take the fixed
transverse geometric/current presentation of M.4/M.7, with moving chains
transverse to those fixed endpoint maps and all boundary strata, actual
integral pushforward relations and its ordinary integral homology comparison.
Do not infer this invariant regular metric from arbitrary metric genericity.
For a d-dimensional input chain on C, the correspondence to D has dimension
r=d+λ_C−λ_D−1. Prove the nonzero circle fundamental vector survives the
translation quotient (df(X)=0 whereas df(−grad f)<0 on each regular level),
lifts to the source fiber product with the input fixed, and is killed by
the target derivative since D is fixed. For r=0 this forces the domain empty;
for r<0 use transversality emptiness; for r>0 tangential rank is <r. Apply
[GeometricCurrents G2–G3](../GeometricCurrents/README.md)
integral rank-drop and twisted-homology theorems, including the compactified
boundary strata, to prove every nonconstant correspondence pushforward zero.
This is equality in the specified current presentation, not equality of
arbitrary raw parametrized chains. Trivialize the negative orientation
lines by the supplied complex orientations;
even negative ranks make the internal shift (−1)^λ∂ equal ∂. Export
`invariantRegularMoment_currentDifferential_eq_boundary` and its integral
homology consequence, retaining torsion, under precisely these hypotheses.

Construct the obstruction to removing those hypotheses as an explicit compact
projective surface. Consume [ComplexKahlerGeometry K7.1–K7.2](../ComplexKahlerGeometry/README.md)'s
projective affine atlases and normalized Fubini–Study forms, with
∫_(CP¹)ω_FS=1. In CP²×CP¹ construct the incidence surface
`B={([z₀:z₁:z₂],[a:b]) | z₀b=z₂a}` and its projection to CP².
Prove it compact and smooth using the two blowup charts over z₁≠0:
`z₀=u,z₂=uv,[a:b]=[1:v]` and
`z₀=sw,z₂=w,[a:b]=[s:1]`; outside [0:1:0] the projection is an
isomorphism. Identify its exceptional sphere E with CP¹ and prove that the
restriction of `Ω=2π(π₁*ω_FS,2+ε π₂*ω_FS,1)`, 0<ε<1, is a
Kähler form, by positivity of the product form on this complex submanifold.
The circle action is
`([z₀:z₁:z₂],[a:b])↦([e^(it)z₀:z₁:e^(−it)z₂],[e^(it)a:e^(−it)b])`.
Prove it preserves B and Ω and verify, with df=ι_XΩ, the actual moment map
`f=−(|z₀|²−|z₂|²)/(Σ_j|z_j|²)−ε(|a|²−|b|²)/(|a|²+|b|²)`.
The factors2π and the chosen circle parameter are part of this normalization.
At E's lower pole `([0:1:0],[1:0])` (u=v=0) and upper pole
`([0:1:0],[0:1])` (s=w=0), f=−ε,+ε and the (normal,tangent) weights
are (+1,−2) and (−1,+2); prove both ambient Morse indices are2 from the
actual Hessian. The other two fixed points have values −1−ε,+1+ε and
indices0,4. Identify E as a component of the ℤ/2-fixed set. Every invariant
Riemannian metric makes grad f tangent to E; on E the nonconstant negative
trajectories connect its upper pole to its lower pole. Thus W^u∩W^s
contains a real surface although transverse equal-index intersections
would be zero-dimensional and flow-invariant and hence empty. No invariant
Morse–Smale metric exists. Point critical components leave no endpoint-moving
repair. Its integral homology is nevertheless perfect by the even-index
ordinary Morse attachments. This explicit projective example does not
construct a generic symplectic-blowup or Hamiltonian-perfection API.

Separately consume ConvexityToric T2's compact moment-map negative-bundle
attachment and equivariant Thom/Euler construction, with its rational
perfection theorem. Construct its comparison with M.7's ordinary homology
model and M.8's critical-value filtration using the actual negative-bundle
orientation and Thom identifications. Retain T2's separately stated integral
conclusions and their hypotheses, including the isolated-fixed-point case;
do not assert integral perfection for arbitrary positive-dimensional fixed
components. This comparison does not supply an invariant regular Bott metric
or imply vanishing of raw parametrized-chain differentials. The preceding
current-level vanishing retains every one of its regularity and presentation
hypotheses.

**M.8 Filtrations and bundle comparison.** Consume DGFloer1.3's independent
filtered-complex algebra. Construct the critical-value filtration and its
shifted critical-component homology, convergence filtration and extension
data. Construct index filtrations only under the stated index-monotonicity
hypotheses. Weak self-indexing can retain same-index trajectory terms in d₀;
do not identify E₁ with the sum of component homologies in that regime.

For the index filtration, assume every nonconstant trajectory between distinct
critical components strictly lowers the negative-normal rank λ. With total
degree p+q, identify
`E¹_(p,q)=⊕_(λ_C=p) H_q(C;o(ν⁻_C))` and
`d_r:Eʳ_(p,q)→Eʳ_(p−r,q+r−1)` for r≥1.
For a transverse cycle σ on C and λ_C−λ_D=1, prove that the trajectory
space has no broken ends. Identify the D-component of d₁[σ] with
`[F_CD(σ)]`, using M.7's signed endpoint pushforward and orientation-line
transport. For higher pages start with a leading representative x of total
degree p+q, choose corrections `τ_j∈F_(p−j) C_(p+q)`, 1≤j<r, so that
`D(x+Σ_j τ_j)∈F_(p−r) C_(p+q−1)`, and read d_r from that boundary class.
Prove independence of all choices. Fix the page identifications by this
homological representative-boundary convention, and verify the mapping-cone
and reindexing signs in DGFloer1.3's native adapter.

For the critical-value filtration, group equal values as
`a₀<⋯<a_N`, put all components at a_p in the p-th graded piece, and identify
`E¹_(p,q)=⊕_(f(C)=a_p) H_(p+q−λ_C)(C;o(ν⁻_C))`.
Prove finite convergence in both filtrations as
`E∞_(p,q)≃F_p H_(p+q)/F_(p−1) H_(p+q)`, where F_p on homology is the image
of the filtered subcomplex. Identify the abutment with ordinary homology
through M.7's comparison, and retain the extension data rather than asserting
a canonical direct-sum splitting. Construct a filtered comparison with
[MorseTheory M5](../MorseTheory/README.md#m5-morsebott-normal-bundles-and-attachments)'s
critical-band sequence: compactified unstable flowout sends a chain on C
into `{f≤f(C)}`. Use regular-value buffers between successive critical
levels and compatible relative smooth-chain comparisons to construct the
actual filtered chain maps or zigzag; prove support control in these
neighborhoods. Identify the E¹ map with the negative-bundle Thom map, hence
the spectral sequences and their abutment filtrations.

For M.7's two-cap sphere and its signed correspondence orientations, prove
that the index filtration has
`d₂:E²_(2,0)=ℤ²→E²_(0,1)=ℤ`, `(a,b)↦a+b`.
All other d_r for r≥1 vanish and E₃=E∞. For the critical-value filtration
the same map is `d₁:E¹_(1,1)→E¹_(0,1)` and E₂=E∞. Recover M.7's H₂,H₁,H₀
in both cases. For the torus `S¹×S¹` with `f(θ,φ)=cos θ`, compare M.7's
symmetric and nonsymmetric regular metrics: d₁ vanishes on component
homology, E₂=E∞, and the abutment has H₀=ℤ, H₁=ℤ², H₂=ℤ.

For M.7's four-component sphere, compute the critical-value E¹ grid:
ℤ at `(0,0),(0,1),(1,1),(2,−2),(3,−2),(3,−1)` and zero elsewhere.
The d₁ maps `(1,1)→(0,1)` and `(3,−2)→(2,−2)` are +1 in its chosen bases.
Prove E₂=E∞, with survivors at `(0,0),(3,−1)`.
The top-circle fundamental cycle alone has boundary −[C₀]; construct its
south-pole correction to obtain the actual degree2 cycle of M.7's finite
model. For the index filtration, E¹ has ℤ² at `(0,0)` and ℤ at
`(0,1),(1,0),(1,1),(2,0)`. Its d₁ maps are `c↦(−c,c)` from `(1,0)`
and −1 from `(1,1)` to `(0,1)`. Prove E₂=E∞ with survivors `(0,0),(2,0)`;
the degree2 leading term is now S, corrected by +[C₃]. In the value
filtration the drop-three correspondences induce no surviving d₃: the
zero-chain source and the one-chain target were already killed by d₁.
Compare the two induced filtrations on ordinary homology.

For a smooth bundle π:Z→B with closed fiber over a closed Morse base,
construct the pullback Bott function and its pulled-back base negative
spaces/orientation systems. Choose a Morse–Smale base metric standard on
M.0b's disjoint Morse balls. Choose a smooth Ehresmann connection equal to
the product connection of a local bundle trivialization on each ball;
construct it by relative patching. Take an orthogonal sum metric on Z,
with the horizontal part pulled back from the base and the vertical part
constant in the base coordinate on these balls. Prove that the pulled-back
gradient is the horizontal lift of the base gradient, with the standard-normal
Bott flow required by M.6. Nonconstant projected trajectories strictly lower
the base Morse index. Trivialize the negative orientation line on each
critical fiber using its fixed base negative Hessian space.

Verify M.6's actual pointwise unstable/stable transversality, componentwise
transversality and all iterated endpoint fiber-product hypotheses for this
data. Construct the trajectory-space identification
`𝓜_Z(Z_x,Z_y)≃𝓜_B(x,y)×Z_x` by horizontal lifting, extending it over
compactifications with parallel transport composing on broken strata.
Prove source/target submersivity and the dimension formula
`λ_x−λ_y+dim Z_x−1=dim 𝓜_B(x,y)+dim Z_x`.
On the index E¹ page, identify d₁ with the base Morse differential with
coefficients `L_q(b)=H_q(Z_b;ℤ)` and parallel transport along base paths.
Pin its signs against M.7's product differential, including its F_CD sign
and the orientation-line/fiber-product reorderings. Construct here the
base Morse comparison for arbitrary integral local systems using AT's
local-coefficient cellular/singular maps, without a freeness or flatness
assumption. Deduce `E²_(p,q)=H_p(B;L_q)`, naturally under changes of the
chosen critical-fiber orientation trivializations.

Build the actual filtered chain comparison with DGFloer1.2's ordinary Serre
construction, using M.4's unstable-cell CW structure on B. The lifted
unstable flowout over x lands over the closure of its base cell. Construct
support-controlled comparisons through compatible neighborhoods of the base
skeleta, rather than assuming an unrestricted current-to-singular comparison
preserves arbitrary closed supports. Identify the E¹ relative fiber/Thom
maps and the E² local systems, prove naturality from E² onward and agreement
of the abutment filtration. This uses M.4–M.7 and the independent ordinary
Serre supplier; a point-fiber specialization of a later DG-coefficient
theorem is not an input to M.4.

Include `SU(2)→SU(3)→S⁵` with block inclusion `B↦diag(1,B)` and projection
`A↦Ae₁`, constructing its smooth local trivializations. Pull back a standard
height function on S⁵: the two critical fibers are S³ with indices0 and5.
Compute H_*(SU(3);ℤ), equal to ℤ in degrees0,3,5,8 and zero otherwise,
by collapse for degree reasons, with no additive extension ambiguity.
Consume DGFloer1.2's multiplicative cohomological Serre sequence to prove
`H*(SU(3);ℤ)=Λ_ℤ(x₃,x₅)`, including the generator and product comparisons.

**M.9 Products and duality.** Construct the signed product complex and
its actual chain comparison for product Morse data. Prove Künneth with
Tor over ℤ and the local-coefficient variants. Identify opposite-function
orientation lines and the dual complex with the correct dimension shifts,
using the ambient orientation system for nonorientable manifolds. Prove
compatibility with AT products, Poincaré and relative duality, rather than
identifying only abstract homology ranks. Compare the Morse Euler/index
proof with MN N7's orientation-free Poincaré–Hopf theorem and CC C2.3's
oriented Euler pairing after the ordinary comparison is available.

With homological grading |x|=ind_f(x) and ordered factors 1 then 2,
choose product unstable orientations Wᵘ(p₁) followed by Wᵘ(p₂). The product
trajectory boundary then has the convention
`∂(x⊗y)=∂x⊗y+(−1)^|x| x⊗∂y`: in the second-factor term its flow direction
passes the |x|-dimensional first factor. Keep this sign with the integral
orientation-line and Tor comparison above.

**M.9a Geometric Morse cup product.** On any closed smooth X, including
nonorientable X, construct the ordinary cochain complex
`C^k_M(f;R)=Hom_Z(CM_k(f;Z),R)` for a commutative coefficient ring R,
with `δa=a∘∂`. Use M.3's integral orientation lines and actual coefficient
change, not `Hom(H_*(X),R)` in place of cohomology. M.9's Cartesian-product
complex and Künneth comparison are inputs; this construction owns the
internal cup product. It precedes any symplectic quantum deformation.

For one fixed standard-near-critical Morse–Smale datum construct perturbed
Y-flow spaces: the root half-trajectory has limit p0 at −∞ and two ordered
leaf half-trajectories have limits p1,p2 at +∞; their finite endpoints
agree at the vertex. Every edge solves `γdot=−grad f+Y_e(t,γ)`, with
smooth time-dependent perturbations supported in a fixed finite interval
next to the vertex and zero on the asymptotic tails. Fix the vertex time;
there is no simultaneous translation quotient. Constant tails are allowed.
Build the actual perturbation spaces and endpoint maps. Independent
localized variations on the leaf cores give the evaluation directions
needed for transversality to the vertex diagonal; prove the linearized
surjectivity and relative parameter theorem using F0, including every
broken stratum and prescribed regular face collar. Using the unperturbed
stable sets for two identical leaf data does not give that theorem.
The regular dimension is `ind(p0)−ind(p1)−ind(p2)`.

Orient the diagonal chain correspondence by the source unstable
orientation and the ordered coorientations of the two target stable
manifolds. The normal coorientation of W^s(p_i) is transported from
M.3's oriented unstable space at p_i; construct that transport and its
broken-face comparison. At the finite matching time transport the root
unstable orientation and both stable-normal coorientations by the
corresponding finite-core flow diffeomorphisms, retaining these transports
on all broken and relative faces. For the matched space use the kernel-first
exact sequence from the source unstable tangent to the ordered target
stable-normal spaces, with the quotient map induced by the endpoint
maps. This uses cooriented stable cells rather than an orientation of TX;
prove independence of charts and the orientation-line version on
nonorientable X. Compare the resulting signs with M.3 and the ordered
M.9 tensor differential. Prove compactness, finite rigid counts and the
one-dimensional oriented boundary formula by M.1–M.2 gluing and finite-core
ODE estimates. Dualize the resulting geometric diagonal chain map
`CM_*(f)→CM_*(f)⊗CM_*(f)` to obtain the R-bilinear degree-zero product,
using the ordered tensor evaluation. Prove
`δ(a cup_M b)=δa cup_M b+(-1)^|a| a cup_M δb`.

Construct the two three-leaf metric-tree families: their zero-length
internal edge is the same four-valent matching problem, while the
infinite-length ends are the two broken binary products. Choose
perturbations that agree at the collapsed vertex and on already regular
broken faces; construct their extensions, uniform finite-core bounds,
compactification and gluing before counting. Their oriented interval
and ordinary trajectory-breaking faces give the degree−1 cochain
homotopy for associativity. Construct the leaf-exchange family and its
Koszul `(-1)^(|a||b|)` comparison, and fixed-end continuation families
showing independence of the Morse datum and perturbations on cohomology.
No strictly associative or strictly commutative chain product is asserted.
With canonical index-zero orientations the sum of the minimum dual
cochains is the unit cycle; prove its two unit homotopies and transport
it under other unstable-orientation choices. Work componentwise, with
the empty/zero-dimensional cases given by the actual finite point model.

Use M.4's actual Morse/singular maps and M.9's cross-product comparison
to construct a chain homotopy between this counted diagonal and the
singular diagonal followed by the Alexander–Whitney map. Deduce a natural
unital graded-ring isomorphism with AT's ordinary H^*(X;R), compatible
with coefficient change, orientation change and continuation. Include
the integral exterior ring of the two-torus, and the mod2 projective-plane
ring `F2[x]/(x^3)`, |x|=1, together with the integral torsion comparison;
additive ranks alone do not check these products. HFO H7 owns the separate
symplectic Morse-incidence/quantum comparison, consuming this ordinary
Morse product at its constant-class endpoint. Construct these finite
flow-tree and diagonal comparisons following the perturbed-trajectory
route of [Mescher, §§1–5 and AppendixA](https://arxiv.org/html/1611.07916v1),
with the stated degree/normal-orientation conversion to M.3. The source's
oriented-manifold treatment does not supply the nonorientable comparison
without the coorientation argument required here.

**M.10 Witten comparison.** On closed manifolds construct
`d_t=e^(−tf)d e^(tf)=d+t df∧`, its formal adjoint and self-adjoint Witten
Laplacian on CKG K5a's real form-bundle Hilbert/Sobolev carrier. Compute
in an orthonormal frame
`Δ_t=Δ+t²|df|²+t Σ_(i,j)Hess f(e_i,e_j)[e^i∧,ι_(e_j)]`,
where `[a,b]=ab−ba`. Work first with Morse–Smale standard metrics of
M.0b, Euclidean near critical points. For arbitrary smooth Morse–Smale
metrics prove the semiclassical localization and integration-map comparison
by the local Hessian/quadratic-operator approximation with controlled Taylor
remainders. M.5 then identifies the resulting Morse cohomology groups;
it does not transfer an eigenvalue statement between metrics. The model `f=fp−|x⁻|²+|x⁺|²` has Hessian
eigenvalues±2, so derive the factor-of-two conversion from half-quadratic
models. No orientation is required: use K5a's orientation-twisted Hodge
star and its density formal adjoint. Prove the harmonic-oscillator local model, uniform
localization estimates, low-energy cluster rank equal to the critical
counts and a linear-in-t gap above it. On the small complex construct
`I_t(ω)(p)=∫_(D(p))e^(tf)ω` by M.4's compactified evaluation/integration,
prove its cochain identity and its eventual isomorphism with the real
Morse cochain complex. Identify de Rham/singular comparison and the
Morse inequalities through the same maps. These semiclassical estimates
are new targets; K5a supplies the generic closed elliptic realization.

### Lane F0: the nonlinear-analysis substrate

**F0.0. Generic Fredholm maps, sections and determinant lines.** Work on real
Banach model spaces with the actual normed-space and completeness instances,
and on Hausdorff Banach manifolds and Banach bundles with the stated C^k
charts and trivializations. Retain separability/second countability where
used for countable chart covers, and prove second countability of each actual
universal zero set before its parameter theorem. Start the generic theorem
in boundaryless charts; later relative, boundary and corner applications must
construct their face/collar adapters with all their prescribed data. No
finite-dimensionality of the ambient Banach model is imposed.

Consume Mathlib's `ContinuousLinearMap.IsFredholm`, `FredholmPackage`, closed
range/complement and smooth inverse/implicit-function theorems. Consume
`TauCeti.Analysis.Fredholm.NormalForm`'s `normalFormOpenPartialHomeomorph`,
`obstructionMap`, `obstructionSlice`, reconstruction identity and finite-order
smooth-inverse comparisons. Consume `Fredholm.Proper`'s actual local properness
on a sufficiently small closed neighborhood and its locally compact level sets;
this is not global properness or a compactness theorem for Floer solutions.
Existing Fredholm/index, direct-sum, perturbation and continuous-family/path
index APIs are suppliers, not targets to reconstruct. Use the smooth inverse
theorem for a C^k map, not an analytic-only inverse theorem.

Reuse `TauCeti.isMeagre_image_criticalPoints_of_isFredholm` and
`dense_compl_image_criticalPoints_of_isFredholm` on open subsets of real Banach
spaces within their actual hypotheses: complete source and target, second
countable source, pointwise C^n regularity and Fredholm derivative, and
`n >= (dim ker Df_x)^2 + 1` at every point. The native smooth case satisfies
every finite pointwise bound, even without a uniform kernel-dimension bound.
Likewise reuse `LevelSet.GlobalParametric` and
`Geometry.Manifold.VectorBundle.Section.Parametric` for their current
kernel-bound regular-parameter theorems, actual intrinsic section
linearizations, true zero-set countability, complete model/parameter/fibre
spaces and fixed-variable Fredholm plus total-surjectivity hypotheses. Reuse
their regular zero-manifold/tangent-kernel APIs where the stated smooth bundle,
nonzero regularity and nonnegative dimension/index premises apply. These
native statements do not by themselves supply the sharp finite-order result.

Own the sharp extension: a C^k Fredholm map of integer index i has residual
regular values at `k > max(i,0)`. More generally retain that pointwise inequality
when indices differ between components; an index upper bound may give a uniform
budget. Here k is a finite integer; keep the smooth specialization as well.
Regularity means surjectivity of the native bounded derivative. Consume the
single sharp finite-dimensional Sard theorem owned by DifferentialGeometry10.2
at `k > max(dim source - dim target,0)`, including its zero-dimensional and
open-domain cases. Do not replace this with the native quadratic bound or
infer kernel dimension from Fredholm index zero.

Use the native FredholmPackage normal form `(x,z) -> (x,g(x,z))`, with z in
the finite kernel and g in the finite cokernel, on the actual open coordinate
domain. Prove the derivative/surjectivity and integer-index comparisons
through its smooth inverse and bounded linear coordinate maps. For each fixed
x, the slice has dimension difference i, so sharp finite-dimensional Sard
gives a critical-value set with empty interior. Prove this in the coordinate
neighborhoods where the native maps actually agree; a total inverse outside
its partial-homeomorphism domain has no such entitlement. For closedness,
restrict the critical locus to a smaller closed neighborhood on which native
local properness applies. Prove relative closedness of the critical locus by
the finite-block derivative comparison and openness of surjectivity. A
convergent sequence of image points lies in a compact set, so local properness
gives a source subsequence and a critical limit. Equivalently carry out the
compact finite-kernel cube argument with closed pieces strictly inside the
chart. Combine closedness with the slice empty-interior statement, then use
countably many such neighborhoods to make all critical values meagre. Prove
the chart-change and actual zero-set localization comparisons. No Haar-null
Sard theorem in infinite dimensions or arbitrary-index C1 genericity is claimed.

For sections with split-surjective vertical differential at their zeros,
construct the zero manifold and tangent kernel using the native Banach IFT; in the Fredholm case
compare it with the existing finite-dimensional level-set charts. A regular
Fredholm fibre of negative index is empty; prove that branch rather than
force a natural-number dimension chart. For a universal linearization `L.coprod B`, with fixed-variable L Fredholm and total
map surjective, consume `TauCeti.parameterProj`, its exact sequence, kernel and
cokernel identifications, surjectivity criterion, Fredholm and index theorems.
Construct the actual nonlinear projection/tangent and bundle-trivialization
comparisons with that SAME linear projection, including finite parameter,
incidence and end constraints. Where a localized annihilator argument only
shows surjectivity modulo range L, use its closed finite-codimension range,
lift a finite-dimensional cokernel basis through B and combine this lifting
with L's bounded complement inverse to get a bounded right inverse for the
total map. Prove its split kernel before the section IFT. This uses the native
Fredholm splitting and parameter algebra, not a new competing generic engine.
First establish the actual C^k universal section/projection and its index;
only then apply the appropriate native or sharp theorem. Smooth parameter
choices require their own density, openness and approximation/Baire argument
in the specified topology; intersecting a Banach residual set with C-infinity
is not that argument.

Construct the reusable real determinant line
`det ker T tensor (det coker T)^*` on the native Fredholm operator carrier.
For an operator-norm-continuous family, choose a finite-dimensional target
stabilizer S at a base point and make `T plus inclusion_S : E directSum S -> F`
surjective nearby. Prove that its finite-dimensional kernels form a vector
bundle of locally constant rank, with the regularity of the supplied family,
using bounded complement inverses and native splitting/IFT. Tensor its top
exterior power with `(det S)^*`, and compare each fibre to the original
determinant through the kernel/stabilizer/cokernel exact sequence. Prove
stabilizer independence, continuous/smooth transition maps, the line-bundle
cocycle and family/pullback naturality. For composition use the actual six-term
kernel/cokernel exact sequence; prove the ordered determinant isomorphisms,
iterated associativity, dual/adjoint comparisons, direct sum with index parity
and every Koszul permutation sign. Reuse the native index and family APIs;
construct the determinant/family comparison interfaces still needed here.

Construct canonical transport of ORIENTATIONS along continuous Fredholm paths
(and hence along C1 paths) by lifting to the orientation double cover of this
line bundle. Prove identity, reversal, concatenation and endpoint-relative
homotopy laws, with the chosen initial orientation retained. A line bundle alone
does not select a canonical linear isomorphism between its endpoint fibres:
actual linear parallel transport must carry a chosen connection or
trivialization and its change-of-choice law. Do not infer such linear transport
from orientation transport. F1.4 consumes this single abstract determinant
package and owns its CR-domain, translation/parameter and analytic gluing
comparisons. InstantonFloerTheory IF3-IF4 owns the corresponding cylindrical
ASD operator, gauge and analytic gluing comparison. Neither CR estimates nor
ASD compactification nor a later Floer count is a premise of the abstract API;
DGFloer's domain/cap/seam applications pull back these same generic interfaces.

The strip-operator and moduli-space dimension/index package uses F1's
`partial_s - A(s)` convention and F1's independent linear estimates. Finite
C^ell almost-complex parameter spaces retain the actual derivative budget:
for an index upper bound N>=0 take k>=N+1 and choose ell>=k+r+1 at Sobolev
order r, then prove the universal section and regular projection are C^k
before applying Sard-Smale. Keep N,r,k,ell and every Sobolev embedding/trace
inequality explicit; stronger losses in an application remain its hypotheses.
The numbered applications below retain their separate fixed-function,
low-regularity, relative-smooth and finite-order statements.

1. Construct the actual C^k function and symmetric-tensor Banach spaces
   on compact manifolds for finite integer k, prove positive metrics form
   an open subset, and construct endpoint-fixed parameter-path spaces.
   Give finite-atlas norm equivalence, evaluation/composition regularity,
   localized perturbations and smooth density. C∞ is represented as the
   compatible smooth category, not called a Banach space.
   For every compact Hausdorff second-countable finite-dimensional smooth
   real manifold X without boundary and integer k≥2, prove that the C^k
   functions with nondegenerate Hessian at every critical point form an
   open dense, hence residual, subset of this C^k function space. State the
   property using finite-order `ContMDiff` and native
   `IsManifoldNondegenerateCriticalPoint`; native `IsMorse` includes C∞
   smoothness and is equivalent to this property only after separately
   assuming smoothness. Construct the universal cotangent-bundle section
   `S(f,x)=df_x` over C^k(X,ℝ)×X. Prove it is C^(k−1), compute its
   intrinsic zero linearization
   `D S_(f,x)(h,v)=dh_x+Hess_x(f)(v,−)`, and prove split surjectivity by
   compactly supported chart perturbations realizing arbitrary covectors.
   The x-linearization has equal finite-dimensional source and target and
   Fredholm index0. Construct the universal C^(k−1) zero manifold and its C^(k−1) parameter
   projection, and prove the projection's kernel/cokernel/index comparisons with the
   native `parameterProj` model. Prove separability and second countability
   of the C^k function space and pullback-bundle total space, and construct
   a countable atlas for the zero locus, from the finite-atlas jet norms
   and separable C⁰ section spaces on the compact chart sets. Apply this
   lane’s sharp generic-section/Sard–Smale
   theorem at index0 with the actual regularity k−1≥1. Prove openness
   separately by C² persistence near the finitely many critical points
   and a uniform positive lower bound for |df| away from those neighborhoods.
   Compare this argument with native C² linear-perturbation Sard and finite
   chart patching. Build the function-space and generic-section floors
   independently of this Morse application; no metric/trajectory genericity
   theorem or Morse approximation is an input. On smooth functions compare
   the resulting finite-C^k open dense sets with MorseTheory M3's smooth
   approximation theorem, without inferring a residual theorem on a smooth
   subspace merely by intersection. Include empty and zero-dimensional X.
2. Construct `W¹,²` path charts about fixed asymptotic reference paths,
   tangent-section charts and the L² bundle. Use normal/exponential charts,
   metric comparisons, trace and exponential asymptotics with explicit
   weights when needed. Define the gradient-trajectory section and compute
   its full vertical/universal linearization and differentiability class.
   Prove the Fredholm/splitting estimates from F1 before applying the
   section IFT; an annihilator-zero calculation alone gives only dense range.
   For fixed C^(k+1) f and C^k g, k≥1, separately construct the W¹,²→L²
   trajectory section using a fixed smooth auxiliary metric and connection,
   independent of g, for its path charts and ∇_t. Choose C⁰-small chart
   neighborhoods whose ranges stay in specified compact coordinate subsets
   along the reference path, with uniform asymptotic chart controls. Prove
   C^k regularity by W¹,²→C⁰ and uniform continuity of derivatives of
   V=−g⁻¹df through order k on those sets. Its linearization is
   ∇_t−∇^aux V, with connection/trivialization terms explicit; do not use
   the exponential chart or Christoffel regularity of a merely C¹ g.
   Prove exponential asymptotics and the continuous-coefficient
   asymptotically hyperbolic Fredholm/splitting theorem, including weighted
   choices below the endpoint spectral gaps. At k=1 these are C¹ path
   charts/sections, not a license for a high-index Sard–Smale projection.
   The finite-window proof of item4 owns metric genericity at this endpoint.
   Construct the reusable finite-dimensional version for bounded continuous
   matrix coefficients A(s) with hyperbolic limits: ∂_s−A:W¹,²→L² is
   Fredholm, with closed/split range, adjoint-ODE identification and index
   dim E^u(A_−)−dim E^u(A_+). Use half-line Green operators for the step
   limits, finite-dimensional trace matching and compact coefficient
   perturbations; construct the local compact-inclusion estimate. Include
   weights below the limiting spectral gaps. This target does not impose
   self-adjointness or a derivative of A, and does not redefine F1's
   self-adjoint spectral-flow or CZ conventions.
3. Construct universal zero sets and the regular-parameter projection,
   prove closed/split range and the kernel/cokernel/index comparison with
   the native `parameterProj` linear model. Prove surjectivity by localized
   metric variations along a nonconstant trajectory and the required
   adjoint uniqueness theorem. Separate constant trajectories and
   endpoint-fixed neighborhoods. Apply sharp Sard–Smale under the actual
   finite-order inequality; these universal-section results feed the
   metric-genericity theorem of item4 and the surface-section theorem of
   item5, rather than independently owning those conclusions. For
   gradient sections on W^(r,p) paths use finite C^ℓ metrics and C^(ℓ+1)
   functions, choose ℓ≥k+r+1, and prove C^k universal-section/projection
   regularity with this derivative budget before applying Sard–Smale.
   The low C¹ metric theorem in item4 uses finite-window arguments instead.
4. **Fixed finite-regularity Morse function.** Let X be a compact smooth
   Hausdorff second-countable boundaryless manifold, k≥1 an integer, and f
   a fixed C^(k+1) function whose critical points have nondegenerate Hessian.
   Use native finite-order `ContMDiffRiemannianMetric` for C^k metrics; the
   hypotheses on f are stated separately, since native `IsMorse` includes
   smoothness. Prove `fixedFiniteRegularity_morseSmale_residual`: the metrics
   making all stable/unstable intersections transverse contain a countable
   intersection of C¹-open dense sets in the C^k metric Banach cone.
   Consume item1's finite-atlas C^k tensor Banach space, norm equivalence
   and completeness. Prove its separability and second countability and
   the C¹-continuity of compact stable-graph pieces and finite-time
   level-hitting maps used by this proof.
   No prescribed smooth Morse-coordinate metric germs are part of this
   finite-regularity theorem: finite-order Morse coordinates can lose a
   derivative. All-corner compactification remains in M.0b's smooth branch.
   Compare this direct proof with item3's alternative universal-section
   route where its Sard–Smale budget holds. The proof here does not consume
   that route; item3 also supplies the surface and Bott genericity inputs.

   Construct density by regular-level flow slabs. Put α=−df and, off the
   critical set, a=α(V)>0 for V=−grad_g f. In C^(k+1) f-adapted coordinates
   τ=f(x₀)−f, normalize Y=V/a=(1,B). Approximate only the transverse C^k
   coefficient B by a smooth one in a smaller slab, with cutoffs retaining
   τ-velocity1. Its inner smooth Euclidean flowbox, transported back through
   the C^(k+1) coordinate map, has C^k differential. For an endpoint C^k
   diffeomorphism h close to id use the explicit displacement isotopy
   h_τ(z)=z+ρ(τ)(h(z)−z). Prove its inverse is C^k and its generator
   Z_τ=ρ'(τ)(h−id)∘h_τ⁻¹ is C^k, with support and all C^k estimates.
   Construct h by straightening the C^k target level trace, smoothing only
   the source parametrization, applying smooth finite-dimensional Sard to
   translations against a linear plane, and pulling back the endpoint map.
   In graph coordinates use the compactly supported cutoff map
   `h(x,y)=(x,y+χ(x,y)(b′(x)−b(x)))` to extend the core displacement.
   Its C¹-smallness gives an ambient C^k diffeomorphism. Do not extend by
   a normal/tubular projection of a C^k trace. Treat finitely many graph
   charts inductively, preserving earlier compact cores by C¹-openness.
   This proves local trace transversality at k=1 without applying high-order
   Sard–Smale to the unchanged low-C^k function.

   Transport the resulting Y' with α(Y')=1 and put V'=aY'. Realize it by
   the actual C^k metric
   `P'w=w−α(w)V'/α(V')`,
   `g'(w,z)=g(P'w,P'z)+α(w)α(z)/α(V')`.
   Prove symmetry, positivity, g'(V',w)=α(w), recovery g'=g where V'=V,
   C^k dependence and compact support in the regular slab. Positivity of
   α(V') and the finite-order coordinate differential are explicit premises.
   Control incoming/outgoing compact traces causally, not entire noncompact
   stable manifolds. Enumerate stable-graph compact cores, bounded hitting
   windows and regularity margins using countably many metric neighborhoods
   and rational data. Prove their transversality sets C¹-open and dense.
   Choose graph-valid parameter neighborhoods C¹-open and take countably
   many closed C¹-metric subballs inside them, intersected with the C^k
   cone, whose interiors cover those neighborhoods. Globalize with their
   complements and the local good sets. The resulting sets are C¹-open
   and C^k-dense; apply Baire in the C^k metric cone.

   Construct compact-source C∞ function and symmetric-tensor section
   spaces, on X and compact W with boundary, as the projective limits of
   item1's finite C^j Banach jet norms. Prove compatibility with native
   smoothness (within charts at a boundary), completeness, metrizability
   and separability. At boundary charts prove finite-order jet closure
   by passing segment FTOC identities to uniform jet limits on convex
   closed half-boxes and convex corner (orthant) boxes, recovering their
   within-set derivatives. Use
   native `contMDiff_infty` (∞ is all finite orders) to identify the
   projective-limit smooth carrier. Open-domain derivative-limit lemmas
   do not prove this boundary step; no common smooth extension or Seeley
   theorem is a premise. Prove positivity open already in C⁰. Fix a smooth
   global background metric realizing the prescribed models; construct
   one by positive local patching for the chosen disjoint model sets.
   Constraints of equality on specified closed Morse balls and closed
   collar subregions are closed affine subspaces. Prove their positive
   cones Baire as open subsets of these complete Fréchet spaces.

   Separately prove `smoothRelative_morseSmale_residual` there, with
   approximation in every prescribed finite list of seminorms, for fixed
   smooth f. Fix Euclidean metrics on closed Morse-coordinate balls
   contained in chart neighborhoods with pairwise disjoint closures.
   Steering occurs outside those fixed balls. This is the
   relative smooth theorem used by M.0b and M.5; it is not
   obtained by intersecting a finite-C^k residual set with the smooth subspace.
   Include compact smooth cobordisms ∂W=W₀⊔W₁ with a smooth Morse
   function f:W→[0,1], W₀=f⁻¹(0), W₁=f⁻¹(1), no boundary critical
   points, and fix the background metric on specified closed boundary
   subcollars and on the closed critical balls above. Their chart
   neighborhoods have disjoint closures and lie away from those subcollars.
   Perturb only in interior regular-level slabs disjoint
   from those fixed loci. Construct the closed affine Fréchet space of such
   fixed-collar tensors and its open positive cone; prove the same
   compact-trace dependence, interior density and countable Baire theorem
   there. Use partial flows on the boundaryless interior for the local
   steering; no complete boundaryless cylindrical extension is assumed
   in this genericity theorem.

   Own `smoothSlabPotential_relativeTransversality` separately. For compact
   parameter P of dimension d≤2 (point, interval, square or triangle),
   take smooth families f_(p,t),g_(p,t) on a neighborhood of P×[0,1], with
   Morse–Smale endpoint pairs and compatible already-regular parameterized
   face families. On static auxiliary-face collars require data constant
   in the face-normal parameter coordinates, or ambient parameterized
   regularity throughout the whole closed collar. Fixed germs mean
   equality on specified closed time/face
   subcollars inside given open smooth reference neighborhoods, not an
   unspecified shrinking neighborhood.
   Construct the fixed-germ C∞ family spaces as closed affine subspaces
   of compact-source Fréchet spaces; given open-neighborhood reference
   data and perturbations supported away from all fixed collars provide
   their ambient extension model. For one uniform C keep G_p=dt²+g_(p,t)
   product and F_p=C h+f_(p,t), h(t)=(t²−1)²/4, requiring
   C t(1−t²)−∂_t f_(p,t)>0 for 0<t<1.
   Allow full potential variations δf_(p,t)(x) in the inner free slab,
   small enough to preserve that inequality; spatial metric variations
   alone along an arbitrary fixed function path are not the argument.
   Prove universal split surjectivity using perturbations zero on an
   injective trajectory arc with arbitrary normal gradient, and the
   adjoint identity d_s⟨w,γdot⟩=0, whose endpoint value is0. Consume the
   closed-range/Fredholm theorem before the universal section IFT. For
   each window of fiber index≤N choose k≥N+d+1 and ℓ≥k+r+1 at Sobolev
   order r, prove actual regularity and apply high-budget Sard–Smale.
   Prove smooth density in every prescribed finite list of seminorms by
   smooth finite-dimensional perturbations, compact-trace openness and
   a direct countable C∞ Baire argument. Export residual parameterized
   transversality, relative to all prescribed faces, for d=0,1,2. Do not
   infer C∞ residuality by intersecting a residual finite-C^ℓ subset.

   Own `fixedRegularBaseLift_relativeTransversality` separately, with
   an actual finite-dimensional compact invariant base (Q,b) whose
   hyperbolic vertices, directed Lyapunov function, connecting-trajectory
   operators and face normal collars are supplied and regular. Consider
   only W_Y=(Y,b): all variations are spatial/horizontal. Fix specified
   closed whole vertex/face subcollars inside given smooth open reference
   data, with Morse–Smale vertex fields. These collars cover all base
   and auxiliary parameter faces. Require every trajectory lying
   wholly in the fixed closed vertex/face/auxiliary collars, including
   off-face base orbits, to be already regular as an ambient parameterized
   solution. Static auxiliary-face data must be normal-constant extensions
   of regular face data, or already regular on the whole closed collar.
   Construct the nonempty fixed-germ Fréchet lift spaces. Every remaining
   trajectory meets the open free region along a once-visited base arc,
   by the fixed-region cover and the directed base Lyapunov function.
   Its derivative is block
   triangular with blocks L_X,B;0,L_b. Horizontal variations kill the
   spatial adjoint component; adjoint-ODE uniqueness makes it zero
   globally, and actual surjectivity of L_b kills the base component.
   Consume item2's full finite-dimensional closed/split-range theorem
   before IFT. Prove residual parameterized transversality inside this
   fixed-base space for auxiliary parameter dimensions0,1,2, relative
   to the prescribed regular whole auxiliary collars, with the same high finite
   derivative budgets and direct smooth compact-window Baire proof.
   This theorem assumes the stated regular base and face data; M.5
   verifies the scalar base and constructs its applications afterward.

5. Build the regularity-loss comparisons for the surface/strip universal
   Cauchy–Riemann section and finite C^ℓ almost-complex families, including
   compact supports and relative parameter restrictions. Construct the finite
   C^ℓ carrier of sections of End(TX) satisfying J²=−id and the specified
   tame or compatible condition, with prescribed end/relative germs.
   Use pointwise anti-commuting tangent sections and conjugation charts.
   For the tame branch impose the open tameness inequality. For the
   compatible branch use symplectic conjugation; its tangent variation A
   satisfies both AJ+JA=0 and
   `ω(Au,Jv)+ω(Ju,Av)=0` for all u,v. Construct the charts within this
   restricted tangent bundle and prove they preserve compatibility.
   Prove the Banach chart, openness and composition/Nemytskii estimates.
   The smooth almost-complex carrier does not stand in for this finite-order
   parameter space. For Sobolev order r and parameter class C^k use the
   explicit budget ℓ≥k+r+1 and the other N,p embedding/trace inequalities
   from F1; prove the section and chart-transition regularity with that
   loss. For finite-order data prove bootstrapping and comparison only
   through the available derivative budget. Completion independence
   identifies the same solution spaces and regular charts on overlapping
   allowed Sobolev orders; it does not make finite-C^ℓ coefficients smooth.
   For smooth data iterate these estimates through arbitrary orders to
   obtain smooth solutions and the smooth completion comparison. Carry
   all N,p,r,k,ℓ inequalities into each genericity theorem.
6. Prove the C^k closed-return genericity theorem for general vector
   fields on every finite-dimensional Hausdorff second-countable boundaryless
   smooth manifold X, compact or noncompact, for each integer k≥1. On
   Γ^k(TX) use the compact-open C^k topology defined by a countable relatively
   compact chart exhaustion; prove it is an exhaustion-independent complete
   metrizable Baire topology. Do not call this noncompact parameter space a
   Banach space or apply Banach Sard–Smale to it. Every periodic orbit has
   compact image and a locally defined finite-time return germ. Exhaust the
   orbit data by compact chart windows with bounded return-time intervals,
   positive speed/transversality reserves, and the local-flow/derivative
   controls needed for each germ; prove each window's perturbation set is
   open and dense using compactly supported flow-box variations. Construct
   the transverse-section fixed-point problem so time translation is removed
   and the variable and target dimensions agree; verify C^1 is the required
   regularity threshold. For every iterate, prove the finite-iterate
   perturbation statement, including the resonant case, rather than assuming
   a summed variation automatically makes P^m−id transverse. Intersect over
   the countable windows and iterate bounds, and retain the equilibrium and
   short-period exclusions and continuation of isolated returns. Consume
   the local section/basepoint conjugacy germ in MorseNovikov N5's early
   return-map clause; keep its specialized −α♯ application distinct from
   this arbitrary-field residual theorem. No completeness of every field,
   bounded geometry, finite orbit set, or compactness of X is assumed.
   The resulting set of fields is dense and residual in Γ^k(TX); every
   nonstationary primitive periodic orbit and every positive iterate has a
   normal return derivative with no eigenvalue 1. Include dimension zero
   (no nonstationary periodic orbit) and dimension one (zero-dimensional
   transverse space), independently of any global flow completeness.

   Independently of item6's return theorem, for noncompact Morse
   applications require the actual hypotheses of
   MorseTheory M2's compact bands and of the chosen chain-support model.
   Properness and a lower bound are distinct: f=x on ℝ is proper but not
   bounded below and has no critical points, while H₀(ℝ;ℤ)=ℤ;
   f=arctan(x)+π/2 is bounded below but nonproper and also has no critical
   points. Its sublevels are empty for a≤0 and noncompact for every a>0
   (the whole line when a≥π). Even proper,
   bounded-below f=x²+x⁴ with the complete Euclidean metric has negative
   gradient trajectories escaping in finite backward time. Prove the
   required compact-band finite-time confinement or rescale to an actually
   complete pseudo-gradient, and specify direct-limit/locally-finite support
   and relative comparisons before any global homology assertion. Local
   Morse attachments assert none
   of these extra global hypotheses.

7. For fixed smooth Morse–Bott f on a closed manifold, construct the
   C^ℓ metric Banach space with fixed standard normal models near the
   critical components. Prove residual/dense componentwise unstable/stable
   transversality and simultaneous transversality of all iterated endpoint
   fiber products. Construct exponential-weight trajectory charts with
   free endpoint variables in TC and TD. Verify F1.5's weighted-tail
   membership for every cutoff tangent-end section on the actual Bott
   linearizations, with the required spatial and parameter derivatives.
   In the fixed standard normal models derive a positive uniform decay
   rate κ on each compact family, and choose weights smaller than both κ
   and the uniform nonzero normal-Hessian spectral gap. Construct the
   actual end-kernel bundles and cutoff maps, then prove the Fredholm index,
   extended-domain and split-range statements using F1.3–5. Prove universal
   surjectivity for each finite broken string by localized metric variations
   in disjoint regular-level windows, then sharp Sard–Smale and a countable
   compact-window argument. Keep the finite-order derivative budget explicit,
   using ℓ≥k+r+1 for C^k sections at the chosen Sobolev order r.
   Group components at a common critical value; no nonconstant trajectory
   connects them, so a false strict ordering of all component values is not
   presumed. Include relative perturbations preserving the normal models.

   Prove the endpoint-fixed one- and two-parameter transversality statements
   for continuation and its composition/identity homotopies. Use full
   interpolation data on M×ℝ and M×ℝ², constant near parameter ends/faces,
   with a parameter potential having the required positive derivative in
   each open continuation interval. Prove compact trapping, preservation of
   fixed boundary data, extended-end Fredholm and all broken-stratum
   transversality. M.7 alone owns the resulting gluing, signed continuation
   maps and small-perturbation correspondence. Follow
   [Zhou §8.1–8.3](https://arxiv.org/abs/1902.06587), Proposition8.4 and
   the relative continuation construction, converting its positive-gradient
   and stable-bundle conventions to the negative-gradient conventions here.

   Prove genericity of auxiliary Morse functions/metrics transverse to
   all cascade beginning/end maps, and face-relative moving-chain
   transversality on critical components, with boundaries and homotopies.
   [Banyaga–Hurtubise](https://arxiv.org/abs/1110.4609), definitions10–11
   and lemma12, supplies the stronger all-fixed-endpoint/submersion case.
   For the weaker iterated-transverse data, redo the localized perturbation
   and fiber-product argument without assuming a submersion, using the
   simultaneous regular-string construction above. No all-fixed-endpoint
   genericity theorem is asserted. Arbitrary Bott f also has its small
   ordinary Morse perturbation and M.3 homology; M.7 proves comparison
   with its Bott constructions.

### Lane F1: the Cauchy–Riemann elliptic package (shared with the PDE roadmap)

The PDE roadmap's Lane A/B builds `W^{k,p}(Ω)`, embeddings, Rellich, and
Calderón–Zygmund in general; this lane needs only the **2-dimensional,
first-order-elliptic-system slice** (McDuff–Salamon, Appendix B), and should
consume the shared spine rather than duplicate it:

1. Construct the finite-chart W^(k,p) surface/bundle adapters, trace and
   multiplication (`kp>2`), using the PDE carriers. Include bordered and
   cylindrical-end surfaces, totally real subbundles and actual transition
   maps. Prove norm equivalence, density, parameter dependence and the
   nonlinear composition estimates used in F0/F2.
2. Prove the Cauchy-kernel interior estimate
   `‖u‖_(W¹,p(K))≤C(‖∂̄u‖_(Lp(U))+‖u‖_(Lp(U)))` for K compact in U,
   1<p<∞, and its variable-coefficient/lower-order and bundle versions.
   Consume PDE Lane A7's Banach Hölder spaces. Prove their product
   estimates and local composition/inversion estimates, retaining the
   derivative budget for changes of variables at each finite order. Construct the planar Cauchy–Green and Beurling
   operators with their Hölder bounds: on nested discs and compactly
   supported C^(k,α) data, 0<α<1, the Cauchy right inverse gains one
   derivative locally and the Beurling operator B=∂T is bounded
   on C^(k,α), for every integer k≥0. Specify support radii, cutoff/extension
   operators, normalization of the holomorphic kernel and constants in the
   estimates. Prove ∂̄T=id, ∂T=B, differentiation on compactly supported
   data and continuity for parameter families with common support and norm bounds.
   For an elliptic Beltrami coefficient |μ|<1, use real-linear normalization
   to arrange μ(0)=0. In rescaled coordinates
   μ_ε(z)=χ(z)μ(εz) tends to0 in C^(1,α). On the closed Banach subspace
   of C^(1,α) data supported in one fixed closed disc containing supp χ,
   solve h=μ_ε(1+Bh) by contraction.
   For ψ=z+Th prove positive Jacobian and local invertibility from its
   C¹ closeness to identity. Subtract its value at0 and divide by its
   nonzero complex derivative there; μ_ε(0)=0 makes that normalization
   complex-linear. Rescale back to obtain C^(2,α) local coordinates for
   C^(1,α) coefficients. Bootstrap smooth coefficients to smooth coordinates. These planar
   operators and estimates are targets here, beyond the Lp estimates.
   Construct the normalized real-boundary disc solver before nonlinear
   coordinate changes. For p>2 let X be the closed real subspace of
   W^(2,p)(D,ℂ^n) whose trace lies in e^(3iθ/2)ℝ^n, with its inherited
   Sobolev norm; let Y=W^(1,p)(D,ℂ^n)×ℂ^n×ℂ^n with product norm.
   Prove completeness, bounded trace and center/first-jet evaluation, and
   that ξ↦(∂̄ξ,ξ(0),∂sξ(0)) is a bounded real-linear isomorphism.
   First construct the boundary analytic input: the M. Riesz/Szegő
   projection on the W^(2−1/p,p) trace space and the Cauchy boundary
   extension estimates, with the totally real reflection comparison.
   Use them with the interior estimate to solve the boundary problem
   with W^(2,p) regularity. Fourier modes compute the kernel of the
   unaugmented ∂̄ as a₀+a₁z+conj(a₁)z²+conj(a₀)z³, componentwise;
   the center and first-jet constraints determine those coefficients. On the closed boundary
   subspace of C^(1,α)(D,ℂ^n), prove the same augmented map is a Banach
   isomorphism onto C^α(D,ℂ^n)×ℂ^n×ℂ^n. Use Privalov-type
   boundary estimates for existence and C^(1,α) regularity up to the
   boundary; the open mapping theorem then bounds the inverse.
   Apply this inverse to the inhomogeneous real-boundary operator
   ∂̄u+A(z)∂u+B(z)u with prescribed center and first jet, small
   C^α coefficients and arbitrary C^α forcing, including forcing
   outside W^(1,p). Prove its bounded inverse and parameter dependence
   by the Neumann series. Export this as a standalone local Hölder boundary-problem API;
   identify its Sobolev realization on common data when regularity permits.
   These direct disc constructions use no closed-surface RR theorem.
   Cite existing work in [t4v1/damian_formalizare](https://github.com/t4v1/damian_formalizare),
   MorseFloer/Part2/CauchyPompeiu.lean and CauchyHolder.lean, for its Cauchy/Beurling
   Hölder-scale development. Compare its differential/kernel normalization
   with ∂̄=(∂s+i∂t)/2 here. Any code integration follows the repository's
   author-coordination and licence requirements.
   Construct boundary flattening/reflection for totally real conditions,
   boundary estimates with the stated coefficient/trace regularity,
   bootstrapping and weak-to-smooth regularity. A global estimate omitting
   the Lp/kernel term requires separate coercivity or normalization.
   Construct the real CR line-bundle similarity principle: a solution which
   is not identically zero on a connected closed Riemann surface has isolated
   zeros of positive integer order, whose sum is the line bundle's c₁.
   Prove local factorization, unique continuation, coordinate/frame invariance
   and weak-solution regularity. Construct formal adjoints and identify
   dual-Sobolev cokernel functionals with smooth adjoint solutions. The
   formal adjoint is a ∂-type operator on (0,1)-forms; use the metric/density
   and conjugation to put it into the CR-system form. Prove weak regularity
   and unique continuation with locally L^p coefficients for p>2,
   including locally bounded coefficients. Export the standalone local
   vector similarity theorem: a ℂ^m-valued W^(1,p) solution of
   ∂̄ξ+Aξ+Bconj(ξ)=0, with locally L^p matrix coefficients and
   p>2, is an invertible W^(1,p) matrix times a holomorphic vector
   on a sufficiently small disc. F2.2a/c use this theorem. Absorb the antilinear
   term for a given solution into an L^p (p>2) matrix coefficient with
   pointwise norm at most that of the antilinear term, solve the
   small-disc Cauchy integral equation for an invertible similarity frame,
   and reduce to a holomorphic vector. A nonzero adjoint solution therefore
   has a dense nonzero locus. Retain the coefficient/Sobolev hypotheses.
   These linear constructions precede nonlinear intersections and moduli;
   map unique continuation is not a substitute for the adjoint theorem.
3. Own spectral flow for real or complex self-adjoint Fredholm families
   on a fixed Hilbert space. Consume
   [SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md)'s
   unbounded spectral measure SA-E01, common-domain graph calculus and
   native `Resolvent.Unbounded`. Construct spectral flow from its finite spectral projections
   and prove partition independence, concatenation, direct sum, reversal,
   endpoint-fixed homotopy and the regular-crossing formula (positive
   crossings count positively). Include unbounded families with common
   dense domain D compactly embedded in H, a fixed graph-equivalent
   Hilbert norm on D, C¹ dependence in `D→L H`, self-adjointness on D
   and limits at ±∞ in L(D,H), invertible as maps D→H. Supply
   uniform graph-norm estimates, dichotomies and adjoint-cokernel control.
   The operator `∂s−A(s)` on `W¹,²(ℝ;H)∩L²(ℝ;D)` is Fredholm with
   index `−SF(A)`; prove the actual domain/range estimate and index theorem.
   Give graph-gap transport for changes of trivialization satisfying those
   domain hypotheses, not an assertion for arbitrary discontinuous domains.
   Check A(s)=tanh(s): kernel0, cokernel span(sech(s)), index−1.
   Construct escaping approximate kernels when a limiting eigenvalue is0
   and prove the resulting failure of Fredholmness. Use finite-time evolution
   and dichotomy projections, not a normalized-limit map that loses linearity.
4. Consume the native loop invariant
   [`TauCeti.TotallyRealLoop.maslovIndex`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/LinearAlgebra/TotallyReal/Maslov/Index.lean),
   its phase-degree/half-turn normalization, framed homotopy invariance,
   [`maslovIndex_map`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/LinearAlgebra/TotallyReal/Maslov/Map.lean)
   and [`maslovIndex_prod`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/LinearAlgebra/TotallyReal/Maslov/Prod.lean).
   Construct the boundary-loop/frame adapter on this carrier. For
   Lagrangian loops compare the native phase-degree integer with the
   closed-loop specialization of the Robbin–Salamon path index. For a
   general maximal-totally-real loop construct the required homotopy
   to Lagrangian planes in a chosen Hermitian trivialization: choose
   real-orthonormal frames of its real tautological bundle over the cut
   interval, with orthogonal endpoint monodromy, and polar-deform their
   complex frames to unitary frames. Prove equivariance under that
   monodromy, closed-loop continuity and preservation of the native
   phase degree before using the Lagrangian RS comparison. Build the remaining path and
   Conley–Zehnder theory with crossing normalization, homotopy,
   concatenation, direct sum, trivialization-change and gluing laws.
   The path/RS/CZ theory and this native-loop comparison have this single
   owner; DGFloer7 consumes its graph/Robbin–Salamon construction. Normalize the CZ index of `exp(t J S)` for sufficiently
   small nondegenerate symmetric S to `−signature(S)/2`; in particular
   a small positive rotation on ℝ² has index−1. For the Hamiltonian
   convention `ι_(X_H)ω=dH` used by DGFloer this gives
   `CZ=n−ind_Morse(H)=ind_Morse(−H)−n`. Our CZ is explicitly
   `−μ_RS`; retain the standard sign of the Lagrangian Maslov index in
   bordered Riemann–Roch. In `(-ω)⊕ω` relative to the diagonal, pin
   `CZ(Ψ)=−μ_RS(graph Ψ,Δ)`. Prove the graph/crossing-form comparison.
   Check `ω=dx∧dy`, `H=ε(x²+y²)/2`, ε>0 small: X_H is clockwise,
   S=−εI and CZ=+1. The small Floer trajectories are negative gradient
   trajectories of −H, consistent with the degree shift FH_*≃H_(*+n). For negative-gradient
   trajectories use A=−Hess f, yielding index ind(p)−ind(q).
   Consume F0.0's single Fredholm determinant line, dual/adjoint,
   exact-sequence and orientation-double-cover transport interfaces. Construct
   their actual CR/Sobolev-domain and analytic gluing comparisons here,
   with translation and parameter factors explicitly ordered as in M.3.
   Any linear fibre transport carries its chosen connection/trivialization;
   it is not supplied by the orientation transport alone.
5. Prove closed and bordered real Cauchy–Riemann Riemann–Roch:
   `ind_R D=nχ(Σ)+2c₁(E)[Σ]` in the closed case and
   `ind_R D=nχ(Σ)+μ(E,F)` for a totally real rank-n boundary subbundle.
   Here χ is the finite CW Euler characteristic. Consume
   CharacteristicClasses C2.3's diagonal-self-intersection/duality trace
   comparison with the alternating Betti sum and C3.2's rank-one `c₁=e`.
   AlgebraicTopology Stage7.1's Euler–Poincaré equality and independence
   of a Hausdorff finite CW model identify that Betti sum with χ_CW.
   Apply them to the same `compactManifoldFiniteCWType` used by
   FuchsianOrbifolds Layer5, obtaining `c₁(TΣ)[Σ]=χ_CW(Σ)` with the
   complex/oriented fundamental class and its branched-cover convention.
   Work over ℝ and use AlgebraicTopology Stage6.1's universal coefficient
   theorem over the field, together with duality, to compare cohomology
   dimensions with homology ranks. The finite-CW witness
   is AlgebraicTopology Stage8.7's compact smooth-manifold corollary, which
   consumes GeometricTopology's smooth triangulation; HF constructs no
   second triangulation. This uses no Morse homology or nonlinear moduli.
   Prove the closed formula for an arbitrary given complex structure j
   on the surface, independently of uniformization. Construct the local
   parametrix, the fixed-Sobolev Fredholm family under deformations of j
   and the zeroth-order coefficients, and the cut/glue index comparison
   along a smooth surface decomposition with collars. Compute the local
   Euler and clutching contributions using the bordered linear theorem
   and determinant gluing. No nonlinear curve-moduli or genus-zero
   classification theorem is an input to this linear index proof.
   Build relative c₁ from end/boundary trivializations and its independence,
   excision and clutching laws, consuming CharacteristicClasses C3.2's
   c₁ and determinant-line comparison. Own the elementary symplectic-bundle
   clutching construction independently of DGFloer: prove triviality over
   a disc and over an oriented surface minus a disc from connectedness of
   Sp(2n), choose compatible complex/unitary structures and the transition
   g expressing the complement frame in the disc frame along the positively
   oriented disc boundary. Define the number by `wind(det g)` and prove
   choice/homotopy independence and equality with topological c₁ pairing.
   Pin the graph-loop Maslov number as twice this winding. For frame
   change e′(t)=e(t)g(t), prove `CZ_(e′)=CZ_e+2wind(det g)`, using
   the coordinate path g(t)⁻¹Ψ(t)g(0) and CZ=−μ_RS. Check c₁(TS²)[S²]=2.
   DGFloer consumes this construction/comparison and supplies no input to it. Extend to punctured surfaces with ends
   `(s,t)∈[R,∞)×S¹` positive and `(-∞,-R]×S¹` negative, with complex
   orientation ds∧dt, `A_e=−J∂t−S_e(t)` and `D=∂s−A_e` asymptotically.
   For complex rank n and the CZ convention of F1.4 prove
   `ind_R D=nχ(Σdot)+2c₁^τ(E)−Σ_(e positive)CZ^τ(A_e)+Σ_(e negative)CZ^τ(A_e)`.
   Define CZ(A_e) by the symplectic path solving `Ψ'=J S_e Ψ`, using
   that convention. For the decay weight exp(δ_e|s|), conjugation replaces
   A_e by A_e+δ_e at a positive end and A_e−δ_e at a negative end;
   use those shifted operators in the same formula. As a decay weight
   increases through one exceptional value, the Fredholm index decreases
   by the crossed real eigenspace multiplicity, at either end. Prove the
   formula by gluing and test scalar crossing, trivial cylinder, capped
   disk and constant closed sphere. When A_e has a zero eigenspace,
   choose positive weights smaller than every nonzero end spectral gap.
   Fix the actual end trivializations and cutoff extension E_e(v)=χ_e v
   of each v∈ker A_e. Before adjoining these variables, require and prove
   the weighted-tail condition `D(E_e(v))∈W^(r−1,p)_δ` and its bounded
   linear dependence on v, with the required C^k parameter estimates.
   A sufficient geometric hypothesis is convergence of the operator
   coefficients and trivializations to their limiting forms at rates
   κ_e>δ_e through every spatial and parameter derivative needed by
   those estimates; prove the resulting bounds. An exponential rate
   with no relation to δ_e is insufficient. The explicit weighted-tail
   condition also covers operators not specified by one decay rate.
   On constant-nullity parameter ranges construct the actual kernel
   bundles, cutoff maps and these estimates uniformly on compact
   parameter sets. Handle nullity changes by the separate spectral/weight
   crossing theorem, rather than asserting a fixed-rank kernel bundle.

   For a specified subset S of ends define the bounded operator
   `D_extended(ξ,(v_e))=Dξ+Σ_(e∈S)D(E_e(v_e))`
   on `W^(r,p)_δ ⊕ ⊕_(e∈S)ker A_e`, with the unchanged weighted target.
   Construct its exact kernel/cokernel sequence relative to D_weighted,
   prove Fredholmness and
   `ind D_extended=ind D_weighted+Σ_(e∈S)dim_R ker A_e`, and derive the
   determinant-line comparison from that sequence, with the end factors
   ordered by the declared end labels. Prove independence under admissible
   cutoff/trivialization changes by actual bounded families. Use precisely
   the chosen free endpoint variables in each Bott application; F0.7
   verifies the weighted-tail conditions before consuming this theorem.
   These linear theorems precede
   the moduli-space dimension and orientation applications.

### Lane F2: J-holomorphic curves

McDuff–Salamon (*J-holomorphic Curves and Symplectic Topology*, 2nd ed.) as spine,
with boundary versions from Oh and Floer–Hofer–Salamon:

1. **Symplectic and almost-complex foundations.** Consume Tau Ceti's
   compatible/tame J, J-holomorphic maps and the implemented
   `Geometry/Symplectic/Manifold/Energy` and `JHolomorphic/Energy` theory.
   State the new form calculus on DifferentialGeometry 0.4's common
   `SmoothForm I M ℝ 2` carrier; consume its migration comparison
   with the pinned `SmoothTwoForm`. Consume exterior derivative in 1.1 and
   pullback in 0.3, with its exterior-derivative naturality in 1.2, Lie
   derivative/Cartan in 1.4, autonomous flow domain/smoothness/composition in 3.2–3.4 and local
   exactness in 6.1–6.2. Use `RoughForm.interior` for `ι_Xω=ω(X,·)`.
   Build the shared strongly nondegenerate contraction inverse and smooth base
   dependence required here, following
   [HamiltonianSystems Layer1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/480)'s
   existing design. This missing prerequisite is an explicit F2.1 target in
   Tau Ceti's shared symplectic API; the Hamiltonian df case and the generic-
   form migration consume that same construction. The inverse prototypes pin
   the transport interface. Prove their comparison
   through the generic-form migration. Its linear-equivalence
   interface acts on arbitrary covectors. For
   `J : TopologicalSpace.Opens ℝ`, give this construction on the vertical tangent
   bundle over `↥J × M` for a smooth two-form family with nondegenerate slices;
   prove joint smoothness of the inverse. Pin its df specialization to
   `hamiltonianVectorField`, with `ι_(X_f)ω=df`, and use that same inverse on
   general one-forms to construct the Moser field.

   Prove the **domain-local Moser lemma**: for a smooth symplectic family
   ω_t and smooth one-form family α_t on an open time interval containing
   [0,1], with `∂_tω_t=dα_t`, the time-dependent field determined by
   `ι_(X_t)ω_t=−α_t` has `φ_t*ω_t=ω_0` wherever its flow exists through
   [0,1]. Represent families by smooth forms on `↥J × M`, where
   `J : TopologicalSpace.Opens ℝ` contains [0,1],
   with slice forms obtained by `mpullback` along x↦(t,x); define their
   time derivative slice-wise; closedness and nondegeneracy apply to these
   vertical slices. Consume DG 3.5's full maximal time-dependent flow, including
   two-time composition, joint smoothness, inverses and the compact-time escape
   criterion, to obtain compact global flow through [0,1]. Prove the time-dependent pullback differentiation
   identity and the corresponding restriction/naturality statements.
   Derive the smooth-parameter local primitive corollary from DG 5.4's
   homotopyOperator under radial chart contraction centred at x₀, with
   primitive vanishing at x₀, using its smooth regularity and slice naturality.
   Darboux uses the affine form path and one such
   primitive; the parameterized lemma is the interface for C4's families. Prove **Darboux** on
   finite-dimensional boundaryless manifolds using this local
   Moser lemma, shrinking the domain to guarantee flow through [0,1].
   Every point has a partial diffeomorphism pulling back a constant
   nondegenerate form to ω. Consume
   `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, `IsAlt.even_finrank`
   and `exists_basis_apply_eq_J_inl_zero_eq` from Tau Ceti's symplectic-basis API.
   Build the continuous-linear symplectic transport to `stdSymplecticForm` on
   `EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n)`: send b(inr a) to
   (e_a,0) and b(inl a) to (0,e_a), so both forms evaluate to +1 in that order.
   Compose this transport with the local Darboux chart to give the standard-model
   Darboux corollary.

   Prove **global Moser** on compact finite-dimensional Hausdorff manifolds with
   boundaryless model (`[T2Space M]` and `[I.Boundaryless]`): the given
   families produce an isotopy from the identity with `φ_t*ω_t=ω_0`.
   Prove smooth-family primitive selection for exact positive-degree forms
   on compact manifolds as a separate target. Compactness gives sigma-compactness;
   the finite-dimensional model with corners supplies second countability of H,
   so `ChartedSpace.secondCountable_of_sigmaCompact` provides the manifold
   hypothesis needed by B6. Consume SmoothBundlesConnections
   B6.0's finite smooth good cover and B6.1's real-constant Čech–de Rham
   comparison. Run the exported smooth contractions
   and partition-of-unity zig-zag on slices of J×U_i, proving smooth dependence
   by differentiation under the homotopy integral. Its final finite-dimensional
   Cech cocycle of constants is a coboundary because the input is exact.
   Choose a fixed linear right inverse of the Cech coboundary on its image;
   apply it to the smooth parameter functions and back-substitute through the
   zig-zag. Prove the resulting one-form primitive varies jointly smoothly.
   For a cohomologous symplectic path, prove that the zig-zag cocycle map commutes
   with time differentiation. Its class is constant, so the derivative cocycle
   is a coboundary; the Čech–de Rham isomorphism implies ∂_tω_t is exact.
   Applying the constructed primitive selector gives the path corollary. Class equality
   without a symplectic path does not suffice. DG 8.5 supplies de Rham
   comparison independently of good covers; good-cover construction is B6's.
   Strengthen this same primitive selector to a continuous linear right
   inverse of d on exact smooth two-forms in the compact-source C-infinity
   topology, linear and therefore satisfying S(0)=0. Prove seminorm estimates
   `‖Sη‖Ck≤Ck‖η‖C(k+r_k)` with specified finite derivative losses and
   continuity of the Moser solution and flow in every Ck norm, uniformly
   on compact time and compact parameter subsets. Assemble continuity in
   C-infinity; testing only smooth finite-dimensional parameter families
   does not establish it. Include support-controlled global flow when the
   field vanishes outside one fixed compact set on a noncompact manifold.

   Construct the spaces of smooth tame and compatible J on a finite-dimensional
   symplectic manifold using the native bundle carriers. Prove nonemptiness,
   a contraction fixing a chosen compatible J₀, and extension of prescribed
   smooth finite-parameter families relative to closed parameter faces and
   closed spatial regions with an open neighborhood of prescribed data.
   Give the pointwise linear-algebra homotopies, smooth bundlewise assembly,
   finite-Ck estimates and C-infinity continuity on compact sources. Retain
   tameness/compatibility as the corresponding distinct hypotheses. These
   constructions precede closed-sphere transversality and group applications.

   On a smooth symplectic four-manifold, give ω its symplectic orientation.
   For a smooth Riemannian metric g, prove that there exists a smooth
   ω-compatible J with `g(u,v)=ω(u,Jv)` if and only if `*_g ω=ω` and
   `|ω|_g=√2` pointwise; such J is unique. This is an almost
   complex statement, without an integrability hypothesis. Use the exterior
   two-form norm fixed by `ω∧*_gω=|ω|²_g vol_g`, with the wedge basis
   eⁱ∧eʲ, i<j, orthonormal. For self-dual ω the norm condition is equivalent
   to `vol_g=ω∧ω/2`. Define A by
   `g(Au,v)=ω(u,v)`; in an oriented g-orthonormal coframe expand a self-dual
   form as `a(e¹²+e³⁴)+b(e¹³−e²⁴)+c(e¹⁴+e²³)`.
   Prove `|ω|²=2(a²+b²+c²)` and `A²=−(a²+b²+c²)Id`, hence J=A under the
   norm condition, and establish frame independence and smooth assembly.
   Conversely derive the star and norm identities from a compatible
   orthonormal frame. Consume CKG's real Hodge star on DG's generic forms;
   [FourDimensionalCompatibility.lean](FourDimensionalCompatibility.lean)
   pins the two-form Gram matrix, its transpose relation to A, the metric
   compatibility identity and the exterior-norm normalization on native matrices.
   CotangentLagrangian C4 owns only submanifold-relative primitive selection
   and its neighbourhood refinements, consuming the domain-local lemma here.
   Cite the Darboux-by-Moser development in `t4v1/damian_formalizare`,
   `MorseFloer/Part2/Darboux.lean`, as existing work; any integration follows the
   repository's author-coordination and licence requirements.
2. **Local theory** (MS Chapter 2). Construct the following local analytic
   floor, before branched-cover normalization, using F1.2's vector Carleman
   similarity principle and elliptic regularity:
   a. For J of class C¹ and a nonconstant C¹ curve on a connected
      domain, first obtain W^(2,p) regularity, p>2, from F1.2. Prove local unique
      continuation and isolated point-preimages. Apply the similarity
      principle also to its differentiated CR equation after trivializing
      the pulled-back complex tangent bundle; prove isolated critical points.
      Compact closed domains therefore have finite critical sets and finite
      fibers, hence finite u⁻¹(u(Crit u)) (MS Lemma2.4.1).
   b. Straighten an embedded reference disc to (a,0) with J(a,0)=i,
      choose a J-complex basis {∂_su₀,Z₂,…,Z_n} along the disc,
      and use its complex normal frame in the local coordinate map
      Φ(a,x+iy)=u₀(a)+Σ_(j=2)^n(x_jZ_j(a)+y_jJ(u₀(a))Z_j(a)), a=w₁,
      in a real target chart. Retain
      the finite-regularity budget: for C^ℓ J, ℓ≥2, the chart is
      C^(ℓ−1). Prove the transverse Lipschitz/normal derivative control
      of the transformed J directly from this frame-linear construction; do not
      infer full C¹ coefficients from an arbitrary C¹ chart (Lemma2.4.2).
   c. Prove the local accumulation-to-factorization lemma (Lemma2.4.3):
      if u₀(0)=u₁(0), du₀(0)≠0, J is C², and exact coincidences
      u₀(z_ν)=u₁(ζ_ν) have z_ν,ζ_ν→0 with ζ_ν≠0, then locally
      u₁=u₀∘φ for holomorphic φ with φ(0)=0. The second branch may
      be critical. In b's adapted coordinates write u₁=(a,b). The normal
      coefficient control gives |∂̄b|≤C|b||du₁|. Set
      C̃=−(∂̄b)b*/|b|² where b≠0 and0 otherwise; it is bounded
      on a smaller compact disc and ∂̄b+C̃b=0. F1.2's vector
      similarity writes b=Gσ with G invertible and σ holomorphic.
      The accumulating zeros force σ=0; the tangential curve equation
      then makes φ=a holomorphic. This proof uses no full Micallef–White
      normal form, root-of-unity exclusion or simple-branch isolation.
   Construct the closed-source simple/somewhere-injective comparison in
   AnalyticStableMaps M0.1 from this local floor; F2.6b is its sphere application.
   Construct Oh's boundary-injectivity for totally real boundary separately.
3. **Compactness** (MS Chapter4, including Theorem4.1.2, Lemmas4.3.1/4.3.4/4.5.1 and Exercises4.5.2/4.5.5). Construct interior and boundary mean-value/ε-regularity estimates, monotonicity, and finite-Dirichlet-energy puncture removal on almost complex manifolds of real dimension2n, under compact-image and uniform geometry hypotheses. Supply a smooth symplectic form ω taming J on a neighborhood of the fixed compact target-image set K. At boundary punctures use a native `SmoothEmbedding` i:L→M with closed image, and the native `TauCeti.IsMaximalTotallyReal` condition pointwise on `i.tangentRange`. Compare it with dim_ℝL=n and TL⊕JTL=TM|L through the native complement/finrank API. Require all boundary images in a specified compact K_L⊂L, with uniform smooth geometry on fixed neighborhoods; compact L is the case K_L=L. Include Lagrangian boundary as a specialization; the maximal totally real branch does not require ω|TL=0.

   Construct a smooth auxiliary J-Hermitian metric making JTL orthogonal to TL and with vanishing Levi-Civita second fundamental form near K_L. Consume [HopfRinow Layer1](../HopfRinow/README.md#layer-1-the-geodesic-equation-the-flow-and-the-exponential-map)'s Levi-Civita regularity and pullback/along-curve differentiation, and [RiemannianGeometry R1/R5a](../RiemannianGeometry/README.md#r5a-immersion-geometry-and-first-variation)'s curvature and second fundamental form, with DG's metric/partition calculus. Own the two-parameter pullback-connection adapter, torsion-free identity ∇_t u_s=∇_s u_t, and chart energy/curvature calculation here. Use adapted submanifold coordinates and local metric jets, patched by cutoffs whose derivatives in JTL vanish along L. Prove Δw≥−c w² and zero normal derivative of w=|u_s|²=|du|²/2. Reflect the scalar density evenly and prove the boundary mean-value estimate.

   Construct the tube adapter from GT Layer1's general-ambient orthogonal tube for an initial smooth metric g₀ with TL⊥JTL. Prove `(tangentRange)ᗮ=J(tangentRange)` by orthogonality and maximal dimension. Retain GT's zero-section derivative, smooth inverse and positive radius function; restrict to a uniform compact core over K_L. Use its native `RiemannianBundle`/`IsContMDiffRiemannianBundle` and compatible `IsRiemannianManifold` length/edist comparison. On this J-normal tube put β_(y,ν)(ζ)=−g_L(J⁻¹ν,dπ ζ), ν∈JT_yL. Prove β vanishes on the zero section, dβ tames J after shrinking the core, and |β|≤C dist(·,L). Consume the native linear Liouville pairing/sign; this analytic primitive is constructed on the supplied normal tube.

   For a finite-energy punctured half-disc, boundary mean-value makes all small semicircle arc lengths tend to0 and places the tail in the tube core, since its arc endpoints lie in K_L. Stokes on punctured half-annuli, with β|TL=0 and vanishing inner-arc action, gives E(u;B_r∩H)≤c length(u(r e^(iθ)))²≤c′rE′(r). Construct the integration adapter from DG5.6's Green identity on inset regions and C¹ limits at each nonpunctured boundary arc. Derive power decay E≤Cr^(2μ) and |du|≤Cr^(μ−1), for some μ>0, hence du∈L^p for some p>2. Radial lengths and angular diameters give a continuous limit, with boundary value in closed L. In one target chart the bounded map and L^p derivatives give W^(1,p) on the open half-disc, distributional CR equation there, and the Sobolev trace agrees with its continuous L-valued values on the straight edge. Construct the trace/chart comparison with F1.2's weak boundary-bootstrap formulation and obtain smooth extension and the extended CR equation.

   Include finite-regularity versions with explicit derivative budgets: for each integer m≥3, smoothness through C^(m+2) of J and the auxiliary metric and C^(m+3) of the embedded boundary data suffices for a C^m extension, under the same energy/compact-image conditions and C³ regularity of the original solution up to the nonpunctured edge. In the scalar reflection step retain at least C³ for u and C² for J/metric. The smooth-data case gives a smooth extension. Construct the interior removal branch using the supplied taming form and uniform compact-image localization of its short-loop action/monotonicity estimates. Prove the plane/sphere and half-plane/disc end identifications on the same fixed-domain carriers.

   Then construct Gromov compactness for strips/discs with maximally totally real boundary under energy bounds and these compact-image/uniform-geometry hypotheses, bubbling into trees of discs and spheres. Prove the rescaling, boundary charts and named estimate/removal comparisons before using the bubble conclusion. The domain scope is fixed genus-zero surfaces.
4. **Transversality** (MS Chapter 3; Floer–Hofer–Salamon for strips): universal
   moduli spaces over Banach spaces of `J`'s, Sard–Smale via somewhere-injectivity.
5. **Gluing** (Schwarz's model, then MS Chapter 10): pregluing, uniformly bounded
   right inverses, quadratic estimates, Newton iteration, *including* surjectivity
   onto neighborhoods of broken configurations, the historically under-written
   half.


#### F2.6 Closed spheres and rational symplectic applications

This block constructs closed genus-zero curves and their zero/one-marked
moduli on the same analytic substrate. Use compact connected finite-dimensional
Hausdorff symplectic targets, with countable atlases and no boundary, unless
an explicit common compact image set and uniform geometry are supplied.
All map/manifold hypotheses, regularity conditions and family bounds remain
in the statements. The complex orientation and F1.5's closed index
`ind_R D=nχ+2c₁` are fixed throughout. F2.2a–c is the local
analytic floor preceding part b. Part e's local normal-form construction
uses this floor, without quotient moduli. Part b proves the
no-open-noninjective-set lemma;
part e's simple-branch isolation consumes that lemma. The local normal form
uses no quotient moduli, compactness, transversality, intersection positivity
or global adjunction.

**F2.6a Sphere domains and automorphisms.** Use `OnePoint ℂ` with its native
complex charts, ComplexKahlerGeometry K1's real restriction and K7.1's
projectivization comparison. Fix `(0,1,∞)`, complex orientation and the
integral-one Fubini–Study form; scale this same form for other areas.
Reuse native `PSL(2,ℂ)` and its faithful algebraic action. Construct the
jointly continuous/holomorphic Möbius action, including infinity, and its
comparison with biholomorphic self-maps. Compare the SL/center quotient
topology with the open determinant-nonzero locus in ℂP³. Normalize determinants
by local square-root branches and descent; no global continuous square root
on ℂ* is used. Prove sharp triple transitivity and the biholomorphism from
PSL to ordered triples of distinct sphere points. For surjectivity onto all
automorphisms, normalize infinity, use degree/local multiplicity one and
Cauchy estimates to show the resulting entire map is affine.

Construct full stabilizers of one, two and three points, their orbit maps,
and first/second jet coordinates with their source/target chart or connection
transition laws. The one-point stabilizer is ℂ⋊ℂ*, not the native unipotent
`lineStab`. Construct PSU(2)⊂PSL(2,ℂ) as the Fubini–Study isometry subgroup
and identify it with the image of the native SU(2) under its inclusion
into SL(2,ℂ) and center quotient. Prove that inclusion continuous and
identify its kernel after quotienting as {±I}. Use the finite closed
center argument for T2Space on PSL(2,ℂ), as proved by
`pslComplex_t2` in Suggested, with the native quotient topology,
before compact-to-Hausdorff comparisons.
Through K7.1's projectivization map, send a complex line to its orthogonal
rank-one projector P and then √2(P−I/2), a unit traceless Hermitian matrix
for the Frobenius real inner product `Re tr(A*B)`. Use the orthonormal
Pauli basis `σ_i/√2`, with its orientation chosen to match the complex
orientation of the sphere, for the isometry to ℝ³ and prove equivariance with
LieGroups' SU(2) adjoint SO(3) cover, including the center quotient and
complex/outward sphere orientation. Compare the normalized area-one
Fubini–Study metric g_FS with the unit round sphere metric:
`g_round=4π g_FS`, where g_FS=ω_FS(·,j·) and ∫ω_FS=1. Construct
UT(S²,g_round)≃SO(3) by the oriented frame `(x,v,x×v)` and transport it
to this same OnePoint carrier and round metric. These comparisons
pin the rotational subgroup and unit frames used in part h.
Identify the quotient of four ordered distinct points by the
cross ratio, pinning the convention `(0,1,∞,z)↦z` and its permutation laws,
so `M(0,4)=OnePoint ℂ∖{0,1,∞}`.

For a compact connected complex Riemann surface of topological genus zero,
construct a biholomorphism to this fixed sphere. Build O(p) by transition
functions, its degree/c₁=1 comparison and holomorphic sections using
ComplexKahlerGeometry K4's bundle carrier. Apply closed linear RR to obtain
complex index2. Construct the canonical section of O(p) vanishing once at p;
choose an independent section and divide by that canonical section. The
ratio is a nonconstant meromorphic function with exactly one simple pole. Construct the
native finite holomorphic map, identify degree1 and consume
`TauCeti.RiemannSurface.biholomorphOfDegreeEqOne`. The complex atlas is an
input; a normalization atlas needed below is constructed there.
Construct the Euler/genus input independently: F1.5 on the trivial complex
line has real indexχ and is complex linear, so χ is even. On a compact
connected complex Riemann surface, holomorphic functions are constants by the
maximum principle; its complex kernel dimension1 gives χ≤2. Use
FuchsianOrbifolds Layer5's independent branched-cover Euler formula
`2=dχ(Σ′)−R`, d>0,R≥0. It makes χ(Σ′)>0; evenness and the bound give
χ(Σ′)=2 and topological genus0, before applying the O(p) construction.
This order precedes nonlinear moduli and uses no nonlinear uniformization
or GW theorem.

**F2.6b Simple maps and the quotient.** Define P_A as the entire smooth class-A
J-holomorphic sphere locus with somewhere-injectivity, where A is an integral
spherical homology class and ω(A)>0. Reuse native almost-complex structures,
`IsPseudoholomorphic`, actual map differentials and section bundles. Construct
its C-infinity topology and comparisons to sufficiently high W(k,p), p>2,
with the derivative budget from F0.

Consume [AnalyticStableMaps M0.1](https://github.com/TauCetiProject/TauCetiRoadmap/pull/987)'s
arbitrary-genus nonconstant closed-curve factorization, constructed from this
roadmap's earlier F2.2a–c local vanishing/coincident-germ and F2.3 removal floors.
The generic Γ₀/closure, local multiplicity and holomorphic quotient-chart
construction has that single owner and uses no F2.6b/F2.6d input. On each
nonconstant sphere apply it to obtain u=v∘π and its connected compact factor
Riemann surface Σ₀, retaining the actual finite branched cover and all branch
multiplicities. Use FuchsianOrbifolds Layer5's degree/Riemann–Hurwitz formula
and part a's independent genus-zero identification to identify Σ₀ with the
fixed sphere: 2=dχ(Σ₀)−R, d>0 and R≥0 imply χ(Σ₀)>0, hence genus0.
Transport the actual map, degree, class and complex orientation through that
biholomorphism and prove u_*[S²]=d v_*[S²] integrally. These are sphere
application comparisons, not a second construction of general normalization.

Consume M0.1's simple/somewhere-injective equivalence and its at-most-countable
noninjective locus, with accumulation only at critical points. Construct the
identification of its sphere simple locus with P_A and the map, topology and
source-reparametrization comparisons required below. Retain the full critical-value
preimage B=u⁻¹(u(Crit u)) in this application; isolated crossings of distinct
branches are not identified by the coincident-germ relation. Nonconstant
curves with nonprimitive class may still be simple. Primitivity rules out a
multiple cover but does not rule out splitting into different positive-energy
classes. No four-dimensional intersection-positivity theorem or part e branch
normal form is a premise of this factorization/sphere-identification application.

The right action is `(u,g)↦u∘g`. Prove that simple-map stabilizers are trivial
using an injective regular point and holomorphic uniqueness. Prove properness
on the nonconstant simple-map locus: an escaping PSL sequence has a normalized
rank-one limit and converges to a constant off one point, contradicting
smooth convergence of both maps in the properness test. Establish the actual
metrizability, countable charts and properness criteria used.
For regular solutions construct slices through three distinct injective
points with codimension-two image incidence constraints. Prove chart
independence and a Hausdorff second-countable smooth quotient. Reparametrization
loses derivatives: prove C^r dependence from W(k+r,p) to W(k,p), then
bootstrap finite-dimensional solution slices; no smooth action on a single
fixed Banach completion is assumed. Orient det(D) by deformation to complex
linear CR operators and give the complex orbit orientation, orbit-first
quotient convention and naturality. The unmarked dimension is
`2n+2c₁(A)−6`.

Construct the one-marked quotient `(P_A×S²)/PSL` under
`(u,z)·g=(u∘g,g⁻¹z)`. It is the associated sphere bundle over unmarked
moduli, with dimension `2n+2c₁(A)−4` on the regular locus and smooth
well-defined evaluation `[u,z]↦u(z)`. Construct target-symplectomorphism,
parameter, marking and representative-change comparisons. Nonregular
loci retain their actual topology, without an asserted manifold structure.

**F2.6c Energy and compactness.** Construct the global closed-surface energy
as half the integrated raw norm-square of du for the associated tame metric
and a conformal domain metric. Prove chart/conformal invariance, equality
with `∫u*ω=ω(A)` for J-holomorphic maps, and the integral-homology/de Rham
comparison. Include Stokes, positivity, zero-energy constancy, degree scaling
and product projections. The native energy-density identity is a local input.
For compatible J consume [CalibratedGeometry C4](../CalibratedGeometry/README.md#c4-hermitian-linear-algebra-and-k%C3%A4hler-calibrations)'s Hermitian linear
Wirtinger inequality and positive complex-plane equality, on C1's comass
carriers. This pointwise core requires no integrability. Apply C2/C3's
integration and actual finite bounding-chain hypotheses for the resulting
parametric area/minimization statements.

For K compact in the C-infinity topology on smooth tame J and a=ω(A)>0,
assume explicitly that every
nonconstant J-sphere, for every J∈K, has area at least a. Prove compactness
of the zero/one-marked class-A quotient over K. Extend the fixed-domain
analytic compactness construction to the closed sphere: uniform elliptic and
mean-value estimates, rescaling, removal, finite energy quantization,
no-neck energy and neck oscillation/diameter control. Construct integral
class splitting `A=Σd_i A_i` by homotopy and capping in small target charts;
vanishing real ω area alone does not identify an integral class.
The area bound permits exactly one positive-energy component and excludes
its multiple covering. Recenter by Möbius maps if the principal component
is constant. With at most one mark, prove by tree valence/stability that
there is no stable constant subtree; collapse unstable constants and pass
the mark to its limit on the surviving sphere. Establish C-infinity
quotient convergence and family/evaluation continuity, then compactness
from the countable metrizable models. Include the standard ℂP² line
moduli, dual-projective-plane and line-point incidence identifications.

**F2.6d Transversality and degree.** Construct universal simple-sphere
sections and localized J variations with F0's split Fredholm range and
finite-order Sard–Smale budget, first in C^ℓ tame J spaces. In the tame
case variations anti-commute with J; for compatible J add the symplectic
symmetry condition `ω(v,Yw)=ω(w,Yv)`. Prove in each of these actual tangent
spaces the localized cokernel-surjectivity linear algebra. Establish the
smooth-J residual theorem by a countable exhaustion of compact pieces
with uniform image/derivative/injectivity bounds: regularity is open on
each piece, finite-C^ℓ perturbations give density, and smooth approximation
relative to the prescribed region plus the Taubes countable-intersection
argument gives a residual subset of smooth J. Use the quantitative
simple-point condition at some z,
`inf_(ζ≠z) d(u(z),u(ζ))/d(z,ζ)≥1/K`, together with `‖du‖∞≤K`;
for a spatially relative theorem also bound the image point's distance
from the fixed region below by1/K. Prove these pieces cover every relevant
simple curve for some K. Uniform elliptic bootstrapping makes the bounded
pieces compact; this gives openness and the C^ℓ-regular/smooth-approximation
density argument of McDuff–Salamon §3.2, printed54–56. Carry the same
budgets, compact-piece estimates and endpoint-relative smoothing to paths. Prove
surjectivity modulo map variations
by pairing a nonzero adjoint section with a J variation near an injective
point, including the anti-commuting endomorphism linear algebra and bump
extension. Prove the relative theorem when each relevant map has an
injective point in the allowed open perturbation region. For a prescribed
compact inner ball and collar inside an exact open ball, Stokes excludes a
nonconstant sphere lying wholly there; the dense injective locus supplies
an allowed point outside the fixed region.

For regular endpoint J's and generic smooth paths fixed near their endpoints,
construct the compact oriented one-marked universal cobordism under part c's
uniform area bound. Use parameter-first orientation; its boundary is the
final moduli minus the initial moduli. Construct evaluation pushforward and
degree invariance using AlgebraicTopology's relative fundamental classes.
Degree+1 implies surjectivity. Nonregular endpoints require a regular
approximation/compactness passage or another explicit regularity theorem.
The path interior need not keep a spatial germ fixed when only its final
endpoint has that prescribed germ.

**F2.6e Four-dimensional curves and regularity.** Construct positive local
intersection multiplicities of distinct simple J-branches, their chart
invariance, isolation, tangency and critical-branch cases, and the global
integral homological intersection formula. Assume no common open image
component when comparing two curves. Construct the Micallef–White
simultaneous normal form for a J-holomorphic map nonconstant on every
component meeting Ω, where Ω has compact closure and x₀∈u(Ω) lies
outside u(∂Ω). Prove finiteness of u⁻¹(x₀)∩Ω from isolated preimages
and compactness. For its points z_i construct pairwise disjoint U_i⊂Ω,
C² source charts φ_i:(U_i,z_i)→(ℂ,0), and one C¹ target chart
Ψ:(W,x₀)→(ℂ^n,0). With u_i=Ψ∘u∘φ_i⁻¹ obtain polynomial branches
`L_i u_i(z)=z^k_i(1,p_i(z))`,
with p_i(0)=0, Ψ_*J(x₀)=J₀, and the same unitary L for equal tangent
lines. Prove local injectivity of simple critical branches using part b's
no-open-noninjective-set lemma to exclude root-of-unity identifications.
For isolation
of distinct branches, use the lower bound on `|λa+μb|` when the leading
tangent vectors are independent, and the root-of-unity polynomial identity
when they are dependent. The linear similarity principle alone
does not supply this normal form.

Define the local index using compact source neighborhoods U_i and a
compact contractible target neighborhood W whose boundary contains no
intersection under consideration and with `W∩u_i(∂U_i)=∅`; perturb
transversely inside the preimages of W, keeping the images there inside W. Construct the cutoff perturbation replacing z^k by
`Π_(j=0)^(k−1)(z+jε)`, first giving a C¹ immersion with positive pulled-back
compatible two-form, then a smooth transverse immersion equal to u outside a prescribed
neighborhood of the noninjective set, including critical points and
nontransverse intersections between immersed branches. The form used for this local perturbation need not be
closed. Prove the local-index comparison, positivity and the strict
contribution from every critical branch; tangent immersed branches and
critical branches require these separate arguments. Use McDuff–Salamon,
*J-holomorphic Curves and Symplectic Topology*, second edition,
Theorem E.1.1 and E.2.1–E.2.4, printed655–663, for this construction.
Construct the simultaneous normal-form proof here, including its
Hartman–Wintner asymptotic expansion input and the C¹ simultaneous target
coordinate change, following the proof in Appendix E.5–E.7. The original
source is Micallef–White, [Annals141(1995),35–85](https://doi.org/10.2307/2118627).
Build the required local analytic package in the following order,
using F1.2's explicit Hölder Cauchy/Beurling estimates and Banach inversion.
Consume its normalized two-dimensional Beltrami inverse: C^(1+α)
coefficients give C^(2+α) coordinates for 0<α<1, with smooth
coefficients giving smooth coordinates. Here construct the
isothermal-coordinate/elliptic-principal-part comparison; the
full higher-dimensional Newlander–Nirenberg theorem remains CKG K1.
Prove Hartman–Wintner's [elliptic finite-order expansion](https://doi.org/10.2307/2372496)
for C² vector-valued u with u(0)=0 and
`|a u_ss+2b u_st+c u_tt|≤C(|u|+|du|)`, where a,b,c are real C^(1+α),
a,c>0 and ac−b²>0: either u vanishes identically or it has a nonzero
homogeneous leading polynomial together with its derivative asymptotic.
Use the flattened Laplacian, annular Cauchy–Green formulas, weighted
bootstrap estimates and the limiting derivative coefficient. This leading
polynomial is real homogeneous; holomorphicity needs the next CR argument.

Construct the punctured-disc symbol classes with every derivative bounded
by `|z|^(ℓ−order)` and prove their product/composition/inverse and
Cauchy-solution/removability rules. For ℓ≥2 prove the symbol inclusion
into local W^(2,∞), justifying weak derivative extension across the origin;
then C^(1,1) embeds into C^(1,α) on smaller discs for 0<α<1.
For E.6.4 prove the coefficient deviations a−1,b,c−1 have order k+1;
adding back the constants gives the required C^(1,α) elliptic coefficients.
The C² regularity of H=F₂−F₁ comes separately from E.5.10's C²
source reparametrizations and normal components; symbol order alone
does not imply C² at the origin. Retain that premise before using
Hartman–Wintner.
Obtain the single-branch form
`(z^k,F(z))` with F of order k+1. Construct E.6.2's smooth block
normalization using F1.2's actual Sobolev spaces X,Y and disc solver.
On the open set of u∈X with image in the J chart, use
F(u)=(½(∂s u+J(u)∂t u),u(0),∂s u(0)); its derivative at0 is the
normalized solver. Choose a sufficiently small nonzero ξ₀ in the chosen
complex tangent line and transverse centers x with (0,x,ξ₀) in the
inverse's domain. The discs u_x=F⁻¹(0,x,ξ₀), elliptic bootstrapping and
parameter estimates give smooth Φ(z,x)=u_x(z). Its derivative at(0,0)
is (ζ,ξ)↦ζξ₀+ξ, an isomorphism. For Ψ=Φ⁻¹ prove Ψ(x₀)=0,
dΨ(Π₀)=ℂ×0 and Ψ_*J=[[i,J₃],[0,J₄]], with J₃(0)=0 and J₄(0)=i.
Derive this differential from u_x(0)=x, ∂s u_x(0)=ξ₀ and J(0)=i,
with the Sobolev parameter estimates and their Morrey comparisons.
Prove E.6.5's leading-difference transformation law: the invertible
normal differential block transports the coefficient, preserving its
nonvanishing and order, with the source reparametrizations included.
For same-tangent branches, reduce their
difference consistently as H=F₂−F₁ to a uniformly elliptic inequality;
the CR coefficient-order estimate then makes its first nonzero homogeneous
term holomorphic. Finally construct the finite root-of-unity invariant
branch families, their order-separation averages, supported corrections
with derivative zero at the origin and their C¹ inverse estimates.
Treat equal orders, then a common multiple of differing orders, then
combine corrections in disjoint cones for distinct tangent directions.
These constructions give one simultaneous C¹ target change, not separate
incompatible charts for different branches. Follow Appendix E.3–E.7,
printed664–694, for this complete local proof route.

Prove singular adjunction for
a simple normalized curve in a real four-manifold:
`c₁(TX)(A)=χ(Σ)+A·A−2δ(u)`, δ≥0, with δ=0 exactly for embeddings.
Here δ is the total algebraic singularity number, the sum of signed
unordered local indices of the controlled transverse immersed perturbation.
Prove its nonnegativity from the local-index comparison and the strictly
positive total contribution in each critical-branch neighborhood; positivity
of a two-form on an immersed surface alone does not make every crossing positive. Prove
its independence of perturbations by the normal Euler/self-intersection
and Chern-class identities. Distinguish it from the cardinal count of
distinct self-intersection pairs: tangencies have higher weight and
critical branches contribute even without distinct preimages. Prove
the corresponding cardinal inequality and equality precisely for
immersions with transverse self-intersections. Consume CharacteristicClasses'
Euler, normal self-intersection and Whitney-sum comparisons.

For an embedded sphere construct the quotient real CR operator on its normal
line N using `TS²→u*TX→N`; retain the upper-triangular coupling and its exact
kernel/cokernel comparison. For a real CR line operator of degree d, F1's
zero count and RR give automatic surjectivity when d≥−1. At d=−1 the kernel
vanishes and index0 gives zero cokernel. At d≥0 evaluate the kernel at d+1
distinct points: zero counting makes this injective, while index2(d+1)
forces it to be an isomorphism and the cokernel to vanish. Prove the Sobolev
trace and finite-codimension restriction statement: one-point evaluation
of the kernel is onto, so a solution can be adjusted by a kernel section
to meet a zero point constraint. No smooth divisor-twist of a general
real-linear zeroth-order term is presumed. The tangent sphere operator
has degree2; the normal operator has degree A·A.

For square0 and c₁(A)=2, normal evaluation is an isomorphism of real
2-dimensional spaces, giving a local diffeomorphism of one-marked evaluation.
Prove finite-parameter smoothness and C-infinity dependence with estimates.
Compute the source tests: smoothing/genus/index changes from δ, and an
embedded Lagrangian S² has square−2 because J's tangent-to-normal
identification reverses the induced normal orientation.

**F2.6f Nonsqueezing.** For a symplectic embedding of B(r) into
`B²(R)×ℝ^(2n−2)`, n≥1, first take each compact inner ball r′<r.
Embed its bounded image into `S²(a)×T^(2n−2)` with a=πR²+ε and torus
periods large enough to avoid seams. Construct these symplectic embeddings
and normalizations. Prove from π₂(T)=0 and π₂(S²)=ℤ that all spherical
areas are integer multiples of a. Thus every positive area is at least a
for every tame J. The ruling class has c₁=2.
For product J identify all class-A curves by constant torus projection and
degree-one sphere projection, prove regularity using F1's line RR/zero count,
and identify one-marked evaluation with the identity with degree+1.

Extend the pushed-forward standard J near the inner ball by F2.1's relative
construction. Choose a constrained regular endpoint and an endpoint-relative
generic path from product J; part d and compactness give a sphere through
the center. Holomorphic monotonicity in the standard ball gives area at
least π(r′)², including positive local multiplicity at a critical point.
Its total area is a. Pass ε→0 and r′→r to obtain r≤R. Product-sphere
compactifications require their full spherical-area subgroup calculation;
large unrelated factor areas alone do not establish the same area gap.

Before the ruling applications, prove the four-dimensional mixed-wedge
lemma: if ω₀ is a product symplectic form on complementary oriented
2-planes and a symplectic form β is positive on each plane, then
`ω₀∧β>0`. Evaluate on a product symplectic basis. Together with positive
ω₀² and β² this proves the whole convex path nondegenerate. Include
naturality under oriented linear changes of coordinates.

**F2.6g Rulings and relative recognition.** On equal-area S²×S², the two
ruling classes have square0, c₁=2 and minimum positive area. Parts b–e give
simple compact moduli, embeddedness, automatic regularity and evaluation
local diffeomorphisms. Evaluation degree+1 gives existence; intersection
positivity gives disjointness of distinct leaves in each class and a
unique transverse intersection between opposite leaves. Construct smooth
rulings, their family dependence, and the product diffeomorphism by
intersections, with smooth inverse. The raw map pulls ω back positively on both
coordinate planes: they map to the oriented J-ruling planes, with the
orientation fixed at the standard seeds and extended by nondegeneracy
and connectedness. A degree-one map alone is insufficient.

Let X be connected, noncompact, symplectic of dimension4 with H₂(X;ℤ)=0,
and a given symplectic end identification with standard ℝ⁴ outside a
compact set. Construct an extension agreeing with that map on a smaller
end. Choose a larger equal-area polydisc, a rounded compact cut and a
collared gluing to the product-sphere cap. Prove compactness of the cut
core, Hausdorffness and the smooth symplectic atlas of X′ from the closed
collared gluing; an open-overlap gluing alone does not ensure Hausdorffness.
Compute H₂(X′), its intersection form and equal area pairings by the actual
excision/Mayer–Vietoris maps. Fix product J on a neighborhood of
`(U×S²)∪(S²×U)`, where U is a round disc centered at ∞ in the chosen
cap coordinate.
The two transverse cap spheres are standard there; their embedded adjunction
gives c₁=2. They seed the two moduli spaces. On this X′, compactness and
evaluation local diffeomorphisms make the evaluation image open and closed;
connectedness and the seed imply surjectivity. Intersection positivity gives
one sheet. This argument does not assume that X′ is a product beforehand.
Construct the intersection diffeomorphism F using the standard seed
parametrizations. It fixes the two seeds and U×U and maps the cap-strip
coordinate leaves to themselves. It need not equal the end identification
on those strips. Normalize it as follows, in the cap coordinates.
On S²×U write `F(z,w)=(φ(z,w),w)`, where each φ(·,w) is an
orientation-preserving diffeomorphism, φ(z,w)=z for z∈U or w=∞, and
w↦φ(z,w) is holomorphic. The corresponding form on U×S² is
`F(z,w)=(z,θ(z,w))`, with each θ(z,·) an orientation-preserving
diffeomorphism, z↦θ(z,w) holomorphic and θ(z,w)=w for w∈U or z=∞. Prove these identities from the standard cap curves
and their transverse intersections, rather than assuming F is a product map.

Choose a smaller concentric round disc D compactly inside U and a smooth map ρ:S²→S²
which is constant∞ on D, is the identity off U, maps U to U, and has
nonnegative Jacobian. In a disc coordinate centered at∞ take
`ρ(ζ)=b(|ζ|)ζ` with b nondecreasing, zero near D and one near∂U;
prove smoothness, the support conditions and
`det(dρ)=b(r)(b(r)+r b′(r))≥0`. On
`(S²∖U)×U` replace F by `(φ(z,ρ(w)),w)`; on
`U×(S²∖U)` replace it by `(z,θ(ρ(z),w))`. Leave it equal to F
elsewhere. On the overlaps U×U both formulas are the identity, and
near the strip boundaries ρ is the identity. Prove the resulting F′
is a global diffeomorphism by its fiberwise diffeomorphism inverses,
is isotopic to F through these same formulas with radial interpolations,
and equals the end identification on `(D×S²)∪(S²×D)`.
For the moved graph direction, holomorphic dependence composed with ρ
has nonnegative Jacobian and the other component is the identity;
for the fiber direction use the orientation-preserving fiber map.
Thus F′*ω remains positive on both coordinate planes, including on the
transition annuli. This is the relative adjustment of McDuff–Salamon,
*J-holomorphic Curves and Symplectic Topology*, second edition,
Theorem9.4.7(ii), printed340–341; construct both symmetric strip maps.

To obtain a symplectomorphism, use the mixed-wedge lemma above for
β=F′*ω; the isotopy from F shows F′ preserves orientation, so β²>0
in the product orientation. This gives the symplectic form path. Compute
the relative cohomology difference and construct a primitive vanishing on
`(D′×S²)∪(S²×D′)` for a smaller concentric disc D′ compactly inside D. From a global primitive, use H¹=0 on the chosen neighborhood
of the two transverse cap spheres to subtract an extended exact primitive.
Prove H¹(U)=0 for U=(D×S²)∪(S²×D) by Mayer–Vietoris and
DifferentialGeometry's open-manifold de Rham comparison. For a global
primitive α choose f on U with df=α|U, take a smooth cutoff χ equal1
on a smaller cap neighborhood and supported in U, and extend χf by0.
Then α′=α−d(χf) has the same exterior derivative and vanishes on
that smaller neighborhood. Prove these extension/collar/support assertions
for this cap union and apply F2.1's compact-support Moser flow. Restrict
to the end-fixed symplectomorphism X≃ℝ⁴.

**F2.6h The equal-area group.** Consume
[GeometricTopology Layer3](../GeometricTopology/README.md)'s
compact-source weak Whitney C-infinity topology and topological-group
construction on the native `Diffeomorph` carrier, including inversion
and evaluation.
Construct the symplectic subgroup with the shared pullback predicate and
its action on integral H₂. Define G₀ as the kernel of that action. Fix the
product round J₀ and p₀=∞. Let E consist of `(J,u,v)` where u and v
parametrize respectively an A and a B leaf and `u(p₀)=v(p₀)`.
At J₀ identify the fiber with PSL(2,ℂ)² by
`(a,b)↦(z↦(az,bp₀),w↦(ap₀,bw))`. Independent reparametrization does not
preserve the common-value incidence; at a fixed value the fiber uses the
one-point stabilizers.

Construct a deformation of E relative to standard rotations onto
K=SO(3)×SO(3), acting on OnePoint through part a's explicit PSU/adjoint
and unit-frame comparisons. Over the common value x, identify parametrizations by
nonzero complex first derivatives in the two ruling lines and their
second covariant jets, using chosen smooth complex connections and part a's
jet inverse. Prove all transition laws and smooth/continuous inverse
dependence. Normalize derivative lengths and contract the affine second-jet
directions to zero, leaving the two unit-frame bundles over X. Transport
these frames along F2.1's contraction of tame J to J₀ using metric
connections/projections and ODE estimates. At J₀ they are the round tangent
unit-frame bundles, hence K. Choose connections and normalization fixing
every rotational parametrization. Prove actual C-infinity continuity and
the K-relative property. Contractibility of the J base and a fiber homotopy
type alone are insufficient.

Construct the deformation retraction of PSL(2,ℂ) onto PSU(2),
followed by the adjoint homeomorphism to SO(3), on the native groups.
LieGroups Layer9 owns the general Cartan decomposition. Here construct
its explicit determinant-one2×2 computation: for g∈SL(2,ℂ), set
H=g* g and P=(H+I)/sqrt(tr H+2), using the positive real trace
and square root, embedded in ℂ. By Cayley–Hamilton prove P²=H,
P positive and det P=1. Identify P with native CFC.sqrt H using
MatrixOrder and CFC.sqrt_unique; this gives the standard polar factor,
rather than another square-root construction. Prove U=gP⁻¹∈SU(2)
and continuous dependence directly from the explicit formula. Contract
P to I by Q_s=((1−s)P+sI)/sqrt(det((1−s)P+sI)), with positive
real determinant and root. Prove Q_s positive, det Q_s=1, Q₀=P
and Q₁=I, so g_s=UQ_s stays in SL(2,ℂ) and fixes SU(2).
Prove −g=(−U)P. The center-quotient SL→PSL is open, hence its
product with [0,1] is a quotient map; use this for joint continuous
descent of the homotopy. Its image is part a's PSU(2). Consume
LieGroups' worked SU(2)/SO(3) acceptance example, based on Layers3–5:
the surjective adjoint cover Ad:SU(2)→SO(3), with kernel{±I}; derive the center-quotient
homeomorphism used in part a. No second matrix group or double cover is introduced.

Define A:G₀→E by pushforward of the standard data and reconstruct F:E→Diff(X)
by intersections of leaves. Prove joint C-infinity continuity, inverse
continuity, finite-parameter smoothness and FA=id. The form β=F*ω is
positive on both standard coordinate planes, so the earlier mixed-wedge
lemma proves every `(1−t)ω+tβ` symplectic. The named H₂ basis
and equal areas give `[β]=[ω]`. Apply F2.1's continuous primitive selector
S and Moser field `ι_(X_t)ω_t=−S(β−ω)`. If ψ_t*ω_t=ω, put
B(e)=F(e)∘ψ₁(e). Prove B maps to G₀, BA=id by S(0)=0, and B fixes K.
For the K-relative deformation H of E, the homotopy BHA deforms G₀ onto K.
Only then identify G₀ with the identity component. For the full group,
compute the intersection/area-preserving integral H₂ actions as identity
and swap, realize swap by factor exchange and prove the split homotopy
comparison with `(SO(3)×SO(3))⋊ℤ/2`.

#### F2.7 Compact Lagrangians and forced holomorphic discs

For n≥1 and a nonempty compact smooth embedded boundaryless Lagrangian L in standard ℂⁿ, construct a nonconstant standard-holomorphic disc u:(D,∂D)→(ℂⁿ,L), smooth up to its boundary. Prove existence with boundary in each nonempty connected component of L. The domain is the fixed parametrized closed unit disc; no automorphism quotient is taken.

Use native `SmoothEmbedding`, with the dimension-n real manifold model for L and pointwise isotropy expressed by `mfderiv`, transported by `NormedSpace.fromTangentSpace ℝ`. Prove this agrees with isotropy of the native `tangentRange`. Transport that
range into the doubled-real model and prove equivalence with native
`stdSymplecticForm.IsLagrangian` using the dimension-n hypothesis and
`SymplecticForm.IsIsotropic.isLagrangian_of_finrank`; include the range
finrank and orthogonal-complement comparisons. Under the real-linear identification (x,y)↦x+iy, prove `stdSymplecticForm(v,w)=Im⟨v,w⟩_ℂ=ω₀(v,w)`, where ω₀=Σdx_j∧dy_j, J₀=i and the real Euclidean inner product is Re⟨·,·⟩_ℂ. Include the differential of this identification. Orient D by ds∧dt and its boundary counterclockwise; set |du|²=|u_s|²+|u_t|². The operator below is 2∂bar in F1.2's convention. Put α=(1/2)Σ(x_jdy_j−y_jdx_j); construct dα=ω₀ and d(i*α)=0 from the standard linear differential-form and native Liouville comparison before the energy calculation.

1. **Boundary mapping spaces and index.** Consume [GeometricTopology Layer1's smooth Euclidean tubular diffeomorphism](../GeometricTopology/README.md), including its smooth inverse, projection to L, and positive uniform radius for compact L. Composing the inverse tube with its base projection gives a smooth retraction near i(L), with r_L∘i=id; its restriction supplies smooth lifts of boundary maps to L. Do not identify the native quotient normal-space construction with this tube theorem.

   Construct the boundary-adapted local-addition adapter and W^(1,p) mapping-space charts, p>2, in the component of constant maps. Use the smooth tube retraction r_L and smooth orthogonal projections P_T(y),P_N(y). For q=i(y)+ν in a small tube put y′=r_L(i(y)+P_T(y)v) and
   `B(q,v)=i(y′)+P_N(y′)(ν+P_N(y)v)`.
   Prove B(q,0)=q, and J_q=D_v B(q,0) is Id for q∈i(L), hence invertible on a smaller tube. Normalize to B(q,J_q⁻¹v), whose v-derivative at0 is Id throughout that tube. Blend with q+v by a smooth base cutoff equal to1 near i(L); prove the resulting addition has an open zero-section domain and that (q,v)↦(q,A(q,v)) is a diffeomorphism onto a neighborhood of the diagonal. Prove, for q∈i(L) and small v, A(q,v)∈i(L) iff v∈T_q i(L), by invertibility of the nearby normal projection restricted to N_yL. Expose trace compatibility, chart inverses and transitions, and smooth evaluation at a fixed boundary mark. Consume F1.1's Sobolev trace/Nemytskii estimates and F0's Banach-manifold floor. For each component of L use the open-and-closed mapping-space part whose boundary lies there, rather than construct a new component embedding. Inherit second countability of L from its embedding into ℂⁿ before applying the tube supplier.

   For a real-valued H(λ,z,w) define the section `S(H,λ,u)=u_s+i u_t−∇_w H(λ,z,u)`. Derive all map/Hamiltonian/parameter derivatives and the totally-real boundary linearization. Consume F1.4's single Maslov construction and homotopy invariance to give the constant relative class A₀ index μ(A₀)=0, and F1.5's bordered Riemann–Roch to give fixed-λ Fredholm index n and parameterized index n+1. For integers r≥2, k≥n+2 and ℓ≥k+r+2, prove the section W^(r,p)→W^(r−1,p) is jointly C^k, including boundary charts and the target-gradient derivative. Compare W^(1,p) solutions and these completions by F1.2's linear and nonlinear boundary regularity before invoking Sard–Smale.

2. **Forcing and image bounds.** Put R=max_(x∈L)|i(x)| and C=2R; prove R>0 from the positive-dimensional embedding and nonemptiness. Fix |a|>C. Begin with H_base(λ,z,w)=λ Re⟨a,w⟩_ℂ, so ∇_w Re⟨a,w⟩_ℂ=a. Keep H(0,z,w)=0, H(1,z,w)=Re⟨a,w⟩_ℂ and H(λ,z,w)=λ Re⟨a,w⟩_ℂ for |w|≥C, with smooth extensions across the parameter endpoints.

   Consume [DG5.6.3's oriented circle Green identity](../DifferentialGeometry/README.md#layer-56-greens-theorem-for-planar-regions-and-curves). Apply it componentwise on discs D_r with r<1, where u is smooth on a neighborhood, and pass to r→1 using C¹ continuity up to the boundary. F1.1's W^(r,p) embedding for r≥2,p>2 and F1.2's bootstrap supply that regularity. This radial-limit adapter uses the open discs and the stated boundary continuity. If u_s+i u_t=a with u(∂D)⊂i(L), the identity on D_r is `πr²a=r∫₀^(2π)e^(iθ)u(re^(iθ))dθ`; hence `πa=∫₀^(2π)e^(iθ)u(e^(iθ))dθ` and |a|≤2R. Thus the λ=1 solution space is empty. Where |u|>C the forcing is constant, so u is harmonic and |u|² is subharmonic. The boundary has |u|≤R<C; use [PDE Lane C.13's weak maximum principle](../PDE/README.md#lane-c-maximum-principles-and-potential-theory) on each positive superlevel component to prove |u|≤C everywhere. The exclusion estimate uses radius R, while the image estimate uses radius C.

3. **Energy and fixed-disc compactness.** Consume native `SymplecticForm.stdComplexLineEnergyDensity_sub_two_mul_symplecticForm` and the `stdComplexLineEnergy` integral carrier. Instantiate the density identity with the real differential and the forcing equation, and prove the finite-integrability comparison with its real integral; retain signed symplectic area rather than the native integral of its positive part for arbitrary differentials. Derive the square-completion identity `(1/2)∫_D|du|²=∫_D u*ω₀+(1/2)∫_D|∇_w H(λ,z,u)|²`. The same DG5.6.3 radial-limit adapter gives ∫_D u*ω₀=∮_(∂D)u*α. The boundary loop is null-homotopic in L in the constant relative class. Apply DG8.4’s factorization of closed-form periods through singular H₁ to i*α to obtain area0; no smooth extension of a mapping-space homotopy is presumed. The image bound and bounded forcing therefore give uniform energy. Extend F2.3's fixed-domain rescaling construction to these inhomogeneous sections: the bounded forcing tends to zero after interior or boundary rescaling. A derivative blowup produces a nonconstant standard-holomorphic plane or half-plane, with the compact-image and uniform totally-real geometry hypotheses retained. Use F2.3's interior and boundary puncture-removal theorem to obtain a sphere or disc bubble. Spheres in ℂⁿ are constant by exactness/Stokes and the holomorphic energy identity; also give the coordinate maximum-principle proof.

   Under the contradiction assumption that no nonconstant disc with boundary in the chosen component exists, prove compactness without bubbling in the original parametrized solution space. For a fixed smooth H obtain smooth convergence up to the boundary. For H varying in nearby bounded C^ℓ families, prove the finite-order W^(r,p) compactness and continuous operator dependence needed for openness of transversality. No varying-domain compactification is used.

   At λ=0 area0 and the holomorphic energy identity imply all solutions are constant. Prove their real-boundary ∂bar linearization is onto with kernel T_xL and boundary-mark evaluation the identity on that kernel. Thus the combined derivative (section,evaluation) in the map variable is an isomorphism. This endpoint calculation precedes the family construction below.

4. **Perturbations, duality and smooth regular families.** Under that contradiction assumption, first apply compactness and item3's endpoint linearization to the base family. Choose 0<δ<1/4 so the endpoint collars are already regular near0 and have no solutions near1, uniformly for sufficiently small perturbations. Fix C′=3R/2 and the compact convex product `K=[δ,1−δ]×Metric.closedBall (0:ℂ) 2×Metric.closedBall (0:EuclideanSpace ℂ (Fin n)) C′`.

   Regard E=ℝ×ℂ×EuclideanSpace ℂ (Fin n) as a finite-dimensional real normed space, with the target factor's Euclidean norm retained under scalar restriction. Package K as a native compact set. Use the existing `ContDiffMapSupportedIn E ℝ ℓ K` carrier and its native derivative sup seminorms. Construct a designated Banach norm synonym whose norm is the maximum of those seminorms for0≤j≤ℓ, with the identity linear homeomorphism to the native topology; do not introduce a competing function carrier or global topology. Prove completeness by uniform convergence of all derivatives and closedness of support in K, and separability by the derivative embedding into a finite product of C(K,V_j). Construct the fixed-support finite-C^ℓ smooth-density adapter here, using native ContDiffBump and convolution ingredients: contract support toward an interior point of the convex K, then mollify inside the resulting margin and prove convergence of derivatives through ℓ. The native smooth compact-open approximation theorem alone is not this finite-C^ℓ result. All functions are global, so this construction assumes no extension theorem on a domain with corners. Add these perturbations to H_base in a small norm ball; the endpoint and exterior data remain fixed. Choose the endpoint collars overlapping the support boundary so that all remaining nonregular parameters lie in (δ,1−δ).

   Run the annihilator argument first at W^(1,p)→L^p, with dual exponent q. A boundary value has |u|≤R<C′; continuity gives an open interior collar with |u|<C′. At an interior point of this collar arbitrary domain-dependent Hamiltonian gradients, supported near (λ,z,u(z)) inside K, span the target. Use F1.2's adjoint identification and interior unique continuation to annihilate the cokernel on the whole connected disc. The independent z variable allows this for multiply-covered maps. Instantiate F0.3's generic closed/split-range lemma for a Fredholm map-linearization plus the bounded Hamiltonian-variation operator: the quotient by the closed map range is finite-dimensional, and the preceding annihilator computation gives surjectivity onto it. F0.3 supplies the bounded finite-complement lifting/right inverse and split universal kernel. This application owns the Hamiltonian computation and the transfer to W^(r,p) by boundary regularity, not another generic splitting lemma.

   Apply F0's Sard–Smale theorem with the preceding C^k budget to the projection from the universal solution manifold to this separable Hamiltonian space. Use uniform no-bubbling compactness to prove regularity is open in a sufficiently strong finite-C^ℓ norm. Smooth density within that open regular set gives a smooth regular family. Do not infer smooth genericity by intersecting a finite-C^ℓ residual set with C∞.

5. **Evaluation and the endpoint contradiction.** Use item3's endpoint computation. Construct the smooth (n+1)-dimensional solution manifold for 0<λ<1 by the Banach implicit-function theorem. For a regular value x₀ of its boundary-mark evaluation into the chosen component of L, construct its one-dimensional constrained manifold using native `levelSetChartedSpace`/`isManifold_levelSet` for the combined (S,ev) map in each Banach chart, with the section bundle trivialized and evaluation in a chart of L. Own the local-to-global input adapter: use the total native chart maps and bundle trivializations to write a total ambient formula agreeing with (S,ev) on its open chart domain, then extend that formula by a constant different from the specified level value outside that domain, and retain all level-set germs and pointwise smooth/strict-derivative hypotheses. The native theorems require those hypotheses only on their level set. This adapter introduces no extra level points. Finite-dimensional Sard applies with the stated k budget.

   Build the boundary chart at (0,constant x₀) directly: the combined derivative of section and evaluation in the map variable is an isomorphism. The parameterized implicit-function theorem over an open λ interval gives a unique curve u=U(λ); restricting it to λ≥0 supplies a half-interval chart. There is no λ=1 endpoint. Assemble the interior charts and this endpoint chart into `ChartedSpace (EuclideanHalfSpace 1) Z` and `IsManifold (𝓡∂ 1) ∞ Z`: transport interior one-dimensional vector charts into the open half-space and prove all interior–interior transitions and their smooth transitions with the IFT chart, where λ is a coordinate with derivative1. Give Z its solution-subspace topology, inherit Hausdorffness and metrizability, and derive second countability from compact metrizability. Use compactness and the unique λ=0 point to confine all λ-small constrained solutions to the IFT neighborhood. Identify the intrinsic boundary with {(0,constant x₀)} and give its collar by λ. This constructs the actual compact boundary-manifold carrier needed below, without assuming a general boundary regular-value theorem.

   Consume [AT Stage6.3's canonical twisted relative fundamental class and outward-first boundary formula](../AlgebraicTopology/README.md), together with Stage2.3/2.6's pair exact sequence and coefficient-system naturality, and Stage6.1/6.3's coefficient-change comparison. In this application reduce the integral orientation local system to constant ℤ/2 by sending either local orientation generator to1; prove compatibility with transport and the boundary identification. This sends [Z,∂Z] to its mod2 relative class, whose connecting image is the sum of boundary point generators. Pair exactness gives i_*∂[Z,∂Z]=0 in H₀(Z;ℤ/2), whereas the single point maps to1 under total-coefficient augmentation. Derive the contradiction. This application constructs that coefficient reduction and count, consuming the existing fundamental class; it does not introduce a second generic degree or one-manifold classification theory.

6. **Periods and exact Lagrangians.** For α=(1/2)Σ(x_jdy_j−y_jdx_j), prove dα=ω₀ and d(i*α)=0. The DG5.6.3 radial-limit Stokes identity of items2–3 and positive holomorphic area give `∫_(∂D)u*α=∫_D u*ω₀>0`. Lift the smooth boundary loop to L using the smooth tube retraction of item1. Consume [DG8.4's integration map on singular homology and DG8.5's normalized de Rham comparison](../DifferentialGeometry/README.md#layer-8-the-de-rham-theorem), on AT's existing singular carriers. The nonzero period proves both that this loop has nonzero real H₁ class and that [i*α]≠0 in de Rham H¹. Export nonzero real H₁ for each component.

   Define exactness by i*α=dF for a smooth real F on L and deduce that no nonempty compact embedded exact Lagrangian exists in ℂⁿ. DG6.2's star-convex Poincaré lemma (using DG5.4's homotopy operator) on ℂⁿ proves this condition is independent of the primitive of ω₀. Identify `StrongDual ℝ (EuclideanSpace ℝ (Fin n))` with its Euclidean vector space by `InnerProductSpace.toDual`. With native cotangent coordinates (q,p)=(x,y), λ_can=Σy_jdx_j and ω_can=−dλ_can, prove α=−λ_can+(1/2)dΣx_jy_j and ω₀=ω_can. Thus (q,p)↦q+ip is symplectic for the native cotangent sign convention. The course primitive Σx_jdy_j differs from α by (1/2)dΣx_jy_j and has the same periods.

### Lane F3: Lagrangian Floer homology, exact case

Construct exact strip theory on a finite-type Liouville completion X of a
specified compact domain, with primitive λ, ω=dλ and outward Liouville field.
Use compact boundaryless embedded exact Lagrangians L_i, λ|L_i=df_i, with
relative-spin/orientation-line data for integral counts, the actual path and
reference-cap sectors, and transverse nondegenerate end chords. Hamiltonians
and all continuation/parameter variations are constant-plus-compactly supported
in a common compact region on each compact parameter sector; subtract their
spatial constants explicitly in the action. On the end λ=ρ α, choose cylindrical
compatible J with dρ∘J=−λ, uniformly in every parameter and constant on the
prescribed asymptotic blocks. This is geometric input, not a conclusion of exactness.

Before compactification prove uniform no escape for differential strips,
continuation strips and the one-/two-parameter families used for chain maps,
inverses and compositions. Put all compact branes, end data and supports inside
{ρ<R}; outside it the equation is J-holomorphic and Δ(ρ∘u)≥0. Use finite-energy
asymptotics and the maximum principle to exclude an exterior maximum, uniformly
for those families. Construct the collar/radial formula and the resulting fixed
compact image K before invoking F2.3. Its proof consumes isolated Liouville
geometry and F1/F2 local estimates, not a later Floer count or FK category.

Also construct the proper cylindrical exact-pair sector with disjoint
Legendrian ends, fixed exterior geometry and compactly supported deformations.
Prove its boundary maximum principle using λ|TL=0 on the ends, its actual
finite/nondegenerate chord condition and uniform confinement on compact
parameter sectors. Export the general conditional strip construction for
specified exact pairs equipped with a proved common compact-image theorem,
the stated finite nondegenerate generators and all F1/F2 regularity/gluing
hypotheses; both declared geometric sectors instantiate this interface.
Hamiltonian invariance carries those allowed-family witnesses.

Use this lane's Hamiltonian convention ι_(X_H)ω=dH. For a chord x from L_0 to
L_1 in a fixed reference sector put
A_H(x)=−∫x*λ−∫_0^1 H_t(x(t))dt+f_1(x(1))−f_0(x(0)),
with the stated reference constant. Derive negative action gradient
∂_s u+J(∂_t u−X_H)=0 and
E=A_(H_-)(x_-)−A_(H_+)(x_+)−∫ℝ×I(∂_sH_s)(u),
including the separately derived moving-primitive/end-reference terms when
these vary. Require finite uniform absolute derivative/extra-term bounds.
Exactness and positive area exclude nonconstant sphere and boundary-disc
bubbles; it does not supply the preceding image bound. Construct the signed
complex, ∂²0, continuation and its relative homotopies from these actual compact
moduli and gluing. Keep closed-base cotangent zero sections and their compactly
supported Hamiltonian images as the self-Morse computation models, with
HF(L,φ(L))≅H_*(L) on the declared grading/local-coefficient conventions.

For the arity-one overlap with FukayaTheory FK4.2, set H_FK=−H_HF, identify
primitive/action/reference and determinant data, and account for its positive-end
cochain input versus this homological strip readout. F3 supplies the strip
construction independently; FK owns its categorical/polygon/self-comparison
applications and their own confinement. No F3 prerequisite is a later FK count.
The special nonexact Heegaard continuation below has its own admissibility and
energy package; no general monotone chapter is required as its replacement.

### Lane F4: Heegaard Floer homology, holomorphically

Ozsváth–Szabó ([arXiv:math/0101206](https://arxiv.org/abs/math/0101206)) §§2–4
over 𝔽₂, consuming F0–F2's analytic/orientation foundations, F3's
formal strip/gluing arguments on independently verified hypotheses, and the
diagram combinatorics of the combinatorial roadmap's Lane H.1. The following
geometric and topological producers precede the analytic counts and their
interpretation as manifold invariants.

**F4.A. Geometric pointed diagrams and the represented manifold.** Before
putting a count on incidence data, construct geometric cut-system diagrams.
For a connected closed oriented smooth surface Σ of genus g, take two actual
handlebodies with boundary identifications, complete systems of compression
discs and their boundary curves, and a basepoint z outside the curves. Curves
within one family are disjoint; opposite families are transverse. Record
orientations, local corner order, complementary regions and their Euler data.
Glue the handlebodies by the specified orientation-reversing boundary
identification. Construct the resulting closed oriented based three-manifold
Y and its based marking. Prove extraction from a smooth based Heegaard
splitting and reconstruction recover that splitting and Y up to the stated
based oriented diffeomorphism. Reconstruction is on the geometric realizable
subclass, not a realization theorem for every abstract region system.

Extract the native `HeegaardRegionSystem`, its generator and domain carriers,
basepoint multiplicities and corner measures. Construct the generator
bijection with T_α∩T_β, the integral two-chain/domain comparison and its
boundary, periodicity, Euler-measure and multiplicity laws. If the chosen
native arc enumeration requires intersections on every curve, arrange them
by explicit small finger isotopies away from z before extracting, and prove
the comparison with the unmodified geometric diagram. Do not impose that
extra combinatorial presentation as a restriction on three-manifolds.
Construct the Mayer–Vietoris identification
H₁(Y;ℤ)=H₁(Σ;ℤ)/⟨[α_i],[β_j]⟩ independently. Map native `CurveHomology`
injectively to its appropriate image in this quotient, with the native
ε(x,y) represented by α arcs from x to y followed by β arcs from y to x.
Its image can be proper; it is not the whole H₁(Y) by definition.

Consume [GeometricTopology Layer9](../GeometricTopology/README.md)'s ordinary
splitting-existence/genus construction and M.5's Cerf/handle comparisons.
Construct the pointed conversion: choose adapted Morse functions and gradient
data relative to the marked point, identify their compression discs, and
translate critical-value exchanges, handle creation/cancellation and changes
of disc systems into surface isotopies, α/β handleslides and genus
stabilizations/destabilizations. Prove disc-system connectivity in each
handlebody by outermost-disc surgery, decreasing the intersection number
with a reference complete disc system. Translate the based Cerf path into a
finite cut-system move sequence after those disc slides. Construct the
converse based diffeomorphism for every move. Track markings, generators,
domain maps and basepoints; the resulting presentation theorem connects any
two diagrams for the same based oriented Y. A path moving the basepoint has
its specified basepoint-moving map, not an identity imposed by quotienting.

**F4.B. Spinᶜ, periodic surfaces and the grading carrier.** Construct Turaev's
nonvanishing-vector-field model and s_z(x) by modifying the adapted Morse
field along the trajectories selected by x. Construct c₁ of its oriented
orthogonal two-plane field and the affine H²(Y;ℤ) action. With the arc
orientation in F4.A prove s_z(x)−s_z(y)=PD(ε(x,y)); check the sign under
reversal and relabelling. Prove the basepoint-change law separately with
its actual traced one-cycle. Construct the topological Spinᶜ torsor and all
its structures, even if a particular diagram has no generator in a chosen
structure; never define Spinᶜ(Y) as the image of its generators.

For a periodic domain P normalized by n_z(P)=0, cap its α/β boundary by the
actual compression discs and smooth the seams to construct
H(P)∈H₂(Y;ℤ). Prove independence of caps up to homology, additivity and
naturality for each pointed move. For singly pointed diagrams identify this
normalized periodic-domain group with H₂(Y;ℤ); give the corresponding exact
sequence when unnormalized domains include the whole surface. Prove by
relative Euler obstruction on the capped surface that
⟨c₁(s_z(x)),H(P)⟩=e(P)+2n_x(P).
Compare F1's clutching/spectral-flow index for an actual Whitney class φ
with the geometric domain formula
μ(φ)=e(D(φ))+n_x(D(φ))+n_y(D(φ)). Use the actual Euler data extracted in
F4.A. Establish its integrality on these geometric classes and its
concatenation, reversal and periodic-translation laws. Native
`maslovIndex` is a rational additive expression with an Euler-data argument;
integrality and this analytic comparison are additional theorems, not
properties of an arbitrary incidence record. For a general periodic
Whitney class the identity is
μ(P)−2n_z(P)=⟨c₁(s_z(x)),H(P−n_z(P)Σ)⟩.
Prove the relative-homotopy/domain exact sequence and the sphere-class
ambiguity in the genera where it applies. Verify the genus-zero/one/two
variants or their specified stabilization comparisons before using the
higher-genus sphere generator, whose μ=2 and n_z=1.

For fixed s let d(s)≥0 generate the image of the c₁(s) pairing on H₂(Y;ℤ).
Construct the relative grading by
gr(x)−gr(y)=μ(φ)−2n_z(φ) modulo d(s), whenever x,y have structure s.
Prove existence of the required connecting class in the declared geometric
range and use the preceding exact sequence in the exceptional cases.
Independence follows from the Chern-period identity and sphere calculation.
Use a relative ℤ/d(s) grading, interpreted as a relative ℤ grading if d(s)=0;
no origin in either torsor is supplied by this construction. Extend to the
flavor generators with gr([x,i])=gr(x)+2i, so U lowers degree by two.
Prove ∂ has degree −1 and allowed continuation/move maps degree zero with
the transported Spinᶜ and relative grading data. Construct these laws before
using a graded invariant; the first ungraded 𝔽₂ complex remains an earlier
milestone. This construction precedes the absolute rational lift in item5.

**F4.C. Admissible presentations and globally connecting moves.** Define weak
admissibility for a fixed s using nonzero normalized periodic P with
⟨c₁(s),H(P)⟩=0: P has positive and negative coefficients. Define strong
admissibility for fixed s by requiring that every nonzero normalized P with
⟨c₁(s),H(P)⟩=2r≥0 has a coefficient greater than r. Keep these distinct
from native `WeaklyAdmissible`, which tests all normalized periodic domains.
Give the precise implication from that stronger incidence condition and
the comparison on the zero-pairing sublattice; do not identify the
predicates by their names.

Construct winding away from z along finitely many auxiliary curves dual to
the relevant periodic-domain lattice. Choose an integral lattice basis,
bound the c₁ functional by its basis coefficients and construct winding
regions whose positive and negative coefficients detect a norm on that
lattice. Prove the resulting coefficient estimates uniformly for every
lattice element, including elements with unbounded coefficients. Choose
the winding amounts to dominate the c₁ bound; a finite check of basis
domains alone is not strong admissibility. This gives weak and strong
admissible presentations for each fixed Spinᶜ structure and simultaneous
ones for a specified finite set of structures. State separate bounds for
the weak zero-pairing sublattice and the strong inequality.

Prove relative winding with prescribed endpoint diagrams and a finite
ordinary move sequence: add common auxiliary windings away from the
supports, transport them across each elementary move, and compare the
endpoints by admissible unwinding/rewinding moves. Construct a connecting
sequence whose intermediate diagrams and required triples satisfy the
appropriate fixed-s admissibility, with the finite lattice estimates for
each stage. Arbitrary unmodified Cerf paths need not stay admissible.
Track the Spinᶜ, domain, basepoint and based-manifold marking maps. Supply
the compatible triangle and compact-parameter versions consumed by F4.3a;
prove their topological winding part without using later Floer counts.
Then item3 proves the positive-domain finiteness and analytic energy
bounds on these data. This is the global presentation/connectivity input
for promoting the specified move equivalences of item4 to HF̂(Y,s).

**F4.M. Balanced multipointed geometry shared with reconciliation1.** For
b≥1 marked points use k=g+b−1 curves in each family: compressing along
either complete family gives b spheres, or cutting the corresponding
handlebody along its discs gives b balls, each containing exactly one
marked point. Construct the equivalent balanced geometric definition and
its incidence extraction. Use Sym^k(Σ), T_α,T_β of dimension k and all
divisors V_(z₁),…,V_(z_b). The hat differential avoids every divisor.
Prove the multipointed index and periodic-domain comparisons on this
carrier, rather than apply the singly pointed sphere calculation unchanged:
in the higher-degree symmetric-product range a sphere generator has
μ=2b and n_(z_i)=1 for every i. The grading expression uses
μ−2∑_i n_(z_i), and each individual U_i lowers degree by two when
the corresponding polynomial version is constructed. Relate its periodic
and relative grading data to the auxiliary singly pointed presentation in
R1.twisted, keeping the actual extra H₂ classes and low-degree exceptions.
Construct pointed extraction/reconstruction, based moves, relative
period and admissibility comparisons for this balanced carrier, including
g=0,k=0 and the explicit low-genus stabilizations. Forgetting marks in an
unbalanced tuple is not a basepoint-stabilization theorem.

Construct the local basepoint-addition operation, adding one α curve,
one β curve and one point, and its inverse together with the comparison
of represented Y. Prove the raw chain homotopy equivalence
CF̂_(b+1)(Y)≃CF̂_b(Y)⊗W, where W has two generators, zero differential
and relative degree difference one. Keep the actual choices and grading
shifts attached to the maps; b=1 recovers the ordinary theory. Ordinary
genus stabilization, basepoint addition and connected sum with S¹×S²
have different presentation data even where chain comparisons relate
them. Construct those comparisons rather than equate the operations.

Consume the combinatorial carriers and nice-diagram moves of
[CombinatorialHeegaardFloer LaneH](../CombinatorialHeegaardFloer/README.md).
Here construct their smooth balanced realization, niceification by
admissible pointed moves, and the holomorphic-count bridge: an index-one
class avoiding all z_i in a nice diagram contributes exactly when its
nonconstant domain is an empty embedded bigon or rectangle, with the
specified constant coordinates; each such domain contributes one over
𝔽₂ and all other domains contribute zero. Prove existence, uniqueness
modulo translation and regularity in the two local models by the surface
holomorphic mapping argument, the product/symmetric-product comparison
and F1/F2 estimates; exclude other domains by positivity and the index
formula. This local surface argument does not require the cylindrical
moduli-of-domains package of F5. Nice-diagram combinatorics alone is not
this analytic identification. Its integral version includes coherent
orientations and the actual signs. This early balanced hat construction
also supplies the relevant underlying geometry to F5, without consuming
its later link-hypercube or bordered pairing theorems.

1. **`Sym^g(Σ)` geometry:** smooth complex structure (elementary symmetric
   functions), totally real Heegaard tori T_α,T_β, π₂ and relative-period
   calculations (including the low-genus exceptions before using the g>2
   formula), the basepoint divisor V_z and positivity n_z≥0. Construct
   Perutz's Lagrangian realization rather than infer exactness: choose a small
   λ>0 and a positive surface area form satisfying the handleslide area
   equation ∫_D α=(1+λ)∫_A α−2λ in the source's fixed η,θ normalization.
   Construct the smooth taming/Kähler form in class η+λθ agreeing with the
   product form near the relevant tori. Preserve disjointness from the divisor
   and make both tori Lagrangian for this form. Totally-real boundary analysis
   remains the general F1/F2 input; it does not substitute for the Lagrangian
   form needed by this Hamiltonian-handleslide route.
2. **Geometric index and Spinᶜ comparison:** consume F4.A/B's actual
   extraction, s_z, capped periodic surface and relative grading maps.
   Compare the native rational expression `e(D)+n_x(D)+n_y(D)` with the
   analytic index of each actual Whitney class using F1's boundary
   clutching/spectral-flow construction. Record geometric integrality,
   the Chern-period and sphere identities and the low-genus variants
   before using them for finiteness or graded counts. This milestone
   supplies the comparison; a formal rational expression is not its proof.
3. **Nearly-symmetric J and admissibility:** instantiate F0/F1's actual
   universal-section and Oh/Sard–Smale hypotheses, keeping V_z holomorphic and
   the required product behavior; prove the comparison with the chosen smooth
   symplectic form. On F4.C's actual fixed-Spinᶜ weak/strong admissible
   data construct positive-domain/periodic-domain finiteness and energy
   bounds with fixed asymptotics, Maslov index and n_z before
   compactification. Compare the native all-periodic finiteness theorem
   only where its stronger hypothesis holds; prove the zero-Chern-slice
   version needed by the stated weak condition. Give uniform
   compact-parameter versions.

   **F4.3a. The handleslide triangle/degeneration floor.** Before handleslide
   counts, construct the actual admissible pointed triple
   (α,α′,β,z), its distinguished α–α′ corner and the relative-period map.
   Establish precisely the periodic-domain/admissibility restrictions needed
   to make the nonnegative triangle classes finite at fixed index and n_z;
   construct compatible admissible choices from the endpoint diagrams. Prove
   the resulting area bound, including the moving-boundary disc class and
   its area determined by the relative-period/Maslov/divisor data. Construct
   the strip-to-triangle-plus-disc degeneration and smoothing of relative
   classes, with additive area and bounded connection-curvature contribution.
   Verify low-genus variants separately rather than reuse π₂=ℤ outside its
   range. This early finiteness/energy floor is independent of the later
   triangle cobordism-map counts. An exact-strip theorem is not this input.
4. **HF̂ over 𝔽₂ and allowed Heegaard continuation:** construct ∂²0 with
   the actual divisor/boundary-degeneration analysis. For a handleslide use
   the two-intersection local pattern, the area-balanced Lagrangian form and
   basepoint outside the sliding region; construct its Hamiltonian isotopy
   and fixed-end reparametrization. Build moving-boundary section spaces,
   operators and determinant identifications, converting the generator sign
   to ι_(X_H)ω=dH. Construct the Hamiltonian-fibration coupling form and check
   its actual boundary restrictions; derive the energy identity and uniform
   bounds using F4.3a, then compactness, regularity, gluing and all oriented
   boundary formulas. Prove chain-map, inverse and composition homotopies
   with the same energy bounds and divisor control. Construct comparison
   with nearly-symmetric J and the original diagram complex. The hat map
   uses n_z0. Track the CF∞ lattice/subcomplex/quotient maps producing CF−
   and CF+, and their integral orientation-system extension in item5.
   Prove isotopy, auxiliary/form and stabilization comparisons on their
   actual allowed data. Compare the handleslide map with the triangle map
   on the declared admissible triples by the section gluing/degeneration
   comparison, including its chain homotopy and orientation/divisor data;
   do not claim that
   the citation eliminates the triangle-finiteness proof or reduces this
   nonexact application to F3's exact continuation.
   Use F4.A/C's based presentation theorem and admissible connecting
   sequences to promote these specified diagram equivalences to the
   invariant of the represented oriented based Y. Retain the chosen
   move maps; coherent independence of arbitrary paths and nontrivial
   basepoint actions are the JTZ milestone, not a quotient declaration.
5. **Then, staged:** construct orientation systems and the integral signed
   theory; CF^∞ and its actual subcomplex/quotient giving HF^− and HF^+
   (including OS Theorem3.15's boundary degenerations); holomorphic
   triangles and cobordism maps; surgery exact triangles; normalized
   absolute rational gradings and correction terms; and JTZ naturality.
   Each stage has its own construction and does not block the initial
   ungraded/relatively graded hat invariant. Retain all non-torsion Spinᶜ
   and positive-b₁ versions of the flavors with their actual relative
   grading sets; an absolute ℚ grading is not asserted for non-torsion c₁.

   **F4.5q. Absolute grading before numerical d.** For torsion Spinᶜ
   structures construct the absolute rational lift, normalized by the
   generator of HF̂(S³) having degree zero and U having degree −2.
   Start from surgery presentations and adapted pointed triples for
   reference cobordisms, their topological Spinᶜ extensions and F4.B's
   integral triangle/Whitney index comparisons. Construct the grading
   of every generator using the index of a reference triangle class,
   basepoint multiplicities and the topological cobordism correction;
   a class need not have a nonzero counted map to define its index.
   Construct reference classes and prove independence from the chosen
   class, presentation, auxiliary generators and Spinᶜ extension using
   periodic-domain identities, handle moves and triple gluing. Compute
   the standard generators on #^r(S¹×S²) with their exterior-algebra
   degree shifts; do not choose an arbitrary origin in each relative
   torsor. Display the triangle grading formula on the actual carriers
   and derive its normalization from the zero-, one- and two-handle
   models, rather than assuming a desired absolute lift as input.

   Prove that the lift refines F4.B's relative grading and that maps for
   an oriented cobordism W with torsion boundary Spinᶜ restrictions are
   homogeneous of degree
   (c₁(t)²−2χ(W)−3σ(W))/4.
   Define the rational square using a rational relative lift of c₁(t),
   prove independence, and handle disconnected boundary/handle
   normalizations with the specified tensor factors. Prove composition,
   orientation-reversal and auxiliary-choice laws with the same triangle
   and topological index computations. No numerical d is defined before
   this normalization and its invariance are available.

   For a rational homology sphere and its Spinᶜ structure, construct the
   HF^∞→HF^+ comparison and its tower/finite-generation theorem, and
   define d as the least absolute grading of a nonzero class in its
   image in the usual tower convention. Prove existence of that least
   grading, the S³ value zero, orientation and cobordism laws. Treat
   positive-b₁ correction-term variants in their own milestones with
   the specified tower, exterior-action and torsion hypotheses; do not
   use the rational-homology-sphere definition without them. Naturality
   then constructs the coherent based systems and the actual
   nontrivial basepoint-moving actions on these normalized theories.

### Lane F5: cylindrical, bordered and knot Floer constructions

Construct the following stages in order. They extend F1–F4 with moving punctured
and bordered domains; they are not applications of fixed-domain compactness
without a domain comparison. Use [Lipshitz's cylindrical account](https://arxiv.org/html/math/0502404)
and its [erratum](https://arxiv.org/html/1301.4919),
[BEHWZ](https://arxiv.org/html/math/0308183),
[LOT's bordered construction](https://arxiv.org/abs/0810.0687) and
[its bimodule sequel](https://arxiv.org/abs/1003.0598) for the specified classical
curve sectors. Polyfolds and virtual techniques are not premises of these stages.
Every regularity, compactness and gluing statement below is a construction target;
a citation or an expected dimension is not a regularity witness.

**F5.0. Carriers, domains and dependency order.** Reuse F0's Fredholm,
parameter and orientation APIs, F1's bundle-valued Sobolev/CR and weighted-end
interfaces, F2's local estimates, removal and intersection positivity, and
F4's pointed diagrams, domains, Spin^c structures and Heegaard moves.
Consume the **closed-source** interfaces specified by
[AnalyticStableMaps M0–M3](../AnalyticStableMaps/README.md): normalized labelled
nodal domains and their actual automorphism arrows, universal normalization
families, finite-dimensional domain deformation and plumbing charts with
base-change/forgetting laws, stable-domain compactness, map normalization,
uniform energy threshold and varying-domain map compactness. Retain that
supplier's stated domain prerequisites, stabilizing-mark and protected-collar
hypotheses. These are closed-source construction interfaces, not an existing
native bordered-moduli package. They consume the earlier HF analytic layers,
not F5. Construct here the additional bordered/punctured normalizations,
end coordinates, asymptotic markers, boundary labels and matching maps. A closed-source theorem is not already a theorem with Lagrangian
boundary or cylindrical ends. Construct finite-dimensional local domain-moduli
slices with automorphism arrows, low-genus stabilizing marks and their
forgetting maps; keep these auxiliary marks separate from the original marked
points. For these slices construct the actual Sobolev bundles, CR sections,
completion changes and elliptic regularity/finite-order budgets before applying
F0. Keep ordinary moduli and their regular loci distinct.

Reuse [DGAInfinity Layers0–4](../DGAInfinity/README.md)'s DG/A-infinity
algebras, modules, bimodules, bar tensor, suspension signs and comparison maps;
F5 owns their **bordered geometric** inputs and type-D specialization below.
Reuse [CombinatorialHeegaardFloer LaneALG and LaneG](../CombinatorialHeegaardFloer/README.md)
for filtered/bigraded complexes and grid constructions. The holomorphic
comparison is owned here. F3's cotangent strip construction remains earlier
than its comparison with FukayaTheory FK4.2: that comparison consumes the
actual shared compact-image, sign, cap and grading data and does not supply
F3's analytic construction by a reverse dependency. None of the bordered
counts is obtained merely by invoking a generic Fukaya category.

**F5.1. Cylindrical curves and corrected indices.** For an admissible pointed
Heegaard diagram of a closed oriented three-manifold, construct
`W=Sigma x [0,1]_s x R_t`, with boundary conditions
`alpha_i x {1} x R` and `beta_i x {0} x R`. Generators are the unordered
g-tuples of transverse alpha/beta intersections occupying each attaching
circle once. At the two ends use the associated g-tuples of interval chords,
with specified negative and positive asymptotics. Work with genus g>1 in the
analytic model and construct stabilization/low-genus comparison maps, so this
condition does not restrict the represented three-manifolds.

Construct the tame, translation-invariant cylindrical almost complex structures:
split near the chosen region/basepoint cylinders, preserving the Sigma tangent
planes in the split branch and satisfying **`J partial_s=partial_t`**. For the
relaxed distribution branch used by the boundary-degeneration argument construct
its actual taming, symmetry and adjusted-end comparisons. Require finite energy,
no projection-constant source component, one boundary arc for each attaching
circle, the specified end limits and the embedded-curve condition in the
cylindrical count. Domains may be disconnected. Prove exponential convergence
and that the projection to the strip is a degree-g branched covering. Construct
the relative homology/domain carrier, concatenation, local intersection
multiplicities and the dictionaries with F4's Whitney classes; do not discard
topology or label data when passing between them.

The Banach map space is formed in the boundaryless ambient
`Sigma x R_s x R_t` with the same boundary constraints. Prove by the holomorphic
projection and end conditions that actual solutions lie in the strip. Use
finite-dimensional domain-moduli parameters, not all complex structures on the
source as extra unquotiented directions. Construct the actual linearized
operator, domain-deformation quotient, finite-dimensional end-translation
summands and determinant comparison with F1. Prove transversality for the
somewhere-injective/embedded sectors used in the counts using allowed local
J-variations and F0's sharp theorem with its actual budget; a multiply covered
component cannot be assigned regularity by that argument.

For a class A define Euler measure `e(A)` and the quadrant-average endpoint
multiplicities `n_x(A),n_y(A)`. Construct the fixed-topology Fredholm formula
`ind(u)=g-chi(S)+2e(A)`. For an embedded holomorphic representative prove
`chi(S)=g-n_x(A)-n_y(A)+e(A)` and hence
`mu(A)=e(A)+n_x(A)+n_y(A)`, with the translation quotient reducing dimension
by one on its free locus. For the **topological representatives used in the
proof**, allow transverse positive and negative double points and prove
`chi(S)=g-n_x(A)-n_y(A)+e(A)+2(d_+-d_-)`; the diagonal intersection includes
both ramification and `2(d_+-d_-)`. Construct those representatives, the
addition-of-Sigma/stabilization reduction and the index comparison. Do not
assume every positive domain has an embedded topological representative, or
that a g=1 representative construction proves the g>1 argument.

Construct weak/strong admissibility, admissible moves and the actual finiteness
lemmas on each declared Spin^c/coefficient version. Weak admissibility controls
nonzero periodic domains with zero c1 pairing; strong admissibility uses the
positive c1 bound and its coefficient inequality. Transport area, basepoint
multiplicity and index constraints to prove finiteness of each coefficient in
the selected hat/minus/plus/infinity chain carrier, with its stated support or
completion. Positivity alone does not imply that finiteness.

**F5.2. Varying-domain compactness with ends and boundary.** Define the topology
of convergence to labelled nodal, multilevel buildings: convergence on compact
subsets away from nodes/punctures after the actual domain reparametrizations,
neck lengths, compatible asymptotic markers and independent level translations,
plus matching along limiting chords or periodic orbits. Define stability,
constant components, trivial cylinders, level equivalence, omega-energy/action
balance and homology conservation. The supremum defining end energy is not
asserted additive under breaking. Prove Hausdorffness and the sequential-to-topological compactness
passage on the declared countable presentations, rather than assuming the
quotient is a manifold.

Build the symmetric cylindrical-end compactness theorem in the BEHWZ regime.
The end datum on a closed oriented (2m-1)-manifold V is a stable-Hamiltonian
pair `(lambda,omega_V)`: omega_V is closed of rank2m-2,
`lambda wedge omega_V^(m-1)` is positive, and its normalized characteristic
field R satisfies `lambda(R)=1`, `i_R omega_V=0`, `i_R d lambda=0`.
On `R_a x V` require translation-invariant J with `J partial_a=R`,
J preserving `xi=ker lambda` and `omega_V|xi` compatible with J|xi.
The contact case is `omega_V=d lambda`; also retain the closed-lambda/Levi-flat
case used by cylindrical HF. In the HF product convention the end dictionary
is `a=-t`, `lambda=ds`, `omega_V=dA`, `R=partial_s` before its separate boundary
adapter; do not identify a with t and reverse the corrected F5.1 sign.
Use a compact symplectic core with these adjusted ends, fixed source
signature/marked asymptotic components, and nondegenerate or Morse–Bott
periodic data (smooth period-T orbit manifolds with tangent kernel of the
return map minus identity and locally constant restricted omega rank).
For `u=(a,f)` use `E_omega=integral f*omega_V` on the ends, adding core
symplectic area, and Hofer end energy
`E_lambda=sup_phi integral (phi o a) da wedge f*lambda`, for smooth
nonnegative compactly supported phi of integral1; use the corresponding
independent test functions on the two half-ends. Require a uniform bound
on `E_omega+E_lambda`, not merely ambient area or E_omega alone. Construct
its positivity, omega-energy additivity, action bounds and compact-parameter
comparison estimates, with the actual Morse/Morse–Bott asymptotic estimates.
Prove thick/thin domain decomposition, controlled stabilization, gradient
bounds, interior bubbles, no residual neck energy, finite level/graph bounds,
removal and convergence to a stable building. For splitting/stretching a
closed target along a cooriented hypersurface prove the corresponding
symmetry/adjusted hypotheses and the one-parameter compactness statement.
These closed-end results do not themselves supply Lagrangian boundary
compactness. Construct the **additional** boundary monotonicity and rescaling,
boundary removal, strip/chord asymptotics and corner/flag matching for the
cylindrical HF and bordered HF models. Use actual collar/product data and
totally real boundary conditions; any reflection/doubling argument constructs
its extended equation and regularity instead of presuming the reflected J
is smooth. For compact parameter families prove all estimates uniformly.

For the cylindrical HF degree-g embedded sectors prove which closed, boundary
and projection-constant components can occur in the limiting building. Use
positivity, admissibility, degree/multiplicity and the corrected index to
exclude precisely the unwanted codimension-one bubbles for the differential
and continuation moduli. Retain the boundary-degeneration terms where F4's
plus/minus/infinity and triangle constructions require them. A generic
energy bound or the absence of bubbles in an exact cotangent application is
not a proof of those exclusions. For each zero/one-dimensional moduli space
state the selected regular components and prove its compactification has
exactly the asserted finite set of broken/boundary strata. Higher or covered
strata remain part of compactness and are excluded from these counts only by
the proved dimension/positivity argument, not by deleting them from the
compactified carrier.

**F5.3. Gluing, counts and the symmetric-product comparison.** For each regular
broken configuration in those compactifications construct the weighted
pregluing, cutoff/error estimates, matched finite-dimensional kernels and
uniform right inverses on complements. Choose the weight below the actual
end spectral gap; retain zero modes as matching variables. Prove contraction,
uniqueness, surjectivity onto an end neighborhood and compatibility with
translation, domain automorphisms and overlapping gluing charts. Construct
the determinant gluing maps using F0/F1, with ordered end, domain and neck
parameters, and prove the two-break/corner signs. This yields d squared zero,
continuation/homotopy maps and isotopy/handleslide/stabilization comparisons,
including polygons and the boundary degenerations in their stated versions.
F0's canonical orientation-cover transport does not supply a chosen linear
parallel transport on determinant fibers.

Construct the cylindrical-to-symmetric-product map from a degree-g branched
cover of the strip and its Sigma map by taking the unordered fibre, retaining
multiplicities. Construct its inverse as the **normalization of the pulled-back
universal divisor**, with the actual extension over branch points and the
diagonal. Prove the equivalence on the precise J/domain sectors used to count,
including finite energy, boundary/end data, domain classes, basepoint
multiplicities, index, regularity and compactified convergence. Do not assume
an ordered lift across the diagonal is a covering without proving its local
normalization and ramification assertions. Construct split/nearly-symmetric
J continuation and gluing comparisons with F4's chosen regular model, rather
than claiming all arbitrary almost complex structures correspond literally.
The chain maps, inverse homotopies and determinant-line/coherent-orientation
comparisons prove equivalence first over F2 and then with the declared integral
orientation systems; prove compatibility with U actions, Spin^c splitting,
relative/absolute gradings where defined, triangles and the Heegaard moves.
A bijection of generators alone proves none of these chain comparisons.

**F5.4. The bordered algebra and finite tensor interface.** Use a pointed matched
circle Z: an oriented circle with basepoint and 4k other points paired so
surgery on the pairs gives one circle. Construct its genus-k surface with
parametrized distinguished disk, orientation reversal and based surface
identification. Over F2 construct the strands algebra with basis partial
upward bijections `phi:S->T`, multiplication by composable concatenation only
when inversion counts add, and differential resolving one inversion with
inversion count decreased by one. Prove the product/unit/idempotent laws,
d squared zero and Leibniz. Construct the matched subalgebra by the sums over
matched horizontal-strand completions; prove it is closed under differential
and multiplication and identify its primitive idempotents. Retain the occupancy
summands `A(Z,i)`, the connected-boundary summand i=0 and the additional summands
needed by the specified two-boundary gluing. Construct the actual orientation
reversal/opposite and noncommutative grading-group/idempotent-refinement maps;
do not replace their grading sets by an unqualified integer grading.

DGAInfinity's generic hierarchy is uncurved and integer-cohomologically
graded. Construct the **bordered F2 specialization**, not an identification
of a relative grading set with Z. Its underlying carrier is an idempotent
F2-module with square-zero differential; retain the actual central Maslov
shift lambda in the noncommutative grading group and its module/bimodule
grading sets, with differential shifting by lambda inverse in the homological
convention. Construct the supported component families, balanced grading-set
tensors over the idempotents, ordered group-action laws, suspension and the
component formulas for products, operations, morphisms and homotopies. Prove
these specializations commute with forgetting the grading, tensor associators
and the finite bar/box differential. Reuse the generic multilinear and bar
mechanisms wherever their hypotheses apply, transporting their equations to
this particular carrier; an integer grading is not inferred from a central
Z-action. Only when an actual compatible integer lift has been supplied,
construct its Z-cochain specialization, using cohomological degree = minus
homological degree, and compare all suspension signs and maps with the
DGAInfinity modules/bimodules and derived tensor. Keep the relative grading-set
version independently, including its grading-refinement change maps.
Construct the type-D interface
`delta1:N->A tensor_I N` over the idempotent ring I, its iterates and the
structure equation `(d_A tensor 1)delta1+(mu tensor 1)(1 tensor delta1)delta1=0`,
with the stated grading conversion. Prove its induced DG-module and bar
comparison, morphism/homotopy laws and strict units. Construct the box tensor
of a right type-A module M with a compatible type-D structure N over I:
`d(x tensor y)=sum_k (m_(k+1) tensor 1)(x tensor delta^k(y))`.
Prove finite evaluation whenever the actual boundedness hypotheses hold,
d squared zero and comparison with the derived/bar tensor. Store the
hypotheses for each tensor: finiteness of the generator set alone is not
boundedness of all iterated structure maps. Prove associativity and
homotopy-invariance with their actual one-/two-sided boundedness conditions;
an infinite formal sum is not an ordinary tensor differential.

**F5.5. Bordered curves, modules and pairing.** Construct provincially admissible
bordered Heegaard diagrams with parametrized boundary, alpha arcs/circles,
beta circles and generator occupancy. Complete the cylindrical surface at
the boundary and define the east punctures and ordered Reeb-chord lists,
height/evaluation maps, domain classes and multiplicity constraints. Construct
the allowed almost complex structures, weighted Fredholm/domain-moduli
carriers and index formulas, including the actual boundary monotonicity and
embeddedness conditions used by the counts. Prove admissibility/finiteness,
regularity of the selected sectors and compactness by F5.2's **bordered**
adapter. Classify every end of the relevant one-dimensional moduli: breaking,
chord collisions/joining/splitting and boundary degeneration. Match these
with the strand differential/product and the type-A/type-D equations.

For boundary parametrized by F(Z), construct the right module CFA over A(Z)
and the type-D structure CFD over A(-Z), with their actual idempotent and
Spin^c/relative grading data. Construct admissible winding/move comparisons,
inverse homotopies and invariance under the allowed bordered moves and
based reparametrizations. For a strongly bordered cobordism with two labelled
boundaries construct AA, DD and DA bimodules by the arced/drilling models and
explicitly compare their moduli, coefficient actions, grading refinements and
one-/two-sided boundedness. These are concrete specializations of the generic
bimodule algebra; they do not commission a second generic hierarchy.

Prove the pairing equivalence
`CFhat(Y1 union_F Y2) ~= CFA(Y1) box_A(Z) CFD(Y2)` for compatible parametrized
boundaries `partial Y1=F=-partial Y2`, with admissible representatives making
the tensor defined. Identify generators, then construct neck-stretching
matched curves, simultaneous chord-height constraints and their rescaling/
gluing maps; prove the finite sums match the box differential and continuation
maps. Construct the bimodule gluing comparisons, mapping-cylinder identity
and composition homotopies, including the grading and boundary-orientation
maps. Construct the torus-boundary solid-torus models, filling and surgery
triangle comparisons and their knot-complement applications. Keep these
classical F2 bordered constructions distinct from F4's integral orientation
systems; an integral enhancement requires its actual signed chord/strand
and gluing comparisons and is not inferred from the F2 pairing theorem.

**F5.6. Doubly pointed knots, filtrations and the grid comparison.** Construct
an oriented knot from a doubly pointed Heegaard diagram and prove its agreement
with the geometric knot carrier and the allowed based Heegaard moves. Retain
relative Spin^c structures for knots in closed oriented Y; for null-homologous
knots choose a Seifert class to normalize Alexander grading and prove its
change-of-choice law. Keep absolute Maslov gradings restricted to their
actual torsion/canonical-normalization hypotheses. Define the w/z
multiplicities, prove positivity and the relative Alexander formula
`A(x)-A(y)=n_z(phi)-n_w(phi)`, with the U exponent and filtration shift
included. Construct CFK-minus/infinity/plus and hat subquotients on their
actual coefficient/support carriers, prove d squared zero and filtered
invariance by the F5.2–F5.3 compactification/gluing argument, and identify
the underlying singly pointed HF complex after forgetting the knot
filtration. Distinguish the **filtered** differential, which weights the w
multiplicities, from its Alexander associated graded, which retains the
zero-z contribution. Construct the graded Euler characteristic/Alexander
normalization and the S3 tau definition and filtered maps used by the
combinatorial reconciliation.

For the S3 knot/link grid comparison use the multipointed toroidal diagram
with the actual extra attaching curves and one w/z pair in every complement
component. Compare its generators, Spin^c/Alexander/Maslov data and polynomial
variables with CombinatorialHeegaardFloer's LaneG/ALG carriers. Prove that
index-one contributions in the specified zero-X sector are exactly the
appropriate empty embedded rectangles and have the asserted mod-two count;
construct the index and domain arguments excluding every other contribution.
For the full filtered complex allow the X multiplicities prescribed by its
filtration, rather than silently using the associated-graded differential.
Prove analytic maps for grid commutation/stabilization and compare them with
the combinatorial maps and homotopies. Treat multipointed destabilization
and variable identifications explicitly: the all-variables-zero hat HFK
comparison includes the factor `V^(n-1)` for an n-pointed knot grid, where
V has bigradings (0,0) and (-1,-1). Construct the single-variable hat/minus
and full filtered comparisons separately; do not cancel those factors
without the pointed stabilization theorem. For links retain component
variables and Alexander multigradings and the corresponding basepoint
factors. Reconciliation3 consumes these chain-level comparisons and their
grading/filtration conventions, not just an equality of homology ranks.

## Reconciliations (the seams, and the long pole)

These are the "the two definitions agree" theorems that join each combinatorial
invariant (built in the
[combinatorial roadmap](../CombinatorialHeegaardFloer/README.md)) to its holomorphic
counterpart built here. Every one depends on the analytic tower above, so the
analytic track is the blocker, and the reconciliations are owned and tracked here
rather than split across both roadmaps. The combinatorial side keeps only pointers
back to this section.

1. **Raw, stable and twisted nice-diagram comparisons.** Construct three
   different comparisons on F4.M's balanced b-pointed geometry and all
   its basepoint divisors, with k=g+b−1. The coefficient field here is
   𝔽=𝔽₂; the integral signed extension remains a separate target.

   **R1.raw.** Identify the combinatorial nice complex with the
   holomorphic complex by the actual generator/domain bijections and
   F4.M's empty-bigon/rectangle count theorem. For a connected Y prove
   H(CF̂_b(Y))≅HF̂(Y)⊗W^(⊗(b−1)), with W the two-dimensional zero-
   differential factor and its relative grading difference one.
   Construct chain-level basepoint-addition and comparison maps, their
   inverses up to homotopy and their compatibility with the transported
   markings and Spinᶜ structures. This factor remains for rational
   homology spheres: b₁(Y)=0 does not remove extra basepoints.

   **R1.stable.** Construct the stable object represented by a complex
   together with its point count, using the specified equivalences
   (C,b)↦(C⊗W,b+1). Prove nice-move invariance and identify this object
   with the Ozsváth–Stipsicz–Szabó stable invariant of
   [arXiv:0912.0830](https://arxiv.org/abs/0912.0830), using R1.raw and
   admissible connectivity. Keep the tensor-factor/point-count maps;
   cancellation of a vector-space rank is not a canonical ordinary HF̂
   identification. All identifications carry their actual relative
   gradings and later F4.5q's absolute normalizations where defined.

   **R1.twisted.** Construct the auxiliary singly pointed presentation
   of Y_b=Y#^(b−1)(S¹×S²) associated to the balanced diagram and identify
   its generators/counts with the relevant all-divisor model. Identify
   H₂(Y_b;ℤ), its periodic domains and the additional point-stabilization
   classes explicitly. Use the group ring R=𝔽[H₂(Y_b;ℤ)], not an
   unannounced identification with 𝔽[H₂(Y;ℤ)]. For each Spinᶜ sector
   choose reference generators, paths and caps and construct an
   additive assignment A(φ)∈H₂(Y_b;ℤ) on Whitney classes. Prove
   A(φ*ψ)=A(φ)+A(ψ), its periodic-domain normalization and its vanishing
   on the relevant sphere ambiguity. Weight a rigid class by the
   group-ring basis element t^A(φ). Prove finiteness and ∂²=0 over R
   using admissibility and the actual additive labels on broken ends.
   Changing references gives the explicit diagonal monomial chain
   isomorphism x↦t^a(x)x, with its inverse and compatibility with the
   induced homology-group/ring identifications. Construct the weighted
   nice-count, move, stabilization and coefficient-change chain maps;
   prove their gluing and choice-change laws. Fixing an additive
   assignment is data, not a consequence of abstract incidence alone.

   For rational-homology-sphere Y and the summand s#s₀ on Y_b, prove
   the separate twisted comparison: the auxiliary S¹×S² factors have
   the Koszul differential t_i+1, so the twisted homology is HF̂(Y,s)
   with R acting through the augmentation on those free H₂ factors.
   Construct this connected-sum/weighted-chain comparison and its
   coefficient action, rather than infer it from R1.raw. Other Spinᶜ
   sectors and positive-b₁ manifolds retain their own twisted groups;
   make only the comparison established on their actual coefficients.

   In the twice-pointed S³ example the raw complex has two generators
   and zero differential over 𝔽, hence rank two. Its twisted comparison
   has R=𝔽[t,t⁻¹] and differential multiplication by 1+t; this is
   injective, and its homology R/(1+t) has 𝔽-rank one. Augmenting
   t↦1 at the chain level produces the rank-two raw complex. Prove the
   derived coefficient-change/Tor comparison that accounts for the
   extra class; do not commute homology and nonflat augmentation.
   These are three distinct theorems, all owned here; none is replaced
   by the other two or by a bare rank calculation.
2. **Completed lattice/surgery comparison and its extension problems.**
   The source-backed first theorem is for an integrally weighted spherical
   plumbing TREE G, Y(G)=∂X(G) with outward-boundary orientation, over
   𝔽₂[[U]]. Construct the full lattice chain complex, not only its
   lattice-degree-zero/cohomological invariant. Fix the characteristic
   labels, their restriction to Spin^c(Y), actual [K,E] generators, U weights
   and grading conventions with combinatorial Lane L. Construct both chain
   completions and continuous maps before passing to homology. Prove the
   completed 𝔽₂[[U]]-module isomorphism; preserve the source's relative
   grading conclusion for b₁(Y)=0. Do not assert the b₁>0 exterior-H₁ action
   compatibility without its separate comparison theorem.

   **R2a. Actual surgery engine.** Construct multi-pointed link complexes,
   sublink localizations, Alexander/Spin^c decompositions, explicit arc
   systems, admissible complete hyperboxes and their compression. Define all
   higher polygon arrows and prove the full hypercube differential and
   comparison homotopies, using F4's actual multi-diagram energy,
   compactification, orientations and gluing. Prove the completed link
   surgery formula, its framing/basepoint/arc changes and naturality; a
   surgery exact triangle is only its one-dimensional case. Construct the
   Hopf-link and rooted-tree gluing/merge models and the pairing
   comparisons. Supply the finite-generation/continuous tensor hypotheses
   before replacing the pair-of-pants model by the merge model; retain the
   additional homology-action terms when both summands are essential.
   These are explicit F4.5/F5 application targets, not an assumed general
   bordered theorem or input from a later reconciliation.

   **R2b. Filtered perturbation/completion.** Construct chain contractions
   with πi=id, iπ−id=dh+hd and h²=πh=hi=0 in the declared coefficient
   category. Transfer all hypercube arrows by finite sums over strictly
   increasing cube paths, with continuous extension on the completed
   carriers and actual signs in the integral version. For the mod2 tree
   theorem construct the appropriate Hopf-filtered model and prove higher
   transferred arrows vanish, using its filtration behavior; an arbitrary
   Hopf model need not have that property. Treat b₁0 and b₁>0 reductions
   with their different pairing hypotheses. Prove the grading and Spin^c
   comparison and the homology/completion passage; no unrestricted equality
   of H(C) completed with H(completed C) is assumed. Recover polynomial,
   torsion-sector or reduced statements only by a proved faithful graded
   completion/descent theorem on their actual finite-generation hypotheses.

   **R2c. Integral and broader-graph scope.** Lane L retains integral
   lattice (co)chains and arbitrary declared plumbing graph/surface data.
   Their HF relationship is a separate explicit extension problem, not a
   theorem supplied by the cited mod2 tree result. Construct coherent
   integral polygon orientations, signed surgery hypercubes, signed lattice
   contractions and their coefficient/Spin^c comparison; prove the analogue
   of the higher-arrow cancellation before asserting an integral isomorphism.
   Compare reduction of the CHAIN complexes, including Tor/derived and
   completion comparisons; reducing integral homology is not that theorem.
   For every finite declared plumbing graph, including cycles and
   positive-genus vertex surfaces, construct its framed Kirby surgery link,
   explicit arc/Spin^c/H₁ dictionaries and completed signed surgery
   hypercube. Its full total complex, with every higher polygon arrow,
   is the definite corrected computation output; prove its comparison with
   completed HF⁻ by R2a's surgery theorem. Retain vertex/sublink chain
   blocks when no continuous chain contraction has been constructed.
   For supplied continuous contractions to chosen free/projective chain
   replacements, construct R2b's transferred differential by all increasing
   paths and prove the filtered chain-homotopy comparison; no contraction
   onto nonprojective homology is presumed.

   Compare this output with Lane L's ordinary lattice complex on the
   actual graph/coefficient hypotheses: construct the leading filtered
   identification where it exists, compute the higher transferred arrows,
   and define the successive chain-map lifting obstructions in the
   corresponding filtered Hom complexes. Prove that vanishing obstructions
   together with the specified acyclic comparison-cone/convergence data
   gives the filtered quasi-isomorphism. Compute these arrows and tests for
   the spherical-tree, single-cycle and one-positive-genus-vertex examples,
   retaining their explicit H₁ and coefficient data. The signed surgery
   complex remains the computation when the ordinary-lattice comparison
   conditions fail. The integral analogue of the tree isomorphism and an
   uncorrected ordinary-lattice equality for broader graphs are comparison
   problems, not conclusions of the cited theorem. See [the precise tree
   theorem and its proof](https://arxiv.org/html/2111.14962v4).
3. **Grid homology = knot Floer homology**
   ([arXiv:math/0607691](https://arxiv.org/abs/math/0607691)): the combinatorial grid
   invariant agrees with `HFK̂`, computed holomorphically from doubly-pointed
   diagrams via the cylindrical reformulation of Lane F5. Depends on F5 and the
   combinatorial Lane G.

The first seam crossed end to end is the genus-1 computation below: `HF̂(L(p,q))`
read off the holomorphic theory matches the combinatorial Lane H answer. ⚠ State
each reconciliation naturality-ready (JTZ): the agreement is an isomorphism attached
to a specific identification of the two complexes, not a bare rank equality.

## Acceptance criteria ("checks along the way")

Concrete checks that rule out vacuous or mis-stated definitions:

- **Morse homology:** `S^n` and `T^n` from standard Morse functions; the
  isomorphism with Mathlib's singular homology (Lane M's reconciliation).
- **Exact Floer:** `HF(L₀, φ(L₀))` in `T*S¹` has rank 2 = `rank H_*(S¹)`; the
  Arnold-type intersection bound in the exact case.
- **`HF̂` computes:** `HF̂(L(p,q))` over 𝔽₂ from the genus-1 diagram (every moduli
  count a bigon) gives `𝔽^p`, one generator per spin^c structure.
- **The two definitions meet:** `HF̂(L(p,q))` computed analytically from the genus-1
  diagram agrees with the combinatorial roadmap's Lane H computation: the first
  reconciliation seam crossed end to end.
- **Pointed adequacy and grading:** reconstruct the based oriented manifold
  after each disc slide/genus stabilization, while retaining the prescribed
  basepoint-moving map. Test normalized periodic surfaces and the Chern
  pairing, relative ℤ versus ℤ/d(s), and the higher-genus sphere-class
  μ=2,n_z=1 identity; check the balanced sphere μ=2b separately. Normalize
  HF̂(S³) in absolute degree zero and verify the cobordism degree formula
  before evaluating d(L(p,q)).
- **Raw/stable/twisted separation:** the twice-pointed S³ diagram has raw
  rank two, represents the stable class with one W factor and has twisted
  differential 1+t with rank-one quotient homology. Verify the augmented
  chain complex and its nonzero Tor contribution, and that the pointed
  stabilization/choice-change maps carry the stated coefficient labels.

## References

- P. Ozsváth, Z. Szabó,
  [arXiv:math/0101206](https://arxiv.org/abs/math/0101206) and
  [arXiv:math/0105202](https://arxiv.org/abs/math/0105202) (Ann. of Math. 2004):
  the holomorphic theory; Lane F4's text.
- M. Audin, M. Damian, *Morse Theory and Floer Homology*, Springer Universitext,
  2014; M. Schwarz, *Morse Homology*, Birkhäuser, 1993; K. Wehrheim,
  [arXiv:1205.0713](https://arxiv.org/abs/1205.0713): Lane M.
- D. McDuff, D. Salamon, *J-holomorphic Curves and Symplectic Topology*, 2nd ed.,
  AMS Colloquium Publications 52, 2012: Lanes F0–F2 (Appendices A–C and Chapters
  2–4, 9–10 and Appendix E); Y.-G. Oh, *Symplectic Topology and Floer Homology* I–II, Cambridge,
  2015: the boundary-condition versions and Lane F3.
- M. J. Micallef, B. White, [*The structure of branch points in minimal surfaces
  and in pseudoholomorphic curves*](https://doi.org/10.2307/2118627), Ann. of Math.
  141(1995),35–85; P. Hartman, A. Wintner,
  [*On the local behavior of solutions of non-parabolic partial differential equations*](https://doi.org/10.2307/2372496),
  Amer. J. Math.75(1953),449–476: F2.6e's local normal-form and elliptic expansion.
- J. Robbin, D. Salamon, *The Maslov index for paths*, Topology 32 (1993);
  *The spectral flow and the Maslov index*, Bull. LMS 27 (1995): F1.3.
- T. Perutz, [arXiv:0801.0564](https://arxiv.org/abs/0801.0564): handleslides as
  Hamiltonian isotopies (F4.4).
- R. Lipshitz, [arXiv:math/0502404](https://arxiv.org/abs/math/0502404) with
  erratum [arXiv:1301.4919](https://arxiv.org/abs/1301.4919); Lipshitz–Ozsváth–
  Thurston [arXiv:0810.0687](https://arxiv.org/abs/0810.0687): Lane F5.
- I. Zemke, [arXiv:2111.14962](https://arxiv.org/abs/2111.14962); Manolescu–
  Ozsváth–Sarkar [arXiv:math/0607691](https://arxiv.org/abs/math/0607691): the
  reconciliation targets (lattice = `HF⁻`, grid = HFK), owned by this roadmap.
- A. Juhász, D. Thurston, I. Zemke,
  [arXiv:1210.4996](https://arxiv.org/abs/1210.4996): naturality, the capstone.
- P. Kronheimer, T. Mrowka, *Monopoles and Three-Manifolds*, Cambridge, 2007: not
  a target, but the gold standard of analytic completeness the analytic lanes
  should hold themselves to.
- S. Armstrong, T. Kempe, [arXiv:2604.05984](https://arxiv.org/abs/2604.05984):
  De Giorgi–Nash–Moser in Lean 4: evidence on formalization speed for the F1
  substrate, and a candidate source to mine.

## How to drive it

Lane M and F0 start as soon as anyone wants the analytic track moving, and so do
the bare symplectic/almost-complex definitions of F2.1; none of them waits for the
[combinatorial roadmap](../CombinatorialHeegaardFloer/README.md). F1 should be
planned jointly with the PDE roadmap rather than alone; F3 is the first analytic
headline and F4 the second. The seams that join the two roadmaps are the
reconciliation theorems above; because each depends on this tower, the analytic
track is what paces them, which is why they are tracked here.

## Acknowledgements

This roadmap builds directly on earlier discussions on the [Lean
Zulip](https://leanprover.zulipchat.com/), and would not have been possible without
them:

- [#maths > Feasibility of formalizing Grid Homology for summer pro...](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/Feasibility.20of.20formalizing.20Grid.20Homology.20for.20summer.20pro.2E.2E.2E)
  (summer 2025): Kevin Buzzard's encouragement ("It would be a shame to miss this
  opportunity to get Heegaard Floer homology into mathlib") and Patrick Massot's
  caution that the holomorphic theory is "a major research project", which this
  roadmap takes seriously rather than dismisses.
- [#general > dreams of big projects](https://leanprover.zulipchat.com/#narrow/channel/113488-general/topic/dreams.20of.20big.20projects)
  (2025, Siddhartha Gadgil, Patrick Massot): the holomorphic theory as a dream
  target, and the observation that combinatorial computation must "relate the
  result to actual information" — which the reconciliation targets, joining this
  roadmap to its combinatorial companion, are designed to answer.
- [#general > O(1000) definitions for Annals](https://leanprover.zulipchat.com/#narrow/channel/113488-general/topic/O.281000.29.20definitions.20for.20Annals)
  (2026, Kevin Buzzard and others): Heegaard Floer homology as a recurring missing
  definition in recent Annals papers; also raised in recent TauCetiProject
  target-selection discussions.

Thanks to everyone who contributed to these discussions.
