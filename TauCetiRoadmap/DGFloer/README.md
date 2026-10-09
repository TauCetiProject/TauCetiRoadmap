# Roadmap: Morse and Floer homology with DG local coefficients

Classical Morse and Floer homology count only the zero- and one-dimensional spaces of connecting
trajectories. Barraud and Cornea observed that the compactified trajectory spaces of *every*
dimension, evaluated into a space of paths, assemble into a Maurer--Cartan element over the
cubical chains on a loop space. Twisting by that element gives Morse and Floer complexes with
coefficients in any differential graded module over `C_*(ΩB)`: a *DG local system*. The basic
source of such systems is Hurewicz fibrations over `B`, and in that case the twisted Morse complex
computes the homology of the total space. Barraud--Damian--Humilière--Oancea turned this into a
full homological package, first for Morse theory on manifolds and on the free loop space, then for
Hamiltonian Floer theory and symplectic homology. They proved a Viterbo isomorphism with DG
coefficients for cotangent bundles. They used it to prove almost existence of contractible closed
characteristics in `T*Q` whenever `Q` is not aspherical in a suitable sense, and finiteness of the
`π₁`-sensitive Hofer--Zehnder capacity of `D*Q` for a large class of manifolds `Q`.

This roadmap builds that package. Its first layers are reusable well beyond symplectic geometry:
- cubical singular chains;
- a few general facts of algebraic topology that no other roadmap builds;
- path and mapping spaces;
- DG local systems and the algebra of twisting cocycles.

The Floer layers sit on the analytic tower of the [Heegaard Floer roadmap](../HeegaardFloer/README.md)
and add the one Floer theory that roadmap does not build, Hamiltonian Floer homology of periodic
orbits.

Suggested homes:

| Layers | Home |
| --- | --- |
| 0 | `TauCeti/AlgebraicTopology/Cubical/` |
| 1 | `TauCeti/AlgebraicTopology/` and `TauCeti/Geometry/Manifold/`, beside the material they extend |
| 2 | `TauCeti/Topology/PathSpace/` and `TauCeti/Topology/MappingSpace/` |
| 3--4 | `TauCeti/AlgebraicTopology/DGLocalSystem/` |
| 5 | `TauCeti/Geometry/Manifold/Morse/DG/` |
| 6--11 | `TauCeti/Geometry/Symplectic/Hamiltonian/` and `TauCeti/Geometry/Symplectic/Floer/` |

## Scope boundary

