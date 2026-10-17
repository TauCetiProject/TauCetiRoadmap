# Real-analytic geometry and semianalytic triangulation

Develop the local and global geometry of real-analytic manifolds and semianalytic sets, including
the proper real-analytic embedding theorem and Łojasiewicz's simultaneous triangulation theorem.
The target is the real-analytic category: a theorem about polynomial semialgebraic sets alone does
not discharge the semianalytic statements here.

## Conventions and boundaries

Manifolds are Hausdorff, finite-dimensional, second-countable and without boundary. Use the
Mathlib manifold carrier `IsManifold 𝓘(ℝ,E) ω M` for real charts and
`IsManifold 𝓘(ℂ,E) ∞ X` for complex charts, with K3.0's analytic comparison; R0 proves the chartwise `AnalyticAt ℝ` transition API from the real `ω` carrier
and the boundaryless/open-chart hypotheses. Holomorphic maps are `MDifferentiable ℂ`.
Analytic maps are defined in these analytic charts, using Mathlib's convergent `AnalyticAt`
notion; formal Taylor data without a convergence theorem is not an analytic map. Semianalytic
means locally a finite Boolean
combination of zero sets and strict positivity sets of real-analytic functions. More precisely,
near each point the set is a finite union of finite intersections of loci `f>0` and `f=0`, for
real-analytic functions defined on that neighborhood; the functions and formula may depend on the
point. This roadmap does not silently extend the category to subanalytic sets.

