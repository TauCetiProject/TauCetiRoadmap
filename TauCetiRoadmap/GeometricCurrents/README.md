# Integral currents, geometric homology and minimizing hypersurfaces

Build a reusable theory of currents on finite-dimensional smooth real Riemannian
manifolds: test forms, mass, integer rectifiability, boundary, pushforward, products,
slicing, integral homology, deformation and compactness, Plateau and homological
minimization, and interior regularity of codimension-one minimizers. The same
integral carrier supports geometric-chain comparisons in Morse theory and the
minimizing-hypersurface input to nonspin positive mass in ambient dimensions 3–7.
Every construction includes its restriction, locality, naturality, change-of-chart
and normalization API. [Suggested.lean](Suggested.lean) gives selected interfaces;
this README is definitive.

The ambient manifold M is Hausdorff, second countable, smooth, boundaryless and
finite dimensional, with a chosen smooth positive-definite Riemannian metric.
Compact domains with boundary sit inside this ambient manifold. Integration sources
may be compact oriented smooth manifolds with boundary or corners. Relative
homology also includes the closed neighborhood-retract subsets specified in G3.
Use [HopfRinow L0](../HopfRinow/README.md)'s induced-distance and native
`IsRiemannianManifold` interfaces. No orientation, connectedness, completeness
or compactness of M is assumed unless
a theorem needs it. Use native `ModelWithCorners`, `ChartedSpace`, `IsManifold`,
`TangentSpace`, `RiemannianBundle` and `IsContMDiffRiemannianBundle`. Distances used
for Lipschitz statements are the induced Riemannian distance on connected components,
with the native induced extended distance for disconnected manifolds; build the
chart-local bi-Lipschitz comparisons. An unrelated pre-existing metric on the same
type is not silently identified with the Riemannian distance.

The regularity headline is **interior**, codimension one and locally mass minimizing:
an integral (n−1)-current with no boundary in an open set of a smooth Riemannian
n-manifold has smooth embedded minimal support there when 2≤n≤7. Multiplicity is
retained. This is not a theorem about every stable varifold, about higher codimension,
or about arbitrary behavior at a prescribed boundary. All-dimensional nonspin
positive mass, spacetime/Jang theory, and generic Morse/Bott trajectory compactification
are application theories, not consequences built into this headline.

## Carriers, conventions and suppliers

Use one intrinsic real-current carrier `Current k M`, acting continuously and
real-linearly on compactly supported smooth **k-forms**, and its integer-rectifiable,
locally integral, finite integral and compactly supported integral subgroups. These
are subobjects of the same current theory, not independent models. Put
`A_k = Λ^k T* M`, let `D = DensityBundle M`, and put `V_k = A_k* ⊗ D`.
Consume the early real finite-rank `BundleTest(V_k* ⊗ D)` foundation of
[ComplexKahlerGeometry K5a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/17de96c131cb4bba925c11191595b59dd39cde98/TauCetiRoadmap/ComplexKahlerGeometry/README.md).
The canonical evaluation/bidual and density-dual cancellation give
`V_k* ⊗ D ≃ A_k`. G1 specializes this test space to forms and owns its
current-specific differential, boundary and mass. In a Euclidean chart the test
forms compare with native `TestFunction Ω (E [⋀^Fin k]→L[ℝ] ℝ) ⊤`.
No complex structure, orientation or compactness is required for this real
specialization. The real ambient vector space of currents does not make its
integral subgroup an ℝ-vector space.

Pin

`∂T(ω)=T(dω)`,