In scope: every numbered statement of the source paper
([arXiv:2404.07953](https://arxiv.org/abs/2404.07953)), except the four listed below. The
[source coverage](#source-coverage) section assigns each of them to a layer.

Out of scope, so nobody mistakes them for later stages:

- **Conjecture 1.2** (every closed hypersurface in `T*Q` has the contractible almost existence
  property when `Q` is not a `K(π,1)`). It is open.
- **Corollary F.** It consumes the Ginzburg--Niche theorem on uniquely ergodic Hamiltonian
  structures, which nothing here builds.
- **The Cayley plane** in Proposition 6.39. It needs the octonionic projective plane as a
  Riemannian manifold. The quaternionic half of Proposition 6.39 is in scope.
- **Thom's realization theorem** (some multiple of every integral homology class of a manifold is
  the image of the fundamental class of a closed oriented manifold). Theorem B and its general
  form, Theorem 5.14, invoke it once. Here they are proved for classes `α` given together with a
  representing map, `N · α = φ_*[S]`, which is exactly what their proof consumes (Layer 10 item 5).
  The realization theorem itself needs oriented bordism and the rational stable homotopy of the
  Thom spaces `MSO(k)`, which no roadmap builds. That is a roadmap-for-a-roadmap: contributors
  should not attempt it here.
- **The two appeals to classification results:**
  - Lemma 6.35, which reads `π_{n−1}(SO(n))` off tables and uses Bott periodicity;
  - the implication "a compact connected Lie group other than a torus is not a `K(π,1)`" used in
    Proposition 6.31.

  Proposition 6.34 is proved here by the source's second proof, which needs neither result.
  Proposition 6.31 is stated for compact connected Lie groups that are not a `K(π,1)`.

Also out of scope:
- chain-level higher structures, meaning `A∞` refinements of the DG Floer maps, products, and the
  BV and loop-product structures on either side of the Viterbo isomorphism;
- Floer homotopy theory;
- Lagrangian Floer theory with DG coefficients.

## Ownership and dependencies

This roadmap consumes, and does not rebuild:

- **[Heegaard Floer](../HeegaardFloer/README.md).**
  - Lane M: Morse–Smale pairs, compactified trajectory spaces with their corner structure and
    gluing, and the Morse complex over `𝔽₂` and `ℤ`.
  - Lane F0: Fredholm theory and Sard–Smale.
  - Lane F1: the Cauchy–Riemann package, including totally real boundary conditions, Riemann–Roch
    and the Robbin–Salamon index.
  - Lane F2: symplectic manifolds, almost complex structures, `J`-holomorphic maps, energy,
    compactness, transversality and gluing.
  - The manifold orientation and degree API. The differential geometry roadmap (Layers 2 and 10)
    also proposes to own it. This roadmap depends only on its homological characterization
    `f_*[S] = deg(f) · [Q]` from Stage 6 of the algebraic topology roadmap, so it is unaffected by
    which of the two owns it.
- **[Algebraic topology](../AlgebraicTopology/README.md).**
  - Stage 2: relative singular homology and local coefficient systems.
  - Stage 4: CW pairs, cellular approximation and cofibrations.
  - Stage 5: Eilenberg--Zilber, the Künneth theorems, the Serre-fibration carrier, and the homology
    Serre spectral sequence over CW bases.
  - Stage 6: fundamental classes, the orientation local system, cap products, Poincaré and
    Poincaré--Lefschetz duality.
  - Stage 8: absolute and relative Hurewicz in degrees `≥ 2`, and Whitehead.
- **[DG and A-infinity](../DGAInfinity/README.md).**
  - Layer 1: DG algebras, right DG modules, restriction of scalars, tensor products.
  - Layer 4: Maurer--Cartan elements in the strictly upper-triangular regime.
  - Layer 5: one-sided twisted complexes and derived tensor products.
- **[Geometric topology](../GeometricTopology/README.md).**
  - Layer 1: manifolds with boundary, collars, tubular neighbourhoods, connected sum.
  - Layer 3: `Diff(M)` as a topological group with the `C^∞` topology, the smooth-families map,
    and the inclusion `O(n+1) → Diff(Sⁿ)`.
  - Layer 7: Riemannian structures.
- **[Universal covers](../../Completed/UniversalCovers/README.md).** Covering spaces, and induced
  maps on homotopy groups.
- **[Lie groups](../RepresentationTheory/LieGroups/README.md).** Layer 2: the closed-subgroup
  theorem, and `U(n)` and `SO(n)` as embedded Lie subgroups. The compact symplectic group
  `Sp(n) ⊂ GL_n(ℍ)` is a closed subgroup, so the same theorem makes it a Lie group. Layer 1 item 7
  builds its homogeneous spaces on these.
- **[Hamiltonian systems](../HamiltonianSystems/README.md)** (proposed in #480, not yet merged; the link resolves once it is). Layers 1--2: Hamiltonian vector
  fields, the Poisson bracket, conservation of energy, symplectomorphisms and their action on
  Hamiltonian vector fields and integral curves.
- **[Differential geometry](../DifferentialGeometry/README.md)** (proposed in #178, not yet merged; the link resolves once it is).
  - Layers 0--1: smooth differential forms on manifolds, pullback, the exterior derivative
    `mextDeriv`, the Cartan calculus (interior product, Lie derivative, Cartan's formula).
  - Layer 3: flows of vector fields.
  - Tau Ceti's `SmoothTwoForm` migrates onto its generic form carrier (its item 0.4), and this
    roadmap uses the migrated carrier.
- **[Homotopy spheres](../HomotopySpheres/README.md)** (proposed in #284, not yet merged; the link resolves once it is).
  - Stage 3A: pointed compactly generated spaces, based loop spaces, and the suspension--loop
    adjunction, with the comparison homeomorphisms to ordinary spaces.
  - Stage 3B item 3: the James map and the tensor-algebra computation of `H_*(ΩΣX)`, used for the
    ring `H_*(ΩSⁿ)` in Layer 11 item 2.
  - Stage 4B items 2--5: invariant metrics on the compact classical groups and the homogeneous
    symmetric spaces with their Jacobi fields; the finite-dimensional manifolds of broken
    geodesics below an energy cutoff, with their comparison to path-space sublevels; and the
    finite-dimensional Morse--Bott theorem with attachment of negative disc bundles. These are the
    single carrier for broken geodesics and the single Morse--Bott foundation. Layer 5 items 6--7
    consume them and add only the extensions stated there.
  - Stage 5: the Pontryagin--Thom collapse map of a framed submanifold, built from a chosen tubular
    neighbourhood and normal framing.

This roadmap owns everything else it states. In particular it owns:
- cubical singular chains and their comparison with simplicial singular chains;
- `H₁ ≅ π₁ᵃᵇ`, CW approximation, and homology invariance under weak equivalences;
- the spectral sequence of a bounded-below exhaustive filtered complex;
- Serre classes;
- the Pontryagin--Thom collapse for framed submanifolds of an arbitrary closed ambient manifold,
  extending the Euclidean-ambient construction of the homotopy spheres roadmap;
- local triviality of `Diff(M) → M`;
- Stiefel manifolds, `CPᵈ` and `HPᵈ` as manifolds, and the index, perfectness and explicit-generator
  computations for the energy on their based loop spaces, as applications of the homotopy spheres
  roadmap's Morse--Bott API;
- the extension of that roadmap's broken-geodesic carrier from based paths to the free loop space
  of a closed Riemannian manifold;
- Moore path and loop spaces, Hurewicz fibrations, their Moore-path replacement with its strict
  holonomy, and mapping spaces out of spheres;
- DG local systems;
- the Barraud--Cornea construction;
- DG Morse and DG Floer homology;
- time-dependent Hamiltonian flows and their 1-periodic orbits, Liouville domains, and the cotangent
  bundle of a manifold with its canonical Liouville form;
- Hamiltonian Floer and symplectic homology;
- the Viterbo isomorphism;
- symplectic capacities;
- the almost existence property.

Four of these touch other roadmaps and are coordination points:

- **The filtered-complex spectral sequence.** The algebraic topology roadmap builds its Serre
  spectral sequence from a skeletal filtration. Once the generic construction of Layer 1 exists,
  that roadmap is expected to consume it.
- **The cotangent bundle of a manifold.** Lane F3 of the Heegaard Floer roadmap takes its cotangent
  examples from here.
- **The Pontryagin--Thom collapse.** Layer 1 builds it with the same data as the homotopy spheres
  roadmap: a chosen tubular neighbourhood and normal framing, with independence as a theorem. It
  agrees with that roadmap's collapse when the ambient manifold is a sphere.
- **Broken geodesics and Morse--Bott theory.** The homotopy spheres roadmap (Stage 4B) is the
  supplier. Its contract, as consumed here: for a complete Riemannian manifold and an energy cutoff,
  the finite-dimensional broken-geodesic manifold, its deformation equivalence with the path-space
  sublevel, and the Morse--Bott attachment of negative disc bundles. Layer 5 item 6 extends the
  carrier to closed broken geodesics, without introducing a second one. If that roadmap restricts
  its carrier to symmetric spaces, the general-manifold statement of its Stage 4B item 3 is a
  requested extension there, not a separate construction here.

## Standing conventions

- **Cubical chains throughout.** All chains in this roadmap are *normalized cubical singular
  chains*, following the source and BDHO.
  - A singular `n`-cube is a continuous map `Iⁿ → X`. It is degenerate when it does not depend on
    at least one coordinate (Massey's convention, which is BDHO §5.2's). The chain group is free on
    all cubes modulo the degenerate ones.
  - Serre's convention, which only asks independence of the last coordinate, is not used: it is
    not closed under the cross product.
  - The cross product `Iᵖ × I^q = I^{p+q}` is strictly associative and strictly unital. So
    `C_*(ΩB)` is a DG algebra under Moore concatenation with no Eilenberg--Zilber correction, and
    fundamental chains of products of trajectory spaces are cross products.
  - Every homological input from the algebraic topology roadmap is transported through the
    comparison of Layer 0, which is proved once and then used through named maps.
- **Grading bridge.** The source uses homological grading. The DG roadmap is cohomological, with
  right modules primary.
  - Every DG object here is a cochain object through `C^{-n} = C_n`. A homological differential of
    degree `−1` is a cohomological differential of degree `+1` with the same sign, and parity is
    unchanged.
  - The source's formulas are stated in homological notation through one named equivalence.
  - The sign comparison of the twisting equation with the DG roadmap's `(MC)` is proved once
    (acceptance criterion 2).
- **Moore loops.** `ΩB` is the space of Moore loops `γ : [0, L] → B` with `L ≥ 0`, which is the
  carrier of the strict concatenation used throughout. It is **not** homeomorphic to the
  fixed-interval loop space `Ω^{[0,1]}B = Map_*(S¹, B)`: for `B` a point, `ΩB ≅ [0, ∞)`. The
  comparison is a homotopy equivalence of `H`-spaces `Ω^{[0,1]}B → ΩB`, proved once, together with
  its versions for path spaces, compatible with the endpoint maps (a fibre homotopy equivalence
  over them), with constant sections, and with the actions used downstream. Every homeomorphism
  with a mapping space in this roadmap is stated for the fixed-interval model and then composed
  with this comparison.
  - The duration `L` is a continuous function on the Moore space. On a Riemannian manifold, the
    geometric length of a Moore loop is only lower semicontinuous in the compact-open topology, and
    the loops parametrized at unit speed are **not** a closed subspace: in a flat torus, the
    unit-speed loops `γ_n(t) = (sin 2πnt, 1 − cos 2πnt)/(2πn)` of duration `1` converge to the
    constant loop of duration `1`, whose unit-speed representative has duration `0`. So no statement
    of this roadmap filters a Moore space by geometric length, and no subspace of unit-speed loops
    appears anywhere. The source's Lemma 4.5 is replaced by the compact-family approximation of
    Layer 9 item 3.
- **Mapping-space topology.** Path, loop and mapping spaces carry Mathlib's compact-open topology on
  `C(X, Y)`. Two kinds of source occur.
  - Sphere and interval models have a compact Hausdorff source.
  - A Moore path is a pair `(L, γ)` with `γ ∈ C([0, ∞), X)` stopped at `L`, topologized as a
    subspace of `[0, ∞) × C([0, ∞), X)`. The source `[0, ∞)` is locally compact Hausdorff but not
    compact.

  In both cases the exponential law holds without compact generation, since it needs only local
  compactness of the source. The homotopy spheres roadmap forms loop spaces in compactly generated
  spaces. Its comparison homeomorphism for locally compact Hausdorff sources identifies the two,
  and is used whenever a result is transported between the roadmaps.
- **Coefficients.** The algebraic Layers 0, 3 and 4 work over an arbitrary commutative ring. The
  geometric Layers 5 and 7--9 are built over `𝔽₂` first. Integer coefficients, with the source's
  orientation conventions of §3.1, form a separate milestone inside each of those layers. Every
  `𝔽₂` theorem is stated so the ring can be generalized without restating the geometry.
- **Floer grading.** The degree of a nondegenerate 1-periodic orbit is its Conley--Zehnder index.
  It is normalized so that for a `C²`-small autonomous Morse Hamiltonian on a closed `2n`-manifold,
  `FH_*(H) ≅ H_{*+n}(X)`. The grading needs, besides the area condition, a Chern condition and
  chosen trivializations, as in the source's §3.2:
  - **First Chern number of a surface map.** For a closed oriented surface `Σ` (here `S²` or `T²`)
    and a smooth `f : Σ → X`, the number `c₁(f^*TX)[Σ] ∈ ℤ` is the Maslov index of a clutching
    loop in `Sp(2n)` for trivializations of the pullback symplectic bundle `f^*TX` over a disc and
    over its complement. The ingredients are Mathlib's pullback of vector bundles, the triviality
    of symplectic vector bundles over a disc and over a surface minus a disc (proved here, from the
    connectedness of `Sp(2n)`), and the loop Maslov index of Layer 7 item 1. The number is
    independent of the trivializations and invariant under smooth homotopy of `f`, and it is
    normalized by `c₁(TS²)[S²] = 2`. No topological Chern-class theory is consumed.
  - **Symplectically aspherical** means `∫ f^*ω = 0` and `c₁(f^*TX)[S²] = 0` for every smooth
    `f : S² → X`. **Symplectically atoroidal** means the same for every smooth `f : T² → X`. (The
    source writes `f^*[ω] = f^*(2c₁) = 0` for continuous `f`. Since `H²(S²; ℤ)` and `H²(T²; ℤ)`
    are torsion-free, `f^*(2c₁) = 0` is the vanishing of the Chern number. This roadmap uses the
    smooth formulation throughout, which is what the Floer layers consume; for cotangent bundles it
    is verified directly in Layer 9 item 1.)
  - **Trivializations.** In each free homotopy class of loops one reference loop is fixed, with a
    unitary trivialization of `TX` along it. Trivializations along 1-periodic orbits are induced
    through cylinders to the reference loop; the Chern condition on tori makes the induced
    Conley--Zehnder index independent of the cylinder. For contractible orbits the reference loop
    is constant and the condition on spheres suffices.
  - These conditions are separate named hypotheses on every statement of Layers 7--9 and on the
    general Liouville-domain results. Exactness of a Liouville domain gives the area condition
    only; the Chern condition stays a hypothesis there. For cotangent bundles, `2c₁(T(T*Q)) = 0`
    holds globally, and the canonical grading of Layer 9 item 1 is compared with this one
    separately; it is not assumed for arbitrary domains.
- **Sign dictionary.** Two conventions differ between the source and Tau Ceti, and they are fixed
  together here.
  - *Hamiltonian vector fields* are those of the Hamiltonian systems roadmap, `ι_{X_H} ω = dH`.
    The source's §3.2 uses `ω(X_H, ·) = −dH`. At a **fixed** form `ω`, the bridge is
    `X^{source}_{ω,H} = X_{ω,−H}`, proved once.
  - *The symplectic form of a cotangent bundle* is Tau Ceti's: `cotangentSymplecticForm` gives
    `ω_can((v, α), (w, β)) = β(v) − α(w)`, so `ω_can = −dλ_can` for the tautological form
    `λ_can = p dq`, and `ω_can(∂_q, ∂_p) = 1` on `T*ℝ`. No second canonical form is introduced.
    The source works with `ω_src = dλ_can = −ω_can`.
  - *Liouville domains* use `ω = dλ` and `ι_Z ω = λ`. On a cotangent bundle the Liouville primitive
    of `ω_can` is therefore `λ = −λ_can = −p dq`, and its Liouville field is the fibrewise radial
    field `Z = p ∂_p`, outward along `S*Q`.
  - *Cotangent transport.* The fibrewise negation `ν(q, p) = (q, −p)` satisfies
    `ν^*λ_can = −λ_can` and `π ∘ ν = π`, and preserves the zero section, `D*Q`, `S*Q` and `p ∂_p`.
    So `ν : (T*Q, ω_src, λ_can) → (T*Q, ω_can, −λ_can)` is an exact symplectomorphism of Liouville
    manifolds. All of the source's cotangent data is transported along `ν`: Hamiltonians
    `H ↦ H ∘ ν⁻¹`, almost complex structures `J ↦ ν_*J` (compatibility is preserved), Floer
    cylinders `u ↦ ν ∘ u`, actions, and trivializations. Since `ν` is symplectic, the Floer
    equation, the energy identity and Conley--Zehnder indices carry over unchanged; no
    anti-symplectic identification is used anywhere.
  - *The two changes combined.* After transport along `ν`, the source's cotangent data live on
    `(T*Q, ω_can)` in the source's Hamiltonian convention, and the fixed-form bridge
    `X^{source}_{ω,H} = X_{ω,−H}` finishes the translation, exactly as on a closed `(X, ω)`. So
    there is one Hamiltonian bridge in the whole roadmap, and on cotangent bundles it is preceded by
    `ν`.
  - *Downstream quantities.* The action functional is the source's
    `𝒜_H(γ) = ∫ γ̄^*ω − ∫ H(t, γ(t)) dt` (§3.2), with `γ̄` a cylinder to the reference loop,
    stated in the source's normalization after the substitutions above. Conley--Zehnder indices are
    normalized so that `FH_*(H) ≅ H_{*+n}(X)` keeps its form. The magnetic fibre translation is
    fixed in Layer 6 item 3.
  - Acceptance criterion 9 checks the model evaluations.
- **Hypotheses stay unbundled**, as in the Heegaard Floer roadmap: nondegeneracy, regularity of
  `J`, admissibility at infinity, asphericity and atoroidality are separate named hypotheses.
- **Maps are specified, not merely existent.** Continuation maps, direct and shriek maps, the
  Viterbo transfer and the Viterbo map are constructed from explicit data. Their independence of
  choices is a theorem about specified chain homotopies, never a quotient taken silently.

## Inventory

Mathlib provides:
- singular homology and its homotopy invariance;
- cubical homotopy groups (`HomotopyGroup`);
- the compact-open topology on `C(X, Y)`;
- homological complexes, homotopies, `SpectralObject`;
- manifolds with corners, integral curves and flows;
- `LieGroup`, `Matrix.orthogonalGroup`, quaternions;
- `Monotone.ae_differentiableAt`.

Tau Ceti provides:
- `IsDGAlgebra`, `IsDGRightModule`, `DGRightModuleCat`, restriction of scalars along `DGAlgHom`;
- the loop-space shift `pathLoopSpaceMulEquiv : π_m(Ω X) ≃* π_{m+1}(X)`;
- `IsAspherical` and `IsEilenbergMacLaneSpaceOne`;
- twisted singular homology and `LocalCoefficientSystem`;
- `cotangentSymplecticForm` and `cotangentLiouvilleForm` on the model space;
- `SmoothAlmostComplexStructure` and `IsPseudoholomorphic`;
- the Morse lemma, the Morse index, negative-gradient flows;
- finite-dimensional Sard and Sard–Smale.

None of the following exist in Mathlib, in Tau Ceti, or on another roadmap. They are built here:
- cubical chains;
- `H₁ ≅ π₁ᵃᵇ`;
- CW approximation;
- the filtered-complex spectral sequence;
- Serre classes, Eilenberg--MacLane spaces `K(A, n)` for arbitrary abelian `A` with their
  uniqueness up to weak equivalence, and the one-step connected covers of Layer 1 item 4;
- the Pontryagin--Thom collapse in a non-Euclidean ambient manifold;
- Stiefel manifolds;
- `CPᵈ` and `HPᵈ` as manifolds.

---

## Layer 0: cubical singular chains

1. Singular cubes, faces and degeneracies, and the normalized cubical chain complex
   `C^□_*(X; A)` over a commutative ring `A`. Functoriality, relative chains of pairs, and the
   augmentation.
2. The cross product `C^□_p(X) ⊗ C^□_q(Y) → C^□_{p+q}(X × Y)`: strictly associative, strictly
   unital, satisfying the Leibniz rule with the Koszul sign. For a topological monoid `G` with
   strict unit, `C^□_*(G)` is a DG algebra under the product induced by multiplication.
3. The comparison with simplicial singular chains is a natural chain homotopy equivalence, built by
   acyclic models on cubes and simplices. It is compatible with cross products up to a specified
   natural chain homotopy, through Eilenberg--Zilber, and with relative chains. Consequences, each
   derived through the comparison and not re-proved:
   - homotopy invariance;
   - the long exact sequence of a pair;
   - excision;
   - the Künneth theorems;
   - cubical local coefficients;
   - the Serre spectral sequence.
4. Fundamental chains: a compact oriented topological manifold with corners whose boundary is a
   union of products of lower-dimensional ones has a fundamental chain rel boundary in
   `C^□_*`. Its boundary is the signed sum of the cross products of the fundamental chains of the
   faces. This is the chain-level input of every representing chain system in Layers 5 and 8.
   - The only homological fact used is that the connecting map `H_n(M, ∂M) → H_{n−1}(∂M)` sends
     the fundamental class rel boundary to the fundamental class of the boundary.
   - So topological manifolds suffice: no smooth structure on the strata is needed anywhere in this
     roadmap, and the moduli spaces need only be produced as topological manifolds with corners.
5. Source: Massey, *Singular Homology Theory*, Chapters II and VII; Serre, *Homologie singulière
   des espaces fibrés*, Chapter II; BDHO, Chapter 5 and Appendix; Barraud--Cornea, Appendix A.

## Layer 1: topological prerequisites

These are general facts that the later layers use, which no other roadmap builds.

1. **Hurewicz in degree one.** For a path-connected space, `π₁(X)ᵃᵇ ≅ H₁(X; ℤ)` naturally. This
   extends Stage 8 of the algebraic topology roadmap, which starts in degree two. The source uses
   it for `H₁(Ω²Q) ≅ π₃(Q)` in Proposition 5.11.
2. **Weak equivalences and CW approximation.**
   - Every space has a CW approximation, natural up to homotopy.
   - A weak homotopy equivalence induces isomorphisms on singular homology with local
     coefficients.
   - As a corollary, the Serre spectral sequence over an arbitrary path-connected base, by pulling
     back along a CW approximation. The source applies it over `Ω₀Q`, `Ω²B` and `Y`.
3. **The spectral sequence of a filtered complex.** For a bounded-below, exhaustive, increasing
   filtration of a chain complex over a ring: the spectral sequence with
   `E¹_{p,q} = H_{p+q}(F_p/F_{p−1})`, its strong convergence, and naturality under filtered maps.
   It is built as an instance of Mathlib's `SpectralObject`.
4. **Serre classes and Hurewicz modulo a class.**
   - A Serre class is a class of abelian groups closed under subgroups, quotients and extensions,
     and satisfying Serre's axioms for `⊗`, `Tor` and the homology of `K(A, 1)`. Hurewicz modulo a
     Serre class for simply connected spaces (Serre 1953, Theorem 1; the source's Theorem 5.12).
   - Instances: the torsion groups (equivalently `G ⊗ ℚ = 0`), and, for a fixed integer `d ≥ 1`,
     the groups annihilated by **some** power of `d`, `∃ m, dᵐ · G = 0`. The groups annihilated by
     one fixed `dᵐ` do not form a class: they are not closed under extensions.
   - The class `{G | G ⊗ ℤ/2 = 0}` used in the source's proof of Theorem 5.15 is **not** a Serre
     class: `ℚ` belongs to it and its subgroup `ℤ` does not. It is replaced by the following
     theorem, which is what that proof needs.
   - **Mod-2 vanishing.** For a simply connected space `Y` with `H̃_*(Y; 𝔽₂) = 0`, every `π_i(Y)`
     is uniquely 2-divisible (a `ℤ[1/2]`-module). Only this direction is used. No finite generation
     is assumed. A uniquely 2-divisible group has `G ⊗ ℤ/2 = 0`, which is how Layer 10 item 5
     applies it. Its prerequisites are owned here, since no roadmap supplies them:
     - **Eilenberg--MacLane spaces.** `K(A, 1) = |B_•A|`, the realization of the bar construction
       (the nerve of `A`), which is a `K(A, 1)` because the realization of the contractible `E_•A`
       covers it; and `K(A, n)` for `n ≥ 2` by iterating the bar construction, or as the
       realization of the simplicial abelian group corresponding to `A[n]` under Dold--Kan. These
       are CW complexes, functorial in `A`. For a **directed union** `A = ⋃ A_i` of subgroups, the
       `|B_•A_i|` are subcomplexes with union `|B_•A|`, so `H_*(K(A, n)) = colim H_*(K(A_i, n))`
       by compact supports. No statement about arbitrary topological filtered colimits is made: the
       topological colimit of the circles `S¹ → S¹ → ⋯` under the degree-2 maps is indiscrete and
       is not a `K(ℤ[1/2], 1)`. (Their mapping telescope is one, but it is not used.) Tau Ceti has
       only `IsEilenbergMacLaneSpaceOne`.
     - **Uniqueness.** For the CW complex `K(A, n)` above and any space `Z` with `π_n Z ≅ A` and
       all other homotopy groups zero, a map `K(A, n) → Z` realizing a given isomorphism on `π_n`
       exists and is a weak equivalence (Hatcher, Proposition 4.30; it needs Whitehead's theorem
       from Stage 8 of the algebraic topology roadmap and CW approximation from item 2). Through
       item 2, every `K(A, n)` has the homology of the bar model.
     - `H̃_*(K(A, n); 𝔽₂) = 0` for every `ℤ[1/2]`-module `A`. For `n = 1`: `A` is the directed
       union of its finitely generated `ℤ[1/2]`-submodules, which are finite sums of copies of
       `ℤ[1/2]` and of finite cyclic groups of odd order, so by the directed-union property and
       Künneth it suffices to treat these two. For `ℤ[1/2] = ⋃_r 2^{−r}ℤ`: each `2^{−r}ℤ ≅ ℤ`, and
       under these identifications the inclusion `2^{−r}ℤ ⊂ 2^{−r−1}ℤ` is multiplication by `2`.
       By uniqueness, `K(ℤ, 1)` has the homology of `S¹`, and `H_1(K(G, 1)) ≅ G^{ab}` naturally in
       `G` (item 1), so `H̃_*(K(ℤ[1/2], 1); 𝔽₂) = colim(𝔽₂ →×2 𝔽₂ →×2 ⋯) = 0`, since `×2 = 0`
       on `𝔽₂`. Finite cyclic groups of odd order have odd-torsion reduced integral homology. For
       `n ≥ 2`: induction through the path-loop fibration `K(A, n−1) → P → K(A, n)` over the simply
       connected base `K(A, n)`; the mod-2 Serre spectral sequence has `E²` concentrated in the
       bottom row, which is `H_*(K(A, n); 𝔽₂)`, so `E² = E^∞`, and the total space is
       contractible.
     - **The one-step lemma.** Let `n ≥ 2` and let `Z` be an `(n−1)`-connected space with
       `H̃_*(Z; 𝔽₂) = 0`. Then:
       - `π_n Z ≅ H_n(Z; ℤ)` (Hurewicz, Stage 8) is uniquely 2-divisible. By universal
         coefficients, `H_n(Z; 𝔽₂) = H_n(Z) ⊗ ℤ/2 ⊕ Tor(H_{n−1}(Z), ℤ/2)` with `H_{n−1}(Z) = 0`,
         so `H_n(Z) ⊗ ℤ/2 = 0`, and `H_{n+1}(Z; 𝔽₂) ⊇ Tor(H_n(Z), ℤ/2)`, so `Tor(H_n(Z), ℤ/2) = 0`.
       - After CW approximation (item 2), attaching cells of dimension `≥ n + 2` to `Z` kills `π_k`
         for `k > n` and produces a `K(π_n Z, n)` containing `Z`, with `Z → K(π_n Z, n)` an
         isomorphism on `π_n` (Hatcher §4.1). Let `Z' → Z` be its homotopy fibre. Then `Z'` is
         `n`-connected, `π_k Z' ≅ π_k Z` for `k > n`, and the fibre of `Z' → Z` is `ΩK(π_n Z, n)`,
         a `K(π_n Z, n − 1)`.
       - `H̃_*(Z'; 𝔽₂) = 0`. The mod-2 Serre spectral sequence of `K(π_n Z, n−1) → Z' → Z` has a
         simply connected base, `H̃_*(Z; 𝔽₂) = 0`, and `H̃_*(K(π_n Z, n−1); 𝔽₂) = 0` by the previous
         two items, so `E²` is concentrated at `(0, 0)`.

       The Eilenberg--MacLane fibre sits over the `(n−1)`-connected stage `Z`, never over the
       original space: for `Y = S²` and `n = 3`, a 3-connected `E` in a fibre sequence
       `K(π₃S², 2) → E → S²` would give `0 = π₂(E) → π₂(S²) = ℤ → π₁(K(π₃S², 2)) = 0` in the long
       exact sequence, which is impossible. Iterating the lemma produces the Whitehead tower
       `⋯ → Y⟨n+1⟩ → Y⟨n⟩ → ⋯ → Y⟨2⟩ = Y` with `K(π_n Y, n−1) → Y⟨n+1⟩ → Y⟨n⟩` between
       **successive** stages; the tower as a whole is not needed.
     - **The induction.** Start with `Z = Y`, which is 1-connected, and `n = 2`. The lemma shows
       that `π_2 Y` is uniquely 2-divisible and gives a 2-connected `Z'` with `H̃_*(Z'; 𝔽₂) = 0`
       and `π_k Z' ≅ π_k Y` for `k ≥ 3`. Applying it to `Z'` with `n = 3`, and so on, shows that
       every `π_i(Y)`, `i ≥ 2`, is uniquely 2-divisible; `π_1 Y = 0`.
5. **Pontryagin--Thom collapse.** For a closed codimension-`k` submanifold of a closed manifold
   with a framed normal bundle, the collapse map onto `S^k`, determined by a chosen tubular
   neighbourhood (from geometric topology) and the framing. The construction is the one of the
   homotopy spheres roadmap's Stage 5, with an arbitrary closed ambient manifold in place of
   `ℝ^{n+k}`, and agrees with it for spherical ambient manifolds. Independence of the choices, its
   effect on fundamental classes, and its compatibility with shriek maps.
6. **Diffeomorphism groups.** For a closed manifold `M`, evaluation at a point
   `Diff(M) → M` is a locally trivial fibre bundle (Palais). The proof uses a smooth family of
   compactly supported diffeomorphisms moving the basepoint, fed into the smooth-families map of
   geometric topology's Layer 3.
7. **Homogeneous examples.**
   - Stiefel manifolds of orthonormal `2`-frames.
   - `CPᵈ` and `HPᵈ` as smooth manifolds, as homogeneous spaces of `U(d+1)` and `Sp(d+1)`, with
     their homogeneous metrics. Projective lines are totally geodesic round spheres.
   - `G/H` for a compact Lie group `G` and a closed subgroup `H`, with `G → G/H` a principal
     bundle.
   - Three pointwise orthonormal vector fields on `S^{4k−1}`, from quaternionic multiplication.
8. **Degrees of explicit maps**, computed by counting regular preimages: the map
   `T¹S^{n−1} × S¹ → S^{n−1} × S^{n−1}` of the proof of Proposition 6.17, and the rotation map
   `T¹_p Sⁿ × S¹ → Sⁿ` of the second proof of Proposition 6.34.
9. Source: Hatcher, *Algebraic Topology*, §§2.A, 4.1, 4.J; McCleary, *A User's Guide to Spectral
   Sequences*, Chapter 2; Serre, *Groupes d'homotopie et classes de groupes abéliens*; Palais,
   *Local triviality of the restriction map for embeddings*; Milnor--Stasheff, Chapter 5.

## Layer 2: path spaces, mapping spaces, and their fibrations

1. Moore paths `P_{A→B} X` from `A` to `B`, with length and the compact-open topology on the
   stopped path.
   - Concatenation is continuous and strictly associative with strict units, so `ΩX` is a
     topological monoid.
   - The free loop space `𝓛X` and its component `𝓛₀X` of contractible loops.
   - Constant loops `X ↪ 𝓛₀X`.
2. Hurewicz fibrations, and transitive lifting functions `E ×_B P B → P E` that preserve
   concatenation. A homotopy lifting property alone does not supply a transitive lifting function.
   - Every Hurewicz fibration is a Serre fibration in the algebraic topology roadmap's sense.
   - **Moore-path replacement** (BDHO §7.1, after Dold--Kamps, Proposition 5.5). For any map
     `p : E → B`, put `E' = {(e, γ) | γ a Moore path in B starting at p(e)}` and
     `p'(e, γ) = γ(end)`. Then `p'` is a Hurewicz fibration with the transitive lifting function
     given by concatenation, and its fibre `F'` over the basepoint carries the strict right action
     `(e, γ) · λ = (e, γ · λ)` of `ΩB`. When `p` is a Hurewicz fibration, the inclusion
     `E → E'`, `e ↦ (e, const)`, is a fibre homotopy equivalence over `B`, and `F → F'` is a
     homotopy equivalence.
   - When `p` itself has a transitive lifting function `Φ`, transport `F' → F`,
     `(e, γ) ↦ Φ(e, γ)(end)`, is strictly `ΩB`-equivariant and a homotopy equivalence.
   - The endpoint evaluation `P_{A→X} X → X` is a Hurewicz fibration. So is evaluation
     `C(K, X) → C(L, X)` along a closed cofibration `L ⊆ K` of compact Hausdorff spaces.
   - Applying `Ω` or `Ω²` to a Hurewicz fibration gives a Hurewicz fibration.
   - A locally trivial bundle over a paracompact base is a Hurewicz fibration.
3. The canonical homeomorphisms, stated for the **fixed-interval** path and loop models
   (`P^{[0,1]}`, `Ω^{[0,1]}`), never for the Moore carriers:
   - `P^{[0,1]}_{⋆→Q} 𝓛₀Q ≅ Map_*(S², Q)`;
   - `P^{[0,1]}_{Q→Q} 𝓛₀Q ≅ Map(S², Q)`;
   - `Map_*(S^k, X) ≅ (Ω^{[0,1]})^k X`.

   Each is then composed with the Moore comparison of the standing conventions, which is a
   homotopy equivalence compatible with the endpoint maps, the constant sections and the actions.
   The Moore carrier is kept for strict concatenation.

   Also:
   - `π_j(Ω^k X) ≅ π_{j+k}(X)`, by iterating `pathLoopSpaceMulEquiv`;
   - the adjunction `Ω²X → Map(S¹, ΩX)` and the induced degree-raising map
     `β_* : H_*(Ω²X) → H_{*+1}(ΩX)`;
   - the section of `Map_*(S², Q) → Map(S², Q) → Q` by constant spheres;
   - the homeomorphism `G × Map_*(S², G) ≅ Map(S², G)` for a topological group `G`, and through it
     the homotopy equivalence with `G × Ω²G` for the Moore model.
4. Source: the source paper §§5.2, 6.3, 6.4; Whitehead, *Elements of Homotopy Theory*,
   Chapter I.

## Layer 3: DG local systems

1. The augmented DG algebra `C_*(Ω_b B)` (Moore loops at `b`, cubical chains, cross product), and
   its functoriality along based maps.
   - **Connected case first.** For a pointed path-connected space `(B, b)`, a **DG local system**
     is a right DG module over `C_*(Ω_b B)`, in the DG roadmap's sense through the grading bridge
     (the source's Definition 1.8). Pullback along a based map `f` is restriction of scalars along
     `C_*(Ωf)`.
   - **Basepoint change.** For `b, b'` in one component, Moore paths from `b` to `b'` form a
     `(C_*(Ω_b B), C_*(Ω_{b'} B))`-bimodule `C_*(P_{b→b'} B)`: loops at `b` act on the left by
     concatenation in front, loops at `b'` on the right. Basepoint change is the **derived** tensor
     product of the DG roadmap's Layer 5, `𝓕 ↦ 𝓕 ⊗^𝐋_{C_*(Ω_b B)} C_*(P_{b→b'} B)`, to right
     modules over `C_*(Ω_{b'} B)`. Concatenation `P_{b→b'} × P_{b'→b} → Ω_b B` and its reverse
     give the quasi-isomorphisms showing that `C_*(P_{b'→b} B)` induces the inverse, so it is an
     equivalence of derived categories. The composite of two changes is the change along the
     composite, through a specified quasi-isomorphism. (Conjugation by a Moore path is not a strict
     monoid map, so it is not used.)
   - **Disconnected spaces.** A space with chosen basepoints `b_c`, one per path component `c`,
     carries the DG local systems given by families `(𝓕_c)` of modules over `C_*(Ω_{b_c} B)`.
     Twisted complexes are direct sums over components. Pullback along `f : B' → B` sends the
     component `c'` to `f(c')`, restricts scalars at `f(b_{c'})`, and changes basepoint to
     `b_{f(c')}`. Independence of the chosen basepoints is a theorem, through basepoint change.
     Layers 5 and 7--9 use this for `𝓛Q`, whose components are the free homotopy classes; for
     `Q = S¹` they are indexed by winding number (acceptance criterion 7).
2. **The DG local system of a Hurewicz fibration** `F → E → B` (on a path-connected base; on each
   component otherwise) is `C_*(F')`, for the strict action on the fibre of the Moore-path
   replacement (Layer 2 item 2). It needs no choice of lifting function.
   - When a transitive lifting function `Φ` is given, transport `F' → F` induces a **strict**
     quasi-isomorphism of DG modules `C_*(F') → C_*(F)_Φ`.
   - So two transitive lifting functions `Φ₀, Φ₁` are compared by the specified zigzag of strict
     quasi-isomorphisms `C_*(F)_{Φ₀} ← C_*(F') → C_*(F)_{Φ₁}`, an isomorphism in the derived
     category of the DG roadmap's Layer 5. A homotopy between lifting functions is not used.
3. Classical local systems are DG local systems concentrated in degree zero. They correspond,
   naturally, to Tau Ceti's `LocalCoefficientSystem`, through `H₀(ΩB) ≅ ℤ[π₁(B)]`.
4. **Twisting by a rank-one local system `L`.** The DG algebra map `Φ^L` (the source's
   Lemma 2.1), the twisted cocycle `m^L_{x,y}`, and the isomorphism of twisted complexes
   `𝓕 ⊗ L`-coefficients with `m^L`-twisted `𝓕`-coefficients (Proposition 2.2). Also
   `H_q(𝓕 ⊗ L) ≅ H_q(𝓕) ⊗ L`.
5. Source: BDHO Chapters 2 and 7; the source paper §§1.4 and 2.3.

## Layer 4: twisting cocycles and the twisted complex

This layer is pure algebra over a DG algebra `R`. It consumes the DG roadmap's Layers 1, 4 and 5.

1. **Twisting cocycles** (the source's Definition 1.9). A twisting cocycle on a finite set `P`
   graded by `ind : P → ℤ` is a family `m_{x,y} ∈ R_{ind x − ind y − 1}` satisfying
   `∂m_{x,y} = Σ_z (−1)^{ind x − ind z} m_{x,z} m_{z,y}`, and the **one-sidedness condition**
   `m_{x,y} = 0` whenever `ind x ≤ ind y`.
   - One-sidedness does not follow from the degree and the twisting equation over an arbitrary DG
     algebra: over `ℚ[ε]/(ε²)` with `|ε| = −1`, one generator and `m_{x,x} = ε` satisfy both. It is
     automatic when `R` is homologically nonnegative, since then `R_{ind x − ind y − 1} = 0` for
     `ind x ≤ ind y`. Every `C_*(ΩB)` is, so for all geometric cocycles here the condition is a
     lemma, not an extra hypothesis.
   - `D² = 0` below needs only finiteness of `P`. The index filtration and its spectral sequence
     (item 4) use one-sidedness.
   - **Variance.** The matrix `m` is a one-sided twisted complex of shifted free rank-one **left**
     `R`-modules: `K_m = ⊕_x R·x`, with `x` in homological degree `ind x` and
     `d(x) = Σ_y m_{x,y} y`, coefficients on the left. With the Koszul rule
     `d(r·w) = ∂r·w + (−1)^{|r|} r·dw`, `d² = 0` is exactly the twisting equation. Through the DG
     roadmap's Layer 1 opposite-algebra bridge (`a ·_op b = (−1)^{|a||b|} b·a`), `K_m` is a twisted
     complex of shifted free right `R^op`-modules, with the transposed matrix and the shift signs of
     its Layer 5. This comparison, including matrix indices and Koszul signs, is proved once.
     Reading the same entries as a right-free differential `d(e_x) = Σ_y e_y m_{x,y}` reverses the
     order of multiplication and is not a complex in general (acceptance criterion 2).
2. For a DG local system `𝓕` (a right module), the twisted complex is the tensor product
   `𝓕 ⊗⟨P⟩ := 𝓕 ⊗_R K_m` of the DG roadmap's Layer 1, with
   `D(α ⊗ x) = ∂α ⊗ x + (−1)^{|α|} Σ_y α·m_{x,y} ⊗ y`, and `D² = 0`. Its total degree is
   `|α| + ind x`, and `D` lowers it by one (raises it by one cohomologically).
3. **Continuation cocycles** (Definition 1.10) and the chain maps they induce. **Parametrized
   cocycles** (Definition 1.11) and the chain homotopy `Ψ¹ − Ψ⁰ = D⁻h + hD⁺`. Composition of
   continuation cocycles. Homologous twisting cocycles give chain homotopy equivalent twisted
   complexes, through a specified equivalence.
4. **The index filtration** `F_p = ⊕_{ind x ≤ p} 𝓕 ⊗ ⟨x⟩` (the source's Definition 3.38) and its
   spectral sequence, from Layer 1 item 3.
   - The `E²` page is the homology of the classical complex with local coefficients `H_q(𝓕)`.
   - Continuation maps induce morphisms of spectral sequences.
5. For the Brown universal twisting cocycle of a CW structure, identify the twisted homology with
   `Tor^{C_*(ΩB)}(𝓕, A)`, through the DG roadmap's derived tensor product.
6. Source: the source paper §1.4; BDHO Chapters 3--4.

## Layer 5: Morse homology with DG coefficients

This layer consumes Lane M of the Heegaard Floer roadmap for moduli spaces, compactness, gluing and
corner structures.

1. **Representing chain systems.** Fundamental chains rel boundary (Layer 0, item 4) of the
   compactified trajectory spaces of every dimension, coherent with the boundary product
   decomposition. They exist, and any two are homologous through a specified family. This holds
   over `𝔽₂`, and over `ℤ` with the orientation conventions.
2. **The Barraud--Cornea cocycle.**
   - Choose an embedded tree joining the critical points to the basepoint, and a homotopy inverse
     of the collapse map.
   - Evaluate the representing chains into Moore paths, then into `C_*(ΩB)`. The result is a
     twisting cocycle (Layer 4).
   - Its twisted homology is independent of all choices up to specified continuation isomorphisms.
3. **DG Morse homology** `H_*(B; 𝓕)` on closed manifolds, and on compact manifolds with boundary in
   the relative version. It has direct maps `f_*` and shriek maps `f_!`.
4. **Fibration theorem.** For a Hurewicz fibration `F → E → B` over a closed connected manifold,
   with the DG local system `C_*(F')` of Layer 3 item 2:
   - first for fibrations with a transitive lifting function (BDHO Theorem 7.2), then for all
     Hurewicz fibrations by transport along the Moore-path replacement `E → E'`, which is a fibre
     homotopy equivalence and has a transitive lifting function;
   - `H_*(B; C_*(F')) ≅ H_*(E') ≅ H_*(E)`;
   - the index spectral sequence is isomorphic to the Serre spectral sequence from `E²` on;
   - direct and shriek maps correspond to the maps induced by maps of total spaces and by the
     Umkehr maps of pulled-back fibrations.
5. **Classes living over the fundamental class.**
   - The definition (the source's Definition 2.3) and its chain-level characterization
     (Proposition 2.5).
   - For fibrations, the characterization by the column `E^∞_{n,*}` (Proposition 2.6), and the
     identification of the shriek map to a point with `H_*(E) → H_*(E, E|_{Y_{n−1}}) ≅ H_{*−n}(F)`
     (Lemma 2.9).
   - Naturality of shriek maps under maps of fibrations (Proposition 2.12, Lemma 2.14), and the
     criterion `σ_*[F] ≠ 0 ⇒ σ_*[E]` lives over the fundamental class (Corollary 2.13).
6. **Free loop space.** DG Morse homology of `𝓛₀Q` and `𝓛Q` for a closed manifold `Q`, through
   the finite-dimensional approximations by broken geodesics and the colimit over them.
   - The approximations are the homotopy spheres roadmap's broken-geodesic carrier (Stage 4B
     item 3). The extension owned here is the closed version: closed broken geodesics with a fixed
     number of breaks, their deformation equivalence with the free-loop energy sublevels, and the
     inclusions as the number of breaks grows. No second carrier is built.
   - A closed broken geodesic with `r` breaks is determined by its vertices, an `r`-tuple of
     points of `Q` with consecutive distances below the injectivity radius. The carrier above cuts
     these tuples by an energy bound. The Viterbo proof (Layer 9 item 3) uses the same tuples with
     Abouzaid's cut, `𝓛ʳQ = {q ∈ Qʳ | d(q_i, q_{i−1}) ≤ δᵢʳ}`, a compact manifold with corners for
     generic `δᵢʳ ∈ (δ/2, δ)`, with the embeddings `ιʳ : 𝓛ʳQ → 𝓛ʳ⁺¹Q` that repeat `q_0` and the
     maps `geoʳ : 𝓛ʳQ → 𝓛Q` sending a tuple to the broken geodesic through it, parametrized at unit
     speed as a Moore loop. Both systems have the colimit property of BDHO §13 for `𝓛Q`, by the
     weak equivalence of Layer 9 item 3, so the DG Morse homology of `𝓛Q` is the same through
     either; the cut is a choice of cutoff, not a third model.
7. **Morse--Bott energy on `CPᵈ` and `HPᵈ`**, as applications of the homotopy spheres roadmap's
   Morse--Bott API (Stage 4B items 2, 4 and 5). For the homogeneous metric, the energy functional on
   the finite-dimensional approximations of `Ω_p` is Morse--Bott:
   - the critical manifolds are the constant loop and the iterated great circles;
   - their indices are those computed by Bott and Ziller, from the Jacobi fields supplied there;
   - the functional is perfect, which identifies `H_{2d}(Ω CPᵈ)` and `H_{4d+2}(Ω HPᵈ)` with `ℤ`,
     with an explicit generator.

   The index, perfectness and generator computations are owned here. The Morse--Bott foundation is
   not.

   **Open alternative, not in the literature.** One could instead compute these groups from the
   path-loop fibration `Ω_p → P_p → CPᵈ` (and over `HPᵈ`), through the fibration theorem (item 4;
   BDHO Theorem 7.2) and the index spectral sequence (BDHO §4.2). This would avoid Morse--Bott
   theory and Ziller's computations. It has not been carried out, and it is not known whether it
   yields the explicit generator that Propositions 6.38 and 6.39 need. A contributor who completes
   it may replace the Morse--Bott route, and should record the change here.
8. Source: BDHO Chapters 5--13; the source paper §§2.1--2.4 and 4.3--4.4; Bott, *The stable
   homotopy of the classical groups*, §§1--3; Ziller, *The free loop space of globally symmetric
   spaces*.

## Layer 6: Hamiltonian dynamics, Liouville domains, and capacities

This layer consumes symplectic manifolds and almost complex structures from Lane F2.1 of the
Heegaard Floer roadmap, and Hamiltonian vector fields, the Poisson bracket and symplectomorphisms
from Layers 1--2 of the Hamiltonian systems roadmap. It adds the time-dependent and
dynamical material that roadmap leaves out: periodic orbits, action functionals, Liouville
domains, capacities, and almost existence.

1. Time-dependent Hamiltonian flows, built on the Hamiltonian vector fields of the Hamiltonian
   systems roadmap; 1-periodic orbits and nondegeneracy. Symplectically aspherical and atoroidal manifolds. The action functional on
   `𝓛₀X` (aspherical) and on `𝓛X` (atoroidal).
2. Liouville domains, their completions, Hamiltonians linear at infinity, and exact codimension-zero
   embeddings.
3. **Cotangent bundles.**
   - The cotangent bundle `T*Q` of a smooth manifold, with the tautological form `λ_can = p dq` as
     a smooth 1-form of the differential geometry roadmap, and `ω_can = −mextDeriv λ_can`. On the
     model space these are Tau Ceti's `cotangentLiouvilleForm` and `cotangentSymplecticForm`, by
     the latter's `cotangentSymplecticForm_apply`.
   - The unit disc and sphere bundles `D*Q` and `S*Q` of a Riemannian metric. `(D*Q, −λ_can)` is a
     Liouville domain, with Liouville field `p ∂_p` (standing conventions, sign dictionary).
   - Exact magnetic forms. The source's magnetic form `ω_src + π^*dσ` is carried by `ν` to
     `ω_can + π^*dσ`, since `π ∘ ν = π`. The fibre translation `Ψ'_σ(q, p) = (q, p − σ_q)` by a
     1-form `σ` satisfies `Ψ'^*_σ λ_can = λ_can − π^*σ`, hence is a symplectomorphism
     `(T*Q, ω_can + π^*dσ) ≅ (T*Q, ω_can)`; it is `ν ∘ Ψ_σ ∘ ν⁻¹` for the source's
     `Ψ_σ(q, p) = (q, p + σ_q)`. It proves Corollary D once Theorems A--C land.
4. **Hypersurfaces.**
   - Characteristic foliations of regular hypersurfaces. Closed characteristics correspond to
     periodic orbits of any defining Hamiltonian, up to reparametrization.
   - Liouville vector fields. For a fixed primitive `λ`, `ι_Z ω = λ` implies `L_Z ω = ω` by
     Cartan's formula. The converse fails for a fixed `λ`: with `λ = p dq`, `ω = dλ` and
     `Z = p ∂_p + ∂_q`, `L_Z ω = ω` but `ι_Z ω = λ − dp`. What holds is that `L_Z ω = ω` makes
     `ι_Z ω` a primitive of `ω`, whose Liouville field is `Z`. Contact type and restricted contact
     type are defined with the primitive explicit.
   - The Liouville-flow argument that proves Corollary E from Theorems A--C, using the flows of the
     differential geometry roadmap's Layer 3.
5. **Almost existence and capacities.**
   - The contractible almost existence property (the source's Definition 1.1).
   - The relative capacity `c°_HZ(V, Z)` (Definition 5.3) and the `π₁`-sensitive Hofer--Zehnder
     capacity (Definition 6.1).
   - Proposition 6.3 (Hofer--Zehnder, Struwe): finite `c°_HZ(W)` implies contractible almost
     existence in `W`. The proof is the monotonicity argument through
     `Monotone.ae_differentiableAt`, including its relative version near a hypersurface.
6. Source: Hofer--Zehnder, *Symplectic Invariants and Hamiltonian Dynamics*, Chapters 1 and 4;
   McDuff--Salamon, *Introduction to Symplectic Topology*, Chapters 3 and 12; the source paper §1.2.

## Layer 7: classical Hamiltonian Floer homology and symplectic homology

This layer consumes Lanes F0--F2 of the Heegaard Floer roadmap. Floer cylinders have domain
`ℝ × S¹` and no boundary. Half-cylinders with boundary on the zero section use Lane F1's totally
real boundary conditions.

1. Floer cylinders, the energy identity, and the Conley--Zehnder index through the Robbin--Salamon
   index, in the trivializations fixed by the standing conventions. The Maslov index of symplectic
   paths and loops is derived from Lane F1.3's Maslov index of Lagrangian paths through graphs
   (`Ψ ↦ graph Ψ ⊂ (ℝ²ⁿ × ℝ²ⁿ, −ω ⊕ ω)`, relative to the diagonal, after Robbin--Salamon); it is
   not a second construction. The loop version also defines the first Chern numbers of surface maps
   in the standing conventions.
   Asphericity rules out sphere bubbling in `𝓛₀X`, and atoroidality does the same in all of
   `𝓛X`.
2. Compactness, transversality for generic `J`, and gluing for the spaces of Floer cylinders, with
   the corner structure of the compactifications in every dimension. The source's §3.2 and
   Barraud--Cornea Appendix A fix the regularity: topological manifolds with corners. By Layer 0
   item 4 this is all that is consumed. Smoothness of the strata is welcome but not required.
3. **Orientations over `ℤ`.**
   - Coherent orientations through determinant lines of stabilized Cauchy--Riemann operators.
   - The gluing sign `(−1)^{dim V₂ · ind D₁}` (the source's Lemma 3.1).
   - The boundary-orientation comparison on `𝓜(x,z) × 𝓜(z,y)` (Proposition 3.3).
4. **The Floer complex.**
   - The complex itself, continuation maps and homotopies.
   - The action filtration: monotone homotopies preserve it, and general homotopies shift it by at
     most the Hofer-norm bound.
   - `FH_*(X) ≅ H_{*+n}(X)` for closed aspherical `X`.
5. **Symplectic homology** `SH_*(W)` of a Liouville domain, as a direct limit over slopes, with
   classical local coefficients.
   - The zero-energy and positive-energy parts and the long exact sequence between them.
   - The Viterbo transfer `ι_!` for exact codimension-zero embeddings.
6. Source: Salamon, *Lectures on Floer homology*; Audin--Damian, Chapters 6--11; Seidel, *A biased
   view of symplectic cohomology*; Abouzaid, *Symplectic cohomology and Viterbo's theorem*,
   Sections 1--4.

## Layer 8: the DG Floer toolset

1. **Representing chain systems for Floer moduli spaces.** Existence (the source's Proposition 3.4,
   Definition 3.5) and uniqueness up to homology (Proposition 3.6).
2. **The Barraud--Cornea twisting cocycle** in `C_*(Ω𝓛X)`: Definition 3.7, the twisting equation
   of Proposition 3.8, uniqueness up to homology of Proposition 3.9.
3. **The DG Floer complex** (Definition 3.12) and its independence of `(J, Ξ)` up to chain homotopy
   equivalence (Proposition 3.13).
4. **Continuation.**
   - Representing chain systems for continuation moduli spaces (Proposition 3.14,
     Definition 3.15) and their uniqueness (Proposition 3.16).
   - Continuation cocycles: Definition 3.17, Propositions 3.18 and 3.19.
   - The continuation map (Definition 3.21) and its filtration estimate (Proposition 3.22),
     including the functions that correct the action along continuation cylinders.
   - The monotone and Hofer-norm corollaries (Corollaries 3.24 and 3.25).
   - Uniqueness up to homotopy (Proposition 3.26).
   - The identity (Proposition 3.27, Corollary 3.28) and composition (Proposition 3.29).
5. **Homotopies.**
   - Representing chain systems for parametrized moduli spaces (Proposition 3.30).
   - Parametrized cocycles (Definition 3.31, Proposition 3.32).
   - The chain homotopy between continuation maps (Definition 3.35).
6. **Closed manifolds.**
   - Continuation maps are homotopy equivalences (Proposition 3.36).
   - `FH_*(X; 𝓕) ≅ H_{*+n}(X; i_X^*𝓕)` in the contractible component (Theorem 3.37).
   - The canonical filtration (Definition 3.38) and the spectral sequence with
     `E² = FH_*(H; H_q(𝓕))` (Theorem 3.39).
   - Theorem J: for a Hurewicz fibration `F → E → 𝓛₀X`, `FH_*(H; C_*(F)) ≅ H_{*+n}(E|_X)`,
     compatibly with the Serre spectral sequence.
7. **Symplectic homology** `SH_*(W; 𝓕)` with DG coefficients for a Liouville domain.
   - The zero-energy identification `SH^{=0}_*(W; 𝓕) ≅ H_{*+n}(W, ∂W; i_W^*𝓕)`
     (Proposition 3.44), which defines `i_{W*}`.
   - The long exact sequence (Proposition 3.45).
   - The Viterbo transfer (Proposition 3.46).
   - The spectral sequence (Theorem 3.49).
8. Source: the source paper §§3.3--3.7.

## Layer 9: the Viterbo isomorphism

1. The local system `η` on `𝓛Q`, and the canonical grading of Floer homology of `T*Q` (the source's
   §§4.1--4.2). `T*Q` with `ω_can` is exact, and `T(T*Q)` restricted to the zero section is
   `TQ ⊗ ℂ`, so the Chern numbers of all surface maps vanish; this verifies the smooth asphericity
   and atoroidality conditions. The canonical grading is compared with the grading of the standing
   conventions.
2. **Classical Viterbo with local coefficients.** For every classical local system `L` on `𝓛Q`,
   `SH_*(T*Q; Π*L) ≅ H_*(𝓛Q; L ⊗ η)`. The proof is by hybrid Floer-to-Morse moduli spaces in the
   finite-dimensional approximation (Abbondandolo--Schwarz, as organized in Abouzaid).
3. **Theorem K.** For a DG local system `𝓕` on `𝓛Q` with `H_*(𝓕)` bounded below,
   `SH_*(T*Q; Π*𝓕) ≅ H_*(𝓛Q; 𝓕 ⊗ η)`. The steps, in the source's numbering:
   - the half-cylinder moduli spaces `𝓜(x)` and their dimension and orientation lines
     (Proposition 4.6);
   - their representing chains `s_x` (Proposition 4.7) and the equation `∂m_x = Σ m^η_{x,y} m_y`
     (Proposition 4.9);
   - the hybrid moduli spaces `𝓑(x; y)` (Proposition 4.10), their representing chains
     (Proposition 4.11), evaluation maps (Proposition 4.13) and the equation for `b_{x,y}`
     (Proposition 4.14);
   - the finite-dimensional approximation of the source's §4.3 (Abouzaid §11.2): the manifolds
     `𝓛ʳQ` and the maps `ιʳ`, `geoʳ` of Layer 5 item 6, and the sampling maps
     `evᵣ : 𝓛Q → Qʳ`, `γ ↦ (γ(0), γ(L_γ/r), …, γ((r−1)L_γ/r))`, which are continuous on the Moore
     space because the duration `L_γ` is. The source's Lemma 4.5 is replaced by the
     **compact-family approximation lemma**: for a compact `K ⊆ 𝓛Q`, durations are bounded on `K`
     and `K` is equicontinuous (Arzelà--Ascoli), so there is `r(K)` with `evᵣ(K) ⊆ 𝓛ʳQ` for
     `r ≥ r(K)`, and `geoʳ ∘ evᵣ|_K` is homotopic to the inclusion of `K` through the canonical
     homotopy that moves each arc `γ|_{[(i−1)L_γ/r, iL_γ/r]}` to the minimizing geodesic between
     its endpoints inside a convex ball and interpolates the durations linearly. It is natural in
     `K`. It shows that `colim geoʳ : colim 𝓛ʳQ → 𝓛Q` is a weak homotopy equivalence (Abouzaid,
     Proposition 11.2.4), which suffices by Layer 1 item 2: surjectivity on `π_k` by applying it
     to the image of a sphere; injectivity by applying it to the image of a nullhomotopy in `𝓛Q`
     of `geoʳ ∘ σ`, for `σ : S^k → 𝓛ʳQ`, together with a homotopy inside `𝓛^{r'}Q`, for
     `r' ≥ r` large, between `ev_{r'} ∘ geoʳ` and the iterated `ι`, which slides the sample
     vertices along the broken geodesic while the consecutive distances stay below the cut (this
     is where the monotonicity `δᵢʳ ≤ δⱼʳ⁺¹` of the cutoffs is used). Part 1 of the source's
     Lemma 4.5, the retraction of the Moore loops of length `≤ L` onto the unit-speed ones, is
     false on the Moore carrier (standing conventions) and is not consumed by the source: its only
     use, in the proof of Lemma 4.15, is `geoʳ ∘ evᵣ ≃ id` on the compact set
     `⋃_x π ∘ Im ∘ q̄_x(𝓜̄(x))`, which the compact-family lemma supplies;
   - the finite-dimensional reduction (Lemma 4.15);
   - the chain map `Ψ̃^r` (Proposition 4.16).

   The map is an isomorphism by comparison of index spectral sequences, whose `E²` map is item 2.
4. The zero-energy part of Theorem K (Proposition 4.1), and the transfer of DG local systems from
   `𝓛Q` to `𝓛T*Q` (Corollary 4.17).
5. Source: the source paper §4; Abbondandolo--Schwarz, *On the Floer homology of cotangent bundles*
   and its corrigendum; Abouzaid, op. cit., Sections 5--8.

## Layer 10: the criteria and their applications to cotangent bundles

1. **Theorem L (= Theorem 5.1)**, through:
   - the relative capacity bound (Proposition 5.5);
   - the fast-orbit lemma (Lemma 5.7);
   - the spectral invariants `ρ(·, σ)` and their properties (Proposition 5.8).
2. **Theorem M (= Theorem 6.4)**, through the capacity bound `c°_HZ(W) ≤ c(α)` (Proposition 6.6).
   The cotangent form of Theorem M is Proposition 6.7.
3. **The cotangent criterion** (Proposition 5.9).
4. **The kernel of `i_{Q*}`.**
   - `Ω²Q` has the homology of a point if and only if `Q` is a `K(π,1)` (Lemma 3.41).
   - Proposition 5.11: the kernel of `i_{Q*}` contains an infinite cyclic group, a copy of
     `π_k(Q)`, or a class that is not `d`-torsion, according to the first nonvanishing higher
     homotopy group.
   - `ker π_{U!}` is `d`-torsion (Proposition 5.13).
5. **Theorems A, B, C** in their general forms (Theorems 5.10, 5.14, 5.15), with the degree
   hypotheses stated homologically: `deg(π ∘ φ)` by `(π ∘ φ)_*[S] = d · [Q]` over `ℤ`, and the mod-2
   degree by the same equation with `𝔽₂`-fundamental classes from the algebraic topology
   roadmap's Stage 6. **Corollaries D and E**, from
   Layer 6. The `𝔽₂` stage of Layers 5 and 7--9 is enough for Theorem C.
   - **Theorem 5.14 and Theorem B** are stated for a class `α ∈ H_n(U; ℤ)` with
     `π_{U*}α ≠ 0`, **together with** a closed oriented manifold `S`, a map `φ : S → U` and
     `N ≥ 1` such that `N · α = φ_*[S]`. Their proof then reduces to Theorem 5.10 with
     `d = N · b`, where `π_{U*}α = b · [Q]`. The unconditional statement needs Thom's realization
     theorem, which is out of scope (scope boundary).
   - **Theorem 5.15 (Theorem C)** uses the mod-2 vanishing theorem of Layer 1 item 4 in place of the
     source's class `{G | G ⊗ ℤ/2 = 0}`. With `Y = Ω₀Q`, simply connected because `π₂(Q) = 0`: if
     `H̃_*(Ω₀Q; 𝔽₂) = 0`, every `π_i(Ω₀Q) = π_{i+1}(Q)` is uniquely 2-divisible, contradicting
     `π_ℓ(Q) ⊗ ℤ/2 ≠ 0`. The rest of the proof is the source's.
   - **Proposition 5.11, second part,** uses the class of groups annihilated by some power of `d`.
6. Source: the source paper §§5, 6.1--6.2.

## Layer 11: manifolds abundant with 2-spheres, and knotted hypersurfaces

1. **Abundance** (Definitions 1.7 and 6.11), **Theorem H** (= Theorem 6.12), and stability under
   products (Proposition 6.13).
2. **Fibered families of 2-spheres** (Definition 6.14, Proposition 6.15).
   - Even spheres: the Pontryagin ring `H_*(ΩSⁿ)` as a polynomial ring on the class of the DG
     Morse cocycle (Proposition 6.18). The ring itself is the homotopy spheres roadmap's James
     computation (Stage 3B item 3); what is proved here, through Layer 5, is that the DG Morse
     class is a generator. Also nonvanishing of the Stiefel class in `H_{2n−3}(Ω²Sⁿ)`
     (Proposition 6.17).
   - Spheres `S^{4k−1}`: the class in `H_{n−2}(Ω²Sⁿ) ≅ ℤ` is a generator (Proposition 6.21).
   - Sphere bundles over highly connected bases (Proposition 6.23).
3. **Covering by diffeomorphisms** (Definitions 6.26 and 6.32, over geometric topology's `Diff(M)`).
   - Abundance of manifolds covered, or `ℓ`-covered, by diffeomorphisms (Propositions 6.29
     and 6.33).
   - Compact connected Lie groups that are not a `K(π,1)` (Proposition 6.31 in that form).
   - Odd spheres, by the source's second proof (Proposition 6.34).
4. **Homogeneous spaces** (Proposition 6.36), including `S² = SO(3)/SO(2)`.
5. **Projective spaces.** `CPᵈ` (Proposition 6.38) and `HPᵈ` (Proposition 6.39 without the Cayley
   plane), from Layer 5 item 7. These give **Theorem I** within the scope boundary.
6. **Knotted hypersurfaces.** **Theorem G** (= Theorem 7.1), through Proposition 7.5 and
   Lemmas 7.6 and 7.7, using the Pontryagin--Thom collapse of Layer 1.
7. Source: the source paper §§6.3--6.4 and §7.

## Acceptance criteria

1. **Cubical comparison.** The cubical and simplicial homology of `S¹` and of a point agree through
   the comparison map. The cross product of the fundamental chains of `I` and `I` is the
   fundamental chain of `I²`, on the nose.
2. **Sign and variance audit.** The twisting equation of Layer 4 is the DG roadmap's `(MC)` under
   the grading bridge, the opposite-algebra bridge and the shift identification of its Layer 5.
   Noncommutative regression test: `R` free on `a, b` in degree `0` and `c` in degree `1`
   (homological), with `∂a = ∂b = 0` and `∂c = −ab`; `ind x = 2`, `ind z = 1`, `ind y = 0`;
   `m_{x,z} = a`, `m_{z,y} = b`, `m_{x,y} = c`, all other entries zero.
   - The twisting equation and one-sidedness hold.
   - In `R ⊗_R K_m` (the regular module), `D²(1 ⊗ x) = (ab + ∂c) ⊗ y = 0`.
   - In `K_m`, `d²(x) = 0`; through the bridge, the right `R^op`-module complex has `d² = 0`.
   - The literal right-free reading `d(e_x) = e_z a + e_y c`, `d(e_z) = e_y b` gives
     `d²(e_x) = e_y(ba − ab) ≠ 0`, recorded as the reason for the variance convention.
   - Action dependence: `A = ℚ × ℚ` in degree `0` with zero differential, `M = ℚ` in degree `0`
     with the right action through the first, respectively the second projection; `ind x = 1`,
     `ind y = 0`, `m_{x,y} = (1, 0)`. The twisted differential of `Suggested.lean` gives
     `D(1 ⊗ x) = 1 ⊗ y` for the first action and `D(1 ⊗ x) = 0` for the second, and
     `#check @twistedDifferential` shows the right-action instance among its arguments.
3. **Classical recovery.** A DG local system concentrated in degree zero gives back the Morse
   complex with classical local coefficients, naturally in the choices.
4. **Fibration theorem on examples.**
   - The path-loop fibration over `Sⁿ`: `H_*(Sⁿ; C_*(ΩSⁿ)) ≅ H_*(pt)`.
   - The Hopf fibration `S¹ → S³ → S²`: gives `H_*(S³)`.
   - The trivial fibration: recovers Künneth.
5. **Mapping spaces.**
   - `π₀ Map_*(S², S²) ≅ ℤ`.
   - The kernel of `i_{S²*}` contains `ℤ` in degree zero.
   - `Ω²Tⁿ` has contractible components.
   - `H₁(Ω²S³) ≅ ℤ`, through Layer 1 item 1.
6. **Floer.** `FH_*(H) ≅ H_{*+n}(X)` for a `C²`-small Morse Hamiltonian on a closed aspherical
   `X`. Theorem J for the trivial fibration recovers it with coefficients.
7. **Viterbo on `E²`.** For `Q = S¹`, both sides of Theorem K with `𝓕 = C_*(Ω𝓛S¹)` are computed
   and the `E²` pages agree.
8. **End to end.**
   - For `Q = S²` and a bounded domain `U ⊆ T*S²` containing the zero section, `∂U` has the
     contractible almost existence property.
   - `c°_HZ(D*Sⁿ) < ∞` for every `n ≥ 2`.
   - `c°_HZ(D*SU(2)) < ∞`.
9. **Cotangent signs.** On `T*ℝ`:
   - `ω_can(∂_q, ∂_p) = 1` and `ω_can = −d(p dq)`; the Liouville field of `−p dq` is `p ∂_p`;
   - `ν^*ω_can = ω_src = d(p dq)`;
   - for `H = p²/2`, the source's vector field for `(ω_src, H)` is `p ∂_q`; its push-forward by `ν`
     is `−p ∂_q`, which is the vector field of `−H ∘ ν⁻¹ = −p²/2` for `ω_can` in the
     `ι_X ω = dH` convention;
   - on `T*ℝ` with `H = (q² + p²)/2`, the linearized flow and its Conley--Zehnder index are the
     same before and after transport along `ν`;
   - `Ψ'^*_σ ω_can = ω_can + π^*dσ` for `Ψ'_σ(q, p) = (q, p − σ(q))`.
10. **Loop approximation.** In the flat `S¹` and `T²`:
    - the unit-speed loops `γ_n` of the standing conventions converge in `𝓛T²` to the constant
      loop of duration `1`; the unit-speed loops are not closed;
    - for the constant loop `c` of duration `1` in `𝓛S¹`, `evᵣ(c)` is the constant tuple,
      `geoʳ ∘ evᵣ(c)` is the constant loop of duration `0`, and the homotopy of the compact-family
      lemma is the linear interpolation of durations;
    - for `K = {c}`, `r(K) = 1`.

## Source coverage

This section is provenance, not specification: it records where each numbered statement of the
source paper lands, so a reviewer can check that nothing is missing. Numbers follow the revised
version (TeX source of 13 May 2026, compiled).

| Source statements | Layer and item |
| --- | --- |
| Def 1.1 | 6.5 |
| Conj 1.2 | out of scope |
| Thm A, C | 10.5 (Thms 5.10, 5.15) |
| Thm B | 10.5, with a representing map given (Thom realization out of scope) |
| Cor D, E | 6.3, 6.4, 10.5; their Theorem B case with a representing map given |
| Cor F | out of scope |
| Thm G | 11.6 (Thm 7.1) |
| Def 1.7, Thm H | 11.1 (Def 6.11, Thm 6.12) |
| Thm I | 11.2--11.5, without `CaP²` |
| Def 1.8 | 3.1 |
| Defs 1.9--1.11 | 4.1, 4.3 |
| Thm J | 8.6 |
| Thm K | 9.3 |
| Thm L | 10.1 (Thm 5.1) |
| Thm M | 10.2 (Thm 6.4) |
| Lem 2.1, Prop 2.2 | 3.4 |
| Def 2.3, Props 2.5, 2.6, Lem 2.9, Prop 2.12, Cor 2.13, Lem 2.14 | 5.5 |
| Lem 3.1, Prop 3.3 | 7.3 |
| Props 3.4, 3.6, Def 3.5 | 8.1 |
| Def 3.7, Props 3.8, 3.9 | 8.2 |
| Def 3.12, Prop 3.13 | 8.3 |
| Props 3.14, 3.16, Defs 3.15, 3.17, 3.21, Props 3.18, 3.19, 3.22, Cors 3.24, 3.25, Props 3.26, 3.27, Cor 3.28, Prop 3.29 | 8.4 |
| Prop 3.30, Def 3.31, Prop 3.32, Def 3.35 | 8.5 |
| Prop 3.36, Thm 3.37, Def 3.38, Thm 3.39 | 8.6 (filtration also 4.4) |
| Lem 3.41 | 10.4 |
| Props 3.44--3.46, Thm 3.49 | 8.7 |
| Prop 4.1, Cor 4.17 | 9.4 |
| Lem 4.5 | 9.3, part 2 on compact families; part 1 (the unit-speed retraction) is false on the Moore carrier and not consumed, dropped |
| Props 4.6, 4.7, 4.9--4.11, 4.13, 4.14, Lem 4.15, Prop 4.16 | 9.3 |
| Thm 5.1, Prop 5.5, Lem 5.7, Prop 5.8 | 10.1 |
| Def 5.3 | 6.5 |
| Prop 5.9 | 10.3 |
| Thm 5.10, Thm 5.15 | 10.5 (5.15 through the mod-2 vanishing theorem of 1.4) |
| Thm 5.14 | 10.5, with a representing map given (Thom realization out of scope) |
| Prop 5.11, Prop 5.13 | 10.4 |
| Thm 5.12 | 1.4, for genuine Serre classes; the source's mod-2 class is replaced there |
| Def 6.1, Prop 6.3 | 6.5 |
| Thm 6.4, Props 6.6, 6.7 | 10.2 |
| Def 6.11, Thm 6.12, Prop 6.13 | 11.1 |
| Def 6.14, Props 6.15, 6.17, 6.18, 6.21, 6.23 | 11.2 (degree computation 1.8) |
| Defs 6.26, 6.32, Props 6.29, 6.33 | 11.3 (evaluation fibration 1.6) |
| Prop 6.31 | 11.3, for non-aspherical groups |
| Prop 6.34 | 11.3, second proof (degree computation 1.8) |
| Lem 6.35 | out of scope (not needed by the second proof of 6.34) |
| Prop 6.36 | 11.4 |
| Props 6.38, 6.39 | 11.5 (Morse--Bott input 5.7, on the homotopy spheres roadmap's API), without `CaP²` |
| Thm 7.1, Prop 7.5, Lems 7.6, 7.7 | 11.6 (collapse 1.5) |

## Prior formalization

The proposer has formalized Audin--Damian, *Morse Theory and Floer Homology*, in Lean 4 on Mathlib
`v4.34.1`: [t4v1/damian_formalizare](https://github.com/t4v1/damian_formalizare), about 50 000
lines across all sixteen chapters. One `sorry` remains, the Arnold conjecture on the torus. The
spaces of trajectories enter as explicit hypotheses, because there are no submanifolds with
tubular neighbourhoods to build them from. So the Morse and Floer complexes satisfy `∂ ∘ ∂ = 0`
*given* the broken-trajectory counts, and the moduli-space work of Lane M and Layer 7 item 2 is
not done there.

Material that is proved there and absent from Tau Ceti, and that this roadmap can port:

| There | Here |
| --- | --- |
| `Part2/CauchyPompeiu.lean`, `CauchyHolder.lean`, `FloerRegularity.lean`, `Ch6.lean`: Cauchy and Beurling transforms, Calderón--Zygmund and Schauder estimates on the Hölder scale, elliptic regularity of the Floer equation (`contDiff_of_isFloerSolution`), energy and gradient bounds, convergence at the ends, compactness for bounded energy (`compactness_of_energy_bounded`), on `ℝ²ⁿ` and the torus | Layer 7 items 1--2, flat case; a Hölder-scale alternative to the Sobolev route of Lanes F0--F1 |
| `Part2/Rho*.lean`, `Maslov*.lean`, `Ch7.lean`: `ρ : Sp(2n) → S¹` with all its properties (`exists_isRho`), Maslov index of symplectic paths and loops | Layer 7 item 1, the Conley--Zehnder index and the loop Maslov index behind the Chern condition |
| `Part2/Darboux.lean`, `Ch5.lean` (`darboux`): Darboux by Moser's method | a contribution to its owner, Heegaard Floer Lane F2.1; not a target here |
| `Part1/Ch3.lean`, `Ch4.lean`: algebra of the Morse complex from abstract trajectory counts, Künneth, duality | Layer 5 items 1--3, algebraic part |

The Morse lemma and Sard's theorem are formalized there too, but Tau Ceti already has them, so they
are not ported. Porting is ordinary Tau Ceti work: one claimed item at a time, adapted to Tau Ceti's
Mathlib and conventions.

## References

- J.-F. Barraud, M. Damian, V. Humilière, A. Oancea, *Floer homology with DG coefficients.
  Applications to cotangent bundles*, [arXiv:2404.07953](https://arxiv.org/abs/2404.07953): the
  source paper.
- J.-F. Barraud, M. Damian, V. Humilière, A. Oancea, *Morse homology with differential graded
  coefficients*, Progress in Mathematics 360, Birkhäuser, 2025 (BDHO): Layers 0 and 3--5.
- J.-F. Barraud, O. Cornea, *Lagrangian intersections and the Serre spectral sequence*, Ann. of
  Math. 166 (2007), including Appendix A on corner structures; *Quantization of the Serre
  spectral sequence*, J. Symplectic Geom. 5 (2007).
- W. S. Massey, *Singular Homology Theory*, GTM 70, Springer, 1980: cubical singular chains.
- J.-P. Serre, *Homologie singulière des espaces fibrés. Applications*, Ann. of Math. 54 (1951);
  *Groupes d'homotopie et classes de groupes abéliens*, Ann. of Math. 58 (1953).
- R. Palais, *Local triviality of the restriction map for embeddings*, Comment. Math. Helv. 34
  (1960).
- R. Bott, *The stable homotopy of the classical groups*, Ann. of Math. 70 (1959); W. Ziller,
  *The free loop space of globally symmetric spaces*, Invent. Math. 41 (1977).
- M. Audin, M. Damian, *Morse Theory and Floer Homology*, Universitext, Springer, 2014.
- D. Salamon, *Lectures on Floer homology*, IAS/Park City Math. Ser. 7 (1999).
- M. Abouzaid, *Symplectic cohomology and Viterbo's theorem*, in *Free loop spaces in geometry and
  topology*, IRMA Lect. Math. Theor. Phys. 24 (2015).
- A. Abbondandolo, M. Schwarz, *On the Floer homology of cotangent bundles*, Comm. Pure Appl. Math.
  59 (2006), and corrigendum.
- H. Hofer, E. Zehnder, *Symplectic Invariants and Hamiltonian Dynamics*, Birkhäuser, 1994;
  M. Struwe, Bol. Soc. Brasil. Mat. 20 (1990).
- K. Irie, *Hofer--Zehnder capacity of unit disk cotangent bundles and the loop product*, JEMS 16
  (2014); P. Albers, U. Frauenfelder, A. Oancea, Math. Ann. 367 (2017).

## How to drive it

The material splits into three largely independent parts:
1. **Floer analysis**, whose only output is the manifold-with-corners structure of the moduli
   spaces (Lane M and Lanes F0--F2 of the Heegaard Floer roadmap, Layer 7 item 2). This analysis
   is carried out in Barraud--Cornea.
2. **The algebraic definition** of DG Morse and Floer homology from those moduli spaces
   (Layers 0--5 and 8). It consumes only the output of part 1, as a black box. Layers 0--4 and the
   topological hypotheses of the applications do not depend on part 1 at all.
3. **The Viterbo isomorphism** (Layer 9) between DG Floer homology and DG Morse homology of the
   free loop space, a DG version of Abouzaid's proof.

Layers 0--4 start immediately. They depend only on material that exists or is scheduled in the
algebraic topology, geometric topology and DG roadmaps, and each is useful on its own. Layer 6
starts in parallel with them, alongside Lane F2.1.

The purely topological inputs to the applications depend only on Layers 0--3 and the algebraic
topology roadmap:
- Layer 10 item 4;
- the homotopy-theoretic parts of Layer 11, namely items 2--4 and the `Ω²` computations of item 6.

They can land before any Floer theory, stated as the topological hypotheses of Theorems A--I.

Layer 5 follows Lane M of the Heegaard Floer roadmap, and is the first place where the
Barraud--Cornea idea is used on real moduli spaces. Layer 7 follows Lanes F0--F2 and is this
roadmap's analytic headline. Layers 8--10 follow it, and Layer 11 item 5 needs Layer 5 item 7.