Consume [RealAlgebraicGeometry Layer 7](../RealAlgebraicGeometry/README.md#layer-7-analytic-preparation-and-mccallum-projection) for the real-analytic chart and `TauCeti.IsAnalyticSubmanifold` carrier, convergent local complexification/restriction and conjugation compatibility, including the implemented `AnalyticAt.exists_complexification`/`exists_complexification_pi` and native radius bounds, plus Layer 7's sharper radius-halving target. Consume RealAlgebraicGeometry Layers 1, 2, 4, and 6 respectively for Thom encodings, subresultants, continuous-family root matching, and parameter-uniform quantifier elimination. This roadmap does not redevelop those analytic/algebraic carriers or root facts. It owns real semianalytic normal decomposition, affine/manifold triangulation, and the global analytic embedding and Stein arguments specified below. Consume ComplexKahlerGeometry K3.0's real/complex chart comparison and K3's convergent complex Weierstrass preparation/division, primitive local generators of analytic ideals and local parametrization. Consume CK K1/K2 type calculus, K4's Chern connection and canonical bundle, and K6.0's local Kähler/Lefschetz and Bochner–Kodaira–Nakano identities. Consume SBC B2's bundle L² carrier and CK K5a's real/complex density, formal-adjoint, distribution, and local Laplace-type regularity; do not duplicate them. This roadmap owns the complete noncompact weighted `∂̄` estimate with precise curvature/domain hypotheses and the Stein and coherent-sheaf consequences. No R3 proof uses K6.1 or K5a's compact global Hodge theory or CK K6's later cycle package. K6.1's analytic-cycle theory consumes R5; R5 consumes only K6.0's earlier local identities through R3.

RealAlgebraicGeometry owns polynomial semialgebraic definitions, CAD and quantifier elimination. Its Layer 6 formula-level elimination is used for R2's coefficient-parametric projection step; it does not supply semianalytic normal decomposition or triangulation. RealAlgebraicGeometry Layer 7 owns the shared real analytic submanifold and local-complexification carriers, and RealAlgebraicGeometry Layer 4 owns continuity/constancy of ordered real roots in its stated fixed-degree/gcd hypotheses. R1 builds real semianalytic local decompositions using these suppliers and the RealAlgebraicGeometry Layer 1 Thom/subresultant sign data, without duplicating their analytic roots or CAD.

## R0. Real analytic charts and germs

Use RealAlgebraicGeometry Layer 7's convergent real-to-complex germ extension and chart-map complexification, its conjugation-fixed characterization, and its common-radius estimate `‖p_ℂ‖≤2^k‖p‖` (hence extension radius at least `r/2`). Consume CK K3.0's real-analytic chart comparison and CK K3's convergent complex local algebra. Build the real chart-local analytic function and germ API using `AnalyticAt`, including restriction, pullback, composition, shrinking, equality and transport across analytic chart equivalences. Prove these operations agree with RealAlgebraicGeometry Layer7's complexification/restriction maps. Do not provide a second complexification theorem or identify formal series with convergent germs without the RealAlgebraicGeometry Layer7 radius theorem.
Prove the neighborhood adapter: a real-valued real-analytic function on an
open subset of real affine space extends holomorphically to a conjugation-invariant
complex neighborhood of that real open set. Use the native local extension,
shrink real-centered complex balls, and glue by real-locus uniqueness on their
connected overlaps; prove conjugation compatibility and neighborhood/germ
uniqueness. This adapter uses the native germ construction, not a new series.

## R1. Semianalytic sets and local normal decomposition

Use the RealAlgebraicGeometry Layer 7 `TauCeti.IsAnalyticSubmanifold` carrier and its chart/API. Define a local semianalytic presentation by finite Boolean formulas in `f=0` and `f>0` for analytic germs; prove shrinking invariance, equivalence of presentations, finite Boolean closure and analytic preimage/isomorphism stability. The manifold-level notion is tested in the shared charts, not by a duplicate submanifold structure.

Prove the local normal-decomposition theorem for a finite family of real analytic functions on a coordinate neighborhood. After shrinking, give a finite partition into connected, locally closed analytic submanifolds on which every function has constant sign. Each piece and each connected component is semianalytic. Inside the neighborhood, closures are unions of pieces, and a boundary piece has strictly smaller dimension. Keep this theorem local; do not attempt to glue arbitrary chartwise decompositions into a global stratification. The proof induction is: use RealAlgebraicGeometry Layer7 complexification, CK K3 convergent Weierstrass preparation, and the conjugation/uniqueness theorem to obtain real Weierstrass preparation; remove repeated factors using squarefree reduction and RealAlgebraicGeometry Layer 2 subresultant/gcd criteria (the discriminant of a repeated product may vanish identically); put every principal subresultant coefficient of `(P_i,P_i')` and `(P_i,P_j)`, together with leading coefficients and the discriminant/resultant loci, into the base induction family; on each cell prove fixed degrees and fixed gcd degrees before using RealAlgebraicGeometry Layer 4; and on each complementary connected cell use RealAlgebraicGeometry Layer 4 root matching plus RealAlgebraicGeometry Layer 1 Thom encodings to order the real roots and describe each selected root section by its Thom signs. Own analytic-coefficient delineability on these cells: subresultants are polynomial expressions in the analytic coefficients, and constant-rank gcd/squarefree formulas are analytic where their selected pivot minors do not vanish. Simple roots of the resulting monic squarefree polynomial are analytic by RealAlgebraicGeometry Layer7 implicit inversion; RealAlgebraicGeometry Layer4 gives ordered continuity, multiplicity constancy and pairwise root matching under the proved fixed-degree/gcd hypotheses. Thom descriptions prove each section semianalytic. Include local connectedness at frontier points as an induction invariant and prove section/sector boundary compatibility from that invariant and the root-matching neighborhoods. Prove the induction terminates by strict dimension drop. Do not use a global analytic atlas refinement as a substitute for this bad-set induction.

Prove local dimension invariance for semianalytic sets: define dimension by the maximum dimension of pieces in a compatible local normal decomposition, with `dim ∅=−∞`; show independence of decomposition, `dim closure(A)=dim A`, and `dim(closure(A)\A)<dim A` for nonempty A. State empty and zero-dimensional cases. Do not assert the ambient boundary of a lower-dimensional closed set has smaller dimension. Prove local finiteness of connected components and semianalyticity of every component. The local normal decompositions satisfy the frontier condition. State both parts of the frontier condition: `S ∩ closure(T)≠∅ → S ⊆ closure(T)`, and `S ⊆ closure(T), S≠T → dim S<dim T`. The first is a containment assertion; the second gives the dimension drop for incident distinct strata.
## R2. Łojasiewicz's affine triangulation theorem

For every finite-dimensional real affine space `A` and locally finite family `(Bν)` of semianalytic
subsets of `A`, prove §3 Theorem 1 of S. Łojasiewicz, “Triangulation of semi-analytic sets,”
*Annali della Scuola Normale Superiore di Pisa* (3) 18 (1964), 449–474, printed p. 463. Produce a
locally finite simplicial complex `K` with `|K|=A` and a homeomorphism `τ:|K|→A` such that
`τ` has property (A), every open simplex maps analytically isomorphically onto an analytic
submanifold, and every image simplex lies wholly in or wholly outside every `Bν`. Since A is
second-countable, the nonempty members of a locally finite `(Bν)` are countable.
Discard empty members for the direction argument; their compatibility condition is automatic. The target is
the whole affine space and the whole locally finite input family; the bounded semialgebraic
Theorem 3 and projective Theorem 4 are distinct results, not substitutes. For clarity, if
`f:E⊂A→A`, property (A) means that its graph `{(y,x):y=f(x)}` in target-by-source coordinates
is locally, over each target point `y`, a finite Boolean combination of conditions
`P_j(y,x)=0` or `P_j(y,x)>0`, where each `P_j` is polynomial in the affine-source variable `x`
with real-analytic coefficient functions of the target variable `y`. Property (A⁻¹) uses the
target coordinate as its affine polynomial variable. These are local partial-semialgebraic
graph conditions; neither says the whole graph is semialgebraic.

Use R1's proved local semianalytic presentations, normal decompositions, frontier/dimension
facts, component finiteness and closure stability. R2 also proves the
following stronger *normal-box* API needed by the induction: after an affine coordinate change
and shrinking, a normal box has a finite partition into connected analytic pieces indexed by
`k=0,…,n`; each piece is a connected component of the successive Weierstrass-root loci with the
preceding discriminant/nonvanishing conditions; its dimension is k; the k=n pieces are open, the
k<n pieces are analytic graphs over open subsets of the first k coordinates, and the frontier of
each piece is a union of lower-dimensional pieces. Prove compatibility with a finite family of
analytic functions/semianalytic sets and arbitrary-small choice. Also prove the prescribed-zero-set version: given a
nonsingular line, transverse hyperplane, finite defining functions f_j and an analytic
F with `f_j=0⇒F=0` and with F nonzero as a germ along the chosen
line through the center, choose the adapted affine normal system whose union of
lower-dimensional pieces is exactly `{F=0}` near the center. Prove this using
Weierstrass preparation/division and the successive discriminant systems, with
the prescribed line and hyperplane retained. Prove that coordinate projection
to the first m variables sends the normal data to normal data and preserves the dimension label
for each piece of dimension at most m. The proof uses CK K3's convergent Weierstrass preparation
and division, RealAlgebraicGeometry Layer 7's analytic inversion, and R1's local sign decomposition; these normal
root/graph and projection assertions remain R2 targets.

The affine proof is by induction on `n=dim A`, with dimensions zero and one handled directly.
Establish Lemmas 1–15 as usable targets in this order, with empty and zero-dimensional cases included.

1. Lemma 1 is the analytic Sard-meagerness statement: if countable-basis analytic manifolds
   `X,Y` and analytic `g:X→Y` satisfy `rank g<dim Y`, then `g(X)` is meager. Prove it by
   induction on `dim X`: locally decompose the semianalytic rank-drop locus, apply induction on
   its lower-dimensional pieces, and use the constant-rank theorem plus a countable cover on
   maximal-rank pieces. Lemma 2 is the Lefschetz–Whitehead rank estimate: for an
   `(m−1)`-submanifold `S⊂V` with `u∉T_uS`, if `g:X→M`, `h:X→S` are C1 and
   `(x,λ)↦g(x)+λh(x)` has rank at most `m−1` on a neighborhood of `X×{0}`, then
   `rank h≤m−2`. Derive the estimate by dividing the differential by λ, first showing the rank minors are polynomial in λ, hence vanishing near λ=0
   implies vanishing for all λ, then taking the λ→∞ rank limit, and using transversality of h to `T S`.

   Lemma 3 then proves that singular directions for one analytic function not identically zero
   on a connected open set are meager in projective direction space. Represent a singular
   direction by a unit vector and the analytic incidence set of points/directions for which
   `f(u+ξv)` vanishes as a germ. Its analytic equations must include the zeroth derivative
   `f(u)=0` as well as every directional derivative of positive order; prove local finite determination of this countable zero family on a common
   complex neighborhood. Complexify the single defining function f; all its
   directional-derivative equations extend holomorphically on that same
   neighborhood (with analytic direction charts). Use CK K3's Noetherian germs
   to select finite equations at a point, take a sufficiently small representative
   of their finitely many analytic components, and use the holomorphic identity
   theorem on their dense connected regular loci to make every remaining equation
   vanish on those components. This gives a uniform neighborhood for the common
   zero **set**, beyond mere germ stabilization. Own this common-neighborhood
   reduction and the component/identity adapters here, then apply normal boxes
   and Lemmas 1–2. No simultaneous complexification is assumed for an arbitrary
   countable family of unrelated real-analytic functions. Lemma 4 applies Baire to
   countably many local defining functions for a countable semianalytic family; the countable
   union of singular-direction sets is meager, so the simultaneously nonsingular directions form
   a dense residual subset of projective direction space. This finite-dimensional Baire step
   also handles the countable normal-box cover used below.

2. Lemma 5: a bounded semianalytic subset of `M×ℝ` whose vertical direction is nonsingular is
   partially semialgebraic with respect to the ℝ-coordinate. Prove the local Weierstrass
   polynomial description and patch over a locally finite cover. For this exact projection
   convention, prove the §1/V closure rules: finite Boolean operations; connected components via normal decomposition; locally finite unions
   (each base neighborhood meets only finitely many members); and projection of a set described
   by analytic functions polynomial in the quantified affine coordinates. Consume RealAlgebraicGeometry Layer 6's
   formula-level quantifier elimination with parameters. Show the fixed finite output formula
   substitutes analytic coefficient functions on a neighborhood of each base point, so no
   parameter-by-parameter choice or global semialgebraic graph is being asserted.

   Lemma 6: an analytic submanifold `ψ⊂M×ℝ` satisfying
   `|t−t′|≤A|u−u′|` for all its points is a topographic graph with A-Lipschitz graph function.
   Prove injectivity and full-rank projection locally and globally from the inequality. For the
   shear `(u,t)↦(u+tz,t)`, the sufficient threshold is `|z|<1/A`; derive it from
   `|Δu+zΔt|≥(1−A|z|)|Δu|`. This is the required shear target. Lemma 7 is the property-(P) hypersurface lemma:
   given analytic f at `(c,0)` with `f(c,·)` not identically zero, construct analytic g with
   `g(c,·)` not identically zero such that `{fg=0}` has property (P), where property (P)
   means its projection to M is open. Also prove that a topographic submanifold of dimension
   `dim M=n−1` has (P): its projected analytic submanifold has full dimension in M and is open.
   Prove the hypersurface lemma by induction on `dim(M×ℝ)` using a distinguished
   Weierstrass polynomial, its discriminant, a line nonsingular for the discriminant, roots of a
   second Weierstrass polynomial and the product construction; handle degree zero explicitly.

3. Develop the adapted local decomposition package in Lemmas 8–9. Lemma 8 refines a normal box
   compatible with the finite semianalytic family and an already chosen nonsingular vertical
   line. In affine coordinates, make that line the last axis and the transverse slice the
   coordinate hyperplane; first apply Lemma7 to the product of the defining functions, obtaining a
   prescribed zero set `{fg=0}` with property(P), and use the prescribed-zero-set
   normal-box theorem above so the lower-dimensional union is that zero set.
   An arbitrary Weierstrass zero set is not claimed to have open projection.
   Lemma 9 proves all adapted pieces are partially semialgebraic, every piece of dimension below
   n is topographic, and projection gives a normal decomposition with the same k-dimensional
   labels for k<n. Obtain property(P) from the Lemma7 choice in Lemma8 and the prescribed-zero-set
   realization; the frontier and graph descriptions supply its remaining normal data. These are the normal-system/projection facts absent
   from the article's proof and are R2 targets on top of R1.

4. Lemma 10 straightens an ordered, locally finite family of analytic graphs φν near c, indexed
   by ν=±1,±2,…, where φν(c) strictly increases with ν and tends to ±∞ at the two ends. Assume
   their graph family is locally finite and an open region G contains `{c}×ℝ`. After restricting
   each graph to a connected neighborhood of c, construct an analytic isomorphism
   `g:M×ℝ→M×ℝ` such that ψν=g(φν*) are pairwise disjoint, bounded, semianalytic topographic
   graphs; (1) `g((M×ℝ)\G)⊂M×(−1,1)`; (2) the ψν are bounded and disjoint; (3) every bounded
   subset of M is contained in `⋂_{|ν|≥N}Ων` for some N, with `Ων=π(ψν)`; (4) ψν(u) tend
   uniformly to ±∞ on bounded base sets as ν→±∞; (5) all graph functions satisfy one Lipschitz
   bound independent of ν; (6) `cl(ψν)⊂g(φν)` and `g(φν)\ψν⊂M×(−1,1)`; deduce that `ψν∩{|t|≥1}` is closed.

   Follow the actual construction. Choose disjoint compact height intervals Δν and radii aν;
   choose a positive function γ constant on each Δν and each complementary interval, with
   `γ(t)<aν` on Δν and `{(u,t):|u|≤γ(t)}` contained in G minus the union over ν of the discarded
   graph portions `φν\φν*`. Construct a smooth positive target for h with strict margins and
   prove the affine C1 Whitney approximation needed to replace it by a positive real-analytic h.
   Only derivative orders 0 and 1 are required, with pointwise error tolerances chosen to preserve
   strict inequalities; do not claim arbitrary all-orders uniform approximation. Require
   `h(t)>γ(t)⁻¹√(t²−1)` for `|t|≥1`, `h(t)>2kν`, and `|h′(t)|<aν⁻¹` on Δν, where kν is a
   Lipschitz bound for φν* on its radius-aν domain. Let β be inverse to
   `t↦(eᵗ−e⁻ᵗ)/(e−e⁻¹)`; prove β is increasing analytic, β(±1)=±1, and
   `|β′(t)|≤min(2,1/|t|)`. Set `g=g₂∘g₁`, where `g₁(u,t)=(h(t)u,t)` and
   `g₂(u,t)=(u,β(t/√(1+|u|²)))`; prove both maps are analytic isomorphisms and verify
   conditions (1)–(6). In particular, show each Ων contains the ball of radius
   `½√(bν²−1)`, where `bν=inf{|t|:t∈Δν}`, proving the common-tail condition. Lemma 10 owns
   this affine C1 approximation; it has no dependence on R4 or a manifold-level approximation
   theorem.

   Lemmas 11–14 provide band calculus. When the closures of the graphs of `φ,φ′` are bounded
   single-valued functions on `cl E`,
   prove `cl(φ,φ′)=[cl φ,cl φ′]` if `φ<φ′` on E (Lemma 11). For a map g between bases and
   endpoint functions ψ,ψ′, define the interpolation on a closed band by
   `s=ψ(g(u))+(t−φ(u))(ψ′(g(u))−ψ(g(u)))/(φ′(u)−φ(u))` when endpoints are distinct, and collapse
   equal endpoints to `(g(u),ψ(g(u)))`; require the exact collapsed-endpoint condition
   `φ(u)=φ′(u) ⇒ ψ(g(u))=ψ′(g(u))`. Lemma 12 proves graph/restriction compatibility;
   Lemma 13 proves the graph map and strict open-band map are analytic isomorphisms when the
   base map and endpoints are analytic with strict source and target endpoint inequalities;
   Lemma 14 proves the closed-band extension is continuous when the base and endpoint maps are
   continuous on a compact base, and has property (A⁻¹) when g has (A⁻¹), the source endpoints are partially
   semialgebraic over ℝ, and the target endpoints are semialgebraic. Prove the last claim by
   writing the interpolation graph as a finite partially semialgebraic system, introducing
   endpoint-value variables, and applying the projection theorem. These lemmas supply actual
   extension and gluing contracts, not just a name for “band interpolation.”

5. Prove the global topographic-family construction (§4 step I) from Lemmas 4–10. First use the
   common nonsingular direction to arrange vertical transversality for the whole locally finite
   family. Use countably many adapted normal boxes and their projected decompositions; choose a
   base point outside the countable union of nowhere-dense lower-dimensional
   projected strata, using Baire; projection does not preserve local finiteness. Select a
   two-sided sequence of graph levels through this point and disjoint strips between consecutive
   levels. Lemma 10 and then a shear with `|z|<1/A`, chosen also in the dense nonsingular-direction
   set, produce the locally finite upper/lower graph family outside `|t|<1`; apply Lemma 5 after
   the shear to prove these graphs partially semialgebraic. Derive the uniform graph Lipschitz
   bounds through the two coordinate changes (first at most 1, then at most 3) so Lemma 6 applies.
   Inside this strip,
   cover each compact vertical segment by finitely many adapted normal boxes and place truncated
   cones with locally finite bases. Take as pieces the lower-dimensional normal strata clipped to
   the cones, cone sides, and the two boundary planes. Prove the union is closed and has (P): use
   (P) for each stratum, local finiteness, and the fact the cone boundary is in the union. Prove
   every connected subset compatible with these pieces is compatible with each input `Bν`,
   separately outside and inside the strip. Record all six properties needed later: partially semialgebraic
   topographic pieces whose intersections with `B×ℝ` are bounded for every
   bounded base set B (including the two boundary planes); local finiteness; compact/disjoint tails; closed
   union with (P); unbounded positive and negative vertical intersections over every base point;
   and compatibility transfer to the input family.

6. Form the **clipped** projected family
   `π(Γ∩Γ′∩(M×(−2,2)))`, including diagonal pairs, for the topographic pieces.
   Prove semianalyticity by the partial-semialgebraic projection theorem. Near
   a compact base neighborhood, the defining pieces meet its compact product
   with `[-2,2]`; product local finiteness therefore leaves finitely many
   relevant pairs. This proves local finiteness of the clipped family, not
   of the raw projections of all pieces. Apply induction in dimension n−1.
   For distinct Γ,Γ′ or a lower-dimensional Γ, the topographic-family tail
   properties place their intersection inside the strip, giving compatibility
   with the full pair intersection. For a diagonal full-base-dimensional graph,
   the complement of its clipped projection splits into `M\πΓ` and
   `{u∈πΓ:|Γ(u)|≥2}`. Prove both are closed: the first from its open graph domain,
   the second from the closed bounded high-graph portion and projection of that
   compact portion. They are disjoint; connectedness of an open base simplex
   compatible with the clipped projection makes it lie in πΓ or outside it.
   Do not require the unbounded domain complement to be compact. Thus obtain
   the compatibility with every full projected pair needed for the prismatic
   construction. Barycentrically subdivide it so each subdivided open simplex lies in a single controlling open
   simplex and has that simplex's barycenter as a vertex. Pull the topographic family back over these base simplices to
   obtain the prismatic strata. Prove they are disjoint and locally finite, cover all vertical
   directions, have continuous closure graphs, and restrict to strata over every face. The
   distinguished-vertex condition gives strict order preservation for pairs of disjoint graph
   sections. Define consecutive sections (no section strictly between); prove restrictions to
   faces stay equal or consecutive. Fill each gap with the strict open band. The graph strata
   and open bands then form a locally finite disjoint cover; on each connected base simplex the
   consecutive bands are both open and closed in the vertical complement, so cover the whole
   fiber. Lemma 11 gives the exact closure formula for a band, and the face/equality and
   consecutive-order results prove every closure is a union of strata. This is the prismatic
   closure and compatibility package used in §4 steps III–IV.

7. Record the Step-I analytic coordinate change `f=l∘g` and the transformed
   input family `f(Bν)`. Pin the rectilinear cells before constructing the transfer.
   For each graph γ over a base simplex β, put `ρ=τ_b⁻¹(β)`, where τ_b is
   step6's base triangulation homeomorphism. At each vertex v of closureρ use
   the height of the continuous closure graph of γ at τ_b(v), where v is
   the barycenter of its controlling projected simplex δ_v. Keep the source's
   `s(β)={τ_b(v):v is a vertex of closure(τ_b⁻¹β)}` notation for that finite
   set of points. Their affine interpolant
   defines the graph σ(γ) over ρ; these heights are prescribed, not arbitrary.
   Prove the source IV(1)–(4): projection to ρ, strict order on the open simplex,
   the endpoint bounds, and compatibility/inclusion on closure faces. The
   distinguished-vertex condition ensures strict order even when endpoint
   values coincide on a face. Take the intervening rectilinear affine bands.
   Use the associated band maps over `g_β=τ_b⁻¹|β`, with these fixed endpoint
   data. Verify the collapsed-endpoint condition on each closed band;
   use Lemmas 12–14 to prove graph/band maps agree on all face restrictions, are continuous on
   closures, and are analytic isomorphisms on each open graph or band. Define the global map as
   the union of the locally finite stratum maps. The closure compatibility makes it a
   homeomorphism, not merely a bijection. Prove property (A⁻¹) for this map by the local-finite
   union and affine-source projection theorem, then take the inverse to obtain property (A) for
   `τ*` for the transformed input. The final map is `τ=f⁻¹∘τ*`.
   Prove analytic-isomorphism transport preserves open-simplex analyticity and
   compatibility with the original Bν. Prove property(A) is preserved here:
   graphs of analytic isomorphisms and their inverses are locally polynomial
   in the affine source coordinate, and for this postcomposition substitute `y=f(z)` in the
   analytic target-coefficient functions of the graph of τ*. Polynomial
   dependence on the affine source coordinate is unchanged. Do not assume
   general composition closure when a quantified intermediate variable
   would occur in analytic coefficients. Show every transferred stratum
   remains compatible with each Bν. Preserve the exact
   affine-source convention: for `f:E⊂A→A`, property (A) means its graph in `A×A` is locally
   described by analytic-coefficient polynomials in the source coordinate; property (A⁻¹) uses
   the target coordinate. No globally semialgebraic graph is claimed.

8. Prove Lemma15 for the **rectilinear affine** cell family constructed in
   step7, using its prescribed vertex heights and affine interpolants. The graph is an affine simplex; between ordered affine
   endpoint functions a≤b, the closed band is
   `{(u,t):u∈closure β, a(u)≤t≤b(u)}`, a finite-vertex convex polytope.
   Prove the vertex description as the convex hull of the lower and upper
   endpoint vertices. A face on which the width vanishes is an ordinary
   lower-dimensional face of this polytope. These assertions concern the
   rectilinear cells, whose nonlinear images under τ need not be convex.
   Prove all faces are finite unions of the controlling lower-dimensional
   affine cells, using step6's ordering/equality compatibility. Induct on cell
   dimension, preserve the already chosen boundary triangulations and cone
   each to an interior point; prove common-face intersections and coverage.
   Every cell receives finitely many simplices, so local finiteness of the
   cell family gives local finiteness of the subdivided complex. Its support
   is all A. Composing the affine simplex charts with τ proves simultaneous
   compatibility, property(A), and the analytic-isomorphism condition on every
   open simplex. This is a finite polyhedral subdivision target, rather than
   a triangulation assertion for arbitrary CW complexes.

## R3. Complexification, strict psh exhaustion, Stein theory and coherent sheaves

### R3.0. Global complexification and tubes

Consume RealAlgebraicGeometry Layer7's local complexification of transition maps and shared
`TauCeti.IsAnalyticSubmanifold` carrier. Construct a Bruhat–Whitney complexification
of every Hausdorff, second-countable real-analytic n-manifold by the following
paracompact gluing argument, including the noncompact case. Fix complex model
`Fin n→ℂ`, with `IsManifold 𝓘(ℂ,Fin n→ℂ) ∞` on the resulting X, using R0's
real coordinate equivalence. Consume the open-gluing carrier and chart maps
of [ComplexManifolds #279 Milestones4–6](https://github.com/TauCetiProject/TauCetiRoadmap/pull/279), as in CK's supplier contract; R3.0
owns the W/A/B separation and real-structure choices for this gluing. Choose three locally
finite chart covers with `closure V_i⊂U_i`, `closure U_i⊂T_i`, all relatively
compact in the next chart. Complexify transitions on the outer overlaps; choose
relatively compact complex overlap domains extending the middle overlaps, with
inverse transitions and closure intersections with the real locus fixed.
For each pair of neighboring charts put the compact common part of the inner
real closures in a smaller overlap W. Separate their remaining compact parts
by disjoint open buffers A and B. Use these W/A/B buffers and local finiteness
to choose complex neighborhoods of the inner charts: only finitely many neighbor
and triple-overlap constraints occur at each chart. Require that they avoid
transitions to disjoint real inner closures, that the triple compositions lie
in their domains, and that the inverse and cocycle identities hold there by
analytic uniqueness. Make all choices invariant under conjugation.

Glue only these inner complex neighborhoods along the restricted transitions.
Prove the buffer lemma: limits, within the two chart neighborhoods, of
transition-related pairs remain in the middle complex overlap where the
transition is defined. Continuity then makes the limit pair related. Use this
closed-transition-graph property and the open chart identifications to separate
distinct quotient points; cocycles alone do not prove Hausdorffness. Prove that
the original real charts embed with their original topology, that the quotient
has a countable atlas, and hence is second-countable and paracompact. Conjugation
descends to an antiholomorphic involution; shrink its neighborhood to identify
its fixed locus exactly with the original manifold, which is closed there.
Prove uniqueness of the complexification germ by extending an analytic
identification and shrinking overlaps. The proof route is Whitney–Bruhat,
[§1 Proposition1](https://doi.org/10.1007/BF02565913), including its separation
buffers rather than merely its cocycle calculation.

Pin complex manifolds by `IsManifold 𝓘(ℂ,E) ∞`, holomorphic maps by
`MDifferentiable ℂ`, and the fixed locus in K3.0's realified analytic atlas.
R0 owns the manifold adapter: compose each native real extended chart with a
fixed continuous real-linear equivalence `E≃L[ℝ](Fin n→ℝ)`, then test the
image with `TauCeti.IsAnalyticSubmanifold`. Prove chart and coordinate-equivalence
independence and analytic-isomorphism transport. In a complex n-dimensional
model use real dimension 2n and K3.0's restriction-of-scalars comparison.

Define a Stein manifold by holomorphic convexity, holomorphic point separation, and holomorphic local coordinates. Prove Grauert's p-function construction. A p-function is a germ on an open neighborhood of the entire fixed locus M in the complexification: `p≥0`, `p^{-1}(0)=M`, `p=dp=0` on M, and `p` is strongly plurisubharmonic on a possibly smaller neighborhood including M. The neighborhood may shrink under a positive smooth multiplier or a locally finite sum. For every proper smooth exhaustion `r:M→ℝ`, construct a positive smooth multiplier `λ` on M and an extension to a neighborhood so that `r+λp` is strongly plurisubharmonic near M; The multiplier λp depends on r; the initial p-function germ can be fixed before the exhaustion is chosen. Define the barrier `p*` as a further positive smooth multiple of p chosen on a shrunk tube so that it remains strongly psh there and `{p*<1}` has closure inside the complexification neighborhood. State explicitly the smooth extension of r, λ, p* and their domains. The product/multiplier lemma is local near M and follows from `p=dp=0` and the positive Levi form there; it is not asserted globally for arbitrary positive multipliers away from M.

Consume [GeometricTopology Layer 1's normal tubular neighborhood](../GeometricTopology/README.md#layer-1-manifold-library-buildout-general-dimension-general-structure-group) for the closed real fixed locus, and its smooth retraction π onto M. Use the smooth extension `R=r∘π`, with r normalized bounded below. Choose p* and the tube T inside the common region where p*, p and `r+λp` have the required plurisubharmonicity, so for every compact `K⊂M` and `ε>0`, `{x∈T:p*(x)≤1−ε, π(x)∈K}` has compact closure inside the complexification neighborhood. Prove this by choosing a variable normal-radius tube and finite-rank closed disk-bundle compactness over K; this is the transverse compactness bound required in addition to closure inside the neighborhood. Normalize `r` to be bounded below and construct a global proper smooth strictly psh exhaustion `q` on the resulting tube T, for example `q=(r+λp)+(1-p*)^{-1}` after proving each term and the barrier have the stated Levi form. Prove q is proper, its sublevels are relatively compact and exhaust T, and regular values are dense by Sard. For each regular level prove the sublevel is relatively compact strongly pseudoconvex with smooth boundary. Prove directly that any second-countable complex manifold with a global smooth strictly psh exhaustion is Stein by the weighted `∂̄` route below; do not infer Steinness from an arbitrary increasing union of Stein open sets. The generalized Runge limit theorem in Grauert is not used as a black box.

### R3.1. Weighted estimates, Stein criteria and approximation

In complex dimension zero, prove the Stein and embedding claims directly for a countable discrete space, using a proper enumeration into ℂ; no `∂̄` estimate is needed. For positive dimension, own the noncompact weighted `∂̄` theorem on a complete Kähler n-manifold X without boundary and a smooth Hermitian holomorphic bundle E. For a smooth real weight φ and `1≤k≤n`, put `B=[iΘ(E)+i∂∂̄φ,Λ]` on E-valued `(n,k)`-forms. If B is pointwise positive definite and distributionally closed data f belong to weighted L² with `∫⟨B⁻¹f,f⟩e⁻φ dV<∞`, prove existence of an E-valued `(n,k−1)`-form u with `∂̄u=f` and `∫|u|²e⁻φ dV≤∫⟨B⁻¹f,f⟩e⁻φ dV`. The uniform variant `B≥ε Id`, `ε>0`, gives the closed-range bound `‖u‖≤ε⁻¹ᐟ²‖f‖`; the pointwise-positive theorem does not assert a uniform closed-range constant. Prove maximal distributional `∂̄` is closed and densely defined, and that compactly supported smooth forms are dense in `Dom ∂̄∩Dom ∂̄*` in the graph norm for the complete metric. Derive the estimate from Bochner–Kodaira–Nakano, graph-domain density, Hilbert orthogonal projection onto `ker ∂̄`, and Riesz representation. The minimal solution is orthogonal to `ker ∂̄`; for smooth data, local elliptic regularity for its `∂̄`-Laplacian gives smoothness. Consume CK K5a for local elliptic regularity, K5b.0 for the Hermitian
Dolbeault formal adjoint and principal symbol `½|ξ|² Id`, and SBC B2 for bundle L².
Prove here that the scalar/bundle weight changes the adjoint only in lower order,
so the weighted ∂̄-Laplacian has that same Laplace-type symbol on its open domain.

Construct a complete Kähler metric on X from its normalized strictly psh exhaustion q, using a smooth increasing convex function `χ₀(q)` whose derivative and second derivative give completeness; prove a lower bound on lengths of paths along which q escapes. On a regular sublevel `D_c={q<c}`, also prove completeness of `i∂∂̄(q−log(c−q))` at its smooth boundary. To solve scalar `(0,k)` problems, use the canonical holomorphic identification with `(n,k)`-forms valued in `K_X⁻¹`, endowed with the dual of the canonical metric induced by the chosen Kähler metric; prove this identification respects `∂̄` and the L² norms. Its curvature contributes the Ricci term. Choose a smooth increasing convex weight `χ₁(q)` with derivative large enough on each compact q-shell to dominate the negative curvature of `K_X⁻¹` and E and ensure `B≥Id`; prove such a choice using compact-shell bounds and the strictly positive Levi form of q. The same construction on D_c uses its proper exhaustion `q−log(c−q)`. A constant multiple is used only when the corresponding uniform curvature bound has been proved. Prove the exhaustion-limit and weak compactness lemmas with bounds on each earlier compact.

For a finite set of distinct points a and prescribed holomorphic jet polynomials P_a of degrees at most d, choose disjoint coordinate balls and cutoffs χ_a equal to one near a, and set `v=Σχ_a P_a`. Solve `∂̄u=∂̄v` with a weight `χ₁(q)+Σs_a η_a log|z−a|²`, where η_a is one near a and vanishes outside its coordinate ball, and `s_a=n+d`. The logarithm is a weight singularity; the resulting holomorphic functions have no poles. Regularize by `log(|z−a|²+δ²)`, bound all negative Levi contributions on the cutoff annuli uniformly in δ, and increase χ₁ to absorb them. The data are supported away from the singularities, so the inverse-curvature estimates are uniform. Pass to a weak limit and prove `∫|u|²|z−a|⁻²s_a<∞` locally. Since u is holomorphic near a, polar integration of its Taylor expansion forces every coefficient of degree at most `s_a−n=d` to vanish. Thus `v−u` has every prescribed jet: d=0 gives simultaneous point separation, d=1 gives holomorphic local coordinates. Include local Cauchy bounds that convert the L² estimates to compact sup-norm bounds.

Prove the same finite-point jet interpolation for sections of every finite-rank
holomorphic bundle E on Stein X, before Cartan A/B. Choose a smooth Hermitian
metric on E using SBC B2, apply the weighted theorem to `E⊗K_X⁻¹`, and choose
χ₁(q) to absorb its compact-shell curvature. In local frames the cutoff jet
sections and singular weights have the same vanishing-order argument as above.
A prescribed value in any fiber extends to a global holomorphic section; finitely
many such sections generate E near any given compact by continuity and a finite
subcover. This is the vector-bundle section supplier used in R3.2's exact
block-matrix gluing, independent of coherent-sheaf Cartan A.

For holomorphic convexity, given compact K and `c>sup_K q`, construct for each b outside `{q≤c}` a holomorphic function f with `f(b)=1` and `sup_K|f|<1`. Use a cutoff near b disjoint from `{q≤c}` and a logarithmic weight there with s=n. Choose the convex part of the weight to grow fast between K and the support of the cutoff derivative; the inverse-curvature estimate and local Cauchy bounds make the correction arbitrarily small on K while its value at b is zero. Prove the holomorphic hull is closed and contained in the compact sublevel `{q≤c}`. For Oka–Weil on an arbitrary holomorphically convex compact K and any neighborhood U of K, construct a smooth strictly psh exhaustion ψ with `ψ<0` on K and `ψ>0` outside U. Build ψ from finitely many holomorphic separators on a large compact shell, the existing q outside that shell, and a smooth regularized maximum, preserving strict inequalities after a small strictly psh perturbation. Choose an intermediate compact neighborhood where the cutoff derivative has a positive ψ-gap from K. Solve with weight `χ₁(q)+tψ`, `t→∞`, and use local Cauchy estimates to obtain approximation of the holomorphic germ on K, with every finite derivative on smaller compact neighborhoods. This proves the Stein criterion and finite-point jet interpolation before any use of Cartan A/B for arbitrary coherent sheaves.

Own the convex-compact Stein-neighborhood lemma used by R3.2: with ψ as
above, `D={ψ<0}` contains K, is relatively compact in U, and has proper strictly
psh exhaustion `q−log(−ψ)`. Prove its boundary divergence and Levi positivity,
then apply the direct R3.1 Stein criterion. Own its precise finite-cut form.
Write `t=Re F` for a global holomorphic F and take a fixed O(X)-convex compact
`K_{≤s}`, a<s, η>0, and open sets `U₁⊇K_{≤a}`, `U₂⊇K_{a−η,s+η}`,
`W_a⊇K_{a,a}` and `V⊇K_{≤s}`. For sufficiently small ε>0 prove that
`[(U₁∩{t<a−ε/2}) ∪ (U₁∩U₂∩W_a∩{|t−a|<ε}) ∪ (U₂∩{t>a+ε/2})] ∩ V`
is an open neighborhood of the fixed cut, using compactness and positive
margins. Choose ψ and hence the relatively compact Stein D inside this open
neighborhood. Then `ω₁=D∩{t<a+ε/2}` and `ω₂=D∩{t>a−ε/2}` cover D,
lie respectively in U₁ and U₂, and have overlap inside
`U₁∩U₂∩W_a∩{|t−a|<ε/2}`. Take V to be the intersection of all common
sheaf, section and relation-column domains required in the application,
each containing the fixed cut. Choose D only after this intersection, and
prove its Stein property using the displayed exhaustion.

Prove the converse exhaustion theorem for every Stein manifold under the
holomorphic-convexity/separation/coordinate definition in R3.0. Choose a countable
O(X)-convex compact exhaustion and finite holomorphic separators of each compact
shell. Raise/rescale them so they are summably small, with every finite derivative,
on earlier compact neighborhoods and their squared moduli are large on the new
shell. Add a countable positively weighted tuple of global holomorphic coordinate
functions whose differentials span at every point. Prove local convergence with
all derivatives by Cauchy estimates; the sum of squared moduli is smooth, strictly
psh and proper. Its nonnegative terms prevent cancellation in the shell lower
bound. This establishes the exhaustion required by the weighted, approximation
and coherent-theory targets for general Stein X, independently of R4 or A/B.

### R3.2. Coherent Cartan theory from compact generation

Prove Cartan A and B for coherent analytic sheaves defined on the whole Stein
manifold X, in the following order. A section considered near a compact may be
local; the sheaf itself is not silently extended from that neighborhood.

0. Construct the coherent analytic module-sheaf carrier and calculus before
   the compact argument. Use native `SheafOfModules` over the RingCat-valued
   holomorphic structure sheaf R_W supplied by CK K4 on an open W, with K4's
   locally free section sheaves as examples. Consume CK K4's identification
   `O_U≅O_W|_U` and compatibility with germ maps. Use native
   `SheafOfModules.over` on `J.over U`, where `J=Opens.grothendieckTopology W`,
   and `Opens.overEquivalence : Over U ≌ Opens U` from
   `Mathlib.Topology.Sheaves.Over`, including its two continuous-site
   comparisons. Consume `SheafOfModules.pushforward` and
   `pushforwardPushforwardEquivalence` from
   `Mathlib.Algebra.Category.ModuleCat.Sheaf.PushforwardContinuous` to transport
   modules across this equivalence, supplying CK K4's analytic ring maps and
   verifying their unit/counit compatibility. Own the analytic section/stalk
   and germ comparisons across this transport, so the bundle section sheaf on
   a Stein D and F|_D are modules over the same ring sheaf. Consume native `SheafOfModules.IsFiniteType`,
   `GeneratingSections` and `LocalGeneratorsData` from
   `Mathlib.Algebra.Category.ModuleCat.Sheaf.Generators`, and native
   `SheafOfModules.IsLocallyFree` from
   `Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree`; prove their analytic
   local-frame/finite-tuple comparisons. Define coherence by this finite type
   and the following local condition: for every open U⊆W, q∈ℕ and morphism
   `free (ULift (Fin q))→F.over U` of modules over `R_W.over U` on `J.over U`, its
   native kernel is `SheafOfModules.IsFiniteType`; the lifted finite index
   lies in the ring/module universe. Own the preservation lemmas transporting
   this condition to opens of U. Let O_U be CK K4's RingCat sheaf on U,
   identified with `U.sheafRestrict R_W`, and let E be the native equivalence
   from modules over O_U to modules over `R_W.over U`. Construct
   `unit (R_W.over U)≅E.functor.obj (unit O_U)` from the analytic ring
   isomorphism. Obtain the inverse-direction unit comparison by composing
   `E.unitIso.app (unit O_U)` with E.inverse applied to the inverse of that
   displayed isomorphism.
   Prove E and its inverse preserve finite free modules, kernels, finite type,
   local freeness and finite presentation. Consume `GeneratingSections.map`
   with its colimit-preservation and unit-isomorphism hypotheses. For
   `QuasicoherentData.pushforward` on E.functor, use the inverse of the
   displayed unit iso, and use the analogous iso for E.inverse. Supply
   continuity and cocontinuity in both directions, continuity of each
   `Over.post` on the over-sites, and the per-over colimit-preservation
   hypothesis. Prove that over-site continuity here, and discharge the
   colimit condition using the left-adjoint pushforwards with invertible
   ring maps and the native pullbacks on `Opens U` and `Over U`, following native `isQuasicoherent_pushforward_of_isLeftAdjoint`
   and `isLeftAdjoint_pushforward_of_isIso`. Own the finite-type and
   finite-presentation comparisons beyond those native statements, tracking
   the finite generator and relation index types in `Presentation.map`. Consume native `QuasicoherentData` and
   `SheafOfModules.IsFinitePresentation` from `Mathlib.Algebra.Category.ModuleCat.Sheaf.Quasicoherent`; prove
   equivalence with that finite-presentation predicate over coherent O.
   Consume CK K3's Oka output in its local primitive form: relations among any
   finite tuple of holomorphic functions on any open admit, near each point,
   finitely many holomorphic relation vectors whose germs generate the
   relation module at every point of that neighborhood. Translate this statement
   into native kernels and prove O coherent in the module-sheaf sense here;
   CK's primitive local-algebra proofs do not consume R3.2 or its native
   coherence predicate. Translate CK's reduced-ideal and finite-tuple ideal
   generator outputs into native `IsFiniteType` subsheaves of O; prove their
   coherence using the coherent structure sheaf and kernel comparisons. Build
   analytic section and stalk comparisons for restriction to smaller opens,
   consuming native `Over.iteratedSliceEquiv` with
   `pushforwardPushforwardEquivalence`, as in `QuasicoherentData.bind`.
   Build finite free presentations with their exactness and transport laws.
   Consume the native
   abelian-category instance in `Mathlib.Algebra.Category.ModuleCat.Sheaf.Abelian`,
   its kernels/cokernels/images and module sheafification. Verify
   `HasSheafify` and `WEqualsLocallyBijective` for AddCommGrpCat on J,
   `J.over U`, `(J.over U).over V`, `Opens.grothendieckTopology U` and its
   over-sites, deriving the required instances on every small site used here;
   these also supply the weaker sheafification
   hypotheses of the native finite-generator API.
   Consume the native module stalk and `germ_smul` API in
   `Mathlib.Algebra.Category.ModuleCat.Stalk`. Build the analytic section/stalk
   comparisons and exactness adapters for these constructions, and prove
   closure of coherent sheaves under these operations and extensions, using
   CK K3's Oka coherence. In particular the relation sheaf R(h) of any finite
   tuple h in a coherent F is coherent. Prove stalk generators extend to
   sections generating on a neighborhood, and every equality or finite
   relation of germs holds after shrinking. Give the local-presentation
   comparison for coherent ideals/quotients and holomorphic bundle section
   sheaves. No Cartan A/B or global generation is an input to this calculus.
1. Obtain scalar `H^k(X,O)=0`, k>0, from R3.1, the local Dolbeault lemma and the
   fine Dolbeault resolution. Consume CK K2's sheaf/Čech/Dolbeault comparison; own the scalar Cousin-I splitting. These assertions concern O, not arbitrary coherent
   sheaves, and precede A/B.
2. Define (E)(K) to quantify over **every** coherent sheaf F on a neighborhood
   of the O(X)-convex compact K. Clause(i) gives a finite holomorphic tuple
   generating F near K. Clause(ii) applies to **every** finite tuple h
   generating F near K and every section σ defined near K: on a smaller
   neighborhood σ is a holomorphic-coefficient combination of h. Prove both
   clauses for finite compacts by item0's stalk calculus and disjoint small
   neighborhoods. Choose finitely many global holomorphic F_j that give local
   coordinates at each point of K. Their simultaneous real and imaginary
   level compacts are finite. Induct by deleting the 2N real-level constraints,
   with (E) for **every** choice of the remaining levels. For a real part t(z),
   define `K_{a,b}={z∈K:a≤t(z)≤b}` and `K_{≤u}={z∈K:t(z)≤u}`.
   The finite-cut lemma7.2.2 proves (E)(K) from (E) on every `K_{a,a}`.
   Prove level compacts and one-sided cuts O(X)-convex using `|exp(±F)|`
   (use iF for imaginary levels).

   Run the supremum continuation separately for each object. For clause(i)
   fix F and let P_F(u) assert generation near `K_{≤u}`. For clause(ii) fix
   F,h,σ on a neighborhood of all K and let P_(F,h,σ)(u) assert coefficients
   for this specified σ in this specified tuple near `K_{≤u}`. Both properties
   inherit to smaller cuts, and the empty cuts below min_K t give initial
   values. At a hypothetical finite supremum α, clause(i) on `K_{α,α}` gives
   a tuple g generating on a neighborhood containing `K_{α−δ,α+δ}`, δ>0.
   Choose a∈(α−δ,α) with P_F(a), giving generators f near `K_{≤a}`, and
   choose a fixed s∈(α,α+δ). On `K_{a,a}`, use level(E)(ii) with these tuples
   to obtain `γ₁f=g`, `γ₂g=f`. After their coefficient domains are known,
   choose a coefficient neighborhood W_a of `K_{a,a}` and ε>0. If U₁,U₂
   are the respective generation domains, first intersect
   `(U₁∩{t<a−ε/2}) ∪ (U₁∩U₂∩W_a∩{|t−a|<ε}) ∪ (U₂∩{t>a+ε/2})`
   with the common sheaf domain. Prove the resulting open contains the
   **fixed** `K_{≤s}` for ε small enough by compactness; only then choose the
   Stein D inside it by R3.1. Put
   `ω₁=D∩{t<a+ε/2}`, `ω₂=D∩{t>a−ε/2}`, with f generating on ω₁ and g
   generating on ω₂; their overlap lies in all matrix domains and in
   `W_a∩{a−ε<t<a+ε}`. The shrink changes these open neighborhoods, not s.
   Put `T₁=[[I,0],[γ₁,I]]`, `T₂=[[I,γ₂],[0,I]]`, so
   `T₁(f,0)=T₂(0,g)`. The frame change is `v=(T₂⁻¹T₁)u`, and the coefficient
   transition is `c₂=(T₁⁻¹T₂)ᵀc₁`. Consume CK K4 and its
   [ComplexManifolds #279 Milestone7](https://github.com/TauCetiProject/TauCetiRoadmap/pull/279)
   cocycle gluing to construct a rank p+q bundle on D surjecting to F there.
   R3.1's bundle-value interpolation and compactness give a finite tuple
   generating F near `K_{≤s}`, contradicting the supremum α. Finish this
   clause(i) argument near **all K for every coherent sheaf** before beginning
   clause(ii): refuting every finite supremum gives P_F(u) for all
   `u≥max_K t`. In particular obtain relation columns r_k generating R(h) on
   a neighborhood of all K, using item0's coherence of R(h).

   For clause(ii)'s separate supremum α, obtain a coefficient vector c² for
   the **fixed** h,σ from level(E)(ii) on `K_{α,α}`; its domain contains
   `K_{α−δ,α+δ}`. Choose a∈(α−δ,α) with P_(F,h,σ)(a), obtaining c¹ near
   `K_{≤a}`, and fix s∈(α,α+δ). Their difference on the overlap is a section
   of item0's coherent relation sheaf R(h). Use the already obtained tuple r
   defined near **all K**; level(E)(ii) on `K_{a,a}` with that tuple expresses
   `c¹−c²=Σγ_k r_k` near the level. Only then choose ε and a coefficient
   neighborhood W_a. Use the same three-part neighborhood construction with
   U₁,U₂ now the c¹,c² coefficient domains and W_a the level-coefficient
   domain. Intersect it with the common domains of F, σ, h and all r_k,
   each containing all K, before applying R3.1 to choose the Stein D.
   The fixed cut is contained in this open by compactness, and only the
   overlap must lie in the γ_k domains. Scalar Cousin I on D splits each γ_k; correcting
   c¹,c² by the corresponding multiples of r_k preserves σ and makes them
   agree. This proves P_(F,h,σ)(s), contradicting its supremum α; hence
   clause(ii) also holds near all K. Prove all domain choices by compactness
   and the positive separation margins.
   This exact block gluing needs no near-identity hypothesis or coherent A/B;
   later approximation estimates are separate targets.
3. Prove the nested-compact summable-section lemma (7.2.4) and coherent
   approximation (7.2.7): for F coherent on X, K O(X)-convex, and a section s
   defined near K, construct global sections of F approximating s in the
   finite-presentation seminorms on K. Use the compact generators, scalar
   Oka–Weil and summable corrections. State the quotient/seminorm topology,
   independence of finite presentations, restriction maps and convergence.
4. Deduce Cartan A (7.2.8): approximate a finite local generating tuple near
   each point so that its coefficient matrix remains invertible, and prove
   `Γ(X,F)⊗_(Γ(X,O))O_x→F_x` onto. Separately prove coefficient lifting
   (7.2.9): whenever global sections f₁,…,f_q generate F on X, every global
   section is `Σa_i f_i` with a_i∈O(X). Stalk generation alone is insufficient;
   prove this using compact approximation and summable gluing, before B.
5. Build arbitrarily fine locally finite Stein covers of uniformly finite
   order, and prove their finite intersections with each regular q-sublevel
   are Stein. Own the geometric refinement: choose a smooth Hermitian metric
   and a positive radius function below the local coordinate, distance-Hessian
   and metric-comparison bounds and below the subordinate-cover margins.
   Take it sufficiently Lipschitz so radii of meeting balls are comparable;
   a maximal disjoint smaller-ball family covers after enlargement. Prove a
   dimension-dependent finite overlap bound by packing in uniformly comparable
   local Euclidean charts. Shrink the allowed radii until squared distance
   from each center is strictly psh, giving a proper psh barrier on each ball.
   On a finite intersection add the nonnegative ball barriers and the
   q-sublevel barrier; prove properness and strict positivity, then use R3.1.
   Do not identify a merely contractible good-cover intersection with a Stein
   domain or require R5's analytic triangulation for this refinement.
6. Prove B (7.4.3) first on a relatively compact Stein stage X′⊂X. By A on X
   and compactness of closure X′, choose finitely many sections in Γ(X,F)
   generating F on a neighborhood of closure X′. The relation sheaf R is
   coherent in `0→R→O^q→F→0`. On the Stein cover intersections, coefficient
   lifting gives the surjective map of Čech cochain groups; prove that exactness
   and its connecting maps. Scalar acyclicity and repeated coherent-kernel
   dimension shifting reduce positive cohomology to degrees beyond the fixed
   finite cover order, where the cochains vanish. Prove this for every
   cover in the arbitrarily fine finite-order Stein refinement family. Pass
   to the Čech colimit and use CK K2's paracompact Čech/derived comparison;
   no F-acyclicity of intersections is assumed to invoke Leray. Do not infer finitely many
   generators on an arbitrary noncompact stage from A without the compact
   neighborhood argument. Exhaust X by regular Stein stages. For degrees>1,
   recursively correct primitives on previous stages; for degree1 use coherent
   section approximation and summable errors to correct the 0-cocycle
   differences. Prove the resulting limit and `H^k(X,F)=0`, k>0.

Derive global-section exactness, coherent ideal/quotient computations and
finite-point jet interpolation from B, comparing the latter with R3.1's earlier
scalar construction. The order is scalar weighted theory → compact coherent
generation/approximation → A/coefficient lifting → B; R4 is not an input.

Grauert's paper also states a generalized Runge exhaustion theorem. Record it as a conditional lemma only: for increasing relatively compact domains `T_ρ` with dense Stein levels, prove the union Stein when each earlier domain is Runge in each later domain, deriving Runge from holomorphic convexity/psh sublevels in this construction. Do not state it for arbitrary nested Stein domains. Our tube T already has the global strictly psh exhaustion and the direct weighted-L² Stein proof, so the conditional Runge lemma is not needed to establish its Steinness.
## R4. Grauert's proper real-analytic embedding

For n=0, use R3.1's proper enumeration of the countable discrete space into ℂ. For every Hausdorff, second-countable real-analytic n-manifold M, prove there is a regular proper real-analytic embedding `F:M→ℝ^(4n+2)` with closed analytic image. This fixed target dimension is `2N` for the proper holomorphic embedding target `N=2n+1`; do not leave N to a later dimension choice. Complexify M and use R3's actual global strictly psh tube T, which is Stein by the direct weighted-L² proof; do not repeat a compact argument or rely on a false general increasing-union-Stein statement. Consume R3's weighted-L² consequences—Steinness, Oka–Weil approximation, point/tangent separation and finite-jet interpolation—without requiring Cartan A/B for arbitrary coherent sheaves in this embedding proof.

Prove proper holomorphic embedding into the fixed `ℂ^(2n+1)` by the following
split-coordinate construction, for n≥1.

1. Define the compact-open Fréchet topology on O(T,ℂ^n), prove completeness and
   the Baire theorem, and build Bishop's almost-proper residual subset. An
   almost-proper map h has relatively compact connected components of the inverse
   image of every compact. Prove the stronger polyhedral exhaustion lemma:
   `P_j⊂⊂P_(j+1)` exhaust T, each P_j is a finite union of special analytic
   polyhedra, h maps P_j properly onto `a_j D^n`, and a_j strictly increase to
   infinity. Build the finite polyhedra and compact-component choices under
   successive small holomorphic perturbations, prove openness/density of the
   compact-component conditions at each stage, and preserve them by summable
   errors. Prove the following buffered compact-component approximation
   lemma from these polyhedra. Choose `a_(j−1)<b_j<a_j` and let
   `Z_j={‖h‖∞≤b_j}`, `Q_j=closure P_(j+1)∩Z_j`. The boundary-to-boundary
   property gives `Q_j=P_(j+1)∩Z_j`, compact and open-and-closed in Z_j.
   Prove Q_j O(T)-convex: its compact holomorphic hull lies in Z_j by the
   h-coordinate bounds. The locally constant function 0 on Q_j and 1 on
   Z_j\Q_j extends holomorphically to a neighborhood of Z_j, since those
   subsets are disjoint closed subsets there. Approximate its germ on the
   compact, O(T)-convex hull by Oka–Weil. Any point of the hull outside Q_j
   would have a value near1 while the function is uniformly near0 on Q_j,
   contradicting the hull inequality. Handle Q_j=∅ separately. Split
   Q_j into the disjoint compacts `A_j=P_j∩Q_j`, `L_j=Q_j\P_j`.
   Boundary values `‖h‖∞=a_j>b_j` make both parts open-and-closed in Q_j.
   The strict buffer b_j>a_(j−1) puts closure P_(j−1) in the interior of A_j.
   Theorem2.1(d) and the Bishop paragraph in
   [Forstnerič §2.1](https://arxiv.org/html/1709.05630v5) supply the
   almost-proper/polyhedral targets; this compact-component hull argument
   supplies the simultaneous old-map and shell-growth compact for Oka–Weil.
2. Prove global holomorphic one-jet and off-diagonal two-point transversality
   into Euclidean targets in every prescribed compact-open neighborhood. Use
   R3.1's finite-point jet interpolation to obtain finite-dimensional global
   holomorphic perturbations that span the relevant value/jet fibers near each
   compact coordinate piece. Apply parametric Sard, prove each finite-stage
   condition open and dense, and take a countable intersection. For rank
   strata use compact coordinate pieces contained in each exact-rank stratum
   and establish the needed stability there; no closedness of a nonclosed
   rank stratum is assumed. For off-diagonal
   pairs exhaust `(T×T)\Δ` by compact pieces; no assertion is made on Δ.
   Intersect these residual conditions with the almost-proper residual set in
   the same mapping space. Choose h so `D_h={(x,y):x≠y,h(x)=h(y)}` is a complex
   n-manifold and the exact-corank-k locus of dh has dimension n−k², empty if
   that number is negative.
3. With h fixed, prove the same open-neighborhood density for maps
   `g:T→ℂ^(n+1)` making (h,g) injective and immersive. On D_h the difference
   g(x)−g(y) has target dimension n+1>n. On a corank-k locus, noninjectivity of
   `dg|ker dh` has codimension n+2−k, exceeding n−k² by k²−k+2. Construct the
   surjective value/first-jet parameter families for these constrained loci,
   use Sard, and prove the resulting residual density even inside neighborhoods
   specifying finitely many strict shell inequalities. These statements require
   the full parameter construction, not dimension counting alone.
4. At stage j prescribe the old g on A_j and a first-coordinate constant
   of modulus>j on L_j. They are disjoint compacts whose union Q_j is
   O(T)-convex, so choose disjoint neighborhoods and apply Oka–Weil to
   every coordinate. Choose the perturbation from item3 within the open
   mapping neighborhood preserving the strict growth and approximation
   bounds. Uniform approximation on A_j gives C¹ control on the smaller
   closure P_(j−1) by Cauchy, using its positive buffer. Prove every previous
   L_i, i<j, is inside A_j, so these approximations also preserve earlier
   growth margins.
5. Choose summable future errors below the growth margins on each L_i,
   immersion margins on each earlier compact, and pair-separation margins on
   compact off-diagonal pieces; schedule all pieces so every point and pair is
   covered. Prove local uniform convergence and holomorphicity of the limit g.
   Prove injectivity and injective differential from these persistent margins.
   On `closure P_(j+1)\P_j`, either `‖h‖∞>b_j` or `|g₁|>j`, so the norm
   of (h,g) escapes every compact target set. This proves properness and a closed
   holomorphic embedding in dimension n+(n+1)=2n+1.

Restrict this embedding to the closed fixed locus M, obtaining a regular proper
real-analytic embedding after `ℂ^(2n+1)≅ℝ^(4n+2)`. For compact M properness of
its restriction follows from compactness; the construction retains the full
noncompact scope. The separate n=0 enumeration above supplies ℂ¹.

## R5. Manifold triangulation and transport

For a second-countable real-analytic manifold `M` and a locally finite family `(Bν)` of
semianalytic subsets, prove §3 Theorem 2, printed p. 464, by embedding `M` as a closed analytic
submanifold of a finite-dimensional real affine space properly using R4, applying R2 there, and
transporting the resulting
triangulation back. Prove the embedded images `Bν` remain semianalytic. Transport
property (A) by pulling its local graph presentations back along `F × id`;
the embedding F is analytic and its source factor is not required to be affine.
Prove open-simplex analytic isomorphisms transport, and
whole-simplex membership in every `Bν` is preserved. Use properness to prove the family of embedded images is locally finite; include `F(M)` itself in the locally finite family passed to R2 and restrict the resulting complex to the subcomplex lying over the closed set `F(M)`. Prove this restriction is locally finite and covers all of `F(M)`. Own the homeomorphism from the geometric realization of a locally finite simplicial complex to its affine-space realization with the subspace topology, and state the map and inverse continuity. On compact `M`, derive the finite-complex and finite-nonempty-family consequence by a finite-subcover argument; do not state compactness as an assumption of the printed theorem. Construct the global locally finite frontier stratification here from these open-simplex images and the frontier property of the locally finite subcomplex; R1 supplies local dimension and semianalytic compatibility.

This is the provider consumed by ComplexKahlerGeometry K6 for a finite triangulation compatible
with its analytic strata and closed analytic subvarieties. The consumer still proves its own
subcomplex, homology and cycle statements; this roadmap supplies semianalytic stratification and
triangulation, not analytic-cycle theory.

## Source and proof-route references

The item-level dependency order is RealAlgebraicGeometry Layer7 complexification/carriers → R0/R1, RealAlgebraicGeometry Layer1/2/4 plus R0 → R1, R1 + RealAlgebraicGeometry Layer6 parameter QE + RealAlgebraicGeometry Layer7 complexification + CK K3 Noetherian germs/components → R2, R0 + GeometricTopology Layer1 tubular neighborhoods + CK K1/K2/K4/K6.0 + SBC B2 + CK K5a local estimates + CK K5b.0 local symbol/adjoint → R3.0/R3.1, R3.1 → R4, R3.1 + CK K2’s Čech-colimit comparison + CK K3 local coherence + CK K4/[#279](https://github.com/TauCetiProject/TauCetiRoadmap/pull/279) bundle cocycle gluing → R3.2 item0 coherent-module calculus → R3.2 compact/global Cartan theory, and R1 + R2 + R4 → R5. RealAlgebraicGeometry Layer 4 is consumed only under its stated fixed-degree/gcd hypotheses; RealAlgebraicGeometry Layer 6 supplies formula-level QE for every assignment of analytic coefficient parameters. CK K3.0/K3, SBC B2 and named earlier CK K5a local analytic tools are external inputs as stated above. CK K6 consumes
R5 after its own K3 singular-locus/stratification targets; K6.0 is earlier and independent of R5. There is no edge from R5 back to CK K6,
and no R3 proof depends on K5a's compact global Hodge theory.

- S. Łojasiewicz, [“Triangulation of semi-analytic sets”](https://numdam.org/article/ASNSP_1964_3_18_4_449_0.pdf), *Annali della Scuola Normale Superiore di Pisa* (3) 18 (1964), 449–474. Theorem 1 is §3, printed p. 463; Theorem 2 and the Grauert reduction are printed p. 464. The paper's introduction explicitly says §1's basic semianalytic properties are only stated and their proofs were to appear separately.
- H. Grauert, [“On Levi's Problem and the Imbedding of Real-Analytic Manifolds”](https://doi.org/10.2307/1970257), *Annals of Mathematics* (2) 68 (1958), 460–472. Use its real-analytic embedding theorem together with the Stein/Levi proof machinery specified in R3.
- F. Forstnerič, [“Holomorphic embeddings and immersions of Stein manifolds: a survey”](https://arxiv.org/abs/1709.05630), §2.1, Theorem 2.1 and Proposition 2.2, for the almost-proper residual maps, Bishop polyhedral shells and fixed-dimension embedding targets in R4. R4 owns the required constrained transversality and shell-approximation proofs.
- J.-P. Demailly, [*Complex Analytic and Differential Geometry*](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), Chapter VIII §§3–5, especially Theorems 3.2 and 4.5, for the complete-metric graph-domain and inverse-curvature estimate.
- L. Hörmander, [“L² estimates and existence theorems for the ∂ operator”](https://doi.org/10.1007/BF02392081), *Acta Mathematica* 113 (1965), 89–152, for the weighted `∂̄` estimate and solvability route; formalize the domain, positivity and completeness hypotheses used in R3.
- Consume Mathlib `AnalyticAt`, Tau Ceti `TauCeti.Analysis.Complex.CauchyIntegralPolydisc`, and the shared `TauCeti.IsAnalyticSubmanifold`/local complexification carrier in RealAlgebraicGeometry Layer 7. RealAlgebraicGeometry Layer 7 consumes the native iterative Cauchy, circle-integral and differentiable-to-analytic APIs at `CauchyIntegralPolydisc.lean` lines 116, 261, 275, 282, 335, and 348. Its analytic inversion, implicit roots, constant-order factorization and scalar graph/product carriers also consume the native modules named in Layer7; the sharper complexification radius and chart/delineation adapters remain explicit targets. This roadmap does not duplicate those results.
