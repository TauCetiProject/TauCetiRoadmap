# Conformal mapping and the geometric theory of holomorphic functions

This roadmap organizes the reusable conformal and geometric function theory of `ℂ` into seven
layers. Tau Ceti modules provide the underlying APIs throughout L0–L6: argument
principle and zero-counting, normal families and Montel selection, Schwarz–Pick and hyperbolic
geometry, Riemann mapping, reflection and monodromy, Jordan-boundary correspondence, and
Schwarz–Christoffel polygon results. The roadmap names those providers and their hypotheses, then
specifies the adapters, integration, and additional results needed for a coherent library.

Mathlib supplies the analytic foundations used here: contour integration and Cauchy's integral
formula, power series and analyticity, the open mapping theorem
(`Complex.AnalyticOnNhd.is_constant_or_isOpenMap`), the maximum modulus principle
(`Analysis/Complex/AbsMax`), the Schwarz lemma (`Analysis/Complex/Schwarz`), removable
singularities, rectangle-integral criteria, the unit disc, and complex conjugation. Its
`Analysis/Complex/HasPrimitives.lean` proves disk and whole-plane exactness/Morera formulations;
Tau Ceti's `TauCeti.morera` packages the continuous-on-open-set conservative-function criterion as
a named scalar theorem.

Mathlib's complex-analysis modules provide `TendstoLocallyUniformlyOn` and closure of
differentiability under local-uniform limits. Tau Ceti supplies the analytic normal-family
subsequence theorem and Vitali in `NormalFamilies.lean`, `Montel/`, and `Vitali.lean`. These
results are distinct from `Analysis/LocallyConvex/Montel.lean`, which concerns compactness of
closed bounded sets in locally convex spaces. Mathlib's `Analysis/Complex/RiemannMapping.lean` contains partial
private lemmas, while Tau Ceti supplies the full theorem and its uniqueness and normalization
companions. Mathlib also supplies `BranchLogRoot` constructions for continuous logarithm branches
and roots on simply connected sets; conformal-map proofs should reuse them.

The goal is a coherent library whose objects are available at their natural generality with a
usable API. Existing Tau Ceti results are foundations to consume, test, integrate, and generalize;
the layer contracts specify the common interfaces, generalizations, and combined conclusions
that their consumers need, including reflection, boundary correspondence, and polygon maps.

Implementation lives under `TauCeti/Analysis/Complex/Conformal/`, including the existing
`ArgumentPrinciple.lean`, `Rouche.lean`, `Hurwitz.lean`, `Morera.lean`, `NormalFamilies.lean`,
`Montel/`, `Vitali.lean`, `SchwarzPick/`, and `RiemannMapping/` modules, alongside reflection and
boundary-theory modules.

## Prior art

- **Mathlib:** Cauchy theory, primitives and disk/plane exactness, open mapping, Schwarz's lemma,
  locally-uniform limit theorems, and partial Riemann-mapping lemmas. These are inputs, not
  competing versions of the targets below.
- **Tau Ceti:** Existing providers span every layer. L0–L3 use `ArgumentPrinciple.lean`,
  `Rouche.lean`, `Hurwitz.lean`, `Morera.lean`, `NormalFamilies.lean`, `Montel/`, `Vitali.lean`,
  `SchwarzPick/`, and `RiemannMapping/`. L4–L6 consume `Reflection/`, `Monodromy.lean`,
  `Jordan/`, `Caratheodory.lean`, `BoundaryCorrespondence.lean`, and `SchwarzChristoffel/`.
  The layer contracts below distinguish these existing results from additional adapters and
  conclusions; they are not claims that the named provider theorems are missing.
- **Other proof assistants:** Paulson's Isabelle/HOL `Riemann_Mapping` formalizes the Riemann
  mapping theorem, demonstrating the theorem's formalizability. Reflection and
  Schwarz–Christoffel are further targets of this roadmap.

## Generality bar (decide up front; do not silently specialize)

- **Scalar `ℂ` for conformal statements (L0–L6).** RMT, the reflection principle, and the
  boundary theory are `ℂ`-specific; state them for `f : ℂ → ℂ`. In particular **Schwarz
  reflection (L4) is scalar**: its real-boundary condition `(f z).im = 0` has no Banach-`E`
  analogue without introducing a real form/subspace, which this entry does not do. Consume
  maximum-principle and open-mapping inputs from Mathlib at their stated generality. For Morera,
  use Mathlib's conservative/exactness foundation and the named `TauCeti.morera` provider. The
  auxiliary normal-family estimates may use a complex normed target `E`: Tau Ceti's compact-open
  precompactness and Montel selection require `E` proper, while the scalar Vitali theorem is stated
  for `ℂ`. Preserve these provider hypotheses; do not claim an infinite-dimensional Montel theorem.
- **Domains: open + connected, with Mathlib's `IsSimplyConnected`.** Use `IsOpen`, `IsConnected` /
  `IsPreconnected`, and `IsSimplyConnected Ω`; do not encode simple connectivity as a second
  subtype class or as an informal "no holes" condition. The Riemann-map hypotheses are open,
  connected, simply connected, proper, and nonempty, in the exact `IsSimplyConnected` / `BijOn`
  form used by the native API.
- **Conformal isomorphism = holomorphic bijection.** State the map and inverse through
  `BijOn f Ω Ω'` and differentiability on their open domains, then expose the bundled equivalence
  as a companion. Preserve the actual `IsSimplyConnected` and `BijOn` hypotheses of the Riemann-map
  declarations; use open mapping to derive openness and holomorphy of the inverse where appropriate.
  Relate the result to Mathlib's `ConformalAt` without replacing the existing map-level API.
- **Target disc: `Complex.UnitDisc` / `Metric.ball (0:ℂ) 1`.** Reuse the existing disc and
  its automorphism/`Schwarz` API; do not re-encode the disc.
- **Convergence of holomorphic families: `TendstoLocallyUniformlyOn`** (compact-open), the
  topology under which "holomorphic" is closed and Montel lives. Local boundedness =
  "bounded on each compact `K ⊆ Ω`".
- **Reflection: real-axis first; conjugation is `starRingEnd ℂ`; explicit witness.** See L4.

## Coordination with upstream Mathlib

