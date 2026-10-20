# Compact quantum metric spaces

Build the metric geometry of states on Archimedean order-unit spaces and unital
C*-algebras. Develop Lipschitz seminorms as usable analytic objects: their domains,
quotients, closed extensions, morphisms and state metrics. Prove the compactness
criterion which makes the state metric recover the weak-star topology, the
classical compact-metric-space comparison, and the compact-group construction.
Develop order-unit quantum Gromov–Hausdorff distance through its completeness and
compactness theorems, with noncommutative tori as a parameter-dependent example.

## Conventions and ownership

An order-unit space is a **real** partially ordered vector space E with compatible
addition and multiplication by nonnegative real scalars, a distinguished e≠0,
the order-unit condition `∀a, ∃r>0, −re≤a≤re`, and the Archimedean condition
`(∀ε>0, a≤εe) → a≤0`. Its norm is

`‖a‖ = inf {r≥0 : −re≤a≤re}`.

Completeness is an additional hypothesis. A compact quantum metric space here is
an order-unit space with a dense-domain Lip-norm; its state space is compact,
not its normed vector space. The standard complete presentation is a complete
order-unit space with a lower semicontinuous extended Lip-norm. Q2 compares this
presentation with an incomplete dense finite-seminorm domain and constructs its
canonical closed completion. Nontriviality belongs to the order-unit convention;
zero algebras and C(∅) are treated as separate degenerate classical objects and
are not assigned a normalized state.

Use native `Submodule`, normed quotients, `ContinuousLinearMap`, `WeakDual`,
`PositiveLinearMap` and
[`PositiveContinuousLinearMap`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Positive.html)
(`E →P[ℝ] ℝ`). A state is a positive real-linear functional φ with φ(e)=1.
Its continuity and norm one are theorems. The state space is the corresponding
subset of `WeakDual ℝ E`, with its **weak-star subspace topology**; the operator
norm topology on the dual must not be substituted. For a nonzero unital complex
C*-algebra A, compare this with native positive complex-linear functionals
`A →P[ℂ] ℂ` normalized at 1, by restriction to `selfAdjoint A` and unique
complex-linear extension. No algebra structure is imposed on a general E.

Write `L : E → ℝ≥0∞` for the extended seminorm. It is subadditive and absolutely
homogeneous, with `L(0)=0`, dense finite domain `dom L={a | L(a)<∞}`, and
`L(a)=0 ↔ a∈ℝe`. Use ENNReal's `0·∞=0` convention, checking zero scalars
explicitly. On dom L the finite seminorm is a native `Seminorm ℝ (dom L)`.
Q1's Lip-norm condition means that the state metric below is finite and induces
the weak-star topology; it **does not include** lower semicontinuity or a Leibniz
law. Name those additional properties separately. A closed Lip-norm means the
extended seminorm has norm-closed sublevel sets in the stated complete ambient
order-unit space. Whenever a lower semicontinuous seminorm on an incomplete
space is used, distinguish relative closedness from closedness in its completion.

The state distance, initially an extended metric, is

`ρ_L(φ,ψ) = sup { |φ(a)−ψ(a)| : a∈E, L(a)≤1 }`.

All suprema start in `ℝ≥0∞`. Construct an ordinary metric only after proving
finiteness. The radius is **half the diameter**, not the minimum radius of a
ball containing the state space. Use `q:E→E/ℝe` for the native quotient map.

This roadmap owns real Archimedean order-unit duality, Lip-norms and their metric
consequences. It consumes the following earlier foundations at the indicated
milestones, without treating their whole roadmaps as prerequisites.

- [BanachSpaceTheory B1/B5](../BanachSpaceTheory/README.md) supplies
  Hahn–Banach separation, annihilator/quotient duality and compact-Hausdorff
  scalar regular-measure duality. Native Banach–Alaoglu and Arzelà–Ascoli are
  used directly. Q0 owns their order-unit/Kadison consequences.
- [VonNeumannAlgebras V0](../VonNeumannAlgebras/README.md) supplies C*-positive
  functionals, GNS, norm/state separation and faithful representations;
  [CStarAlgebras C1/C2](../CStarAlgebras/README.md) supplies ideals, Gelfand
  representation and state extension. Q0's general order-unit Hahn–Banach
  argument does not consume the later C*-pure-state theorem or von Neumann
  decomposition. No pure-state hypothesis enters the compactness criterion.