with no additional sign, and outward-first orientation on a smooth boundary.
For a degree-k current, `∂(T×S)=∂T×S+(−1)^k T×∂S`. Interval-first products give
`∂([0,1]×T)={1}×T−{0}×T−[0,1]×∂T`. Use nonnegative extended masses and the
normalized Euclidean Hausdorff measure
[`MeasureTheory.Measure.euclideanHausdorffMeasure`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Geometry/Euclidean/Volume/Measure.html#MeasureTheory.Measure.euclideanHausdorffMeasure),
written Hᵏ below: H⁰ is counting measure and Hᵏ agrees with Lebesgue volume in
real Euclidean dimension k. Prove all raw-Hausdorff conversion factors explicitly.
For rectifiable Jacobians use native `LinearMap.normDet`; pointwise form norms and
simple-vector volume agree through CalibratedGeometry C1's comass/Gram comparison.

For smooth geometry use RiemannianGeometry's conventions
`R(X,Y)Z=∇_X∇_Y Z−∇_Y∇_X Z−∇_[X,Y]Z`,
`B(X,Y)=(∇^N_X df(Y))^⊥`, `S_νX=−(∇^N_Xν)^⊤`,
`H=(tr B)/m` for m>0, and `Δ⁺=−div grad`.
The outward unit sphere has `B=−gν` and averaged `H=−ν`.
Scalar curvature is full trace, `Scal=2Σ_(i<j)K_ij`.

Consume the following suppliers at their indicated item boundaries:

| Supplier | Input used here |
| --- | --- |
| [ComplexKahlerGeometry K5a early real bundle-test foundation](https://github.com/TauCetiProject/TauCetiRoadmap/blob/17de96c131cb4bba925c11191595b59dd39cde98/TauCetiRoadmap/ComplexKahlerGeometry/README.md) | Density line, compactly supported smooth finite-rank bundle tests, fixed-compact derivative seminorms, canonical LF topology, native chart/frame extension maps and their linear universal property, restriction/gluing and real scalar compatibility. G1 owns the real form specialization below; no later PDO, elliptic, Hodge or complex-current comparison is an input. |
| [GeometricMeasureTheory G2–G6](../GeometricMeasureTheory/README.md) | Countable rectifiability, approximate tangents/tangential differentiation, weighted area/coarea, BV/local perimeter, De Giorgi structure, trace and Gauss–Green. Build their manifold/chart and current comparison here. GMT does not own currents or minimizing-current regularity. |
| [DifferentialGeometry0–2,5,8–9,12](../DifferentialGeometry/README.md) | Generic alternating form bundles, exterior derivative/pullback, orientation, outward-first integration/Stokes/corners, smooth simplices, real smooth-chain comparison and induced metrics/densities. Use its actual form and simplex carriers. |
| [CalibratedGeometry C1/C2](../CalibratedGeometry/README.md) | Comass; the **single integral finite smooth-chain complex** on DG8.3's `SmoothSimplex →₀ ℤ`, integral smooth-to-singular comparison, and finite oriented relative fundamental chains from GT's smooth triangulation. G2–G3 build their evaluation into currents, not another integral smooth complex. |
| [AlgebraicTopology2–4/6](../AlgebraicTopology/README.md) | Native singular homology with integral coefficients, subdivision/excision/relative sequences, orientation local systems and manifold fundamental classes. No current homology is assumed. |
| [DGFloer0](../DGFloer/README.md) | Normalized cubical chains, products, simplicial comparison and coherent topological corner fundamental chains. The smooth/Lipschitz evaluation adapter and rank-drop theorem are constructed here. |
| [GeometricTopology Layer1 and smoothing-and-triangulation item1](../GeometricTopology/README.md) | Native-compatible embedded normal bundles/tubes, collars and actual ordered locally finite/relative smooth triangulations. These do not supply current compactness. |
| [MorseTheory M3](../MorseTheory/README.md) | Its early smooth proper bounded-below exhaustion from compact exhaustion and a smooth partition of unity, before Morse approximation. G2 proves the integral sublevel/tail comparisons; no Morse differential or Bott theorem is used. |
| [TopologicalKTheory T1.5](../TopologicalKTheory/README.md) | The finite coordinate real Grassmannian/submodule carrier used for the auxiliary tangent-plane bundle; GC constructs its intrinsic fibre comparison and proves compactness; no bundle classification or Bott theorem is needed. |
| [RiemannianGeometry R5](../RiemannianGeometry/README.md) | Earlier immersion geometry B/S/H, Gauss/Codazzi/Ricci and first volume variation; R5a.1's density-volume theorem and R5b's general smooth normal Hessian/Jacobi/stability and Dirichlet API. |
| [CalibratedGeometry C3](../CalibratedGeometry/README.md) | C3's calibration-minimum/stability consequence and oriented-chain comparison, consuming R5a.1's orientation-free C² relative-volume theorem. C6 retains its specialized Lagrangian Hessian. |
| [PDE scalar Sobolev/trace, harmonic theory, ABP and non-divergence estimates](https://github.com/TauCetiProject/TauCetiRoadmap/blob/90cd3694d4b5bd2a5b4d3b89652a958b951210a1/TauCetiRoadmap/PDE/README.md) | Lane A Sobolev/trace and Hölder carriers; B.8–10 interpolation and Mihlin–Hörmander/CZ bounds; C.12–13 harmonic comparison and the single generic strong-solution ABP/contact engine with GMT's area input; D16–19 variational/represented operators; the **non-divergence Calderón–Zygmund** and **non-divergence Schauder/classical Dirichlet** families (E.26/E.25 in this edition). G6 constructs the additional Hessian-intersection/common-fixed-point and nonlinear graph upgrade. Divergence-form estimates are not substituted for those non-divergence families. |
| [RiemannianGeometry R5b](https://github.com/TauCetiProject/TauCetiRoadmap/blob/fe24665114fd3848f928d85e00f717f248bc6c56/TauCetiRoadmap/RiemannianGeometry/README.md), with [VariationalMethods V2.3–V2.4/V3–V5.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/515847c411b9f9642d7c1d180b2a6e82bb976e3a/TauCetiRoadmap/VariationalMethods/README.md) and [UnboundedOperators UO-D06](https://github.com/TauCetiProject/TauCetiRoadmap/blob/24e97bb6ab2f84e01c5a3caca0b6cd4d8ec72787/TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md) | R5b's named normal Hessian/Jacobi/full-scalar stability and boundary-H²/Dirichlet-domain exports consume the single generic closed-form/represented-operator and compact-form comparisons. Use that finite-chart Riemannian metric/normal-bundle specialization, not another generic spectral or Jacobi construction. A compact-boundaryless PDO theorem is not a Dirichlet boundary theorem. All geometric excess/height/iteration and nonlinear minimizing-graph constructions remain targets here. |

[CalibratedGeometry C2](../CalibratedGeometry/README.md#c2-calibrated-immersions-and-integration)
supplies the integral smooth-to-singular quasi-isomorphism: integer generator
maps and both face-compatible chain homotopies from DG8.3's simplex-level
smoothing data, with coefficient-change agreement to DG's real-only operators.
GC constructs the evaluation/current and Lipschitz comparisons on that same
integral smooth complex.

[RiemannianGeometry R5a.1](../RiemannianGeometry/README.md)
supplies `volumeVariation_isContDiff` through native orientation-free densities,
including finite relative volume for variations fixed outside a compact interior
set on a noncompact source. R5a.2 supplies first variation; R5b supplies the
normal Hessian/Jacobi/full-scalar stability and normal-Dirichlet comparison used
in G6. Calib C3 consumes the same R5a.1 volume lemma. G1–G5 and ordinary current
homology use none of the general second-variation/Dirichlet results.

## Native floor and design direction

Consume Mathlib's LF test functions, distributions, continuous alternating maps,
flat `extDeriv`/`extDerivWithin` and their C² square-zero and pullback theorems;
normalized Hausdorff measure, `LinearMap.normDet` and its linear-image/Gram formulas;
Rademacher's theorem, Jacobian change of variables, signed/vector measures and
variation, Riesz–Markov–Kakutani, Radon–Nikodym, Bochner integration and native
homological complexes/singular homology. A distribution testing scalar functions,
a tangent distribution in Frobenius theory, a vector measure or an exterior form
is not an integral-current carrier.

Consume Tau Ceti's orientation-free
[`TauCeti.riemannianVolume`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean),
chart Gram-density/overlap/isometry laws and local finiteness; and its native
covariant-derivative curvature/Ricci/full-scalar contractions, specialized to
the Levi-Civita connection for the geometric formulas. The volume construction
uses a continuous RiemannianBundle, Borel structure, C¹ manifold and Lindelöfness;
it does not require orientation. Compare hypersurface measure and smooth integration
with this same volume, without defining another Riemannian measure.

Follow [Mathlib's area-formula design #39120](https://github.com/leanprover-community/mathlib4/pull/39120),
[normalized-measure design #37310](https://github.com/leanprover-community/mathlib4/pull/37310),
and [the Hausdorff/(co)area discussion](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/Hausdorff%20measure%2C%20spherical%20measure%2C%20and%20%28co%29area%20formula).
Use [Tau Ceti's countable-rectifiability design #16790](https://github.com/TauCetiProject/TauCeti/pull/16790)
for GMT's underlying predicate and closure API. The injective, injective-derivative
area formula in [Tau Ceti #15922](https://github.com/TauCetiProject/TauCeti/pull/15922)
is an input toward GMT's full multiplicity and rank-deficient area theorem, not a
substitute for it. Implement the required generality in Tau Ceti following those
shapes; no target waits for an upstream merge.

## G1. Test forms, currents and mass

Define `TestForm k M` as K5a's compactly supported smooth real bundle tests
`BundleTest(V_k* ⊗ D)`, transported through the canonical smooth fibre isomorphism
`c_k : V_k* ⊗ D ≃ A_k`. Its pointwise formula is bidual evaluation followed by
`D* ⊗ D → ℝ`; prove it and its inverse commute with every chart and frame change.
Use the same construction on each open subset. Prove that postcomposition with
`c_k` and its inverse gives mutually inverse real continuous-linear test maps,
preserves the exact support and each permitted extension by zero, and commutes
with restriction and locally finite gluing. On every fixed compact support,
compare the derivative seminorms in both directions using smoothness of `c_k`
and bounded derivatives of it and its inverse on finitely many charts. Thus the
transported topology is exactly the supplier's LF topology, independent of atlas,
frame, auxiliary connection and partition of unity; do not define a second generic
LF topology or repeat its general foundation.

Pin the native chart map: a smooth local frame sends a native
`TestFunction Ω F ⊤` to the corresponding compactly supported section by
extension by zero, with precisely that pointwise formula and support. In a
Euclidean open chart with the standard form frame, prove `TestForm` is
real topologically linearly equivalent to
`TestFunction Ω (E [⋀^Fin k]→L[ℝ] ℝ) ⊤`; both maps preserve evaluation,
fixed-compact supports and their derivative seminorms. Use K5a's final locally
convex universal property to prove continuity of these maps and their inverse,
rather than the raw final topology of topological spaces. Prove the induced
compact-convergence dual equivalence with real `BundleDistribution(V_k)`;
G4's weak test-evaluation convergence remains a distinct topology.

G1 owns continuous exterior derivative and smooth multiplication on these same
form tests, consuming DG's form operations and K5a's chart seminorm estimates;
prove the actual pointwise, chart and restriction equations. Form pullbacks
retain their actual regularity and support hypotheses. All these constructions
are real and precede C5.4's downstream real/complex current comparison; neither
that comparison nor K5a's later distribution-operator/Hodge theory is an input.

Define real currents as continuous real-linear functionals on these tests.
Develop evaluation/extensionality, zero/addition/scalars, restriction to open sets,
locality, gluing on locally finite covers, support and its closedness, and
diffeomorphism transport; orientation signs are specified for integration currents. Define boundary by dual
exterior derivative, prove linearity/locality/support and `∂²=0`, and use zero boundary
in degree zero. Extend the graded current complex by zero in negative degrees
when stating boundary/slicing identities at the degree-zero endpoint. A zero-current has augmentation only when the support/finite-mass
hypotheses allow evaluation against a cutoff equal to one near its support; prove
independence of cutoff. No constant noncompact test function is inserted into its
domain without that extension.

Define extended mass as the supremum of absolute evaluations on tests with pointwise
comass≤1. Define local finite mass by uniform order-zero bounds on tests supported
in each compact subset. Prove equivalent variational characterizations and
restriction/localization. **For locally finite-mass currents** construct the unique
locally finite Radon mass measure ‖T‖ with minimal evaluation domination. Its measure
on an open set is the corresponding local supremum, and its total mass is M(T).
An arbitrary higher-order current need not have such a Radon representation.
On a Euclidean open Ω the mass measure lives on Ω; it need not be locally finite
at the frontier of Ω in the ambient space.

Prove the local measure-valued representation in the **native normed dual of
the comass-form fibre**. Its dual norm is the k-vector mass norm. Identify its
underlying vector space with native exteriorPower, prove finite-dimensional
comparison with its coefficient Hilbert norm, and equality on simple vectors;
do not install a competing global norm on native forms or equate these two
vector norms. Use the dual-comass norm for vector-measure variation and a.e.
unit polar density. Coordinate trivializations need not be isometric: construct
the metric-dependent density/transition comparison and the intrinsic mass measure.
Native globally finite-valued vector measures apply to finite-mass restrictions;
local finite mass uses compatible relatively compact restrictions, not an
infinite-valued Banach-space vector measure on the entire manifold. Build the extension to compactly supported continuous
forms, Borel restrictions and locally bounded Borel weights, preserving evaluation,
locality and the mass bounds. A Borel restriction of a finite-mass current is again
a finite-mass current; its boundary need not have locally finite mass. Define `LocallyNormalCurrent` by local finite mass of both T and ∂T,
`NormalCurrent` by the two global finite masses, and the compactly supported
normal subgroup separately. No compact support is implicit in the first two names. For k≥1 smooth weights satisfy
`∂(fT)=f∂T−T⌞df`, with `T⌞df(ω)=T(df∧ω)`; the degree-zero identity uses
zero boundary and zero negative-degree contraction.

Include positivity/finiteness conversion lemmas, mass zero iff current zero,
triangle/integer-scaling inequalities and scalar homogeneity for real currents,
support and null-set restrictions, compact-support finite-mass consequences,
weak lower semicontinuity and smooth submanifold comparisons. Forms/currents above
ambient dimension vanish; degree-zero forms and currents have explicit evaluations.
Do not infer finite global mass from local finiteness or stationarity.

Own the real constancy theorem: on a connected oriented open m-manifold,
a real m-current with zero boundary is a constant real multiple of its
oriented integration current. Include distributional currents, localization,
orientation reversal, the degree-zero case, and restriction/naturality.
Prove it by local coordinate test derivatives and the criterion, then connected overlap gluing. Reuse Tau Ceti's `TauCeti.Analysis.Distribution.DuBoisReymond` module's
`ContDiff.exists_contDiff_deriv_eq_of_integral_eq_zero` and
`ContinuousOn.exists_eqOn_const_Ioo_of_integral_deriv_smul_eq_zero` for the
one-dimensional mean-zero-test primitive and continuous-function specialization;
these address one-dimensional continuous functions; the arbitrary-distribution/
multidimensional criterion is constructed here.
G1 owns that criterion explicitly:
for a scalar distribution on a connected Euclidean open set, annihilation of
every coordinate derivative of compactly supported smooth tests implies it is
c times Lebesgue integration; include nonempty/uniqueness, local-to-global and
finite-dimensional componentwise vector-valued `TestFunction` versions. Prove it by local
localized convolution regularization, including smooth compact mollifiers,
test-topology convergence and commutation with derivatives, then vanishing
derivatives of the regularizations and compatibility
of the resulting constants on overlapping balls; do not assume local finite mass
as a substitute for that argument.

## G2. Integer rectifiability, integration, pushforward and slicing

An integer-rectifiable current is represented by a countably k-rectifiable set,
a measurable oriented unit simple approximate-tangent k-vector, and locally
integrable integer multiplicity. Use GMT G2's approximate tangent plane and Hᵏ;
prove the manifold/chart comparison and representation independence under null
changes, changes of parametrization and simultaneous orientation/multiplicity
reversal. Prove its mass is absolute multiplicity times Hᵏ and supply the
rectifiable density, restriction, sum and orientation APIs. The unweighted set,
its parameterized cover and the resulting current are distinct objects.

Define a locally integral current by integer rectifiability of T and ∂T with the
local mass bounds. Construct their ℤ-linear subgroups of real currents. The boundary-rectifiability equivalence for integer-rectifiable normal
currents is a later G4b theorem; G2 does not use it. Distinguish
`IntegralCurrent` with finite global mass and boundary mass,
`LocallyIntegralCurrent`, and `CompactlySupportedIntegralCurrent`; the latter is
the chain group in G3. Prove the inclusions, boundary preservation and degree-zero
integer-atomic representation. Compactly supported finite-mass integral 0-currents
are finite integer sums of point masses; their augmentation is the sum of those
integers. Noncompact locally integral 0-currents need only be locally finite.

Prove integral constancy with integer coefficient. In particular, a locally
integral k-current supported in a connected oriented embedded k-submanifold,
closed in an open U and with ∂T=0 in U, is a single constant integer multiple
of that submanifold's integration current in U. Prove the local and global
intrinsic/supported comparisons. The orientation-coefficient
extension is constructed in G3.

Construct the current of a compact oriented smooth source P, including boundary and
corners, by integration. Prove
`∂[[P]]=Σ_faces [[face]]` with outward-first orientation, multiplicity and shared
corner cancellation; identify its mass measure with native Riemannian volume for an
isometric embedding. For immersions distinguish parameterized volume from the mass
of the pushed current when sheets cancel. Evaluate Calib C2's integral smooth chains
on DG's same `SmoothSimplex` carrier as currents. Prove generator, boundary,
coefficient-change, orientation, subdivision and smooth-map naturality formulas and
agreement of integration with DG. This is a map from C2's existing complex, not
another integral smooth-chain definition.

First construct products with a finite-dimensional smooth integration factor
(and smooth weights) for arbitrary real currents, by parameterized test-form
pairing and integration. Include compact oriented factors with boundary/corners
and locally finite versions with the exact proper-support bounds. In particular,
construct `[[a,b]]×T` for real T and prove the boundary/homotopy formulas as
identities of currents. For locally normal T prove local mass/boundary bounds;
for finite normal T prove
`M([[a,b]]×T)≤|b−a|M(T)` and
`M(∂([[a,b]]×T))≤2M(T)+|b−a|M(∂T)`, with oriented endpoint cancellation when a=b.
These real/normal products precede their use in Lipschitz approximation and
real mollification; they are not restricted to integer-rectifiable currents.

Construct oriented simplex/cube/interval currents and general products of integral
currents on the same real carrier. Prove the integral subgroups are closed under
the smooth-factor product, and supply product mass bounds, associativity, the
point unit, swap sign `(−1)^(kl)`, boundary Leibniz and pushforward compatibility.

Construct smooth pushforward by test-form pullback, with cutoffs and properness on
support when required; prove cutoff independence, identity/composition, evaluation,
support, boundary and mass formulas. Extend pushforward to locally Lipschitz maps
on the support for normal currents by locally compatible smooth chart
approximation, proving cutoff/overlap independence, locality, composition,
boundary naturality and compatibility with the smooth definition. For integral
currents prove agreement with the direct rectifiable tangential construction. Characterize the extension by smooth
approximating maps converging uniformly on a neighborhood of the support of a
fixed **compactly supported** normal/integral T, with uniform Lipschitz bounds
there and a common compact image: their pushforwards converge weakly.
For this controlled compact region construct decompositions
`f_j#T−f#T=R_j+∂S_j` with `M(R_j)+M(S_j)→0` and the corresponding support
and mass/boundary bounds; G4a later identifies this as flat convergence.
For currents without compact support, including finite-mass normal currents,
require uniform properness of the approximating maps on the relevant support,
so target-compact preimages remain in a common source compact set, together
with uniform local Lipschitz bounds; this gives the target-local statement.
Under the preceding uniform properness on support, finite global mass and
boundary mass, and a uniform global Lipschitz bound, locally uniform convergence
of the maps gives global decompositions
`f_j#T−f#T=R_j+∂S_j` with `M(R_j)+M(S_j)→0`. Prove this by cutting T off
on a compact region, applying the compact homotopy comparison there, and
bounding the two pushforwards of the remaining tail by its mass. For normal
currents use smooth cutoffs; for integral currents choose almost-everywhere
integral sublevel restrictions of a smooth proper exhaustion, using G2 slicing,
so R_j and S_j remain integral. Use G2's local slicing on these compact sublevels:
the smooth exhaustion is locally Lipschitz and need not be globally Lipschitz
on an incomplete manifold. Consume [MorseTheory M3](../MorseTheory/README.md)'s
early smooth proper bounded-below exhaustion, before its Morse approximation;
prove the required sublevel restriction and tail-mass comparisons here.
Finite mass alone does not remove the properness needed for boundary naturality
on an incomplete source manifold. Quantitative bounds in terms of the uniform
map distance are separate: prove them for
Euclidean/chart targets, or under explicit geometric control: let r_conv>0 be a
uniform convexity-radius bound and require the r_conv/2-tube of the images to
lie in a neighborhood with sectional curvature at most κ. Require map distance
at most `½ min(r_conv,π/√κ⁺)`, with the second term interpreted as ∞ when κ≤0.
The chosen short geodesics stay in this tube. Prove the resulting uniform
differential bound for their interpolation, with this fixed comparison margin,
and include it in the estimate's constant. Do not assert a target-independent
small-distance homotopy estimate on arbitrary Riemannian manifolds.
Local Lipschitz control alone does not bound magnification of a small mass tail. Prove
independence of the approximation using the small homotopy fillings and their
estimates; existence of the local smooth approximation is part of the construction.
A merely Lipschitz pullback is not assumed
to be a smooth test form. Compact support needs no global properness; locally finite
currents require properness on support and local bounds. Prove

`M(f#T) ≤ ∫ J_k(D^Tan f) d‖T‖ ≤ Lip(f)^k M(T)`

in the respective rectifiable/global-Lipschitz regimes, with local versions and
integer cancellation. Own `integralCurrentPushforward_eq_zero_of_tangentialRank_lt`:
rank less than k at ‖T‖-a.e. approximate tangent point implies `f#T=0`.
Derive factorization through a lower-dimensional smooth/Lipschitz manifold and
include zero-dimensional edge cases. This does not kill the corresponding raw
singular chain. Maps with different properness/regularity assumptions carry those
assumptions in their theorem statements.

The parameterized interval has
`∂[[a,b]]=δ_b−δ_a`, also for a>b and a=b. An interval-first Lipschitz homotopy
H induces the actual homotopy current for normal T (and its integral restriction), with
`∂H#([0,1]×T)+H#([0,1]×∂T)=H_1#T−H_0#T`.
Compact-support or proper-support bounds must make every term defined.

Own weighted coarea on rectifiable sets before defining slices. For a Borel
countably k-rectifiable S with locally finite Hᵏ, Lipschitz u on an ambient neighborhood of S with values in ℝʳ, 0≤r≤k,
and nonnegative measurable weight h, prove

`∫_S h J_r^S u dHᵏ = ∫_(ℝʳ) (∫_(S∩u⁻¹(y)) h dH^(k−r)) dy`.

Construct the measurable tangential Jacobian and prove a.e. fibre
(k−r)-rectifiability and `Tan_(k−r)(S∩u⁻¹(y),x)=Tan_k(S,x)∩ker D^S u(x)`
at the full-rank points, with the critical part null for a.e. fibre. Include
r=0, rank-deficient, weighted/local, change-of-parameter and manifold/chart
versions. Derive this theorem from GMT's Euclidean area/coarea and tangential
differentiation by countable rectifiable parametrizations and null-set control;
GMT's tangential area formula alone is not this coarea theorem.

For a locally normal k-current T and scalar locally Lipschitz u fix

`⟨T,u,t⟩=∂(T⌞{u<t})−(∂T)⌞{u<t}`.

Prove a.e. existence and measurability, integrality for locally integral T,
the support-in-level-set
statement, local/integrated mass bounds, boundary law
`∂⟨T,u,t⟩=−⟨∂T,u,t⟩`, ordered iterated slicing and permutation signs,
restriction and pushforward/change-of-variables comparisons. Pin the order
recursively by `⟨T,(u₁,…,u_r),y⟩=⟨⟨T,u₁,y₁⟩,(u₂,…,u_r),(y₂,…)⟩`,
with the r=0 slice T. Thus the wedge order is du₁∧…∧du_r; simultaneous
permutation of coordinates and parameters contributes sign(π), and boundary
commutation has sign `(−1)^r`. For k≥1 and a global
Lipschitz constant C prove `∫ M(⟨T,u,t⟩) dt ≤ C M(T)`, with its local weighted
version; ordered r-fold slicing has the corresponding product/Jacobian bound
for r≤k, and negative degrees are zero. Prove
`⟨f#T,u,t⟩=f#⟨T,u∘f,t⟩` a.e. under the exact proper-support hypotheses.
Construct sublevel
restrictions with integral boundary for a.e. parameter, using this rectifiable coarea theorem and GMT's
perimeter theory; do not assert it for every Borel restriction. Own submanifold intersection/pullback on the **given** finite smooth-chain
domain for which every face is transverse to a specified smooth cooriented
submanifold and intersection supports are compact. Fix the normal-first
fiber-product orientation and prove boundary signs, change of coorientation,
presentation independence and comparison to slicing. In normal coordinates,
face transversality gives continuous slice evaluation near the prescribed
regular level; prove the a.e. slice descends to that level and is independent
of the presenting chain. Give naturality and homotopy comparison when the
supplied homotopy has those facewise transversality/support hypotheses.
GC does not choose a Morse-specific transverse subcomplex or prove its moving
lemma; a Morse/Floer consumer must construct it outside this roadmap. A.e. slices alone do not
define an intersection with every fixed unstable manifold. The noncooriented version is constructed among G3's coefficient applications.

## G3. Ordinary integral-current homology and chain comparisons

Form `ChainComplex (ModuleCat ℤ) ℕ` from compactly supported integral currents.
Use pairs `(X,A)` with `A⊆X⊆M`, where X and A are closed subsets with specified
locally Lipschitz neighborhood-deformation-retract data in the ambient manifold.
For each subset S the data consist of an open U containing S, a locally Lipschitz
retraction U→S and a locally Lipschitz homotopy from its inclusion/composite to
id_U, fixed on S. Include smooth closed embedded submanifolds, compact smooth
domains and the pairs `(D,∂D)` using GT's collar data. Prove the controlled local
contractions needed for both X and A.

Define `I^c_*(X)` as the subgroup of ambient integral currents supported in X,
and the relative complex as `I^c_*(X)/I^c_*(A)`. Prove boundary/inclusion properties,
quotient maps, long exact sequences and connecting signs. For smooth embedded
subsets prove the intrinsic versus supported integral-current equivalence;
no intrinsic classical test-form theory on a nonsmooth retract is assumed.
Naturality uses ambient locally Lipschitz maps on neighborhoods sending X to X′
and A to A′, with the relevant compact/proper support hypotheses.

Own `integralCurrentHomologySingularIso` with **integral** coefficients on M and
these pairs. On M and the open pairs in DG8.3, consume Calib C2's integral
smooth-to-singular quasi-isomorphism
with its actual integer generator maps and face-compatible smoothing/chain
homotopies; their real coefficient changes agree with DG8.3's operators. GC constructs the smooth-chain-to-current
comparison and proves it induces isomorphisms in that smooth/open-pair scope,
using local chart contractions/cone fillings, subdivision, G4a deformation/
approximation and relative gluing. For the closed retract pairs (X,A), use the
Lipschitz subcomplex below; do not assume smooth simplices recover the homology
of a nonsmooth closed retract. A Lipschitz singular
complex used in this proof is a new subcomplex of native singular chains with the
same simplex carrier plus the Lipschitz condition; build its basic API and both
comparison maps; GC proves the Lipschitz-to-singular inclusion is an integral
quasi-isomorphism by local contractions/subdivision and compatibility with
C2's integer smooth comparison. Do not redefine the already-owned integral smooth-to-singular
comparison. Prove compact smooth simplices are locally/globally Lipschitz on their
compact source in the relevant charts and retain all boundary orientations.

Prove fundamental-class, augmentation and relative-boundary normalization;
naturality for locally Lipschitz maps, independence of chosen charts/triangulations,
and compatibility with Calib C2's smooth singular comparison. Continuous-map
functoriality of homology is transported through singular homology, not defined by
an unsupported continuous current pushforward. A locally finite current complex
has a different support convention and is not identified with ordinary homology.
No comparison on arbitrary metric spaces is assumed: the necessary local Lipschitz
contraction/deformation facts must be proved for every space to which it is applied.

For Bott orientation coefficients extend this same test-form/current construction
by an AT2.6 local system L, a functor from the fundamental
groupoid to **free ℤ-modules of rank one**, each isomorphic to ℤ. Restrict
this ambient local system to the pairs (X,A) used above. GC constructs its locally constant ±1-transition
cocycle after local generators are chosen, proves the gauge/cocycle independence,
and compares it with the corresponding orientation-cover/line construction.
Construct its signed real line bundle and dual test forms on DG's bundle carrier, by signed local descent using AT's local-system
transport and native bundle gluing. Local exterior derivative glues because
the transition signs are locally constant; prove its flat square-zero,
boundary, lattice/integrality, mass, restriction and compact-support APIs from
the same local current theory. Construct external products with coefficients
in the external tensor product of two such integral lines, interval homotopies
with the pulled-back line, and slicing/restriction with their coefficient and
Koszul signs; prove them by local trivializations and integral signed descent. Compare its integral homology to AT's singular homology
with L and prove pullback/transport, coefficient-compatible pushforward and
orientation-normalization laws. Construct the L-twisted Lipschitz subcomplex of AT2.6's twisted singular
chains: a simplex σ carries its coefficient in L_(σ(e₀)), with the first-face
transport along σ's edge e₀→e₁ and the other face maps exactly as in AT2.6.
Build its boundary, degeneracies, subdivision, relative and coefficient-transport
APIs by restricting AT3's local-coefficient subdivision/prism operators. Map a
Lipschitz simplex with its coefficient to the twisted current by transporting
that coefficient over the contractible simplex; prove independence of its
local trivializations and compatibility with every transported face.
Prove both the inclusion into twisted singular chains and the evaluation into
twisted currents are integral quasi-isomorphisms. Use local trivialization on
contractible charts, the **ordinary G3 comparison already proved above**, and
local contractions/subdivision with local-coefficient relative gluing. Include
the supported relative-pair versions. This constructs the twisted chain route;
it is not inferred merely from the existence of an untwisted chain map.

The nonorientable supported-submanifold constancy
and noncooriented transverse-chain intersection theorems belong here, after the
coefficient construction. For a connected embedded k-submanifold Σ closed in an
open U, an L-twisted locally integral k-current supported in Σ with ∂T=0 in U
is an integer multiple of the canonical twisted fundamental current after an
identification `L|Σ≅o(TΣ)`; if no such identification exists it is zero. Pin the
normal-first determinant comparison
`o(TM)|Σ≅o(NΣ)⊗o(TΣ)` and the resulting identification
`o(TΣ)≅o(TM)|Σ⊗o(NΣ)`. These are ungraded integral orientation lines: tensor
symmetry has no Koszul sign, and the normal-line self-pairing contracts
`e⊗e↦1` for either local orientation generator e. Recover the displayed tangent
line by this pairing on the two normal factors. Changing the chosen
identification `L|Σ≅o(TΣ)` by −1 negates its fundamental current. Keep these
line symmetries distinct from chain-degree Koszul signs.
Prove the same boundary/slicing/transport identities
for the noncooriented intersection construction. Do not assert a nonzero untwisted top
current with zero boundary in a connected nonorientable sheet.
Do not average over the orientation double cover or divide by 2; describe any
cover comparison through the actual signed descent/coinvariant construction
and prove it integrally. The trivial system recovers the ordinary carrier.
This is the coefficient specialization of one current theory, not another
geometric-chain model. Arbitrary nonisometric higher-rank coefficients are
not assumed. A Bott consumer must construct the identification of its negative-determinant
system with this supplied orientation coefficient; that consumer extension is
outside this roadmap.

Give the cubical adapter on the subcomplex of DGF0's normalized chains generated by locally Lipschitz
cubes, with all faces/degeneracies and products in that subcomplex.
Prove compatibility with its cubical/simplicial homotopy comparison and with the
corner fundamental chains. Coordinate-degenerate cubes vanish, but the rank-drop
relation is established through G2 and the current map, not inserted into normalized
cubical singular homology without proof. A merely topological corner compactification
has no evaluation current until the application proves the required regularity.

The current comparison is independent of Morse differential/unstable-cell evaluation.
Check integer point/interval/circle/disk/sphere and relative fundamental classes,
and the ℤ/2 torsion class of RP². A comparison only to real homology would fail this
last check: allowing arbitrary real fillings is not integral-current homology.

## G4. Weak and flat convergence, deformation and compactness

### G4a. Weak/flat topology, deformation and local fillings

Define weak convergence by convergence on each fixed test form. Compare it with
its induced weak topology; do not silently use a continuous-linear-map operator or
bounded-convergence topology as the weak topology. Prove boundary continuity,
localization and pushforward continuity with the exact uniform support and
regularity bounds. Construct extended flat mass by decompositions `T=R+∂S`, retaining
whether R,S are real normal or integral and where their supports lie.
The real flat norm is finite on compactly supported finite normal currents;
an arbitrary current can have infinite flat mass. Prove the test-form bound
`|T(ω)|≤Flat(T) max(sup‖ω‖,sup‖dω‖)` in its finite regime. Construct the
flat completion using native completion and its evaluation/current comparison.
Keep the integral-decomposition flat metric and its completion distinct until
the relevant comparison has been proved; no identity with a real filling norm
is assumed. Prove
nondegeneracy, triangle/scaling, locality, completeness of the appropriate flat
completion, compatibility maps and boundary continuity. The finite-mass integral identification inside a completion is proved only
after closure in G4b; completion does not automatically preserve integer
rectifiability.

Build the Euclidean deformation theorem with explicit grid/polyhedral chains,
remainder/filling and mass/support estimates, and the compatible relative/local
versions. Separate real chart mollification, which approximates normal currents by smooth
real currents, from integral polyhedral approximation, which retains integer
coefficients with controlled mass, support, boundary error and the explicit
R+∂S approximation estimates. Real mollification is not an integral approximation.
Prove the compatible rectifiable approximation and isoperimetric filling
estimates with constants, dimensions, scaling and zero-dimensional augmentation
constraints. Extend by finite charts/partition of unity with **integral** gluing:
real partition weights by themselves do not preserve integer multiplicity. Supply
the integral cutting/slicing and filling comparisons that replace that shortcut.
Prove small-cycle filling/class-closedness on compact regions of a smooth manifold.
Construct the local cone operator in a Lipschitz-contractible chart, its
homotopy boundary formula including the degree-zero augmentation term, and
for a Euclidean cone with radius bound r the estimate
`M(cone T)≤r M(T)/(k+1)` for a k-current. State the exact cone center/support
and cycle hypotheses used for filling. These estimates precede G3.

### G4b. Compactness and closure

Prove Federer–Fleming compactness and closure: with supports in one fixed compact
K and uniform bounds on both M(T_i) and M(∂T_i), a sequence of integral currents
has a subsequence converging weakly to an integral current with the boundary and
support limit specified. Give the flat convergence comparison in the proved
Euclidean/manifold support setting, permitting a fixed neighborhood for filling
supports when needed. Derive mass lower semicontinuity and convergence of boundary
currents. The local/exhaustion version states local mass/boundary bounds and the
diagonal compactness/tightness assumptions; no global finite-mass conclusion is
inferred. Point currents escaping to infinity demonstrate why a global mass bound
alone is not confinement or tightness.

After closure prove the boundary-rectifiability theorem for an integer-rectifiable
locally normal current, with its finite and localized versions. Establish the
resulting equivalence with G2's explicit integral definition and the finite-mass
integral-current identification in the flat completion: in the proved support
regime its integral flat chains with both finite mass and finite boundary mass
are precisely finite integral currents. Finite mass alone is not the normality
hypothesis. G2's slice integrality
uses its rectifiable coarea representation directly, not this theorem.

## G5. Plateau and homological minimizers

For a compactly supported integral (k−1)-boundary B with a nonempty filling class,
construct mass-minimizing integral fillings in Euclidean space. Prove competitors
can be confined to a common compact convex trap by a mass-nonincreasing Lipschitz
projection fixing B, with the empty-boundary case separate, and apply G4.
The k=1 boundary has augmentation zero; arbitrary integral 0-currents do not all
bound. Prove support, boundary, infimum attainment, lower semicontinuity and
invariance under isometries/scaling. Do not state that every cycle bounds on an
arbitrary manifold.

For this confinement, after G4's closure theorem construct the extension of G2's
pushforward to **finite-mass normal currents in complete Euclidean space** under
a globally Lipschitz map, even when that map is not proper on the support.
Choose radial cutoffs χ_R=1 on B_R, supported in B_(2R), with
`|dχ_R|≤C/R`. The already-constructed compact-support pushforwards of χ_R T
are Cauchy in mass; their boundaries converge to the pushforward of ∂T because
`∂(χ_R T)=χ_R ∂T−T⌟dχ_R` and the extra term has mass at most
`(C/R) M(T⌞(B_(2R)\B_R))`, before the appropriate Lipschitz power.
Use finite mass of both T and ∂T to prove cutoff independence, boundary
naturality and `M(f_*T)≤Lip(f)^k M(T)`, with the degree-zero boundary separate.
For integral currents use a.e. integral ball restrictions and choose radii in
[R,2R] by coarea so their slice boundary errors are bounded by the same vanishing
annular mass/R estimate. Their pushforwards are integral, and G4 closure identifies
the same limit as integral; smooth real cutoffs are not claimed to preserve
integrality. Prove composition and agreement with G2's proper-support definition.
For a convex projection, Lip≤1 and it fixes B, so this extension preserves the
boundary and does not increase mass, giving equality of confined and unconfined
infima. Completeness of this Euclidean source and finite mass/boundary mass are
part of this adapter: G2's general incomplete-source properness/support conditions
remain in force. No arbitrary noncompact homology constraint is transported
without its own constraint-preserving map and proof.

On a compact Riemannian manifold construct minimizing integral representatives
of each fixed integral homology class. Pin the trapped versions as separate
theorems. Let K be a compact locally Lipschitz neighborhood retract in M,
let B be an integral boundary supported in K, and supply T₀ supported in K
with ∂T₀=B. Minimize both over the fixed-boundary class
`{T′ : support T′⊆K, ∂T′=B}` and over the fixed integral-homology class
`{T′ : support T′⊆K, T′−T₀=∂Q for an integral Q supported in K}`.
The latter condition implies the fixed boundary. Prove constraint closedness
under G4b convergence using G4a's small-cycle fillings **in K**, obtained from
the supplied retract/contraction bounds; weak closure of ∂T=0 alone is insufficient.
Include nonzero-class nontriviality and positive minimum mass, integer multiplicity
and the degree-zero/augmentation cases. The compact manifold case is K=M.

For a noncompact ambient M these fixed compact traps give the same existence
theorems. A theorem minimizing over a larger unconfined class must include an
actual mass-nonincreasing confinement map into this class which preserves the
specified boundary/homology constraint; prove equality of infima through that map.
G7's exhaustion theorem supplies local limits instead of presuming unconfined
mass infima are attained. A trap-constrained minimizer is locally minimizing
only where its admissible competitors stay in the trap; barriers provide the
additional support conclusions.

Define local area minimization by comparisons with `T+∂Q`, Q an integral current
of one higher dimension with compact support in a relatively compact variation
domain; compare masses on a region containing the changed support. Prove locality,
restriction and the implication from the homological minimizers above. For
**k≥1**, prove agreement with fixed-boundary minimization on sufficiently small
contractible balls for competitors agreeing outside a compact subset of the ball:
the difference is a compactly supported k-cycle, and the local cone/homotopy
operator fills it inside the ball. This comparison is interior to any admissible
trap, not a claim that all manifold cycles bound.

For **k=0** retain the ordinary differential `∂_0=0`. The corresponding
fixed-boundary comparison must also impose **equal augmentation** on the compactly
supported difference. Prove that the degree-zero cone formula fills precisely
augmented-zero differences. The augmentation is evaluated against a smooth cutoff
equal to1 near the changed support and is independent of that cutoff; no constant
noncompact test is inserted into the LF domain. Retain ordinary H_0, relative
homology and all degree-zero targets. For the rank-one integral local-system
version in G3, trivialize over this ball and impose vanishing of the transported
coefficient sum; the zero condition is independent of the trivialization.

As an acceptance regression, for p in an interval of ℝ, the point current δ_p
is minimizing against every compactly supported boundary perturbation: its
augmentation remains1, so the mass is at least1. The current0 has the same ordinary
boundary and agrees outside the interval, but has mass0 and different augmentation.
It is excluded from the equal-augmentation class, not from the ordinary current
complex. The homotopy/product formula makes smooth compactly supported variations
admissible; their first variation and smooth stability consequences are proved in
G6, not assumed here. No positive-mass or Morse comparison theorem is an input
to these existence results.

## G6. First variation, normal stability and interior regularity

Construct the associated mass/tangent-plane measure of an integral current, on the
Grassmann bundle. Construct its unoriented fibre from Calib C1's
finite-dimensional inner-product oriented carrier, using only its topological/
frame-quotient construction, by quotienting by
orientation reversal (including the two degree-zero orientation rays). Compare
this quotient with TopK T1.5 transported along a chosen linear isometry; prove
isometry independence through its actual orthogonal-group action and chart
transition laws. Derive compactness from orthonormal-frame quotients before
using it for the Grassmann bundle.
Give the auxiliary rectifiable varifold's restriction, weight, integer multiplicity,
weak measure convergence and pushforward API needed by this proof. Prove the
Grassmann bundle is compact over compact base regions and establish the Radon
compactness/local tightness comparisons. This auxiliary theory is constructed here;
a measure on M alone is not a tangent-plane varifold.

Define weak first variation under compactly supported smooth ambient flows. Prove
its tangent-divergence formula, metric/change-of-chart laws and agreement with
Riem R5a on a smooth current, with multiplicity. Prove local minimizers are
stationary. Develop density, monotonicity with actual Riemannian error bounds,
rescaling, tangent cones and rectifiable/integral limit comparisons; identify the
Euclidean blow-up metric and orientation/multiplicity normalization.

Before the regularity headline, own the minimizing-limit theorem. On an open U,
let smooth metrics g_i converge in C∞ on compact subsets to g, with the same
underlying current carrier; let T_i be locally integral currents, locally minimizing for g_i,
with ∂T_i=0 in U and locally uniform mass bounds. After the G4b local subsequence,
prove the limit is locally minimizing and its mass measures converge against
compactly supported continuous tests. Use G4a splicing/fillings and minimality
to prove this no-cancellation/mass-convergence statement; weak convergence
alone is insufficient. Prove the smooth-current/minimizer first-variation
comparison; once a minimizer is smooth, its normal Hessian is nonnegative
by R5b/R5a.1, not by differentiating mass at an arbitrary nonsmooth current.

Own the strong one-sided maximum principle for smooth minimal hypersurfaces
before using it to identify coincident sheets: through local minimal graph
coordinates reduce to PDE's scalar elliptic strong maximum/comparison principle,
with the actual uniform ellipticity and common metric hypotheses. Establish the
weak tangent-divergence barrier principle needed for constrained minimizers.
G7 consumes these results rather than supplying a premise of the G6 headline.
Use PDE C.12–13 explicitly for harmonic mean-value/regularity and maximum
principles. Consume PDE B.8's maximal-function theorem with its measure hypotheses and
native Vitali/Besicovitch coverings for the Lipschitz-approximation selection
estimates; construct the actual geometric selection and bounds here before
the excess-decay argument.

Consume Riem R5a.1's `volumeVariation_isContDiff` and R5b's
`minimalNormalSecondVariation`, `hypersurfaceJacobiOperator`,
`minimalHypersurface_scalarGauss` and `minimalHypersurface_stability_fullScalar`
on the same smooth normal bundle. For a two-sided regular minimizing sheet
with unit normal ν, use their normalization
`L=Δ⁺−(|A|²+Ric_N(ν,ν))` and `Q(φ,ψ)=∫φ Lψ`; the trace-mean-curvature
linearization is `−Lφ`, with averaged version `−Lφ/m` for m>0. R5b's full-scalar
Gauss identity gives the stability inequality

`∫(2|∇φ|²+Scal_Σ φ²) ≥ ∫(Scal_N+|A|²)φ²`.

Transport these smooth formulas to the regular current support with its integer
multiplicity and native mass/volume comparison. On each relatively compact
smooth domain of the regular sheet, use R5b's W¹,²₀ form extension,
`normalJacobi_boundaryH2Estimate` and
`normalJacobi_dirichletDomain_eq_sobolevTwo_inter_zeroTrace` to identify the
Dirichlet realization and deduce nonnegative spectrum from minimizing stability.
This is an application of the single R5b operator, not another Jacobi construction.
The nonlinear minimizing-graph proof below consumes PDE directly. One-sided
sheets use normal sections, or deck-odd scalar tests on the normal cover; they
do not acquire the two-sided inequality for all scalar functions. All variations
here are compactly supported in the interior; free-boundary conclusions are not
inferred. In dimension 2, Scal_Σ=2K gives the surface coefficient 1/2 after dividing
this displayed inequality by 2.

Construct the minimizing-current regularity proof on this same carrier. Use GMT's
finite-perimeter structure but build its current-to-perimeter comparison,
integer-height/sheet decomposition, orientation and minimizing-set localization.
Establish blow-up compactness, Caccioppoli/excess and height estimates, Lipschitz
approximation, harmonic approximation, excess decay and epsilon regularity,
C1,α graphical representations and minimal-graph elliptic bootstrapping.
Use PDE A.7's Hölder carriers. For a C1,α minimal graph first prove the
interior W²,² estimate by quasilinear difference quotients, using the uniform
convexity of the area integrand in its bounded-slope regime. Rewrite its equation
in strong nondivergence form with C0,α principal coefficients and right-hand side.
Define `W^{j,p}_loc(Ω)` and `C^{j,α}_loc(Ω)` using membership after restriction
to every open V with compact closure contained in Ω, in PDE A's same domain
Sobolev/Hölder carriers. Include restriction, overlap and derivative compatibility.
Prove finite-cover gluing: membership on balls forming a finite cover of V̄ inside
Ω implies membership on V. Use a smooth partition of unity for Sobolev derivatives;
for Hölder seminorms use a Lebesgue number δ for close pairs and
`2 sup|Dʲu| δ^(−α)` for pairs separated by at least δ. These are local versions
of the same spaces, not new weak-derivative definitions.
Prove C² functions belong to W^{2,p}_loc for every finite `1≤p<∞`, with matching
classical/weak derivatives. Consume native
`TauCeti.hasWeakFDerivOn_of_differentiableOn` at each derivative stage and the
native Sobolev constructors; bounded derivatives on compact subsets supply the
local Lᵖ bounds.

Construct `strongSolution_interiorSchauderUpgrade`: on a Euclidean open set of
dimension m≥1, for `0<α<1`, symmetric locally uniformly elliptic
`aⁱʲ∈C^{k,α}_loc`, `f∈C^{k,α}_loc` and continuous `u∈W²,²_loc` satisfying
`aⁱʲDᵢDⱼu=f` a.e., prove `u∈C^{k+2,α}_loc` for every integer k≥0. Build the
following analytic steps explicitly, using PDE's estimates and solvability as
inputs rather than assuming they already assert this qualitative upgrade.

- Consume PDE C13's single generic strong-solution ABP/contact theorem and export
  its instance `strongSolution_abp_maximumPrinciple` on a positive-radius ball B
  in ℝᵐ, m≥1. For measurable symmetric `λI≤a≤ΛI`, `0<λ≤Λ`, and
  `w∈W^{2,m}_loc(B)∩C⁰(B̄)` satisfying `aⁱʲDᵢDⱼw≥g` a.e. with
  `g⁻∈Lᵐ(B)`, obtain
  `sup_B w≤sup_∂B w⁺+(C_m/λ)diam(B)‖g⁻‖_{Lᵐ(B)}`.
  The generic convex envelope/contact set, gradient-image inclusion,
  determinant/ellipticity bound, GMT G2 area estimate and Sobolev approximation
  are owned by PDE C13, not constructed a second time here. Match its sign by
  applying the lower-bound formulation to −w, with the same λ and actual
  Lebesgue/Lᵐ norm; track the ball dilation and dimension-only constant C_m.
  If the chosen supplier formulation requires an explicit localization adapter,
  own only that adapter: for ε>0 the set
  `{w≥sup_∂B w⁺+ε}` is compactly contained in B. On a neighborhood of its
  relevant contact pieces the local W²,ᵐ hypotheses give the supplier's
  approximation inputs; extend by cutoff there, apply its compact contact
  inequality, and let ε↓0. Prove the estimates independent of the cutoff and
  exhaustion; do not assume the positive part of a W²,ᵐ function is itself
  W²,ᵐ. No new convex-envelope, area or generic ABP engine is assigned to GC.
  Apply both signs with g=0 to deduce uniqueness for boundary-zero strong
  homogeneous solutions with p≥m, using local finite-volume inclusion when p>m.
  This is the named non-divergence comparison used below, with precisely the
  local-Sobolev/continuous-boundary solution class just stated.
- Construct `constCoeffHessianOperator A₀ p`, abbreviated R_A₀, as a bounded
  linear map from scalar Lᵖ to matrix-valued Lᵖ using PDE B10's singular-integral
  bounds and its **non-divergence Calderón–Zygmund** constant-coefficient theorem
  (E26 in the linked edition). For a symmetric positive-definite A₀ its multiplier is
  `ξᵢξⱼ/(A₀ξ·ξ)` away from ξ=0, with value zero there, using the fixed PDE
  Fourier convention. Prove its Lᵖ bounds for `1<p<∞`, real-valued restriction,
  Hessian/inverse identity for compactly supported W²,ᵖ functions,
  coordinate-change comparison and agreement on intersections of Lᵖ spaces.
  Localize `ηu` on a ball where `sup|a−A₀|` is below both the Lᵖ and Lᑫ
  contraction thresholds. For `h=D²(ηu)`, write the actual equation
  `h=R_A₀[χ_B(A₀−a):h+g_η]`, where
  `g_η=ηf+2aⁱʲ(Dᵢη)(Dⱼu)+u aⁱʲDᵢDⱼη`, extended by zero outside B.
  When g_η lies in Lᵖ∩Lᑫ, Neumann iteration converges in both spaces;
  compatibility and uniqueness of the Lᵖ fixed point identify the Lᑫ limit
  with h. Use PDE A's Sobolev embeddings for the cutoff terms involving u,Du,
  and iterate exponents on nested balls, including the p=m case, to reach every
  finite `1<q<∞` from p=2. Export `strongSolution_interiorW2pUpgrade`:
  for continuous symmetric locally uniformly elliptic a, finite `1<q<∞`,
  `f∈Lᑫ_loc` and `u∈W²,²_loc` satisfying `a:D²u=f` a.e., prove
  `u∈W²,ᑫ_loc`. For q≤2 use local finite-volume inclusion; for q>2 the
  iteration stops at q. No W²,ᵖ Dirichlet theorem is assumed here.
- On a smaller ball use PDE's **non-divergence Schauder/classical Dirichlet**
  theorem (E25 in the linked edition) for C^{2,α} Dirichlet solvability with smooth
  approximations of the continuous boundary data. Apply the consumed ABP theorem
  with g=0 to both signs of the difference of classical approximants; their
  sup-norm difference is bounded by that of the boundary data. This and the same
  non-divergence interior estimates give a C^{2,α}_loc solution with those boundary
  values. The strong-solution ABP instance above identifies it with u. Prove the
  approximation, compactness and localization steps, using native Arzelà–Ascoli
  for the functions and derivatives on smaller compact balls and preserving the
  α-seminorm by its pairwise difference inequality at limits. This gives k=0.
- For higher orders use coordinate difference quotients on nested interior balls:
  `aⁱʲDᵢDⱼ(δ_hu)=δ_hf−(δ_haⁱʲ)DᵢDⱼu(·+h)`.
  The same non-divergence Schauder interior estimates bound the quotients uniformly
  in C^{2,α} when a,f are C^{1,α}. Pass to the derivative limit, retaining the
  α-seminorm bound; iterate this difference-quotient argument at each order. Do not
  assume a differentiated solution already has the Sobolev regularity one is proving.

Apply the upgrade first at k=0 to the C1,α graph after the geometric W²,² step.
Its C2,α regularity makes `aⁱʲ(x,u,Du)` and the geometric forcing C1,α; repeat
with the higher-order theorem to obtain C∞.
Construct the geometric weak-to-strong
and coefficient/forcing comparisons, including the ambient metric terms,
in these same chart Sobolev and Hölder spaces.
The geometric iteration and nonlinear graph estimates are targets, not an
uncited consequence of a scalar linear PDE theorem. Build Simons' identity and
inequality with the chosen curvature/B signs, the stable minimizing-cone
classification through hypersurface dimension 6, and dimension reduction.

Prove `locallyMinimizingIntegralHypersurface_regular`: for a locally integral
(n−1)-current T in a smooth Riemannian n-manifold, locally minimizing as in G5,
with ∂T=0 on U and **2≤n≤7**, every point of `support T ∩ U` has a neighborhood
on which T is a nonzero constant integer multiple of the integration current of
a smooth embedded minimal hypersurface. Retain chart/metric regularity, locality,
orientation, integer multiplicity and the equality of weight/area. Smooth sources
of dimension 0 give the elementary ambient 1 case separately. Prove the normal
orientation/two-sidedness conclusion when the ambient orientation and current
orientation supply it; without ambient orientability retain the normal-line or
orientation-cover formulation. G7 constructs the minimizing singular Simons cone in ambient 8 as the
sharpness theorem; this headline does not assume its minimality as an example. Higher-codimension integral/calibrated currents are not covered.

An arbitrary stable integral varifold is not a minimizing current. Any stable-varifold
regularity theorem used in the proof must have its structural/no-classical-singularity
hypotheses explicitly proved for the objects to which it is applied.

## G7. Barriers, smooth convergence and application comparisons

Let K be the closure of a relatively compact smooth domain in an n-manifold,
n≥2, with smooth outward unit normal ν and
`⟨tr B_(∂K),ν⟩<0` everywhere. For a G5 fixed-boundary or fixed-homology
minimizing (n−1)-current supported in K, prove
`support T ∩ ∂K ⊆ support(∂T)`. If the prescribed boundary lies in int K,
derive a positive collar distance of the compact support from ∂K. Use the
weak one-sided barrier/maximum principle and actual admissible inward variations;
strict inward mean curvature has the sphere sign `−(n−1)/r`. Construct the
barrier vector field with an appropriate monotone reparametrization φ(d) of
signed distance, controlling planes with a normal component; negative mean
curvature only controls the tangential trace of Hess d and is not by itself
a bound on every (n−1)-plane. Identify prescribed
boundary currents from their smooth/collar data. A collar of the ambient trap is
not a smooth collar of its Plateau minimizer. General prescribed-boundary
regularity is outside this interior package; the smooth-limit regions below
stay away from the current boundary.

Own `minimizingHypersurface_smoothLocalLimit`: for smooth g_i→g in C∞_loc on U,
2≤n≤7, locally integral (n−1)-currents locally minimizing for g_i with ∂T_i=0 in U and
uniform local mass bounds have, after subsequence, the integral limit and Radon
mass convergence proved in G6. On each relatively compact coordinate patch of
a nonzero regular limit sheet, prove graphical/sheet convergence with total
integer multiplicity equal to that sheet's multiplicity, and C∞ convergence
of the graphs after local labeling. The multiplicity-one case gives a single
graph; no global labeling is asserted on a nontrivial normal cover. Establish
the curvature, area, height and sheeting estimates that yield this conclusion.
If the limit is zero, use monotonicity and mass convergence to prove supports
eventually avoid every compact subset. Transport induced metrics, normal
orientations and the smooth stability inequality. Uniform ambient metric/curvature
and boundary-distance bounds must be explicit in the estimates.

Give the exhaustion version on U_j increasing to M, with compact subsets
contained in U_j away from ∂T_j for all sufficiently large j, smooth local metric
convergence, local mass bounds and local minimizing comparisons there. Construct
the diagonal subsequence and compatibility of restrictions/slices, and conclude
the same local minimizing, regularity and stability results. A separate properness/
completeness conclusion requires the stated geometric hypotheses and proof;
it is not inferred from weak convergence.

Extend the smooth calibration comparison to rectifiable/integral currents with a
closed form of comass≤1 and the explicit integrability/support conditions.
For finite mass and the defined extended evaluation prove `T(φ)≤M(T)`;
equality holds exactly when `sgn(θ) φ(τ)=1` at ‖T‖-a.e. point of nonzero
integer multiplicity in the rectifiable representation. An equality of two
infinite quantities gives no such conclusion. For compactly supported competitors
with `T−T′=∂S`, S compactly supported integral, use a cutoff equal to one near
all three supports and closedness to prove Stokes/naturality and minimizing
comparison. For locally finite competitors require `T−T′=∂S` with S a compactly
supported integral current. Compare their finite masses on any relatively compact
open W containing `spt S`, using a cutoff equal to one near that support; outside
it the currents agree. Do not subtract infinite total masses or infer the bounding
condition from agreement outside a compact region. Compare with Calib C2–C4 on the same smooth chains
and complex calibration. This extends its competitor class; it does not supply
smoothness of a higher-codimension calibrated minimizer.

Own the ambient 8 sharpness construction as a theorem, not a presumed example.
In R⁴×R⁴ put a=|x|², b=|y|², E={a>b} and
`Y=(−a x,b y)/sqrt(a³+b³)` away from 0. Prove |Y|=1, Y is the outward normal
of E along the cone away from 0, and
`div Y=−3(a+b)(a−b)³/(a³+b³)^(3/2)`.
Prove its local weak-divergence identity through the origin by the vanishing
small-sphere flux, and its opposite divergence signs inside/outside E.
For every locally finite-perimeter F with F∆E compactly contained, apply GMT
Gauss–Green to the smooth cutoff field `(1−η_ε)Y` with an outer cutoff equal to
one near the changed set, then let ε→0. Prove the error bound
`∫|∇η_ε|=O(ε⁷)` uniformly for the competitor; a weak identity only against
smooth tests is not a Gauss–Green theorem for χ_F. This proves E is locally
perimeter minimizing. The integral
height/BV layer decomposition then proves `∂[[E]]` minimizes against **all**
compactly supported integral-current perturbations, not only set boundaries.
Construct the cone's local integrality, multiplicity, smooth link S³×S³,
stationarity/stability and singularity at 0. This explicit subcalibration route
supplies the Bombieri–De Giorgi–Giusti minimality needed for the sharpness claim.

Outside this roadmap, a Morse/Hutchings consumer must construct compactified
evaluation maps and their
smooth/Lipschitz regularity, generic-face-transverse/moving-lemma domain, oriented
intersections and actual A/D/F identities after G2–G3. In particular, rank drop in
G2 must be applied to the actual tangential derivative of the evaluated geometric
chain. A Morse/Floer consumer must construct the unstable-cell CW/evaluation comparison,
half-trajectory and broken-face compactifications, determinant signs and
`AD=id`, `dF+Fd=DA−id` outside this roadmap. These are required application
extensions outside G1–G7.
Bott-current correspondences require its critical-manifold/orientation-local-system
fiber products and all boundary identities. The cascade route is a distinct
comparison and does not discharge those current formulas.

[PositiveMass P3a](../PositiveMass/README.md) constructs the compact stable-slice
torus obstruction using G3–G7 and R5b's full-scalar stability.
P3b owns the harmonic end capping/Kelvin transform and concave truncation, the
degree-one map to a torus and its compact positive-scalar-curvature contradiction.
P3c, independent of P3b, constructs the coordinate-plane Plateau problems and
confining barriers, AE asymptotics, induced end/mass estimates and the n=3
logarithmic cutoff, applying G3–G7 and G7's sheeting interface. GC supplies the
stated current and regularity interfaces, not these end or compactification
constructions. Yamabe Y7's low-dimensional lane consumes the corresponding
nonspin positive-mass result; its LCF lane uses the separate spin theorem. Their own
conclusions cannot be inputs to G1–G7.

## Dependency order and acceptance examples

The item graph is

`{native analysis, DG form/density bundles, K5a early real BundleTest LF, Calib C1 comass algebra, HopfRinow L0} → G1 form specialization/d/boundary/mass`,
`{G1, GMT G2–6, Calib C2 evaluation, HopfRinow L0, Morse M3 early smooth exhaustion} → G2`,
`{G2, AT local chart topology} → G4a`,
`{G2, G4a, Calib C2, AT/GT, DGF0 adapter} → G3`,
`{G2, G4a, G3 ordinary comparison, AT2.6/AT3, DG bundles} → G3 orientation-line coefficients → twisted constancy/intersection`,
`{G2, G4a} → G4b`, `{G3, G4a, G4b} → G5`,
`R5a immersion geometry → R5a.1 C²-density volume → R5a.2/R5b`,
`{PDE A Sobolev, GMT G2 area} → PDE C13 generic ABP → G6 compact-contact/local-class instance`,
`{PDE A Sobolev, B10 multipliers/non-divergence CZ} → constCoeffHessianOperator → simultaneous-exponent interior W²,p upgrade`,
`{consumed ABP instance, interior W²,p upgrade, non-divergence Schauder/classical Dirichlet} → strong-solution Schauder upgrade`,
`{G4b, G5, R5a/R5b, GMT perimeter, strong-solution upgrades, PDE harmonic estimates, Calib C1 quotient topology/TopK T1.5} → G6`,
`{G6, GT collars, Calib C2–C4 comparison} → G7`.

K5a's early real density/test foundation precedes all its PDO/elliptic/Hodge
applications and C5.4's real/complex current comparison. Only that early cut enters
G1; C5.4 later consumes the G1 specialization. R5b's normal Jacobi and represented
Dirichlet exports consume VM/UO's single generic form engine and do not require
current regularity. The finite Euclidean nonproper confinement adapter uses G4
closure before G5, so its integral limit does not assume Plateau existence.

The local current homology proof uses its deformation/filling portion of G4 before
G4's compactness theorem; G4's geometric deformation construction uses G1–G2 and
AT's local chart topology, **not** the conclusion of G3. G3's global current/singular
comparison is then available for G5's homology constraint. This item-level ordering
separates deformation from compactness and prevents a G3/G4 cycle. R5a.1's early
volume lemma uses only native density/DG12 calculus and earlier immersion
geometry; it has no Calib/current-regularity input. Calib C3 consumes it.
The tangent-plane fibre uses Calib C1's general-E real subspace/Grassmannian
oriented carrier, its GC unoriented quotient, and the isometry-independent comparison with
TopK T1.5's coordinate subtype. Derive compactness from orthonormal-frame
quotients (or its finite CW structure) before Grassmann-bundle compactness. No later smooth graph-chart or
classifying-space/Bott comparison is required for this fibre construction.
C1's later smooth comparison targets also consume GenCoh G4.0b, CC C1.1a
and HomotopySpheres §4A; those comparisons are not prerequisites of its earlier
comass algebra or oriented-frame quotient topology used here. The integral
smooth-chain part of C2 uses DG/AT/GT independently of its calibration bound.
No characteristic/Bott theorem is a prerequisite of these early constructions. The ordinary Morse and Bott-current comparison consumers follow G3, whereas minimizing
regularity and PMT follow G6–G7.

Acceptance includes: point currents with integer coefficients and augmentation;
the point-versus-zero small-ball example distinguishing ordinary fixed boundary
from equal augmentation, its augmented-zero cone filling and its rank-one local-system
transport; agreement of finite Euclidean nonproper projection with proper compact
truncations and its mass/boundary limits; fixed-compact K5a/native-test evaluation,
support and LF comparison equations, including degree0 and above-dimension zero
form fibres; the ABP sign/ball-rescaling/local-class instance and two-exponent
common Hessian fixed point; interval endpoint signs, oriented cube faces and product/Koszul signs; unit disk and
sphere fundamental currents and relative connecting maps; reversal and cancellation
of two identical oppositely oriented sheets; a folded/repeated circle's parameter
mass versus current mass; tangential-rank-deficient pushforward zero; a Borel
restriction with nonintegral boundary and its a.e. slicing correction; the RP²
integral torsion class; compactly supported Plateau/homological minimizers;
escaping point-current failure of naive compactness; smooth hypersurface Gauss/stability
and normal reversal with the full-scalar coefficient; local minimizing regularity
through ambient 7 and the ambient 8 Simons cone; confined smooth stable limits and
calibration equality with multiplicity; and the R⁴ bivector
`e₀∧e₁+e₂∧e₃`, whose dual-comass mass is 2 and native Hilbert norm is √2. Each example tests the actual constructed
maps and carriers, not just abstract isomorphic groups.

## References

- H. Federer, *Geometric Measure Theory*, §§4.1–4.2 and 5.3–5.4: currents,
  deformation, compactness, existence and minimizing regularity.
- L. Simon, *Lectures on Geometric Measure Theory*, and *Introduction to Geometric
  Measure Theory*: first variation, monotonicity, tangent cones and minimizing
  codimension-one regularity.
- L. Ambrosio and B. Kirchheim, [*Currents in metric spaces*](https://www.mis.mpg.de/publications/preprint-repository/article/2000/issue-21):
  metric-functional/Euclidean comparison and closure/boundary rectifiability.
  This roadmap's primary carrier is the classical manifold test-form dual; any
  metric-functional model used in a proof must be compared to that same carrier.
- C. Riedweg and D. Schäppi, [*Singular (Lipschitz) homology and homology of integral
  currents*](https://arxiv.org/abs/0902.3831); A. Mitsuishi,
  [*The coincidence of the homologies of integral currents and of integral singular
  chains, via cosheaves*](https://arxiv.org/abs/1304.0152): precise local-contraction
  hypotheses and comparison maps.
- N. Wickramasekera, [*A general regularity theory for stable codimension-one integral
  varifolds*](https://annals.math.princeton.edu/2014/179-3/p02): structural hypotheses
  for a stable-varifold proof route; they are not removed here.
- M. Hutchings, *Lecture notes on Morse homology (with an eye towards Floer theory)*:
  geometric-chain comparison and Bott-current consumers; the analytic Morse/Bott
  construction itself remains with HeegaardFloer/MorseTheory.