L0–L3 overlap with the human-curated Riemann-mapping effort
[mathlib4#33505](https://github.com/leanprover-community/mathlib4/pull/33505). Name and
shape overlapping results and their hypotheses to follow that work and Mathlib’s public
interfaces, so adoption replaces a local proof with an import. Build the required APIs in
Tau Ceti now. When a matching public Mathlib result is available, delete the duplicate and
refactor its consumers; private upstream lemmas cannot replace a public supplier API.
The continuation, reflection, Jordan-boundary and polygon layers extend beyond this RMT
prerequisite overlap. The same rule of adopting matching Mathlib APIs applies throughout.
Nothing here waits on upstream work or assigns work to Mathlib.

## Layers

## L0 — local mapping and zero-counting API

Integrate the existing contour argument
  principle, Rouché, Hurwitz, and Morera theorems at their exact hypotheses. The reusable
  argument-principle interface must distinguish (i) the holomorphic winding-weighted zero
  count, (ii) the meromorphic winding-weighted zero-minus-pole count, and (iii) the
  image-winding formulation for a closed contour. For the native null-homologous theorem,
  take an open U and a finite S containing every zero and pole in U, require analyticity
  and nonvanishing off S, meromorphy and finite integer order at S∩U, and a closed
  piecewise-C¹ curve in U avoiding S and null-homologous in U. Then the integral is
  `2πi Σ_(a∈S) windingNumber(γ,a) · orderAt(f,a)`; terms outside U vanish by null homology.
  The holomorphic specialization uses analytic zero orders. Extend to a finite cycle by
  linearity with its specified coefficients. Preserve curve regularity, containment in U,
  nonvanishing along the trace, and the exact finite-S hypotheses. The Jordan-contour
  specialization below is a later application using the index theorem of GMT G6;
  it is not a prerequisite for L0 or the intervening conformal layers. State contour,
  null-homology, and multiplicity conventions in each form. Integrate the same hypotheses
  with domain-boundary applications (including the chosen boundary orientation) rather than silently
  treating every cycle as a region boundary. Rouché's statements must distinguish the circle and
  symmetric variants from the null-homologous-cycle theorem. Hurwitz should expose its zero-free,
  value/counting, and injectivity conclusions with their connectedness and local-limit hypotheses.
  Morera should expose the conservative/rectangle criterion and the scalar conclusion for a
  continuous function on an open set. The providers already include
  `TauCeti.argumentPrinciple_windingNumber`, its holomorphic specialization,
  `TauCeti.Contour.argumentPrinciple_nullHomologous`, the named Rouché/Hurwitz results, and
  `TauCeti.morera`; Mathlib supplies Cauchy and exactness inputs. Complete the compositional contour,
  domain, and multiplicity interfaces without weakening any provider hypotheses. Preserve the
  open-mapping degree as a named L0 interface: use `TauCeti.localDegree` for the nearby
  zero count with multiplicity, `TauCeti.localDegree_card` for distinct simple preimages
  when the derivative is nonzero off the central point, and `TauCeti.exists_localDegree`
  to choose the isolating disc. Expose `TauCeti.exists_injOn_nhds_iff_deriv_ne_zero` and
  `TauCeti.deriv_ne_zero_of_injOn` as the local and domain-level injectivity companions.
  These are supplied by `LocalDegree.lean`, using Rouché and the native inverse-function
  theorem; preserve the isolation and analyticity hypotheses in the counting forms.

## L1 — normal families / Montel (analytic theorem, not `MontelSpace`)

Consume Tau Ceti's
  compact-open precompactness, Montel subsequence selection, Cauchy equicontinuity estimates, and
  Vitali results in `NormalFamilies.lean`, `Montel/Precompact.lean`, `Montel/Basic.lean`, and
  `Vitali.lean`. Preserve the proper complex normed target hypothesis on Montel selection; the
  conformal applications use `E=ℂ`. This is distinct from Mathlib's locally convex
  `MontelSpace` theorem.

  Consume GH0's `H(U)`, the native analytic-map carrier
  `ContMDiffMap (modelWithCornersSelf ℂ ℂ) (modelWithCornersSelf ℂ ℂ) U ℂ ω`, with
  its compact-open uniformity pulled back along the embedding into `C(U,ℂ)`. Open GH0's
  `HolomorphicMapTopology` scope explicitly to use its uniformity and topology instances. State the complete metric in terms of this same
  compact-open uniformity and identify its convergence with `TendstoLocallyUniformlyOn` on ambient
  representatives. GH0 owns this carrier and its topology. L1 consumes it and owns normal-family
  compactness; GH0 needs no new L1, Montel, or conformal-mapping result. Applying existing
  `C(↥Ω,ℂ)` results requires the explicit adapter between the `Opens ℂ` carrier and the set-domain
  subtype: for a family `F : ι → ℂ → ℂ`, its continuous representative satisfies
  `⇑(f i) = Ω.domRestrict (F i)`.

  The combined criterion for `F ⊆ H(U)` is compactness iff closedness plus uniform boundedness on
  every compact subset of `U`. Build it through the closed embedding into `C(U,ℂ)`, the native
  `TauCeti.IsLocallyBoundedOn` predicate, and
  `TauCeti.isCompact_closure_range_iff_isLocallyBoundedOn`; identify relative compactness in the
  continuous-map space with compact-open convergence and use closedness of the holomorphic carrier
  to keep the limit holomorphic. Make the chosen topology on `H(U)` explicit so the words
  "compact" and "closed" are unambiguous.

## L2 — Schwarz lemma and Poincaré geometry

Keep the pseudo-hyperbolic expression
  `|z−w|/|1−conj(w)z|`, Schwarz–Pick contraction, equality and rigidity, and the full disc
  automorphism group `z ↦ u (z−a)/(1−conj(a)z)` with `|u|=1`, `|a|<1`. The Poincaré distance
  convention is `hyperbolicDist(z,w)=Real.artanh (|z−w|/|1−conj(w)z|)`; do not insert an extra
  factor of two. Tau Ceti supplies finite and infinitesimal Schwarz–Pick estimates,
  automorphism isometries, the hyperbolic metric, geodesics, metric topology, and isometry results
  in `SchwarzPick/`, `Poincare/`, and `Hyperbolic/`. Consume
  `TauCeti.hyperbolicDist_def`, `TauCeti.tanh_hyperbolicDist`,
  `TauCeti.PoincareDisc.instMetricSpace`, and
  `TauCeti.PoincareDisc.isometry_unitDiscStandardAutomorphismEquiv` for the radius,
  distance, metric and automorphism-isometry interfaces. The full holomorphic automorphism
  classification is `TauCeti.exists_forall_unitDisc_eq_unitDiscStandardAutomorphismEquiv`;
  `TauCeti.existsUnique_eq_unitDiscStandardAutomorphismEquiv` pins uniqueness of its rotation
  and center parameters. Preserve the holomorphic inverse/maps-to hypotheses of those APIs.
  For the concrete disk-interpolation example, a function `f : ℂ → ℂ` holomorphic on the unit disk with
  `MapsTo f (ball 0 1) (ball 0 1)` and `f(1/2)=3/4` satisfies
  `|f′(1/2)|≤(1−(3/4)²)/(1−(1/2)²)=7/12`. Deduce that the additional datum
  `f′(1/2)=2/3` is impossible, by specializing the native infinitesimal Schwarz–Pick estimate.
  Build the Cayley metric comparison explicitly: for z,w∈ℍ and
  `c(z)=(z−i)/(z+i)`, prove
  `dist_ℍ(z,w) = 2 * hyperbolicDist(c(z),c(w))`, using Mathlib's native
  `UpperHalfPlane` metric and the native disc/half-plane Cayley maps. Prove the norm/imaginary
  part identities and transport the infinitesimal metric and geodesic descriptions with
  this factor of two. The native disc closed forms use the half-distance normalization;
  no second disc distance or automorphism carrier is introduced.

## L3 — the Riemann mapping theorem

For every nonempty, simply connected, proper open
  `Ω ⊊ ℂ`, the provider contract is the complete reusable Riemann-map API in its actual
  `IsSimplyConnected` / `BijOn` hypotheses: existence of a holomorphic bijection `Ω → 𝔻`,
  biholomorphic and open-partial-homeomorphism packaging,
  uniqueness up to a disc automorphism, and normalized existence and uniqueness at a base point.
  Tau Ceti already contains these results in `RiemannMapping/`; use them as the theorem and
  integration point for later layers. Keep the proof route explicit: a pointed family of
  injective maps is nonempty by the square-root construction, its normality comes from L1, and
  maximizing `|f′(z₀)|` gives surjectivity by the Koebe argument. Reuse Mathlib's `BranchLogRoot`
  API for holomorphic logarithms and roots on simply connected open sets.

## L4 — analytic continuation, reflection, and removability

Use the native analytic-germ continuation object with its actual target generality. For `E` a
complex normed space, `f : X → ℂ → E`, path `γ : X → ℂ`, and parameter set `s ⊆ X`,
`IsAnalyticContinuationAlong f γ s` carries analytic germs along the path and requires the native
continuity, analyticity, and local germ-agreement clauses. The continuation object itself needs no
completeness assumption. For uniqueness, assume
`[CompleteSpace E]` and an `IsPreconnected` parameter set containing the initial and terminal
parameters, and consume `IsAnalyticContinuationAlong.eventuallyEq` for a fixed path and common
initial germ. Conformal-mapping applications specialize to `E=ℂ`. Do not replace that API with a scalar-only continuation definition.

For a homotopy `H : I × I → ℂ`, state the two monodromy contracts separately. In the rel-endpoint
case, assume every row `s ↦ H(t,s)` carries a continuation from the same initial germ, and that
`H(t,0)` and `H(t,1)` are fixed; terminal germs agree. This is `TauCeti.monodromy_theorem`. In the
free-homotopy case, require the initial germs themselves to form an analytic continuation along `t ↦
H(t,0)`; row-wise continuations then make the terminal germs a continuation along `t ↦ H(t,1)`,
rather than making them equal at moving endpoints. This is
`TauCeti.monodromy_theorem_of_free_homotopy`. Retain
`TauCeti.monodromy_theorem_of_free_homotopy_loop` and `TauCeti.monodromy_theorem_of_homotopy_refl`
as consequences. Preserve the moving-endpoint conclusion and the complete-space hypothesis.

For reflection across the real axis, use `TauCeti.exists_differentiableOn_eqOn_conj_of_symmetric`
with an open conjugation-invariant source `Ω`, continuity on `Ω ∩ {Im z ≥ 0}`, holomorphy on `Ω ∩
{Im z > 0}`, and real-valued boundary values on `Ω ∩ ℝ`. The extension is the explicit native
witness `TauCeti.schwarzReflection f`: it equals f for
`Im z≥0` and `conj(f(conj z))` for `Im z<0`. It agrees on the closed upper part and satisfies
`F(conj z)=conj(F z)` under the stated real-boundary hypotheses.

For a regular real-analytic arc, do not promise that a Möbius transform straightens it: Möbius maps
straighten circles and lines. Own the following local straightening construction. Let `γ` be a
real-analytic parametrized arc near `t₀`, with `γ′(t₀)≠0` and locally injective. Extend its real
power series to a holomorphic map on a complex neighborhood of `t₀`; shrink it so the complex
derivative never vanishes and the extension is injective. Its holomorphic inverse gives an
open-partial-homeomorphism chart `e` about `γ(t₀)`. Shrink again so the target is a
conjugation-invariant disk and the entire local arc is exactly the real locus in the chart source:

`e.source ∩ {z | Im(e z)=0} = γ(I₀)`.

Choose the chart orientation (replace `e` by `−e` if needed) so the designated side of the arc maps
to `Im(e z)>0`. State the corresponding target chart `d` with the same real-locus and side clauses
whenever the values lie along a target analytic arc. This chart construction, including exact
real-locus equality and the chosen side, is the owned adapter; mere containment of the arc in the
real locus is insufficient.

Then consume `TauCeti.exists_differentiableOn_eqOn_chartedReflection_of_symmetric`. Its exact data
are holomorphic source and target charts `e,d`; both chart targets invariant under conjugation; `f`
maps the closed positive source side into `d.source`; `f` is continuous there and holomorphic on the
open positive side; and `(d (f z)).im=0` on the charted source arc. The witness is the charted
reflection, holomorphic on `e.source`, agreeing with `f` on the closed positive side and
intertwining the source and target chart reflections. Apply the chart-straightening adapter to both
source and target arcs before invoking it.

Keep removability distinct from reflection. The native theorem
`TauCeti.differentiableOn_of_continuousOn_of_differentiableOn_diff_of_subset_coord_im_eq_zero`
assumes an open `Ω` with `Ω ⊆ e.source`, `DifferentiableOn ℂ e Ω`, `ContinuousOn F Ω`,
`DifferentiableOn ℂ F (Ω \ S)`, and `Ω ∩ S ⊆ {z | Im(e z)=0}`; it concludes `DifferentiableOn ℂ F
Ω`. Thus every subset of a charted real locus is removable under continuity across it. The
analytic-arc case follows from the explicit straightening chart above.

State the broader rectifiable-arc scope as a separate owned theorem, rather than attributing it to
that chart theorem: if `Γ` is a relatively closed finite-length rectifiable Jordan arc in an open `V
⊆ ℂ`, `F` is continuous on `V`, and `F` is holomorphic on `V \ Γ`, then `F` is holomorphic on `V`. A
compact regular `C¹` embedded arc is a stated special case. Pin rectifiability by a continuous
injective parametrization with finite `eVariationOn`
on the relevant interval, and formulate the result locally for relatively closed arcs in V.
The proof target is Morera using a grid covering of a compact subarc of length L: at mesh δ,
at most `O(1+L/δ)` squares meet the arc. Subtract a constant on each square and bound its
contour contribution by `4δ·ω(√2δ)`, where ω is the local modulus of continuity of F.
The total error is `O((L+δ)·ω(√2δ))`, which tends to zero. No smooth tubular-neighborhood
construction is assumed for a general rectifiable arc. State the relative closedness and
finite-length hypotheses; do not claim removability for an arbitrary nonrectifiable arc.

## L5 — Carathéodory correspondence and full Jordan separation

Use `IsJordanDomain Ω` for an open, connected, bounded subset of `ℂ` with Jordan frontier. Preserve
`IsSimplyConnected` and `BijOn` in theorem interfaces; provide `Set`/`TopologicalSpace.Opens ℂ`
adapters rather than weaker informal “conformal equivalence” clauses.

Consume these Carathéodory providers for bounded Jordan domains:

- `TauCeti.exists_continuousOn_closedBall_eqOn_of_isJordanCurve_frontier` extends a holomorphic
  injection continuously to the closed disc when its image is bounded with Jordan frontier. It gives
  agreement with the original map on the open disc, not a separate assertion of boundary
  injectivity.
- `TauCeti.IsJordanDomain.injOn_closedBall_of_conformal` proves injectivity of that chosen extension on the closed disc.
- `TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier` packages a Riemann map,
  its continuous closed-disc extension, `BijOn` on the open disc, and a homeomorphism from the
  closed disc to the image closure.

For a chosen holomorphic bijection `f : ball c r → Ω` with positive radius and `Ω` a Jordan domain,
apply the extension provider to this same `f`, then apply
`IsJordanDomain.injOn_closedBall_of_conformal` to prove `InjOn F (closedBall c r)`. The set-level
range statement is `TauCeti.bijOn_closure_closure_image`; its inputs are boundedness, continuity on
`closure U`, agreement on `U`, and closed-set injectivity. The resulting `TauCeti.closureHomeomorph`
is characterized on the forward map by `coe_closureHomeomorph_apply`, and on the inverse by
`coe_closureHomeomorph_symm_apply`: its inverse is `Function.invFunOn F (closure U)`. On `Ω`, this
is the holomorphic inverse of `f`, by `BijOn` and the local holomorphic inverse theorem. The circle
restriction is a homeomorphism onto `frontier Ω`, using `image_frontier_eq_frontier_image` with its
actual hypotheses: open U, bounded U, differentiability and injectivity on U, continuity of F on the
closure, and agreement on U. Preserve chosen base-point normalization. Use the existence provider
above when a particular map is not fixed.

Retain the converse packaging. `TauCeti.isJordanDomain_of_isJordanCurve_frontier_image` assumes U
open and bounded, f differentiable on U, F continuous on `closure U`, F=f on U, F injective on
`closure U`, and `f '' U` connected with Jordan frontier; it derives injectivity of f on U and that
U is a Jordan domain. The specialization `TauCeti.isJordanDomain_of_image_eq_ball` replaces those
image hypotheses by `f '' U = ball c r` and `0<r`. These are the stated
`IsSimplyConnected`/`BijOn`-adapted conclusions, not new missing Carathéodory results.

L5 also owns the full ambient Jordan separation theorem, separately from Carathéodory. For every
topological Jordan curve `C ⊆ ℂ` (no smoothness, polygonality, or locally straight point assumed),
prove that `ℂ \ C` has exactly two connected components, one bounded and one unbounded; `filledHull
C \ C` is the bounded component; it is nonempty, open, and connected with frontier `C`; and the
unbounded component also has frontier `C`. The full separation theorem is an owned target. The
native `frontier_connectedComponentIn` only proves frontier equals C once two points are already
known to lie in distinct complement components. The locally straight results
`IsJordanCurve.isJordanDomain_filledHull_sdiff_of_locally_eq_line`,
`nonempty_filledHull_sdiff_of_locally_eq_line`, and `frontier_filledHull_sdiff_of_locally_eq_line`
remain honest partial providers, not generic Jordan separation. `janiszewski` is union stability for
two bounded closed sets with preconnected intersection and an already nonseparating pair; it does
not prove the missing existence half. The Jordan-region containment interfaces consume
`TauCeti.filledHull_subset_closedConvexHull` for nonempty C,
`TauCeti.isBounded_filledHull`, `TauCeti.subset_filledHull_of_frontier_subset` for bounded S
with `frontier S ⊆ C`, and `TauCeti.connectedComponentIn_compl_eq_of_unbounded_component`
with its real-dimension-greater-than-one and boundedness hypotheses. Provide the Jordan-region
specializations and identify their components with `filledHull C \ C`. DifferentialGeometry 5.6
consumes these containment and separation results for winding and Green's area identity;
Isoperimetry I6 consumes the full two-component theorem. Absolute-continuity/trace and area
comparisons remain with their geometric owners.

### L5 continuous Jordan index and boundary injectivity

Extend the contour owner's off-trace index to arbitrary continuous closed
loops, using existing `Path`s or continuous maps on a compact parameter
interval, with explicit endpoint equality and avoidance of the test point.
Construct the integer-valued topological index in the contour namespace;
do not evaluate the derivative-based principal-value `windingNumber` on a
nonrectifiable curve and call that value its topological index. Transport
along increasing affine changes of parameter to the unit interval. Follow
the circle-covering API of Mathlib's
[`AddCircle.windingNumber` and `windingNumber_eq_div`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/Covering/FundamentalGroupCircle.html):
normalize `gamma(t)-w` to the unit circle, identify it with
`AddCircle (2*pi)`, and compute the integer by the endpoint difference of
a continuous real argument lift divided by `2*pi`. Build the required
adapter and covering/lifting results here at the pinned library when that
public interface is absent; adopt matching Mathlib declarations when
available. Prove independence of the argument lift and basepoint choice,
homotopy invariance for continuous closed loops avoiding w, additivity,
reversal, normalization on the counterclockwise circle, local constancy
off the trace, and vanishing on the unbounded component.

Provide an equivalent construction by endpoint-preserving smooth
approximation. A continuous loop avoiding w has positive distance from w.
Consume `TauCeti.Contour.exists_contDiff_eq_endpoints_dist_lt`; choose a
smooth approximant within less than one third of that distance. Its
native integral winding number is an integer. Prove independence using
the native piecewise-C1 proximity theorem for two such approximants,
then prove equality with the argument-lift index by subdividing into
local argument charts. Compactness of an avoiding homotopy supplies one
positive distance and a finite chain of nearby time slices. This proves
invariance without requiring differentiability of its intermediate loops.
Prove the full pointwise proximity criterion for continuous closed loops:
`dist(delta(t),gamma(t)) < dist(gamma(t),w)` implies equal indices, by the
avoiding straight-line homotopy. For piecewise-C1 loops, prove equality
of the integer index, cast to complex, with the existing integral/PV
winding number under its actual avoidance hypotheses. For AC loops,
consume DifferentialGeometry 5.6.1's integral/proximity comparison and
prove the same equality by smooth approximation. The construction of
the continuous index and the Jordan theorem below precedes, and does
not use, that AC comparison, Green's theorem or GMT G6.

For every Jordan parametrization `gamma : S1 -> C`, a homeomorphism onto
the Jordan curve C with no length or differentiability premise, prove
there is one sign `sigma in {-1,1}` such that its topological index is
sigma at every point of `filledHull C \ C` and zero on the unbounded
component. This sign depends on the parametrization, and is a conclusion,
not an extra hypothesis. Prove transport by a circle homeomorphism:
it has degree +1 or -1, and precomposition multiplies the index by that
degree. Construct the real lifts and their strict increasing/decreasing
alternative, with period increment respectively +2*pi or -2*pi; do not
infer the degree from an arbitrary continuous circle self-map.

Use the following proof route for the full Jordan index theorem. First
consume the full ambient separation target above to obtain the bounded
Jordan domain Omega with frontier C. The existing Jordan-domain simple
connectivity theorem and L3 Riemann mapping give a holomorphic bijection
of the disc onto Omega. Consume L5's closed-disc homeomorphism for that
chosen map F. Its boundary circle parametrizes C. For w in Omega, use
L0's analytic argument principle on interior circles of radii r<1 that
enclose the unique preimage of w. Injectivity gives multiplicity one.
Uniform continuity on the closed disc and boundary avoidance identify
these indices with the continuous boundary index for all sufficiently
large r, hence give +1. Relate an arbitrary gamma to this boundary
parametrization by a circle homeomorphism and apply the proved degree
alternative. Local constancy and the unbounded-component theorem give
the exterior value. This route uses the native analytic circle theorem,
not a Jordan-boundary argument principle or an area identity. No simple
polygon approximation or smoothness of a general Jordan curve is assumed.

Prove the continuous-boundary argument principle as an application. For
a bounded Jordan domain Omega, f continuous on its closure and holomorphic
on Omega, and w outside `f '' frontier Omega`, the topological index of
the positively oriented continuous boundary loop under f equals the
number of zeros of f-w in Omega, with analytic multiplicity. Nonvanishing
on the compact boundary and continuity isolate those zeros in a compact
subset of Omega; prove finiteness and rule out the identically-zero case.
Pull back by the same closed-disc homeomorphism, use L0 on interior
circles enclosing those finitely many zeros, and pass to the boundary
by uniform continuity/proximity. Transport multiplicities through the
conformal bijection. This is an integer zero count on continuous loops,
not an unsupported boundary line integral.

Deduce the boundary-injectivity theorem: if, in addition, f is injective
on `frontier Omega`, then f is a holomorphic bijection from Omega onto
the bounded component of the complement of `f '' frontier Omega`, and
its continuous closure map is a homeomorphism of the two closures.
The image boundary is Jordan by compact-to-Hausdorff embedding. Its
index sign must be +1 because the preceding zero count is nonnegative;
the count is exactly one inside and zero outside. Prove that no interior
point maps onto the image boundary: open mapping and the two-sided
frontier property would otherwise give an exterior value in the image.
Thus every interior fibre has total multiplicity one, and interior and
boundary fibres are disjoint. Prove the closure range and inverse
continuity, as well as the interior inverse's holomorphy. This supplies
the Darboux boundary-injectivity application for arbitrary continuous
Jordan frontiers. Distinguish the open image from its closure and do
not infer a source's ambiguous closure mark from this corrected theorem.

GMT G6 consumes the full Jordan index here and its separate DG 5.6.1
AC integral comparison for arclength curves; it retains ownership of
the perimeter, normal and signed-boundary-measure comparisons. The
piecewise-C1 Jordan-contour applications below are specializations,
and are not prerequisites for the continuous-loop construction above.

### L4/L5 integration: extension across analytic boundary arcs

Prove the analytic-boundary extension adapter for a chosen Riemann map. Let `Ω` be a bounded Jordan
domain and `f : 𝔻 → Ω` a chosen conformal bijection. Start with the closed-disc homeomorphism from
L5. Let `J₀` be a relatively open analytic arc of `∂𝔻` and `J₁` a regular real-analytic arc of `∂Ω`,
with the boundary homeomorphism carrying `J₀` onto `J₁`. Shrink the target chart d so its entire
local real locus is `frontier Ω ∩ d.source`,
excluding other boundary pieces. Prove one-sidedness: Ω occupies precisely the positive side
in this chart after a sign choice. Use the L5 component/frontier and connectedness results;
this side selection is an owned adapter, not a consequence of merely mapping the arc into ℝ.
Choose the source circle chart with the corresponding exact real-locus and interior-side
properties. The normalized map `d ∘ f ∘ e.symm` is continuous on the closed positive side,
holomorphic on the open side, maps into the target chart, and is real on the arc; L4 reflection
therefore extends it holomorphically. Apply the same construction to the inverse map using the
inverse boundary homeomorphism. Prove both composition identities on the reflected neighborhoods by
the identity theorem, since they hold on the interior side. This supplies a local holomorphic
inverse and proves that the extension is locally injective across the matching circle arc. State the
agreement on the original closed-side arc and the source/target reflection identities.

## L6 — Schwarz–Christoffel theory for polygonal Jordan domains

Retain the complete bounded theory and both existing unbounded variants. Every existence theorem
solves for the unknown distinct real prevertices from the target domain; a chosen tuple of distinct
prevertices by itself is not a univalence theorem. For each case, normalize the upper-half-plane
primitive by `F(z₀)=0`,
`F′(z)=∏ᵢ(z−aᵢ)^{eᵢ}`, using the analytic logarithm with argument in `(0,π)`, then apply `A F+B`
with `A≠0`. In the bounded case the equivalent disc primitive has derivative
`∏ᵢ(1−ζ/wᵢ)^{eᵢ}` for distinct `wᵢ∈∂𝔻`, integrated from 0 and followed by affine normalization;
inside the disc each factor lies in the right half-plane, fixing the principal power. In the sector
end case the disc formula also has the extra boundary prevertex `1`. Preserve corner limits, affine
covariance, local edge/corner asymptotics, exponent sums, necessity, and the uniqueness
normalization appropriate to each case. Affine covariance means how the primitive's base point
and the output similarity `w ↦ A w+B` change the constants; accessory parameters are the
unknown prevertices and affine constants solved from the prescribed polygon and marked vertices.

**Bounded simple polygon.** Use Mathlib's `poly : Polygon ℂ n` with the native
`poly.IsSimple ℝ` from `TauCeti/Geometry/Polygon/Simple.lean` and `[NeZero n]`.
`Polygon.IsSimple.three_le` then gives `3 ≤ n`. Set `C := poly.boundary ℝ`, the union of
`poly.edgeSet ℝ i`, whose endpoints are `poly i` and `poly (finRotate n i)`.
Consume `Polygon.boundaryParamCircle` and
`Polygon.IsSimple.isJordanCurve_boundary` for its embedded circle trace.
Set `U := filledHull C \ C`. A nondegenerate open edge gives the locally straight point;
use `IsJordanCurve.isJordanDomain_filledHull_sdiff_of_locally_eq_line` and the companion
nonemptiness/frontier results to prove U is a nonempty bounded Jordan domain with `frontier U=C`.

Derive injectivity of the vertex map from simplicity, for example through
`Polygon.IsSimple.boundaryParamCircle_injective` and the distinct integer parameter classes.
Combine `exists_ball_openSegment_eq_line` with
`Polygon.IsSimple.exists_mem_nhds_inter_boundary_eq` to produce the local line point and
nonvertex side neighborhoods.

Handle both vertex orders without a hidden orientation assumption. Put
`dᵢ=v_(finRotate n i)−vᵢ` and let mᵢ be the midpoint of that edge. Define the sign
`σ∈{−1,1}` by the unique local choice at edge 0: for all sufficiently small ε>0,
`m₀+σ·Complex.I·ε·d₀∈U` and `m₀−σ·Complex.I·ε·d₀∉closure U`. Prove existence, uniqueness and
propagation of this same sign to every open edge. These are local normal-direction assertions,
not global supporting-half-plane conditions on a nonconvex polygon.
At vertex i let `τᵢ=arg(dᵢ/d_(previous i))` be the principal signed turn, with left turns
positive. Simplicity excludes backtracking, so `−π<τᵢ<π`; straight marked vertices have
`τᵢ=0`. Define `θᵢ=π−σ τᵢ` and `eᵢ=−σ τᵢ/π`, including reflex vertices.
Own the local sector selection and its consistency with σ. The two-edge neighborhood theorem
supplies the boundary shape; a separate interior-side argument selects the sector belonging
to U, including angles larger than π. Derive the exact native conditions: every nonvertex
frontier point has a local open-half-plane model, and for each vertex there are `ρ>0`,
`bᵢ≠0` such that, for `z∈ball vᵢ ρ` with `z≠vᵢ`,
`z∈U ↔ |arg((z−vᵢ)/bᵢ)| < (eᵢ+1)π/2`.
The side theorem alone does not establish corner geometry. The native existence theorem
`TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_frontier`
gives the upper-half-plane bijection and vertex limits, and
`TauCeti.exponent_sum_eq_neg_two_of_isJordanCurve_frontier` gives `Σeᵢ=−2` (equivalently the
interior angle sum `(n−2)π`). Derive the signed turning sum `Στᵢ=2πσ` from this sum
and `eᵢ=−σ τᵢ/π`, rather than presupposing counterclockwise input.
The derivative and normalization are supplied by the
`schwarzChristoffelPrimitive` API.

For necessity, consume `TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_domain`
and `TauCeti.exponent_sum_eq_neg_two_of_polygonal_domain`. State its actual hypotheses: holomorphy
on the upper half-plane, continuity and injectivity on the closed upper half-plane, the image and
vertex conditions, local side/corner conditions, and an approach limit `p` at infinity with
`p ∉ f '' {z | 0≤Im z}`. Thus the point approached at infinity is outside the closed-half-plane
image; the theorem does not cover a normalization in which infinity is sent to one of the polygon
vertices. The pre-Schwarzian identity in the all-finite normalization is
`F″(z)/F′(z)=Σᵢ eᵢ/(z−aᵢ)` on ℍ; integrate it with the base-point normalization.
The uniqueness action on the half-plane is `PSL(2,ℝ)`, the orientation-preserving real
Möbius automorphisms, not all of `PGL(2,ℝ)`; three matched prevertices fix that freedom. Retain the
cross-ratio and affine-output uniqueness statements with their matching-vertex hypotheses.

**Bounded target with source infinity at a finite vertex.** Fix a marked vertex k and a
conformal bijection f onto the polygon domain U above, with its same local side/corner data.
Use the carrier `H̄∞ := insert ∞ (coe '' {z:ℂ | 0≤Im z}) ⊆ OnePoint ℂ` for the compactified
closed half-plane. Require an extension that is a homeomorphism from H̄∞ onto `closure U`,
carrying its compactified real boundary onto `frontier U`, with value vₖ at ∞.
Build this packaging from L5 through the Cayley map `(z−i)/(z+i)`, extended by ∞↦1. The other vertices have distinct real prevertices
`a : I → ℝ`, where `I := {i : Fin n // i ≠ k}`. Own the normalization theorem

`f(z)=A Fₖ(z)+B`, `Fₖ(z₀)=0`, `Fₖ′(z)=∏_(i≠k)(z−aᵢ)^{eᵢ}`, `A≠0`,

with the upper-half-plane branches fixed above, and
`Σ_(i≠k)eᵢ=−2−eₖ`, `z f″(z)/f′(z) → −2−eₖ` at source infinity.
The finite endpoint is part of the conclusion: `Fₖ(∞)` exists and
`B=vₖ−A Fₖ(∞)`; equivalently `B=f(z₀)` and `f(z₀)+A Fₖ(∞)=vₖ`.
Derive the tail asymptotics of order `z^(−1−eₖ)` from `eₖ>−1`.

For necessity, choose a finite nonprevertex b and an upper-half-plane Möbius map
`ψ(w)=b−c/(w−r)` with `c>0`, so `ψ(∞)=b` and `ψ(r)=∞`.
On the upper half-plane use `g=f∘ψ`. For the total complex-valued representative passed to
the native closed-half-plane theorem, set `g := Function.update (f ∘ ψ) (r:ℂ) vₖ`.
Prove continuity and injectivity at r from the specified source-infinity limit of f; the
rational formula at its pole alone is not the boundary extension. This map has all vertices
at finite prevertices, and its source-infinity limit f(b) is a nonvertex side point outside
its finite closed-half-plane image. Apply the native
bounded all-finite necessity theorem. Prove the chain-rule/product identity for transport
back, including logarithm branches and reindexing to I; the full sum `Σeᵢ=−2` cancels the
extra Möbius denominator. This yields the displayed omitted-factor formula.
For existence, use the native bounded all-finite existence theorem, its L5 boundary
homeomorphism, and the inverse source reparameterization to send the selected vertex to
source infinity. Solve the prevertices from the target polygon; arbitrary assigned real
prevertices are not assumed to work. The formula-level provider
`TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_polygonal_boundary`
accepts a general pre-Schwarzian limit L and can then be used with `L=−2−eₖ`;
its finite side/corner hypotheses and the limit itself must be derived by this adapter.
This is a finite target vertex, distinct from both unbounded target-end cases below.

Source infinity is fixed in this normalization, so the residual source freedom is the
positive-affine group `z↦αz+β`, `α>0`, `β∈ℝ`. State necessity and uniqueness with
matched target vertices: two distinct matched finite prevertices determine this source
automorphism. Normalize the output constants when comparing target similarities.

For the bounded disc formula, own the adapter from
`TauCeti.exists_bijOn_const_mul_schwarzChristoffelDiscPrimitive_add_with_infty_of_bijOn`,
the all-finite sum `Σeᵢ=−2`, and `TauCeti.schwarzChristoffelDiscPrimitive_option_zero`;
the auxiliary infinity-prevertex factor has exponent zero in this normalization.

**Unbounded polygon with a sector end.** Let `U` be connected and open and let
`insert ∞ (frontier U)` be a Jordan curve in the one-point compactification. Keep distinct finite
vertices with local sectors `(eᵢ+1)π`, `eᵢ∈(−1,1)`, local half-plane models at other finite boundary
points, and the exact far-field sector condition: for some `ρ,c,b`, `b≠0`, `β∈(0,2)`,
`ρ<‖z−c‖ → (z∈U ↔ |arg((z−c)/b)|<βπ/2)`. The providers
`TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_insert_infty`
and `TauCeti.exponent_sum_eq_sub_one_of_isJordanCurve_insert_infty` give the map and finite sum
`Σeᵢ=β−1`. Include the disc normalization
`TauCeti.exists_bijOn_const_mul_schwarzChristoffelDiscPrimitive_add_of_isJordanCurve_insert_infty`:
it has the additional boundary prevertex `1` with exponent `−β−1`, so the full disc exponent sum
is `−2`. For necessity use
`TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_unbounded_polygonal_domain` and
`TauCeti.exponent_sum_eq_sub_one_of_unbounded_polygonal_domain`; require the continuous injective
closed-half-plane extension, image and vertex conditions, `f→∞` at half-plane infinity, and the
same local side/corner/sector conditions. Consume
`TauCeti.tendsto_schwarzChristoffelPrimitive_div_cpow_atInfinity_of_neg_one_lt_sum`
for the normalized power asymptotic `F(z)/z^(S+1) → 1/(S+1)`, `S=Σeᵢ=β−1`,
and the native escape theorem, with their branch and approach-filter conventions.

**Unbounded polygon with a half-strip end.** Treat the parallel-side end as a separate endpoint
case, not as `β=0` in the sector theorem whose hypothesis is `0<β<2`. Keep the spherical Jordan
frontier, connectedness, finite vertices and local side/corner assumptions, plus the precise
far-field condition
`ρ<‖z−c‖ → (z∈U ↔ 0<Re((z−c)/b) ∧ Im((z−c)/b)∈(0,π))`, `b≠0`.
The providers `TauCeti.exists_bijOn_const_mul_schwarzChristoffelPrimitive_add_of_isJordanCurve_of_halfStrip`
and `TauCeti.exponent_sum_eq_neg_one_of_isJordanCurve_of_halfStrip` give the map and finite sum
`Σeᵢ=−1`; the logarithmic escape at infinity is part of the half-strip case. For necessity consume
`TauCeti.eqOn_const_mul_schwarzChristoffelPrimitive_add_of_halfStrip_polygonal_domain` and
`TauCeti.exponent_sum_eq_neg_one_of_halfStrip_polygonal_domain`, with continuous injective extension
and divergence to infinity at the half-plane end. Retain its distinct half-strip normalization and
all local asymptotic/vertex conclusions. Consume
`TauCeti.tendsto_schwarzChristoffelPrimitive_sub_log_atInfinity` for the finite limit
of `F(z)−log z`, preserving its base-point-dependent constant and approach filter.

For both unbounded variants, own source-normalization uniqueness: since source infinity
maps to target infinity, an intervening source automorphism fixes infinity and is positive
affine. Two distinct matched finite prevertices fix it; if fewer than two finite vertices
are marked, fix an interior source base point instead. Prove the reduction to that stabilizer
using the compactified boundary correspondence and the prescribed end behavior. The bounded
three-prevertex theorem is not a supplier for this unbounded uniqueness target.

The core indexed by `Fin n` is an adapter to the native finite-index `Fintype` statements. Preserve
the bounded, sector-ended, and half-strip theories as separate cases, along with the disc formula,
primitive, necessity, affine covariance, angle sums, and prevertex uniqueness. Do not claim an
arbitrary product is univalent, erase accessory parameters, or narrow the complete L6 scope to the
bounded case.

## Jordan-contour application after L5 and GMT G6

For a closed simple piecewise-C¹ Jordan contour γ, consume
[GeometricMeasureTheory G6](../GeometricMeasureTheory/README.md#g6--traces-gaussgreen-and-classical-domains)
for the Jordan index theorem and its parametrization comparison: one sign `σ∈{−1,1}`
is the winding number throughout the bounded Jordan region and the winding number is zero
on the unbounded component. G6 proves the sign/orientation and reversal laws; they are not
assumptions smuggled into a Green or argument-principle theorem. Use L5 for the full component
identification and L0 for the finite-S weighted argument principle. This yields
`∮γ f′/f = 2πi σ Σ_(a inside γ) orderAt(f,a)` under the same analytic/meromorphic finite-order,
trace-avoidance and null-homology hypotheses. The positive-orientation specialization uses
σ=1 after that index theorem. This is a downstream application of the conformal foundations
and G6; G6's Jordan-index proof consumes the L5 separation target, not this application.

## Relation to sibling roadmaps (this entry is the connective layer)

L5 owns the generic plane-Jordan separation target and its filled-hull consequences; the existing
locally-straight provider remains a partial case. The L5 conformal boundary correspondence is
supplied by the named Tau Ceti extension, boundary-injectivity, and closure-homeomorphism
APIs, which this layer integrates.
[GeometricMeasureTheory](../GeometricMeasureTheory/README.md), G1–G2 and G6, owns metric
rectifiability, arclength, Hausdorff length, and the finite-perimeter comparison for
rectifiable Jordan domains. [DifferentialGeometry](../DifferentialGeometry/README.md),
5.6, owns winding and Green's area identity. [Isoperimetry](../Isoperimetry/README.md),
I6, consumes these to prove the full rectifiable Jordan inequality and circle rigidity.
None of those geometric comparisons is an additional regularity hypothesis for L5.

This roadmap depends on and feeds neighboring areas. Its L1 milestone consumes the GH0
holomorphic-function-space contract at
[GH0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1ca9d1e118dd92419d281602eabd6a6f70f04b85/TauCetiRoadmap/GlobalHolomorphicFunctions/README.md#gh0-holomorphic-function-space): the
native analytic-map carrier, its compact-open uniformity induced from continuous maps,
and the adapter identifying convergence with `TendstoLocallyUniformlyOn` on representatives.
L1 then supplies Montel and Vitali. GH0 needs no new conformal-mapping or Montel result;
it consumes `TauCeti.morera` for the conservative/exactness criterion.

- **Below — `ContourIntegration`.** Provides residues, winding numbers, the argument principle,
  and the global Cauchy theorem. **L0 consumes these results.**
- **Above — `ModularForms`.** Its entry targets the complex modular curves
  `Y(Γ)(ℂ) ≅ Γ\ℍ` (the complex-analytic versions, not the moduli-space framing). The
  **modular & elliptic uniformization** — including the
  `ℍ/Γ(2) ≅ ℂ∖{0,1}` `λ`-covering, the
  `j`-invariant, and Picard's theorem — belongs there; it **consumes our L4 (reflection) +
  L5 (boundary correspondence)** together with `UniversalCovers` (deck group). We do **not**
  claim the modular layer here; we supply the conformal inputs it needs.
- **Consumers — `HeegaardFloer`** uses **L4 Schwarz reflection** for its Cauchy–Riemann boundary
  conditions; **`UniversalCovers`** supplies the deck-group Galois correspondence the `λ`-covering
  pairs with L4/L5.

Across L0–L6, existing provider APIs remain the foundation; the work is to connect them under
explicit hypotheses and complete the additional contracts stated above. The dependency direction
is one-way: L1 consumes the GH0 function-space metric contract; GH0 needs no new conformal-mapping
or Montel theorem.

## Mathlib and Tau Ceti interfaces

Use Mathlib's existing analytic vocabulary and foundations: `CauchyIntegral` for contour
integration, `HasPrimitives` for primitives and its disk/plane exactness results, `OpenMapping` and
`AbsMax` for local geometric consequences, `Schwarz` for the Schwarz lemma,
`LocallyUniformLimit` for holomorphic closure under compact-open convergence, and `BranchLogRoot`
for continuous branches and roots. The partial private lemmas in `Analysis/Complex/RiemannMapping.lean` are not a public
Riemann-mapping theorem and do not replace the Tau Ceti API. For overlapping work, follow the
coordination policy above and prefer the upstream result once it supplies the same theorem with the
needed hypotheses and interface.

Use the existing Tau Ceti contour argument principle and conformal modules as providers rather
than re-proving them: the contour package supplies the residue and null-homologous argument
principle; `ArgumentPrinciple.lean` gives the image-winding formulation; `Rouche.lean`,
`Hurwitz.lean`, and `Morera.lean` supply their named scalar results; `SchwarzPick/` supplies
finite and infinitesimal contraction, equality and rigidity; `NormalFamilies.lean`, `Montel/`, and
`Vitali.lean` supply the analytic L1 results; and `RiemannMapping/` supplies existence, uniqueness,
normalization, and biholomorphic packaging. The remaining work should make
their hypotheses and APIs fit coherently into the layers above and build the additional theory
there, without introducing duplicate carriers or private restatements.

## Other downstream

Several complex variables, PDE (conformal/quasiconformal mappings), and special-function
theory all consume the conformal-mapping and boundary layers.

## References

Ahlfors, *Complex Analysis* (Ch. 4–6) and *Conformal Invariants*; Conway, *Functions of One
Complex Variable I* (VII–IX); Rudin, *Real and Complex Analysis* (Ch. 14); Stein–Shakarchi,
*Complex Analysis* (Ch. 2, 8); Remmert, *Classical Topics in Complex Function Theory*. RMT:
cf. Paulson's Isabelle/HOL `Riemann_Mapping`.