- [RepresentationTheory/CompactGroups Layers0–5.1](../RepresentationTheory/CompactGroups/README.md)
  supplies Haar probability, averaging, coefficient orthogonality, Peter–Weyl
  and G-finite-vector approximation. Consume the early C*-sublayer
  [V8.CompactErgodicActions](../VonNeumannAlgebras/README.md#v8-group-algebras-actions-and-discrete-crossed-products)
  for Haar expectation, the unique faithful invariant trace, spectral
  projections and ergodic finite multiplicity. It precedes V8's separate W*
  continuity/predual and SU(2)/factor-classification applications. Q4 owns
  the convolution, Lip-norm and metric consequences. Finite multiplicity
  is not inferred for an arbitrary Banach representation.
- [SmoothBanachRepresentations SB2/SB8](../RepresentationTheory/SmoothBanachRepresentations/README.md)
  supplies smooth vectors, derivatives and the smooth complete Fréchet
  star-algebra for compact Lie actions. Q4 owns the metric comparison with
  length functions; it does not rebuild smoothing or holomorphic calculus.
- [OptimalTransport Layers0–3](../OptimalTransport/README.md), including the
  implemented `TauCeti.MeasureTheory.OptimalTransport.Wasserstein.KantorovichRubinstein`,
  supplies couplings, W₁ and Kantorovich–Rubinstein duality. Q3 owns the
  state/probability-measure and Lip-norm adapters, not transport duality itself.
- [NoncommutativeGeometry N5–N7](../NoncommutativeGeometry/README.md) supplies
  spectral triples and the Fourier triple/smooth algebra of the rotation torus.
  [RiemannianGeometry R7.8](../RiemannianGeometry/README.md) supplies smooth
  bounded Lipschitz approximation, intrinsic-distance duality and the actual
  Clifford-module commutator-norm theorem. Q3 consumes those formulas to
  identify a state metric. General spinor bundles, Dirac domains, compact
  resolvents, index pairings, and Connes' manifold reconstruction axioms have
  their own geometric/analytic scope; none is inferred from a Lip-norm.
- [OperatorAlgebraDynamics D1.CentralTwists/D1.TwistedBorel/D2.CentralTwists](../OperatorAlgebraDynamics/README.md)
  supplies scalar twisted group C*-completions and their regular models;
  [AmenableGroups Layers5–6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/a4317b48d22a8317c89cf01e67b5c149055b08e1/TauCetiRoadmap/AmenableGroups/README.md) supplies the explicit amenability
  and Følner machinery used for ℤᵈ. Q6 owns the varying-cocycle norm-continuity
  and finite-Fourier metric estimates. These are additional theorems, not
  consequences of a bare completion universal property.

## Q0. Order units, states and affine representation

1. Construct the order-unit norm from the stated axioms. Prove finiteness,
   positivity, homogeneity, triangle inequality, definiteness, the exact closed
   interval formula `‖a‖≤r ↔ −re≤a≤re` for r≥0, and `‖e‖=1`.
   Prove that the positive cone is norm closed, e is an interior point, and the
   order can be recovered from this norm and e. Give restriction to unital
   real subspaces, finite products with coordinatewise order and maximum norm,
   real isometric order isomorphisms, and norm completion with the closed
   positive cone and the same order unit. Include ℝ, finite-dimensional
   function systems, C(K,ℝ) for nonempty compact Hausdorff K, and the
   self-adjoint part of every nonzero unital complex C*-algebra.
2. Prove positive linear maps are bounded with `‖T‖=‖T(e)‖` when the
   codomain is an order-unit space, and unital positive maps are contractive.
   For real functionals, prove positivity plus normalization is equivalent to
   `φ(e)=1=‖φ‖`. Prove state existence by extending the functional re↦r
   from ℝe with Hahn–Banach, then prove positivity from its norm and value
   at e. Prove positive/normalized restriction and extension to unital
   subspaces, preservation under composition, and unique extension to the
   completion. State extension is an actual construction here, not an
   assumed state-space surjectivity.
3. Prove the state space is weak-star closed in the dual closed unit ball,
   nonempty, compact, convex and Hausdorff, with continuous affine evaluation
   `â(φ)=φ(a)`. Prove states separate both points and order:
   `a≥0 ↔ ∀φ∈S(E), φ(a)≥0`, and `‖a‖=sup_φ |φ(a)|`.
   Use separation of the closed cone for order detection. Construct the
   isometric unital order embedding `E→C(S(E),ℝ)` and prove its image is
   dense in the continuous affine functions `Aff_c(S(E),ℝ)`; for complete E
   it is onto. Prove the dual statement `K≅S(Aff_c(K,ℝ))` for a nonempty
   compact convex subset K of a Hausdorff locally convex real space, using
   continuous affine separation and barycentres. Build the needed barycentre
   construction from compact regular probabilities and separation, rather
   than assuming every affine function is a coordinate evaluation.
4. For `a∈E`, construct max(a), min(a) as extrema of the state evaluations
   and identify their order inequalities. Prove
   `‖q(a)‖=(max(a)−min(a))/2`, including attainment by subtracting
   `((max(a)+min(a))/2)e`. Prove the scalar line is closed and identify
   `(E/ℝe)'` isometrically with `{λ∈E' : λ(e)=0}`.
   Prove the dual ball identity
   `{λ : λ(e)=0, ‖λ‖≤2} = {φ−ψ : φ,ψ∈S(E)}`.
   Extend to C(S(E),ℝ) by Hahn–Banach, take the signed regular-measure
   Jordan decomposition from B5, and normalize the equal positive/negative
   masses; treat λ=0 separately. Export evaluation, norm and functoriality
   lemmas for all these identifications.
5. Prove contravariant pullback of states for unital positive maps is affine
   and weak-star continuous. An order-unit isometric embedding induces a
   surjection on states; a surjective order quotient induces an affine
   embedding onto a compact convex subset. Construct the order quotient
   explicitly as restriction of affine functions to that subset. An arbitrary
   algebraic quotient cone is not automatically Archimedean: include its
   Archimedeanization and its norm comparison before calling it an order-unit
   quotient. Prove restrictions, compositions, inverse maps and completion
   comparisons. The C*-state/self-adjoint-state dictionary commutes with
   these maps and preserves evaluations and weak-star topology.

## Q1. Lipschitz seminorms and the compactness criterion

1. Develop extended-seminorm API: finite domain as a real submodule containing
   e, finite native seminorm, scalar translation `L(a+re)=L(a)`, negation,
   sublevel convexity/balance, rescaling, maximum, pullback and transport.
   Prove the inverse dictionary between a finite seminorm on a specified
   dense submodule containing e and its extension by ∞ outside that domain.
   Keep domains in every equality of seminorms. A subspace restriction is a
   Lip-norm only when it is an order-unit subspace and the finite domain
   is dense there; prove this condition, not just norm density in E.
2. Construct ρ_L as an extended metric on S(E), with symmetry, triangle,
   zero-separation and the evaluation estimate
   `|φ(a)−ψ(a)|≤L(a)ρ_L(φ,ψ)` for a of finite L.
   Handle L(a)=0 by scalar translation rather than dividing by zero.
   Prove its topology is finer than weak-star using finite-domain density
   and the common norm bound of states. Prove monotonicity
   `L≤M → ρ_M≤ρ_L`, positive rescaling and isometric order transport.
3. Prove the exact radius identity and its equivalent finite bounds:
   `diam(S(E),ρ_L)≤2r ↔ ∀a∈dom L, ‖q(a)‖≤rL(a)` for r≥0.
   Equivalently the radius is `sup{‖q(a)‖:L(a)≤1}`. Use Q0's quotient
   dual-ball identity to prove both directions. For each fixed state μ,
   the centered ball `B_μ={a:L(a)≤1, μ(a)=0}` has norm bounded by the
   diameter; its norm supremum need not equal the radius. Include radius
   zero, equivalent to E=ℝe, and singleton state spaces.
4. Prove the **Lip-norm criterion**, with all three equivalent conditions:
   (a) ρ_L is finite and induces the weak-star topology on S(E);
   (b) `q({a:L(a)≤1})` is norm totally bounded in E/ℝe;
   (c) B_μ is norm totally bounded for one, hence every, μ∈S(E).
   The centered linear section has norm at most two relative to the quotient
   norm; prove its continuity and both total-boundedness implications.
   For (b)⇒(a), use a finite net with an explicit error margin strictly
   below the desired ball radius, and finitely many weak-star evaluation
   neighbourhoods. A pointwise strict bound for every test alone does not
   give a strict bound on their supremum. For (a)⇒(c), embed B_μ into
   C(S(E),ℝ); boundedness follows from Q1.3 and its evaluations are
   1-Lipschitz for ρ_L, so Arzelà–Ascoli gives total boundedness.
5. Construct the finite ordinary metric, prove its uniformity equals the
   compact weak-star uniformity, completeness, compactness, finite diameter,
   and convergence equivalence for **arbitrary filters**. Prove separability
   of E follows: take finite norm nets of centered sublevels and rational
   scalar translates, use the dense finite domain, and obtain a countable
   norm-dense set. A general order-unit space need not already be separable.
6. Supply counterexamples which distinguish the hypotheses. On an infinite
   dimensional complete order-unit space, `L(a)=‖q(a)‖` has finite radius
   but its quotient unit ball is not totally bounded, so it is not a
   Lip-norm. On C¹([-1,1],ℝ),
   `L(f)=‖f'‖∞+|f'(0)|` is a Lip-norm which is not lower semicontinuous
   for the uniform norm: integrate `g_n(t)=min(n|t|,1)` to get functions
   tending uniformly to t+1 with L≤1 while L(t+1)=2. Include the compact
   smooth/Lipschitz dense-domain comparison, without pretending that this
   finite-domain seminorm is finite on all continuous functions.

## Q2. Closed Lip-norms, recovery, maps and quotients

1. For a dense-domain extended seminorm, form the norm closure of its
   absolutely convex unit ball and its Minkowski gauge, with the scalar
   direction handled through E/ℝe. Prove this is the greatest lower
   semicontinuous extended seminorm below L, that it has the same state
   metric, and that a Lip-norm stays a Lip-norm. Identify its finite domain.
   When the original L has finite radius, in particular when it is a
   Lip-norm, prove its closure still has kernel ℝe using the finite-radius
   estimate. Without finite radius the closure can have a larger kernel;
   retain the general closure and state-metric recovery construction in
   that case.
   Extend this construction to the norm completion and prove uniqueness of
   the complete closed presentation up to unital order isometry.
   Equip the finite domain of a closed Lip-norm with `‖a‖+L(a)` (or the
   equivalent maximum norm) and prove completeness. This is a Banach
   **graph norm**, not the original order-unit norm.
2. Prove full-state recovery:
   `L(a)=sup_{φ≠ψ} |φ(a)−ψ(a)|/ρ_L(φ,ψ)` exactly for lower
   semicontinuous L. Use Q0's annihilator/state-difference representation
   and bipolar separation of the closed balanced quotient unit ball;
   the inequality ≤L is direct, and the reverse is the separation argument.
   For general L the right side recovers its lower semicontinuous closure.
   Show all pair denominators are positive, and agree with the formula over
   all pairs using ENNReal 0/0=0. Do not recover L merely from the distances
   of pure states. Give a finite-dimensional commutative counterexample by
   Q2.3's construction.
3. On a compact convex K, characterize the finite metrics ρ inducing its
   topology which arise from a closed Lip-norm on Aff_c(K,ℝ): the metric
   extends to a norm on the real span of K−K and is its restriction there.
   Equivalently prove the conjunction of these explicit conditions:
   `ρ(x,ty+(1−t)z)≤tρ(x,y)+(1−t)ρ(x,z)` for 0≤t≤1;
   `x−y=x′−y′ → ρ(x,y)=ρ(x′,y′)`; and
   `ρ((x+x′)/2,(y+y′)/2)≤(ρ(x,y)+ρ(x′,y′))/2`.
   Derive exact homogeneity along segments and the unique norm extension
   from these conditions. Mere convexity alone is insufficient.
   Construct L by the ordinary Lipschitz constant of continuous affine
   functions and prove metric recovery by separation. As a concrete example,
   take the probability simplex on three points, identify span_ℝ(K−K) with
   `{x∈ℝ³:Σx_i=0}`, and give this plane Euclidean norm. Prove
   `K−K={x:Σx_i=0, Σ|x_i|≤2}` by its positive/negative-part decomposition;
   the difference set itself is the bounded hexagon. The pairwise vertex
   distances are all √2, whereas the norm of `(1/2,1/2,−1)` is √(3/2),
   strictly less than the W₁ distance √2 for the corresponding equilateral
   three-point metric. Thus the full state metric carries information not
   determined by its restriction to extreme points.
4. Define unital positive C-Lipschitz maps T:E→F by
   `L_F(Ta)≤C L_E(a)` with C≥0, taking extended values and domains
   seriously. Prove their state pullbacks satisfy
   `ρ_E(T*φ,T*ψ)≤Cρ_F(φ,ψ)`; check the direction by scaling the test
   ball. For closed Lip-norms prove the converse using Q2.2.
   Include composition, identity, real positive rescaling, inverse
   isometries, restriction and completion. Record separately when a
   complex star homomorphism yields such a map on self-adjoint parts.
5. For a nonempty compact convex K⊆S(E), restrict a to K, let F be the
   resulting order-unit quotient, and define
   `L_F(b)=inf{L_E(a):a|K=b}`. Prove density of its finite domain,
   scalar kernel, the Lip-norm criterion and the exact isometric affine
   identification `S(F)=K` with the restricted state metric. Initially
   take an infimum, not a minimum. For complete closed E, form the norm completion F̄ of this image and
   define its quotient seminorm by the same infimum, with value ∞ when
   there is no lift. Prove it is closed on F̄ and finite lifts attain
   the infimum after scalar normalization and compactness of centered
   balls. The image norm is its inherited order-unit norm, which can
   be strictly smaller than the Banach quotient norm of E; do not
   identify those norms without an additional theorem.
   Include singleton K, successive quotients, and the inclusion/quotient
   duality. Distinguish this quotient seminorm from restriction to an
   order-unit subspace; these operations generally differ.

## Q3. Classical metrics, probabilities and commutators

1. For every metric space X define the extended classical Lipschitz constant
   `L_d(f)=sup_{x≠y}|f(x)−f(y)|/d(x,y)`. Prove its exact comparison
   with native `LipschitzWith`, scalar/additive/star laws and the Leibniz
   estimate on bounded functions. For arbitrary X prove
   `d(x,y)=sup{|f(x)−f(y)|:f∈C_b(X,ℝ),L_d(f)≤1}`
   using `f(z)=min(d(z,x),d(x,y))`. This avoids a fictitious finite
   uniform norm on all of C(X) when X is noncompact. Treat the empty and
   singleton cases and the zero-dimensional compact examples explicitly.
2. For nonempty compact metric X, develop the dense real Lipschitz
   subalgebra of C(X,ℝ), lower semicontinuity of L_d, kernel ℝ1,
   total boundedness of the ball centered at a point by Arzelà–Ascoli,
   and hence the closed Lip-norm theorem. Build density by the
   infimal/supremal Lipschitz approximations to a uniformly continuous
   function, with their uniform error bounds, or the equivalent lattice
   Stone–Weierstrass proof. Extend to C(X,ℂ) and prove complex
   Leibniz/star/strong-inverse laws on its Lipschitz subalgebra.
3. Identify S(C(X,ℝ)) affinely and homeomorphically with native
   `MeasureTheory.ProbabilityMeasure X` under the integration pairing,
   using compact regular Borel probabilities and the Riesz theorem.
   Compact metric spaces have the required Borel, regularity and moment
   properties; prove them in the adapter. Consume native Tau Ceti
   Kantorovich–Rubinstein duality to identify ρ_L with W₁, including its
   absolute-value and basepoint-normalized formulations. Prove the
   Dirac-measure map x↦δ_x is isometric, with image exactly the extreme
   states, and `diam(S(C(X)),ρ_L)=diam X`. Extend integration and the
   state dictionary to compact Hausdorff X independently of an assumed
   metric, using the subtype of regular (equivalently here, Radon) Borel
   probability measures. In this generality arbitrary Borel probabilities
   need not be regular or determined by continuous integrals. Keep all
   native `ProbabilityMeasure X` in the compact metric case, where the
   adapter proves regularity; the W₁ theorem uses those metric hypotheses.
4. A continuous map f:X→Y between compact metric spaces is C-Lipschitz
   exactly when its pullback of real Lipschitz functions satisfies
   `L_X(h∘f)≤C L_Y(h)`. Prove pushforward of probabilities is
   C-Lipschitz for W₁ through Q2.4 and native transport pushforward.
   Identify surjective isometries with the induced unital real order
   isometries preserving L. Preserve the contravariant direction and
   check point evaluations, probability pushforwards and composition.
5. For a faithful unital representation of a unital C*-algebra on H and a
   densely defined self-adjoint D supplied by N5, take the elements
   preserving dom D and whose algebraic commutator has a bounded extension.
   Prove this is a unital star subalgebra, the commutator derivation rules,
   `L_D(a)=‖[D,π(a)]‖`, the star/Leibniz laws and lower semicontinuity
   of its extended maximal-domain seminorm. Use the form identity on
   dom D and closedness of D to show norm limits with uniformly bounded
   commutators still preserve dom D and have a bounded commutator.
   Prove the strong inverse law when the inverse preserves dom D;
   establish that domain invariance for the maximal commutator algebra
   by the closed-derivation argument: for an invertible a use the
   positive invertible a*a, a norm-convergent Neumann series for its
   inverse with summable derivative bounds, and multiply by a*. Prove
   graph convergence at every step; invariance of the inverse does
   not follow from `a(dom D)⊆dom D` alone.
6. Prove the spectral-triple metric criterion: if that finite domain is
   dense, the scalar kernel condition holds and its centered ball is
   norm totally bounded, then its commutator metric metrizes weak-star.
   These conditions do not follow from compact resolvent alone. On a
   closed connected Riemannian manifold with the nonzero-fibre Hermitian
   Clifford module of R7.8/Spin G6, identify the **closed extension** of
   the smooth real commutator seminorm with L_d on all Lipschitz real
   functions. Use R7.8's quantitative smooth approximation in one
   direction and pointwise gradient bounds/path integration in the
   other; then identify its state metric with W₁ and its point metric
   with geodesic distance. The connected open Euclidean domain uses
   R7.8's bounded-function distance formula, not a compact state-space
   conclusion for C(O). This owns the metric consequence, while the
   analytic Dirac and gradient approximation remain with their suppliers.

## Q4. Leibniz C*-metrics from compact actions

Let G be a compact Hausdorff topological group, A a nonzero unital complex
C*-algebra, α:G→Aut_*(A) a strongly continuous action, and ℓ a **continuous
native GroupNorm** on G. Thus ℓ(1)=0, ℓ(g⁻¹)=ℓ(g),
ℓ(gh)≤ℓ(g)+ℓ(h), and ℓ(g)>0 for g≠1. Existence of such an ℓ is
part of the input; it makes G metrizable. No arbitrary nonmetrizable compact
group is asserted to admit one. Define

`L_α(a)=sup_{g≠1} ‖α_g(a)−a‖/ℓ(g)`.

1. Prove the full-algebra seminorm, complex homogeneity, star invariance,
   Leibniz inequality and `L(a⁻¹)≤‖a⁻¹‖²L(a)` for invertible a.
   Prove all sublevels are norm closed. Its finite domain is a dense unital
   star subalgebra: convolve with L¹ functions Lipschitz under left
   translation; continuous ℓ and its right translates separate points,
   their Lipschitz lattice/algebra is dense in C(G), and the L¹
   approximate-identity argument gives density in A. The zero set is
   precisely A^G. Use the same formula on the self-adjoint part for
   order-unit metrics. Product estimates on all of A are additional
   structure, not determined by that self-adjoint restriction alone.
2. Under ergodicity `A^G=ℂ1`, consume the early C*-theory in
   V8.CompactErgodicActions: Haar expectation `E(a)=η(a)1`, uniqueness,
   positivity, faithfulness and traciality of η; isotypic and matrix
   coefficient projections; spectral multiplication/star identities,
   the dense finite-orbit star algebra and multiplicity inner products;
   and `multiplicity(π)≤dim π`, hence isotypic dimension at most
   `(dim π)²`. Give the adapter with exactly the same normalized Haar
   probability, point-norm continuous star action and CompactGroups
   coefficient/projection conventions. This consumes the existing
   Høegh-Krohn–Landstad–Størmer supplier, including its full-support
   faithfulness proof and trace comparison on multiplets. Its theorem
   is for arbitrary compact Hausdorff G and has no continuous-length
   hypothesis; Q4's length is additional metric input here. Neither the
   later W* normal-action/predual bridge nor SU(2) classification is a
   prerequisite of this C*-sublayer or of Q4's metric consequences.
3. For any L¹(G) kernel f, show α_f is compact when every isotypic
   space is finite dimensional: coefficient kernels give finite-rank
   maps and L¹ approximation gives operator-norm approximation.
   Prove `‖a−η(a)1‖≤L_α(a)∫ℓ dμ_G` and
   `diam(S(A),ρ_L)≤2∫ℓ dμ_G`. Positive unit-mass kernels with
   arbitrarily small ∫fℓ uniformly approximate the Lip-unit ball by
   compact images. Conclude total boundedness of every centered
   self-adjoint ball and the closed Lip-norm theorem. State it for every
   continuous ergodic action satisfying the displayed inputs.
4. If ℓ is conjugation invariant, prove α_g preserves L and central
   positive convolution kernels are equivariant unital positive
   contractions decreasing L. For compact Lie G consume the finite faithful unitary representation
   clause of [LieGroups Layer7](../RepresentationTheory/LieGroups/README.md),
   which uses independent Peter–Weyl separation and finite derivative
   kernels before complexification. Add a trivial summand to obtain π₀; set `χ=|χ_{π₀}|²` and
   `k_n=χ^n/∫χ^n`. Prove χ has its unique maximum at 1, by faithfulness
   and the trivial summand, and k_n concentrates at 1. Its coefficient
   support is finite; let B_n be the self-adjoint sum of the corresponding
   isotypic spaces, containing 1, with precisely the restriction of L_α.
   Prove finiteness on B_n by the finite-coefficient Lipschitz estimates:
   on the compact Lie group the continuous GroupNorm locally dominates
   a fixed Lie-coordinate length, using powers which leave a fixed small
   neighbourhood and its positive minimum length away from 1. Smooth
   coefficient functions then have finite L_α. Prove `P_n=α_{k_n}` has range in B_n,
   `L(P_na)≤L(a)` and `‖a−P_na‖≤δ_nL(a)` where
   `δ_n=∫k_nℓ→0`. P_n need not be an idempotent; do not call it a
   conditional expectation or an orthogonal projection. The trivial
   group case is E=ℝ with zero error and is handled directly.
5. For compact connected Lie G and a fixed norm on its real Lie algebra,
   use SB2's differentiable vectors and set
   `L_der(a)=‖X↦dα(X)a‖`. For the left-invariant length metric from
   that norm prove `L_α=L_der` on differentiable vectors: integrate
   orbit derivatives along piecewise smooth paths for one inequality,
   and use small one-parameter subgroups for the other. Ad invariance is
   needed only for conjugation invariance/equivariance, not the basic
   Lip-norm theorem. Compare smooth vectors, the C¹ domain and the
   maximal closed Lipschitz domain. For disconnected G the derivative
   alone has kernel A^(G⁰), so retain the group-length construction.
6. Give complete examples and their morphisms: translation on C(G/H)
   for closed H, with quotient metric
   `d(gH,kH)=inf_{h∈H}ℓ(g⁻¹kh)` for conjugation-invariant ℓ;
   prove equality of the action seminorm and the ordinary Lipschitz
   seminorm. For an irreducible finite-dimensional unitary π, use
   conjugation on End(V_π); prove scalar fixed algebra by Schur and
   obtain a noncommutative matrix Lip-norm. Include the failure of scalar
   kernel for reducible π and for the trivial action on a non-scalar
   algebra. Q6 supplies all-dimensional quantum tori. Build the Jordan
   and Lie Leibniz estimates on A_sa with their explicit factors
   `a∘b=(ab+ba)/2`, `{a,b}=(ab−ba)/(2i)`; do not multiply
   arbitrary self-adjoint elements as though A_sa were an algebra.

## Q5. Order-unit quantum Gromov–Hausdorff distance

1. Work with complete closed presentations from Q2, or their identified
   dense finite domains. A **quotient-admissible** Lip-norm M on E⊕F
   has coordinate quotient seminorms exactly L_E,L_F. A bridge used for
   gluing is **admissible** when it also has the full product finite domain
   `dom M=dom L_E×dom L_F`. This is a finite seminorm on that entire
   direct sum, extended by ∞ outside it. Quotient equality already forces
   the reverse domain inclusion; prove the forward finiteness explicitly.
   Quotient equalities are infima over lifts, not equality with M(a,0).
   Embed the two state spaces by coordinate pullback and define
   `dist_q(E,F)` as the infimum, over admissible bridges, of their
   Hausdorff distance for ρ_M. Use native `hausdorffEDist`/`hausdorffDist`
   after the finiteness hypotheses. Prove existence and finiteness using
   centered scalar-coordinate bridges and radius bounds.

   Retain the broader quotient-admissible class and prove that its distance
   infimum is the same. For ε>0 and such M, with the maximum order-unit
   norm on E⊕F, construct the finite continuous seminorm
   `N_ε(v)=inf_w (M(w)+ε⁻¹‖v−w‖)` and set
   `M_ε(a,b)=max(L_E(a),L_F(b),N_ε(a,b))`. Prove homogeneity,
   subadditivity, `N_ε≤M`, `N_ε(v)≤ε⁻¹‖v‖` and its norm-Lipschitz
   estimate. If `‖q(v)‖≤R M(v)` on dom M with R>0, prove
   `N_ε(v)≥‖q(v)‖/max(R,ε)`. Deduce the diagonal scalar kernel,
   full product domain and both exact coordinate quotients of M_ε.
   Prove its Lip-norm property using the two centered endpoint balls
   and the scalar-difference bound from N_ε; if L_E,L_F are closed,
   M_ε is closed. On the common full state space prove the uniform bound
   `ρ_M≤ρ_(M_ε)≤ρ_M+2ε`, using approximate w-lifts and that a difference
   of states has norm at most2. Deduce the same bound for the Hausdorff
   distances and equality of the two infima. Closing full-domain bridges
   between complete closed endpoints preserves coordinate quotients, the product domain and state
   metrics; also prove distance invariance under Q2's closed-completion
   comparison with incomplete finite-domain presentations. No class of
   compact quantum metric spaces or quotient-admissible example is discarded.

   Exhibit why quotient equalities alone do not permit maximum gluing:
   on the real L² circle use the compact injective Fourier multiplier
   T with multipliers exp(−n²) and the orthogonal semicircle-sign map U.
   Prove `ran T∩U ran T={0}` from analyticity and that
   `x↦(Tx,TUx)` has dense range by its adjoint kernel. On the Lorentz
   order-unit space ℝ⊕L² take `L(t,Tx)=‖x‖`, and on its square take
   `M((t,Tx),(s,TUx))=max(‖x‖,|t−s|)`, extending each by ∞.
   Verify closed Lip-norms, compact centered balls and attained coordinate
   quotients. Gluing M with its reverse forces equal endpoint Hilbert
   components, so neither the maximum nor its endpoint quotient has dense
   finite domain. This example belongs to the broader class and its
   regularized bridges above provide the required reduction.
2. Develop the bridge lemma: for a continuous seminorm N on E⊕F
   with N(e_E,e_F)=0, N(e_E,0)>0, and approximate lift estimates
   which make `max(L_E,L_F,N)` induce both quotient seminorms,
   prove that maximum is an admissible Lip-norm. State approximate
   lifts with every ε>0; require exact lifts only in the closed compact
   sublevel case where Q2 gives attainment. Include the concrete common
   ambient norm bridge `N(a,b)=δ⁻¹‖a−b‖` for δ>0, an order-unit
   subspace F⊆E, compatible seminorms `L_E(b)≤L_F(b)` for every b∈F,
   and a map P:E→F with
   `L_F(Pa)≤L_E(a)`, `‖a−Pa‖≤δL_E(a)`.
   State all inequalities for the extended seminorms, including domains.
   L_F equal to the restriction of L_E is the principal special case.
   Prove the E-coordinate quotient using Pa and the F-coordinate quotient
   using a=b. The maximum has the full product finite domain. Prove
   `dist_q(E,F)≤δ` by state restriction and positive extension. No
   linearity of P is needed; linear positivity is available in convolution
   examples. Handle Q4's zero-error scalar model directly rather than
   dividing by δ=0. Include E=F=ℝ², P=id, L_F=L_E/2 as a test
   showing that the two P-estimates alone do not imply compatibility.
3. Prove symmetry, zero self-distance, triangle inequality, scaling,
   and invariance under unital order isometry preserving L. For the
   triangle, first use the full-domain bridges of Q5.1, glue them by
   `G(a,b,c)=max(M_EF(a,b),M_FH(b,c))`, and take the endpoint quotient
   `K(a,c)=inf_b G(a,b,c)`. Prove dom G is the full triple product and
   dom K is the full endpoint product; for the latter use a finite middle
   scalar element, and use the original quotient lower bounds for the
   converse. Prove the coordinate quotient equalities by successive
   ε-lifts, the Lip-norm criterion and the state-space estimates;
   an arbitrary GH gluing on the underlying state sets need not respect
   affine structure. Prove `|diam E−diam F|≤2dist_q(E,F)` and the
   classical comparison
   `dist_q(C(X,ℝ),C(Y,ℝ))≤ghDist(X,Y)` for nonempty compact metric
   spaces by restricting Lipschitz functions on a metric gluing of X,Y
   and extending them with their exact Lipschitz constant. Do not
   assert equality with classical GH distance.
4. Prove zero-distance rigidity for complete closed presentations:
   dist_q(E,F)=0 iff there is a unital surjective real order isometry
   T:E≃F with `L_F(Ta)=L_E(a)` for every a. Construct an affine
   isometry of the compact state spaces by compactness of approximate
   affine correspondences, then use Q0 Kadison duality and Q2 recovery.
   For incomplete finite-domain presentations compare their closed
   completions, not merely a selected dense subspace. In the C*-case
   this is an order-unit/Jordan conclusion; **multiplication is not
   detected by this distance**. In particular opposite algebras with
   the transported L have zero distance. A metric distinguishing full
   C*-multiplication is not the order-unit distance specified here.
5. Construct the metric space of these isometry classes, controlling
   universes via the separability of Q1 and a fixed universal real
   Banach-space/function-space model. Prove completeness: pass to a
   summable-distance subsequence, choose full-domain admissible adjacent
   bridges, using Q5.1's reduction with summable additional errors if
   starting from quotient-only bridges. Prove every finite-prefix maximum
   and endpoint quotient has the full finite-domain product before passing
   to infinite sequences. Construct the subspace of product sequences a with
   `sup_j M_j(a_j,a_(j+1))<∞`. Prove summable adjacent state-space
   distances make every such sequence norm bounded, using the uniform
   diameter bounds and compatible scalar centering. Equip this subspace
   with the maximum norm and supremum bridge seminorm. Prove its state
   space is the compact metric completion of the increasing union of
   the finite-coordinate convex state hulls. Take the Hausdorff limit K
   of the coordinate state spaces inside it, restrict affine functions
   to K, and use Q2.5 for the quotient Lip-norm. Prove the quotient
   retains a nonzero order unit and finite radius, has dense finite
   domain, and the coordinate spaces converge; pass to its complete
   closed presentation. Do not infer completeness from
   completeness of ordinary GH space without these affine/quotient
   constructions.
6. Prove finite-dimensional quotient approximation: take a finite
   ε-net of S(E), restrict affine functions to its convex hull, and
   use Q2.5 to get a quotient F with `dim F≤card(net)` and
   `dist_q(E,F)<ε` (choose a strictly smaller net radius).
   Such F is an order-unit function system, not generally a finite
   dimensional C*-subalgebra. Define `Fin_E(ε)` as the minimum dimension
   of a finite dimensional compact quantum metric space within ε of E,
   and `Scv_E(ε)` as the minimum cardinality of an ε-net of S(E).
   Prove the quantum compactness theorem: a family has compact closure
   for dist_q iff its state diameters and Scv_E(ε) are uniformly
   bounded for every ε>0; equivalently use diameter and Fin_E(ε)
   bounds. Include finite-dimensional comparison, bounded-dimension/
   bounded-radius precompactness, and the covering-number inequalities
   needed in each implication. Q4's δ_n and multiplicity dimension
   bounds imply precompactness of all ergodic actions of a fixed
   compact Lie G with one conjugation-invariant ℓ. This is a metric
   precompactness theorem, not an equivariant classification theorem.

## Q6. Quantum tori and metric continuity

Fix d∈ℕ, Θ a real skew-symmetric d×d matrix and
`σ_Θ(p,q)=exp(πi pᵀΘq)` on ℤᵈ. Use D1's scalar-twisted full C*-algebra
and its faithful regular model; ℤᵈ amenability identifies full and reduced
norms. Write W_p for its canonical unitaries, so
`W_pW_q=σ_Θ(p,q)W_(p+q)` and `W_p*=W_(-p)`.
The gauge action of z∈Tᵈ is `α_z(W_p)=z^p W_p`.

1. Construct these maps, coefficient extraction and gauge averaging in
   the supplied C*-completion; prove strong continuity, faithful
   canonical trace τ(W_p)=δ_(p,0), and fixed algebra ℂ1 for every Θ,
   including rational/degenerate Θ and Θ=0. Prove the gauge-finite
   subalgebra is exactly the finite Fourier polynomials. For d=0 it
   is ℂ. For d=2 match NoncommutativeGeometry N6's ordered generators:
   if U₁=W_(1,0), U₂=W_(0,1), then
   `U₁U₂=exp(2πiΘ₁₂)U₂U₁`; with N6's convention
   `U₂U₁=exp(2πiθ)U₁U₂`, set Θ₁₂=−θ. Prove the phase comparison
   `W_(m,n)=exp(πiθmn)U₁^mU₂^n`.
   No irrationality hypothesis is needed for any metric theorem here.
2. Fix one continuous length ℓ on Tᵈ and use Q4 to construct the closed
   Lip-norm L_Θ. For a fixed norm on ℝᵈ compare the gauge derivative
   formula `dα(X)W_p=2πi(p·X)W_p` and the corresponding invariant
   length; on smooth vectors these yield equal seminorms, with closed
   maximal-domain extension as in Q4.5. Compare the N7 Fourier-Dirac
   seminorm by explicit upper/lower Clifford coefficient estimates;
   prove its centered ball totally bounded from this comparison.
   Equality with the derivative norm is not asserted for arbitrary
   noncommuting derivative coefficients.
3. Own the continuous-field estimates used in the metric limit. For
   every finite Fourier polynomial f, prove Θ↦‖f‖_Θ is continuous.
   Lower semicontinuity follows by testing finitely supported vectors
   in the common ℓ²(ℤᵈ) regular model. Prove upper semicontinuity
   using Følner localization for finite propagation twisted convolution:
   for each finite S and ε>0 construct finite K⊆ℤᵈ such that, for
   every f supported on S and every Θ,
   `‖λ_Θ(f)‖≤‖λ_Θ(f)P_K‖+ε‖f‖₁`. Prove this by a slowly
   varying translated partition of unity and its commutator error
   estimate; commuting twisted right translations make the localized
   operator norms independent of the translated box. The finite-domain
   operator `λ_Θ(f)P_K` has range in the finite set K+S, so its matrix
   norm is continuous in Θ.
   Extend by the common ℓ¹ bound to all ℓ¹ Fourier coefficients.
   Strong-operator continuity alone is insufficient for norm
   continuity; prove this upper estimate as an actual target here.
4. For each finite symmetric support S containing 0 identify the real
   self-adjoint coefficient space `V_S={f:supp f⊆S, f(−p)=conj f(p)}`
   independently of Θ, with distinguished δ₀. Prove joint continuity
   of (Θ,f)↦‖f‖_Θ and (Θ,f)↦L_Θ(f). For L, normalized gauge
   differences form a bounded subset of the fixed finite dimensional
   coefficient space; use its compact closure and uniform ℓ¹ control
   to pass continuity through the supremum over z≠1. For the derivative
   formula use the compact Lie-algebra unit ball. Give uniform norm
   equivalence on compact parameter sets. Prove continuity of their
   dual state bodies and centered Lip-unit bodies and construct the
   resulting admissible finite-dimensional bridges. For state bodies
   use their support functions
   `max_Θ(a)=‖a+Re‖_Θ−R` with a common R bounding ‖a‖_Θ;
   prove the support-function/Hausdorff comparison in finite dimensions. This finite
   dimensional order-unit/Lip-norm comparison lemma is reusable and
   belongs here. It must allow the positive cones to vary with Θ.
5. Use Q4's central finite-character kernels to obtain finite Fourier
   systems B_(Θ,n) with a **uniform-in-Θ** error δ_n→0, and prove
   `dist_q(A_Θ,B_(Θ,n))≤δ_n`. Use Q6.4 to prove
   `dist_q(B_(Θ,n),B_(Ψ,n))→0` as Ψ→Θ. Then the triangle
   inequality gives the full theorem
   `Ψ→Θ ⇒ dist_q((A_Ψ,L_Ψ),(A_Θ,L_Θ))→0`.
   This includes rational-to-irrational and noncommutative-to-classical
   torus limits, all dimensions and d=0. Prove local uniformity on
   compact parameter sets. For an integer skew matrix N, prove
   `σ_(Θ+N)=(δb_N)σ_Θ` with
   `b_N(p)=exp(πi Σ_(j<k) N_jk p_jp_k)`. Transport by
   `W_p^(Θ+N)↦b_N(p)W_p^Θ`, prove gauge equivariance and preservation
   of L, and obtain the consistent periodic presentation. Do not infer that C*-algebra isomorphism classes,
   primitive ideal spaces or K-theory vary in the same topology.

## Dependency order and completion examples

Q0 uses native ordered linear algebra, Hahn–Banach, weak duals and B5's
regular-measure duality. Q1 uses Q0 and native Arzelà–Ascoli. Q2 uses Q0–Q1.
Q3.1–Q3.4 use Q0–Q2 and the existing transport/Riesz interfaces; Q3.5–Q3.6
add only the stated spectral/Dirac suppliers. Q4.1–Q4.3 use early C*-state
foundations, compact-group averaging/Peter–Weyl and the existing early
C*-sublayer V8.CompactErgodicActions. Its later W* and factor applications
are not inputs. Q4.4 adds compact Lie representations and Q4.5 adds
SB2's differential API. Q5 uses Q0–Q2 and the ordinary native GH/Hausdorff
interfaces; it has no input from Q6 or spectral triples. Q6 uses Q4–Q5,
the scalar-twisted completion, ℤᵈ amenability, and its own continuous-field
lemmas. The NCG Fourier-Dirac comparison in Q6.2 is a terminal consumer,
not an input to the group-action Lip-norm or parameter-continuity proofs.

Completion includes scalar and finite-dimensional order-unit examples, the
three-point simplex counterexample, arbitrary compact metric C(X), compact
homogeneous spaces, nontrivial irreducible matrix conjugation actions,
finite-dimensional quotient approximations and every-dimensional quantum
torus continuity. Every new construction has evaluation/extensionality,
restriction/transport, identity/composition and domain/coercion lemmas as
applicable. End-to-end examples must use those common APIs and include
zero-radius/singleton and rational-parameter branches.

## References and API direction

- Rieffel, [*Metrics on states from actions of compact groups*](https://arxiv.org/html/math/9807084),
  §§1–3, especially Theorems1.8 and2.3, for quotient total boundedness and
  compact ergodic actions; §4 motivates comparison with Clifford
  commutators. Q3's maximal-domain/closed-extension statements specify
  the analytic hypotheses explicitly.
- Rieffel, [*Metrics on State Spaces*](https://arxiv.org/html/math/9906151),
  §§1–5 and9, for order-unit representation, radius, lower semicontinuity,
  full-state recovery and metrics induced by norms. Q2.3 pins the norm
  extension condition and a concrete three-point test.
- Rieffel, [*Gromov–Hausdorff distance for quantum metric spaces*](https://arxiv.org/html/math/0011063),
  §§3–7 for quotients, admissible Lip-norms, bridges and rigidity;
  §§8–11 for compact-action approximations, quantum tori and varying
  finite-dimensional systems; Theorems12.11,13.1,13.5 for completeness,
  finite approximation and quantum compactness.
- Høegh-Krohn, Landstad and Størmer,
  [*Compact ergodic groups of automorphisms*](https://annals.math.princeton.edu/1981/114-1/p02),
  Annals of Mathematics114(1981),75–86, for the C*-ergodic multiplicity
  and invariant-trace theorem consumed through V8.CompactErgodicActions
  in Q4.2, with Q4 retaining its metric adapters and applications.
- Native positive continuous maps follow
  [Mathlib PR42202](https://github.com/leanprover-community/mathlib4/pull/42202);
  C*-functional normalization follows
  [Mathlib PR35352](https://github.com/leanprover-community/mathlib4/pull/35352)
  and `PositiveContinuousLinearMap.ofReal_opNorm_eq_map_one`.
  Native `WeakDual.isCompact_closedBall`, `Seminorm`, `GroupNorm`,
  `LipschitzWith`, `selfAdjoint`, `ProbabilityMeasure`, `ghDist` and
  Hausdorff-distance APIs determine the surrounding vocabulary. Build
  new order-unit and quantum-metric interfaces in Tau Ceti with these
  carriers, and adopt Mathlib's design when it supplies those interfaces.

- Existing independent Lean work includes Physlib's
  [Archimedean order-unit elements](https://github.com/leanprover-community/physlib/blob/4533668544ba952833048805c7fc43048c1ad6e9/PhyslibAlpha/AlgebraicFramework/OrderUnit/Basic.lean),
  [order-unit norm](https://github.com/leanprover-community/physlib/blob/4533668544ba952833048805c7fc43048c1ad6e9/PhyslibAlpha/AlgebraicFramework/OrderUnit/Norm.lean)
  and states as normalized native positive maps. Compare their unbundled
  distinguished-unit and infimum-of-order-bounds interfaces when integrating
  existing work under the project's coordination rules. This specification
  is intrinsic mathematics and uses the pinned Mathlib/Tau Ceti carriers;
  it does not assume Physlib is a package dependency.
